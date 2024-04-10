; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82130 () Bool)

(assert start!82130)

(declare-fun mapNonEmpty!33643 () Bool)

(declare-fun mapRes!33643 () Bool)

(declare-fun tp!64248 () Bool)

(declare-fun e!539591 () Bool)

(assert (=> mapNonEmpty!33643 (= mapRes!33643 (and tp!64248 e!539591))))

(declare-datatypes ((V!33129 0))(
  ( (V!33130 (val!10605 Int)) )
))
(declare-datatypes ((ValueCell!10073 0))(
  ( (ValueCellFull!10073 (v!13162 V!33129)) (EmptyCell!10073) )
))
(declare-fun mapValue!33643 () ValueCell!10073)

(declare-fun mapRest!33643 () (Array (_ BitVec 32) ValueCell!10073))

(declare-datatypes ((array!58325 0))(
  ( (array!58326 (arr!28036 (Array (_ BitVec 32) ValueCell!10073)) (size!28515 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58325)

(declare-fun mapKey!33643 () (_ BitVec 32))

(assert (=> mapNonEmpty!33643 (= (arr!28036 _values!1386) (store mapRest!33643 mapKey!33643 mapValue!33643))))

(declare-fun res!640877 () Bool)

(declare-fun e!539592 () Bool)

(assert (=> start!82130 (=> (not res!640877) (not e!539592))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82130 (= res!640877 (validMask!0 mask!2088))))

(assert (=> start!82130 e!539592))

(assert (=> start!82130 true))

(declare-fun e!539593 () Bool)

(declare-fun array_inv!21751 (array!58325) Bool)

(assert (=> start!82130 (and (array_inv!21751 _values!1386) e!539593)))

(declare-datatypes ((array!58327 0))(
  ( (array!58328 (arr!28037 (Array (_ BitVec 32) (_ BitVec 64))) (size!28516 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58327)

(declare-fun array_inv!21752 (array!58327) Bool)

(assert (=> start!82130 (array_inv!21752 _keys!1668)))

(declare-fun b!957329 () Bool)

(declare-fun e!539595 () Bool)

(declare-fun tp_is_empty!21109 () Bool)

(assert (=> b!957329 (= e!539595 tp_is_empty!21109)))

(declare-fun b!957330 () Bool)

(assert (=> b!957330 (= e!539593 (and e!539595 mapRes!33643))))

(declare-fun condMapEmpty!33643 () Bool)

(declare-fun mapDefault!33643 () ValueCell!10073)

