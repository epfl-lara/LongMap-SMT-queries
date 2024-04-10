; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35910 () Bool)

(assert start!35910)

(declare-fun res!200871 () Bool)

(declare-fun e!221025 () Bool)

(assert (=> start!35910 (=> (not res!200871) (not e!221025))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35910 (= res!200871 (validMask!0 mask!1943))))

(assert (=> start!35910 e!221025))

(assert (=> start!35910 true))

(declare-datatypes ((V!12107 0))(
  ( (V!12108 (val!4218 Int)) )
))
(declare-datatypes ((ValueCell!3830 0))(
  ( (ValueCellFull!3830 (v!6412 V!12107)) (EmptyCell!3830) )
))
(declare-datatypes ((array!20241 0))(
  ( (array!20242 (arr!9613 (Array (_ BitVec 32) ValueCell!3830)) (size!9965 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20241)

(declare-fun e!221024 () Bool)

(declare-fun array_inv!7070 (array!20241) Bool)

(assert (=> start!35910 (and (array_inv!7070 _values!1277) e!221024)))

(declare-datatypes ((array!20243 0))(
  ( (array!20244 (arr!9614 (Array (_ BitVec 32) (_ BitVec 64))) (size!9966 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20243)

(declare-fun array_inv!7071 (array!20243) Bool)

(assert (=> start!35910 (array_inv!7071 _keys!1541)))

(declare-fun b!361049 () Bool)

(declare-fun e!221023 () Bool)

(declare-fun tp_is_empty!8347 () Bool)

(assert (=> b!361049 (= e!221023 tp_is_empty!8347)))

(declare-fun mapIsEmpty!14031 () Bool)

(declare-fun mapRes!14031 () Bool)

(assert (=> mapIsEmpty!14031 mapRes!14031))

(declare-fun b!361050 () Bool)

(declare-fun e!221026 () Bool)

(assert (=> b!361050 (= e!221024 (and e!221026 mapRes!14031))))

(declare-fun condMapEmpty!14031 () Bool)

(declare-fun mapDefault!14031 () ValueCell!3830)

