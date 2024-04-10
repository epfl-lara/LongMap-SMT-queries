; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37498 () Bool)

(assert start!37498)

(declare-fun b_free!8625 () Bool)

(declare-fun b_next!8625 () Bool)

(assert (=> start!37498 (= b_free!8625 (not b_next!8625))))

(declare-fun tp!30590 () Bool)

(declare-fun b_and!15867 () Bool)

(assert (=> start!37498 (= tp!30590 b_and!15867)))

(declare-fun b!382403 () Bool)

(declare-fun res!217498 () Bool)

(declare-fun e!232387 () Bool)

(assert (=> b!382403 (=> (not res!217498) (not e!232387))))

(declare-datatypes ((array!22455 0))(
  ( (array!22456 (arr!10696 (Array (_ BitVec 32) (_ BitVec 64))) (size!11048 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22455)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382403 (= res!217498 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!382404 () Bool)

(declare-fun e!232385 () Bool)

(declare-fun e!232388 () Bool)

(declare-fun mapRes!15474 () Bool)

(assert (=> b!382404 (= e!232385 (and e!232388 mapRes!15474))))

(declare-fun condMapEmpty!15474 () Bool)

(declare-datatypes ((V!13469 0))(
  ( (V!13470 (val!4681 Int)) )
))
(declare-datatypes ((ValueCell!4293 0))(
  ( (ValueCellFull!4293 (v!6878 V!13469)) (EmptyCell!4293) )
))
(declare-datatypes ((array!22457 0))(
  ( (array!22458 (arr!10697 (Array (_ BitVec 32) ValueCell!4293)) (size!11049 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22457)

(declare-fun mapDefault!15474 () ValueCell!4293)

(assert (=> b!382404 (= condMapEmpty!15474 (= (arr!10697 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4293)) mapDefault!15474)))))

(declare-fun b!382405 () Bool)

(declare-fun res!217502 () Bool)

(assert (=> b!382405 (=> (not res!217502) (not e!232387))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22455 (_ BitVec 32)) Bool)

(assert (=> b!382405 (= res!217502 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15474 () Bool)

(assert (=> mapIsEmpty!15474 mapRes!15474))

(declare-fun b!382406 () Bool)

(declare-fun e!232382 () Bool)

(assert (=> b!382406 (= e!232387 e!232382)))

(declare-fun res!217495 () Bool)

(assert (=> b!382406 (=> (not res!217495) (not e!232382))))

(declare-fun lt!179401 () array!22455)

(assert (=> b!382406 (= res!217495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179401 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!382406 (= lt!179401 (array!22456 (store (arr!10696 _keys!658) i!548 k0!778) (size!11048 _keys!658)))))

(declare-fun mapNonEmpty!15474 () Bool)

(declare-fun tp!30591 () Bool)

(declare-fun e!232383 () Bool)

(assert (=> mapNonEmpty!15474 (= mapRes!15474 (and tp!30591 e!232383))))

(declare-fun mapRest!15474 () (Array (_ BitVec 32) ValueCell!4293))

(declare-fun mapKey!15474 () (_ BitVec 32))

(declare-fun mapValue!15474 () ValueCell!4293)

(assert (=> mapNonEmpty!15474 (= (arr!10697 _values!506) (store mapRest!15474 mapKey!15474 mapValue!15474))))

(declare-fun b!382407 () Bool)

(declare-fun res!217499 () Bool)

(assert (=> b!382407 (=> (not res!217499) (not e!232387))))

(declare-datatypes ((List!6125 0))(
  ( (Nil!6122) (Cons!6121 (h!6977 (_ BitVec 64)) (t!11275 List!6125)) )
))
(declare-fun arrayNoDuplicates!0 (array!22455 (_ BitVec 32) List!6125) Bool)

(assert (=> b!382407 (= res!217499 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6122))))

(declare-fun b!382408 () Bool)

(declare-fun e!232384 () Bool)

(assert (=> b!382408 (= e!232384 true)))

(declare-datatypes ((tuple2!6294 0))(
  ( (tuple2!6295 (_1!3158 (_ BitVec 64)) (_2!3158 V!13469)) )
))
(declare-datatypes ((List!6126 0))(
  ( (Nil!6123) (Cons!6122 (h!6978 tuple2!6294) (t!11276 List!6126)) )
))
(declare-datatypes ((ListLongMap!5207 0))(
  ( (ListLongMap!5208 (toList!2619 List!6126)) )
))
(declare-fun lt!179402 () ListLongMap!5207)

(declare-fun lt!179398 () ListLongMap!5207)

(assert (=> b!382408 (= lt!179402 lt!179398)))

(declare-fun b!382409 () Bool)

(declare-fun tp_is_empty!9273 () Bool)

(assert (=> b!382409 (= e!232383 tp_is_empty!9273)))

(declare-fun res!217504 () Bool)

(assert (=> start!37498 (=> (not res!217504) (not e!232387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37498 (= res!217504 (validMask!0 mask!970))))

(assert (=> start!37498 e!232387))

(declare-fun array_inv!7876 (array!22457) Bool)

(assert (=> start!37498 (and (array_inv!7876 _values!506) e!232385)))

(assert (=> start!37498 tp!30590))

(assert (=> start!37498 true))

(assert (=> start!37498 tp_is_empty!9273))

(declare-fun array_inv!7877 (array!22455) Bool)

(assert (=> start!37498 (array_inv!7877 _keys!658)))

(declare-fun b!382402 () Bool)

(declare-fun res!217496 () Bool)

(assert (=> b!382402 (=> (not res!217496) (not e!232387))))

(assert (=> b!382402 (= res!217496 (or (= (select (arr!10696 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10696 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382410 () Bool)

(declare-fun res!217503 () Bool)

(assert (=> b!382410 (=> (not res!217503) (not e!232382))))

(assert (=> b!382410 (= res!217503 (arrayNoDuplicates!0 lt!179401 #b00000000000000000000000000000000 Nil!6122))))

(declare-fun b!382411 () Bool)

(declare-fun res!217497 () Bool)

(assert (=> b!382411 (=> (not res!217497) (not e!232387))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382411 (= res!217497 (and (= (size!11049 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11048 _keys!658) (size!11049 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382412 () Bool)

(declare-fun res!217500 () Bool)

(assert (=> b!382412 (=> (not res!217500) (not e!232387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382412 (= res!217500 (validKeyInArray!0 k0!778))))

(declare-fun b!382413 () Bool)

(assert (=> b!382413 (= e!232382 (not e!232384))))

(declare-fun res!217505 () Bool)

(assert (=> b!382413 (=> res!217505 e!232384)))

(declare-fun lt!179406 () Bool)

(assert (=> b!382413 (= res!217505 (or (and (not lt!179406) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179406) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179406)))))

(assert (=> b!382413 (= lt!179406 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!179399 () ListLongMap!5207)

(declare-fun zeroValue!472 () V!13469)

(declare-fun minValue!472 () V!13469)

(declare-fun getCurrentListMap!2025 (array!22455 array!22457 (_ BitVec 32) (_ BitVec 32) V!13469 V!13469 (_ BitVec 32) Int) ListLongMap!5207)

(assert (=> b!382413 (= lt!179399 (getCurrentListMap!2025 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179403 () array!22457)

(assert (=> b!382413 (= lt!179402 (getCurrentListMap!2025 lt!179401 lt!179403 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179404 () ListLongMap!5207)

(assert (=> b!382413 (and (= lt!179398 lt!179404) (= lt!179404 lt!179398))))

(declare-fun v!373 () V!13469)

(declare-fun lt!179405 () ListLongMap!5207)

(declare-fun +!955 (ListLongMap!5207 tuple2!6294) ListLongMap!5207)

(assert (=> b!382413 (= lt!179404 (+!955 lt!179405 (tuple2!6295 k0!778 v!373)))))

(declare-datatypes ((Unit!11804 0))(
  ( (Unit!11805) )
))
(declare-fun lt!179400 () Unit!11804)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!183 (array!22455 array!22457 (_ BitVec 32) (_ BitVec 32) V!13469 V!13469 (_ BitVec 32) (_ BitVec 64) V!13469 (_ BitVec 32) Int) Unit!11804)

(assert (=> b!382413 (= lt!179400 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!183 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!859 (array!22455 array!22457 (_ BitVec 32) (_ BitVec 32) V!13469 V!13469 (_ BitVec 32) Int) ListLongMap!5207)

(assert (=> b!382413 (= lt!179398 (getCurrentListMapNoExtraKeys!859 lt!179401 lt!179403 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382413 (= lt!179403 (array!22458 (store (arr!10697 _values!506) i!548 (ValueCellFull!4293 v!373)) (size!11049 _values!506)))))

(assert (=> b!382413 (= lt!179405 (getCurrentListMapNoExtraKeys!859 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382414 () Bool)

(assert (=> b!382414 (= e!232388 tp_is_empty!9273)))

(declare-fun b!382415 () Bool)

(declare-fun res!217501 () Bool)

(assert (=> b!382415 (=> (not res!217501) (not e!232387))))

(assert (=> b!382415 (= res!217501 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11048 _keys!658))))))

(assert (= (and start!37498 res!217504) b!382411))

(assert (= (and b!382411 res!217497) b!382405))

(assert (= (and b!382405 res!217502) b!382407))

(assert (= (and b!382407 res!217499) b!382415))

(assert (= (and b!382415 res!217501) b!382412))

(assert (= (and b!382412 res!217500) b!382402))

(assert (= (and b!382402 res!217496) b!382403))

(assert (= (and b!382403 res!217498) b!382406))

(assert (= (and b!382406 res!217495) b!382410))

(assert (= (and b!382410 res!217503) b!382413))

(assert (= (and b!382413 (not res!217505)) b!382408))

(assert (= (and b!382404 condMapEmpty!15474) mapIsEmpty!15474))

(assert (= (and b!382404 (not condMapEmpty!15474)) mapNonEmpty!15474))

(get-info :version)

(assert (= (and mapNonEmpty!15474 ((_ is ValueCellFull!4293) mapValue!15474)) b!382409))

(assert (= (and b!382404 ((_ is ValueCellFull!4293) mapDefault!15474)) b!382414))

(assert (= start!37498 b!382404))

(declare-fun m!379229 () Bool)

(assert (=> b!382407 m!379229))

(declare-fun m!379231 () Bool)

(assert (=> b!382410 m!379231))

(declare-fun m!379233 () Bool)

(assert (=> b!382412 m!379233))

(declare-fun m!379235 () Bool)

(assert (=> b!382406 m!379235))

(declare-fun m!379237 () Bool)

(assert (=> b!382406 m!379237))

(declare-fun m!379239 () Bool)

(assert (=> b!382405 m!379239))

(declare-fun m!379241 () Bool)

(assert (=> b!382403 m!379241))

(declare-fun m!379243 () Bool)

(assert (=> mapNonEmpty!15474 m!379243))

(declare-fun m!379245 () Bool)

(assert (=> b!382413 m!379245))

(declare-fun m!379247 () Bool)

(assert (=> b!382413 m!379247))

(declare-fun m!379249 () Bool)

(assert (=> b!382413 m!379249))

(declare-fun m!379251 () Bool)

(assert (=> b!382413 m!379251))

(declare-fun m!379253 () Bool)

(assert (=> b!382413 m!379253))

(declare-fun m!379255 () Bool)

(assert (=> b!382413 m!379255))

(declare-fun m!379257 () Bool)

(assert (=> b!382413 m!379257))

(declare-fun m!379259 () Bool)

(assert (=> b!382402 m!379259))

(declare-fun m!379261 () Bool)

(assert (=> start!37498 m!379261))

(declare-fun m!379263 () Bool)

(assert (=> start!37498 m!379263))

(declare-fun m!379265 () Bool)

(assert (=> start!37498 m!379265))

(check-sat b_and!15867 (not b_next!8625) (not mapNonEmpty!15474) (not b!382412) (not start!37498) (not b!382403) (not b!382406) tp_is_empty!9273 (not b!382407) (not b!382413) (not b!382410) (not b!382405))
(check-sat b_and!15867 (not b_next!8625))
