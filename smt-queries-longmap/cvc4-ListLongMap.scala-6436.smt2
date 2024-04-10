; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82416 () Bool)

(assert start!82416)

(declare-fun res!643235 () Bool)

(declare-fun e!541737 () Bool)

(assert (=> start!82416 (=> (not res!643235) (not e!541737))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82416 (= res!643235 (validMask!0 mask!2110))))

(assert (=> start!82416 e!541737))

(assert (=> start!82416 true))

(declare-datatypes ((V!33509 0))(
  ( (V!33510 (val!10748 Int)) )
))
(declare-datatypes ((ValueCell!10216 0))(
  ( (ValueCellFull!10216 (v!13305 V!33509)) (EmptyCell!10216) )
))
(declare-datatypes ((array!58877 0))(
  ( (array!58878 (arr!28312 (Array (_ BitVec 32) ValueCell!10216)) (size!28791 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58877)

(declare-fun e!541738 () Bool)

(declare-fun array_inv!21937 (array!58877) Bool)

(assert (=> start!82416 (and (array_inv!21937 _values!1400) e!541738)))

(declare-datatypes ((array!58879 0))(
  ( (array!58880 (arr!28313 (Array (_ BitVec 32) (_ BitVec 64))) (size!28792 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58879)

(declare-fun array_inv!21938 (array!58879) Bool)

(assert (=> start!82416 (array_inv!21938 _keys!1686)))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun b!960976 () Bool)

(assert (=> b!960976 (= e!541737 (and (= (size!28791 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28792 _keys!1686) (size!28791 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011) (= (size!28792 _keys!1686) (bvadd #b00000000000000000000000000000001 mask!2110)) (bvsgt #b00000000000000000000000000000000 (size!28792 _keys!1686))))))

(declare-fun mapNonEmpty!34072 () Bool)

(declare-fun mapRes!34072 () Bool)

(declare-fun tp!65001 () Bool)

(declare-fun e!541740 () Bool)

(assert (=> mapNonEmpty!34072 (= mapRes!34072 (and tp!65001 e!541740))))

(declare-fun mapRest!34072 () (Array (_ BitVec 32) ValueCell!10216))

(declare-fun mapKey!34072 () (_ BitVec 32))

(declare-fun mapValue!34072 () ValueCell!10216)

(assert (=> mapNonEmpty!34072 (= (arr!28312 _values!1400) (store mapRest!34072 mapKey!34072 mapValue!34072))))

(declare-fun b!960977 () Bool)

(declare-fun e!541739 () Bool)

(assert (=> b!960977 (= e!541738 (and e!541739 mapRes!34072))))

(declare-fun condMapEmpty!34072 () Bool)

(declare-fun mapDefault!34072 () ValueCell!10216)

