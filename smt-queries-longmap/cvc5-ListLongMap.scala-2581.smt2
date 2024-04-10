; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39304 () Bool)

(assert start!39304)

(declare-fun b_free!9571 () Bool)

(declare-fun b_next!9571 () Bool)

(assert (=> start!39304 (= b_free!9571 (not b_next!9571))))

(declare-fun tp!34241 () Bool)

(declare-fun b_and!17017 () Bool)

(assert (=> start!39304 (= tp!34241 b_and!17017)))

(declare-fun b!416132 () Bool)

(declare-fun res!242181 () Bool)

(declare-fun e!248465 () Bool)

(assert (=> b!416132 (=> (not res!242181) (not e!248465))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416132 (= res!242181 (validMask!0 mask!1025))))

(declare-fun e!248462 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((V!15403 0))(
  ( (V!15404 (val!5406 Int)) )
))
(declare-datatypes ((tuple2!7046 0))(
  ( (tuple2!7047 (_1!3534 (_ BitVec 64)) (_2!3534 V!15403)) )
))
(declare-datatypes ((List!7065 0))(
  ( (Nil!7062) (Cons!7061 (h!7917 tuple2!7046) (t!12301 List!7065)) )
))
(declare-datatypes ((ListLongMap!5959 0))(
  ( (ListLongMap!5960 (toList!2995 List!7065)) )
))
(declare-fun call!28891 () ListLongMap!5959)

(declare-fun call!28892 () ListLongMap!5959)

(declare-fun v!412 () V!15403)

(declare-fun b!416134 () Bool)

(declare-fun +!1197 (ListLongMap!5959 tuple2!7046) ListLongMap!5959)

(assert (=> b!416134 (= e!248462 (= call!28891 (+!1197 call!28892 (tuple2!7047 k!794 v!412))))))

(declare-fun b!416135 () Bool)

(declare-fun res!242175 () Bool)

(declare-fun e!248458 () Bool)

(assert (=> b!416135 (=> (not res!242175) (not e!248458))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416135 (= res!242175 (bvsle from!863 i!563))))

(declare-fun b!416136 () Bool)

(declare-fun e!248464 () Bool)

(assert (=> b!416136 (= e!248458 e!248464)))

(declare-fun res!242178 () Bool)

(assert (=> b!416136 (=> (not res!242178) (not e!248464))))

(assert (=> b!416136 (= res!242178 (= from!863 i!563))))

(declare-fun minValue!515 () V!15403)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25301 0))(
  ( (array!25302 (arr!12100 (Array (_ BitVec 32) (_ BitVec 64))) (size!12452 (_ BitVec 32))) )
))
(declare-fun lt!190498 () array!25301)

(declare-fun zeroValue!515 () V!15403)

(declare-fun lt!190496 () ListLongMap!5959)

(declare-datatypes ((ValueCell!5018 0))(
  ( (ValueCellFull!5018 (v!7653 V!15403)) (EmptyCell!5018) )
))
(declare-datatypes ((array!25303 0))(
  ( (array!25304 (arr!12101 (Array (_ BitVec 32) ValueCell!5018)) (size!12453 (_ BitVec 32))) )
))
(declare-fun lt!190503 () array!25303)

(declare-fun getCurrentListMapNoExtraKeys!1200 (array!25301 array!25303 (_ BitVec 32) (_ BitVec 32) V!15403 V!15403 (_ BitVec 32) Int) ListLongMap!5959)

