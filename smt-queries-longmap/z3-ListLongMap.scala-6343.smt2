; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81738 () Bool)

(assert start!81738)

(declare-fun res!638608 () Bool)

(declare-fun e!537119 () Bool)

(assert (=> start!81738 (=> (not res!638608) (not e!537119))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81738 (= res!638608 (validMask!0 mask!1823))))

(assert (=> start!81738 e!537119))

(assert (=> start!81738 true))

(declare-datatypes ((V!32761 0))(
  ( (V!32762 (val!10467 Int)) )
))
(declare-datatypes ((ValueCell!9935 0))(
  ( (ValueCellFull!9935 (v!13020 V!32761)) (EmptyCell!9935) )
))
(declare-datatypes ((array!57734 0))(
  ( (array!57735 (arr!27751 (Array (_ BitVec 32) ValueCell!9935)) (size!28232 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57734)

(declare-fun e!537118 () Bool)

(declare-fun array_inv!21605 (array!57734) Bool)

(assert (=> start!81738 (and (array_inv!21605 _values!1197) e!537118)))

(declare-datatypes ((array!57736 0))(
  ( (array!57737 (arr!27752 (Array (_ BitVec 32) (_ BitVec 64))) (size!28233 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57736)

(declare-fun array_inv!21606 (array!57736) Bool)

(assert (=> start!81738 (array_inv!21606 _keys!1441)))

(declare-fun b!953506 () Bool)

(declare-fun res!638609 () Bool)

(assert (=> b!953506 (=> (not res!638609) (not e!537119))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!953506 (= res!638609 (and (= (size!28232 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28233 _keys!1441) (size!28232 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33199 () Bool)

(declare-fun mapRes!33199 () Bool)

(assert (=> mapIsEmpty!33199 mapRes!33199))

(declare-fun b!953507 () Bool)

(declare-fun e!537121 () Bool)

(declare-fun tp_is_empty!20833 () Bool)

(assert (=> b!953507 (= e!537121 tp_is_empty!20833)))

(declare-fun mapNonEmpty!33199 () Bool)

(declare-fun tp!63589 () Bool)

(assert (=> mapNonEmpty!33199 (= mapRes!33199 (and tp!63589 e!537121))))

(declare-fun mapKey!33199 () (_ BitVec 32))

(declare-fun mapRest!33199 () (Array (_ BitVec 32) ValueCell!9935))

(declare-fun mapValue!33199 () ValueCell!9935)

(assert (=> mapNonEmpty!33199 (= (arr!27751 _values!1197) (store mapRest!33199 mapKey!33199 mapValue!33199))))

(declare-fun b!953508 () Bool)

(declare-fun e!537120 () Bool)

(assert (=> b!953508 (= e!537120 tp_is_empty!20833)))

(declare-fun b!953509 () Bool)

(declare-fun res!638607 () Bool)

(assert (=> b!953509 (=> (not res!638607) (not e!537119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57736 (_ BitVec 32)) Bool)

(assert (=> b!953509 (= res!638607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!953510 () Bool)

(assert (=> b!953510 (= e!537119 (bvsgt #b00000000000000000000000000000000 (size!28233 _keys!1441)))))

(declare-fun b!953511 () Bool)

(assert (=> b!953511 (= e!537118 (and e!537120 mapRes!33199))))

(declare-fun condMapEmpty!33199 () Bool)

(declare-fun mapDefault!33199 () ValueCell!9935)

(assert (=> b!953511 (= condMapEmpty!33199 (= (arr!27751 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9935)) mapDefault!33199)))))

(assert (= (and start!81738 res!638608) b!953506))

(assert (= (and b!953506 res!638609) b!953509))

(assert (= (and b!953509 res!638607) b!953510))

(assert (= (and b!953511 condMapEmpty!33199) mapIsEmpty!33199))

(assert (= (and b!953511 (not condMapEmpty!33199)) mapNonEmpty!33199))

(get-info :version)

(assert (= (and mapNonEmpty!33199 ((_ is ValueCellFull!9935) mapValue!33199)) b!953507))

(assert (= (and b!953511 ((_ is ValueCellFull!9935) mapDefault!33199)) b!953508))

(assert (= start!81738 b!953511))

(declare-fun m!884947 () Bool)

(assert (=> start!81738 m!884947))

(declare-fun m!884949 () Bool)

(assert (=> start!81738 m!884949))

(declare-fun m!884951 () Bool)

(assert (=> start!81738 m!884951))

(declare-fun m!884953 () Bool)

(assert (=> mapNonEmpty!33199 m!884953))

(declare-fun m!884955 () Bool)

(assert (=> b!953509 m!884955))

(check-sat (not start!81738) (not b!953509) (not mapNonEmpty!33199) tp_is_empty!20833)
(check-sat)
(get-model)

(declare-fun d!115527 () Bool)

(assert (=> d!115527 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81738 d!115527))

(declare-fun d!115529 () Bool)

(assert (=> d!115529 (= (array_inv!21605 _values!1197) (bvsge (size!28232 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81738 d!115529))

(declare-fun d!115531 () Bool)

(assert (=> d!115531 (= (array_inv!21606 _keys!1441) (bvsge (size!28233 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81738 d!115531))

(declare-fun b!953556 () Bool)

(declare-fun e!537159 () Bool)

(declare-fun call!41643 () Bool)

(assert (=> b!953556 (= e!537159 call!41643)))

(declare-fun b!953557 () Bool)

(declare-fun e!537160 () Bool)

(assert (=> b!953557 (= e!537160 e!537159)))

(declare-fun c!99792 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!953557 (= c!99792 (validKeyInArray!0 (select (arr!27752 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun bm!41640 () Bool)

(assert (=> bm!41640 (= call!41643 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!953559 () Bool)

(declare-fun e!537158 () Bool)

(assert (=> b!953559 (= e!537159 e!537158)))

(declare-fun lt!429593 () (_ BitVec 64))

(assert (=> b!953559 (= lt!429593 (select (arr!27752 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!31956 0))(
  ( (Unit!31957) )
))
(declare-fun lt!429591 () Unit!31956)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57736 (_ BitVec 64) (_ BitVec 32)) Unit!31956)

(assert (=> b!953559 (= lt!429591 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!429593 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!953559 (arrayContainsKey!0 _keys!1441 lt!429593 #b00000000000000000000000000000000)))

(declare-fun lt!429592 () Unit!31956)

(assert (=> b!953559 (= lt!429592 lt!429591)))

(declare-fun res!638633 () Bool)

(declare-datatypes ((SeekEntryResult!9179 0))(
  ( (MissingZero!9179 (index!39087 (_ BitVec 32))) (Found!9179 (index!39088 (_ BitVec 32))) (Intermediate!9179 (undefined!9991 Bool) (index!39089 (_ BitVec 32)) (x!82106 (_ BitVec 32))) (Undefined!9179) (MissingVacant!9179 (index!39090 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57736 (_ BitVec 32)) SeekEntryResult!9179)

(assert (=> b!953559 (= res!638633 (= (seekEntryOrOpen!0 (select (arr!27752 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9179 #b00000000000000000000000000000000)))))

(assert (=> b!953559 (=> (not res!638633) (not e!537158))))

(declare-fun d!115533 () Bool)

(declare-fun res!638632 () Bool)

(assert (=> d!115533 (=> res!638632 e!537160)))

(assert (=> d!115533 (= res!638632 (bvsge #b00000000000000000000000000000000 (size!28233 _keys!1441)))))

(assert (=> d!115533 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537160)))

(declare-fun b!953558 () Bool)

(assert (=> b!953558 (= e!537158 call!41643)))

(assert (= (and d!115533 (not res!638632)) b!953557))

(assert (= (and b!953557 c!99792) b!953559))

(assert (= (and b!953557 (not c!99792)) b!953556))

(assert (= (and b!953559 res!638633) b!953558))

(assert (= (or b!953558 b!953556) bm!41640))

(declare-fun m!884977 () Bool)

(assert (=> b!953557 m!884977))

(assert (=> b!953557 m!884977))

(declare-fun m!884979 () Bool)

(assert (=> b!953557 m!884979))

(declare-fun m!884981 () Bool)

(assert (=> bm!41640 m!884981))

(assert (=> b!953559 m!884977))

(declare-fun m!884983 () Bool)

(assert (=> b!953559 m!884983))

(declare-fun m!884985 () Bool)

(assert (=> b!953559 m!884985))

(assert (=> b!953559 m!884977))

(declare-fun m!884987 () Bool)

(assert (=> b!953559 m!884987))

(assert (=> b!953509 d!115533))

(declare-fun condMapEmpty!33208 () Bool)

(declare-fun mapDefault!33208 () ValueCell!9935)

(assert (=> mapNonEmpty!33199 (= condMapEmpty!33208 (= mapRest!33199 ((as const (Array (_ BitVec 32) ValueCell!9935)) mapDefault!33208)))))

(declare-fun e!537166 () Bool)

(declare-fun mapRes!33208 () Bool)

(assert (=> mapNonEmpty!33199 (= tp!63589 (and e!537166 mapRes!33208))))

(declare-fun mapIsEmpty!33208 () Bool)

(assert (=> mapIsEmpty!33208 mapRes!33208))

(declare-fun b!953567 () Bool)

(assert (=> b!953567 (= e!537166 tp_is_empty!20833)))

(declare-fun b!953566 () Bool)

(declare-fun e!537165 () Bool)

(assert (=> b!953566 (= e!537165 tp_is_empty!20833)))

(declare-fun mapNonEmpty!33208 () Bool)

(declare-fun tp!63598 () Bool)

(assert (=> mapNonEmpty!33208 (= mapRes!33208 (and tp!63598 e!537165))))

(declare-fun mapValue!33208 () ValueCell!9935)

(declare-fun mapKey!33208 () (_ BitVec 32))

(declare-fun mapRest!33208 () (Array (_ BitVec 32) ValueCell!9935))

(assert (=> mapNonEmpty!33208 (= mapRest!33199 (store mapRest!33208 mapKey!33208 mapValue!33208))))

(assert (= (and mapNonEmpty!33199 condMapEmpty!33208) mapIsEmpty!33208))

(assert (= (and mapNonEmpty!33199 (not condMapEmpty!33208)) mapNonEmpty!33208))

(assert (= (and mapNonEmpty!33208 ((_ is ValueCellFull!9935) mapValue!33208)) b!953566))

(assert (= (and mapNonEmpty!33199 ((_ is ValueCellFull!9935) mapDefault!33208)) b!953567))

(declare-fun m!884989 () Bool)

(assert (=> mapNonEmpty!33208 m!884989))

(check-sat tp_is_empty!20833 (not bm!41640) (not b!953559) (not mapNonEmpty!33208) (not b!953557))
(check-sat)
