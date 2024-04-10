; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41306 () Bool)

(assert start!41306)

(declare-fun b!461979 () Bool)

(declare-fun e!269486 () Bool)

(declare-fun tp_is_empty!12453 () Bool)

(assert (=> b!461979 (= e!269486 tp_is_empty!12453)))

(declare-fun b!461980 () Bool)

(declare-fun e!269488 () Bool)

(assert (=> b!461980 (= e!269488 tp_is_empty!12453)))

(declare-fun res!276320 () Bool)

(declare-fun e!269484 () Bool)

(assert (=> start!41306 (=> (not res!276320) (not e!269484))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41306 (= res!276320 (validMask!0 mask!1365))))

(assert (=> start!41306 e!269484))

(assert (=> start!41306 true))

(declare-datatypes ((array!28703 0))(
  ( (array!28704 (arr!13788 (Array (_ BitVec 32) (_ BitVec 64))) (size!14140 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28703)

(declare-fun array_inv!9972 (array!28703) Bool)

(assert (=> start!41306 (array_inv!9972 _keys!1025)))

(declare-datatypes ((V!17709 0))(
  ( (V!17710 (val!6271 Int)) )
))
(declare-datatypes ((ValueCell!5883 0))(
  ( (ValueCellFull!5883 (v!8557 V!17709)) (EmptyCell!5883) )
))
(declare-datatypes ((array!28705 0))(
  ( (array!28706 (arr!13789 (Array (_ BitVec 32) ValueCell!5883)) (size!14141 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28705)

(declare-fun e!269487 () Bool)

(declare-fun array_inv!9973 (array!28705) Bool)

(assert (=> start!41306 (and (array_inv!9973 _values!833) e!269487)))

(declare-fun b!461981 () Bool)

(assert (=> b!461981 (= e!269484 (and (bvsle #b00000000000000000000000000000000 (size!14140 _keys!1025)) (bvsge (size!14140 _keys!1025) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!20341 () Bool)

(declare-fun mapRes!20341 () Bool)

(assert (=> mapIsEmpty!20341 mapRes!20341))

(declare-fun mapNonEmpty!20341 () Bool)

(declare-fun tp!39160 () Bool)

(assert (=> mapNonEmpty!20341 (= mapRes!20341 (and tp!39160 e!269486))))

(declare-fun mapRest!20341 () (Array (_ BitVec 32) ValueCell!5883))

(declare-fun mapValue!20341 () ValueCell!5883)

(declare-fun mapKey!20341 () (_ BitVec 32))

(assert (=> mapNonEmpty!20341 (= (arr!13789 _values!833) (store mapRest!20341 mapKey!20341 mapValue!20341))))

(declare-fun b!461982 () Bool)

(assert (=> b!461982 (= e!269487 (and e!269488 mapRes!20341))))

(declare-fun condMapEmpty!20341 () Bool)

(declare-fun mapDefault!20341 () ValueCell!5883)

(assert (=> b!461982 (= condMapEmpty!20341 (= (arr!13789 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5883)) mapDefault!20341)))))

(declare-fun b!461983 () Bool)

(declare-fun res!276321 () Bool)

(assert (=> b!461983 (=> (not res!276321) (not e!269484))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461983 (= res!276321 (and (= (size!14141 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14140 _keys!1025) (size!14141 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!461984 () Bool)

(declare-fun res!276319 () Bool)

(assert (=> b!461984 (=> (not res!276319) (not e!269484))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28703 (_ BitVec 32)) Bool)

(assert (=> b!461984 (= res!276319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41306 res!276320) b!461983))

(assert (= (and b!461983 res!276321) b!461984))

(assert (= (and b!461984 res!276319) b!461981))

(assert (= (and b!461982 condMapEmpty!20341) mapIsEmpty!20341))

(assert (= (and b!461982 (not condMapEmpty!20341)) mapNonEmpty!20341))

(get-info :version)

(assert (= (and mapNonEmpty!20341 ((_ is ValueCellFull!5883) mapValue!20341)) b!461979))

(assert (= (and b!461982 ((_ is ValueCellFull!5883) mapDefault!20341)) b!461980))

(assert (= start!41306 b!461982))

(declare-fun m!445081 () Bool)

(assert (=> start!41306 m!445081))

(declare-fun m!445083 () Bool)

(assert (=> start!41306 m!445083))

(declare-fun m!445085 () Bool)

(assert (=> start!41306 m!445085))

(declare-fun m!445087 () Bool)

(assert (=> mapNonEmpty!20341 m!445087))

(declare-fun m!445089 () Bool)

(assert (=> b!461984 m!445089))

(check-sat (not start!41306) (not b!461984) (not mapNonEmpty!20341) tp_is_empty!12453)
(check-sat)
(get-model)

(declare-fun d!74921 () Bool)

(assert (=> d!74921 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41306 d!74921))

(declare-fun d!74923 () Bool)

(assert (=> d!74923 (= (array_inv!9972 _keys!1025) (bvsge (size!14140 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41306 d!74923))

(declare-fun d!74925 () Bool)

(assert (=> d!74925 (= (array_inv!9973 _values!833) (bvsge (size!14141 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41306 d!74925))

(declare-fun b!462011 () Bool)

(declare-fun e!269510 () Bool)

(declare-fun call!30197 () Bool)

(assert (=> b!462011 (= e!269510 call!30197)))

(declare-fun b!462012 () Bool)

(declare-fun e!269512 () Bool)

(assert (=> b!462012 (= e!269512 e!269510)))

(declare-fun c!56622 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!462012 (= c!56622 (validKeyInArray!0 (select (arr!13788 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun d!74927 () Bool)

(declare-fun res!276335 () Bool)

(assert (=> d!74927 (=> res!276335 e!269512)))

(assert (=> d!74927 (= res!276335 (bvsge #b00000000000000000000000000000000 (size!14140 _keys!1025)))))

(assert (=> d!74927 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269512)))

(declare-fun b!462013 () Bool)

(declare-fun e!269511 () Bool)

(assert (=> b!462013 (= e!269511 call!30197)))

(declare-fun bm!30194 () Bool)

(assert (=> bm!30194 (= call!30197 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!462014 () Bool)

(assert (=> b!462014 (= e!269510 e!269511)))

(declare-fun lt!209150 () (_ BitVec 64))

(assert (=> b!462014 (= lt!209150 (select (arr!13788 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13440 0))(
  ( (Unit!13441) )
))
(declare-fun lt!209152 () Unit!13440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28703 (_ BitVec 64) (_ BitVec 32)) Unit!13440)

(assert (=> b!462014 (= lt!209152 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209150 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28703 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!462014 (arrayContainsKey!0 _keys!1025 lt!209150 #b00000000000000000000000000000000)))

(declare-fun lt!209151 () Unit!13440)

(assert (=> b!462014 (= lt!209151 lt!209152)))

(declare-fun res!276336 () Bool)

(declare-datatypes ((SeekEntryResult!3539 0))(
  ( (MissingZero!3539 (index!16335 (_ BitVec 32))) (Found!3539 (index!16336 (_ BitVec 32))) (Intermediate!3539 (undefined!4351 Bool) (index!16337 (_ BitVec 32)) (x!43063 (_ BitVec 32))) (Undefined!3539) (MissingVacant!3539 (index!16338 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28703 (_ BitVec 32)) SeekEntryResult!3539)

(assert (=> b!462014 (= res!276336 (= (seekEntryOrOpen!0 (select (arr!13788 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3539 #b00000000000000000000000000000000)))))

(assert (=> b!462014 (=> (not res!276336) (not e!269511))))

(assert (= (and d!74927 (not res!276335)) b!462012))

(assert (= (and b!462012 c!56622) b!462014))

(assert (= (and b!462012 (not c!56622)) b!462011))

(assert (= (and b!462014 res!276336) b!462013))

(assert (= (or b!462013 b!462011) bm!30194))

(declare-fun m!445101 () Bool)

(assert (=> b!462012 m!445101))

(assert (=> b!462012 m!445101))

(declare-fun m!445103 () Bool)

(assert (=> b!462012 m!445103))

(declare-fun m!445105 () Bool)

(assert (=> bm!30194 m!445105))

(assert (=> b!462014 m!445101))

(declare-fun m!445107 () Bool)

(assert (=> b!462014 m!445107))

(declare-fun m!445109 () Bool)

(assert (=> b!462014 m!445109))

(assert (=> b!462014 m!445101))

(declare-fun m!445111 () Bool)

(assert (=> b!462014 m!445111))

(assert (=> b!461984 d!74927))

(declare-fun b!462022 () Bool)

(declare-fun e!269518 () Bool)

(assert (=> b!462022 (= e!269518 tp_is_empty!12453)))

(declare-fun b!462021 () Bool)

(declare-fun e!269517 () Bool)

(assert (=> b!462021 (= e!269517 tp_is_empty!12453)))

(declare-fun mapNonEmpty!20347 () Bool)

(declare-fun mapRes!20347 () Bool)

(declare-fun tp!39166 () Bool)

(assert (=> mapNonEmpty!20347 (= mapRes!20347 (and tp!39166 e!269517))))

(declare-fun mapRest!20347 () (Array (_ BitVec 32) ValueCell!5883))

(declare-fun mapValue!20347 () ValueCell!5883)

(declare-fun mapKey!20347 () (_ BitVec 32))

(assert (=> mapNonEmpty!20347 (= mapRest!20341 (store mapRest!20347 mapKey!20347 mapValue!20347))))

(declare-fun mapIsEmpty!20347 () Bool)

(assert (=> mapIsEmpty!20347 mapRes!20347))

(declare-fun condMapEmpty!20347 () Bool)

(declare-fun mapDefault!20347 () ValueCell!5883)

(assert (=> mapNonEmpty!20341 (= condMapEmpty!20347 (= mapRest!20341 ((as const (Array (_ BitVec 32) ValueCell!5883)) mapDefault!20347)))))

(assert (=> mapNonEmpty!20341 (= tp!39160 (and e!269518 mapRes!20347))))

(assert (= (and mapNonEmpty!20341 condMapEmpty!20347) mapIsEmpty!20347))

(assert (= (and mapNonEmpty!20341 (not condMapEmpty!20347)) mapNonEmpty!20347))

(assert (= (and mapNonEmpty!20347 ((_ is ValueCellFull!5883) mapValue!20347)) b!462021))

(assert (= (and mapNonEmpty!20341 ((_ is ValueCellFull!5883) mapDefault!20347)) b!462022))

(declare-fun m!445113 () Bool)

(assert (=> mapNonEmpty!20347 m!445113))

(check-sat tp_is_empty!12453 (not bm!30194) (not mapNonEmpty!20347) (not b!462014) (not b!462012))
(check-sat)
