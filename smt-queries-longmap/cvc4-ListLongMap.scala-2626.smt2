; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39578 () Bool)

(assert start!39578)

(declare-fun b_free!9845 () Bool)

(declare-fun b_next!9845 () Bool)

(assert (=> start!39578 (= b_free!9845 (not b_next!9845))))

(declare-fun tp!35064 () Bool)

(declare-fun b_and!17501 () Bool)

(assert (=> start!39578 (= tp!35064 b_and!17501)))

(declare-fun b!423759 () Bool)

(declare-fun e!251867 () Bool)

(declare-fun e!251868 () Bool)

(assert (=> b!423759 (= e!251867 e!251868)))

(declare-fun res!247737 () Bool)

(assert (=> b!423759 (=> (not res!247737) (not e!251868))))

(declare-datatypes ((array!25837 0))(
  ( (array!25838 (arr!12368 (Array (_ BitVec 32) (_ BitVec 64))) (size!12720 (_ BitVec 32))) )
))
(declare-fun lt!194233 () array!25837)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25837 (_ BitVec 32)) Bool)

(assert (=> b!423759 (= res!247737 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194233 mask!1025))))

(declare-fun _keys!709 () array!25837)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423759 (= lt!194233 (array!25838 (store (arr!12368 _keys!709) i!563 k!794) (size!12720 _keys!709)))))

(declare-fun b!423760 () Bool)

(declare-fun res!247732 () Bool)

(assert (=> b!423760 (=> (not res!247732) (not e!251867))))

(assert (=> b!423760 (= res!247732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18117 () Bool)

(declare-fun mapRes!18117 () Bool)

(declare-fun tp!35063 () Bool)

(declare-fun e!251864 () Bool)

(assert (=> mapNonEmpty!18117 (= mapRes!18117 (and tp!35063 e!251864))))

(declare-fun mapKey!18117 () (_ BitVec 32))

(declare-datatypes ((V!15767 0))(
  ( (V!15768 (val!5543 Int)) )
))
(declare-datatypes ((ValueCell!5155 0))(
  ( (ValueCellFull!5155 (v!7790 V!15767)) (EmptyCell!5155) )
))
(declare-datatypes ((array!25839 0))(
  ( (array!25840 (arr!12369 (Array (_ BitVec 32) ValueCell!5155)) (size!12721 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25839)

(declare-fun mapValue!18117 () ValueCell!5155)

(declare-fun mapRest!18117 () (Array (_ BitVec 32) ValueCell!5155))

(assert (=> mapNonEmpty!18117 (= (arr!12369 _values!549) (store mapRest!18117 mapKey!18117 mapValue!18117))))

(declare-fun res!247740 () Bool)

(assert (=> start!39578 (=> (not res!247740) (not e!251867))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39578 (= res!247740 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12720 _keys!709))))))

(assert (=> start!39578 e!251867))

(declare-fun tp_is_empty!10997 () Bool)

(assert (=> start!39578 tp_is_empty!10997))

(assert (=> start!39578 tp!35064))

(assert (=> start!39578 true))

(declare-fun e!251863 () Bool)

(declare-fun array_inv!9014 (array!25839) Bool)

(assert (=> start!39578 (and (array_inv!9014 _values!549) e!251863)))

(declare-fun array_inv!9015 (array!25837) Bool)

(assert (=> start!39578 (array_inv!9015 _keys!709)))

(declare-fun b!423761 () Bool)

(declare-fun e!251865 () Bool)

(assert (=> b!423761 (= e!251865 tp_is_empty!10997)))

(declare-fun b!423762 () Bool)

(declare-fun res!247738 () Bool)

(assert (=> b!423762 (=> (not res!247738) (not e!251868))))

(declare-datatypes ((List!7290 0))(
  ( (Nil!7287) (Cons!7286 (h!8142 (_ BitVec 64)) (t!12734 List!7290)) )
))
(declare-fun arrayNoDuplicates!0 (array!25837 (_ BitVec 32) List!7290) Bool)

(assert (=> b!423762 (= res!247738 (arrayNoDuplicates!0 lt!194233 #b00000000000000000000000000000000 Nil!7287))))

(declare-fun b!423763 () Bool)

(assert (=> b!423763 (= e!251864 tp_is_empty!10997)))

(declare-fun mapIsEmpty!18117 () Bool)

(assert (=> mapIsEmpty!18117 mapRes!18117))

(declare-fun b!423764 () Bool)

(assert (=> b!423764 (= e!251868 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15767)

(declare-datatypes ((tuple2!7282 0))(
  ( (tuple2!7283 (_1!3652 (_ BitVec 64)) (_2!3652 V!15767)) )
))
(declare-datatypes ((List!7291 0))(
  ( (Nil!7288) (Cons!7287 (h!8143 tuple2!7282) (t!12735 List!7291)) )
))
(declare-datatypes ((ListLongMap!6195 0))(
  ( (ListLongMap!6196 (toList!3113 List!7291)) )
))
(declare-fun lt!194232 () ListLongMap!6195)

(declare-fun v!412 () V!15767)

(declare-fun minValue!515 () V!15767)

(declare-fun getCurrentListMapNoExtraKeys!1317 (array!25837 array!25839 (_ BitVec 32) (_ BitVec 32) V!15767 V!15767 (_ BitVec 32) Int) ListLongMap!6195)

(assert (=> b!423764 (= lt!194232 (getCurrentListMapNoExtraKeys!1317 lt!194233 (array!25840 (store (arr!12369 _values!549) i!563 (ValueCellFull!5155 v!412)) (size!12721 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194234 () ListLongMap!6195)

(assert (=> b!423764 (= lt!194234 (getCurrentListMapNoExtraKeys!1317 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423765 () Bool)

(declare-fun res!247734 () Bool)

(assert (=> b!423765 (=> (not res!247734) (not e!251867))))

(assert (=> b!423765 (= res!247734 (or (= (select (arr!12368 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12368 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423766 () Bool)

(declare-fun res!247733 () Bool)

(assert (=> b!423766 (=> (not res!247733) (not e!251867))))

(assert (=> b!423766 (= res!247733 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12720 _keys!709))))))

(declare-fun b!423767 () Bool)

(declare-fun res!247736 () Bool)

(assert (=> b!423767 (=> (not res!247736) (not e!251868))))

(assert (=> b!423767 (= res!247736 (bvsle from!863 i!563))))

(declare-fun b!423768 () Bool)

(declare-fun res!247742 () Bool)

(assert (=> b!423768 (=> (not res!247742) (not e!251867))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423768 (= res!247742 (validKeyInArray!0 k!794))))

(declare-fun b!423769 () Bool)

(declare-fun res!247735 () Bool)

(assert (=> b!423769 (=> (not res!247735) (not e!251867))))

(assert (=> b!423769 (= res!247735 (and (= (size!12721 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12720 _keys!709) (size!12721 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423770 () Bool)

(declare-fun res!247741 () Bool)

(assert (=> b!423770 (=> (not res!247741) (not e!251867))))

(declare-fun arrayContainsKey!0 (array!25837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423770 (= res!247741 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!423771 () Bool)

(declare-fun res!247743 () Bool)

(assert (=> b!423771 (=> (not res!247743) (not e!251867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423771 (= res!247743 (validMask!0 mask!1025))))

(declare-fun b!423772 () Bool)

(assert (=> b!423772 (= e!251863 (and e!251865 mapRes!18117))))

(declare-fun condMapEmpty!18117 () Bool)

(declare-fun mapDefault!18117 () ValueCell!5155)

