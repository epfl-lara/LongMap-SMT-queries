; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74926 () Bool)

(assert start!74926)

(declare-fun b_free!15445 () Bool)

(declare-fun b_next!15445 () Bool)

(assert (=> start!74926 (= b_free!15445 (not b_next!15445))))

(declare-fun tp!54037 () Bool)

(declare-fun b_and!25589 () Bool)

(assert (=> start!74926 (= tp!54037 b_and!25589)))

(declare-fun b!883649 () Bool)

(declare-fun res!600329 () Bool)

(declare-fun e!491776 () Bool)

(assert (=> b!883649 (=> (not res!600329) (not e!491776))))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51504 0))(
  ( (array!51505 (arr!24771 (Array (_ BitVec 32) (_ BitVec 64))) (size!25211 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51504)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!883649 (= res!600329 (and (= (select (arr!24771 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!28170 () Bool)

(declare-fun mapRes!28170 () Bool)

(assert (=> mapIsEmpty!28170 mapRes!28170))

(declare-fun b!883650 () Bool)

(declare-fun res!600324 () Bool)

(assert (=> b!883650 (=> (not res!600324) (not e!491776))))

(declare-datatypes ((List!17592 0))(
  ( (Nil!17589) (Cons!17588 (h!18719 (_ BitVec 64)) (t!24839 List!17592)) )
))
(declare-fun arrayNoDuplicates!0 (array!51504 (_ BitVec 32) List!17592) Bool)

(assert (=> b!883650 (= res!600324 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17589))))

(declare-fun b!883651 () Bool)

(declare-datatypes ((Unit!30154 0))(
  ( (Unit!30155) )
))
(declare-fun e!491778 () Unit!30154)

(declare-fun Unit!30156 () Unit!30154)

(assert (=> b!883651 (= e!491778 Unit!30156)))

(declare-fun b!883652 () Bool)

(declare-fun res!600326 () Bool)

(assert (=> b!883652 (=> (not res!600326) (not e!491776))))

(assert (=> b!883652 (= res!600326 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!25211 _keys!868))))))

(declare-fun b!883653 () Bool)

(declare-fun res!600330 () Bool)

(assert (=> b!883653 (=> (not res!600330) (not e!491776))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!28633 0))(
  ( (V!28634 (val!8892 Int)) )
))
(declare-datatypes ((ValueCell!8405 0))(
  ( (ValueCellFull!8405 (v!11361 V!28633)) (EmptyCell!8405) )
))
(declare-datatypes ((array!51506 0))(
  ( (array!51507 (arr!24772 (Array (_ BitVec 32) ValueCell!8405)) (size!25212 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!51506)

(assert (=> b!883653 (= res!600330 (and (= (size!25212 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!25211 _keys!868) (size!25212 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!883654 () Bool)

(declare-fun res!600327 () Bool)

(assert (=> b!883654 (=> (not res!600327) (not e!491776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!883654 (= res!600327 (validMask!0 mask!1196))))

(declare-fun b!883655 () Bool)

(declare-fun e!491771 () Bool)

(assert (=> b!883655 (= e!491771 (bvslt from!1053 (size!25212 _values!688)))))

(assert (=> b!883655 (not (= (select (arr!24771 _keys!868) from!1053) k!854))))

(declare-fun lt!399993 () Unit!30154)

(assert (=> b!883655 (= lt!399993 e!491778)))

(declare-fun c!93073 () Bool)

(assert (=> b!883655 (= c!93073 (= (select (arr!24771 _keys!868) from!1053) k!854))))

(declare-datatypes ((tuple2!11784 0))(
  ( (tuple2!11785 (_1!5903 (_ BitVec 64)) (_2!5903 V!28633)) )
))
(declare-datatypes ((List!17593 0))(
  ( (Nil!17590) (Cons!17589 (h!18720 tuple2!11784) (t!24840 List!17593)) )
))
(declare-datatypes ((ListLongMap!10553 0))(
  ( (ListLongMap!10554 (toList!5292 List!17593)) )
))
(declare-fun lt!400001 () ListLongMap!10553)

(declare-fun lt!399996 () ListLongMap!10553)

(declare-fun defaultEntry!696 () Int)

(declare-fun +!2561 (ListLongMap!10553 tuple2!11784) ListLongMap!10553)

(declare-fun get!13054 (ValueCell!8405 V!28633) V!28633)

(declare-fun dynLambda!1273 (Int (_ BitVec 64)) V!28633)

(assert (=> b!883655 (= lt!400001 (+!2561 lt!399996 (tuple2!11785 (select (arr!24771 _keys!868) from!1053) (get!13054 (select (arr!24772 _values!688) from!1053) (dynLambda!1273 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapNonEmpty!28170 () Bool)

(declare-fun tp!54038 () Bool)

(declare-fun e!491775 () Bool)

(assert (=> mapNonEmpty!28170 (= mapRes!28170 (and tp!54038 e!491775))))

(declare-fun mapRest!28170 () (Array (_ BitVec 32) ValueCell!8405))

(declare-fun mapKey!28170 () (_ BitVec 32))

(declare-fun mapValue!28170 () ValueCell!8405)

(assert (=> mapNonEmpty!28170 (= (arr!24772 _values!688) (store mapRest!28170 mapKey!28170 mapValue!28170))))

(declare-fun res!600325 () Bool)

(assert (=> start!74926 (=> (not res!600325) (not e!491776))))

(assert (=> start!74926 (= res!600325 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!25211 _keys!868))))))

(assert (=> start!74926 e!491776))

(declare-fun tp_is_empty!17689 () Bool)

(assert (=> start!74926 tp_is_empty!17689))

(assert (=> start!74926 true))

(assert (=> start!74926 tp!54037))

(declare-fun array_inv!19504 (array!51504) Bool)

(assert (=> start!74926 (array_inv!19504 _keys!868)))

(declare-fun e!491773 () Bool)

(declare-fun array_inv!19505 (array!51506) Bool)

(assert (=> start!74926 (and (array_inv!19505 _values!688) e!491773)))

(declare-fun b!883656 () Bool)

(declare-fun Unit!30157 () Unit!30154)

(assert (=> b!883656 (= e!491778 Unit!30157)))

(declare-fun lt!399992 () Unit!30154)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!51504 (_ BitVec 32) (_ BitVec 32)) Unit!30154)

(assert (=> b!883656 (= lt!399992 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!883656 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17589)))

(declare-fun lt!399991 () Unit!30154)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!51504 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!30154)

(assert (=> b!883656 (= lt!399991 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!51504 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!883656 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!399994 () Unit!30154)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!51504 (_ BitVec 64) (_ BitVec 32) List!17592) Unit!30154)

(assert (=> b!883656 (= lt!399994 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17589))))

(assert (=> b!883656 false))

(declare-fun b!883657 () Bool)

(declare-fun e!491774 () Bool)

(assert (=> b!883657 (= e!491776 e!491774)))

(declare-fun res!600328 () Bool)

(assert (=> b!883657 (=> (not res!600328) (not e!491774))))

(assert (=> b!883657 (= res!600328 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-fun lt!399997 () array!51506)

(declare-fun minValue!654 () V!28633)

(declare-fun zeroValue!654 () V!28633)

(declare-fun getCurrentListMapNoExtraKeys!3251 (array!51504 array!51506 (_ BitVec 32) (_ BitVec 32) V!28633 V!28633 (_ BitVec 32) Int) ListLongMap!10553)

(assert (=> b!883657 (= lt!400001 (getCurrentListMapNoExtraKeys!3251 _keys!868 lt!399997 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!28633)

(assert (=> b!883657 (= lt!399997 (array!51507 (store (arr!24772 _values!688) i!612 (ValueCellFull!8405 v!557)) (size!25212 _values!688)))))

(declare-fun lt!399995 () ListLongMap!10553)

(assert (=> b!883657 (= lt!399995 (getCurrentListMapNoExtraKeys!3251 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!883658 () Bool)

(declare-fun res!600333 () Bool)

(assert (=> b!883658 (=> (not res!600333) (not e!491776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51504 (_ BitVec 32)) Bool)

(assert (=> b!883658 (= res!600333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!883659 () Bool)

(assert (=> b!883659 (= e!491774 (not e!491771))))

(declare-fun res!600331 () Bool)

(assert (=> b!883659 (=> res!600331 e!491771)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!883659 (= res!600331 (not (validKeyInArray!0 (select (arr!24771 _keys!868) from!1053))))))

(declare-fun lt!399998 () ListLongMap!10553)

(assert (=> b!883659 (= lt!399998 lt!399996)))

(declare-fun lt!400000 () ListLongMap!10553)

(assert (=> b!883659 (= lt!399996 (+!2561 lt!400000 (tuple2!11785 k!854 v!557)))))

(assert (=> b!883659 (= lt!399998 (getCurrentListMapNoExtraKeys!3251 _keys!868 lt!399997 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!883659 (= lt!400000 (getCurrentListMapNoExtraKeys!3251 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun lt!399999 () Unit!30154)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!745 (array!51504 array!51506 (_ BitVec 32) (_ BitVec 32) V!28633 V!28633 (_ BitVec 32) (_ BitVec 64) V!28633 (_ BitVec 32) Int) Unit!30154)

(assert (=> b!883659 (= lt!399999 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!745 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!883660 () Bool)

(declare-fun res!600332 () Bool)

(assert (=> b!883660 (=> (not res!600332) (not e!491776))))

(assert (=> b!883660 (= res!600332 (validKeyInArray!0 k!854))))

(declare-fun b!883661 () Bool)

(declare-fun e!491772 () Bool)

(assert (=> b!883661 (= e!491772 tp_is_empty!17689)))

(declare-fun b!883662 () Bool)

(assert (=> b!883662 (= e!491773 (and e!491772 mapRes!28170))))

(declare-fun condMapEmpty!28170 () Bool)

(declare-fun mapDefault!28170 () ValueCell!8405)

