; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99886 () Bool)

(assert start!99886)

(declare-fun b_free!25465 () Bool)

(declare-fun b_next!25465 () Bool)

(assert (=> start!99886 (= b_free!25465 (not b_next!25465))))

(declare-fun tp!89109 () Bool)

(declare-fun b_and!41797 () Bool)

(assert (=> start!99886 (= tp!89109 b_and!41797)))

(declare-fun b!1188601 () Bool)

(declare-fun res!790311 () Bool)

(declare-fun e!675822 () Bool)

(assert (=> b!1188601 (=> (not res!790311) (not e!675822))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!76785 0))(
  ( (array!76786 (arr!37042 (Array (_ BitVec 32) (_ BitVec 64))) (size!37578 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76785)

(assert (=> b!1188601 (= res!790311 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37578 _keys!1208))))))

(declare-fun b!1188602 () Bool)

(declare-fun e!675819 () Bool)

(declare-fun e!675823 () Bool)

(assert (=> b!1188602 (= e!675819 (not e!675823))))

(declare-fun res!790308 () Bool)

(assert (=> b!1188602 (=> res!790308 e!675823)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1188602 (= res!790308 (bvsgt from!1455 i!673))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76785 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1188602 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39430 0))(
  ( (Unit!39431) )
))
(declare-fun lt!540745 () Unit!39430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76785 (_ BitVec 64) (_ BitVec 32)) Unit!39430)

(assert (=> b!1188602 (= lt!540745 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1188603 () Bool)

(declare-fun res!790315 () Bool)

(assert (=> b!1188603 (=> (not res!790315) (not e!675822))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1188603 (= res!790315 (validMask!0 mask!1564))))

(declare-fun b!1188604 () Bool)

(declare-fun res!790314 () Bool)

(assert (=> b!1188604 (=> (not res!790314) (not e!675822))))

(declare-datatypes ((List!26074 0))(
  ( (Nil!26071) (Cons!26070 (h!27279 (_ BitVec 64)) (t!38531 List!26074)) )
))
(declare-fun arrayNoDuplicates!0 (array!76785 (_ BitVec 32) List!26074) Bool)

(assert (=> b!1188604 (= res!790314 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26071))))

(declare-fun b!1188605 () Bool)

(declare-fun e!675824 () Bool)

(declare-fun tp_is_empty!29995 () Bool)

(assert (=> b!1188605 (= e!675824 tp_is_empty!29995)))

(declare-fun b!1188606 () Bool)

(assert (=> b!1188606 (= e!675822 e!675819)))

(declare-fun res!790313 () Bool)

(assert (=> b!1188606 (=> (not res!790313) (not e!675819))))

(declare-fun lt!540749 () array!76785)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76785 (_ BitVec 32)) Bool)

(assert (=> b!1188606 (= res!790313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!540749 mask!1564))))

(assert (=> b!1188606 (= lt!540749 (array!76786 (store (arr!37042 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37578 _keys!1208)))))

(declare-fun res!790309 () Bool)

(assert (=> start!99886 (=> (not res!790309) (not e!675822))))

(assert (=> start!99886 (= res!790309 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37578 _keys!1208))))))

(assert (=> start!99886 e!675822))

(assert (=> start!99886 tp_is_empty!29995))

(declare-fun array_inv!28258 (array!76785) Bool)

(assert (=> start!99886 (array_inv!28258 _keys!1208)))

(assert (=> start!99886 true))

(assert (=> start!99886 tp!89109))

(declare-datatypes ((V!45121 0))(
  ( (V!45122 (val!15054 Int)) )
))
(declare-datatypes ((ValueCell!14288 0))(
  ( (ValueCellFull!14288 (v!17692 V!45121)) (EmptyCell!14288) )
))
(declare-datatypes ((array!76787 0))(
  ( (array!76788 (arr!37043 (Array (_ BitVec 32) ValueCell!14288)) (size!37579 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76787)

(declare-fun e!675825 () Bool)

(declare-fun array_inv!28259 (array!76787) Bool)

(assert (=> start!99886 (and (array_inv!28259 _values!996) e!675825)))

(declare-fun b!1188607 () Bool)

(declare-fun e!675826 () Bool)

(declare-fun mapRes!46820 () Bool)

(assert (=> b!1188607 (= e!675825 (and e!675826 mapRes!46820))))

(declare-fun condMapEmpty!46820 () Bool)

(declare-fun mapDefault!46820 () ValueCell!14288)

