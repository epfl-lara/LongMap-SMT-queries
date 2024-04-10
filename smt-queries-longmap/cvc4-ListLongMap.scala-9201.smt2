; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110558 () Bool)

(assert start!110558)

(declare-fun b_free!29393 () Bool)

(declare-fun b_next!29393 () Bool)

(assert (=> start!110558 (= b_free!29393 (not b_next!29393))))

(declare-fun tp!103501 () Bool)

(declare-fun b_and!47601 () Bool)

(assert (=> start!110558 (= tp!103501 b_and!47601)))

(declare-fun mapNonEmpty!54313 () Bool)

(declare-fun mapRes!54313 () Bool)

(declare-fun tp!103500 () Bool)

(declare-fun e!746310 () Bool)

(assert (=> mapNonEmpty!54313 (= mapRes!54313 (and tp!103500 e!746310))))

(declare-datatypes ((V!51933 0))(
  ( (V!51934 (val!17636 Int)) )
))
(declare-datatypes ((ValueCell!16663 0))(
  ( (ValueCellFull!16663 (v!20263 V!51933)) (EmptyCell!16663) )
))
(declare-fun mapValue!54313 () ValueCell!16663)

(declare-fun mapKey!54313 () (_ BitVec 32))

(declare-datatypes ((array!87246 0))(
  ( (array!87247 (arr!42103 (Array (_ BitVec 32) ValueCell!16663)) (size!42653 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87246)

(declare-fun mapRest!54313 () (Array (_ BitVec 32) ValueCell!16663))

(assert (=> mapNonEmpty!54313 (= (arr!42103 _values!1354) (store mapRest!54313 mapKey!54313 mapValue!54313))))

(declare-fun b!1307855 () Bool)

(declare-fun e!746312 () Bool)

(assert (=> b!1307855 (= e!746312 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87248 0))(
  ( (array!87249 (arr!42104 (Array (_ BitVec 32) (_ BitVec 64))) (size!42654 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87248)

(declare-fun lt!585108 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!51933)

(declare-fun zeroValue!1296 () V!51933)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22704 0))(
  ( (tuple2!22705 (_1!11363 (_ BitVec 64)) (_2!11363 V!51933)) )
))
(declare-datatypes ((List!29847 0))(
  ( (Nil!29844) (Cons!29843 (h!31052 tuple2!22704) (t!43453 List!29847)) )
))
(declare-datatypes ((ListLongMap!20361 0))(
  ( (ListLongMap!20362 (toList!10196 List!29847)) )
))
(declare-fun contains!8346 (ListLongMap!20361 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5209 (array!87248 array!87246 (_ BitVec 32) (_ BitVec 32) V!51933 V!51933 (_ BitVec 32) Int) ListLongMap!20361)

(assert (=> b!1307855 (= lt!585108 (contains!8346 (getCurrentListMap!5209 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1307856 () Bool)

(declare-fun tp_is_empty!35123 () Bool)

(assert (=> b!1307856 (= e!746310 tp_is_empty!35123)))

(declare-fun b!1307857 () Bool)

(declare-fun res!868131 () Bool)

(assert (=> b!1307857 (=> (not res!868131) (not e!746312))))

(assert (=> b!1307857 (= res!868131 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42654 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1307858 () Bool)

(declare-fun e!746309 () Bool)

(declare-fun e!746308 () Bool)

(assert (=> b!1307858 (= e!746309 (and e!746308 mapRes!54313))))

(declare-fun condMapEmpty!54313 () Bool)

(declare-fun mapDefault!54313 () ValueCell!16663)

