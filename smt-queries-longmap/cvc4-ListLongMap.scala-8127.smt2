; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99632 () Bool)

(assert start!99632)

(declare-fun b_free!25211 () Bool)

(declare-fun b_next!25211 () Bool)

(assert (=> start!99632 (= b_free!25211 (not b_next!25211))))

(declare-fun tp!88347 () Bool)

(declare-fun b_and!41289 () Bool)

(assert (=> start!99632 (= tp!88347 b_and!41289)))

(declare-fun b!1180753 () Bool)

(declare-fun res!784589 () Bool)

(declare-fun e!671296 () Bool)

(assert (=> b!1180753 (=> (not res!784589) (not e!671296))))

(declare-datatypes ((array!76285 0))(
  ( (array!76286 (arr!36792 (Array (_ BitVec 32) (_ BitVec 64))) (size!37328 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76285)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44781 0))(
  ( (V!44782 (val!14927 Int)) )
))
(declare-datatypes ((ValueCell!14161 0))(
  ( (ValueCellFull!14161 (v!17565 V!44781)) (EmptyCell!14161) )
))
(declare-datatypes ((array!76287 0))(
  ( (array!76288 (arr!36793 (Array (_ BitVec 32) ValueCell!14161)) (size!37329 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76287)

(assert (=> b!1180753 (= res!784589 (and (= (size!37329 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37328 _keys!1208) (size!37329 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1180754 () Bool)

(declare-fun res!784585 () Bool)

(assert (=> b!1180754 (=> (not res!784585) (not e!671296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76285 (_ BitVec 32)) Bool)

(assert (=> b!1180754 (= res!784585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1180755 () Bool)

(declare-fun e!671297 () Bool)

(declare-fun tp_is_empty!29741 () Bool)

(assert (=> b!1180755 (= e!671297 tp_is_empty!29741)))

(declare-fun b!1180756 () Bool)

(declare-datatypes ((Unit!39037 0))(
  ( (Unit!39038) )
))
(declare-fun e!671299 () Unit!39037)

(declare-fun Unit!39039 () Unit!39037)

(assert (=> b!1180756 (= e!671299 Unit!39039)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!533928 () Unit!39037)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76285 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39037)

(assert (=> b!1180756 (= lt!533928 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1180756 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!533918 () Unit!39037)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76285 (_ BitVec 32) (_ BitVec 32)) Unit!39037)

(assert (=> b!1180756 (= lt!533918 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25857 0))(
  ( (Nil!25854) (Cons!25853 (h!27062 (_ BitVec 64)) (t!38060 List!25857)) )
))
(declare-fun arrayNoDuplicates!0 (array!76285 (_ BitVec 32) List!25857) Bool)

(assert (=> b!1180756 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25854)))

(declare-fun lt!533914 () Unit!39037)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76285 (_ BitVec 64) (_ BitVec 32) List!25857) Unit!39037)

(assert (=> b!1180756 (= lt!533914 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25854))))

(assert (=> b!1180756 false))

(declare-fun b!1180757 () Bool)

(declare-fun Unit!39040 () Unit!39037)

(assert (=> b!1180757 (= e!671299 Unit!39040)))

(declare-fun res!784577 () Bool)

(assert (=> start!99632 (=> (not res!784577) (not e!671296))))

(assert (=> start!99632 (= res!784577 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37328 _keys!1208))))))

(assert (=> start!99632 e!671296))

(assert (=> start!99632 tp_is_empty!29741))

(declare-fun array_inv!28092 (array!76285) Bool)

(assert (=> start!99632 (array_inv!28092 _keys!1208)))

(assert (=> start!99632 true))

(assert (=> start!99632 tp!88347))

(declare-fun e!671291 () Bool)

(declare-fun array_inv!28093 (array!76287) Bool)

(assert (=> start!99632 (and (array_inv!28093 _values!996) e!671291)))

(declare-fun b!1180758 () Bool)

(declare-fun mapRes!46439 () Bool)

(assert (=> b!1180758 (= e!671291 (and e!671297 mapRes!46439))))

(declare-fun condMapEmpty!46439 () Bool)

(declare-fun mapDefault!46439 () ValueCell!14161)

