; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110704 () Bool)

(assert start!110704)

(declare-fun b_free!29539 () Bool)

(declare-fun b_next!29539 () Bool)

(assert (=> start!110704 (= b_free!29539 (not b_next!29539))))

(declare-fun tp!103939 () Bool)

(declare-fun b_and!47747 () Bool)

(assert (=> start!110704 (= tp!103939 b_and!47747)))

(declare-fun b!1310047 () Bool)

(declare-fun res!869671 () Bool)

(declare-fun e!747404 () Bool)

(assert (=> b!1310047 (=> (not res!869671) (not e!747404))))

(declare-datatypes ((array!87528 0))(
  ( (array!87529 (arr!42244 (Array (_ BitVec 32) (_ BitVec 64))) (size!42794 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87528)

(declare-datatypes ((List!29949 0))(
  ( (Nil!29946) (Cons!29945 (h!31154 (_ BitVec 64)) (t!43555 List!29949)) )
))
(declare-fun arrayNoDuplicates!0 (array!87528 (_ BitVec 32) List!29949) Bool)

(assert (=> b!1310047 (= res!869671 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29946))))

(declare-fun mapNonEmpty!54532 () Bool)

(declare-fun mapRes!54532 () Bool)

(declare-fun tp!103938 () Bool)

(declare-fun e!747406 () Bool)

(assert (=> mapNonEmpty!54532 (= mapRes!54532 (and tp!103938 e!747406))))

(declare-datatypes ((V!52129 0))(
  ( (V!52130 (val!17709 Int)) )
))
(declare-datatypes ((ValueCell!16736 0))(
  ( (ValueCellFull!16736 (v!20336 V!52129)) (EmptyCell!16736) )
))
(declare-fun mapValue!54532 () ValueCell!16736)

(declare-fun mapRest!54532 () (Array (_ BitVec 32) ValueCell!16736))

(declare-datatypes ((array!87530 0))(
  ( (array!87531 (arr!42245 (Array (_ BitVec 32) ValueCell!16736)) (size!42795 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87530)

(declare-fun mapKey!54532 () (_ BitVec 32))

(assert (=> mapNonEmpty!54532 (= (arr!42245 _values!1354) (store mapRest!54532 mapKey!54532 mapValue!54532))))

(declare-fun b!1310048 () Bool)

(declare-fun res!869668 () Bool)

(assert (=> b!1310048 (=> (not res!869668) (not e!747404))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52129)

(declare-fun zeroValue!1296 () V!52129)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22810 0))(
  ( (tuple2!22811 (_1!11416 (_ BitVec 64)) (_2!11416 V!52129)) )
))
(declare-datatypes ((List!29950 0))(
  ( (Nil!29947) (Cons!29946 (h!31155 tuple2!22810) (t!43556 List!29950)) )
))
(declare-datatypes ((ListLongMap!20467 0))(
  ( (ListLongMap!20468 (toList!10249 List!29950)) )
))
(declare-fun contains!8399 (ListLongMap!20467 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5262 (array!87528 array!87530 (_ BitVec 32) (_ BitVec 32) V!52129 V!52129 (_ BitVec 32) Int) ListLongMap!20467)

(assert (=> b!1310048 (= res!869668 (contains!8399 (getCurrentListMap!5262 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1310049 () Bool)

(declare-fun e!747403 () Bool)

(declare-fun tp_is_empty!35269 () Bool)

(assert (=> b!1310049 (= e!747403 tp_is_empty!35269)))

(declare-fun b!1310050 () Bool)

(declare-fun res!869666 () Bool)

(assert (=> b!1310050 (=> (not res!869666) (not e!747404))))

(assert (=> b!1310050 (= res!869666 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1310051 () Bool)

(declare-fun res!869665 () Bool)

(assert (=> b!1310051 (=> (not res!869665) (not e!747404))))

(assert (=> b!1310051 (= res!869665 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42794 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1310052 () Bool)

(declare-fun res!869672 () Bool)

(assert (=> b!1310052 (=> (not res!869672) (not e!747404))))

(assert (=> b!1310052 (= res!869672 (not (= (select (arr!42244 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1310053 () Bool)

(declare-fun res!869667 () Bool)

(assert (=> b!1310053 (=> (not res!869667) (not e!747404))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1310053 (= res!869667 (validKeyInArray!0 (select (arr!42244 _keys!1628) from!2020)))))

(declare-fun b!1310054 () Bool)

(declare-fun res!869673 () Bool)

(assert (=> b!1310054 (=> (not res!869673) (not e!747404))))

(assert (=> b!1310054 (= res!869673 (and (= (size!42795 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42794 _keys!1628) (size!42795 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1310055 () Bool)

(declare-fun res!869670 () Bool)

(assert (=> b!1310055 (=> (not res!869670) (not e!747404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87528 (_ BitVec 32)) Bool)

(assert (=> b!1310055 (= res!869670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1310056 () Bool)

(declare-fun e!747405 () Bool)

(assert (=> b!1310056 (= e!747405 (and e!747403 mapRes!54532))))

(declare-fun condMapEmpty!54532 () Bool)

(declare-fun mapDefault!54532 () ValueCell!16736)

