; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37470 () Bool)

(assert start!37470)

(declare-fun b_free!8611 () Bool)

(declare-fun b_next!8611 () Bool)

(assert (=> start!37470 (= b_free!8611 (not b_next!8611))))

(declare-fun tp!30549 () Bool)

(declare-fun b_and!15867 () Bool)

(assert (=> start!37470 (= tp!30549 b_and!15867)))

(declare-fun b!382059 () Bool)

(declare-fun res!217268 () Bool)

(declare-fun e!232209 () Bool)

(assert (=> b!382059 (=> (not res!217268) (not e!232209))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382059 (= res!217268 (validKeyInArray!0 k0!778))))

(declare-fun b!382060 () Bool)

(declare-fun res!217267 () Bool)

(declare-fun e!232205 () Bool)

(assert (=> b!382060 (=> (not res!217267) (not e!232205))))

(declare-datatypes ((array!22416 0))(
  ( (array!22417 (arr!10676 (Array (_ BitVec 32) (_ BitVec 64))) (size!11028 (_ BitVec 32))) )
))
(declare-fun lt!179231 () array!22416)

(declare-datatypes ((List!5993 0))(
  ( (Nil!5990) (Cons!5989 (h!6845 (_ BitVec 64)) (t!11135 List!5993)) )
))
(declare-fun arrayNoDuplicates!0 (array!22416 (_ BitVec 32) List!5993) Bool)

