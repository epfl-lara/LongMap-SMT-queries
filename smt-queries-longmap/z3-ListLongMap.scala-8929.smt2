; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108270 () Bool)

(assert start!108270)

(declare-fun mapNonEmpty!51773 () Bool)

(declare-fun mapRes!51773 () Bool)

(declare-fun tp!98748 () Bool)

(declare-fun e!730117 () Bool)

(assert (=> mapNonEmpty!51773 (= mapRes!51773 (and tp!98748 e!730117))))

(declare-fun mapKey!51773 () (_ BitVec 32))

(declare-datatypes ((V!49753 0))(
  ( (V!49754 (val!16818 Int)) )
))
(declare-datatypes ((ValueCell!15845 0))(
  ( (ValueCellFull!15845 (v!19416 V!49753)) (EmptyCell!15845) )
))
(declare-fun mapValue!51773 () ValueCell!15845)

(declare-fun mapRest!51773 () (Array (_ BitVec 32) ValueCell!15845))

(declare-datatypes ((array!83961 0))(
  ( (array!83962 (arr!40488 (Array (_ BitVec 32) ValueCell!15845)) (size!41040 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!83961)

(assert (=> mapNonEmpty!51773 (= (arr!40488 _values!1445) (store mapRest!51773 mapKey!51773 mapValue!51773))))

(declare-fun mapIsEmpty!51773 () Bool)

(assert (=> mapIsEmpty!51773 mapRes!51773))

(declare-fun res!849216 () Bool)

(declare-fun e!730114 () Bool)

(assert (=> start!108270 (=> (not res!849216) (not e!730114))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108270 (= res!849216 (validMask!0 mask!2175))))

(assert (=> start!108270 e!730114))

(assert (=> start!108270 true))

(declare-fun e!730116 () Bool)

(declare-fun array_inv!30913 (array!83961) Bool)

(assert (=> start!108270 (and (array_inv!30913 _values!1445) e!730116)))

(declare-datatypes ((array!83963 0))(
  ( (array!83964 (arr!40489 (Array (_ BitVec 32) (_ BitVec 64))) (size!41041 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!83963)

(declare-fun array_inv!30914 (array!83963) Bool)

(assert (=> start!108270 (array_inv!30914 _keys!1741)))

(declare-fun b!1278191 () Bool)

(declare-fun res!849215 () Bool)

(assert (=> b!1278191 (=> (not res!849215) (not e!730114))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83963 (_ BitVec 32)) Bool)

(assert (=> b!1278191 (= res!849215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278192 () Bool)

(declare-fun e!730115 () Bool)

(assert (=> b!1278192 (= e!730116 (and e!730115 mapRes!51773))))

(declare-fun condMapEmpty!51773 () Bool)

(declare-fun mapDefault!51773 () ValueCell!15845)

(assert (=> b!1278192 (= condMapEmpty!51773 (= (arr!40488 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15845)) mapDefault!51773)))))

(declare-fun b!1278193 () Bool)

(assert (=> b!1278193 (= e!730114 (and (bvsle #b00000000000000000000000000000000 (size!41041 _keys!1741)) (bvsge (size!41041 _keys!1741) #b01111111111111111111111111111111)))))

(declare-fun b!1278194 () Bool)

(declare-fun tp_is_empty!33487 () Bool)

(assert (=> b!1278194 (= e!730117 tp_is_empty!33487)))

(declare-fun b!1278195 () Bool)

(assert (=> b!1278195 (= e!730115 tp_is_empty!33487)))

(declare-fun b!1278196 () Bool)

(declare-fun res!849214 () Bool)

(assert (=> b!1278196 (=> (not res!849214) (not e!730114))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278196 (= res!849214 (and (= (size!41040 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41041 _keys!1741) (size!41040 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(assert (= (and start!108270 res!849216) b!1278196))

(assert (= (and b!1278196 res!849214) b!1278191))

(assert (= (and b!1278191 res!849215) b!1278193))

(assert (= (and b!1278192 condMapEmpty!51773) mapIsEmpty!51773))

(assert (= (and b!1278192 (not condMapEmpty!51773)) mapNonEmpty!51773))

(get-info :version)

(assert (= (and mapNonEmpty!51773 ((_ is ValueCellFull!15845) mapValue!51773)) b!1278194))

(assert (= (and b!1278192 ((_ is ValueCellFull!15845) mapDefault!51773)) b!1278195))

(assert (= start!108270 b!1278192))

(declare-fun m!1173135 () Bool)

(assert (=> mapNonEmpty!51773 m!1173135))

(declare-fun m!1173137 () Bool)

(assert (=> start!108270 m!1173137))

(declare-fun m!1173139 () Bool)

(assert (=> start!108270 m!1173139))

(declare-fun m!1173141 () Bool)

(assert (=> start!108270 m!1173141))

(declare-fun m!1173143 () Bool)

(assert (=> b!1278191 m!1173143))

(check-sat (not b!1278191) (not start!108270) (not mapNonEmpty!51773) tp_is_empty!33487)
(check-sat)
(get-model)

(declare-fun d!140411 () Bool)

(declare-fun res!849239 () Bool)

(declare-fun e!730154 () Bool)

(assert (=> d!140411 (=> res!849239 e!730154)))

(assert (=> d!140411 (= res!849239 (bvsge #b00000000000000000000000000000000 (size!41041 _keys!1741)))))

(assert (=> d!140411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!730154)))

(declare-fun b!1278241 () Bool)

(declare-fun e!730156 () Bool)

(assert (=> b!1278241 (= e!730154 e!730156)))

(declare-fun c!124016 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1278241 (= c!124016 (validKeyInArray!0 (select (arr!40489 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun b!1278242 () Bool)

(declare-fun e!730155 () Bool)

(assert (=> b!1278242 (= e!730156 e!730155)))

(declare-fun lt!575685 () (_ BitVec 64))

(assert (=> b!1278242 (= lt!575685 (select (arr!40489 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42233 0))(
  ( (Unit!42234) )
))
(declare-fun lt!575684 () Unit!42233)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83963 (_ BitVec 64) (_ BitVec 32)) Unit!42233)

(assert (=> b!1278242 (= lt!575684 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!575685 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278242 (arrayContainsKey!0 _keys!1741 lt!575685 #b00000000000000000000000000000000)))

(declare-fun lt!575683 () Unit!42233)

(assert (=> b!1278242 (= lt!575683 lt!575684)))

(declare-fun res!849240 () Bool)

(declare-datatypes ((SeekEntryResult!10008 0))(
  ( (MissingZero!10008 (index!42403 (_ BitVec 32))) (Found!10008 (index!42404 (_ BitVec 32))) (Intermediate!10008 (undefined!10820 Bool) (index!42405 (_ BitVec 32)) (x!113304 (_ BitVec 32))) (Undefined!10008) (MissingVacant!10008 (index!42406 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83963 (_ BitVec 32)) SeekEntryResult!10008)

(assert (=> b!1278242 (= res!849240 (= (seekEntryOrOpen!0 (select (arr!40489 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10008 #b00000000000000000000000000000000)))))

(assert (=> b!1278242 (=> (not res!849240) (not e!730155))))

(declare-fun bm!62688 () Bool)

(declare-fun call!62691 () Bool)

(assert (=> bm!62688 (= call!62691 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1278243 () Bool)

(assert (=> b!1278243 (= e!730156 call!62691)))

(declare-fun b!1278244 () Bool)

(assert (=> b!1278244 (= e!730155 call!62691)))

(assert (= (and d!140411 (not res!849239)) b!1278241))

(assert (= (and b!1278241 c!124016) b!1278242))

(assert (= (and b!1278241 (not c!124016)) b!1278243))

(assert (= (and b!1278242 res!849240) b!1278244))

(assert (= (or b!1278244 b!1278243) bm!62688))

(declare-fun m!1173165 () Bool)

(assert (=> b!1278241 m!1173165))

(assert (=> b!1278241 m!1173165))

(declare-fun m!1173167 () Bool)

(assert (=> b!1278241 m!1173167))

(assert (=> b!1278242 m!1173165))

(declare-fun m!1173169 () Bool)

(assert (=> b!1278242 m!1173169))

(declare-fun m!1173171 () Bool)

(assert (=> b!1278242 m!1173171))

(assert (=> b!1278242 m!1173165))

(declare-fun m!1173173 () Bool)

(assert (=> b!1278242 m!1173173))

(declare-fun m!1173175 () Bool)

(assert (=> bm!62688 m!1173175))

(assert (=> b!1278191 d!140411))

(declare-fun d!140413 () Bool)

(assert (=> d!140413 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108270 d!140413))

(declare-fun d!140415 () Bool)

(assert (=> d!140415 (= (array_inv!30913 _values!1445) (bvsge (size!41040 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108270 d!140415))

(declare-fun d!140417 () Bool)

(assert (=> d!140417 (= (array_inv!30914 _keys!1741) (bvsge (size!41041 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108270 d!140417))

(declare-fun condMapEmpty!51782 () Bool)

(declare-fun mapDefault!51782 () ValueCell!15845)

(assert (=> mapNonEmpty!51773 (= condMapEmpty!51782 (= mapRest!51773 ((as const (Array (_ BitVec 32) ValueCell!15845)) mapDefault!51782)))))

(declare-fun e!730161 () Bool)

(declare-fun mapRes!51782 () Bool)

(assert (=> mapNonEmpty!51773 (= tp!98748 (and e!730161 mapRes!51782))))

(declare-fun b!1278251 () Bool)

(declare-fun e!730162 () Bool)

(assert (=> b!1278251 (= e!730162 tp_is_empty!33487)))

(declare-fun b!1278252 () Bool)

(assert (=> b!1278252 (= e!730161 tp_is_empty!33487)))

(declare-fun mapNonEmpty!51782 () Bool)

(declare-fun tp!98757 () Bool)

(assert (=> mapNonEmpty!51782 (= mapRes!51782 (and tp!98757 e!730162))))

(declare-fun mapValue!51782 () ValueCell!15845)

(declare-fun mapKey!51782 () (_ BitVec 32))

(declare-fun mapRest!51782 () (Array (_ BitVec 32) ValueCell!15845))

(assert (=> mapNonEmpty!51782 (= mapRest!51773 (store mapRest!51782 mapKey!51782 mapValue!51782))))

(declare-fun mapIsEmpty!51782 () Bool)

(assert (=> mapIsEmpty!51782 mapRes!51782))

(assert (= (and mapNonEmpty!51773 condMapEmpty!51782) mapIsEmpty!51782))

(assert (= (and mapNonEmpty!51773 (not condMapEmpty!51782)) mapNonEmpty!51782))

(assert (= (and mapNonEmpty!51782 ((_ is ValueCellFull!15845) mapValue!51782)) b!1278251))

(assert (= (and mapNonEmpty!51773 ((_ is ValueCellFull!15845) mapDefault!51782)) b!1278252))

(declare-fun m!1173177 () Bool)

(assert (=> mapNonEmpty!51782 m!1173177))

(check-sat (not b!1278242) (not b!1278241) (not bm!62688) (not mapNonEmpty!51782) tp_is_empty!33487)
(check-sat)
