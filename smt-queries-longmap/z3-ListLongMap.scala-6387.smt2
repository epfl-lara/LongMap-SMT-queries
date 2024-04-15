; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82078 () Bool)

(assert start!82078)

(declare-fun b!956888 () Bool)

(declare-fun e!539294 () Bool)

(declare-fun e!539298 () Bool)

(declare-fun mapRes!33619 () Bool)

(assert (=> b!956888 (= e!539294 (and e!539298 mapRes!33619))))

(declare-fun condMapEmpty!33619 () Bool)

(declare-datatypes ((V!33113 0))(
  ( (V!33114 (val!10599 Int)) )
))
(declare-datatypes ((ValueCell!10067 0))(
  ( (ValueCellFull!10067 (v!13154 V!33113)) (EmptyCell!10067) )
))
(declare-datatypes ((array!58236 0))(
  ( (array!58237 (arr!27994 (Array (_ BitVec 32) ValueCell!10067)) (size!28475 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58236)

(declare-fun mapDefault!33619 () ValueCell!10067)

(assert (=> b!956888 (= condMapEmpty!33619 (= (arr!27994 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10067)) mapDefault!33619)))))

(declare-fun b!956889 () Bool)

(declare-fun tp_is_empty!21097 () Bool)

(assert (=> b!956889 (= e!539298 tp_is_empty!21097)))

(declare-fun b!956890 () Bool)

(declare-fun e!539297 () Bool)

(declare-datatypes ((List!19511 0))(
  ( (Nil!19508) (Cons!19507 (h!20669 (_ BitVec 64)) (t!27865 List!19511)) )
))
(declare-fun noDuplicate!1371 (List!19511) Bool)

(assert (=> b!956890 (= e!539297 (not (noDuplicate!1371 Nil!19508)))))

(declare-fun mapIsEmpty!33619 () Bool)

(assert (=> mapIsEmpty!33619 mapRes!33619))

(declare-fun res!640646 () Bool)

(assert (=> start!82078 (=> (not res!640646) (not e!539297))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82078 (= res!640646 (validMask!0 mask!2088))))

(assert (=> start!82078 e!539297))

(assert (=> start!82078 true))

(declare-fun array_inv!21777 (array!58236) Bool)

(assert (=> start!82078 (and (array_inv!21777 _values!1386) e!539294)))

(declare-datatypes ((array!58238 0))(
  ( (array!58239 (arr!27995 (Array (_ BitVec 32) (_ BitVec 64))) (size!28476 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58238)

(declare-fun array_inv!21778 (array!58238) Bool)

(assert (=> start!82078 (array_inv!21778 _keys!1668)))

(declare-fun b!956891 () Bool)

(declare-fun res!640648 () Bool)

(assert (=> b!956891 (=> (not res!640648) (not e!539297))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!956891 (= res!640648 (and (= (size!28475 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28476 _keys!1668) (size!28475 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!956892 () Bool)

(declare-fun res!640645 () Bool)

(assert (=> b!956892 (=> (not res!640645) (not e!539297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58238 (_ BitVec 32)) Bool)

(assert (=> b!956892 (= res!640645 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!956893 () Bool)

(declare-fun res!640647 () Bool)

(assert (=> b!956893 (=> (not res!640647) (not e!539297))))

(assert (=> b!956893 (= res!640647 (and (bvsle #b00000000000000000000000000000000 (size!28476 _keys!1668)) (bvslt (size!28476 _keys!1668) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!33619 () Bool)

(declare-fun tp!64225 () Bool)

(declare-fun e!539295 () Bool)

(assert (=> mapNonEmpty!33619 (= mapRes!33619 (and tp!64225 e!539295))))

(declare-fun mapValue!33619 () ValueCell!10067)

(declare-fun mapKey!33619 () (_ BitVec 32))

(declare-fun mapRest!33619 () (Array (_ BitVec 32) ValueCell!10067))

(assert (=> mapNonEmpty!33619 (= (arr!27994 _values!1386) (store mapRest!33619 mapKey!33619 mapValue!33619))))

(declare-fun b!956894 () Bool)

(assert (=> b!956894 (= e!539295 tp_is_empty!21097)))

(assert (= (and start!82078 res!640646) b!956891))

(assert (= (and b!956891 res!640648) b!956892))

(assert (= (and b!956892 res!640645) b!956893))

(assert (= (and b!956893 res!640647) b!956890))

(assert (= (and b!956888 condMapEmpty!33619) mapIsEmpty!33619))

(assert (= (and b!956888 (not condMapEmpty!33619)) mapNonEmpty!33619))

(get-info :version)

(assert (= (and mapNonEmpty!33619 ((_ is ValueCellFull!10067) mapValue!33619)) b!956894))

(assert (= (and b!956888 ((_ is ValueCellFull!10067) mapDefault!33619)) b!956889))

(assert (= start!82078 b!956888))

(declare-fun m!887453 () Bool)

(assert (=> b!956890 m!887453))

(declare-fun m!887455 () Bool)

(assert (=> start!82078 m!887455))

(declare-fun m!887457 () Bool)

(assert (=> start!82078 m!887457))

(declare-fun m!887459 () Bool)

(assert (=> start!82078 m!887459))

(declare-fun m!887461 () Bool)

(assert (=> b!956892 m!887461))

(declare-fun m!887463 () Bool)

(assert (=> mapNonEmpty!33619 m!887463))

(check-sat (not b!956892) tp_is_empty!21097 (not b!956890) (not mapNonEmpty!33619) (not start!82078))
(check-sat)
(get-model)

(declare-fun b!956945 () Bool)

(declare-fun e!539335 () Bool)

(declare-fun e!539336 () Bool)

(assert (=> b!956945 (= e!539335 e!539336)))

(declare-fun lt!430051 () (_ BitVec 64))

(assert (=> b!956945 (= lt!430051 (select (arr!27995 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32016 0))(
  ( (Unit!32017) )
))
(declare-fun lt!430053 () Unit!32016)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58238 (_ BitVec 64) (_ BitVec 32)) Unit!32016)

(assert (=> b!956945 (= lt!430053 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430051 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!956945 (arrayContainsKey!0 _keys!1668 lt!430051 #b00000000000000000000000000000000)))

(declare-fun lt!430052 () Unit!32016)

(assert (=> b!956945 (= lt!430052 lt!430053)))

(declare-fun res!640677 () Bool)

(declare-datatypes ((SeekEntryResult!9186 0))(
  ( (MissingZero!9186 (index!39115 (_ BitVec 32))) (Found!9186 (index!39116 (_ BitVec 32))) (Intermediate!9186 (undefined!9998 Bool) (index!39117 (_ BitVec 32)) (x!82489 (_ BitVec 32))) (Undefined!9186) (MissingVacant!9186 (index!39118 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58238 (_ BitVec 32)) SeekEntryResult!9186)

(assert (=> b!956945 (= res!640677 (= (seekEntryOrOpen!0 (select (arr!27995 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9186 #b00000000000000000000000000000000)))))

(assert (=> b!956945 (=> (not res!640677) (not e!539336))))

(declare-fun bm!41685 () Bool)

(declare-fun call!41688 () Bool)

(assert (=> bm!41685 (= call!41688 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(declare-fun b!956946 () Bool)

(assert (=> b!956946 (= e!539335 call!41688)))

(declare-fun b!956948 () Bool)

(assert (=> b!956948 (= e!539336 call!41688)))

(declare-fun d!115693 () Bool)

(declare-fun res!640678 () Bool)

(declare-fun e!539337 () Bool)

(assert (=> d!115693 (=> res!640678 e!539337)))

(assert (=> d!115693 (= res!640678 (bvsge #b00000000000000000000000000000000 (size!28476 _keys!1668)))))

(assert (=> d!115693 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!539337)))

(declare-fun b!956947 () Bool)

(assert (=> b!956947 (= e!539337 e!539335)))

(declare-fun c!99837 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956947 (= c!99837 (validKeyInArray!0 (select (arr!27995 _keys!1668) #b00000000000000000000000000000000)))))

(assert (= (and d!115693 (not res!640678)) b!956947))

(assert (= (and b!956947 c!99837) b!956945))

(assert (= (and b!956947 (not c!99837)) b!956946))

(assert (= (and b!956945 res!640677) b!956948))

(assert (= (or b!956948 b!956946) bm!41685))

(declare-fun m!887489 () Bool)

(assert (=> b!956945 m!887489))

(declare-fun m!887491 () Bool)

(assert (=> b!956945 m!887491))

(declare-fun m!887493 () Bool)

(assert (=> b!956945 m!887493))

(assert (=> b!956945 m!887489))

(declare-fun m!887495 () Bool)

(assert (=> b!956945 m!887495))

(declare-fun m!887497 () Bool)

(assert (=> bm!41685 m!887497))

(assert (=> b!956947 m!887489))

(assert (=> b!956947 m!887489))

(declare-fun m!887499 () Bool)

(assert (=> b!956947 m!887499))

(assert (=> b!956892 d!115693))

(declare-fun d!115695 () Bool)

(assert (=> d!115695 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82078 d!115695))

(declare-fun d!115697 () Bool)

(assert (=> d!115697 (= (array_inv!21777 _values!1386) (bvsge (size!28475 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82078 d!115697))

(declare-fun d!115699 () Bool)

(assert (=> d!115699 (= (array_inv!21778 _keys!1668) (bvsge (size!28476 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82078 d!115699))

(declare-fun d!115701 () Bool)

(declare-fun res!640683 () Bool)

(declare-fun e!539342 () Bool)

(assert (=> d!115701 (=> res!640683 e!539342)))

(assert (=> d!115701 (= res!640683 ((_ is Nil!19508) Nil!19508))))

(assert (=> d!115701 (= (noDuplicate!1371 Nil!19508) e!539342)))

(declare-fun b!956953 () Bool)

(declare-fun e!539343 () Bool)

(assert (=> b!956953 (= e!539342 e!539343)))

(declare-fun res!640684 () Bool)

(assert (=> b!956953 (=> (not res!640684) (not e!539343))))

(declare-fun contains!5278 (List!19511 (_ BitVec 64)) Bool)

(assert (=> b!956953 (= res!640684 (not (contains!5278 (t!27865 Nil!19508) (h!20669 Nil!19508))))))

(declare-fun b!956954 () Bool)

(assert (=> b!956954 (= e!539343 (noDuplicate!1371 (t!27865 Nil!19508)))))

(assert (= (and d!115701 (not res!640683)) b!956953))

(assert (= (and b!956953 res!640684) b!956954))

(declare-fun m!887501 () Bool)

(assert (=> b!956953 m!887501))

(declare-fun m!887503 () Bool)

(assert (=> b!956954 m!887503))

(assert (=> b!956890 d!115701))

(declare-fun mapNonEmpty!33628 () Bool)

(declare-fun mapRes!33628 () Bool)

(declare-fun tp!64234 () Bool)

(declare-fun e!539349 () Bool)

(assert (=> mapNonEmpty!33628 (= mapRes!33628 (and tp!64234 e!539349))))

(declare-fun mapKey!33628 () (_ BitVec 32))

(declare-fun mapValue!33628 () ValueCell!10067)

(declare-fun mapRest!33628 () (Array (_ BitVec 32) ValueCell!10067))

(assert (=> mapNonEmpty!33628 (= mapRest!33619 (store mapRest!33628 mapKey!33628 mapValue!33628))))

(declare-fun condMapEmpty!33628 () Bool)

(declare-fun mapDefault!33628 () ValueCell!10067)

(assert (=> mapNonEmpty!33619 (= condMapEmpty!33628 (= mapRest!33619 ((as const (Array (_ BitVec 32) ValueCell!10067)) mapDefault!33628)))))

(declare-fun e!539348 () Bool)

(assert (=> mapNonEmpty!33619 (= tp!64225 (and e!539348 mapRes!33628))))

(declare-fun mapIsEmpty!33628 () Bool)

(assert (=> mapIsEmpty!33628 mapRes!33628))

(declare-fun b!956962 () Bool)

(assert (=> b!956962 (= e!539348 tp_is_empty!21097)))

(declare-fun b!956961 () Bool)

(assert (=> b!956961 (= e!539349 tp_is_empty!21097)))

(assert (= (and mapNonEmpty!33619 condMapEmpty!33628) mapIsEmpty!33628))

(assert (= (and mapNonEmpty!33619 (not condMapEmpty!33628)) mapNonEmpty!33628))

(assert (= (and mapNonEmpty!33628 ((_ is ValueCellFull!10067) mapValue!33628)) b!956961))

(assert (= (and mapNonEmpty!33619 ((_ is ValueCellFull!10067) mapDefault!33628)) b!956962))

(declare-fun m!887505 () Bool)

(assert (=> mapNonEmpty!33628 m!887505))

(check-sat (not b!956945) (not b!956947) tp_is_empty!21097 (not mapNonEmpty!33628) (not b!956953) (not bm!41685) (not b!956954))
(check-sat)
