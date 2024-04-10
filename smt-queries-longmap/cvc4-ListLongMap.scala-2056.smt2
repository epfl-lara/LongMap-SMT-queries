; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35508 () Bool)

(assert start!35508)

(declare-fun b!355844 () Bool)

(declare-fun e!218006 () Bool)

(declare-fun tp_is_empty!7961 () Bool)

(assert (=> b!355844 (= e!218006 tp_is_empty!7961)))

(declare-fun mapNonEmpty!13449 () Bool)

(declare-fun mapRes!13449 () Bool)

(declare-fun tp!27426 () Bool)

(assert (=> mapNonEmpty!13449 (= mapRes!13449 (and tp!27426 e!218006))))

(declare-datatypes ((V!11591 0))(
  ( (V!11592 (val!4025 Int)) )
))
(declare-datatypes ((ValueCell!3637 0))(
  ( (ValueCellFull!3637 (v!6219 V!11591)) (EmptyCell!3637) )
))
(declare-fun mapRest!13449 () (Array (_ BitVec 32) ValueCell!3637))

(declare-fun mapValue!13449 () ValueCell!3637)

(declare-fun mapKey!13449 () (_ BitVec 32))

(declare-datatypes ((array!19499 0))(
  ( (array!19500 (arr!9243 (Array (_ BitVec 32) ValueCell!3637)) (size!9595 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19499)

(assert (=> mapNonEmpty!13449 (= (arr!9243 _values!1208) (store mapRest!13449 mapKey!13449 mapValue!13449))))

(declare-fun b!355845 () Bool)

(declare-fun res!197423 () Bool)

(declare-fun e!218003 () Bool)

(assert (=> b!355845 (=> (not res!197423) (not e!218003))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19501 0))(
  ( (array!19502 (arr!9244 (Array (_ BitVec 32) (_ BitVec 64))) (size!9596 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19501)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!355845 (= res!197423 (and (= (size!9595 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9596 _keys!1456) (size!9595 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13449 () Bool)

(assert (=> mapIsEmpty!13449 mapRes!13449))

(declare-fun b!355846 () Bool)

(assert (=> b!355846 (= e!218003 false)))

(declare-fun lt!165857 () Bool)

(declare-datatypes ((List!5350 0))(
  ( (Nil!5347) (Cons!5346 (h!6202 (_ BitVec 64)) (t!10500 List!5350)) )
))
(declare-fun arrayNoDuplicates!0 (array!19501 (_ BitVec 32) List!5350) Bool)

(assert (=> b!355846 (= lt!165857 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5347))))

(declare-fun b!355847 () Bool)

(declare-fun e!218005 () Bool)

(declare-fun e!218002 () Bool)

(assert (=> b!355847 (= e!218005 (and e!218002 mapRes!13449))))

(declare-fun condMapEmpty!13449 () Bool)

(declare-fun mapDefault!13449 () ValueCell!3637)

