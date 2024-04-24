; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93916 () Bool)

(assert start!93916)

(declare-fun b!1061118 () Bool)

(declare-fun e!604126 () Bool)

(declare-fun e!604127 () Bool)

(declare-fun mapRes!39142 () Bool)

(assert (=> b!1061118 (= e!604126 (and e!604127 mapRes!39142))))

(declare-fun condMapEmpty!39142 () Bool)

(declare-datatypes ((V!38449 0))(
  ( (V!38450 (val!12543 Int)) )
))
(declare-datatypes ((ValueCell!11789 0))(
  ( (ValueCellFull!11789 (v!15149 V!38449)) (EmptyCell!11789) )
))
(declare-datatypes ((array!67041 0))(
  ( (array!67042 (arr!32224 (Array (_ BitVec 32) ValueCell!11789)) (size!32761 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67041)

(declare-fun mapDefault!39142 () ValueCell!11789)

(assert (=> b!1061118 (= condMapEmpty!39142 (= (arr!32224 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11789)) mapDefault!39142)))))

(declare-fun mapIsEmpty!39142 () Bool)

(assert (=> mapIsEmpty!39142 mapRes!39142))

(declare-fun b!1061119 () Bool)

(declare-fun res!708424 () Bool)

(declare-fun e!604125 () Bool)

(assert (=> b!1061119 (=> (not res!708424) (not e!604125))))

(declare-datatypes ((array!67043 0))(
  ( (array!67044 (arr!32225 (Array (_ BitVec 32) (_ BitVec 64))) (size!32762 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67043)

(declare-datatypes ((List!22431 0))(
  ( (Nil!22428) (Cons!22427 (h!23645 (_ BitVec 64)) (t!31730 List!22431)) )
))
(declare-fun arrayNoDuplicates!0 (array!67043 (_ BitVec 32) List!22431) Bool)

(assert (=> b!1061119 (= res!708424 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22428))))

(declare-fun b!1061121 () Bool)

(declare-fun e!604124 () Bool)

(declare-fun tp_is_empty!24985 () Bool)

(assert (=> b!1061121 (= e!604124 tp_is_empty!24985)))

(declare-fun b!1061122 () Bool)

(assert (=> b!1061122 (= e!604125 (bvsgt #b00000000000000000000000000000000 (size!32762 _keys!1163)))))

(declare-fun b!1061123 () Bool)

(declare-fun res!708422 () Bool)

(assert (=> b!1061123 (=> (not res!708422) (not e!604125))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67043 (_ BitVec 32)) Bool)

(assert (=> b!1061123 (= res!708422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun res!708421 () Bool)

(assert (=> start!93916 (=> (not res!708421) (not e!604125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93916 (= res!708421 (validMask!0 mask!1515))))

(assert (=> start!93916 e!604125))

(assert (=> start!93916 true))

(declare-fun array_inv!24986 (array!67041) Bool)

(assert (=> start!93916 (and (array_inv!24986 _values!955) e!604126)))

(declare-fun array_inv!24987 (array!67043) Bool)

(assert (=> start!93916 (array_inv!24987 _keys!1163)))

(declare-fun b!1061120 () Bool)

(assert (=> b!1061120 (= e!604127 tp_is_empty!24985)))

(declare-fun b!1061124 () Bool)

(declare-fun res!708423 () Bool)

(assert (=> b!1061124 (=> (not res!708423) (not e!604125))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061124 (= res!708423 (and (= (size!32761 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32762 _keys!1163) (size!32761 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39142 () Bool)

(declare-fun tp!74948 () Bool)

(assert (=> mapNonEmpty!39142 (= mapRes!39142 (and tp!74948 e!604124))))

(declare-fun mapRest!39142 () (Array (_ BitVec 32) ValueCell!11789))

(declare-fun mapKey!39142 () (_ BitVec 32))

(declare-fun mapValue!39142 () ValueCell!11789)

(assert (=> mapNonEmpty!39142 (= (arr!32224 _values!955) (store mapRest!39142 mapKey!39142 mapValue!39142))))

(assert (= (and start!93916 res!708421) b!1061124))

(assert (= (and b!1061124 res!708423) b!1061123))

(assert (= (and b!1061123 res!708422) b!1061119))

(assert (= (and b!1061119 res!708424) b!1061122))

(assert (= (and b!1061118 condMapEmpty!39142) mapIsEmpty!39142))

(assert (= (and b!1061118 (not condMapEmpty!39142)) mapNonEmpty!39142))

(get-info :version)

(assert (= (and mapNonEmpty!39142 ((_ is ValueCellFull!11789) mapValue!39142)) b!1061121))

(assert (= (and b!1061118 ((_ is ValueCellFull!11789) mapDefault!39142)) b!1061120))

(assert (= start!93916 b!1061118))

(declare-fun m!980771 () Bool)

(assert (=> b!1061119 m!980771))

(declare-fun m!980773 () Bool)

(assert (=> b!1061123 m!980773))

(declare-fun m!980775 () Bool)

(assert (=> start!93916 m!980775))

(declare-fun m!980777 () Bool)

(assert (=> start!93916 m!980777))

(declare-fun m!980779 () Bool)

(assert (=> start!93916 m!980779))

(declare-fun m!980781 () Bool)

(assert (=> mapNonEmpty!39142 m!980781))

(check-sat tp_is_empty!24985 (not mapNonEmpty!39142) (not start!93916) (not b!1061119) (not b!1061123))
(check-sat)
(get-model)

(declare-fun b!1061177 () Bool)

(declare-fun e!604169 () Bool)

(declare-fun call!44954 () Bool)

(assert (=> b!1061177 (= e!604169 call!44954)))

(declare-fun b!1061178 () Bool)

(declare-fun e!604167 () Bool)

(declare-fun contains!6239 (List!22431 (_ BitVec 64)) Bool)

(assert (=> b!1061178 (= e!604167 (contains!6239 Nil!22428 (select (arr!32225 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061179 () Bool)

(declare-fun e!604170 () Bool)

(assert (=> b!1061179 (= e!604170 e!604169)))

(declare-fun c!107606 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1061179 (= c!107606 (validKeyInArray!0 (select (arr!32225 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44951 () Bool)

(assert (=> bm!44951 (= call!44954 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107606 (Cons!22427 (select (arr!32225 _keys!1163) #b00000000000000000000000000000000) Nil!22428) Nil!22428)))))

(declare-fun d!129211 () Bool)

(declare-fun res!708456 () Bool)

(declare-fun e!604168 () Bool)

(assert (=> d!129211 (=> res!708456 e!604168)))

(assert (=> d!129211 (= res!708456 (bvsge #b00000000000000000000000000000000 (size!32762 _keys!1163)))))

(assert (=> d!129211 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22428) e!604168)))

(declare-fun b!1061180 () Bool)

(assert (=> b!1061180 (= e!604168 e!604170)))

(declare-fun res!708455 () Bool)

(assert (=> b!1061180 (=> (not res!708455) (not e!604170))))

(assert (=> b!1061180 (= res!708455 (not e!604167))))

(declare-fun res!708457 () Bool)

(assert (=> b!1061180 (=> (not res!708457) (not e!604167))))

(assert (=> b!1061180 (= res!708457 (validKeyInArray!0 (select (arr!32225 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061181 () Bool)

(assert (=> b!1061181 (= e!604169 call!44954)))

(assert (= (and d!129211 (not res!708456)) b!1061180))

(assert (= (and b!1061180 res!708457) b!1061178))

(assert (= (and b!1061180 res!708455) b!1061179))

(assert (= (and b!1061179 c!107606) b!1061177))

(assert (= (and b!1061179 (not c!107606)) b!1061181))

(assert (= (or b!1061177 b!1061181) bm!44951))

(declare-fun m!980807 () Bool)

(assert (=> b!1061178 m!980807))

(assert (=> b!1061178 m!980807))

(declare-fun m!980809 () Bool)

(assert (=> b!1061178 m!980809))

(assert (=> b!1061179 m!980807))

(assert (=> b!1061179 m!980807))

(declare-fun m!980811 () Bool)

(assert (=> b!1061179 m!980811))

(assert (=> bm!44951 m!980807))

(declare-fun m!980813 () Bool)

(assert (=> bm!44951 m!980813))

(assert (=> b!1061180 m!980807))

(assert (=> b!1061180 m!980807))

(assert (=> b!1061180 m!980811))

(assert (=> b!1061119 d!129211))

(declare-fun b!1061190 () Bool)

(declare-fun e!604179 () Bool)

(declare-fun call!44957 () Bool)

(assert (=> b!1061190 (= e!604179 call!44957)))

(declare-fun d!129213 () Bool)

(declare-fun res!708463 () Bool)

(declare-fun e!604178 () Bool)

(assert (=> d!129213 (=> res!708463 e!604178)))

(assert (=> d!129213 (= res!708463 (bvsge #b00000000000000000000000000000000 (size!32762 _keys!1163)))))

(assert (=> d!129213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!604178)))

(declare-fun b!1061191 () Bool)

(declare-fun e!604177 () Bool)

(assert (=> b!1061191 (= e!604178 e!604177)))

(declare-fun c!107609 () Bool)

(assert (=> b!1061191 (= c!107609 (validKeyInArray!0 (select (arr!32225 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1061192 () Bool)

(assert (=> b!1061192 (= e!604177 call!44957)))

(declare-fun bm!44954 () Bool)

(assert (=> bm!44954 (= call!44957 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1061193 () Bool)

(assert (=> b!1061193 (= e!604177 e!604179)))

(declare-fun lt!467702 () (_ BitVec 64))

(assert (=> b!1061193 (= lt!467702 (select (arr!32225 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34731 0))(
  ( (Unit!34732) )
))
(declare-fun lt!467701 () Unit!34731)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!67043 (_ BitVec 64) (_ BitVec 32)) Unit!34731)

(assert (=> b!1061193 (= lt!467701 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467702 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!67043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1061193 (arrayContainsKey!0 _keys!1163 lt!467702 #b00000000000000000000000000000000)))

(declare-fun lt!467703 () Unit!34731)

(assert (=> b!1061193 (= lt!467703 lt!467701)))

(declare-fun res!708462 () Bool)

(declare-datatypes ((SeekEntryResult!9825 0))(
  ( (MissingZero!9825 (index!41671 (_ BitVec 32))) (Found!9825 (index!41672 (_ BitVec 32))) (Intermediate!9825 (undefined!10637 Bool) (index!41673 (_ BitVec 32)) (x!94708 (_ BitVec 32))) (Undefined!9825) (MissingVacant!9825 (index!41674 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!67043 (_ BitVec 32)) SeekEntryResult!9825)

(assert (=> b!1061193 (= res!708462 (= (seekEntryOrOpen!0 (select (arr!32225 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9825 #b00000000000000000000000000000000)))))

(assert (=> b!1061193 (=> (not res!708462) (not e!604179))))

(assert (= (and d!129213 (not res!708463)) b!1061191))

(assert (= (and b!1061191 c!107609) b!1061193))

(assert (= (and b!1061191 (not c!107609)) b!1061192))

(assert (= (and b!1061193 res!708462) b!1061190))

(assert (= (or b!1061190 b!1061192) bm!44954))

(assert (=> b!1061191 m!980807))

(assert (=> b!1061191 m!980807))

(assert (=> b!1061191 m!980811))

(declare-fun m!980815 () Bool)

(assert (=> bm!44954 m!980815))

(assert (=> b!1061193 m!980807))

(declare-fun m!980817 () Bool)

(assert (=> b!1061193 m!980817))

(declare-fun m!980819 () Bool)

(assert (=> b!1061193 m!980819))

(assert (=> b!1061193 m!980807))

(declare-fun m!980821 () Bool)

(assert (=> b!1061193 m!980821))

(assert (=> b!1061123 d!129213))

(declare-fun d!129215 () Bool)

(assert (=> d!129215 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93916 d!129215))

(declare-fun d!129217 () Bool)

(assert (=> d!129217 (= (array_inv!24986 _values!955) (bvsge (size!32761 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93916 d!129217))

(declare-fun d!129219 () Bool)

(assert (=> d!129219 (= (array_inv!24987 _keys!1163) (bvsge (size!32762 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93916 d!129219))

(declare-fun mapNonEmpty!39151 () Bool)

(declare-fun mapRes!39151 () Bool)

(declare-fun tp!74957 () Bool)

(declare-fun e!604184 () Bool)

(assert (=> mapNonEmpty!39151 (= mapRes!39151 (and tp!74957 e!604184))))

(declare-fun mapRest!39151 () (Array (_ BitVec 32) ValueCell!11789))

(declare-fun mapKey!39151 () (_ BitVec 32))

(declare-fun mapValue!39151 () ValueCell!11789)

(assert (=> mapNonEmpty!39151 (= mapRest!39142 (store mapRest!39151 mapKey!39151 mapValue!39151))))

(declare-fun b!1061201 () Bool)

(declare-fun e!604185 () Bool)

(assert (=> b!1061201 (= e!604185 tp_is_empty!24985)))

(declare-fun b!1061200 () Bool)

(assert (=> b!1061200 (= e!604184 tp_is_empty!24985)))

(declare-fun mapIsEmpty!39151 () Bool)

(assert (=> mapIsEmpty!39151 mapRes!39151))

(declare-fun condMapEmpty!39151 () Bool)

(declare-fun mapDefault!39151 () ValueCell!11789)

(assert (=> mapNonEmpty!39142 (= condMapEmpty!39151 (= mapRest!39142 ((as const (Array (_ BitVec 32) ValueCell!11789)) mapDefault!39151)))))

(assert (=> mapNonEmpty!39142 (= tp!74948 (and e!604185 mapRes!39151))))

(assert (= (and mapNonEmpty!39142 condMapEmpty!39151) mapIsEmpty!39151))

(assert (= (and mapNonEmpty!39142 (not condMapEmpty!39151)) mapNonEmpty!39151))

(assert (= (and mapNonEmpty!39151 ((_ is ValueCellFull!11789) mapValue!39151)) b!1061200))

(assert (= (and mapNonEmpty!39142 ((_ is ValueCellFull!11789) mapDefault!39151)) b!1061201))

(declare-fun m!980823 () Bool)

(assert (=> mapNonEmpty!39151 m!980823))

(check-sat tp_is_empty!24985 (not b!1061179) (not b!1061178) (not mapNonEmpty!39151) (not bm!44951) (not bm!44954) (not b!1061193) (not b!1061191) (not b!1061180))
(check-sat)
