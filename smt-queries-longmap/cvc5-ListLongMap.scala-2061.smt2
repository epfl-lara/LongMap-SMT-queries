; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35534 () Bool)

(assert start!35534)

(declare-fun b!356078 () Bool)

(declare-fun res!197542 () Bool)

(declare-fun e!218198 () Bool)

(assert (=> b!356078 (=> (not res!197542) (not e!218198))))

(declare-datatypes ((array!19547 0))(
  ( (array!19548 (arr!9267 (Array (_ BitVec 32) (_ BitVec 64))) (size!9619 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19547)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19547 (_ BitVec 32)) Bool)

(assert (=> b!356078 (= res!197542 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356079 () Bool)

(declare-fun res!197540 () Bool)

(assert (=> b!356079 (=> (not res!197540) (not e!218198))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11627 0))(
  ( (V!11628 (val!4038 Int)) )
))
(declare-datatypes ((ValueCell!3650 0))(
  ( (ValueCellFull!3650 (v!6232 V!11627)) (EmptyCell!3650) )
))
(declare-datatypes ((array!19549 0))(
  ( (array!19550 (arr!9268 (Array (_ BitVec 32) ValueCell!3650)) (size!9620 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19549)

(assert (=> b!356079 (= res!197540 (and (= (size!9620 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9619 _keys!1456) (size!9620 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!197541 () Bool)

(assert (=> start!35534 (=> (not res!197541) (not e!218198))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35534 (= res!197541 (validMask!0 mask!1842))))

(assert (=> start!35534 e!218198))

(assert (=> start!35534 true))

(declare-fun e!218200 () Bool)

(declare-fun array_inv!6810 (array!19549) Bool)

(assert (=> start!35534 (and (array_inv!6810 _values!1208) e!218200)))

(declare-fun array_inv!6811 (array!19547) Bool)

(assert (=> start!35534 (array_inv!6811 _keys!1456)))

(declare-fun b!356080 () Bool)

(assert (=> b!356080 (= e!218198 false)))

(declare-fun lt!165896 () Bool)

(declare-datatypes ((List!5360 0))(
  ( (Nil!5357) (Cons!5356 (h!6212 (_ BitVec 64)) (t!10510 List!5360)) )
))
(declare-fun arrayNoDuplicates!0 (array!19547 (_ BitVec 32) List!5360) Bool)

(assert (=> b!356080 (= lt!165896 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5357))))

(declare-fun mapNonEmpty!13488 () Bool)

(declare-fun mapRes!13488 () Bool)

(declare-fun tp!27465 () Bool)

(declare-fun e!218197 () Bool)

(assert (=> mapNonEmpty!13488 (= mapRes!13488 (and tp!27465 e!218197))))

(declare-fun mapRest!13488 () (Array (_ BitVec 32) ValueCell!3650))

(declare-fun mapKey!13488 () (_ BitVec 32))

(declare-fun mapValue!13488 () ValueCell!3650)

(assert (=> mapNonEmpty!13488 (= (arr!9268 _values!1208) (store mapRest!13488 mapKey!13488 mapValue!13488))))

(declare-fun b!356081 () Bool)

(declare-fun e!218199 () Bool)

(declare-fun tp_is_empty!7987 () Bool)

(assert (=> b!356081 (= e!218199 tp_is_empty!7987)))

(declare-fun b!356082 () Bool)

(assert (=> b!356082 (= e!218200 (and e!218199 mapRes!13488))))

(declare-fun condMapEmpty!13488 () Bool)

(declare-fun mapDefault!13488 () ValueCell!3650)

