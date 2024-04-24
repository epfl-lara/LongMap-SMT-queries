; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82250 () Bool)

(assert start!82250)

(declare-fun b!957954 () Bool)

(declare-fun res!641066 () Bool)

(declare-fun e!539968 () Bool)

(assert (=> b!957954 (=> (not res!641066) (not e!539968))))

(declare-datatypes ((array!58320 0))(
  ( (array!58321 (arr!28032 (Array (_ BitVec 32) (_ BitVec 64))) (size!28512 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58320)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58320 (_ BitVec 32)) Bool)

(assert (=> b!957954 (= res!641066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957955 () Bool)

(declare-fun e!539967 () Bool)

(declare-fun tp_is_empty!21091 () Bool)

(assert (=> b!957955 (= e!539967 tp_is_empty!21091)))

(declare-fun b!957956 () Bool)

(declare-fun e!539966 () Bool)

(declare-fun mapRes!33607 () Bool)

(assert (=> b!957956 (= e!539966 (and e!539967 mapRes!33607))))

(declare-fun condMapEmpty!33607 () Bool)

(declare-datatypes ((V!33105 0))(
  ( (V!33106 (val!10596 Int)) )
))
(declare-datatypes ((ValueCell!10064 0))(
  ( (ValueCellFull!10064 (v!13149 V!33105)) (EmptyCell!10064) )
))
(declare-datatypes ((array!58322 0))(
  ( (array!58323 (arr!28033 (Array (_ BitVec 32) ValueCell!10064)) (size!28513 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58322)

(declare-fun mapDefault!33607 () ValueCell!10064)

(assert (=> b!957956 (= condMapEmpty!33607 (= (arr!28033 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10064)) mapDefault!33607)))))

(declare-fun b!957957 () Bool)

(assert (=> b!957957 (= e!539968 (and (bvsle #b00000000000000000000000000000000 (size!28512 _keys!1668)) (bvsge (size!28512 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun res!641064 () Bool)

(assert (=> start!82250 (=> (not res!641064) (not e!539968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82250 (= res!641064 (validMask!0 mask!2088))))

(assert (=> start!82250 e!539968))

(assert (=> start!82250 true))

(declare-fun array_inv!21819 (array!58322) Bool)

(assert (=> start!82250 (and (array_inv!21819 _values!1386) e!539966)))

(declare-fun array_inv!21820 (array!58320) Bool)

(assert (=> start!82250 (array_inv!21820 _keys!1668)))

(declare-fun b!957958 () Bool)

(declare-fun e!539965 () Bool)

(assert (=> b!957958 (= e!539965 tp_is_empty!21091)))

(declare-fun mapNonEmpty!33607 () Bool)

(declare-fun tp!64213 () Bool)

(assert (=> mapNonEmpty!33607 (= mapRes!33607 (and tp!64213 e!539965))))

(declare-fun mapValue!33607 () ValueCell!10064)

(declare-fun mapKey!33607 () (_ BitVec 32))

(declare-fun mapRest!33607 () (Array (_ BitVec 32) ValueCell!10064))

(assert (=> mapNonEmpty!33607 (= (arr!28033 _values!1386) (store mapRest!33607 mapKey!33607 mapValue!33607))))

(declare-fun b!957959 () Bool)

(declare-fun res!641065 () Bool)

(assert (=> b!957959 (=> (not res!641065) (not e!539968))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957959 (= res!641065 (and (= (size!28513 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28512 _keys!1668) (size!28513 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33607 () Bool)

(assert (=> mapIsEmpty!33607 mapRes!33607))

(assert (= (and start!82250 res!641064) b!957959))

(assert (= (and b!957959 res!641065) b!957954))

(assert (= (and b!957954 res!641066) b!957957))

(assert (= (and b!957956 condMapEmpty!33607) mapIsEmpty!33607))

(assert (= (and b!957956 (not condMapEmpty!33607)) mapNonEmpty!33607))

(get-info :version)

(assert (= (and mapNonEmpty!33607 ((_ is ValueCellFull!10064) mapValue!33607)) b!957958))

(assert (= (and b!957956 ((_ is ValueCellFull!10064) mapDefault!33607)) b!957955))

(assert (= start!82250 b!957956))

(declare-fun m!889461 () Bool)

(assert (=> b!957954 m!889461))

(declare-fun m!889463 () Bool)

(assert (=> start!82250 m!889463))

(declare-fun m!889465 () Bool)

(assert (=> start!82250 m!889465))

(declare-fun m!889467 () Bool)

(assert (=> start!82250 m!889467))

(declare-fun m!889469 () Bool)

(assert (=> mapNonEmpty!33607 m!889469))

(check-sat (not b!957954) (not start!82250) (not mapNonEmpty!33607) tp_is_empty!21091)
(check-sat)
(get-model)

(declare-fun b!958004 () Bool)

(declare-fun e!540005 () Bool)

(declare-fun call!41756 () Bool)

(assert (=> b!958004 (= e!540005 call!41756)))

(declare-fun b!958005 () Bool)

(declare-fun e!540007 () Bool)

(declare-fun e!540006 () Bool)

(assert (=> b!958005 (= e!540007 e!540006)))

(declare-fun c!100181 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958005 (= c!100181 (validKeyInArray!0 (select (arr!28032 _keys!1668) #b00000000000000000000000000000000)))))

(declare-fun b!958006 () Bool)

(assert (=> b!958006 (= e!540006 e!540005)))

(declare-fun lt!430641 () (_ BitVec 64))

(assert (=> b!958006 (= lt!430641 (select (arr!28032 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32120 0))(
  ( (Unit!32121) )
))
(declare-fun lt!430639 () Unit!32120)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58320 (_ BitVec 64) (_ BitVec 32)) Unit!32120)

(assert (=> b!958006 (= lt!430639 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430641 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58320 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!958006 (arrayContainsKey!0 _keys!1668 lt!430641 #b00000000000000000000000000000000)))

(declare-fun lt!430640 () Unit!32120)

(assert (=> b!958006 (= lt!430640 lt!430639)))

(declare-fun res!641089 () Bool)

(declare-datatypes ((SeekEntryResult!9145 0))(
  ( (MissingZero!9145 (index!38951 (_ BitVec 32))) (Found!9145 (index!38952 (_ BitVec 32))) (Intermediate!9145 (undefined!9957 Bool) (index!38953 (_ BitVec 32)) (x!82457 (_ BitVec 32))) (Undefined!9145) (MissingVacant!9145 (index!38954 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58320 (_ BitVec 32)) SeekEntryResult!9145)

(assert (=> b!958006 (= res!641089 (= (seekEntryOrOpen!0 (select (arr!28032 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9145 #b00000000000000000000000000000000)))))

(assert (=> b!958006 (=> (not res!641089) (not e!540005))))

(declare-fun d!116203 () Bool)

(declare-fun res!641090 () Bool)

(assert (=> d!116203 (=> res!641090 e!540007)))

(assert (=> d!116203 (= res!641090 (bvsge #b00000000000000000000000000000000 (size!28512 _keys!1668)))))

(assert (=> d!116203 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!540007)))

(declare-fun b!958007 () Bool)

(assert (=> b!958007 (= e!540006 call!41756)))

(declare-fun bm!41753 () Bool)

(assert (=> bm!41753 (= call!41756 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(assert (= (and d!116203 (not res!641090)) b!958005))

(assert (= (and b!958005 c!100181) b!958006))

(assert (= (and b!958005 (not c!100181)) b!958007))

(assert (= (and b!958006 res!641089) b!958004))

(assert (= (or b!958004 b!958007) bm!41753))

(declare-fun m!889491 () Bool)

(assert (=> b!958005 m!889491))

(assert (=> b!958005 m!889491))

(declare-fun m!889493 () Bool)

(assert (=> b!958005 m!889493))

(assert (=> b!958006 m!889491))

(declare-fun m!889495 () Bool)

(assert (=> b!958006 m!889495))

(declare-fun m!889497 () Bool)

(assert (=> b!958006 m!889497))

(assert (=> b!958006 m!889491))

(declare-fun m!889499 () Bool)

(assert (=> b!958006 m!889499))

(declare-fun m!889501 () Bool)

(assert (=> bm!41753 m!889501))

(assert (=> b!957954 d!116203))

(declare-fun d!116205 () Bool)

(assert (=> d!116205 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82250 d!116205))

(declare-fun d!116207 () Bool)

(assert (=> d!116207 (= (array_inv!21819 _values!1386) (bvsge (size!28513 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82250 d!116207))

(declare-fun d!116209 () Bool)

(assert (=> d!116209 (= (array_inv!21820 _keys!1668) (bvsge (size!28512 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82250 d!116209))

(declare-fun mapNonEmpty!33616 () Bool)

(declare-fun mapRes!33616 () Bool)

(declare-fun tp!64222 () Bool)

(declare-fun e!540013 () Bool)

(assert (=> mapNonEmpty!33616 (= mapRes!33616 (and tp!64222 e!540013))))

(declare-fun mapKey!33616 () (_ BitVec 32))

(declare-fun mapRest!33616 () (Array (_ BitVec 32) ValueCell!10064))

(declare-fun mapValue!33616 () ValueCell!10064)

(assert (=> mapNonEmpty!33616 (= mapRest!33607 (store mapRest!33616 mapKey!33616 mapValue!33616))))

(declare-fun mapIsEmpty!33616 () Bool)

(assert (=> mapIsEmpty!33616 mapRes!33616))

(declare-fun condMapEmpty!33616 () Bool)

(declare-fun mapDefault!33616 () ValueCell!10064)

(assert (=> mapNonEmpty!33607 (= condMapEmpty!33616 (= mapRest!33607 ((as const (Array (_ BitVec 32) ValueCell!10064)) mapDefault!33616)))))

(declare-fun e!540012 () Bool)

(assert (=> mapNonEmpty!33607 (= tp!64213 (and e!540012 mapRes!33616))))

(declare-fun b!958015 () Bool)

(assert (=> b!958015 (= e!540012 tp_is_empty!21091)))

(declare-fun b!958014 () Bool)

(assert (=> b!958014 (= e!540013 tp_is_empty!21091)))

(assert (= (and mapNonEmpty!33607 condMapEmpty!33616) mapIsEmpty!33616))

(assert (= (and mapNonEmpty!33607 (not condMapEmpty!33616)) mapNonEmpty!33616))

(assert (= (and mapNonEmpty!33616 ((_ is ValueCellFull!10064) mapValue!33616)) b!958014))

(assert (= (and mapNonEmpty!33607 ((_ is ValueCellFull!10064) mapDefault!33616)) b!958015))

(declare-fun m!889503 () Bool)

(assert (=> mapNonEmpty!33616 m!889503))

(check-sat (not b!958005) (not mapNonEmpty!33616) tp_is_empty!21091 (not b!958006) (not bm!41753))
(check-sat)
