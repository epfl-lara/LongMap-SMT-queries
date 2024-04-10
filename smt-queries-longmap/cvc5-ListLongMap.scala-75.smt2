; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1026 () Bool)

(assert start!1026)

(declare-fun b_free!355 () Bool)

(declare-fun b_next!355 () Bool)

(assert (=> start!1026 (= b_free!355 (not b_next!355))))

(declare-fun tp!1304 () Bool)

(declare-fun b_and!507 () Bool)

(assert (=> start!1026 (= tp!1304 b_and!507)))

(declare-fun b!8907 () Bool)

(declare-fun res!8210 () Bool)

(declare-fun e!5080 () Bool)

(assert (=> b!8907 (=> (not res!8210) (not e!5080))))

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!8907 (= res!8210 (validKeyInArray!0 k!1278))))

(declare-fun mapIsEmpty!629 () Bool)

(declare-fun mapRes!629 () Bool)

(assert (=> mapIsEmpty!629 mapRes!629))

(declare-fun b!8908 () Bool)

(declare-fun res!8213 () Bool)

(assert (=> b!8908 (=> (not res!8213) (not e!5080))))

(declare-datatypes ((array!799 0))(
  ( (array!800 (arr!385 (Array (_ BitVec 32) (_ BitVec 64))) (size!447 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!799)

(declare-datatypes ((List!266 0))(
  ( (Nil!263) (Cons!262 (h!828 (_ BitVec 64)) (t!2407 List!266)) )
))
(declare-fun arrayNoDuplicates!0 (array!799 (_ BitVec 32) List!266) Bool)

(assert (=> b!8908 (= res!8213 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!263))))

(declare-fun b!8909 () Bool)

(declare-fun e!5081 () Bool)

(declare-fun mask!2250 () (_ BitVec 32))

(assert (=> b!8909 (= e!5081 (= (size!447 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250)))))

(declare-fun lt!1924 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!799 (_ BitVec 32)) Bool)

(assert (=> b!8909 (arrayForallSeekEntryOrOpenFound!0 lt!1924 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!177 0))(
  ( (Unit!178) )
))
(declare-fun lt!1925 () Unit!177)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!177)

(assert (=> b!8909 (= lt!1925 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1924))))

(declare-fun arrayScanForKey!0 (array!799 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!8909 (= lt!1924 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!8910 () Bool)

(declare-fun e!5079 () Bool)

(declare-fun tp_is_empty!433 () Bool)

(assert (=> b!8910 (= e!5079 tp_is_empty!433)))

(declare-fun b!8911 () Bool)

(declare-fun res!8209 () Bool)

(assert (=> b!8911 (=> (not res!8209) (not e!5080))))

(declare-datatypes ((V!755 0))(
  ( (V!756 (val!222 Int)) )
))
(declare-datatypes ((ValueCell!200 0))(
  ( (ValueCellFull!200 (v!1316 V!755)) (EmptyCell!200) )
))
(declare-datatypes ((array!801 0))(
  ( (array!802 (arr!386 (Array (_ BitVec 32) ValueCell!200)) (size!448 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!801)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!8911 (= res!8209 (and (= (size!448 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!447 _keys!1806) (size!448 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!8912 () Bool)

(declare-fun res!8215 () Bool)

(assert (=> b!8912 (=> (not res!8215) (not e!5080))))

(assert (=> b!8912 (= res!8215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapNonEmpty!629 () Bool)

(declare-fun tp!1303 () Bool)

(assert (=> mapNonEmpty!629 (= mapRes!629 (and tp!1303 e!5079))))

(declare-fun mapKey!629 () (_ BitVec 32))

(declare-fun mapRest!629 () (Array (_ BitVec 32) ValueCell!200))

(declare-fun mapValue!629 () ValueCell!200)

(assert (=> mapNonEmpty!629 (= (arr!386 _values!1492) (store mapRest!629 mapKey!629 mapValue!629))))

(declare-fun b!8913 () Bool)

(declare-fun e!5083 () Bool)

(assert (=> b!8913 (= e!5083 (ite (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!8914 () Bool)

(declare-fun e!5078 () Bool)

(assert (=> b!8914 (= e!5078 tp_is_empty!433)))

(declare-fun res!8211 () Bool)

(assert (=> start!1026 (=> (not res!8211) (not e!5080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!1026 (= res!8211 (validMask!0 mask!2250))))

(assert (=> start!1026 e!5080))

(assert (=> start!1026 tp!1304))

(assert (=> start!1026 true))

(declare-fun e!5084 () Bool)

(declare-fun array_inv!285 (array!801) Bool)

(assert (=> start!1026 (and (array_inv!285 _values!1492) e!5084)))

(assert (=> start!1026 tp_is_empty!433))

(declare-fun array_inv!286 (array!799) Bool)

(assert (=> start!1026 (array_inv!286 _keys!1806)))

(declare-fun b!8915 () Bool)

(declare-fun res!8212 () Bool)

(assert (=> b!8915 (=> (not res!8212) (not e!5080))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!755)

(declare-fun zeroValue!1434 () V!755)

(declare-datatypes ((tuple2!256 0))(
  ( (tuple2!257 (_1!128 (_ BitVec 64)) (_2!128 V!755)) )
))
(declare-datatypes ((List!267 0))(
  ( (Nil!264) (Cons!263 (h!829 tuple2!256) (t!2408 List!267)) )
))
(declare-datatypes ((ListLongMap!261 0))(
  ( (ListLongMap!262 (toList!146 List!267)) )
))
(declare-fun contains!123 (ListLongMap!261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!105 (array!799 array!801 (_ BitVec 32) (_ BitVec 32) V!755 V!755 (_ BitVec 32) Int) ListLongMap!261)

(assert (=> b!8915 (= res!8212 (contains!123 (getCurrentListMap!105 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!8916 () Bool)

(assert (=> b!8916 (= e!5084 (and e!5078 mapRes!629))))

(declare-fun condMapEmpty!629 () Bool)

(declare-fun mapDefault!629 () ValueCell!200)

