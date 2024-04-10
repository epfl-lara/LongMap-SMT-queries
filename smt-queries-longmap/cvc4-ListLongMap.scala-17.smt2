; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!516 () Bool)

(assert start!516)

(declare-fun b!3050 () Bool)

(declare-fun e!1327 () Bool)

(declare-datatypes ((List!42 0))(
  ( (Nil!39) (Cons!38 (h!604 (_ BitVec 64)) (t!2169 List!42)) )
))
(declare-fun contains!13 (List!42 (_ BitVec 64)) Bool)

(assert (=> b!3050 (= e!1327 (contains!13 Nil!39 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!3051 () Bool)

(declare-fun res!4985 () Bool)

(declare-fun e!1324 () Bool)

(assert (=> b!3051 (=> (not res!4985) (not e!1324))))

(declare-datatypes ((array!115 0))(
  ( (array!116 (arr!52 (Array (_ BitVec 32) (_ BitVec 64))) (size!114 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!115)

(assert (=> b!3051 (= res!4985 (and (bvsle #b00000000000000000000000000000000 (size!114 _keys!1806)) (bvslt (size!114 _keys!1806) #b01111111111111111111111111111111)))))

(declare-fun b!3052 () Bool)

(assert (=> b!3052 (= e!1324 e!1327)))

(declare-fun res!4982 () Bool)

(assert (=> b!3052 (=> res!4982 e!1327)))

(assert (=> b!3052 (= res!4982 (contains!13 Nil!39 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!3053 () Bool)

(declare-fun e!1328 () Bool)

(declare-fun tp_is_empty!89 () Bool)

(assert (=> b!3053 (= e!1328 tp_is_empty!89)))

(declare-fun b!3054 () Bool)

(declare-fun e!1329 () Bool)

(assert (=> b!3054 (= e!1329 tp_is_empty!89)))

(declare-fun mapNonEmpty!86 () Bool)

(declare-fun mapRes!86 () Bool)

(declare-fun tp!326 () Bool)

(assert (=> mapNonEmpty!86 (= mapRes!86 (and tp!326 e!1328))))

(declare-fun mapKey!86 () (_ BitVec 32))

(declare-datatypes ((V!295 0))(
  ( (V!296 (val!50 Int)) )
))
(declare-datatypes ((ValueCell!28 0))(
  ( (ValueCellFull!28 (v!1136 V!295)) (EmptyCell!28) )
))
(declare-fun mapValue!86 () ValueCell!28)

(declare-datatypes ((array!117 0))(
  ( (array!118 (arr!53 (Array (_ BitVec 32) ValueCell!28)) (size!115 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!117)

(declare-fun mapRest!86 () (Array (_ BitVec 32) ValueCell!28))

(assert (=> mapNonEmpty!86 (= (arr!53 _values!1492) (store mapRest!86 mapKey!86 mapValue!86))))

(declare-fun mapIsEmpty!86 () Bool)

(assert (=> mapIsEmpty!86 mapRes!86))

(declare-fun b!3055 () Bool)

(declare-fun res!4984 () Bool)

(assert (=> b!3055 (=> (not res!4984) (not e!1324))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!115 (_ BitVec 32)) Bool)

(assert (=> b!3055 (= res!4984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!3056 () Bool)

(declare-fun res!4980 () Bool)

(assert (=> b!3056 (=> (not res!4980) (not e!1324))))

(declare-fun noDuplicate!9 (List!42) Bool)

(assert (=> b!3056 (= res!4980 (noDuplicate!9 Nil!39))))

(declare-fun res!4983 () Bool)

(assert (=> start!516 (=> (not res!4983) (not e!1324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!516 (= res!4983 (validMask!0 mask!2250))))

(assert (=> start!516 e!1324))

(assert (=> start!516 true))

(declare-fun e!1325 () Bool)

(declare-fun array_inv!33 (array!117) Bool)

(assert (=> start!516 (and (array_inv!33 _values!1492) e!1325)))

(declare-fun array_inv!34 (array!115) Bool)

(assert (=> start!516 (array_inv!34 _keys!1806)))

(declare-fun b!3057 () Bool)

(declare-fun res!4981 () Bool)

(assert (=> b!3057 (=> (not res!4981) (not e!1324))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!3057 (= res!4981 (and (= (size!115 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!114 _keys!1806) (size!115 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!3058 () Bool)

(assert (=> b!3058 (= e!1325 (and e!1329 mapRes!86))))

(declare-fun condMapEmpty!86 () Bool)

(declare-fun mapDefault!86 () ValueCell!28)

