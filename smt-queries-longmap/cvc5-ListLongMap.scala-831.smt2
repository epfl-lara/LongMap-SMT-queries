; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20082 () Bool)

(assert start!20082)

(declare-fun b_free!4741 () Bool)

(declare-fun b_next!4741 () Bool)

(assert (=> start!20082 (= b_free!4741 (not b_next!4741))))

(declare-fun tp!17254 () Bool)

(declare-fun b_and!11487 () Bool)

(assert (=> start!20082 (= tp!17254 b_and!11487)))

(declare-fun mapIsEmpty!7964 () Bool)

(declare-fun mapRes!7964 () Bool)

(assert (=> mapIsEmpty!7964 mapRes!7964))

(declare-fun b!196664 () Bool)

(declare-fun res!92845 () Bool)

(declare-fun e!129538 () Bool)

(assert (=> b!196664 (=> (not res!92845) (not e!129538))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196664 (= res!92845 (validKeyInArray!0 k!843))))

(declare-fun b!196665 () Bool)

(assert (=> b!196665 (= e!129538 false)))

(declare-datatypes ((V!5777 0))(
  ( (V!5778 (val!2343 Int)) )
))
(declare-datatypes ((ValueCell!1955 0))(
  ( (ValueCellFull!1955 (v!4313 V!5777)) (EmptyCell!1955) )
))
(declare-datatypes ((array!8451 0))(
  ( (array!8452 (arr!3976 (Array (_ BitVec 32) ValueCell!1955)) (size!4301 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8451)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3570 0))(
  ( (tuple2!3571 (_1!1796 (_ BitVec 64)) (_2!1796 V!5777)) )
))
(declare-datatypes ((List!2481 0))(
  ( (Nil!2478) (Cons!2477 (h!3119 tuple2!3570) (t!7412 List!2481)) )
))
(declare-datatypes ((ListLongMap!2483 0))(
  ( (ListLongMap!2484 (toList!1257 List!2481)) )
))
(declare-fun lt!97641 () ListLongMap!2483)

(declare-fun zeroValue!615 () V!5777)

(declare-datatypes ((array!8453 0))(
  ( (array!8454 (arr!3977 (Array (_ BitVec 32) (_ BitVec 64))) (size!4302 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8453)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!5777)

(declare-fun getCurrentListMapNoExtraKeys!222 (array!8453 array!8451 (_ BitVec 32) (_ BitVec 32) V!5777 V!5777 (_ BitVec 32) Int) ListLongMap!2483)

(assert (=> b!196665 (= lt!97641 (getCurrentListMapNoExtraKeys!222 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!7964 () Bool)

(declare-fun tp!17255 () Bool)

(declare-fun e!129535 () Bool)

(assert (=> mapNonEmpty!7964 (= mapRes!7964 (and tp!17255 e!129535))))

(declare-fun mapKey!7964 () (_ BitVec 32))

(declare-fun mapValue!7964 () ValueCell!1955)

(declare-fun mapRest!7964 () (Array (_ BitVec 32) ValueCell!1955))

(assert (=> mapNonEmpty!7964 (= (arr!3976 _values!649) (store mapRest!7964 mapKey!7964 mapValue!7964))))

(declare-fun b!196666 () Bool)

(declare-fun tp_is_empty!4597 () Bool)

(assert (=> b!196666 (= e!129535 tp_is_empty!4597)))

(declare-fun res!92846 () Bool)

(assert (=> start!20082 (=> (not res!92846) (not e!129538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20082 (= res!92846 (validMask!0 mask!1149))))

(assert (=> start!20082 e!129538))

(declare-fun e!129539 () Bool)

(declare-fun array_inv!2593 (array!8451) Bool)

(assert (=> start!20082 (and (array_inv!2593 _values!649) e!129539)))

(assert (=> start!20082 true))

(assert (=> start!20082 tp_is_empty!4597))

(declare-fun array_inv!2594 (array!8453) Bool)

(assert (=> start!20082 (array_inv!2594 _keys!825)))

(assert (=> start!20082 tp!17254))

(declare-fun b!196667 () Bool)

(declare-fun res!92850 () Bool)

(assert (=> b!196667 (=> (not res!92850) (not e!129538))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196667 (= res!92850 (= (select (arr!3977 _keys!825) i!601) k!843))))

(declare-fun b!196668 () Bool)

(declare-fun res!92847 () Bool)

(assert (=> b!196668 (=> (not res!92847) (not e!129538))))

(declare-datatypes ((List!2482 0))(
  ( (Nil!2479) (Cons!2478 (h!3120 (_ BitVec 64)) (t!7413 List!2482)) )
))
(declare-fun arrayNoDuplicates!0 (array!8453 (_ BitVec 32) List!2482) Bool)

(assert (=> b!196668 (= res!92847 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2479))))

(declare-fun b!196669 () Bool)

(declare-fun e!129536 () Bool)

(assert (=> b!196669 (= e!129539 (and e!129536 mapRes!7964))))

(declare-fun condMapEmpty!7964 () Bool)

(declare-fun mapDefault!7964 () ValueCell!1955)