(assert (=> b!416136 (= lt!190496 (getCurrentListMapNoExtraKeys!1200 lt!190498 lt!190503 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25303)

(assert (=> b!416136 (= lt!190503 (array!25304 (store (arr!12101 _values!549) i!563 (ValueCellFull!5018 v!412)) (size!12453 _values!549)))))

(declare-fun lt!190495 () ListLongMap!5959)

(declare-fun _keys!709 () array!25301)

(assert (=> b!416136 (= lt!190495 (getCurrentListMapNoExtraKeys!1200 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416137 () Bool)

(declare-fun res!242177 () Bool)

(assert (=> b!416137 (=> (not res!242177) (not e!248465))))

(declare-fun arrayContainsKey!0 (array!25301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416137 (= res!242177 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!416138 () Bool)

(declare-fun res!242186 () Bool)

(assert (=> b!416138 (=> (not res!242186) (not e!248465))))

(declare-datatypes ((List!7066 0))(
  ( (Nil!7063) (Cons!7062 (h!7918 (_ BitVec 64)) (t!12302 List!7066)) )
))
(declare-fun arrayNoDuplicates!0 (array!25301 (_ BitVec 32) List!7066) Bool)

(assert (=> b!416138 (= res!242186 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7063))))

(declare-fun mapNonEmpty!17706 () Bool)

(declare-fun mapRes!17706 () Bool)

(declare-fun tp!34242 () Bool)

(declare-fun e!248466 () Bool)

(assert (=> mapNonEmpty!17706 (= mapRes!17706 (and tp!34242 e!248466))))

(declare-fun mapRest!17706 () (Array (_ BitVec 32) ValueCell!5018))

(declare-fun mapKey!17706 () (_ BitVec 32))

(declare-fun mapValue!17706 () ValueCell!5018)

(assert (=> mapNonEmpty!17706 (= (arr!12101 _values!549) (store mapRest!17706 mapKey!17706 mapValue!17706))))

(declare-fun b!416139 () Bool)

(declare-fun e!248461 () Bool)

(assert (=> b!416139 (= e!248461 true)))

(declare-fun lt!190497 () tuple2!7046)

(declare-fun lt!190504 () V!15403)

(declare-fun lt!190499 () ListLongMap!5959)

(assert (=> b!416139 (= (+!1197 lt!190499 lt!190497) (+!1197 (+!1197 lt!190499 (tuple2!7047 k!794 lt!190504)) lt!190497))))

(declare-fun lt!190500 () V!15403)

(assert (=> b!416139 (= lt!190497 (tuple2!7047 k!794 lt!190500))))

(declare-datatypes ((Unit!12298 0))(
  ( (Unit!12299) )
))
(declare-fun lt!190502 () Unit!12298)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!2 (ListLongMap!5959 (_ BitVec 64) V!15403 V!15403) Unit!12298)

(assert (=> b!416139 (= lt!190502 (addSameAsAddTwiceSameKeyDiffValues!2 lt!190499 k!794 lt!190504 lt!190500))))

(declare-fun lt!190505 () V!15403)

(declare-fun get!5978 (ValueCell!5018 V!15403) V!15403)

(assert (=> b!416139 (= lt!190504 (get!5978 (select (arr!12101 _values!549) from!863) lt!190505))))

(assert (=> b!416139 (= lt!190496 (+!1197 lt!190499 (tuple2!7047 (select (arr!12100 lt!190498) from!863) lt!190500)))))

(assert (=> b!416139 (= lt!190500 (get!5978 (select (store (arr!12101 _values!549) i!563 (ValueCellFull!5018 v!412)) from!863) lt!190505))))

(declare-fun dynLambda!673 (Int (_ BitVec 64)) V!15403)

(assert (=> b!416139 (= lt!190505 (dynLambda!673 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416139 (= lt!190499 (getCurrentListMapNoExtraKeys!1200 lt!190498 lt!190503 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416140 () Bool)

(assert (=> b!416140 (= e!248462 (= call!28892 call!28891))))

(declare-fun b!416141 () Bool)

(declare-fun e!248463 () Bool)

(declare-fun e!248459 () Bool)

(assert (=> b!416141 (= e!248463 (and e!248459 mapRes!17706))))

(declare-fun condMapEmpty!17706 () Bool)

(declare-fun mapDefault!17706 () ValueCell!5018)

