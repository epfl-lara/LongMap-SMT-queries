; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93578 () Bool)

(assert start!93578)

(declare-fun mapIsEmpty!39034 () Bool)

(declare-fun mapRes!39034 () Bool)

(assert (=> mapIsEmpty!39034 mapRes!39034))

(declare-fun b!1058926 () Bool)

(declare-fun e!602609 () Bool)

(declare-fun tp_is_empty!24919 () Bool)

(assert (=> b!1058926 (= e!602609 tp_is_empty!24919)))

(declare-fun b!1058927 () Bool)

(declare-fun e!602607 () Bool)

(declare-datatypes ((array!66802 0))(
  ( (array!66803 (arr!32114 (Array (_ BitVec 32) (_ BitVec 64))) (size!32652 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66802)

(assert (=> b!1058927 (= e!602607 (and (bvsle #b00000000000000000000000000000000 (size!32652 _keys!1163)) (bvsge (size!32652 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1058928 () Bool)

(declare-fun e!602611 () Bool)

(assert (=> b!1058928 (= e!602611 tp_is_empty!24919)))

(declare-fun b!1058929 () Bool)

(declare-fun e!602608 () Bool)

(assert (=> b!1058929 (= e!602608 (and e!602609 mapRes!39034))))

(declare-fun condMapEmpty!39034 () Bool)

(declare-datatypes ((V!38361 0))(
  ( (V!38362 (val!12510 Int)) )
))
(declare-datatypes ((ValueCell!11756 0))(
  ( (ValueCellFull!11756 (v!15118 V!38361)) (EmptyCell!11756) )
))
(declare-datatypes ((array!66804 0))(
  ( (array!66805 (arr!32115 (Array (_ BitVec 32) ValueCell!11756)) (size!32653 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66804)

(declare-fun mapDefault!39034 () ValueCell!11756)

(assert (=> b!1058929 (= condMapEmpty!39034 (= (arr!32115 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11756)) mapDefault!39034)))))

(declare-fun b!1058930 () Bool)

(declare-fun res!707458 () Bool)

(assert (=> b!1058930 (=> (not res!707458) (not e!602607))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1058930 (= res!707458 (and (= (size!32653 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32652 _keys!1163) (size!32653 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39034 () Bool)

(declare-fun tp!74840 () Bool)

(assert (=> mapNonEmpty!39034 (= mapRes!39034 (and tp!74840 e!602611))))

(declare-fun mapKey!39034 () (_ BitVec 32))

(declare-fun mapRest!39034 () (Array (_ BitVec 32) ValueCell!11756))

(declare-fun mapValue!39034 () ValueCell!11756)

(assert (=> mapNonEmpty!39034 (= (arr!32115 _values!955) (store mapRest!39034 mapKey!39034 mapValue!39034))))

(declare-fun res!707459 () Bool)

(assert (=> start!93578 (=> (not res!707459) (not e!602607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93578 (= res!707459 (validMask!0 mask!1515))))

(assert (=> start!93578 e!602607))

(assert (=> start!93578 true))

(declare-fun array_inv!24896 (array!66804) Bool)

(assert (=> start!93578 (and (array_inv!24896 _values!955) e!602608)))

(declare-fun array_inv!24897 (array!66802) Bool)

(assert (=> start!93578 (array_inv!24897 _keys!1163)))

(declare-fun b!1058931 () Bool)

(declare-fun res!707457 () Bool)

(assert (=> b!1058931 (=> (not res!707457) (not e!602607))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66802 (_ BitVec 32)) Bool)

(assert (=> b!1058931 (= res!707457 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(assert (= (and start!93578 res!707459) b!1058930))

(assert (= (and b!1058930 res!707458) b!1058931))

(assert (= (and b!1058931 res!707457) b!1058927))

(assert (= (and b!1058929 condMapEmpty!39034) mapIsEmpty!39034))

(assert (= (and b!1058929 (not condMapEmpty!39034)) mapNonEmpty!39034))

(get-info :version)

(assert (= (and mapNonEmpty!39034 ((_ is ValueCellFull!11756) mapValue!39034)) b!1058928))

(assert (= (and b!1058929 ((_ is ValueCellFull!11756) mapDefault!39034)) b!1058926))

(assert (= start!93578 b!1058929))

(declare-fun m!978011 () Bool)

(assert (=> mapNonEmpty!39034 m!978011))

(declare-fun m!978013 () Bool)

(assert (=> start!93578 m!978013))

(declare-fun m!978015 () Bool)

(assert (=> start!93578 m!978015))

(declare-fun m!978017 () Bool)

(assert (=> start!93578 m!978017))

(declare-fun m!978019 () Bool)

(assert (=> b!1058931 m!978019))

(check-sat (not b!1058931) (not start!93578) (not mapNonEmpty!39034) tp_is_empty!24919)
(check-sat)
(get-model)

(declare-fun b!1058976 () Bool)

(declare-fun e!602650 () Bool)

(declare-fun call!44855 () Bool)

(assert (=> b!1058976 (= e!602650 call!44855)))

(declare-fun bm!44852 () Bool)

(assert (=> bm!44852 (= call!44855 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1058977 () Bool)

(declare-fun e!602649 () Bool)

(assert (=> b!1058977 (= e!602649 call!44855)))

(declare-fun b!1058978 () Bool)

(assert (=> b!1058978 (= e!602650 e!602649)))

(declare-fun lt!466883 () (_ BitVec 64))

(assert (=> b!1058978 (= lt!466883 (select (arr!32114 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34591 0))(
  ( (Unit!34592) )
))
(declare-fun lt!466884 () Unit!34591)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66802 (_ BitVec 64) (_ BitVec 32)) Unit!34591)

(assert (=> b!1058978 (= lt!466884 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!466883 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66802 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1058978 (arrayContainsKey!0 _keys!1163 lt!466883 #b00000000000000000000000000000000)))

(declare-fun lt!466885 () Unit!34591)

(assert (=> b!1058978 (= lt!466885 lt!466884)))

(declare-fun res!707482 () Bool)

(declare-datatypes ((SeekEntryResult!9865 0))(
  ( (MissingZero!9865 (index!41831 (_ BitVec 32))) (Found!9865 (index!41832 (_ BitVec 32))) (Intermediate!9865 (undefined!10677 Bool) (index!41833 (_ BitVec 32)) (x!94629 (_ BitVec 32))) (Undefined!9865) (MissingVacant!9865 (index!41834 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66802 (_ BitVec 32)) SeekEntryResult!9865)

(assert (=> b!1058978 (= res!707482 (= (seekEntryOrOpen!0 (select (arr!32114 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9865 #b00000000000000000000000000000000)))))

(assert (=> b!1058978 (=> (not res!707482) (not e!602649))))

(declare-fun d!128537 () Bool)

(declare-fun res!707483 () Bool)

(declare-fun e!602648 () Bool)

(assert (=> d!128537 (=> res!707483 e!602648)))

(assert (=> d!128537 (= res!707483 (bvsge #b00000000000000000000000000000000 (size!32652 _keys!1163)))))

(assert (=> d!128537 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!602648)))

(declare-fun b!1058979 () Bool)

(assert (=> b!1058979 (= e!602648 e!602650)))

(declare-fun c!107148 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1058979 (= c!107148 (validKeyInArray!0 (select (arr!32114 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128537 (not res!707483)) b!1058979))

(assert (= (and b!1058979 c!107148) b!1058978))

(assert (= (and b!1058979 (not c!107148)) b!1058976))

(assert (= (and b!1058978 res!707482) b!1058977))

(assert (= (or b!1058977 b!1058976) bm!44852))

(declare-fun m!978041 () Bool)

(assert (=> bm!44852 m!978041))

(declare-fun m!978043 () Bool)

(assert (=> b!1058978 m!978043))

(declare-fun m!978045 () Bool)

(assert (=> b!1058978 m!978045))

(declare-fun m!978047 () Bool)

(assert (=> b!1058978 m!978047))

(assert (=> b!1058978 m!978043))

(declare-fun m!978049 () Bool)

(assert (=> b!1058978 m!978049))

(assert (=> b!1058979 m!978043))

(assert (=> b!1058979 m!978043))

(declare-fun m!978051 () Bool)

(assert (=> b!1058979 m!978051))

(assert (=> b!1058931 d!128537))

(declare-fun d!128539 () Bool)

(assert (=> d!128539 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93578 d!128539))

(declare-fun d!128541 () Bool)

(assert (=> d!128541 (= (array_inv!24896 _values!955) (bvsge (size!32653 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93578 d!128541))

(declare-fun d!128543 () Bool)

(assert (=> d!128543 (= (array_inv!24897 _keys!1163) (bvsge (size!32652 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93578 d!128543))

(declare-fun mapIsEmpty!39043 () Bool)

(declare-fun mapRes!39043 () Bool)

(assert (=> mapIsEmpty!39043 mapRes!39043))

(declare-fun b!1058987 () Bool)

(declare-fun e!602656 () Bool)

(assert (=> b!1058987 (= e!602656 tp_is_empty!24919)))

(declare-fun b!1058986 () Bool)

(declare-fun e!602655 () Bool)

(assert (=> b!1058986 (= e!602655 tp_is_empty!24919)))

(declare-fun condMapEmpty!39043 () Bool)

(declare-fun mapDefault!39043 () ValueCell!11756)

(assert (=> mapNonEmpty!39034 (= condMapEmpty!39043 (= mapRest!39034 ((as const (Array (_ BitVec 32) ValueCell!11756)) mapDefault!39043)))))

(assert (=> mapNonEmpty!39034 (= tp!74840 (and e!602656 mapRes!39043))))

(declare-fun mapNonEmpty!39043 () Bool)

(declare-fun tp!74849 () Bool)

(assert (=> mapNonEmpty!39043 (= mapRes!39043 (and tp!74849 e!602655))))

(declare-fun mapValue!39043 () ValueCell!11756)

(declare-fun mapKey!39043 () (_ BitVec 32))

(declare-fun mapRest!39043 () (Array (_ BitVec 32) ValueCell!11756))

(assert (=> mapNonEmpty!39043 (= mapRest!39034 (store mapRest!39043 mapKey!39043 mapValue!39043))))

(assert (= (and mapNonEmpty!39034 condMapEmpty!39043) mapIsEmpty!39043))

(assert (= (and mapNonEmpty!39034 (not condMapEmpty!39043)) mapNonEmpty!39043))

(assert (= (and mapNonEmpty!39043 ((_ is ValueCellFull!11756) mapValue!39043)) b!1058986))

(assert (= (and mapNonEmpty!39034 ((_ is ValueCellFull!11756) mapDefault!39043)) b!1058987))

(declare-fun m!978053 () Bool)

(assert (=> mapNonEmpty!39043 m!978053))

(check-sat (not bm!44852) (not b!1058978) tp_is_empty!24919 (not mapNonEmpty!39043) (not b!1058979))
(check-sat)
