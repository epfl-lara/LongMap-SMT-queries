; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35820 () Bool)

(assert start!35820)

(declare-fun res!200033 () Bool)

(declare-fun e!220425 () Bool)

(assert (=> start!35820 (=> (not res!200033) (not e!220425))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35820 (= res!200033 (validMask!0 mask!1842))))

(assert (=> start!35820 e!220425))

(declare-fun tp_is_empty!8273 () Bool)

(assert (=> start!35820 tp_is_empty!8273))

(assert (=> start!35820 true))

(declare-datatypes ((array!20099 0))(
  ( (array!20100 (arr!9543 (Array (_ BitVec 32) (_ BitVec 64))) (size!9895 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20099)

(declare-fun array_inv!7020 (array!20099) Bool)

(assert (=> start!35820 (array_inv!7020 _keys!1456)))

(declare-datatypes ((V!12007 0))(
  ( (V!12008 (val!4181 Int)) )
))
(declare-datatypes ((ValueCell!3793 0))(
  ( (ValueCellFull!3793 (v!6375 V!12007)) (EmptyCell!3793) )
))
(declare-datatypes ((array!20101 0))(
  ( (array!20102 (arr!9544 (Array (_ BitVec 32) ValueCell!3793)) (size!9896 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20101)

(declare-fun e!220426 () Bool)

(declare-fun array_inv!7021 (array!20101) Bool)

(assert (=> start!35820 (and (array_inv!7021 _values!1208) e!220426)))

(declare-fun b!359853 () Bool)

(declare-fun e!220423 () Bool)

(declare-fun mapRes!13917 () Bool)

(assert (=> b!359853 (= e!220426 (and e!220423 mapRes!13917))))

(declare-fun condMapEmpty!13917 () Bool)

(declare-fun mapDefault!13917 () ValueCell!3793)

