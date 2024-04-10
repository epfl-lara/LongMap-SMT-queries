; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82412 () Bool)

(assert start!82412)

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33505 0))(
  ( (V!33506 (val!10746 Int)) )
))
(declare-datatypes ((ValueCell!10214 0))(
  ( (ValueCellFull!10214 (v!13303 V!33505)) (EmptyCell!10214) )
))
(declare-datatypes ((array!58869 0))(
  ( (array!58870 (arr!28308 (Array (_ BitVec 32) ValueCell!10214)) (size!28787 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58869)

(declare-datatypes ((array!58871 0))(
  ( (array!58872 (arr!28309 (Array (_ BitVec 32) (_ BitVec 64))) (size!28788 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58871)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun b!960952 () Bool)

(declare-fun e!541706 () Bool)

(assert (=> b!960952 (= e!541706 (and (= (size!28787 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28788 _keys!1686) (size!28787 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011) (= (size!28788 _keys!1686) (bvadd #b00000000000000000000000000000001 mask!2110)) (bvsgt #b00000000000000000000000000000000 (size!28788 _keys!1686))))))

(declare-fun res!643229 () Bool)

(assert (=> start!82412 (=> (not res!643229) (not e!541706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82412 (= res!643229 (validMask!0 mask!2110))))

(assert (=> start!82412 e!541706))

(assert (=> start!82412 true))

(declare-fun e!541709 () Bool)

(declare-fun array_inv!21933 (array!58869) Bool)

(assert (=> start!82412 (and (array_inv!21933 _values!1400) e!541709)))

(declare-fun array_inv!21934 (array!58871) Bool)

(assert (=> start!82412 (array_inv!21934 _keys!1686)))

(declare-fun mapNonEmpty!34066 () Bool)

(declare-fun mapRes!34066 () Bool)

(declare-fun tp!64995 () Bool)

(declare-fun e!541707 () Bool)

(assert (=> mapNonEmpty!34066 (= mapRes!34066 (and tp!64995 e!541707))))

(declare-fun mapKey!34066 () (_ BitVec 32))

(declare-fun mapValue!34066 () ValueCell!10214)

(declare-fun mapRest!34066 () (Array (_ BitVec 32) ValueCell!10214))

(assert (=> mapNonEmpty!34066 (= (arr!28308 _values!1400) (store mapRest!34066 mapKey!34066 mapValue!34066))))

(declare-fun b!960953 () Bool)

(declare-fun tp_is_empty!21391 () Bool)

(assert (=> b!960953 (= e!541707 tp_is_empty!21391)))

(declare-fun mapIsEmpty!34066 () Bool)

(assert (=> mapIsEmpty!34066 mapRes!34066))

(declare-fun b!960954 () Bool)

(declare-fun e!541708 () Bool)

(assert (=> b!960954 (= e!541708 tp_is_empty!21391)))

(declare-fun b!960955 () Bool)

(assert (=> b!960955 (= e!541709 (and e!541708 mapRes!34066))))

(declare-fun condMapEmpty!34066 () Bool)

(declare-fun mapDefault!34066 () ValueCell!10214)

