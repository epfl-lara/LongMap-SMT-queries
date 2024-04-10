; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82428 () Bool)

(assert start!82428)

(declare-fun b!961036 () Bool)

(declare-fun e!541788 () Bool)

(declare-fun tp_is_empty!21401 () Bool)

(assert (=> b!961036 (= e!541788 tp_is_empty!21401)))

(declare-fun res!643262 () Bool)

(declare-fun e!541791 () Bool)

(assert (=> start!82428 (=> (not res!643262) (not e!541791))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82428 (= res!643262 (validMask!0 mask!2110))))

(assert (=> start!82428 e!541791))

(assert (=> start!82428 true))

(declare-datatypes ((V!33517 0))(
  ( (V!33518 (val!10751 Int)) )
))
(declare-datatypes ((ValueCell!10219 0))(
  ( (ValueCellFull!10219 (v!13308 V!33517)) (EmptyCell!10219) )
))
(declare-datatypes ((array!58891 0))(
  ( (array!58892 (arr!28318 (Array (_ BitVec 32) ValueCell!10219)) (size!28797 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58891)

(declare-fun e!541789 () Bool)

(declare-fun array_inv!21943 (array!58891) Bool)

(assert (=> start!82428 (and (array_inv!21943 _values!1400) e!541789)))

(declare-datatypes ((array!58893 0))(
  ( (array!58894 (arr!28319 (Array (_ BitVec 32) (_ BitVec 64))) (size!28798 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58893)

(declare-fun array_inv!21944 (array!58893) Bool)

(assert (=> start!82428 (array_inv!21944 _keys!1686)))

(declare-fun mapIsEmpty!34084 () Bool)

(declare-fun mapRes!34084 () Bool)

(assert (=> mapIsEmpty!34084 mapRes!34084))

(declare-fun b!961037 () Bool)

(declare-fun res!643261 () Bool)

(assert (=> b!961037 (=> (not res!643261) (not e!541791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58893 (_ BitVec 32)) Bool)

(assert (=> b!961037 (= res!643261 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961038 () Bool)

(declare-fun res!643260 () Bool)

(assert (=> b!961038 (=> (not res!643260) (not e!541791))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961038 (= res!643260 (and (= (size!28797 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28798 _keys!1686) (size!28797 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961039 () Bool)

(assert (=> b!961039 (= e!541791 (bvsgt #b00000000000000000000000000000000 (size!28798 _keys!1686)))))

(declare-fun b!961040 () Bool)

(assert (=> b!961040 (= e!541789 (and e!541788 mapRes!34084))))

(declare-fun condMapEmpty!34084 () Bool)

(declare-fun mapDefault!34084 () ValueCell!10219)

