; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93592 () Bool)

(assert start!93592)

(declare-fun b!1059002 () Bool)

(declare-fun e!602667 () Bool)

(declare-fun tp_is_empty!24925 () Bool)

(assert (=> b!1059002 (= e!602667 tp_is_empty!24925)))

(declare-fun b!1059003 () Bool)

(declare-fun e!602670 () Bool)

(assert (=> b!1059003 (= e!602670 tp_is_empty!24925)))

(declare-fun b!1059004 () Bool)

(declare-fun res!707493 () Bool)

(declare-fun e!602668 () Bool)

(assert (=> b!1059004 (=> (not res!707493) (not e!602668))))

(declare-datatypes ((array!66816 0))(
  ( (array!66817 (arr!32120 (Array (_ BitVec 32) (_ BitVec 64))) (size!32658 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66816)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66816 (_ BitVec 32)) Bool)

(assert (=> b!1059004 (= res!707493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun mapNonEmpty!39046 () Bool)

(declare-fun mapRes!39046 () Bool)

(declare-fun tp!74852 () Bool)

(assert (=> mapNonEmpty!39046 (= mapRes!39046 (and tp!74852 e!602667))))

(declare-datatypes ((V!38369 0))(
  ( (V!38370 (val!12513 Int)) )
))
(declare-datatypes ((ValueCell!11759 0))(
  ( (ValueCellFull!11759 (v!15121 V!38369)) (EmptyCell!11759) )
))
(declare-fun mapValue!39046 () ValueCell!11759)

(declare-datatypes ((array!66818 0))(
  ( (array!66819 (arr!32121 (Array (_ BitVec 32) ValueCell!11759)) (size!32659 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66818)

(declare-fun mapKey!39046 () (_ BitVec 32))

(declare-fun mapRest!39046 () (Array (_ BitVec 32) ValueCell!11759))

(assert (=> mapNonEmpty!39046 (= (arr!32121 _values!955) (store mapRest!39046 mapKey!39046 mapValue!39046))))

(declare-fun b!1059005 () Bool)

(declare-fun e!602671 () Bool)

(assert (=> b!1059005 (= e!602671 (and e!602670 mapRes!39046))))

(declare-fun condMapEmpty!39046 () Bool)

(declare-fun mapDefault!39046 () ValueCell!11759)

(assert (=> b!1059005 (= condMapEmpty!39046 (= (arr!32121 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11759)) mapDefault!39046)))))

(declare-fun res!707495 () Bool)

(assert (=> start!93592 (=> (not res!707495) (not e!602668))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93592 (= res!707495 (validMask!0 mask!1515))))

(assert (=> start!93592 e!602668))

(assert (=> start!93592 true))

(declare-fun array_inv!24902 (array!66818) Bool)

(assert (=> start!93592 (and (array_inv!24902 _values!955) e!602671)))

(declare-fun array_inv!24903 (array!66816) Bool)

(assert (=> start!93592 (array_inv!24903 _keys!1163)))

(declare-fun b!1059006 () Bool)

(declare-fun res!707494 () Bool)

(assert (=> b!1059006 (=> (not res!707494) (not e!602668))))

(assert (=> b!1059006 (= res!707494 (and (bvsle #b00000000000000000000000000000000 (size!32658 _keys!1163)) (bvslt (size!32658 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!39046 () Bool)

(assert (=> mapIsEmpty!39046 mapRes!39046))

(declare-fun b!1059007 () Bool)

(declare-fun res!707492 () Bool)

(assert (=> b!1059007 (=> (not res!707492) (not e!602668))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059007 (= res!707492 (and (= (size!32659 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32658 _keys!1163) (size!32659 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059008 () Bool)

(declare-datatypes ((List!22450 0))(
  ( (Nil!22447) (Cons!22446 (h!23655 (_ BitVec 64)) (t!31748 List!22450)) )
))
(declare-fun noDuplicate!1582 (List!22450) Bool)

(assert (=> b!1059008 (= e!602668 (not (noDuplicate!1582 Nil!22447)))))

(assert (= (and start!93592 res!707495) b!1059007))

(assert (= (and b!1059007 res!707492) b!1059004))

(assert (= (and b!1059004 res!707493) b!1059006))

(assert (= (and b!1059006 res!707494) b!1059008))

(assert (= (and b!1059005 condMapEmpty!39046) mapIsEmpty!39046))

(assert (= (and b!1059005 (not condMapEmpty!39046)) mapNonEmpty!39046))

(get-info :version)

(assert (= (and mapNonEmpty!39046 ((_ is ValueCellFull!11759) mapValue!39046)) b!1059002))

(assert (= (and b!1059005 ((_ is ValueCellFull!11759) mapDefault!39046)) b!1059003))

(assert (= start!93592 b!1059005))

(declare-fun m!978055 () Bool)

(assert (=> b!1059004 m!978055))

(declare-fun m!978057 () Bool)

(assert (=> mapNonEmpty!39046 m!978057))

(declare-fun m!978059 () Bool)

(assert (=> start!93592 m!978059))

(declare-fun m!978061 () Bool)

(assert (=> start!93592 m!978061))

(declare-fun m!978063 () Bool)

(assert (=> start!93592 m!978063))

(declare-fun m!978065 () Bool)

(assert (=> b!1059008 m!978065))

(check-sat tp_is_empty!24925 (not mapNonEmpty!39046) (not b!1059004) (not start!93592) (not b!1059008))
(check-sat)
(get-model)

(declare-fun d!128547 () Bool)

(declare-fun res!707524 () Bool)

(declare-fun e!602706 () Bool)

(assert (=> d!128547 (=> res!707524 e!602706)))

(assert (=> d!128547 (= res!707524 ((_ is Nil!22447) Nil!22447))))

(assert (=> d!128547 (= (noDuplicate!1582 Nil!22447) e!602706)))

(declare-fun b!1059055 () Bool)

(declare-fun e!602707 () Bool)

(assert (=> b!1059055 (= e!602706 e!602707)))

(declare-fun res!707525 () Bool)

(assert (=> b!1059055 (=> (not res!707525) (not e!602707))))

(declare-fun contains!6181 (List!22450 (_ BitVec 64)) Bool)

(assert (=> b!1059055 (= res!707525 (not (contains!6181 (t!31748 Nil!22447) (h!23655 Nil!22447))))))

(declare-fun b!1059056 () Bool)

(assert (=> b!1059056 (= e!602707 (noDuplicate!1582 (t!31748 Nil!22447)))))

(assert (= (and d!128547 (not res!707524)) b!1059055))

(assert (= (and b!1059055 res!707525) b!1059056))

(declare-fun m!978091 () Bool)

(assert (=> b!1059055 m!978091))

(declare-fun m!978093 () Bool)

(assert (=> b!1059056 m!978093))

(assert (=> b!1059008 d!128547))

(declare-fun b!1059065 () Bool)

(declare-fun e!602714 () Bool)

(declare-fun e!602715 () Bool)

(assert (=> b!1059065 (= e!602714 e!602715)))

(declare-fun lt!466893 () (_ BitVec 64))

(assert (=> b!1059065 (= lt!466893 (select (arr!32120 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34593 0))(
  ( (Unit!34594) )
))
(declare-fun lt!466894 () Unit!34593)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66816 (_ BitVec 64) (_ BitVec 32)) Unit!34593)

(assert (=> b!1059065 (= lt!466894 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!466893 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66816 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059065 (arrayContainsKey!0 _keys!1163 lt!466893 #b00000000000000000000000000000000)))

(declare-fun lt!466892 () Unit!34593)

(assert (=> b!1059065 (= lt!466892 lt!466894)))

(declare-fun res!707530 () Bool)

(declare-datatypes ((SeekEntryResult!9866 0))(
  ( (MissingZero!9866 (index!41835 (_ BitVec 32))) (Found!9866 (index!41836 (_ BitVec 32))) (Intermediate!9866 (undefined!10678 Bool) (index!41837 (_ BitVec 32)) (x!94640 (_ BitVec 32))) (Undefined!9866) (MissingVacant!9866 (index!41838 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66816 (_ BitVec 32)) SeekEntryResult!9866)

(assert (=> b!1059065 (= res!707530 (= (seekEntryOrOpen!0 (select (arr!32120 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9866 #b00000000000000000000000000000000)))))

(assert (=> b!1059065 (=> (not res!707530) (not e!602715))))

(declare-fun b!1059066 () Bool)

(declare-fun call!44858 () Bool)

(assert (=> b!1059066 (= e!602715 call!44858)))

(declare-fun bm!44855 () Bool)

(assert (=> bm!44855 (= call!44858 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun d!128549 () Bool)

(declare-fun res!707531 () Bool)

(declare-fun e!602716 () Bool)

(assert (=> d!128549 (=> res!707531 e!602716)))

(assert (=> d!128549 (= res!707531 (bvsge #b00000000000000000000000000000000 (size!32658 _keys!1163)))))

(assert (=> d!128549 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!602716)))

(declare-fun b!1059067 () Bool)

(assert (=> b!1059067 (= e!602716 e!602714)))

(declare-fun c!107151 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059067 (= c!107151 (validKeyInArray!0 (select (arr!32120 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1059068 () Bool)

(assert (=> b!1059068 (= e!602714 call!44858)))

(assert (= (and d!128549 (not res!707531)) b!1059067))

(assert (= (and b!1059067 c!107151) b!1059065))

(assert (= (and b!1059067 (not c!107151)) b!1059068))

(assert (= (and b!1059065 res!707530) b!1059066))

(assert (= (or b!1059066 b!1059068) bm!44855))

(declare-fun m!978095 () Bool)

(assert (=> b!1059065 m!978095))

(declare-fun m!978097 () Bool)

(assert (=> b!1059065 m!978097))

(declare-fun m!978099 () Bool)

(assert (=> b!1059065 m!978099))

(assert (=> b!1059065 m!978095))

(declare-fun m!978101 () Bool)

(assert (=> b!1059065 m!978101))

(declare-fun m!978103 () Bool)

(assert (=> bm!44855 m!978103))

(assert (=> b!1059067 m!978095))

(assert (=> b!1059067 m!978095))

(declare-fun m!978105 () Bool)

(assert (=> b!1059067 m!978105))

(assert (=> b!1059004 d!128549))

(declare-fun d!128551 () Bool)

(assert (=> d!128551 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93592 d!128551))

(declare-fun d!128553 () Bool)

(assert (=> d!128553 (= (array_inv!24902 _values!955) (bvsge (size!32659 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93592 d!128553))

(declare-fun d!128555 () Bool)

(assert (=> d!128555 (= (array_inv!24903 _keys!1163) (bvsge (size!32658 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93592 d!128555))

(declare-fun condMapEmpty!39055 () Bool)

(declare-fun mapDefault!39055 () ValueCell!11759)

(assert (=> mapNonEmpty!39046 (= condMapEmpty!39055 (= mapRest!39046 ((as const (Array (_ BitVec 32) ValueCell!11759)) mapDefault!39055)))))

(declare-fun e!602721 () Bool)

(declare-fun mapRes!39055 () Bool)

(assert (=> mapNonEmpty!39046 (= tp!74852 (and e!602721 mapRes!39055))))

(declare-fun mapNonEmpty!39055 () Bool)

(declare-fun tp!74861 () Bool)

(declare-fun e!602722 () Bool)

(assert (=> mapNonEmpty!39055 (= mapRes!39055 (and tp!74861 e!602722))))

(declare-fun mapKey!39055 () (_ BitVec 32))

(declare-fun mapRest!39055 () (Array (_ BitVec 32) ValueCell!11759))

(declare-fun mapValue!39055 () ValueCell!11759)

(assert (=> mapNonEmpty!39055 (= mapRest!39046 (store mapRest!39055 mapKey!39055 mapValue!39055))))

(declare-fun b!1059075 () Bool)

(assert (=> b!1059075 (= e!602722 tp_is_empty!24925)))

(declare-fun mapIsEmpty!39055 () Bool)

(assert (=> mapIsEmpty!39055 mapRes!39055))

(declare-fun b!1059076 () Bool)

(assert (=> b!1059076 (= e!602721 tp_is_empty!24925)))

(assert (= (and mapNonEmpty!39046 condMapEmpty!39055) mapIsEmpty!39055))

(assert (= (and mapNonEmpty!39046 (not condMapEmpty!39055)) mapNonEmpty!39055))

(assert (= (and mapNonEmpty!39055 ((_ is ValueCellFull!11759) mapValue!39055)) b!1059075))

(assert (= (and mapNonEmpty!39046 ((_ is ValueCellFull!11759) mapDefault!39055)) b!1059076))

(declare-fun m!978107 () Bool)

(assert (=> mapNonEmpty!39055 m!978107))

(check-sat tp_is_empty!24925 (not b!1059055) (not b!1059056) (not mapNonEmpty!39055) (not bm!44855) (not b!1059065) (not b!1059067))
(check-sat)
