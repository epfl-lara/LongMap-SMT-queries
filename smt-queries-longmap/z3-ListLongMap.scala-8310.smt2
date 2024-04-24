; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101444 () Bool)

(assert start!101444)

(declare-fun b_free!26131 () Bool)

(declare-fun b_next!26131 () Bool)

(assert (=> start!101444 (= b_free!26131 (not b_next!26131))))

(declare-fun tp!91415 () Bool)

(declare-fun b_and!43381 () Bool)

(assert (=> start!101444 (= tp!91415 b_and!43381)))

(declare-fun b!1216443 () Bool)

(declare-fun e!690844 () Bool)

(declare-fun e!690842 () Bool)

(assert (=> b!1216443 (= e!690844 (not e!690842))))

(declare-fun res!807301 () Bool)

(assert (=> b!1216443 (=> res!807301 e!690842)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1216443 (= res!807301 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!78485 0))(
  ( (array!78486 (arr!37871 (Array (_ BitVec 32) (_ BitVec 64))) (size!38408 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78485)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!78485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1216443 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40266 0))(
  ( (Unit!40267) )
))
(declare-fun lt!553018 () Unit!40266)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78485 (_ BitVec 64) (_ BitVec 32)) Unit!40266)

(assert (=> b!1216443 (= lt!553018 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1216444 () Bool)

(declare-fun res!807298 () Bool)

(declare-fun e!690838 () Bool)

(assert (=> b!1216444 (=> (not res!807298) (not e!690838))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1216444 (= res!807298 (validMask!0 mask!1564))))

(declare-fun b!1216445 () Bool)

(declare-fun res!807300 () Bool)

(assert (=> b!1216445 (=> (not res!807300) (not e!690838))))

(declare-datatypes ((List!26711 0))(
  ( (Nil!26708) (Cons!26707 (h!27925 (_ BitVec 64)) (t!39814 List!26711)) )
))
(declare-fun arrayNoDuplicates!0 (array!78485 (_ BitVec 32) List!26711) Bool)

(assert (=> b!1216445 (= res!807300 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26708))))

(declare-fun b!1216446 () Bool)

(declare-fun res!807297 () Bool)

(assert (=> b!1216446 (=> (not res!807297) (not e!690838))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46241 0))(
  ( (V!46242 (val!15474 Int)) )
))
(declare-datatypes ((ValueCell!14708 0))(
  ( (ValueCellFull!14708 (v!18123 V!46241)) (EmptyCell!14708) )
))
(declare-datatypes ((array!78487 0))(
  ( (array!78488 (arr!37872 (Array (_ BitVec 32) ValueCell!14708)) (size!38409 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78487)

(assert (=> b!1216446 (= res!807297 (and (= (size!38409 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38408 _keys!1208) (size!38409 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1216447 () Bool)

(assert (=> b!1216447 (= e!690838 e!690844)))

(declare-fun res!807304 () Bool)

(assert (=> b!1216447 (=> (not res!807304) (not e!690844))))

(declare-fun lt!553017 () array!78485)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78485 (_ BitVec 32)) Bool)

(assert (=> b!1216447 (= res!807304 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!553017 mask!1564))))

(assert (=> b!1216447 (= lt!553017 (array!78486 (store (arr!37871 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38408 _keys!1208)))))

(declare-fun b!1216448 () Bool)

(declare-fun e!690843 () Bool)

(declare-fun e!690841 () Bool)

(declare-fun mapRes!48127 () Bool)

(assert (=> b!1216448 (= e!690843 (and e!690841 mapRes!48127))))

(declare-fun condMapEmpty!48127 () Bool)

(declare-fun mapDefault!48127 () ValueCell!14708)

(assert (=> b!1216448 (= condMapEmpty!48127 (= (arr!37872 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14708)) mapDefault!48127)))))

(declare-fun b!1216449 () Bool)

(declare-fun res!807299 () Bool)

(assert (=> b!1216449 (=> (not res!807299) (not e!690838))))

(assert (=> b!1216449 (= res!807299 (= (select (arr!37871 _keys!1208) i!673) k0!934))))

(declare-fun b!1216450 () Bool)

(assert (=> b!1216450 (= e!690842 true)))

(declare-fun zeroValue!944 () V!46241)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19908 0))(
  ( (tuple2!19909 (_1!9965 (_ BitVec 64)) (_2!9965 V!46241)) )
))
(declare-datatypes ((List!26712 0))(
  ( (Nil!26709) (Cons!26708 (h!27926 tuple2!19908) (t!39815 List!26712)) )
))
(declare-datatypes ((ListLongMap!17885 0))(
  ( (ListLongMap!17886 (toList!8958 List!26712)) )
))
(declare-fun lt!553019 () ListLongMap!17885)

(declare-fun minValue!944 () V!46241)

(declare-fun getCurrentListMapNoExtraKeys!5415 (array!78485 array!78487 (_ BitVec 32) (_ BitVec 32) V!46241 V!46241 (_ BitVec 32) Int) ListLongMap!17885)

(declare-fun dynLambda!3327 (Int (_ BitVec 64)) V!46241)

(assert (=> b!1216450 (= lt!553019 (getCurrentListMapNoExtraKeys!5415 lt!553017 (array!78488 (store (arr!37872 _values!996) i!673 (ValueCellFull!14708 (dynLambda!3327 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38409 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!553020 () ListLongMap!17885)

(assert (=> b!1216450 (= lt!553020 (getCurrentListMapNoExtraKeys!5415 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!48127 () Bool)

(declare-fun tp!91414 () Bool)

(declare-fun e!690839 () Bool)

(assert (=> mapNonEmpty!48127 (= mapRes!48127 (and tp!91414 e!690839))))

(declare-fun mapRest!48127 () (Array (_ BitVec 32) ValueCell!14708))

(declare-fun mapValue!48127 () ValueCell!14708)

(declare-fun mapKey!48127 () (_ BitVec 32))

(assert (=> mapNonEmpty!48127 (= (arr!37872 _values!996) (store mapRest!48127 mapKey!48127 mapValue!48127))))

(declare-fun res!807305 () Bool)

(assert (=> start!101444 (=> (not res!807305) (not e!690838))))

(assert (=> start!101444 (= res!807305 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38408 _keys!1208))))))

(assert (=> start!101444 e!690838))

(declare-fun tp_is_empty!30835 () Bool)

(assert (=> start!101444 tp_is_empty!30835))

(declare-fun array_inv!28902 (array!78485) Bool)

(assert (=> start!101444 (array_inv!28902 _keys!1208)))

(assert (=> start!101444 true))

(assert (=> start!101444 tp!91415))

(declare-fun array_inv!28903 (array!78487) Bool)

(assert (=> start!101444 (and (array_inv!28903 _values!996) e!690843)))

(declare-fun mapIsEmpty!48127 () Bool)

(assert (=> mapIsEmpty!48127 mapRes!48127))

(declare-fun b!1216451 () Bool)

(declare-fun res!807306 () Bool)

(assert (=> b!1216451 (=> (not res!807306) (not e!690838))))

(assert (=> b!1216451 (= res!807306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1216452 () Bool)

(declare-fun res!807302 () Bool)

(assert (=> b!1216452 (=> (not res!807302) (not e!690838))))

(assert (=> b!1216452 (= res!807302 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38408 _keys!1208))))))

(declare-fun b!1216453 () Bool)

(declare-fun res!807307 () Bool)

(assert (=> b!1216453 (=> (not res!807307) (not e!690844))))

(assert (=> b!1216453 (= res!807307 (arrayNoDuplicates!0 lt!553017 #b00000000000000000000000000000000 Nil!26708))))

(declare-fun b!1216454 () Bool)

(assert (=> b!1216454 (= e!690839 tp_is_empty!30835)))

(declare-fun b!1216455 () Bool)

(assert (=> b!1216455 (= e!690841 tp_is_empty!30835)))

(declare-fun b!1216456 () Bool)

(declare-fun res!807303 () Bool)

(assert (=> b!1216456 (=> (not res!807303) (not e!690838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1216456 (= res!807303 (validKeyInArray!0 k0!934))))

(assert (= (and start!101444 res!807305) b!1216444))

(assert (= (and b!1216444 res!807298) b!1216446))

(assert (= (and b!1216446 res!807297) b!1216451))

(assert (= (and b!1216451 res!807306) b!1216445))

(assert (= (and b!1216445 res!807300) b!1216452))

(assert (= (and b!1216452 res!807302) b!1216456))

(assert (= (and b!1216456 res!807303) b!1216449))

(assert (= (and b!1216449 res!807299) b!1216447))

(assert (= (and b!1216447 res!807304) b!1216453))

(assert (= (and b!1216453 res!807307) b!1216443))

(assert (= (and b!1216443 (not res!807301)) b!1216450))

(assert (= (and b!1216448 condMapEmpty!48127) mapIsEmpty!48127))

(assert (= (and b!1216448 (not condMapEmpty!48127)) mapNonEmpty!48127))

(get-info :version)

(assert (= (and mapNonEmpty!48127 ((_ is ValueCellFull!14708) mapValue!48127)) b!1216454))

(assert (= (and b!1216448 ((_ is ValueCellFull!14708) mapDefault!48127)) b!1216455))

(assert (= start!101444 b!1216448))

(declare-fun b_lambda!21801 () Bool)

(assert (=> (not b_lambda!21801) (not b!1216450)))

(declare-fun t!39813 () Bool)

(declare-fun tb!10923 () Bool)

(assert (=> (and start!101444 (= defaultEntry!1004 defaultEntry!1004) t!39813) tb!10923))

(declare-fun result!22451 () Bool)

(assert (=> tb!10923 (= result!22451 tp_is_empty!30835)))

(assert (=> b!1216450 t!39813))

(declare-fun b_and!43383 () Bool)

(assert (= b_and!43381 (and (=> t!39813 result!22451) b_and!43383)))

(declare-fun m!1121781 () Bool)

(assert (=> b!1216444 m!1121781))

(declare-fun m!1121783 () Bool)

(assert (=> b!1216443 m!1121783))

(declare-fun m!1121785 () Bool)

(assert (=> b!1216443 m!1121785))

(declare-fun m!1121787 () Bool)

(assert (=> b!1216451 m!1121787))

(declare-fun m!1121789 () Bool)

(assert (=> b!1216447 m!1121789))

(declare-fun m!1121791 () Bool)

(assert (=> b!1216447 m!1121791))

(declare-fun m!1121793 () Bool)

(assert (=> b!1216456 m!1121793))

(declare-fun m!1121795 () Bool)

(assert (=> b!1216445 m!1121795))

(declare-fun m!1121797 () Bool)

(assert (=> mapNonEmpty!48127 m!1121797))

(declare-fun m!1121799 () Bool)

(assert (=> b!1216450 m!1121799))

(declare-fun m!1121801 () Bool)

(assert (=> b!1216450 m!1121801))

(declare-fun m!1121803 () Bool)

(assert (=> b!1216450 m!1121803))

(declare-fun m!1121805 () Bool)

(assert (=> b!1216450 m!1121805))

(declare-fun m!1121807 () Bool)

(assert (=> b!1216453 m!1121807))

(declare-fun m!1121809 () Bool)

(assert (=> b!1216449 m!1121809))

(declare-fun m!1121811 () Bool)

(assert (=> start!101444 m!1121811))

(declare-fun m!1121813 () Bool)

(assert (=> start!101444 m!1121813))

(check-sat (not b!1216453) b_and!43383 (not mapNonEmpty!48127) (not b_next!26131) (not b!1216443) (not b!1216445) (not b!1216447) (not b!1216456) (not b!1216451) (not b_lambda!21801) (not b!1216444) (not b!1216450) tp_is_empty!30835 (not start!101444))
(check-sat b_and!43383 (not b_next!26131))
