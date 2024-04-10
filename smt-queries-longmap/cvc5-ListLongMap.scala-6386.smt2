; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82082 () Bool)

(assert start!82082)

(declare-fun res!640720 () Bool)

(declare-fun e!539386 () Bool)

(assert (=> start!82082 (=> (not res!640720) (not e!539386))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82082 (= res!640720 (validMask!0 mask!2088))))

(assert (=> start!82082 e!539386))

(assert (=> start!82082 true))

(declare-datatypes ((V!33105 0))(
  ( (V!33106 (val!10596 Int)) )
))
(declare-datatypes ((ValueCell!10064 0))(
  ( (ValueCellFull!10064 (v!13152 V!33105)) (EmptyCell!10064) )
))
(declare-datatypes ((array!58283 0))(
  ( (array!58284 (arr!28018 (Array (_ BitVec 32) ValueCell!10064)) (size!28497 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58283)

(declare-fun e!539382 () Bool)

(declare-fun array_inv!21739 (array!58283) Bool)

(assert (=> start!82082 (and (array_inv!21739 _values!1386) e!539382)))

(declare-datatypes ((array!58285 0))(
  ( (array!58286 (arr!28019 (Array (_ BitVec 32) (_ BitVec 64))) (size!28498 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58285)

(declare-fun array_inv!21740 (array!58285) Bool)

(assert (=> start!82082 (array_inv!21740 _keys!1668)))

(declare-fun mapIsEmpty!33607 () Bool)

(declare-fun mapRes!33607 () Bool)

(assert (=> mapIsEmpty!33607 mapRes!33607))

(declare-fun b!957051 () Bool)

(declare-fun res!640721 () Bool)

(assert (=> b!957051 (=> (not res!640721) (not e!539386))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957051 (= res!640721 (and (= (size!28497 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28498 _keys!1668) (size!28497 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957052 () Bool)

(declare-fun res!640722 () Bool)

(assert (=> b!957052 (=> (not res!640722) (not e!539386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58285 (_ BitVec 32)) Bool)

(assert (=> b!957052 (= res!640722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957053 () Bool)

(declare-fun e!539385 () Bool)

(assert (=> b!957053 (= e!539382 (and e!539385 mapRes!33607))))

(declare-fun condMapEmpty!33607 () Bool)

(declare-fun mapDefault!33607 () ValueCell!10064)

