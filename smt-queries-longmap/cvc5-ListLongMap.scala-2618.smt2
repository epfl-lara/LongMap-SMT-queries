; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39526 () Bool)

(assert start!39526)

(declare-fun b_free!9793 () Bool)

(declare-fun b_next!9793 () Bool)

(assert (=> start!39526 (= b_free!9793 (not b_next!9793))))

(declare-fun tp!34908 () Bool)

(declare-fun b_and!17449 () Bool)

(assert (=> start!39526 (= tp!34908 b_and!17449)))

(declare-fun b!422589 () Bool)

(declare-fun res!246800 () Bool)

(declare-fun e!251399 () Bool)

(assert (=> b!422589 (=> (not res!246800) (not e!251399))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25737 0))(
  ( (array!25738 (arr!12318 (Array (_ BitVec 32) (_ BitVec 64))) (size!12670 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25737)

(assert (=> b!422589 (= res!246800 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12670 _keys!709))))))

(declare-fun b!422590 () Bool)

(declare-fun res!246804 () Bool)

(assert (=> b!422590 (=> (not res!246804) (not e!251399))))

(assert (=> b!422590 (= res!246804 (or (= (select (arr!12318 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12318 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422591 () Bool)

(declare-fun res!246801 () Bool)

(assert (=> b!422591 (=> (not res!246801) (not e!251399))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15699 0))(
  ( (V!15700 (val!5517 Int)) )
))
(declare-datatypes ((ValueCell!5129 0))(
  ( (ValueCellFull!5129 (v!7764 V!15699)) (EmptyCell!5129) )
))
(declare-datatypes ((array!25739 0))(
  ( (array!25740 (arr!12319 (Array (_ BitVec 32) ValueCell!5129)) (size!12671 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25739)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!422591 (= res!246801 (and (= (size!12671 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12670 _keys!709) (size!12671 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422592 () Bool)

(declare-fun e!251400 () Bool)

(assert (=> b!422592 (= e!251400 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15699)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15699)

(declare-datatypes ((tuple2!7246 0))(
  ( (tuple2!7247 (_1!3634 (_ BitVec 64)) (_2!3634 V!15699)) )
))
(declare-datatypes ((List!7252 0))(
  ( (Nil!7249) (Cons!7248 (h!8104 tuple2!7246) (t!12696 List!7252)) )
))
(declare-datatypes ((ListLongMap!6159 0))(
  ( (ListLongMap!6160 (toList!3095 List!7252)) )
))
(declare-fun lt!194000 () ListLongMap!6159)

(declare-fun lt!193999 () array!25737)

(declare-fun v!412 () V!15699)

(declare-fun getCurrentListMapNoExtraKeys!1299 (array!25737 array!25739 (_ BitVec 32) (_ BitVec 32) V!15699 V!15699 (_ BitVec 32) Int) ListLongMap!6159)

(assert (=> b!422592 (= lt!194000 (getCurrentListMapNoExtraKeys!1299 lt!193999 (array!25740 (store (arr!12319 _values!549) i!563 (ValueCellFull!5129 v!412)) (size!12671 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193998 () ListLongMap!6159)

(assert (=> b!422592 (= lt!193998 (getCurrentListMapNoExtraKeys!1299 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18039 () Bool)

(declare-fun mapRes!18039 () Bool)

(declare-fun tp!34907 () Bool)

(declare-fun e!251396 () Bool)

(assert (=> mapNonEmpty!18039 (= mapRes!18039 (and tp!34907 e!251396))))

(declare-fun mapKey!18039 () (_ BitVec 32))

(declare-fun mapValue!18039 () ValueCell!5129)

(declare-fun mapRest!18039 () (Array (_ BitVec 32) ValueCell!5129))

(assert (=> mapNonEmpty!18039 (= (arr!12319 _values!549) (store mapRest!18039 mapKey!18039 mapValue!18039))))

(declare-fun b!422593 () Bool)

(declare-fun tp_is_empty!10945 () Bool)

(assert (=> b!422593 (= e!251396 tp_is_empty!10945)))

(declare-fun b!422594 () Bool)

(declare-fun res!246803 () Bool)

(assert (=> b!422594 (=> (not res!246803) (not e!251400))))

(assert (=> b!422594 (= res!246803 (bvsle from!863 i!563))))

(declare-fun b!422595 () Bool)

(declare-fun res!246805 () Bool)

(assert (=> b!422595 (=> (not res!246805) (not e!251399))))

(declare-datatypes ((List!7253 0))(
  ( (Nil!7250) (Cons!7249 (h!8105 (_ BitVec 64)) (t!12697 List!7253)) )
))
(declare-fun arrayNoDuplicates!0 (array!25737 (_ BitVec 32) List!7253) Bool)

(assert (=> b!422595 (= res!246805 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7250))))

(declare-fun b!422596 () Bool)

(declare-fun e!251395 () Bool)

(assert (=> b!422596 (= e!251395 tp_is_empty!10945)))

(declare-fun b!422597 () Bool)

(declare-fun e!251398 () Bool)

(assert (=> b!422597 (= e!251398 (and e!251395 mapRes!18039))))

(declare-fun condMapEmpty!18039 () Bool)

(declare-fun mapDefault!18039 () ValueCell!5129)

