; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20098 () Bool)

(assert start!20098)

(declare-fun b_free!4757 () Bool)

(declare-fun b_next!4757 () Bool)

(assert (=> start!20098 (= b_free!4757 (not b_next!4757))))

(declare-fun tp!17303 () Bool)

(declare-fun b_and!11503 () Bool)

(assert (=> start!20098 (= tp!17303 b_and!11503)))

(declare-fun b!196904 () Bool)

(declare-fun res!93017 () Bool)

(declare-fun e!129657 () Bool)

(assert (=> b!196904 (=> (not res!93017) (not e!129657))))

(declare-datatypes ((array!8481 0))(
  ( (array!8482 (arr!3991 (Array (_ BitVec 32) (_ BitVec 64))) (size!4316 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8481)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5797 0))(
  ( (V!5798 (val!2351 Int)) )
))
(declare-datatypes ((ValueCell!1963 0))(
  ( (ValueCellFull!1963 (v!4321 V!5797)) (EmptyCell!1963) )
))
(declare-datatypes ((array!8483 0))(
  ( (array!8484 (arr!3992 (Array (_ BitVec 32) ValueCell!1963)) (size!4317 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8483)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196904 (= res!93017 (and (= (size!4317 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4316 _keys!825) (size!4317 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!93013 () Bool)

(assert (=> start!20098 (=> (not res!93013) (not e!129657))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20098 (= res!93013 (validMask!0 mask!1149))))

(assert (=> start!20098 e!129657))

(declare-fun e!129658 () Bool)

(declare-fun array_inv!2605 (array!8483) Bool)

(assert (=> start!20098 (and (array_inv!2605 _values!649) e!129658)))

(assert (=> start!20098 true))

(declare-fun tp_is_empty!4613 () Bool)

(assert (=> start!20098 tp_is_empty!4613))

(declare-fun array_inv!2606 (array!8481) Bool)

(assert (=> start!20098 (array_inv!2606 _keys!825)))

(assert (=> start!20098 tp!17303))

(declare-fun b!196905 () Bool)

(declare-fun e!129656 () Bool)

(assert (=> b!196905 (= e!129656 tp_is_empty!4613)))

(declare-fun b!196906 () Bool)

(declare-fun res!93018 () Bool)

(assert (=> b!196906 (=> (not res!93018) (not e!129657))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!196906 (= res!93018 (= (select (arr!3991 _keys!825) i!601) k!843))))

(declare-fun b!196907 () Bool)

(declare-fun res!93019 () Bool)

(assert (=> b!196907 (=> (not res!93019) (not e!129657))))

(assert (=> b!196907 (= res!93019 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4316 _keys!825))))))

(declare-fun b!196908 () Bool)

(assert (=> b!196908 (= e!129657 false)))

(declare-datatypes ((tuple2!3582 0))(
  ( (tuple2!3583 (_1!1802 (_ BitVec 64)) (_2!1802 V!5797)) )
))
(declare-datatypes ((List!2494 0))(
  ( (Nil!2491) (Cons!2490 (h!3132 tuple2!3582) (t!7425 List!2494)) )
))
(declare-datatypes ((ListLongMap!2495 0))(
  ( (ListLongMap!2496 (toList!1263 List!2494)) )
))
(declare-fun lt!97665 () ListLongMap!2495)

(declare-fun zeroValue!615 () V!5797)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!5797)

(declare-fun getCurrentListMapNoExtraKeys!228 (array!8481 array!8483 (_ BitVec 32) (_ BitVec 32) V!5797 V!5797 (_ BitVec 32) Int) ListLongMap!2495)

(assert (=> b!196908 (= lt!97665 (getCurrentListMapNoExtraKeys!228 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!7988 () Bool)

(declare-fun mapRes!7988 () Bool)

(assert (=> mapIsEmpty!7988 mapRes!7988))

(declare-fun b!196909 () Bool)

(declare-fun res!93015 () Bool)

(assert (=> b!196909 (=> (not res!93015) (not e!129657))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8481 (_ BitVec 32)) Bool)

(assert (=> b!196909 (= res!93015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196910 () Bool)

(declare-fun res!93014 () Bool)

(assert (=> b!196910 (=> (not res!93014) (not e!129657))))

(declare-datatypes ((List!2495 0))(
  ( (Nil!2492) (Cons!2491 (h!3133 (_ BitVec 64)) (t!7426 List!2495)) )
))
(declare-fun arrayNoDuplicates!0 (array!8481 (_ BitVec 32) List!2495) Bool)

(assert (=> b!196910 (= res!93014 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2492))))

(declare-fun b!196911 () Bool)

(declare-fun e!129659 () Bool)

(assert (=> b!196911 (= e!129659 tp_is_empty!4613)))

(declare-fun b!196912 () Bool)

(declare-fun res!93016 () Bool)

(assert (=> b!196912 (=> (not res!93016) (not e!129657))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196912 (= res!93016 (validKeyInArray!0 k!843))))

(declare-fun mapNonEmpty!7988 () Bool)

(declare-fun tp!17302 () Bool)

(assert (=> mapNonEmpty!7988 (= mapRes!7988 (and tp!17302 e!129659))))

(declare-fun mapKey!7988 () (_ BitVec 32))

(declare-fun mapRest!7988 () (Array (_ BitVec 32) ValueCell!1963))

(declare-fun mapValue!7988 () ValueCell!1963)

(assert (=> mapNonEmpty!7988 (= (arr!3992 _values!649) (store mapRest!7988 mapKey!7988 mapValue!7988))))

(declare-fun b!196913 () Bool)

(assert (=> b!196913 (= e!129658 (and e!129656 mapRes!7988))))

(declare-fun condMapEmpty!7988 () Bool)

(declare-fun mapDefault!7988 () ValueCell!1963)

