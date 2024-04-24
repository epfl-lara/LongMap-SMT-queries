; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37296 () Bool)

(assert start!37296)

(declare-fun b_free!8437 () Bool)

(declare-fun b_next!8437 () Bool)

(assert (=> start!37296 (= b_free!8437 (not b_next!8437))))

(declare-fun tp!30027 () Bool)

(declare-fun b_and!15693 () Bool)

(assert (=> start!37296 (= tp!30027 b_and!15693)))

(declare-fun b!378229 () Bool)

(declare-fun e!230209 () Bool)

(declare-fun e!230213 () Bool)

(assert (=> b!378229 (= e!230209 e!230213)))

(declare-fun res!214214 () Bool)

(assert (=> b!378229 (=> (not res!214214) (not e!230213))))

(declare-datatypes ((array!22084 0))(
  ( (array!22085 (arr!10510 (Array (_ BitVec 32) (_ BitVec 64))) (size!10862 (_ BitVec 32))) )
))
(declare-fun lt!176235 () array!22084)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22084 (_ BitVec 32)) Bool)

(assert (=> b!378229 (= res!214214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!176235 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!22084)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!378229 (= lt!176235 (array!22085 (store (arr!10510 _keys!658) i!548 k0!778) (size!10862 _keys!658)))))

(declare-fun b!378230 () Bool)

(declare-fun e!230208 () Bool)

(declare-fun tp_is_empty!9085 () Bool)

(assert (=> b!378230 (= e!230208 tp_is_empty!9085)))

(declare-fun b!378231 () Bool)

(declare-fun res!214226 () Bool)

