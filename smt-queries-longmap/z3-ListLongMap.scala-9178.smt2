; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110386 () Bool)

(assert start!110386)

(declare-fun b!1306168 () Bool)

(declare-fun res!867166 () Bool)

(declare-fun e!745138 () Bool)

(assert (=> b!1306168 (=> (not res!867166) (not e!745138))))

(declare-datatypes ((array!86887 0))(
  ( (array!86888 (arr!41927 (Array (_ BitVec 32) (_ BitVec 64))) (size!42479 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!86887)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!51745 0))(
  ( (V!51746 (val!17565 Int)) )
))
(declare-datatypes ((ValueCell!16592 0))(
  ( (ValueCellFull!16592 (v!20190 V!51745)) (EmptyCell!16592) )
))
(declare-datatypes ((array!86889 0))(
  ( (array!86890 (arr!41928 (Array (_ BitVec 32) ValueCell!16592)) (size!42480 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!86889)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1306168 (= res!867166 (and (= (size!42480 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42479 _keys!1628) (size!42480 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!867167 () Bool)

(assert (=> start!110386 (=> (not res!867167) (not e!745138))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110386 (= res!867167 (validMask!0 mask!2040))))

(assert (=> start!110386 e!745138))

(assert (=> start!110386 true))

(declare-fun e!745140 () Bool)

(declare-fun array_inv!31885 (array!86889) Bool)

(assert (=> start!110386 (and (array_inv!31885 _values!1354) e!745140)))

(declare-fun array_inv!31886 (array!86887) Bool)

(assert (=> start!110386 (array_inv!31886 _keys!1628)))

(declare-fun b!1306169 () Bool)

(declare-fun res!867165 () Bool)

(assert (=> b!1306169 (=> (not res!867165) (not e!745138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86887 (_ BitVec 32)) Bool)

(assert (=> b!1306169 (= res!867165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapIsEmpty!54091 () Bool)

(declare-fun mapRes!54091 () Bool)

(assert (=> mapIsEmpty!54091 mapRes!54091))

(declare-fun b!1306170 () Bool)

(assert (=> b!1306170 (= e!745138 (and (bvsle #b00000000000000000000000000000000 (size!42479 _keys!1628)) (bvsge (size!42479 _keys!1628) #b01111111111111111111111111111111)))))

(declare-fun b!1306171 () Bool)

(declare-fun e!745136 () Bool)

(declare-fun tp_is_empty!34981 () Bool)

(assert (=> b!1306171 (= e!745136 tp_is_empty!34981)))

(declare-fun b!1306172 () Bool)

(declare-fun e!745137 () Bool)

(assert (=> b!1306172 (= e!745137 tp_is_empty!34981)))

(declare-fun mapNonEmpty!54091 () Bool)

(declare-fun tp!103172 () Bool)

(assert (=> mapNonEmpty!54091 (= mapRes!54091 (and tp!103172 e!745137))))

(declare-fun mapKey!54091 () (_ BitVec 32))

(declare-fun mapValue!54091 () ValueCell!16592)

(declare-fun mapRest!54091 () (Array (_ BitVec 32) ValueCell!16592))

(assert (=> mapNonEmpty!54091 (= (arr!41928 _values!1354) (store mapRest!54091 mapKey!54091 mapValue!54091))))

(declare-fun b!1306173 () Bool)

(assert (=> b!1306173 (= e!745140 (and e!745136 mapRes!54091))))

(declare-fun condMapEmpty!54091 () Bool)

(declare-fun mapDefault!54091 () ValueCell!16592)

(assert (=> b!1306173 (= condMapEmpty!54091 (= (arr!41928 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16592)) mapDefault!54091)))))

(assert (= (and start!110386 res!867167) b!1306168))

(assert (= (and b!1306168 res!867166) b!1306169))

(assert (= (and b!1306169 res!867165) b!1306170))

(assert (= (and b!1306173 condMapEmpty!54091) mapIsEmpty!54091))

(assert (= (and b!1306173 (not condMapEmpty!54091)) mapNonEmpty!54091))

(get-info :version)

(assert (= (and mapNonEmpty!54091 ((_ is ValueCellFull!16592) mapValue!54091)) b!1306172))

(assert (= (and b!1306173 ((_ is ValueCellFull!16592) mapDefault!54091)) b!1306171))

(assert (= start!110386 b!1306173))

(declare-fun m!1196835 () Bool)

(assert (=> start!110386 m!1196835))

(declare-fun m!1196837 () Bool)

(assert (=> start!110386 m!1196837))

(declare-fun m!1196839 () Bool)

(assert (=> start!110386 m!1196839))

(declare-fun m!1196841 () Bool)

(assert (=> b!1306169 m!1196841))

(declare-fun m!1196843 () Bool)

(assert (=> mapNonEmpty!54091 m!1196843))

(check-sat (not b!1306169) (not start!110386) (not mapNonEmpty!54091) tp_is_empty!34981)
(check-sat)
(get-model)

(declare-fun bm!64604 () Bool)

(declare-fun call!64607 () Bool)

(assert (=> bm!64604 (= call!64607 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1628 mask!2040))))

(declare-fun d!142117 () Bool)

(declare-fun res!867190 () Bool)

(declare-fun e!745177 () Bool)

(assert (=> d!142117 (=> res!867190 e!745177)))

(assert (=> d!142117 (= res!867190 (bvsge #b00000000000000000000000000000000 (size!42479 _keys!1628)))))

(assert (=> d!142117 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040) e!745177)))

(declare-fun b!1306218 () Bool)

(declare-fun e!745178 () Bool)

(declare-fun e!745179 () Bool)

(assert (=> b!1306218 (= e!745178 e!745179)))

(declare-fun lt!584720 () (_ BitVec 64))

(assert (=> b!1306218 (= lt!584720 (select (arr!41927 _keys!1628) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43107 0))(
  ( (Unit!43108) )
))
(declare-fun lt!584719 () Unit!43107)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!86887 (_ BitVec 64) (_ BitVec 32)) Unit!43107)

(assert (=> b!1306218 (= lt!584719 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1628 lt!584720 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!86887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1306218 (arrayContainsKey!0 _keys!1628 lt!584720 #b00000000000000000000000000000000)))

(declare-fun lt!584718 () Unit!43107)

(assert (=> b!1306218 (= lt!584718 lt!584719)))

(declare-fun res!867191 () Bool)

(declare-datatypes ((SeekEntryResult!10031 0))(
  ( (MissingZero!10031 (index!42495 (_ BitVec 32))) (Found!10031 (index!42496 (_ BitVec 32))) (Intermediate!10031 (undefined!10843 Bool) (index!42497 (_ BitVec 32)) (x!116004 (_ BitVec 32))) (Undefined!10031) (MissingVacant!10031 (index!42498 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!86887 (_ BitVec 32)) SeekEntryResult!10031)

(assert (=> b!1306218 (= res!867191 (= (seekEntryOrOpen!0 (select (arr!41927 _keys!1628) #b00000000000000000000000000000000) _keys!1628 mask!2040) (Found!10031 #b00000000000000000000000000000000)))))

(assert (=> b!1306218 (=> (not res!867191) (not e!745179))))

(declare-fun b!1306219 () Bool)

(assert (=> b!1306219 (= e!745178 call!64607)))

(declare-fun b!1306220 () Bool)

(assert (=> b!1306220 (= e!745179 call!64607)))

(declare-fun b!1306221 () Bool)

(assert (=> b!1306221 (= e!745177 e!745178)))

(declare-fun c!125523 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1306221 (= c!125523 (validKeyInArray!0 (select (arr!41927 _keys!1628) #b00000000000000000000000000000000)))))

(assert (= (and d!142117 (not res!867190)) b!1306221))

(assert (= (and b!1306221 c!125523) b!1306218))

(assert (= (and b!1306221 (not c!125523)) b!1306219))

(assert (= (and b!1306218 res!867191) b!1306220))

(assert (= (or b!1306220 b!1306219) bm!64604))

(declare-fun m!1196865 () Bool)

(assert (=> bm!64604 m!1196865))

(declare-fun m!1196867 () Bool)

(assert (=> b!1306218 m!1196867))

(declare-fun m!1196869 () Bool)

(assert (=> b!1306218 m!1196869))

(declare-fun m!1196871 () Bool)

(assert (=> b!1306218 m!1196871))

(assert (=> b!1306218 m!1196867))

(declare-fun m!1196873 () Bool)

(assert (=> b!1306218 m!1196873))

(assert (=> b!1306221 m!1196867))

(assert (=> b!1306221 m!1196867))

(declare-fun m!1196875 () Bool)

(assert (=> b!1306221 m!1196875))

(assert (=> b!1306169 d!142117))

(declare-fun d!142119 () Bool)

(assert (=> d!142119 (= (validMask!0 mask!2040) (and (or (= mask!2040 #b00000000000000000000000000000111) (= mask!2040 #b00000000000000000000000000001111) (= mask!2040 #b00000000000000000000000000011111) (= mask!2040 #b00000000000000000000000000111111) (= mask!2040 #b00000000000000000000000001111111) (= mask!2040 #b00000000000000000000000011111111) (= mask!2040 #b00000000000000000000000111111111) (= mask!2040 #b00000000000000000000001111111111) (= mask!2040 #b00000000000000000000011111111111) (= mask!2040 #b00000000000000000000111111111111) (= mask!2040 #b00000000000000000001111111111111) (= mask!2040 #b00000000000000000011111111111111) (= mask!2040 #b00000000000000000111111111111111) (= mask!2040 #b00000000000000001111111111111111) (= mask!2040 #b00000000000000011111111111111111) (= mask!2040 #b00000000000000111111111111111111) (= mask!2040 #b00000000000001111111111111111111) (= mask!2040 #b00000000000011111111111111111111) (= mask!2040 #b00000000000111111111111111111111) (= mask!2040 #b00000000001111111111111111111111) (= mask!2040 #b00000000011111111111111111111111) (= mask!2040 #b00000000111111111111111111111111) (= mask!2040 #b00000001111111111111111111111111) (= mask!2040 #b00000011111111111111111111111111) (= mask!2040 #b00000111111111111111111111111111) (= mask!2040 #b00001111111111111111111111111111) (= mask!2040 #b00011111111111111111111111111111) (= mask!2040 #b00111111111111111111111111111111)) (bvsle mask!2040 #b00111111111111111111111111111111)))))

(assert (=> start!110386 d!142119))

(declare-fun d!142121 () Bool)

(assert (=> d!142121 (= (array_inv!31885 _values!1354) (bvsge (size!42480 _values!1354) #b00000000000000000000000000000000))))

(assert (=> start!110386 d!142121))

(declare-fun d!142123 () Bool)

(assert (=> d!142123 (= (array_inv!31886 _keys!1628) (bvsge (size!42479 _keys!1628) #b00000000000000000000000000000000))))

(assert (=> start!110386 d!142123))

(declare-fun b!1306229 () Bool)

(declare-fun e!745185 () Bool)

(assert (=> b!1306229 (= e!745185 tp_is_empty!34981)))

(declare-fun mapIsEmpty!54100 () Bool)

(declare-fun mapRes!54100 () Bool)

(assert (=> mapIsEmpty!54100 mapRes!54100))

(declare-fun condMapEmpty!54100 () Bool)

(declare-fun mapDefault!54100 () ValueCell!16592)

(assert (=> mapNonEmpty!54091 (= condMapEmpty!54100 (= mapRest!54091 ((as const (Array (_ BitVec 32) ValueCell!16592)) mapDefault!54100)))))

(assert (=> mapNonEmpty!54091 (= tp!103172 (and e!745185 mapRes!54100))))

(declare-fun b!1306228 () Bool)

(declare-fun e!745184 () Bool)

(assert (=> b!1306228 (= e!745184 tp_is_empty!34981)))

(declare-fun mapNonEmpty!54100 () Bool)

(declare-fun tp!103181 () Bool)

(assert (=> mapNonEmpty!54100 (= mapRes!54100 (and tp!103181 e!745184))))

(declare-fun mapValue!54100 () ValueCell!16592)

(declare-fun mapKey!54100 () (_ BitVec 32))

(declare-fun mapRest!54100 () (Array (_ BitVec 32) ValueCell!16592))

(assert (=> mapNonEmpty!54100 (= mapRest!54091 (store mapRest!54100 mapKey!54100 mapValue!54100))))

(assert (= (and mapNonEmpty!54091 condMapEmpty!54100) mapIsEmpty!54100))

(assert (= (and mapNonEmpty!54091 (not condMapEmpty!54100)) mapNonEmpty!54100))

(assert (= (and mapNonEmpty!54100 ((_ is ValueCellFull!16592) mapValue!54100)) b!1306228))

(assert (= (and mapNonEmpty!54091 ((_ is ValueCellFull!16592) mapDefault!54100)) b!1306229))

(declare-fun m!1196877 () Bool)

(assert (=> mapNonEmpty!54100 m!1196877))

(check-sat (not b!1306221) tp_is_empty!34981 (not mapNonEmpty!54100) (not b!1306218) (not bm!64604))
(check-sat)
