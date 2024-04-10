; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41246 () Bool)

(assert start!41246)

(declare-fun b_free!11089 () Bool)

(declare-fun b_next!11089 () Bool)

(assert (=> start!41246 (= b_free!11089 (not b_next!11089))))

(declare-fun tp!39106 () Bool)

(declare-fun b_and!19409 () Bool)

(assert (=> start!41246 (= tp!39106 b_and!19409)))

(declare-fun b!461535 () Bool)

(declare-fun res!276102 () Bool)

(declare-fun e!269157 () Bool)

(assert (=> b!461535 (=> (not res!276102) (not e!269157))))

(declare-datatypes ((array!28653 0))(
  ( (array!28654 (arr!13766 (Array (_ BitVec 32) (_ BitVec 64))) (size!14118 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28653)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28653 (_ BitVec 32)) Bool)

(assert (=> b!461535 (= res!276102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!20293 () Bool)

(declare-fun mapRes!20293 () Bool)

(declare-fun tp!39105 () Bool)

(declare-fun e!269155 () Bool)

(assert (=> mapNonEmpty!20293 (= mapRes!20293 (and tp!39105 e!269155))))

(declare-datatypes ((V!17675 0))(
  ( (V!17676 (val!6258 Int)) )
))
(declare-datatypes ((ValueCell!5870 0))(
  ( (ValueCellFull!5870 (v!8540 V!17675)) (EmptyCell!5870) )
))
(declare-fun mapRest!20293 () (Array (_ BitVec 32) ValueCell!5870))

(declare-fun mapValue!20293 () ValueCell!5870)

(declare-datatypes ((array!28655 0))(
  ( (array!28656 (arr!13767 (Array (_ BitVec 32) ValueCell!5870)) (size!14119 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28655)

(declare-fun mapKey!20293 () (_ BitVec 32))

(assert (=> mapNonEmpty!20293 (= (arr!13767 _values!549) (store mapRest!20293 mapKey!20293 mapValue!20293))))

(declare-fun b!461536 () Bool)

(declare-fun res!276100 () Bool)

(assert (=> b!461536 (=> (not res!276100) (not e!269157))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461536 (= res!276100 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14118 _keys!709))))))

(declare-fun mapIsEmpty!20293 () Bool)

(assert (=> mapIsEmpty!20293 mapRes!20293))

(declare-fun b!461537 () Bool)

(declare-fun e!269160 () Bool)

(declare-fun e!269156 () Bool)

(assert (=> b!461537 (= e!269160 (and e!269156 mapRes!20293))))

(declare-fun condMapEmpty!20293 () Bool)

(declare-fun mapDefault!20293 () ValueCell!5870)

