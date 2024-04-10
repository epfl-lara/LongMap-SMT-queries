; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35714 () Bool)

(assert start!35714)

(declare-fun res!199369 () Bool)

(declare-fun e!219632 () Bool)

(assert (=> start!35714 (=> (not res!199369) (not e!219632))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35714 (= res!199369 (validMask!0 mask!1842))))

(assert (=> start!35714 e!219632))

(assert (=> start!35714 true))

(declare-datatypes ((V!11867 0))(
  ( (V!11868 (val!4128 Int)) )
))
(declare-datatypes ((ValueCell!3740 0))(
  ( (ValueCellFull!3740 (v!6322 V!11867)) (EmptyCell!3740) )
))
(declare-datatypes ((array!19899 0))(
  ( (array!19900 (arr!9443 (Array (_ BitVec 32) ValueCell!3740)) (size!9795 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19899)

(declare-fun e!219631 () Bool)

(declare-fun array_inv!6944 (array!19899) Bool)

(assert (=> start!35714 (and (array_inv!6944 _values!1208) e!219631)))

(declare-datatypes ((array!19901 0))(
  ( (array!19902 (arr!9444 (Array (_ BitVec 32) (_ BitVec 64))) (size!9796 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19901)

(declare-fun array_inv!6945 (array!19901) Bool)

(assert (=> start!35714 (array_inv!6945 _keys!1456)))

(declare-fun b!358715 () Bool)

(assert (=> b!358715 (= e!219632 false)))

(declare-fun lt!166238 () Bool)

(declare-datatypes ((List!5442 0))(
  ( (Nil!5439) (Cons!5438 (h!6294 (_ BitVec 64)) (t!10592 List!5442)) )
))
(declare-fun arrayNoDuplicates!0 (array!19901 (_ BitVec 32) List!5442) Bool)

(assert (=> b!358715 (= lt!166238 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5439))))

(declare-fun b!358716 () Bool)

(declare-fun e!219628 () Bool)

(declare-fun tp_is_empty!8167 () Bool)

(assert (=> b!358716 (= e!219628 tp_is_empty!8167)))

(declare-fun b!358717 () Bool)

(declare-fun res!199367 () Bool)

(assert (=> b!358717 (=> (not res!199367) (not e!219632))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358717 (= res!199367 (and (= (size!9795 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9796 _keys!1456) (size!9795 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358718 () Bool)

(declare-fun e!219630 () Bool)

(assert (=> b!358718 (= e!219630 tp_is_empty!8167)))

(declare-fun b!358719 () Bool)

(declare-fun mapRes!13758 () Bool)

(assert (=> b!358719 (= e!219631 (and e!219628 mapRes!13758))))

(declare-fun condMapEmpty!13758 () Bool)

(declare-fun mapDefault!13758 () ValueCell!3740)

