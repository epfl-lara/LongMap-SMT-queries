; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39142 () Bool)

(assert start!39142)

(declare-fun b_free!9409 () Bool)

(declare-fun b_next!9409 () Bool)

(assert (=> start!39142 (= b_free!9409 (not b_next!9409))))

(declare-fun tp!33756 () Bool)

(declare-fun b_and!16795 () Bool)

(assert (=> start!39142 (= tp!33756 b_and!16795)))

(declare-fun b!411807 () Bool)

(declare-fun e!246554 () Bool)

(declare-fun tp_is_empty!10561 () Bool)

(assert (=> b!411807 (= e!246554 tp_is_empty!10561)))

(declare-fun b!411808 () Bool)

(declare-fun res!238987 () Bool)

(declare-fun e!246558 () Bool)

(assert (=> b!411808 (=> (not res!238987) (not e!246558))))

(declare-datatypes ((array!24983 0))(
  ( (array!24984 (arr!11941 (Array (_ BitVec 32) (_ BitVec 64))) (size!12293 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24983)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24983 (_ BitVec 32)) Bool)

(assert (=> b!411808 (= res!238987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411809 () Bool)

(declare-fun res!238984 () Bool)

(declare-fun e!246557 () Bool)

(assert (=> b!411809 (=> (not res!238984) (not e!246557))))

(declare-fun lt!189355 () array!24983)

(declare-datatypes ((List!6933 0))(
  ( (Nil!6930) (Cons!6929 (h!7785 (_ BitVec 64)) (t!12107 List!6933)) )
))
(declare-fun arrayNoDuplicates!0 (array!24983 (_ BitVec 32) List!6933) Bool)

(assert (=> b!411809 (= res!238984 (arrayNoDuplicates!0 lt!189355 #b00000000000000000000000000000000 Nil!6930))))

(declare-fun mapNonEmpty!17463 () Bool)

(declare-fun mapRes!17463 () Bool)

(declare-fun tp!33755 () Bool)

(assert (=> mapNonEmpty!17463 (= mapRes!17463 (and tp!33755 e!246554))))

(declare-datatypes ((V!15187 0))(
  ( (V!15188 (val!5325 Int)) )
))
(declare-datatypes ((ValueCell!4937 0))(
  ( (ValueCellFull!4937 (v!7572 V!15187)) (EmptyCell!4937) )
))
(declare-datatypes ((array!24985 0))(
  ( (array!24986 (arr!11942 (Array (_ BitVec 32) ValueCell!4937)) (size!12294 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24985)

(declare-fun mapValue!17463 () ValueCell!4937)

(declare-fun mapRest!17463 () (Array (_ BitVec 32) ValueCell!4937))

(declare-fun mapKey!17463 () (_ BitVec 32))

(assert (=> mapNonEmpty!17463 (= (arr!11942 _values!549) (store mapRest!17463 mapKey!17463 mapValue!17463))))

(declare-fun mapIsEmpty!17463 () Bool)

(assert (=> mapIsEmpty!17463 mapRes!17463))

(declare-fun b!411811 () Bool)

(assert (=> b!411811 (= e!246557 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15187)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15187)

(declare-datatypes ((tuple2!6908 0))(
  ( (tuple2!6909 (_1!3465 (_ BitVec 64)) (_2!3465 V!15187)) )
))
(declare-datatypes ((List!6934 0))(
  ( (Nil!6931) (Cons!6930 (h!7786 tuple2!6908) (t!12108 List!6934)) )
))
(declare-datatypes ((ListLongMap!5821 0))(
  ( (ListLongMap!5822 (toList!2926 List!6934)) )
))
(declare-fun lt!189356 () ListLongMap!5821)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15187)

(declare-fun getCurrentListMapNoExtraKeys!1134 (array!24983 array!24985 (_ BitVec 32) (_ BitVec 32) V!15187 V!15187 (_ BitVec 32) Int) ListLongMap!5821)

(assert (=> b!411811 (= lt!189356 (getCurrentListMapNoExtraKeys!1134 lt!189355 (array!24986 (store (arr!11942 _values!549) i!563 (ValueCellFull!4937 v!412)) (size!12294 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189354 () ListLongMap!5821)

(assert (=> b!411811 (= lt!189354 (getCurrentListMapNoExtraKeys!1134 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!411812 () Bool)

(declare-fun e!246553 () Bool)

(declare-fun e!246556 () Bool)

(assert (=> b!411812 (= e!246553 (and e!246556 mapRes!17463))))

(declare-fun condMapEmpty!17463 () Bool)

(declare-fun mapDefault!17463 () ValueCell!4937)

