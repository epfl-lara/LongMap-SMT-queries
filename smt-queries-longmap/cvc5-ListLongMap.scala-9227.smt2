; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110710 () Bool)

(assert start!110710)

(declare-fun b_free!29545 () Bool)

(declare-fun b_next!29545 () Bool)

(assert (=> start!110710 (= b_free!29545 (not b_next!29545))))

(declare-fun tp!103956 () Bool)

(declare-fun b_and!47753 () Bool)

(assert (=> start!110710 (= tp!103956 b_and!47753)))

(declare-fun b!1310155 () Bool)

(declare-fun res!869748 () Bool)

(declare-fun e!747450 () Bool)

(assert (=> b!1310155 (=> (not res!869748) (not e!747450))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1310155 (= res!869748 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310156 () Bool)

(declare-fun res!869751 () Bool)

(assert (=> b!1310156 (=> (not res!869751) (not e!747450))))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87538 0))(
  ( (array!87539 (arr!42249 (Array (_ BitVec 32) (_ BitVec 64))) (size!42799 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87538)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52137 0))(
  ( (V!52138 (val!17712 Int)) )
))
(declare-fun minValue!1296 () V!52137)

(declare-datatypes ((ValueCell!16739 0))(
  ( (ValueCellFull!16739 (v!20339 V!52137)) (EmptyCell!16739) )
))
(declare-datatypes ((array!87540 0))(
  ( (array!87541 (arr!42250 (Array (_ BitVec 32) ValueCell!16739)) (size!42800 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87540)

(declare-fun zeroValue!1296 () V!52137)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((tuple2!22814 0))(
  ( (tuple2!22815 (_1!11418 (_ BitVec 64)) (_2!11418 V!52137)) )
))
(declare-datatypes ((List!29953 0))(
  ( (Nil!29950) (Cons!29949 (h!31158 tuple2!22814) (t!43559 List!29953)) )
))
(declare-datatypes ((ListLongMap!20471 0))(
  ( (ListLongMap!20472 (toList!10251 List!29953)) )
))
(declare-fun contains!8401 (ListLongMap!20471 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5264 (array!87538 array!87540 (_ BitVec 32) (_ BitVec 32) V!52137 V!52137 (_ BitVec 32) Int) ListLongMap!20471)

(assert (=> b!1310156 (= res!869751 (contains!8401 (getCurrentListMap!5264 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54541 () Bool)

(declare-fun mapRes!54541 () Bool)

(declare-fun tp!103957 () Bool)

(declare-fun e!747449 () Bool)

(assert (=> mapNonEmpty!54541 (= mapRes!54541 (and tp!103957 e!747449))))

(declare-fun mapKey!54541 () (_ BitVec 32))

(declare-fun mapValue!54541 () ValueCell!16739)

(declare-fun mapRest!54541 () (Array (_ BitVec 32) ValueCell!16739))

(assert (=> mapNonEmpty!54541 (= (arr!42250 _values!1354) (store mapRest!54541 mapKey!54541 mapValue!54541))))

(declare-fun b!1310157 () Bool)

(declare-fun res!869749 () Bool)

(assert (=> b!1310157 (=> (not res!869749) (not e!747450))))

(declare-datatypes ((List!29954 0))(
  ( (Nil!29951) (Cons!29950 (h!31159 (_ BitVec 64)) (t!43560 List!29954)) )
))
(declare-fun arrayNoDuplicates!0 (array!87538 (_ BitVec 32) List!29954) Bool)

(assert (=> b!1310157 (= res!869749 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29951))))

(declare-fun res!869752 () Bool)

(assert (=> start!110710 (=> (not res!869752) (not e!747450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110710 (= res!869752 (validMask!0 mask!2040))))

(assert (=> start!110710 e!747450))

(assert (=> start!110710 tp!103956))

(declare-fun array_inv!31925 (array!87538) Bool)

(assert (=> start!110710 (array_inv!31925 _keys!1628)))

(assert (=> start!110710 true))

(declare-fun tp_is_empty!35275 () Bool)

(assert (=> start!110710 tp_is_empty!35275))

(declare-fun e!747452 () Bool)

(declare-fun array_inv!31926 (array!87540) Bool)

(assert (=> start!110710 (and (array_inv!31926 _values!1354) e!747452)))

(declare-fun b!1310158 () Bool)

(declare-fun res!869746 () Bool)

(assert (=> b!1310158 (=> (not res!869746) (not e!747450))))

(assert (=> b!1310158 (= res!869746 (not (= (select (arr!42249 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1310159 () Bool)

(declare-fun e!747451 () Bool)

(assert (=> b!1310159 (= e!747452 (and e!747451 mapRes!54541))))

(declare-fun condMapEmpty!54541 () Bool)

(declare-fun mapDefault!54541 () ValueCell!16739)

