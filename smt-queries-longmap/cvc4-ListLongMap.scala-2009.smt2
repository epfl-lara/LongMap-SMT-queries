; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35038 () Bool)

(assert start!35038)

(declare-fun b_free!7727 () Bool)

(declare-fun b_next!7727 () Bool)

(assert (=> start!35038 (= b_free!7727 (not b_next!7727))))

(declare-fun tp!26759 () Bool)

(declare-fun b_and!14957 () Bool)

(assert (=> start!35038 (= tp!26759 b_and!14957)))

(declare-fun b!351239 () Bool)

(declare-fun res!194781 () Bool)

(declare-fun e!215101 () Bool)

(assert (=> b!351239 (=> (not res!194781) (not e!215101))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!11215 0))(
  ( (V!11216 (val!3884 Int)) )
))
(declare-datatypes ((ValueCell!3496 0))(
  ( (ValueCellFull!3496 (v!6071 V!11215)) (EmptyCell!3496) )
))
(declare-datatypes ((array!18945 0))(
  ( (array!18946 (arr!8978 (Array (_ BitVec 32) ValueCell!3496)) (size!9330 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18945)

(declare-datatypes ((array!18947 0))(
  ( (array!18948 (arr!8979 (Array (_ BitVec 32) (_ BitVec 64))) (size!9331 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18947)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!351239 (= res!194781 (and (= (size!9330 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9331 _keys!1895) (size!9330 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!194778 () Bool)

(assert (=> start!35038 (=> (not res!194778) (not e!215101))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35038 (= res!194778 (validMask!0 mask!2385))))

(assert (=> start!35038 e!215101))

(assert (=> start!35038 true))

(declare-fun tp_is_empty!7679 () Bool)

(assert (=> start!35038 tp_is_empty!7679))

(assert (=> start!35038 tp!26759))

(declare-fun e!215099 () Bool)

(declare-fun array_inv!6626 (array!18945) Bool)

(assert (=> start!35038 (and (array_inv!6626 _values!1525) e!215099)))

(declare-fun array_inv!6627 (array!18947) Bool)

(assert (=> start!35038 (array_inv!6627 _keys!1895)))

(declare-fun b!351240 () Bool)

(declare-fun e!215098 () Bool)

(assert (=> b!351240 (= e!215098 false)))

(declare-fun lt!164728 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!18947 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!351240 (= lt!164728 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!351241 () Bool)

(declare-fun e!215100 () Bool)

(declare-fun mapRes!12990 () Bool)

(assert (=> b!351241 (= e!215099 (and e!215100 mapRes!12990))))

(declare-fun condMapEmpty!12990 () Bool)

(declare-fun mapDefault!12990 () ValueCell!3496)

