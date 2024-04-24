; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82264 () Bool)

(assert start!82264)

(declare-fun b!958030 () Bool)

(declare-fun e!540025 () Bool)

(declare-fun tp_is_empty!21097 () Bool)

(assert (=> b!958030 (= e!540025 tp_is_empty!21097)))

(declare-fun mapNonEmpty!33619 () Bool)

(declare-fun mapRes!33619 () Bool)

(declare-fun tp!64225 () Bool)

(declare-fun e!540026 () Bool)

(assert (=> mapNonEmpty!33619 (= mapRes!33619 (and tp!64225 e!540026))))

(declare-datatypes ((V!33113 0))(
  ( (V!33114 (val!10599 Int)) )
))
(declare-datatypes ((ValueCell!10067 0))(
  ( (ValueCellFull!10067 (v!13152 V!33113)) (EmptyCell!10067) )
))
(declare-fun mapRest!33619 () (Array (_ BitVec 32) ValueCell!10067))

(declare-fun mapKey!33619 () (_ BitVec 32))

(declare-fun mapValue!33619 () ValueCell!10067)

(declare-datatypes ((array!58334 0))(
  ( (array!58335 (arr!28038 (Array (_ BitVec 32) ValueCell!10067)) (size!28518 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58334)

(assert (=> mapNonEmpty!33619 (= (arr!28038 _values!1386) (store mapRest!33619 mapKey!33619 mapValue!33619))))

(declare-fun mapIsEmpty!33619 () Bool)

(assert (=> mapIsEmpty!33619 mapRes!33619))

(declare-fun b!958031 () Bool)

(declare-fun e!540027 () Bool)

(declare-datatypes ((List!19496 0))(
  ( (Nil!19493) (Cons!19492 (h!20660 (_ BitVec 64)) (t!27851 List!19496)) )
))
(declare-fun noDuplicate!1371 (List!19496) Bool)

(assert (=> b!958031 (= e!540027 (not (noDuplicate!1371 Nil!19493)))))

(declare-fun b!958032 () Bool)

(declare-fun e!540028 () Bool)

(assert (=> b!958032 (= e!540028 (and e!540025 mapRes!33619))))

(declare-fun condMapEmpty!33619 () Bool)

(declare-fun mapDefault!33619 () ValueCell!10067)

(assert (=> b!958032 (= condMapEmpty!33619 (= (arr!28038 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10067)) mapDefault!33619)))))

(declare-fun b!958033 () Bool)

(declare-fun res!641099 () Bool)

(assert (=> b!958033 (=> (not res!641099) (not e!540027))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((array!58336 0))(
  ( (array!58337 (arr!28039 (Array (_ BitVec 32) (_ BitVec 64))) (size!28519 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58336)

(assert (=> b!958033 (= res!641099 (and (= (size!28518 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28519 _keys!1668) (size!28518 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!958034 () Bool)

(declare-fun res!641100 () Bool)

(assert (=> b!958034 (=> (not res!641100) (not e!540027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58336 (_ BitVec 32)) Bool)

(assert (=> b!958034 (= res!641100 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958035 () Bool)

(assert (=> b!958035 (= e!540026 tp_is_empty!21097)))

(declare-fun res!641101 () Bool)

(assert (=> start!82264 (=> (not res!641101) (not e!540027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82264 (= res!641101 (validMask!0 mask!2088))))

(assert (=> start!82264 e!540027))

(assert (=> start!82264 true))

(declare-fun array_inv!21823 (array!58334) Bool)

(assert (=> start!82264 (and (array_inv!21823 _values!1386) e!540028)))

(declare-fun array_inv!21824 (array!58336) Bool)

(assert (=> start!82264 (array_inv!21824 _keys!1668)))

(declare-fun b!958036 () Bool)

(declare-fun res!641102 () Bool)

(assert (=> b!958036 (=> (not res!641102) (not e!540027))))

(assert (=> b!958036 (= res!641102 (and (bvsle #b00000000000000000000000000000000 (size!28519 _keys!1668)) (bvslt (size!28519 _keys!1668) #b01111111111111111111111111111111)))))

(assert (= (and start!82264 res!641101) b!958033))

(assert (= (and b!958033 res!641099) b!958034))

(assert (= (and b!958034 res!641100) b!958036))

(assert (= (and b!958036 res!641102) b!958031))

(assert (= (and b!958032 condMapEmpty!33619) mapIsEmpty!33619))

(assert (= (and b!958032 (not condMapEmpty!33619)) mapNonEmpty!33619))

(get-info :version)

(assert (= (and mapNonEmpty!33619 ((_ is ValueCellFull!10067) mapValue!33619)) b!958035))

(assert (= (and b!958032 ((_ is ValueCellFull!10067) mapDefault!33619)) b!958030))

(assert (= start!82264 b!958032))

(declare-fun m!889505 () Bool)

(assert (=> mapNonEmpty!33619 m!889505))

(declare-fun m!889507 () Bool)

(assert (=> b!958031 m!889507))

(declare-fun m!889509 () Bool)

(assert (=> b!958034 m!889509))

(declare-fun m!889511 () Bool)

(assert (=> start!82264 m!889511))

(declare-fun m!889513 () Bool)

(assert (=> start!82264 m!889513))

(declare-fun m!889515 () Bool)

(assert (=> start!82264 m!889515))

(check-sat tp_is_empty!21097 (not b!958031) (not b!958034) (not start!82264) (not mapNonEmpty!33619))
(check-sat)
(get-model)

(declare-fun d!116213 () Bool)

(declare-fun res!641131 () Bool)

(declare-fun e!540063 () Bool)

(assert (=> d!116213 (=> res!641131 e!540063)))

(assert (=> d!116213 (= res!641131 ((_ is Nil!19493) Nil!19493))))

(assert (=> d!116213 (= (noDuplicate!1371 Nil!19493) e!540063)))

(declare-fun b!958083 () Bool)

(declare-fun e!540064 () Bool)

(assert (=> b!958083 (= e!540063 e!540064)))

(declare-fun res!641132 () Bool)

(assert (=> b!958083 (=> (not res!641132) (not e!540064))))

(declare-fun contains!5318 (List!19496 (_ BitVec 64)) Bool)

(assert (=> b!958083 (= res!641132 (not (contains!5318 (t!27851 Nil!19493) (h!20660 Nil!19493))))))

(declare-fun b!958084 () Bool)

(assert (=> b!958084 (= e!540064 (noDuplicate!1371 (t!27851 Nil!19493)))))

(assert (= (and d!116213 (not res!641131)) b!958083))

(assert (= (and b!958083 res!641132) b!958084))

(declare-fun m!889541 () Bool)

(assert (=> b!958083 m!889541))

(declare-fun m!889543 () Bool)

(assert (=> b!958084 m!889543))

(assert (=> b!958031 d!116213))

(declare-fun b!958093 () Bool)

(declare-fun e!540072 () Bool)

(declare-fun e!540071 () Bool)

(assert (=> b!958093 (= e!540072 e!540071)))

(declare-fun lt!430650 () (_ BitVec 64))

(assert (=> b!958093 (= lt!430650 (select (arr!28039 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32122 0))(
  ( (Unit!32123) )
))
(declare-fun lt!430649 () Unit!32122)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58336 (_ BitVec 64) (_ BitVec 32)) Unit!32122)

(assert (=> b!958093 (= lt!430649 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430650 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!958093 (arrayContainsKey!0 _keys!1668 lt!430650 #b00000000000000000000000000000000)))

(declare-fun lt!430648 () Unit!32122)

(assert (=> b!958093 (= lt!430648 lt!430649)))

(declare-fun res!641137 () Bool)

(declare-datatypes ((SeekEntryResult!9146 0))(
  ( (MissingZero!9146 (index!38955 (_ BitVec 32))) (Found!9146 (index!38956 (_ BitVec 32))) (Intermediate!9146 (undefined!9958 Bool) (index!38957 (_ BitVec 32)) (x!82468 (_ BitVec 32))) (Undefined!9146) (MissingVacant!9146 (index!38958 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58336 (_ BitVec 32)) SeekEntryResult!9146)

(assert (=> b!958093 (= res!641137 (= (seekEntryOrOpen!0 (select (arr!28039 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9146 #b00000000000000000000000000000000)))))

(assert (=> b!958093 (=> (not res!641137) (not e!540071))))

(declare-fun b!958094 () Bool)

(declare-fun call!41759 () Bool)

(assert (=> b!958094 (= e!540072 call!41759)))

(declare-fun d!116215 () Bool)

(declare-fun res!641138 () Bool)

(declare-fun e!540073 () Bool)

(assert (=> d!116215 (=> res!641138 e!540073)))

(assert (=> d!116215 (= res!641138 (bvsge #b00000000000000000000000000000000 (size!28519 _keys!1668)))))

(assert (=> d!116215 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!540073)))

(declare-fun b!958095 () Bool)

(assert (=> b!958095 (= e!540071 call!41759)))

(declare-fun b!958096 () Bool)

(assert (=> b!958096 (= e!540073 e!540072)))

(declare-fun c!100184 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958096 (= c!100184 (validKeyInArray!0 (select (arr!28039 _keys!1668) #b00000000000000000000000000000000)))))

(declare-fun bm!41756 () Bool)

(assert (=> bm!41756 (= call!41759 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(assert (= (and d!116215 (not res!641138)) b!958096))

(assert (= (and b!958096 c!100184) b!958093))

(assert (= (and b!958096 (not c!100184)) b!958094))

(assert (= (and b!958093 res!641137) b!958095))

(assert (= (or b!958095 b!958094) bm!41756))

(declare-fun m!889545 () Bool)

(assert (=> b!958093 m!889545))

(declare-fun m!889547 () Bool)

(assert (=> b!958093 m!889547))

(declare-fun m!889549 () Bool)

(assert (=> b!958093 m!889549))

(assert (=> b!958093 m!889545))

(declare-fun m!889551 () Bool)

(assert (=> b!958093 m!889551))

(assert (=> b!958096 m!889545))

(assert (=> b!958096 m!889545))

(declare-fun m!889553 () Bool)

(assert (=> b!958096 m!889553))

(declare-fun m!889555 () Bool)

(assert (=> bm!41756 m!889555))

(assert (=> b!958034 d!116215))

(declare-fun d!116217 () Bool)

(assert (=> d!116217 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82264 d!116217))

(declare-fun d!116219 () Bool)

(assert (=> d!116219 (= (array_inv!21823 _values!1386) (bvsge (size!28518 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82264 d!116219))

(declare-fun d!116221 () Bool)

(assert (=> d!116221 (= (array_inv!21824 _keys!1668) (bvsge (size!28519 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82264 d!116221))

(declare-fun mapNonEmpty!33628 () Bool)

(declare-fun mapRes!33628 () Bool)

(declare-fun tp!64234 () Bool)

(declare-fun e!540079 () Bool)

(assert (=> mapNonEmpty!33628 (= mapRes!33628 (and tp!64234 e!540079))))

(declare-fun mapKey!33628 () (_ BitVec 32))

(declare-fun mapValue!33628 () ValueCell!10067)

(declare-fun mapRest!33628 () (Array (_ BitVec 32) ValueCell!10067))

(assert (=> mapNonEmpty!33628 (= mapRest!33619 (store mapRest!33628 mapKey!33628 mapValue!33628))))

(declare-fun mapIsEmpty!33628 () Bool)

(assert (=> mapIsEmpty!33628 mapRes!33628))

(declare-fun condMapEmpty!33628 () Bool)

(declare-fun mapDefault!33628 () ValueCell!10067)

(assert (=> mapNonEmpty!33619 (= condMapEmpty!33628 (= mapRest!33619 ((as const (Array (_ BitVec 32) ValueCell!10067)) mapDefault!33628)))))

(declare-fun e!540078 () Bool)

(assert (=> mapNonEmpty!33619 (= tp!64225 (and e!540078 mapRes!33628))))

(declare-fun b!958103 () Bool)

(assert (=> b!958103 (= e!540079 tp_is_empty!21097)))

(declare-fun b!958104 () Bool)

(assert (=> b!958104 (= e!540078 tp_is_empty!21097)))

(assert (= (and mapNonEmpty!33619 condMapEmpty!33628) mapIsEmpty!33628))

(assert (= (and mapNonEmpty!33619 (not condMapEmpty!33628)) mapNonEmpty!33628))

(assert (= (and mapNonEmpty!33628 ((_ is ValueCellFull!10067) mapValue!33628)) b!958103))

(assert (= (and mapNonEmpty!33619 ((_ is ValueCellFull!10067) mapDefault!33628)) b!958104))

(declare-fun m!889557 () Bool)

(assert (=> mapNonEmpty!33628 m!889557))

(check-sat (not b!958083) (not b!958096) tp_is_empty!21097 (not bm!41756) (not b!958084) (not b!958093) (not mapNonEmpty!33628))
(check-sat)
