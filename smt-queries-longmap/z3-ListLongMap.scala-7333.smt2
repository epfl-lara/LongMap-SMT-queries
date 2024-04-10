; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93682 () Bool)

(assert start!93682)

(declare-fun mapIsEmpty!39145 () Bool)

(declare-fun mapRes!39145 () Bool)

(assert (=> mapIsEmpty!39145 mapRes!39145))

(declare-fun b!1059812 () Bool)

(declare-fun res!707911 () Bool)

(declare-fun e!603284 () Bool)

(assert (=> b!1059812 (=> (not res!707911) (not e!603284))))

(declare-datatypes ((array!66997 0))(
  ( (array!66998 (arr!32208 (Array (_ BitVec 32) (_ BitVec 64))) (size!32744 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66997)

(declare-datatypes ((List!22444 0))(
  ( (Nil!22441) (Cons!22440 (h!23649 (_ BitVec 64)) (t!31751 List!22444)) )
))
(declare-fun arrayNoDuplicates!0 (array!66997 (_ BitVec 32) List!22444) Bool)

(assert (=> b!1059812 (= res!707911 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22441))))

(declare-fun mapNonEmpty!39145 () Bool)

(declare-fun tp!74951 () Bool)

(declare-fun e!603285 () Bool)

(assert (=> mapNonEmpty!39145 (= mapRes!39145 (and tp!74951 e!603285))))

(declare-fun mapKey!39145 () (_ BitVec 32))

(declare-datatypes ((V!38451 0))(
  ( (V!38452 (val!12544 Int)) )
))
(declare-datatypes ((ValueCell!11790 0))(
  ( (ValueCellFull!11790 (v!15154 V!38451)) (EmptyCell!11790) )
))
(declare-fun mapValue!39145 () ValueCell!11790)

(declare-datatypes ((array!66999 0))(
  ( (array!67000 (arr!32209 (Array (_ BitVec 32) ValueCell!11790)) (size!32745 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66999)

(declare-fun mapRest!39145 () (Array (_ BitVec 32) ValueCell!11790))

(assert (=> mapNonEmpty!39145 (= (arr!32209 _values!955) (store mapRest!39145 mapKey!39145 mapValue!39145))))

(declare-fun res!707914 () Bool)

(assert (=> start!93682 (=> (not res!707914) (not e!603284))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93682 (= res!707914 (validMask!0 mask!1515))))

(assert (=> start!93682 e!603284))

(assert (=> start!93682 true))

(declare-fun e!603286 () Bool)

(declare-fun array_inv!24964 (array!66999) Bool)

(assert (=> start!93682 (and (array_inv!24964 _values!955) e!603286)))

(declare-fun array_inv!24965 (array!66997) Bool)

(assert (=> start!93682 (array_inv!24965 _keys!1163)))

(declare-fun b!1059813 () Bool)

(declare-fun res!707912 () Bool)

(assert (=> b!1059813 (=> (not res!707912) (not e!603284))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66997 (_ BitVec 32)) Bool)

(assert (=> b!1059813 (= res!707912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059814 () Bool)

(declare-fun e!603288 () Bool)

(assert (=> b!1059814 (= e!603286 (and e!603288 mapRes!39145))))

(declare-fun condMapEmpty!39145 () Bool)

(declare-fun mapDefault!39145 () ValueCell!11790)

(assert (=> b!1059814 (= condMapEmpty!39145 (= (arr!32209 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11790)) mapDefault!39145)))))

(declare-fun b!1059815 () Bool)

(declare-fun res!707913 () Bool)

(assert (=> b!1059815 (=> (not res!707913) (not e!603284))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1059815 (= res!707913 (and (= (size!32745 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32744 _keys!1163) (size!32745 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1059816 () Bool)

(declare-fun tp_is_empty!24987 () Bool)

(assert (=> b!1059816 (= e!603285 tp_is_empty!24987)))

(declare-fun b!1059817 () Bool)

(assert (=> b!1059817 (= e!603288 tp_is_empty!24987)))

(declare-fun b!1059818 () Bool)

(assert (=> b!1059818 (= e!603284 (bvsgt #b00000000000000000000000000000000 (size!32744 _keys!1163)))))

(assert (= (and start!93682 res!707914) b!1059815))

(assert (= (and b!1059815 res!707913) b!1059813))

(assert (= (and b!1059813 res!707912) b!1059812))

(assert (= (and b!1059812 res!707911) b!1059818))

(assert (= (and b!1059814 condMapEmpty!39145) mapIsEmpty!39145))

(assert (= (and b!1059814 (not condMapEmpty!39145)) mapNonEmpty!39145))

(get-info :version)

(assert (= (and mapNonEmpty!39145 ((_ is ValueCellFull!11790) mapValue!39145)) b!1059816))

(assert (= (and b!1059814 ((_ is ValueCellFull!11790) mapDefault!39145)) b!1059817))

(assert (= start!93682 b!1059814))

(declare-fun m!979111 () Bool)

(assert (=> b!1059812 m!979111))

(declare-fun m!979113 () Bool)

(assert (=> mapNonEmpty!39145 m!979113))

(declare-fun m!979115 () Bool)

(assert (=> start!93682 m!979115))

(declare-fun m!979117 () Bool)

(assert (=> start!93682 m!979117))

(declare-fun m!979119 () Bool)

(assert (=> start!93682 m!979119))

(declare-fun m!979121 () Bool)

(assert (=> b!1059813 m!979121))

(check-sat (not b!1059813) (not mapNonEmpty!39145) tp_is_empty!24987 (not start!93682) (not b!1059812))
(check-sat)
(get-model)

(declare-fun b!1059850 () Bool)

(declare-fun e!603312 () Bool)

(declare-fun call!44887 () Bool)

(assert (=> b!1059850 (= e!603312 call!44887)))

(declare-fun b!1059851 () Bool)

(declare-fun e!603315 () Bool)

(assert (=> b!1059851 (= e!603315 e!603312)))

(declare-fun c!107196 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059851 (= c!107196 (validKeyInArray!0 (select (arr!32208 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44884 () Bool)

(assert (=> bm!44884 (= call!44887 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107196 (Cons!22440 (select (arr!32208 _keys!1163) #b00000000000000000000000000000000) Nil!22441) Nil!22441)))))

(declare-fun b!1059852 () Bool)

(declare-fun e!603314 () Bool)

(declare-fun contains!6217 (List!22444 (_ BitVec 64)) Bool)

(assert (=> b!1059852 (= e!603314 (contains!6217 Nil!22441 (select (arr!32208 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1059853 () Bool)

(declare-fun e!603313 () Bool)

(assert (=> b!1059853 (= e!603313 e!603315)))

(declare-fun res!707934 () Bool)

(assert (=> b!1059853 (=> (not res!707934) (not e!603315))))

(assert (=> b!1059853 (= res!707934 (not e!603314))))

(declare-fun res!707935 () Bool)

(assert (=> b!1059853 (=> (not res!707935) (not e!603314))))

(assert (=> b!1059853 (= res!707935 (validKeyInArray!0 (select (arr!32208 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1059854 () Bool)

(assert (=> b!1059854 (= e!603312 call!44887)))

(declare-fun d!128747 () Bool)

(declare-fun res!707933 () Bool)

(assert (=> d!128747 (=> res!707933 e!603313)))

(assert (=> d!128747 (= res!707933 (bvsge #b00000000000000000000000000000000 (size!32744 _keys!1163)))))

(assert (=> d!128747 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22441) e!603313)))

(assert (= (and d!128747 (not res!707933)) b!1059853))

(assert (= (and b!1059853 res!707935) b!1059852))

(assert (= (and b!1059853 res!707934) b!1059851))

(assert (= (and b!1059851 c!107196) b!1059854))

(assert (= (and b!1059851 (not c!107196)) b!1059850))

(assert (= (or b!1059854 b!1059850) bm!44884))

(declare-fun m!979135 () Bool)

(assert (=> b!1059851 m!979135))

(assert (=> b!1059851 m!979135))

(declare-fun m!979137 () Bool)

(assert (=> b!1059851 m!979137))

(assert (=> bm!44884 m!979135))

(declare-fun m!979139 () Bool)

(assert (=> bm!44884 m!979139))

(assert (=> b!1059852 m!979135))

(assert (=> b!1059852 m!979135))

(declare-fun m!979141 () Bool)

(assert (=> b!1059852 m!979141))

(assert (=> b!1059853 m!979135))

(assert (=> b!1059853 m!979135))

(assert (=> b!1059853 m!979137))

(assert (=> b!1059812 d!128747))

(declare-fun d!128749 () Bool)

(assert (=> d!128749 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93682 d!128749))

(declare-fun d!128751 () Bool)

(assert (=> d!128751 (= (array_inv!24964 _values!955) (bvsge (size!32745 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93682 d!128751))

(declare-fun d!128753 () Bool)

(assert (=> d!128753 (= (array_inv!24965 _keys!1163) (bvsge (size!32744 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93682 d!128753))

(declare-fun d!128755 () Bool)

(declare-fun res!707940 () Bool)

(declare-fun e!603323 () Bool)

(assert (=> d!128755 (=> res!707940 e!603323)))

(assert (=> d!128755 (= res!707940 (bvsge #b00000000000000000000000000000000 (size!32744 _keys!1163)))))

(assert (=> d!128755 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!603323)))

(declare-fun b!1059863 () Bool)

(declare-fun e!603324 () Bool)

(declare-fun call!44890 () Bool)

(assert (=> b!1059863 (= e!603324 call!44890)))

(declare-fun b!1059864 () Bool)

(declare-fun e!603322 () Bool)

(assert (=> b!1059864 (= e!603322 e!603324)))

(declare-fun lt!467186 () (_ BitVec 64))

(assert (=> b!1059864 (= lt!467186 (select (arr!32208 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34726 0))(
  ( (Unit!34727) )
))
(declare-fun lt!467188 () Unit!34726)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66997 (_ BitVec 64) (_ BitVec 32)) Unit!34726)

(assert (=> b!1059864 (= lt!467188 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!467186 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66997 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059864 (arrayContainsKey!0 _keys!1163 lt!467186 #b00000000000000000000000000000000)))

(declare-fun lt!467187 () Unit!34726)

(assert (=> b!1059864 (= lt!467187 lt!467188)))

(declare-fun res!707941 () Bool)

(declare-datatypes ((SeekEntryResult!9869 0))(
  ( (MissingZero!9869 (index!41847 (_ BitVec 32))) (Found!9869 (index!41848 (_ BitVec 32))) (Intermediate!9869 (undefined!10681 Bool) (index!41849 (_ BitVec 32)) (x!94730 (_ BitVec 32))) (Undefined!9869) (MissingVacant!9869 (index!41850 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66997 (_ BitVec 32)) SeekEntryResult!9869)

(assert (=> b!1059864 (= res!707941 (= (seekEntryOrOpen!0 (select (arr!32208 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9869 #b00000000000000000000000000000000)))))

(assert (=> b!1059864 (=> (not res!707941) (not e!603324))))

(declare-fun b!1059865 () Bool)

(assert (=> b!1059865 (= e!603323 e!603322)))

(declare-fun c!107199 () Bool)

(assert (=> b!1059865 (= c!107199 (validKeyInArray!0 (select (arr!32208 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun bm!44887 () Bool)

(assert (=> bm!44887 (= call!44890 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1059866 () Bool)

(assert (=> b!1059866 (= e!603322 call!44890)))

(assert (= (and d!128755 (not res!707940)) b!1059865))

(assert (= (and b!1059865 c!107199) b!1059864))

(assert (= (and b!1059865 (not c!107199)) b!1059866))

(assert (= (and b!1059864 res!707941) b!1059863))

(assert (= (or b!1059863 b!1059866) bm!44887))

(assert (=> b!1059864 m!979135))

(declare-fun m!979143 () Bool)

(assert (=> b!1059864 m!979143))

(declare-fun m!979145 () Bool)

(assert (=> b!1059864 m!979145))

(assert (=> b!1059864 m!979135))

(declare-fun m!979147 () Bool)

(assert (=> b!1059864 m!979147))

(assert (=> b!1059865 m!979135))

(assert (=> b!1059865 m!979135))

(assert (=> b!1059865 m!979137))

(declare-fun m!979149 () Bool)

(assert (=> bm!44887 m!979149))

(assert (=> b!1059813 d!128755))

(declare-fun mapNonEmpty!39151 () Bool)

(declare-fun mapRes!39151 () Bool)

(declare-fun tp!74957 () Bool)

(declare-fun e!603330 () Bool)

(assert (=> mapNonEmpty!39151 (= mapRes!39151 (and tp!74957 e!603330))))

(declare-fun mapKey!39151 () (_ BitVec 32))

(declare-fun mapRest!39151 () (Array (_ BitVec 32) ValueCell!11790))

(declare-fun mapValue!39151 () ValueCell!11790)

(assert (=> mapNonEmpty!39151 (= mapRest!39145 (store mapRest!39151 mapKey!39151 mapValue!39151))))

(declare-fun mapIsEmpty!39151 () Bool)

(assert (=> mapIsEmpty!39151 mapRes!39151))

(declare-fun b!1059873 () Bool)

(assert (=> b!1059873 (= e!603330 tp_is_empty!24987)))

(declare-fun b!1059874 () Bool)

(declare-fun e!603329 () Bool)

(assert (=> b!1059874 (= e!603329 tp_is_empty!24987)))

(declare-fun condMapEmpty!39151 () Bool)

(declare-fun mapDefault!39151 () ValueCell!11790)

(assert (=> mapNonEmpty!39145 (= condMapEmpty!39151 (= mapRest!39145 ((as const (Array (_ BitVec 32) ValueCell!11790)) mapDefault!39151)))))

(assert (=> mapNonEmpty!39145 (= tp!74951 (and e!603329 mapRes!39151))))

(assert (= (and mapNonEmpty!39145 condMapEmpty!39151) mapIsEmpty!39151))

(assert (= (and mapNonEmpty!39145 (not condMapEmpty!39151)) mapNonEmpty!39151))

(assert (= (and mapNonEmpty!39151 ((_ is ValueCellFull!11790) mapValue!39151)) b!1059873))

(assert (= (and mapNonEmpty!39145 ((_ is ValueCellFull!11790) mapDefault!39151)) b!1059874))

(declare-fun m!979151 () Bool)

(assert (=> mapNonEmpty!39151 m!979151))

(check-sat (not mapNonEmpty!39151) (not b!1059851) (not bm!44887) tp_is_empty!24987 (not b!1059852) (not b!1059864) (not b!1059853) (not b!1059865) (not bm!44884))
(check-sat)
