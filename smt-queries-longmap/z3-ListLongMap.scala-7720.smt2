; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96978 () Bool)

(assert start!96978)

(declare-fun mapNonEmpty!42742 () Bool)

(declare-fun mapRes!42742 () Bool)

(declare-fun tp!81662 () Bool)

(declare-fun e!629688 () Bool)

(assert (=> mapNonEmpty!42742 (= mapRes!42742 (and tp!81662 e!629688))))

(declare-fun mapKey!42742 () (_ BitVec 32))

(declare-datatypes ((V!41521 0))(
  ( (V!41522 (val!13704 Int)) )
))
(declare-datatypes ((ValueCell!12938 0))(
  ( (ValueCellFull!12938 (v!16334 V!41521)) (EmptyCell!12938) )
))
(declare-fun mapValue!42742 () ValueCell!12938)

(declare-datatypes ((array!71422 0))(
  ( (array!71423 (arr!34370 (Array (_ BitVec 32) ValueCell!12938)) (size!34908 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71422)

(declare-fun mapRest!42742 () (Array (_ BitVec 32) ValueCell!12938))

(assert (=> mapNonEmpty!42742 (= (arr!34370 _values!996) (store mapRest!42742 mapKey!42742 mapValue!42742))))

(declare-fun b!1103122 () Bool)

(declare-fun res!735985 () Bool)

(declare-fun e!629689 () Bool)

(assert (=> b!1103122 (=> (not res!735985) (not e!629689))))

(declare-datatypes ((array!71424 0))(
  ( (array!71425 (arr!34371 (Array (_ BitVec 32) (_ BitVec 64))) (size!34909 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71424)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1103122 (= res!735985 (and (= (size!34908 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34909 _keys!1208) (size!34908 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103123 () Bool)

(declare-fun res!735983 () Bool)

(assert (=> b!1103123 (=> (not res!735983) (not e!629689))))

(assert (=> b!1103123 (= res!735983 (and (bvsle #b00000000000000000000000000000000 (size!34909 _keys!1208)) (bvslt (size!34909 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103124 () Bool)

(declare-fun e!629685 () Bool)

(declare-fun tp_is_empty!27295 () Bool)

(assert (=> b!1103124 (= e!629685 tp_is_empty!27295)))

(declare-fun mapIsEmpty!42742 () Bool)

(assert (=> mapIsEmpty!42742 mapRes!42742))

(declare-fun b!1103126 () Bool)

(declare-datatypes ((List!24067 0))(
  ( (Nil!24064) (Cons!24063 (h!25272 (_ BitVec 64)) (t!34323 List!24067)) )
))
(declare-fun noDuplicate!1592 (List!24067) Bool)

(assert (=> b!1103126 (= e!629689 (not (noDuplicate!1592 Nil!24064)))))

(declare-fun b!1103127 () Bool)

(declare-fun res!735981 () Bool)

(assert (=> b!1103127 (=> (not res!735981) (not e!629689))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71424 (_ BitVec 32)) Bool)

(assert (=> b!1103127 (= res!735981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!735982 () Bool)

(assert (=> start!96978 (=> (not res!735982) (not e!629689))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!96978 (= res!735982 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34909 _keys!1208))))))

(assert (=> start!96978 e!629689))

(declare-fun array_inv!26506 (array!71424) Bool)

(assert (=> start!96978 (array_inv!26506 _keys!1208)))

(assert (=> start!96978 true))

(declare-fun e!629687 () Bool)

(declare-fun array_inv!26507 (array!71422) Bool)

(assert (=> start!96978 (and (array_inv!26507 _values!996) e!629687)))

(declare-fun b!1103125 () Bool)

(assert (=> b!1103125 (= e!629687 (and e!629685 mapRes!42742))))

(declare-fun condMapEmpty!42742 () Bool)

(declare-fun mapDefault!42742 () ValueCell!12938)

(assert (=> b!1103125 (= condMapEmpty!42742 (= (arr!34370 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12938)) mapDefault!42742)))))

(declare-fun b!1103128 () Bool)

(declare-fun res!735984 () Bool)

(assert (=> b!1103128 (=> (not res!735984) (not e!629689))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103128 (= res!735984 (validMask!0 mask!1564))))

(declare-fun b!1103129 () Bool)

(assert (=> b!1103129 (= e!629688 tp_is_empty!27295)))

(assert (= (and start!96978 res!735982) b!1103128))

(assert (= (and b!1103128 res!735984) b!1103122))

(assert (= (and b!1103122 res!735985) b!1103127))

(assert (= (and b!1103127 res!735981) b!1103123))

(assert (= (and b!1103123 res!735983) b!1103126))

(assert (= (and b!1103125 condMapEmpty!42742) mapIsEmpty!42742))

(assert (= (and b!1103125 (not condMapEmpty!42742)) mapNonEmpty!42742))

(get-info :version)

(assert (= (and mapNonEmpty!42742 ((_ is ValueCellFull!12938) mapValue!42742)) b!1103129))

(assert (= (and b!1103125 ((_ is ValueCellFull!12938) mapDefault!42742)) b!1103124))

(assert (= start!96978 b!1103125))

(declare-fun m!1022877 () Bool)

(assert (=> b!1103127 m!1022877))

(declare-fun m!1022879 () Bool)

(assert (=> mapNonEmpty!42742 m!1022879))

(declare-fun m!1022881 () Bool)

(assert (=> b!1103128 m!1022881))

(declare-fun m!1022883 () Bool)

(assert (=> b!1103126 m!1022883))

(declare-fun m!1022885 () Bool)

(assert (=> start!96978 m!1022885))

(declare-fun m!1022887 () Bool)

(assert (=> start!96978 m!1022887))

(check-sat (not mapNonEmpty!42742) (not start!96978) (not b!1103128) tp_is_empty!27295 (not b!1103127) (not b!1103126))
(check-sat)
(get-model)

(declare-fun d!130657 () Bool)

(declare-fun res!736020 () Bool)

(declare-fun e!629728 () Bool)

(assert (=> d!130657 (=> res!736020 e!629728)))

(assert (=> d!130657 (= res!736020 (bvsge #b00000000000000000000000000000000 (size!34909 _keys!1208)))))

(assert (=> d!130657 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!629728)))

(declare-fun b!1103186 () Bool)

(declare-fun e!629727 () Bool)

(declare-fun call!46299 () Bool)

(assert (=> b!1103186 (= e!629727 call!46299)))

(declare-fun b!1103187 () Bool)

(declare-fun e!629726 () Bool)

(assert (=> b!1103187 (= e!629728 e!629726)))

(declare-fun c!108937 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103187 (= c!108937 (validKeyInArray!0 (select (arr!34371 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1103188 () Bool)

(assert (=> b!1103188 (= e!629726 call!46299)))

(declare-fun b!1103189 () Bool)

(assert (=> b!1103189 (= e!629726 e!629727)))

(declare-fun lt!494859 () (_ BitVec 64))

(assert (=> b!1103189 (= lt!494859 (select (arr!34371 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36063 0))(
  ( (Unit!36064) )
))
(declare-fun lt!494858 () Unit!36063)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71424 (_ BitVec 64) (_ BitVec 32)) Unit!36063)

(assert (=> b!1103189 (= lt!494858 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!494859 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71424 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103189 (arrayContainsKey!0 _keys!1208 lt!494859 #b00000000000000000000000000000000)))

(declare-fun lt!494860 () Unit!36063)

(assert (=> b!1103189 (= lt!494860 lt!494858)))

(declare-fun res!736021 () Bool)

(declare-datatypes ((SeekEntryResult!9918 0))(
  ( (MissingZero!9918 (index!42043 (_ BitVec 32))) (Found!9918 (index!42044 (_ BitVec 32))) (Intermediate!9918 (undefined!10730 Bool) (index!42045 (_ BitVec 32)) (x!99234 (_ BitVec 32))) (Undefined!9918) (MissingVacant!9918 (index!42046 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71424 (_ BitVec 32)) SeekEntryResult!9918)

(assert (=> b!1103189 (= res!736021 (= (seekEntryOrOpen!0 (select (arr!34371 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9918 #b00000000000000000000000000000000)))))

(assert (=> b!1103189 (=> (not res!736021) (not e!629727))))

(declare-fun bm!46296 () Bool)

(assert (=> bm!46296 (= call!46299 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(assert (= (and d!130657 (not res!736020)) b!1103187))

(assert (= (and b!1103187 c!108937) b!1103189))

(assert (= (and b!1103187 (not c!108937)) b!1103188))

(assert (= (and b!1103189 res!736021) b!1103186))

(assert (= (or b!1103186 b!1103188) bm!46296))

(declare-fun m!1022913 () Bool)

(assert (=> b!1103187 m!1022913))

(assert (=> b!1103187 m!1022913))

(declare-fun m!1022915 () Bool)

(assert (=> b!1103187 m!1022915))

(assert (=> b!1103189 m!1022913))

(declare-fun m!1022917 () Bool)

(assert (=> b!1103189 m!1022917))

(declare-fun m!1022919 () Bool)

(assert (=> b!1103189 m!1022919))

(assert (=> b!1103189 m!1022913))

(declare-fun m!1022921 () Bool)

(assert (=> b!1103189 m!1022921))

(declare-fun m!1022923 () Bool)

(assert (=> bm!46296 m!1022923))

(assert (=> b!1103127 d!130657))

(declare-fun d!130659 () Bool)

(assert (=> d!130659 (= (array_inv!26506 _keys!1208) (bvsge (size!34909 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!96978 d!130659))

(declare-fun d!130661 () Bool)

(assert (=> d!130661 (= (array_inv!26507 _values!996) (bvsge (size!34908 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!96978 d!130661))

(declare-fun d!130663 () Bool)

(declare-fun res!736026 () Bool)

(declare-fun e!629733 () Bool)

(assert (=> d!130663 (=> res!736026 e!629733)))

(assert (=> d!130663 (= res!736026 ((_ is Nil!24064) Nil!24064))))

(assert (=> d!130663 (= (noDuplicate!1592 Nil!24064) e!629733)))

(declare-fun b!1103194 () Bool)

(declare-fun e!629734 () Bool)

(assert (=> b!1103194 (= e!629733 e!629734)))

(declare-fun res!736027 () Bool)

(assert (=> b!1103194 (=> (not res!736027) (not e!629734))))

(declare-fun contains!6381 (List!24067 (_ BitVec 64)) Bool)

(assert (=> b!1103194 (= res!736027 (not (contains!6381 (t!34323 Nil!24064) (h!25272 Nil!24064))))))

(declare-fun b!1103195 () Bool)

(assert (=> b!1103195 (= e!629734 (noDuplicate!1592 (t!34323 Nil!24064)))))

(assert (= (and d!130663 (not res!736026)) b!1103194))

(assert (= (and b!1103194 res!736027) b!1103195))

(declare-fun m!1022925 () Bool)

(assert (=> b!1103194 m!1022925))

(declare-fun m!1022927 () Bool)

(assert (=> b!1103195 m!1022927))

(assert (=> b!1103126 d!130663))

(declare-fun d!130665 () Bool)

(assert (=> d!130665 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1103128 d!130665))

(declare-fun mapNonEmpty!42751 () Bool)

(declare-fun mapRes!42751 () Bool)

(declare-fun tp!81671 () Bool)

(declare-fun e!629740 () Bool)

(assert (=> mapNonEmpty!42751 (= mapRes!42751 (and tp!81671 e!629740))))

(declare-fun mapRest!42751 () (Array (_ BitVec 32) ValueCell!12938))

(declare-fun mapKey!42751 () (_ BitVec 32))

(declare-fun mapValue!42751 () ValueCell!12938)

(assert (=> mapNonEmpty!42751 (= mapRest!42742 (store mapRest!42751 mapKey!42751 mapValue!42751))))

(declare-fun condMapEmpty!42751 () Bool)

(declare-fun mapDefault!42751 () ValueCell!12938)

(assert (=> mapNonEmpty!42742 (= condMapEmpty!42751 (= mapRest!42742 ((as const (Array (_ BitVec 32) ValueCell!12938)) mapDefault!42751)))))

(declare-fun e!629739 () Bool)

(assert (=> mapNonEmpty!42742 (= tp!81662 (and e!629739 mapRes!42751))))

(declare-fun mapIsEmpty!42751 () Bool)

(assert (=> mapIsEmpty!42751 mapRes!42751))

(declare-fun b!1103203 () Bool)

(assert (=> b!1103203 (= e!629739 tp_is_empty!27295)))

(declare-fun b!1103202 () Bool)

(assert (=> b!1103202 (= e!629740 tp_is_empty!27295)))

(assert (= (and mapNonEmpty!42742 condMapEmpty!42751) mapIsEmpty!42751))

(assert (= (and mapNonEmpty!42742 (not condMapEmpty!42751)) mapNonEmpty!42751))

(assert (= (and mapNonEmpty!42751 ((_ is ValueCellFull!12938) mapValue!42751)) b!1103202))

(assert (= (and mapNonEmpty!42742 ((_ is ValueCellFull!12938) mapDefault!42751)) b!1103203))

(declare-fun m!1022929 () Bool)

(assert (=> mapNonEmpty!42751 m!1022929))

(check-sat (not b!1103195) (not b!1103187) (not bm!46296) (not b!1103194) tp_is_empty!27295 (not mapNonEmpty!42751) (not b!1103189))
(check-sat)
