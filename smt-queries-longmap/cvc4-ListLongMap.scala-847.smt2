; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20182 () Bool)

(assert start!20182)

(declare-fun b_free!4841 () Bool)

(declare-fun b_next!4841 () Bool)

(assert (=> start!20182 (= b_free!4841 (not b_next!4841))))

(declare-fun tp!17554 () Bool)

(declare-fun b_and!11587 () Bool)

(assert (=> start!20182 (= tp!17554 b_and!11587)))

(declare-fun mapIsEmpty!8114 () Bool)

(declare-fun mapRes!8114 () Bool)

(assert (=> mapIsEmpty!8114 mapRes!8114))

(declare-fun b!198164 () Bool)

(declare-fun e!130286 () Bool)

(assert (=> b!198164 (= e!130286 false)))

(declare-datatypes ((V!5909 0))(
  ( (V!5910 (val!2393 Int)) )
))
(declare-datatypes ((tuple2!3628 0))(
  ( (tuple2!3629 (_1!1825 (_ BitVec 64)) (_2!1825 V!5909)) )
))
(declare-datatypes ((List!2544 0))(
  ( (Nil!2541) (Cons!2540 (h!3182 tuple2!3628) (t!7475 List!2544)) )
))
(declare-datatypes ((ListLongMap!2541 0))(
  ( (ListLongMap!2542 (toList!1286 List!2544)) )
))
(declare-fun lt!97863 () ListLongMap!2541)

(declare-datatypes ((ValueCell!2005 0))(
  ( (ValueCellFull!2005 (v!4363 V!5909)) (EmptyCell!2005) )
))
(declare-datatypes ((array!8643 0))(
  ( (array!8644 (arr!4072 (Array (_ BitVec 32) ValueCell!2005)) (size!4397 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8643)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun v!520 () V!5909)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!5909)

(declare-datatypes ((array!8645 0))(
  ( (array!8646 (arr!4073 (Array (_ BitVec 32) (_ BitVec 64))) (size!4398 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8645)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5909)

(declare-fun getCurrentListMapNoExtraKeys!251 (array!8645 array!8643 (_ BitVec 32) (_ BitVec 32) V!5909 V!5909 (_ BitVec 32) Int) ListLongMap!2541)

(assert (=> b!198164 (= lt!97863 (getCurrentListMapNoExtraKeys!251 _keys!825 (array!8644 (store (arr!4072 _values!649) i!601 (ValueCellFull!2005 v!520)) (size!4397 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!97862 () ListLongMap!2541)

(assert (=> b!198164 (= lt!97862 (getCurrentListMapNoExtraKeys!251 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!198165 () Bool)

(declare-fun res!93900 () Bool)

(assert (=> b!198165 (=> (not res!93900) (not e!130286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8645 (_ BitVec 32)) Bool)

(assert (=> b!198165 (= res!93900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198166 () Bool)

(declare-fun res!93895 () Bool)

(assert (=> b!198166 (=> (not res!93895) (not e!130286))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198166 (= res!93895 (validKeyInArray!0 k!843))))

(declare-fun b!198167 () Bool)

(declare-fun e!130289 () Bool)

(declare-fun e!130288 () Bool)

(assert (=> b!198167 (= e!130289 (and e!130288 mapRes!8114))))

(declare-fun condMapEmpty!8114 () Bool)

(declare-fun mapDefault!8114 () ValueCell!2005)

