; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38872 () Bool)

(assert start!38872)

(declare-fun b!406196 () Bool)

(declare-fun e!244123 () Bool)

(declare-fun e!244124 () Bool)

(assert (=> b!406196 (= e!244123 e!244124)))

(declare-fun res!234589 () Bool)

(assert (=> b!406196 (=> (not res!234589) (not e!244124))))

(declare-datatypes ((array!24473 0))(
  ( (array!24474 (arr!11686 (Array (_ BitVec 32) (_ BitVec 64))) (size!12038 (_ BitVec 32))) )
))
(declare-fun lt!188452 () array!24473)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24473 (_ BitVec 32)) Bool)

(assert (=> b!406196 (= res!234589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188452 mask!1025))))

(declare-fun _keys!709 () array!24473)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406196 (= lt!188452 (array!24474 (store (arr!11686 _keys!709) i!563 k!794) (size!12038 _keys!709)))))

(declare-fun b!406197 () Bool)

(declare-fun e!244126 () Bool)

(declare-fun tp_is_empty!10291 () Bool)

(assert (=> b!406197 (= e!244126 tp_is_empty!10291)))

(declare-fun b!406198 () Bool)

(assert (=> b!406198 (= e!244124 false)))

(declare-fun lt!188453 () Bool)

(declare-datatypes ((List!6788 0))(
  ( (Nil!6785) (Cons!6784 (h!7640 (_ BitVec 64)) (t!11962 List!6788)) )
))
(declare-fun arrayNoDuplicates!0 (array!24473 (_ BitVec 32) List!6788) Bool)

(assert (=> b!406198 (= lt!188453 (arrayNoDuplicates!0 lt!188452 #b00000000000000000000000000000000 Nil!6785))))

(declare-fun b!406199 () Bool)

(declare-fun res!234591 () Bool)

(assert (=> b!406199 (=> (not res!234591) (not e!244123))))

(assert (=> b!406199 (= res!234591 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6785))))

(declare-fun b!406200 () Bool)

(declare-fun e!244127 () Bool)

(declare-fun mapRes!17058 () Bool)

(assert (=> b!406200 (= e!244127 (and e!244126 mapRes!17058))))

(declare-fun condMapEmpty!17058 () Bool)

(declare-datatypes ((V!14827 0))(
  ( (V!14828 (val!5190 Int)) )
))
(declare-datatypes ((ValueCell!4802 0))(
  ( (ValueCellFull!4802 (v!7437 V!14827)) (EmptyCell!4802) )
))
(declare-datatypes ((array!24475 0))(
  ( (array!24476 (arr!11687 (Array (_ BitVec 32) ValueCell!4802)) (size!12039 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24475)

(declare-fun mapDefault!17058 () ValueCell!4802)

