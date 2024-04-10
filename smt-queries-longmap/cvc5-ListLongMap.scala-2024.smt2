; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35256 () Bool)

(assert start!35256)

(declare-fun mapIsEmpty!13137 () Bool)

(declare-fun mapRes!13137 () Bool)

(assert (=> mapIsEmpty!13137 mapRes!13137))

(declare-fun res!195974 () Bool)

(declare-fun e!216410 () Bool)

(assert (=> start!35256 (=> (not res!195974) (not e!216410))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35256 (= res!195974 (validMask!0 mask!1842))))

(assert (=> start!35256 e!216410))

(assert (=> start!35256 true))

(declare-datatypes ((V!11331 0))(
  ( (V!11332 (val!3927 Int)) )
))
(declare-datatypes ((ValueCell!3539 0))(
  ( (ValueCellFull!3539 (v!6120 V!11331)) (EmptyCell!3539) )
))
(declare-datatypes ((array!19123 0))(
  ( (array!19124 (arr!9061 (Array (_ BitVec 32) ValueCell!3539)) (size!9413 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19123)

(declare-fun e!216411 () Bool)

(declare-fun array_inv!6676 (array!19123) Bool)

(assert (=> start!35256 (and (array_inv!6676 _values!1208) e!216411)))

(declare-datatypes ((array!19125 0))(
  ( (array!19126 (arr!9062 (Array (_ BitVec 32) (_ BitVec 64))) (size!9414 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19125)

(declare-fun array_inv!6677 (array!19125) Bool)

(assert (=> start!35256 (array_inv!6677 _keys!1456)))

(declare-fun mapNonEmpty!13137 () Bool)

(declare-fun tp!27033 () Bool)

(declare-fun e!216412 () Bool)

(assert (=> mapNonEmpty!13137 (= mapRes!13137 (and tp!27033 e!216412))))

(declare-fun mapKey!13137 () (_ BitVec 32))

(declare-fun mapValue!13137 () ValueCell!3539)

(declare-fun mapRest!13137 () (Array (_ BitVec 32) ValueCell!3539))

(assert (=> mapNonEmpty!13137 (= (arr!9061 _values!1208) (store mapRest!13137 mapKey!13137 mapValue!13137))))

(declare-fun b!353429 () Bool)

(declare-fun tp_is_empty!7765 () Bool)

(assert (=> b!353429 (= e!216412 tp_is_empty!7765)))

(declare-fun b!353430 () Bool)

(declare-fun e!216414 () Bool)

(assert (=> b!353430 (= e!216411 (and e!216414 mapRes!13137))))

(declare-fun condMapEmpty!13137 () Bool)

(declare-fun mapDefault!13137 () ValueCell!3539)

