; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97302 () Bool)

(assert start!97302)

(declare-fun b!1105395 () Bool)

(declare-fun e!631084 () Bool)

(declare-fun tp_is_empty!27343 () Bool)

(assert (=> b!1105395 (= e!631084 tp_is_empty!27343)))

(declare-fun b!1105396 () Bool)

(declare-fun res!737105 () Bool)

(declare-fun e!631083 () Bool)

(assert (=> b!1105396 (=> (not res!737105) (not e!631083))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1105396 (= res!737105 (validKeyInArray!0 k0!934))))

(declare-fun b!1105397 () Bool)

(declare-fun res!737103 () Bool)

(assert (=> b!1105397 (=> (not res!737103) (not e!631083))))

(declare-datatypes ((array!71641 0))(
  ( (array!71642 (arr!34470 (Array (_ BitVec 32) (_ BitVec 64))) (size!35007 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71641)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41585 0))(
  ( (V!41586 (val!13728 Int)) )
))
(declare-datatypes ((ValueCell!12962 0))(
  ( (ValueCellFull!12962 (v!16356 V!41585)) (EmptyCell!12962) )
))
(declare-datatypes ((array!71643 0))(
  ( (array!71644 (arr!34471 (Array (_ BitVec 32) ValueCell!12962)) (size!35008 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71643)

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1105397 (= res!737103 (and (= (size!35008 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35007 _keys!1208) (size!35008 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1105398 () Bool)

(declare-fun res!737108 () Bool)

(assert (=> b!1105398 (=> (not res!737108) (not e!631083))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71641 (_ BitVec 32)) Bool)

(assert (=> b!1105398 (= res!737108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208)) mask!1564))))

(declare-fun b!1105399 () Bool)

(declare-fun res!737101 () Bool)

(assert (=> b!1105399 (=> (not res!737101) (not e!631083))))

(assert (=> b!1105399 (= res!737101 (= (select (arr!34470 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!42823 () Bool)

(declare-fun mapRes!42823 () Bool)

(declare-fun tp!81743 () Bool)

(declare-fun e!631086 () Bool)

(assert (=> mapNonEmpty!42823 (= mapRes!42823 (and tp!81743 e!631086))))

(declare-fun mapValue!42823 () ValueCell!12962)

(declare-fun mapRest!42823 () (Array (_ BitVec 32) ValueCell!12962))

(declare-fun mapKey!42823 () (_ BitVec 32))

(assert (=> mapNonEmpty!42823 (= (arr!34471 _values!996) (store mapRest!42823 mapKey!42823 mapValue!42823))))

(declare-fun b!1105401 () Bool)

(assert (=> b!1105401 (= e!631086 tp_is_empty!27343)))

(declare-fun b!1105402 () Bool)

(declare-fun e!631085 () Bool)

(assert (=> b!1105402 (= e!631085 (and e!631084 mapRes!42823))))

(declare-fun condMapEmpty!42823 () Bool)

(declare-fun mapDefault!42823 () ValueCell!12962)

(assert (=> b!1105402 (= condMapEmpty!42823 (= (arr!34471 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12962)) mapDefault!42823)))))

(declare-fun b!1105403 () Bool)

(declare-fun res!737102 () Bool)

(assert (=> b!1105403 (=> (not res!737102) (not e!631083))))

(assert (=> b!1105403 (= res!737102 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35007 _keys!1208))))))

(declare-fun b!1105404 () Bool)

(declare-fun res!737104 () Bool)

(assert (=> b!1105404 (=> (not res!737104) (not e!631083))))

(declare-datatypes ((List!24073 0))(
  ( (Nil!24070) (Cons!24069 (h!25287 (_ BitVec 64)) (t!34330 List!24073)) )
))
(declare-fun arrayNoDuplicates!0 (array!71641 (_ BitVec 32) List!24073) Bool)

(assert (=> b!1105404 (= res!737104 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24070))))

(declare-fun b!1105400 () Bool)

(declare-fun res!737100 () Bool)

(assert (=> b!1105400 (=> (not res!737100) (not e!631083))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1105400 (= res!737100 (validMask!0 mask!1564))))

(declare-fun res!737107 () Bool)

(assert (=> start!97302 (=> (not res!737107) (not e!631083))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97302 (= res!737107 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35007 _keys!1208))))))

(assert (=> start!97302 e!631083))

(declare-fun array_inv!26576 (array!71641) Bool)

(assert (=> start!97302 (array_inv!26576 _keys!1208)))

(assert (=> start!97302 true))

(declare-fun array_inv!26577 (array!71643) Bool)

(assert (=> start!97302 (and (array_inv!26577 _values!996) e!631085)))

(declare-fun b!1105405 () Bool)

(declare-fun noDuplicate!1599 (List!24073) Bool)

(assert (=> b!1105405 (= e!631083 (not (noDuplicate!1599 Nil!24070)))))

(declare-fun b!1105406 () Bool)

(declare-fun res!737106 () Bool)

(assert (=> b!1105406 (=> (not res!737106) (not e!631083))))

(assert (=> b!1105406 (= res!737106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!42823 () Bool)

(assert (=> mapIsEmpty!42823 mapRes!42823))

(declare-fun b!1105407 () Bool)

(declare-fun res!737099 () Bool)

(assert (=> b!1105407 (=> (not res!737099) (not e!631083))))

(assert (=> b!1105407 (= res!737099 (and (bvsle #b00000000000000000000000000000000 (size!35007 _keys!1208)) (bvslt (size!35007 _keys!1208) #b01111111111111111111111111111111)))))

(assert (= (and start!97302 res!737107) b!1105400))

(assert (= (and b!1105400 res!737100) b!1105397))

(assert (= (and b!1105397 res!737103) b!1105406))

(assert (= (and b!1105406 res!737106) b!1105404))

(assert (= (and b!1105404 res!737104) b!1105403))

(assert (= (and b!1105403 res!737102) b!1105396))

(assert (= (and b!1105396 res!737105) b!1105399))

(assert (= (and b!1105399 res!737101) b!1105398))

(assert (= (and b!1105398 res!737108) b!1105407))

(assert (= (and b!1105407 res!737099) b!1105405))

(assert (= (and b!1105402 condMapEmpty!42823) mapIsEmpty!42823))

(assert (= (and b!1105402 (not condMapEmpty!42823)) mapNonEmpty!42823))

(get-info :version)

(assert (= (and mapNonEmpty!42823 ((_ is ValueCellFull!12962) mapValue!42823)) b!1105401))

(assert (= (and b!1105402 ((_ is ValueCellFull!12962) mapDefault!42823)) b!1105395))

(assert (= start!97302 b!1105402))

(declare-fun m!1025623 () Bool)

(assert (=> mapNonEmpty!42823 m!1025623))

(declare-fun m!1025625 () Bool)

(assert (=> b!1105404 m!1025625))

(declare-fun m!1025627 () Bool)

(assert (=> b!1105396 m!1025627))

(declare-fun m!1025629 () Bool)

(assert (=> b!1105398 m!1025629))

(declare-fun m!1025631 () Bool)

(assert (=> b!1105398 m!1025631))

(declare-fun m!1025633 () Bool)

(assert (=> b!1105406 m!1025633))

(declare-fun m!1025635 () Bool)

(assert (=> b!1105400 m!1025635))

(declare-fun m!1025637 () Bool)

(assert (=> b!1105399 m!1025637))

(declare-fun m!1025639 () Bool)

(assert (=> b!1105405 m!1025639))

(declare-fun m!1025641 () Bool)

(assert (=> start!97302 m!1025641))

(declare-fun m!1025643 () Bool)

(assert (=> start!97302 m!1025643))

(check-sat (not b!1105405) (not start!97302) (not mapNonEmpty!42823) tp_is_empty!27343 (not b!1105404) (not b!1105400) (not b!1105398) (not b!1105406) (not b!1105396))
(check-sat)
(get-model)

(declare-fun d!131331 () Bool)

(assert (=> d!131331 (= (array_inv!26576 _keys!1208) (bvsge (size!35007 _keys!1208) #b00000000000000000000000000000000))))

(assert (=> start!97302 d!131331))

(declare-fun d!131333 () Bool)

(assert (=> d!131333 (= (array_inv!26577 _values!996) (bvsge (size!35008 _values!996) #b00000000000000000000000000000000))))

(assert (=> start!97302 d!131333))

(declare-fun call!46402 () Bool)

(declare-fun bm!46399 () Bool)

(assert (=> bm!46399 (= call!46402 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208)) mask!1564))))

(declare-fun b!1105494 () Bool)

(declare-fun e!631125 () Bool)

(declare-fun e!631124 () Bool)

(assert (=> b!1105494 (= e!631125 e!631124)))

(declare-fun c!109399 () Bool)

(assert (=> b!1105494 (= c!109399 (validKeyInArray!0 (select (arr!34470 (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208))) #b00000000000000000000000000000000)))))

(declare-fun b!1105495 () Bool)

(declare-fun e!631123 () Bool)

(assert (=> b!1105495 (= e!631124 e!631123)))

(declare-fun lt!495625 () (_ BitVec 64))

(assert (=> b!1105495 (= lt!495625 (select (arr!34470 (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208))) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36239 0))(
  ( (Unit!36240) )
))
(declare-fun lt!495627 () Unit!36239)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71641 (_ BitVec 64) (_ BitVec 32)) Unit!36239)

(assert (=> b!1105495 (= lt!495627 (lemmaArrayContainsFromImpliesContainsFromZero!0 (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208)) lt!495625 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!71641 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1105495 (arrayContainsKey!0 (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208)) lt!495625 #b00000000000000000000000000000000)))

(declare-fun lt!495626 () Unit!36239)

(assert (=> b!1105495 (= lt!495626 lt!495627)))

(declare-fun res!737173 () Bool)

(declare-datatypes ((SeekEntryResult!9878 0))(
  ( (MissingZero!9878 (index!41883 (_ BitVec 32))) (Found!9878 (index!41884 (_ BitVec 32))) (Intermediate!9878 (undefined!10690 Bool) (index!41885 (_ BitVec 32)) (x!99289 (_ BitVec 32))) (Undefined!9878) (MissingVacant!9878 (index!41886 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!71641 (_ BitVec 32)) SeekEntryResult!9878)

(assert (=> b!1105495 (= res!737173 (= (seekEntryOrOpen!0 (select (arr!34470 (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208))) #b00000000000000000000000000000000) (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208)) mask!1564) (Found!9878 #b00000000000000000000000000000000)))))

(assert (=> b!1105495 (=> (not res!737173) (not e!631123))))

(declare-fun d!131335 () Bool)

(declare-fun res!737174 () Bool)

(assert (=> d!131335 (=> res!737174 e!631125)))

(assert (=> d!131335 (= res!737174 (bvsge #b00000000000000000000000000000000 (size!35007 (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208)))))))

(assert (=> d!131335 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!71642 (store (arr!34470 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35007 _keys!1208)) mask!1564) e!631125)))

(declare-fun b!1105496 () Bool)

(assert (=> b!1105496 (= e!631123 call!46402)))

(declare-fun b!1105497 () Bool)

(assert (=> b!1105497 (= e!631124 call!46402)))

(assert (= (and d!131335 (not res!737174)) b!1105494))

(assert (= (and b!1105494 c!109399) b!1105495))

(assert (= (and b!1105494 (not c!109399)) b!1105497))

(assert (= (and b!1105495 res!737173) b!1105496))

(assert (= (or b!1105496 b!1105497) bm!46399))

(declare-fun m!1025689 () Bool)

(assert (=> bm!46399 m!1025689))

(declare-fun m!1025691 () Bool)

(assert (=> b!1105494 m!1025691))

(assert (=> b!1105494 m!1025691))

(declare-fun m!1025693 () Bool)

(assert (=> b!1105494 m!1025693))

(assert (=> b!1105495 m!1025691))

(declare-fun m!1025695 () Bool)

(assert (=> b!1105495 m!1025695))

(declare-fun m!1025697 () Bool)

(assert (=> b!1105495 m!1025697))

(assert (=> b!1105495 m!1025691))

(declare-fun m!1025699 () Bool)

(assert (=> b!1105495 m!1025699))

(assert (=> b!1105398 d!131335))

(declare-fun b!1105508 () Bool)

(declare-fun e!631134 () Bool)

(declare-fun contains!6439 (List!24073 (_ BitVec 64)) Bool)

(assert (=> b!1105508 (= e!631134 (contains!6439 Nil!24070 (select (arr!34470 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun bm!46402 () Bool)

(declare-fun call!46405 () Bool)

(declare-fun c!109402 () Bool)

(assert (=> bm!46402 (= call!46405 (arrayNoDuplicates!0 _keys!1208 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!109402 (Cons!24069 (select (arr!34470 _keys!1208) #b00000000000000000000000000000000) Nil!24070) Nil!24070)))))

(declare-fun b!1105509 () Bool)

(declare-fun e!631137 () Bool)

(assert (=> b!1105509 (= e!631137 call!46405)))

(declare-fun b!1105510 () Bool)

(assert (=> b!1105510 (= e!631137 call!46405)))

(declare-fun b!1105511 () Bool)

(declare-fun e!631136 () Bool)

(declare-fun e!631135 () Bool)

(assert (=> b!1105511 (= e!631136 e!631135)))

(declare-fun res!737182 () Bool)

(assert (=> b!1105511 (=> (not res!737182) (not e!631135))))

(assert (=> b!1105511 (= res!737182 (not e!631134))))

(declare-fun res!737183 () Bool)

(assert (=> b!1105511 (=> (not res!737183) (not e!631134))))

(assert (=> b!1105511 (= res!737183 (validKeyInArray!0 (select (arr!34470 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105512 () Bool)

(assert (=> b!1105512 (= e!631135 e!631137)))

(assert (=> b!1105512 (= c!109402 (validKeyInArray!0 (select (arr!34470 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun d!131337 () Bool)

(declare-fun res!737181 () Bool)

(assert (=> d!131337 (=> res!737181 e!631136)))

(assert (=> d!131337 (= res!737181 (bvsge #b00000000000000000000000000000000 (size!35007 _keys!1208)))))

(assert (=> d!131337 (= (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24070) e!631136)))

(assert (= (and d!131337 (not res!737181)) b!1105511))

(assert (= (and b!1105511 res!737183) b!1105508))

(assert (= (and b!1105511 res!737182) b!1105512))

(assert (= (and b!1105512 c!109402) b!1105510))

(assert (= (and b!1105512 (not c!109402)) b!1105509))

(assert (= (or b!1105510 b!1105509) bm!46402))

(declare-fun m!1025701 () Bool)

(assert (=> b!1105508 m!1025701))

(assert (=> b!1105508 m!1025701))

(declare-fun m!1025703 () Bool)

(assert (=> b!1105508 m!1025703))

(assert (=> bm!46402 m!1025701))

(declare-fun m!1025705 () Bool)

(assert (=> bm!46402 m!1025705))

(assert (=> b!1105511 m!1025701))

(assert (=> b!1105511 m!1025701))

(declare-fun m!1025707 () Bool)

(assert (=> b!1105511 m!1025707))

(assert (=> b!1105512 m!1025701))

(assert (=> b!1105512 m!1025701))

(assert (=> b!1105512 m!1025707))

(assert (=> b!1105404 d!131337))

(declare-fun d!131339 () Bool)

(assert (=> d!131339 (= (validMask!0 mask!1564) (and (or (= mask!1564 #b00000000000000000000000000000111) (= mask!1564 #b00000000000000000000000000001111) (= mask!1564 #b00000000000000000000000000011111) (= mask!1564 #b00000000000000000000000000111111) (= mask!1564 #b00000000000000000000000001111111) (= mask!1564 #b00000000000000000000000011111111) (= mask!1564 #b00000000000000000000000111111111) (= mask!1564 #b00000000000000000000001111111111) (= mask!1564 #b00000000000000000000011111111111) (= mask!1564 #b00000000000000000000111111111111) (= mask!1564 #b00000000000000000001111111111111) (= mask!1564 #b00000000000000000011111111111111) (= mask!1564 #b00000000000000000111111111111111) (= mask!1564 #b00000000000000001111111111111111) (= mask!1564 #b00000000000000011111111111111111) (= mask!1564 #b00000000000000111111111111111111) (= mask!1564 #b00000000000001111111111111111111) (= mask!1564 #b00000000000011111111111111111111) (= mask!1564 #b00000000000111111111111111111111) (= mask!1564 #b00000000001111111111111111111111) (= mask!1564 #b00000000011111111111111111111111) (= mask!1564 #b00000000111111111111111111111111) (= mask!1564 #b00000001111111111111111111111111) (= mask!1564 #b00000011111111111111111111111111) (= mask!1564 #b00000111111111111111111111111111) (= mask!1564 #b00001111111111111111111111111111) (= mask!1564 #b00011111111111111111111111111111) (= mask!1564 #b00111111111111111111111111111111)) (bvsle mask!1564 #b00111111111111111111111111111111)))))

(assert (=> b!1105400 d!131339))

(declare-fun d!131341 () Bool)

(declare-fun res!737188 () Bool)

(declare-fun e!631142 () Bool)

(assert (=> d!131341 (=> res!737188 e!631142)))

(assert (=> d!131341 (= res!737188 ((_ is Nil!24070) Nil!24070))))

(assert (=> d!131341 (= (noDuplicate!1599 Nil!24070) e!631142)))

(declare-fun b!1105517 () Bool)

(declare-fun e!631143 () Bool)

(assert (=> b!1105517 (= e!631142 e!631143)))

(declare-fun res!737189 () Bool)

(assert (=> b!1105517 (=> (not res!737189) (not e!631143))))

(assert (=> b!1105517 (= res!737189 (not (contains!6439 (t!34330 Nil!24070) (h!25287 Nil!24070))))))

(declare-fun b!1105518 () Bool)

(assert (=> b!1105518 (= e!631143 (noDuplicate!1599 (t!34330 Nil!24070)))))

(assert (= (and d!131341 (not res!737188)) b!1105517))

(assert (= (and b!1105517 res!737189) b!1105518))

(declare-fun m!1025709 () Bool)

(assert (=> b!1105517 m!1025709))

(declare-fun m!1025711 () Bool)

(assert (=> b!1105518 m!1025711))

(assert (=> b!1105405 d!131341))

(declare-fun bm!46403 () Bool)

(declare-fun call!46406 () Bool)

(assert (=> bm!46403 (= call!46406 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1208 mask!1564))))

(declare-fun b!1105519 () Bool)

(declare-fun e!631146 () Bool)

(declare-fun e!631145 () Bool)

(assert (=> b!1105519 (= e!631146 e!631145)))

(declare-fun c!109403 () Bool)

(assert (=> b!1105519 (= c!109403 (validKeyInArray!0 (select (arr!34470 _keys!1208) #b00000000000000000000000000000000)))))

(declare-fun b!1105520 () Bool)

(declare-fun e!631144 () Bool)

(assert (=> b!1105520 (= e!631145 e!631144)))

(declare-fun lt!495628 () (_ BitVec 64))

(assert (=> b!1105520 (= lt!495628 (select (arr!34470 _keys!1208) #b00000000000000000000000000000000))))

(declare-fun lt!495630 () Unit!36239)

(assert (=> b!1105520 (= lt!495630 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 lt!495628 #b00000000000000000000000000000000))))

(assert (=> b!1105520 (arrayContainsKey!0 _keys!1208 lt!495628 #b00000000000000000000000000000000)))

(declare-fun lt!495629 () Unit!36239)

(assert (=> b!1105520 (= lt!495629 lt!495630)))

(declare-fun res!737190 () Bool)

(assert (=> b!1105520 (= res!737190 (= (seekEntryOrOpen!0 (select (arr!34470 _keys!1208) #b00000000000000000000000000000000) _keys!1208 mask!1564) (Found!9878 #b00000000000000000000000000000000)))))

(assert (=> b!1105520 (=> (not res!737190) (not e!631144))))

(declare-fun d!131343 () Bool)

(declare-fun res!737191 () Bool)

(assert (=> d!131343 (=> res!737191 e!631146)))

(assert (=> d!131343 (= res!737191 (bvsge #b00000000000000000000000000000000 (size!35007 _keys!1208)))))

(assert (=> d!131343 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564) e!631146)))

(declare-fun b!1105521 () Bool)

(assert (=> b!1105521 (= e!631144 call!46406)))

(declare-fun b!1105522 () Bool)

(assert (=> b!1105522 (= e!631145 call!46406)))

(assert (= (and d!131343 (not res!737191)) b!1105519))

(assert (= (and b!1105519 c!109403) b!1105520))

(assert (= (and b!1105519 (not c!109403)) b!1105522))

(assert (= (and b!1105520 res!737190) b!1105521))

(assert (= (or b!1105521 b!1105522) bm!46403))

(declare-fun m!1025713 () Bool)

(assert (=> bm!46403 m!1025713))

(assert (=> b!1105519 m!1025701))

(assert (=> b!1105519 m!1025701))

(assert (=> b!1105519 m!1025707))

(assert (=> b!1105520 m!1025701))

(declare-fun m!1025715 () Bool)

(assert (=> b!1105520 m!1025715))

(declare-fun m!1025717 () Bool)

(assert (=> b!1105520 m!1025717))

(assert (=> b!1105520 m!1025701))

(declare-fun m!1025719 () Bool)

(assert (=> b!1105520 m!1025719))

(assert (=> b!1105406 d!131343))

(declare-fun d!131345 () Bool)

(assert (=> d!131345 (= (validKeyInArray!0 k0!934) (and (not (= k0!934 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!934 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1105396 d!131345))

(declare-fun mapNonEmpty!42832 () Bool)

(declare-fun mapRes!42832 () Bool)

(declare-fun tp!81752 () Bool)

(declare-fun e!631152 () Bool)

(assert (=> mapNonEmpty!42832 (= mapRes!42832 (and tp!81752 e!631152))))

(declare-fun mapRest!42832 () (Array (_ BitVec 32) ValueCell!12962))

(declare-fun mapKey!42832 () (_ BitVec 32))

(declare-fun mapValue!42832 () ValueCell!12962)

(assert (=> mapNonEmpty!42832 (= mapRest!42823 (store mapRest!42832 mapKey!42832 mapValue!42832))))

(declare-fun b!1105530 () Bool)

(declare-fun e!631151 () Bool)

(assert (=> b!1105530 (= e!631151 tp_is_empty!27343)))

(declare-fun b!1105529 () Bool)

(assert (=> b!1105529 (= e!631152 tp_is_empty!27343)))

(declare-fun condMapEmpty!42832 () Bool)

(declare-fun mapDefault!42832 () ValueCell!12962)

(assert (=> mapNonEmpty!42823 (= condMapEmpty!42832 (= mapRest!42823 ((as const (Array (_ BitVec 32) ValueCell!12962)) mapDefault!42832)))))

(assert (=> mapNonEmpty!42823 (= tp!81743 (and e!631151 mapRes!42832))))

(declare-fun mapIsEmpty!42832 () Bool)

(assert (=> mapIsEmpty!42832 mapRes!42832))

(assert (= (and mapNonEmpty!42823 condMapEmpty!42832) mapIsEmpty!42832))

(assert (= (and mapNonEmpty!42823 (not condMapEmpty!42832)) mapNonEmpty!42832))

(assert (= (and mapNonEmpty!42832 ((_ is ValueCellFull!12962) mapValue!42832)) b!1105529))

(assert (= (and mapNonEmpty!42823 ((_ is ValueCellFull!12962) mapDefault!42832)) b!1105530))

(declare-fun m!1025721 () Bool)

(assert (=> mapNonEmpty!42832 m!1025721))

(check-sat (not bm!46402) (not bm!46399) (not b!1105495) (not b!1105518) (not b!1105519) (not b!1105517) (not bm!46403) (not b!1105512) (not mapNonEmpty!42832) tp_is_empty!27343 (not b!1105508) (not b!1105511) (not b!1105520) (not b!1105494))
(check-sat)
