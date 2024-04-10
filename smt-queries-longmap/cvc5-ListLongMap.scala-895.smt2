; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20466 () Bool)

(assert start!20466)

(declare-fun b_free!5125 () Bool)

(declare-fun b_next!5125 () Bool)

(assert (=> start!20466 (= b_free!5125 (not b_next!5125))))

(declare-fun tp!18407 () Bool)

(declare-fun b_and!11871 () Bool)

(assert (=> start!20466 (= tp!18407 b_and!11871)))

(declare-fun res!97340 () Bool)

(declare-fun e!132862 () Bool)

(assert (=> start!20466 (=> (not res!97340) (not e!132862))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20466 (= res!97340 (validMask!0 mask!1149))))

(assert (=> start!20466 e!132862))

(declare-datatypes ((V!6289 0))(
  ( (V!6290 (val!2535 Int)) )
))
(declare-datatypes ((ValueCell!2147 0))(
  ( (ValueCellFull!2147 (v!4505 V!6289)) (EmptyCell!2147) )
))
(declare-datatypes ((array!9187 0))(
  ( (array!9188 (arr!4344 (Array (_ BitVec 32) ValueCell!2147)) (size!4669 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9187)

(declare-fun e!132864 () Bool)

(declare-fun array_inv!2867 (array!9187) Bool)

(assert (=> start!20466 (and (array_inv!2867 _values!649) e!132864)))

(assert (=> start!20466 true))

(declare-fun tp_is_empty!4981 () Bool)

(assert (=> start!20466 tp_is_empty!4981))

(declare-datatypes ((array!9189 0))(
  ( (array!9190 (arr!4345 (Array (_ BitVec 32) (_ BitVec 64))) (size!4670 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9189)

(declare-fun array_inv!2868 (array!9189) Bool)

(assert (=> start!20466 (array_inv!2868 _keys!825)))

(assert (=> start!20466 tp!18407))

(declare-fun b!202887 () Bool)

(declare-fun res!97344 () Bool)

(assert (=> b!202887 (=> (not res!97344) (not e!132862))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202887 (= res!97344 (and (= (size!4669 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4670 _keys!825) (size!4669 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202888 () Bool)

(declare-fun res!97347 () Bool)

(assert (=> b!202888 (=> (not res!97347) (not e!132862))))

(declare-datatypes ((List!2749 0))(
  ( (Nil!2746) (Cons!2745 (h!3387 (_ BitVec 64)) (t!7680 List!2749)) )
))
(declare-fun arrayNoDuplicates!0 (array!9189 (_ BitVec 32) List!2749) Bool)

(assert (=> b!202888 (= res!97347 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2746))))

(declare-fun b!202889 () Bool)

(declare-fun e!132865 () Bool)

(declare-fun mapRes!8540 () Bool)

(assert (=> b!202889 (= e!132864 (and e!132865 mapRes!8540))))

(declare-fun condMapEmpty!8540 () Bool)

(declare-fun mapDefault!8540 () ValueCell!2147)

