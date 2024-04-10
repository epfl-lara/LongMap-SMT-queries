; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83646 () Bool)

(assert start!83646)

(declare-fun mapIsEmpty!35738 () Bool)

(declare-fun mapRes!35738 () Bool)

(assert (=> mapIsEmpty!35738 mapRes!35738))

(declare-fun res!653983 () Bool)

(declare-fun e!550744 () Bool)

(assert (=> start!83646 (=> (not res!653983) (not e!550744))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83646 (= res!653983 (validMask!0 mask!1948))))

(assert (=> start!83646 e!550744))

(assert (=> start!83646 true))

(declare-datatypes ((V!34955 0))(
  ( (V!34956 (val!11290 Int)) )
))
(declare-datatypes ((ValueCell!10758 0))(
  ( (ValueCellFull!10758 (v!13851 V!34955)) (EmptyCell!10758) )
))
(declare-datatypes ((array!60987 0))(
  ( (array!60988 (arr!29354 (Array (_ BitVec 32) ValueCell!10758)) (size!29833 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!60987)

(declare-fun e!550743 () Bool)

(declare-fun array_inv!22693 (array!60987) Bool)

(assert (=> start!83646 (and (array_inv!22693 _values!1278) e!550743)))

(declare-datatypes ((array!60989 0))(
  ( (array!60990 (arr!29355 (Array (_ BitVec 32) (_ BitVec 64))) (size!29834 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!60989)

(declare-fun array_inv!22694 (array!60989) Bool)

(assert (=> start!83646 (array_inv!22694 _keys!1544)))

(declare-fun b!977078 () Bool)

(declare-fun e!550745 () Bool)

(assert (=> b!977078 (= e!550743 (and e!550745 mapRes!35738))))

(declare-fun condMapEmpty!35738 () Bool)

(declare-fun mapDefault!35738 () ValueCell!10758)

(assert (=> b!977078 (= condMapEmpty!35738 (= (arr!29354 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10758)) mapDefault!35738)))))

(declare-fun mapNonEmpty!35738 () Bool)

(declare-fun tp!67990 () Bool)

(declare-fun e!550747 () Bool)

(assert (=> mapNonEmpty!35738 (= mapRes!35738 (and tp!67990 e!550747))))

(declare-fun mapKey!35738 () (_ BitVec 32))

(declare-fun mapValue!35738 () ValueCell!10758)

(declare-fun mapRest!35738 () (Array (_ BitVec 32) ValueCell!10758))

(assert (=> mapNonEmpty!35738 (= (arr!29354 _values!1278) (store mapRest!35738 mapKey!35738 mapValue!35738))))

(declare-fun b!977079 () Bool)

(declare-fun res!653984 () Bool)

(assert (=> b!977079 (=> (not res!653984) (not e!550744))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977079 (= res!653984 (and (= (size!29833 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29834 _keys!1544) (size!29833 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977080 () Bool)

(assert (=> b!977080 (= e!550744 (and (bvsle #b00000000000000000000000000000000 (size!29834 _keys!1544)) (bvsge (size!29834 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun b!977081 () Bool)

(declare-fun res!653985 () Bool)

(assert (=> b!977081 (=> (not res!653985) (not e!550744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60989 (_ BitVec 32)) Bool)

(assert (=> b!977081 (= res!653985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!977082 () Bool)

(declare-fun tp_is_empty!22479 () Bool)

(assert (=> b!977082 (= e!550747 tp_is_empty!22479)))

(declare-fun b!977083 () Bool)

(assert (=> b!977083 (= e!550745 tp_is_empty!22479)))

(assert (= (and start!83646 res!653983) b!977079))

(assert (= (and b!977079 res!653984) b!977081))

(assert (= (and b!977081 res!653985) b!977080))

(assert (= (and b!977078 condMapEmpty!35738) mapIsEmpty!35738))

(assert (= (and b!977078 (not condMapEmpty!35738)) mapNonEmpty!35738))

(get-info :version)

(assert (= (and mapNonEmpty!35738 ((_ is ValueCellFull!10758) mapValue!35738)) b!977082))

(assert (= (and b!977078 ((_ is ValueCellFull!10758) mapDefault!35738)) b!977083))

(assert (= start!83646 b!977078))

(declare-fun m!904475 () Bool)

(assert (=> start!83646 m!904475))

(declare-fun m!904477 () Bool)

(assert (=> start!83646 m!904477))

(declare-fun m!904479 () Bool)

(assert (=> start!83646 m!904479))

(declare-fun m!904481 () Bool)

(assert (=> mapNonEmpty!35738 m!904481))

(declare-fun m!904483 () Bool)

(assert (=> b!977081 m!904483))

(check-sat (not start!83646) (not b!977081) (not mapNonEmpty!35738) tp_is_empty!22479)
(check-sat)
(get-model)

(declare-fun d!116635 () Bool)

(assert (=> d!116635 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83646 d!116635))

(declare-fun d!116637 () Bool)

(assert (=> d!116637 (= (array_inv!22693 _values!1278) (bvsge (size!29833 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83646 d!116637))

(declare-fun d!116639 () Bool)

(assert (=> d!116639 (= (array_inv!22694 _keys!1544) (bvsge (size!29834 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83646 d!116639))

(declare-fun b!977110 () Bool)

(declare-fun e!550769 () Bool)

(declare-fun e!550771 () Bool)

(assert (=> b!977110 (= e!550769 e!550771)))

(declare-fun lt!433425 () (_ BitVec 64))

(assert (=> b!977110 (= lt!433425 (select (arr!29355 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32491 0))(
  ( (Unit!32492) )
))
(declare-fun lt!433424 () Unit!32491)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!60989 (_ BitVec 64) (_ BitVec 32)) Unit!32491)

(assert (=> b!977110 (= lt!433424 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433425 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!60989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!977110 (arrayContainsKey!0 _keys!1544 lt!433425 #b00000000000000000000000000000000)))

(declare-fun lt!433426 () Unit!32491)

(assert (=> b!977110 (= lt!433426 lt!433424)))

(declare-fun res!653999 () Bool)

(declare-datatypes ((SeekEntryResult!9203 0))(
  ( (MissingZero!9203 (index!39183 (_ BitVec 32))) (Found!9203 (index!39184 (_ BitVec 32))) (Intermediate!9203 (undefined!10015 Bool) (index!39185 (_ BitVec 32)) (x!84544 (_ BitVec 32))) (Undefined!9203) (MissingVacant!9203 (index!39186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!60989 (_ BitVec 32)) SeekEntryResult!9203)

(assert (=> b!977110 (= res!653999 (= (seekEntryOrOpen!0 (select (arr!29355 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9203 #b00000000000000000000000000000000)))))

(assert (=> b!977110 (=> (not res!653999) (not e!550771))))

(declare-fun b!977111 () Bool)

(declare-fun call!41787 () Bool)

(assert (=> b!977111 (= e!550771 call!41787)))

(declare-fun d!116641 () Bool)

(declare-fun res!654000 () Bool)

(declare-fun e!550770 () Bool)

(assert (=> d!116641 (=> res!654000 e!550770)))

(assert (=> d!116641 (= res!654000 (bvsge #b00000000000000000000000000000000 (size!29834 _keys!1544)))))

(assert (=> d!116641 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!550770)))

(declare-fun bm!41784 () Bool)

(assert (=> bm!41784 (= call!41787 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun b!977112 () Bool)

(assert (=> b!977112 (= e!550770 e!550769)))

(declare-fun c!100016 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977112 (= c!100016 (validKeyInArray!0 (select (arr!29355 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!977113 () Bool)

(assert (=> b!977113 (= e!550769 call!41787)))

(assert (= (and d!116641 (not res!654000)) b!977112))

(assert (= (and b!977112 c!100016) b!977110))

(assert (= (and b!977112 (not c!100016)) b!977113))

(assert (= (and b!977110 res!653999) b!977111))

(assert (= (or b!977111 b!977113) bm!41784))

(declare-fun m!904495 () Bool)

(assert (=> b!977110 m!904495))

(declare-fun m!904497 () Bool)

(assert (=> b!977110 m!904497))

(declare-fun m!904499 () Bool)

(assert (=> b!977110 m!904499))

(assert (=> b!977110 m!904495))

(declare-fun m!904501 () Bool)

(assert (=> b!977110 m!904501))

(declare-fun m!904503 () Bool)

(assert (=> bm!41784 m!904503))

(assert (=> b!977112 m!904495))

(assert (=> b!977112 m!904495))

(declare-fun m!904505 () Bool)

(assert (=> b!977112 m!904505))

(assert (=> b!977081 d!116641))

(declare-fun mapIsEmpty!35744 () Bool)

(declare-fun mapRes!35744 () Bool)

(assert (=> mapIsEmpty!35744 mapRes!35744))

(declare-fun mapNonEmpty!35744 () Bool)

(declare-fun tp!67996 () Bool)

(declare-fun e!550776 () Bool)

(assert (=> mapNonEmpty!35744 (= mapRes!35744 (and tp!67996 e!550776))))

(declare-fun mapKey!35744 () (_ BitVec 32))

(declare-fun mapValue!35744 () ValueCell!10758)

(declare-fun mapRest!35744 () (Array (_ BitVec 32) ValueCell!10758))

(assert (=> mapNonEmpty!35744 (= mapRest!35738 (store mapRest!35744 mapKey!35744 mapValue!35744))))

(declare-fun condMapEmpty!35744 () Bool)

(declare-fun mapDefault!35744 () ValueCell!10758)

(assert (=> mapNonEmpty!35738 (= condMapEmpty!35744 (= mapRest!35738 ((as const (Array (_ BitVec 32) ValueCell!10758)) mapDefault!35744)))))

(declare-fun e!550777 () Bool)

(assert (=> mapNonEmpty!35738 (= tp!67990 (and e!550777 mapRes!35744))))

(declare-fun b!977121 () Bool)

(assert (=> b!977121 (= e!550777 tp_is_empty!22479)))

(declare-fun b!977120 () Bool)

(assert (=> b!977120 (= e!550776 tp_is_empty!22479)))

(assert (= (and mapNonEmpty!35738 condMapEmpty!35744) mapIsEmpty!35744))

(assert (= (and mapNonEmpty!35738 (not condMapEmpty!35744)) mapNonEmpty!35744))

(assert (= (and mapNonEmpty!35744 ((_ is ValueCellFull!10758) mapValue!35744)) b!977120))

(assert (= (and mapNonEmpty!35738 ((_ is ValueCellFull!10758) mapDefault!35744)) b!977121))

(declare-fun m!904507 () Bool)

(assert (=> mapNonEmpty!35744 m!904507))

(check-sat (not b!977110) (not b!977112) (not bm!41784) (not mapNonEmpty!35744) tp_is_empty!22479)
(check-sat)
