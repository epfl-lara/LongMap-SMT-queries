; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34798 () Bool)

(assert start!34798)

(declare-fun b_free!7583 () Bool)

(declare-fun b_next!7583 () Bool)

(assert (=> start!34798 (= b_free!7583 (not b_next!7583))))

(declare-fun tp!26316 () Bool)

(declare-fun b_and!14805 () Bool)

(assert (=> start!34798 (= tp!26316 b_and!14805)))

(declare-fun res!192827 () Bool)

(declare-fun e!213342 () Bool)

(assert (=> start!34798 (=> (not res!192827) (not e!213342))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34798 (= res!192827 (validMask!0 mask!2385))))

(assert (=> start!34798 e!213342))

(assert (=> start!34798 true))

(declare-fun tp_is_empty!7535 () Bool)

(assert (=> start!34798 tp_is_empty!7535))

(assert (=> start!34798 tp!26316))

(declare-datatypes ((V!11023 0))(
  ( (V!11024 (val!3812 Int)) )
))
(declare-datatypes ((ValueCell!3424 0))(
  ( (ValueCellFull!3424 (v!5995 V!11023)) (EmptyCell!3424) )
))
(declare-datatypes ((array!18657 0))(
  ( (array!18658 (arr!8838 (Array (_ BitVec 32) ValueCell!3424)) (size!9190 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18657)

(declare-fun e!213339 () Bool)

(declare-fun array_inv!6544 (array!18657) Bool)

(assert (=> start!34798 (and (array_inv!6544 _values!1525) e!213339)))

(declare-datatypes ((array!18659 0))(
  ( (array!18660 (arr!8839 (Array (_ BitVec 32) (_ BitVec 64))) (size!9191 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18659)

(declare-fun array_inv!6545 (array!18659) Bool)

(assert (=> start!34798 (array_inv!6545 _keys!1895)))

(declare-fun b!348179 () Bool)

(declare-fun res!192825 () Bool)

(assert (=> b!348179 (=> (not res!192825) (not e!213342))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!11023)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!11023)

(declare-datatypes ((tuple2!5512 0))(
  ( (tuple2!5513 (_1!2767 (_ BitVec 64)) (_2!2767 V!11023)) )
))
(declare-datatypes ((List!5134 0))(
  ( (Nil!5131) (Cons!5130 (h!5986 tuple2!5512) (t!10264 List!5134)) )
))
(declare-datatypes ((ListLongMap!4425 0))(
  ( (ListLongMap!4426 (toList!2228 List!5134)) )
))
(declare-fun contains!2293 (ListLongMap!4425 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1749 (array!18659 array!18657 (_ BitVec 32) (_ BitVec 32) V!11023 V!11023 (_ BitVec 32) Int) ListLongMap!4425)

(assert (=> b!348179 (= res!192825 (not (contains!2293 (getCurrentListMap!1749 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!348180 () Bool)

(declare-fun e!213343 () Bool)

(assert (=> b!348180 (= e!213343 false)))

(declare-fun lt!163831 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!18659 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!348180 (= lt!163831 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348181 () Bool)

(declare-fun res!192832 () Bool)

(assert (=> b!348181 (=> (not res!192832) (not e!213342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18659 (_ BitVec 32)) Bool)

(assert (=> b!348181 (= res!192832 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12762 () Bool)

(declare-fun mapRes!12762 () Bool)

(declare-fun tp!26315 () Bool)

(declare-fun e!213344 () Bool)

(assert (=> mapNonEmpty!12762 (= mapRes!12762 (and tp!26315 e!213344))))

(declare-fun mapKey!12762 () (_ BitVec 32))

(declare-fun mapValue!12762 () ValueCell!3424)

(declare-fun mapRest!12762 () (Array (_ BitVec 32) ValueCell!3424))

(assert (=> mapNonEmpty!12762 (= (arr!8838 _values!1525) (store mapRest!12762 mapKey!12762 mapValue!12762))))

(declare-fun b!348182 () Bool)

(declare-fun res!192826 () Bool)

(assert (=> b!348182 (=> (not res!192826) (not e!213342))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!348182 (= res!192826 (validKeyInArray!0 k!1348))))

(declare-fun mapIsEmpty!12762 () Bool)

(assert (=> mapIsEmpty!12762 mapRes!12762))

(declare-fun b!348183 () Bool)

(declare-fun res!192830 () Bool)

(assert (=> b!348183 (=> (not res!192830) (not e!213342))))

(assert (=> b!348183 (= res!192830 (and (= (size!9190 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9191 _keys!1895) (size!9190 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!348184 () Bool)

(declare-fun e!213340 () Bool)

(assert (=> b!348184 (= e!213340 tp_is_empty!7535)))

(declare-fun b!348185 () Bool)

(declare-fun res!192831 () Bool)

(assert (=> b!348185 (=> (not res!192831) (not e!213343))))

(declare-fun arrayContainsKey!0 (array!18659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!348185 (= res!192831 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!348186 () Bool)

(assert (=> b!348186 (= e!213339 (and e!213340 mapRes!12762))))

(declare-fun condMapEmpty!12762 () Bool)

(declare-fun mapDefault!12762 () ValueCell!3424)

