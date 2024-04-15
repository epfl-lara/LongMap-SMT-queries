; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108256 () Bool)

(assert start!108256)

(declare-fun b!1278117 () Bool)

(declare-fun res!849182 () Bool)

(declare-fun e!730055 () Bool)

(assert (=> b!1278117 (=> (not res!849182) (not e!730055))))

(declare-datatypes ((array!83947 0))(
  ( (array!83948 (arr!40482 (Array (_ BitVec 32) (_ BitVec 64))) (size!41034 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!83947)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83947 (_ BitVec 32)) Bool)

(assert (=> b!1278117 (= res!849182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278118 () Bool)

(declare-fun e!730057 () Bool)

(declare-fun tp_is_empty!33481 () Bool)

(assert (=> b!1278118 (= e!730057 tp_is_empty!33481)))

(declare-fun mapIsEmpty!51761 () Bool)

(declare-fun mapRes!51761 () Bool)

(assert (=> mapIsEmpty!51761 mapRes!51761))

(declare-fun res!849181 () Bool)

(assert (=> start!108256 (=> (not res!849181) (not e!730055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108256 (= res!849181 (validMask!0 mask!2175))))

(assert (=> start!108256 e!730055))

(assert (=> start!108256 true))

(declare-datatypes ((V!49745 0))(
  ( (V!49746 (val!16815 Int)) )
))
(declare-datatypes ((ValueCell!15842 0))(
  ( (ValueCellFull!15842 (v!19413 V!49745)) (EmptyCell!15842) )
))
(declare-datatypes ((array!83949 0))(
  ( (array!83950 (arr!40483 (Array (_ BitVec 32) ValueCell!15842)) (size!41035 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!83949)

(declare-fun e!730053 () Bool)

(declare-fun array_inv!30911 (array!83949) Bool)

(assert (=> start!108256 (and (array_inv!30911 _values!1445) e!730053)))

(declare-fun array_inv!30912 (array!83947) Bool)

(assert (=> start!108256 (array_inv!30912 _keys!1741)))

(declare-fun b!1278119 () Bool)

(assert (=> b!1278119 (= e!730053 (and e!730057 mapRes!51761))))

(declare-fun condMapEmpty!51761 () Bool)

(declare-fun mapDefault!51761 () ValueCell!15842)

(assert (=> b!1278119 (= condMapEmpty!51761 (= (arr!40483 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15842)) mapDefault!51761)))))

(declare-fun b!1278120 () Bool)

(assert (=> b!1278120 (= e!730055 (bvsgt #b00000000000000000000000000000000 (size!41034 _keys!1741)))))

(declare-fun mapNonEmpty!51761 () Bool)

(declare-fun tp!98736 () Bool)

(declare-fun e!730056 () Bool)

(assert (=> mapNonEmpty!51761 (= mapRes!51761 (and tp!98736 e!730056))))

(declare-fun mapKey!51761 () (_ BitVec 32))

(declare-fun mapValue!51761 () ValueCell!15842)

(declare-fun mapRest!51761 () (Array (_ BitVec 32) ValueCell!15842))

(assert (=> mapNonEmpty!51761 (= (arr!40483 _values!1445) (store mapRest!51761 mapKey!51761 mapValue!51761))))

(declare-fun b!1278121 () Bool)

(declare-fun res!849183 () Bool)

(assert (=> b!1278121 (=> (not res!849183) (not e!730055))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278121 (= res!849183 (and (= (size!41035 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41034 _keys!1741) (size!41035 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1278122 () Bool)

(assert (=> b!1278122 (= e!730056 tp_is_empty!33481)))

(assert (= (and start!108256 res!849181) b!1278121))

(assert (= (and b!1278121 res!849183) b!1278117))

(assert (= (and b!1278117 res!849182) b!1278120))

(assert (= (and b!1278119 condMapEmpty!51761) mapIsEmpty!51761))

(assert (= (and b!1278119 (not condMapEmpty!51761)) mapNonEmpty!51761))

(get-info :version)

(assert (= (and mapNonEmpty!51761 ((_ is ValueCellFull!15842) mapValue!51761)) b!1278122))

(assert (= (and b!1278119 ((_ is ValueCellFull!15842) mapDefault!51761)) b!1278118))

(assert (= start!108256 b!1278119))

(declare-fun m!1173091 () Bool)

(assert (=> b!1278117 m!1173091))

(declare-fun m!1173093 () Bool)

(assert (=> start!108256 m!1173093))

(declare-fun m!1173095 () Bool)

(assert (=> start!108256 m!1173095))

(declare-fun m!1173097 () Bool)

(assert (=> start!108256 m!1173097))

(declare-fun m!1173099 () Bool)

(assert (=> mapNonEmpty!51761 m!1173099))

(check-sat (not start!108256) (not b!1278117) (not mapNonEmpty!51761) tp_is_empty!33481)
(check-sat)
(get-model)

(declare-fun d!140401 () Bool)

(assert (=> d!140401 (= (validMask!0 mask!2175) (and (or (= mask!2175 #b00000000000000000000000000000111) (= mask!2175 #b00000000000000000000000000001111) (= mask!2175 #b00000000000000000000000000011111) (= mask!2175 #b00000000000000000000000000111111) (= mask!2175 #b00000000000000000000000001111111) (= mask!2175 #b00000000000000000000000011111111) (= mask!2175 #b00000000000000000000000111111111) (= mask!2175 #b00000000000000000000001111111111) (= mask!2175 #b00000000000000000000011111111111) (= mask!2175 #b00000000000000000000111111111111) (= mask!2175 #b00000000000000000001111111111111) (= mask!2175 #b00000000000000000011111111111111) (= mask!2175 #b00000000000000000111111111111111) (= mask!2175 #b00000000000000001111111111111111) (= mask!2175 #b00000000000000011111111111111111) (= mask!2175 #b00000000000000111111111111111111) (= mask!2175 #b00000000000001111111111111111111) (= mask!2175 #b00000000000011111111111111111111) (= mask!2175 #b00000000000111111111111111111111) (= mask!2175 #b00000000001111111111111111111111) (= mask!2175 #b00000000011111111111111111111111) (= mask!2175 #b00000000111111111111111111111111) (= mask!2175 #b00000001111111111111111111111111) (= mask!2175 #b00000011111111111111111111111111) (= mask!2175 #b00000111111111111111111111111111) (= mask!2175 #b00001111111111111111111111111111) (= mask!2175 #b00011111111111111111111111111111) (= mask!2175 #b00111111111111111111111111111111)) (bvsle mask!2175 #b00111111111111111111111111111111)))))

(assert (=> start!108256 d!140401))

(declare-fun d!140403 () Bool)

(assert (=> d!140403 (= (array_inv!30911 _values!1445) (bvsge (size!41035 _values!1445) #b00000000000000000000000000000000))))

(assert (=> start!108256 d!140403))

(declare-fun d!140405 () Bool)

(assert (=> d!140405 (= (array_inv!30912 _keys!1741) (bvsge (size!41034 _keys!1741) #b00000000000000000000000000000000))))

(assert (=> start!108256 d!140405))

(declare-fun b!1278167 () Bool)

(declare-fun e!730095 () Bool)

(declare-fun e!730094 () Bool)

(assert (=> b!1278167 (= e!730095 e!730094)))

(declare-fun c!124013 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1278167 (= c!124013 (validKeyInArray!0 (select (arr!40482 _keys!1741) #b00000000000000000000000000000000)))))

(declare-fun bm!62685 () Bool)

(declare-fun call!62688 () Bool)

(assert (=> bm!62685 (= call!62688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1741 mask!2175))))

(declare-fun b!1278168 () Bool)

(declare-fun e!730096 () Bool)

(assert (=> b!1278168 (= e!730096 call!62688)))

(declare-fun b!1278169 () Bool)

(assert (=> b!1278169 (= e!730094 e!730096)))

(declare-fun lt!575674 () (_ BitVec 64))

(assert (=> b!1278169 (= lt!575674 (select (arr!40482 _keys!1741) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42231 0))(
  ( (Unit!42232) )
))
(declare-fun lt!575675 () Unit!42231)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83947 (_ BitVec 64) (_ BitVec 32)) Unit!42231)

(assert (=> b!1278169 (= lt!575675 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1741 lt!575674 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1278169 (arrayContainsKey!0 _keys!1741 lt!575674 #b00000000000000000000000000000000)))

(declare-fun lt!575676 () Unit!42231)

(assert (=> b!1278169 (= lt!575676 lt!575675)))

(declare-fun res!849206 () Bool)

(declare-datatypes ((SeekEntryResult!10007 0))(
  ( (MissingZero!10007 (index!42399 (_ BitVec 32))) (Found!10007 (index!42400 (_ BitVec 32))) (Intermediate!10007 (undefined!10819 Bool) (index!42401 (_ BitVec 32)) (x!113293 (_ BitVec 32))) (Undefined!10007) (MissingVacant!10007 (index!42402 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83947 (_ BitVec 32)) SeekEntryResult!10007)

(assert (=> b!1278169 (= res!849206 (= (seekEntryOrOpen!0 (select (arr!40482 _keys!1741) #b00000000000000000000000000000000) _keys!1741 mask!2175) (Found!10007 #b00000000000000000000000000000000)))))

(assert (=> b!1278169 (=> (not res!849206) (not e!730096))))

(declare-fun d!140407 () Bool)

(declare-fun res!849207 () Bool)

(assert (=> d!140407 (=> res!849207 e!730095)))

(assert (=> d!140407 (= res!849207 (bvsge #b00000000000000000000000000000000 (size!41034 _keys!1741)))))

(assert (=> d!140407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175) e!730095)))

(declare-fun b!1278170 () Bool)

(assert (=> b!1278170 (= e!730094 call!62688)))

(assert (= (and d!140407 (not res!849207)) b!1278167))

(assert (= (and b!1278167 c!124013) b!1278169))

(assert (= (and b!1278167 (not c!124013)) b!1278170))

(assert (= (and b!1278169 res!849206) b!1278168))

(assert (= (or b!1278168 b!1278170) bm!62685))

(declare-fun m!1173121 () Bool)

(assert (=> b!1278167 m!1173121))

(assert (=> b!1278167 m!1173121))

(declare-fun m!1173123 () Bool)

(assert (=> b!1278167 m!1173123))

(declare-fun m!1173125 () Bool)

(assert (=> bm!62685 m!1173125))

(assert (=> b!1278169 m!1173121))

(declare-fun m!1173127 () Bool)

(assert (=> b!1278169 m!1173127))

(declare-fun m!1173129 () Bool)

(assert (=> b!1278169 m!1173129))

(assert (=> b!1278169 m!1173121))

(declare-fun m!1173131 () Bool)

(assert (=> b!1278169 m!1173131))

(assert (=> b!1278117 d!140407))

(declare-fun mapIsEmpty!51770 () Bool)

(declare-fun mapRes!51770 () Bool)

(assert (=> mapIsEmpty!51770 mapRes!51770))

(declare-fun condMapEmpty!51770 () Bool)

(declare-fun mapDefault!51770 () ValueCell!15842)

(assert (=> mapNonEmpty!51761 (= condMapEmpty!51770 (= mapRest!51761 ((as const (Array (_ BitVec 32) ValueCell!15842)) mapDefault!51770)))))

(declare-fun e!730101 () Bool)

(assert (=> mapNonEmpty!51761 (= tp!98736 (and e!730101 mapRes!51770))))

(declare-fun b!1278177 () Bool)

(declare-fun e!730102 () Bool)

(assert (=> b!1278177 (= e!730102 tp_is_empty!33481)))

(declare-fun mapNonEmpty!51770 () Bool)

(declare-fun tp!98745 () Bool)

(assert (=> mapNonEmpty!51770 (= mapRes!51770 (and tp!98745 e!730102))))

(declare-fun mapKey!51770 () (_ BitVec 32))

(declare-fun mapValue!51770 () ValueCell!15842)

(declare-fun mapRest!51770 () (Array (_ BitVec 32) ValueCell!15842))

(assert (=> mapNonEmpty!51770 (= mapRest!51761 (store mapRest!51770 mapKey!51770 mapValue!51770))))

(declare-fun b!1278178 () Bool)

(assert (=> b!1278178 (= e!730101 tp_is_empty!33481)))

(assert (= (and mapNonEmpty!51761 condMapEmpty!51770) mapIsEmpty!51770))

(assert (= (and mapNonEmpty!51761 (not condMapEmpty!51770)) mapNonEmpty!51770))

(assert (= (and mapNonEmpty!51770 ((_ is ValueCellFull!15842) mapValue!51770)) b!1278177))

(assert (= (and mapNonEmpty!51761 ((_ is ValueCellFull!15842) mapDefault!51770)) b!1278178))

(declare-fun m!1173133 () Bool)

(assert (=> mapNonEmpty!51770 m!1173133))

(check-sat tp_is_empty!33481 (not b!1278167) (not bm!62685) (not b!1278169) (not mapNonEmpty!51770))
(check-sat)
