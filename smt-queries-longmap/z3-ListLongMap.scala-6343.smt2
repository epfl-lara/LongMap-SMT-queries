; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81924 () Bool)

(assert start!81924)

(declare-fun b!954648 () Bool)

(declare-fun e!537848 () Bool)

(declare-fun e!537849 () Bool)

(declare-fun mapRes!33199 () Bool)

(assert (=> b!954648 (= e!537848 (and e!537849 mapRes!33199))))

(declare-fun condMapEmpty!33199 () Bool)

(declare-datatypes ((V!32761 0))(
  ( (V!32762 (val!10467 Int)) )
))
(declare-datatypes ((ValueCell!9935 0))(
  ( (ValueCellFull!9935 (v!13018 V!32761)) (EmptyCell!9935) )
))
(declare-datatypes ((array!57820 0))(
  ( (array!57821 (arr!27789 (Array (_ BitVec 32) ValueCell!9935)) (size!28269 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57820)

(declare-fun mapDefault!33199 () ValueCell!9935)

(assert (=> b!954648 (= condMapEmpty!33199 (= (arr!27789 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9935)) mapDefault!33199)))))

(declare-fun res!639063 () Bool)

(declare-fun e!537851 () Bool)

(assert (=> start!81924 (=> (not res!639063) (not e!537851))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81924 (= res!639063 (validMask!0 mask!1823))))

(assert (=> start!81924 e!537851))

(assert (=> start!81924 true))

(declare-fun array_inv!21645 (array!57820) Bool)

(assert (=> start!81924 (and (array_inv!21645 _values!1197) e!537848)))

(declare-datatypes ((array!57822 0))(
  ( (array!57823 (arr!27790 (Array (_ BitVec 32) (_ BitVec 64))) (size!28270 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57822)

(declare-fun array_inv!21646 (array!57822) Bool)

(assert (=> start!81924 (array_inv!21646 _keys!1441)))

(declare-fun b!954649 () Bool)

(declare-fun tp_is_empty!20833 () Bool)

(assert (=> b!954649 (= e!537849 tp_is_empty!20833)))

(declare-fun b!954650 () Bool)

(declare-fun res!639062 () Bool)

(assert (=> b!954650 (=> (not res!639062) (not e!537851))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954650 (= res!639062 (and (= (size!28269 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28270 _keys!1441) (size!28269 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33199 () Bool)

(declare-fun tp!63589 () Bool)

(declare-fun e!537850 () Bool)

(assert (=> mapNonEmpty!33199 (= mapRes!33199 (and tp!63589 e!537850))))

(declare-fun mapRest!33199 () (Array (_ BitVec 32) ValueCell!9935))

(declare-fun mapValue!33199 () ValueCell!9935)

(declare-fun mapKey!33199 () (_ BitVec 32))

(assert (=> mapNonEmpty!33199 (= (arr!27789 _values!1197) (store mapRest!33199 mapKey!33199 mapValue!33199))))

(declare-fun b!954651 () Bool)

(assert (=> b!954651 (= e!537851 (bvsgt #b00000000000000000000000000000000 (size!28270 _keys!1441)))))

(declare-fun mapIsEmpty!33199 () Bool)

(assert (=> mapIsEmpty!33199 mapRes!33199))

(declare-fun b!954652 () Bool)

(assert (=> b!954652 (= e!537850 tp_is_empty!20833)))

(declare-fun b!954653 () Bool)

(declare-fun res!639061 () Bool)

(assert (=> b!954653 (=> (not res!639061) (not e!537851))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57822 (_ BitVec 32)) Bool)

(assert (=> b!954653 (= res!639061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(assert (= (and start!81924 res!639063) b!954650))

(assert (= (and b!954650 res!639062) b!954653))

(assert (= (and b!954653 res!639061) b!954651))

(assert (= (and b!954648 condMapEmpty!33199) mapIsEmpty!33199))

(assert (= (and b!954648 (not condMapEmpty!33199)) mapNonEmpty!33199))

(get-info :version)

(assert (= (and mapNonEmpty!33199 ((_ is ValueCellFull!9935) mapValue!33199)) b!954652))

(assert (= (and b!954648 ((_ is ValueCellFull!9935) mapDefault!33199)) b!954649))

(assert (= start!81924 b!954648))

(declare-fun m!886999 () Bool)

(assert (=> start!81924 m!886999))

(declare-fun m!887001 () Bool)

(assert (=> start!81924 m!887001))

(declare-fun m!887003 () Bool)

(assert (=> start!81924 m!887003))

(declare-fun m!887005 () Bool)

(assert (=> mapNonEmpty!33199 m!887005))

(declare-fun m!887007 () Bool)

(assert (=> b!954653 m!887007))

(check-sat (not start!81924) (not b!954653) (not mapNonEmpty!33199) tp_is_empty!20833)
(check-sat)
(get-model)

(declare-fun d!116047 () Bool)

(assert (=> d!116047 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81924 d!116047))

(declare-fun d!116049 () Bool)

(assert (=> d!116049 (= (array_inv!21645 _values!1197) (bvsge (size!28269 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81924 d!116049))

(declare-fun d!116051 () Bool)

(assert (=> d!116051 (= (array_inv!21646 _keys!1441) (bvsge (size!28270 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81924 d!116051))

(declare-fun d!116053 () Bool)

(declare-fun res!639086 () Bool)

(declare-fun e!537888 () Bool)

(assert (=> d!116053 (=> res!639086 e!537888)))

(assert (=> d!116053 (= res!639086 (bvsge #b00000000000000000000000000000000 (size!28270 _keys!1441)))))

(assert (=> d!116053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537888)))

(declare-fun b!954698 () Bool)

(declare-fun e!537890 () Bool)

(declare-fun call!41714 () Bool)

(assert (=> b!954698 (= e!537890 call!41714)))

(declare-fun b!954699 () Bool)

(declare-fun e!537889 () Bool)

(assert (=> b!954699 (= e!537888 e!537889)))

(declare-fun c!100139 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954699 (= c!100139 (validKeyInArray!0 (select (arr!27790 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!954700 () Bool)

(assert (=> b!954700 (= e!537889 call!41714)))

(declare-fun bm!41711 () Bool)

(assert (=> bm!41711 (= call!41714 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!954701 () Bool)

(assert (=> b!954701 (= e!537889 e!537890)))

(declare-fun lt!430189 () (_ BitVec 64))

(assert (=> b!954701 (= lt!430189 (select (arr!27790 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32064 0))(
  ( (Unit!32065) )
))
(declare-fun lt!430190 () Unit!32064)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57822 (_ BitVec 64) (_ BitVec 32)) Unit!32064)

(assert (=> b!954701 (= lt!430190 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!430189 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!954701 (arrayContainsKey!0 _keys!1441 lt!430189 #b00000000000000000000000000000000)))

(declare-fun lt!430188 () Unit!32064)

(assert (=> b!954701 (= lt!430188 lt!430190)))

(declare-fun res!639087 () Bool)

(declare-datatypes ((SeekEntryResult!9139 0))(
  ( (MissingZero!9139 (index!38927 (_ BitVec 32))) (Found!9139 (index!38928 (_ BitVec 32))) (Intermediate!9139 (undefined!9951 Bool) (index!38929 (_ BitVec 32)) (x!82085 (_ BitVec 32))) (Undefined!9139) (MissingVacant!9139 (index!38930 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57822 (_ BitVec 32)) SeekEntryResult!9139)

(assert (=> b!954701 (= res!639087 (= (seekEntryOrOpen!0 (select (arr!27790 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9139 #b00000000000000000000000000000000)))))

(assert (=> b!954701 (=> (not res!639087) (not e!537890))))

(assert (= (and d!116053 (not res!639086)) b!954699))

(assert (= (and b!954699 c!100139) b!954701))

(assert (= (and b!954699 (not c!100139)) b!954700))

(assert (= (and b!954701 res!639087) b!954698))

(assert (= (or b!954698 b!954700) bm!41711))

(declare-fun m!887029 () Bool)

(assert (=> b!954699 m!887029))

(assert (=> b!954699 m!887029))

(declare-fun m!887031 () Bool)

(assert (=> b!954699 m!887031))

(declare-fun m!887033 () Bool)

(assert (=> bm!41711 m!887033))

(assert (=> b!954701 m!887029))

(declare-fun m!887035 () Bool)

(assert (=> b!954701 m!887035))

(declare-fun m!887037 () Bool)

(assert (=> b!954701 m!887037))

(assert (=> b!954701 m!887029))

(declare-fun m!887039 () Bool)

(assert (=> b!954701 m!887039))

(assert (=> b!954653 d!116053))

(declare-fun b!954709 () Bool)

(declare-fun e!537896 () Bool)

(assert (=> b!954709 (= e!537896 tp_is_empty!20833)))

(declare-fun condMapEmpty!33208 () Bool)

(declare-fun mapDefault!33208 () ValueCell!9935)

(assert (=> mapNonEmpty!33199 (= condMapEmpty!33208 (= mapRest!33199 ((as const (Array (_ BitVec 32) ValueCell!9935)) mapDefault!33208)))))

(declare-fun mapRes!33208 () Bool)

(assert (=> mapNonEmpty!33199 (= tp!63589 (and e!537896 mapRes!33208))))

(declare-fun mapNonEmpty!33208 () Bool)

(declare-fun tp!63598 () Bool)

(declare-fun e!537895 () Bool)

(assert (=> mapNonEmpty!33208 (= mapRes!33208 (and tp!63598 e!537895))))

(declare-fun mapValue!33208 () ValueCell!9935)

(declare-fun mapKey!33208 () (_ BitVec 32))

(declare-fun mapRest!33208 () (Array (_ BitVec 32) ValueCell!9935))

(assert (=> mapNonEmpty!33208 (= mapRest!33199 (store mapRest!33208 mapKey!33208 mapValue!33208))))

(declare-fun mapIsEmpty!33208 () Bool)

(assert (=> mapIsEmpty!33208 mapRes!33208))

(declare-fun b!954708 () Bool)

(assert (=> b!954708 (= e!537895 tp_is_empty!20833)))

(assert (= (and mapNonEmpty!33199 condMapEmpty!33208) mapIsEmpty!33208))

(assert (= (and mapNonEmpty!33199 (not condMapEmpty!33208)) mapNonEmpty!33208))

(assert (= (and mapNonEmpty!33208 ((_ is ValueCellFull!9935) mapValue!33208)) b!954708))

(assert (= (and mapNonEmpty!33199 ((_ is ValueCellFull!9935) mapDefault!33208)) b!954709))

(declare-fun m!887041 () Bool)

(assert (=> mapNonEmpty!33208 m!887041))

(check-sat tp_is_empty!20833 (not bm!41711) (not mapNonEmpty!33208) (not b!954701) (not b!954699))
(check-sat)
