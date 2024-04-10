; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20642 () Bool)

(assert start!20642)

(declare-fun b_free!5301 () Bool)

(declare-fun b_next!5301 () Bool)

(assert (=> start!20642 (= b_free!5301 (not b_next!5301))))

(declare-fun tp!18934 () Bool)

(declare-fun b_and!12047 () Bool)

(assert (=> start!20642 (= tp!18934 b_and!12047)))

(declare-fun b!206064 () Bool)

(declare-fun res!99733 () Bool)

(declare-fun e!134712 () Bool)

(assert (=> b!206064 (=> (not res!99733) (not e!134712))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9525 0))(
  ( (array!9526 (arr!4513 (Array (_ BitVec 32) (_ BitVec 64))) (size!4838 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9525)

(assert (=> b!206064 (= res!99733 (= (select (arr!4513 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8804 () Bool)

(declare-fun mapRes!8804 () Bool)

(assert (=> mapIsEmpty!8804 mapRes!8804))

(declare-fun b!206065 () Bool)

(declare-fun e!134710 () Bool)

(declare-fun tp_is_empty!5157 () Bool)

(assert (=> b!206065 (= e!134710 tp_is_empty!5157)))

(declare-fun res!99725 () Bool)

(assert (=> start!20642 (=> (not res!99725) (not e!134712))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20642 (= res!99725 (validMask!0 mask!1149))))

(assert (=> start!20642 e!134712))

(declare-datatypes ((V!6523 0))(
  ( (V!6524 (val!2623 Int)) )
))
(declare-datatypes ((ValueCell!2235 0))(
  ( (ValueCellFull!2235 (v!4593 V!6523)) (EmptyCell!2235) )
))
(declare-datatypes ((array!9527 0))(
  ( (array!9528 (arr!4514 (Array (_ BitVec 32) ValueCell!2235)) (size!4839 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9527)

(declare-fun e!134709 () Bool)

(declare-fun array_inv!2981 (array!9527) Bool)

(assert (=> start!20642 (and (array_inv!2981 _values!649) e!134709)))

(assert (=> start!20642 true))

(assert (=> start!20642 tp_is_empty!5157))

(declare-fun array_inv!2982 (array!9525) Bool)

(assert (=> start!20642 (array_inv!2982 _keys!825)))

(assert (=> start!20642 tp!18934))

(declare-fun b!206066 () Bool)

(declare-fun res!99730 () Bool)

(assert (=> b!206066 (=> (not res!99730) (not e!134712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206066 (= res!99730 (validKeyInArray!0 k0!843))))

(declare-fun b!206067 () Bool)

(declare-fun res!99728 () Bool)

(assert (=> b!206067 (=> (not res!99728) (not e!134712))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206067 (= res!99728 (and (= (size!4839 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4838 _keys!825) (size!4839 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206068 () Bool)

(declare-fun e!134711 () Bool)

(declare-fun e!134714 () Bool)

(assert (=> b!206068 (= e!134711 e!134714)))

(declare-fun res!99727 () Bool)

(assert (=> b!206068 (=> res!99727 e!134714)))

(assert (=> b!206068 (= res!99727 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3982 0))(
  ( (tuple2!3983 (_1!2002 (_ BitVec 64)) (_2!2002 V!6523)) )
))
(declare-datatypes ((List!2874 0))(
  ( (Nil!2871) (Cons!2870 (h!3512 tuple2!3982) (t!7805 List!2874)) )
))
(declare-datatypes ((ListLongMap!2895 0))(
  ( (ListLongMap!2896 (toList!1463 List!2874)) )
))
(declare-fun lt!105203 () ListLongMap!2895)

(declare-fun lt!105207 () ListLongMap!2895)

(assert (=> b!206068 (= lt!105203 lt!105207)))

(declare-fun lt!105204 () ListLongMap!2895)

(declare-fun lt!105199 () tuple2!3982)

(declare-fun +!490 (ListLongMap!2895 tuple2!3982) ListLongMap!2895)

(assert (=> b!206068 (= lt!105207 (+!490 lt!105204 lt!105199))))

(declare-fun lt!105201 () ListLongMap!2895)

(declare-fun lt!105197 () ListLongMap!2895)

(assert (=> b!206068 (= lt!105201 lt!105197)))

(declare-fun lt!105202 () ListLongMap!2895)

(assert (=> b!206068 (= lt!105197 (+!490 lt!105202 lt!105199))))

(declare-fun lt!105206 () ListLongMap!2895)

(assert (=> b!206068 (= lt!105201 (+!490 lt!105206 lt!105199))))

(declare-fun minValue!615 () V!6523)

(assert (=> b!206068 (= lt!105199 (tuple2!3983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206069 () Bool)

(declare-fun e!134708 () Bool)

(assert (=> b!206069 (= e!134708 tp_is_empty!5157)))

(declare-fun b!206070 () Bool)

(assert (=> b!206070 (= e!134714 true)))

(declare-fun lt!105198 () tuple2!3982)

(assert (=> b!206070 (= lt!105197 (+!490 lt!105207 lt!105198))))

(declare-fun v!520 () V!6523)

(declare-datatypes ((Unit!6268 0))(
  ( (Unit!6269) )
))
(declare-fun lt!105205 () Unit!6268)

(declare-fun addCommutativeForDiffKeys!188 (ListLongMap!2895 (_ BitVec 64) V!6523 (_ BitVec 64) V!6523) Unit!6268)

(assert (=> b!206070 (= lt!105205 (addCommutativeForDiffKeys!188 lt!105204 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!206071 () Bool)

(assert (=> b!206071 (= e!134712 (not e!134711))))

(declare-fun res!99731 () Bool)

(assert (=> b!206071 (=> res!99731 e!134711)))

(assert (=> b!206071 (= res!99731 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6523)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1032 (array!9525 array!9527 (_ BitVec 32) (_ BitVec 32) V!6523 V!6523 (_ BitVec 32) Int) ListLongMap!2895)

(assert (=> b!206071 (= lt!105203 (getCurrentListMap!1032 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105200 () array!9527)

(assert (=> b!206071 (= lt!105201 (getCurrentListMap!1032 _keys!825 lt!105200 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206071 (and (= lt!105206 lt!105202) (= lt!105202 lt!105206))))

(assert (=> b!206071 (= lt!105202 (+!490 lt!105204 lt!105198))))

(assert (=> b!206071 (= lt!105198 (tuple2!3983 k0!843 v!520))))

(declare-fun lt!105196 () Unit!6268)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!145 (array!9525 array!9527 (_ BitVec 32) (_ BitVec 32) V!6523 V!6523 (_ BitVec 32) (_ BitVec 64) V!6523 (_ BitVec 32) Int) Unit!6268)

(assert (=> b!206071 (= lt!105196 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!145 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!406 (array!9525 array!9527 (_ BitVec 32) (_ BitVec 32) V!6523 V!6523 (_ BitVec 32) Int) ListLongMap!2895)

(assert (=> b!206071 (= lt!105206 (getCurrentListMapNoExtraKeys!406 _keys!825 lt!105200 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206071 (= lt!105200 (array!9528 (store (arr!4514 _values!649) i!601 (ValueCellFull!2235 v!520)) (size!4839 _values!649)))))

(assert (=> b!206071 (= lt!105204 (getCurrentListMapNoExtraKeys!406 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206072 () Bool)

(declare-fun res!99726 () Bool)

(assert (=> b!206072 (=> (not res!99726) (not e!134712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9525 (_ BitVec 32)) Bool)

(assert (=> b!206072 (= res!99726 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206073 () Bool)

(declare-fun res!99729 () Bool)

(assert (=> b!206073 (=> (not res!99729) (not e!134712))))

(assert (=> b!206073 (= res!99729 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4838 _keys!825))))))

(declare-fun b!206074 () Bool)

(assert (=> b!206074 (= e!134709 (and e!134708 mapRes!8804))))

(declare-fun condMapEmpty!8804 () Bool)

(declare-fun mapDefault!8804 () ValueCell!2235)

(assert (=> b!206074 (= condMapEmpty!8804 (= (arr!4514 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2235)) mapDefault!8804)))))

(declare-fun mapNonEmpty!8804 () Bool)

(declare-fun tp!18935 () Bool)

(assert (=> mapNonEmpty!8804 (= mapRes!8804 (and tp!18935 e!134710))))

(declare-fun mapKey!8804 () (_ BitVec 32))

(declare-fun mapValue!8804 () ValueCell!2235)

(declare-fun mapRest!8804 () (Array (_ BitVec 32) ValueCell!2235))

(assert (=> mapNonEmpty!8804 (= (arr!4514 _values!649) (store mapRest!8804 mapKey!8804 mapValue!8804))))

(declare-fun b!206075 () Bool)

(declare-fun res!99732 () Bool)

(assert (=> b!206075 (=> (not res!99732) (not e!134712))))

(declare-datatypes ((List!2875 0))(
  ( (Nil!2872) (Cons!2871 (h!3513 (_ BitVec 64)) (t!7806 List!2875)) )
))
(declare-fun arrayNoDuplicates!0 (array!9525 (_ BitVec 32) List!2875) Bool)

(assert (=> b!206075 (= res!99732 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2872))))

(assert (= (and start!20642 res!99725) b!206067))

(assert (= (and b!206067 res!99728) b!206072))

(assert (= (and b!206072 res!99726) b!206075))

(assert (= (and b!206075 res!99732) b!206073))

(assert (= (and b!206073 res!99729) b!206066))

(assert (= (and b!206066 res!99730) b!206064))

(assert (= (and b!206064 res!99733) b!206071))

(assert (= (and b!206071 (not res!99731)) b!206068))

(assert (= (and b!206068 (not res!99727)) b!206070))

(assert (= (and b!206074 condMapEmpty!8804) mapIsEmpty!8804))

(assert (= (and b!206074 (not condMapEmpty!8804)) mapNonEmpty!8804))

(get-info :version)

(assert (= (and mapNonEmpty!8804 ((_ is ValueCellFull!2235) mapValue!8804)) b!206065))

(assert (= (and b!206074 ((_ is ValueCellFull!2235) mapDefault!8804)) b!206069))

(assert (= start!20642 b!206074))

(declare-fun m!233759 () Bool)

(assert (=> b!206068 m!233759))

(declare-fun m!233761 () Bool)

(assert (=> b!206068 m!233761))

(declare-fun m!233763 () Bool)

(assert (=> b!206068 m!233763))

(declare-fun m!233765 () Bool)

(assert (=> b!206064 m!233765))

(declare-fun m!233767 () Bool)

(assert (=> b!206071 m!233767))

(declare-fun m!233769 () Bool)

(assert (=> b!206071 m!233769))

(declare-fun m!233771 () Bool)

(assert (=> b!206071 m!233771))

(declare-fun m!233773 () Bool)

(assert (=> b!206071 m!233773))

(declare-fun m!233775 () Bool)

(assert (=> b!206071 m!233775))

(declare-fun m!233777 () Bool)

(assert (=> b!206071 m!233777))

(declare-fun m!233779 () Bool)

(assert (=> b!206071 m!233779))

(declare-fun m!233781 () Bool)

(assert (=> start!20642 m!233781))

(declare-fun m!233783 () Bool)

(assert (=> start!20642 m!233783))

(declare-fun m!233785 () Bool)

(assert (=> start!20642 m!233785))

(declare-fun m!233787 () Bool)

(assert (=> b!206070 m!233787))

(declare-fun m!233789 () Bool)

(assert (=> b!206070 m!233789))

(declare-fun m!233791 () Bool)

(assert (=> mapNonEmpty!8804 m!233791))

(declare-fun m!233793 () Bool)

(assert (=> b!206072 m!233793))

(declare-fun m!233795 () Bool)

(assert (=> b!206066 m!233795))

(declare-fun m!233797 () Bool)

(assert (=> b!206075 m!233797))

(check-sat tp_is_empty!5157 (not b!206072) (not b!206066) (not b!206071) (not start!20642) (not b_next!5301) b_and!12047 (not b!206068) (not mapNonEmpty!8804) (not b!206075) (not b!206070))
(check-sat b_and!12047 (not b_next!5301))
