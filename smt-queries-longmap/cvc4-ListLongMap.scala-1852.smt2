; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33484 () Bool)

(assert start!33484)

(declare-fun b!332343 () Bool)

(declare-fun e!204062 () Bool)

(assert (=> b!332343 (= e!204062 false)))

(declare-fun lt!159001 () Bool)

(declare-datatypes ((array!17069 0))(
  ( (array!17070 (arr!8069 (Array (_ BitVec 32) (_ BitVec 64))) (size!8421 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17069)

(declare-datatypes ((List!4591 0))(
  ( (Nil!4588) (Cons!4587 (h!5443 (_ BitVec 64)) (t!9673 List!4591)) )
))
(declare-fun arrayNoDuplicates!0 (array!17069 (_ BitVec 32) List!4591) Bool)

(assert (=> b!332343 (= lt!159001 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4588))))

(declare-fun b!332344 () Bool)

(declare-fun e!204063 () Bool)

(declare-fun tp_is_empty!6737 () Bool)

(assert (=> b!332344 (= e!204063 tp_is_empty!6737)))

(declare-fun b!332345 () Bool)

(declare-fun e!204066 () Bool)

(declare-fun e!204064 () Bool)

(declare-fun mapRes!11490 () Bool)

(assert (=> b!332345 (= e!204066 (and e!204064 mapRes!11490))))

(declare-fun condMapEmpty!11490 () Bool)

(declare-datatypes ((V!9959 0))(
  ( (V!9960 (val!3413 Int)) )
))
(declare-datatypes ((ValueCell!3025 0))(
  ( (ValueCellFull!3025 (v!5572 V!9959)) (EmptyCell!3025) )
))
(declare-datatypes ((array!17071 0))(
  ( (array!17072 (arr!8070 (Array (_ BitVec 32) ValueCell!3025)) (size!8422 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17071)

(declare-fun mapDefault!11490 () ValueCell!3025)

