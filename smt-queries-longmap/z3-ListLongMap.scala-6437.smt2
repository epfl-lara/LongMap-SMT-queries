; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82592 () Bool)

(assert start!82592)

(declare-fun mapIsEmpty!34078 () Bool)

(declare-fun mapRes!34078 () Bool)

(assert (=> mapIsEmpty!34078 mapRes!34078))

(declare-fun res!643588 () Bool)

(declare-fun e!542341 () Bool)

(assert (=> start!82592 (=> (not res!643588) (not e!542341))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82592 (= res!643588 (validMask!0 mask!2110))))

(assert (=> start!82592 e!542341))

(assert (=> start!82592 true))

(declare-datatypes ((V!33513 0))(
  ( (V!33514 (val!10749 Int)) )
))
(declare-datatypes ((ValueCell!10217 0))(
  ( (ValueCellFull!10217 (v!13303 V!33513)) (EmptyCell!10217) )
))
(declare-datatypes ((array!58916 0))(
  ( (array!58917 (arr!28326 (Array (_ BitVec 32) ValueCell!10217)) (size!28806 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58916)

(declare-fun e!542343 () Bool)

(declare-fun array_inv!22031 (array!58916) Bool)

(assert (=> start!82592 (and (array_inv!22031 _values!1400) e!542343)))

(declare-datatypes ((array!58918 0))(
  ( (array!58919 (arr!28327 (Array (_ BitVec 32) (_ BitVec 64))) (size!28807 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58918)

(declare-fun array_inv!22032 (array!58918) Bool)

(assert (=> start!82592 (array_inv!22032 _keys!1686)))

(declare-fun b!961903 () Bool)

(declare-fun res!643587 () Bool)

(assert (=> b!961903 (=> (not res!643587) (not e!542341))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961903 (= res!643587 (and (= (size!28806 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28807 _keys!1686) (size!28806 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34078 () Bool)

(declare-fun tp!65008 () Bool)

(declare-fun e!542342 () Bool)

(assert (=> mapNonEmpty!34078 (= mapRes!34078 (and tp!65008 e!542342))))

(declare-fun mapRest!34078 () (Array (_ BitVec 32) ValueCell!10217))

(declare-fun mapValue!34078 () ValueCell!10217)

(declare-fun mapKey!34078 () (_ BitVec 32))

(assert (=> mapNonEmpty!34078 (= (arr!28326 _values!1400) (store mapRest!34078 mapKey!34078 mapValue!34078))))

(declare-fun b!961904 () Bool)

(declare-fun e!542339 () Bool)

(assert (=> b!961904 (= e!542343 (and e!542339 mapRes!34078))))

(declare-fun condMapEmpty!34078 () Bool)

(declare-fun mapDefault!34078 () ValueCell!10217)

(assert (=> b!961904 (= condMapEmpty!34078 (= (arr!28326 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10217)) mapDefault!34078)))))

(declare-fun b!961905 () Bool)

(assert (=> b!961905 (= e!542341 (bvsgt #b00000000000000000000000000000000 (size!28807 _keys!1686)))))

(declare-fun b!961906 () Bool)

(declare-fun res!643586 () Bool)

(assert (=> b!961906 (=> (not res!643586) (not e!542341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58918 (_ BitVec 32)) Bool)

(assert (=> b!961906 (= res!643586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961907 () Bool)

(declare-fun tp_is_empty!21397 () Bool)

(assert (=> b!961907 (= e!542339 tp_is_empty!21397)))

(declare-fun b!961908 () Bool)

(assert (=> b!961908 (= e!542342 tp_is_empty!21397)))

(assert (= (and start!82592 res!643588) b!961903))

(assert (= (and b!961903 res!643587) b!961906))

(assert (= (and b!961906 res!643586) b!961905))

(assert (= (and b!961904 condMapEmpty!34078) mapIsEmpty!34078))

(assert (= (and b!961904 (not condMapEmpty!34078)) mapNonEmpty!34078))

(get-info :version)

(assert (= (and mapNonEmpty!34078 ((_ is ValueCellFull!10217) mapValue!34078)) b!961908))

(assert (= (and b!961904 ((_ is ValueCellFull!10217) mapDefault!34078)) b!961907))

(assert (= start!82592 b!961904))

(declare-fun m!892409 () Bool)

(assert (=> start!82592 m!892409))

(declare-fun m!892411 () Bool)

(assert (=> start!82592 m!892411))

(declare-fun m!892413 () Bool)

(assert (=> start!82592 m!892413))

(declare-fun m!892415 () Bool)

(assert (=> mapNonEmpty!34078 m!892415))

(declare-fun m!892417 () Bool)

(assert (=> b!961906 m!892417))

(check-sat (not start!82592) (not b!961906) (not mapNonEmpty!34078) tp_is_empty!21397)
(check-sat)
(get-model)

(declare-fun d!116343 () Bool)

(assert (=> d!116343 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82592 d!116343))

(declare-fun d!116345 () Bool)

(assert (=> d!116345 (= (array_inv!22031 _values!1400) (bvsge (size!28806 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82592 d!116345))

(declare-fun d!116347 () Bool)

(assert (=> d!116347 (= (array_inv!22032 _keys!1686) (bvsge (size!28807 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82592 d!116347))

(declare-fun b!961953 () Bool)

(declare-fun e!542381 () Bool)

(declare-fun call!41765 () Bool)

(assert (=> b!961953 (= e!542381 call!41765)))

(declare-fun b!961954 () Bool)

(declare-fun e!542382 () Bool)

(assert (=> b!961954 (= e!542381 e!542382)))

(declare-fun lt!431066 () (_ BitVec 64))

(assert (=> b!961954 (= lt!431066 (select (arr!28327 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32166 0))(
  ( (Unit!32167) )
))
(declare-fun lt!431068 () Unit!32166)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58918 (_ BitVec 64) (_ BitVec 32)) Unit!32166)

(assert (=> b!961954 (= lt!431068 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!431066 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58918 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!961954 (arrayContainsKey!0 _keys!1686 lt!431066 #b00000000000000000000000000000000)))

(declare-fun lt!431067 () Unit!32166)

(assert (=> b!961954 (= lt!431067 lt!431068)))

(declare-fun res!643612 () Bool)

(declare-datatypes ((SeekEntryResult!9148 0))(
  ( (MissingZero!9148 (index!38963 (_ BitVec 32))) (Found!9148 (index!38964 (_ BitVec 32))) (Intermediate!9148 (undefined!9960 Bool) (index!38965 (_ BitVec 32)) (x!82876 (_ BitVec 32))) (Undefined!9148) (MissingVacant!9148 (index!38966 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58918 (_ BitVec 32)) SeekEntryResult!9148)

(assert (=> b!961954 (= res!643612 (= (seekEntryOrOpen!0 (select (arr!28327 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9148 #b00000000000000000000000000000000)))))

(assert (=> b!961954 (=> (not res!643612) (not e!542382))))

(declare-fun d!116349 () Bool)

(declare-fun res!643611 () Bool)

(declare-fun e!542380 () Bool)

(assert (=> d!116349 (=> res!643611 e!542380)))

(assert (=> d!116349 (= res!643611 (bvsge #b00000000000000000000000000000000 (size!28807 _keys!1686)))))

(assert (=> d!116349 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!542380)))

(declare-fun b!961955 () Bool)

(assert (=> b!961955 (= e!542380 e!542381)))

(declare-fun c!100190 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961955 (= c!100190 (validKeyInArray!0 (select (arr!28327 _keys!1686) #b00000000000000000000000000000000)))))

(declare-fun bm!41762 () Bool)

(assert (=> bm!41762 (= call!41765 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun b!961956 () Bool)

(assert (=> b!961956 (= e!542382 call!41765)))

(assert (= (and d!116349 (not res!643611)) b!961955))

(assert (= (and b!961955 c!100190) b!961954))

(assert (= (and b!961955 (not c!100190)) b!961953))

(assert (= (and b!961954 res!643612) b!961956))

(assert (= (or b!961956 b!961953) bm!41762))

(declare-fun m!892439 () Bool)

(assert (=> b!961954 m!892439))

(declare-fun m!892441 () Bool)

(assert (=> b!961954 m!892441))

(declare-fun m!892443 () Bool)

(assert (=> b!961954 m!892443))

(assert (=> b!961954 m!892439))

(declare-fun m!892445 () Bool)

(assert (=> b!961954 m!892445))

(assert (=> b!961955 m!892439))

(assert (=> b!961955 m!892439))

(declare-fun m!892447 () Bool)

(assert (=> b!961955 m!892447))

(declare-fun m!892449 () Bool)

(assert (=> bm!41762 m!892449))

(assert (=> b!961906 d!116349))

(declare-fun b!961963 () Bool)

(declare-fun e!542387 () Bool)

(assert (=> b!961963 (= e!542387 tp_is_empty!21397)))

(declare-fun mapIsEmpty!34087 () Bool)

(declare-fun mapRes!34087 () Bool)

(assert (=> mapIsEmpty!34087 mapRes!34087))

(declare-fun condMapEmpty!34087 () Bool)

(declare-fun mapDefault!34087 () ValueCell!10217)

(assert (=> mapNonEmpty!34078 (= condMapEmpty!34087 (= mapRest!34078 ((as const (Array (_ BitVec 32) ValueCell!10217)) mapDefault!34087)))))

(declare-fun e!542388 () Bool)

(assert (=> mapNonEmpty!34078 (= tp!65008 (and e!542388 mapRes!34087))))

(declare-fun mapNonEmpty!34087 () Bool)

(declare-fun tp!65017 () Bool)

(assert (=> mapNonEmpty!34087 (= mapRes!34087 (and tp!65017 e!542387))))

(declare-fun mapRest!34087 () (Array (_ BitVec 32) ValueCell!10217))

(declare-fun mapKey!34087 () (_ BitVec 32))

(declare-fun mapValue!34087 () ValueCell!10217)

(assert (=> mapNonEmpty!34087 (= mapRest!34078 (store mapRest!34087 mapKey!34087 mapValue!34087))))

(declare-fun b!961964 () Bool)

(assert (=> b!961964 (= e!542388 tp_is_empty!21397)))

(assert (= (and mapNonEmpty!34078 condMapEmpty!34087) mapIsEmpty!34087))

(assert (= (and mapNonEmpty!34078 (not condMapEmpty!34087)) mapNonEmpty!34087))

(assert (= (and mapNonEmpty!34087 ((_ is ValueCellFull!10217) mapValue!34087)) b!961963))

(assert (= (and mapNonEmpty!34078 ((_ is ValueCellFull!10217) mapDefault!34087)) b!961964))

(declare-fun m!892451 () Bool)

(assert (=> mapNonEmpty!34087 m!892451))

(check-sat (not b!961954) tp_is_empty!21397 (not bm!41762) (not b!961955) (not mapNonEmpty!34087))
(check-sat)
