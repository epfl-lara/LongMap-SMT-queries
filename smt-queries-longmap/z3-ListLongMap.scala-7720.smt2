; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96986 () Bool)

(assert start!96986)

(declare-fun b!1103299 () Bool)

(declare-fun res!736066 () Bool)

(declare-fun e!629797 () Bool)

(assert (=> b!1103299 (=> (not res!736066) (not e!629797))))

(declare-datatypes ((array!71515 0))(
  ( (array!71516 (arr!34416 (Array (_ BitVec 32) (_ BitVec 64))) (size!34952 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71515)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41523 0))(
  ( (V!41524 (val!13705 Int)) )
))
(declare-datatypes ((ValueCell!12939 0))(
  ( (ValueCellFull!12939 (v!16336 V!41523)) (EmptyCell!12939) )
))
(declare-datatypes ((array!71517 0))(
  ( (array!71518 (arr!34417 (Array (_ BitVec 32) ValueCell!12939)) (size!34953 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71517)

(assert (=> b!1103299 (= res!736066 (and (= (size!34953 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34952 _keys!1208) (size!34953 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103300 () Bool)

(declare-fun res!736067 () Bool)

(assert (=> b!1103300 (=> (not res!736067) (not e!629797))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71515 (_ BitVec 32)) Bool)

(assert (=> b!1103300 (= res!736067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1103301 () Bool)

(declare-fun res!736065 () Bool)

(assert (=> b!1103301 (=> (not res!736065) (not e!629797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1103301 (= res!736065 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!42745 () Bool)

(declare-fun mapRes!42745 () Bool)

(assert (=> mapIsEmpty!42745 mapRes!42745))

(declare-fun b!1103302 () Bool)

(declare-fun res!736069 () Bool)

(assert (=> b!1103302 (=> (not res!736069) (not e!629797))))

(assert (=> b!1103302 (= res!736069 (and (bvsle #b00000000000000000000000000000000 (size!34952 _keys!1208)) (bvslt (size!34952 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun res!736068 () Bool)

(assert (=> start!96986 (=> (not res!736068) (not e!629797))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!96986 (= res!736068 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34952 _keys!1208))))))

(assert (=> start!96986 e!629797))

(declare-fun array_inv!26506 (array!71515) Bool)

(assert (=> start!96986 (array_inv!26506 _keys!1208)))

(assert (=> start!96986 true))

(declare-fun e!629793 () Bool)

(declare-fun array_inv!26507 (array!71517) Bool)

(assert (=> start!96986 (and (array_inv!26507 _values!996) e!629793)))

(declare-fun b!1103303 () Bool)

(declare-fun e!629795 () Bool)

(declare-fun tp_is_empty!27297 () Bool)

(assert (=> b!1103303 (= e!629795 tp_is_empty!27297)))

(declare-fun b!1103304 () Bool)

(declare-datatypes ((List!24036 0))(
  ( (Nil!24033) (Cons!24032 (h!25241 (_ BitVec 64)) (t!34301 List!24036)) )
))
(declare-fun noDuplicate!1582 (List!24036) Bool)

(assert (=> b!1103304 (= e!629797 (not (noDuplicate!1582 Nil!24033)))))

(declare-fun b!1103305 () Bool)

(declare-fun e!629794 () Bool)

(assert (=> b!1103305 (= e!629794 tp_is_empty!27297)))

(declare-fun mapNonEmpty!42745 () Bool)

(declare-fun tp!81665 () Bool)

(assert (=> mapNonEmpty!42745 (= mapRes!42745 (and tp!81665 e!629795))))

(declare-fun mapKey!42745 () (_ BitVec 32))

(declare-fun mapValue!42745 () ValueCell!12939)

(declare-fun mapRest!42745 () (Array (_ BitVec 32) ValueCell!12939))

(assert (=> mapNonEmpty!42745 (= (arr!34417 _values!996) (store mapRest!42745 mapKey!42745 mapValue!42745))))

(declare-fun b!1103306 () Bool)

(assert (=> b!1103306 (= e!629793 (and e!629794 mapRes!42745))))

(declare-fun condMapEmpty!42745 () Bool)

(declare-fun mapDefault!42745 () ValueCell!12939)

(assert (=> b!1103306 (= condMapEmpty!42745 (= (arr!34417 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12939)) mapDefault!42745)))))

(assert (= (and start!96986 res!736068) b!1103301))

(assert (= (and b!1103301 res!736065) b!1103299))

(assert (= (and b!1103299 res!736066) b!1103300))

(assert (= (and b!1103300 res!736067) b!1103302))

(assert (= (and b!1103302 res!736069) b!1103304))

(assert (= (and b!1103306 condMapEmpty!42745) mapIsEmpty!42745))

(assert (= (and b!1103306 (not condMapEmpty!42745)) mapNonEmpty!42745))

(get-info :version)

(assert (= (and mapNonEmpty!42745 ((_ is ValueCellFull!12939) mapValue!42745)) b!1103303))

(assert (= (and b!1103306 ((_ is ValueCellFull!12939) mapDefault!42745)) b!1103305))

(assert (= start!96986 b!1103306))

(declare-fun m!1023515 () Bool)

(assert (=> start!96986 m!1023515))

(declare-fun m!1023517 () Bool)

(assert (=> start!96986 m!1023517))

(declare-fun m!1023519 () Bool)

(assert (=> b!1103304 m!1023519))

(declare-fun m!1023521 () Bool)

(assert (=> mapNonEmpty!42745 m!1023521))

(declare-fun m!1023523 () Bool)

(assert (=> b!1103301 m!1023523))

(declare-fun m!1023525 () Bool)

(assert (=> b!1103300 m!1023525))

(check-sat (not start!96986) tp_is_empty!27297 (not b!1103301) (not mapNonEmpty!42745) (not b!1103304) (not b!1103300))
(check-sat)
(get-model)

(declare-fun bm!46319 () Bool)

(declare-fun call!46322 () Bool)

(assert (=> bm!46319 (= call!46322 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1103339 () Bool)

(declare-fun e!629821 () Bool)

(declare-fun e!629820 () Bool)

(assert (=> b!1103339 (= e!629821 e!629820)))

(declare-fun c!108976 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1103339 (= c!108976 (validKeyInArray!0 (select (arr!34416 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!130813 () Bool)

(declare-fun res!736090 () Bool)

(assert (=> d!130813 (=> res!736090 e!629821)))

(assert (=> d!130813 (= res!736090 (bvsge #b00000000000000000000000000000000 (size!34952 _keys!1208)))))

(assert (=> d!130813 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!629821)))

(declare-fun b!1103340 () Bool)

(declare-fun e!629819 () Bool)

(assert (=> b!1103340 (= e!629820 e!629819)))

(declare-fun lt!495060 () (_ BitVec 64))

(assert (=> b!1103340 (= lt!495060 (select (arr!34416 _keys!1208) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36242 0))(
  ( (Unit!36243) )
))
(declare-fun lt!495059 () Unit!36242)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71515 (_ BitVec 64) (_ BitVec 32)) Unit!36242)

(assert (=> b!1103340 (= lt!495059 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495060 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71515 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1103340 (arrayContainsKey!0 _keys!1208 lt!495060 #b00000000000000000000000000000000)))

(declare-fun lt!495058 () Unit!36242)

(assert (=> b!1103340 (= lt!495058 lt!495059)))

(declare-fun res!736089 () Bool)

(declare-datatypes ((SeekEntryResult!9919 0))(
  ( (MissingZero!9919 (index!42047 (_ BitVec 32))) (Found!9919 (index!42048 (_ BitVec 32))) (Intermediate!9919 (undefined!10731 Bool) (index!42049 (_ BitVec 32)) (x!99238 (_ BitVec 32))) (Undefined!9919) (MissingVacant!9919 (index!42050 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71515 (_ BitVec 32)) SeekEntryResult!9919)

(assert (=> b!1103340 (= res!736089 (= (seekEntryOrOpen!0 (select (arr!34416 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9919 #b00000000000000000000000000000000)))))

(assert (=> b!1103340 (=> (not res!736089) (not e!629819))))

(declare-fun b!1103341 () Bool)

(assert (=> b!1103341 (= e!629820 call!46322)))

(declare-fun b!1103342 () Bool)

(assert (=> b!1103342 (= e!629819 call!46322)))

(assert (= (and d!130813 (not res!736090)) b!1103339))

(assert (= (and b!1103339 c!108976) b!1103340))

(assert (= (and b!1103339 (not c!108976)) b!1103341))

(assert (= (and b!1103340 res!736089) b!1103342))

(assert (= (or b!1103342 b!1103341) bm!46319))

(declare-fun m!1023539 () Bool)

(assert (=> bm!46319 m!1023539))

(declare-fun m!1023541 () Bool)

(assert (=> b!1103339 m!1023541))

(assert (=> b!1103339 m!1023541))

(declare-fun m!1023543 () Bool)

(assert (=> b!1103339 m!1023543))

(assert (=> b!1103340 m!1023541))

(declare-fun m!1023545 () Bool)

(assert (=> b!1103340 m!1023545))

(declare-fun m!1023547 () Bool)

(assert (=> b!1103340 m!1023547))

(assert (=> b!1103340 m!1023541))

(declare-fun m!1023549 () Bool)

(assert (=> b!1103340 m!1023549))

(assert (=> b!1103300 d!130813))

(declare-fun d!130815 () Bool)

(assert (=> d!130815 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1103301 d!130815))

(declare-fun d!130817 () Bool)

(assert (=> d!130817 (= (array_inv!26506 _keys!1208) (bvsge (size!34952 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!96986 d!130817))

(declare-fun d!130819 () Bool)

(assert (=> d!130819 (= (array_inv!26507 _values!996) (bvsge (size!34953 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!96986 d!130819))

(declare-fun d!130821 () Bool)

(declare-fun res!736095 () Bool)

(declare-fun e!629826 () Bool)

(assert (=> d!130821 (=> res!736095 e!629826)))

(assert (=> d!130821 (= res!736095 ((_ is Nil!24033) Nil!24033))))

(assert (=> d!130821 (= (noDuplicate!1582 Nil!24033) e!629826)))

(declare-fun b!1103347 () Bool)

(declare-fun e!629827 () Bool)

(assert (=> b!1103347 (= e!629826 e!629827)))

(declare-fun res!736096 () Bool)

(assert (=> b!1103347 (=> (not res!736096) (not e!629827))))

(declare-fun contains!6411 (List!24036 (_ BitVec 64)) Bool)

(assert (=> b!1103347 (= res!736096 (not (contains!6411 (t!34301 Nil!24033) (h!25241 Nil!24033))))))

(declare-fun b!1103348 () Bool)

(assert (=> b!1103348 (= e!629827 (noDuplicate!1582 (t!34301 Nil!24033)))))

(assert (= (and d!130821 (not res!736095)) b!1103347))

(assert (= (and b!1103347 res!736096) b!1103348))

(declare-fun m!1023551 () Bool)

(assert (=> b!1103347 m!1023551))

(declare-fun m!1023553 () Bool)

(assert (=> b!1103348 m!1023553))

(assert (=> b!1103304 d!130821))

(declare-fun b!1103356 () Bool)

(declare-fun e!629832 () Bool)

(assert (=> b!1103356 (= e!629832 tp_is_empty!27297)))

(declare-fun mapNonEmpty!42751 () Bool)

(declare-fun mapRes!42751 () Bool)

(declare-fun tp!81671 () Bool)

(declare-fun e!629833 () Bool)

(assert (=> mapNonEmpty!42751 (= mapRes!42751 (and tp!81671 e!629833))))

(declare-fun mapRest!42751 () (Array (_ BitVec 32) ValueCell!12939))

(declare-fun mapKey!42751 () (_ BitVec 32))

(declare-fun mapValue!42751 () ValueCell!12939)

(assert (=> mapNonEmpty!42751 (= mapRest!42745 (store mapRest!42751 mapKey!42751 mapValue!42751))))

(declare-fun mapIsEmpty!42751 () Bool)

(assert (=> mapIsEmpty!42751 mapRes!42751))

(declare-fun b!1103355 () Bool)

(assert (=> b!1103355 (= e!629833 tp_is_empty!27297)))

(declare-fun condMapEmpty!42751 () Bool)

(declare-fun mapDefault!42751 () ValueCell!12939)

(assert (=> mapNonEmpty!42745 (= condMapEmpty!42751 (= mapRest!42745 ((as const (Array (_ BitVec 32) ValueCell!12939)) mapDefault!42751)))))

(assert (=> mapNonEmpty!42745 (= tp!81665 (and e!629832 mapRes!42751))))

(assert (= (and mapNonEmpty!42745 condMapEmpty!42751) mapIsEmpty!42751))

(assert (= (and mapNonEmpty!42745 (not condMapEmpty!42751)) mapNonEmpty!42751))

(assert (= (and mapNonEmpty!42751 ((_ is ValueCellFull!12939) mapValue!42751)) b!1103355))

(assert (= (and mapNonEmpty!42745 ((_ is ValueCellFull!12939) mapDefault!42751)) b!1103356))

(declare-fun m!1023555 () Bool)

(assert (=> mapNonEmpty!42751 m!1023555))

(check-sat (not mapNonEmpty!42751) (not b!1103339) tp_is_empty!27297 (not b!1103347) (not b!1103348) (not bm!46319) (not b!1103340))
(check-sat)
