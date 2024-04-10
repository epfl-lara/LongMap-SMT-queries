; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20562 () Bool)

(assert start!20562)

(declare-fun b_free!5221 () Bool)

(declare-fun b_next!5221 () Bool)

(assert (=> start!20562 (= b_free!5221 (not b_next!5221))))

(declare-fun tp!18694 () Bool)

(declare-fun b_and!11967 () Bool)

(assert (=> start!20562 (= tp!18694 b_and!11967)))

(declare-fun b!204624 () Bool)

(declare-fun res!98646 () Bool)

(declare-fun e!133870 () Bool)

(assert (=> b!204624 (=> (not res!98646) (not e!133870))))

(declare-datatypes ((array!9371 0))(
  ( (array!9372 (arr!4436 (Array (_ BitVec 32) (_ BitVec 64))) (size!4761 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9371)

(declare-datatypes ((List!2814 0))(
  ( (Nil!2811) (Cons!2810 (h!3452 (_ BitVec 64)) (t!7745 List!2814)) )
))
(declare-fun arrayNoDuplicates!0 (array!9371 (_ BitVec 32) List!2814) Bool)

(assert (=> b!204624 (= res!98646 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2811))))

(declare-fun b!204625 () Bool)

(declare-fun e!133868 () Bool)

(declare-fun tp_is_empty!5077 () Bool)

(assert (=> b!204625 (= e!133868 tp_is_empty!5077)))

(declare-fun res!98645 () Bool)

(assert (=> start!20562 (=> (not res!98645) (not e!133870))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20562 (= res!98645 (validMask!0 mask!1149))))

(assert (=> start!20562 e!133870))

(declare-datatypes ((V!6417 0))(
  ( (V!6418 (val!2583 Int)) )
))
(declare-datatypes ((ValueCell!2195 0))(
  ( (ValueCellFull!2195 (v!4553 V!6417)) (EmptyCell!2195) )
))
(declare-datatypes ((array!9373 0))(
  ( (array!9374 (arr!4437 (Array (_ BitVec 32) ValueCell!2195)) (size!4762 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9373)

(declare-fun e!133871 () Bool)

(declare-fun array_inv!2927 (array!9373) Bool)

(assert (=> start!20562 (and (array_inv!2927 _values!649) e!133871)))

(assert (=> start!20562 true))

(assert (=> start!20562 tp_is_empty!5077))

(declare-fun array_inv!2928 (array!9371) Bool)

(assert (=> start!20562 (array_inv!2928 _keys!825)))

(assert (=> start!20562 tp!18694))

(declare-fun b!204626 () Bool)

(declare-fun res!98649 () Bool)

(assert (=> b!204626 (=> (not res!98649) (not e!133870))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204626 (= res!98649 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4761 _keys!825))))))

(declare-fun b!204627 () Bool)

(declare-fun e!133872 () Bool)

(assert (=> b!204627 (= e!133872 tp_is_empty!5077)))

(declare-fun b!204628 () Bool)

(declare-fun e!133874 () Bool)

(assert (=> b!204628 (= e!133870 (not e!133874))))

(declare-fun res!98648 () Bool)

(assert (=> b!204628 (=> res!98648 e!133874)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204628 (= res!98648 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3916 0))(
  ( (tuple2!3917 (_1!1969 (_ BitVec 64)) (_2!1969 V!6417)) )
))
(declare-datatypes ((List!2815 0))(
  ( (Nil!2812) (Cons!2811 (h!3453 tuple2!3916) (t!7746 List!2815)) )
))
(declare-datatypes ((ListLongMap!2829 0))(
  ( (ListLongMap!2830 (toList!1430 List!2815)) )
))
(declare-fun lt!103761 () ListLongMap!2829)

(declare-fun zeroValue!615 () V!6417)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6417)

(declare-fun getCurrentListMap!1003 (array!9371 array!9373 (_ BitVec 32) (_ BitVec 32) V!6417 V!6417 (_ BitVec 32) Int) ListLongMap!2829)

(assert (=> b!204628 (= lt!103761 (getCurrentListMap!1003 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103756 () array!9373)

(declare-fun lt!103762 () ListLongMap!2829)

(assert (=> b!204628 (= lt!103762 (getCurrentListMap!1003 _keys!825 lt!103756 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103767 () ListLongMap!2829)

(declare-fun lt!103766 () ListLongMap!2829)

(assert (=> b!204628 (and (= lt!103767 lt!103766) (= lt!103766 lt!103767))))

(declare-fun lt!103763 () ListLongMap!2829)

(declare-fun lt!103758 () tuple2!3916)

(declare-fun +!457 (ListLongMap!2829 tuple2!3916) ListLongMap!2829)

(assert (=> b!204628 (= lt!103766 (+!457 lt!103763 lt!103758))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6417)

(assert (=> b!204628 (= lt!103758 (tuple2!3917 k!843 v!520))))

(declare-datatypes ((Unit!6206 0))(
  ( (Unit!6207) )
))
(declare-fun lt!103757 () Unit!6206)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!116 (array!9371 array!9373 (_ BitVec 32) (_ BitVec 32) V!6417 V!6417 (_ BitVec 32) (_ BitVec 64) V!6417 (_ BitVec 32) Int) Unit!6206)

(assert (=> b!204628 (= lt!103757 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!116 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!377 (array!9371 array!9373 (_ BitVec 32) (_ BitVec 32) V!6417 V!6417 (_ BitVec 32) Int) ListLongMap!2829)

(assert (=> b!204628 (= lt!103767 (getCurrentListMapNoExtraKeys!377 _keys!825 lt!103756 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204628 (= lt!103756 (array!9374 (store (arr!4437 _values!649) i!601 (ValueCellFull!2195 v!520)) (size!4762 _values!649)))))

(assert (=> b!204628 (= lt!103763 (getCurrentListMapNoExtraKeys!377 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204629 () Bool)

(declare-fun res!98651 () Bool)

(assert (=> b!204629 (=> (not res!98651) (not e!133870))))

(assert (=> b!204629 (= res!98651 (= (select (arr!4436 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8684 () Bool)

(declare-fun mapRes!8684 () Bool)

(declare-fun tp!18695 () Bool)

(assert (=> mapNonEmpty!8684 (= mapRes!8684 (and tp!18695 e!133872))))

(declare-fun mapRest!8684 () (Array (_ BitVec 32) ValueCell!2195))

(declare-fun mapKey!8684 () (_ BitVec 32))

(declare-fun mapValue!8684 () ValueCell!2195)

(assert (=> mapNonEmpty!8684 (= (arr!4437 _values!649) (store mapRest!8684 mapKey!8684 mapValue!8684))))

(declare-fun b!204630 () Bool)

(declare-fun e!133873 () Bool)

(assert (=> b!204630 (= e!133874 e!133873)))

(declare-fun res!98650 () Bool)

(assert (=> b!204630 (=> res!98650 e!133873)))

(assert (=> b!204630 (= res!98650 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103764 () ListLongMap!2829)

(assert (=> b!204630 (= lt!103761 lt!103764)))

(declare-fun lt!103760 () tuple2!3916)

(assert (=> b!204630 (= lt!103764 (+!457 lt!103763 lt!103760))))

(declare-fun lt!103765 () ListLongMap!2829)

(assert (=> b!204630 (= lt!103762 lt!103765)))

(assert (=> b!204630 (= lt!103765 (+!457 lt!103766 lt!103760))))

(assert (=> b!204630 (= lt!103762 (+!457 lt!103767 lt!103760))))

(assert (=> b!204630 (= lt!103760 (tuple2!3917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204631 () Bool)

(declare-fun res!98652 () Bool)

(assert (=> b!204631 (=> (not res!98652) (not e!133870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204631 (= res!98652 (validKeyInArray!0 k!843))))

(declare-fun b!204632 () Bool)

(declare-fun res!98653 () Bool)

(assert (=> b!204632 (=> (not res!98653) (not e!133870))))

(assert (=> b!204632 (= res!98653 (and (= (size!4762 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4761 _keys!825) (size!4762 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204633 () Bool)

(declare-fun res!98647 () Bool)

(assert (=> b!204633 (=> (not res!98647) (not e!133870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9371 (_ BitVec 32)) Bool)

(assert (=> b!204633 (= res!98647 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204634 () Bool)

(assert (=> b!204634 (= e!133873 true)))

(assert (=> b!204634 (= lt!103765 (+!457 lt!103764 lt!103758))))

(declare-fun lt!103759 () Unit!6206)

(declare-fun addCommutativeForDiffKeys!163 (ListLongMap!2829 (_ BitVec 64) V!6417 (_ BitVec 64) V!6417) Unit!6206)

(assert (=> b!204634 (= lt!103759 (addCommutativeForDiffKeys!163 lt!103763 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!8684 () Bool)

(assert (=> mapIsEmpty!8684 mapRes!8684))

(declare-fun b!204635 () Bool)

(assert (=> b!204635 (= e!133871 (and e!133868 mapRes!8684))))

(declare-fun condMapEmpty!8684 () Bool)

(declare-fun mapDefault!8684 () ValueCell!2195)

