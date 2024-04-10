; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97086 () Bool)

(assert start!97086)

(declare-fun b!1104234 () Bool)

(declare-fun e!630311 () Bool)

(declare-fun tp_is_empty!27349 () Bool)

(assert (=> b!1104234 (= e!630311 tp_is_empty!27349)))

(declare-fun mapNonEmpty!42835 () Bool)

(declare-fun mapRes!42835 () Bool)

(declare-fun tp!81755 () Bool)

(assert (=> mapNonEmpty!42835 (= mapRes!42835 (and tp!81755 e!630311))))

(declare-fun mapKey!42835 () (_ BitVec 32))

(declare-datatypes ((V!41593 0))(
  ( (V!41594 (val!13731 Int)) )
))
(declare-datatypes ((ValueCell!12965 0))(
  ( (ValueCellFull!12965 (v!16363 V!41593)) (EmptyCell!12965) )
))
(declare-fun mapRest!42835 () (Array (_ BitVec 32) ValueCell!12965))

(declare-datatypes ((array!71621 0))(
  ( (array!71622 (arr!34465 (Array (_ BitVec 32) ValueCell!12965)) (size!35001 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71621)

(declare-fun mapValue!42835 () ValueCell!12965)

(assert (=> mapNonEmpty!42835 (= (arr!34465 _values!996) (store mapRest!42835 mapKey!42835 mapValue!42835))))

(declare-fun b!1104235 () Bool)

(declare-fun res!736697 () Bool)

(declare-fun e!630313 () Bool)

(assert (=> b!1104235 (=> (not res!736697) (not e!630313))))

(declare-datatypes ((List!24054 0))(
  ( (Nil!24051) (Cons!24050 (h!25259 (_ BitVec 64)) (t!34319 List!24054)) )
))
(declare-fun noDuplicate!1588 (List!24054) Bool)

(assert (=> b!1104235 (= res!736697 (noDuplicate!1588 Nil!24051))))

(declare-fun b!1104236 () Bool)

(declare-fun res!736705 () Bool)

(assert (=> b!1104236 (=> (not res!736705) (not e!630313))))

(declare-datatypes ((array!71623 0))(
  ( (array!71624 (arr!34466 (Array (_ BitVec 32) (_ BitVec 64))) (size!35002 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71623)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1104236 (= res!736705 (and (= (size!35001 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35002 _keys!1208) (size!35001 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42835 () Bool)

(assert (=> mapIsEmpty!42835 mapRes!42835))

(declare-fun b!1104237 () Bool)

(declare-fun res!736704 () Bool)

(assert (=> b!1104237 (=> (not res!736704) (not e!630313))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71623 (_ BitVec 32)) Bool)

(assert (=> b!1104237 (= res!736704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71624 (store (arr!34466 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35002 _keys!1208)) mask!1564))))

(declare-fun b!1104238 () Bool)

(declare-fun res!736702 () Bool)

(assert (=> b!1104238 (=> (not res!736702) (not e!630313))))

(declare-fun arrayNoDuplicates!0 (array!71623 (_ BitVec 32) List!24054) Bool)

(assert (=> b!1104238 (= res!736702 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24051))))

(declare-fun b!1104240 () Bool)

(declare-fun e!630312 () Bool)

(declare-fun contains!6416 (List!24054 (_ BitVec 64)) Bool)

(assert (=> b!1104240 (= e!630312 (contains!6416 Nil!24051 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104241 () Bool)

(declare-fun res!736701 () Bool)

(assert (=> b!1104241 (=> (not res!736701) (not e!630313))))

(assert (=> b!1104241 (= res!736701 (and (bvsle #b00000000000000000000000000000000 (size!35002 _keys!1208)) (bvslt (size!35002 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1104242 () Bool)

(declare-fun res!736698 () Bool)

(assert (=> b!1104242 (=> (not res!736698) (not e!630313))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1104242 (= res!736698 (= (select (arr!34466 _keys!1208) i!673) k!934))))

(declare-fun b!1104243 () Bool)

(declare-fun res!736695 () Bool)

(assert (=> b!1104243 (=> (not res!736695) (not e!630313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104243 (= res!736695 (validKeyInArray!0 k!934))))

(declare-fun b!1104244 () Bool)

(assert (=> b!1104244 (= e!630313 e!630312)))

(declare-fun res!736700 () Bool)

(assert (=> b!1104244 (=> res!736700 e!630312)))

(assert (=> b!1104244 (= res!736700 (contains!6416 Nil!24051 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1104245 () Bool)

(declare-fun e!630315 () Bool)

(declare-fun e!630314 () Bool)

(assert (=> b!1104245 (= e!630315 (and e!630314 mapRes!42835))))

(declare-fun condMapEmpty!42835 () Bool)

(declare-fun mapDefault!42835 () ValueCell!12965)

