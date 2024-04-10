; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35724 () Bool)

(assert start!35724)

(declare-fun b!358805 () Bool)

(declare-fun res!199413 () Bool)

(declare-fun e!219705 () Bool)

(assert (=> b!358805 (=> (not res!199413) (not e!219705))))

(declare-datatypes ((array!19917 0))(
  ( (array!19918 (arr!9452 (Array (_ BitVec 32) (_ BitVec 64))) (size!9804 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19917)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19917 (_ BitVec 32)) Bool)

(assert (=> b!358805 (= res!199413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun res!199414 () Bool)

(assert (=> start!35724 (=> (not res!199414) (not e!219705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35724 (= res!199414 (validMask!0 mask!1842))))

(assert (=> start!35724 e!219705))

(assert (=> start!35724 true))

(declare-datatypes ((V!11879 0))(
  ( (V!11880 (val!4133 Int)) )
))
(declare-datatypes ((ValueCell!3745 0))(
  ( (ValueCellFull!3745 (v!6327 V!11879)) (EmptyCell!3745) )
))
(declare-datatypes ((array!19919 0))(
  ( (array!19920 (arr!9453 (Array (_ BitVec 32) ValueCell!3745)) (size!9805 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19919)

(declare-fun e!219704 () Bool)

(declare-fun array_inv!6952 (array!19919) Bool)

(assert (=> start!35724 (and (array_inv!6952 _values!1208) e!219704)))

(declare-fun array_inv!6953 (array!19917) Bool)

(assert (=> start!35724 (array_inv!6953 _keys!1456)))

(declare-fun b!358806 () Bool)

(assert (=> b!358806 (= e!219705 false)))

(declare-fun lt!166253 () Bool)

(declare-datatypes ((List!5446 0))(
  ( (Nil!5443) (Cons!5442 (h!6298 (_ BitVec 64)) (t!10596 List!5446)) )
))
(declare-fun arrayNoDuplicates!0 (array!19917 (_ BitVec 32) List!5446) Bool)

(assert (=> b!358806 (= lt!166253 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5443))))

(declare-fun mapIsEmpty!13773 () Bool)

(declare-fun mapRes!13773 () Bool)

(assert (=> mapIsEmpty!13773 mapRes!13773))

(declare-fun b!358807 () Bool)

(declare-fun res!199412 () Bool)

(assert (=> b!358807 (=> (not res!199412) (not e!219705))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!358807 (= res!199412 (and (= (size!9805 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9804 _keys!1456) (size!9805 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358808 () Bool)

(declare-fun e!219703 () Bool)

(declare-fun tp_is_empty!8177 () Bool)

(assert (=> b!358808 (= e!219703 tp_is_empty!8177)))

(declare-fun b!358809 () Bool)

(assert (=> b!358809 (= e!219704 (and e!219703 mapRes!13773))))

(declare-fun condMapEmpty!13773 () Bool)

(declare-fun mapDefault!13773 () ValueCell!3745)

