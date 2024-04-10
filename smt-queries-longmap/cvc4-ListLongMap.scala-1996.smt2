; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34908 () Bool)

(assert start!34908)

(declare-fun b_free!7649 () Bool)

(declare-fun b_next!7649 () Bool)

(assert (=> start!34908 (= b_free!7649 (not b_next!7649))))

(declare-fun tp!26519 () Bool)

(declare-fun b_and!14875 () Bool)

(assert (=> start!34908 (= tp!26519 b_and!14875)))

(declare-fun mapNonEmpty!12867 () Bool)

(declare-fun mapRes!12867 () Bool)

(declare-fun tp!26520 () Bool)

(declare-fun e!214124 () Bool)

(assert (=> mapNonEmpty!12867 (= mapRes!12867 (and tp!26520 e!214124))))

(declare-fun mapKey!12867 () (_ BitVec 32))

(declare-datatypes ((V!11111 0))(
  ( (V!11112 (val!3845 Int)) )
))
(declare-datatypes ((ValueCell!3457 0))(
  ( (ValueCellFull!3457 (v!6030 V!11111)) (EmptyCell!3457) )
))
(declare-fun mapRest!12867 () (Array (_ BitVec 32) ValueCell!3457))

(declare-fun mapValue!12867 () ValueCell!3457)

(declare-datatypes ((array!18787 0))(
  ( (array!18788 (arr!8901 (Array (_ BitVec 32) ValueCell!3457)) (size!9253 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18787)

(assert (=> mapNonEmpty!12867 (= (arr!8901 _values!1525) (store mapRest!12867 mapKey!12867 mapValue!12867))))

(declare-fun b!349557 () Bool)

(declare-fun e!214127 () Bool)

(assert (=> b!349557 (= e!214127 (not true))))

(assert (=> b!349557 false))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11111)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!18789 0))(
  ( (array!18790 (arr!8902 (Array (_ BitVec 32) (_ BitVec 64))) (size!9254 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18789)

(declare-fun minValue!1467 () V!11111)

(declare-datatypes ((Unit!10817 0))(
  ( (Unit!10818) )
))
(declare-fun lt!164227 () Unit!10817)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun lemmaArrayContainsKeyThenInListMap!317 (array!18789 array!18787 (_ BitVec 32) (_ BitVec 32) V!11111 V!11111 (_ BitVec 64) (_ BitVec 32) Int) Unit!10817)

(declare-fun arrayScanForKey!0 (array!18789 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!349557 (= lt!164227 (lemmaArrayContainsKeyThenInListMap!317 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(declare-fun b!349558 () Bool)

(declare-fun res!193736 () Bool)

(declare-fun e!214129 () Bool)

(assert (=> b!349558 (=> (not res!193736) (not e!214129))))

(declare-datatypes ((tuple2!5552 0))(
  ( (tuple2!5553 (_1!2787 (_ BitVec 64)) (_2!2787 V!11111)) )
))
(declare-datatypes ((List!5174 0))(
  ( (Nil!5171) (Cons!5170 (h!6026 tuple2!5552) (t!10308 List!5174)) )
))
(declare-datatypes ((ListLongMap!4465 0))(
  ( (ListLongMap!4466 (toList!2248 List!5174)) )
))
(declare-fun contains!2315 (ListLongMap!4465 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1769 (array!18789 array!18787 (_ BitVec 32) (_ BitVec 32) V!11111 V!11111 (_ BitVec 32) Int) ListLongMap!4465)

(assert (=> b!349558 (= res!193736 (not (contains!2315 (getCurrentListMap!1769 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!349559 () Bool)

(declare-fun e!214125 () Bool)

(declare-fun tp_is_empty!7601 () Bool)

(assert (=> b!349559 (= e!214125 tp_is_empty!7601)))

(declare-fun b!349560 () Bool)

(declare-fun e!214126 () Bool)

(assert (=> b!349560 (= e!214126 (and e!214125 mapRes!12867))))

(declare-fun condMapEmpty!12867 () Bool)

(declare-fun mapDefault!12867 () ValueCell!3457)

