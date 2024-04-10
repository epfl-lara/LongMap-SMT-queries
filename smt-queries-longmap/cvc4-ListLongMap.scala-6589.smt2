; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83422 () Bool)

(assert start!83422)

(declare-fun b_free!19415 () Bool)

(declare-fun b_next!19415 () Bool)

(assert (=> start!83422 (= b_free!19415 (not b_next!19415))))

(declare-fun tp!67523 () Bool)

(declare-fun b_and!31017 () Bool)

(assert (=> start!83422 (= tp!67523 b_and!31017)))

(declare-fun b!974314 () Bool)

(declare-fun res!652205 () Bool)

(declare-fun e!549163 () Bool)

(assert (=> b!974314 (=> (not res!652205) (not e!549163))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34733 0))(
  ( (V!34734 (val!11207 Int)) )
))
(declare-datatypes ((ValueCell!10675 0))(
  ( (ValueCellFull!10675 (v!13766 V!34733)) (EmptyCell!10675) )
))
(declare-datatypes ((array!60667 0))(
  ( (array!60668 (arr!29197 (Array (_ BitVec 32) ValueCell!10675)) (size!29676 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60667)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60669 0))(
  ( (array!60670 (arr!29198 (Array (_ BitVec 32) (_ BitVec 64))) (size!29677 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60669)

(assert (=> b!974314 (= res!652205 (and (= (size!29676 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29677 _keys!1717) (size!29676 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974315 () Bool)

(declare-fun res!652200 () Bool)

(assert (=> b!974315 (=> (not res!652200) (not e!549163))))

(declare-fun zeroValue!1367 () V!34733)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34733)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14404 0))(
  ( (tuple2!14405 (_1!7213 (_ BitVec 64)) (_2!7213 V!34733)) )
))
(declare-datatypes ((List!20258 0))(
  ( (Nil!20255) (Cons!20254 (h!21416 tuple2!14404) (t!28735 List!20258)) )
))
(declare-datatypes ((ListLongMap!13101 0))(
  ( (ListLongMap!13102 (toList!6566 List!20258)) )
))
(declare-fun contains!5653 (ListLongMap!13101 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3799 (array!60669 array!60667 (_ BitVec 32) (_ BitVec 32) V!34733 V!34733 (_ BitVec 32) Int) ListLongMap!13101)

(assert (=> b!974315 (= res!652200 (contains!5653 (getCurrentListMap!3799 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29198 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35479 () Bool)

(declare-fun mapRes!35479 () Bool)

(assert (=> mapIsEmpty!35479 mapRes!35479))

(declare-fun b!974316 () Bool)

(declare-fun res!652204 () Bool)

(assert (=> b!974316 (=> (not res!652204) (not e!549163))))

(assert (=> b!974316 (= res!652204 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29677 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29677 _keys!1717))))))

(declare-fun b!974317 () Bool)

(declare-fun res!652206 () Bool)

(assert (=> b!974317 (=> (not res!652206) (not e!549163))))

(declare-datatypes ((List!20259 0))(
  ( (Nil!20256) (Cons!20255 (h!21417 (_ BitVec 64)) (t!28736 List!20259)) )
))
(declare-fun arrayNoDuplicates!0 (array!60669 (_ BitVec 32) List!20259) Bool)

(assert (=> b!974317 (= res!652206 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20256))))

(declare-fun b!974318 () Bool)

(declare-fun e!549162 () Bool)

(declare-fun tp_is_empty!22313 () Bool)

(assert (=> b!974318 (= e!549162 tp_is_empty!22313)))

(declare-fun b!974319 () Bool)

(declare-fun e!549166 () Bool)

(assert (=> b!974319 (= e!549166 (and e!549162 mapRes!35479))))

(declare-fun condMapEmpty!35479 () Bool)

(declare-fun mapDefault!35479 () ValueCell!10675)

