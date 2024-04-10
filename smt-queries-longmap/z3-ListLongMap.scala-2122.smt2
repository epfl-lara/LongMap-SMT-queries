; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35924 () Bool)

(assert start!35924)

(declare-fun b!361115 () Bool)

(declare-fun res!200894 () Bool)

(declare-fun e!221088 () Bool)

(assert (=> b!361115 (=> (not res!200894) (not e!221088))))

(declare-datatypes ((array!20259 0))(
  ( (array!20260 (arr!9621 (Array (_ BitVec 32) (_ BitVec 64))) (size!9973 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20259)

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12117 0))(
  ( (V!12118 (val!4222 Int)) )
))
(declare-datatypes ((ValueCell!3834 0))(
  ( (ValueCellFull!3834 (v!6416 V!12117)) (EmptyCell!3834) )
))
(declare-datatypes ((array!20261 0))(
  ( (array!20262 (arr!9622 (Array (_ BitVec 32) ValueCell!3834)) (size!9974 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20261)

(assert (=> b!361115 (= res!200894 (and (= (size!9974 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9973 _keys!1541) (size!9974 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14046 () Bool)

(declare-fun mapRes!14046 () Bool)

(declare-fun tp!28122 () Bool)

(declare-fun e!221089 () Bool)

(assert (=> mapNonEmpty!14046 (= mapRes!14046 (and tp!28122 e!221089))))

(declare-fun mapRest!14046 () (Array (_ BitVec 32) ValueCell!3834))

(declare-fun mapKey!14046 () (_ BitVec 32))

(declare-fun mapValue!14046 () ValueCell!3834)

(assert (=> mapNonEmpty!14046 (= (arr!9622 _values!1277) (store mapRest!14046 mapKey!14046 mapValue!14046))))

(declare-fun b!361116 () Bool)

(declare-fun e!221091 () Bool)

(declare-fun e!221090 () Bool)

(assert (=> b!361116 (= e!221091 (and e!221090 mapRes!14046))))

(declare-fun condMapEmpty!14046 () Bool)

(declare-fun mapDefault!14046 () ValueCell!3834)

(assert (=> b!361116 (= condMapEmpty!14046 (= (arr!9622 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3834)) mapDefault!14046)))))

(declare-fun b!361117 () Bool)

(declare-fun tp_is_empty!8355 () Bool)

(assert (=> b!361117 (= e!221090 tp_is_empty!8355)))

(declare-fun res!200893 () Bool)

(assert (=> start!35924 (=> (not res!200893) (not e!221088))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35924 (= res!200893 (validMask!0 mask!1943))))

(assert (=> start!35924 e!221088))

(assert (=> start!35924 true))

(declare-fun array_inv!7074 (array!20261) Bool)

(assert (=> start!35924 (and (array_inv!7074 _values!1277) e!221091)))

(declare-fun array_inv!7075 (array!20259) Bool)

(assert (=> start!35924 (array_inv!7075 _keys!1541)))

(declare-fun mapIsEmpty!14046 () Bool)

(assert (=> mapIsEmpty!14046 mapRes!14046))

(declare-fun b!361118 () Bool)

(assert (=> b!361118 (= e!221089 tp_is_empty!8355)))

(declare-fun b!361119 () Bool)

(assert (=> b!361119 (= e!221088 (bvsgt #b00000000000000000000000000000000 (size!9973 _keys!1541)))))

(declare-fun b!361120 () Bool)

(declare-fun res!200895 () Bool)

(assert (=> b!361120 (=> (not res!200895) (not e!221088))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20259 (_ BitVec 32)) Bool)

(assert (=> b!361120 (= res!200895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(assert (= (and start!35924 res!200893) b!361115))

(assert (= (and b!361115 res!200894) b!361120))

(assert (= (and b!361120 res!200895) b!361119))

(assert (= (and b!361116 condMapEmpty!14046) mapIsEmpty!14046))

(assert (= (and b!361116 (not condMapEmpty!14046)) mapNonEmpty!14046))

(get-info :version)

(assert (= (and mapNonEmpty!14046 ((_ is ValueCellFull!3834) mapValue!14046)) b!361118))

(assert (= (and b!361116 ((_ is ValueCellFull!3834) mapDefault!14046)) b!361117))

(assert (= start!35924 b!361116))

(declare-fun m!358065 () Bool)

(assert (=> mapNonEmpty!14046 m!358065))

(declare-fun m!358067 () Bool)

(assert (=> start!35924 m!358067))

(declare-fun m!358069 () Bool)

(assert (=> start!35924 m!358069))

(declare-fun m!358071 () Bool)

(assert (=> start!35924 m!358071))

(declare-fun m!358073 () Bool)

(assert (=> b!361120 m!358073))

(check-sat (not b!361120) (not start!35924) (not mapNonEmpty!14046) tp_is_empty!8355)
(check-sat)
(get-model)

(declare-fun b!361147 () Bool)

(declare-fun e!221114 () Bool)

(declare-fun e!221115 () Bool)

(assert (=> b!361147 (= e!221114 e!221115)))

(declare-fun c!53718 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361147 (= c!53718 (validKeyInArray!0 (select (arr!9621 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71889 () Bool)

(declare-fun res!200910 () Bool)

(assert (=> d!71889 (=> res!200910 e!221114)))

(assert (=> d!71889 (= res!200910 (bvsge #b00000000000000000000000000000000 (size!9973 _keys!1541)))))

(assert (=> d!71889 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221114)))

(declare-fun b!361148 () Bool)

(declare-fun call!27169 () Bool)

(assert (=> b!361148 (= e!221115 call!27169)))

(declare-fun b!361149 () Bool)

(declare-fun e!221116 () Bool)

(assert (=> b!361149 (= e!221115 e!221116)))

(declare-fun lt!166525 () (_ BitVec 64))

(assert (=> b!361149 (= lt!166525 (select (arr!9621 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11108 0))(
  ( (Unit!11109) )
))
(declare-fun lt!166526 () Unit!11108)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20259 (_ BitVec 64) (_ BitVec 32)) Unit!11108)

(assert (=> b!361149 (= lt!166526 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166525 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361149 (arrayContainsKey!0 _keys!1541 lt!166525 #b00000000000000000000000000000000)))

(declare-fun lt!166524 () Unit!11108)

(assert (=> b!361149 (= lt!166524 lt!166526)))

(declare-fun res!200909 () Bool)

(declare-datatypes ((SeekEntryResult!3492 0))(
  ( (MissingZero!3492 (index!16147 (_ BitVec 32))) (Found!3492 (index!16148 (_ BitVec 32))) (Intermediate!3492 (undefined!4304 Bool) (index!16149 (_ BitVec 32)) (x!35978 (_ BitVec 32))) (Undefined!3492) (MissingVacant!3492 (index!16150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20259 (_ BitVec 32)) SeekEntryResult!3492)

(assert (=> b!361149 (= res!200909 (= (seekEntryOrOpen!0 (select (arr!9621 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3492 #b00000000000000000000000000000000)))))

(assert (=> b!361149 (=> (not res!200909) (not e!221116))))

(declare-fun b!361150 () Bool)

(assert (=> b!361150 (= e!221116 call!27169)))

(declare-fun bm!27166 () Bool)

(assert (=> bm!27166 (= call!27169 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(assert (= (and d!71889 (not res!200910)) b!361147))

(assert (= (and b!361147 c!53718) b!361149))

(assert (= (and b!361147 (not c!53718)) b!361148))

(assert (= (and b!361149 res!200909) b!361150))

(assert (= (or b!361150 b!361148) bm!27166))

(declare-fun m!358085 () Bool)

(assert (=> b!361147 m!358085))

(assert (=> b!361147 m!358085))

(declare-fun m!358087 () Bool)

(assert (=> b!361147 m!358087))

(assert (=> b!361149 m!358085))

(declare-fun m!358089 () Bool)

(assert (=> b!361149 m!358089))

(declare-fun m!358091 () Bool)

(assert (=> b!361149 m!358091))

(assert (=> b!361149 m!358085))

(declare-fun m!358093 () Bool)

(assert (=> b!361149 m!358093))

(declare-fun m!358095 () Bool)

(assert (=> bm!27166 m!358095))

(assert (=> b!361120 d!71889))

(declare-fun d!71891 () Bool)

(assert (=> d!71891 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35924 d!71891))

(declare-fun d!71893 () Bool)

(assert (=> d!71893 (= (array_inv!7074 _values!1277) (bvsge (size!9974 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35924 d!71893))

(declare-fun d!71895 () Bool)

(assert (=> d!71895 (= (array_inv!7075 _keys!1541) (bvsge (size!9973 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35924 d!71895))

(declare-fun mapIsEmpty!14052 () Bool)

(declare-fun mapRes!14052 () Bool)

(assert (=> mapIsEmpty!14052 mapRes!14052))

(declare-fun b!361157 () Bool)

(declare-fun e!221122 () Bool)

(assert (=> b!361157 (= e!221122 tp_is_empty!8355)))

(declare-fun condMapEmpty!14052 () Bool)

(declare-fun mapDefault!14052 () ValueCell!3834)

(assert (=> mapNonEmpty!14046 (= condMapEmpty!14052 (= mapRest!14046 ((as const (Array (_ BitVec 32) ValueCell!3834)) mapDefault!14052)))))

(declare-fun e!221121 () Bool)

(assert (=> mapNonEmpty!14046 (= tp!28122 (and e!221121 mapRes!14052))))

(declare-fun b!361158 () Bool)

(assert (=> b!361158 (= e!221121 tp_is_empty!8355)))

(declare-fun mapNonEmpty!14052 () Bool)

(declare-fun tp!28128 () Bool)

(assert (=> mapNonEmpty!14052 (= mapRes!14052 (and tp!28128 e!221122))))

(declare-fun mapRest!14052 () (Array (_ BitVec 32) ValueCell!3834))

(declare-fun mapValue!14052 () ValueCell!3834)

(declare-fun mapKey!14052 () (_ BitVec 32))

(assert (=> mapNonEmpty!14052 (= mapRest!14046 (store mapRest!14052 mapKey!14052 mapValue!14052))))

(assert (= (and mapNonEmpty!14046 condMapEmpty!14052) mapIsEmpty!14052))

(assert (= (and mapNonEmpty!14046 (not condMapEmpty!14052)) mapNonEmpty!14052))

(assert (= (and mapNonEmpty!14052 ((_ is ValueCellFull!3834) mapValue!14052)) b!361157))

(assert (= (and mapNonEmpty!14046 ((_ is ValueCellFull!3834) mapDefault!14052)) b!361158))

(declare-fun m!358097 () Bool)

(assert (=> mapNonEmpty!14052 m!358097))

(check-sat (not b!361147) (not b!361149) (not mapNonEmpty!14052) (not bm!27166) tp_is_empty!8355)
(check-sat)
