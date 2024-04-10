; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!858 () Bool)

(assert start!858)

(declare-fun b_free!251 () Bool)

(declare-fun b_next!251 () Bool)

(assert (=> start!858 (= b_free!251 (not b_next!251))))

(declare-fun tp!982 () Bool)

(declare-fun b_and!397 () Bool)

(assert (=> start!858 (= tp!982 b_and!397)))

(declare-fun b!7081 () Bool)

(declare-fun e!3923 () Bool)

(assert (=> b!7081 (= e!3923 true)))

(declare-datatypes ((SeekEntryResult!29 0))(
  ( (MissingZero!29 (index!2235 (_ BitVec 32))) (Found!29 (index!2236 (_ BitVec 32))) (Intermediate!29 (undefined!841 Bool) (index!2237 (_ BitVec 32)) (x!2575 (_ BitVec 32))) (Undefined!29) (MissingVacant!29 (index!2238 (_ BitVec 32))) )
))
(declare-fun lt!1423 () SeekEntryResult!29)

(declare-fun lt!1421 () (_ BitVec 32))

(assert (=> b!7081 (and (is-Found!29 lt!1423) (= (index!2236 lt!1423) lt!1421))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun k!1278 () (_ BitVec 64))

(declare-datatypes ((array!589 0))(
  ( (array!590 (arr!283 (Array (_ BitVec 32) (_ BitVec 64))) (size!345 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!589)

(declare-fun seekEntry!0 ((_ BitVec 64) array!589 (_ BitVec 32)) SeekEntryResult!29)

(assert (=> b!7081 (= lt!1423 (seekEntry!0 k!1278 _keys!1806 mask!2250))))

(declare-datatypes ((Unit!133 0))(
  ( (Unit!134) )
))
(declare-fun lt!1422 () Unit!133)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!589 (_ BitVec 32)) Unit!133)

(assert (=> b!7081 (= lt!1422 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1278 lt!1421 _keys!1806 mask!2250))))

(declare-fun res!7231 () Bool)

(declare-fun e!3921 () Bool)

(assert (=> start!858 (=> (not res!7231) (not e!3921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!858 (= res!7231 (validMask!0 mask!2250))))

(assert (=> start!858 e!3921))

(assert (=> start!858 tp!982))

(assert (=> start!858 true))

(declare-datatypes ((V!615 0))(
  ( (V!616 (val!170 Int)) )
))
(declare-datatypes ((ValueCell!148 0))(
  ( (ValueCellFull!148 (v!1261 V!615)) (EmptyCell!148) )
))
(declare-datatypes ((array!591 0))(
  ( (array!592 (arr!284 (Array (_ BitVec 32) ValueCell!148)) (size!346 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!591)

(declare-fun e!3917 () Bool)

(declare-fun array_inv!207 (array!591) Bool)

(assert (=> start!858 (and (array_inv!207 _values!1492) e!3917)))

(declare-fun tp_is_empty!329 () Bool)

(assert (=> start!858 tp_is_empty!329))

(declare-fun array_inv!208 (array!589) Bool)

(assert (=> start!858 (array_inv!208 _keys!1806)))

(declare-fun mapNonEmpty!464 () Bool)

(declare-fun mapRes!464 () Bool)

(declare-fun tp!983 () Bool)

(declare-fun e!3919 () Bool)

(assert (=> mapNonEmpty!464 (= mapRes!464 (and tp!983 e!3919))))

(declare-fun mapKey!464 () (_ BitVec 32))

(declare-fun mapRest!464 () (Array (_ BitVec 32) ValueCell!148))

(declare-fun mapValue!464 () ValueCell!148)

(assert (=> mapNonEmpty!464 (= (arr!284 _values!1492) (store mapRest!464 mapKey!464 mapValue!464))))

(declare-fun b!7082 () Bool)

(declare-fun res!7224 () Bool)

(assert (=> b!7082 (=> (not res!7224) (not e!3921))))

(declare-datatypes ((List!190 0))(
  ( (Nil!187) (Cons!186 (h!752 (_ BitVec 64)) (t!2325 List!190)) )
))
(declare-fun arrayNoDuplicates!0 (array!589 (_ BitVec 32) List!190) Bool)

(assert (=> b!7082 (= res!7224 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!187))))

(declare-fun b!7083 () Bool)

(declare-fun e!3916 () Bool)

(assert (=> b!7083 (= e!3916 e!3923)))

(declare-fun res!7226 () Bool)

(assert (=> b!7083 (=> res!7226 e!3923)))

(assert (=> b!7083 (= res!7226 (not (= (size!345 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!589 (_ BitVec 32)) Bool)

(assert (=> b!7083 (arrayForallSeekEntryOrOpenFound!0 lt!1421 _keys!1806 mask!2250)))

(declare-fun lt!1425 () Unit!133)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!589 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!133)

(assert (=> b!7083 (= lt!1425 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1421))))

(declare-fun arrayScanForKey!0 (array!589 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!7083 (= lt!1421 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!7084 () Bool)

(assert (=> b!7084 (= e!3919 tp_is_empty!329)))

(declare-fun b!7085 () Bool)

(declare-fun res!7227 () Bool)

(assert (=> b!7085 (=> res!7227 e!3923)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!589 (_ BitVec 32)) SeekEntryResult!29)

(assert (=> b!7085 (= res!7227 (not (= (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250) (Found!29 lt!1421))))))

(declare-fun b!7086 () Bool)

(declare-fun res!7229 () Bool)

(assert (=> b!7086 (=> (not res!7229) (not e!3921))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7086 (= res!7229 (and (= (size!346 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!345 _keys!1806) (size!346 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7087 () Bool)

(declare-fun res!7223 () Bool)

(assert (=> b!7087 (=> (not res!7223) (not e!3921))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!615)

(declare-fun zeroValue!1434 () V!615)

(declare-datatypes ((tuple2!180 0))(
  ( (tuple2!181 (_1!90 (_ BitVec 64)) (_2!90 V!615)) )
))
(declare-datatypes ((List!191 0))(
  ( (Nil!188) (Cons!187 (h!753 tuple2!180) (t!2326 List!191)) )
))
(declare-datatypes ((ListLongMap!185 0))(
  ( (ListLongMap!186 (toList!108 List!191)) )
))
(declare-fun contains!82 (ListLongMap!185 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!67 (array!589 array!591 (_ BitVec 32) (_ BitVec 32) V!615 V!615 (_ BitVec 32) Int) ListLongMap!185)

(assert (=> b!7087 (= res!7223 (contains!82 (getCurrentListMap!67 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!7088 () Bool)

(declare-fun e!3920 () Bool)

(declare-fun arrayContainsKey!0 (array!589 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!7088 (= e!3920 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!7089 () Bool)

(assert (=> b!7089 (= e!3921 (not e!3916))))

(declare-fun res!7228 () Bool)

(assert (=> b!7089 (=> res!7228 e!3916)))

(assert (=> b!7089 (= res!7228 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!7089 e!3920))

(declare-fun c!509 () Bool)

(assert (=> b!7089 (= c!509 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1424 () Unit!133)

(declare-fun lemmaKeyInListMapIsInArray!48 (array!589 array!591 (_ BitVec 32) (_ BitVec 32) V!615 V!615 (_ BitVec 64) Int) Unit!133)

(assert (=> b!7089 (= lt!1424 (lemmaKeyInListMapIsInArray!48 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!7090 () Bool)

(assert (=> b!7090 (= e!3920 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!464 () Bool)

(assert (=> mapIsEmpty!464 mapRes!464))

(declare-fun b!7091 () Bool)

(declare-fun e!3922 () Bool)

(assert (=> b!7091 (= e!3922 tp_is_empty!329)))

(declare-fun b!7092 () Bool)

(assert (=> b!7092 (= e!3917 (and e!3922 mapRes!464))))

(declare-fun condMapEmpty!464 () Bool)

(declare-fun mapDefault!464 () ValueCell!148)

