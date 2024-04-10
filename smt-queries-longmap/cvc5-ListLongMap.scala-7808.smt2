; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97592 () Bool)

(assert start!97592)

(declare-fun b!1114782 () Bool)

(declare-fun res!744168 () Bool)

(declare-fun e!635330 () Bool)

(assert (=> b!1114782 (=> (not res!744168) (not e!635330))))

(declare-datatypes ((array!72551 0))(
  ( (array!72552 (arr!34928 (Array (_ BitVec 32) (_ BitVec 64))) (size!35464 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72551)

(declare-datatypes ((List!24335 0))(
  ( (Nil!24332) (Cons!24331 (h!25540 (_ BitVec 64)) (t!34816 List!24335)) )
))
(declare-fun arrayNoDuplicates!0 (array!72551 (_ BitVec 32) List!24335) Bool)

(assert (=> b!1114782 (= res!744168 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24332))))

(declare-fun b!1114783 () Bool)

(declare-fun e!635327 () Bool)

(declare-fun tp_is_empty!27823 () Bool)

(assert (=> b!1114783 (= e!635327 tp_is_empty!27823)))

(declare-fun mapNonEmpty!43552 () Bool)

(declare-fun mapRes!43552 () Bool)

(declare-fun tp!82796 () Bool)

(assert (=> mapNonEmpty!43552 (= mapRes!43552 (and tp!82796 e!635327))))

(declare-datatypes ((V!42225 0))(
  ( (V!42226 (val!13968 Int)) )
))
(declare-datatypes ((ValueCell!13202 0))(
  ( (ValueCellFull!13202 (v!16601 V!42225)) (EmptyCell!13202) )
))
(declare-fun mapRest!43552 () (Array (_ BitVec 32) ValueCell!13202))

(declare-fun mapValue!43552 () ValueCell!13202)

(declare-fun mapKey!43552 () (_ BitVec 32))

(declare-datatypes ((array!72553 0))(
  ( (array!72554 (arr!34929 (Array (_ BitVec 32) ValueCell!13202)) (size!35465 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72553)

(assert (=> mapNonEmpty!43552 (= (arr!34929 _values!996) (store mapRest!43552 mapKey!43552 mapValue!43552))))

(declare-fun b!1114784 () Bool)

(declare-fun e!635331 () Bool)

(assert (=> b!1114784 (= e!635331 (not true))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114784 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36586 0))(
  ( (Unit!36587) )
))
(declare-fun lt!496879 () Unit!36586)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72551 (_ BitVec 64) (_ BitVec 32)) Unit!36586)

(assert (=> b!1114784 (= lt!496879 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1114785 () Bool)

(declare-fun res!744170 () Bool)

(assert (=> b!1114785 (=> (not res!744170) (not e!635331))))

(declare-fun lt!496880 () array!72551)

(assert (=> b!1114785 (= res!744170 (arrayNoDuplicates!0 lt!496880 #b00000000000000000000000000000000 Nil!24332))))

(declare-fun b!1114786 () Bool)

(declare-fun res!744169 () Bool)

(assert (=> b!1114786 (=> (not res!744169) (not e!635330))))

(assert (=> b!1114786 (= res!744169 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35464 _keys!1208))))))

(declare-fun b!1114787 () Bool)

(declare-fun res!744166 () Bool)

(assert (=> b!1114787 (=> (not res!744166) (not e!635330))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114787 (= res!744166 (validKeyInArray!0 k!934))))

(declare-fun res!744163 () Bool)

(assert (=> start!97592 (=> (not res!744163) (not e!635330))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97592 (= res!744163 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35464 _keys!1208))))))

(assert (=> start!97592 e!635330))

(declare-fun array_inv!26850 (array!72551) Bool)

(assert (=> start!97592 (array_inv!26850 _keys!1208)))

(assert (=> start!97592 true))

(declare-fun e!635329 () Bool)

(declare-fun array_inv!26851 (array!72553) Bool)

(assert (=> start!97592 (and (array_inv!26851 _values!996) e!635329)))

(declare-fun b!1114788 () Bool)

(declare-fun e!635328 () Bool)

(assert (=> b!1114788 (= e!635328 tp_is_empty!27823)))

(declare-fun b!1114789 () Bool)

(declare-fun res!744172 () Bool)

(assert (=> b!1114789 (=> (not res!744172) (not e!635330))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114789 (= res!744172 (and (= (size!35465 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35464 _keys!1208) (size!35465 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114790 () Bool)

(declare-fun res!744171 () Bool)

(assert (=> b!1114790 (=> (not res!744171) (not e!635330))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114790 (= res!744171 (validMask!0 mask!1564))))

(declare-fun b!1114791 () Bool)

(assert (=> b!1114791 (= e!635329 (and e!635328 mapRes!43552))))

(declare-fun condMapEmpty!43552 () Bool)

(declare-fun mapDefault!43552 () ValueCell!13202)