(assert (=> b!378231 (=> (not res!214226) (not e!230209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!378231 (= res!214226 (validKeyInArray!0 k0!778))))

(declare-fun b!378232 () Bool)

(declare-fun res!214221 () Bool)

(assert (=> b!378232 (=> (not res!214221) (not e!230209))))

(assert (=> b!378232 (= res!214221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15192 () Bool)

(declare-fun mapRes!15192 () Bool)

(assert (=> mapIsEmpty!15192 mapRes!15192))

(declare-fun b!378233 () Bool)

(declare-fun res!214215 () Bool)

(assert (=> b!378233 (=> (not res!214215) (not e!230209))))

(declare-datatypes ((List!5869 0))(
  ( (Nil!5866) (Cons!5865 (h!6721 (_ BitVec 64)) (t!11011 List!5869)) )
))
(declare-fun arrayNoDuplicates!0 (array!22084 (_ BitVec 32) List!5869) Bool)

(assert (=> b!378233 (= res!214215 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5866))))

(declare-fun b!378234 () Bool)

(declare-fun res!214225 () Bool)

(assert (=> b!378234 (=> (not res!214225) (not e!230209))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13219 0))(
  ( (V!13220 (val!4587 Int)) )
))
(declare-datatypes ((ValueCell!4199 0))(
  ( (ValueCellFull!4199 (v!6785 V!13219)) (EmptyCell!4199) )
))
(declare-datatypes ((array!22086 0))(
  ( (array!22087 (arr!10511 (Array (_ BitVec 32) ValueCell!4199)) (size!10863 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22086)

(assert (=> b!378234 (= res!214225 (and (= (size!10863 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10862 _keys!658) (size!10863 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!378235 () Bool)

(declare-fun res!214218 () Bool)

(assert (=> b!378235 (=> (not res!214218) (not e!230213))))

(assert (=> b!378235 (= res!214218 (arrayNoDuplicates!0 lt!176235 #b00000000000000000000000000000000 Nil!5866))))

(declare-fun b!378236 () Bool)

(declare-fun e!230214 () Bool)

(assert (=> b!378236 (= e!230214 true)))

(declare-fun e!230210 () Bool)

(assert (=> b!378236 e!230210))

(declare-fun res!214222 () Bool)

(assert (=> b!378236 (=> (not res!214222) (not e!230210))))

(declare-datatypes ((tuple2!6030 0))(
  ( (tuple2!6031 (_1!3026 (_ BitVec 64)) (_2!3026 V!13219)) )
))
(declare-datatypes ((List!5870 0))(
  ( (Nil!5867) (Cons!5866 (h!6722 tuple2!6030) (t!11012 List!5870)) )
))
(declare-datatypes ((ListLongMap!4945 0))(
  ( (ListLongMap!4946 (toList!2488 List!5870)) )
))
(declare-fun lt!176233 () ListLongMap!4945)

(declare-fun lt!176237 () ListLongMap!4945)

(declare-fun lt!176238 () tuple2!6030)

(declare-fun +!884 (ListLongMap!4945 tuple2!6030) ListLongMap!4945)

(assert (=> b!378236 (= res!214222 (= lt!176237 (+!884 lt!176233 lt!176238)))))

(declare-fun minValue!472 () V!13219)

(assert (=> b!378236 (= lt!176238 (tuple2!6031 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun res!214217 () Bool)

(assert (=> start!37296 (=> (not res!214217) (not e!230209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37296 (= res!214217 (validMask!0 mask!970))))

(assert (=> start!37296 e!230209))

(declare-fun e!230207 () Bool)

(declare-fun array_inv!7794 (array!22086) Bool)

(assert (=> start!37296 (and (array_inv!7794 _values!506) e!230207)))

(assert (=> start!37296 tp!30027))

(assert (=> start!37296 true))

(assert (=> start!37296 tp_is_empty!9085))

(declare-fun array_inv!7795 (array!22084) Bool)

(assert (=> start!37296 (array_inv!7795 _keys!658)))

(declare-fun b!378237 () Bool)

(declare-fun e!230211 () Bool)

(assert (=> b!378237 (= e!230207 (and e!230211 mapRes!15192))))

(declare-fun condMapEmpty!15192 () Bool)

(declare-fun mapDefault!15192 () ValueCell!4199)

(assert (=> b!378237 (= condMapEmpty!15192 (= (arr!10511 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4199)) mapDefault!15192)))))

(declare-fun b!378238 () Bool)

(declare-fun res!214223 () Bool)

(assert (=> b!378238 (=> (not res!214223) (not e!230209))))

(declare-fun arrayContainsKey!0 (array!22084 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!378238 (= res!214223 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15192 () Bool)

(declare-fun tp!30026 () Bool)

(assert (=> mapNonEmpty!15192 (= mapRes!15192 (and tp!30026 e!230208))))

(declare-fun mapKey!15192 () (_ BitVec 32))

(declare-fun mapValue!15192 () ValueCell!4199)

(declare-fun mapRest!15192 () (Array (_ BitVec 32) ValueCell!4199))

(assert (=> mapNonEmpty!15192 (= (arr!10511 _values!506) (store mapRest!15192 mapKey!15192 mapValue!15192))))

(declare-fun b!378239 () Bool)

(declare-fun lt!176231 () ListLongMap!4945)

(declare-fun lt!176236 () ListLongMap!4945)

(assert (=> b!378239 (= e!230210 (= lt!176236 (+!884 lt!176231 lt!176238)))))

(declare-fun b!378240 () Bool)

(declare-fun res!214220 () Bool)

(assert (=> b!378240 (=> (not res!214220) (not e!230209))))

(assert (=> b!378240 (= res!214220 (or (= (select (arr!10510 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10510 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!378241 () Bool)

(assert (=> b!378241 (= e!230213 (not e!230214))))

(declare-fun res!214219 () Bool)

(assert (=> b!378241 (=> res!214219 e!230214)))

(assert (=> b!378241 (= res!214219 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13219)

(declare-fun getCurrentListMap!1931 (array!22084 array!22086 (_ BitVec 32) (_ BitVec 32) V!13219 V!13219 (_ BitVec 32) Int) ListLongMap!4945)

(assert (=> b!378241 (= lt!176236 (getCurrentListMap!1931 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176239 () array!22086)

(assert (=> b!378241 (= lt!176237 (getCurrentListMap!1931 lt!176235 lt!176239 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!176232 () ListLongMap!4945)

(assert (=> b!378241 (and (= lt!176233 lt!176232) (= lt!176232 lt!176233))))

(declare-fun v!373 () V!13219)

(assert (=> b!378241 (= lt!176232 (+!884 lt!176231 (tuple2!6031 k0!778 v!373)))))

(declare-datatypes ((Unit!11651 0))(
  ( (Unit!11652) )
))
(declare-fun lt!176234 () Unit!11651)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!118 (array!22084 array!22086 (_ BitVec 32) (_ BitVec 32) V!13219 V!13219 (_ BitVec 32) (_ BitVec 64) V!13219 (_ BitVec 32) Int) Unit!11651)

(assert (=> b!378241 (= lt!176234 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!118 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!778 (array!22084 array!22086 (_ BitVec 32) (_ BitVec 32) V!13219 V!13219 (_ BitVec 32) Int) ListLongMap!4945)

(assert (=> b!378241 (= lt!176233 (getCurrentListMapNoExtraKeys!778 lt!176235 lt!176239 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!378241 (= lt!176239 (array!22087 (store (arr!10511 _values!506) i!548 (ValueCellFull!4199 v!373)) (size!10863 _values!506)))))

(assert (=> b!378241 (= lt!176231 (getCurrentListMapNoExtraKeys!778 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!378242 () Bool)

(assert (=> b!378242 (= e!230211 tp_is_empty!9085)))

(declare-fun b!378243 () Bool)

(declare-fun res!214216 () Bool)

(assert (=> b!378243 (=> (not res!214216) (not e!230210))))

(assert (=> b!378243 (= res!214216 (= lt!176237 (+!884 lt!176232 lt!176238)))))

(declare-fun b!378244 () Bool)

(declare-fun res!214224 () Bool)

(assert (=> b!378244 (=> (not res!214224) (not e!230209))))

(assert (=> b!378244 (= res!214224 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10862 _keys!658))))))

(assert (= (and start!37296 res!214217) b!378234))

(assert (= (and b!378234 res!214225) b!378232))

(assert (= (and b!378232 res!214221) b!378233))

(assert (= (and b!378233 res!214215) b!378244))

(assert (= (and b!378244 res!214224) b!378231))

(assert (= (and b!378231 res!214226) b!378240))

(assert (= (and b!378240 res!214220) b!378238))

(assert (= (and b!378238 res!214223) b!378229))

(assert (= (and b!378229 res!214214) b!378235))

(assert (= (and b!378235 res!214218) b!378241))

(assert (= (and b!378241 (not res!214219)) b!378236))

(assert (= (and b!378236 res!214222) b!378243))

(assert (= (and b!378243 res!214216) b!378239))

(assert (= (and b!378237 condMapEmpty!15192) mapIsEmpty!15192))

(assert (= (and b!378237 (not condMapEmpty!15192)) mapNonEmpty!15192))

(get-info :version)

(assert (= (and mapNonEmpty!15192 ((_ is ValueCellFull!4199) mapValue!15192)) b!378230))

(assert (= (and b!378237 ((_ is ValueCellFull!4199) mapDefault!15192)) b!378242))

(assert (= start!37296 b!378237))

(declare-fun m!375329 () Bool)

(assert (=> b!378241 m!375329))

(declare-fun m!375331 () Bool)

(assert (=> b!378241 m!375331))

(declare-fun m!375333 () Bool)

(assert (=> b!378241 m!375333))

(declare-fun m!375335 () Bool)

(assert (=> b!378241 m!375335))

(declare-fun m!375337 () Bool)

(assert (=> b!378241 m!375337))

(declare-fun m!375339 () Bool)

(assert (=> b!378241 m!375339))

(declare-fun m!375341 () Bool)

(assert (=> b!378241 m!375341))

(declare-fun m!375343 () Bool)

(assert (=> b!378235 m!375343))

(declare-fun m!375345 () Bool)

(assert (=> mapNonEmpty!15192 m!375345))

(declare-fun m!375347 () Bool)

(assert (=> b!378229 m!375347))

(declare-fun m!375349 () Bool)

(assert (=> b!378229 m!375349))

(declare-fun m!375351 () Bool)

(assert (=> b!378238 m!375351))

(declare-fun m!375353 () Bool)

(assert (=> b!378236 m!375353))

(declare-fun m!375355 () Bool)

(assert (=> b!378240 m!375355))

(declare-fun m!375357 () Bool)

(assert (=> start!37296 m!375357))

(declare-fun m!375359 () Bool)

(assert (=> start!37296 m!375359))

(declare-fun m!375361 () Bool)

(assert (=> start!37296 m!375361))

(declare-fun m!375363 () Bool)

(assert (=> b!378243 m!375363))

(declare-fun m!375365 () Bool)

(assert (=> b!378231 m!375365))

(declare-fun m!375367 () Bool)

(assert (=> b!378233 m!375367))

(declare-fun m!375369 () Bool)

(assert (=> b!378232 m!375369))

(declare-fun m!375371 () Bool)

(assert (=> b!378239 m!375371))

(check-sat (not b!378239) (not b!378232) (not b!378238) (not start!37296) (not b!378241) (not b!378243) (not b!378233) tp_is_empty!9085 b_and!15693 (not b!378231) (not b!378229) (not mapNonEmpty!15192) (not b!378235) (not b!378236) (not b_next!8437))
(check-sat b_and!15693 (not b_next!8437))
