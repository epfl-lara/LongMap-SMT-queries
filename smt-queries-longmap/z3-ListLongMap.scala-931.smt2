; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20686 () Bool)

(assert start!20686)

(declare-fun b_free!5341 () Bool)

(declare-fun b_next!5341 () Bool)

(assert (=> start!20686 (= b_free!5341 (not b_next!5341))))

(declare-fun tp!19055 () Bool)

(declare-fun b_and!12101 () Bool)

(assert (=> start!20686 (= tp!19055 b_and!12101)))

(declare-fun b!206773 () Bool)

(declare-fun e!135097 () Bool)

(declare-fun tp_is_empty!5197 () Bool)

(assert (=> b!206773 (= e!135097 tp_is_empty!5197)))

(declare-fun b!206774 () Bool)

(declare-fun res!100230 () Bool)

(declare-fun e!135094 () Bool)

(assert (=> b!206774 (=> (not res!100230) (not e!135094))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9599 0))(
  ( (array!9600 (arr!4550 (Array (_ BitVec 32) (_ BitVec 64))) (size!4875 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9599)

(assert (=> b!206774 (= res!100230 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4875 _keys!825))))))

(declare-fun res!100229 () Bool)

(assert (=> start!20686 (=> (not res!100229) (not e!135094))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20686 (= res!100229 (validMask!0 mask!1149))))

(assert (=> start!20686 e!135094))

