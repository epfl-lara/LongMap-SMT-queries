; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96328 () Bool)

(assert start!96328)

(declare-fun mapIsEmpty!42238 () Bool)

(declare-fun mapRes!42238 () Bool)

(assert (=> mapIsEmpty!42238 mapRes!42238))

(declare-fun b!1094694 () Bool)

(declare-fun res!730577 () Bool)

(declare-fun e!624978 () Bool)

(assert (=> b!1094694 (=> (not res!730577) (not e!624978))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094694 (= res!730577 (validKeyInArray!0 k0!904))))

(declare-fun b!1094695 () Bool)

(declare-fun res!730575 () Bool)

(assert (=> b!1094695 (=> (not res!730575) (not e!624978))))

(declare-datatypes ((array!70804 0))(
  ( (array!70805 (arr!34076 (Array (_ BitVec 32) (_ BitVec 64))) (size!34614 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70804)

(declare-datatypes ((List!23862 0))(
  ( (Nil!23859) (Cons!23858 (h!25067 (_ BitVec 64)) (t!33860 List!23862)) )
))
(declare-fun arrayNoDuplicates!0 (array!70804 (_ BitVec 32) List!23862) Bool)

(assert (=> b!1094695 (= res!730575 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23859))))

(declare-fun b!1094697 () Bool)

(declare-fun e!624980 () Bool)

(assert (=> b!1094697 (= e!624978 e!624980)))

(declare-fun res!730578 () Bool)

(assert (=> b!1094697 (=> (not res!730578) (not e!624980))))

(declare-fun lt!489512 () array!70804)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70804 (_ BitVec 32)) Bool)

(assert (=> b!1094697 (= res!730578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489512 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094697 (= lt!489512 (array!70805 (store (arr!34076 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34614 _keys!1070)))))

(declare-fun mapNonEmpty!42238 () Bool)

(declare-fun tp!80753 () Bool)

(declare-fun e!624979 () Bool)

(assert (=> mapNonEmpty!42238 (= mapRes!42238 (and tp!80753 e!624979))))

(declare-datatypes ((V!41113 0))(
  ( (V!41114 (val!13551 Int)) )
))
(declare-datatypes ((ValueCell!12785 0))(
  ( (ValueCellFull!12785 (v!16171 V!41113)) (EmptyCell!12785) )
))
(declare-datatypes ((array!70806 0))(
  ( (array!70807 (arr!34077 (Array (_ BitVec 32) ValueCell!12785)) (size!34615 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70806)

(declare-fun mapKey!42238 () (_ BitVec 32))

(declare-fun mapRest!42238 () (Array (_ BitVec 32) ValueCell!12785))

(declare-fun mapValue!42238 () ValueCell!12785)

(assert (=> mapNonEmpty!42238 (= (arr!34077 _values!874) (store mapRest!42238 mapKey!42238 mapValue!42238))))

(declare-fun b!1094698 () Bool)

(declare-fun res!730572 () Bool)

(assert (=> b!1094698 (=> (not res!730572) (not e!624978))))

(assert (=> b!1094698 (= res!730572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094699 () Bool)

(declare-fun res!730571 () Bool)

(assert (=> b!1094699 (=> (not res!730571) (not e!624978))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1094699 (= res!730571 (and (= (size!34615 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34614 _keys!1070) (size!34615 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1094700 () Bool)

(declare-fun res!730570 () Bool)

(assert (=> b!1094700 (=> (not res!730570) (not e!624978))))

(assert (=> b!1094700 (= res!730570 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34614 _keys!1070))))))

(declare-fun b!1094701 () Bool)

(declare-fun res!730573 () Bool)

(assert (=> b!1094701 (=> (not res!730573) (not e!624980))))

(assert (=> b!1094701 (= res!730573 (arrayNoDuplicates!0 lt!489512 #b00000000000000000000000000000000 Nil!23859))))

(declare-fun b!1094702 () Bool)

(declare-fun e!624976 () Bool)

(declare-fun tp_is_empty!26989 () Bool)

(assert (=> b!1094702 (= e!624976 tp_is_empty!26989)))

(declare-fun b!1094703 () Bool)

(declare-fun res!730576 () Bool)

(assert (=> b!1094703 (=> (not res!730576) (not e!624978))))

(assert (=> b!1094703 (= res!730576 (= (select (arr!34076 _keys!1070) i!650) k0!904))))

(declare-fun b!1094696 () Bool)

(assert (=> b!1094696 (= e!624980 (bvsge (size!34614 _keys!1070) #b01111111111111111111111111111111))))

(declare-fun res!730574 () Bool)

(assert (=> start!96328 (=> (not res!730574) (not e!624978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96328 (= res!730574 (validMask!0 mask!1414))))

(assert (=> start!96328 e!624978))

(assert (=> start!96328 true))

(declare-fun array_inv!26292 (array!70804) Bool)

(assert (=> start!96328 (array_inv!26292 _keys!1070)))

(declare-fun e!624975 () Bool)

(declare-fun array_inv!26293 (array!70806) Bool)

(assert (=> start!96328 (and (array_inv!26293 _values!874) e!624975)))

(declare-fun b!1094704 () Bool)

(assert (=> b!1094704 (= e!624975 (and e!624976 mapRes!42238))))

(declare-fun condMapEmpty!42238 () Bool)

(declare-fun mapDefault!42238 () ValueCell!12785)

(assert (=> b!1094704 (= condMapEmpty!42238 (= (arr!34077 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12785)) mapDefault!42238)))))

(declare-fun b!1094705 () Bool)

(assert (=> b!1094705 (= e!624979 tp_is_empty!26989)))

(assert (= (and start!96328 res!730574) b!1094699))

(assert (= (and b!1094699 res!730571) b!1094698))

(assert (= (and b!1094698 res!730572) b!1094695))

(assert (= (and b!1094695 res!730575) b!1094700))

(assert (= (and b!1094700 res!730570) b!1094694))

(assert (= (and b!1094694 res!730577) b!1094703))

(assert (= (and b!1094703 res!730576) b!1094697))

(assert (= (and b!1094697 res!730578) b!1094701))

(assert (= (and b!1094701 res!730573) b!1094696))

(assert (= (and b!1094704 condMapEmpty!42238) mapIsEmpty!42238))

(assert (= (and b!1094704 (not condMapEmpty!42238)) mapNonEmpty!42238))

(get-info :version)

(assert (= (and mapNonEmpty!42238 ((_ is ValueCellFull!12785) mapValue!42238)) b!1094705))

(assert (= (and b!1094704 ((_ is ValueCellFull!12785) mapDefault!42238)) b!1094702))

(assert (= start!96328 b!1094704))

(declare-fun m!1014023 () Bool)

(assert (=> b!1094701 m!1014023))

(declare-fun m!1014025 () Bool)

(assert (=> b!1094698 m!1014025))

(declare-fun m!1014027 () Bool)

(assert (=> b!1094703 m!1014027))

(declare-fun m!1014029 () Bool)

(assert (=> b!1094694 m!1014029))

(declare-fun m!1014031 () Bool)

(assert (=> b!1094695 m!1014031))

(declare-fun m!1014033 () Bool)

(assert (=> mapNonEmpty!42238 m!1014033))

(declare-fun m!1014035 () Bool)

(assert (=> b!1094697 m!1014035))

(declare-fun m!1014037 () Bool)

(assert (=> b!1094697 m!1014037))

(declare-fun m!1014039 () Bool)

(assert (=> start!96328 m!1014039))

(declare-fun m!1014041 () Bool)

(assert (=> start!96328 m!1014041))

(declare-fun m!1014043 () Bool)

(assert (=> start!96328 m!1014043))

(check-sat (not b!1094697) (not b!1094698) tp_is_empty!26989 (not b!1094695) (not b!1094694) (not mapNonEmpty!42238) (not b!1094701) (not start!96328))
(check-sat)
(get-model)

(declare-fun d!130061 () Bool)

(declare-fun res!730638 () Bool)

(declare-fun e!625025 () Bool)

(assert (=> d!130061 (=> res!730638 e!625025)))

(assert (=> d!130061 (= res!730638 (bvsge #b00000000000000000000000000000000 (size!34614 lt!489512)))))

(assert (=> d!130061 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489512 mask!1414) e!625025)))

(declare-fun b!1094786 () Bool)

(declare-fun e!625023 () Bool)

(declare-fun call!45728 () Bool)

(assert (=> b!1094786 (= e!625023 call!45728)))

(declare-fun bm!45725 () Bool)

(assert (=> bm!45725 (= call!45728 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!489512 mask!1414))))

(declare-fun b!1094787 () Bool)

(declare-fun e!625024 () Bool)

(assert (=> b!1094787 (= e!625024 call!45728)))

(declare-fun b!1094788 () Bool)

(assert (=> b!1094788 (= e!625025 e!625023)))

(declare-fun c!108306 () Bool)

(assert (=> b!1094788 (= c!108306 (validKeyInArray!0 (select (arr!34076 lt!489512) #b00000000000000000000000000000000)))))

(declare-fun b!1094789 () Bool)

(assert (=> b!1094789 (= e!625023 e!625024)))

(declare-fun lt!489526 () (_ BitVec 64))

(assert (=> b!1094789 (= lt!489526 (select (arr!34076 lt!489512) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35861 0))(
  ( (Unit!35862) )
))
(declare-fun lt!489525 () Unit!35861)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70804 (_ BitVec 64) (_ BitVec 32)) Unit!35861)

(assert (=> b!1094789 (= lt!489525 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!489512 lt!489526 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!70804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094789 (arrayContainsKey!0 lt!489512 lt!489526 #b00000000000000000000000000000000)))

(declare-fun lt!489527 () Unit!35861)

(assert (=> b!1094789 (= lt!489527 lt!489525)))

(declare-fun res!730637 () Bool)

(declare-datatypes ((SeekEntryResult!9903 0))(
  ( (MissingZero!9903 (index!41983 (_ BitVec 32))) (Found!9903 (index!41984 (_ BitVec 32))) (Intermediate!9903 (undefined!10715 Bool) (index!41985 (_ BitVec 32)) (x!98415 (_ BitVec 32))) (Undefined!9903) (MissingVacant!9903 (index!41986 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!70804 (_ BitVec 32)) SeekEntryResult!9903)

(assert (=> b!1094789 (= res!730637 (= (seekEntryOrOpen!0 (select (arr!34076 lt!489512) #b00000000000000000000000000000000) lt!489512 mask!1414) (Found!9903 #b00000000000000000000000000000000)))))

(assert (=> b!1094789 (=> (not res!730637) (not e!625024))))

(assert (= (and d!130061 (not res!730638)) b!1094788))

(assert (= (and b!1094788 c!108306) b!1094789))

(assert (= (and b!1094788 (not c!108306)) b!1094786))

(assert (= (and b!1094789 res!730637) b!1094787))

(assert (= (or b!1094787 b!1094786) bm!45725))

(declare-fun m!1014089 () Bool)

(assert (=> bm!45725 m!1014089))

(declare-fun m!1014091 () Bool)

(assert (=> b!1094788 m!1014091))

(assert (=> b!1094788 m!1014091))

(declare-fun m!1014093 () Bool)

(assert (=> b!1094788 m!1014093))

(assert (=> b!1094789 m!1014091))

(declare-fun m!1014095 () Bool)

(assert (=> b!1094789 m!1014095))

(declare-fun m!1014097 () Bool)

(assert (=> b!1094789 m!1014097))

(assert (=> b!1094789 m!1014091))

(declare-fun m!1014099 () Bool)

(assert (=> b!1094789 m!1014099))

(assert (=> b!1094697 d!130061))

(declare-fun b!1094800 () Bool)

(declare-fun e!625037 () Bool)

(declare-fun e!625036 () Bool)

(assert (=> b!1094800 (= e!625037 e!625036)))

(declare-fun c!108309 () Bool)

(assert (=> b!1094800 (= c!108309 (validKeyInArray!0 (select (arr!34076 lt!489512) #b00000000000000000000000000000000)))))

(declare-fun bm!45728 () Bool)

(declare-fun call!45731 () Bool)

(assert (=> bm!45728 (= call!45731 (arrayNoDuplicates!0 lt!489512 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108309 (Cons!23858 (select (arr!34076 lt!489512) #b00000000000000000000000000000000) Nil!23859) Nil!23859)))))

(declare-fun b!1094801 () Bool)

(declare-fun e!625034 () Bool)

(declare-fun contains!6345 (List!23862 (_ BitVec 64)) Bool)

(assert (=> b!1094801 (= e!625034 (contains!6345 Nil!23859 (select (arr!34076 lt!489512) #b00000000000000000000000000000000)))))

(declare-fun d!130063 () Bool)

(declare-fun res!730647 () Bool)

(declare-fun e!625035 () Bool)

(assert (=> d!130063 (=> res!730647 e!625035)))

(assert (=> d!130063 (= res!730647 (bvsge #b00000000000000000000000000000000 (size!34614 lt!489512)))))

(assert (=> d!130063 (= (arrayNoDuplicates!0 lt!489512 #b00000000000000000000000000000000 Nil!23859) e!625035)))

(declare-fun b!1094802 () Bool)

(assert (=> b!1094802 (= e!625035 e!625037)))

(declare-fun res!730645 () Bool)

(assert (=> b!1094802 (=> (not res!730645) (not e!625037))))

(assert (=> b!1094802 (= res!730645 (not e!625034))))

(declare-fun res!730646 () Bool)

(assert (=> b!1094802 (=> (not res!730646) (not e!625034))))

(assert (=> b!1094802 (= res!730646 (validKeyInArray!0 (select (arr!34076 lt!489512) #b00000000000000000000000000000000)))))

(declare-fun b!1094803 () Bool)

(assert (=> b!1094803 (= e!625036 call!45731)))

(declare-fun b!1094804 () Bool)

(assert (=> b!1094804 (= e!625036 call!45731)))

(assert (= (and d!130063 (not res!730647)) b!1094802))

(assert (= (and b!1094802 res!730646) b!1094801))

(assert (= (and b!1094802 res!730645) b!1094800))

(assert (= (and b!1094800 c!108309) b!1094803))

(assert (= (and b!1094800 (not c!108309)) b!1094804))

(assert (= (or b!1094803 b!1094804) bm!45728))

(assert (=> b!1094800 m!1014091))

(assert (=> b!1094800 m!1014091))

(assert (=> b!1094800 m!1014093))

(assert (=> bm!45728 m!1014091))

(declare-fun m!1014101 () Bool)

(assert (=> bm!45728 m!1014101))

(assert (=> b!1094801 m!1014091))

(assert (=> b!1094801 m!1014091))

(declare-fun m!1014103 () Bool)

(assert (=> b!1094801 m!1014103))

(assert (=> b!1094802 m!1014091))

(assert (=> b!1094802 m!1014091))

(assert (=> b!1094802 m!1014093))

(assert (=> b!1094701 d!130063))

(declare-fun d!130065 () Bool)

(assert (=> d!130065 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96328 d!130065))

(declare-fun d!130067 () Bool)

(assert (=> d!130067 (= (array_inv!26292 _keys!1070) (bvsge (size!34614 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96328 d!130067))

(declare-fun d!130069 () Bool)

(assert (=> d!130069 (= (array_inv!26293 _values!874) (bvsge (size!34615 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96328 d!130069))

(declare-fun d!130071 () Bool)

(assert (=> d!130071 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1094694 d!130071))

(declare-fun d!130073 () Bool)

(declare-fun res!730649 () Bool)

(declare-fun e!625040 () Bool)

(assert (=> d!130073 (=> res!730649 e!625040)))

(assert (=> d!130073 (= res!730649 (bvsge #b00000000000000000000000000000000 (size!34614 _keys!1070)))))

(assert (=> d!130073 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!625040)))

(declare-fun b!1094805 () Bool)

(declare-fun e!625038 () Bool)

(declare-fun call!45732 () Bool)

(assert (=> b!1094805 (= e!625038 call!45732)))

(declare-fun bm!45729 () Bool)

(assert (=> bm!45729 (= call!45732 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1094806 () Bool)

(declare-fun e!625039 () Bool)

(assert (=> b!1094806 (= e!625039 call!45732)))

(declare-fun b!1094807 () Bool)

(assert (=> b!1094807 (= e!625040 e!625038)))

(declare-fun c!108310 () Bool)

(assert (=> b!1094807 (= c!108310 (validKeyInArray!0 (select (arr!34076 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1094808 () Bool)

(assert (=> b!1094808 (= e!625038 e!625039)))

(declare-fun lt!489529 () (_ BitVec 64))

(assert (=> b!1094808 (= lt!489529 (select (arr!34076 _keys!1070) #b00000000000000000000000000000000))))

(declare-fun lt!489528 () Unit!35861)

(assert (=> b!1094808 (= lt!489528 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!489529 #b00000000000000000000000000000000))))

(assert (=> b!1094808 (arrayContainsKey!0 _keys!1070 lt!489529 #b00000000000000000000000000000000)))

(declare-fun lt!489530 () Unit!35861)

(assert (=> b!1094808 (= lt!489530 lt!489528)))

(declare-fun res!730648 () Bool)

(assert (=> b!1094808 (= res!730648 (= (seekEntryOrOpen!0 (select (arr!34076 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9903 #b00000000000000000000000000000000)))))

(assert (=> b!1094808 (=> (not res!730648) (not e!625039))))

(assert (= (and d!130073 (not res!730649)) b!1094807))

(assert (= (and b!1094807 c!108310) b!1094808))

(assert (= (and b!1094807 (not c!108310)) b!1094805))

(assert (= (and b!1094808 res!730648) b!1094806))

(assert (= (or b!1094806 b!1094805) bm!45729))

(declare-fun m!1014105 () Bool)

(assert (=> bm!45729 m!1014105))

(declare-fun m!1014107 () Bool)

(assert (=> b!1094807 m!1014107))

(assert (=> b!1094807 m!1014107))

(declare-fun m!1014109 () Bool)

(assert (=> b!1094807 m!1014109))

(assert (=> b!1094808 m!1014107))

(declare-fun m!1014111 () Bool)

(assert (=> b!1094808 m!1014111))

(declare-fun m!1014113 () Bool)

(assert (=> b!1094808 m!1014113))

(assert (=> b!1094808 m!1014107))

(declare-fun m!1014115 () Bool)

(assert (=> b!1094808 m!1014115))

(assert (=> b!1094698 d!130073))

(declare-fun b!1094809 () Bool)

(declare-fun e!625044 () Bool)

(declare-fun e!625043 () Bool)

(assert (=> b!1094809 (= e!625044 e!625043)))

(declare-fun c!108311 () Bool)

(assert (=> b!1094809 (= c!108311 (validKeyInArray!0 (select (arr!34076 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun bm!45730 () Bool)

(declare-fun call!45733 () Bool)

(assert (=> bm!45730 (= call!45733 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108311 (Cons!23858 (select (arr!34076 _keys!1070) #b00000000000000000000000000000000) Nil!23859) Nil!23859)))))

(declare-fun b!1094810 () Bool)

(declare-fun e!625041 () Bool)

(assert (=> b!1094810 (= e!625041 (contains!6345 Nil!23859 (select (arr!34076 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130075 () Bool)

(declare-fun res!730652 () Bool)

(declare-fun e!625042 () Bool)

(assert (=> d!130075 (=> res!730652 e!625042)))

(assert (=> d!130075 (= res!730652 (bvsge #b00000000000000000000000000000000 (size!34614 _keys!1070)))))

(assert (=> d!130075 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23859) e!625042)))

(declare-fun b!1094811 () Bool)

(assert (=> b!1094811 (= e!625042 e!625044)))

(declare-fun res!730650 () Bool)

(assert (=> b!1094811 (=> (not res!730650) (not e!625044))))

(assert (=> b!1094811 (= res!730650 (not e!625041))))

(declare-fun res!730651 () Bool)

(assert (=> b!1094811 (=> (not res!730651) (not e!625041))))

(assert (=> b!1094811 (= res!730651 (validKeyInArray!0 (select (arr!34076 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1094812 () Bool)

(assert (=> b!1094812 (= e!625043 call!45733)))

(declare-fun b!1094813 () Bool)

(assert (=> b!1094813 (= e!625043 call!45733)))

(assert (= (and d!130075 (not res!730652)) b!1094811))

(assert (= (and b!1094811 res!730651) b!1094810))

(assert (= (and b!1094811 res!730650) b!1094809))

(assert (= (and b!1094809 c!108311) b!1094812))

(assert (= (and b!1094809 (not c!108311)) b!1094813))

(assert (= (or b!1094812 b!1094813) bm!45730))

(assert (=> b!1094809 m!1014107))

(assert (=> b!1094809 m!1014107))

(assert (=> b!1094809 m!1014109))

(assert (=> bm!45730 m!1014107))

(declare-fun m!1014117 () Bool)

(assert (=> bm!45730 m!1014117))

(assert (=> b!1094810 m!1014107))

(assert (=> b!1094810 m!1014107))

(declare-fun m!1014119 () Bool)

(assert (=> b!1094810 m!1014119))

(assert (=> b!1094811 m!1014107))

(assert (=> b!1094811 m!1014107))

(assert (=> b!1094811 m!1014109))

(assert (=> b!1094695 d!130075))

(declare-fun condMapEmpty!42247 () Bool)

(declare-fun mapDefault!42247 () ValueCell!12785)

(assert (=> mapNonEmpty!42238 (= condMapEmpty!42247 (= mapRest!42238 ((as const (Array (_ BitVec 32) ValueCell!12785)) mapDefault!42247)))))

(declare-fun e!625050 () Bool)

(declare-fun mapRes!42247 () Bool)

(assert (=> mapNonEmpty!42238 (= tp!80753 (and e!625050 mapRes!42247))))

(declare-fun mapIsEmpty!42247 () Bool)

(assert (=> mapIsEmpty!42247 mapRes!42247))

(declare-fun mapNonEmpty!42247 () Bool)

(declare-fun tp!80762 () Bool)

(declare-fun e!625049 () Bool)

(assert (=> mapNonEmpty!42247 (= mapRes!42247 (and tp!80762 e!625049))))

(declare-fun mapRest!42247 () (Array (_ BitVec 32) ValueCell!12785))

(declare-fun mapValue!42247 () ValueCell!12785)

(declare-fun mapKey!42247 () (_ BitVec 32))

(assert (=> mapNonEmpty!42247 (= mapRest!42238 (store mapRest!42247 mapKey!42247 mapValue!42247))))

(declare-fun b!1094821 () Bool)

(assert (=> b!1094821 (= e!625050 tp_is_empty!26989)))

(declare-fun b!1094820 () Bool)

(assert (=> b!1094820 (= e!625049 tp_is_empty!26989)))

(assert (= (and mapNonEmpty!42238 condMapEmpty!42247) mapIsEmpty!42247))

(assert (= (and mapNonEmpty!42238 (not condMapEmpty!42247)) mapNonEmpty!42247))

(assert (= (and mapNonEmpty!42247 ((_ is ValueCellFull!12785) mapValue!42247)) b!1094820))

(assert (= (and mapNonEmpty!42238 ((_ is ValueCellFull!12785) mapDefault!42247)) b!1094821))

(declare-fun m!1014121 () Bool)

(assert (=> mapNonEmpty!42247 m!1014121))

(check-sat (not b!1094808) (not b!1094811) (not bm!45725) (not bm!45730) (not bm!45729) (not b!1094802) (not mapNonEmpty!42247) (not b!1094809) (not b!1094810) (not b!1094800) (not b!1094807) (not b!1094789) tp_is_empty!26989 (not bm!45728) (not b!1094801) (not b!1094788))
(check-sat)
