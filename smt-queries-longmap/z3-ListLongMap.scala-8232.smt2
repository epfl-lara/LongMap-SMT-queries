; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100302 () Bool)

(assert start!100302)

(declare-fun b_free!25689 () Bool)

(declare-fun b_next!25689 () Bool)

(assert (=> start!100302 (= b_free!25689 (not b_next!25689))))

(declare-fun tp!90014 () Bool)

(declare-fun b_and!42245 () Bool)

(assert (=> start!100302 (= tp!90014 b_and!42245)))

(declare-fun b!1196813 () Bool)

(declare-fun res!796492 () Bool)

(declare-fun e!679946 () Bool)

(assert (=> b!1196813 (=> (not res!796492) (not e!679946))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1196813 (= res!796492 (validKeyInArray!0 k0!934))))

(declare-fun b!1196814 () Bool)

(declare-fun e!679951 () Bool)

(assert (=> b!1196814 (= e!679951 true)))

(declare-fun e!679944 () Bool)

(assert (=> b!1196814 e!679944))

(declare-fun c!117348 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1196814 (= c!117348 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!45619 0))(
  ( (V!45620 (val!15241 Int)) )
))
(declare-fun zeroValue!944 () V!45619)

(declare-datatypes ((array!77517 0))(
  ( (array!77518 (arr!37405 (Array (_ BitVec 32) (_ BitVec 64))) (size!37941 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77517)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((Unit!39686 0))(
  ( (Unit!39687) )
))
(declare-fun lt!543147 () Unit!39686)

(declare-datatypes ((ValueCell!14475 0))(
  ( (ValueCellFull!14475 (v!17879 V!45619)) (EmptyCell!14475) )
))
(declare-datatypes ((array!77519 0))(
  ( (array!77520 (arr!37406 (Array (_ BitVec 32) ValueCell!14475)) (size!37942 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77519)

(declare-fun minValue!944 () V!45619)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!981 (array!77517 array!77519 (_ BitVec 32) (_ BitVec 32) V!45619 V!45619 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39686)

(assert (=> b!1196814 (= lt!543147 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!981 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196815 () Bool)

(declare-fun res!796499 () Bool)

(declare-fun e!679945 () Bool)

(assert (=> b!1196815 (=> (not res!796499) (not e!679945))))

(declare-fun lt!543145 () array!77517)

(declare-datatypes ((List!26314 0))(
  ( (Nil!26311) (Cons!26310 (h!27519 (_ BitVec 64)) (t!38995 List!26314)) )
))
(declare-fun arrayNoDuplicates!0 (array!77517 (_ BitVec 32) List!26314) Bool)

(assert (=> b!1196815 (= res!796499 (arrayNoDuplicates!0 lt!543145 #b00000000000000000000000000000000 Nil!26311))))

(declare-fun b!1196817 () Bool)

(declare-datatypes ((tuple2!19504 0))(
  ( (tuple2!19505 (_1!9763 (_ BitVec 64)) (_2!9763 V!45619)) )
))
(declare-datatypes ((List!26315 0))(
  ( (Nil!26312) (Cons!26311 (h!27520 tuple2!19504) (t!38996 List!26315)) )
))
(declare-datatypes ((ListLongMap!17473 0))(
  ( (ListLongMap!17474 (toList!8752 List!26315)) )
))
(declare-fun call!57188 () ListLongMap!17473)

(declare-fun call!57189 () ListLongMap!17473)

(declare-fun -!1772 (ListLongMap!17473 (_ BitVec 64)) ListLongMap!17473)

(assert (=> b!1196817 (= e!679944 (= call!57189 (-!1772 call!57188 k0!934)))))

(declare-fun b!1196818 () Bool)

(declare-fun e!679947 () Bool)

(declare-fun e!679949 () Bool)

(declare-fun mapRes!47390 () Bool)

(assert (=> b!1196818 (= e!679947 (and e!679949 mapRes!47390))))

(declare-fun condMapEmpty!47390 () Bool)

(declare-fun mapDefault!47390 () ValueCell!14475)

(assert (=> b!1196818 (= condMapEmpty!47390 (= (arr!37406 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14475)) mapDefault!47390)))))

(declare-fun b!1196819 () Bool)

(declare-fun tp_is_empty!30369 () Bool)

(assert (=> b!1196819 (= e!679949 tp_is_empty!30369)))

(declare-fun mapNonEmpty!47390 () Bool)

(declare-fun tp!90015 () Bool)

(declare-fun e!679948 () Bool)

(assert (=> mapNonEmpty!47390 (= mapRes!47390 (and tp!90015 e!679948))))

(declare-fun mapValue!47390 () ValueCell!14475)

(declare-fun mapKey!47390 () (_ BitVec 32))

(declare-fun mapRest!47390 () (Array (_ BitVec 32) ValueCell!14475))

(assert (=> mapNonEmpty!47390 (= (arr!37406 _values!996) (store mapRest!47390 mapKey!47390 mapValue!47390))))

(declare-fun b!1196820 () Bool)

(declare-fun res!796493 () Bool)

(assert (=> b!1196820 (=> (not res!796493) (not e!679946))))

(assert (=> b!1196820 (= res!796493 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37941 _keys!1208))))))

(declare-fun b!1196821 () Bool)

(assert (=> b!1196821 (= e!679946 e!679945)))

(declare-fun res!796494 () Bool)

(assert (=> b!1196821 (=> (not res!796494) (not e!679945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77517 (_ BitVec 32)) Bool)

(assert (=> b!1196821 (= res!796494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543145 mask!1564))))

(assert (=> b!1196821 (= lt!543145 (array!77518 (store (arr!37405 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37941 _keys!1208)))))

(declare-fun b!1196822 () Bool)

(assert (=> b!1196822 (= e!679944 (= call!57189 call!57188))))

(declare-fun b!1196823 () Bool)

(declare-fun res!796496 () Bool)

(assert (=> b!1196823 (=> (not res!796496) (not e!679946))))

(assert (=> b!1196823 (= res!796496 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26311))))

(declare-fun b!1196816 () Bool)

(declare-fun res!796501 () Bool)

(assert (=> b!1196816 (=> (not res!796501) (not e!679946))))

(assert (=> b!1196816 (= res!796501 (= (select (arr!37405 _keys!1208) i!673) k0!934))))

(declare-fun res!796498 () Bool)

(assert (=> start!100302 (=> (not res!796498) (not e!679946))))

(assert (=> start!100302 (= res!796498 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37941 _keys!1208))))))

(assert (=> start!100302 e!679946))

(assert (=> start!100302 tp_is_empty!30369))

(declare-fun array_inv!28508 (array!77517) Bool)

(assert (=> start!100302 (array_inv!28508 _keys!1208)))

(assert (=> start!100302 true))

(assert (=> start!100302 tp!90014))

(declare-fun array_inv!28509 (array!77519) Bool)

(assert (=> start!100302 (and (array_inv!28509 _values!996) e!679947)))

(declare-fun b!1196824 () Bool)

(declare-fun res!796495 () Bool)

(assert (=> b!1196824 (=> (not res!796495) (not e!679946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1196824 (= res!796495 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!47390 () Bool)

(assert (=> mapIsEmpty!47390 mapRes!47390))

(declare-fun b!1196825 () Bool)

(assert (=> b!1196825 (= e!679945 (not e!679951))))

(declare-fun res!796497 () Bool)

(assert (=> b!1196825 (=> res!796497 e!679951)))

(assert (=> b!1196825 (= res!796497 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!37941 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!77517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1196825 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!543146 () Unit!39686)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77517 (_ BitVec 64) (_ BitVec 32)) Unit!39686)

(assert (=> b!1196825 (= lt!543146 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1196826 () Bool)

(declare-fun res!796491 () Bool)

(assert (=> b!1196826 (=> (not res!796491) (not e!679946))))

(assert (=> b!1196826 (= res!796491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun bm!57185 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!5192 (array!77517 array!77519 (_ BitVec 32) (_ BitVec 32) V!45619 V!45619 (_ BitVec 32) Int) ListLongMap!17473)

(declare-fun dynLambda!3119 (Int (_ BitVec 64)) V!45619)

(assert (=> bm!57185 (= call!57189 (getCurrentListMapNoExtraKeys!5192 lt!543145 (array!77520 (store (arr!37406 _values!996) i!673 (ValueCellFull!14475 (dynLambda!3119 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!37942 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196827 () Bool)

(assert (=> b!1196827 (= e!679948 tp_is_empty!30369)))

(declare-fun bm!57186 () Bool)

(assert (=> bm!57186 (= call!57188 (getCurrentListMapNoExtraKeys!5192 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1196828 () Bool)

(declare-fun res!796500 () Bool)

(assert (=> b!1196828 (=> (not res!796500) (not e!679946))))

(assert (=> b!1196828 (= res!796500 (and (= (size!37942 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37941 _keys!1208) (size!37942 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!100302 res!796498) b!1196824))

(assert (= (and b!1196824 res!796495) b!1196828))

(assert (= (and b!1196828 res!796500) b!1196826))

(assert (= (and b!1196826 res!796491) b!1196823))

(assert (= (and b!1196823 res!796496) b!1196820))

(assert (= (and b!1196820 res!796493) b!1196813))

(assert (= (and b!1196813 res!796492) b!1196816))

(assert (= (and b!1196816 res!796501) b!1196821))

(assert (= (and b!1196821 res!796494) b!1196815))

(assert (= (and b!1196815 res!796499) b!1196825))

(assert (= (and b!1196825 (not res!796497)) b!1196814))

(assert (= (and b!1196814 c!117348) b!1196817))

(assert (= (and b!1196814 (not c!117348)) b!1196822))

(assert (= (or b!1196817 b!1196822) bm!57185))

(assert (= (or b!1196817 b!1196822) bm!57186))

(assert (= (and b!1196818 condMapEmpty!47390) mapIsEmpty!47390))

(assert (= (and b!1196818 (not condMapEmpty!47390)) mapNonEmpty!47390))

(get-info :version)

(assert (= (and mapNonEmpty!47390 ((_ is ValueCellFull!14475) mapValue!47390)) b!1196827))

(assert (= (and b!1196818 ((_ is ValueCellFull!14475) mapDefault!47390)) b!1196819))

(assert (= start!100302 b!1196818))

(declare-fun b_lambda!20833 () Bool)

(assert (=> (not b_lambda!20833) (not bm!57185)))

(declare-fun t!38994 () Bool)

(declare-fun tb!10501 () Bool)

(assert (=> (and start!100302 (= defaultEntry!1004 defaultEntry!1004) t!38994) tb!10501))

(declare-fun result!21575 () Bool)

(assert (=> tb!10501 (= result!21575 tp_is_empty!30369)))

(assert (=> bm!57185 t!38994))

(declare-fun b_and!42247 () Bool)

(assert (= b_and!42245 (and (=> t!38994 result!21575) b_and!42247)))

(declare-fun m!1103939 () Bool)

(assert (=> bm!57186 m!1103939))

(declare-fun m!1103941 () Bool)

(assert (=> b!1196816 m!1103941))

(declare-fun m!1103943 () Bool)

(assert (=> b!1196817 m!1103943))

(declare-fun m!1103945 () Bool)

(assert (=> b!1196813 m!1103945))

(declare-fun m!1103947 () Bool)

(assert (=> bm!57185 m!1103947))

(declare-fun m!1103949 () Bool)

(assert (=> bm!57185 m!1103949))

(declare-fun m!1103951 () Bool)

(assert (=> bm!57185 m!1103951))

(declare-fun m!1103953 () Bool)

(assert (=> mapNonEmpty!47390 m!1103953))

(declare-fun m!1103955 () Bool)

(assert (=> b!1196821 m!1103955))

(declare-fun m!1103957 () Bool)

(assert (=> b!1196821 m!1103957))

(declare-fun m!1103959 () Bool)

(assert (=> b!1196815 m!1103959))

(declare-fun m!1103961 () Bool)

(assert (=> b!1196824 m!1103961))

(declare-fun m!1103963 () Bool)

(assert (=> start!100302 m!1103963))

(declare-fun m!1103965 () Bool)

(assert (=> start!100302 m!1103965))

(declare-fun m!1103967 () Bool)

(assert (=> b!1196814 m!1103967))

(declare-fun m!1103969 () Bool)

(assert (=> b!1196826 m!1103969))

(declare-fun m!1103971 () Bool)

(assert (=> b!1196823 m!1103971))

(declare-fun m!1103973 () Bool)

(assert (=> b!1196825 m!1103973))

(declare-fun m!1103975 () Bool)

(assert (=> b!1196825 m!1103975))

(check-sat (not b!1196823) (not b_lambda!20833) (not mapNonEmpty!47390) (not start!100302) (not b_next!25689) (not b!1196815) b_and!42247 (not bm!57185) (not b!1196821) (not b!1196826) (not b!1196814) (not b!1196824) (not b!1196825) (not b!1196817) (not bm!57186) (not b!1196813) tp_is_empty!30369)
(check-sat b_and!42247 (not b_next!25689))
