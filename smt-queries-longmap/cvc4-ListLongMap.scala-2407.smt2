; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38086 () Bool)

(assert start!38086)

(declare-fun b_free!9011 () Bool)

(declare-fun b_next!9011 () Bool)

(assert (=> start!38086 (= b_free!9011 (not b_next!9011))))

(declare-fun tp!31808 () Bool)

(declare-fun b_and!16349 () Bool)

(assert (=> start!38086 (= tp!31808 b_and!16349)))

(declare-fun b!392340 () Bool)

(declare-fun e!237583 () Bool)

(declare-fun e!237582 () Bool)

(assert (=> b!392340 (= e!237583 (not e!237582))))

(declare-fun res!224701 () Bool)

(assert (=> b!392340 (=> res!224701 e!237582)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392340 (= res!224701 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!14015 0))(
  ( (V!14016 (val!4886 Int)) )
))
(declare-datatypes ((ValueCell!4498 0))(
  ( (ValueCellFull!4498 (v!7115 V!14015)) (EmptyCell!4498) )
))
(declare-datatypes ((array!23271 0))(
  ( (array!23272 (arr!11096 (Array (_ BitVec 32) ValueCell!4498)) (size!11448 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23271)

(declare-datatypes ((tuple2!6590 0))(
  ( (tuple2!6591 (_1!3306 (_ BitVec 64)) (_2!3306 V!14015)) )
))
(declare-datatypes ((List!6443 0))(
  ( (Nil!6440) (Cons!6439 (h!7295 tuple2!6590) (t!11609 List!6443)) )
))
(declare-datatypes ((ListLongMap!5503 0))(
  ( (ListLongMap!5504 (toList!2767 List!6443)) )
))
(declare-fun lt!185368 () ListLongMap!5503)

(declare-fun zeroValue!472 () V!14015)

(declare-datatypes ((array!23273 0))(
  ( (array!23274 (arr!11097 (Array (_ BitVec 32) (_ BitVec 64))) (size!11449 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23273)

(declare-fun defaultEntry!514 () Int)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!14015)

(declare-fun getCurrentListMap!2109 (array!23273 array!23271 (_ BitVec 32) (_ BitVec 32) V!14015 V!14015 (_ BitVec 32) Int) ListLongMap!5503)

(assert (=> b!392340 (= lt!185368 (getCurrentListMap!2109 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185369 () array!23271)

(declare-fun lt!185372 () ListLongMap!5503)

(declare-fun lt!185371 () array!23273)

(assert (=> b!392340 (= lt!185372 (getCurrentListMap!2109 lt!185371 lt!185369 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185373 () ListLongMap!5503)

(declare-fun lt!185367 () ListLongMap!5503)

(assert (=> b!392340 (and (= lt!185373 lt!185367) (= lt!185367 lt!185373))))

(declare-fun v!373 () V!14015)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun lt!185366 () ListLongMap!5503)

(declare-fun +!1062 (ListLongMap!5503 tuple2!6590) ListLongMap!5503)

(assert (=> b!392340 (= lt!185367 (+!1062 lt!185366 (tuple2!6591 k!778 v!373)))))

(declare-datatypes ((Unit!12008 0))(
  ( (Unit!12009) )
))
(declare-fun lt!185365 () Unit!12008)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!273 (array!23273 array!23271 (_ BitVec 32) (_ BitVec 32) V!14015 V!14015 (_ BitVec 32) (_ BitVec 64) V!14015 (_ BitVec 32) Int) Unit!12008)

(assert (=> b!392340 (= lt!185365 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!273 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!989 (array!23273 array!23271 (_ BitVec 32) (_ BitVec 32) V!14015 V!14015 (_ BitVec 32) Int) ListLongMap!5503)

(assert (=> b!392340 (= lt!185373 (getCurrentListMapNoExtraKeys!989 lt!185371 lt!185369 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392340 (= lt!185369 (array!23272 (store (arr!11096 _values!506) i!548 (ValueCellFull!4498 v!373)) (size!11448 _values!506)))))

(assert (=> b!392340 (= lt!185366 (getCurrentListMapNoExtraKeys!989 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392341 () Bool)

(declare-fun res!224703 () Bool)

(declare-fun e!237589 () Bool)

(assert (=> b!392341 (=> (not res!224703) (not e!237589))))

(assert (=> b!392341 (= res!224703 (and (= (size!11448 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11449 _keys!658) (size!11448 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392342 () Bool)

(declare-fun res!224695 () Bool)

(assert (=> b!392342 (=> (not res!224695) (not e!237583))))

(declare-datatypes ((List!6444 0))(
  ( (Nil!6441) (Cons!6440 (h!7296 (_ BitVec 64)) (t!11610 List!6444)) )
))
(declare-fun arrayNoDuplicates!0 (array!23273 (_ BitVec 32) List!6444) Bool)

(assert (=> b!392342 (= res!224695 (arrayNoDuplicates!0 lt!185371 #b00000000000000000000000000000000 Nil!6441))))

(declare-fun b!392343 () Bool)

(declare-fun e!237588 () Bool)

(declare-fun tp_is_empty!9683 () Bool)

(assert (=> b!392343 (= e!237588 tp_is_empty!9683)))

(declare-fun b!392344 () Bool)

(declare-fun res!224698 () Bool)

(assert (=> b!392344 (=> (not res!224698) (not e!237589))))

(assert (=> b!392344 (= res!224698 (or (= (select (arr!11097 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11097 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392346 () Bool)

(declare-fun lt!185370 () tuple2!6590)

(assert (=> b!392346 (= e!237582 (= lt!185368 (+!1062 lt!185366 lt!185370)))))

(declare-fun e!237586 () Bool)

(assert (=> b!392346 e!237586))

(declare-fun res!224699 () Bool)

(assert (=> b!392346 (=> (not res!224699) (not e!237586))))

(assert (=> b!392346 (= res!224699 (= lt!185372 (+!1062 lt!185373 lt!185370)))))

(assert (=> b!392346 (= lt!185370 (tuple2!6591 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392347 () Bool)

(declare-fun res!224700 () Bool)

(assert (=> b!392347 (=> (not res!224700) (not e!237589))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392347 (= res!224700 (validKeyInArray!0 k!778))))

(declare-fun b!392348 () Bool)

(declare-fun res!224697 () Bool)

(assert (=> b!392348 (=> (not res!224697) (not e!237589))))

(assert (=> b!392348 (= res!224697 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11449 _keys!658))))))

(declare-fun mapNonEmpty!16113 () Bool)

(declare-fun mapRes!16113 () Bool)

(declare-fun tp!31809 () Bool)

(declare-fun e!237585 () Bool)

(assert (=> mapNonEmpty!16113 (= mapRes!16113 (and tp!31809 e!237585))))

(declare-fun mapValue!16113 () ValueCell!4498)

(declare-fun mapRest!16113 () (Array (_ BitVec 32) ValueCell!4498))

(declare-fun mapKey!16113 () (_ BitVec 32))

(assert (=> mapNonEmpty!16113 (= (arr!11096 _values!506) (store mapRest!16113 mapKey!16113 mapValue!16113))))

(declare-fun b!392349 () Bool)

(assert (=> b!392349 (= e!237586 (= lt!185372 (+!1062 lt!185367 lt!185370)))))

(declare-fun b!392350 () Bool)

(declare-fun res!224694 () Bool)

(assert (=> b!392350 (=> (not res!224694) (not e!237589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23273 (_ BitVec 32)) Bool)

(assert (=> b!392350 (= res!224694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!392351 () Bool)

(assert (=> b!392351 (= e!237585 tp_is_empty!9683)))

(declare-fun res!224696 () Bool)

(assert (=> start!38086 (=> (not res!224696) (not e!237589))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38086 (= res!224696 (validMask!0 mask!970))))

(assert (=> start!38086 e!237589))

(declare-fun e!237587 () Bool)

(declare-fun array_inv!8150 (array!23271) Bool)

(assert (=> start!38086 (and (array_inv!8150 _values!506) e!237587)))

(assert (=> start!38086 tp!31808))

(assert (=> start!38086 true))

(assert (=> start!38086 tp_is_empty!9683))

(declare-fun array_inv!8151 (array!23273) Bool)

(assert (=> start!38086 (array_inv!8151 _keys!658)))

(declare-fun b!392345 () Bool)

(declare-fun res!224693 () Bool)

(assert (=> b!392345 (=> (not res!224693) (not e!237589))))

(declare-fun arrayContainsKey!0 (array!23273 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392345 (= res!224693 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!392352 () Bool)

(assert (=> b!392352 (= e!237589 e!237583)))

(declare-fun res!224702 () Bool)

(assert (=> b!392352 (=> (not res!224702) (not e!237583))))

(assert (=> b!392352 (= res!224702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185371 mask!970))))

(assert (=> b!392352 (= lt!185371 (array!23274 (store (arr!11097 _keys!658) i!548 k!778) (size!11449 _keys!658)))))

(declare-fun mapIsEmpty!16113 () Bool)

(assert (=> mapIsEmpty!16113 mapRes!16113))

(declare-fun b!392353 () Bool)

(declare-fun res!224692 () Bool)

(assert (=> b!392353 (=> (not res!224692) (not e!237589))))

(assert (=> b!392353 (= res!224692 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6441))))

(declare-fun b!392354 () Bool)

(assert (=> b!392354 (= e!237587 (and e!237588 mapRes!16113))))

(declare-fun condMapEmpty!16113 () Bool)

(declare-fun mapDefault!16113 () ValueCell!4498)

