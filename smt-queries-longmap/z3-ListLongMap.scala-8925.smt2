; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108232 () Bool)

(assert start!108232)

(declare-fun b_free!27913 () Bool)

(declare-fun b_next!27913 () Bool)

(assert (=> start!108232 (= b_free!27913 (not b_next!27913))))

(declare-fun tp!98700 () Bool)

(declare-fun b_and!45955 () Bool)

(assert (=> start!108232 (= tp!98700 b_and!45955)))

(declare-fun b!1277948 () Bool)

(declare-fun res!849118 () Bool)

(declare-fun e!729908 () Bool)

(assert (=> b!1277948 (=> (not res!849118) (not e!729908))))

(declare-datatypes ((array!83915 0))(
  ( (array!83916 (arr!40467 (Array (_ BitVec 32) (_ BitVec 64))) (size!41019 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83915)

(assert (=> b!1277948 (= res!849118 (bvslt #b00000000000000000000000000000000 (size!41019 _keys!1427)))))

(declare-fun b!1277949 () Bool)

(declare-fun res!849116 () Bool)

(assert (=> b!1277949 (=> (not res!849116) (not e!729908))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-fun defaultEntry!1195 () Int)

(declare-datatypes ((V!49721 0))(
  ( (V!49722 (val!16806 Int)) )
))
(declare-fun minValue!1129 () V!49721)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-datatypes ((ValueCell!15833 0))(
  ( (ValueCellFull!15833 (v!19404 V!49721)) (EmptyCell!15833) )
))
(declare-datatypes ((array!83917 0))(
  ( (array!83918 (arr!40468 (Array (_ BitVec 32) ValueCell!15833)) (size!41020 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83917)

(declare-fun zeroValue!1129 () V!49721)

(declare-datatypes ((tuple2!21638 0))(
  ( (tuple2!21639 (_1!10830 (_ BitVec 64)) (_2!10830 V!49721)) )
))
(declare-datatypes ((List!28808 0))(
  ( (Nil!28805) (Cons!28804 (h!30013 tuple2!21638) (t!42340 List!28808)) )
))
(declare-datatypes ((ListLongMap!19295 0))(
  ( (ListLongMap!19296 (toList!9663 List!28808)) )
))
(declare-fun contains!7705 (ListLongMap!19295 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4637 (array!83915 array!83917 (_ BitVec 32) (_ BitVec 32) V!49721 V!49721 (_ BitVec 32) Int) ListLongMap!19295)

(assert (=> b!1277949 (= res!849116 (contains!7705 (getCurrentListMap!4637 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277950 () Bool)

(declare-fun res!849119 () Bool)

(assert (=> b!1277950 (=> (not res!849119) (not e!729908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83915 (_ BitVec 32)) Bool)

(assert (=> b!1277950 (= res!849119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277951 () Bool)

(declare-fun e!729905 () Bool)

(declare-fun tp_is_empty!33463 () Bool)

(assert (=> b!1277951 (= e!729905 tp_is_empty!33463)))

(declare-fun b!1277952 () Bool)

(declare-fun res!849117 () Bool)

(assert (=> b!1277952 (=> (not res!849117) (not e!729908))))

(assert (=> b!1277952 (= res!849117 (and (= (size!41020 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41019 _keys!1427) (size!41020 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51731 () Bool)

(declare-fun mapRes!51731 () Bool)

(assert (=> mapIsEmpty!51731 mapRes!51731))

(declare-fun b!1277953 () Bool)

(declare-fun res!849115 () Bool)

(assert (=> b!1277953 (=> (not res!849115) (not e!729908))))

(declare-datatypes ((List!28809 0))(
  ( (Nil!28806) (Cons!28805 (h!30014 (_ BitVec 64)) (t!42341 List!28809)) )
))
(declare-fun arrayNoDuplicates!0 (array!83915 (_ BitVec 32) List!28809) Bool)

(assert (=> b!1277953 (= res!849115 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28806))))

(declare-fun b!1277954 () Bool)

(assert (=> b!1277954 (= e!729908 (not true))))

(declare-fun e!729909 () Bool)

(assert (=> b!1277954 e!729909))

(declare-fun c!124004 () Bool)

(assert (=> b!1277954 (= c!124004 (and (not (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1053 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!42227 0))(
  ( (Unit!42228) )
))
(declare-fun lt!575661 () Unit!42227)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!620 (array!83915 array!83917 (_ BitVec 32) (_ BitVec 32) V!49721 V!49721 (_ BitVec 64) (_ BitVec 32) Int) Unit!42227)

(assert (=> b!1277954 (= lt!575661 (lemmaListMapContainsThenArrayContainsFrom!620 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 k0!1053 #b00000000000000000000000000000000 defaultEntry!1195))))

(declare-fun b!1277955 () Bool)

(declare-fun arrayContainsKey!0 (array!83915 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1277955 (= e!729909 (arrayContainsKey!0 _keys!1427 k0!1053 #b00000000000000000000000000000000))))

(declare-fun b!1277957 () Bool)

(declare-fun e!729906 () Bool)

(assert (=> b!1277957 (= e!729906 (and e!729905 mapRes!51731))))

(declare-fun condMapEmpty!51731 () Bool)

(declare-fun mapDefault!51731 () ValueCell!15833)

(assert (=> b!1277957 (= condMapEmpty!51731 (= (arr!40468 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15833)) mapDefault!51731)))))

(declare-fun b!1277956 () Bool)

(declare-fun e!729910 () Bool)

(assert (=> b!1277956 (= e!729910 tp_is_empty!33463)))

(declare-fun res!849120 () Bool)

(assert (=> start!108232 (=> (not res!849120) (not e!729908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108232 (= res!849120 (validMask!0 mask!1805))))

(assert (=> start!108232 e!729908))

(assert (=> start!108232 true))

(assert (=> start!108232 tp!98700))

(assert (=> start!108232 tp_is_empty!33463))

(declare-fun array_inv!30903 (array!83917) Bool)

(assert (=> start!108232 (and (array_inv!30903 _values!1187) e!729906)))

(declare-fun array_inv!30904 (array!83915) Bool)

(assert (=> start!108232 (array_inv!30904 _keys!1427)))

(declare-fun b!1277958 () Bool)

(assert (=> b!1277958 (= e!729909 (ite (= k0!1053 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1108 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!51731 () Bool)

(declare-fun tp!98699 () Bool)

(assert (=> mapNonEmpty!51731 (= mapRes!51731 (and tp!98699 e!729910))))

(declare-fun mapRest!51731 () (Array (_ BitVec 32) ValueCell!15833))

(declare-fun mapKey!51731 () (_ BitVec 32))

(declare-fun mapValue!51731 () ValueCell!15833)

(assert (=> mapNonEmpty!51731 (= (arr!40468 _values!1187) (store mapRest!51731 mapKey!51731 mapValue!51731))))

(assert (= (and start!108232 res!849120) b!1277952))

(assert (= (and b!1277952 res!849117) b!1277950))

(assert (= (and b!1277950 res!849119) b!1277953))

(assert (= (and b!1277953 res!849115) b!1277949))

(assert (= (and b!1277949 res!849116) b!1277948))

(assert (= (and b!1277948 res!849118) b!1277954))

(assert (= (and b!1277954 c!124004) b!1277955))

(assert (= (and b!1277954 (not c!124004)) b!1277958))

(assert (= (and b!1277957 condMapEmpty!51731) mapIsEmpty!51731))

(assert (= (and b!1277957 (not condMapEmpty!51731)) mapNonEmpty!51731))

(get-info :version)

(assert (= (and mapNonEmpty!51731 ((_ is ValueCellFull!15833) mapValue!51731)) b!1277956))

(assert (= (and b!1277957 ((_ is ValueCellFull!15833) mapDefault!51731)) b!1277951))

(assert (= start!108232 b!1277957))

(declare-fun m!1172981 () Bool)

(assert (=> b!1277953 m!1172981))

(declare-fun m!1172983 () Bool)

(assert (=> b!1277949 m!1172983))

(assert (=> b!1277949 m!1172983))

(declare-fun m!1172985 () Bool)

(assert (=> b!1277949 m!1172985))

(declare-fun m!1172987 () Bool)

(assert (=> b!1277950 m!1172987))

(declare-fun m!1172989 () Bool)

(assert (=> start!108232 m!1172989))

(declare-fun m!1172991 () Bool)

(assert (=> start!108232 m!1172991))

(declare-fun m!1172993 () Bool)

(assert (=> start!108232 m!1172993))

(declare-fun m!1172995 () Bool)

(assert (=> b!1277955 m!1172995))

(declare-fun m!1172997 () Bool)

(assert (=> mapNonEmpty!51731 m!1172997))

(declare-fun m!1172999 () Bool)

(assert (=> b!1277954 m!1172999))

(check-sat (not mapNonEmpty!51731) (not b!1277955) (not b!1277954) (not start!108232) (not b_next!27913) (not b!1277950) (not b!1277953) b_and!45955 tp_is_empty!33463 (not b!1277949))
(check-sat b_and!45955 (not b_next!27913))
