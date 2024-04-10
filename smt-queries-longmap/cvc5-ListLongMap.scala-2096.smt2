; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35744 () Bool)

(assert start!35744)

(declare-fun res!199603 () Bool)

(declare-fun e!219853 () Bool)

(assert (=> start!35744 (=> (not res!199603) (not e!219853))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35744 (= res!199603 (validMask!0 mask!1842))))

(assert (=> start!35744 e!219853))

(assert (=> start!35744 true))

(declare-datatypes ((V!11907 0))(
  ( (V!11908 (val!4143 Int)) )
))
(declare-datatypes ((ValueCell!3755 0))(
  ( (ValueCellFull!3755 (v!6337 V!11907)) (EmptyCell!3755) )
))
(declare-datatypes ((array!19953 0))(
  ( (array!19954 (arr!9470 (Array (_ BitVec 32) ValueCell!3755)) (size!9822 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19953)

(declare-fun e!219855 () Bool)

(declare-fun array_inv!6968 (array!19953) Bool)

(assert (=> start!35744 (and (array_inv!6968 _values!1208) e!219855)))

(declare-datatypes ((array!19955 0))(
  ( (array!19956 (arr!9471 (Array (_ BitVec 32) (_ BitVec 64))) (size!9823 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19955)

(declare-fun array_inv!6969 (array!19955) Bool)

(assert (=> start!35744 (array_inv!6969 _keys!1456)))

(declare-fun b!359084 () Bool)

(declare-fun e!219857 () Bool)

(declare-fun tp_is_empty!8197 () Bool)

(assert (=> b!359084 (= e!219857 tp_is_empty!8197)))

(declare-fun b!359085 () Bool)

(declare-fun e!219854 () Bool)

(declare-fun mapRes!13803 () Bool)

(assert (=> b!359085 (= e!219855 (and e!219854 mapRes!13803))))

(declare-fun condMapEmpty!13803 () Bool)

(declare-fun mapDefault!13803 () ValueCell!3755)

