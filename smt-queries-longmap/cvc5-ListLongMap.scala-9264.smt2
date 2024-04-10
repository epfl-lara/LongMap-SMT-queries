; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110932 () Bool)

(assert start!110932)

(declare-fun b_free!29767 () Bool)

(declare-fun b_next!29767 () Bool)

(assert (=> start!110932 (= b_free!29767 (not b_next!29767))))

(declare-fun tp!104623 () Bool)

(declare-fun b_and!47975 () Bool)

(assert (=> start!110932 (= tp!104623 b_and!47975)))

(declare-fun b!1313342 () Bool)

(declare-fun e!749114 () Bool)

(declare-fun tp_is_empty!35497 () Bool)

(assert (=> b!1313342 (= e!749114 tp_is_empty!35497)))

(declare-fun b!1313343 () Bool)

(declare-fun res!871934 () Bool)

(declare-fun e!749113 () Bool)

(assert (=> b!1313343 (=> (not res!871934) (not e!749113))))

(declare-datatypes ((array!87974 0))(
  ( (array!87975 (arr!42467 (Array (_ BitVec 32) (_ BitVec 64))) (size!43017 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87974)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1313343 (= res!871934 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!43017 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1313344 () Bool)

(assert (=> b!1313344 (= e!749113 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52433 0))(
  ( (V!52434 (val!17823 Int)) )
))
(declare-fun minValue!1296 () V!52433)

(declare-datatypes ((ValueCell!16850 0))(
  ( (ValueCellFull!16850 (v!20450 V!52433)) (EmptyCell!16850) )
))
(declare-datatypes ((array!87976 0))(
  ( (array!87977 (arr!42468 (Array (_ BitVec 32) ValueCell!16850)) (size!43018 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87976)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun zeroValue!1296 () V!52433)

(declare-fun lt!585660 () Bool)

(declare-datatypes ((tuple2!22978 0))(
  ( (tuple2!22979 (_1!11500 (_ BitVec 64)) (_2!11500 V!52433)) )
))
(declare-datatypes ((List!30115 0))(
  ( (Nil!30112) (Cons!30111 (h!31320 tuple2!22978) (t!43721 List!30115)) )
))
(declare-datatypes ((ListLongMap!20635 0))(
  ( (ListLongMap!20636 (toList!10333 List!30115)) )
))
(declare-fun contains!8483 (ListLongMap!20635 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5346 (array!87974 array!87976 (_ BitVec 32) (_ BitVec 32) V!52433 V!52433 (_ BitVec 32) Int) ListLongMap!20635)

(assert (=> b!1313344 (= lt!585660 (contains!8483 (getCurrentListMap!5346 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1313345 () Bool)

(declare-fun e!749117 () Bool)

(assert (=> b!1313345 (= e!749117 tp_is_empty!35497)))

(declare-fun mapNonEmpty!54874 () Bool)

(declare-fun mapRes!54874 () Bool)

(declare-fun tp!104622 () Bool)

(assert (=> mapNonEmpty!54874 (= mapRes!54874 (and tp!104622 e!749117))))

(declare-fun mapKey!54874 () (_ BitVec 32))

(declare-fun mapValue!54874 () ValueCell!16850)

(declare-fun mapRest!54874 () (Array (_ BitVec 32) ValueCell!16850))

(assert (=> mapNonEmpty!54874 (= (arr!42468 _values!1354) (store mapRest!54874 mapKey!54874 mapValue!54874))))

(declare-fun b!1313346 () Bool)

(declare-fun e!749116 () Bool)

(assert (=> b!1313346 (= e!749116 (and e!749114 mapRes!54874))))

(declare-fun condMapEmpty!54874 () Bool)

(declare-fun mapDefault!54874 () ValueCell!16850)