(assert (=> b!382060 (= res!217267 (arrayNoDuplicates!0 lt!179231 #b00000000000000000000000000000000 Nil!5990))))

(declare-fun b!382061 () Bool)

(declare-fun res!217270 () Bool)

(assert (=> b!382061 (=> (not res!217270) (not e!232209))))

(declare-fun _keys!658 () array!22416)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22416 (_ BitVec 32)) Bool)

(assert (=> b!382061 (= res!217270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382062 () Bool)

(declare-fun res!217269 () Bool)

(assert (=> b!382062 (=> (not res!217269) (not e!232209))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13451 0))(
  ( (V!13452 (val!4674 Int)) )
))
(declare-datatypes ((ValueCell!4286 0))(
  ( (ValueCellFull!4286 (v!6872 V!13451)) (EmptyCell!4286) )
))
(declare-datatypes ((array!22418 0))(
  ( (array!22419 (arr!10677 (Array (_ BitVec 32) ValueCell!4286)) (size!11029 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22418)

(assert (=> b!382062 (= res!217269 (and (= (size!11029 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11028 _keys!658) (size!11029 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382063 () Bool)

(declare-fun res!217264 () Bool)

(assert (=> b!382063 (=> (not res!217264) (not e!232209))))

(declare-fun arrayContainsKey!0 (array!22416 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382063 (= res!217264 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382065 () Bool)

(declare-fun e!232203 () Bool)

(declare-fun tp_is_empty!9259 () Bool)

(assert (=> b!382065 (= e!232203 tp_is_empty!9259)))

(declare-fun b!382066 () Bool)

(declare-fun e!232206 () Bool)

(assert (=> b!382066 (= e!232206 true)))

(declare-datatypes ((tuple2!6158 0))(
  ( (tuple2!6159 (_1!3090 (_ BitVec 64)) (_2!3090 V!13451)) )
))
(declare-datatypes ((List!5994 0))(
  ( (Nil!5991) (Cons!5990 (h!6846 tuple2!6158) (t!11136 List!5994)) )
))
(declare-datatypes ((ListLongMap!5073 0))(
  ( (ListLongMap!5074 (toList!2552 List!5994)) )
))
(declare-fun lt!179236 () ListLongMap!5073)

(declare-fun lt!179229 () ListLongMap!5073)

(assert (=> b!382066 (= lt!179236 lt!179229)))

(declare-fun b!382067 () Bool)

(assert (=> b!382067 (= e!232205 (not e!232206))))

(declare-fun res!217263 () Bool)

(assert (=> b!382067 (=> res!217263 e!232206)))

(declare-fun lt!179228 () Bool)

(assert (=> b!382067 (= res!217263 (or (and (not lt!179228) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179228) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179228)))))

(assert (=> b!382067 (= lt!179228 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!179232 () ListLongMap!5073)

(declare-fun zeroValue!472 () V!13451)

(declare-fun minValue!472 () V!13451)

(declare-fun getCurrentListMap!1989 (array!22416 array!22418 (_ BitVec 32) (_ BitVec 32) V!13451 V!13451 (_ BitVec 32) Int) ListLongMap!5073)

(assert (=> b!382067 (= lt!179232 (getCurrentListMap!1989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179230 () array!22418)

(assert (=> b!382067 (= lt!179236 (getCurrentListMap!1989 lt!179231 lt!179230 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179235 () ListLongMap!5073)

(assert (=> b!382067 (and (= lt!179229 lt!179235) (= lt!179235 lt!179229))))

(declare-fun v!373 () V!13451)

(declare-fun lt!179234 () ListLongMap!5073)

(declare-fun +!947 (ListLongMap!5073 tuple2!6158) ListLongMap!5073)

(assert (=> b!382067 (= lt!179235 (+!947 lt!179234 (tuple2!6159 k0!778 v!373)))))

(declare-datatypes ((Unit!11773 0))(
  ( (Unit!11774) )
))
(declare-fun lt!179233 () Unit!11773)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!176 (array!22416 array!22418 (_ BitVec 32) (_ BitVec 32) V!13451 V!13451 (_ BitVec 32) (_ BitVec 64) V!13451 (_ BitVec 32) Int) Unit!11773)

(assert (=> b!382067 (= lt!179233 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!176 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!836 (array!22416 array!22418 (_ BitVec 32) (_ BitVec 32) V!13451 V!13451 (_ BitVec 32) Int) ListLongMap!5073)

(assert (=> b!382067 (= lt!179229 (getCurrentListMapNoExtraKeys!836 lt!179231 lt!179230 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382067 (= lt!179230 (array!22419 (store (arr!10677 _values!506) i!548 (ValueCellFull!4286 v!373)) (size!11029 _values!506)))))

(assert (=> b!382067 (= lt!179234 (getCurrentListMapNoExtraKeys!836 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382068 () Bool)

(declare-fun e!232208 () Bool)

(assert (=> b!382068 (= e!232208 tp_is_empty!9259)))

(declare-fun b!382069 () Bool)

(declare-fun res!217261 () Bool)

(assert (=> b!382069 (=> (not res!217261) (not e!232209))))

(assert (=> b!382069 (= res!217261 (or (= (select (arr!10676 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10676 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15453 () Bool)

(declare-fun mapRes!15453 () Bool)

(declare-fun tp!30548 () Bool)

(assert (=> mapNonEmpty!15453 (= mapRes!15453 (and tp!30548 e!232208))))

(declare-fun mapKey!15453 () (_ BitVec 32))

(declare-fun mapValue!15453 () ValueCell!4286)

(declare-fun mapRest!15453 () (Array (_ BitVec 32) ValueCell!4286))

(assert (=> mapNonEmpty!15453 (= (arr!10677 _values!506) (store mapRest!15453 mapKey!15453 mapValue!15453))))

(declare-fun b!382070 () Bool)

(declare-fun res!217266 () Bool)

(assert (=> b!382070 (=> (not res!217266) (not e!232209))))

(assert (=> b!382070 (= res!217266 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5990))))

(declare-fun mapIsEmpty!15453 () Bool)

(assert (=> mapIsEmpty!15453 mapRes!15453))

(declare-fun b!382064 () Bool)

(assert (=> b!382064 (= e!232209 e!232205)))

(declare-fun res!217265 () Bool)

(assert (=> b!382064 (=> (not res!217265) (not e!232205))))

(assert (=> b!382064 (= res!217265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179231 mask!970))))

(assert (=> b!382064 (= lt!179231 (array!22417 (store (arr!10676 _keys!658) i!548 k0!778) (size!11028 _keys!658)))))

(declare-fun res!217271 () Bool)

(assert (=> start!37470 (=> (not res!217271) (not e!232209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37470 (= res!217271 (validMask!0 mask!970))))

(assert (=> start!37470 e!232209))

(declare-fun e!232207 () Bool)

(declare-fun array_inv!7900 (array!22418) Bool)

(assert (=> start!37470 (and (array_inv!7900 _values!506) e!232207)))

(assert (=> start!37470 tp!30549))

(assert (=> start!37470 true))

(assert (=> start!37470 tp_is_empty!9259))

(declare-fun array_inv!7901 (array!22416) Bool)

(assert (=> start!37470 (array_inv!7901 _keys!658)))

(declare-fun b!382071 () Bool)

(declare-fun res!217262 () Bool)

(assert (=> b!382071 (=> (not res!217262) (not e!232209))))

(assert (=> b!382071 (= res!217262 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11028 _keys!658))))))

(declare-fun b!382072 () Bool)

(assert (=> b!382072 (= e!232207 (and e!232203 mapRes!15453))))

(declare-fun condMapEmpty!15453 () Bool)

(declare-fun mapDefault!15453 () ValueCell!4286)

(assert (=> b!382072 (= condMapEmpty!15453 (= (arr!10677 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4286)) mapDefault!15453)))))

(assert (= (and start!37470 res!217271) b!382062))

(assert (= (and b!382062 res!217269) b!382061))

(assert (= (and b!382061 res!217270) b!382070))

(assert (= (and b!382070 res!217266) b!382071))

(assert (= (and b!382071 res!217262) b!382059))

(assert (= (and b!382059 res!217268) b!382069))

(assert (= (and b!382069 res!217261) b!382063))

(assert (= (and b!382063 res!217264) b!382064))

(assert (= (and b!382064 res!217265) b!382060))

(assert (= (and b!382060 res!217267) b!382067))

(assert (= (and b!382067 (not res!217263)) b!382066))

(assert (= (and b!382072 condMapEmpty!15453) mapIsEmpty!15453))

(assert (= (and b!382072 (not condMapEmpty!15453)) mapNonEmpty!15453))

(get-info :version)

(assert (= (and mapNonEmpty!15453 ((_ is ValueCellFull!4286) mapValue!15453)) b!382068))

(assert (= (and b!382072 ((_ is ValueCellFull!4286) mapDefault!15453)) b!382065))

(assert (= start!37470 b!382072))

(declare-fun m!379193 () Bool)

(assert (=> mapNonEmpty!15453 m!379193))

(declare-fun m!379195 () Bool)

(assert (=> b!382064 m!379195))

(declare-fun m!379197 () Bool)

(assert (=> b!382064 m!379197))

(declare-fun m!379199 () Bool)

(assert (=> b!382069 m!379199))

(declare-fun m!379201 () Bool)

(assert (=> b!382059 m!379201))

(declare-fun m!379203 () Bool)

(assert (=> b!382061 m!379203))

(declare-fun m!379205 () Bool)

(assert (=> b!382070 m!379205))

(declare-fun m!379207 () Bool)

(assert (=> b!382060 m!379207))

(declare-fun m!379209 () Bool)

(assert (=> start!37470 m!379209))

(declare-fun m!379211 () Bool)

(assert (=> start!37470 m!379211))

(declare-fun m!379213 () Bool)

(assert (=> start!37470 m!379213))

(declare-fun m!379215 () Bool)

(assert (=> b!382063 m!379215))

(declare-fun m!379217 () Bool)

(assert (=> b!382067 m!379217))

(declare-fun m!379219 () Bool)

(assert (=> b!382067 m!379219))

(declare-fun m!379221 () Bool)

(assert (=> b!382067 m!379221))

(declare-fun m!379223 () Bool)

(assert (=> b!382067 m!379223))

(declare-fun m!379225 () Bool)

(assert (=> b!382067 m!379225))

(declare-fun m!379227 () Bool)

(assert (=> b!382067 m!379227))

(declare-fun m!379229 () Bool)

(assert (=> b!382067 m!379229))

(check-sat (not b_next!8611) (not start!37470) (not b!382067) (not mapNonEmpty!15453) tp_is_empty!9259 (not b!382064) (not b!382059) (not b!382061) b_and!15867 (not b!382070) (not b!382060) (not b!382063))
(check-sat b_and!15867 (not b_next!8611))
