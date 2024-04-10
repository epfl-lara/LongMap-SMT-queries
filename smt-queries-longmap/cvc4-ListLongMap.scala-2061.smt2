; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35538 () Bool)

(assert start!35538)

(declare-fun b!356114 () Bool)

(declare-fun res!197558 () Bool)

(declare-fun e!218231 () Bool)

(assert (=> b!356114 (=> (not res!197558) (not e!218231))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19555 0))(
  ( (array!19556 (arr!9271 (Array (_ BitVec 32) (_ BitVec 64))) (size!9623 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19555)

(declare-datatypes ((V!11631 0))(
  ( (V!11632 (val!4040 Int)) )
))
(declare-datatypes ((ValueCell!3652 0))(
  ( (ValueCellFull!3652 (v!6234 V!11631)) (EmptyCell!3652) )
))
(declare-datatypes ((array!19557 0))(
  ( (array!19558 (arr!9272 (Array (_ BitVec 32) ValueCell!3652)) (size!9624 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19557)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356114 (= res!197558 (and (= (size!9624 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9623 _keys!1456) (size!9624 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun res!197560 () Bool)

(assert (=> start!35538 (=> (not res!197560) (not e!218231))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35538 (= res!197560 (validMask!0 mask!1842))))

(assert (=> start!35538 e!218231))

(assert (=> start!35538 true))

(declare-fun e!218228 () Bool)

(declare-fun array_inv!6814 (array!19557) Bool)

(assert (=> start!35538 (and (array_inv!6814 _values!1208) e!218228)))

(declare-fun array_inv!6815 (array!19555) Bool)

(assert (=> start!35538 (array_inv!6815 _keys!1456)))

(declare-fun mapNonEmpty!13494 () Bool)

(declare-fun mapRes!13494 () Bool)

(declare-fun tp!27471 () Bool)

(declare-fun e!218227 () Bool)

(assert (=> mapNonEmpty!13494 (= mapRes!13494 (and tp!27471 e!218227))))

(declare-fun mapValue!13494 () ValueCell!3652)

(declare-fun mapRest!13494 () (Array (_ BitVec 32) ValueCell!3652))

(declare-fun mapKey!13494 () (_ BitVec 32))

(assert (=> mapNonEmpty!13494 (= (arr!9272 _values!1208) (store mapRest!13494 mapKey!13494 mapValue!13494))))

(declare-fun b!356115 () Bool)

(declare-fun e!218230 () Bool)

(declare-fun tp_is_empty!7991 () Bool)

(assert (=> b!356115 (= e!218230 tp_is_empty!7991)))

(declare-fun b!356116 () Bool)

(declare-fun res!197559 () Bool)

(assert (=> b!356116 (=> (not res!197559) (not e!218231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19555 (_ BitVec 32)) Bool)

(assert (=> b!356116 (= res!197559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356117 () Bool)

(assert (=> b!356117 (= e!218231 false)))

(declare-fun lt!165902 () Bool)

(declare-datatypes ((List!5362 0))(
  ( (Nil!5359) (Cons!5358 (h!6214 (_ BitVec 64)) (t!10512 List!5362)) )
))
(declare-fun arrayNoDuplicates!0 (array!19555 (_ BitVec 32) List!5362) Bool)

(assert (=> b!356117 (= lt!165902 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5359))))

(declare-fun b!356118 () Bool)

(assert (=> b!356118 (= e!218227 tp_is_empty!7991)))

(declare-fun mapIsEmpty!13494 () Bool)

(assert (=> mapIsEmpty!13494 mapRes!13494))

(declare-fun b!356119 () Bool)

(assert (=> b!356119 (= e!218228 (and e!218230 mapRes!13494))))

(declare-fun condMapEmpty!13494 () Bool)

(declare-fun mapDefault!13494 () ValueCell!3652)

