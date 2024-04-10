; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97744 () Bool)

(assert start!97744)

(declare-fun b_free!23445 () Bool)

(declare-fun b_next!23445 () Bool)

(assert (=> start!97744 (= b_free!23445 (not b_next!23445))))

(declare-fun tp!83038 () Bool)

(declare-fun b_and!37719 () Bool)

(assert (=> start!97744 (= tp!83038 b_and!37719)))

(declare-fun b!1117760 () Bool)

(declare-fun res!746460 () Bool)

(declare-fun e!636711 () Bool)

(assert (=> b!1117760 (=> (not res!746460) (not e!636711))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72841 0))(
  ( (array!72842 (arr!35073 (Array (_ BitVec 32) (_ BitVec 64))) (size!35609 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72841)

(assert (=> b!1117760 (= res!746460 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35609 _keys!1208))))))

(declare-fun b!1117761 () Bool)

(declare-fun res!746466 () Bool)

(assert (=> b!1117761 (=> (not res!746466) (not e!636711))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1117761 (= res!746466 (= (select (arr!35073 _keys!1208) i!673) k0!934))))

(declare-fun b!1117762 () Bool)

(declare-fun res!746462 () Bool)

(assert (=> b!1117762 (=> (not res!746462) (not e!636711))))

(declare-datatypes ((List!24395 0))(
  ( (Nil!24392) (Cons!24391 (h!25600 (_ BitVec 64)) (t!34876 List!24395)) )
))
(declare-fun arrayNoDuplicates!0 (array!72841 (_ BitVec 32) List!24395) Bool)

(assert (=> b!1117762 (= res!746462 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24392))))

(declare-fun b!1117763 () Bool)

(declare-fun e!636714 () Bool)

(declare-fun e!636712 () Bool)

(declare-fun mapRes!43780 () Bool)

(assert (=> b!1117763 (= e!636714 (and e!636712 mapRes!43780))))

(declare-fun condMapEmpty!43780 () Bool)

(declare-datatypes ((V!42427 0))(
  ( (V!42428 (val!14044 Int)) )
))
(declare-datatypes ((ValueCell!13278 0))(
  ( (ValueCellFull!13278 (v!16677 V!42427)) (EmptyCell!13278) )
))
(declare-datatypes ((array!72843 0))(
  ( (array!72844 (arr!35074 (Array (_ BitVec 32) ValueCell!13278)) (size!35610 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72843)

(declare-fun mapDefault!43780 () ValueCell!13278)

(assert (=> b!1117763 (= condMapEmpty!43780 (= (arr!35074 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13278)) mapDefault!43780)))))

(declare-fun mapIsEmpty!43780 () Bool)

(assert (=> mapIsEmpty!43780 mapRes!43780))

(declare-fun b!1117764 () Bool)

(declare-fun res!746461 () Bool)

(assert (=> b!1117764 (=> (not res!746461) (not e!636711))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117764 (= res!746461 (validMask!0 mask!1564))))

(declare-fun b!1117765 () Bool)

(declare-fun e!636709 () Bool)

(assert (=> b!1117765 (= e!636709 true)))

(declare-fun zeroValue!944 () V!42427)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun minValue!944 () V!42427)

(declare-datatypes ((tuple2!17608 0))(
  ( (tuple2!17609 (_1!8815 (_ BitVec 64)) (_2!8815 V!42427)) )
))
(declare-datatypes ((List!24396 0))(
  ( (Nil!24393) (Cons!24392 (h!25601 tuple2!17608) (t!34877 List!24396)) )
))
(declare-datatypes ((ListLongMap!15577 0))(
  ( (ListLongMap!15578 (toList!7804 List!24396)) )
))
(declare-fun lt!497350 () ListLongMap!15577)

(declare-fun getCurrentListMapNoExtraKeys!4294 (array!72841 array!72843 (_ BitVec 32) (_ BitVec 32) V!42427 V!42427 (_ BitVec 32) Int) ListLongMap!15577)

(assert (=> b!1117765 (= lt!497350 (getCurrentListMapNoExtraKeys!4294 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!746457 () Bool)

(assert (=> start!97744 (=> (not res!746457) (not e!636711))))

(assert (=> start!97744 (= res!746457 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35609 _keys!1208))))))

(assert (=> start!97744 e!636711))

(declare-fun tp_is_empty!27975 () Bool)

(assert (=> start!97744 tp_is_empty!27975))

(declare-fun array_inv!26948 (array!72841) Bool)

(assert (=> start!97744 (array_inv!26948 _keys!1208)))

(assert (=> start!97744 true))

(assert (=> start!97744 tp!83038))

(declare-fun array_inv!26949 (array!72843) Bool)

(assert (=> start!97744 (and (array_inv!26949 _values!996) e!636714)))

(declare-fun b!1117766 () Bool)

(declare-fun e!636708 () Bool)

(assert (=> b!1117766 (= e!636708 (not e!636709))))

(declare-fun res!746463 () Bool)

(assert (=> b!1117766 (=> res!746463 e!636709)))

(assert (=> b!1117766 (= res!746463 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117766 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36682 0))(
  ( (Unit!36683) )
))
(declare-fun lt!497349 () Unit!36682)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72841 (_ BitVec 64) (_ BitVec 32)) Unit!36682)

