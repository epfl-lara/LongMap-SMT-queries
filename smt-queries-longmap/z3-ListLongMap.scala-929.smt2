; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20674 () Bool)

(assert start!20674)

(declare-fun b_free!5329 () Bool)

(declare-fun b_next!5329 () Bool)

(assert (=> start!20674 (= b_free!5329 (not b_next!5329))))

(declare-fun tp!19018 () Bool)

(declare-fun b_and!12089 () Bool)

(assert (=> start!20674 (= tp!19018 b_and!12089)))

(declare-fun b!206593 () Bool)

(declare-fun e!135006 () Bool)

(declare-fun tp_is_empty!5185 () Bool)

(assert (=> b!206593 (= e!135006 tp_is_empty!5185)))

(declare-fun mapIsEmpty!8846 () Bool)

(declare-fun mapRes!8846 () Bool)

(assert (=> mapIsEmpty!8846 mapRes!8846))

(declare-fun b!206594 () Bool)

(declare-fun e!135007 () Bool)

(assert (=> b!206594 (= e!135007 (not true))))

(declare-datatypes ((V!6561 0))(
  ( (V!6562 (val!2637 Int)) )
))
(declare-datatypes ((ValueCell!2249 0))(
  ( (ValueCellFull!2249 (v!4608 V!6561)) (EmptyCell!2249) )
))
(declare-datatypes ((array!9575 0))(
  ( (array!9576 (arr!4538 (Array (_ BitVec 32) ValueCell!2249)) (size!4863 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9575)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6561)

(declare-datatypes ((tuple2!3956 0))(
  ( (tuple2!3957 (_1!1989 (_ BitVec 64)) (_2!1989 V!6561)) )
))
(declare-datatypes ((List!2843 0))(
  ( (Nil!2840) (Cons!2839 (h!3481 tuple2!3956) (t!7766 List!2843)) )
))
(declare-datatypes ((ListLongMap!2871 0))(
  ( (ListLongMap!2872 (toList!1451 List!2843)) )
))
(declare-fun lt!105708 () ListLongMap!2871)

(declare-datatypes ((array!9577 0))(
  ( (array!9578 (arr!4539 (Array (_ BitVec 32) (_ BitVec 64))) (size!4864 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9577)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6561)

(declare-fun getCurrentListMap!1021 (array!9577 array!9575 (_ BitVec 32) (_ BitVec 32) V!6561 V!6561 (_ BitVec 32) Int) ListLongMap!2871)

(assert (=> b!206594 (= lt!105708 (getCurrentListMap!1021 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105706 () array!9575)

(declare-fun lt!105709 () ListLongMap!2871)

(assert (=> b!206594 (= lt!105709 (getCurrentListMap!1021 _keys!825 lt!105706 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105704 () ListLongMap!2871)

(declare-fun lt!105707 () ListLongMap!2871)

(assert (=> b!206594 (and (= lt!105704 lt!105707) (= lt!105707 lt!105704))))

(declare-fun lt!105705 () ListLongMap!2871)

(declare-fun v!520 () V!6561)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!505 (ListLongMap!2871 tuple2!3956) ListLongMap!2871)

(assert (=> b!206594 (= lt!105707 (+!505 lt!105705 (tuple2!3957 k0!843 v!520)))))

(declare-datatypes ((Unit!6286 0))(
  ( (Unit!6287) )
))
(declare-fun lt!105710 () Unit!6286)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!157 (array!9577 array!9575 (_ BitVec 32) (_ BitVec 32) V!6561 V!6561 (_ BitVec 32) (_ BitVec 64) V!6561 (_ BitVec 32) Int) Unit!6286)

(assert (=> b!206594 (= lt!105710 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!157 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!414 (array!9577 array!9575 (_ BitVec 32) (_ BitVec 32) V!6561 V!6561 (_ BitVec 32) Int) ListLongMap!2871)

(assert (=> b!206594 (= lt!105704 (getCurrentListMapNoExtraKeys!414 _keys!825 lt!105706 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!206594 (= lt!105706 (array!9576 (store (arr!4538 _values!649) i!601 (ValueCellFull!2249 v!520)) (size!4863 _values!649)))))

(assert (=> b!206594 (= lt!105705 (getCurrentListMapNoExtraKeys!414 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!206595 () Bool)

(declare-fun res!100107 () Bool)

(assert (=> b!206595 (=> (not res!100107) (not e!135007))))

(declare-datatypes ((List!2844 0))(
  ( (Nil!2841) (Cons!2840 (h!3482 (_ BitVec 64)) (t!7767 List!2844)) )
))
(declare-fun arrayNoDuplicates!0 (array!9577 (_ BitVec 32) List!2844) Bool)

(assert (=> b!206595 (= res!100107 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2841))))

(declare-fun b!206596 () Bool)

(declare-fun e!135004 () Bool)

(assert (=> b!206596 (= e!135004 tp_is_empty!5185)))

(declare-fun b!206597 () Bool)

(declare-fun res!100105 () Bool)

(assert (=> b!206597 (=> (not res!100105) (not e!135007))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9577 (_ BitVec 32)) Bool)

(assert (=> b!206597 (= res!100105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!100106 () Bool)

(assert (=> start!20674 (=> (not res!100106) (not e!135007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20674 (= res!100106 (validMask!0 mask!1149))))

(assert (=> start!20674 e!135007))

(declare-fun e!135005 () Bool)

(declare-fun array_inv!2973 (array!9575) Bool)

(assert (=> start!20674 (and (array_inv!2973 _values!649) e!135005)))

(assert (=> start!20674 true))

(assert (=> start!20674 tp_is_empty!5185))

(declare-fun array_inv!2974 (array!9577) Bool)

(assert (=> start!20674 (array_inv!2974 _keys!825)))

(assert (=> start!20674 tp!19018))

(declare-fun mapNonEmpty!8846 () Bool)

(declare-fun tp!19019 () Bool)

(assert (=> mapNonEmpty!8846 (= mapRes!8846 (and tp!19019 e!135004))))

(declare-fun mapRest!8846 () (Array (_ BitVec 32) ValueCell!2249))

(declare-fun mapValue!8846 () ValueCell!2249)

(declare-fun mapKey!8846 () (_ BitVec 32))

(assert (=> mapNonEmpty!8846 (= (arr!4538 _values!649) (store mapRest!8846 mapKey!8846 mapValue!8846))))

(declare-fun b!206598 () Bool)

(declare-fun res!100103 () Bool)

(assert (=> b!206598 (=> (not res!100103) (not e!135007))))

(assert (=> b!206598 (= res!100103 (= (select (arr!4539 _keys!825) i!601) k0!843))))

(declare-fun b!206599 () Bool)

(declare-fun res!100104 () Bool)

(assert (=> b!206599 (=> (not res!100104) (not e!135007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!206599 (= res!100104 (validKeyInArray!0 k0!843))))

(declare-fun b!206600 () Bool)

(assert (=> b!206600 (= e!135005 (and e!135006 mapRes!8846))))

(declare-fun condMapEmpty!8846 () Bool)

(declare-fun mapDefault!8846 () ValueCell!2249)

(assert (=> b!206600 (= condMapEmpty!8846 (= (arr!4538 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2249)) mapDefault!8846)))))

(declare-fun b!206601 () Bool)

(declare-fun res!100108 () Bool)

(assert (=> b!206601 (=> (not res!100108) (not e!135007))))

(assert (=> b!206601 (= res!100108 (and (= (size!4863 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4864 _keys!825) (size!4863 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!206602 () Bool)

(declare-fun res!100102 () Bool)

(assert (=> b!206602 (=> (not res!100102) (not e!135007))))

(assert (=> b!206602 (= res!100102 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4864 _keys!825))))))

(assert (= (and start!20674 res!100106) b!206601))

(assert (= (and b!206601 res!100108) b!206597))

(assert (= (and b!206597 res!100105) b!206595))

(assert (= (and b!206595 res!100107) b!206602))

(assert (= (and b!206602 res!100102) b!206599))

(assert (= (and b!206599 res!100104) b!206598))

(assert (= (and b!206598 res!100103) b!206594))

(assert (= (and b!206600 condMapEmpty!8846) mapIsEmpty!8846))

(assert (= (and b!206600 (not condMapEmpty!8846)) mapNonEmpty!8846))

(get-info :version)

(assert (= (and mapNonEmpty!8846 ((_ is ValueCellFull!2249) mapValue!8846)) b!206596))

(assert (= (and b!206600 ((_ is ValueCellFull!2249) mapDefault!8846)) b!206593))

(assert (= start!20674 b!206600))

(declare-fun m!234471 () Bool)

(assert (=> b!206599 m!234471))

(declare-fun m!234473 () Bool)

(assert (=> b!206594 m!234473))

(declare-fun m!234475 () Bool)

(assert (=> b!206594 m!234475))

(declare-fun m!234477 () Bool)

(assert (=> b!206594 m!234477))

(declare-fun m!234479 () Bool)

(assert (=> b!206594 m!234479))

(declare-fun m!234481 () Bool)

(assert (=> b!206594 m!234481))

(declare-fun m!234483 () Bool)

(assert (=> b!206594 m!234483))

(declare-fun m!234485 () Bool)

(assert (=> b!206594 m!234485))

(declare-fun m!234487 () Bool)

(assert (=> b!206598 m!234487))

(declare-fun m!234489 () Bool)

(assert (=> b!206595 m!234489))

(declare-fun m!234491 () Bool)

(assert (=> b!206597 m!234491))

(declare-fun m!234493 () Bool)

(assert (=> start!20674 m!234493))

(declare-fun m!234495 () Bool)

(assert (=> start!20674 m!234495))

(declare-fun m!234497 () Bool)

(assert (=> start!20674 m!234497))

(declare-fun m!234499 () Bool)

(assert (=> mapNonEmpty!8846 m!234499))

(check-sat b_and!12089 (not b!206597) (not start!20674) (not mapNonEmpty!8846) (not b!206599) (not b!206595) (not b_next!5329) (not b!206594) tp_is_empty!5185)
(check-sat b_and!12089 (not b_next!5329))
