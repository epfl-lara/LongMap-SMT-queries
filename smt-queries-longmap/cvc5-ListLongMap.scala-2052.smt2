; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35480 () Bool)

(assert start!35480)

(declare-fun res!197298 () Bool)

(declare-fun e!217792 () Bool)

(assert (=> start!35480 (=> (not res!197298) (not e!217792))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35480 (= res!197298 (validMask!0 mask!1842))))

(assert (=> start!35480 e!217792))

(assert (=> start!35480 true))

(declare-datatypes ((V!11555 0))(
  ( (V!11556 (val!4011 Int)) )
))
(declare-datatypes ((ValueCell!3623 0))(
  ( (ValueCellFull!3623 (v!6205 V!11555)) (EmptyCell!3623) )
))
(declare-datatypes ((array!19445 0))(
  ( (array!19446 (arr!9216 (Array (_ BitVec 32) ValueCell!3623)) (size!9568 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19445)

(declare-fun e!217793 () Bool)

(declare-fun array_inv!6770 (array!19445) Bool)

(assert (=> start!35480 (and (array_inv!6770 _values!1208) e!217793)))

(declare-datatypes ((array!19447 0))(
  ( (array!19448 (arr!9217 (Array (_ BitVec 32) (_ BitVec 64))) (size!9569 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19447)

(declare-fun array_inv!6771 (array!19447) Bool)

(assert (=> start!35480 (array_inv!6771 _keys!1456)))

(declare-fun b!355592 () Bool)

(declare-fun e!217796 () Bool)

(declare-fun mapRes!13407 () Bool)

(assert (=> b!355592 (= e!217793 (and e!217796 mapRes!13407))))

(declare-fun condMapEmpty!13407 () Bool)

(declare-fun mapDefault!13407 () ValueCell!3623)

