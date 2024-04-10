; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35546 () Bool)

(assert start!35546)

(declare-fun b!356196 () Bool)

(declare-fun res!197611 () Bool)

(declare-fun e!218289 () Bool)

(assert (=> b!356196 (=> (not res!197611) (not e!218289))))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356196 (= res!197611 (validKeyInArray!0 k!1077))))

(declare-fun b!356197 () Bool)

(declare-fun e!218291 () Bool)

(declare-fun tp_is_empty!7999 () Bool)

(assert (=> b!356197 (= e!218291 tp_is_empty!7999)))

(declare-fun b!356198 () Bool)

(declare-fun res!197605 () Bool)

(assert (=> b!356198 (=> (not res!197605) (not e!218289))))

(declare-datatypes ((array!19569 0))(
  ( (array!19570 (arr!9278 (Array (_ BitVec 32) (_ BitVec 64))) (size!9630 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19569)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19569 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356198 (= res!197605 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun mapIsEmpty!13506 () Bool)

(declare-fun mapRes!13506 () Bool)

(assert (=> mapIsEmpty!13506 mapRes!13506))

(declare-fun mapNonEmpty!13506 () Bool)

(declare-fun tp!27483 () Bool)

(declare-fun e!218288 () Bool)

(assert (=> mapNonEmpty!13506 (= mapRes!13506 (and tp!27483 e!218288))))

(declare-fun mapKey!13506 () (_ BitVec 32))

(declare-datatypes ((V!11643 0))(
  ( (V!11644 (val!4044 Int)) )
))
(declare-datatypes ((ValueCell!3656 0))(
  ( (ValueCellFull!3656 (v!6238 V!11643)) (EmptyCell!3656) )
))
(declare-fun mapRest!13506 () (Array (_ BitVec 32) ValueCell!3656))

(declare-datatypes ((array!19571 0))(
  ( (array!19572 (arr!9279 (Array (_ BitVec 32) ValueCell!3656)) (size!9631 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19571)

(declare-fun mapValue!13506 () ValueCell!3656)

(assert (=> mapNonEmpty!13506 (= (arr!9279 _values!1208) (store mapRest!13506 mapKey!13506 mapValue!13506))))

(declare-fun b!356199 () Bool)

(declare-fun res!197607 () Bool)

(assert (=> b!356199 (=> (not res!197607) (not e!218289))))

(declare-datatypes ((List!5364 0))(
  ( (Nil!5361) (Cons!5360 (h!6216 (_ BitVec 64)) (t!10514 List!5364)) )
))
(declare-fun arrayNoDuplicates!0 (array!19569 (_ BitVec 32) List!5364) Bool)

(assert (=> b!356199 (= res!197607 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5361))))

(declare-fun res!197610 () Bool)

(assert (=> start!35546 (=> (not res!197610) (not e!218289))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35546 (= res!197610 (validMask!0 mask!1842))))

(assert (=> start!35546 e!218289))

(assert (=> start!35546 tp_is_empty!7999))

(assert (=> start!35546 true))

(declare-fun array_inv!6820 (array!19569) Bool)

(assert (=> start!35546 (array_inv!6820 _keys!1456)))

(declare-fun e!218287 () Bool)

(declare-fun array_inv!6821 (array!19571) Bool)

(assert (=> start!35546 (and (array_inv!6821 _values!1208) e!218287)))

(declare-fun b!356200 () Bool)

(declare-fun res!197606 () Bool)

(assert (=> b!356200 (=> (not res!197606) (not e!218289))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19569 (_ BitVec 32)) Bool)

(assert (=> b!356200 (= res!197606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356201 () Bool)

(assert (=> b!356201 (= e!218287 (and e!218291 mapRes!13506))))

(declare-fun condMapEmpty!13506 () Bool)

(declare-fun mapDefault!13506 () ValueCell!3656)

