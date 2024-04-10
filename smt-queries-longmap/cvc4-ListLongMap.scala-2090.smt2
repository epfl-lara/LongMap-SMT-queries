; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35712 () Bool)

(assert start!35712)

(declare-fun b!358697 () Bool)

(declare-fun e!219614 () Bool)

(declare-fun tp_is_empty!8165 () Bool)

(assert (=> b!358697 (= e!219614 tp_is_empty!8165)))

(declare-fun b!358698 () Bool)

(declare-fun res!199359 () Bool)

(declare-fun e!219615 () Bool)

(assert (=> b!358698 (=> (not res!199359) (not e!219615))))

(declare-datatypes ((array!19895 0))(
  ( (array!19896 (arr!9441 (Array (_ BitVec 32) (_ BitVec 64))) (size!9793 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19895)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19895 (_ BitVec 32)) Bool)

(assert (=> b!358698 (= res!199359 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!358699 () Bool)

(declare-fun res!199360 () Bool)

(assert (=> b!358699 (=> (not res!199360) (not e!219615))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11863 0))(
  ( (V!11864 (val!4127 Int)) )
))
(declare-datatypes ((ValueCell!3739 0))(
  ( (ValueCellFull!3739 (v!6321 V!11863)) (EmptyCell!3739) )
))
(declare-datatypes ((array!19897 0))(
  ( (array!19898 (arr!9442 (Array (_ BitVec 32) ValueCell!3739)) (size!9794 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19897)

(assert (=> b!358699 (= res!199360 (and (= (size!9794 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9793 _keys!1456) (size!9794 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358700 () Bool)

(assert (=> b!358700 (= e!219615 false)))

(declare-fun lt!166235 () Bool)

(declare-datatypes ((List!5441 0))(
  ( (Nil!5438) (Cons!5437 (h!6293 (_ BitVec 64)) (t!10591 List!5441)) )
))
(declare-fun arrayNoDuplicates!0 (array!19895 (_ BitVec 32) List!5441) Bool)

(assert (=> b!358700 (= lt!166235 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5438))))

(declare-fun mapIsEmpty!13755 () Bool)

(declare-fun mapRes!13755 () Bool)

(assert (=> mapIsEmpty!13755 mapRes!13755))

(declare-fun b!358701 () Bool)

(declare-fun e!219617 () Bool)

(declare-fun e!219613 () Bool)

(assert (=> b!358701 (= e!219617 (and e!219613 mapRes!13755))))

(declare-fun condMapEmpty!13755 () Bool)

(declare-fun mapDefault!13755 () ValueCell!3739)

