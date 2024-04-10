; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93600 () Bool)

(assert start!93600)

(declare-fun b!1059176 () Bool)

(declare-fun e!602778 () Bool)

(declare-fun e!602779 () Bool)

(declare-fun mapRes!39049 () Bool)

(assert (=> b!1059176 (= e!602778 (and e!602779 mapRes!39049))))

(declare-fun condMapEmpty!39049 () Bool)

(declare-datatypes ((V!38371 0))(
  ( (V!38372 (val!12514 Int)) )
))
(declare-datatypes ((ValueCell!11760 0))(
  ( (ValueCellFull!11760 (v!15123 V!38371)) (EmptyCell!11760) )
))
(declare-datatypes ((array!66881 0))(
  ( (array!66882 (arr!32152 (Array (_ BitVec 32) ValueCell!11760)) (size!32688 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66881)

(declare-fun mapDefault!39049 () ValueCell!11760)

(assert (=> b!1059176 (= condMapEmpty!39049 (= (arr!32152 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11760)) mapDefault!39049)))))

(declare-fun mapIsEmpty!39049 () Bool)

(assert (=> mapIsEmpty!39049 mapRes!39049))

(declare-fun b!1059178 () Bool)

(declare-fun res!707573 () Bool)

(declare-fun e!602776 () Bool)

(assert (=> b!1059178 (=> (not res!707573) (not e!602776))))

(declare-datatypes ((array!66883 0))(
  ( (array!66884 (arr!32153 (Array (_ BitVec 32) (_ BitVec 64))) (size!32689 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66883)

(assert (=> b!1059178 (= res!707573 (and (bvsle #b00000000000000000000000000000000 (size!32689 _keys!1163)) (bvslt (size!32689 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1059179 () Bool)

(declare-fun tp_is_empty!24927 () Bool)

(assert (=> b!1059179 (= e!602779 tp_is_empty!24927)))

(declare-fun b!1059177 () Bool)

(declare-fun res!707576 () Bool)

(assert (=> b!1059177 (=> (not res!707576) (not e!602776))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66883 (_ BitVec 32)) Bool)

(assert (=> b!1059177 (= res!707576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!707574 () Bool)

(assert (=> start!93600 (=> (not res!707574) (not e!602776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93600 (= res!707574 (validMask!0 mask!1515))))

(assert (=> start!93600 e!602776))

(assert (=> start!93600 true))

(declare-fun array_inv!24928 (array!66881) Bool)

(assert (=> start!93600 (and (array_inv!24928 _values!955) e!602778)))

(declare-fun array_inv!24929 (array!66883) Bool)

(assert (=> start!93600 (array_inv!24929 _keys!1163)))

(declare-fun mapNonEmpty!39049 () Bool)

(declare-fun tp!74855 () Bool)

(declare-fun e!602775 () Bool)

(assert (=> mapNonEmpty!39049 (= mapRes!39049 (and tp!74855 e!602775))))

(declare-fun mapKey!39049 () (_ BitVec 32))

(declare-fun mapRest!39049 () (Array (_ BitVec 32) ValueCell!11760))

(declare-fun mapValue!39049 () ValueCell!11760)

(assert (=> mapNonEmpty!39049 (= (arr!32152 _values!955) (store mapRest!39049 mapKey!39049 mapValue!39049))))

(declare-fun b!1059180 () Bool)

(declare-datatypes ((List!22422 0))(
  ( (Nil!22419) (Cons!22418 (h!23627 (_ BitVec 64)) (t!31729 List!22422)) )
))
(declare-fun noDuplicate!1569 (List!22422) Bool)

(assert (=> b!1059180 (= e!602776 (not (noDuplicate!1569 Nil!22419)))))

(declare-fun b!1059181 () Bool)

(assert (=> b!1059181 (= e!602775 tp_is_empty!24927)))

(declare-fun b!1059182 () Bool)

(declare-fun res!707575 () Bool)

(assert (=> b!1059182 (=> (not res!707575) (not e!602776))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059182 (= res!707575 (and (= (size!32688 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32689 _keys!1163) (size!32688 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (= (and start!93600 res!707574) b!1059182))

(assert (= (and b!1059182 res!707575) b!1059177))

(assert (= (and b!1059177 res!707576) b!1059178))

(assert (= (and b!1059178 res!707573) b!1059180))

(assert (= (and b!1059176 condMapEmpty!39049) mapIsEmpty!39049))

(assert (= (and b!1059176 (not condMapEmpty!39049)) mapNonEmpty!39049))

(get-info :version)

(assert (= (and mapNonEmpty!39049 ((_ is ValueCellFull!11760) mapValue!39049)) b!1059181))

(assert (= (and b!1059176 ((_ is ValueCellFull!11760) mapDefault!39049)) b!1059179))

(assert (= start!93600 b!1059176))

(declare-fun m!978693 () Bool)

(assert (=> b!1059177 m!978693))

(declare-fun m!978695 () Bool)

(assert (=> start!93600 m!978695))

(declare-fun m!978697 () Bool)

(assert (=> start!93600 m!978697))

(declare-fun m!978699 () Bool)

(assert (=> start!93600 m!978699))

(declare-fun m!978701 () Bool)

(assert (=> mapNonEmpty!39049 m!978701))

(declare-fun m!978703 () Bool)

(assert (=> b!1059180 m!978703))

(check-sat (not b!1059177) tp_is_empty!24927 (not mapNonEmpty!39049) (not b!1059180) (not start!93600))
(check-sat)
(get-model)

(declare-fun d!128703 () Bool)

(assert (=> d!128703 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93600 d!128703))

(declare-fun d!128705 () Bool)

(assert (=> d!128705 (= (array_inv!24928 _values!955) (bvsge (size!32688 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93600 d!128705))

(declare-fun d!128707 () Bool)

(assert (=> d!128707 (= (array_inv!24929 _keys!1163) (bvsge (size!32689 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93600 d!128707))

(declare-fun d!128709 () Bool)

(declare-fun res!707594 () Bool)

(declare-fun e!602803 () Bool)

(assert (=> d!128709 (=> res!707594 e!602803)))

(assert (=> d!128709 (= res!707594 (bvsge #b00000000000000000000000000000000 (size!32689 _keys!1163)))))

(assert (=> d!128709 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!602803)))

(declare-fun b!1059212 () Bool)

(declare-fun e!602802 () Bool)

(declare-fun e!602801 () Bool)

(assert (=> b!1059212 (= e!602802 e!602801)))

(declare-fun lt!467094 () (_ BitVec 64))

(assert (=> b!1059212 (= lt!467094 (select (arr!32153 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34722 0))(
  ( (Unit!34723) )
))
(declare-fun lt!467093 () Unit!34722)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66883 (_ BitVec 64) (_ BitVec 32)) Unit!34722)

(assert (=> b!1059212 (= lt!467093 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467094 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66883 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059212 (arrayContainsKey!0 _keys!1163 lt!467094 #b00000000000000000000000000000000)))

(declare-fun lt!467092 () Unit!34722)

(assert (=> b!1059212 (= lt!467092 lt!467093)))

(declare-fun res!707593 () Bool)

(declare-datatypes ((SeekEntryResult!9867 0))(
  ( (MissingZero!9867 (index!41839 (_ BitVec 32))) (Found!9867 (index!41840 (_ BitVec 32))) (Intermediate!9867 (undefined!10679 Bool) (index!41841 (_ BitVec 32)) (x!94644 (_ BitVec 32))) (Undefined!9867) (MissingVacant!9867 (index!41842 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66883 (_ BitVec 32)) SeekEntryResult!9867)

(assert (=> b!1059212 (= res!707593 (= (seekEntryOrOpen!0 (select (arr!32153 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9867 #b00000000000000000000000000000000)))))

(assert (=> b!1059212 (=> (not res!707593) (not e!602801))))

(declare-fun b!1059213 () Bool)

(assert (=> b!1059213 (= e!602803 e!602802)))

(declare-fun c!107190 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059213 (= c!107190 (validKeyInArray!0 (select (arr!32153 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44878 () Bool)

(declare-fun call!44881 () Bool)

(assert (=> bm!44878 (= call!44881 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1059214 () Bool)

(assert (=> b!1059214 (= e!602801 call!44881)))

(declare-fun b!1059215 () Bool)

(assert (=> b!1059215 (= e!602802 call!44881)))

(assert (= (and d!128709 (not res!707594)) b!1059213))

(assert (= (and b!1059213 c!107190) b!1059212))

(assert (= (and b!1059213 (not c!107190)) b!1059215))

(assert (= (and b!1059212 res!707593) b!1059214))

(assert (= (or b!1059214 b!1059215) bm!44878))

(declare-fun m!978717 () Bool)

(assert (=> b!1059212 m!978717))

(declare-fun m!978719 () Bool)

(assert (=> b!1059212 m!978719))

(declare-fun m!978721 () Bool)

(assert (=> b!1059212 m!978721))

(assert (=> b!1059212 m!978717))

(declare-fun m!978723 () Bool)

(assert (=> b!1059212 m!978723))

(assert (=> b!1059213 m!978717))

(assert (=> b!1059213 m!978717))

(declare-fun m!978725 () Bool)

(assert (=> b!1059213 m!978725))

(declare-fun m!978727 () Bool)

(assert (=> bm!44878 m!978727))

(assert (=> b!1059177 d!128709))

(declare-fun d!128711 () Bool)

(declare-fun res!707599 () Bool)

(declare-fun e!602808 () Bool)

(assert (=> d!128711 (=> res!707599 e!602808)))

(assert (=> d!128711 (= res!707599 ((_ is Nil!22419) Nil!22419))))

(assert (=> d!128711 (= (noDuplicate!1569 Nil!22419) e!602808)))

(declare-fun b!1059220 () Bool)

(declare-fun e!602809 () Bool)

(assert (=> b!1059220 (= e!602808 e!602809)))

(declare-fun res!707600 () Bool)

(assert (=> b!1059220 (=> (not res!707600) (not e!602809))))

(declare-fun contains!6213 (List!22422 (_ BitVec 64)) Bool)

(assert (=> b!1059220 (= res!707600 (not (contains!6213 (t!31729 Nil!22419) (h!23627 Nil!22419))))))

(declare-fun b!1059221 () Bool)

(assert (=> b!1059221 (= e!602809 (noDuplicate!1569 (t!31729 Nil!22419)))))

(assert (= (and d!128711 (not res!707599)) b!1059220))

(assert (= (and b!1059220 res!707600) b!1059221))

(declare-fun m!978729 () Bool)

(assert (=> b!1059220 m!978729))

(declare-fun m!978731 () Bool)

(assert (=> b!1059221 m!978731))

(assert (=> b!1059180 d!128711))

(declare-fun condMapEmpty!39055 () Bool)

(declare-fun mapDefault!39055 () ValueCell!11760)

(assert (=> mapNonEmpty!39049 (= condMapEmpty!39055 (= mapRest!39049 ((as const (Array (_ BitVec 32) ValueCell!11760)) mapDefault!39055)))))

(declare-fun e!602815 () Bool)

(declare-fun mapRes!39055 () Bool)

(assert (=> mapNonEmpty!39049 (= tp!74855 (and e!602815 mapRes!39055))))

(declare-fun mapNonEmpty!39055 () Bool)

(declare-fun tp!74861 () Bool)

(declare-fun e!602814 () Bool)

(assert (=> mapNonEmpty!39055 (= mapRes!39055 (and tp!74861 e!602814))))

(declare-fun mapValue!39055 () ValueCell!11760)

(declare-fun mapKey!39055 () (_ BitVec 32))

(declare-fun mapRest!39055 () (Array (_ BitVec 32) ValueCell!11760))

(assert (=> mapNonEmpty!39055 (= mapRest!39049 (store mapRest!39055 mapKey!39055 mapValue!39055))))

(declare-fun mapIsEmpty!39055 () Bool)

(assert (=> mapIsEmpty!39055 mapRes!39055))

(declare-fun b!1059228 () Bool)

(assert (=> b!1059228 (= e!602814 tp_is_empty!24927)))

(declare-fun b!1059229 () Bool)

(assert (=> b!1059229 (= e!602815 tp_is_empty!24927)))

(assert (= (and mapNonEmpty!39049 condMapEmpty!39055) mapIsEmpty!39055))

(assert (= (and mapNonEmpty!39049 (not condMapEmpty!39055)) mapNonEmpty!39055))

(assert (= (and mapNonEmpty!39055 ((_ is ValueCellFull!11760) mapValue!39055)) b!1059228))

(assert (= (and mapNonEmpty!39049 ((_ is ValueCellFull!11760) mapDefault!39055)) b!1059229))

(declare-fun m!978733 () Bool)

(assert (=> mapNonEmpty!39055 m!978733))

(check-sat (not b!1059213) (not b!1059220) (not b!1059221) (not bm!44878) (not mapNonEmpty!39055) tp_is_empty!24927 (not b!1059212))
(check-sat)
