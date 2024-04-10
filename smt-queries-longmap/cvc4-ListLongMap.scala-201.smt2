; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3874 () Bool)

(assert start!3874)

(declare-fun b_free!797 () Bool)

(declare-fun b_next!797 () Bool)

(assert (=> start!3874 (= b_free!797 (not b_next!797))))

(declare-fun tp!3807 () Bool)

(declare-fun b_and!1605 () Bool)

(assert (=> start!3874 (= tp!3807 b_and!1605)))

(declare-fun b!27239 () Bool)

(declare-fun e!17750 () Bool)

(declare-fun tp_is_empty!1151 () Bool)

(assert (=> b!27239 (= e!17750 tp_is_empty!1151)))

(declare-fun b!27240 () Bool)

(declare-fun e!17746 () Bool)

(assert (=> b!27240 (= e!17746 tp_is_empty!1151)))

(declare-fun b!27241 () Bool)

(declare-fun res!16138 () Bool)

(declare-fun e!17747 () Bool)

(assert (=> b!27241 (=> (not res!16138) (not e!17747))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27241 (= res!16138 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1252 () Bool)

(declare-fun mapRes!1252 () Bool)

(declare-fun tp!3808 () Bool)

(assert (=> mapNonEmpty!1252 (= mapRes!1252 (and tp!3808 e!17746))))

(declare-datatypes ((V!1359 0))(
  ( (V!1360 (val!602 Int)) )
))
(declare-datatypes ((ValueCell!376 0))(
  ( (ValueCellFull!376 (v!1690 V!1359)) (EmptyCell!376) )
))
(declare-datatypes ((array!1543 0))(
  ( (array!1544 (arr!726 (Array (_ BitVec 32) ValueCell!376)) (size!827 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1543)

(declare-fun mapKey!1252 () (_ BitVec 32))

(declare-fun mapValue!1252 () ValueCell!376)

(declare-fun mapRest!1252 () (Array (_ BitVec 32) ValueCell!376))

(assert (=> mapNonEmpty!1252 (= (arr!726 _values!1501) (store mapRest!1252 mapKey!1252 mapValue!1252))))

(declare-fun b!27242 () Bool)

(declare-fun res!16134 () Bool)

(assert (=> b!27242 (=> (not res!16134) (not e!17747))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1545 0))(
  ( (array!1546 (arr!727 (Array (_ BitVec 32) (_ BitVec 64))) (size!828 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1545)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!27242 (= res!16134 (and (= (size!827 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!828 _keys!1833) (size!827 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27243 () Bool)

(declare-fun res!16137 () Bool)

(assert (=> b!27243 (=> (not res!16137) (not e!17747))))

(declare-fun arrayContainsKey!0 (array!1545 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27243 (= res!16137 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!27244 () Bool)

(declare-fun res!16136 () Bool)

(assert (=> b!27244 (=> (not res!16136) (not e!17747))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1359)

(declare-fun minValue!1443 () V!1359)

(declare-datatypes ((tuple2!1014 0))(
  ( (tuple2!1015 (_1!518 (_ BitVec 64)) (_2!518 V!1359)) )
))
(declare-datatypes ((List!614 0))(
  ( (Nil!611) (Cons!610 (h!1177 tuple2!1014) (t!3305 List!614)) )
))
(declare-datatypes ((ListLongMap!591 0))(
  ( (ListLongMap!592 (toList!311 List!614)) )
))
(declare-fun contains!250 (ListLongMap!591 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!141 (array!1545 array!1543 (_ BitVec 32) (_ BitVec 32) V!1359 V!1359 (_ BitVec 32) Int) ListLongMap!591)

(assert (=> b!27244 (= res!16136 (not (contains!250 (getCurrentListMap!141 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!27245 () Bool)

(declare-fun res!16140 () Bool)

(assert (=> b!27245 (=> (not res!16140) (not e!17747))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1545 (_ BitVec 32)) Bool)

(assert (=> b!27245 (= res!16140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27246 () Bool)

(declare-fun res!16135 () Bool)

(assert (=> b!27246 (=> (not res!16135) (not e!17747))))

(declare-datatypes ((List!615 0))(
  ( (Nil!612) (Cons!611 (h!1178 (_ BitVec 64)) (t!3306 List!615)) )
))
(declare-fun arrayNoDuplicates!0 (array!1545 (_ BitVec 32) List!615) Bool)

(assert (=> b!27246 (= res!16135 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!612))))

(declare-fun b!27247 () Bool)

(assert (=> b!27247 (= e!17747 (or (bvsge #b00000000000000000000000000000000 (size!828 _keys!1833)) (bvsge (size!828 _keys!1833) #b01111111111111111111111111111111)))))

(declare-fun res!16139 () Bool)

(assert (=> start!3874 (=> (not res!16139) (not e!17747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3874 (= res!16139 (validMask!0 mask!2294))))

(assert (=> start!3874 e!17747))

(assert (=> start!3874 true))

(assert (=> start!3874 tp!3807))

(declare-fun e!17749 () Bool)

(declare-fun array_inv!499 (array!1543) Bool)

(assert (=> start!3874 (and (array_inv!499 _values!1501) e!17749)))

(declare-fun array_inv!500 (array!1545) Bool)

(assert (=> start!3874 (array_inv!500 _keys!1833)))

(assert (=> start!3874 tp_is_empty!1151))

(declare-fun b!27248 () Bool)

(assert (=> b!27248 (= e!17749 (and e!17750 mapRes!1252))))

(declare-fun condMapEmpty!1252 () Bool)

(declare-fun mapDefault!1252 () ValueCell!376)

