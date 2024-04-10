; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110560 () Bool)

(assert start!110560)

(declare-fun b_free!29395 () Bool)

(declare-fun b_next!29395 () Bool)

(assert (=> start!110560 (= b_free!29395 (not b_next!29395))))

(declare-fun tp!103507 () Bool)

(declare-fun b_and!47603 () Bool)

(assert (=> start!110560 (= tp!103507 b_and!47603)))

(declare-fun b!1307887 () Bool)

(declare-fun e!746327 () Bool)

(assert (=> b!1307887 (= e!746327 (not true))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87250 0))(
  ( (array!87251 (arr!42105 (Array (_ BitVec 32) (_ BitVec 64))) (size!42655 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87250)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!51937 0))(
  ( (V!51938 (val!17637 Int)) )
))
(declare-fun minValue!1296 () V!51937)

(declare-datatypes ((ValueCell!16664 0))(
  ( (ValueCellFull!16664 (v!20264 V!51937)) (EmptyCell!16664) )
))
(declare-datatypes ((array!87252 0))(
  ( (array!87253 (arr!42106 (Array (_ BitVec 32) ValueCell!16664)) (size!42656 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87252)

(declare-fun zeroValue!1296 () V!51937)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22706 0))(
  ( (tuple2!22707 (_1!11364 (_ BitVec 64)) (_2!11364 V!51937)) )
))
(declare-datatypes ((List!29848 0))(
  ( (Nil!29845) (Cons!29844 (h!31053 tuple2!22706) (t!43454 List!29848)) )
))
(declare-datatypes ((ListLongMap!20363 0))(
  ( (ListLongMap!20364 (toList!10197 List!29848)) )
))
(declare-fun contains!8347 (ListLongMap!20363 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5210 (array!87250 array!87252 (_ BitVec 32) (_ BitVec 32) V!51937 V!51937 (_ BitVec 32) Int) ListLongMap!20363)

(assert (=> b!1307887 (contains!8347 (getCurrentListMap!5210 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k!1175)))

(declare-datatypes ((Unit!43274 0))(
  ( (Unit!43275) )
))
(declare-fun lt!585111 () Unit!43274)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!1 (array!87250 array!87252 (_ BitVec 32) (_ BitVec 32) V!51937 V!51937 (_ BitVec 64) (_ BitVec 32) Int) Unit!43274)

(assert (=> b!1307887 (= lt!585111 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!1 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1307888 () Bool)

(declare-fun res!868156 () Bool)

(assert (=> b!1307888 (=> (not res!868156) (not e!746327))))

(assert (=> b!1307888 (= res!868156 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42655 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307889 () Bool)

(declare-fun e!746324 () Bool)

(declare-fun tp_is_empty!35125 () Bool)

(assert (=> b!1307889 (= e!746324 tp_is_empty!35125)))

(declare-fun b!1307890 () Bool)

(declare-fun res!868160 () Bool)

(assert (=> b!1307890 (=> (not res!868160) (not e!746327))))

(assert (=> b!1307890 (= res!868160 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!54316 () Bool)

(declare-fun mapRes!54316 () Bool)

(declare-fun tp!103506 () Bool)

(declare-fun e!746326 () Bool)

(assert (=> mapNonEmpty!54316 (= mapRes!54316 (and tp!103506 e!746326))))

(declare-fun mapValue!54316 () ValueCell!16664)

(declare-fun mapRest!54316 () (Array (_ BitVec 32) ValueCell!16664))

(declare-fun mapKey!54316 () (_ BitVec 32))

(assert (=> mapNonEmpty!54316 (= (arr!42106 _values!1354) (store mapRest!54316 mapKey!54316 mapValue!54316))))

(declare-fun b!1307891 () Bool)

(declare-fun res!868154 () Bool)

(assert (=> b!1307891 (=> (not res!868154) (not e!746327))))

(declare-datatypes ((List!29849 0))(
  ( (Nil!29846) (Cons!29845 (h!31054 (_ BitVec 64)) (t!43455 List!29849)) )
))
(declare-fun arrayNoDuplicates!0 (array!87250 (_ BitVec 32) List!29849) Bool)

(assert (=> b!1307891 (= res!868154 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29846))))

(declare-fun b!1307892 () Bool)

(declare-fun e!746323 () Bool)

(assert (=> b!1307892 (= e!746323 (and e!746324 mapRes!54316))))

(declare-fun condMapEmpty!54316 () Bool)

(declare-fun mapDefault!54316 () ValueCell!16664)

