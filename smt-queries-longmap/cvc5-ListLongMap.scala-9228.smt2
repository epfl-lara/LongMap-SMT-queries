; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110716 () Bool)

(assert start!110716)

(declare-fun b_free!29551 () Bool)

(declare-fun b_next!29551 () Bool)

(assert (=> start!110716 (= b_free!29551 (not b_next!29551))))

(declare-fun tp!103975 () Bool)

(declare-fun b_and!47759 () Bool)

(assert (=> start!110716 (= tp!103975 b_and!47759)))

(declare-fun b!1310263 () Bool)

(declare-fun res!869827 () Bool)

(declare-fun e!747494 () Bool)

(assert (=> b!1310263 (=> (not res!869827) (not e!747494))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87550 0))(
  ( (array!87551 (arr!42255 (Array (_ BitVec 32) (_ BitVec 64))) (size!42805 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87550)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52145 0))(
  ( (V!52146 (val!17715 Int)) )
))
(declare-fun minValue!1296 () V!52145)

(declare-datatypes ((ValueCell!16742 0))(
  ( (ValueCellFull!16742 (v!20342 V!52145)) (EmptyCell!16742) )
))
(declare-datatypes ((array!87552 0))(
  ( (array!87553 (arr!42256 (Array (_ BitVec 32) ValueCell!16742)) (size!42806 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87552)

(declare-fun zeroValue!1296 () V!52145)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22820 0))(
  ( (tuple2!22821 (_1!11421 (_ BitVec 64)) (_2!11421 V!52145)) )
))
(declare-datatypes ((List!29958 0))(
  ( (Nil!29955) (Cons!29954 (h!31163 tuple2!22820) (t!43564 List!29958)) )
))
(declare-datatypes ((ListLongMap!20477 0))(
  ( (ListLongMap!20478 (toList!10254 List!29958)) )
))
(declare-fun contains!8404 (ListLongMap!20477 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5267 (array!87550 array!87552 (_ BitVec 32) (_ BitVec 32) V!52145 V!52145 (_ BitVec 32) Int) ListLongMap!20477)

(assert (=> b!1310263 (= res!869827 (contains!8404 (getCurrentListMap!5267 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310264 () Bool)

(declare-fun e!747497 () Bool)

(declare-fun tp_is_empty!35281 () Bool)

(assert (=> b!1310264 (= e!747497 tp_is_empty!35281)))

(declare-fun b!1310265 () Bool)

(declare-fun res!869828 () Bool)

(assert (=> b!1310265 (=> (not res!869828) (not e!747494))))

(declare-datatypes ((List!29959 0))(
  ( (Nil!29956) (Cons!29955 (h!31164 (_ BitVec 64)) (t!43565 List!29959)) )
))
(declare-fun arrayNoDuplicates!0 (array!87550 (_ BitVec 32) List!29959) Bool)

(assert (=> b!1310265 (= res!869828 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29956))))

(declare-fun res!869829 () Bool)

(assert (=> start!110716 (=> (not res!869829) (not e!747494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110716 (= res!869829 (validMask!0 mask!2040))))

(assert (=> start!110716 e!747494))

(assert (=> start!110716 tp!103975))

(declare-fun array_inv!31929 (array!87550) Bool)

(assert (=> start!110716 (array_inv!31929 _keys!1628)))

(assert (=> start!110716 true))

(assert (=> start!110716 tp_is_empty!35281))

(declare-fun e!747495 () Bool)

(declare-fun array_inv!31930 (array!87552) Bool)

(assert (=> start!110716 (and (array_inv!31930 _values!1354) e!747495)))

(declare-fun b!1310266 () Bool)

(declare-fun res!869833 () Bool)

(assert (=> b!1310266 (=> (not res!869833) (not e!747494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87550 (_ BitVec 32)) Bool)

(assert (=> b!1310266 (= res!869833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310267 () Bool)

(declare-fun res!869834 () Bool)

(assert (=> b!1310267 (=> (not res!869834) (not e!747494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310267 (= res!869834 (validKeyInArray!0 (select (arr!42255 _keys!1628) from!2020)))))

(declare-fun b!1310268 () Bool)

(declare-fun e!747493 () Bool)

(assert (=> b!1310268 (= e!747493 tp_is_empty!35281)))

(declare-fun b!1310269 () Bool)

(declare-fun res!869832 () Bool)

(assert (=> b!1310269 (=> (not res!869832) (not e!747494))))

(assert (=> b!1310269 (= res!869832 (not (= (select (arr!42255 _keys!1628) from!2020) k!1175)))))

(declare-fun mapNonEmpty!54550 () Bool)

(declare-fun mapRes!54550 () Bool)

(declare-fun tp!103974 () Bool)

(assert (=> mapNonEmpty!54550 (= mapRes!54550 (and tp!103974 e!747497))))

(declare-fun mapRest!54550 () (Array (_ BitVec 32) ValueCell!16742))

(declare-fun mapKey!54550 () (_ BitVec 32))

(declare-fun mapValue!54550 () ValueCell!16742)

(assert (=> mapNonEmpty!54550 (= (arr!42256 _values!1354) (store mapRest!54550 mapKey!54550 mapValue!54550))))

(declare-fun b!1310270 () Bool)

(declare-fun res!869830 () Bool)

(assert (=> b!1310270 (=> (not res!869830) (not e!747494))))

(assert (=> b!1310270 (= res!869830 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!54550 () Bool)

(assert (=> mapIsEmpty!54550 mapRes!54550))

(declare-fun b!1310271 () Bool)

(assert (=> b!1310271 (= e!747495 (and e!747493 mapRes!54550))))

(declare-fun condMapEmpty!54550 () Bool)

(declare-fun mapDefault!54550 () ValueCell!16742)

