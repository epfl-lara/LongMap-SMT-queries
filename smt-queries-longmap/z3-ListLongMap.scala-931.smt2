; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20686 () Bool)

(assert start!20686)

(declare-fun b_free!5341 () Bool)

(declare-fun b_next!5341 () Bool)

(assert (=> start!20686 (= b_free!5341 (not b_next!5341))))

(declare-fun tp!19055 () Bool)

(declare-fun b_and!12061 () Bool)

(assert (=> start!20686 (= tp!19055 b_and!12061)))

(declare-fun b!206579 () Bool)

(declare-fun res!100117 () Bool)

(declare-fun e!134970 () Bool)

(assert (=> b!206579 (=> (not res!100117) (not e!134970))))

(declare-datatypes ((array!9591 0))(
  ( (array!9592 (arr!4545 (Array (_ BitVec 32) (_ BitVec 64))) (size!4871 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9591)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9591 (_ BitVec 32)) Bool)

(assert (=> b!206579 (= res!100117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206580 () Bool)

(declare-fun res!100112 () Bool)

(assert (=> b!206580 (=> (not res!100112) (not e!134970))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206580 (= res!100112 (validKeyInArray!0 k0!843))))

(declare-fun b!206581 () Bool)

(declare-fun e!134973 () Bool)

(declare-fun tp_is_empty!5197 () Bool)

(assert (=> b!206581 (= e!134973 tp_is_empty!5197)))

(declare-fun b!206582 () Bool)

(declare-fun e!134969 () Bool)

(assert (=> b!206582 (= e!134969 tp_is_empty!5197)))

(declare-fun b!206583 () Bool)

(declare-fun res!100115 () Bool)

(assert (=> b!206583 (=> (not res!100115) (not e!134970))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206583 (= res!100115 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4871 _keys!825))))))

(declare-fun mapIsEmpty!8864 () Bool)

(declare-fun mapRes!8864 () Bool)

(assert (=> mapIsEmpty!8864 mapRes!8864))

(declare-fun b!206584 () Bool)

(assert (=> b!206584 (= e!134970 (not true))))

(declare-datatypes ((V!6577 0))(
  ( (V!6578 (val!2643 Int)) )
))
(declare-datatypes ((tuple2!3994 0))(
  ( (tuple2!3995 (_1!2008 (_ BitVec 64)) (_2!2008 V!6577)) )
))
(declare-datatypes ((List!2895 0))(
  ( (Nil!2892) (Cons!2891 (h!3533 tuple2!3994) (t!7817 List!2895)) )
))
(declare-datatypes ((ListLongMap!2897 0))(
  ( (ListLongMap!2898 (toList!1464 List!2895)) )
))
(declare-fun lt!105592 () ListLongMap!2897)

(declare-datatypes ((ValueCell!2255 0))(
  ( (ValueCellFull!2255 (v!4607 V!6577)) (EmptyCell!2255) )
))
(declare-datatypes ((array!9593 0))(
  ( (array!9594 (arr!4546 (Array (_ BitVec 32) ValueCell!2255)) (size!4872 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9593)

(declare-fun zeroValue!615 () V!6577)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6577)

(declare-fun getCurrentListMap!1005 (array!9591 array!9593 (_ BitVec 32) (_ BitVec 32) V!6577 V!6577 (_ BitVec 32) Int) ListLongMap!2897)

(assert (=> b!206584 (= lt!105592 (getCurrentListMap!1005 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105594 () array!9593)

(declare-fun lt!105593 () ListLongMap!2897)

(assert (=> b!206584 (= lt!105593 (getCurrentListMap!1005 _keys!825 lt!105594 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105596 () ListLongMap!2897)

(declare-fun lt!105590 () ListLongMap!2897)

(assert (=> b!206584 (and (= lt!105596 lt!105590) (= lt!105590 lt!105596))))

(declare-fun lt!105595 () ListLongMap!2897)

(declare-fun v!520 () V!6577)

(declare-fun +!513 (ListLongMap!2897 tuple2!3994) ListLongMap!2897)

(assert (=> b!206584 (= lt!105590 (+!513 lt!105595 (tuple2!3995 k0!843 v!520)))))

(declare-datatypes ((Unit!6266 0))(
  ( (Unit!6267) )
))
(declare-fun lt!105591 () Unit!6266)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!164 (array!9591 array!9593 (_ BitVec 32) (_ BitVec 32) V!6577 V!6577 (_ BitVec 32) (_ BitVec 64) V!6577 (_ BitVec 32) Int) Unit!6266)

(assert (=> b!206584 (= lt!105591 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!164 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!415 (array!9591 array!9593 (_ BitVec 32) (_ BitVec 32) V!6577 V!6577 (_ BitVec 32) Int) ListLongMap!2897)

(assert (=> b!206584 (= lt!105596 (getCurrentListMapNoExtraKeys!415 _keys!825 lt!105594 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206584 (= lt!105594 (array!9594 (store (arr!4546 _values!649) i!601 (ValueCellFull!2255 v!520)) (size!4872 _values!649)))))

(assert (=> b!206584 (= lt!105595 (getCurrentListMapNoExtraKeys!415 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8864 () Bool)

(declare-fun tp!19054 () Bool)

(assert (=> mapNonEmpty!8864 (= mapRes!8864 (and tp!19054 e!134969))))

(declare-fun mapValue!8864 () ValueCell!2255)

(declare-fun mapRest!8864 () (Array (_ BitVec 32) ValueCell!2255))

(declare-fun mapKey!8864 () (_ BitVec 32))

(assert (=> mapNonEmpty!8864 (= (arr!4546 _values!649) (store mapRest!8864 mapKey!8864 mapValue!8864))))

(declare-fun b!206586 () Bool)

(declare-fun res!100113 () Bool)

(assert (=> b!206586 (=> (not res!100113) (not e!134970))))

(assert (=> b!206586 (= res!100113 (and (= (size!4872 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4871 _keys!825) (size!4872 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206587 () Bool)

(declare-fun res!100116 () Bool)

(assert (=> b!206587 (=> (not res!100116) (not e!134970))))

(assert (=> b!206587 (= res!100116 (= (select (arr!4545 _keys!825) i!601) k0!843))))

(declare-fun b!206588 () Bool)

(declare-fun e!134972 () Bool)

(assert (=> b!206588 (= e!134972 (and e!134973 mapRes!8864))))

(declare-fun condMapEmpty!8864 () Bool)

(declare-fun mapDefault!8864 () ValueCell!2255)

(assert (=> b!206588 (= condMapEmpty!8864 (= (arr!4546 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2255)) mapDefault!8864)))))

(declare-fun b!206585 () Bool)

(declare-fun res!100118 () Bool)

(assert (=> b!206585 (=> (not res!100118) (not e!134970))))

(declare-datatypes ((List!2896 0))(
  ( (Nil!2893) (Cons!2892 (h!3534 (_ BitVec 64)) (t!7818 List!2896)) )
))
(declare-fun arrayNoDuplicates!0 (array!9591 (_ BitVec 32) List!2896) Bool)

(assert (=> b!206585 (= res!100118 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2893))))

(declare-fun res!100114 () Bool)

(assert (=> start!20686 (=> (not res!100114) (not e!134970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20686 (= res!100114 (validMask!0 mask!1149))))

(assert (=> start!20686 e!134970))

(declare-fun array_inv!2985 (array!9593) Bool)

(assert (=> start!20686 (and (array_inv!2985 _values!649) e!134972)))

(assert (=> start!20686 true))

(assert (=> start!20686 tp_is_empty!5197))

(declare-fun array_inv!2986 (array!9591) Bool)

(assert (=> start!20686 (array_inv!2986 _keys!825)))

(assert (=> start!20686 tp!19055))

(assert (= (and start!20686 res!100114) b!206586))

(assert (= (and b!206586 res!100113) b!206579))

(assert (= (and b!206579 res!100117) b!206585))

(assert (= (and b!206585 res!100118) b!206583))

(assert (= (and b!206583 res!100115) b!206580))

(assert (= (and b!206580 res!100112) b!206587))

(assert (= (and b!206587 res!100116) b!206584))

(assert (= (and b!206588 condMapEmpty!8864) mapIsEmpty!8864))

(assert (= (and b!206588 (not condMapEmpty!8864)) mapNonEmpty!8864))

(get-info :version)

(assert (= (and mapNonEmpty!8864 ((_ is ValueCellFull!2255) mapValue!8864)) b!206582))

(assert (= (and b!206588 ((_ is ValueCellFull!2255) mapDefault!8864)) b!206581))

(assert (= start!20686 b!206588))

(declare-fun m!233853 () Bool)

(assert (=> b!206587 m!233853))

(declare-fun m!233855 () Bool)

(assert (=> b!206580 m!233855))

(declare-fun m!233857 () Bool)

(assert (=> b!206584 m!233857))

(declare-fun m!233859 () Bool)

(assert (=> b!206584 m!233859))

(declare-fun m!233861 () Bool)

(assert (=> b!206584 m!233861))

(declare-fun m!233863 () Bool)

(assert (=> b!206584 m!233863))

(declare-fun m!233865 () Bool)

(assert (=> b!206584 m!233865))

(declare-fun m!233867 () Bool)

(assert (=> b!206584 m!233867))

(declare-fun m!233869 () Bool)

(assert (=> b!206584 m!233869))

(declare-fun m!233871 () Bool)

(assert (=> b!206585 m!233871))

(declare-fun m!233873 () Bool)

(assert (=> b!206579 m!233873))

(declare-fun m!233875 () Bool)

(assert (=> start!20686 m!233875))

(declare-fun m!233877 () Bool)

(assert (=> start!20686 m!233877))

(declare-fun m!233879 () Bool)

(assert (=> start!20686 m!233879))

(declare-fun m!233881 () Bool)

(assert (=> mapNonEmpty!8864 m!233881))

(check-sat (not b_next!5341) tp_is_empty!5197 (not b!206580) (not b!206584) (not mapNonEmpty!8864) b_and!12061 (not b!206585) (not b!206579) (not start!20686))
(check-sat b_and!12061 (not b_next!5341))
