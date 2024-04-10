; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93586 () Bool)

(assert start!93586)

(declare-fun b!1059097 () Bool)

(declare-fun e!602717 () Bool)

(declare-fun tp_is_empty!24921 () Bool)

(assert (=> b!1059097 (= e!602717 tp_is_empty!24921)))

(declare-fun b!1059098 () Bool)

(declare-fun e!602718 () Bool)

(declare-fun mapRes!39037 () Bool)

(assert (=> b!1059098 (= e!602718 (and e!602717 mapRes!39037))))

(declare-fun condMapEmpty!39037 () Bool)

(declare-datatypes ((V!38363 0))(
  ( (V!38364 (val!12511 Int)) )
))
(declare-datatypes ((ValueCell!11757 0))(
  ( (ValueCellFull!11757 (v!15120 V!38363)) (EmptyCell!11757) )
))
(declare-datatypes ((array!66867 0))(
  ( (array!66868 (arr!32146 (Array (_ BitVec 32) ValueCell!11757)) (size!32682 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66867)

(declare-fun mapDefault!39037 () ValueCell!11757)

(assert (=> b!1059098 (= condMapEmpty!39037 (= (arr!32146 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11757)) mapDefault!39037)))))

(declare-fun b!1059099 () Bool)

(declare-fun res!707536 () Bool)

(declare-fun e!602715 () Bool)

(assert (=> b!1059099 (=> (not res!707536) (not e!602715))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66869 0))(
  ( (array!66870 (arr!32147 (Array (_ BitVec 32) (_ BitVec 64))) (size!32683 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66869)

(assert (=> b!1059099 (= res!707536 (and (= (size!32682 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32683 _keys!1163) (size!32682 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059100 () Bool)

(declare-fun res!707537 () Bool)

(assert (=> b!1059100 (=> (not res!707537) (not e!602715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66869 (_ BitVec 32)) Bool)

(assert (=> b!1059100 (= res!707537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059101 () Bool)

(declare-fun e!602716 () Bool)

(assert (=> b!1059101 (= e!602716 tp_is_empty!24921)))

(declare-fun res!707535 () Bool)

(assert (=> start!93586 (=> (not res!707535) (not e!602715))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93586 (= res!707535 (validMask!0 mask!1515))))

(assert (=> start!93586 e!602715))

(assert (=> start!93586 true))

(declare-fun array_inv!24924 (array!66867) Bool)

(assert (=> start!93586 (and (array_inv!24924 _values!955) e!602718)))

(declare-fun array_inv!24925 (array!66869) Bool)

(assert (=> start!93586 (array_inv!24925 _keys!1163)))

(declare-fun mapNonEmpty!39037 () Bool)

(declare-fun tp!74843 () Bool)

(assert (=> mapNonEmpty!39037 (= mapRes!39037 (and tp!74843 e!602716))))

(declare-fun mapKey!39037 () (_ BitVec 32))

(declare-fun mapRest!39037 () (Array (_ BitVec 32) ValueCell!11757))

(declare-fun mapValue!39037 () ValueCell!11757)

(assert (=> mapNonEmpty!39037 (= (arr!32146 _values!955) (store mapRest!39037 mapKey!39037 mapValue!39037))))

(declare-fun b!1059102 () Bool)

(assert (=> b!1059102 (= e!602715 (and (bvsle #b00000000000000000000000000000000 (size!32683 _keys!1163)) (bvsge (size!32683 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!39037 () Bool)

(assert (=> mapIsEmpty!39037 mapRes!39037))

(assert (= (and start!93586 res!707535) b!1059099))

(assert (= (and b!1059099 res!707536) b!1059100))

(assert (= (and b!1059100 res!707537) b!1059102))

(assert (= (and b!1059098 condMapEmpty!39037) mapIsEmpty!39037))

(assert (= (and b!1059098 (not condMapEmpty!39037)) mapNonEmpty!39037))

(get-info :version)

(assert (= (and mapNonEmpty!39037 ((_ is ValueCellFull!11757) mapValue!39037)) b!1059101))

(assert (= (and b!1059098 ((_ is ValueCellFull!11757) mapDefault!39037)) b!1059097))

(assert (= start!93586 b!1059098))

(declare-fun m!978647 () Bool)

(assert (=> b!1059100 m!978647))

(declare-fun m!978649 () Bool)

(assert (=> start!93586 m!978649))

(declare-fun m!978651 () Bool)

(assert (=> start!93586 m!978651))

(declare-fun m!978653 () Bool)

(assert (=> start!93586 m!978653))

(declare-fun m!978655 () Bool)

(assert (=> mapNonEmpty!39037 m!978655))

(check-sat (not start!93586) (not b!1059100) (not mapNonEmpty!39037) tp_is_empty!24921)
(check-sat)
(get-model)

(declare-fun d!128693 () Bool)

(assert (=> d!128693 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93586 d!128693))

(declare-fun d!128695 () Bool)

(assert (=> d!128695 (= (array_inv!24924 _values!955) (bvsge (size!32682 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93586 d!128695))

(declare-fun d!128697 () Bool)

(assert (=> d!128697 (= (array_inv!24925 _keys!1163) (bvsge (size!32683 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93586 d!128697))

(declare-fun b!1059129 () Bool)

(declare-fun e!602741 () Bool)

(declare-fun call!44878 () Bool)

(assert (=> b!1059129 (= e!602741 call!44878)))

(declare-fun b!1059130 () Bool)

(declare-fun e!602743 () Bool)

(declare-fun e!602742 () Bool)

(assert (=> b!1059130 (= e!602743 e!602742)))

(declare-fun c!107187 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059130 (= c!107187 (validKeyInArray!0 (select (arr!32147 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1059131 () Bool)

(assert (=> b!1059131 (= e!602742 call!44878)))

(declare-fun b!1059132 () Bool)

(assert (=> b!1059132 (= e!602742 e!602741)))

(declare-fun lt!467085 () (_ BitVec 64))

(assert (=> b!1059132 (= lt!467085 (select (arr!32147 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34720 0))(
  ( (Unit!34721) )
))
(declare-fun lt!467084 () Unit!34720)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66869 (_ BitVec 64) (_ BitVec 32)) Unit!34720)

(assert (=> b!1059132 (= lt!467084 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467085 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66869 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059132 (arrayContainsKey!0 _keys!1163 lt!467085 #b00000000000000000000000000000000)))

(declare-fun lt!467083 () Unit!34720)

(assert (=> b!1059132 (= lt!467083 lt!467084)))

(declare-fun res!707552 () Bool)

(declare-datatypes ((SeekEntryResult!9866 0))(
  ( (MissingZero!9866 (index!41835 (_ BitVec 32))) (Found!9866 (index!41836 (_ BitVec 32))) (Intermediate!9866 (undefined!10678 Bool) (index!41837 (_ BitVec 32)) (x!94633 (_ BitVec 32))) (Undefined!9866) (MissingVacant!9866 (index!41838 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66869 (_ BitVec 32)) SeekEntryResult!9866)

(assert (=> b!1059132 (= res!707552 (= (seekEntryOrOpen!0 (select (arr!32147 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9866 #b00000000000000000000000000000000)))))

(assert (=> b!1059132 (=> (not res!707552) (not e!602741))))

(declare-fun bm!44875 () Bool)

(assert (=> bm!44875 (= call!44878 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!128699 () Bool)

(declare-fun res!707551 () Bool)

(assert (=> d!128699 (=> res!707551 e!602743)))

(assert (=> d!128699 (= res!707551 (bvsge #b00000000000000000000000000000000 (size!32683 _keys!1163)))))

(assert (=> d!128699 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!602743)))

(assert (= (and d!128699 (not res!707551)) b!1059130))

(assert (= (and b!1059130 c!107187) b!1059132))

(assert (= (and b!1059130 (not c!107187)) b!1059131))

(assert (= (and b!1059132 res!707552) b!1059129))

(assert (= (or b!1059129 b!1059131) bm!44875))

(declare-fun m!978667 () Bool)

(assert (=> b!1059130 m!978667))

(assert (=> b!1059130 m!978667))

(declare-fun m!978669 () Bool)

(assert (=> b!1059130 m!978669))

(assert (=> b!1059132 m!978667))

(declare-fun m!978671 () Bool)

(assert (=> b!1059132 m!978671))

(declare-fun m!978673 () Bool)

(assert (=> b!1059132 m!978673))

(assert (=> b!1059132 m!978667))

(declare-fun m!978675 () Bool)

(assert (=> b!1059132 m!978675))

(declare-fun m!978677 () Bool)

(assert (=> bm!44875 m!978677))

(assert (=> b!1059100 d!128699))

(declare-fun b!1059140 () Bool)

(declare-fun e!602749 () Bool)

(assert (=> b!1059140 (= e!602749 tp_is_empty!24921)))

(declare-fun mapNonEmpty!39043 () Bool)

(declare-fun mapRes!39043 () Bool)

(declare-fun tp!74849 () Bool)

(declare-fun e!602748 () Bool)

(assert (=> mapNonEmpty!39043 (= mapRes!39043 (and tp!74849 e!602748))))

(declare-fun mapValue!39043 () ValueCell!11757)

(declare-fun mapKey!39043 () (_ BitVec 32))

(declare-fun mapRest!39043 () (Array (_ BitVec 32) ValueCell!11757))

(assert (=> mapNonEmpty!39043 (= mapRest!39037 (store mapRest!39043 mapKey!39043 mapValue!39043))))

(declare-fun mapIsEmpty!39043 () Bool)

(assert (=> mapIsEmpty!39043 mapRes!39043))

(declare-fun condMapEmpty!39043 () Bool)

(declare-fun mapDefault!39043 () ValueCell!11757)

(assert (=> mapNonEmpty!39037 (= condMapEmpty!39043 (= mapRest!39037 ((as const (Array (_ BitVec 32) ValueCell!11757)) mapDefault!39043)))))

(assert (=> mapNonEmpty!39037 (= tp!74843 (and e!602749 mapRes!39043))))

(declare-fun b!1059139 () Bool)

(assert (=> b!1059139 (= e!602748 tp_is_empty!24921)))

(assert (= (and mapNonEmpty!39037 condMapEmpty!39043) mapIsEmpty!39043))

(assert (= (and mapNonEmpty!39037 (not condMapEmpty!39043)) mapNonEmpty!39043))

(assert (= (and mapNonEmpty!39043 ((_ is ValueCellFull!11757) mapValue!39043)) b!1059139))

(assert (= (and mapNonEmpty!39037 ((_ is ValueCellFull!11757) mapDefault!39043)) b!1059140))

(declare-fun m!978679 () Bool)

(assert (=> mapNonEmpty!39043 m!978679))

(check-sat (not mapNonEmpty!39043) (not bm!44875) (not b!1059132) (not b!1059130) tp_is_empty!24921)
(check-sat)
