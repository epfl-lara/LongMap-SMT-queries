; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39572 () Bool)

(assert start!39572)

(declare-fun b_free!9839 () Bool)

(declare-fun b_next!9839 () Bool)

(assert (=> start!39572 (= b_free!9839 (not b_next!9839))))

(declare-fun tp!35046 () Bool)

(declare-fun b_and!17495 () Bool)

(assert (=> start!39572 (= tp!35046 b_and!17495)))

(declare-fun b!423624 () Bool)

(declare-fun res!247629 () Bool)

(declare-fun e!251814 () Bool)

(assert (=> b!423624 (=> (not res!247629) (not e!251814))))

(declare-datatypes ((array!25825 0))(
  ( (array!25826 (arr!12362 (Array (_ BitVec 32) (_ BitVec 64))) (size!12714 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25825)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15759 0))(
  ( (V!15760 (val!5540 Int)) )
))
(declare-datatypes ((ValueCell!5152 0))(
  ( (ValueCellFull!5152 (v!7787 V!15759)) (EmptyCell!5152) )
))
(declare-datatypes ((array!25827 0))(
  ( (array!25828 (arr!12363 (Array (_ BitVec 32) ValueCell!5152)) (size!12715 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25827)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!423624 (= res!247629 (and (= (size!12715 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12714 _keys!709) (size!12715 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423625 () Bool)

(declare-fun res!247624 () Bool)

(assert (=> b!423625 (=> (not res!247624) (not e!251814))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25825 (_ BitVec 32)) Bool)

(assert (=> b!423625 (= res!247624 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423626 () Bool)

(declare-fun e!251809 () Bool)

(declare-fun tp_is_empty!10991 () Bool)

(assert (=> b!423626 (= e!251809 tp_is_empty!10991)))

(declare-fun b!423627 () Bool)

(declare-fun res!247634 () Bool)

(assert (=> b!423627 (=> (not res!247634) (not e!251814))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423627 (= res!247634 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12714 _keys!709))))))

(declare-fun res!247630 () Bool)

(assert (=> start!39572 (=> (not res!247630) (not e!251814))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39572 (= res!247630 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12714 _keys!709))))))

(assert (=> start!39572 e!251814))

(assert (=> start!39572 tp_is_empty!10991))

(assert (=> start!39572 tp!35046))

(assert (=> start!39572 true))

(declare-fun e!251811 () Bool)

(declare-fun array_inv!9008 (array!25827) Bool)

(assert (=> start!39572 (and (array_inv!9008 _values!549) e!251811)))

(declare-fun array_inv!9009 (array!25825) Bool)

(assert (=> start!39572 (array_inv!9009 _keys!709)))

(declare-fun mapIsEmpty!18108 () Bool)

(declare-fun mapRes!18108 () Bool)

(assert (=> mapIsEmpty!18108 mapRes!18108))

(declare-fun b!423628 () Bool)

(declare-fun e!251813 () Bool)

(assert (=> b!423628 (= e!251813 tp_is_empty!10991)))

(declare-fun b!423629 () Bool)

(declare-fun res!247633 () Bool)

(assert (=> b!423629 (=> (not res!247633) (not e!251814))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423629 (= res!247633 (validKeyInArray!0 k!794))))

(declare-fun b!423630 () Bool)

(declare-fun res!247632 () Bool)

(declare-fun e!251812 () Bool)

(assert (=> b!423630 (=> (not res!247632) (not e!251812))))

(declare-fun lt!194207 () array!25825)

(declare-datatypes ((List!7284 0))(
  ( (Nil!7281) (Cons!7280 (h!8136 (_ BitVec 64)) (t!12728 List!7284)) )
))
(declare-fun arrayNoDuplicates!0 (array!25825 (_ BitVec 32) List!7284) Bool)

(assert (=> b!423630 (= res!247632 (arrayNoDuplicates!0 lt!194207 #b00000000000000000000000000000000 Nil!7281))))

(declare-fun b!423631 () Bool)

(assert (=> b!423631 (= e!251812 false)))

(declare-fun minValue!515 () V!15759)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15759)

(declare-fun v!412 () V!15759)

(declare-datatypes ((tuple2!7276 0))(
  ( (tuple2!7277 (_1!3649 (_ BitVec 64)) (_2!3649 V!15759)) )
))
(declare-datatypes ((List!7285 0))(
  ( (Nil!7282) (Cons!7281 (h!8137 tuple2!7276) (t!12729 List!7285)) )
))
(declare-datatypes ((ListLongMap!6189 0))(
  ( (ListLongMap!6190 (toList!3110 List!7285)) )
))
(declare-fun lt!194205 () ListLongMap!6189)

(declare-fun getCurrentListMapNoExtraKeys!1314 (array!25825 array!25827 (_ BitVec 32) (_ BitVec 32) V!15759 V!15759 (_ BitVec 32) Int) ListLongMap!6189)

(assert (=> b!423631 (= lt!194205 (getCurrentListMapNoExtraKeys!1314 lt!194207 (array!25828 (store (arr!12363 _values!549) i!563 (ValueCellFull!5152 v!412)) (size!12715 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194206 () ListLongMap!6189)

(assert (=> b!423631 (= lt!194206 (getCurrentListMapNoExtraKeys!1314 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423632 () Bool)

(declare-fun res!247628 () Bool)

(assert (=> b!423632 (=> (not res!247628) (not e!251814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423632 (= res!247628 (validMask!0 mask!1025))))

(declare-fun b!423633 () Bool)

(assert (=> b!423633 (= e!251811 (and e!251813 mapRes!18108))))

(declare-fun condMapEmpty!18108 () Bool)

(declare-fun mapDefault!18108 () ValueCell!5152)

