; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35640 () Bool)

(assert start!35640)

(declare-fun b_free!7895 () Bool)

(declare-fun b_next!7895 () Bool)

(assert (=> start!35640 (= b_free!7895 (not b_next!7895))))

(declare-fun tp!27669 () Bool)

(declare-fun b_and!15137 () Bool)

(assert (=> start!35640 (= tp!27669 b_and!15137)))

(declare-fun b!357791 () Bool)

(declare-fun res!198780 () Bool)

(declare-fun e!219040 () Bool)

(assert (=> b!357791 (=> (not res!198780) (not e!219040))))

(declare-datatypes ((array!19753 0))(
  ( (array!19754 (arr!9370 (Array (_ BitVec 32) (_ BitVec 64))) (size!9722 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19753)

(declare-datatypes ((List!5408 0))(
  ( (Nil!5405) (Cons!5404 (h!6260 (_ BitVec 64)) (t!10558 List!5408)) )
))
(declare-fun arrayNoDuplicates!0 (array!19753 (_ BitVec 32) List!5408) Bool)

(assert (=> b!357791 (= res!198780 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5405))))

(declare-fun res!198778 () Bool)

(assert (=> start!35640 (=> (not res!198778) (not e!219040))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35640 (= res!198778 (validMask!0 mask!1842))))

(assert (=> start!35640 e!219040))

(declare-fun tp_is_empty!8093 () Bool)

(assert (=> start!35640 tp_is_empty!8093))

(assert (=> start!35640 true))

(assert (=> start!35640 tp!27669))

(declare-fun array_inv!6886 (array!19753) Bool)

(assert (=> start!35640 (array_inv!6886 _keys!1456)))

(declare-datatypes ((V!11767 0))(
  ( (V!11768 (val!4091 Int)) )
))
(declare-datatypes ((ValueCell!3703 0))(
  ( (ValueCellFull!3703 (v!6285 V!11767)) (EmptyCell!3703) )
))
(declare-datatypes ((array!19755 0))(
  ( (array!19756 (arr!9371 (Array (_ BitVec 32) ValueCell!3703)) (size!9723 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19755)

(declare-fun e!219041 () Bool)

(declare-fun array_inv!6887 (array!19755) Bool)

(assert (=> start!35640 (and (array_inv!6887 _values!1208) e!219041)))

(declare-fun mapIsEmpty!13647 () Bool)

(declare-fun mapRes!13647 () Bool)

(assert (=> mapIsEmpty!13647 mapRes!13647))

(declare-fun b!357792 () Bool)

(declare-fun res!198784 () Bool)

(assert (=> b!357792 (=> (not res!198784) (not e!219040))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!357792 (= res!198784 (validKeyInArray!0 k!1077))))

(declare-fun b!357793 () Bool)

(declare-fun e!219037 () Bool)

(assert (=> b!357793 (= e!219041 (and e!219037 mapRes!13647))))

(declare-fun condMapEmpty!13647 () Bool)

(declare-fun mapDefault!13647 () ValueCell!3703)

