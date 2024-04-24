; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81952 () Bool)

(assert start!81952)

(declare-fun mapNonEmpty!33223 () Bool)

(declare-fun mapRes!33223 () Bool)

(declare-fun tp!63613 () Bool)

(declare-fun e!537970 () Bool)

(assert (=> mapNonEmpty!33223 (= mapRes!33223 (and tp!63613 e!537970))))

(declare-fun mapKey!33223 () (_ BitVec 32))

(declare-datatypes ((V!32777 0))(
  ( (V!32778 (val!10473 Int)) )
))
(declare-datatypes ((ValueCell!9941 0))(
  ( (ValueCellFull!9941 (v!13024 V!32777)) (EmptyCell!9941) )
))
(declare-datatypes ((array!57846 0))(
  ( (array!57847 (arr!27800 (Array (_ BitVec 32) ValueCell!9941)) (size!28280 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57846)

(declare-fun mapValue!33223 () ValueCell!9941)

(declare-fun mapRest!33223 () (Array (_ BitVec 32) ValueCell!9941))

(assert (=> mapNonEmpty!33223 (= (arr!27800 _values!1197) (store mapRest!33223 mapKey!33223 mapValue!33223))))

(declare-fun b!954798 () Bool)

(declare-fun res!639132 () Bool)

(declare-fun e!537969 () Bool)

(assert (=> b!954798 (=> (not res!639132) (not e!537969))))

(declare-datatypes ((array!57848 0))(
  ( (array!57849 (arr!27801 (Array (_ BitVec 32) (_ BitVec 64))) (size!28281 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57848)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57848 (_ BitVec 32)) Bool)

(assert (=> b!954798 (= res!639132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954799 () Bool)

(declare-datatypes ((List!19362 0))(
  ( (Nil!19359) (Cons!19358 (h!20526 (_ BitVec 64)) (t!27715 List!19362)) )
))
(declare-fun noDuplicate!1367 (List!19362) Bool)

(assert (=> b!954799 (= e!537969 (not (noDuplicate!1367 Nil!19359)))))

(declare-fun mapIsEmpty!33223 () Bool)

(assert (=> mapIsEmpty!33223 mapRes!33223))

(declare-fun b!954800 () Bool)

(declare-fun e!537968 () Bool)

(declare-fun tp_is_empty!20845 () Bool)

(assert (=> b!954800 (= e!537968 tp_is_empty!20845)))

(declare-fun res!639130 () Bool)

(assert (=> start!81952 (=> (not res!639130) (not e!537969))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81952 (= res!639130 (validMask!0 mask!1823))))

(assert (=> start!81952 e!537969))

(assert (=> start!81952 true))

(declare-fun e!537971 () Bool)

(declare-fun array_inv!21653 (array!57846) Bool)

(assert (=> start!81952 (and (array_inv!21653 _values!1197) e!537971)))

(declare-fun array_inv!21654 (array!57848) Bool)

(assert (=> start!81952 (array_inv!21654 _keys!1441)))

(declare-fun b!954801 () Bool)

(assert (=> b!954801 (= e!537971 (and e!537968 mapRes!33223))))

(declare-fun condMapEmpty!33223 () Bool)

(declare-fun mapDefault!33223 () ValueCell!9941)

(assert (=> b!954801 (= condMapEmpty!33223 (= (arr!27800 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9941)) mapDefault!33223)))))

(declare-fun b!954802 () Bool)

(assert (=> b!954802 (= e!537970 tp_is_empty!20845)))

(declare-fun b!954803 () Bool)

(declare-fun res!639131 () Bool)

(assert (=> b!954803 (=> (not res!639131) (not e!537969))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954803 (= res!639131 (and (= (size!28280 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28281 _keys!1441) (size!28280 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954804 () Bool)

(declare-fun res!639129 () Bool)

(assert (=> b!954804 (=> (not res!639129) (not e!537969))))

(assert (=> b!954804 (= res!639129 (and (bvsle #b00000000000000000000000000000000 (size!28281 _keys!1441)) (bvslt (size!28281 _keys!1441) #b01111111111111111111111111111111)))))

(assert (= (and start!81952 res!639130) b!954803))

(assert (= (and b!954803 res!639131) b!954798))

(assert (= (and b!954798 res!639132) b!954804))

(assert (= (and b!954804 res!639129) b!954799))

(assert (= (and b!954801 condMapEmpty!33223) mapIsEmpty!33223))

(assert (= (and b!954801 (not condMapEmpty!33223)) mapNonEmpty!33223))

(get-info :version)

(assert (= (and mapNonEmpty!33223 ((_ is ValueCellFull!9941) mapValue!33223)) b!954802))

(assert (= (and b!954801 ((_ is ValueCellFull!9941) mapDefault!33223)) b!954800))

(assert (= start!81952 b!954801))

(declare-fun m!887087 () Bool)

(assert (=> mapNonEmpty!33223 m!887087))

(declare-fun m!887089 () Bool)

(assert (=> b!954798 m!887089))

(declare-fun m!887091 () Bool)

(assert (=> b!954799 m!887091))

(declare-fun m!887093 () Bool)

(assert (=> start!81952 m!887093))

(declare-fun m!887095 () Bool)

(assert (=> start!81952 m!887095))

(declare-fun m!887097 () Bool)

(assert (=> start!81952 m!887097))

(check-sat (not b!954798) (not b!954799) (not start!81952) (not mapNonEmpty!33223) tp_is_empty!20845)
(check-sat)
(get-model)

(declare-fun d!116067 () Bool)

(assert (=> d!116067 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81952 d!116067))

(declare-fun d!116069 () Bool)

(assert (=> d!116069 (= (array_inv!21653 _values!1197) (bvsge (size!28280 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81952 d!116069))

(declare-fun d!116071 () Bool)

(assert (=> d!116071 (= (array_inv!21654 _keys!1441) (bvsge (size!28281 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81952 d!116071))

(declare-fun bm!41717 () Bool)

(declare-fun call!41720 () Bool)

(assert (=> bm!41717 (= call!41720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun b!954855 () Bool)

(declare-fun e!538009 () Bool)

(assert (=> b!954855 (= e!538009 call!41720)))

(declare-fun b!954856 () Bool)

(declare-fun e!538008 () Bool)

(assert (=> b!954856 (= e!538008 call!41720)))

(declare-fun b!954857 () Bool)

(declare-fun e!538010 () Bool)

(assert (=> b!954857 (= e!538010 e!538008)))

(declare-fun c!100145 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954857 (= c!100145 (validKeyInArray!0 (select (arr!27801 _keys!1441) #b00000000000000000000000000000000)))))

(declare-fun b!954858 () Bool)

(assert (=> b!954858 (= e!538008 e!538009)))

(declare-fun lt!430206 () (_ BitVec 64))

(assert (=> b!954858 (= lt!430206 (select (arr!27801 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32068 0))(
  ( (Unit!32069) )
))
(declare-fun lt!430208 () Unit!32068)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57848 (_ BitVec 64) (_ BitVec 32)) Unit!32068)

(assert (=> b!954858 (= lt!430208 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!430206 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!954858 (arrayContainsKey!0 _keys!1441 lt!430206 #b00000000000000000000000000000000)))

(declare-fun lt!430207 () Unit!32068)

(assert (=> b!954858 (= lt!430207 lt!430208)))

(declare-fun res!639162 () Bool)

(declare-datatypes ((SeekEntryResult!9141 0))(
  ( (MissingZero!9141 (index!38935 (_ BitVec 32))) (Found!9141 (index!38936 (_ BitVec 32))) (Intermediate!9141 (undefined!9953 Bool) (index!38937 (_ BitVec 32)) (x!82107 (_ BitVec 32))) (Undefined!9141) (MissingVacant!9141 (index!38938 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57848 (_ BitVec 32)) SeekEntryResult!9141)

(assert (=> b!954858 (= res!639162 (= (seekEntryOrOpen!0 (select (arr!27801 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9141 #b00000000000000000000000000000000)))))

(assert (=> b!954858 (=> (not res!639162) (not e!538009))))

(declare-fun d!116073 () Bool)

(declare-fun res!639161 () Bool)

(assert (=> d!116073 (=> res!639161 e!538010)))

(assert (=> d!116073 (= res!639161 (bvsge #b00000000000000000000000000000000 (size!28281 _keys!1441)))))

(assert (=> d!116073 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!538010)))

(assert (= (and d!116073 (not res!639161)) b!954857))

(assert (= (and b!954857 c!100145) b!954858))

(assert (= (and b!954857 (not c!100145)) b!954856))

(assert (= (and b!954858 res!639162) b!954855))

(assert (= (or b!954855 b!954856) bm!41717))

(declare-fun m!887123 () Bool)

(assert (=> bm!41717 m!887123))

(declare-fun m!887125 () Bool)

(assert (=> b!954857 m!887125))

(assert (=> b!954857 m!887125))

(declare-fun m!887127 () Bool)

(assert (=> b!954857 m!887127))

(assert (=> b!954858 m!887125))

(declare-fun m!887129 () Bool)

(assert (=> b!954858 m!887129))

(declare-fun m!887131 () Bool)

(assert (=> b!954858 m!887131))

(assert (=> b!954858 m!887125))

(declare-fun m!887133 () Bool)

(assert (=> b!954858 m!887133))

(assert (=> b!954798 d!116073))

(declare-fun d!116075 () Bool)

(declare-fun res!639167 () Bool)

(declare-fun e!538015 () Bool)

(assert (=> d!116075 (=> res!639167 e!538015)))

(assert (=> d!116075 (= res!639167 ((_ is Nil!19359) Nil!19359))))

(assert (=> d!116075 (= (noDuplicate!1367 Nil!19359) e!538015)))

(declare-fun b!954863 () Bool)

(declare-fun e!538016 () Bool)

(assert (=> b!954863 (= e!538015 e!538016)))

(declare-fun res!639168 () Bool)

(assert (=> b!954863 (=> (not res!639168) (not e!538016))))

(declare-fun contains!5260 (List!19362 (_ BitVec 64)) Bool)

(assert (=> b!954863 (= res!639168 (not (contains!5260 (t!27715 Nil!19359) (h!20526 Nil!19359))))))

(declare-fun b!954864 () Bool)

(assert (=> b!954864 (= e!538016 (noDuplicate!1367 (t!27715 Nil!19359)))))

(assert (= (and d!116075 (not res!639167)) b!954863))

(assert (= (and b!954863 res!639168) b!954864))

(declare-fun m!887135 () Bool)

(assert (=> b!954863 m!887135))

(declare-fun m!887137 () Bool)

(assert (=> b!954864 m!887137))

(assert (=> b!954799 d!116075))

(declare-fun mapIsEmpty!33232 () Bool)

(declare-fun mapRes!33232 () Bool)

(assert (=> mapIsEmpty!33232 mapRes!33232))

(declare-fun b!954871 () Bool)

(declare-fun e!538022 () Bool)

(assert (=> b!954871 (= e!538022 tp_is_empty!20845)))

(declare-fun mapNonEmpty!33232 () Bool)

(declare-fun tp!63622 () Bool)

(assert (=> mapNonEmpty!33232 (= mapRes!33232 (and tp!63622 e!538022))))

(declare-fun mapKey!33232 () (_ BitVec 32))

(declare-fun mapValue!33232 () ValueCell!9941)

(declare-fun mapRest!33232 () (Array (_ BitVec 32) ValueCell!9941))

(assert (=> mapNonEmpty!33232 (= mapRest!33223 (store mapRest!33232 mapKey!33232 mapValue!33232))))

(declare-fun b!954872 () Bool)

(declare-fun e!538021 () Bool)

(assert (=> b!954872 (= e!538021 tp_is_empty!20845)))

(declare-fun condMapEmpty!33232 () Bool)

(declare-fun mapDefault!33232 () ValueCell!9941)

(assert (=> mapNonEmpty!33223 (= condMapEmpty!33232 (= mapRest!33223 ((as const (Array (_ BitVec 32) ValueCell!9941)) mapDefault!33232)))))

(assert (=> mapNonEmpty!33223 (= tp!63613 (and e!538021 mapRes!33232))))

(assert (= (and mapNonEmpty!33223 condMapEmpty!33232) mapIsEmpty!33232))

(assert (= (and mapNonEmpty!33223 (not condMapEmpty!33232)) mapNonEmpty!33232))

(assert (= (and mapNonEmpty!33232 ((_ is ValueCellFull!9941) mapValue!33232)) b!954871))

(assert (= (and mapNonEmpty!33223 ((_ is ValueCellFull!9941) mapDefault!33232)) b!954872))

(declare-fun m!887139 () Bool)

(assert (=> mapNonEmpty!33232 m!887139))

(check-sat (not mapNonEmpty!33232) tp_is_empty!20845 (not b!954858) (not b!954863) (not b!954864) (not bm!41717) (not b!954857))
(check-sat)
