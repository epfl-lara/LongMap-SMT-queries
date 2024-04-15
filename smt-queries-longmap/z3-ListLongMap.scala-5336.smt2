; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71268 () Bool)

(assert start!71268)

(declare-fun b_free!13423 () Bool)

(declare-fun b_next!13423 () Bool)

(assert (=> start!71268 (= b_free!13423 (not b_next!13423))))

(declare-fun tp!47034 () Bool)

(declare-fun b_and!22343 () Bool)

(assert (=> start!71268 (= tp!47034 b_and!22343)))

(declare-fun b!827731 () Bool)

(declare-fun e!461169 () Bool)

(declare-fun tp_is_empty!15133 () Bool)

(assert (=> b!827731 (= e!461169 tp_is_empty!15133)))

(declare-fun b!827732 () Bool)

(declare-datatypes ((V!25179 0))(
  ( (V!25180 (val!7614 Int)) )
))
(declare-fun zeroValueBefore!34 () V!25179)

(declare-datatypes ((array!46403 0))(
  ( (array!46404 (arr!22245 (Array (_ BitVec 32) (_ BitVec 64))) (size!22666 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46403)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!25179)

(declare-fun minValue!754 () V!25179)

(declare-datatypes ((ValueCell!7151 0))(
  ( (ValueCellFull!7151 (v!10043 V!25179)) (EmptyCell!7151) )
))
(declare-datatypes ((array!46405 0))(
  ( (array!46406 (arr!22246 (Array (_ BitVec 32) ValueCell!7151)) (size!22667 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46405)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun e!461171 () Bool)

(declare-datatypes ((tuple2!10102 0))(
  ( (tuple2!10103 (_1!5062 (_ BitVec 64)) (_2!5062 V!25179)) )
))
(declare-datatypes ((List!15889 0))(
  ( (Nil!15886) (Cons!15885 (h!17014 tuple2!10102) (t!22231 List!15889)) )
))
(declare-datatypes ((ListLongMap!8915 0))(
  ( (ListLongMap!8916 (toList!4473 List!15889)) )
))
(declare-fun +!1984 (ListLongMap!8915 tuple2!10102) ListLongMap!8915)

(declare-fun getCurrentListMap!2528 (array!46403 array!46405 (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 (_ BitVec 32) Int) ListLongMap!8915)

(assert (=> b!827732 (= e!461171 (= (+!1984 (getCurrentListMap!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)))))

(declare-fun b!827733 () Bool)

(declare-fun res!564162 () Bool)

(declare-fun e!461170 () Bool)

(assert (=> b!827733 (=> (not res!564162) (not e!461170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46403 (_ BitVec 32)) Bool)

(assert (=> b!827733 (= res!564162 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827734 () Bool)

(declare-fun res!564164 () Bool)

(assert (=> b!827734 (=> (not res!564164) (not e!461170))))

(declare-datatypes ((List!15890 0))(
  ( (Nil!15887) (Cons!15886 (h!17015 (_ BitVec 64)) (t!22232 List!15890)) )
))
(declare-fun arrayNoDuplicates!0 (array!46403 (_ BitVec 32) List!15890) Bool)

(assert (=> b!827734 (= res!564164 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15887))))

(declare-fun b!827735 () Bool)

(assert (=> b!827735 (= e!461170 (not e!461171))))

(declare-fun res!564163 () Bool)

(assert (=> b!827735 (=> res!564163 e!461171)))

(assert (=> b!827735 (= res!564163 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!374832 () ListLongMap!8915)

(declare-fun lt!374831 () ListLongMap!8915)

(assert (=> b!827735 (= lt!374832 lt!374831)))

(declare-datatypes ((Unit!28317 0))(
  ( (Unit!28318) )
))
(declare-fun lt!374830 () Unit!28317)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!575 (array!46403 array!46405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 V!25179 V!25179 (_ BitVec 32) Int) Unit!28317)

(assert (=> b!827735 (= lt!374830 (lemmaNoChangeToArrayThenSameMapNoExtras!575 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2505 (array!46403 array!46405 (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 (_ BitVec 32) Int) ListLongMap!8915)

(assert (=> b!827735 (= lt!374831 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827735 (= lt!374832 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!564160 () Bool)

(assert (=> start!71268 (=> (not res!564160) (not e!461170))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71268 (= res!564160 (validMask!0 mask!1312))))

(assert (=> start!71268 e!461170))

(assert (=> start!71268 tp_is_empty!15133))

(declare-fun array_inv!17783 (array!46403) Bool)

(assert (=> start!71268 (array_inv!17783 _keys!976)))

(assert (=> start!71268 true))

(declare-fun e!461168 () Bool)

(declare-fun array_inv!17784 (array!46405) Bool)

(assert (=> start!71268 (and (array_inv!17784 _values!788) e!461168)))

(assert (=> start!71268 tp!47034))

(declare-fun mapNonEmpty!24331 () Bool)

(declare-fun mapRes!24331 () Bool)

(declare-fun tp!47035 () Bool)

(assert (=> mapNonEmpty!24331 (= mapRes!24331 (and tp!47035 e!461169))))

(declare-fun mapKey!24331 () (_ BitVec 32))

(declare-fun mapValue!24331 () ValueCell!7151)

(declare-fun mapRest!24331 () (Array (_ BitVec 32) ValueCell!7151))

(assert (=> mapNonEmpty!24331 (= (arr!22246 _values!788) (store mapRest!24331 mapKey!24331 mapValue!24331))))

(declare-fun mapIsEmpty!24331 () Bool)

(assert (=> mapIsEmpty!24331 mapRes!24331))

(declare-fun b!827736 () Bool)

(declare-fun res!564161 () Bool)

(assert (=> b!827736 (=> (not res!564161) (not e!461170))))

(assert (=> b!827736 (= res!564161 (and (= (size!22667 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22666 _keys!976) (size!22667 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827737 () Bool)

(declare-fun e!461167 () Bool)

(assert (=> b!827737 (= e!461168 (and e!461167 mapRes!24331))))

(declare-fun condMapEmpty!24331 () Bool)

(declare-fun mapDefault!24331 () ValueCell!7151)

(assert (=> b!827737 (= condMapEmpty!24331 (= (arr!22246 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7151)) mapDefault!24331)))))

(declare-fun b!827738 () Bool)

(assert (=> b!827738 (= e!461167 tp_is_empty!15133)))

(assert (= (and start!71268 res!564160) b!827736))

(assert (= (and b!827736 res!564161) b!827733))

(assert (= (and b!827733 res!564162) b!827734))

(assert (= (and b!827734 res!564164) b!827735))

(assert (= (and b!827735 (not res!564163)) b!827732))

(assert (= (and b!827737 condMapEmpty!24331) mapIsEmpty!24331))

(assert (= (and b!827737 (not condMapEmpty!24331)) mapNonEmpty!24331))

(get-info :version)

(assert (= (and mapNonEmpty!24331 ((_ is ValueCellFull!7151) mapValue!24331)) b!827731))

(assert (= (and b!827737 ((_ is ValueCellFull!7151) mapDefault!24331)) b!827738))

(assert (= start!71268 b!827737))

(declare-fun m!770175 () Bool)

(assert (=> b!827734 m!770175))

(declare-fun m!770177 () Bool)

(assert (=> mapNonEmpty!24331 m!770177))

(declare-fun m!770179 () Bool)

(assert (=> b!827735 m!770179))

(declare-fun m!770181 () Bool)

(assert (=> b!827735 m!770181))

(declare-fun m!770183 () Bool)

(assert (=> b!827735 m!770183))

(declare-fun m!770185 () Bool)

(assert (=> start!71268 m!770185))

(declare-fun m!770187 () Bool)

(assert (=> start!71268 m!770187))

(declare-fun m!770189 () Bool)

(assert (=> start!71268 m!770189))

(declare-fun m!770191 () Bool)

(assert (=> b!827732 m!770191))

(assert (=> b!827732 m!770191))

(declare-fun m!770193 () Bool)

(assert (=> b!827732 m!770193))

(declare-fun m!770195 () Bool)

(assert (=> b!827732 m!770195))

(declare-fun m!770197 () Bool)

(assert (=> b!827733 m!770197))

(check-sat (not mapNonEmpty!24331) (not b!827734) (not b!827735) b_and!22343 tp_is_empty!15133 (not b_next!13423) (not b!827733) (not start!71268) (not b!827732))
(check-sat b_and!22343 (not b_next!13423))
(get-model)

(declare-fun bm!35930 () Bool)

(declare-fun call!35933 () Bool)

(declare-fun c!89477 () Bool)

(assert (=> bm!35930 (= call!35933 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89477 (Cons!15886 (select (arr!22245 _keys!976) #b00000000000000000000000000000000) Nil!15887) Nil!15887)))))

(declare-fun b!827797 () Bool)

(declare-fun e!461220 () Bool)

(declare-fun contains!4166 (List!15890 (_ BitVec 64)) Bool)

(assert (=> b!827797 (= e!461220 (contains!4166 Nil!15887 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827798 () Bool)

(declare-fun e!461219 () Bool)

(assert (=> b!827798 (= e!461219 call!35933)))

(declare-fun d!104949 () Bool)

(declare-fun res!564201 () Bool)

(declare-fun e!461218 () Bool)

(assert (=> d!104949 (=> res!564201 e!461218)))

(assert (=> d!104949 (= res!564201 (bvsge #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (=> d!104949 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15887) e!461218)))

(declare-fun b!827799 () Bool)

(assert (=> b!827799 (= e!461219 call!35933)))

(declare-fun b!827800 () Bool)

(declare-fun e!461217 () Bool)

(assert (=> b!827800 (= e!461217 e!461219)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!827800 (= c!89477 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827801 () Bool)

(assert (=> b!827801 (= e!461218 e!461217)))

(declare-fun res!564203 () Bool)

(assert (=> b!827801 (=> (not res!564203) (not e!461217))))

(assert (=> b!827801 (= res!564203 (not e!461220))))

(declare-fun res!564202 () Bool)

(assert (=> b!827801 (=> (not res!564202) (not e!461220))))

(assert (=> b!827801 (= res!564202 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104949 (not res!564201)) b!827801))

(assert (= (and b!827801 res!564202) b!827797))

(assert (= (and b!827801 res!564203) b!827800))

(assert (= (and b!827800 c!89477) b!827798))

(assert (= (and b!827800 (not c!89477)) b!827799))

(assert (= (or b!827798 b!827799) bm!35930))

(declare-fun m!770247 () Bool)

(assert (=> bm!35930 m!770247))

(declare-fun m!770249 () Bool)

(assert (=> bm!35930 m!770249))

(assert (=> b!827797 m!770247))

(assert (=> b!827797 m!770247))

(declare-fun m!770251 () Bool)

(assert (=> b!827797 m!770251))

(assert (=> b!827800 m!770247))

(assert (=> b!827800 m!770247))

(declare-fun m!770253 () Bool)

(assert (=> b!827800 m!770253))

(assert (=> b!827801 m!770247))

(assert (=> b!827801 m!770247))

(assert (=> b!827801 m!770253))

(assert (=> b!827734 d!104949))

(declare-fun b!827810 () Bool)

(declare-fun e!461229 () Bool)

(declare-fun call!35936 () Bool)

(assert (=> b!827810 (= e!461229 call!35936)))

(declare-fun bm!35933 () Bool)

(assert (=> bm!35933 (= call!35936 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104951 () Bool)

(declare-fun res!564209 () Bool)

(declare-fun e!461227 () Bool)

(assert (=> d!104951 (=> res!564209 e!461227)))

(assert (=> d!104951 (= res!564209 (bvsge #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (=> d!104951 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!461227)))

(declare-fun b!827811 () Bool)

(declare-fun e!461228 () Bool)

(assert (=> b!827811 (= e!461229 e!461228)))

(declare-fun lt!374859 () (_ BitVec 64))

(assert (=> b!827811 (= lt!374859 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374858 () Unit!28317)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46403 (_ BitVec 64) (_ BitVec 32)) Unit!28317)

(assert (=> b!827811 (= lt!374858 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!374859 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!827811 (arrayContainsKey!0 _keys!976 lt!374859 #b00000000000000000000000000000000)))

(declare-fun lt!374857 () Unit!28317)

(assert (=> b!827811 (= lt!374857 lt!374858)))

(declare-fun res!564208 () Bool)

(declare-datatypes ((SeekEntryResult!8733 0))(
  ( (MissingZero!8733 (index!37303 (_ BitVec 32))) (Found!8733 (index!37304 (_ BitVec 32))) (Intermediate!8733 (undefined!9545 Bool) (index!37305 (_ BitVec 32)) (x!69920 (_ BitVec 32))) (Undefined!8733) (MissingVacant!8733 (index!37306 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46403 (_ BitVec 32)) SeekEntryResult!8733)

(assert (=> b!827811 (= res!564208 (= (seekEntryOrOpen!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8733 #b00000000000000000000000000000000)))))

(assert (=> b!827811 (=> (not res!564208) (not e!461228))))

(declare-fun b!827812 () Bool)

(assert (=> b!827812 (= e!461227 e!461229)))

(declare-fun c!89480 () Bool)

(assert (=> b!827812 (= c!89480 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827813 () Bool)

(assert (=> b!827813 (= e!461228 call!35936)))

(assert (= (and d!104951 (not res!564209)) b!827812))

(assert (= (and b!827812 c!89480) b!827811))

(assert (= (and b!827812 (not c!89480)) b!827810))

(assert (= (and b!827811 res!564208) b!827813))

(assert (= (or b!827813 b!827810) bm!35933))

(declare-fun m!770255 () Bool)

(assert (=> bm!35933 m!770255))

(assert (=> b!827811 m!770247))

(declare-fun m!770257 () Bool)

(assert (=> b!827811 m!770257))

(declare-fun m!770259 () Bool)

(assert (=> b!827811 m!770259))

(assert (=> b!827811 m!770247))

(declare-fun m!770261 () Bool)

(assert (=> b!827811 m!770261))

(assert (=> b!827812 m!770247))

(assert (=> b!827812 m!770247))

(assert (=> b!827812 m!770253))

(assert (=> b!827733 d!104951))

(declare-fun d!104953 () Bool)

(assert (=> d!104953 (= (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374862 () Unit!28317)

(declare-fun choose!1418 (array!46403 array!46405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 V!25179 V!25179 (_ BitVec 32) Int) Unit!28317)

(assert (=> d!104953 (= lt!374862 (choose!1418 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104953 (validMask!0 mask!1312)))

(assert (=> d!104953 (= (lemmaNoChangeToArrayThenSameMapNoExtras!575 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374862)))

(declare-fun bs!23109 () Bool)

(assert (= bs!23109 d!104953))

(assert (=> bs!23109 m!770183))

(assert (=> bs!23109 m!770181))

(declare-fun m!770263 () Bool)

(assert (=> bs!23109 m!770263))

(assert (=> bs!23109 m!770185))

(assert (=> b!827735 d!104953))

(declare-fun d!104955 () Bool)

(declare-fun e!461244 () Bool)

(assert (=> d!104955 e!461244))

(declare-fun res!564220 () Bool)

(assert (=> d!104955 (=> (not res!564220) (not e!461244))))

(declare-fun lt!374880 () ListLongMap!8915)

(declare-fun contains!4167 (ListLongMap!8915 (_ BitVec 64)) Bool)

(assert (=> d!104955 (= res!564220 (not (contains!4167 lt!374880 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!461249 () ListLongMap!8915)

(assert (=> d!104955 (= lt!374880 e!461249)))

(declare-fun c!89491 () Bool)

(assert (=> d!104955 (= c!89491 (bvsge #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (=> d!104955 (validMask!0 mask!1312)))

(assert (=> d!104955 (= (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374880)))

(declare-fun b!827838 () Bool)

(declare-fun e!461248 () Bool)

(assert (=> b!827838 (= e!461248 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827838 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827839 () Bool)

(declare-fun e!461250 () Bool)

(declare-fun isEmpty!652 (ListLongMap!8915) Bool)

(assert (=> b!827839 (= e!461250 (isEmpty!652 lt!374880))))

(declare-fun b!827840 () Bool)

(declare-fun e!461245 () Bool)

(assert (=> b!827840 (= e!461244 e!461245)))

(declare-fun c!89489 () Bool)

(assert (=> b!827840 (= c!89489 e!461248)))

(declare-fun res!564219 () Bool)

(assert (=> b!827840 (=> (not res!564219) (not e!461248))))

(assert (=> b!827840 (= res!564219 (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun b!827841 () Bool)

(declare-fun res!564218 () Bool)

(assert (=> b!827841 (=> (not res!564218) (not e!461244))))

(assert (=> b!827841 (= res!564218 (not (contains!4167 lt!374880 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!827842 () Bool)

(assert (=> b!827842 (= e!461250 (= lt!374880 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827843 () Bool)

(declare-fun e!461246 () ListLongMap!8915)

(assert (=> b!827843 (= e!461249 e!461246)))

(declare-fun c!89490 () Bool)

(assert (=> b!827843 (= c!89490 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827844 () Bool)

(declare-fun lt!374883 () Unit!28317)

(declare-fun lt!374881 () Unit!28317)

(assert (=> b!827844 (= lt!374883 lt!374881)))

(declare-fun lt!374877 () (_ BitVec 64))

(declare-fun lt!374879 () ListLongMap!8915)

(declare-fun lt!374882 () (_ BitVec 64))

(declare-fun lt!374878 () V!25179)

(assert (=> b!827844 (not (contains!4167 (+!1984 lt!374879 (tuple2!10103 lt!374877 lt!374878)) lt!374882))))

(declare-fun addStillNotContains!191 (ListLongMap!8915 (_ BitVec 64) V!25179 (_ BitVec 64)) Unit!28317)

(assert (=> b!827844 (= lt!374881 (addStillNotContains!191 lt!374879 lt!374877 lt!374878 lt!374882))))

(assert (=> b!827844 (= lt!374882 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!11792 (ValueCell!7151 V!25179) V!25179)

(declare-fun dynLambda!979 (Int (_ BitVec 64)) V!25179)

(assert (=> b!827844 (= lt!374878 (get!11792 (select (arr!22246 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827844 (= lt!374877 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35939 () ListLongMap!8915)

(assert (=> b!827844 (= lt!374879 call!35939)))

(assert (=> b!827844 (= e!461246 (+!1984 call!35939 (tuple2!10103 (select (arr!22245 _keys!976) #b00000000000000000000000000000000) (get!11792 (select (arr!22246 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827845 () Bool)

(assert (=> b!827845 (= e!461249 (ListLongMap!8916 Nil!15886))))

(declare-fun b!827846 () Bool)

(assert (=> b!827846 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (=> b!827846 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22667 _values!788)))))

(declare-fun e!461247 () Bool)

(declare-fun apply!365 (ListLongMap!8915 (_ BitVec 64)) V!25179)

(assert (=> b!827846 (= e!461247 (= (apply!365 lt!374880 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)) (get!11792 (select (arr!22246 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!827847 () Bool)

(assert (=> b!827847 (= e!461246 call!35939)))

(declare-fun b!827848 () Bool)

(assert (=> b!827848 (= e!461245 e!461247)))

(assert (=> b!827848 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun res!564221 () Bool)

(assert (=> b!827848 (= res!564221 (contains!4167 lt!374880 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827848 (=> (not res!564221) (not e!461247))))

(declare-fun bm!35936 () Bool)

(assert (=> bm!35936 (= call!35939 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827849 () Bool)

(assert (=> b!827849 (= e!461245 e!461250)))

(declare-fun c!89492 () Bool)

(assert (=> b!827849 (= c!89492 (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (= (and d!104955 c!89491) b!827845))

(assert (= (and d!104955 (not c!89491)) b!827843))

(assert (= (and b!827843 c!89490) b!827844))

(assert (= (and b!827843 (not c!89490)) b!827847))

(assert (= (or b!827844 b!827847) bm!35936))

(assert (= (and d!104955 res!564220) b!827841))

(assert (= (and b!827841 res!564218) b!827840))

(assert (= (and b!827840 res!564219) b!827838))

(assert (= (and b!827840 c!89489) b!827848))

(assert (= (and b!827840 (not c!89489)) b!827849))

(assert (= (and b!827848 res!564221) b!827846))

(assert (= (and b!827849 c!89492) b!827842))

(assert (= (and b!827849 (not c!89492)) b!827839))

(declare-fun b_lambda!11161 () Bool)

(assert (=> (not b_lambda!11161) (not b!827844)))

(declare-fun t!22238 () Bool)

(declare-fun tb!4203 () Bool)

(assert (=> (and start!71268 (= defaultEntry!796 defaultEntry!796) t!22238) tb!4203))

(declare-fun result!7965 () Bool)

(assert (=> tb!4203 (= result!7965 tp_is_empty!15133)))

(assert (=> b!827844 t!22238))

(declare-fun b_and!22349 () Bool)

(assert (= b_and!22343 (and (=> t!22238 result!7965) b_and!22349)))

(declare-fun b_lambda!11163 () Bool)

(assert (=> (not b_lambda!11163) (not b!827846)))

(assert (=> b!827846 t!22238))

(declare-fun b_and!22351 () Bool)

(assert (= b_and!22349 (and (=> t!22238 result!7965) b_and!22351)))

(assert (=> b!827848 m!770247))

(assert (=> b!827848 m!770247))

(declare-fun m!770265 () Bool)

(assert (=> b!827848 m!770265))

(declare-fun m!770267 () Bool)

(assert (=> bm!35936 m!770267))

(declare-fun m!770269 () Bool)

(assert (=> b!827844 m!770269))

(declare-fun m!770271 () Bool)

(assert (=> b!827844 m!770271))

(declare-fun m!770273 () Bool)

(assert (=> b!827844 m!770273))

(declare-fun m!770275 () Bool)

(assert (=> b!827844 m!770275))

(declare-fun m!770277 () Bool)

(assert (=> b!827844 m!770277))

(declare-fun m!770279 () Bool)

(assert (=> b!827844 m!770279))

(declare-fun m!770281 () Bool)

(assert (=> b!827844 m!770281))

(assert (=> b!827844 m!770247))

(assert (=> b!827844 m!770279))

(assert (=> b!827844 m!770269))

(assert (=> b!827844 m!770277))

(declare-fun m!770283 () Bool)

(assert (=> b!827841 m!770283))

(assert (=> b!827842 m!770267))

(assert (=> b!827846 m!770277))

(assert (=> b!827846 m!770279))

(assert (=> b!827846 m!770281))

(assert (=> b!827846 m!770247))

(assert (=> b!827846 m!770277))

(assert (=> b!827846 m!770247))

(declare-fun m!770285 () Bool)

(assert (=> b!827846 m!770285))

(assert (=> b!827846 m!770279))

(assert (=> b!827838 m!770247))

(assert (=> b!827838 m!770247))

(assert (=> b!827838 m!770253))

(assert (=> b!827843 m!770247))

(assert (=> b!827843 m!770247))

(assert (=> b!827843 m!770253))

(declare-fun m!770287 () Bool)

(assert (=> b!827839 m!770287))

(declare-fun m!770289 () Bool)

(assert (=> d!104955 m!770289))

(assert (=> d!104955 m!770185))

(assert (=> b!827735 d!104955))

(declare-fun d!104957 () Bool)

(declare-fun e!461251 () Bool)

(assert (=> d!104957 e!461251))

(declare-fun res!564224 () Bool)

(assert (=> d!104957 (=> (not res!564224) (not e!461251))))

(declare-fun lt!374887 () ListLongMap!8915)

(assert (=> d!104957 (= res!564224 (not (contains!4167 lt!374887 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!461256 () ListLongMap!8915)

(assert (=> d!104957 (= lt!374887 e!461256)))

(declare-fun c!89495 () Bool)

(assert (=> d!104957 (= c!89495 (bvsge #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (=> d!104957 (validMask!0 mask!1312)))

(assert (=> d!104957 (= (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374887)))

(declare-fun b!827852 () Bool)

(declare-fun e!461255 () Bool)

(assert (=> b!827852 (= e!461255 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827852 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827853 () Bool)

(declare-fun e!461257 () Bool)

(assert (=> b!827853 (= e!461257 (isEmpty!652 lt!374887))))

(declare-fun b!827854 () Bool)

(declare-fun e!461252 () Bool)

(assert (=> b!827854 (= e!461251 e!461252)))

(declare-fun c!89493 () Bool)

(assert (=> b!827854 (= c!89493 e!461255)))

(declare-fun res!564223 () Bool)

(assert (=> b!827854 (=> (not res!564223) (not e!461255))))

(assert (=> b!827854 (= res!564223 (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun b!827855 () Bool)

(declare-fun res!564222 () Bool)

(assert (=> b!827855 (=> (not res!564222) (not e!461251))))

(assert (=> b!827855 (= res!564222 (not (contains!4167 lt!374887 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!827856 () Bool)

(assert (=> b!827856 (= e!461257 (= lt!374887 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827857 () Bool)

(declare-fun e!461253 () ListLongMap!8915)

(assert (=> b!827857 (= e!461256 e!461253)))

(declare-fun c!89494 () Bool)

(assert (=> b!827857 (= c!89494 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827858 () Bool)

(declare-fun lt!374890 () Unit!28317)

(declare-fun lt!374888 () Unit!28317)

(assert (=> b!827858 (= lt!374890 lt!374888)))

(declare-fun lt!374886 () ListLongMap!8915)

(declare-fun lt!374889 () (_ BitVec 64))

(declare-fun lt!374884 () (_ BitVec 64))

(declare-fun lt!374885 () V!25179)

(assert (=> b!827858 (not (contains!4167 (+!1984 lt!374886 (tuple2!10103 lt!374884 lt!374885)) lt!374889))))

(assert (=> b!827858 (= lt!374888 (addStillNotContains!191 lt!374886 lt!374884 lt!374885 lt!374889))))

(assert (=> b!827858 (= lt!374889 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!827858 (= lt!374885 (get!11792 (select (arr!22246 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827858 (= lt!374884 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(declare-fun call!35940 () ListLongMap!8915)

(assert (=> b!827858 (= lt!374886 call!35940)))

(assert (=> b!827858 (= e!461253 (+!1984 call!35940 (tuple2!10103 (select (arr!22245 _keys!976) #b00000000000000000000000000000000) (get!11792 (select (arr!22246 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827859 () Bool)

(assert (=> b!827859 (= e!461256 (ListLongMap!8916 Nil!15886))))

(declare-fun b!827860 () Bool)

(assert (=> b!827860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (=> b!827860 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22667 _values!788)))))

(declare-fun e!461254 () Bool)

(assert (=> b!827860 (= e!461254 (= (apply!365 lt!374887 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)) (get!11792 (select (arr!22246 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!827861 () Bool)

(assert (=> b!827861 (= e!461253 call!35940)))

(declare-fun b!827862 () Bool)

(assert (=> b!827862 (= e!461252 e!461254)))

(assert (=> b!827862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun res!564225 () Bool)

(assert (=> b!827862 (= res!564225 (contains!4167 lt!374887 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827862 (=> (not res!564225) (not e!461254))))

(declare-fun bm!35937 () Bool)

(assert (=> bm!35937 (= call!35940 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827863 () Bool)

(assert (=> b!827863 (= e!461252 e!461257)))

(declare-fun c!89496 () Bool)

(assert (=> b!827863 (= c!89496 (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (= (and d!104957 c!89495) b!827859))

(assert (= (and d!104957 (not c!89495)) b!827857))

(assert (= (and b!827857 c!89494) b!827858))

(assert (= (and b!827857 (not c!89494)) b!827861))

(assert (= (or b!827858 b!827861) bm!35937))

(assert (= (and d!104957 res!564224) b!827855))

(assert (= (and b!827855 res!564222) b!827854))

(assert (= (and b!827854 res!564223) b!827852))

(assert (= (and b!827854 c!89493) b!827862))

(assert (= (and b!827854 (not c!89493)) b!827863))

(assert (= (and b!827862 res!564225) b!827860))

(assert (= (and b!827863 c!89496) b!827856))

(assert (= (and b!827863 (not c!89496)) b!827853))

(declare-fun b_lambda!11165 () Bool)

(assert (=> (not b_lambda!11165) (not b!827858)))

(assert (=> b!827858 t!22238))

(declare-fun b_and!22353 () Bool)

(assert (= b_and!22351 (and (=> t!22238 result!7965) b_and!22353)))

(declare-fun b_lambda!11167 () Bool)

(assert (=> (not b_lambda!11167) (not b!827860)))

(assert (=> b!827860 t!22238))

(declare-fun b_and!22355 () Bool)

(assert (= b_and!22353 (and (=> t!22238 result!7965) b_and!22355)))

(assert (=> b!827862 m!770247))

(assert (=> b!827862 m!770247))

(declare-fun m!770291 () Bool)

(assert (=> b!827862 m!770291))

(declare-fun m!770293 () Bool)

(assert (=> bm!35937 m!770293))

(declare-fun m!770295 () Bool)

(assert (=> b!827858 m!770295))

(declare-fun m!770297 () Bool)

(assert (=> b!827858 m!770297))

(declare-fun m!770299 () Bool)

(assert (=> b!827858 m!770299))

(declare-fun m!770301 () Bool)

(assert (=> b!827858 m!770301))

(assert (=> b!827858 m!770277))

(assert (=> b!827858 m!770279))

(assert (=> b!827858 m!770281))

(assert (=> b!827858 m!770247))

(assert (=> b!827858 m!770279))

(assert (=> b!827858 m!770295))

(assert (=> b!827858 m!770277))

(declare-fun m!770303 () Bool)

(assert (=> b!827855 m!770303))

(assert (=> b!827856 m!770293))

(assert (=> b!827860 m!770277))

(assert (=> b!827860 m!770279))

(assert (=> b!827860 m!770281))

(assert (=> b!827860 m!770247))

(assert (=> b!827860 m!770277))

(assert (=> b!827860 m!770247))

(declare-fun m!770305 () Bool)

(assert (=> b!827860 m!770305))

(assert (=> b!827860 m!770279))

(assert (=> b!827852 m!770247))

(assert (=> b!827852 m!770247))

(assert (=> b!827852 m!770253))

(assert (=> b!827857 m!770247))

(assert (=> b!827857 m!770247))

(assert (=> b!827857 m!770253))

(declare-fun m!770307 () Bool)

(assert (=> b!827853 m!770307))

(declare-fun m!770309 () Bool)

(assert (=> d!104957 m!770309))

(assert (=> d!104957 m!770185))

(assert (=> b!827735 d!104957))

(declare-fun d!104959 () Bool)

(assert (=> d!104959 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71268 d!104959))

(declare-fun d!104961 () Bool)

(assert (=> d!104961 (= (array_inv!17783 _keys!976) (bvsge (size!22666 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71268 d!104961))

(declare-fun d!104963 () Bool)

(assert (=> d!104963 (= (array_inv!17784 _values!788) (bvsge (size!22667 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71268 d!104963))

(declare-fun d!104965 () Bool)

(declare-fun e!461260 () Bool)

(assert (=> d!104965 e!461260))

(declare-fun res!564231 () Bool)

(assert (=> d!104965 (=> (not res!564231) (not e!461260))))

(declare-fun lt!374900 () ListLongMap!8915)

(assert (=> d!104965 (= res!564231 (contains!4167 lt!374900 (_1!5062 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!374901 () List!15889)

(assert (=> d!104965 (= lt!374900 (ListLongMap!8916 lt!374901))))

(declare-fun lt!374899 () Unit!28317)

(declare-fun lt!374902 () Unit!28317)

(assert (=> d!104965 (= lt!374899 lt!374902)))

(declare-datatypes ((Option!412 0))(
  ( (Some!411 (v!10046 V!25179)) (None!410) )
))
(declare-fun getValueByKey!406 (List!15889 (_ BitVec 64)) Option!412)

(assert (=> d!104965 (= (getValueByKey!406 lt!374901 (_1!5062 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!411 (_2!5062 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lemmaContainsTupThenGetReturnValue!223 (List!15889 (_ BitVec 64) V!25179) Unit!28317)

(assert (=> d!104965 (= lt!374902 (lemmaContainsTupThenGetReturnValue!223 lt!374901 (_1!5062 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5062 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun insertStrictlySorted!262 (List!15889 (_ BitVec 64) V!25179) List!15889)

(assert (=> d!104965 (= lt!374901 (insertStrictlySorted!262 (toList!4473 (getCurrentListMap!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)) (_1!5062 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5062 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!104965 (= (+!1984 (getCurrentListMap!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374900)))

(declare-fun b!827868 () Bool)

(declare-fun res!564230 () Bool)

(assert (=> b!827868 (=> (not res!564230) (not e!461260))))

(assert (=> b!827868 (= res!564230 (= (getValueByKey!406 (toList!4473 lt!374900) (_1!5062 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!411 (_2!5062 (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!827869 () Bool)

(declare-fun contains!4168 (List!15889 tuple2!10102) Bool)

(assert (=> b!827869 (= e!461260 (contains!4168 (toList!4473 lt!374900) (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!104965 res!564231) b!827868))

(assert (= (and b!827868 res!564230) b!827869))

(declare-fun m!770311 () Bool)

(assert (=> d!104965 m!770311))

(declare-fun m!770313 () Bool)

(assert (=> d!104965 m!770313))

(declare-fun m!770315 () Bool)

(assert (=> d!104965 m!770315))

(declare-fun m!770317 () Bool)

(assert (=> d!104965 m!770317))

(declare-fun m!770319 () Bool)

(assert (=> b!827868 m!770319))

(declare-fun m!770321 () Bool)

(assert (=> b!827869 m!770321))

(assert (=> b!827732 d!104965))

(declare-fun b!827912 () Bool)

(declare-fun e!461287 () Unit!28317)

(declare-fun Unit!28321 () Unit!28317)

(assert (=> b!827912 (= e!461287 Unit!28321)))

(declare-fun call!35959 () ListLongMap!8915)

(declare-fun c!89514 () Bool)

(declare-fun bm!35952 () Bool)

(declare-fun call!35958 () ListLongMap!8915)

(declare-fun c!89511 () Bool)

(declare-fun call!35956 () ListLongMap!8915)

(declare-fun call!35960 () ListLongMap!8915)

(assert (=> bm!35952 (= call!35956 (+!1984 (ite c!89511 call!35959 (ite c!89514 call!35958 call!35960)) (ite (or c!89511 c!89514) (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!827913 () Bool)

(declare-fun e!461299 () Bool)

(declare-fun lt!374950 () ListLongMap!8915)

(assert (=> b!827913 (= e!461299 (= (apply!365 lt!374950 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!827914 () Bool)

(declare-fun lt!374948 () Unit!28317)

(assert (=> b!827914 (= e!461287 lt!374948)))

(declare-fun lt!374949 () ListLongMap!8915)

(assert (=> b!827914 (= lt!374949 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374956 () (_ BitVec 64))

(assert (=> b!827914 (= lt!374956 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374953 () (_ BitVec 64))

(assert (=> b!827914 (= lt!374953 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374963 () Unit!28317)

(declare-fun addStillContains!316 (ListLongMap!8915 (_ BitVec 64) V!25179 (_ BitVec 64)) Unit!28317)

(assert (=> b!827914 (= lt!374963 (addStillContains!316 lt!374949 lt!374956 zeroValueBefore!34 lt!374953))))

(assert (=> b!827914 (contains!4167 (+!1984 lt!374949 (tuple2!10103 lt!374956 zeroValueBefore!34)) lt!374953)))

(declare-fun lt!374957 () Unit!28317)

(assert (=> b!827914 (= lt!374957 lt!374963)))

(declare-fun lt!374952 () ListLongMap!8915)

(assert (=> b!827914 (= lt!374952 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374958 () (_ BitVec 64))

(assert (=> b!827914 (= lt!374958 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374964 () (_ BitVec 64))

(assert (=> b!827914 (= lt!374964 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374955 () Unit!28317)

(declare-fun addApplyDifferent!316 (ListLongMap!8915 (_ BitVec 64) V!25179 (_ BitVec 64)) Unit!28317)

(assert (=> b!827914 (= lt!374955 (addApplyDifferent!316 lt!374952 lt!374958 minValue!754 lt!374964))))

(assert (=> b!827914 (= (apply!365 (+!1984 lt!374952 (tuple2!10103 lt!374958 minValue!754)) lt!374964) (apply!365 lt!374952 lt!374964))))

(declare-fun lt!374960 () Unit!28317)

(assert (=> b!827914 (= lt!374960 lt!374955)))

(declare-fun lt!374965 () ListLongMap!8915)

(assert (=> b!827914 (= lt!374965 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374967 () (_ BitVec 64))

(assert (=> b!827914 (= lt!374967 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374966 () (_ BitVec 64))

(assert (=> b!827914 (= lt!374966 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374951 () Unit!28317)

(assert (=> b!827914 (= lt!374951 (addApplyDifferent!316 lt!374965 lt!374967 zeroValueBefore!34 lt!374966))))

(assert (=> b!827914 (= (apply!365 (+!1984 lt!374965 (tuple2!10103 lt!374967 zeroValueBefore!34)) lt!374966) (apply!365 lt!374965 lt!374966))))

(declare-fun lt!374959 () Unit!28317)

(assert (=> b!827914 (= lt!374959 lt!374951)))

(declare-fun lt!374947 () ListLongMap!8915)

(assert (=> b!827914 (= lt!374947 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374954 () (_ BitVec 64))

(assert (=> b!827914 (= lt!374954 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374961 () (_ BitVec 64))

(assert (=> b!827914 (= lt!374961 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827914 (= lt!374948 (addApplyDifferent!316 lt!374947 lt!374954 minValue!754 lt!374961))))

(assert (=> b!827914 (= (apply!365 (+!1984 lt!374947 (tuple2!10103 lt!374954 minValue!754)) lt!374961) (apply!365 lt!374947 lt!374961))))

(declare-fun b!827915 () Bool)

(declare-fun e!461293 () Bool)

(assert (=> b!827915 (= e!461293 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun e!461296 () Bool)

(declare-fun b!827916 () Bool)

(assert (=> b!827916 (= e!461296 (= (apply!365 lt!374950 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)) (get!11792 (select (arr!22246 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!827916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22667 _values!788)))))

(assert (=> b!827916 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun b!827917 () Bool)

(declare-fun e!461294 () ListLongMap!8915)

(declare-fun call!35961 () ListLongMap!8915)

(assert (=> b!827917 (= e!461294 call!35961)))

(declare-fun b!827918 () Bool)

(declare-fun e!461298 () Bool)

(assert (=> b!827918 (= e!461298 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827919 () Bool)

(declare-fun e!461292 () ListLongMap!8915)

(assert (=> b!827919 (= e!461292 e!461294)))

(assert (=> b!827919 (= c!89514 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!827920 () Bool)

(declare-fun e!461297 () ListLongMap!8915)

(assert (=> b!827920 (= e!461297 call!35961)))

(declare-fun b!827921 () Bool)

(declare-fun e!461290 () Bool)

(declare-fun call!35955 () Bool)

(assert (=> b!827921 (= e!461290 (not call!35955))))

(declare-fun b!827922 () Bool)

(declare-fun res!564252 () Bool)

(declare-fun e!461289 () Bool)

(assert (=> b!827922 (=> (not res!564252) (not e!461289))))

(declare-fun e!461295 () Bool)

(assert (=> b!827922 (= res!564252 e!461295)))

(declare-fun res!564258 () Bool)

(assert (=> b!827922 (=> res!564258 e!461295)))

(assert (=> b!827922 (= res!564258 (not e!461298))))

(declare-fun res!564256 () Bool)

(assert (=> b!827922 (=> (not res!564256) (not e!461298))))

(assert (=> b!827922 (= res!564256 (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun b!827923 () Bool)

(declare-fun e!461291 () Bool)

(assert (=> b!827923 (= e!461291 (= (apply!365 lt!374950 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!827924 () Bool)

(declare-fun e!461288 () Bool)

(assert (=> b!827924 (= e!461288 e!461299)))

(declare-fun res!564257 () Bool)

(declare-fun call!35957 () Bool)

(assert (=> b!827924 (= res!564257 call!35957)))

(assert (=> b!827924 (=> (not res!564257) (not e!461299))))

(declare-fun b!827925 () Bool)

(assert (=> b!827925 (= e!461292 (+!1984 call!35956 (tuple2!10103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!827926 () Bool)

(declare-fun res!564253 () Bool)

(assert (=> b!827926 (=> (not res!564253) (not e!461289))))

(assert (=> b!827926 (= res!564253 e!461288)))

(declare-fun c!89509 () Bool)

(assert (=> b!827926 (= c!89509 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!827927 () Bool)

(assert (=> b!827927 (= e!461297 call!35960)))

(declare-fun bm!35954 () Bool)

(assert (=> bm!35954 (= call!35960 call!35958)))

(declare-fun b!827928 () Bool)

(assert (=> b!827928 (= e!461290 e!461291)))

(declare-fun res!564255 () Bool)

(assert (=> b!827928 (= res!564255 call!35955)))

(assert (=> b!827928 (=> (not res!564255) (not e!461291))))

(declare-fun bm!35955 () Bool)

(assert (=> bm!35955 (= call!35959 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827929 () Bool)

(assert (=> b!827929 (= e!461295 e!461296)))

(declare-fun res!564254 () Bool)

(assert (=> b!827929 (=> (not res!564254) (not e!461296))))

(assert (=> b!827929 (= res!564254 (contains!4167 lt!374950 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827929 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun bm!35953 () Bool)

(assert (=> bm!35953 (= call!35957 (contains!4167 lt!374950 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!104967 () Bool)

(assert (=> d!104967 e!461289))

(declare-fun res!564251 () Bool)

(assert (=> d!104967 (=> (not res!564251) (not e!461289))))

(assert (=> d!104967 (= res!564251 (or (bvsge #b00000000000000000000000000000000 (size!22666 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))))

(declare-fun lt!374962 () ListLongMap!8915)

(assert (=> d!104967 (= lt!374950 lt!374962)))

(declare-fun lt!374968 () Unit!28317)

(assert (=> d!104967 (= lt!374968 e!461287)))

(declare-fun c!89513 () Bool)

(assert (=> d!104967 (= c!89513 e!461293)))

(declare-fun res!564250 () Bool)

(assert (=> d!104967 (=> (not res!564250) (not e!461293))))

(assert (=> d!104967 (= res!564250 (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (=> d!104967 (= lt!374962 e!461292)))

(assert (=> d!104967 (= c!89511 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104967 (validMask!0 mask!1312)))

(assert (=> d!104967 (= (getCurrentListMap!2528 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374950)))

(declare-fun b!827930 () Bool)

(assert (=> b!827930 (= e!461289 e!461290)))

(declare-fun c!89510 () Bool)

(assert (=> b!827930 (= c!89510 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35956 () Bool)

(assert (=> bm!35956 (= call!35955 (contains!4167 lt!374950 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!827931 () Bool)

(assert (=> b!827931 (= e!461288 (not call!35957))))

(declare-fun bm!35957 () Bool)

(assert (=> bm!35957 (= call!35961 call!35956)))

(declare-fun b!827932 () Bool)

(declare-fun c!89512 () Bool)

(assert (=> b!827932 (= c!89512 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827932 (= e!461294 e!461297)))

(declare-fun bm!35958 () Bool)

(assert (=> bm!35958 (= call!35958 call!35959)))

(assert (= (and d!104967 c!89511) b!827925))

(assert (= (and d!104967 (not c!89511)) b!827919))

(assert (= (and b!827919 c!89514) b!827917))

(assert (= (and b!827919 (not c!89514)) b!827932))

(assert (= (and b!827932 c!89512) b!827920))

(assert (= (and b!827932 (not c!89512)) b!827927))

(assert (= (or b!827920 b!827927) bm!35954))

(assert (= (or b!827917 bm!35954) bm!35958))

(assert (= (or b!827917 b!827920) bm!35957))

(assert (= (or b!827925 bm!35958) bm!35955))

(assert (= (or b!827925 bm!35957) bm!35952))

(assert (= (and d!104967 res!564250) b!827915))

(assert (= (and d!104967 c!89513) b!827914))

(assert (= (and d!104967 (not c!89513)) b!827912))

(assert (= (and d!104967 res!564251) b!827922))

(assert (= (and b!827922 res!564256) b!827918))

(assert (= (and b!827922 (not res!564258)) b!827929))

(assert (= (and b!827929 res!564254) b!827916))

(assert (= (and b!827922 res!564252) b!827926))

(assert (= (and b!827926 c!89509) b!827924))

(assert (= (and b!827926 (not c!89509)) b!827931))

(assert (= (and b!827924 res!564257) b!827913))

(assert (= (or b!827924 b!827931) bm!35953))

(assert (= (and b!827926 res!564253) b!827930))

(assert (= (and b!827930 c!89510) b!827928))

(assert (= (and b!827930 (not c!89510)) b!827921))

(assert (= (and b!827928 res!564255) b!827923))

(assert (= (or b!827928 b!827921) bm!35956))

(declare-fun b_lambda!11169 () Bool)

(assert (=> (not b_lambda!11169) (not b!827916)))

(assert (=> b!827916 t!22238))

(declare-fun b_and!22357 () Bool)

(assert (= b_and!22355 (and (=> t!22238 result!7965) b_and!22357)))

(assert (=> b!827915 m!770247))

(assert (=> b!827915 m!770247))

(assert (=> b!827915 m!770253))

(assert (=> d!104967 m!770185))

(assert (=> b!827914 m!770247))

(declare-fun m!770323 () Bool)

(assert (=> b!827914 m!770323))

(declare-fun m!770325 () Bool)

(assert (=> b!827914 m!770325))

(declare-fun m!770327 () Bool)

(assert (=> b!827914 m!770327))

(declare-fun m!770329 () Bool)

(assert (=> b!827914 m!770329))

(declare-fun m!770331 () Bool)

(assert (=> b!827914 m!770331))

(declare-fun m!770333 () Bool)

(assert (=> b!827914 m!770333))

(assert (=> b!827914 m!770333))

(declare-fun m!770335 () Bool)

(assert (=> b!827914 m!770335))

(declare-fun m!770337 () Bool)

(assert (=> b!827914 m!770337))

(declare-fun m!770339 () Bool)

(assert (=> b!827914 m!770339))

(declare-fun m!770341 () Bool)

(assert (=> b!827914 m!770341))

(assert (=> b!827914 m!770339))

(declare-fun m!770343 () Bool)

(assert (=> b!827914 m!770343))

(declare-fun m!770345 () Bool)

(assert (=> b!827914 m!770345))

(assert (=> b!827914 m!770183))

(assert (=> b!827914 m!770337))

(declare-fun m!770347 () Bool)

(assert (=> b!827914 m!770347))

(declare-fun m!770349 () Bool)

(assert (=> b!827914 m!770349))

(assert (=> b!827914 m!770325))

(declare-fun m!770351 () Bool)

(assert (=> b!827914 m!770351))

(assert (=> b!827918 m!770247))

(assert (=> b!827918 m!770247))

(assert (=> b!827918 m!770253))

(declare-fun m!770353 () Bool)

(assert (=> bm!35952 m!770353))

(declare-fun m!770355 () Bool)

(assert (=> bm!35953 m!770355))

(assert (=> b!827929 m!770247))

(assert (=> b!827929 m!770247))

(declare-fun m!770357 () Bool)

(assert (=> b!827929 m!770357))

(assert (=> b!827916 m!770247))

(declare-fun m!770359 () Bool)

(assert (=> b!827916 m!770359))

(assert (=> b!827916 m!770277))

(assert (=> b!827916 m!770279))

(assert (=> b!827916 m!770281))

(assert (=> b!827916 m!770277))

(assert (=> b!827916 m!770247))

(assert (=> b!827916 m!770279))

(declare-fun m!770361 () Bool)

(assert (=> bm!35956 m!770361))

(assert (=> bm!35955 m!770183))

(declare-fun m!770363 () Bool)

(assert (=> b!827913 m!770363))

(declare-fun m!770365 () Bool)

(assert (=> b!827925 m!770365))

(declare-fun m!770367 () Bool)

(assert (=> b!827923 m!770367))

(assert (=> b!827732 d!104967))

(declare-fun b!827933 () Bool)

(declare-fun e!461300 () Unit!28317)

(declare-fun Unit!28322 () Unit!28317)

(assert (=> b!827933 (= e!461300 Unit!28322)))

(declare-fun call!35965 () ListLongMap!8915)

(declare-fun call!35963 () ListLongMap!8915)

(declare-fun bm!35959 () Bool)

(declare-fun c!89517 () Bool)

(declare-fun call!35966 () ListLongMap!8915)

(declare-fun c!89520 () Bool)

(declare-fun call!35967 () ListLongMap!8915)

(assert (=> bm!35959 (= call!35963 (+!1984 (ite c!89517 call!35966 (ite c!89520 call!35965 call!35967)) (ite (or c!89517 c!89520) (tuple2!10103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!827934 () Bool)

(declare-fun e!461312 () Bool)

(declare-fun lt!374972 () ListLongMap!8915)

(assert (=> b!827934 (= e!461312 (= (apply!365 lt!374972 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(declare-fun b!827935 () Bool)

(declare-fun lt!374970 () Unit!28317)

(assert (=> b!827935 (= e!461300 lt!374970)))

(declare-fun lt!374971 () ListLongMap!8915)

(assert (=> b!827935 (= lt!374971 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374978 () (_ BitVec 64))

(assert (=> b!827935 (= lt!374978 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374975 () (_ BitVec 64))

(assert (=> b!827935 (= lt!374975 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374985 () Unit!28317)

(assert (=> b!827935 (= lt!374985 (addStillContains!316 lt!374971 lt!374978 zeroValueAfter!34 lt!374975))))

(assert (=> b!827935 (contains!4167 (+!1984 lt!374971 (tuple2!10103 lt!374978 zeroValueAfter!34)) lt!374975)))

(declare-fun lt!374979 () Unit!28317)

(assert (=> b!827935 (= lt!374979 lt!374985)))

(declare-fun lt!374974 () ListLongMap!8915)

(assert (=> b!827935 (= lt!374974 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374980 () (_ BitVec 64))

(assert (=> b!827935 (= lt!374980 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374986 () (_ BitVec 64))

(assert (=> b!827935 (= lt!374986 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374977 () Unit!28317)

(assert (=> b!827935 (= lt!374977 (addApplyDifferent!316 lt!374974 lt!374980 minValue!754 lt!374986))))

(assert (=> b!827935 (= (apply!365 (+!1984 lt!374974 (tuple2!10103 lt!374980 minValue!754)) lt!374986) (apply!365 lt!374974 lt!374986))))

(declare-fun lt!374982 () Unit!28317)

(assert (=> b!827935 (= lt!374982 lt!374977)))

(declare-fun lt!374987 () ListLongMap!8915)

(assert (=> b!827935 (= lt!374987 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374989 () (_ BitVec 64))

(assert (=> b!827935 (= lt!374989 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374988 () (_ BitVec 64))

(assert (=> b!827935 (= lt!374988 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374973 () Unit!28317)

(assert (=> b!827935 (= lt!374973 (addApplyDifferent!316 lt!374987 lt!374989 zeroValueAfter!34 lt!374988))))

(assert (=> b!827935 (= (apply!365 (+!1984 lt!374987 (tuple2!10103 lt!374989 zeroValueAfter!34)) lt!374988) (apply!365 lt!374987 lt!374988))))

(declare-fun lt!374981 () Unit!28317)

(assert (=> b!827935 (= lt!374981 lt!374973)))

(declare-fun lt!374969 () ListLongMap!8915)

(assert (=> b!827935 (= lt!374969 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374976 () (_ BitVec 64))

(assert (=> b!827935 (= lt!374976 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374983 () (_ BitVec 64))

(assert (=> b!827935 (= lt!374983 (select (arr!22245 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827935 (= lt!374970 (addApplyDifferent!316 lt!374969 lt!374976 minValue!754 lt!374983))))

(assert (=> b!827935 (= (apply!365 (+!1984 lt!374969 (tuple2!10103 lt!374976 minValue!754)) lt!374983) (apply!365 lt!374969 lt!374983))))

(declare-fun b!827936 () Bool)

(declare-fun e!461306 () Bool)

(assert (=> b!827936 (= e!461306 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827937 () Bool)

(declare-fun e!461309 () Bool)

(assert (=> b!827937 (= e!461309 (= (apply!365 lt!374972 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)) (get!11792 (select (arr!22246 _values!788) #b00000000000000000000000000000000) (dynLambda!979 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!827937 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22667 _values!788)))))

(assert (=> b!827937 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun b!827938 () Bool)

(declare-fun e!461307 () ListLongMap!8915)

(declare-fun call!35968 () ListLongMap!8915)

(assert (=> b!827938 (= e!461307 call!35968)))

(declare-fun b!827939 () Bool)

(declare-fun e!461311 () Bool)

(assert (=> b!827939 (= e!461311 (validKeyInArray!0 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827940 () Bool)

(declare-fun e!461305 () ListLongMap!8915)

(assert (=> b!827940 (= e!461305 e!461307)))

(assert (=> b!827940 (= c!89520 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!827941 () Bool)

(declare-fun e!461310 () ListLongMap!8915)

(assert (=> b!827941 (= e!461310 call!35968)))

(declare-fun b!827942 () Bool)

(declare-fun e!461303 () Bool)

(declare-fun call!35962 () Bool)

(assert (=> b!827942 (= e!461303 (not call!35962))))

(declare-fun b!827943 () Bool)

(declare-fun res!564261 () Bool)

(declare-fun e!461302 () Bool)

(assert (=> b!827943 (=> (not res!564261) (not e!461302))))

(declare-fun e!461308 () Bool)

(assert (=> b!827943 (= res!564261 e!461308)))

(declare-fun res!564267 () Bool)

(assert (=> b!827943 (=> res!564267 e!461308)))

(assert (=> b!827943 (= res!564267 (not e!461311))))

(declare-fun res!564265 () Bool)

(assert (=> b!827943 (=> (not res!564265) (not e!461311))))

(assert (=> b!827943 (= res!564265 (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun b!827944 () Bool)

(declare-fun e!461304 () Bool)

(assert (=> b!827944 (= e!461304 (= (apply!365 lt!374972 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun b!827945 () Bool)

(declare-fun e!461301 () Bool)

(assert (=> b!827945 (= e!461301 e!461312)))

(declare-fun res!564266 () Bool)

(declare-fun call!35964 () Bool)

(assert (=> b!827945 (= res!564266 call!35964)))

(assert (=> b!827945 (=> (not res!564266) (not e!461312))))

(declare-fun b!827946 () Bool)

(assert (=> b!827946 (= e!461305 (+!1984 call!35963 (tuple2!10103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!827947 () Bool)

(declare-fun res!564262 () Bool)

(assert (=> b!827947 (=> (not res!564262) (not e!461302))))

(assert (=> b!827947 (= res!564262 e!461301)))

(declare-fun c!89515 () Bool)

(assert (=> b!827947 (= c!89515 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!827948 () Bool)

(assert (=> b!827948 (= e!461310 call!35967)))

(declare-fun bm!35961 () Bool)

(assert (=> bm!35961 (= call!35967 call!35965)))

(declare-fun b!827949 () Bool)

(assert (=> b!827949 (= e!461303 e!461304)))

(declare-fun res!564264 () Bool)

(assert (=> b!827949 (= res!564264 call!35962)))

(assert (=> b!827949 (=> (not res!564264) (not e!461304))))

(declare-fun bm!35962 () Bool)

(assert (=> bm!35962 (= call!35966 (getCurrentListMapNoExtraKeys!2505 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827950 () Bool)

(assert (=> b!827950 (= e!461308 e!461309)))

(declare-fun res!564263 () Bool)

(assert (=> b!827950 (=> (not res!564263) (not e!461309))))

(assert (=> b!827950 (= res!564263 (contains!4167 lt!374972 (select (arr!22245 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827950 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(declare-fun bm!35960 () Bool)

(assert (=> bm!35960 (= call!35964 (contains!4167 lt!374972 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!104969 () Bool)

(assert (=> d!104969 e!461302))

(declare-fun res!564260 () Bool)

(assert (=> d!104969 (=> (not res!564260) (not e!461302))))

(assert (=> d!104969 (= res!564260 (or (bvsge #b00000000000000000000000000000000 (size!22666 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))))

(declare-fun lt!374984 () ListLongMap!8915)

(assert (=> d!104969 (= lt!374972 lt!374984)))

(declare-fun lt!374990 () Unit!28317)

(assert (=> d!104969 (= lt!374990 e!461300)))

(declare-fun c!89519 () Bool)

(assert (=> d!104969 (= c!89519 e!461306)))

(declare-fun res!564259 () Bool)

(assert (=> d!104969 (=> (not res!564259) (not e!461306))))

(assert (=> d!104969 (= res!564259 (bvslt #b00000000000000000000000000000000 (size!22666 _keys!976)))))

(assert (=> d!104969 (= lt!374984 e!461305)))

(assert (=> d!104969 (= c!89517 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104969 (validMask!0 mask!1312)))

(assert (=> d!104969 (= (getCurrentListMap!2528 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374972)))

(declare-fun b!827951 () Bool)

(assert (=> b!827951 (= e!461302 e!461303)))

(declare-fun c!89516 () Bool)

(assert (=> b!827951 (= c!89516 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35963 () Bool)

(assert (=> bm!35963 (= call!35962 (contains!4167 lt!374972 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!827952 () Bool)

(assert (=> b!827952 (= e!461301 (not call!35964))))

(declare-fun bm!35964 () Bool)

(assert (=> bm!35964 (= call!35968 call!35963)))

(declare-fun b!827953 () Bool)

(declare-fun c!89518 () Bool)

(assert (=> b!827953 (= c!89518 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827953 (= e!461307 e!461310)))

(declare-fun bm!35965 () Bool)

(assert (=> bm!35965 (= call!35965 call!35966)))

(assert (= (and d!104969 c!89517) b!827946))

(assert (= (and d!104969 (not c!89517)) b!827940))

(assert (= (and b!827940 c!89520) b!827938))

(assert (= (and b!827940 (not c!89520)) b!827953))

(assert (= (and b!827953 c!89518) b!827941))

(assert (= (and b!827953 (not c!89518)) b!827948))

(assert (= (or b!827941 b!827948) bm!35961))

(assert (= (or b!827938 bm!35961) bm!35965))

(assert (= (or b!827938 b!827941) bm!35964))

(assert (= (or b!827946 bm!35965) bm!35962))

(assert (= (or b!827946 bm!35964) bm!35959))

(assert (= (and d!104969 res!564259) b!827936))

(assert (= (and d!104969 c!89519) b!827935))

(assert (= (and d!104969 (not c!89519)) b!827933))

(assert (= (and d!104969 res!564260) b!827943))

(assert (= (and b!827943 res!564265) b!827939))

(assert (= (and b!827943 (not res!564267)) b!827950))

(assert (= (and b!827950 res!564263) b!827937))

(assert (= (and b!827943 res!564261) b!827947))

(assert (= (and b!827947 c!89515) b!827945))

(assert (= (and b!827947 (not c!89515)) b!827952))

(assert (= (and b!827945 res!564266) b!827934))

(assert (= (or b!827945 b!827952) bm!35960))

(assert (= (and b!827947 res!564262) b!827951))

(assert (= (and b!827951 c!89516) b!827949))

(assert (= (and b!827951 (not c!89516)) b!827942))

(assert (= (and b!827949 res!564264) b!827944))

(assert (= (or b!827949 b!827942) bm!35963))

(declare-fun b_lambda!11171 () Bool)

(assert (=> (not b_lambda!11171) (not b!827937)))

(assert (=> b!827937 t!22238))

(declare-fun b_and!22359 () Bool)

(assert (= b_and!22357 (and (=> t!22238 result!7965) b_and!22359)))

(assert (=> b!827936 m!770247))

(assert (=> b!827936 m!770247))

(assert (=> b!827936 m!770253))

(assert (=> d!104969 m!770185))

(assert (=> b!827935 m!770247))

(declare-fun m!770369 () Bool)

(assert (=> b!827935 m!770369))

(declare-fun m!770371 () Bool)

(assert (=> b!827935 m!770371))

(declare-fun m!770373 () Bool)

(assert (=> b!827935 m!770373))

(declare-fun m!770375 () Bool)

(assert (=> b!827935 m!770375))

(declare-fun m!770377 () Bool)

(assert (=> b!827935 m!770377))

(declare-fun m!770379 () Bool)

(assert (=> b!827935 m!770379))

(assert (=> b!827935 m!770379))

(declare-fun m!770381 () Bool)

(assert (=> b!827935 m!770381))

(declare-fun m!770383 () Bool)

(assert (=> b!827935 m!770383))

(declare-fun m!770385 () Bool)

(assert (=> b!827935 m!770385))

(declare-fun m!770387 () Bool)

(assert (=> b!827935 m!770387))

(assert (=> b!827935 m!770385))

(declare-fun m!770389 () Bool)

(assert (=> b!827935 m!770389))

(declare-fun m!770391 () Bool)

(assert (=> b!827935 m!770391))

(assert (=> b!827935 m!770181))

(assert (=> b!827935 m!770383))

(declare-fun m!770393 () Bool)

(assert (=> b!827935 m!770393))

(declare-fun m!770395 () Bool)

(assert (=> b!827935 m!770395))

(assert (=> b!827935 m!770371))

(declare-fun m!770397 () Bool)

(assert (=> b!827935 m!770397))

(assert (=> b!827939 m!770247))

(assert (=> b!827939 m!770247))

(assert (=> b!827939 m!770253))

(declare-fun m!770399 () Bool)

(assert (=> bm!35959 m!770399))

(declare-fun m!770401 () Bool)

(assert (=> bm!35960 m!770401))

(assert (=> b!827950 m!770247))

(assert (=> b!827950 m!770247))

(declare-fun m!770403 () Bool)

(assert (=> b!827950 m!770403))

(assert (=> b!827937 m!770247))

(declare-fun m!770405 () Bool)

(assert (=> b!827937 m!770405))

(assert (=> b!827937 m!770277))

(assert (=> b!827937 m!770279))

(assert (=> b!827937 m!770281))

(assert (=> b!827937 m!770277))

(assert (=> b!827937 m!770247))

(assert (=> b!827937 m!770279))

(declare-fun m!770407 () Bool)

(assert (=> bm!35963 m!770407))

(assert (=> bm!35962 m!770181))

(declare-fun m!770409 () Bool)

(assert (=> b!827934 m!770409))

(declare-fun m!770411 () Bool)

(assert (=> b!827946 m!770411))

(declare-fun m!770413 () Bool)

(assert (=> b!827944 m!770413))

(assert (=> b!827732 d!104969))

(declare-fun mapNonEmpty!24340 () Bool)

(declare-fun mapRes!24340 () Bool)

(declare-fun tp!47050 () Bool)

(declare-fun e!461317 () Bool)

(assert (=> mapNonEmpty!24340 (= mapRes!24340 (and tp!47050 e!461317))))

(declare-fun mapValue!24340 () ValueCell!7151)

(declare-fun mapRest!24340 () (Array (_ BitVec 32) ValueCell!7151))

(declare-fun mapKey!24340 () (_ BitVec 32))

(assert (=> mapNonEmpty!24340 (= mapRest!24331 (store mapRest!24340 mapKey!24340 mapValue!24340))))

(declare-fun condMapEmpty!24340 () Bool)

(declare-fun mapDefault!24340 () ValueCell!7151)

(assert (=> mapNonEmpty!24331 (= condMapEmpty!24340 (= mapRest!24331 ((as const (Array (_ BitVec 32) ValueCell!7151)) mapDefault!24340)))))

(declare-fun e!461318 () Bool)

(assert (=> mapNonEmpty!24331 (= tp!47035 (and e!461318 mapRes!24340))))

(declare-fun b!827960 () Bool)

(assert (=> b!827960 (= e!461317 tp_is_empty!15133)))

(declare-fun mapIsEmpty!24340 () Bool)

(assert (=> mapIsEmpty!24340 mapRes!24340))

(declare-fun b!827961 () Bool)

(assert (=> b!827961 (= e!461318 tp_is_empty!15133)))

(assert (= (and mapNonEmpty!24331 condMapEmpty!24340) mapIsEmpty!24340))

(assert (= (and mapNonEmpty!24331 (not condMapEmpty!24340)) mapNonEmpty!24340))

(assert (= (and mapNonEmpty!24340 ((_ is ValueCellFull!7151) mapValue!24340)) b!827960))

(assert (= (and mapNonEmpty!24331 ((_ is ValueCellFull!7151) mapDefault!24340)) b!827961))

(declare-fun m!770415 () Bool)

(assert (=> mapNonEmpty!24340 m!770415))

(declare-fun b_lambda!11173 () Bool)

(assert (= b_lambda!11167 (or (and start!71268 b_free!13423) b_lambda!11173)))

(declare-fun b_lambda!11175 () Bool)

(assert (= b_lambda!11161 (or (and start!71268 b_free!13423) b_lambda!11175)))

(declare-fun b_lambda!11177 () Bool)

(assert (= b_lambda!11169 (or (and start!71268 b_free!13423) b_lambda!11177)))

(declare-fun b_lambda!11179 () Bool)

(assert (= b_lambda!11163 (or (and start!71268 b_free!13423) b_lambda!11179)))

(declare-fun b_lambda!11181 () Bool)

(assert (= b_lambda!11165 (or (and start!71268 b_free!13423) b_lambda!11181)))

(declare-fun b_lambda!11183 () Bool)

(assert (= b_lambda!11171 (or (and start!71268 b_free!13423) b_lambda!11183)))

(check-sat (not b!827855) (not b!827812) (not bm!35956) (not mapNonEmpty!24340) (not b!827858) (not b!827937) (not b_next!13423) (not b_lambda!11175) (not bm!35937) (not b!827797) (not d!104953) b_and!22359 (not b!827848) (not b!827918) (not b!827841) (not b!827860) (not b!827862) (not b!827934) (not b!827916) (not b!827839) (not bm!35960) (not b!827946) (not b_lambda!11173) (not b!827857) (not bm!35952) (not bm!35963) (not b!827936) (not b!827915) (not b!827801) (not b!827914) (not bm!35933) (not b!827811) (not b!827939) (not bm!35936) (not bm!35962) (not b!827800) (not b_lambda!11183) (not b!827935) (not d!104967) (not b_lambda!11179) (not b!827856) (not b!827869) (not b_lambda!11181) (not b!827842) (not d!104955) (not b!827950) (not bm!35953) (not bm!35959) (not b!827944) (not bm!35955) (not b!827843) (not b!827925) (not b!827852) (not d!104965) (not b_lambda!11177) (not d!104957) (not b!827913) (not bm!35930) (not b!827853) (not b!827923) (not b!827844) (not b!827838) (not b!827846) (not b!827868) tp_is_empty!15133 (not d!104969) (not b!827929))
(check-sat b_and!22359 (not b_next!13423))
