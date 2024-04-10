; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82426 () Bool)

(assert start!82426)

(declare-fun b!961018 () Bool)

(declare-fun res!643251 () Bool)

(declare-fun e!541775 () Bool)

(assert (=> b!961018 (=> (not res!643251) (not e!541775))))

(declare-datatypes ((array!58887 0))(
  ( (array!58888 (arr!28316 (Array (_ BitVec 32) (_ BitVec 64))) (size!28795 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58887)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58887 (_ BitVec 32)) Bool)

(assert (=> b!961018 (= res!643251 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961019 () Bool)

(assert (=> b!961019 (= e!541775 (bvsgt #b00000000000000000000000000000000 (size!28795 _keys!1686)))))

(declare-fun b!961020 () Bool)

(declare-fun e!541773 () Bool)

(declare-fun tp_is_empty!21399 () Bool)

(assert (=> b!961020 (= e!541773 tp_is_empty!21399)))

(declare-fun b!961021 () Bool)

(declare-fun e!541774 () Bool)

(assert (=> b!961021 (= e!541774 tp_is_empty!21399)))

(declare-fun mapNonEmpty!34081 () Bool)

(declare-fun mapRes!34081 () Bool)

(declare-fun tp!65010 () Bool)

(assert (=> mapNonEmpty!34081 (= mapRes!34081 (and tp!65010 e!541774))))

(declare-datatypes ((V!33515 0))(
  ( (V!33516 (val!10750 Int)) )
))
(declare-datatypes ((ValueCell!10218 0))(
  ( (ValueCellFull!10218 (v!13307 V!33515)) (EmptyCell!10218) )
))
(declare-fun mapValue!34081 () ValueCell!10218)

(declare-fun mapRest!34081 () (Array (_ BitVec 32) ValueCell!10218))

(declare-fun mapKey!34081 () (_ BitVec 32))

(declare-datatypes ((array!58889 0))(
  ( (array!58890 (arr!28317 (Array (_ BitVec 32) ValueCell!10218)) (size!28796 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58889)

(assert (=> mapNonEmpty!34081 (= (arr!28317 _values!1400) (store mapRest!34081 mapKey!34081 mapValue!34081))))

(declare-fun b!961022 () Bool)

(declare-fun e!541772 () Bool)

(assert (=> b!961022 (= e!541772 (and e!541773 mapRes!34081))))

(declare-fun condMapEmpty!34081 () Bool)

(declare-fun mapDefault!34081 () ValueCell!10218)

(assert (=> b!961022 (= condMapEmpty!34081 (= (arr!28317 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10218)) mapDefault!34081)))))

(declare-fun res!643253 () Bool)

(assert (=> start!82426 (=> (not res!643253) (not e!541775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82426 (= res!643253 (validMask!0 mask!2110))))

(assert (=> start!82426 e!541775))

(assert (=> start!82426 true))

(declare-fun array_inv!21941 (array!58889) Bool)

(assert (=> start!82426 (and (array_inv!21941 _values!1400) e!541772)))

(declare-fun array_inv!21942 (array!58887) Bool)

(assert (=> start!82426 (array_inv!21942 _keys!1686)))

(declare-fun b!961023 () Bool)

(declare-fun res!643252 () Bool)

(assert (=> b!961023 (=> (not res!643252) (not e!541775))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961023 (= res!643252 (and (= (size!28796 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28795 _keys!1686) (size!28796 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34081 () Bool)

(assert (=> mapIsEmpty!34081 mapRes!34081))

(assert (= (and start!82426 res!643253) b!961023))

(assert (= (and b!961023 res!643252) b!961018))

(assert (= (and b!961018 res!643251) b!961019))

(assert (= (and b!961022 condMapEmpty!34081) mapIsEmpty!34081))

(assert (= (and b!961022 (not condMapEmpty!34081)) mapNonEmpty!34081))

(get-info :version)

(assert (= (and mapNonEmpty!34081 ((_ is ValueCellFull!10218) mapValue!34081)) b!961021))

(assert (= (and b!961022 ((_ is ValueCellFull!10218) mapDefault!34081)) b!961020))

(assert (= start!82426 b!961022))

(declare-fun m!891125 () Bool)

(assert (=> b!961018 m!891125))

(declare-fun m!891127 () Bool)

(assert (=> mapNonEmpty!34081 m!891127))

(declare-fun m!891129 () Bool)

(assert (=> start!82426 m!891129))

(declare-fun m!891131 () Bool)

(assert (=> start!82426 m!891131))

(declare-fun m!891133 () Bool)

(assert (=> start!82426 m!891133))

(check-sat (not b!961018) (not start!82426) (not mapNonEmpty!34081) tp_is_empty!21399)
(check-sat)
(get-model)

(declare-fun b!961050 () Bool)

(declare-fun e!541798 () Bool)

(declare-fun call!41720 () Bool)

(assert (=> b!961050 (= e!541798 call!41720)))

(declare-fun b!961051 () Bool)

(declare-fun e!541800 () Bool)

(declare-fun e!541799 () Bool)

(assert (=> b!961051 (= e!541800 e!541799)))

(declare-fun c!99908 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!961051 (= c!99908 (validKeyInArray!0 (select (arr!28316 _keys!1686) #b00000000000000000000000000000000)))))

(declare-fun d!116021 () Bool)

(declare-fun res!643268 () Bool)

(assert (=> d!116021 (=> res!643268 e!541800)))

(assert (=> d!116021 (= res!643268 (bvsge #b00000000000000000000000000000000 (size!28795 _keys!1686)))))

(assert (=> d!116021 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!541800)))

(declare-fun b!961052 () Bool)

(assert (=> b!961052 (= e!541799 e!541798)))

(declare-fun lt!430705 () (_ BitVec 64))

(assert (=> b!961052 (= lt!430705 (select (arr!28316 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32205 0))(
  ( (Unit!32206) )
))
(declare-fun lt!430707 () Unit!32205)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58887 (_ BitVec 64) (_ BitVec 32)) Unit!32205)

(assert (=> b!961052 (= lt!430707 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!430705 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!961052 (arrayContainsKey!0 _keys!1686 lt!430705 #b00000000000000000000000000000000)))

(declare-fun lt!430706 () Unit!32205)

(assert (=> b!961052 (= lt!430706 lt!430707)))

(declare-fun res!643267 () Bool)

(declare-datatypes ((SeekEntryResult!9193 0))(
  ( (MissingZero!9193 (index!39143 (_ BitVec 32))) (Found!9193 (index!39144 (_ BitVec 32))) (Intermediate!9193 (undefined!10005 Bool) (index!39145 (_ BitVec 32)) (x!82907 (_ BitVec 32))) (Undefined!9193) (MissingVacant!9193 (index!39146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58887 (_ BitVec 32)) SeekEntryResult!9193)

(assert (=> b!961052 (= res!643267 (= (seekEntryOrOpen!0 (select (arr!28316 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9193 #b00000000000000000000000000000000)))))

(assert (=> b!961052 (=> (not res!643267) (not e!541798))))

(declare-fun bm!41717 () Bool)

(assert (=> bm!41717 (= call!41720 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun b!961053 () Bool)

(assert (=> b!961053 (= e!541799 call!41720)))

(assert (= (and d!116021 (not res!643268)) b!961051))

(assert (= (and b!961051 c!99908) b!961052))

(assert (= (and b!961051 (not c!99908)) b!961053))

(assert (= (and b!961052 res!643267) b!961050))

(assert (= (or b!961050 b!961053) bm!41717))

(declare-fun m!891145 () Bool)

(assert (=> b!961051 m!891145))

(assert (=> b!961051 m!891145))

(declare-fun m!891147 () Bool)

(assert (=> b!961051 m!891147))

(assert (=> b!961052 m!891145))

(declare-fun m!891149 () Bool)

(assert (=> b!961052 m!891149))

(declare-fun m!891151 () Bool)

(assert (=> b!961052 m!891151))

(assert (=> b!961052 m!891145))

(declare-fun m!891153 () Bool)

(assert (=> b!961052 m!891153))

(declare-fun m!891155 () Bool)

(assert (=> bm!41717 m!891155))

(assert (=> b!961018 d!116021))

(declare-fun d!116023 () Bool)

(assert (=> d!116023 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82426 d!116023))

(declare-fun d!116025 () Bool)

(assert (=> d!116025 (= (array_inv!21941 _values!1400) (bvsge (size!28796 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82426 d!116025))

(declare-fun d!116027 () Bool)

(assert (=> d!116027 (= (array_inv!21942 _keys!1686) (bvsge (size!28795 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82426 d!116027))

(declare-fun mapNonEmpty!34087 () Bool)

(declare-fun mapRes!34087 () Bool)

(declare-fun tp!65016 () Bool)

(declare-fun e!541806 () Bool)

(assert (=> mapNonEmpty!34087 (= mapRes!34087 (and tp!65016 e!541806))))

(declare-fun mapValue!34087 () ValueCell!10218)

(declare-fun mapRest!34087 () (Array (_ BitVec 32) ValueCell!10218))

(declare-fun mapKey!34087 () (_ BitVec 32))

(assert (=> mapNonEmpty!34087 (= mapRest!34081 (store mapRest!34087 mapKey!34087 mapValue!34087))))

(declare-fun mapIsEmpty!34087 () Bool)

(assert (=> mapIsEmpty!34087 mapRes!34087))

(declare-fun b!961060 () Bool)

(assert (=> b!961060 (= e!541806 tp_is_empty!21399)))

(declare-fun b!961061 () Bool)

(declare-fun e!541805 () Bool)

(assert (=> b!961061 (= e!541805 tp_is_empty!21399)))

(declare-fun condMapEmpty!34087 () Bool)

(declare-fun mapDefault!34087 () ValueCell!10218)

(assert (=> mapNonEmpty!34081 (= condMapEmpty!34087 (= mapRest!34081 ((as const (Array (_ BitVec 32) ValueCell!10218)) mapDefault!34087)))))

(assert (=> mapNonEmpty!34081 (= tp!65010 (and e!541805 mapRes!34087))))

(assert (= (and mapNonEmpty!34081 condMapEmpty!34087) mapIsEmpty!34087))

(assert (= (and mapNonEmpty!34081 (not condMapEmpty!34087)) mapNonEmpty!34087))

(assert (= (and mapNonEmpty!34087 ((_ is ValueCellFull!10218) mapValue!34087)) b!961060))

(assert (= (and mapNonEmpty!34081 ((_ is ValueCellFull!10218) mapDefault!34087)) b!961061))

(declare-fun m!891157 () Bool)

(assert (=> mapNonEmpty!34087 m!891157))

(check-sat (not mapNonEmpty!34087) (not bm!41717) (not b!961051) (not b!961052) tp_is_empty!21399)
(check-sat)
