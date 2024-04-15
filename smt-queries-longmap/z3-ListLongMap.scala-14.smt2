; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!468 () Bool)

(assert start!468)

(declare-fun b!2753 () Bool)

(declare-fun e!1102 () Bool)

(declare-fun tp_is_empty!67 () Bool)

(assert (=> b!2753 (= e!1102 tp_is_empty!67)))

(declare-fun b!2754 () Bool)

(declare-fun res!4825 () Bool)

(declare-fun e!1104 () Bool)

(assert (=> b!2754 (=> (not res!4825) (not e!1104))))

(declare-datatypes ((array!63 0))(
  ( (array!64 (arr!29 (Array (_ BitVec 32) (_ BitVec 64))) (size!91 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!63)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63 (_ BitVec 32)) Bool)

(assert (=> b!2754 (= res!4825 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!2755 () Bool)

(declare-fun e!1101 () Bool)

(declare-fun mapRes!44 () Bool)

(assert (=> b!2755 (= e!1101 (and e!1102 mapRes!44))))

(declare-fun condMapEmpty!44 () Bool)

(declare-datatypes ((V!267 0))(
  ( (V!268 (val!39 Int)) )
))
(declare-datatypes ((ValueCell!17 0))(
  ( (ValueCellFull!17 (v!1125 V!267)) (EmptyCell!17) )
))
(declare-datatypes ((array!65 0))(
  ( (array!66 (arr!30 (Array (_ BitVec 32) ValueCell!17)) (size!92 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!65)

(declare-fun mapDefault!44 () ValueCell!17)

(assert (=> b!2755 (= condMapEmpty!44 (= (arr!30 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!17)) mapDefault!44)))))

(declare-fun mapNonEmpty!44 () Bool)

(declare-fun tp!284 () Bool)

(declare-fun e!1100 () Bool)

(assert (=> mapNonEmpty!44 (= mapRes!44 (and tp!284 e!1100))))

(declare-fun mapRest!44 () (Array (_ BitVec 32) ValueCell!17))

(declare-fun mapKey!44 () (_ BitVec 32))

(declare-fun mapValue!44 () ValueCell!17)

(assert (=> mapNonEmpty!44 (= (arr!30 _values!1492) (store mapRest!44 mapKey!44 mapValue!44))))

(declare-fun res!4826 () Bool)

(assert (=> start!468 (=> (not res!4826) (not e!1104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!468 (= res!4826 (validMask!0 mask!2250))))

(assert (=> start!468 e!1104))

(assert (=> start!468 true))

(declare-fun array_inv!17 (array!65) Bool)

(assert (=> start!468 (and (array_inv!17 _values!1492) e!1101)))

(declare-fun array_inv!18 (array!63) Bool)

(assert (=> start!468 (array_inv!18 _keys!1806)))

(declare-fun b!2756 () Bool)

(declare-fun res!4824 () Bool)

(assert (=> b!2756 (=> (not res!4824) (not e!1104))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!2756 (= res!4824 (and (= (size!92 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!91 _keys!1806) (size!92 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44 () Bool)

(assert (=> mapIsEmpty!44 mapRes!44))

(declare-fun b!2757 () Bool)

(assert (=> b!2757 (= e!1104 (bvsgt #b00000000000000000000000000000000 (size!91 _keys!1806)))))

(declare-fun b!2758 () Bool)

(assert (=> b!2758 (= e!1100 tp_is_empty!67)))

(assert (= (and start!468 res!4826) b!2756))

(assert (= (and b!2756 res!4824) b!2754))

(assert (= (and b!2754 res!4825) b!2757))

(assert (= (and b!2755 condMapEmpty!44) mapIsEmpty!44))

(assert (= (and b!2755 (not condMapEmpty!44)) mapNonEmpty!44))

(get-info :version)

(assert (= (and mapNonEmpty!44 ((_ is ValueCellFull!17) mapValue!44)) b!2758))

(assert (= (and b!2755 ((_ is ValueCellFull!17) mapDefault!44)) b!2753))

(assert (= start!468 b!2755))

(declare-fun m!1215 () Bool)

(assert (=> b!2754 m!1215))

(declare-fun m!1217 () Bool)

(assert (=> mapNonEmpty!44 m!1217))

(declare-fun m!1219 () Bool)

(assert (=> start!468 m!1219))

(declare-fun m!1221 () Bool)

(assert (=> start!468 m!1221))

(declare-fun m!1223 () Bool)

(assert (=> start!468 m!1223))

(check-sat (not start!468) (not b!2754) (not mapNonEmpty!44) tp_is_empty!67)
(check-sat)
(get-model)

(declare-fun d!573 () Bool)

(assert (=> d!573 (= (validMask!0 mask!2250) (and (or (= mask!2250 #b00000000000000000000000000000111) (= mask!2250 #b00000000000000000000000000001111) (= mask!2250 #b00000000000000000000000000011111) (= mask!2250 #b00000000000000000000000000111111) (= mask!2250 #b00000000000000000000000001111111) (= mask!2250 #b00000000000000000000000011111111) (= mask!2250 #b00000000000000000000000111111111) (= mask!2250 #b00000000000000000000001111111111) (= mask!2250 #b00000000000000000000011111111111) (= mask!2250 #b00000000000000000000111111111111) (= mask!2250 #b00000000000000000001111111111111) (= mask!2250 #b00000000000000000011111111111111) (= mask!2250 #b00000000000000000111111111111111) (= mask!2250 #b00000000000000001111111111111111) (= mask!2250 #b00000000000000011111111111111111) (= mask!2250 #b00000000000000111111111111111111) (= mask!2250 #b00000000000001111111111111111111) (= mask!2250 #b00000000000011111111111111111111) (= mask!2250 #b00000000000111111111111111111111) (= mask!2250 #b00000000001111111111111111111111) (= mask!2250 #b00000000011111111111111111111111) (= mask!2250 #b00000000111111111111111111111111) (= mask!2250 #b00000001111111111111111111111111) (= mask!2250 #b00000011111111111111111111111111) (= mask!2250 #b00000111111111111111111111111111) (= mask!2250 #b00001111111111111111111111111111) (= mask!2250 #b00011111111111111111111111111111) (= mask!2250 #b00111111111111111111111111111111)) (bvsle mask!2250 #b00111111111111111111111111111111)))))

(assert (=> start!468 d!573))

(declare-fun d!575 () Bool)

(assert (=> d!575 (= (array_inv!17 _values!1492) (bvsge (size!92 _values!1492) #b00000000000000000000000000000000))))

(assert (=> start!468 d!575))

(declare-fun d!577 () Bool)

(assert (=> d!577 (= (array_inv!18 _keys!1806) (bvsge (size!91 _keys!1806) #b00000000000000000000000000000000))))

(assert (=> start!468 d!577))

(declare-fun b!2803 () Bool)

(declare-fun e!1141 () Bool)

(declare-fun call!32 () Bool)

(assert (=> b!2803 (= e!1141 call!32)))

(declare-fun b!2804 () Bool)

(declare-fun e!1143 () Bool)

(assert (=> b!2804 (= e!1143 e!1141)))

(declare-fun c!176 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!2804 (= c!176 (validKeyInArray!0 (select (arr!29 _keys!1806) #b00000000000000000000000000000000)))))

(declare-fun bm!29 () Bool)

(assert (=> bm!29 (= call!32 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1806 mask!2250))))

(declare-fun b!2805 () Bool)

(declare-fun e!1142 () Bool)

(assert (=> b!2805 (= e!1142 call!32)))

(declare-fun d!579 () Bool)

(declare-fun res!4849 () Bool)

(assert (=> d!579 (=> res!4849 e!1143)))

(assert (=> d!579 (= res!4849 (bvsge #b00000000000000000000000000000000 (size!91 _keys!1806)))))

(assert (=> d!579 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250) e!1143)))

(declare-fun b!2806 () Bool)

(assert (=> b!2806 (= e!1141 e!1142)))

(declare-fun lt!384 () (_ BitVec 64))

(assert (=> b!2806 (= lt!384 (select (arr!29 _keys!1806) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!19 0))(
  ( (Unit!20) )
))
(declare-fun lt!386 () Unit!19)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63 (_ BitVec 64) (_ BitVec 32)) Unit!19)

(assert (=> b!2806 (= lt!386 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1806 lt!384 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!63 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!2806 (arrayContainsKey!0 _keys!1806 lt!384 #b00000000000000000000000000000000)))

(declare-fun lt!385 () Unit!19)

(assert (=> b!2806 (= lt!385 lt!386)))

(declare-fun res!4850 () Bool)

(declare-datatypes ((SeekEntryResult!5 0))(
  ( (MissingZero!5 (index!2139 (_ BitVec 32))) (Found!5 (index!2140 (_ BitVec 32))) (Intermediate!5 (undefined!817 Bool) (index!2141 (_ BitVec 32)) (x!2159 (_ BitVec 32))) (Undefined!5) (MissingVacant!5 (index!2142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63 (_ BitVec 32)) SeekEntryResult!5)

(assert (=> b!2806 (= res!4850 (= (seekEntryOrOpen!0 (select (arr!29 _keys!1806) #b00000000000000000000000000000000) _keys!1806 mask!2250) (Found!5 #b00000000000000000000000000000000)))))

(assert (=> b!2806 (=> (not res!4850) (not e!1142))))

(assert (= (and d!579 (not res!4849)) b!2804))

(assert (= (and b!2804 c!176) b!2806))

(assert (= (and b!2804 (not c!176)) b!2803))

(assert (= (and b!2806 res!4850) b!2805))

(assert (= (or b!2805 b!2803) bm!29))

(declare-fun m!1245 () Bool)

(assert (=> b!2804 m!1245))

(assert (=> b!2804 m!1245))

(declare-fun m!1247 () Bool)

(assert (=> b!2804 m!1247))

(declare-fun m!1249 () Bool)

(assert (=> bm!29 m!1249))

(assert (=> b!2806 m!1245))

(declare-fun m!1251 () Bool)

(assert (=> b!2806 m!1251))

(declare-fun m!1253 () Bool)

(assert (=> b!2806 m!1253))

(assert (=> b!2806 m!1245))

(declare-fun m!1255 () Bool)

(assert (=> b!2806 m!1255))

(assert (=> b!2754 d!579))

(declare-fun mapIsEmpty!53 () Bool)

(declare-fun mapRes!53 () Bool)

(assert (=> mapIsEmpty!53 mapRes!53))

(declare-fun condMapEmpty!53 () Bool)

(declare-fun mapDefault!53 () ValueCell!17)

(assert (=> mapNonEmpty!44 (= condMapEmpty!53 (= mapRest!44 ((as const (Array (_ BitVec 32) ValueCell!17)) mapDefault!53)))))

(declare-fun e!1148 () Bool)

(assert (=> mapNonEmpty!44 (= tp!284 (and e!1148 mapRes!53))))

(declare-fun b!2814 () Bool)

(assert (=> b!2814 (= e!1148 tp_is_empty!67)))

(declare-fun b!2813 () Bool)

(declare-fun e!1149 () Bool)

(assert (=> b!2813 (= e!1149 tp_is_empty!67)))

(declare-fun mapNonEmpty!53 () Bool)

(declare-fun tp!293 () Bool)

(assert (=> mapNonEmpty!53 (= mapRes!53 (and tp!293 e!1149))))

(declare-fun mapKey!53 () (_ BitVec 32))

(declare-fun mapRest!53 () (Array (_ BitVec 32) ValueCell!17))

(declare-fun mapValue!53 () ValueCell!17)

(assert (=> mapNonEmpty!53 (= mapRest!44 (store mapRest!53 mapKey!53 mapValue!53))))

(assert (= (and mapNonEmpty!44 condMapEmpty!53) mapIsEmpty!53))

(assert (= (and mapNonEmpty!44 (not condMapEmpty!53)) mapNonEmpty!53))

(assert (= (and mapNonEmpty!53 ((_ is ValueCellFull!17) mapValue!53)) b!2813))

(assert (= (and mapNonEmpty!44 ((_ is ValueCellFull!17) mapDefault!53)) b!2814))

(declare-fun m!1257 () Bool)

(assert (=> mapNonEmpty!53 m!1257))

(check-sat tp_is_empty!67 (not bm!29) (not b!2806) (not b!2804) (not mapNonEmpty!53))
(check-sat)