(assert (=> b!1117766 (= lt!497349 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1117767 () Bool)

(declare-fun res!746464 () Bool)

(assert (=> b!1117767 (=> (not res!746464) (not e!636708))))

(declare-fun lt!497351 () array!72841)

(assert (=> b!1117767 (= res!746464 (arrayNoDuplicates!0 lt!497351 #b00000000000000000000000000000000 Nil!24392))))

(declare-fun b!1117768 () Bool)

(declare-fun e!636713 () Bool)

(assert (=> b!1117768 (= e!636713 tp_is_empty!27975)))

(declare-fun mapNonEmpty!43780 () Bool)

(declare-fun tp!83039 () Bool)

(assert (=> mapNonEmpty!43780 (= mapRes!43780 (and tp!83039 e!636713))))

(declare-fun mapValue!43780 () ValueCell!13278)

(declare-fun mapKey!43780 () (_ BitVec 32))

(declare-fun mapRest!43780 () (Array (_ BitVec 32) ValueCell!13278))

(assert (=> mapNonEmpty!43780 (= (arr!35074 _values!996) (store mapRest!43780 mapKey!43780 mapValue!43780))))

(declare-fun b!1117769 () Bool)

(declare-fun res!746458 () Bool)

(assert (=> b!1117769 (=> (not res!746458) (not e!636711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117769 (= res!746458 (validKeyInArray!0 k0!934))))

(declare-fun b!1117770 () Bool)

(assert (=> b!1117770 (= e!636711 e!636708)))

(declare-fun res!746465 () Bool)

(assert (=> b!1117770 (=> (not res!746465) (not e!636708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72841 (_ BitVec 32)) Bool)

(assert (=> b!1117770 (= res!746465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497351 mask!1564))))

(assert (=> b!1117770 (= lt!497351 (array!72842 (store (arr!35073 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35609 _keys!1208)))))

(declare-fun b!1117771 () Bool)

(assert (=> b!1117771 (= e!636712 tp_is_empty!27975)))

(declare-fun b!1117772 () Bool)

(declare-fun res!746459 () Bool)

(assert (=> b!1117772 (=> (not res!746459) (not e!636711))))

(assert (=> b!1117772 (= res!746459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117773 () Bool)

(declare-fun res!746467 () Bool)

(assert (=> b!1117773 (=> (not res!746467) (not e!636711))))

(assert (=> b!1117773 (= res!746467 (and (= (size!35610 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35609 _keys!1208) (size!35610 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97744 res!746457) b!1117764))

(assert (= (and b!1117764 res!746461) b!1117773))

(assert (= (and b!1117773 res!746467) b!1117772))

(assert (= (and b!1117772 res!746459) b!1117762))

(assert (= (and b!1117762 res!746462) b!1117760))

(assert (= (and b!1117760 res!746460) b!1117769))

(assert (= (and b!1117769 res!746458) b!1117761))

(assert (= (and b!1117761 res!746466) b!1117770))

(assert (= (and b!1117770 res!746465) b!1117767))

(assert (= (and b!1117767 res!746464) b!1117766))

(assert (= (and b!1117766 (not res!746463)) b!1117765))

(assert (= (and b!1117763 condMapEmpty!43780) mapIsEmpty!43780))

(assert (= (and b!1117763 (not condMapEmpty!43780)) mapNonEmpty!43780))

(get-info :version)

(assert (= (and mapNonEmpty!43780 ((_ is ValueCellFull!13278) mapValue!43780)) b!1117768))

(assert (= (and b!1117763 ((_ is ValueCellFull!13278) mapDefault!43780)) b!1117771))

(assert (= start!97744 b!1117763))

(declare-fun m!1033527 () Bool)

(assert (=> b!1117761 m!1033527))

(declare-fun m!1033529 () Bool)

(assert (=> b!1117764 m!1033529))

(declare-fun m!1033531 () Bool)

(assert (=> b!1117767 m!1033531))

(declare-fun m!1033533 () Bool)

(assert (=> start!97744 m!1033533))

(declare-fun m!1033535 () Bool)

(assert (=> start!97744 m!1033535))

(declare-fun m!1033537 () Bool)

(assert (=> b!1117770 m!1033537))

(declare-fun m!1033539 () Bool)

(assert (=> b!1117770 m!1033539))

(declare-fun m!1033541 () Bool)

(assert (=> b!1117762 m!1033541))

(declare-fun m!1033543 () Bool)

(assert (=> b!1117769 m!1033543))

(declare-fun m!1033545 () Bool)

(assert (=> b!1117765 m!1033545))

(declare-fun m!1033547 () Bool)

(assert (=> mapNonEmpty!43780 m!1033547))

(declare-fun m!1033549 () Bool)

(assert (=> b!1117772 m!1033549))

(declare-fun m!1033551 () Bool)

(assert (=> b!1117766 m!1033551))

(declare-fun m!1033553 () Bool)

(assert (=> b!1117766 m!1033553))

(check-sat (not b!1117770) (not b!1117766) (not b!1117772) (not b!1117767) (not mapNonEmpty!43780) b_and!37719 (not b_next!23445) tp_is_empty!27975 (not b!1117765) (not start!97744) (not b!1117764) (not b!1117762) (not b!1117769))
(check-sat b_and!37719 (not b_next!23445))
