; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82406 () Bool)

(assert start!82406)

(declare-fun res!643220 () Bool)

(declare-fun e!541664 () Bool)

(assert (=> start!82406 (=> (not res!643220) (not e!541664))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82406 (= res!643220 (validMask!0 mask!2110))))

(assert (=> start!82406 e!541664))

(assert (=> start!82406 true))

(declare-datatypes ((V!33497 0))(
  ( (V!33498 (val!10743 Int)) )
))
(declare-datatypes ((ValueCell!10211 0))(
  ( (ValueCellFull!10211 (v!13300 V!33497)) (EmptyCell!10211) )
))
(declare-datatypes ((array!58859 0))(
  ( (array!58860 (arr!28303 (Array (_ BitVec 32) ValueCell!10211)) (size!28782 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58859)

(declare-fun e!541662 () Bool)

(declare-fun array_inv!21929 (array!58859) Bool)

(assert (=> start!82406 (and (array_inv!21929 _values!1400) e!541662)))

(declare-datatypes ((array!58861 0))(
  ( (array!58862 (arr!28304 (Array (_ BitVec 32) (_ BitVec 64))) (size!28783 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58861)

(declare-fun array_inv!21930 (array!58861) Bool)

(assert (=> start!82406 (array_inv!21930 _keys!1686)))

(declare-fun mapNonEmpty!34057 () Bool)

(declare-fun mapRes!34057 () Bool)

(declare-fun tp!64986 () Bool)

(declare-fun e!541661 () Bool)

(assert (=> mapNonEmpty!34057 (= mapRes!34057 (and tp!64986 e!541661))))

(declare-fun mapRest!34057 () (Array (_ BitVec 32) ValueCell!10211))

(declare-fun mapKey!34057 () (_ BitVec 32))

(declare-fun mapValue!34057 () ValueCell!10211)

(assert (=> mapNonEmpty!34057 (= (arr!28303 _values!1400) (store mapRest!34057 mapKey!34057 mapValue!34057))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun b!960916 () Bool)

(assert (=> b!960916 (= e!541664 (and (= (size!28782 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28783 _keys!1686) (size!28782 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011) (not (= (size!28783 _keys!1686) (bvadd #b00000000000000000000000000000001 mask!2110)))))))

(declare-fun b!960917 () Bool)

(declare-fun tp_is_empty!21385 () Bool)

(assert (=> b!960917 (= e!541661 tp_is_empty!21385)))

(declare-fun b!960918 () Bool)

(declare-fun e!541663 () Bool)

(assert (=> b!960918 (= e!541662 (and e!541663 mapRes!34057))))

(declare-fun condMapEmpty!34057 () Bool)

(declare-fun mapDefault!34057 () ValueCell!10211)

