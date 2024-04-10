; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99794 () Bool)

(assert start!99794)

(declare-fun b_free!25373 () Bool)

(declare-fun b_next!25373 () Bool)

(assert (=> start!99794 (= b_free!25373 (not b_next!25373))))

(declare-fun tp!88833 () Bool)

(declare-fun b_and!41613 () Bool)

(assert (=> start!99794 (= tp!88833 b_and!41613)))

(declare-datatypes ((array!76603 0))(
  ( (array!76604 (arr!36951 (Array (_ BitVec 32) (_ BitVec 64))) (size!37487 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76603)

(declare-fun e!674243 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun b!1185849 () Bool)

(declare-fun arrayContainsKey!0 (array!76603 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1185849 (= e!674243 (arrayContainsKey!0 _keys!1208 k!934 i!673))))

(declare-fun b!1185850 () Bool)

(declare-fun res!788304 () Bool)

(declare-fun e!674250 () Bool)

(assert (=> b!1185850 (=> (not res!788304) (not e!674250))))

(declare-datatypes ((List!25996 0))(
  ( (Nil!25993) (Cons!25992 (h!27201 (_ BitVec 64)) (t!38361 List!25996)) )
))
(declare-fun arrayNoDuplicates!0 (array!76603 (_ BitVec 32) List!25996) Bool)

(assert (=> b!1185850 (= res!788304 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25993))))

(declare-fun b!1185851 () Bool)

(declare-fun e!674248 () Bool)

(assert (=> b!1185851 (= e!674248 e!674243)))

(declare-fun res!788308 () Bool)

(assert (=> b!1185851 (=> res!788308 e!674243)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1185851 (= res!788308 (not (= (select (arr!36951 _keys!1208) from!1455) k!934)))))

(declare-fun b!1185852 () Bool)

(declare-datatypes ((Unit!39295 0))(
  ( (Unit!39296) )
))
(declare-fun e!674254 () Unit!39295)

(declare-fun Unit!39297 () Unit!39295)

(assert (=> b!1185852 (= e!674254 Unit!39297)))

(declare-fun lt!538389 () Unit!39295)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76603 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39295)

(assert (=> b!1185852 (= lt!538389 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1185852 (arrayContainsKey!0 _keys!1208 k!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!538395 () Unit!39295)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76603 (_ BitVec 32) (_ BitVec 32)) Unit!39295)

(assert (=> b!1185852 (= lt!538395 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1185852 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25993)))

(declare-fun lt!538398 () Unit!39295)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76603 (_ BitVec 64) (_ BitVec 32) List!25996) Unit!39295)

(assert (=> b!1185852 (= lt!538398 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k!934 from!1455 Nil!25993))))

(assert (=> b!1185852 false))

(declare-fun res!788307 () Bool)

(assert (=> start!99794 (=> (not res!788307) (not e!674250))))

(assert (=> start!99794 (= res!788307 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37487 _keys!1208))))))

(assert (=> start!99794 e!674250))

(declare-fun tp_is_empty!29903 () Bool)

(assert (=> start!99794 tp_is_empty!29903))

(declare-fun array_inv!28198 (array!76603) Bool)

(assert (=> start!99794 (array_inv!28198 _keys!1208)))

(assert (=> start!99794 true))

(assert (=> start!99794 tp!88833))

(declare-datatypes ((V!44997 0))(
  ( (V!44998 (val!15008 Int)) )
))
(declare-datatypes ((ValueCell!14242 0))(
  ( (ValueCellFull!14242 (v!17646 V!44997)) (EmptyCell!14242) )
))
(declare-datatypes ((array!76605 0))(
  ( (array!76606 (arr!36952 (Array (_ BitVec 32) ValueCell!14242)) (size!37488 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76605)

(declare-fun e!674253 () Bool)

(declare-fun array_inv!28199 (array!76605) Bool)

(assert (=> start!99794 (and (array_inv!28199 _values!996) e!674253)))

(declare-fun b!1185853 () Bool)

(declare-fun res!788306 () Bool)

(assert (=> b!1185853 (=> (not res!788306) (not e!674250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1185853 (= res!788306 (validKeyInArray!0 k!934))))

(declare-fun b!1185854 () Bool)

(declare-fun res!788297 () Bool)

(declare-fun e!674244 () Bool)

(assert (=> b!1185854 (=> (not res!788297) (not e!674244))))

(declare-fun lt!538385 () array!76603)

(assert (=> b!1185854 (= res!788297 (arrayNoDuplicates!0 lt!538385 #b00000000000000000000000000000000 Nil!25993))))

(declare-fun b!1185855 () Bool)

(declare-fun e!674245 () Bool)

(declare-fun mapRes!46682 () Bool)

(assert (=> b!1185855 (= e!674253 (and e!674245 mapRes!46682))))

(declare-fun condMapEmpty!46682 () Bool)

(declare-fun mapDefault!46682 () ValueCell!14242)

