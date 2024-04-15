; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37194 () Bool)

(assert start!37194)

(declare-fun b_free!8335 () Bool)

(declare-fun b_next!8335 () Bool)

(assert (=> start!37194 (= b_free!8335 (not b_next!8335))))

(declare-fun tp!29720 () Bool)

(declare-fun b_and!15551 () Bool)

(assert (=> start!37194 (= tp!29720 b_and!15551)))

(declare-fun b!375710 () Bool)

(declare-fun res!212257 () Bool)

(declare-fun e!228843 () Bool)

(assert (=> b!375710 (=> (not res!212257) (not e!228843))))

(declare-datatypes ((array!21881 0))(
  ( (array!21882 (arr!10409 (Array (_ BitVec 32) (_ BitVec 64))) (size!10762 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21881)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21881 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375710 (= res!212257 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15039 () Bool)

(declare-fun mapRes!15039 () Bool)

(declare-fun tp!29721 () Bool)

(declare-fun e!228848 () Bool)

(assert (=> mapNonEmpty!15039 (= mapRes!15039 (and tp!29721 e!228848))))

(declare-datatypes ((V!13083 0))(
  ( (V!13084 (val!4536 Int)) )
))
(declare-datatypes ((ValueCell!4148 0))(
  ( (ValueCellFull!4148 (v!6727 V!13083)) (EmptyCell!4148) )
))
(declare-datatypes ((array!21883 0))(
  ( (array!21884 (arr!10410 (Array (_ BitVec 32) ValueCell!4148)) (size!10763 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21883)

(declare-fun mapRest!15039 () (Array (_ BitVec 32) ValueCell!4148))

(declare-fun mapValue!15039 () ValueCell!4148)

(declare-fun mapKey!15039 () (_ BitVec 32))

(assert (=> mapNonEmpty!15039 (= (arr!10410 _values!506) (store mapRest!15039 mapKey!15039 mapValue!15039))))

(declare-fun b!375711 () Bool)

(declare-fun e!228842 () Bool)

(declare-fun e!228845 () Bool)

(assert (=> b!375711 (= e!228842 e!228845)))

(declare-fun res!212250 () Bool)

(assert (=> b!375711 (=> res!212250 e!228845)))

(assert (=> b!375711 (= res!212250 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6018 0))(
  ( (tuple2!6019 (_1!3020 (_ BitVec 64)) (_2!3020 V!13083)) )
))
(declare-datatypes ((List!5847 0))(
  ( (Nil!5844) (Cons!5843 (h!6699 tuple2!6018) (t!10988 List!5847)) )
))
(declare-datatypes ((ListLongMap!4921 0))(
  ( (ListLongMap!4922 (toList!2476 List!5847)) )
))
(declare-fun lt!174007 () ListLongMap!4921)

(declare-fun lt!174005 () ListLongMap!4921)

(assert (=> b!375711 (= lt!174007 lt!174005)))

(declare-fun lt!174000 () ListLongMap!4921)

(declare-fun lt!173997 () tuple2!6018)

(declare-fun +!844 (ListLongMap!4921 tuple2!6018) ListLongMap!4921)

(assert (=> b!375711 (= lt!174005 (+!844 lt!174000 lt!173997))))

(declare-fun lt!174004 () ListLongMap!4921)

(declare-fun lt!174009 () ListLongMap!4921)

(assert (=> b!375711 (= lt!174004 lt!174009)))

(declare-fun lt!174006 () ListLongMap!4921)

(assert (=> b!375711 (= lt!174009 (+!844 lt!174006 lt!173997))))

(declare-fun lt!174008 () ListLongMap!4921)

(assert (=> b!375711 (= lt!174007 (+!844 lt!174008 lt!173997))))

(declare-fun zeroValue!472 () V!13083)

(assert (=> b!375711 (= lt!173997 (tuple2!6019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375713 () Bool)

(declare-fun res!212255 () Bool)

(assert (=> b!375713 (=> (not res!212255) (not e!228843))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!375713 (= res!212255 (and (= (size!10763 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10762 _keys!658) (size!10763 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!375714 () Bool)

(declare-fun res!212259 () Bool)

(assert (=> b!375714 (=> (not res!212259) (not e!228843))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!375714 (= res!212259 (or (= (select (arr!10409 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10409 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375715 () Bool)

(declare-fun res!212260 () Bool)

(assert (=> b!375715 (=> (not res!212260) (not e!228843))))

(assert (=> b!375715 (= res!212260 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10762 _keys!658))))))

(declare-fun b!375716 () Bool)

(declare-fun tp_is_empty!8983 () Bool)

(assert (=> b!375716 (= e!228848 tp_is_empty!8983)))

(declare-fun mapIsEmpty!15039 () Bool)

(assert (=> mapIsEmpty!15039 mapRes!15039))

(declare-fun b!375717 () Bool)

(declare-fun e!228841 () Bool)

(assert (=> b!375717 (= e!228841 (not e!228842))))

(declare-fun res!212256 () Bool)

(assert (=> b!375717 (=> res!212256 e!228842)))

(assert (=> b!375717 (= res!212256 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13083)

(declare-fun getCurrentListMap!1890 (array!21881 array!21883 (_ BitVec 32) (_ BitVec 32) V!13083 V!13083 (_ BitVec 32) Int) ListLongMap!4921)

(assert (=> b!375717 (= lt!174004 (getCurrentListMap!1890 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!174002 () array!21883)

(declare-fun lt!173999 () array!21881)

(assert (=> b!375717 (= lt!174007 (getCurrentListMap!1890 lt!173999 lt!174002 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375717 (and (= lt!174008 lt!174000) (= lt!174000 lt!174008))))

(declare-fun lt!174003 () tuple2!6018)

(assert (=> b!375717 (= lt!174000 (+!844 lt!174006 lt!174003))))

(declare-fun v!373 () V!13083)

(assert (=> b!375717 (= lt!174003 (tuple2!6019 k0!778 v!373))))

(declare-datatypes ((Unit!11560 0))(
  ( (Unit!11561) )
))
(declare-fun lt!173998 () Unit!11560)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!83 (array!21881 array!21883 (_ BitVec 32) (_ BitVec 32) V!13083 V!13083 (_ BitVec 32) (_ BitVec 64) V!13083 (_ BitVec 32) Int) Unit!11560)

(assert (=> b!375717 (= lt!173998 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!83 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!755 (array!21881 array!21883 (_ BitVec 32) (_ BitVec 32) V!13083 V!13083 (_ BitVec 32) Int) ListLongMap!4921)

(assert (=> b!375717 (= lt!174008 (getCurrentListMapNoExtraKeys!755 lt!173999 lt!174002 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375717 (= lt!174002 (array!21884 (store (arr!10410 _values!506) i!548 (ValueCellFull!4148 v!373)) (size!10763 _values!506)))))

(assert (=> b!375717 (= lt!174006 (getCurrentListMapNoExtraKeys!755 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375718 () Bool)

(declare-fun res!212258 () Bool)

(assert (=> b!375718 (=> (not res!212258) (not e!228843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21881 (_ BitVec 32)) Bool)

(assert (=> b!375718 (= res!212258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375719 () Bool)

(declare-fun e!228844 () Bool)

(declare-fun e!228846 () Bool)

(assert (=> b!375719 (= e!228844 (and e!228846 mapRes!15039))))

(declare-fun condMapEmpty!15039 () Bool)

(declare-fun mapDefault!15039 () ValueCell!4148)

(assert (=> b!375719 (= condMapEmpty!15039 (= (arr!10410 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4148)) mapDefault!15039)))))

(declare-fun b!375720 () Bool)

(assert (=> b!375720 (= e!228845 true)))

(assert (=> b!375720 (= lt!174005 (+!844 lt!174009 lt!174003))))

(declare-fun lt!174001 () Unit!11560)

(declare-fun addCommutativeForDiffKeys!255 (ListLongMap!4921 (_ BitVec 64) V!13083 (_ BitVec 64) V!13083) Unit!11560)

(assert (=> b!375720 (= lt!174001 (addCommutativeForDiffKeys!255 lt!174006 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!375721 () Bool)

(declare-fun res!212261 () Bool)

(assert (=> b!375721 (=> (not res!212261) (not e!228843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375721 (= res!212261 (validKeyInArray!0 k0!778))))

(declare-fun b!375722 () Bool)

(declare-fun res!212252 () Bool)

(assert (=> b!375722 (=> (not res!212252) (not e!228843))))

(declare-datatypes ((List!5848 0))(
  ( (Nil!5845) (Cons!5844 (h!6700 (_ BitVec 64)) (t!10989 List!5848)) )
))
(declare-fun arrayNoDuplicates!0 (array!21881 (_ BitVec 32) List!5848) Bool)

(assert (=> b!375722 (= res!212252 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5845))))

(declare-fun b!375712 () Bool)

(assert (=> b!375712 (= e!228843 e!228841)))

(declare-fun res!212253 () Bool)

(assert (=> b!375712 (=> (not res!212253) (not e!228841))))

(assert (=> b!375712 (= res!212253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173999 mask!970))))

(assert (=> b!375712 (= lt!173999 (array!21882 (store (arr!10409 _keys!658) i!548 k0!778) (size!10762 _keys!658)))))

(declare-fun res!212254 () Bool)

(assert (=> start!37194 (=> (not res!212254) (not e!228843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37194 (= res!212254 (validMask!0 mask!970))))

(assert (=> start!37194 e!228843))

(declare-fun array_inv!7676 (array!21883) Bool)

(assert (=> start!37194 (and (array_inv!7676 _values!506) e!228844)))

(assert (=> start!37194 tp!29720))

(assert (=> start!37194 true))

(assert (=> start!37194 tp_is_empty!8983))

(declare-fun array_inv!7677 (array!21881) Bool)

(assert (=> start!37194 (array_inv!7677 _keys!658)))

(declare-fun b!375723 () Bool)

(declare-fun res!212251 () Bool)

(assert (=> b!375723 (=> (not res!212251) (not e!228841))))

(assert (=> b!375723 (= res!212251 (arrayNoDuplicates!0 lt!173999 #b00000000000000000000000000000000 Nil!5845))))

(declare-fun b!375724 () Bool)

(assert (=> b!375724 (= e!228846 tp_is_empty!8983)))

(assert (= (and start!37194 res!212254) b!375713))

(assert (= (and b!375713 res!212255) b!375718))

(assert (= (and b!375718 res!212258) b!375722))

(assert (= (and b!375722 res!212252) b!375715))

(assert (= (and b!375715 res!212260) b!375721))

(assert (= (and b!375721 res!212261) b!375714))

(assert (= (and b!375714 res!212259) b!375710))

(assert (= (and b!375710 res!212257) b!375712))

(assert (= (and b!375712 res!212253) b!375723))

(assert (= (and b!375723 res!212251) b!375717))

(assert (= (and b!375717 (not res!212256)) b!375711))

(assert (= (and b!375711 (not res!212250)) b!375720))

(assert (= (and b!375719 condMapEmpty!15039) mapIsEmpty!15039))

(assert (= (and b!375719 (not condMapEmpty!15039)) mapNonEmpty!15039))

(get-info :version)

(assert (= (and mapNonEmpty!15039 ((_ is ValueCellFull!4148) mapValue!15039)) b!375716))

(assert (= (and b!375719 ((_ is ValueCellFull!4148) mapDefault!15039)) b!375724))

(assert (= start!37194 b!375719))

(declare-fun m!371927 () Bool)

(assert (=> b!375718 m!371927))

(declare-fun m!371929 () Bool)

(assert (=> b!375722 m!371929))

(declare-fun m!371931 () Bool)

(assert (=> b!375714 m!371931))

(declare-fun m!371933 () Bool)

(assert (=> b!375710 m!371933))

(declare-fun m!371935 () Bool)

(assert (=> start!37194 m!371935))

(declare-fun m!371937 () Bool)

(assert (=> start!37194 m!371937))

(declare-fun m!371939 () Bool)

(assert (=> start!37194 m!371939))

(declare-fun m!371941 () Bool)

(assert (=> b!375723 m!371941))

(declare-fun m!371943 () Bool)

(assert (=> b!375721 m!371943))

(declare-fun m!371945 () Bool)

(assert (=> b!375712 m!371945))

(declare-fun m!371947 () Bool)

(assert (=> b!375712 m!371947))

(declare-fun m!371949 () Bool)

(assert (=> b!375720 m!371949))

(declare-fun m!371951 () Bool)

(assert (=> b!375720 m!371951))

(declare-fun m!371953 () Bool)

(assert (=> mapNonEmpty!15039 m!371953))

(declare-fun m!371955 () Bool)

(assert (=> b!375717 m!371955))

(declare-fun m!371957 () Bool)

(assert (=> b!375717 m!371957))

(declare-fun m!371959 () Bool)

(assert (=> b!375717 m!371959))

(declare-fun m!371961 () Bool)

(assert (=> b!375717 m!371961))

(declare-fun m!371963 () Bool)

(assert (=> b!375717 m!371963))

(declare-fun m!371965 () Bool)

(assert (=> b!375717 m!371965))

(declare-fun m!371967 () Bool)

(assert (=> b!375717 m!371967))

(declare-fun m!371969 () Bool)

(assert (=> b!375711 m!371969))

(declare-fun m!371971 () Bool)

(assert (=> b!375711 m!371971))

(declare-fun m!371973 () Bool)

(assert (=> b!375711 m!371973))

(check-sat (not b!375710) (not mapNonEmpty!15039) (not b!375723) (not b_next!8335) tp_is_empty!8983 b_and!15551 (not b!375722) (not b!375721) (not b!375720) (not b!375712) (not b!375711) (not start!37194) (not b!375718) (not b!375717))
(check-sat b_and!15551 (not b_next!8335))
