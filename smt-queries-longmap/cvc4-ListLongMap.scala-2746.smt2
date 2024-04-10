; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40318 () Bool)

(assert start!40318)

(declare-fun mapIsEmpty!19200 () Bool)

(declare-fun mapRes!19200 () Bool)

(assert (=> mapIsEmpty!19200 mapRes!19200))

(declare-fun b!442762 () Bool)

(declare-fun res!262260 () Bool)

(declare-fun e!260587 () Bool)

(assert (=> b!442762 (=> (not res!262260) (not e!260587))))

(declare-datatypes ((array!27245 0))(
  ( (array!27246 (arr!13071 (Array (_ BitVec 32) (_ BitVec 64))) (size!13423 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27245)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442762 (= res!262260 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!442763 () Bool)

(declare-fun e!260589 () Bool)

(declare-fun tp_is_empty!11717 () Bool)

(assert (=> b!442763 (= e!260589 tp_is_empty!11717)))

(declare-fun b!442764 () Bool)

(declare-fun res!262263 () Bool)

(assert (=> b!442764 (=> (not res!262263) (not e!260587))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442764 (= res!262263 (validMask!0 mask!1025))))

(declare-fun b!442765 () Bool)

(declare-fun res!262258 () Bool)

(assert (=> b!442765 (=> (not res!262258) (not e!260587))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442765 (= res!262258 (or (= (select (arr!13071 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13071 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442766 () Bool)

(declare-fun res!262262 () Bool)

(assert (=> b!442766 (=> (not res!262262) (not e!260587))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16727 0))(
  ( (V!16728 (val!5903 Int)) )
))
(declare-datatypes ((ValueCell!5515 0))(
  ( (ValueCellFull!5515 (v!8154 V!16727)) (EmptyCell!5515) )
))
(declare-datatypes ((array!27247 0))(
  ( (array!27248 (arr!13072 (Array (_ BitVec 32) ValueCell!5515)) (size!13424 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27247)

(assert (=> b!442766 (= res!262262 (and (= (size!13424 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13423 _keys!709) (size!13424 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442767 () Bool)

(declare-fun e!260586 () Bool)

(assert (=> b!442767 (= e!260586 tp_is_empty!11717)))

(declare-fun b!442768 () Bool)

(declare-fun res!262261 () Bool)

(assert (=> b!442768 (=> (not res!262261) (not e!260587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27245 (_ BitVec 32)) Bool)

(assert (=> b!442768 (= res!262261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19200 () Bool)

(declare-fun tp!37182 () Bool)

(assert (=> mapNonEmpty!19200 (= mapRes!19200 (and tp!37182 e!260589))))

(declare-fun mapValue!19200 () ValueCell!5515)

(declare-fun mapRest!19200 () (Array (_ BitVec 32) ValueCell!5515))

(declare-fun mapKey!19200 () (_ BitVec 32))

(assert (=> mapNonEmpty!19200 (= (arr!13072 _values!549) (store mapRest!19200 mapKey!19200 mapValue!19200))))

(declare-fun b!442770 () Bool)

(declare-fun res!262265 () Bool)

(assert (=> b!442770 (=> (not res!262265) (not e!260587))))

(declare-datatypes ((List!7844 0))(
  ( (Nil!7841) (Cons!7840 (h!8696 (_ BitVec 64)) (t!13602 List!7844)) )
))
(declare-fun arrayNoDuplicates!0 (array!27245 (_ BitVec 32) List!7844) Bool)

(assert (=> b!442770 (= res!262265 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7841))))

(declare-fun b!442771 () Bool)

(declare-fun e!260588 () Bool)

(assert (=> b!442771 (= e!260588 (and e!260586 mapRes!19200))))

(declare-fun condMapEmpty!19200 () Bool)

(declare-fun mapDefault!19200 () ValueCell!5515)

