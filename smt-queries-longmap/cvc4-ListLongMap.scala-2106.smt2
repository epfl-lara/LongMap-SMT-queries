; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35808 () Bool)

(assert start!35808)

(declare-fun b!359660 () Bool)

(declare-fun res!199889 () Bool)

(declare-fun e!220335 () Bool)

(assert (=> b!359660 (=> (not res!199889) (not e!220335))))

(declare-datatypes ((array!20075 0))(
  ( (array!20076 (arr!9531 (Array (_ BitVec 32) (_ BitVec 64))) (size!9883 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!20075)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20075 (_ BitVec 32)) Bool)

(assert (=> b!359660 (= res!199889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199890 () Bool)

(assert (=> start!35808 (=> (not res!199890) (not e!220335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35808 (= res!199890 (validMask!0 mask!1842))))

(assert (=> start!35808 e!220335))

(assert (=> start!35808 true))

(declare-datatypes ((V!11991 0))(
  ( (V!11992 (val!4175 Int)) )
))
(declare-datatypes ((ValueCell!3787 0))(
  ( (ValueCellFull!3787 (v!6369 V!11991)) (EmptyCell!3787) )
))
(declare-datatypes ((array!20077 0))(
  ( (array!20078 (arr!9532 (Array (_ BitVec 32) ValueCell!3787)) (size!9884 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20077)

(declare-fun e!220333 () Bool)

(declare-fun array_inv!7010 (array!20077) Bool)

(assert (=> start!35808 (and (array_inv!7010 _values!1208) e!220333)))

(declare-fun array_inv!7011 (array!20075) Bool)

(assert (=> start!35808 (array_inv!7011 _keys!1456)))

(declare-fun b!359661 () Bool)

(declare-fun e!220336 () Bool)

(declare-fun tp_is_empty!8261 () Bool)

(assert (=> b!359661 (= e!220336 tp_is_empty!8261)))

(declare-fun b!359662 () Bool)

(declare-fun e!220334 () Bool)

(assert (=> b!359662 (= e!220334 tp_is_empty!8261)))

(declare-fun b!359663 () Bool)

(assert (=> b!359663 (= e!220335 false)))

(declare-fun lt!166379 () Bool)

(declare-datatypes ((List!5475 0))(
  ( (Nil!5472) (Cons!5471 (h!6327 (_ BitVec 64)) (t!10625 List!5475)) )
))
(declare-fun arrayNoDuplicates!0 (array!20075 (_ BitVec 32) List!5475) Bool)

(assert (=> b!359663 (= lt!166379 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5472))))

(declare-fun mapIsEmpty!13899 () Bool)

(declare-fun mapRes!13899 () Bool)

(assert (=> mapIsEmpty!13899 mapRes!13899))

(declare-fun b!359664 () Bool)

(assert (=> b!359664 (= e!220333 (and e!220334 mapRes!13899))))

(declare-fun condMapEmpty!13899 () Bool)

(declare-fun mapDefault!13899 () ValueCell!3787)

