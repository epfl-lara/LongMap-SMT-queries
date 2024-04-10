; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97656 () Bool)

(assert start!97656)

(declare-fun b!1116030 () Bool)

(declare-fun res!745127 () Bool)

(declare-fun e!635906 () Bool)

(assert (=> b!1116030 (=> (not res!745127) (not e!635906))))

(declare-datatypes ((array!72671 0))(
  ( (array!72672 (arr!34988 (Array (_ BitVec 32) (_ BitVec 64))) (size!35524 (_ BitVec 32))) )
))
(declare-fun lt!497071 () array!72671)

(declare-datatypes ((List!24359 0))(
  ( (Nil!24356) (Cons!24355 (h!25564 (_ BitVec 64)) (t!34840 List!24359)) )
))
(declare-fun arrayNoDuplicates!0 (array!72671 (_ BitVec 32) List!24359) Bool)

(assert (=> b!1116030 (= res!745127 (arrayNoDuplicates!0 lt!497071 #b00000000000000000000000000000000 Nil!24356))))

(declare-fun res!745123 () Bool)

(declare-fun e!635904 () Bool)

(assert (=> start!97656 (=> (not res!745123) (not e!635904))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun _keys!1208 () array!72671)

(assert (=> start!97656 (= res!745123 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35524 _keys!1208))))))

(assert (=> start!97656 e!635904))

(declare-fun array_inv!26894 (array!72671) Bool)

(assert (=> start!97656 (array_inv!26894 _keys!1208)))

(assert (=> start!97656 true))

(declare-datatypes ((V!42309 0))(
  ( (V!42310 (val!14000 Int)) )
))
(declare-datatypes ((ValueCell!13234 0))(
  ( (ValueCellFull!13234 (v!16633 V!42309)) (EmptyCell!13234) )
))
(declare-datatypes ((array!72673 0))(
  ( (array!72674 (arr!34989 (Array (_ BitVec 32) ValueCell!13234)) (size!35525 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72673)

(declare-fun e!635903 () Bool)

(declare-fun array_inv!26895 (array!72673) Bool)

(assert (=> start!97656 (and (array_inv!26895 _values!996) e!635903)))

(declare-fun b!1116031 () Bool)

(declare-fun res!745125 () Bool)

(assert (=> b!1116031 (=> (not res!745125) (not e!635904))))

(assert (=> b!1116031 (= res!745125 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24356))))

(declare-fun b!1116032 () Bool)

(declare-fun res!745130 () Bool)

(assert (=> b!1116032 (=> (not res!745130) (not e!635904))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116032 (= res!745130 (validMask!0 mask!1564))))

(declare-fun b!1116033 () Bool)

(declare-fun res!745129 () Bool)

(assert (=> b!1116033 (=> (not res!745129) (not e!635904))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116033 (= res!745129 (validKeyInArray!0 k!934))))

(declare-fun b!1116034 () Bool)

(declare-fun res!745128 () Bool)

(assert (=> b!1116034 (=> (not res!745128) (not e!635904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72671 (_ BitVec 32)) Bool)

(assert (=> b!1116034 (= res!745128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1116035 () Bool)

(declare-fun e!635902 () Bool)

(declare-fun tp_is_empty!27887 () Bool)

(assert (=> b!1116035 (= e!635902 tp_is_empty!27887)))

(declare-fun b!1116036 () Bool)

(declare-fun res!745124 () Bool)

(assert (=> b!1116036 (=> (not res!745124) (not e!635904))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1116036 (= res!745124 (= (select (arr!34988 _keys!1208) i!673) k!934))))

(declare-fun b!1116037 () Bool)

(declare-fun res!745126 () Bool)

(assert (=> b!1116037 (=> (not res!745126) (not e!635904))))

(assert (=> b!1116037 (= res!745126 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35524 _keys!1208))))))

(declare-fun b!1116038 () Bool)

(declare-fun e!635905 () Bool)

(declare-fun mapRes!43648 () Bool)

(assert (=> b!1116038 (= e!635903 (and e!635905 mapRes!43648))))

(declare-fun condMapEmpty!43648 () Bool)

(declare-fun mapDefault!43648 () ValueCell!13234)

