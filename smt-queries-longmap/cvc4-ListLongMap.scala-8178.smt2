; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99938 () Bool)

(assert start!99938)

(declare-fun b_free!25517 () Bool)

(declare-fun b_next!25517 () Bool)

(assert (=> start!99938 (= b_free!25517 (not b_next!25517))))

(declare-fun tp!89265 () Bool)

(declare-fun b_and!41901 () Bool)

(assert (=> start!99938 (= tp!89265 b_and!41901)))

(declare-fun b!1189823 () Bool)

(declare-fun e!676446 () Bool)

(declare-fun tp_is_empty!30047 () Bool)

(assert (=> b!1189823 (= e!676446 tp_is_empty!30047)))

(declare-fun mapNonEmpty!46898 () Bool)

(declare-fun mapRes!46898 () Bool)

(declare-fun tp!89264 () Bool)

(declare-fun e!676450 () Bool)

(assert (=> mapNonEmpty!46898 (= mapRes!46898 (and tp!89264 e!676450))))

(declare-datatypes ((V!45189 0))(
  ( (V!45190 (val!15080 Int)) )
))
(declare-datatypes ((ValueCell!14314 0))(
  ( (ValueCellFull!14314 (v!17718 V!45189)) (EmptyCell!14314) )
))
(declare-fun mapRest!46898 () (Array (_ BitVec 32) ValueCell!14314))

(declare-fun mapKey!46898 () (_ BitVec 32))

(declare-datatypes ((array!76885 0))(
  ( (array!76886 (arr!37092 (Array (_ BitVec 32) ValueCell!14314)) (size!37628 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76885)

(declare-fun mapValue!46898 () ValueCell!14314)

(assert (=> mapNonEmpty!46898 (= (arr!37092 _values!996) (store mapRest!46898 mapKey!46898 mapValue!46898))))

(declare-fun res!791245 () Bool)

(declare-fun e!676448 () Bool)

(assert (=> start!99938 (=> (not res!791245) (not e!676448))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76887 0))(
  ( (array!76888 (arr!37093 (Array (_ BitVec 32) (_ BitVec 64))) (size!37629 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76887)

(assert (=> start!99938 (= res!791245 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37629 _keys!1208))))))

(assert (=> start!99938 e!676448))

(assert (=> start!99938 tp_is_empty!30047))

(declare-fun array_inv!28292 (array!76887) Bool)

(assert (=> start!99938 (array_inv!28292 _keys!1208)))

(assert (=> start!99938 true))

(assert (=> start!99938 tp!89265))

(declare-fun e!676449 () Bool)

(declare-fun array_inv!28293 (array!76885) Bool)

(assert (=> start!99938 (and (array_inv!28293 _values!996) e!676449)))

(declare-fun b!1189824 () Bool)

(assert (=> b!1189824 (= e!676450 tp_is_empty!30047)))

(declare-fun b!1189825 () Bool)

(declare-fun res!791250 () Bool)

(assert (=> b!1189825 (=> (not res!791250) (not e!676448))))

(declare-datatypes ((List!26112 0))(
  ( (Nil!26109) (Cons!26108 (h!27317 (_ BitVec 64)) (t!38621 List!26112)) )
))
(declare-fun arrayNoDuplicates!0 (array!76887 (_ BitVec 32) List!26112) Bool)

(assert (=> b!1189825 (= res!791250 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26109))))

(declare-fun b!1189826 () Bool)

(declare-fun res!791242 () Bool)

(assert (=> b!1189826 (=> (not res!791242) (not e!676448))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1189826 (= res!791242 (= (select (arr!37093 _keys!1208) i!673) k!934))))

(declare-fun b!1189827 () Bool)

(declare-fun res!791248 () Bool)

(assert (=> b!1189827 (=> (not res!791248) (not e!676448))))

(assert (=> b!1189827 (= res!791248 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37629 _keys!1208))))))

(declare-fun b!1189828 () Bool)

(declare-fun e!676445 () Bool)

(assert (=> b!1189828 (= e!676448 e!676445)))

(declare-fun res!791240 () Bool)

(assert (=> b!1189828 (=> (not res!791240) (not e!676445))))

(declare-fun lt!541213 () array!76887)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76887 (_ BitVec 32)) Bool)

(assert (=> b!1189828 (= res!791240 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!541213 mask!1564))))

(assert (=> b!1189828 (= lt!541213 (array!76888 (store (arr!37093 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37629 _keys!1208)))))

(declare-fun b!1189829 () Bool)

(assert (=> b!1189829 (= e!676449 (and e!676446 mapRes!46898))))

(declare-fun condMapEmpty!46898 () Bool)

(declare-fun mapDefault!46898 () ValueCell!14314)

