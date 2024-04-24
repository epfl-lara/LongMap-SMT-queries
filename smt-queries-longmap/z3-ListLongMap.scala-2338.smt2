; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37476 () Bool)

(assert start!37476)

(declare-fun b_free!8617 () Bool)

(declare-fun b_next!8617 () Bool)

(assert (=> start!37476 (= b_free!8617 (not b_next!8617))))

(declare-fun tp!30566 () Bool)

(declare-fun b_and!15873 () Bool)

(assert (=> start!37476 (= tp!30566 b_and!15873)))

(declare-fun mapNonEmpty!15462 () Bool)

(declare-fun mapRes!15462 () Bool)

(declare-fun tp!30567 () Bool)

(declare-fun e!232271 () Bool)

(assert (=> mapNonEmpty!15462 (= mapRes!15462 (and tp!30567 e!232271))))

(declare-fun mapKey!15462 () (_ BitVec 32))

(declare-datatypes ((V!13459 0))(
  ( (V!13460 (val!4677 Int)) )
))
(declare-datatypes ((ValueCell!4289 0))(
  ( (ValueCellFull!4289 (v!6875 V!13459)) (EmptyCell!4289) )
))
(declare-datatypes ((array!22428 0))(
  ( (array!22429 (arr!10682 (Array (_ BitVec 32) ValueCell!4289)) (size!11034 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22428)

(declare-fun mapValue!15462 () ValueCell!4289)

(declare-fun mapRest!15462 () (Array (_ BitVec 32) ValueCell!4289))

(assert (=> mapNonEmpty!15462 (= (arr!10682 _values!506) (store mapRest!15462 mapKey!15462 mapValue!15462))))

(declare-fun b!382185 () Bool)

(declare-fun res!217368 () Bool)

(declare-fun e!232267 () Bool)

(assert (=> b!382185 (=> (not res!217368) (not e!232267))))

(declare-datatypes ((array!22430 0))(
  ( (array!22431 (arr!10683 (Array (_ BitVec 32) (_ BitVec 64))) (size!11035 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22430)

(declare-datatypes ((List!5999 0))(
  ( (Nil!5996) (Cons!5995 (h!6851 (_ BitVec 64)) (t!11141 List!5999)) )
))
(declare-fun arrayNoDuplicates!0 (array!22430 (_ BitVec 32) List!5999) Bool)

(assert (=> b!382185 (= res!217368 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5996))))

(declare-fun b!382186 () Bool)

(declare-fun e!232269 () Bool)

(assert (=> b!382186 (= e!232269 true)))

(declare-datatypes ((tuple2!6164 0))(
  ( (tuple2!6165 (_1!3093 (_ BitVec 64)) (_2!3093 V!13459)) )
))
(declare-datatypes ((List!6000 0))(
  ( (Nil!5997) (Cons!5996 (h!6852 tuple2!6164) (t!11142 List!6000)) )
))
(declare-datatypes ((ListLongMap!5079 0))(
  ( (ListLongMap!5080 (toList!2555 List!6000)) )
))
(declare-fun lt!179316 () ListLongMap!5079)

(declare-fun lt!179313 () ListLongMap!5079)

(assert (=> b!382186 (= lt!179316 lt!179313)))

(declare-fun b!382187 () Bool)

(declare-fun tp_is_empty!9265 () Bool)

(assert (=> b!382187 (= e!232271 tp_is_empty!9265)))

(declare-fun b!382188 () Bool)

(declare-fun res!217369 () Bool)

(assert (=> b!382188 (=> (not res!217369) (not e!232267))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382188 (= res!217369 (validKeyInArray!0 k0!778))))

(declare-fun b!382189 () Bool)

(declare-fun res!217362 () Bool)

(assert (=> b!382189 (=> (not res!217362) (not e!232267))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382189 (= res!217362 (and (= (size!11034 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11035 _keys!658) (size!11034 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382190 () Bool)

(declare-fun e!232272 () Bool)

(assert (=> b!382190 (= e!232267 e!232272)))

(declare-fun res!217363 () Bool)

(assert (=> b!382190 (=> (not res!217363) (not e!232272))))

(declare-fun lt!179317 () array!22430)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22430 (_ BitVec 32)) Bool)

(assert (=> b!382190 (= res!217363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179317 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382190 (= lt!179317 (array!22431 (store (arr!10683 _keys!658) i!548 k0!778) (size!11035 _keys!658)))))

(declare-fun b!382191 () Bool)

(declare-fun res!217367 () Bool)

(assert (=> b!382191 (=> (not res!217367) (not e!232267))))

(assert (=> b!382191 (= res!217367 (or (= (select (arr!10683 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10683 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382192 () Bool)

(declare-fun e!232266 () Bool)

(declare-fun e!232268 () Bool)

(assert (=> b!382192 (= e!232266 (and e!232268 mapRes!15462))))

(declare-fun condMapEmpty!15462 () Bool)

(declare-fun mapDefault!15462 () ValueCell!4289)

(assert (=> b!382192 (= condMapEmpty!15462 (= (arr!10682 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4289)) mapDefault!15462)))))

(declare-fun b!382193 () Bool)

(declare-fun res!217360 () Bool)

(assert (=> b!382193 (=> (not res!217360) (not e!232267))))

(assert (=> b!382193 (= res!217360 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11035 _keys!658))))))

(declare-fun b!382194 () Bool)

(declare-fun res!217365 () Bool)

(assert (=> b!382194 (=> (not res!217365) (not e!232272))))

(assert (=> b!382194 (= res!217365 (arrayNoDuplicates!0 lt!179317 #b00000000000000000000000000000000 Nil!5996))))

(declare-fun b!382195 () Bool)

(declare-fun res!217370 () Bool)

(assert (=> b!382195 (=> (not res!217370) (not e!232267))))

(assert (=> b!382195 (= res!217370 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!217364 () Bool)

(assert (=> start!37476 (=> (not res!217364) (not e!232267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37476 (= res!217364 (validMask!0 mask!970))))

(assert (=> start!37476 e!232267))

(declare-fun array_inv!7906 (array!22428) Bool)

(assert (=> start!37476 (and (array_inv!7906 _values!506) e!232266)))

(assert (=> start!37476 tp!30566))

(assert (=> start!37476 true))

(assert (=> start!37476 tp_is_empty!9265))

(declare-fun array_inv!7907 (array!22430) Bool)

(assert (=> start!37476 (array_inv!7907 _keys!658)))

(declare-fun b!382196 () Bool)

(assert (=> b!382196 (= e!232272 (not e!232269))))

(declare-fun res!217366 () Bool)

(assert (=> b!382196 (=> res!217366 e!232269)))

(declare-fun lt!179309 () Bool)

(assert (=> b!382196 (= res!217366 (or (and (not lt!179309) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179309) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179309)))))

(assert (=> b!382196 (= lt!179309 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!179312 () ListLongMap!5079)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13459)

(declare-fun minValue!472 () V!13459)

(declare-fun getCurrentListMap!1992 (array!22430 array!22428 (_ BitVec 32) (_ BitVec 32) V!13459 V!13459 (_ BitVec 32) Int) ListLongMap!5079)

(assert (=> b!382196 (= lt!179312 (getCurrentListMap!1992 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179314 () array!22428)

(assert (=> b!382196 (= lt!179316 (getCurrentListMap!1992 lt!179317 lt!179314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179311 () ListLongMap!5079)

(assert (=> b!382196 (and (= lt!179313 lt!179311) (= lt!179311 lt!179313))))

(declare-fun v!373 () V!13459)

(declare-fun lt!179315 () ListLongMap!5079)

(declare-fun +!950 (ListLongMap!5079 tuple2!6164) ListLongMap!5079)

(assert (=> b!382196 (= lt!179311 (+!950 lt!179315 (tuple2!6165 k0!778 v!373)))))

(declare-datatypes ((Unit!11779 0))(
  ( (Unit!11780) )
))
(declare-fun lt!179310 () Unit!11779)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!179 (array!22430 array!22428 (_ BitVec 32) (_ BitVec 32) V!13459 V!13459 (_ BitVec 32) (_ BitVec 64) V!13459 (_ BitVec 32) Int) Unit!11779)

(assert (=> b!382196 (= lt!179310 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!179 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!839 (array!22430 array!22428 (_ BitVec 32) (_ BitVec 32) V!13459 V!13459 (_ BitVec 32) Int) ListLongMap!5079)

(assert (=> b!382196 (= lt!179313 (getCurrentListMapNoExtraKeys!839 lt!179317 lt!179314 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382196 (= lt!179314 (array!22429 (store (arr!10682 _values!506) i!548 (ValueCellFull!4289 v!373)) (size!11034 _values!506)))))

(assert (=> b!382196 (= lt!179315 (getCurrentListMapNoExtraKeys!839 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15462 () Bool)

(assert (=> mapIsEmpty!15462 mapRes!15462))

(declare-fun b!382197 () Bool)

(declare-fun res!217361 () Bool)

(assert (=> b!382197 (=> (not res!217361) (not e!232267))))

(declare-fun arrayContainsKey!0 (array!22430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382197 (= res!217361 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382198 () Bool)

(assert (=> b!382198 (= e!232268 tp_is_empty!9265)))

(assert (= (and start!37476 res!217364) b!382189))

(assert (= (and b!382189 res!217362) b!382195))

(assert (= (and b!382195 res!217370) b!382185))

(assert (= (and b!382185 res!217368) b!382193))

(assert (= (and b!382193 res!217360) b!382188))

(assert (= (and b!382188 res!217369) b!382191))

(assert (= (and b!382191 res!217367) b!382197))

(assert (= (and b!382197 res!217361) b!382190))

(assert (= (and b!382190 res!217363) b!382194))

(assert (= (and b!382194 res!217365) b!382196))

(assert (= (and b!382196 (not res!217366)) b!382186))

(assert (= (and b!382192 condMapEmpty!15462) mapIsEmpty!15462))

(assert (= (and b!382192 (not condMapEmpty!15462)) mapNonEmpty!15462))

(get-info :version)

(assert (= (and mapNonEmpty!15462 ((_ is ValueCellFull!4289) mapValue!15462)) b!382187))

(assert (= (and b!382192 ((_ is ValueCellFull!4289) mapDefault!15462)) b!382198))

(assert (= start!37476 b!382192))

(declare-fun m!379307 () Bool)

(assert (=> b!382194 m!379307))

(declare-fun m!379309 () Bool)

(assert (=> b!382185 m!379309))

(declare-fun m!379311 () Bool)

(assert (=> b!382188 m!379311))

(declare-fun m!379313 () Bool)

(assert (=> mapNonEmpty!15462 m!379313))

(declare-fun m!379315 () Bool)

(assert (=> b!382191 m!379315))

(declare-fun m!379317 () Bool)

(assert (=> b!382190 m!379317))

(declare-fun m!379319 () Bool)

(assert (=> b!382190 m!379319))

(declare-fun m!379321 () Bool)

(assert (=> b!382195 m!379321))

(declare-fun m!379323 () Bool)

(assert (=> b!382196 m!379323))

(declare-fun m!379325 () Bool)

(assert (=> b!382196 m!379325))

(declare-fun m!379327 () Bool)

(assert (=> b!382196 m!379327))

(declare-fun m!379329 () Bool)

(assert (=> b!382196 m!379329))

(declare-fun m!379331 () Bool)

(assert (=> b!382196 m!379331))

(declare-fun m!379333 () Bool)

(assert (=> b!382196 m!379333))

(declare-fun m!379335 () Bool)

(assert (=> b!382196 m!379335))

(declare-fun m!379337 () Bool)

(assert (=> start!37476 m!379337))

(declare-fun m!379339 () Bool)

(assert (=> start!37476 m!379339))

(declare-fun m!379341 () Bool)

(assert (=> start!37476 m!379341))

(declare-fun m!379343 () Bool)

(assert (=> b!382197 m!379343))

(check-sat tp_is_empty!9265 (not start!37476) b_and!15873 (not b!382195) (not b!382185) (not b!382194) (not b!382196) (not b!382188) (not b!382190) (not b_next!8617) (not b!382197) (not mapNonEmpty!15462))
(check-sat b_and!15873 (not b_next!8617))
