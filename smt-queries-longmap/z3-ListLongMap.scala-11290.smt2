; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132018 () Bool)

(assert start!132018)

(declare-fun b!1544051 () Bool)

(declare-fun e!858978 () Bool)

(declare-fun tp_is_empty!37633 () Bool)

(assert (=> b!1544051 (= e!858978 tp_is_empty!37633)))

(declare-fun b!1544052 () Bool)

(declare-fun e!858977 () Bool)

(declare-fun mapRes!58141 () Bool)

(assert (=> b!1544052 (= e!858977 (and e!858978 mapRes!58141))))

(declare-fun condMapEmpty!58141 () Bool)

(declare-datatypes ((V!58621 0))(
  ( (V!58622 (val!18894 Int)) )
))
(declare-datatypes ((ValueCell!17906 0))(
  ( (ValueCellFull!17906 (v!21686 V!58621)) (EmptyCell!17906) )
))
(declare-datatypes ((array!102618 0))(
  ( (array!102619 (arr!49508 (Array (_ BitVec 32) ValueCell!17906)) (size!50059 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102618)

(declare-fun mapDefault!58141 () ValueCell!17906)

(assert (=> b!1544052 (= condMapEmpty!58141 (= (arr!49508 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17906)) mapDefault!58141)))))

(declare-fun b!1544053 () Bool)

(declare-fun e!858976 () Bool)

(declare-datatypes ((array!102620 0))(
  ( (array!102621 (arr!49509 (Array (_ BitVec 32) (_ BitVec 64))) (size!50060 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102620)

(assert (=> b!1544053 (= e!858976 (bvsgt #b00000000000000000000000000000000 (size!50060 _keys!618)))))

(declare-fun res!1058931 () Bool)

(assert (=> start!132018 (=> (not res!1058931) (not e!858976))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132018 (= res!1058931 (validMask!0 mask!926))))

(assert (=> start!132018 e!858976))

(assert (=> start!132018 true))

(declare-fun array_inv!38785 (array!102618) Bool)

(assert (=> start!132018 (and (array_inv!38785 _values!470) e!858977)))

(declare-fun array_inv!38786 (array!102620) Bool)

(assert (=> start!132018 (array_inv!38786 _keys!618)))

(declare-fun b!1544054 () Bool)

(declare-fun e!858979 () Bool)

(assert (=> b!1544054 (= e!858979 tp_is_empty!37633)))

(declare-fun mapNonEmpty!58141 () Bool)

(declare-fun tp!110668 () Bool)

(assert (=> mapNonEmpty!58141 (= mapRes!58141 (and tp!110668 e!858979))))

(declare-fun mapRest!58141 () (Array (_ BitVec 32) ValueCell!17906))

(declare-fun mapKey!58141 () (_ BitVec 32))

(declare-fun mapValue!58141 () ValueCell!17906)

(assert (=> mapNonEmpty!58141 (= (arr!49508 _values!470) (store mapRest!58141 mapKey!58141 mapValue!58141))))

(declare-fun b!1544055 () Bool)

(declare-fun res!1058930 () Bool)

(assert (=> b!1544055 (=> (not res!1058930) (not e!858976))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544055 (= res!1058930 (and (= (size!50059 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50060 _keys!618) (size!50059 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58141 () Bool)

(assert (=> mapIsEmpty!58141 mapRes!58141))

(declare-fun b!1544056 () Bool)

(declare-fun res!1058929 () Bool)

(assert (=> b!1544056 (=> (not res!1058929) (not e!858976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102620 (_ BitVec 32)) Bool)

(assert (=> b!1544056 (= res!1058929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!132018 res!1058931) b!1544055))

(assert (= (and b!1544055 res!1058930) b!1544056))

(assert (= (and b!1544056 res!1058929) b!1544053))

(assert (= (and b!1544052 condMapEmpty!58141) mapIsEmpty!58141))

(assert (= (and b!1544052 (not condMapEmpty!58141)) mapNonEmpty!58141))

(get-info :version)

(assert (= (and mapNonEmpty!58141 ((_ is ValueCellFull!17906) mapValue!58141)) b!1544054))

(assert (= (and b!1544052 ((_ is ValueCellFull!17906) mapDefault!58141)) b!1544051))

(assert (= start!132018 b!1544052))

(declare-fun m!1425805 () Bool)

(assert (=> start!132018 m!1425805))

(declare-fun m!1425807 () Bool)

(assert (=> start!132018 m!1425807))

(declare-fun m!1425809 () Bool)

(assert (=> start!132018 m!1425809))

(declare-fun m!1425811 () Bool)

(assert (=> mapNonEmpty!58141 m!1425811))

(declare-fun m!1425813 () Bool)

(assert (=> b!1544056 m!1425813))

(check-sat (not b!1544056) (not start!132018) (not mapNonEmpty!58141) tp_is_empty!37633)
(check-sat)
(get-model)

(declare-fun b!1544101 () Bool)

(declare-fun e!859017 () Bool)

(declare-fun e!859018 () Bool)

(assert (=> b!1544101 (= e!859017 e!859018)))

(declare-fun lt!666611 () (_ BitVec 64))

(assert (=> b!1544101 (= lt!666611 (select (arr!49509 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51415 0))(
  ( (Unit!51416) )
))
(declare-fun lt!666610 () Unit!51415)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102620 (_ BitVec 64) (_ BitVec 32)) Unit!51415)

(assert (=> b!1544101 (= lt!666610 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!666611 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102620 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1544101 (arrayContainsKey!0 _keys!618 lt!666611 #b00000000000000000000000000000000)))

(declare-fun lt!666612 () Unit!51415)

(assert (=> b!1544101 (= lt!666612 lt!666610)))

(declare-fun res!1058954 () Bool)

(declare-datatypes ((SeekEntryResult!13456 0))(
  ( (MissingZero!13456 (index!56222 (_ BitVec 32))) (Found!13456 (index!56223 (_ BitVec 32))) (Intermediate!13456 (undefined!14268 Bool) (index!56224 (_ BitVec 32)) (x!138357 (_ BitVec 32))) (Undefined!13456) (MissingVacant!13456 (index!56225 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102620 (_ BitVec 32)) SeekEntryResult!13456)

(assert (=> b!1544101 (= res!1058954 (= (seekEntryOrOpen!0 (select (arr!49509 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13456 #b00000000000000000000000000000000)))))

(assert (=> b!1544101 (=> (not res!1058954) (not e!859018))))

(declare-fun b!1544102 () Bool)

(declare-fun call!68835 () Bool)

(assert (=> b!1544102 (= e!859017 call!68835)))

(declare-fun d!161395 () Bool)

(declare-fun res!1058955 () Bool)

(declare-fun e!859016 () Bool)

(assert (=> d!161395 (=> res!1058955 e!859016)))

(assert (=> d!161395 (= res!1058955 (bvsge #b00000000000000000000000000000000 (size!50060 _keys!618)))))

(assert (=> d!161395 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!859016)))

(declare-fun b!1544103 () Bool)

(assert (=> b!1544103 (= e!859016 e!859017)))

(declare-fun c!142099 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1544103 (= c!142099 (validKeyInArray!0 (select (arr!49509 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun bm!68832 () Bool)

(assert (=> bm!68832 (= call!68835 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1544104 () Bool)

(assert (=> b!1544104 (= e!859018 call!68835)))

(assert (= (and d!161395 (not res!1058955)) b!1544103))

(assert (= (and b!1544103 c!142099) b!1544101))

(assert (= (and b!1544103 (not c!142099)) b!1544102))

(assert (= (and b!1544101 res!1058954) b!1544104))

(assert (= (or b!1544104 b!1544102) bm!68832))

(declare-fun m!1425835 () Bool)

(assert (=> b!1544101 m!1425835))

(declare-fun m!1425837 () Bool)

(assert (=> b!1544101 m!1425837))

(declare-fun m!1425839 () Bool)

(assert (=> b!1544101 m!1425839))

(assert (=> b!1544101 m!1425835))

(declare-fun m!1425841 () Bool)

(assert (=> b!1544101 m!1425841))

(assert (=> b!1544103 m!1425835))

(assert (=> b!1544103 m!1425835))

(declare-fun m!1425843 () Bool)

(assert (=> b!1544103 m!1425843))

(declare-fun m!1425845 () Bool)

(assert (=> bm!68832 m!1425845))

(assert (=> b!1544056 d!161395))

(declare-fun d!161397 () Bool)

(assert (=> d!161397 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132018 d!161397))

(declare-fun d!161399 () Bool)

(assert (=> d!161399 (= (array_inv!38785 _values!470) (bvsge (size!50059 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132018 d!161399))

(declare-fun d!161401 () Bool)

(assert (=> d!161401 (= (array_inv!38786 _keys!618) (bvsge (size!50060 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132018 d!161401))

(declare-fun mapIsEmpty!58150 () Bool)

(declare-fun mapRes!58150 () Bool)

(assert (=> mapIsEmpty!58150 mapRes!58150))

(declare-fun b!1544112 () Bool)

(declare-fun e!859023 () Bool)

(assert (=> b!1544112 (= e!859023 tp_is_empty!37633)))

(declare-fun condMapEmpty!58150 () Bool)

(declare-fun mapDefault!58150 () ValueCell!17906)

(assert (=> mapNonEmpty!58141 (= condMapEmpty!58150 (= mapRest!58141 ((as const (Array (_ BitVec 32) ValueCell!17906)) mapDefault!58150)))))

(assert (=> mapNonEmpty!58141 (= tp!110668 (and e!859023 mapRes!58150))))

(declare-fun mapNonEmpty!58150 () Bool)

(declare-fun tp!110677 () Bool)

(declare-fun e!859024 () Bool)

(assert (=> mapNonEmpty!58150 (= mapRes!58150 (and tp!110677 e!859024))))

(declare-fun mapRest!58150 () (Array (_ BitVec 32) ValueCell!17906))

(declare-fun mapKey!58150 () (_ BitVec 32))

(declare-fun mapValue!58150 () ValueCell!17906)

(assert (=> mapNonEmpty!58150 (= mapRest!58141 (store mapRest!58150 mapKey!58150 mapValue!58150))))

(declare-fun b!1544111 () Bool)

(assert (=> b!1544111 (= e!859024 tp_is_empty!37633)))

(assert (= (and mapNonEmpty!58141 condMapEmpty!58150) mapIsEmpty!58150))

(assert (= (and mapNonEmpty!58141 (not condMapEmpty!58150)) mapNonEmpty!58150))

(assert (= (and mapNonEmpty!58150 ((_ is ValueCellFull!17906) mapValue!58150)) b!1544111))

(assert (= (and mapNonEmpty!58141 ((_ is ValueCellFull!17906) mapDefault!58150)) b!1544112))

(declare-fun m!1425847 () Bool)

(assert (=> mapNonEmpty!58150 m!1425847))

(check-sat tp_is_empty!37633 (not mapNonEmpty!58150) (not bm!68832) (not b!1544101) (not b!1544103))
(check-sat)
