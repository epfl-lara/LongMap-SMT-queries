; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39884 () Bool)

(assert start!39884)

(declare-fun b_free!10151 () Bool)

(declare-fun b_next!10151 () Bool)

(assert (=> start!39884 (= b_free!10151 (not b_next!10151))))

(declare-fun tp!35982 () Bool)

(declare-fun b_and!17961 () Bool)

(assert (=> start!39884 (= tp!35982 b_and!17961)))

(declare-fun b!431882 () Bool)

(declare-fun res!253976 () Bool)

(declare-fun e!255522 () Bool)

(assert (=> b!431882 (=> (not res!253976) (not e!255522))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26441 0))(
  ( (array!26442 (arr!12670 (Array (_ BitVec 32) (_ BitVec 64))) (size!13022 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26441)

(assert (=> b!431882 (= res!253976 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13022 _keys!709))))))

(declare-fun b!431883 () Bool)

(declare-datatypes ((Unit!12743 0))(
  ( (Unit!12744) )
))
(declare-fun e!255528 () Unit!12743)

(declare-fun Unit!12745 () Unit!12743)

(assert (=> b!431883 (= e!255528 Unit!12745)))

(declare-fun b!431884 () Bool)

(declare-fun res!253966 () Bool)

(assert (=> b!431884 (=> (not res!253966) (not e!255522))))

(declare-datatypes ((List!7530 0))(
  ( (Nil!7527) (Cons!7526 (h!8382 (_ BitVec 64)) (t!13130 List!7530)) )
))
(declare-fun arrayNoDuplicates!0 (array!26441 (_ BitVec 32) List!7530) Bool)

(assert (=> b!431884 (= res!253966 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7527))))

(declare-fun mapNonEmpty!18576 () Bool)

(declare-fun mapRes!18576 () Bool)

(declare-fun tp!35981 () Bool)

(declare-fun e!255524 () Bool)

(assert (=> mapNonEmpty!18576 (= mapRes!18576 (and tp!35981 e!255524))))

(declare-fun mapKey!18576 () (_ BitVec 32))

(declare-datatypes ((V!16175 0))(
  ( (V!16176 (val!5696 Int)) )
))
(declare-datatypes ((ValueCell!5308 0))(
  ( (ValueCellFull!5308 (v!7943 V!16175)) (EmptyCell!5308) )
))
(declare-datatypes ((array!26443 0))(
  ( (array!26444 (arr!12671 (Array (_ BitVec 32) ValueCell!5308)) (size!13023 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26443)

(declare-fun mapRest!18576 () (Array (_ BitVec 32) ValueCell!5308))

(declare-fun mapValue!18576 () ValueCell!5308)

(assert (=> mapNonEmpty!18576 (= (arr!12671 _values!549) (store mapRest!18576 mapKey!18576 mapValue!18576))))

(declare-fun b!431885 () Bool)

(declare-fun Unit!12746 () Unit!12743)

(assert (=> b!431885 (= e!255528 Unit!12746)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!197912 () Unit!12743)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26441 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12743)

(assert (=> b!431885 (= lt!197912 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431885 false))

(declare-fun b!431886 () Bool)

(declare-fun e!255526 () Bool)

(declare-fun e!255530 () Bool)

(assert (=> b!431886 (= e!255526 (and e!255530 mapRes!18576))))

(declare-fun condMapEmpty!18576 () Bool)

(declare-fun mapDefault!18576 () ValueCell!5308)

