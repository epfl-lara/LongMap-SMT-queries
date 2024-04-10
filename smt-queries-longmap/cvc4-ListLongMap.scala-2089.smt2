; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35706 () Bool)

(assert start!35706)

(declare-fun mapIsEmpty!13746 () Bool)

(declare-fun mapRes!13746 () Bool)

(assert (=> mapIsEmpty!13746 mapRes!13746))

(declare-fun mapNonEmpty!13746 () Bool)

(declare-fun tp!27804 () Bool)

(declare-fun e!219570 () Bool)

(assert (=> mapNonEmpty!13746 (= mapRes!13746 (and tp!27804 e!219570))))

(declare-datatypes ((V!11855 0))(
  ( (V!11856 (val!4124 Int)) )
))
(declare-datatypes ((ValueCell!3736 0))(
  ( (ValueCellFull!3736 (v!6318 V!11855)) (EmptyCell!3736) )
))
(declare-fun mapValue!13746 () ValueCell!3736)

(declare-fun mapKey!13746 () (_ BitVec 32))

(declare-datatypes ((array!19883 0))(
  ( (array!19884 (arr!9435 (Array (_ BitVec 32) ValueCell!3736)) (size!9787 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19883)

(declare-fun mapRest!13746 () (Array (_ BitVec 32) ValueCell!3736))

(assert (=> mapNonEmpty!13746 (= (arr!9435 _values!1208) (store mapRest!13746 mapKey!13746 mapValue!13746))))

(declare-fun b!358643 () Bool)

(declare-fun res!199331 () Bool)

(declare-fun e!219569 () Bool)

(assert (=> b!358643 (=> (not res!199331) (not e!219569))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19885 0))(
  ( (array!19886 (arr!9436 (Array (_ BitVec 32) (_ BitVec 64))) (size!9788 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19885)

(assert (=> b!358643 (= res!199331 (and (= (size!9787 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9788 _keys!1456) (size!9787 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!358644 () Bool)

(declare-fun tp_is_empty!8159 () Bool)

(assert (=> b!358644 (= e!219570 tp_is_empty!8159)))

(declare-fun b!358645 () Bool)

(declare-fun e!219572 () Bool)

(declare-fun e!219571 () Bool)

(assert (=> b!358645 (= e!219572 (and e!219571 mapRes!13746))))

(declare-fun condMapEmpty!13746 () Bool)

(declare-fun mapDefault!13746 () ValueCell!3736)

