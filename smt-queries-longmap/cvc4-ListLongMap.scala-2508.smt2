; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38870 () Bool)

(assert start!38870)

(declare-fun mapNonEmpty!17055 () Bool)

(declare-fun mapRes!17055 () Bool)

(declare-fun tp!33174 () Bool)

(declare-fun e!244108 () Bool)

(assert (=> mapNonEmpty!17055 (= mapRes!17055 (and tp!33174 e!244108))))

(declare-datatypes ((V!14823 0))(
  ( (V!14824 (val!5189 Int)) )
))
(declare-datatypes ((ValueCell!4801 0))(
  ( (ValueCellFull!4801 (v!7436 V!14823)) (EmptyCell!4801) )
))
(declare-datatypes ((array!24469 0))(
  ( (array!24470 (arr!11684 (Array (_ BitVec 32) ValueCell!4801)) (size!12036 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24469)

(declare-fun mapKey!17055 () (_ BitVec 32))

(declare-fun mapValue!17055 () ValueCell!4801)

(declare-fun mapRest!17055 () (Array (_ BitVec 32) ValueCell!4801))

(assert (=> mapNonEmpty!17055 (= (arr!11684 _values!549) (store mapRest!17055 mapKey!17055 mapValue!17055))))

(declare-fun b!406157 () Bool)

(declare-fun res!234560 () Bool)

(declare-fun e!244107 () Bool)

(assert (=> b!406157 (=> (not res!234560) (not e!244107))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24471 0))(
  ( (array!24472 (arr!11685 (Array (_ BitVec 32) (_ BitVec 64))) (size!12037 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24471)

(assert (=> b!406157 (= res!234560 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12037 _keys!709))))))

(declare-fun b!406158 () Bool)

(declare-fun res!234565 () Bool)

(assert (=> b!406158 (=> (not res!234565) (not e!244107))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24471 (_ BitVec 32)) Bool)

(assert (=> b!406158 (= res!234565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406159 () Bool)

(declare-fun e!244109 () Bool)

(assert (=> b!406159 (= e!244109 false)))

(declare-fun lt!188446 () Bool)

(declare-fun lt!188447 () array!24471)

(declare-datatypes ((List!6787 0))(
  ( (Nil!6784) (Cons!6783 (h!7639 (_ BitVec 64)) (t!11961 List!6787)) )
))
(declare-fun arrayNoDuplicates!0 (array!24471 (_ BitVec 32) List!6787) Bool)

(assert (=> b!406159 (= lt!188446 (arrayNoDuplicates!0 lt!188447 #b00000000000000000000000000000000 Nil!6784))))

(declare-fun b!406160 () Bool)

(declare-fun tp_is_empty!10289 () Bool)

(assert (=> b!406160 (= e!244108 tp_is_empty!10289)))

(declare-fun res!234563 () Bool)

(assert (=> start!38870 (=> (not res!234563) (not e!244107))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38870 (= res!234563 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12037 _keys!709))))))

(assert (=> start!38870 e!244107))

(assert (=> start!38870 true))

(declare-fun e!244105 () Bool)

(declare-fun array_inv!8534 (array!24469) Bool)

(assert (=> start!38870 (and (array_inv!8534 _values!549) e!244105)))

(declare-fun array_inv!8535 (array!24471) Bool)

(assert (=> start!38870 (array_inv!8535 _keys!709)))

(declare-fun b!406161 () Bool)

(declare-fun res!234561 () Bool)

(assert (=> b!406161 (=> (not res!234561) (not e!244107))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406161 (= res!234561 (and (= (size!12036 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12037 _keys!709) (size!12036 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17055 () Bool)

(assert (=> mapIsEmpty!17055 mapRes!17055))

(declare-fun b!406162 () Bool)

(declare-fun res!234562 () Bool)

(assert (=> b!406162 (=> (not res!234562) (not e!244107))))

(assert (=> b!406162 (= res!234562 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6784))))

(declare-fun b!406163 () Bool)

(declare-fun e!244110 () Bool)

(assert (=> b!406163 (= e!244105 (and e!244110 mapRes!17055))))

(declare-fun condMapEmpty!17055 () Bool)

(declare-fun mapDefault!17055 () ValueCell!4801)

