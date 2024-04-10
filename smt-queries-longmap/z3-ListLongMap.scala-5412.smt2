; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72228 () Bool)

(assert start!72228)

(declare-fun mapNonEmpty!24554 () Bool)

(declare-fun mapRes!24554 () Bool)

(declare-fun tp!47548 () Bool)

(declare-fun e!467157 () Bool)

(assert (=> mapNonEmpty!24554 (= mapRes!24554 (and tp!47548 e!467157))))

(declare-fun mapKey!24554 () (_ BitVec 32))

(declare-datatypes ((V!25459 0))(
  ( (V!25460 (val!7702 Int)) )
))
(declare-datatypes ((ValueCell!7215 0))(
  ( (ValueCellFull!7215 (v!10126 V!25459)) (EmptyCell!7215) )
))
(declare-fun mapValue!24554 () ValueCell!7215)

(declare-fun mapRest!24554 () (Array (_ BitVec 32) ValueCell!7215))

(declare-datatypes ((array!46916 0))(
  ( (array!46917 (arr!22492 (Array (_ BitVec 32) ValueCell!7215)) (size!22932 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46916)

(assert (=> mapNonEmpty!24554 (= (arr!22492 _values!688) (store mapRest!24554 mapKey!24554 mapValue!24554))))

(declare-fun b!837114 () Bool)

(declare-fun e!467159 () Bool)

(declare-fun tp_is_empty!15309 () Bool)

(assert (=> b!837114 (= e!467159 tp_is_empty!15309)))

(declare-fun b!837115 () Bool)

(declare-fun res!569354 () Bool)

(declare-fun e!467158 () Bool)

(assert (=> b!837115 (=> (not res!569354) (not e!467158))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!46918 0))(
  ( (array!46919 (arr!22493 (Array (_ BitVec 32) (_ BitVec 64))) (size!22933 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46918)

(assert (=> b!837115 (= res!569354 (and (= (size!22932 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22933 _keys!868) (size!22932 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837116 () Bool)

(declare-fun res!569352 () Bool)

(assert (=> b!837116 (=> (not res!569352) (not e!467158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837116 (= res!569352 (validMask!0 mask!1196))))

(declare-fun b!837117 () Bool)

(assert (=> b!837117 (= e!467157 tp_is_empty!15309)))

(declare-fun b!837118 () Bool)

(declare-fun res!569355 () Bool)

(assert (=> b!837118 (=> (not res!569355) (not e!467158))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46918 (_ BitVec 32)) Bool)

(assert (=> b!837118 (= res!569355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!837119 () Bool)

(declare-fun e!467155 () Bool)

(assert (=> b!837119 (= e!467155 (and e!467159 mapRes!24554))))

(declare-fun condMapEmpty!24554 () Bool)

(declare-fun mapDefault!24554 () ValueCell!7215)

(assert (=> b!837119 (= condMapEmpty!24554 (= (arr!22492 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7215)) mapDefault!24554)))))

(declare-fun b!837120 () Bool)

(assert (=> b!837120 (= e!467158 (and (bvsle #b00000000000000000000000000000000 (size!22933 _keys!868)) (bvsge (size!22933 _keys!868) #b01111111111111111111111111111111)))))

(declare-fun res!569353 () Bool)

(assert (=> start!72228 (=> (not res!569353) (not e!467158))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72228 (= res!569353 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22933 _keys!868))))))

(assert (=> start!72228 e!467158))

(assert (=> start!72228 true))

(declare-fun array_inv!17932 (array!46918) Bool)

(assert (=> start!72228 (array_inv!17932 _keys!868)))

(declare-fun array_inv!17933 (array!46916) Bool)

(assert (=> start!72228 (and (array_inv!17933 _values!688) e!467155)))

(declare-fun mapIsEmpty!24554 () Bool)

(assert (=> mapIsEmpty!24554 mapRes!24554))

(assert (= (and start!72228 res!569353) b!837116))

(assert (= (and b!837116 res!569352) b!837115))

(assert (= (and b!837115 res!569354) b!837118))

(assert (= (and b!837118 res!569355) b!837120))

(assert (= (and b!837119 condMapEmpty!24554) mapIsEmpty!24554))

(assert (= (and b!837119 (not condMapEmpty!24554)) mapNonEmpty!24554))

(get-info :version)

(assert (= (and mapNonEmpty!24554 ((_ is ValueCellFull!7215) mapValue!24554)) b!837117))

(assert (= (and b!837119 ((_ is ValueCellFull!7215) mapDefault!24554)) b!837114))

(assert (= start!72228 b!837119))

(declare-fun m!782101 () Bool)

(assert (=> mapNonEmpty!24554 m!782101))

(declare-fun m!782103 () Bool)

(assert (=> b!837116 m!782103))

(declare-fun m!782105 () Bool)

(assert (=> b!837118 m!782105))

(declare-fun m!782107 () Bool)

(assert (=> start!72228 m!782107))

(declare-fun m!782109 () Bool)

(assert (=> start!72228 m!782109))

(check-sat (not start!72228) (not b!837118) tp_is_empty!15309 (not b!837116) (not mapNonEmpty!24554))
(check-sat)
(get-model)

(declare-fun d!107801 () Bool)

(assert (=> d!107801 (= (validMask!0 mask!1196) (and (or (= mask!1196 #b00000000000000000000000000000111) (= mask!1196 #b00000000000000000000000000001111) (= mask!1196 #b00000000000000000000000000011111) (= mask!1196 #b00000000000000000000000000111111) (= mask!1196 #b00000000000000000000000001111111) (= mask!1196 #b00000000000000000000000011111111) (= mask!1196 #b00000000000000000000000111111111) (= mask!1196 #b00000000000000000000001111111111) (= mask!1196 #b00000000000000000000011111111111) (= mask!1196 #b00000000000000000000111111111111) (= mask!1196 #b00000000000000000001111111111111) (= mask!1196 #b00000000000000000011111111111111) (= mask!1196 #b00000000000000000111111111111111) (= mask!1196 #b00000000000000001111111111111111) (= mask!1196 #b00000000000000011111111111111111) (= mask!1196 #b00000000000000111111111111111111) (= mask!1196 #b00000000000001111111111111111111) (= mask!1196 #b00000000000011111111111111111111) (= mask!1196 #b00000000000111111111111111111111) (= mask!1196 #b00000000001111111111111111111111) (= mask!1196 #b00000000011111111111111111111111) (= mask!1196 #b00000000111111111111111111111111) (= mask!1196 #b00000001111111111111111111111111) (= mask!1196 #b00000011111111111111111111111111) (= mask!1196 #b00000111111111111111111111111111) (= mask!1196 #b00001111111111111111111111111111) (= mask!1196 #b00011111111111111111111111111111) (= mask!1196 #b00111111111111111111111111111111)) (bvsle mask!1196 #b00111111111111111111111111111111)))))

(assert (=> b!837116 d!107801))

(declare-fun b!837150 () Bool)

(declare-fun e!467182 () Bool)

(declare-fun e!467183 () Bool)

(assert (=> b!837150 (= e!467182 e!467183)))

(declare-fun lt!380528 () (_ BitVec 64))

(assert (=> b!837150 (= lt!380528 (select (arr!22493 _keys!868) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!28779 0))(
  ( (Unit!28780) )
))
(declare-fun lt!380527 () Unit!28779)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46918 (_ BitVec 64) (_ BitVec 32)) Unit!28779)

(assert (=> b!837150 (= lt!380527 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!868 lt!380528 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!837150 (arrayContainsKey!0 _keys!868 lt!380528 #b00000000000000000000000000000000)))

(declare-fun lt!380529 () Unit!28779)

(assert (=> b!837150 (= lt!380529 lt!380527)))

(declare-fun res!569373 () Bool)

(declare-datatypes ((SeekEntryResult!8746 0))(
  ( (MissingZero!8746 (index!37355 (_ BitVec 32))) (Found!8746 (index!37356 (_ BitVec 32))) (Intermediate!8746 (undefined!9558 Bool) (index!37357 (_ BitVec 32)) (x!70711 (_ BitVec 32))) (Undefined!8746) (MissingVacant!8746 (index!37358 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46918 (_ BitVec 32)) SeekEntryResult!8746)

(assert (=> b!837150 (= res!569373 (= (seekEntryOrOpen!0 (select (arr!22493 _keys!868) #b00000000000000000000000000000000) _keys!868 mask!1196) (Found!8746 #b00000000000000000000000000000000)))))

(assert (=> b!837150 (=> (not res!569373) (not e!467183))))

(declare-fun d!107803 () Bool)

(declare-fun res!569372 () Bool)

(declare-fun e!467181 () Bool)

(assert (=> d!107803 (=> res!569372 e!467181)))

(assert (=> d!107803 (= res!569372 (bvsge #b00000000000000000000000000000000 (size!22933 _keys!868)))))

(assert (=> d!107803 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196) e!467181)))

(declare-fun b!837151 () Bool)

(declare-fun call!36815 () Bool)

(assert (=> b!837151 (= e!467182 call!36815)))

(declare-fun b!837152 () Bool)

(assert (=> b!837152 (= e!467181 e!467182)))

(declare-fun c!91147 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!837152 (= c!91147 (validKeyInArray!0 (select (arr!22493 _keys!868) #b00000000000000000000000000000000)))))

(declare-fun bm!36812 () Bool)

(assert (=> bm!36812 (= call!36815 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!868 mask!1196))))

(declare-fun b!837153 () Bool)

(assert (=> b!837153 (= e!467183 call!36815)))

(assert (= (and d!107803 (not res!569372)) b!837152))

(assert (= (and b!837152 c!91147) b!837150))

(assert (= (and b!837152 (not c!91147)) b!837151))

(assert (= (and b!837150 res!569373) b!837153))

(assert (= (or b!837153 b!837151) bm!36812))

(declare-fun m!782121 () Bool)

(assert (=> b!837150 m!782121))

(declare-fun m!782123 () Bool)

(assert (=> b!837150 m!782123))

(declare-fun m!782125 () Bool)

(assert (=> b!837150 m!782125))

(assert (=> b!837150 m!782121))

(declare-fun m!782127 () Bool)

(assert (=> b!837150 m!782127))

(assert (=> b!837152 m!782121))

(assert (=> b!837152 m!782121))

(declare-fun m!782129 () Bool)

(assert (=> b!837152 m!782129))

(declare-fun m!782131 () Bool)

(assert (=> bm!36812 m!782131))

(assert (=> b!837118 d!107803))

(declare-fun d!107805 () Bool)

(assert (=> d!107805 (= (array_inv!17932 _keys!868) (bvsge (size!22933 _keys!868) #b00000000000000000000000000000000))))

(assert (=> start!72228 d!107805))

(declare-fun d!107807 () Bool)

(assert (=> d!107807 (= (array_inv!17933 _values!688) (bvsge (size!22932 _values!688) #b00000000000000000000000000000000))))

(assert (=> start!72228 d!107807))

(declare-fun mapNonEmpty!24560 () Bool)

(declare-fun mapRes!24560 () Bool)

(declare-fun tp!47554 () Bool)

(declare-fun e!467188 () Bool)

(assert (=> mapNonEmpty!24560 (= mapRes!24560 (and tp!47554 e!467188))))

(declare-fun mapRest!24560 () (Array (_ BitVec 32) ValueCell!7215))

(declare-fun mapValue!24560 () ValueCell!7215)

(declare-fun mapKey!24560 () (_ BitVec 32))

(assert (=> mapNonEmpty!24560 (= mapRest!24554 (store mapRest!24560 mapKey!24560 mapValue!24560))))

(declare-fun condMapEmpty!24560 () Bool)

(declare-fun mapDefault!24560 () ValueCell!7215)

(assert (=> mapNonEmpty!24554 (= condMapEmpty!24560 (= mapRest!24554 ((as const (Array (_ BitVec 32) ValueCell!7215)) mapDefault!24560)))))

(declare-fun e!467189 () Bool)

(assert (=> mapNonEmpty!24554 (= tp!47548 (and e!467189 mapRes!24560))))

(declare-fun b!837160 () Bool)

(assert (=> b!837160 (= e!467188 tp_is_empty!15309)))

(declare-fun b!837161 () Bool)

(assert (=> b!837161 (= e!467189 tp_is_empty!15309)))

(declare-fun mapIsEmpty!24560 () Bool)

(assert (=> mapIsEmpty!24560 mapRes!24560))

(assert (= (and mapNonEmpty!24554 condMapEmpty!24560) mapIsEmpty!24560))

(assert (= (and mapNonEmpty!24554 (not condMapEmpty!24560)) mapNonEmpty!24560))

(assert (= (and mapNonEmpty!24560 ((_ is ValueCellFull!7215) mapValue!24560)) b!837160))

(assert (= (and mapNonEmpty!24554 ((_ is ValueCellFull!7215) mapDefault!24560)) b!837161))

(declare-fun m!782133 () Bool)

(assert (=> mapNonEmpty!24560 m!782133))

(check-sat (not bm!36812) tp_is_empty!15309 (not b!837150) (not mapNonEmpty!24560) (not b!837152))
(check-sat)