(declare-datatypes ((V!6577 0))(
  ( (V!6578 (val!2643 Int)) )
))
(declare-datatypes ((ValueCell!2255 0))(
  ( (ValueCellFull!2255 (v!4614 V!6577)) (EmptyCell!2255) )
))
(declare-datatypes ((array!9601 0))(
  ( (array!9602 (arr!4551 (Array (_ BitVec 32) ValueCell!2255)) (size!4876 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9601)

(declare-fun e!135096 () Bool)

(declare-fun array_inv!2981 (array!9601) Bool)

(assert (=> start!20686 (and (array_inv!2981 _values!649) e!135096)))

(assert (=> start!20686 true))

(assert (=> start!20686 tp_is_empty!5197))

(declare-fun array_inv!2982 (array!9599) Bool)

(assert (=> start!20686 (array_inv!2982 _keys!825)))

(assert (=> start!20686 tp!19055))

(declare-fun b!206775 () Bool)

(declare-fun res!100233 () Bool)

(assert (=> b!206775 (=> (not res!100233) (not e!135094))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206775 (= res!100233 (and (= (size!4876 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4875 _keys!825) (size!4876 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8864 () Bool)

(declare-fun mapRes!8864 () Bool)

(assert (=> mapIsEmpty!8864 mapRes!8864))

(declare-fun b!206776 () Bool)

(declare-fun res!100234 () Bool)

(assert (=> b!206776 (=> (not res!100234) (not e!135094))))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!206776 (= res!100234 (= (select (arr!4550 _keys!825) i!601) k0!843))))

(declare-fun b!206777 () Bool)

(assert (=> b!206777 (= e!135094 (not true))))

(declare-datatypes ((tuple2!3964 0))(
  ( (tuple2!3965 (_1!1993 (_ BitVec 64)) (_2!1993 V!6577)) )
))
(declare-datatypes ((List!2851 0))(
  ( (Nil!2848) (Cons!2847 (h!3489 tuple2!3964) (t!7774 List!2851)) )
))
(declare-datatypes ((ListLongMap!2879 0))(
  ( (ListLongMap!2880 (toList!1455 List!2851)) )
))
(declare-fun lt!105830 () ListLongMap!2879)

(declare-fun zeroValue!615 () V!6577)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6577)

(declare-fun getCurrentListMap!1025 (array!9599 array!9601 (_ BitVec 32) (_ BitVec 32) V!6577 V!6577 (_ BitVec 32) Int) ListLongMap!2879)

(assert (=> b!206777 (= lt!105830 (getCurrentListMap!1025 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105834 () array!9601)

(declare-fun lt!105835 () ListLongMap!2879)

(assert (=> b!206777 (= lt!105835 (getCurrentListMap!1025 _keys!825 lt!105834 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105831 () ListLongMap!2879)

(declare-fun lt!105833 () ListLongMap!2879)

(assert (=> b!206777 (and (= lt!105831 lt!105833) (= lt!105833 lt!105831))))

(declare-fun v!520 () V!6577)

(declare-fun lt!105832 () ListLongMap!2879)

(declare-fun +!509 (ListLongMap!2879 tuple2!3964) ListLongMap!2879)

(assert (=> b!206777 (= lt!105833 (+!509 lt!105832 (tuple2!3965 k0!843 v!520)))))

(declare-datatypes ((Unit!6294 0))(
  ( (Unit!6295) )
))
(declare-fun lt!105836 () Unit!6294)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!161 (array!9599 array!9601 (_ BitVec 32) (_ BitVec 32) V!6577 V!6577 (_ BitVec 32) (_ BitVec 64) V!6577 (_ BitVec 32) Int) Unit!6294)

(assert (=> b!206777 (= lt!105836 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!161 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!418 (array!9599 array!9601 (_ BitVec 32) (_ BitVec 32) V!6577 V!6577 (_ BitVec 32) Int) ListLongMap!2879)

(assert (=> b!206777 (= lt!105831 (getCurrentListMapNoExtraKeys!418 _keys!825 lt!105834 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206777 (= lt!105834 (array!9602 (store (arr!4551 _values!649) i!601 (ValueCellFull!2255 v!520)) (size!4876 _values!649)))))

(assert (=> b!206777 (= lt!105832 (getCurrentListMapNoExtraKeys!418 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206778 () Bool)

(declare-fun res!100232 () Bool)

(assert (=> b!206778 (=> (not res!100232) (not e!135094))))

(declare-datatypes ((List!2852 0))(
  ( (Nil!2849) (Cons!2848 (h!3490 (_ BitVec 64)) (t!7775 List!2852)) )
))
(declare-fun arrayNoDuplicates!0 (array!9599 (_ BitVec 32) List!2852) Bool)

(assert (=> b!206778 (= res!100232 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2849))))

(declare-fun mapNonEmpty!8864 () Bool)

(declare-fun tp!19054 () Bool)

(assert (=> mapNonEmpty!8864 (= mapRes!8864 (and tp!19054 e!135097))))

(declare-fun mapRest!8864 () (Array (_ BitVec 32) ValueCell!2255))

(declare-fun mapValue!8864 () ValueCell!2255)

(declare-fun mapKey!8864 () (_ BitVec 32))

(assert (=> mapNonEmpty!8864 (= (arr!4551 _values!649) (store mapRest!8864 mapKey!8864 mapValue!8864))))

(declare-fun b!206779 () Bool)

(declare-fun res!100231 () Bool)

(assert (=> b!206779 (=> (not res!100231) (not e!135094))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206779 (= res!100231 (validKeyInArray!0 k0!843))))

(declare-fun b!206780 () Bool)

(declare-fun e!135095 () Bool)

(assert (=> b!206780 (= e!135096 (and e!135095 mapRes!8864))))

(declare-fun condMapEmpty!8864 () Bool)

(declare-fun mapDefault!8864 () ValueCell!2255)

(assert (=> b!206780 (= condMapEmpty!8864 (= (arr!4551 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2255)) mapDefault!8864)))))

(declare-fun b!206781 () Bool)

(assert (=> b!206781 (= e!135095 tp_is_empty!5197)))

(declare-fun b!206782 () Bool)

(declare-fun res!100228 () Bool)

(assert (=> b!206782 (=> (not res!100228) (not e!135094))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9599 (_ BitVec 32)) Bool)

(assert (=> b!206782 (= res!100228 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20686 res!100229) b!206775))

(assert (= (and b!206775 res!100233) b!206782))

(assert (= (and b!206782 res!100228) b!206778))

(assert (= (and b!206778 res!100232) b!206774))

(assert (= (and b!206774 res!100230) b!206779))

(assert (= (and b!206779 res!100231) b!206776))

(assert (= (and b!206776 res!100234) b!206777))

(assert (= (and b!206780 condMapEmpty!8864) mapIsEmpty!8864))

(assert (= (and b!206780 (not condMapEmpty!8864)) mapNonEmpty!8864))

(get-info :version)

(assert (= (and mapNonEmpty!8864 ((_ is ValueCellFull!2255) mapValue!8864)) b!206773))

(assert (= (and b!206780 ((_ is ValueCellFull!2255) mapDefault!8864)) b!206781))

(assert (= start!20686 b!206780))

(declare-fun m!234651 () Bool)

(assert (=> b!206782 m!234651))

(declare-fun m!234653 () Bool)

(assert (=> b!206778 m!234653))

(declare-fun m!234655 () Bool)

(assert (=> mapNonEmpty!8864 m!234655))

(declare-fun m!234657 () Bool)

(assert (=> start!20686 m!234657))

(declare-fun m!234659 () Bool)

(assert (=> start!20686 m!234659))

(declare-fun m!234661 () Bool)

(assert (=> start!20686 m!234661))

(declare-fun m!234663 () Bool)

(assert (=> b!206776 m!234663))

(declare-fun m!234665 () Bool)

(assert (=> b!206779 m!234665))

(declare-fun m!234667 () Bool)

(assert (=> b!206777 m!234667))

(declare-fun m!234669 () Bool)

(assert (=> b!206777 m!234669))

(declare-fun m!234671 () Bool)

(assert (=> b!206777 m!234671))

(declare-fun m!234673 () Bool)

(assert (=> b!206777 m!234673))

(declare-fun m!234675 () Bool)

(assert (=> b!206777 m!234675))

(declare-fun m!234677 () Bool)

(assert (=> b!206777 m!234677))

(declare-fun m!234679 () Bool)

(assert (=> b!206777 m!234679))

(check-sat b_and!12101 (not b_next!5341) (not b!206777) tp_is_empty!5197 (not b!206779) (not mapNonEmpty!8864) (not b!206782) (not b!206778) (not start!20686))
(check-sat b_and!12101 (not b_next!5341))
