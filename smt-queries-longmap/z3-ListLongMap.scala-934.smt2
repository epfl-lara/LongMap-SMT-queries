; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20704 () Bool)

(assert start!20704)

(declare-fun b_free!5359 () Bool)

(declare-fun b_next!5359 () Bool)

(assert (=> start!20704 (= b_free!5359 (not b_next!5359))))

(declare-fun tp!19108 () Bool)

(declare-fun b_and!12079 () Bool)

(assert (=> start!20704 (= tp!19108 b_and!12079)))

(declare-fun b!206849 () Bool)

(declare-fun e!135108 () Bool)

(declare-fun tp_is_empty!5215 () Bool)

(assert (=> b!206849 (= e!135108 tp_is_empty!5215)))

(declare-fun res!100305 () Bool)

(declare-fun e!135106 () Bool)

(assert (=> start!20704 (=> (not res!100305) (not e!135106))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20704 (= res!100305 (validMask!0 mask!1149))))

(assert (=> start!20704 e!135106))

(declare-datatypes ((V!6601 0))(
  ( (V!6602 (val!2652 Int)) )
))
(declare-datatypes ((ValueCell!2264 0))(
  ( (ValueCellFull!2264 (v!4616 V!6601)) (EmptyCell!2264) )
))
(declare-datatypes ((array!9625 0))(
  ( (array!9626 (arr!4562 (Array (_ BitVec 32) ValueCell!2264)) (size!4888 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9625)

(declare-fun e!135107 () Bool)

(declare-fun array_inv!2993 (array!9625) Bool)

(assert (=> start!20704 (and (array_inv!2993 _values!649) e!135107)))

(assert (=> start!20704 true))

(assert (=> start!20704 tp_is_empty!5215))

(declare-datatypes ((array!9627 0))(
  ( (array!9628 (arr!4563 (Array (_ BitVec 32) (_ BitVec 64))) (size!4889 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9627)

(declare-fun array_inv!2994 (array!9627) Bool)

(assert (=> start!20704 (array_inv!2994 _keys!825)))

(assert (=> start!20704 tp!19108))

(declare-fun b!206850 () Bool)

(declare-fun e!135105 () Bool)

(assert (=> b!206850 (= e!135105 tp_is_empty!5215)))

(declare-fun b!206851 () Bool)

(declare-fun res!100303 () Bool)

(assert (=> b!206851 (=> (not res!100303) (not e!135106))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!206851 (= res!100303 (= (select (arr!4563 _keys!825) i!601) k0!843))))

(declare-fun b!206852 () Bool)

(declare-fun res!100306 () Bool)

(assert (=> b!206852 (=> (not res!100306) (not e!135106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9627 (_ BitVec 32)) Bool)

(assert (=> b!206852 (= res!100306 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!206853 () Bool)

(declare-fun res!100304 () Bool)

(assert (=> b!206853 (=> (not res!100304) (not e!135106))))

(declare-datatypes ((List!2907 0))(
  ( (Nil!2904) (Cons!2903 (h!3545 (_ BitVec 64)) (t!7829 List!2907)) )
))
(declare-fun arrayNoDuplicates!0 (array!9627 (_ BitVec 32) List!2907) Bool)

(assert (=> b!206853 (= res!100304 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2904))))

(declare-fun mapNonEmpty!8891 () Bool)

(declare-fun mapRes!8891 () Bool)

(declare-fun tp!19109 () Bool)

(assert (=> mapNonEmpty!8891 (= mapRes!8891 (and tp!19109 e!135105))))

(declare-fun mapRest!8891 () (Array (_ BitVec 32) ValueCell!2264))

(declare-fun mapKey!8891 () (_ BitVec 32))

(declare-fun mapValue!8891 () ValueCell!2264)

(assert (=> mapNonEmpty!8891 (= (arr!4562 _values!649) (store mapRest!8891 mapKey!8891 mapValue!8891))))

(declare-fun b!206854 () Bool)

(declare-fun res!100301 () Bool)

(assert (=> b!206854 (=> (not res!100301) (not e!135106))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!206854 (= res!100301 (and (= (size!4888 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4889 _keys!825) (size!4888 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206855 () Bool)

(assert (=> b!206855 (= e!135107 (and e!135108 mapRes!8891))))

(declare-fun condMapEmpty!8891 () Bool)

(declare-fun mapDefault!8891 () ValueCell!2264)

(assert (=> b!206855 (= condMapEmpty!8891 (= (arr!4562 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2264)) mapDefault!8891)))))

(declare-fun b!206856 () Bool)

(assert (=> b!206856 (= e!135106 (not true))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6601)

(declare-fun zeroValue!615 () V!6601)

(declare-datatypes ((tuple2!4006 0))(
  ( (tuple2!4007 (_1!2014 (_ BitVec 64)) (_2!2014 V!6601)) )
))
(declare-datatypes ((List!2908 0))(
  ( (Nil!2905) (Cons!2904 (h!3546 tuple2!4006) (t!7830 List!2908)) )
))
(declare-datatypes ((ListLongMap!2909 0))(
  ( (ListLongMap!2910 (toList!1470 List!2908)) )
))
(declare-fun lt!105780 () ListLongMap!2909)

(declare-fun getCurrentListMap!1011 (array!9627 array!9625 (_ BitVec 32) (_ BitVec 32) V!6601 V!6601 (_ BitVec 32) Int) ListLongMap!2909)

(assert (=> b!206856 (= lt!105780 (getCurrentListMap!1011 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105785 () ListLongMap!2909)

(declare-fun lt!105781 () array!9625)

(assert (=> b!206856 (= lt!105785 (getCurrentListMap!1011 _keys!825 lt!105781 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105784 () ListLongMap!2909)

(declare-fun lt!105782 () ListLongMap!2909)

(assert (=> b!206856 (and (= lt!105784 lt!105782) (= lt!105782 lt!105784))))

(declare-fun lt!105783 () ListLongMap!2909)

(declare-fun v!520 () V!6601)

(declare-fun +!519 (ListLongMap!2909 tuple2!4006) ListLongMap!2909)

(assert (=> b!206856 (= lt!105782 (+!519 lt!105783 (tuple2!4007 k0!843 v!520)))))

(declare-datatypes ((Unit!6278 0))(
  ( (Unit!6279) )
))
(declare-fun lt!105779 () Unit!6278)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!170 (array!9627 array!9625 (_ BitVec 32) (_ BitVec 32) V!6601 V!6601 (_ BitVec 32) (_ BitVec 64) V!6601 (_ BitVec 32) Int) Unit!6278)

(assert (=> b!206856 (= lt!105779 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!170 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!421 (array!9627 array!9625 (_ BitVec 32) (_ BitVec 32) V!6601 V!6601 (_ BitVec 32) Int) ListLongMap!2909)

(assert (=> b!206856 (= lt!105784 (getCurrentListMapNoExtraKeys!421 _keys!825 lt!105781 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206856 (= lt!105781 (array!9626 (store (arr!4562 _values!649) i!601 (ValueCellFull!2264 v!520)) (size!4888 _values!649)))))

(assert (=> b!206856 (= lt!105783 (getCurrentListMapNoExtraKeys!421 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8891 () Bool)

(assert (=> mapIsEmpty!8891 mapRes!8891))

(declare-fun b!206857 () Bool)

(declare-fun res!100302 () Bool)

(assert (=> b!206857 (=> (not res!100302) (not e!135106))))

(assert (=> b!206857 (= res!100302 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4889 _keys!825))))))

(declare-fun b!206858 () Bool)

(declare-fun res!100307 () Bool)

(assert (=> b!206858 (=> (not res!100307) (not e!135106))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206858 (= res!100307 (validKeyInArray!0 k0!843))))

(assert (= (and start!20704 res!100305) b!206854))

(assert (= (and b!206854 res!100301) b!206852))

(assert (= (and b!206852 res!100306) b!206853))

(assert (= (and b!206853 res!100304) b!206857))

(assert (= (and b!206857 res!100302) b!206858))

(assert (= (and b!206858 res!100307) b!206851))

(assert (= (and b!206851 res!100303) b!206856))

(assert (= (and b!206855 condMapEmpty!8891) mapIsEmpty!8891))

(assert (= (and b!206855 (not condMapEmpty!8891)) mapNonEmpty!8891))

(get-info :version)

(assert (= (and mapNonEmpty!8891 ((_ is ValueCellFull!2264) mapValue!8891)) b!206850))

(assert (= (and b!206855 ((_ is ValueCellFull!2264) mapDefault!8891)) b!206849))

(assert (= start!20704 b!206855))

(declare-fun m!234123 () Bool)

(assert (=> b!206851 m!234123))

(declare-fun m!234125 () Bool)

(assert (=> b!206853 m!234125))

(declare-fun m!234127 () Bool)

(assert (=> start!20704 m!234127))

(declare-fun m!234129 () Bool)

(assert (=> start!20704 m!234129))

(declare-fun m!234131 () Bool)

(assert (=> start!20704 m!234131))

(declare-fun m!234133 () Bool)

(assert (=> b!206856 m!234133))

(declare-fun m!234135 () Bool)

(assert (=> b!206856 m!234135))

(declare-fun m!234137 () Bool)

(assert (=> b!206856 m!234137))

(declare-fun m!234139 () Bool)

(assert (=> b!206856 m!234139))

(declare-fun m!234141 () Bool)

(assert (=> b!206856 m!234141))

(declare-fun m!234143 () Bool)

(assert (=> b!206856 m!234143))

(declare-fun m!234145 () Bool)

(assert (=> b!206856 m!234145))

(declare-fun m!234147 () Bool)

(assert (=> b!206858 m!234147))

(declare-fun m!234149 () Bool)

(assert (=> b!206852 m!234149))

(declare-fun m!234151 () Bool)

(assert (=> mapNonEmpty!8891 m!234151))

(check-sat (not b!206853) (not b!206856) b_and!12079 (not mapNonEmpty!8891) (not b_next!5359) (not start!20704) (not b!206852) tp_is_empty!5215 (not b!206858))
(check-sat b_and!12079 (not b_next!5359))
