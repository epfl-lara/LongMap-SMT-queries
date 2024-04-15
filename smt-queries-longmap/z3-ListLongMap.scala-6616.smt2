; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83612 () Bool)

(assert start!83612)

(declare-fun b!976747 () Bool)

(declare-fun e!550522 () Bool)

(declare-fun tp_is_empty!22471 () Bool)

(assert (=> b!976747 (= e!550522 tp_is_empty!22471)))

(declare-fun b!976748 () Bool)

(declare-fun e!550524 () Bool)

(declare-datatypes ((array!60902 0))(
  ( (array!60903 (arr!29313 (Array (_ BitVec 32) (_ BitVec 64))) (size!29794 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60902)

(assert (=> b!976748 (= e!550524 (bvsgt #b00000000000000000000000000000000 (size!29794 _keys!1544)))))

(declare-fun mapIsEmpty!35723 () Bool)

(declare-fun mapRes!35723 () Bool)

(assert (=> mapIsEmpty!35723 mapRes!35723))

(declare-fun b!976749 () Bool)

(declare-fun e!550521 () Bool)

(assert (=> b!976749 (= e!550521 tp_is_empty!22471)))

(declare-fun b!976750 () Bool)

(declare-fun res!653833 () Bool)

(assert (=> b!976750 (=> (not res!653833) (not e!550524))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60902 (_ BitVec 32)) Bool)

(assert (=> b!976750 (= res!653833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!976751 () Bool)

(declare-fun res!653831 () Bool)

(assert (=> b!976751 (=> (not res!653831) (not e!550524))))

(declare-datatypes ((V!34945 0))(
  ( (V!34946 (val!11286 Int)) )
))
(declare-datatypes ((ValueCell!10754 0))(
  ( (ValueCellFull!10754 (v!13846 V!34945)) (EmptyCell!10754) )
))
(declare-datatypes ((array!60904 0))(
  ( (array!60905 (arr!29314 (Array (_ BitVec 32) ValueCell!10754)) (size!29795 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60904)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!976751 (= res!653831 (and (= (size!29795 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29794 _keys!1544) (size!29795 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!976752 () Bool)

(declare-fun e!550523 () Bool)

(assert (=> b!976752 (= e!550523 (and e!550521 mapRes!35723))))

(declare-fun condMapEmpty!35723 () Bool)

(declare-fun mapDefault!35723 () ValueCell!10754)

(assert (=> b!976752 (= condMapEmpty!35723 (= (arr!29314 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10754)) mapDefault!35723)))))

(declare-fun mapNonEmpty!35723 () Bool)

(declare-fun tp!67976 () Bool)

(assert (=> mapNonEmpty!35723 (= mapRes!35723 (and tp!67976 e!550522))))

(declare-fun mapValue!35723 () ValueCell!10754)

(declare-fun mapRest!35723 () (Array (_ BitVec 32) ValueCell!10754))

(declare-fun mapKey!35723 () (_ BitVec 32))

(assert (=> mapNonEmpty!35723 (= (arr!29314 _values!1278) (store mapRest!35723 mapKey!35723 mapValue!35723))))

(declare-fun res!653832 () Bool)

(assert (=> start!83612 (=> (not res!653832) (not e!550524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83612 (= res!653832 (validMask!0 mask!1948))))

(assert (=> start!83612 e!550524))

(assert (=> start!83612 true))

(declare-fun array_inv!22705 (array!60904) Bool)

(assert (=> start!83612 (and (array_inv!22705 _values!1278) e!550523)))

(declare-fun array_inv!22706 (array!60902) Bool)

(assert (=> start!83612 (array_inv!22706 _keys!1544)))

(assert (= (and start!83612 res!653832) b!976751))

(assert (= (and b!976751 res!653831) b!976750))

(assert (= (and b!976750 res!653833) b!976748))

(assert (= (and b!976752 condMapEmpty!35723) mapIsEmpty!35723))

(assert (= (and b!976752 (not condMapEmpty!35723)) mapNonEmpty!35723))

(get-info :version)

(assert (= (and mapNonEmpty!35723 ((_ is ValueCellFull!10754) mapValue!35723)) b!976747))

(assert (= (and b!976752 ((_ is ValueCellFull!10754) mapDefault!35723)) b!976749))

(assert (= start!83612 b!976752))

(declare-fun m!903663 () Bool)

(assert (=> b!976750 m!903663))

(declare-fun m!903665 () Bool)

(assert (=> mapNonEmpty!35723 m!903665))

(declare-fun m!903667 () Bool)

(assert (=> start!83612 m!903667))

(declare-fun m!903669 () Bool)

(assert (=> start!83612 m!903669))

(declare-fun m!903671 () Bool)

(assert (=> start!83612 m!903671))

(check-sat (not b!976750) (not start!83612) (not mapNonEmpty!35723) tp_is_empty!22471)
(check-sat)
(get-model)

(declare-fun b!976797 () Bool)

(declare-fun e!550562 () Bool)

(declare-fun call!41758 () Bool)

(assert (=> b!976797 (= e!550562 call!41758)))

(declare-fun d!116427 () Bool)

(declare-fun res!653856 () Bool)

(declare-fun e!550561 () Bool)

(assert (=> d!116427 (=> res!653856 e!550561)))

(assert (=> d!116427 (= res!653856 (bvsge #b00000000000000000000000000000000 (size!29794 _keys!1544)))))

(assert (=> d!116427 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!550561)))

(declare-fun b!976798 () Bool)

(declare-fun e!550563 () Bool)

(assert (=> b!976798 (= e!550562 e!550563)))

(declare-fun lt!433180 () (_ BitVec 64))

(assert (=> b!976798 (= lt!433180 (select (arr!29313 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32356 0))(
  ( (Unit!32357) )
))
(declare-fun lt!433179 () Unit!32356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!60902 (_ BitVec 64) (_ BitVec 32)) Unit!32356)

(assert (=> b!976798 (= lt!433179 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433180 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!60902 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!976798 (arrayContainsKey!0 _keys!1544 lt!433180 #b00000000000000000000000000000000)))

(declare-fun lt!433181 () Unit!32356)

(assert (=> b!976798 (= lt!433181 lt!433179)))

(declare-fun res!653857 () Bool)

(declare-datatypes ((SeekEntryResult!9197 0))(
  ( (MissingZero!9197 (index!39159 (_ BitVec 32))) (Found!9197 (index!39160 (_ BitVec 32))) (Intermediate!9197 (undefined!10009 Bool) (index!39161 (_ BitVec 32)) (x!84523 (_ BitVec 32))) (Undefined!9197) (MissingVacant!9197 (index!39162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!60902 (_ BitVec 32)) SeekEntryResult!9197)

(assert (=> b!976798 (= res!653857 (= (seekEntryOrOpen!0 (select (arr!29313 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9197 #b00000000000000000000000000000000)))))

(assert (=> b!976798 (=> (not res!653857) (not e!550563))))

(declare-fun b!976799 () Bool)

(assert (=> b!976799 (= e!550561 e!550562)))

(declare-fun c!99948 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976799 (= c!99948 (validKeyInArray!0 (select (arr!29313 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!976800 () Bool)

(assert (=> b!976800 (= e!550563 call!41758)))

(declare-fun bm!41755 () Bool)

(assert (=> bm!41755 (= call!41758 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!116427 (not res!653856)) b!976799))

(assert (= (and b!976799 c!99948) b!976798))

(assert (= (and b!976799 (not c!99948)) b!976797))

(assert (= (and b!976798 res!653857) b!976800))

(assert (= (or b!976800 b!976797) bm!41755))

(declare-fun m!903693 () Bool)

(assert (=> b!976798 m!903693))

(declare-fun m!903695 () Bool)

(assert (=> b!976798 m!903695))

(declare-fun m!903697 () Bool)

(assert (=> b!976798 m!903697))

(assert (=> b!976798 m!903693))

(declare-fun m!903699 () Bool)

(assert (=> b!976798 m!903699))

(assert (=> b!976799 m!903693))

(assert (=> b!976799 m!903693))

(declare-fun m!903701 () Bool)

(assert (=> b!976799 m!903701))

(declare-fun m!903703 () Bool)

(assert (=> bm!41755 m!903703))

(assert (=> b!976750 d!116427))

(declare-fun d!116429 () Bool)

(assert (=> d!116429 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83612 d!116429))

(declare-fun d!116431 () Bool)

(assert (=> d!116431 (= (array_inv!22705 _values!1278) (bvsge (size!29795 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83612 d!116431))

(declare-fun d!116433 () Bool)

(assert (=> d!116433 (= (array_inv!22706 _keys!1544) (bvsge (size!29794 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83612 d!116433))

(declare-fun b!976808 () Bool)

(declare-fun e!550568 () Bool)

(assert (=> b!976808 (= e!550568 tp_is_empty!22471)))

(declare-fun condMapEmpty!35732 () Bool)

(declare-fun mapDefault!35732 () ValueCell!10754)

(assert (=> mapNonEmpty!35723 (= condMapEmpty!35732 (= mapRest!35723 ((as const (Array (_ BitVec 32) ValueCell!10754)) mapDefault!35732)))))

(declare-fun mapRes!35732 () Bool)

(assert (=> mapNonEmpty!35723 (= tp!67976 (and e!550568 mapRes!35732))))

(declare-fun b!976807 () Bool)

(declare-fun e!550569 () Bool)

(assert (=> b!976807 (= e!550569 tp_is_empty!22471)))

(declare-fun mapIsEmpty!35732 () Bool)

(assert (=> mapIsEmpty!35732 mapRes!35732))

(declare-fun mapNonEmpty!35732 () Bool)

(declare-fun tp!67985 () Bool)

(assert (=> mapNonEmpty!35732 (= mapRes!35732 (and tp!67985 e!550569))))

(declare-fun mapRest!35732 () (Array (_ BitVec 32) ValueCell!10754))

(declare-fun mapValue!35732 () ValueCell!10754)

(declare-fun mapKey!35732 () (_ BitVec 32))

(assert (=> mapNonEmpty!35732 (= mapRest!35723 (store mapRest!35732 mapKey!35732 mapValue!35732))))

(assert (= (and mapNonEmpty!35723 condMapEmpty!35732) mapIsEmpty!35732))

(assert (= (and mapNonEmpty!35723 (not condMapEmpty!35732)) mapNonEmpty!35732))

(assert (= (and mapNonEmpty!35732 ((_ is ValueCellFull!10754) mapValue!35732)) b!976807))

(assert (= (and mapNonEmpty!35723 ((_ is ValueCellFull!10754) mapDefault!35732)) b!976808))

(declare-fun m!903705 () Bool)

(assert (=> mapNonEmpty!35732 m!903705))

(check-sat tp_is_empty!22471 (not bm!41755) (not b!976798) (not mapNonEmpty!35732) (not b!976799))
(check-sat)
