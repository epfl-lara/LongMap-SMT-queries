; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82424 () Bool)

(assert start!82424)

(declare-fun b!961000 () Bool)

(declare-fun e!541758 () Bool)

(declare-fun tp_is_empty!21397 () Bool)

(assert (=> b!961000 (= e!541758 tp_is_empty!21397)))

(declare-fun b!961001 () Bool)

(declare-fun res!643242 () Bool)

(declare-fun e!541760 () Bool)

(assert (=> b!961001 (=> (not res!643242) (not e!541760))))

(declare-datatypes ((array!58883 0))(
  ( (array!58884 (arr!28314 (Array (_ BitVec 32) (_ BitVec 64))) (size!28793 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58883)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58883 (_ BitVec 32)) Bool)

(assert (=> b!961001 (= res!643242 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun mapIsEmpty!34078 () Bool)

(declare-fun mapRes!34078 () Bool)

(assert (=> mapIsEmpty!34078 mapRes!34078))

(declare-fun res!643243 () Bool)

(assert (=> start!82424 (=> (not res!643243) (not e!541760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82424 (= res!643243 (validMask!0 mask!2110))))

(assert (=> start!82424 e!541760))

(assert (=> start!82424 true))

(declare-datatypes ((V!33513 0))(
  ( (V!33514 (val!10749 Int)) )
))
(declare-datatypes ((ValueCell!10217 0))(
  ( (ValueCellFull!10217 (v!13306 V!33513)) (EmptyCell!10217) )
))
(declare-datatypes ((array!58885 0))(
  ( (array!58886 (arr!28315 (Array (_ BitVec 32) ValueCell!10217)) (size!28794 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58885)

(declare-fun e!541759 () Bool)

(declare-fun array_inv!21939 (array!58885) Bool)

(assert (=> start!82424 (and (array_inv!21939 _values!1400) e!541759)))

(declare-fun array_inv!21940 (array!58883) Bool)

(assert (=> start!82424 (array_inv!21940 _keys!1686)))

(declare-fun b!961002 () Bool)

(assert (=> b!961002 (= e!541760 (bvsgt #b00000000000000000000000000000000 (size!28793 _keys!1686)))))

(declare-fun b!961003 () Bool)

(assert (=> b!961003 (= e!541759 (and e!541758 mapRes!34078))))

(declare-fun condMapEmpty!34078 () Bool)

(declare-fun mapDefault!34078 () ValueCell!10217)

