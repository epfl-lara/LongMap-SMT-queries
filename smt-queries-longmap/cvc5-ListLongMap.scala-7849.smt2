; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97838 () Bool)

(assert start!97838)

(declare-fun b_free!23539 () Bool)

(declare-fun b_next!23539 () Bool)

(assert (=> start!97838 (= b_free!23539 (not b_next!23539))))

(declare-fun tp!83320 () Bool)

(declare-fun b_and!37861 () Bool)

(assert (=> start!97838 (= tp!83320 b_and!37861)))

(declare-fun b!1119782 () Bool)

(declare-fun res!748017 () Bool)

(declare-fun e!637697 () Bool)

(assert (=> b!1119782 (=> (not res!748017) (not e!637697))))

(declare-datatypes ((array!73021 0))(
  ( (array!73022 (arr!35163 (Array (_ BitVec 32) (_ BitVec 64))) (size!35699 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73021)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42553 0))(
  ( (V!42554 (val!14091 Int)) )
))
(declare-datatypes ((ValueCell!13325 0))(
  ( (ValueCellFull!13325 (v!16724 V!42553)) (EmptyCell!13325) )
))
(declare-datatypes ((array!73023 0))(
  ( (array!73024 (arr!35164 (Array (_ BitVec 32) ValueCell!13325)) (size!35700 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73023)

(assert (=> b!1119782 (= res!748017 (and (= (size!35700 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35699 _keys!1208) (size!35700 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1119783 () Bool)

(declare-fun res!748013 () Bool)

(assert (=> b!1119783 (=> (not res!748013) (not e!637697))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1119783 (= res!748013 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35699 _keys!1208))))))

(declare-fun mapNonEmpty!43921 () Bool)

(declare-fun mapRes!43921 () Bool)

(declare-fun tp!83321 () Bool)

(declare-fun e!637698 () Bool)

(assert (=> mapNonEmpty!43921 (= mapRes!43921 (and tp!83321 e!637698))))

(declare-fun mapRest!43921 () (Array (_ BitVec 32) ValueCell!13325))

(declare-fun mapKey!43921 () (_ BitVec 32))

(declare-fun mapValue!43921 () ValueCell!13325)

(assert (=> mapNonEmpty!43921 (= (arr!35164 _values!996) (store mapRest!43921 mapKey!43921 mapValue!43921))))

(declare-fun mapIsEmpty!43921 () Bool)

(assert (=> mapIsEmpty!43921 mapRes!43921))

(declare-fun b!1119784 () Bool)

(declare-fun res!748016 () Bool)

(assert (=> b!1119784 (=> (not res!748016) (not e!637697))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1119784 (= res!748016 (= (select (arr!35163 _keys!1208) i!673) k!934))))

(declare-fun b!1119785 () Bool)

(declare-fun e!637699 () Bool)

(declare-fun tp_is_empty!28069 () Bool)

(assert (=> b!1119785 (= e!637699 tp_is_empty!28069)))

(declare-fun b!1119786 () Bool)

(assert (=> b!1119786 (= e!637698 tp_is_empty!28069)))

(declare-fun b!1119787 () Bool)

(declare-fun res!748012 () Bool)

(assert (=> b!1119787 (=> (not res!748012) (not e!637697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73021 (_ BitVec 32)) Bool)

(assert (=> b!1119787 (= res!748012 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1119788 () Bool)

(declare-fun e!637700 () Bool)

(declare-fun e!637701 () Bool)

(assert (=> b!1119788 (= e!637700 (not e!637701))))

(declare-fun res!748009 () Bool)

(assert (=> b!1119788 (=> res!748009 e!637701)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1119788 (= res!748009 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73021 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1119788 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36746 0))(
  ( (Unit!36747) )
))
(declare-fun lt!497846 () Unit!36746)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73021 (_ BitVec 64) (_ BitVec 32)) Unit!36746)

(assert (=> b!1119788 (= lt!497846 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1119789 () Bool)

(declare-fun res!748008 () Bool)

(assert (=> b!1119789 (=> (not res!748008) (not e!637697))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1119789 (= res!748008 (validKeyInArray!0 k!934))))

(declare-fun b!1119790 () Bool)

(declare-fun res!748015 () Bool)

(assert (=> b!1119790 (=> (not res!748015) (not e!637697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1119790 (= res!748015 (validMask!0 mask!1564))))

(declare-fun b!1119791 () Bool)

(declare-fun res!748014 () Bool)

(assert (=> b!1119791 (=> (not res!748014) (not e!637700))))

(declare-fun lt!497849 () array!73021)

(declare-datatypes ((List!24465 0))(
  ( (Nil!24462) (Cons!24461 (h!25670 (_ BitVec 64)) (t!34996 List!24465)) )
))
(declare-fun arrayNoDuplicates!0 (array!73021 (_ BitVec 32) List!24465) Bool)

(assert (=> b!1119791 (= res!748014 (arrayNoDuplicates!0 lt!497849 #b00000000000000000000000000000000 Nil!24462))))

(declare-fun b!1119792 () Bool)

(assert (=> b!1119792 (= e!637697 e!637700)))

(declare-fun res!748010 () Bool)

(assert (=> b!1119792 (=> (not res!748010) (not e!637700))))

(assert (=> b!1119792 (= res!748010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497849 mask!1564))))

(assert (=> b!1119792 (= lt!497849 (array!73022 (store (arr!35163 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35699 _keys!1208)))))

(declare-fun b!1119793 () Bool)

(declare-fun e!637695 () Bool)

(assert (=> b!1119793 (= e!637695 (and e!637699 mapRes!43921))))

(declare-fun condMapEmpty!43921 () Bool)

(declare-fun mapDefault!43921 () ValueCell!13325)

