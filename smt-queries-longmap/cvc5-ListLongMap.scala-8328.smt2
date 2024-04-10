; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101368 () Bool)

(assert start!101368)

(declare-fun b_free!26239 () Bool)

(declare-fun b_next!26239 () Bool)

(assert (=> start!101368 (= b_free!26239 (not b_next!26239))))

(declare-fun tp!91744 () Bool)

(declare-fun b_and!43631 () Bool)

(assert (=> start!101368 (= tp!91744 b_and!43631)))

(declare-fun b!1217999 () Bool)

(declare-fun res!808882 () Bool)

(declare-fun e!691517 () Bool)

(assert (=> b!1217999 (=> (not res!808882) (not e!691517))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1217999 (= res!808882 (validMask!0 mask!1564))))

(declare-fun b!1218000 () Bool)

(declare-fun res!808873 () Bool)

(assert (=> b!1218000 (=> (not res!808873) (not e!691517))))

(declare-datatypes ((array!78661 0))(
  ( (array!78662 (arr!37963 (Array (_ BitVec 32) (_ BitVec 64))) (size!38499 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78661)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1218000 (= res!808873 (= (select (arr!37963 _keys!1208) i!673) k!934))))

(declare-fun b!1218001 () Bool)

(declare-fun e!691518 () Bool)

(declare-fun tp_is_empty!30943 () Bool)

(assert (=> b!1218001 (= e!691518 tp_is_empty!30943)))

(declare-fun b!1218002 () Bool)

(declare-fun e!691514 () Bool)

(declare-fun arrayContainsKey!0 (array!78661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1218002 (= e!691514 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1218003 () Bool)

(declare-fun e!691510 () Bool)

(assert (=> b!1218003 (= e!691510 e!691514)))

(declare-fun res!808885 () Bool)

(assert (=> b!1218003 (=> res!808885 e!691514)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1218003 (= res!808885 (not (= (select (arr!37963 _keys!1208) from!1455) k!934)))))

(declare-fun b!1218005 () Bool)

(declare-fun e!691512 () Bool)

(declare-fun e!691511 () Bool)

(assert (=> b!1218005 (= e!691512 (not e!691511))))

(declare-fun res!808872 () Bool)

(assert (=> b!1218005 (=> res!808872 e!691511)))

(assert (=> b!1218005 (= res!808872 (bvsgt from!1455 i!673))))

(assert (=> b!1218005 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!40376 0))(
  ( (Unit!40377) )
))
(declare-fun lt!553655 () Unit!40376)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!78661 (_ BitVec 64) (_ BitVec 32)) Unit!40376)

(assert (=> b!1218005 (= lt!553655 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1218006 () Bool)

(declare-fun e!691516 () Bool)

(assert (=> b!1218006 (= e!691516 true)))

(assert (=> b!1218006 e!691510))

(declare-fun res!808874 () Bool)

(assert (=> b!1218006 (=> (not res!808874) (not e!691510))))

(declare-datatypes ((V!46385 0))(
  ( (V!46386 (val!15528 Int)) )
))
(declare-datatypes ((tuple2!19972 0))(
  ( (tuple2!19973 (_1!9997 (_ BitVec 64)) (_2!9997 V!46385)) )
))
(declare-datatypes ((List!26775 0))(
  ( (Nil!26772) (Cons!26771 (h!27980 tuple2!19972) (t!39994 List!26775)) )
))
(declare-datatypes ((ListLongMap!17941 0))(
  ( (ListLongMap!17942 (toList!8986 List!26775)) )
))
(declare-fun lt!553654 () ListLongMap!17941)

(declare-datatypes ((ValueCell!14762 0))(
  ( (ValueCellFull!14762 (v!18183 V!46385)) (EmptyCell!14762) )
))
(declare-datatypes ((array!78663 0))(
  ( (array!78664 (arr!37964 (Array (_ BitVec 32) ValueCell!14762)) (size!38500 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78663)

(declare-fun lt!553659 () V!46385)

(declare-fun lt!553656 () ListLongMap!17941)

(declare-fun +!4057 (ListLongMap!17941 tuple2!19972) ListLongMap!17941)

(declare-fun get!19348 (ValueCell!14762 V!46385) V!46385)

(assert (=> b!1218006 (= res!808874 (= lt!553656 (+!4057 lt!553654 (tuple2!19973 (select (arr!37963 _keys!1208) from!1455) (get!19348 (select (arr!37964 _values!996) from!1455) lt!553659)))))))

(declare-fun mapIsEmpty!48295 () Bool)

(declare-fun mapRes!48295 () Bool)

(assert (=> mapIsEmpty!48295 mapRes!48295))

(declare-fun b!1218007 () Bool)

(declare-fun res!808877 () Bool)

(assert (=> b!1218007 (=> (not res!808877) (not e!691517))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1218007 (= res!808877 (and (= (size!38500 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38499 _keys!1208) (size!38500 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1218008 () Bool)

(declare-fun res!808876 () Bool)

(assert (=> b!1218008 (=> (not res!808876) (not e!691517))))

(assert (=> b!1218008 (= res!808876 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38499 _keys!1208))))))

(declare-fun b!1218009 () Bool)

(declare-fun res!808884 () Bool)

(assert (=> b!1218009 (=> (not res!808884) (not e!691517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78661 (_ BitVec 32)) Bool)

(assert (=> b!1218009 (= res!808884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1218010 () Bool)

(declare-fun e!691515 () Bool)

(assert (=> b!1218010 (= e!691515 tp_is_empty!30943)))

(declare-fun b!1218011 () Bool)

(declare-fun res!808883 () Bool)

(assert (=> b!1218011 (=> (not res!808883) (not e!691517))))

(declare-datatypes ((List!26776 0))(
  ( (Nil!26773) (Cons!26772 (h!27981 (_ BitVec 64)) (t!39995 List!26776)) )
))
(declare-fun arrayNoDuplicates!0 (array!78661 (_ BitVec 32) List!26776) Bool)

(assert (=> b!1218011 (= res!808883 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26773))))

(declare-fun b!1218012 () Bool)

(declare-fun e!691513 () Bool)

(assert (=> b!1218012 (= e!691513 (and e!691515 mapRes!48295))))

(declare-fun condMapEmpty!48295 () Bool)

(declare-fun mapDefault!48295 () ValueCell!14762)

