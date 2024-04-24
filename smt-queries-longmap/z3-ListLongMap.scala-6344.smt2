; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81938 () Bool)

(assert start!81938)

(declare-fun res!639094 () Bool)

(declare-fun e!537909 () Bool)

(assert (=> start!81938 (=> (not res!639094) (not e!537909))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81938 (= res!639094 (validMask!0 mask!1823))))

(assert (=> start!81938 e!537909))

(assert (=> start!81938 true))

(declare-datatypes ((V!32769 0))(
  ( (V!32770 (val!10470 Int)) )
))
(declare-datatypes ((ValueCell!9938 0))(
  ( (ValueCellFull!9938 (v!13021 V!32769)) (EmptyCell!9938) )
))
(declare-datatypes ((array!57832 0))(
  ( (array!57833 (arr!27794 (Array (_ BitVec 32) ValueCell!9938)) (size!28274 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57832)

(declare-fun e!537908 () Bool)

(declare-fun array_inv!21649 (array!57832) Bool)

(assert (=> start!81938 (and (array_inv!21649 _values!1197) e!537908)))

(declare-datatypes ((array!57834 0))(
  ( (array!57835 (arr!27795 (Array (_ BitVec 32) (_ BitVec 64))) (size!28275 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57834)

(declare-fun array_inv!21650 (array!57834) Bool)

(assert (=> start!81938 (array_inv!21650 _keys!1441)))

(declare-fun b!954722 () Bool)

(declare-fun res!639095 () Bool)

(assert (=> b!954722 (=> (not res!639095) (not e!537909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57834 (_ BitVec 32)) Bool)

(assert (=> b!954722 (= res!639095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954723 () Bool)

(assert (=> b!954723 (= e!537909 (and (bvsle #b00000000000000000000000000000000 (size!28275 _keys!1441)) (bvsge (size!28275 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun b!954724 () Bool)

(declare-fun e!537911 () Bool)

(declare-fun mapRes!33211 () Bool)

(assert (=> b!954724 (= e!537908 (and e!537911 mapRes!33211))))

(declare-fun condMapEmpty!33211 () Bool)

(declare-fun mapDefault!33211 () ValueCell!9938)

(assert (=> b!954724 (= condMapEmpty!33211 (= (arr!27794 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9938)) mapDefault!33211)))))

(declare-fun b!954725 () Bool)

(declare-fun tp_is_empty!20839 () Bool)

(assert (=> b!954725 (= e!537911 tp_is_empty!20839)))

(declare-fun mapNonEmpty!33211 () Bool)

(declare-fun tp!63601 () Bool)

(declare-fun e!537907 () Bool)

(assert (=> mapNonEmpty!33211 (= mapRes!33211 (and tp!63601 e!537907))))

(declare-fun mapValue!33211 () ValueCell!9938)

(declare-fun mapRest!33211 () (Array (_ BitVec 32) ValueCell!9938))

(declare-fun mapKey!33211 () (_ BitVec 32))

(assert (=> mapNonEmpty!33211 (= (arr!27794 _values!1197) (store mapRest!33211 mapKey!33211 mapValue!33211))))

(declare-fun b!954726 () Bool)

(assert (=> b!954726 (= e!537907 tp_is_empty!20839)))

(declare-fun b!954727 () Bool)

(declare-fun res!639096 () Bool)

(assert (=> b!954727 (=> (not res!639096) (not e!537909))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954727 (= res!639096 (and (= (size!28274 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28275 _keys!1441) (size!28274 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33211 () Bool)

(assert (=> mapIsEmpty!33211 mapRes!33211))

(assert (= (and start!81938 res!639094) b!954727))

(assert (= (and b!954727 res!639096) b!954722))

(assert (= (and b!954722 res!639095) b!954723))

(assert (= (and b!954724 condMapEmpty!33211) mapIsEmpty!33211))

(assert (= (and b!954724 (not condMapEmpty!33211)) mapNonEmpty!33211))

(get-info :version)

(assert (= (and mapNonEmpty!33211 ((_ is ValueCellFull!9938) mapValue!33211)) b!954726))

(assert (= (and b!954724 ((_ is ValueCellFull!9938) mapDefault!33211)) b!954725))

(assert (= start!81938 b!954724))

(declare-fun m!887043 () Bool)

(assert (=> start!81938 m!887043))

(declare-fun m!887045 () Bool)

(assert (=> start!81938 m!887045))

(declare-fun m!887047 () Bool)

(assert (=> start!81938 m!887047))

(declare-fun m!887049 () Bool)

(assert (=> b!954722 m!887049))

(declare-fun m!887051 () Bool)

(assert (=> mapNonEmpty!33211 m!887051))

(check-sat (not b!954722) (not start!81938) (not mapNonEmpty!33211) tp_is_empty!20839)
(check-sat)
(get-model)

(declare-fun b!954772 () Bool)

(declare-fun e!537949 () Bool)

(declare-fun e!537950 () Bool)

(assert (=> b!954772 (= e!537949 e!537950)))

(declare-fun lt!430197 () (_ BitVec 64))

(assert (=> b!954772 (= lt!430197 (select (arr!27795 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32066 0))(
  ( (Unit!32067) )
))
(declare-fun lt!430198 () Unit!32066)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57834 (_ BitVec 64) (_ BitVec 32)) Unit!32066)

(assert (=> b!954772 (= lt!430198 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!430197 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57834 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!954772 (arrayContainsKey!0 _keys!1441 lt!430197 #b00000000000000000000000000000000)))

(declare-fun lt!430199 () Unit!32066)

(assert (=> b!954772 (= lt!430199 lt!430198)))

(declare-fun res!639119 () Bool)

(declare-datatypes ((SeekEntryResult!9140 0))(
  ( (MissingZero!9140 (index!38931 (_ BitVec 32))) (Found!9140 (index!38932 (_ BitVec 32))) (Intermediate!9140 (undefined!9952 Bool) (index!38933 (_ BitVec 32)) (x!82096 (_ BitVec 32))) (Undefined!9140) (MissingVacant!9140 (index!38934 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57834 (_ BitVec 32)) SeekEntryResult!9140)

(assert (=> b!954772 (= res!639119 (= (seekEntryOrOpen!0 (select (arr!27795 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9140 #b00000000000000000000000000000000)))))

(assert (=> b!954772 (=> (not res!639119) (not e!537950))))

(declare-fun b!954773 () Bool)

(declare-fun call!41717 () Bool)

(assert (=> b!954773 (= e!537950 call!41717)))

(declare-fun b!954774 () Bool)

(assert (=> b!954774 (= e!537949 call!41717)))

(declare-fun d!116057 () Bool)

(declare-fun res!639120 () Bool)

(declare-fun e!537948 () Bool)

(assert (=> d!116057 (=> res!639120 e!537948)))

(assert (=> d!116057 (= res!639120 (bvsge #b00000000000000000000000000000000 (size!28275 _keys!1441)))))

(assert (=> d!116057 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!537948)))

(declare-fun bm!41714 () Bool)

(assert (=> bm!41714 (= call!41717 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!954775 () Bool)

(assert (=> b!954775 (= e!537948 e!537949)))

(declare-fun c!100142 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954775 (= c!100142 (validKeyInArray!0 (select (arr!27795 _keys!1441) #b00000000000000000000000000000000)))))

(assert (= (and d!116057 (not res!639120)) b!954775))

(assert (= (and b!954775 c!100142) b!954772))

(assert (= (and b!954775 (not c!100142)) b!954774))

(assert (= (and b!954772 res!639119) b!954773))

(assert (= (or b!954773 b!954774) bm!41714))

(declare-fun m!887073 () Bool)

(assert (=> b!954772 m!887073))

(declare-fun m!887075 () Bool)

(assert (=> b!954772 m!887075))

(declare-fun m!887077 () Bool)

(assert (=> b!954772 m!887077))

(assert (=> b!954772 m!887073))

(declare-fun m!887079 () Bool)

(assert (=> b!954772 m!887079))

(declare-fun m!887081 () Bool)

(assert (=> bm!41714 m!887081))

(assert (=> b!954775 m!887073))

(assert (=> b!954775 m!887073))

(declare-fun m!887083 () Bool)

(assert (=> b!954775 m!887083))

(assert (=> b!954722 d!116057))

(declare-fun d!116059 () Bool)

(assert (=> d!116059 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81938 d!116059))

(declare-fun d!116061 () Bool)

(assert (=> d!116061 (= (array_inv!21649 _values!1197) (bvsge (size!28274 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81938 d!116061))

(declare-fun d!116063 () Bool)

(assert (=> d!116063 (= (array_inv!21650 _keys!1441) (bvsge (size!28275 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81938 d!116063))

(declare-fun mapNonEmpty!33220 () Bool)

(declare-fun mapRes!33220 () Bool)

(declare-fun tp!63610 () Bool)

(declare-fun e!537955 () Bool)

(assert (=> mapNonEmpty!33220 (= mapRes!33220 (and tp!63610 e!537955))))

(declare-fun mapRest!33220 () (Array (_ BitVec 32) ValueCell!9938))

(declare-fun mapKey!33220 () (_ BitVec 32))

(declare-fun mapValue!33220 () ValueCell!9938)

(assert (=> mapNonEmpty!33220 (= mapRest!33211 (store mapRest!33220 mapKey!33220 mapValue!33220))))

(declare-fun b!954783 () Bool)

(declare-fun e!537956 () Bool)

(assert (=> b!954783 (= e!537956 tp_is_empty!20839)))

(declare-fun mapIsEmpty!33220 () Bool)

(assert (=> mapIsEmpty!33220 mapRes!33220))

(declare-fun condMapEmpty!33220 () Bool)

(declare-fun mapDefault!33220 () ValueCell!9938)

(assert (=> mapNonEmpty!33211 (= condMapEmpty!33220 (= mapRest!33211 ((as const (Array (_ BitVec 32) ValueCell!9938)) mapDefault!33220)))))

(assert (=> mapNonEmpty!33211 (= tp!63601 (and e!537956 mapRes!33220))))

(declare-fun b!954782 () Bool)

(assert (=> b!954782 (= e!537955 tp_is_empty!20839)))

(assert (= (and mapNonEmpty!33211 condMapEmpty!33220) mapIsEmpty!33220))

(assert (= (and mapNonEmpty!33211 (not condMapEmpty!33220)) mapNonEmpty!33220))

(assert (= (and mapNonEmpty!33220 ((_ is ValueCellFull!9938) mapValue!33220)) b!954782))

(assert (= (and mapNonEmpty!33211 ((_ is ValueCellFull!9938) mapDefault!33220)) b!954783))

(declare-fun m!887085 () Bool)

(assert (=> mapNonEmpty!33220 m!887085))

(check-sat (not b!954775) (not b!954772) (not bm!41714) (not mapNonEmpty!33220) tp_is_empty!20839)
(check-sat)
