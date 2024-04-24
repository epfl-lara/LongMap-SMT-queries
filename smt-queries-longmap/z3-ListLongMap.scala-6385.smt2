; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82236 () Bool)

(assert start!82236)

(declare-fun res!641032 () Bool)

(declare-fun e!539908 () Bool)

(assert (=> start!82236 (=> (not res!641032) (not e!539908))))

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82236 (= res!641032 (validMask!0 mask!2088))))

(assert (=> start!82236 e!539908))

(assert (=> start!82236 true))

(declare-datatypes ((V!33097 0))(
  ( (V!33098 (val!10593 Int)) )
))
(declare-datatypes ((ValueCell!10061 0))(
  ( (ValueCellFull!10061 (v!13146 V!33097)) (EmptyCell!10061) )
))
(declare-datatypes ((array!58306 0))(
  ( (array!58307 (arr!28026 (Array (_ BitVec 32) ValueCell!10061)) (size!28506 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58306)

(declare-fun e!539904 () Bool)

(declare-fun array_inv!21815 (array!58306) Bool)

(assert (=> start!82236 (and (array_inv!21815 _values!1386) e!539904)))

(declare-datatypes ((array!58308 0))(
  ( (array!58309 (arr!28027 (Array (_ BitVec 32) (_ BitVec 64))) (size!28507 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58308)

(declare-fun array_inv!21816 (array!58308) Bool)

(assert (=> start!82236 (array_inv!21816 _keys!1668)))

(declare-fun b!957880 () Bool)

(assert (=> b!957880 (= e!539908 (bvsgt #b00000000000000000000000000000000 (size!28507 _keys!1668)))))

(declare-fun b!957881 () Bool)

(declare-fun res!641033 () Bool)

(assert (=> b!957881 (=> (not res!641033) (not e!539908))))

(declare-fun extraKeys!1307 () (_ BitVec 32))

(assert (=> b!957881 (= res!641033 (and (= (size!28506 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28507 _keys!1668) (size!28506 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun b!957882 () Bool)

(declare-fun e!539906 () Bool)

(declare-fun mapRes!33595 () Bool)

(assert (=> b!957882 (= e!539904 (and e!539906 mapRes!33595))))

(declare-fun condMapEmpty!33595 () Bool)

(declare-fun mapDefault!33595 () ValueCell!10061)

(assert (=> b!957882 (= condMapEmpty!33595 (= (arr!28026 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10061)) mapDefault!33595)))))

(declare-fun b!957883 () Bool)

(declare-fun res!641031 () Bool)

(assert (=> b!957883 (=> (not res!641031) (not e!539908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58308 (_ BitVec 32)) Bool)

(assert (=> b!957883 (= res!641031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!957884 () Bool)

(declare-fun tp_is_empty!21085 () Bool)

(assert (=> b!957884 (= e!539906 tp_is_empty!21085)))

(declare-fun mapNonEmpty!33595 () Bool)

(declare-fun tp!64201 () Bool)

(declare-fun e!539907 () Bool)

(assert (=> mapNonEmpty!33595 (= mapRes!33595 (and tp!64201 e!539907))))

(declare-fun mapValue!33595 () ValueCell!10061)

(declare-fun mapKey!33595 () (_ BitVec 32))

(declare-fun mapRest!33595 () (Array (_ BitVec 32) ValueCell!10061))

(assert (=> mapNonEmpty!33595 (= (arr!28026 _values!1386) (store mapRest!33595 mapKey!33595 mapValue!33595))))

(declare-fun mapIsEmpty!33595 () Bool)

(assert (=> mapIsEmpty!33595 mapRes!33595))

(declare-fun b!957885 () Bool)

(assert (=> b!957885 (= e!539907 tp_is_empty!21085)))

(assert (= (and start!82236 res!641032) b!957881))

(assert (= (and b!957881 res!641033) b!957883))

(assert (= (and b!957883 res!641031) b!957880))

(assert (= (and b!957882 condMapEmpty!33595) mapIsEmpty!33595))

(assert (= (and b!957882 (not condMapEmpty!33595)) mapNonEmpty!33595))

(get-info :version)

(assert (= (and mapNonEmpty!33595 ((_ is ValueCellFull!10061) mapValue!33595)) b!957885))

(assert (= (and b!957882 ((_ is ValueCellFull!10061) mapDefault!33595)) b!957884))

(assert (= start!82236 b!957882))

(declare-fun m!889417 () Bool)

(assert (=> start!82236 m!889417))

(declare-fun m!889419 () Bool)

(assert (=> start!82236 m!889419))

(declare-fun m!889421 () Bool)

(assert (=> start!82236 m!889421))

(declare-fun m!889423 () Bool)

(assert (=> b!957883 m!889423))

(declare-fun m!889425 () Bool)

(assert (=> mapNonEmpty!33595 m!889425))

(check-sat (not b!957883) (not start!82236) (not mapNonEmpty!33595) tp_is_empty!21085)
(check-sat)
(get-model)

(declare-fun b!957930 () Bool)

(declare-fun e!539945 () Bool)

(declare-fun call!41753 () Bool)

(assert (=> b!957930 (= e!539945 call!41753)))

(declare-fun b!957931 () Bool)

(declare-fun e!539947 () Bool)

(assert (=> b!957931 (= e!539947 call!41753)))

(declare-fun b!957933 () Bool)

(declare-fun e!539946 () Bool)

(assert (=> b!957933 (= e!539946 e!539945)))

(declare-fun c!100178 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!957933 (= c!100178 (validKeyInArray!0 (select (arr!28027 _keys!1668) #b00000000000000000000000000000000)))))

(declare-fun bm!41750 () Bool)

(assert (=> bm!41750 (= call!41753 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1668 mask!2088))))

(declare-fun d!116193 () Bool)

(declare-fun res!641057 () Bool)

(assert (=> d!116193 (=> res!641057 e!539946)))

(assert (=> d!116193 (= res!641057 (bvsge #b00000000000000000000000000000000 (size!28507 _keys!1668)))))

(assert (=> d!116193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088) e!539946)))

(declare-fun b!957932 () Bool)

(assert (=> b!957932 (= e!539945 e!539947)))

(declare-fun lt!430630 () (_ BitVec 64))

(assert (=> b!957932 (= lt!430630 (select (arr!28027 _keys!1668) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32118 0))(
  ( (Unit!32119) )
))
(declare-fun lt!430631 () Unit!32118)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58308 (_ BitVec 64) (_ BitVec 32)) Unit!32118)

(assert (=> b!957932 (= lt!430631 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1668 lt!430630 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!957932 (arrayContainsKey!0 _keys!1668 lt!430630 #b00000000000000000000000000000000)))

(declare-fun lt!430632 () Unit!32118)

(assert (=> b!957932 (= lt!430632 lt!430631)))

(declare-fun res!641056 () Bool)

(declare-datatypes ((SeekEntryResult!9144 0))(
  ( (MissingZero!9144 (index!38947 (_ BitVec 32))) (Found!9144 (index!38948 (_ BitVec 32))) (Intermediate!9144 (undefined!9956 Bool) (index!38949 (_ BitVec 32)) (x!82446 (_ BitVec 32))) (Undefined!9144) (MissingVacant!9144 (index!38950 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58308 (_ BitVec 32)) SeekEntryResult!9144)

(assert (=> b!957932 (= res!641056 (= (seekEntryOrOpen!0 (select (arr!28027 _keys!1668) #b00000000000000000000000000000000) _keys!1668 mask!2088) (Found!9144 #b00000000000000000000000000000000)))))

(assert (=> b!957932 (=> (not res!641056) (not e!539947))))

(assert (= (and d!116193 (not res!641057)) b!957933))

(assert (= (and b!957933 c!100178) b!957932))

(assert (= (and b!957933 (not c!100178)) b!957930))

(assert (= (and b!957932 res!641056) b!957931))

(assert (= (or b!957931 b!957930) bm!41750))

(declare-fun m!889447 () Bool)

(assert (=> b!957933 m!889447))

(assert (=> b!957933 m!889447))

(declare-fun m!889449 () Bool)

(assert (=> b!957933 m!889449))

(declare-fun m!889451 () Bool)

(assert (=> bm!41750 m!889451))

(assert (=> b!957932 m!889447))

(declare-fun m!889453 () Bool)

(assert (=> b!957932 m!889453))

(declare-fun m!889455 () Bool)

(assert (=> b!957932 m!889455))

(assert (=> b!957932 m!889447))

(declare-fun m!889457 () Bool)

(assert (=> b!957932 m!889457))

(assert (=> b!957883 d!116193))

(declare-fun d!116195 () Bool)

(assert (=> d!116195 (= (validMask!0 mask!2088) (and (or (= mask!2088 #b00000000000000000000000000000111) (= mask!2088 #b00000000000000000000000000001111) (= mask!2088 #b00000000000000000000000000011111) (= mask!2088 #b00000000000000000000000000111111) (= mask!2088 #b00000000000000000000000001111111) (= mask!2088 #b00000000000000000000000011111111) (= mask!2088 #b00000000000000000000000111111111) (= mask!2088 #b00000000000000000000001111111111) (= mask!2088 #b00000000000000000000011111111111) (= mask!2088 #b00000000000000000000111111111111) (= mask!2088 #b00000000000000000001111111111111) (= mask!2088 #b00000000000000000011111111111111) (= mask!2088 #b00000000000000000111111111111111) (= mask!2088 #b00000000000000001111111111111111) (= mask!2088 #b00000000000000011111111111111111) (= mask!2088 #b00000000000000111111111111111111) (= mask!2088 #b00000000000001111111111111111111) (= mask!2088 #b00000000000011111111111111111111) (= mask!2088 #b00000000000111111111111111111111) (= mask!2088 #b00000000001111111111111111111111) (= mask!2088 #b00000000011111111111111111111111) (= mask!2088 #b00000000111111111111111111111111) (= mask!2088 #b00000001111111111111111111111111) (= mask!2088 #b00000011111111111111111111111111) (= mask!2088 #b00000111111111111111111111111111) (= mask!2088 #b00001111111111111111111111111111) (= mask!2088 #b00011111111111111111111111111111) (= mask!2088 #b00111111111111111111111111111111)) (bvsle mask!2088 #b00111111111111111111111111111111)))))

(assert (=> start!82236 d!116195))

(declare-fun d!116197 () Bool)

(assert (=> d!116197 (= (array_inv!21815 _values!1386) (bvsge (size!28506 _values!1386) #b00000000000000000000000000000000))))

(assert (=> start!82236 d!116197))

(declare-fun d!116199 () Bool)

(assert (=> d!116199 (= (array_inv!21816 _keys!1668) (bvsge (size!28507 _keys!1668) #b00000000000000000000000000000000))))

(assert (=> start!82236 d!116199))

(declare-fun b!957940 () Bool)

(declare-fun e!539952 () Bool)

(assert (=> b!957940 (= e!539952 tp_is_empty!21085)))

(declare-fun mapNonEmpty!33604 () Bool)

(declare-fun mapRes!33604 () Bool)

(declare-fun tp!64210 () Bool)

(assert (=> mapNonEmpty!33604 (= mapRes!33604 (and tp!64210 e!539952))))

(declare-fun mapKey!33604 () (_ BitVec 32))

(declare-fun mapRest!33604 () (Array (_ BitVec 32) ValueCell!10061))

(declare-fun mapValue!33604 () ValueCell!10061)

(assert (=> mapNonEmpty!33604 (= mapRest!33595 (store mapRest!33604 mapKey!33604 mapValue!33604))))

(declare-fun condMapEmpty!33604 () Bool)

(declare-fun mapDefault!33604 () ValueCell!10061)

(assert (=> mapNonEmpty!33595 (= condMapEmpty!33604 (= mapRest!33595 ((as const (Array (_ BitVec 32) ValueCell!10061)) mapDefault!33604)))))

(declare-fun e!539953 () Bool)

(assert (=> mapNonEmpty!33595 (= tp!64201 (and e!539953 mapRes!33604))))

(declare-fun b!957941 () Bool)

(assert (=> b!957941 (= e!539953 tp_is_empty!21085)))

(declare-fun mapIsEmpty!33604 () Bool)

(assert (=> mapIsEmpty!33604 mapRes!33604))

(assert (= (and mapNonEmpty!33595 condMapEmpty!33604) mapIsEmpty!33604))

(assert (= (and mapNonEmpty!33595 (not condMapEmpty!33604)) mapNonEmpty!33604))

(assert (= (and mapNonEmpty!33604 ((_ is ValueCellFull!10061) mapValue!33604)) b!957940))

(assert (= (and mapNonEmpty!33595 ((_ is ValueCellFull!10061) mapDefault!33604)) b!957941))

(declare-fun m!889459 () Bool)

(assert (=> mapNonEmpty!33604 m!889459))

(check-sat (not bm!41750) (not b!957933) tp_is_empty!21085 (not b!957932) (not mapNonEmpty!33604))
(check-sat)
