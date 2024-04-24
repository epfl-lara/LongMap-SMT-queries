; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105744 () Bool)

(assert start!105744)

(declare-fun b_free!27157 () Bool)

(declare-fun b_next!27157 () Bool)

(assert (=> start!105744 (= b_free!27157 (not b_next!27157))))

(declare-fun tp!94987 () Bool)

(declare-fun b_and!45015 () Bool)

(assert (=> start!105744 (= tp!94987 b_and!45015)))

(declare-fun res!838595 () Bool)

(declare-fun e!715691 () Bool)

(assert (=> start!105744 (=> (not res!838595) (not e!715691))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105744 (= res!838595 (validMask!0 mask!1466))))

(assert (=> start!105744 e!715691))

(assert (=> start!105744 true))

(assert (=> start!105744 tp!94987))

(declare-fun tp_is_empty!32059 () Bool)

(assert (=> start!105744 tp_is_empty!32059))

(declare-datatypes ((array!81799 0))(
  ( (array!81800 (arr!39453 (Array (_ BitVec 32) (_ BitVec 64))) (size!39990 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!81799)

(declare-fun array_inv!30189 (array!81799) Bool)

(assert (=> start!105744 (array_inv!30189 _keys!1118)))

(declare-datatypes ((V!48111 0))(
  ( (V!48112 (val!16092 Int)) )
))
(declare-datatypes ((ValueCell!15266 0))(
  ( (ValueCellFull!15266 (v!18789 V!48111)) (EmptyCell!15266) )
))
(declare-datatypes ((array!81801 0))(
  ( (array!81802 (arr!39454 (Array (_ BitVec 32) ValueCell!15266)) (size!39991 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81801)

(declare-fun e!715693 () Bool)

(declare-fun array_inv!30190 (array!81801) Bool)

(assert (=> start!105744 (and (array_inv!30190 _values!914) e!715693)))

(declare-fun mapNonEmpty!49876 () Bool)

(declare-fun mapRes!49876 () Bool)

(declare-fun tp!94988 () Bool)

(declare-fun e!715696 () Bool)

(assert (=> mapNonEmpty!49876 (= mapRes!49876 (and tp!94988 e!715696))))

(declare-fun mapValue!49876 () ValueCell!15266)

(declare-fun mapRest!49876 () (Array (_ BitVec 32) ValueCell!15266))

(declare-fun mapKey!49876 () (_ BitVec 32))

(assert (=> mapNonEmpty!49876 (= (arr!39454 _values!914) (store mapRest!49876 mapKey!49876 mapValue!49876))))

(declare-fun b!1258498 () Bool)

(declare-fun e!715692 () Bool)

(assert (=> b!1258498 (= e!715692 tp_is_empty!32059)))

(declare-fun b!1258499 () Bool)

(assert (=> b!1258499 (= e!715696 tp_is_empty!32059)))

(declare-fun b!1258500 () Bool)

(declare-fun res!838596 () Bool)

(assert (=> b!1258500 (=> (not res!838596) (not e!715691))))

(declare-datatypes ((List!28043 0))(
  ( (Nil!28040) (Cons!28039 (h!29257 (_ BitVec 64)) (t!41524 List!28043)) )
))
(declare-fun arrayNoDuplicates!0 (array!81799 (_ BitVec 32) List!28043) Bool)

(assert (=> b!1258500 (= res!838596 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28040))))

(declare-fun b!1258501 () Bool)

(declare-fun e!715695 () Bool)

(declare-fun e!715690 () Bool)

(assert (=> b!1258501 (= e!715695 e!715690)))

(declare-fun res!838599 () Bool)

(assert (=> b!1258501 (=> res!838599 e!715690)))

(declare-datatypes ((tuple2!20816 0))(
  ( (tuple2!20817 (_1!10419 (_ BitVec 64)) (_2!10419 V!48111)) )
))
(declare-datatypes ((List!28044 0))(
  ( (Nil!28041) (Cons!28040 (h!29258 tuple2!20816) (t!41525 List!28044)) )
))
(declare-datatypes ((ListLongMap!18697 0))(
  ( (ListLongMap!18698 (toList!9364 List!28044)) )
))
(declare-fun lt!569058 () ListLongMap!18697)

(declare-fun contains!7591 (ListLongMap!18697 (_ BitVec 64)) Bool)

(assert (=> b!1258501 (= res!838599 (contains!7591 lt!569058 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!922 () Int)

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun minValueBefore!43 () V!48111)

(declare-fun zeroValue!871 () V!48111)

(declare-fun getCurrentListMap!4568 (array!81799 array!81801 (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 (_ BitVec 32) Int) ListLongMap!18697)

(assert (=> b!1258501 (= lt!569058 (getCurrentListMap!4568 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258502 () Bool)

(assert (=> b!1258502 (= e!715690 (bvsle #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun -!2074 (ListLongMap!18697 (_ BitVec 64)) ListLongMap!18697)

(assert (=> b!1258502 (= (-!2074 lt!569058 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569058)))

(declare-datatypes ((Unit!41869 0))(
  ( (Unit!41870) )
))
(declare-fun lt!569061 () Unit!41869)

(declare-fun removeNotPresentStillSame!146 (ListLongMap!18697 (_ BitVec 64)) Unit!41869)

(assert (=> b!1258502 (= lt!569061 (removeNotPresentStillSame!146 lt!569058 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1258503 () Bool)

(declare-fun res!838598 () Bool)

(assert (=> b!1258503 (=> (not res!838598) (not e!715691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!81799 (_ BitVec 32)) Bool)

(assert (=> b!1258503 (= res!838598 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1258504 () Bool)

(declare-fun res!838600 () Bool)

(assert (=> b!1258504 (=> (not res!838600) (not e!715691))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1258504 (= res!838600 (and (= (size!39991 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39990 _keys!1118) (size!39991 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!49876 () Bool)

(assert (=> mapIsEmpty!49876 mapRes!49876))

(declare-fun b!1258505 () Bool)

(assert (=> b!1258505 (= e!715691 (not e!715695))))

(declare-fun res!838597 () Bool)

(assert (=> b!1258505 (=> res!838597 e!715695)))

(assert (=> b!1258505 (= res!838597 (or (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!569060 () ListLongMap!18697)

(declare-fun lt!569057 () ListLongMap!18697)

(assert (=> b!1258505 (= lt!569060 lt!569057)))

(declare-fun minValueAfter!43 () V!48111)

(declare-fun lt!569059 () Unit!41869)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1094 (array!81799 array!81801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 V!48111 V!48111 (_ BitVec 32) Int) Unit!41869)

(assert (=> b!1258505 (= lt!569059 (lemmaNoChangeToArrayThenSameMapNoExtras!1094 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5780 (array!81799 array!81801 (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 (_ BitVec 32) Int) ListLongMap!18697)

(assert (=> b!1258505 (= lt!569057 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1258505 (= lt!569060 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258506 () Bool)

(assert (=> b!1258506 (= e!715693 (and e!715692 mapRes!49876))))

(declare-fun condMapEmpty!49876 () Bool)

(declare-fun mapDefault!49876 () ValueCell!15266)

(assert (=> b!1258506 (= condMapEmpty!49876 (= (arr!39454 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15266)) mapDefault!49876)))))

(assert (= (and start!105744 res!838595) b!1258504))

(assert (= (and b!1258504 res!838600) b!1258503))

(assert (= (and b!1258503 res!838598) b!1258500))

(assert (= (and b!1258500 res!838596) b!1258505))

(assert (= (and b!1258505 (not res!838597)) b!1258501))

(assert (= (and b!1258501 (not res!838599)) b!1258502))

(assert (= (and b!1258506 condMapEmpty!49876) mapIsEmpty!49876))

(assert (= (and b!1258506 (not condMapEmpty!49876)) mapNonEmpty!49876))

(get-info :version)

(assert (= (and mapNonEmpty!49876 ((_ is ValueCellFull!15266) mapValue!49876)) b!1258499))

(assert (= (and b!1258506 ((_ is ValueCellFull!15266) mapDefault!49876)) b!1258498))

(assert (= start!105744 b!1258506))

(declare-fun m!1159425 () Bool)

(assert (=> mapNonEmpty!49876 m!1159425))

(declare-fun m!1159427 () Bool)

(assert (=> b!1258500 m!1159427))

(declare-fun m!1159429 () Bool)

(assert (=> start!105744 m!1159429))

(declare-fun m!1159431 () Bool)

(assert (=> start!105744 m!1159431))

(declare-fun m!1159433 () Bool)

(assert (=> start!105744 m!1159433))

(declare-fun m!1159435 () Bool)

(assert (=> b!1258501 m!1159435))

(declare-fun m!1159437 () Bool)

(assert (=> b!1258501 m!1159437))

(declare-fun m!1159439 () Bool)

(assert (=> b!1258502 m!1159439))

(declare-fun m!1159441 () Bool)

(assert (=> b!1258502 m!1159441))

(declare-fun m!1159443 () Bool)

(assert (=> b!1258505 m!1159443))

(declare-fun m!1159445 () Bool)

(assert (=> b!1258505 m!1159445))

(declare-fun m!1159447 () Bool)

(assert (=> b!1258505 m!1159447))

(declare-fun m!1159449 () Bool)

(assert (=> b!1258503 m!1159449))

(check-sat (not b_next!27157) (not b!1258501) (not b!1258500) (not start!105744) (not b!1258502) b_and!45015 (not mapNonEmpty!49876) (not b!1258505) (not b!1258503) tp_is_empty!32059)
(check-sat b_and!45015 (not b_next!27157))
(get-model)

(declare-fun d!138675 () Bool)

(declare-fun lt!569094 () ListLongMap!18697)

(assert (=> d!138675 (not (contains!7591 lt!569094 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun removeStrictlySorted!140 (List!28044 (_ BitVec 64)) List!28044)

(assert (=> d!138675 (= lt!569094 (ListLongMap!18698 (removeStrictlySorted!140 (toList!9364 lt!569058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!138675 (= (-!2074 lt!569058 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569094)))

(declare-fun bs!35565 () Bool)

(assert (= bs!35565 d!138675))

(declare-fun m!1159503 () Bool)

(assert (=> bs!35565 m!1159503))

(declare-fun m!1159505 () Bool)

(assert (=> bs!35565 m!1159505))

(assert (=> b!1258502 d!138675))

(declare-fun d!138677 () Bool)

(assert (=> d!138677 (= (-!2074 lt!569058 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569058)))

(declare-fun lt!569097 () Unit!41869)

(declare-fun choose!1864 (ListLongMap!18697 (_ BitVec 64)) Unit!41869)

(assert (=> d!138677 (= lt!569097 (choose!1864 lt!569058 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138677 (not (contains!7591 lt!569058 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138677 (= (removeNotPresentStillSame!146 lt!569058 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569097)))

(declare-fun bs!35566 () Bool)

(assert (= bs!35566 d!138677))

(assert (=> bs!35566 m!1159439))

(declare-fun m!1159507 () Bool)

(assert (=> bs!35566 m!1159507))

(assert (=> bs!35566 m!1159435))

(assert (=> b!1258502 d!138677))

(declare-fun d!138679 () Bool)

(declare-fun e!715744 () Bool)

(assert (=> d!138679 e!715744))

(declare-fun res!838639 () Bool)

(assert (=> d!138679 (=> res!838639 e!715744)))

(declare-fun lt!569107 () Bool)

(assert (=> d!138679 (= res!838639 (not lt!569107))))

(declare-fun lt!569106 () Bool)

(assert (=> d!138679 (= lt!569107 lt!569106)))

(declare-fun lt!569109 () Unit!41869)

(declare-fun e!715743 () Unit!41869)

(assert (=> d!138679 (= lt!569109 e!715743)))

(declare-fun c!122854 () Bool)

(assert (=> d!138679 (= c!122854 lt!569106)))

(declare-fun containsKey!621 (List!28044 (_ BitVec 64)) Bool)

(assert (=> d!138679 (= lt!569106 (containsKey!621 (toList!9364 lt!569058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!138679 (= (contains!7591 lt!569058 #b1000000000000000000000000000000000000000000000000000000000000000) lt!569107)))

(declare-fun b!1258567 () Bool)

(declare-fun lt!569108 () Unit!41869)

(assert (=> b!1258567 (= e!715743 lt!569108)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!430 (List!28044 (_ BitVec 64)) Unit!41869)

(assert (=> b!1258567 (= lt!569108 (lemmaContainsKeyImpliesGetValueByKeyDefined!430 (toList!9364 lt!569058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Option!704 0))(
  ( (Some!703 (v!18792 V!48111)) (None!702) )
))
(declare-fun isDefined!468 (Option!704) Bool)

(declare-fun getValueByKey!653 (List!28044 (_ BitVec 64)) Option!704)

(assert (=> b!1258567 (isDefined!468 (getValueByKey!653 (toList!9364 lt!569058) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1258568 () Bool)

(declare-fun Unit!41875 () Unit!41869)

(assert (=> b!1258568 (= e!715743 Unit!41875)))

(declare-fun b!1258569 () Bool)

(assert (=> b!1258569 (= e!715744 (isDefined!468 (getValueByKey!653 (toList!9364 lt!569058) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!138679 c!122854) b!1258567))

(assert (= (and d!138679 (not c!122854)) b!1258568))

(assert (= (and d!138679 (not res!838639)) b!1258569))

(declare-fun m!1159509 () Bool)

(assert (=> d!138679 m!1159509))

(declare-fun m!1159511 () Bool)

(assert (=> b!1258567 m!1159511))

(declare-fun m!1159513 () Bool)

(assert (=> b!1258567 m!1159513))

(assert (=> b!1258567 m!1159513))

(declare-fun m!1159515 () Bool)

(assert (=> b!1258567 m!1159515))

(assert (=> b!1258569 m!1159513))

(assert (=> b!1258569 m!1159513))

(assert (=> b!1258569 m!1159515))

(assert (=> b!1258501 d!138679))

(declare-fun b!1258612 () Bool)

(declare-fun res!838661 () Bool)

(declare-fun e!715782 () Bool)

(assert (=> b!1258612 (=> (not res!838661) (not e!715782))))

(declare-fun e!715775 () Bool)

(assert (=> b!1258612 (= res!838661 e!715775)))

(declare-fun res!838662 () Bool)

(assert (=> b!1258612 (=> res!838662 e!715775)))

(declare-fun e!715778 () Bool)

(assert (=> b!1258612 (= res!838662 (not e!715778))))

(declare-fun res!838663 () Bool)

(assert (=> b!1258612 (=> (not res!838663) (not e!715778))))

(assert (=> b!1258612 (= res!838663 (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun b!1258613 () Bool)

(declare-fun e!715774 () Bool)

(declare-fun e!715781 () Bool)

(assert (=> b!1258613 (= e!715774 e!715781)))

(declare-fun res!838660 () Bool)

(declare-fun call!61891 () Bool)

(assert (=> b!1258613 (= res!838660 call!61891)))

(assert (=> b!1258613 (=> (not res!838660) (not e!715781))))

(declare-fun bm!61885 () Bool)

(declare-fun lt!569174 () ListLongMap!18697)

(assert (=> bm!61885 (= call!61891 (contains!7591 lt!569174 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1258614 () Bool)

(declare-fun e!715773 () Bool)

(assert (=> b!1258614 (= e!715775 e!715773)))

(declare-fun res!838666 () Bool)

(assert (=> b!1258614 (=> (not res!838666) (not e!715773))))

(assert (=> b!1258614 (= res!838666 (contains!7591 lt!569174 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258614 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun b!1258615 () Bool)

(declare-fun e!715772 () Unit!41869)

(declare-fun Unit!41876 () Unit!41869)

(assert (=> b!1258615 (= e!715772 Unit!41876)))

(declare-fun bm!61886 () Bool)

(declare-fun call!61889 () ListLongMap!18697)

(declare-fun call!61894 () ListLongMap!18697)

(assert (=> bm!61886 (= call!61889 call!61894)))

(declare-fun b!1258616 () Bool)

(declare-fun e!715783 () Bool)

(declare-fun e!715777 () Bool)

(assert (=> b!1258616 (= e!715783 e!715777)))

(declare-fun res!838665 () Bool)

(declare-fun call!61888 () Bool)

(assert (=> b!1258616 (= res!838665 call!61888)))

(assert (=> b!1258616 (=> (not res!838665) (not e!715777))))

(declare-fun b!1258617 () Bool)

(declare-fun e!715776 () ListLongMap!18697)

(declare-fun call!61893 () ListLongMap!18697)

(assert (=> b!1258617 (= e!715776 call!61893)))

(declare-fun b!1258618 () Bool)

(declare-fun apply!998 (ListLongMap!18697 (_ BitVec 64)) V!48111)

(assert (=> b!1258618 (= e!715777 (= (apply!998 lt!569174 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!871))))

(declare-fun b!1258620 () Bool)

(assert (=> b!1258620 (= e!715783 (not call!61888))))

(declare-fun b!1258621 () Bool)

(assert (=> b!1258621 (= e!715781 (= (apply!998 lt!569174 #b1000000000000000000000000000000000000000000000000000000000000000) minValueBefore!43))))

(declare-fun bm!61887 () Bool)

(assert (=> bm!61887 (= call!61888 (contains!7591 lt!569174 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!61888 () Bool)

(assert (=> bm!61888 (= call!61893 call!61889)))

(declare-fun b!1258622 () Bool)

(declare-fun e!715771 () ListLongMap!18697)

(declare-fun e!715780 () ListLongMap!18697)

(assert (=> b!1258622 (= e!715771 e!715780)))

(declare-fun c!122872 () Bool)

(assert (=> b!1258622 (= c!122872 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1258623 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1258623 (= e!715778 (validKeyInArray!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun call!61892 () ListLongMap!18697)

(declare-fun bm!61889 () Bool)

(declare-fun c!122868 () Bool)

(declare-fun +!4239 (ListLongMap!18697 tuple2!20816) ListLongMap!18697)

(assert (=> bm!61889 (= call!61892 (+!4239 (ite c!122868 call!61894 (ite c!122872 call!61889 call!61893)) (ite (or c!122868 c!122872) (tuple2!20817 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!871) (tuple2!20817 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43))))))

(declare-fun b!1258624 () Bool)

(declare-fun call!61890 () ListLongMap!18697)

(assert (=> b!1258624 (= e!715776 call!61890)))

(declare-fun b!1258625 () Bool)

(declare-fun c!122871 () Bool)

(assert (=> b!1258625 (= c!122871 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1258625 (= e!715780 e!715776)))

(declare-fun b!1258626 () Bool)

(assert (=> b!1258626 (= e!715780 call!61890)))

(declare-fun b!1258627 () Bool)

(declare-fun res!838658 () Bool)

(assert (=> b!1258627 (=> (not res!838658) (not e!715782))))

(assert (=> b!1258627 (= res!838658 e!715783)))

(declare-fun c!122867 () Bool)

(assert (=> b!1258627 (= c!122867 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1258628 () Bool)

(declare-fun lt!569175 () Unit!41869)

(assert (=> b!1258628 (= e!715772 lt!569175)))

(declare-fun lt!569161 () ListLongMap!18697)

(assert (=> b!1258628 (= lt!569161 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569155 () (_ BitVec 64))

(assert (=> b!1258628 (= lt!569155 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569154 () (_ BitVec 64))

(assert (=> b!1258628 (= lt!569154 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569160 () Unit!41869)

(declare-fun addStillContains!1089 (ListLongMap!18697 (_ BitVec 64) V!48111 (_ BitVec 64)) Unit!41869)

(assert (=> b!1258628 (= lt!569160 (addStillContains!1089 lt!569161 lt!569155 zeroValue!871 lt!569154))))

(assert (=> b!1258628 (contains!7591 (+!4239 lt!569161 (tuple2!20817 lt!569155 zeroValue!871)) lt!569154)))

(declare-fun lt!569173 () Unit!41869)

(assert (=> b!1258628 (= lt!569173 lt!569160)))

(declare-fun lt!569167 () ListLongMap!18697)

(assert (=> b!1258628 (= lt!569167 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569162 () (_ BitVec 64))

(assert (=> b!1258628 (= lt!569162 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569157 () (_ BitVec 64))

(assert (=> b!1258628 (= lt!569157 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569164 () Unit!41869)

(declare-fun addApplyDifferent!531 (ListLongMap!18697 (_ BitVec 64) V!48111 (_ BitVec 64)) Unit!41869)

(assert (=> b!1258628 (= lt!569164 (addApplyDifferent!531 lt!569167 lt!569162 minValueBefore!43 lt!569157))))

(assert (=> b!1258628 (= (apply!998 (+!4239 lt!569167 (tuple2!20817 lt!569162 minValueBefore!43)) lt!569157) (apply!998 lt!569167 lt!569157))))

(declare-fun lt!569169 () Unit!41869)

(assert (=> b!1258628 (= lt!569169 lt!569164)))

(declare-fun lt!569159 () ListLongMap!18697)

(assert (=> b!1258628 (= lt!569159 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569163 () (_ BitVec 64))

(assert (=> b!1258628 (= lt!569163 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569170 () (_ BitVec 64))

(assert (=> b!1258628 (= lt!569170 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569156 () Unit!41869)

(assert (=> b!1258628 (= lt!569156 (addApplyDifferent!531 lt!569159 lt!569163 zeroValue!871 lt!569170))))

(assert (=> b!1258628 (= (apply!998 (+!4239 lt!569159 (tuple2!20817 lt!569163 zeroValue!871)) lt!569170) (apply!998 lt!569159 lt!569170))))

(declare-fun lt!569172 () Unit!41869)

(assert (=> b!1258628 (= lt!569172 lt!569156)))

(declare-fun lt!569165 () ListLongMap!18697)

(assert (=> b!1258628 (= lt!569165 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569168 () (_ BitVec 64))

(assert (=> b!1258628 (= lt!569168 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!569166 () (_ BitVec 64))

(assert (=> b!1258628 (= lt!569166 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258628 (= lt!569175 (addApplyDifferent!531 lt!569165 lt!569168 minValueBefore!43 lt!569166))))

(assert (=> b!1258628 (= (apply!998 (+!4239 lt!569165 (tuple2!20817 lt!569168 minValueBefore!43)) lt!569166) (apply!998 lt!569165 lt!569166))))

(declare-fun b!1258629 () Bool)

(assert (=> b!1258629 (= e!715771 (+!4239 call!61892 (tuple2!20817 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!43)))))

(declare-fun bm!61890 () Bool)

(assert (=> bm!61890 (= call!61890 call!61892)))

(declare-fun bm!61891 () Bool)

(assert (=> bm!61891 (= call!61894 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1258630 () Bool)

(assert (=> b!1258630 (= e!715774 (not call!61891))))

(declare-fun b!1258631 () Bool)

(declare-fun get!20211 (ValueCell!15266 V!48111) V!48111)

(declare-fun dynLambda!3450 (Int (_ BitVec 64)) V!48111)

(assert (=> b!1258631 (= e!715773 (= (apply!998 lt!569174 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)) (get!20211 (select (arr!39454 _values!914) #b00000000000000000000000000000000) (dynLambda!3450 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1258631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39991 _values!914)))))

(assert (=> b!1258631 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun b!1258632 () Bool)

(declare-fun e!715779 () Bool)

(assert (=> b!1258632 (= e!715779 (validKeyInArray!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138681 () Bool)

(assert (=> d!138681 e!715782))

(declare-fun res!838659 () Bool)

(assert (=> d!138681 (=> (not res!838659) (not e!715782))))

(assert (=> d!138681 (= res!838659 (or (bvsge #b00000000000000000000000000000000 (size!39990 _keys!1118)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))))

(declare-fun lt!569158 () ListLongMap!18697)

(assert (=> d!138681 (= lt!569174 lt!569158)))

(declare-fun lt!569171 () Unit!41869)

(assert (=> d!138681 (= lt!569171 e!715772)))

(declare-fun c!122870 () Bool)

(assert (=> d!138681 (= c!122870 e!715779)))

(declare-fun res!838664 () Bool)

(assert (=> d!138681 (=> (not res!838664) (not e!715779))))

(assert (=> d!138681 (= res!838664 (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(assert (=> d!138681 (= lt!569158 e!715771)))

(assert (=> d!138681 (= c!122868 (and (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!138681 (validMask!0 mask!1466)))

(assert (=> d!138681 (= (getCurrentListMap!4568 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569174)))

(declare-fun b!1258619 () Bool)

(assert (=> b!1258619 (= e!715782 e!715774)))

(declare-fun c!122869 () Bool)

(assert (=> b!1258619 (= c!122869 (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and d!138681 c!122868) b!1258629))

(assert (= (and d!138681 (not c!122868)) b!1258622))

(assert (= (and b!1258622 c!122872) b!1258626))

(assert (= (and b!1258622 (not c!122872)) b!1258625))

(assert (= (and b!1258625 c!122871) b!1258624))

(assert (= (and b!1258625 (not c!122871)) b!1258617))

(assert (= (or b!1258624 b!1258617) bm!61888))

(assert (= (or b!1258626 bm!61888) bm!61886))

(assert (= (or b!1258626 b!1258624) bm!61890))

(assert (= (or b!1258629 bm!61886) bm!61891))

(assert (= (or b!1258629 bm!61890) bm!61889))

(assert (= (and d!138681 res!838664) b!1258632))

(assert (= (and d!138681 c!122870) b!1258628))

(assert (= (and d!138681 (not c!122870)) b!1258615))

(assert (= (and d!138681 res!838659) b!1258612))

(assert (= (and b!1258612 res!838663) b!1258623))

(assert (= (and b!1258612 (not res!838662)) b!1258614))

(assert (= (and b!1258614 res!838666) b!1258631))

(assert (= (and b!1258612 res!838661) b!1258627))

(assert (= (and b!1258627 c!122867) b!1258616))

(assert (= (and b!1258627 (not c!122867)) b!1258620))

(assert (= (and b!1258616 res!838665) b!1258618))

(assert (= (or b!1258616 b!1258620) bm!61887))

(assert (= (and b!1258627 res!838658) b!1258619))

(assert (= (and b!1258619 c!122869) b!1258613))

(assert (= (and b!1258619 (not c!122869)) b!1258630))

(assert (= (and b!1258613 res!838660) b!1258621))

(assert (= (or b!1258613 b!1258630) bm!61885))

(declare-fun b_lambda!22681 () Bool)

(assert (=> (not b_lambda!22681) (not b!1258631)))

(declare-fun t!41531 () Bool)

(declare-fun tb!11297 () Bool)

(assert (=> (and start!105744 (= defaultEntry!922 defaultEntry!922) t!41531) tb!11297))

(declare-fun result!23315 () Bool)

(assert (=> tb!11297 (= result!23315 tp_is_empty!32059)))

(assert (=> b!1258631 t!41531))

(declare-fun b_and!45021 () Bool)

(assert (= b_and!45015 (and (=> t!41531 result!23315) b_and!45021)))

(assert (=> bm!61891 m!1159447))

(declare-fun m!1159517 () Bool)

(assert (=> b!1258628 m!1159517))

(declare-fun m!1159519 () Bool)

(assert (=> b!1258628 m!1159519))

(declare-fun m!1159521 () Bool)

(assert (=> b!1258628 m!1159521))

(declare-fun m!1159523 () Bool)

(assert (=> b!1258628 m!1159523))

(declare-fun m!1159525 () Bool)

(assert (=> b!1258628 m!1159525))

(declare-fun m!1159527 () Bool)

(assert (=> b!1258628 m!1159527))

(declare-fun m!1159529 () Bool)

(assert (=> b!1258628 m!1159529))

(declare-fun m!1159531 () Bool)

(assert (=> b!1258628 m!1159531))

(assert (=> b!1258628 m!1159447))

(declare-fun m!1159533 () Bool)

(assert (=> b!1258628 m!1159533))

(declare-fun m!1159535 () Bool)

(assert (=> b!1258628 m!1159535))

(declare-fun m!1159537 () Bool)

(assert (=> b!1258628 m!1159537))

(declare-fun m!1159539 () Bool)

(assert (=> b!1258628 m!1159539))

(declare-fun m!1159541 () Bool)

(assert (=> b!1258628 m!1159541))

(declare-fun m!1159543 () Bool)

(assert (=> b!1258628 m!1159543))

(assert (=> b!1258628 m!1159517))

(declare-fun m!1159545 () Bool)

(assert (=> b!1258628 m!1159545))

(assert (=> b!1258628 m!1159523))

(assert (=> b!1258628 m!1159537))

(assert (=> b!1258628 m!1159519))

(declare-fun m!1159547 () Bool)

(assert (=> b!1258628 m!1159547))

(declare-fun m!1159549 () Bool)

(assert (=> bm!61885 m!1159549))

(assert (=> b!1258614 m!1159543))

(assert (=> b!1258614 m!1159543))

(declare-fun m!1159551 () Bool)

(assert (=> b!1258614 m!1159551))

(declare-fun m!1159553 () Bool)

(assert (=> b!1258621 m!1159553))

(declare-fun m!1159555 () Bool)

(assert (=> bm!61889 m!1159555))

(declare-fun m!1159557 () Bool)

(assert (=> bm!61887 m!1159557))

(assert (=> b!1258632 m!1159543))

(assert (=> b!1258632 m!1159543))

(declare-fun m!1159559 () Bool)

(assert (=> b!1258632 m!1159559))

(assert (=> b!1258631 m!1159543))

(declare-fun m!1159561 () Bool)

(assert (=> b!1258631 m!1159561))

(declare-fun m!1159563 () Bool)

(assert (=> b!1258631 m!1159563))

(assert (=> b!1258631 m!1159561))

(assert (=> b!1258631 m!1159563))

(declare-fun m!1159565 () Bool)

(assert (=> b!1258631 m!1159565))

(assert (=> b!1258631 m!1159543))

(declare-fun m!1159567 () Bool)

(assert (=> b!1258631 m!1159567))

(assert (=> b!1258623 m!1159543))

(assert (=> b!1258623 m!1159543))

(assert (=> b!1258623 m!1159559))

(declare-fun m!1159569 () Bool)

(assert (=> b!1258618 m!1159569))

(declare-fun m!1159571 () Bool)

(assert (=> b!1258629 m!1159571))

(assert (=> d!138681 m!1159429))

(assert (=> b!1258501 d!138681))

(declare-fun d!138683 () Bool)

(assert (=> d!138683 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!105744 d!138683))

(declare-fun d!138685 () Bool)

(assert (=> d!138685 (= (array_inv!30189 _keys!1118) (bvsge (size!39990 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!105744 d!138685))

(declare-fun d!138687 () Bool)

(assert (=> d!138687 (= (array_inv!30190 _values!914) (bvsge (size!39991 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!105744 d!138687))

(declare-fun d!138689 () Bool)

(assert (=> d!138689 (= (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun lt!569178 () Unit!41869)

(declare-fun choose!1865 (array!81799 array!81801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48111 V!48111 V!48111 V!48111 (_ BitVec 32) Int) Unit!41869)

(assert (=> d!138689 (= lt!569178 (choose!1865 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> d!138689 (validMask!0 mask!1466)))

(assert (=> d!138689 (= (lemmaNoChangeToArrayThenSameMapNoExtras!1094 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569178)))

(declare-fun bs!35567 () Bool)

(assert (= bs!35567 d!138689))

(assert (=> bs!35567 m!1159447))

(assert (=> bs!35567 m!1159445))

(declare-fun m!1159573 () Bool)

(assert (=> bs!35567 m!1159573))

(assert (=> bs!35567 m!1159429))

(assert (=> b!1258505 d!138689))

(declare-fun d!138691 () Bool)

(declare-fun e!715802 () Bool)

(assert (=> d!138691 e!715802))

(declare-fun res!838675 () Bool)

(assert (=> d!138691 (=> (not res!838675) (not e!715802))))

(declare-fun lt!569198 () ListLongMap!18697)

(assert (=> d!138691 (= res!838675 (not (contains!7591 lt!569198 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!715803 () ListLongMap!18697)

(assert (=> d!138691 (= lt!569198 e!715803)))

(declare-fun c!122884 () Bool)

(assert (=> d!138691 (= c!122884 (bvsge #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(assert (=> d!138691 (validMask!0 mask!1466)))

(assert (=> d!138691 (= (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569198)))

(declare-fun e!715804 () Bool)

(declare-fun b!1258659 () Bool)

(assert (=> b!1258659 (= e!715804 (= lt!569198 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1258660 () Bool)

(declare-fun e!715798 () Bool)

(assert (=> b!1258660 (= e!715798 e!715804)))

(declare-fun c!122883 () Bool)

(assert (=> b!1258660 (= c!122883 (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun bm!61894 () Bool)

(declare-fun call!61897 () ListLongMap!18697)

(assert (=> bm!61894 (= call!61897 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1258661 () Bool)

(declare-fun e!715799 () Bool)

(assert (=> b!1258661 (= e!715798 e!715799)))

(assert (=> b!1258661 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun res!838676 () Bool)

(assert (=> b!1258661 (= res!838676 (contains!7591 lt!569198 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258661 (=> (not res!838676) (not e!715799))))

(declare-fun b!1258662 () Bool)

(declare-fun lt!569193 () Unit!41869)

(declare-fun lt!569199 () Unit!41869)

(assert (=> b!1258662 (= lt!569193 lt!569199)))

(declare-fun lt!569197 () (_ BitVec 64))

(declare-fun lt!569196 () ListLongMap!18697)

(declare-fun lt!569195 () V!48111)

(declare-fun lt!569194 () (_ BitVec 64))

(assert (=> b!1258662 (not (contains!7591 (+!4239 lt!569196 (tuple2!20817 lt!569197 lt!569195)) lt!569194))))

(declare-fun addStillNotContains!319 (ListLongMap!18697 (_ BitVec 64) V!48111 (_ BitVec 64)) Unit!41869)

(assert (=> b!1258662 (= lt!569199 (addStillNotContains!319 lt!569196 lt!569197 lt!569195 lt!569194))))

(assert (=> b!1258662 (= lt!569194 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1258662 (= lt!569195 (get!20211 (select (arr!39454 _values!914) #b00000000000000000000000000000000) (dynLambda!3450 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1258662 (= lt!569197 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258662 (= lt!569196 call!61897)))

(declare-fun e!715800 () ListLongMap!18697)

(assert (=> b!1258662 (= e!715800 (+!4239 call!61897 (tuple2!20817 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000) (get!20211 (select (arr!39454 _values!914) #b00000000000000000000000000000000) (dynLambda!3450 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1258663 () Bool)

(declare-fun res!838677 () Bool)

(assert (=> b!1258663 (=> (not res!838677) (not e!715802))))

(assert (=> b!1258663 (= res!838677 (not (contains!7591 lt!569198 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1258664 () Bool)

(assert (=> b!1258664 (= e!715803 e!715800)))

(declare-fun c!122882 () Bool)

(assert (=> b!1258664 (= c!122882 (validKeyInArray!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258665 () Bool)

(assert (=> b!1258665 (= e!715803 (ListLongMap!18698 Nil!28041))))

(declare-fun b!1258666 () Bool)

(assert (=> b!1258666 (= e!715802 e!715798)))

(declare-fun c!122881 () Bool)

(declare-fun e!715801 () Bool)

(assert (=> b!1258666 (= c!122881 e!715801)))

(declare-fun res!838678 () Bool)

(assert (=> b!1258666 (=> (not res!838678) (not e!715801))))

(assert (=> b!1258666 (= res!838678 (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun b!1258667 () Bool)

(assert (=> b!1258667 (= e!715801 (validKeyInArray!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258667 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1258668 () Bool)

(assert (=> b!1258668 (= e!715800 call!61897)))

(declare-fun b!1258669 () Bool)

(assert (=> b!1258669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(assert (=> b!1258669 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39991 _values!914)))))

(assert (=> b!1258669 (= e!715799 (= (apply!998 lt!569198 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)) (get!20211 (select (arr!39454 _values!914) #b00000000000000000000000000000000) (dynLambda!3450 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1258670 () Bool)

(declare-fun isEmpty!1035 (ListLongMap!18697) Bool)

(assert (=> b!1258670 (= e!715804 (isEmpty!1035 lt!569198))))

(assert (= (and d!138691 c!122884) b!1258665))

(assert (= (and d!138691 (not c!122884)) b!1258664))

(assert (= (and b!1258664 c!122882) b!1258662))

(assert (= (and b!1258664 (not c!122882)) b!1258668))

(assert (= (or b!1258662 b!1258668) bm!61894))

(assert (= (and d!138691 res!838675) b!1258663))

(assert (= (and b!1258663 res!838677) b!1258666))

(assert (= (and b!1258666 res!838678) b!1258667))

(assert (= (and b!1258666 c!122881) b!1258661))

(assert (= (and b!1258666 (not c!122881)) b!1258660))

(assert (= (and b!1258661 res!838676) b!1258669))

(assert (= (and b!1258660 c!122883) b!1258659))

(assert (= (and b!1258660 (not c!122883)) b!1258670))

(declare-fun b_lambda!22683 () Bool)

(assert (=> (not b_lambda!22683) (not b!1258662)))

(assert (=> b!1258662 t!41531))

(declare-fun b_and!45023 () Bool)

(assert (= b_and!45021 (and (=> t!41531 result!23315) b_and!45023)))

(declare-fun b_lambda!22685 () Bool)

(assert (=> (not b_lambda!22685) (not b!1258669)))

(assert (=> b!1258669 t!41531))

(declare-fun b_and!45025 () Bool)

(assert (= b_and!45023 (and (=> t!41531 result!23315) b_and!45025)))

(declare-fun m!1159575 () Bool)

(assert (=> b!1258659 m!1159575))

(assert (=> b!1258669 m!1159563))

(assert (=> b!1258669 m!1159543))

(assert (=> b!1258669 m!1159543))

(declare-fun m!1159577 () Bool)

(assert (=> b!1258669 m!1159577))

(assert (=> b!1258669 m!1159561))

(assert (=> b!1258669 m!1159561))

(assert (=> b!1258669 m!1159563))

(assert (=> b!1258669 m!1159565))

(assert (=> b!1258661 m!1159543))

(assert (=> b!1258661 m!1159543))

(declare-fun m!1159579 () Bool)

(assert (=> b!1258661 m!1159579))

(declare-fun m!1159581 () Bool)

(assert (=> b!1258662 m!1159581))

(assert (=> b!1258662 m!1159563))

(assert (=> b!1258662 m!1159543))

(declare-fun m!1159583 () Bool)

(assert (=> b!1258662 m!1159583))

(declare-fun m!1159585 () Bool)

(assert (=> b!1258662 m!1159585))

(declare-fun m!1159587 () Bool)

(assert (=> b!1258662 m!1159587))

(assert (=> b!1258662 m!1159583))

(assert (=> b!1258662 m!1159561))

(assert (=> b!1258662 m!1159561))

(assert (=> b!1258662 m!1159563))

(assert (=> b!1258662 m!1159565))

(declare-fun m!1159589 () Bool)

(assert (=> b!1258670 m!1159589))

(assert (=> b!1258667 m!1159543))

(assert (=> b!1258667 m!1159543))

(assert (=> b!1258667 m!1159559))

(assert (=> b!1258664 m!1159543))

(assert (=> b!1258664 m!1159543))

(assert (=> b!1258664 m!1159559))

(declare-fun m!1159591 () Bool)

(assert (=> d!138691 m!1159591))

(assert (=> d!138691 m!1159429))

(assert (=> bm!61894 m!1159575))

(declare-fun m!1159593 () Bool)

(assert (=> b!1258663 m!1159593))

(assert (=> b!1258505 d!138691))

(declare-fun d!138693 () Bool)

(declare-fun e!715809 () Bool)

(assert (=> d!138693 e!715809))

(declare-fun res!838679 () Bool)

(assert (=> d!138693 (=> (not res!838679) (not e!715809))))

(declare-fun lt!569205 () ListLongMap!18697)

(assert (=> d!138693 (= res!838679 (not (contains!7591 lt!569205 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!715810 () ListLongMap!18697)

(assert (=> d!138693 (= lt!569205 e!715810)))

(declare-fun c!122888 () Bool)

(assert (=> d!138693 (= c!122888 (bvsge #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(assert (=> d!138693 (validMask!0 mask!1466)))

(assert (=> d!138693 (= (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) lt!569205)))

(declare-fun b!1258671 () Bool)

(declare-fun e!715811 () Bool)

(assert (=> b!1258671 (= e!715811 (= lt!569205 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922)))))

(declare-fun b!1258672 () Bool)

(declare-fun e!715805 () Bool)

(assert (=> b!1258672 (= e!715805 e!715811)))

(declare-fun c!122887 () Bool)

(assert (=> b!1258672 (= c!122887 (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun call!61898 () ListLongMap!18697)

(declare-fun bm!61895 () Bool)

(assert (=> bm!61895 (= call!61898 (getCurrentListMapNoExtraKeys!5780 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!922))))

(declare-fun b!1258673 () Bool)

(declare-fun e!715806 () Bool)

(assert (=> b!1258673 (= e!715805 e!715806)))

(assert (=> b!1258673 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun res!838680 () Bool)

(assert (=> b!1258673 (= res!838680 (contains!7591 lt!569205 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258673 (=> (not res!838680) (not e!715806))))

(declare-fun b!1258674 () Bool)

(declare-fun lt!569200 () Unit!41869)

(declare-fun lt!569206 () Unit!41869)

(assert (=> b!1258674 (= lt!569200 lt!569206)))

(declare-fun lt!569204 () (_ BitVec 64))

(declare-fun lt!569202 () V!48111)

(declare-fun lt!569201 () (_ BitVec 64))

(declare-fun lt!569203 () ListLongMap!18697)

(assert (=> b!1258674 (not (contains!7591 (+!4239 lt!569203 (tuple2!20817 lt!569204 lt!569202)) lt!569201))))

(assert (=> b!1258674 (= lt!569206 (addStillNotContains!319 lt!569203 lt!569204 lt!569202 lt!569201))))

(assert (=> b!1258674 (= lt!569201 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!1258674 (= lt!569202 (get!20211 (select (arr!39454 _values!914) #b00000000000000000000000000000000) (dynLambda!3450 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1258674 (= lt!569204 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> b!1258674 (= lt!569203 call!61898)))

(declare-fun e!715807 () ListLongMap!18697)

(assert (=> b!1258674 (= e!715807 (+!4239 call!61898 (tuple2!20817 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000) (get!20211 (select (arr!39454 _values!914) #b00000000000000000000000000000000) (dynLambda!3450 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1258675 () Bool)

(declare-fun res!838681 () Bool)

(assert (=> b!1258675 (=> (not res!838681) (not e!715809))))

(assert (=> b!1258675 (= res!838681 (not (contains!7591 lt!569205 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1258676 () Bool)

(assert (=> b!1258676 (= e!715810 e!715807)))

(declare-fun c!122886 () Bool)

(assert (=> b!1258676 (= c!122886 (validKeyInArray!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258677 () Bool)

(assert (=> b!1258677 (= e!715810 (ListLongMap!18698 Nil!28041))))

(declare-fun b!1258678 () Bool)

(assert (=> b!1258678 (= e!715809 e!715805)))

(declare-fun c!122885 () Bool)

(declare-fun e!715808 () Bool)

(assert (=> b!1258678 (= c!122885 e!715808)))

(declare-fun res!838682 () Bool)

(assert (=> b!1258678 (=> (not res!838682) (not e!715808))))

(assert (=> b!1258678 (= res!838682 (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(declare-fun b!1258679 () Bool)

(assert (=> b!1258679 (= e!715808 (validKeyInArray!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(assert (=> b!1258679 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!1258680 () Bool)

(assert (=> b!1258680 (= e!715807 call!61898)))

(declare-fun b!1258681 () Bool)

(assert (=> b!1258681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(assert (=> b!1258681 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!39991 _values!914)))))

(assert (=> b!1258681 (= e!715806 (= (apply!998 lt!569205 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)) (get!20211 (select (arr!39454 _values!914) #b00000000000000000000000000000000) (dynLambda!3450 defaultEntry!922 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1258682 () Bool)

(assert (=> b!1258682 (= e!715811 (isEmpty!1035 lt!569205))))

(assert (= (and d!138693 c!122888) b!1258677))

(assert (= (and d!138693 (not c!122888)) b!1258676))

(assert (= (and b!1258676 c!122886) b!1258674))

(assert (= (and b!1258676 (not c!122886)) b!1258680))

(assert (= (or b!1258674 b!1258680) bm!61895))

(assert (= (and d!138693 res!838679) b!1258675))

(assert (= (and b!1258675 res!838681) b!1258678))

(assert (= (and b!1258678 res!838682) b!1258679))

(assert (= (and b!1258678 c!122885) b!1258673))

(assert (= (and b!1258678 (not c!122885)) b!1258672))

(assert (= (and b!1258673 res!838680) b!1258681))

(assert (= (and b!1258672 c!122887) b!1258671))

(assert (= (and b!1258672 (not c!122887)) b!1258682))

(declare-fun b_lambda!22687 () Bool)

(assert (=> (not b_lambda!22687) (not b!1258674)))

(assert (=> b!1258674 t!41531))

(declare-fun b_and!45027 () Bool)

(assert (= b_and!45025 (and (=> t!41531 result!23315) b_and!45027)))

(declare-fun b_lambda!22689 () Bool)

(assert (=> (not b_lambda!22689) (not b!1258681)))

(assert (=> b!1258681 t!41531))

(declare-fun b_and!45029 () Bool)

(assert (= b_and!45027 (and (=> t!41531 result!23315) b_and!45029)))

(declare-fun m!1159595 () Bool)

(assert (=> b!1258671 m!1159595))

(assert (=> b!1258681 m!1159563))

(assert (=> b!1258681 m!1159543))

(assert (=> b!1258681 m!1159543))

(declare-fun m!1159597 () Bool)

(assert (=> b!1258681 m!1159597))

(assert (=> b!1258681 m!1159561))

(assert (=> b!1258681 m!1159561))

(assert (=> b!1258681 m!1159563))

(assert (=> b!1258681 m!1159565))

(assert (=> b!1258673 m!1159543))

(assert (=> b!1258673 m!1159543))

(declare-fun m!1159599 () Bool)

(assert (=> b!1258673 m!1159599))

(declare-fun m!1159601 () Bool)

(assert (=> b!1258674 m!1159601))

(assert (=> b!1258674 m!1159563))

(assert (=> b!1258674 m!1159543))

(declare-fun m!1159603 () Bool)

(assert (=> b!1258674 m!1159603))

(declare-fun m!1159605 () Bool)

(assert (=> b!1258674 m!1159605))

(declare-fun m!1159607 () Bool)

(assert (=> b!1258674 m!1159607))

(assert (=> b!1258674 m!1159603))

(assert (=> b!1258674 m!1159561))

(assert (=> b!1258674 m!1159561))

(assert (=> b!1258674 m!1159563))

(assert (=> b!1258674 m!1159565))

(declare-fun m!1159609 () Bool)

(assert (=> b!1258682 m!1159609))

(assert (=> b!1258679 m!1159543))

(assert (=> b!1258679 m!1159543))

(assert (=> b!1258679 m!1159559))

(assert (=> b!1258676 m!1159543))

(assert (=> b!1258676 m!1159543))

(assert (=> b!1258676 m!1159559))

(declare-fun m!1159611 () Bool)

(assert (=> d!138693 m!1159611))

(assert (=> d!138693 m!1159429))

(assert (=> bm!61895 m!1159595))

(declare-fun m!1159613 () Bool)

(assert (=> b!1258675 m!1159613))

(assert (=> b!1258505 d!138693))

(declare-fun d!138695 () Bool)

(declare-fun res!838691 () Bool)

(declare-fun e!715820 () Bool)

(assert (=> d!138695 (=> res!838691 e!715820)))

(assert (=> d!138695 (= res!838691 (bvsge #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(assert (=> d!138695 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28040) e!715820)))

(declare-fun bm!61898 () Bool)

(declare-fun call!61901 () Bool)

(declare-fun c!122891 () Bool)

(assert (=> bm!61898 (= call!61901 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122891 (Cons!28039 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000) Nil!28040) Nil!28040)))))

(declare-fun b!1258693 () Bool)

(declare-fun e!715823 () Bool)

(assert (=> b!1258693 (= e!715823 call!61901)))

(declare-fun b!1258694 () Bool)

(declare-fun e!715821 () Bool)

(declare-fun contains!7593 (List!28043 (_ BitVec 64)) Bool)

(assert (=> b!1258694 (= e!715821 (contains!7593 Nil!28040 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258695 () Bool)

(declare-fun e!715822 () Bool)

(assert (=> b!1258695 (= e!715822 e!715823)))

(assert (=> b!1258695 (= c!122891 (validKeyInArray!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258696 () Bool)

(assert (=> b!1258696 (= e!715820 e!715822)))

(declare-fun res!838689 () Bool)

(assert (=> b!1258696 (=> (not res!838689) (not e!715822))))

(assert (=> b!1258696 (= res!838689 (not e!715821))))

(declare-fun res!838690 () Bool)

(assert (=> b!1258696 (=> (not res!838690) (not e!715821))))

(assert (=> b!1258696 (= res!838690 (validKeyInArray!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1258697 () Bool)

(assert (=> b!1258697 (= e!715823 call!61901)))

(assert (= (and d!138695 (not res!838691)) b!1258696))

(assert (= (and b!1258696 res!838690) b!1258694))

(assert (= (and b!1258696 res!838689) b!1258695))

(assert (= (and b!1258695 c!122891) b!1258693))

(assert (= (and b!1258695 (not c!122891)) b!1258697))

(assert (= (or b!1258693 b!1258697) bm!61898))

(assert (=> bm!61898 m!1159543))

(declare-fun m!1159615 () Bool)

(assert (=> bm!61898 m!1159615))

(assert (=> b!1258694 m!1159543))

(assert (=> b!1258694 m!1159543))

(declare-fun m!1159617 () Bool)

(assert (=> b!1258694 m!1159617))

(assert (=> b!1258695 m!1159543))

(assert (=> b!1258695 m!1159543))

(assert (=> b!1258695 m!1159559))

(assert (=> b!1258696 m!1159543))

(assert (=> b!1258696 m!1159543))

(assert (=> b!1258696 m!1159559))

(assert (=> b!1258500 d!138695))

(declare-fun b!1258706 () Bool)

(declare-fun e!715832 () Bool)

(declare-fun e!715831 () Bool)

(assert (=> b!1258706 (= e!715832 e!715831)))

(declare-fun c!122894 () Bool)

(assert (=> b!1258706 (= c!122894 (validKeyInArray!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61901 () Bool)

(declare-fun call!61904 () Bool)

(assert (=> bm!61901 (= call!61904 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1258707 () Bool)

(declare-fun e!715830 () Bool)

(assert (=> b!1258707 (= e!715830 call!61904)))

(declare-fun b!1258708 () Bool)

(assert (=> b!1258708 (= e!715831 call!61904)))

(declare-fun b!1258709 () Bool)

(assert (=> b!1258709 (= e!715831 e!715830)))

(declare-fun lt!569215 () (_ BitVec 64))

(assert (=> b!1258709 (= lt!569215 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000))))

(declare-fun lt!569213 () Unit!41869)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!81799 (_ BitVec 64) (_ BitVec 32)) Unit!41869)

(assert (=> b!1258709 (= lt!569213 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!569215 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!81799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1258709 (arrayContainsKey!0 _keys!1118 lt!569215 #b00000000000000000000000000000000)))

(declare-fun lt!569214 () Unit!41869)

(assert (=> b!1258709 (= lt!569214 lt!569213)))

(declare-fun res!838697 () Bool)

(declare-datatypes ((SeekEntryResult!9923 0))(
  ( (MissingZero!9923 (index!42063 (_ BitVec 32))) (Found!9923 (index!42064 (_ BitVec 32))) (Intermediate!9923 (undefined!10735 Bool) (index!42065 (_ BitVec 32)) (x!110695 (_ BitVec 32))) (Undefined!9923) (MissingVacant!9923 (index!42066 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!81799 (_ BitVec 32)) SeekEntryResult!9923)

(assert (=> b!1258709 (= res!838697 (= (seekEntryOrOpen!0 (select (arr!39453 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9923 #b00000000000000000000000000000000)))))

(assert (=> b!1258709 (=> (not res!838697) (not e!715830))))

(declare-fun d!138697 () Bool)

(declare-fun res!838696 () Bool)

(assert (=> d!138697 (=> res!838696 e!715832)))

(assert (=> d!138697 (= res!838696 (bvsge #b00000000000000000000000000000000 (size!39990 _keys!1118)))))

(assert (=> d!138697 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!715832)))

(assert (= (and d!138697 (not res!838696)) b!1258706))

(assert (= (and b!1258706 c!122894) b!1258709))

(assert (= (and b!1258706 (not c!122894)) b!1258708))

(assert (= (and b!1258709 res!838697) b!1258707))

(assert (= (or b!1258707 b!1258708) bm!61901))

(assert (=> b!1258706 m!1159543))

(assert (=> b!1258706 m!1159543))

(assert (=> b!1258706 m!1159559))

(declare-fun m!1159619 () Bool)

(assert (=> bm!61901 m!1159619))

(assert (=> b!1258709 m!1159543))

(declare-fun m!1159621 () Bool)

(assert (=> b!1258709 m!1159621))

(declare-fun m!1159623 () Bool)

(assert (=> b!1258709 m!1159623))

(assert (=> b!1258709 m!1159543))

(declare-fun m!1159625 () Bool)

(assert (=> b!1258709 m!1159625))

(assert (=> b!1258503 d!138697))

(declare-fun b!1258717 () Bool)

(declare-fun e!715837 () Bool)

(assert (=> b!1258717 (= e!715837 tp_is_empty!32059)))

(declare-fun condMapEmpty!49885 () Bool)

(declare-fun mapDefault!49885 () ValueCell!15266)

(assert (=> mapNonEmpty!49876 (= condMapEmpty!49885 (= mapRest!49876 ((as const (Array (_ BitVec 32) ValueCell!15266)) mapDefault!49885)))))

(declare-fun mapRes!49885 () Bool)

(assert (=> mapNonEmpty!49876 (= tp!94988 (and e!715837 mapRes!49885))))

(declare-fun b!1258716 () Bool)

(declare-fun e!715838 () Bool)

(assert (=> b!1258716 (= e!715838 tp_is_empty!32059)))

(declare-fun mapNonEmpty!49885 () Bool)

(declare-fun tp!95003 () Bool)

(assert (=> mapNonEmpty!49885 (= mapRes!49885 (and tp!95003 e!715838))))

(declare-fun mapValue!49885 () ValueCell!15266)

(declare-fun mapRest!49885 () (Array (_ BitVec 32) ValueCell!15266))

(declare-fun mapKey!49885 () (_ BitVec 32))

(assert (=> mapNonEmpty!49885 (= mapRest!49876 (store mapRest!49885 mapKey!49885 mapValue!49885))))

(declare-fun mapIsEmpty!49885 () Bool)

(assert (=> mapIsEmpty!49885 mapRes!49885))

(assert (= (and mapNonEmpty!49876 condMapEmpty!49885) mapIsEmpty!49885))

(assert (= (and mapNonEmpty!49876 (not condMapEmpty!49885)) mapNonEmpty!49885))

(assert (= (and mapNonEmpty!49885 ((_ is ValueCellFull!15266) mapValue!49885)) b!1258716))

(assert (= (and mapNonEmpty!49876 ((_ is ValueCellFull!15266) mapDefault!49885)) b!1258717))

(declare-fun m!1159627 () Bool)

(assert (=> mapNonEmpty!49885 m!1159627))

(declare-fun b_lambda!22691 () Bool)

(assert (= b_lambda!22681 (or (and start!105744 b_free!27157) b_lambda!22691)))

(declare-fun b_lambda!22693 () Bool)

(assert (= b_lambda!22689 (or (and start!105744 b_free!27157) b_lambda!22693)))

(declare-fun b_lambda!22695 () Bool)

(assert (= b_lambda!22685 (or (and start!105744 b_free!27157) b_lambda!22695)))

(declare-fun b_lambda!22697 () Bool)

(assert (= b_lambda!22683 (or (and start!105744 b_free!27157) b_lambda!22697)))

(declare-fun b_lambda!22699 () Bool)

(assert (= b_lambda!22687 (or (and start!105744 b_free!27157) b_lambda!22699)))

(check-sat (not b!1258629) (not b!1258673) (not bm!61885) (not bm!61894) (not b!1258676) (not b!1258706) (not bm!61889) (not b!1258661) (not d!138681) (not d!138689) (not b_lambda!22695) (not b!1258671) (not bm!61887) (not b!1258621) (not b_next!27157) (not b!1258623) (not b!1258682) (not b!1258696) (not b!1258662) (not b!1258667) (not b!1258709) (not b_lambda!22697) (not b!1258669) (not b!1258674) (not b!1258567) (not b!1258670) (not b!1258664) (not b_lambda!22693) (not b_lambda!22699) (not b!1258659) (not b!1258663) (not b!1258695) (not mapNonEmpty!49885) (not d!138675) (not d!138693) (not b!1258618) (not bm!61891) (not d!138677) (not bm!61901) (not d!138679) (not b!1258681) b_and!45029 (not b!1258631) (not b!1258628) (not b!1258569) (not b!1258694) (not b!1258675) (not bm!61895) (not b!1258614) (not d!138691) (not b!1258632) (not bm!61898) tp_is_empty!32059 (not b!1258679) (not b_lambda!22691))
(check-sat b_and!45029 (not b_next!27157))
