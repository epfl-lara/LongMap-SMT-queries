; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35528 () Bool)

(assert start!35528)

(declare-fun mapNonEmpty!13479 () Bool)

(declare-fun mapRes!13479 () Bool)

(declare-fun tp!27456 () Bool)

(declare-fun e!218155 () Bool)

(assert (=> mapNonEmpty!13479 (= mapRes!13479 (and tp!27456 e!218155))))

(declare-datatypes ((V!11619 0))(
  ( (V!11620 (val!4035 Int)) )
))
(declare-datatypes ((ValueCell!3647 0))(
  ( (ValueCellFull!3647 (v!6229 V!11619)) (EmptyCell!3647) )
))
(declare-datatypes ((array!19535 0))(
  ( (array!19536 (arr!9261 (Array (_ BitVec 32) ValueCell!3647)) (size!9613 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19535)

(declare-fun mapRest!13479 () (Array (_ BitVec 32) ValueCell!3647))

(declare-fun mapValue!13479 () ValueCell!3647)

(declare-fun mapKey!13479 () (_ BitVec 32))

(assert (=> mapNonEmpty!13479 (= (arr!9261 _values!1208) (store mapRest!13479 mapKey!13479 mapValue!13479))))

(declare-fun b!356024 () Bool)

(declare-fun e!218152 () Bool)

(assert (=> b!356024 (= e!218152 false)))

(declare-fun lt!165887 () Bool)

(declare-datatypes ((array!19537 0))(
  ( (array!19538 (arr!9262 (Array (_ BitVec 32) (_ BitVec 64))) (size!9614 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19537)

(declare-datatypes ((List!5357 0))(
  ( (Nil!5354) (Cons!5353 (h!6209 (_ BitVec 64)) (t!10507 List!5357)) )
))
(declare-fun arrayNoDuplicates!0 (array!19537 (_ BitVec 32) List!5357) Bool)

(assert (=> b!356024 (= lt!165887 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5354))))

(declare-fun b!356025 () Bool)

(declare-fun e!218153 () Bool)

(declare-fun e!218156 () Bool)

(assert (=> b!356025 (= e!218153 (and e!218156 mapRes!13479))))

(declare-fun condMapEmpty!13479 () Bool)

(declare-fun mapDefault!13479 () ValueCell!3647)

