; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83812 () Bool)

(assert start!83812)

(declare-fun b!977963 () Bool)

(declare-fun res!654320 () Bool)

(declare-fun e!551314 () Bool)

(assert (=> b!977963 (=> (not res!654320) (not e!551314))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!34953 0))(
  ( (V!34954 (val!11289 Int)) )
))
(declare-datatypes ((ValueCell!10757 0))(
  ( (ValueCellFull!10757 (v!13847 V!34953)) (EmptyCell!10757) )
))
(declare-datatypes ((array!61022 0))(
  ( (array!61023 (arr!29367 (Array (_ BitVec 32) ValueCell!10757)) (size!29847 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61022)

(declare-datatypes ((array!61024 0))(
  ( (array!61025 (arr!29368 (Array (_ BitVec 32) (_ BitVec 64))) (size!29848 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61024)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977963 (= res!654320 (and (= (size!29847 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29848 _keys!1544) (size!29847 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977965 () Bool)

(declare-fun e!551310 () Bool)

(declare-fun tp_is_empty!22477 () Bool)

(assert (=> b!977965 (= e!551310 tp_is_empty!22477)))

(declare-fun mapNonEmpty!35735 () Bool)

(declare-fun mapRes!35735 () Bool)

(declare-fun tp!67988 () Bool)

(declare-fun e!551313 () Bool)

(assert (=> mapNonEmpty!35735 (= mapRes!35735 (and tp!67988 e!551313))))

(declare-fun mapValue!35735 () ValueCell!10757)

(declare-fun mapKey!35735 () (_ BitVec 32))

(declare-fun mapRest!35735 () (Array (_ BitVec 32) ValueCell!10757))

(assert (=> mapNonEmpty!35735 (= (arr!29367 _values!1278) (store mapRest!35735 mapKey!35735 mapValue!35735))))

(declare-fun mapIsEmpty!35735 () Bool)

(assert (=> mapIsEmpty!35735 mapRes!35735))

(declare-fun b!977966 () Bool)

(declare-fun e!551311 () Bool)

(assert (=> b!977966 (= e!551311 (and e!551310 mapRes!35735))))

(declare-fun condMapEmpty!35735 () Bool)

(declare-fun mapDefault!35735 () ValueCell!10757)

(assert (=> b!977966 (= condMapEmpty!35735 (= (arr!29367 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10757)) mapDefault!35735)))))

(declare-fun res!654318 () Bool)

(assert (=> start!83812 (=> (not res!654318) (not e!551314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83812 (= res!654318 (validMask!0 mask!1948))))

(assert (=> start!83812 e!551314))

(assert (=> start!83812 true))

(declare-fun array_inv!22761 (array!61022) Bool)

(assert (=> start!83812 (and (array_inv!22761 _values!1278) e!551311)))

(declare-fun array_inv!22762 (array!61024) Bool)

(assert (=> start!83812 (array_inv!22762 _keys!1544)))

(declare-fun b!977964 () Bool)

(assert (=> b!977964 (= e!551314 (and (bvsle #b00000000000000000000000000000000 (size!29848 _keys!1544)) (bvsge (size!29848 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!977967 () Bool)

(declare-fun res!654319 () Bool)

(assert (=> b!977967 (=> (not res!654319) (not e!551314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61024 (_ BitVec 32)) Bool)

(assert (=> b!977967 (= res!654319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977968 () Bool)

(assert (=> b!977968 (= e!551313 tp_is_empty!22477)))

(assert (= (and start!83812 res!654318) b!977963))

(assert (= (and b!977963 res!654320) b!977967))

(assert (= (and b!977967 res!654319) b!977964))

(assert (= (and b!977966 condMapEmpty!35735) mapIsEmpty!35735))

(assert (= (and b!977966 (not condMapEmpty!35735)) mapNonEmpty!35735))

(get-info :version)

(assert (= (and mapNonEmpty!35735 ((_ is ValueCellFull!10757) mapValue!35735)) b!977968))

(assert (= (and b!977966 ((_ is ValueCellFull!10757) mapDefault!35735)) b!977965))

(assert (= start!83812 b!977966))

(declare-fun m!905759 () Bool)

(assert (=> mapNonEmpty!35735 m!905759))

(declare-fun m!905761 () Bool)

(assert (=> start!83812 m!905761))

(declare-fun m!905763 () Bool)

(assert (=> start!83812 m!905763))

(declare-fun m!905765 () Bool)

(assert (=> start!83812 m!905765))

(declare-fun m!905767 () Bool)

(assert (=> b!977967 m!905767))

(check-sat (not start!83812) (not b!977967) (not mapNonEmpty!35735) tp_is_empty!22477)
(check-sat)
(get-model)

(declare-fun d!116957 () Bool)

(assert (=> d!116957 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83812 d!116957))

(declare-fun d!116959 () Bool)

(assert (=> d!116959 (= (array_inv!22761 _values!1278) (bvsge (size!29847 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83812 d!116959))

(declare-fun d!116961 () Bool)

(assert (=> d!116961 (= (array_inv!22762 _keys!1544) (bvsge (size!29848 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83812 d!116961))

(declare-fun b!978013 () Bool)

(declare-fun e!551351 () Bool)

(declare-fun call!41832 () Bool)

(assert (=> b!978013 (= e!551351 call!41832)))

(declare-fun b!978014 () Bool)

(declare-fun e!551352 () Bool)

(assert (=> b!978014 (= e!551352 call!41832)))

(declare-fun b!978015 () Bool)

(assert (=> b!978015 (= e!551351 e!551352)))

(declare-fun lt!433787 () (_ BitVec 64))

(assert (=> b!978015 (= lt!433787 (select (arr!29368 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32460 0))(
  ( (Unit!32461) )
))
(declare-fun lt!433785 () Unit!32460)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!61024 (_ BitVec 64) (_ BitVec 32)) Unit!32460)

(assert (=> b!978015 (= lt!433785 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433787 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!61024 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!978015 (arrayContainsKey!0 _keys!1544 lt!433787 #b00000000000000000000000000000000)))

(declare-fun lt!433786 () Unit!32460)

(assert (=> b!978015 (= lt!433786 lt!433785)))

(declare-fun res!654343 () Bool)

(declare-datatypes ((SeekEntryResult!9158 0))(
  ( (MissingZero!9158 (index!39003 (_ BitVec 32))) (Found!9158 (index!39004 (_ BitVec 32))) (Intermediate!9158 (undefined!9970 Bool) (index!39005 (_ BitVec 32)) (x!84513 (_ BitVec 32))) (Undefined!9158) (MissingVacant!9158 (index!39006 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!61024 (_ BitVec 32)) SeekEntryResult!9158)

(assert (=> b!978015 (= res!654343 (= (seekEntryOrOpen!0 (select (arr!29368 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9158 #b00000000000000000000000000000000)))))

(assert (=> b!978015 (=> (not res!654343) (not e!551352))))

(declare-fun b!978016 () Bool)

(declare-fun e!551353 () Bool)

(assert (=> b!978016 (= e!551353 e!551351)))

(declare-fun c!100298 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978016 (= c!100298 (validKeyInArray!0 (select (arr!29368 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun bm!41829 () Bool)

(assert (=> bm!41829 (= call!41832 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun d!116963 () Bool)

(declare-fun res!654344 () Bool)

(assert (=> d!116963 (=> res!654344 e!551353)))

(assert (=> d!116963 (= res!654344 (bvsge #b00000000000000000000000000000000 (size!29848 _keys!1544)))))

(assert (=> d!116963 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!551353)))

(assert (= (and d!116963 (not res!654344)) b!978016))

(assert (= (and b!978016 c!100298) b!978015))

(assert (= (and b!978016 (not c!100298)) b!978013))

(assert (= (and b!978015 res!654343) b!978014))

(assert (= (or b!978014 b!978013) bm!41829))

(declare-fun m!905789 () Bool)

(assert (=> b!978015 m!905789))

(declare-fun m!905791 () Bool)

(assert (=> b!978015 m!905791))

(declare-fun m!905793 () Bool)

(assert (=> b!978015 m!905793))

(assert (=> b!978015 m!905789))

(declare-fun m!905795 () Bool)

(assert (=> b!978015 m!905795))

(assert (=> b!978016 m!905789))

(assert (=> b!978016 m!905789))

(declare-fun m!905797 () Bool)

(assert (=> b!978016 m!905797))

(declare-fun m!905799 () Bool)

(assert (=> bm!41829 m!905799))

(assert (=> b!977967 d!116963))

(declare-fun b!978024 () Bool)

(declare-fun e!551358 () Bool)

(assert (=> b!978024 (= e!551358 tp_is_empty!22477)))

(declare-fun mapNonEmpty!35744 () Bool)

(declare-fun mapRes!35744 () Bool)

(declare-fun tp!67997 () Bool)

(declare-fun e!551359 () Bool)

(assert (=> mapNonEmpty!35744 (= mapRes!35744 (and tp!67997 e!551359))))

(declare-fun mapValue!35744 () ValueCell!10757)

(declare-fun mapRest!35744 () (Array (_ BitVec 32) ValueCell!10757))

(declare-fun mapKey!35744 () (_ BitVec 32))

(assert (=> mapNonEmpty!35744 (= mapRest!35735 (store mapRest!35744 mapKey!35744 mapValue!35744))))

(declare-fun condMapEmpty!35744 () Bool)

(declare-fun mapDefault!35744 () ValueCell!10757)

(assert (=> mapNonEmpty!35735 (= condMapEmpty!35744 (= mapRest!35735 ((as const (Array (_ BitVec 32) ValueCell!10757)) mapDefault!35744)))))

(assert (=> mapNonEmpty!35735 (= tp!67988 (and e!551358 mapRes!35744))))

(declare-fun b!978023 () Bool)

(assert (=> b!978023 (= e!551359 tp_is_empty!22477)))

(declare-fun mapIsEmpty!35744 () Bool)

(assert (=> mapIsEmpty!35744 mapRes!35744))

(assert (= (and mapNonEmpty!35735 condMapEmpty!35744) mapIsEmpty!35744))

(assert (= (and mapNonEmpty!35735 (not condMapEmpty!35744)) mapNonEmpty!35744))

(assert (= (and mapNonEmpty!35744 ((_ is ValueCellFull!10757) mapValue!35744)) b!978023))

(assert (= (and mapNonEmpty!35735 ((_ is ValueCellFull!10757) mapDefault!35744)) b!978024))

(declare-fun m!905801 () Bool)

(assert (=> mapNonEmpty!35744 m!905801))

(check-sat (not mapNonEmpty!35744) (not b!978016) tp_is_empty!22477 (not bm!41829) (not b!978015))
(check-sat)
