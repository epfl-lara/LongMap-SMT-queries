; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99560 () Bool)

(assert start!99560)

(declare-fun b_free!25139 () Bool)

(declare-fun b_next!25139 () Bool)

(assert (=> start!99560 (= b_free!25139 (not b_next!25139))))

(declare-fun tp!88130 () Bool)

(declare-fun b_and!41145 () Bool)

(assert (=> start!99560 (= tp!88130 b_and!41145)))

(declare-fun b!1178360 () Bool)

(declare-fun res!782794 () Bool)

(declare-fun e!669896 () Bool)

(assert (=> b!1178360 (=> (not res!782794) (not e!669896))))

(declare-datatypes ((array!76141 0))(
  ( (array!76142 (arr!36720 (Array (_ BitVec 32) (_ BitVec 64))) (size!37256 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76141)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44685 0))(
  ( (V!44686 (val!14891 Int)) )
))
(declare-datatypes ((ValueCell!14125 0))(
  ( (ValueCellFull!14125 (v!17529 V!44685)) (EmptyCell!14125) )
))
(declare-datatypes ((array!76143 0))(
  ( (array!76144 (arr!36721 (Array (_ BitVec 32) ValueCell!14125)) (size!37257 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76143)

(assert (=> b!1178360 (= res!782794 (and (= (size!37257 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37256 _keys!1208) (size!37257 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178361 () Bool)

(declare-fun e!669887 () Bool)

(declare-fun tp_is_empty!29669 () Bool)

(assert (=> b!1178361 (= e!669887 tp_is_empty!29669)))

(declare-fun b!1178363 () Bool)

(declare-fun res!782797 () Bool)

(assert (=> b!1178363 (=> (not res!782797) (not e!669896))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178363 (= res!782797 (validKeyInArray!0 k!934))))

(declare-fun b!1178364 () Bool)

(declare-datatypes ((Unit!38919 0))(
  ( (Unit!38920) )
))
(declare-fun e!669891 () Unit!38919)

(declare-fun Unit!38921 () Unit!38919)

(assert (=> b!1178364 (= e!669891 Unit!38921)))

(declare-fun b!1178365 () Bool)

(declare-fun e!669888 () Bool)

(declare-fun e!669893 () Bool)

(assert (=> b!1178365 (= e!669888 e!669893)))

(declare-fun res!782804 () Bool)

(assert (=> b!1178365 (=> res!782804 e!669893)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1178365 (= res!782804 (not (= (select (arr!36720 _keys!1208) from!1455) k!934)))))

(declare-fun b!1178366 () Bool)

(declare-fun e!669897 () Bool)

(declare-fun e!669890 () Bool)

(assert (=> b!1178366 (= e!669897 (not e!669890))))

(declare-fun res!782802 () Bool)

(assert (=> b!1178366 (=> res!782802 e!669890)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178366 (= res!782802 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178366 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!532301 () Unit!38919)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76141 (_ BitVec 64) (_ BitVec 32)) Unit!38919)

(assert (=> b!1178366 (= lt!532301 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1178367 () Bool)

(declare-fun res!782801 () Bool)

(assert (=> b!1178367 (=> (not res!782801) (not e!669896))))

(assert (=> b!1178367 (= res!782801 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37256 _keys!1208))))))

(declare-fun b!1178368 () Bool)

(declare-fun e!669898 () Bool)

(assert (=> b!1178368 (= e!669898 true)))

(declare-fun e!669894 () Bool)

(assert (=> b!1178368 e!669894))

(declare-fun res!782808 () Bool)

(assert (=> b!1178368 (=> (not res!782808) (not e!669894))))

(assert (=> b!1178368 (= res!782808 (not (= (select (arr!36720 _keys!1208) from!1455) k!934)))))

(declare-fun lt!532302 () Unit!38919)

(assert (=> b!1178368 (= lt!532302 e!669891)))

(declare-fun c!116832 () Bool)

(assert (=> b!1178368 (= c!116832 (= (select (arr!36720 _keys!1208) from!1455) k!934))))

(assert (=> b!1178368 e!669888))

(declare-fun res!782798 () Bool)

(assert (=> b!1178368 (=> (not res!782798) (not e!669888))))

(declare-datatypes ((tuple2!19052 0))(
  ( (tuple2!19053 (_1!9537 (_ BitVec 64)) (_2!9537 V!44685)) )
))
(declare-datatypes ((List!25790 0))(
  ( (Nil!25787) (Cons!25786 (h!26995 tuple2!19052) (t!37921 List!25790)) )
))
(declare-datatypes ((ListLongMap!17021 0))(
  ( (ListLongMap!17022 (toList!8526 List!25790)) )
))
(declare-fun lt!532295 () ListLongMap!17021)

(declare-fun lt!532300 () tuple2!19052)

(declare-fun lt!532304 () ListLongMap!17021)

(declare-fun +!3840 (ListLongMap!17021 tuple2!19052) ListLongMap!17021)

(assert (=> b!1178368 (= res!782798 (= lt!532295 (+!3840 lt!532304 lt!532300)))))

(declare-fun lt!532298 () V!44685)

(declare-fun get!18766 (ValueCell!14125 V!44685) V!44685)

(assert (=> b!1178368 (= lt!532300 (tuple2!19053 (select (arr!36720 _keys!1208) from!1455) (get!18766 (select (arr!36721 _values!996) from!1455) lt!532298)))))

(declare-fun mapNonEmpty!46331 () Bool)

(declare-fun mapRes!46331 () Bool)

(declare-fun tp!88131 () Bool)

(assert (=> mapNonEmpty!46331 (= mapRes!46331 (and tp!88131 e!669887))))

(declare-fun mapRest!46331 () (Array (_ BitVec 32) ValueCell!14125))

(declare-fun mapValue!46331 () ValueCell!14125)

(declare-fun mapKey!46331 () (_ BitVec 32))

(assert (=> mapNonEmpty!46331 (= (arr!36721 _values!996) (store mapRest!46331 mapKey!46331 mapValue!46331))))

(declare-fun b!1178369 () Bool)

(assert (=> b!1178369 (= e!669893 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun res!782796 () Bool)

(assert (=> start!99560 (=> (not res!782796) (not e!669896))))

(assert (=> start!99560 (= res!782796 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37256 _keys!1208))))))

(assert (=> start!99560 e!669896))

(assert (=> start!99560 tp_is_empty!29669))

(declare-fun array_inv!28038 (array!76141) Bool)

(assert (=> start!99560 (array_inv!28038 _keys!1208)))

(assert (=> start!99560 true))

(assert (=> start!99560 tp!88130))

(declare-fun e!669892 () Bool)

(declare-fun array_inv!28039 (array!76143) Bool)

(assert (=> start!99560 (and (array_inv!28039 _values!996) e!669892)))

(declare-fun b!1178362 () Bool)

(declare-fun e!669889 () Bool)

(assert (=> b!1178362 (= e!669889 tp_is_empty!29669)))

(declare-fun lt!532294 () ListLongMap!17021)

(declare-fun lt!532307 () ListLongMap!17021)

(declare-fun b!1178370 () Bool)

(assert (=> b!1178370 (= e!669894 (= lt!532307 (+!3840 lt!532294 lt!532300)))))

(declare-fun b!1178371 () Bool)

(declare-fun res!782807 () Bool)

(assert (=> b!1178371 (=> (not res!782807) (not e!669896))))

(declare-datatypes ((List!25791 0))(
  ( (Nil!25788) (Cons!25787 (h!26996 (_ BitVec 64)) (t!37922 List!25791)) )
))
(declare-fun arrayNoDuplicates!0 (array!76141 (_ BitVec 32) List!25791) Bool)

(assert (=> b!1178371 (= res!782807 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25788))))

(declare-fun b!1178372 () Bool)

(assert (=> b!1178372 (= e!669892 (and e!669889 mapRes!46331))))

(declare-fun condMapEmpty!46331 () Bool)

(declare-fun mapDefault!46331 () ValueCell!14125)

