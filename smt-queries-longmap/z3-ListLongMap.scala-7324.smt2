; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93608 () Bool)

(assert start!93608)

(declare-fun b!1059095 () Bool)

(declare-fun res!707549 () Bool)

(declare-fun e!602738 () Bool)

(assert (=> b!1059095 (=> (not res!707549) (not e!602738))))

(declare-datatypes ((array!66830 0))(
  ( (array!66831 (arr!32126 (Array (_ BitVec 32) (_ BitVec 64))) (size!32664 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66830)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66830 (_ BitVec 32)) Bool)

(assert (=> b!1059095 (= res!707549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059096 () Bool)

(declare-fun e!602739 () Bool)

(declare-fun tp_is_empty!24931 () Bool)

(assert (=> b!1059096 (= e!602739 tp_is_empty!24931)))

(declare-fun res!707544 () Bool)

(assert (=> start!93608 (=> (not res!707544) (not e!602738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93608 (= res!707544 (validMask!0 mask!1515))))

(assert (=> start!93608 e!602738))

(assert (=> start!93608 true))

(declare-datatypes ((V!38377 0))(
  ( (V!38378 (val!12516 Int)) )
))
(declare-datatypes ((ValueCell!11762 0))(
  ( (ValueCellFull!11762 (v!15124 V!38377)) (EmptyCell!11762) )
))
(declare-datatypes ((array!66832 0))(
  ( (array!66833 (arr!32127 (Array (_ BitVec 32) ValueCell!11762)) (size!32665 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66832)

(declare-fun e!602736 () Bool)

(declare-fun array_inv!24906 (array!66832) Bool)

(assert (=> start!93608 (and (array_inv!24906 _values!955) e!602736)))

(declare-fun array_inv!24907 (array!66830) Bool)

(assert (=> start!93608 (array_inv!24907 _keys!1163)))

(declare-fun b!1059097 () Bool)

(declare-fun e!602735 () Bool)

(declare-fun mapRes!39058 () Bool)

(assert (=> b!1059097 (= e!602736 (and e!602735 mapRes!39058))))

(declare-fun condMapEmpty!39058 () Bool)

(declare-fun mapDefault!39058 () ValueCell!11762)

(assert (=> b!1059097 (= condMapEmpty!39058 (= (arr!32127 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11762)) mapDefault!39058)))))

(declare-fun b!1059098 () Bool)

(declare-fun e!602737 () Bool)

(assert (=> b!1059098 (= e!602738 e!602737)))

(declare-fun res!707548 () Bool)

(assert (=> b!1059098 (=> res!707548 e!602737)))

(declare-datatypes ((List!22452 0))(
  ( (Nil!22449) (Cons!22448 (h!23657 (_ BitVec 64)) (t!31750 List!22452)) )
))
(declare-fun contains!6182 (List!22452 (_ BitVec 64)) Bool)

(assert (=> b!1059098 (= res!707548 (contains!6182 Nil!22449 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!39058 () Bool)

(assert (=> mapIsEmpty!39058 mapRes!39058))

(declare-fun b!1059099 () Bool)

(declare-fun res!707547 () Bool)

(assert (=> b!1059099 (=> (not res!707547) (not e!602738))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059099 (= res!707547 (and (= (size!32665 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32664 _keys!1163) (size!32665 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39058 () Bool)

(declare-fun tp!74864 () Bool)

(assert (=> mapNonEmpty!39058 (= mapRes!39058 (and tp!74864 e!602739))))

(declare-fun mapRest!39058 () (Array (_ BitVec 32) ValueCell!11762))

(declare-fun mapValue!39058 () ValueCell!11762)

(declare-fun mapKey!39058 () (_ BitVec 32))

(assert (=> mapNonEmpty!39058 (= (arr!32127 _values!955) (store mapRest!39058 mapKey!39058 mapValue!39058))))

(declare-fun b!1059100 () Bool)

(declare-fun res!707545 () Bool)

(assert (=> b!1059100 (=> (not res!707545) (not e!602738))))

(declare-fun noDuplicate!1584 (List!22452) Bool)

(assert (=> b!1059100 (= res!707545 (noDuplicate!1584 Nil!22449))))

(declare-fun b!1059101 () Bool)

(declare-fun res!707546 () Bool)

(assert (=> b!1059101 (=> (not res!707546) (not e!602738))))

(assert (=> b!1059101 (= res!707546 (and (bvsle #b00000000000000000000000000000000 (size!32664 _keys!1163)) (bvslt (size!32664 _keys!1163) #b01111111111111111111111111111111)))))

(declare-fun b!1059102 () Bool)

(assert (=> b!1059102 (= e!602735 tp_is_empty!24931)))

(declare-fun b!1059103 () Bool)

(assert (=> b!1059103 (= e!602737 (contains!6182 Nil!22449 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!93608 res!707544) b!1059099))

(assert (= (and b!1059099 res!707547) b!1059095))

(assert (= (and b!1059095 res!707549) b!1059101))

(assert (= (and b!1059101 res!707546) b!1059100))

(assert (= (and b!1059100 res!707545) b!1059098))

(assert (= (and b!1059098 (not res!707548)) b!1059103))

(assert (= (and b!1059097 condMapEmpty!39058) mapIsEmpty!39058))

(assert (= (and b!1059097 (not condMapEmpty!39058)) mapNonEmpty!39058))

(get-info :version)

(assert (= (and mapNonEmpty!39058 ((_ is ValueCellFull!11762) mapValue!39058)) b!1059096))

(assert (= (and b!1059097 ((_ is ValueCellFull!11762) mapDefault!39058)) b!1059102))

(assert (= start!93608 b!1059097))

(declare-fun m!978109 () Bool)

(assert (=> b!1059100 m!978109))

(declare-fun m!978111 () Bool)

(assert (=> mapNonEmpty!39058 m!978111))

(declare-fun m!978113 () Bool)

(assert (=> start!93608 m!978113))

(declare-fun m!978115 () Bool)

(assert (=> start!93608 m!978115))

(declare-fun m!978117 () Bool)

(assert (=> start!93608 m!978117))

(declare-fun m!978119 () Bool)

(assert (=> b!1059103 m!978119))

(declare-fun m!978121 () Bool)

(assert (=> b!1059098 m!978121))

(declare-fun m!978123 () Bool)

(assert (=> b!1059095 m!978123))

(check-sat (not start!93608) (not b!1059095) (not b!1059100) (not mapNonEmpty!39058) (not b!1059103) tp_is_empty!24931 (not b!1059098))
(check-sat)
(get-model)

(declare-fun d!128559 () Bool)

(declare-fun lt!466897 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!533 (List!22452) (InoxSet (_ BitVec 64)))

(assert (=> d!128559 (= lt!466897 (select (content!533 Nil!22449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!602782 () Bool)

(assert (=> d!128559 (= lt!466897 e!602782)))

(declare-fun res!707590 () Bool)

(assert (=> d!128559 (=> (not res!707590) (not e!602782))))

(assert (=> d!128559 (= res!707590 ((_ is Cons!22448) Nil!22449))))

(assert (=> d!128559 (= (contains!6182 Nil!22449 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466897)))

(declare-fun b!1059162 () Bool)

(declare-fun e!602781 () Bool)

(assert (=> b!1059162 (= e!602782 e!602781)))

(declare-fun res!707591 () Bool)

(assert (=> b!1059162 (=> res!707591 e!602781)))

(assert (=> b!1059162 (= res!707591 (= (h!23657 Nil!22449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059163 () Bool)

(assert (=> b!1059163 (= e!602781 (contains!6182 (t!31750 Nil!22449) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128559 res!707590) b!1059162))

(assert (= (and b!1059162 (not res!707591)) b!1059163))

(declare-fun m!978157 () Bool)

(assert (=> d!128559 m!978157))

(declare-fun m!978159 () Bool)

(assert (=> d!128559 m!978159))

(declare-fun m!978161 () Bool)

(assert (=> b!1059163 m!978161))

(assert (=> b!1059103 d!128559))

(declare-fun d!128561 () Bool)

(declare-fun res!707597 () Bool)

(declare-fun e!602790 () Bool)

(assert (=> d!128561 (=> res!707597 e!602790)))

(assert (=> d!128561 (= res!707597 (bvsge #b00000000000000000000000000000000 (size!32664 _keys!1163)))))

(assert (=> d!128561 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!602790)))

(declare-fun b!1059172 () Bool)

(declare-fun e!602791 () Bool)

(declare-fun call!44861 () Bool)

(assert (=> b!1059172 (= e!602791 call!44861)))

(declare-fun b!1059173 () Bool)

(declare-fun e!602789 () Bool)

(assert (=> b!1059173 (= e!602790 e!602789)))

(declare-fun c!107154 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059173 (= c!107154 (validKeyInArray!0 (select (arr!32126 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44858 () Bool)

(assert (=> bm!44858 (= call!44861 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1059174 () Bool)

(assert (=> b!1059174 (= e!602789 call!44861)))

(declare-fun b!1059175 () Bool)

(assert (=> b!1059175 (= e!602789 e!602791)))

(declare-fun lt!466905 () (_ BitVec 64))

(assert (=> b!1059175 (= lt!466905 (select (arr!32126 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34595 0))(
  ( (Unit!34596) )
))
(declare-fun lt!466904 () Unit!34595)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66830 (_ BitVec 64) (_ BitVec 32)) Unit!34595)

(assert (=> b!1059175 (= lt!466904 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!466905 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66830 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059175 (arrayContainsKey!0 _keys!1163 lt!466905 #b00000000000000000000000000000000)))

(declare-fun lt!466906 () Unit!34595)

(assert (=> b!1059175 (= lt!466906 lt!466904)))

(declare-fun res!707596 () Bool)

(declare-datatypes ((SeekEntryResult!9867 0))(
  ( (MissingZero!9867 (index!41839 (_ BitVec 32))) (Found!9867 (index!41840 (_ BitVec 32))) (Intermediate!9867 (undefined!10679 Bool) (index!41841 (_ BitVec 32)) (x!94651 (_ BitVec 32))) (Undefined!9867) (MissingVacant!9867 (index!41842 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66830 (_ BitVec 32)) SeekEntryResult!9867)

(assert (=> b!1059175 (= res!707596 (= (seekEntryOrOpen!0 (select (arr!32126 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9867 #b00000000000000000000000000000000)))))

(assert (=> b!1059175 (=> (not res!707596) (not e!602791))))

(assert (= (and d!128561 (not res!707597)) b!1059173))

(assert (= (and b!1059173 c!107154) b!1059175))

(assert (= (and b!1059173 (not c!107154)) b!1059174))

(assert (= (and b!1059175 res!707596) b!1059172))

(assert (= (or b!1059172 b!1059174) bm!44858))

(declare-fun m!978163 () Bool)

(assert (=> b!1059173 m!978163))

(assert (=> b!1059173 m!978163))

(declare-fun m!978165 () Bool)

(assert (=> b!1059173 m!978165))

(declare-fun m!978167 () Bool)

(assert (=> bm!44858 m!978167))

(assert (=> b!1059175 m!978163))

(declare-fun m!978169 () Bool)

(assert (=> b!1059175 m!978169))

(declare-fun m!978171 () Bool)

(assert (=> b!1059175 m!978171))

(assert (=> b!1059175 m!978163))

(declare-fun m!978173 () Bool)

(assert (=> b!1059175 m!978173))

(assert (=> b!1059095 d!128561))

(declare-fun d!128563 () Bool)

(declare-fun res!707602 () Bool)

(declare-fun e!602796 () Bool)

(assert (=> d!128563 (=> res!707602 e!602796)))

(assert (=> d!128563 (= res!707602 ((_ is Nil!22449) Nil!22449))))

(assert (=> d!128563 (= (noDuplicate!1584 Nil!22449) e!602796)))

(declare-fun b!1059180 () Bool)

(declare-fun e!602797 () Bool)

(assert (=> b!1059180 (= e!602796 e!602797)))

(declare-fun res!707603 () Bool)

(assert (=> b!1059180 (=> (not res!707603) (not e!602797))))

(assert (=> b!1059180 (= res!707603 (not (contains!6182 (t!31750 Nil!22449) (h!23657 Nil!22449))))))

(declare-fun b!1059181 () Bool)

(assert (=> b!1059181 (= e!602797 (noDuplicate!1584 (t!31750 Nil!22449)))))

(assert (= (and d!128563 (not res!707602)) b!1059180))

(assert (= (and b!1059180 res!707603) b!1059181))

(declare-fun m!978175 () Bool)

(assert (=> b!1059180 m!978175))

(declare-fun m!978177 () Bool)

(assert (=> b!1059181 m!978177))

(assert (=> b!1059100 d!128563))

(declare-fun d!128565 () Bool)

(declare-fun lt!466907 () Bool)

(assert (=> d!128565 (= lt!466907 (select (content!533 Nil!22449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!602799 () Bool)

(assert (=> d!128565 (= lt!466907 e!602799)))

(declare-fun res!707604 () Bool)

(assert (=> d!128565 (=> (not res!707604) (not e!602799))))

(assert (=> d!128565 (= res!707604 ((_ is Cons!22448) Nil!22449))))

(assert (=> d!128565 (= (contains!6182 Nil!22449 #b0000000000000000000000000000000000000000000000000000000000000000) lt!466907)))

(declare-fun b!1059182 () Bool)

(declare-fun e!602798 () Bool)

(assert (=> b!1059182 (= e!602799 e!602798)))

(declare-fun res!707605 () Bool)

(assert (=> b!1059182 (=> res!707605 e!602798)))

(assert (=> b!1059182 (= res!707605 (= (h!23657 Nil!22449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1059183 () Bool)

(assert (=> b!1059183 (= e!602798 (contains!6182 (t!31750 Nil!22449) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!128565 res!707604) b!1059182))

(assert (= (and b!1059182 (not res!707605)) b!1059183))

(assert (=> d!128565 m!978157))

(declare-fun m!978179 () Bool)

(assert (=> d!128565 m!978179))

(declare-fun m!978181 () Bool)

(assert (=> b!1059183 m!978181))

(assert (=> b!1059098 d!128565))

(declare-fun d!128567 () Bool)

(assert (=> d!128567 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93608 d!128567))

(declare-fun d!128569 () Bool)

(assert (=> d!128569 (= (array_inv!24906 _values!955) (bvsge (size!32665 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93608 d!128569))

(declare-fun d!128571 () Bool)

(assert (=> d!128571 (= (array_inv!24907 _keys!1163) (bvsge (size!32664 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93608 d!128571))

(declare-fun mapIsEmpty!39067 () Bool)

(declare-fun mapRes!39067 () Bool)

(assert (=> mapIsEmpty!39067 mapRes!39067))

(declare-fun mapNonEmpty!39067 () Bool)

(declare-fun tp!74873 () Bool)

(declare-fun e!602805 () Bool)

(assert (=> mapNonEmpty!39067 (= mapRes!39067 (and tp!74873 e!602805))))

(declare-fun mapKey!39067 () (_ BitVec 32))

(declare-fun mapRest!39067 () (Array (_ BitVec 32) ValueCell!11762))

(declare-fun mapValue!39067 () ValueCell!11762)

(assert (=> mapNonEmpty!39067 (= mapRest!39058 (store mapRest!39067 mapKey!39067 mapValue!39067))))

(declare-fun b!1059191 () Bool)

(declare-fun e!602804 () Bool)

(assert (=> b!1059191 (= e!602804 tp_is_empty!24931)))

(declare-fun condMapEmpty!39067 () Bool)

(declare-fun mapDefault!39067 () ValueCell!11762)

(assert (=> mapNonEmpty!39058 (= condMapEmpty!39067 (= mapRest!39058 ((as const (Array (_ BitVec 32) ValueCell!11762)) mapDefault!39067)))))

(assert (=> mapNonEmpty!39058 (= tp!74864 (and e!602804 mapRes!39067))))

(declare-fun b!1059190 () Bool)

(assert (=> b!1059190 (= e!602805 tp_is_empty!24931)))

(assert (= (and mapNonEmpty!39058 condMapEmpty!39067) mapIsEmpty!39067))

(assert (= (and mapNonEmpty!39058 (not condMapEmpty!39067)) mapNonEmpty!39067))

(assert (= (and mapNonEmpty!39067 ((_ is ValueCellFull!11762) mapValue!39067)) b!1059190))

(assert (= (and mapNonEmpty!39058 ((_ is ValueCellFull!11762) mapDefault!39067)) b!1059191))

(declare-fun m!978183 () Bool)

(assert (=> mapNonEmpty!39067 m!978183))

(check-sat (not mapNonEmpty!39067) (not b!1059173) (not b!1059183) (not b!1059181) tp_is_empty!24931 (not d!128559) (not b!1059175) (not d!128565) (not b!1059180) (not b!1059163) (not bm!44858))
(check-sat)
