; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84636 () Bool)

(assert start!84636)

(declare-fun b_free!20065 () Bool)

(declare-fun b_next!20065 () Bool)

(assert (=> start!84636 (= b_free!20065 (not b_next!20065))))

(declare-fun tp!69991 () Bool)

(declare-fun b_and!32175 () Bool)

(assert (=> start!84636 (= tp!69991 b_and!32175)))

(declare-fun b!989751 () Bool)

(declare-fun e!558084 () Bool)

(assert (=> b!989751 (= e!558084 (not true))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!36025 0))(
  ( (V!36026 (val!11691 Int)) )
))
(declare-fun minValue!1220 () V!36025)

(declare-datatypes ((ValueCell!11159 0))(
  ( (ValueCellFull!11159 (v!14260 V!36025)) (EmptyCell!11159) )
))
(declare-datatypes ((array!62456 0))(
  ( (array!62457 (arr!30080 (Array (_ BitVec 32) ValueCell!11159)) (size!30561 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62456)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!36025)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62458 0))(
  ( (array!62459 (arr!30081 (Array (_ BitVec 32) (_ BitVec 64))) (size!30562 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62458)

(declare-datatypes ((tuple2!14982 0))(
  ( (tuple2!14983 (_1!7502 (_ BitVec 64)) (_2!7502 V!36025)) )
))
(declare-datatypes ((List!20865 0))(
  ( (Nil!20862) (Cons!20861 (h!22023 tuple2!14982) (t!29817 List!20865)) )
))
(declare-datatypes ((ListLongMap!13669 0))(
  ( (ListLongMap!13670 (toList!6850 List!20865)) )
))
(declare-fun lt!438930 () ListLongMap!13669)

(declare-fun getCurrentListMap!3821 (array!62458 array!62456 (_ BitVec 32) (_ BitVec 32) V!36025 V!36025 (_ BitVec 32) Int) ListLongMap!13669)

(assert (=> b!989751 (= lt!438930 (getCurrentListMap!3821 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438932 () ListLongMap!13669)

(declare-fun lt!438934 () tuple2!14982)

(declare-fun lt!438929 () tuple2!14982)

(declare-fun +!3114 (ListLongMap!13669 tuple2!14982) ListLongMap!13669)

(assert (=> b!989751 (= (+!3114 (+!3114 lt!438932 lt!438934) lt!438929) (+!3114 (+!3114 lt!438932 lt!438929) lt!438934))))

(declare-fun lt!438931 () V!36025)

(assert (=> b!989751 (= lt!438929 (tuple2!14983 (select (arr!30081 _keys!1544) from!1932) lt!438931))))

(assert (=> b!989751 (= lt!438934 (tuple2!14983 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32721 0))(
  ( (Unit!32722) )
))
(declare-fun lt!438933 () Unit!32721)

(declare-fun addCommutativeForDiffKeys!708 (ListLongMap!13669 (_ BitVec 64) V!36025 (_ BitVec 64) V!36025) Unit!32721)

(assert (=> b!989751 (= lt!438933 (addCommutativeForDiffKeys!708 lt!438932 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30081 _keys!1544) from!1932) lt!438931))))

(declare-fun mapIsEmpty!36970 () Bool)

(declare-fun mapRes!36970 () Bool)

(assert (=> mapIsEmpty!36970 mapRes!36970))

(declare-fun b!989752 () Bool)

(declare-fun res!661891 () Bool)

(declare-fun e!558087 () Bool)

(assert (=> b!989752 (=> (not res!661891) (not e!558087))))

(declare-datatypes ((List!20866 0))(
  ( (Nil!20863) (Cons!20862 (h!22024 (_ BitVec 64)) (t!29818 List!20866)) )
))
(declare-fun arrayNoDuplicates!0 (array!62458 (_ BitVec 32) List!20866) Bool)

(assert (=> b!989752 (= res!661891 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20863))))

(declare-fun mapNonEmpty!36970 () Bool)

(declare-fun tp!69990 () Bool)

(declare-fun e!558085 () Bool)

(assert (=> mapNonEmpty!36970 (= mapRes!36970 (and tp!69990 e!558085))))

(declare-fun mapValue!36970 () ValueCell!11159)

(declare-fun mapKey!36970 () (_ BitVec 32))

(declare-fun mapRest!36970 () (Array (_ BitVec 32) ValueCell!11159))

(assert (=> mapNonEmpty!36970 (= (arr!30080 _values!1278) (store mapRest!36970 mapKey!36970 mapValue!36970))))

(declare-fun b!989753 () Bool)

(declare-fun res!661888 () Bool)

(assert (=> b!989753 (=> (not res!661888) (not e!558087))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62458 (_ BitVec 32)) Bool)

(assert (=> b!989753 (= res!661888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989754 () Bool)

(declare-fun res!661890 () Bool)

(assert (=> b!989754 (=> (not res!661890) (not e!558087))))

(assert (=> b!989754 (= res!661890 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!989755 () Bool)

(declare-fun res!661884 () Bool)

(assert (=> b!989755 (=> (not res!661884) (not e!558087))))

(assert (=> b!989755 (= res!661884 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30562 _keys!1544))))))

(declare-fun b!989756 () Bool)

(declare-fun res!661885 () Bool)

(assert (=> b!989756 (=> (not res!661885) (not e!558087))))

(assert (=> b!989756 (= res!661885 (and (= (size!30561 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30562 _keys!1544) (size!30561 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!661886 () Bool)

(assert (=> start!84636 (=> (not res!661886) (not e!558087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84636 (= res!661886 (validMask!0 mask!1948))))

(assert (=> start!84636 e!558087))

(assert (=> start!84636 true))

(declare-fun tp_is_empty!23281 () Bool)

(assert (=> start!84636 tp_is_empty!23281))

(declare-fun e!558086 () Bool)

(declare-fun array_inv!23243 (array!62456) Bool)

(assert (=> start!84636 (and (array_inv!23243 _values!1278) e!558086)))

(assert (=> start!84636 tp!69991))

(declare-fun array_inv!23244 (array!62458) Bool)

(assert (=> start!84636 (array_inv!23244 _keys!1544)))

(declare-fun b!989757 () Bool)

(declare-fun res!661889 () Bool)

(assert (=> b!989757 (=> (not res!661889) (not e!558087))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989757 (= res!661889 (validKeyInArray!0 (select (arr!30081 _keys!1544) from!1932)))))

(declare-fun b!989758 () Bool)

(assert (=> b!989758 (= e!558087 e!558084)))

(declare-fun res!661887 () Bool)

(assert (=> b!989758 (=> (not res!661887) (not e!558084))))

(assert (=> b!989758 (= res!661887 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30081 _keys!1544) from!1932))))))

(declare-fun get!15627 (ValueCell!11159 V!36025) V!36025)

(declare-fun dynLambda!1859 (Int (_ BitVec 64)) V!36025)

(assert (=> b!989758 (= lt!438931 (get!15627 (select (arr!30080 _values!1278) from!1932) (dynLambda!1859 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3550 (array!62458 array!62456 (_ BitVec 32) (_ BitVec 32) V!36025 V!36025 (_ BitVec 32) Int) ListLongMap!13669)

(assert (=> b!989758 (= lt!438932 (getCurrentListMapNoExtraKeys!3550 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989759 () Bool)

(declare-fun e!558089 () Bool)

(assert (=> b!989759 (= e!558089 tp_is_empty!23281)))

(declare-fun b!989760 () Bool)

(assert (=> b!989760 (= e!558085 tp_is_empty!23281)))

(declare-fun b!989761 () Bool)

(assert (=> b!989761 (= e!558086 (and e!558089 mapRes!36970))))

(declare-fun condMapEmpty!36970 () Bool)

(declare-fun mapDefault!36970 () ValueCell!11159)

(assert (=> b!989761 (= condMapEmpty!36970 (= (arr!30080 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11159)) mapDefault!36970)))))

(assert (= (and start!84636 res!661886) b!989756))

(assert (= (and b!989756 res!661885) b!989753))

(assert (= (and b!989753 res!661888) b!989752))

(assert (= (and b!989752 res!661891) b!989755))

(assert (= (and b!989755 res!661884) b!989757))

(assert (= (and b!989757 res!661889) b!989754))

(assert (= (and b!989754 res!661890) b!989758))

(assert (= (and b!989758 res!661887) b!989751))

(assert (= (and b!989761 condMapEmpty!36970) mapIsEmpty!36970))

(assert (= (and b!989761 (not condMapEmpty!36970)) mapNonEmpty!36970))

(get-info :version)

(assert (= (and mapNonEmpty!36970 ((_ is ValueCellFull!11159) mapValue!36970)) b!989760))

(assert (= (and b!989761 ((_ is ValueCellFull!11159) mapDefault!36970)) b!989759))

(assert (= start!84636 b!989761))

(declare-fun b_lambda!15127 () Bool)

(assert (=> (not b_lambda!15127) (not b!989758)))

(declare-fun t!29816 () Bool)

(declare-fun tb!6803 () Bool)

(assert (=> (and start!84636 (= defaultEntry!1281 defaultEntry!1281) t!29816) tb!6803))

(declare-fun result!13615 () Bool)

(assert (=> tb!6803 (= result!13615 tp_is_empty!23281)))

(assert (=> b!989758 t!29816))

(declare-fun b_and!32177 () Bool)

(assert (= b_and!32175 (and (=> t!29816 result!13615) b_and!32177)))

(declare-fun m!916629 () Bool)

(assert (=> b!989757 m!916629))

(assert (=> b!989757 m!916629))

(declare-fun m!916631 () Bool)

(assert (=> b!989757 m!916631))

(declare-fun m!916633 () Bool)

(assert (=> mapNonEmpty!36970 m!916633))

(declare-fun m!916635 () Bool)

(assert (=> b!989751 m!916635))

(assert (=> b!989751 m!916629))

(declare-fun m!916637 () Bool)

(assert (=> b!989751 m!916637))

(declare-fun m!916639 () Bool)

(assert (=> b!989751 m!916639))

(assert (=> b!989751 m!916635))

(declare-fun m!916641 () Bool)

(assert (=> b!989751 m!916641))

(assert (=> b!989751 m!916637))

(declare-fun m!916643 () Bool)

(assert (=> b!989751 m!916643))

(assert (=> b!989751 m!916629))

(declare-fun m!916645 () Bool)

(assert (=> b!989751 m!916645))

(assert (=> b!989758 m!916629))

(declare-fun m!916647 () Bool)

(assert (=> b!989758 m!916647))

(declare-fun m!916649 () Bool)

(assert (=> b!989758 m!916649))

(declare-fun m!916651 () Bool)

(assert (=> b!989758 m!916651))

(assert (=> b!989758 m!916647))

(assert (=> b!989758 m!916651))

(declare-fun m!916653 () Bool)

(assert (=> b!989758 m!916653))

(declare-fun m!916655 () Bool)

(assert (=> b!989752 m!916655))

(declare-fun m!916657 () Bool)

(assert (=> start!84636 m!916657))

(declare-fun m!916659 () Bool)

(assert (=> start!84636 m!916659))

(declare-fun m!916661 () Bool)

(assert (=> start!84636 m!916661))

(declare-fun m!916663 () Bool)

(assert (=> b!989753 m!916663))

(check-sat b_and!32177 (not b!989752) (not b!989758) (not b!989757) (not b_lambda!15127) tp_is_empty!23281 (not start!84636) (not b!989751) (not b!989753) (not b_next!20065) (not mapNonEmpty!36970))
(check-sat b_and!32177 (not b_next!20065))
