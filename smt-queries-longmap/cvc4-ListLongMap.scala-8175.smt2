; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99920 () Bool)

(assert start!99920)

(declare-fun b_free!25499 () Bool)

(declare-fun b_next!25499 () Bool)

(assert (=> start!99920 (= b_free!25499 (not b_next!25499))))

(declare-fun tp!89211 () Bool)

(declare-fun b_and!41865 () Bool)

(assert (=> start!99920 (= tp!89211 b_and!41865)))

(declare-fun b!1189400 () Bool)

(declare-fun res!790919 () Bool)

(declare-fun e!676231 () Bool)

(assert (=> b!1189400 (=> (not res!790919) (not e!676231))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1189400 (= res!790919 (validMask!0 mask!1564))))

(declare-fun res!790921 () Bool)

(assert (=> start!99920 (=> (not res!790921) (not e!676231))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76853 0))(
  ( (array!76854 (arr!37076 (Array (_ BitVec 32) (_ BitVec 64))) (size!37612 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76853)

(assert (=> start!99920 (= res!790921 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37612 _keys!1208))))))

(assert (=> start!99920 e!676231))

(declare-fun tp_is_empty!30029 () Bool)

(assert (=> start!99920 tp_is_empty!30029))

(declare-fun array_inv!28280 (array!76853) Bool)

(assert (=> start!99920 (array_inv!28280 _keys!1208)))

(assert (=> start!99920 true))

(assert (=> start!99920 tp!89211))

(declare-datatypes ((V!45165 0))(
  ( (V!45166 (val!15071 Int)) )
))
(declare-datatypes ((ValueCell!14305 0))(
  ( (ValueCellFull!14305 (v!17709 V!45165)) (EmptyCell!14305) )
))
(declare-datatypes ((array!76855 0))(
  ( (array!76856 (arr!37077 (Array (_ BitVec 32) ValueCell!14305)) (size!37613 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76855)

(declare-fun e!676234 () Bool)

(declare-fun array_inv!28281 (array!76855) Bool)

(assert (=> start!99920 (and (array_inv!28281 _values!996) e!676234)))

(declare-fun b!1189401 () Bool)

(declare-fun e!676229 () Bool)

(assert (=> b!1189401 (= e!676231 e!676229)))

(declare-fun res!790918 () Bool)

(assert (=> b!1189401 (=> (not res!790918) (not e!676229))))

(declare-fun lt!541052 () array!76853)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76853 (_ BitVec 32)) Bool)

(assert (=> b!1189401 (= res!790918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541052 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1189401 (= lt!541052 (array!76854 (store (arr!37076 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37612 _keys!1208)))))

(declare-fun b!1189402 () Bool)

(declare-fun e!676233 () Bool)

(assert (=> b!1189402 (= e!676229 (not e!676233))))

(declare-fun res!790925 () Bool)

(assert (=> b!1189402 (=> res!790925 e!676233)))

(assert (=> b!1189402 (= res!790925 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76853 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1189402 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39456 0))(
  ( (Unit!39457) )
))
(declare-fun lt!541053 () Unit!39456)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76853 (_ BitVec 64) (_ BitVec 32)) Unit!39456)

(assert (=> b!1189402 (= lt!541053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1189403 () Bool)

(declare-fun res!790916 () Bool)

(assert (=> b!1189403 (=> (not res!790916) (not e!676231))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1189403 (= res!790916 (and (= (size!37613 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37612 _keys!1208) (size!37613 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1189404 () Bool)

(declare-fun res!790926 () Bool)

(assert (=> b!1189404 (=> (not res!790926) (not e!676231))))

(assert (=> b!1189404 (= res!790926 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37612 _keys!1208))))))

(declare-fun b!1189405 () Bool)

(declare-fun e!676232 () Bool)

(declare-fun mapRes!46871 () Bool)

(assert (=> b!1189405 (= e!676234 (and e!676232 mapRes!46871))))

(declare-fun condMapEmpty!46871 () Bool)

(declare-fun mapDefault!46871 () ValueCell!14305)

