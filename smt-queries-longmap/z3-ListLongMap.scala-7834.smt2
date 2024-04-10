; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97750 () Bool)

(assert start!97750)

(declare-fun b_free!23451 () Bool)

(declare-fun b_next!23451 () Bool)

(assert (=> start!97750 (= b_free!23451 (not b_next!23451))))

(declare-fun tp!83056 () Bool)

(declare-fun b_and!37725 () Bool)

(assert (=> start!97750 (= tp!83056 b_and!37725)))

(declare-fun b!1117886 () Bool)

(declare-fun res!746563 () Bool)

(declare-fun e!636774 () Bool)

(assert (=> b!1117886 (=> (not res!746563) (not e!636774))))

(declare-datatypes ((array!72853 0))(
  ( (array!72854 (arr!35079 (Array (_ BitVec 32) (_ BitVec 64))) (size!35615 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72853)

(declare-datatypes ((List!24399 0))(
  ( (Nil!24396) (Cons!24395 (h!25604 (_ BitVec 64)) (t!34880 List!24399)) )
))
(declare-fun arrayNoDuplicates!0 (array!72853 (_ BitVec 32) List!24399) Bool)

(assert (=> b!1117886 (= res!746563 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24396))))

(declare-fun b!1117887 () Bool)

(declare-fun res!746565 () Bool)

(declare-fun e!636771 () Bool)

(assert (=> b!1117887 (=> (not res!746565) (not e!636771))))

(declare-fun lt!497377 () array!72853)

(assert (=> b!1117887 (= res!746565 (arrayNoDuplicates!0 lt!497377 #b00000000000000000000000000000000 Nil!24396))))

(declare-fun b!1117888 () Bool)

(declare-fun e!636772 () Bool)

(declare-fun e!636775 () Bool)

(declare-fun mapRes!43789 () Bool)

(assert (=> b!1117888 (= e!636772 (and e!636775 mapRes!43789))))

(declare-fun condMapEmpty!43789 () Bool)

(declare-datatypes ((V!42435 0))(
  ( (V!42436 (val!14047 Int)) )
))
(declare-datatypes ((ValueCell!13281 0))(
  ( (ValueCellFull!13281 (v!16680 V!42435)) (EmptyCell!13281) )
))
(declare-datatypes ((array!72855 0))(
  ( (array!72856 (arr!35080 (Array (_ BitVec 32) ValueCell!13281)) (size!35616 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72855)

(declare-fun mapDefault!43789 () ValueCell!13281)

(assert (=> b!1117888 (= condMapEmpty!43789 (= (arr!35080 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13281)) mapDefault!43789)))))

(declare-fun b!1117889 () Bool)

(declare-fun res!746562 () Bool)

(assert (=> b!1117889 (=> (not res!746562) (not e!636774))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1117889 (= res!746562 (validKeyInArray!0 k0!934))))

(declare-fun b!1117890 () Bool)

(declare-fun res!746559 () Bool)

(assert (=> b!1117890 (=> (not res!746559) (not e!636774))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72853 (_ BitVec 32)) Bool)

(assert (=> b!1117890 (= res!746559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1117891 () Bool)

(declare-fun res!746566 () Bool)

(assert (=> b!1117891 (=> (not res!746566) (not e!636774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1117891 (= res!746566 (validMask!0 mask!1564))))

(declare-fun b!1117892 () Bool)

(declare-fun e!636776 () Bool)

(declare-fun tp_is_empty!27981 () Bool)

(assert (=> b!1117892 (= e!636776 tp_is_empty!27981)))

(declare-fun b!1117894 () Bool)

(assert (=> b!1117894 (= e!636775 tp_is_empty!27981)))

(declare-fun b!1117895 () Bool)

(declare-fun res!746558 () Bool)

(assert (=> b!1117895 (=> (not res!746558) (not e!636774))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1117895 (= res!746558 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35615 _keys!1208))))))

(declare-fun mapIsEmpty!43789 () Bool)

(assert (=> mapIsEmpty!43789 mapRes!43789))

(declare-fun mapNonEmpty!43789 () Bool)

(declare-fun tp!83057 () Bool)

(assert (=> mapNonEmpty!43789 (= mapRes!43789 (and tp!83057 e!636776))))

(declare-fun mapRest!43789 () (Array (_ BitVec 32) ValueCell!13281))

(declare-fun mapKey!43789 () (_ BitVec 32))

(declare-fun mapValue!43789 () ValueCell!13281)

(assert (=> mapNonEmpty!43789 (= (arr!35080 _values!996) (store mapRest!43789 mapKey!43789 mapValue!43789))))

(declare-fun b!1117896 () Bool)

(declare-fun res!746556 () Bool)

(assert (=> b!1117896 (=> (not res!746556) (not e!636774))))

(assert (=> b!1117896 (= res!746556 (= (select (arr!35079 _keys!1208) i!673) k0!934))))

(declare-fun b!1117897 () Bool)

(declare-fun e!636777 () Bool)

(assert (=> b!1117897 (= e!636771 (not e!636777))))

(declare-fun res!746561 () Bool)

(assert (=> b!1117897 (=> res!746561 e!636777)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1117897 (= res!746561 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!72853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1117897 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36688 0))(
  ( (Unit!36689) )
))
(declare-fun lt!497378 () Unit!36688)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72853 (_ BitVec 64) (_ BitVec 32)) Unit!36688)

(assert (=> b!1117897 (= lt!497378 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!746560 () Bool)

(assert (=> start!97750 (=> (not res!746560) (not e!636774))))

(assert (=> start!97750 (= res!746560 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35615 _keys!1208))))))

(assert (=> start!97750 e!636774))

(assert (=> start!97750 tp_is_empty!27981))

(declare-fun array_inv!26952 (array!72853) Bool)

(assert (=> start!97750 (array_inv!26952 _keys!1208)))

(assert (=> start!97750 true))

(assert (=> start!97750 tp!83056))

(declare-fun array_inv!26953 (array!72855) Bool)

(assert (=> start!97750 (and (array_inv!26953 _values!996) e!636772)))

(declare-fun b!1117893 () Bool)

(assert (=> b!1117893 (= e!636777 true)))

(declare-fun zeroValue!944 () V!42435)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!42435)

(declare-datatypes ((tuple2!17612 0))(
  ( (tuple2!17613 (_1!8817 (_ BitVec 64)) (_2!8817 V!42435)) )
))
(declare-datatypes ((List!24400 0))(
  ( (Nil!24397) (Cons!24396 (h!25605 tuple2!17612) (t!34881 List!24400)) )
))
(declare-datatypes ((ListLongMap!15581 0))(
  ( (ListLongMap!15582 (toList!7806 List!24400)) )
))
(declare-fun lt!497376 () ListLongMap!15581)

(declare-fun getCurrentListMapNoExtraKeys!4296 (array!72853 array!72855 (_ BitVec 32) (_ BitVec 32) V!42435 V!42435 (_ BitVec 32) Int) ListLongMap!15581)

(assert (=> b!1117893 (= lt!497376 (getCurrentListMapNoExtraKeys!4296 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1117898 () Bool)

(declare-fun res!746564 () Bool)

(assert (=> b!1117898 (=> (not res!746564) (not e!636774))))

(assert (=> b!1117898 (= res!746564 (and (= (size!35616 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35615 _keys!1208) (size!35616 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1117899 () Bool)

(assert (=> b!1117899 (= e!636774 e!636771)))

(declare-fun res!746557 () Bool)

(assert (=> b!1117899 (=> (not res!746557) (not e!636771))))

(assert (=> b!1117899 (= res!746557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497377 mask!1564))))

(assert (=> b!1117899 (= lt!497377 (array!72854 (store (arr!35079 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35615 _keys!1208)))))

(assert (= (and start!97750 res!746560) b!1117891))

(assert (= (and b!1117891 res!746566) b!1117898))

(assert (= (and b!1117898 res!746564) b!1117890))

(assert (= (and b!1117890 res!746559) b!1117886))

(assert (= (and b!1117886 res!746563) b!1117895))

(assert (= (and b!1117895 res!746558) b!1117889))

(assert (= (and b!1117889 res!746562) b!1117896))

(assert (= (and b!1117896 res!746556) b!1117899))

(assert (= (and b!1117899 res!746557) b!1117887))

(assert (= (and b!1117887 res!746565) b!1117897))

(assert (= (and b!1117897 (not res!746561)) b!1117893))

(assert (= (and b!1117888 condMapEmpty!43789) mapIsEmpty!43789))

(assert (= (and b!1117888 (not condMapEmpty!43789)) mapNonEmpty!43789))

(get-info :version)

(assert (= (and mapNonEmpty!43789 ((_ is ValueCellFull!13281) mapValue!43789)) b!1117892))

(assert (= (and b!1117888 ((_ is ValueCellFull!13281) mapDefault!43789)) b!1117894))

(assert (= start!97750 b!1117888))

(declare-fun m!1033611 () Bool)

(assert (=> b!1117896 m!1033611))

(declare-fun m!1033613 () Bool)

(assert (=> b!1117897 m!1033613))

(declare-fun m!1033615 () Bool)

(assert (=> b!1117897 m!1033615))

(declare-fun m!1033617 () Bool)

(assert (=> b!1117893 m!1033617))

(declare-fun m!1033619 () Bool)

(assert (=> b!1117890 m!1033619))

(declare-fun m!1033621 () Bool)

(assert (=> mapNonEmpty!43789 m!1033621))

(declare-fun m!1033623 () Bool)

(assert (=> start!97750 m!1033623))

(declare-fun m!1033625 () Bool)

(assert (=> start!97750 m!1033625))

(declare-fun m!1033627 () Bool)

(assert (=> b!1117887 m!1033627))

(declare-fun m!1033629 () Bool)

(assert (=> b!1117899 m!1033629))

(declare-fun m!1033631 () Bool)

(assert (=> b!1117899 m!1033631))

(declare-fun m!1033633 () Bool)

(assert (=> b!1117886 m!1033633))

(declare-fun m!1033635 () Bool)

(assert (=> b!1117891 m!1033635))

(declare-fun m!1033637 () Bool)

(assert (=> b!1117889 m!1033637))

(check-sat (not b!1117893) (not b!1117897) (not start!97750) (not b!1117886) (not b!1117890) (not b!1117899) (not b!1117887) (not mapNonEmpty!43789) tp_is_empty!27981 (not b_next!23451) b_and!37725 (not b!1117889) (not b!1117891))
(check-sat b_and!37725 (not b_next!23451))
