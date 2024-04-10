; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96354 () Bool)

(assert start!96354)

(declare-fun b!1095040 () Bool)

(declare-fun e!625176 () Bool)

(declare-fun e!625177 () Bool)

(declare-fun mapRes!42253 () Bool)

(assert (=> b!1095040 (= e!625176 (and e!625177 mapRes!42253))))

(declare-fun condMapEmpty!42253 () Bool)

(declare-datatypes ((V!41123 0))(
  ( (V!41124 (val!13555 Int)) )
))
(declare-datatypes ((ValueCell!12789 0))(
  ( (ValueCellFull!12789 (v!16176 V!41123)) (EmptyCell!12789) )
))
(declare-datatypes ((array!70909 0))(
  ( (array!70910 (arr!34127 (Array (_ BitVec 32) ValueCell!12789)) (size!34663 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70909)

(declare-fun mapDefault!42253 () ValueCell!12789)

(assert (=> b!1095040 (= condMapEmpty!42253 (= (arr!34127 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12789)) mapDefault!42253)))))

(declare-fun b!1095041 () Bool)

(declare-fun res!730781 () Bool)

(declare-fun e!625178 () Bool)

(assert (=> b!1095041 (=> (not res!730781) (not e!625178))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!70911 0))(
  ( (array!70912 (arr!34128 (Array (_ BitVec 32) (_ BitVec 64))) (size!34664 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70911)

(assert (=> b!1095041 (= res!730781 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34664 _keys!1070))))))

(declare-fun b!1095042 () Bool)

(declare-fun res!730777 () Bool)

(assert (=> b!1095042 (=> (not res!730777) (not e!625178))))

(declare-datatypes ((List!23833 0))(
  ( (Nil!23830) (Cons!23829 (h!25038 (_ BitVec 64)) (t!33840 List!23833)) )
))
(declare-fun arrayNoDuplicates!0 (array!70911 (_ BitVec 32) List!23833) Bool)

(assert (=> b!1095042 (= res!730777 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23830))))

(declare-fun b!1095043 () Bool)

(declare-fun tp_is_empty!26997 () Bool)

(assert (=> b!1095043 (= e!625177 tp_is_empty!26997)))

(declare-fun b!1095044 () Bool)

(declare-fun e!625175 () Bool)

(assert (=> b!1095044 (= e!625178 e!625175)))

(declare-fun res!730776 () Bool)

(assert (=> b!1095044 (=> (not res!730776) (not e!625175))))

(declare-fun lt!489736 () array!70911)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70911 (_ BitVec 32)) Bool)

(assert (=> b!1095044 (= res!730776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489736 mask!1414))))

(assert (=> b!1095044 (= lt!489736 (array!70912 (store (arr!34128 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34664 _keys!1070)))))

(declare-fun b!1095045 () Bool)

(declare-fun res!730779 () Bool)

(assert (=> b!1095045 (=> (not res!730779) (not e!625175))))

(assert (=> b!1095045 (= res!730779 (arrayNoDuplicates!0 lt!489736 #b00000000000000000000000000000000 Nil!23830))))

(declare-fun b!1095046 () Bool)

(declare-fun res!730773 () Bool)

(assert (=> b!1095046 (=> (not res!730773) (not e!625178))))

(assert (=> b!1095046 (= res!730773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1095047 () Bool)

(declare-fun e!625179 () Bool)

(assert (=> b!1095047 (= e!625179 tp_is_empty!26997)))

(declare-fun res!730774 () Bool)

(assert (=> start!96354 (=> (not res!730774) (not e!625178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96354 (= res!730774 (validMask!0 mask!1414))))

(assert (=> start!96354 e!625178))

(assert (=> start!96354 true))

(declare-fun array_inv!26300 (array!70911) Bool)

(assert (=> start!96354 (array_inv!26300 _keys!1070)))

(declare-fun array_inv!26301 (array!70909) Bool)

(assert (=> start!96354 (and (array_inv!26301 _values!874) e!625176)))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun b!1095048 () Bool)

(declare-fun arrayContainsKey!0 (array!70911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1095048 (= e!625175 (not (arrayContainsKey!0 _keys!1070 k0!904 i!650)))))

(declare-fun mapNonEmpty!42253 () Bool)

(declare-fun tp!80768 () Bool)

(assert (=> mapNonEmpty!42253 (= mapRes!42253 (and tp!80768 e!625179))))

(declare-fun mapRest!42253 () (Array (_ BitVec 32) ValueCell!12789))

(declare-fun mapValue!42253 () ValueCell!12789)

(declare-fun mapKey!42253 () (_ BitVec 32))

(assert (=> mapNonEmpty!42253 (= (arr!34127 _values!874) (store mapRest!42253 mapKey!42253 mapValue!42253))))

(declare-fun mapIsEmpty!42253 () Bool)

(assert (=> mapIsEmpty!42253 mapRes!42253))

(declare-fun b!1095049 () Bool)

(declare-fun res!730778 () Bool)

(assert (=> b!1095049 (=> (not res!730778) (not e!625178))))

(assert (=> b!1095049 (= res!730778 (= (select (arr!34128 _keys!1070) i!650) k0!904))))

(declare-fun b!1095050 () Bool)

(declare-fun res!730772 () Bool)

(assert (=> b!1095050 (=> (not res!730772) (not e!625178))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1095050 (= res!730772 (validKeyInArray!0 k0!904))))

(declare-fun b!1095051 () Bool)

(declare-fun res!730775 () Bool)

(assert (=> b!1095051 (=> (not res!730775) (not e!625178))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1095051 (= res!730775 (and (= (size!34663 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34664 _keys!1070) (size!34663 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1095052 () Bool)

(declare-fun res!730780 () Bool)

(assert (=> b!1095052 (=> (not res!730780) (not e!625175))))

(assert (=> b!1095052 (= res!730780 (bvslt (size!34664 _keys!1070) #b01111111111111111111111111111111))))

(assert (= (and start!96354 res!730774) b!1095051))

(assert (= (and b!1095051 res!730775) b!1095046))

(assert (= (and b!1095046 res!730773) b!1095042))

(assert (= (and b!1095042 res!730777) b!1095041))

(assert (= (and b!1095041 res!730781) b!1095050))

(assert (= (and b!1095050 res!730772) b!1095049))

(assert (= (and b!1095049 res!730778) b!1095044))

(assert (= (and b!1095044 res!730776) b!1095045))

(assert (= (and b!1095045 res!730779) b!1095052))

(assert (= (and b!1095052 res!730780) b!1095048))

(assert (= (and b!1095040 condMapEmpty!42253) mapIsEmpty!42253))

(assert (= (and b!1095040 (not condMapEmpty!42253)) mapNonEmpty!42253))

(get-info :version)

(assert (= (and mapNonEmpty!42253 ((_ is ValueCellFull!12789) mapValue!42253)) b!1095047))

(assert (= (and b!1095040 ((_ is ValueCellFull!12789) mapDefault!42253)) b!1095043))

(assert (= start!96354 b!1095040))

(declare-fun m!1014773 () Bool)

(assert (=> b!1095050 m!1014773))

(declare-fun m!1014775 () Bool)

(assert (=> b!1095049 m!1014775))

(declare-fun m!1014777 () Bool)

(assert (=> mapNonEmpty!42253 m!1014777))

(declare-fun m!1014779 () Bool)

(assert (=> b!1095045 m!1014779))

(declare-fun m!1014781 () Bool)

(assert (=> start!96354 m!1014781))

(declare-fun m!1014783 () Bool)

(assert (=> start!96354 m!1014783))

(declare-fun m!1014785 () Bool)

(assert (=> start!96354 m!1014785))

(declare-fun m!1014787 () Bool)

(assert (=> b!1095044 m!1014787))

(declare-fun m!1014789 () Bool)

(assert (=> b!1095044 m!1014789))

(declare-fun m!1014791 () Bool)

(assert (=> b!1095042 m!1014791))

(declare-fun m!1014793 () Bool)

(assert (=> b!1095046 m!1014793))

(declare-fun m!1014795 () Bool)

(assert (=> b!1095048 m!1014795))

(check-sat (not b!1095046) (not mapNonEmpty!42253) tp_is_empty!26997 (not b!1095042) (not b!1095045) (not b!1095044) (not b!1095048) (not b!1095050) (not start!96354))
(check-sat)
(get-model)

(declare-fun bm!45756 () Bool)

(declare-fun call!45759 () Bool)

(declare-fun c!108353 () Bool)

(assert (=> bm!45756 (= call!45759 (arrayNoDuplicates!0 lt!489736 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108353 (Cons!23829 (select (arr!34128 lt!489736) #b00000000000000000000000000000000) Nil!23830) Nil!23830)))))

(declare-fun b!1095102 () Bool)

(declare-fun e!625206 () Bool)

(assert (=> b!1095102 (= e!625206 call!45759)))

(declare-fun b!1095103 () Bool)

(declare-fun e!625209 () Bool)

(assert (=> b!1095103 (= e!625209 e!625206)))

(assert (=> b!1095103 (= c!108353 (validKeyInArray!0 (select (arr!34128 lt!489736) #b00000000000000000000000000000000)))))

(declare-fun d!130235 () Bool)

(declare-fun res!730818 () Bool)

(declare-fun e!625208 () Bool)

(assert (=> d!130235 (=> res!730818 e!625208)))

(assert (=> d!130235 (= res!730818 (bvsge #b00000000000000000000000000000000 (size!34664 lt!489736)))))

(assert (=> d!130235 (= (arrayNoDuplicates!0 lt!489736 #b00000000000000000000000000000000 Nil!23830) e!625208)))

(declare-fun b!1095104 () Bool)

(assert (=> b!1095104 (= e!625206 call!45759)))

(declare-fun b!1095105 () Bool)

(declare-fun e!625207 () Bool)

(declare-fun contains!6376 (List!23833 (_ BitVec 64)) Bool)

(assert (=> b!1095105 (= e!625207 (contains!6376 Nil!23830 (select (arr!34128 lt!489736) #b00000000000000000000000000000000)))))

(declare-fun b!1095106 () Bool)

(assert (=> b!1095106 (= e!625208 e!625209)))

(declare-fun res!730819 () Bool)

(assert (=> b!1095106 (=> (not res!730819) (not e!625209))))

(assert (=> b!1095106 (= res!730819 (not e!625207))))

(declare-fun res!730820 () Bool)

(assert (=> b!1095106 (=> (not res!730820) (not e!625207))))

(assert (=> b!1095106 (= res!730820 (validKeyInArray!0 (select (arr!34128 lt!489736) #b00000000000000000000000000000000)))))

(assert (= (and d!130235 (not res!730818)) b!1095106))

(assert (= (and b!1095106 res!730820) b!1095105))

(assert (= (and b!1095106 res!730819) b!1095103))

(assert (= (and b!1095103 c!108353) b!1095102))

(assert (= (and b!1095103 (not c!108353)) b!1095104))

(assert (= (or b!1095102 b!1095104) bm!45756))

(declare-fun m!1014821 () Bool)

(assert (=> bm!45756 m!1014821))

(declare-fun m!1014823 () Bool)

(assert (=> bm!45756 m!1014823))

(assert (=> b!1095103 m!1014821))

(assert (=> b!1095103 m!1014821))

(declare-fun m!1014825 () Bool)

(assert (=> b!1095103 m!1014825))

(assert (=> b!1095105 m!1014821))

(assert (=> b!1095105 m!1014821))

(declare-fun m!1014827 () Bool)

(assert (=> b!1095105 m!1014827))

(assert (=> b!1095106 m!1014821))

(assert (=> b!1095106 m!1014821))

(assert (=> b!1095106 m!1014825))

(assert (=> b!1095045 d!130235))

(declare-fun b!1095115 () Bool)

(declare-fun e!625217 () Bool)

(declare-fun call!45762 () Bool)

(assert (=> b!1095115 (= e!625217 call!45762)))

(declare-fun b!1095116 () Bool)

(declare-fun e!625216 () Bool)

(assert (=> b!1095116 (= e!625217 e!625216)))

(declare-fun lt!489748 () (_ BitVec 64))

(assert (=> b!1095116 (= lt!489748 (select (arr!34128 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!36028 0))(
  ( (Unit!36029) )
))
(declare-fun lt!489747 () Unit!36028)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70911 (_ BitVec 64) (_ BitVec 32)) Unit!36028)

(assert (=> b!1095116 (= lt!489747 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!489748 #b00000000000000000000000000000000))))

(assert (=> b!1095116 (arrayContainsKey!0 _keys!1070 lt!489748 #b00000000000000000000000000000000)))

(declare-fun lt!489746 () Unit!36028)

(assert (=> b!1095116 (= lt!489746 lt!489747)))

(declare-fun res!730826 () Bool)

(declare-datatypes ((SeekEntryResult!9905 0))(
  ( (MissingZero!9905 (index!41991 (_ BitVec 32))) (Found!9905 (index!41992 (_ BitVec 32))) (Intermediate!9905 (undefined!10717 Bool) (index!41993 (_ BitVec 32)) (x!98430 (_ BitVec 32))) (Undefined!9905) (MissingVacant!9905 (index!41994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!70911 (_ BitVec 32)) SeekEntryResult!9905)

(assert (=> b!1095116 (= res!730826 (= (seekEntryOrOpen!0 (select (arr!34128 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9905 #b00000000000000000000000000000000)))))

(assert (=> b!1095116 (=> (not res!730826) (not e!625216))))

(declare-fun bm!45759 () Bool)

(assert (=> bm!45759 (= call!45762 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1095117 () Bool)

(declare-fun e!625218 () Bool)

(assert (=> b!1095117 (= e!625218 e!625217)))

(declare-fun c!108356 () Bool)

(assert (=> b!1095117 (= c!108356 (validKeyInArray!0 (select (arr!34128 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1095118 () Bool)

(assert (=> b!1095118 (= e!625216 call!45762)))

(declare-fun d!130237 () Bool)

(declare-fun res!730825 () Bool)

(assert (=> d!130237 (=> res!730825 e!625218)))

(assert (=> d!130237 (= res!730825 (bvsge #b00000000000000000000000000000000 (size!34664 _keys!1070)))))

(assert (=> d!130237 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!625218)))

(assert (= (and d!130237 (not res!730825)) b!1095117))

(assert (= (and b!1095117 c!108356) b!1095116))

(assert (= (and b!1095117 (not c!108356)) b!1095115))

(assert (= (and b!1095116 res!730826) b!1095118))

(assert (= (or b!1095118 b!1095115) bm!45759))

(declare-fun m!1014829 () Bool)

(assert (=> b!1095116 m!1014829))

(declare-fun m!1014831 () Bool)

(assert (=> b!1095116 m!1014831))

(declare-fun m!1014833 () Bool)

(assert (=> b!1095116 m!1014833))

(assert (=> b!1095116 m!1014829))

(declare-fun m!1014835 () Bool)

(assert (=> b!1095116 m!1014835))

(declare-fun m!1014837 () Bool)

(assert (=> bm!45759 m!1014837))

(assert (=> b!1095117 m!1014829))

(assert (=> b!1095117 m!1014829))

(declare-fun m!1014839 () Bool)

(assert (=> b!1095117 m!1014839))

(assert (=> b!1095046 d!130237))

(declare-fun d!130239 () Bool)

(assert (=> d!130239 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1095050 d!130239))

(declare-fun d!130241 () Bool)

(assert (=> d!130241 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96354 d!130241))

(declare-fun d!130243 () Bool)

(assert (=> d!130243 (= (array_inv!26300 _keys!1070) (bvsge (size!34664 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96354 d!130243))

(declare-fun d!130245 () Bool)

(assert (=> d!130245 (= (array_inv!26301 _values!874) (bvsge (size!34663 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96354 d!130245))

(declare-fun bm!45760 () Bool)

(declare-fun call!45763 () Bool)

(declare-fun c!108357 () Bool)

(assert (=> bm!45760 (= call!45763 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108357 (Cons!23829 (select (arr!34128 _keys!1070) #b00000000000000000000000000000000) Nil!23830) Nil!23830)))))

(declare-fun b!1095119 () Bool)

(declare-fun e!625219 () Bool)

(assert (=> b!1095119 (= e!625219 call!45763)))

(declare-fun b!1095120 () Bool)

(declare-fun e!625222 () Bool)

(assert (=> b!1095120 (= e!625222 e!625219)))

(assert (=> b!1095120 (= c!108357 (validKeyInArray!0 (select (arr!34128 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun d!130247 () Bool)

(declare-fun res!730827 () Bool)

(declare-fun e!625221 () Bool)

(assert (=> d!130247 (=> res!730827 e!625221)))

(assert (=> d!130247 (= res!730827 (bvsge #b00000000000000000000000000000000 (size!34664 _keys!1070)))))

(assert (=> d!130247 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23830) e!625221)))

(declare-fun b!1095121 () Bool)

(assert (=> b!1095121 (= e!625219 call!45763)))

(declare-fun b!1095122 () Bool)

(declare-fun e!625220 () Bool)

(assert (=> b!1095122 (= e!625220 (contains!6376 Nil!23830 (select (arr!34128 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1095123 () Bool)

(assert (=> b!1095123 (= e!625221 e!625222)))

(declare-fun res!730828 () Bool)

(assert (=> b!1095123 (=> (not res!730828) (not e!625222))))

(assert (=> b!1095123 (= res!730828 (not e!625220))))

(declare-fun res!730829 () Bool)

(assert (=> b!1095123 (=> (not res!730829) (not e!625220))))

(assert (=> b!1095123 (= res!730829 (validKeyInArray!0 (select (arr!34128 _keys!1070) #b00000000000000000000000000000000)))))

(assert (= (and d!130247 (not res!730827)) b!1095123))

(assert (= (and b!1095123 res!730829) b!1095122))

(assert (= (and b!1095123 res!730828) b!1095120))

(assert (= (and b!1095120 c!108357) b!1095119))

(assert (= (and b!1095120 (not c!108357)) b!1095121))

(assert (= (or b!1095119 b!1095121) bm!45760))

(assert (=> bm!45760 m!1014829))

(declare-fun m!1014841 () Bool)

(assert (=> bm!45760 m!1014841))

(assert (=> b!1095120 m!1014829))

(assert (=> b!1095120 m!1014829))

(assert (=> b!1095120 m!1014839))

(assert (=> b!1095122 m!1014829))

(assert (=> b!1095122 m!1014829))

(declare-fun m!1014843 () Bool)

(assert (=> b!1095122 m!1014843))

(assert (=> b!1095123 m!1014829))

(assert (=> b!1095123 m!1014829))

(assert (=> b!1095123 m!1014839))

(assert (=> b!1095042 d!130247))

(declare-fun d!130249 () Bool)

(declare-fun res!730834 () Bool)

(declare-fun e!625227 () Bool)

(assert (=> d!130249 (=> res!730834 e!625227)))

(assert (=> d!130249 (= res!730834 (= (select (arr!34128 _keys!1070) i!650) k0!904))))

(assert (=> d!130249 (= (arrayContainsKey!0 _keys!1070 k0!904 i!650) e!625227)))

(declare-fun b!1095128 () Bool)

(declare-fun e!625228 () Bool)

(assert (=> b!1095128 (= e!625227 e!625228)))

(declare-fun res!730835 () Bool)

(assert (=> b!1095128 (=> (not res!730835) (not e!625228))))

(assert (=> b!1095128 (= res!730835 (bvslt (bvadd i!650 #b00000000000000000000000000000001) (size!34664 _keys!1070)))))

(declare-fun b!1095129 () Bool)

(assert (=> b!1095129 (= e!625228 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd i!650 #b00000000000000000000000000000001)))))

(assert (= (and d!130249 (not res!730834)) b!1095128))

(assert (= (and b!1095128 res!730835) b!1095129))

(assert (=> d!130249 m!1014775))

(declare-fun m!1014845 () Bool)

(assert (=> b!1095129 m!1014845))

(assert (=> b!1095048 d!130249))

(declare-fun b!1095130 () Bool)

(declare-fun e!625230 () Bool)

(declare-fun call!45764 () Bool)

(assert (=> b!1095130 (= e!625230 call!45764)))

(declare-fun b!1095131 () Bool)

(declare-fun e!625229 () Bool)

(assert (=> b!1095131 (= e!625230 e!625229)))

(declare-fun lt!489751 () (_ BitVec 64))

(assert (=> b!1095131 (= lt!489751 (select (arr!34128 lt!489736) #b00000000000000000000000000000000))))

(declare-fun lt!489750 () Unit!36028)

(assert (=> b!1095131 (= lt!489750 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!489736 lt!489751 #b00000000000000000000000000000000))))

(assert (=> b!1095131 (arrayContainsKey!0 lt!489736 lt!489751 #b00000000000000000000000000000000)))

(declare-fun lt!489749 () Unit!36028)

(assert (=> b!1095131 (= lt!489749 lt!489750)))

(declare-fun res!730837 () Bool)

(assert (=> b!1095131 (= res!730837 (= (seekEntryOrOpen!0 (select (arr!34128 lt!489736) #b00000000000000000000000000000000) lt!489736 mask!1414) (Found!9905 #b00000000000000000000000000000000)))))

(assert (=> b!1095131 (=> (not res!730837) (not e!625229))))

(declare-fun bm!45761 () Bool)

(assert (=> bm!45761 (= call!45764 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!489736 mask!1414))))

(declare-fun b!1095132 () Bool)

(declare-fun e!625231 () Bool)

(assert (=> b!1095132 (= e!625231 e!625230)))

(declare-fun c!108358 () Bool)

(assert (=> b!1095132 (= c!108358 (validKeyInArray!0 (select (arr!34128 lt!489736) #b00000000000000000000000000000000)))))

(declare-fun b!1095133 () Bool)

(assert (=> b!1095133 (= e!625229 call!45764)))

(declare-fun d!130251 () Bool)

(declare-fun res!730836 () Bool)

(assert (=> d!130251 (=> res!730836 e!625231)))

(assert (=> d!130251 (= res!730836 (bvsge #b00000000000000000000000000000000 (size!34664 lt!489736)))))

(assert (=> d!130251 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489736 mask!1414) e!625231)))

(assert (= (and d!130251 (not res!730836)) b!1095132))

(assert (= (and b!1095132 c!108358) b!1095131))

(assert (= (and b!1095132 (not c!108358)) b!1095130))

(assert (= (and b!1095131 res!730837) b!1095133))

(assert (= (or b!1095133 b!1095130) bm!45761))

(assert (=> b!1095131 m!1014821))

(declare-fun m!1014847 () Bool)

(assert (=> b!1095131 m!1014847))

(declare-fun m!1014849 () Bool)

(assert (=> b!1095131 m!1014849))

(assert (=> b!1095131 m!1014821))

(declare-fun m!1014851 () Bool)

(assert (=> b!1095131 m!1014851))

(declare-fun m!1014853 () Bool)

(assert (=> bm!45761 m!1014853))

(assert (=> b!1095132 m!1014821))

(assert (=> b!1095132 m!1014821))

(assert (=> b!1095132 m!1014825))

(assert (=> b!1095044 d!130251))

(declare-fun mapNonEmpty!42259 () Bool)

(declare-fun mapRes!42259 () Bool)

(declare-fun tp!80774 () Bool)

(declare-fun e!625237 () Bool)

(assert (=> mapNonEmpty!42259 (= mapRes!42259 (and tp!80774 e!625237))))

(declare-fun mapValue!42259 () ValueCell!12789)

(declare-fun mapKey!42259 () (_ BitVec 32))

(declare-fun mapRest!42259 () (Array (_ BitVec 32) ValueCell!12789))

(assert (=> mapNonEmpty!42259 (= mapRest!42253 (store mapRest!42259 mapKey!42259 mapValue!42259))))

(declare-fun b!1095140 () Bool)

(assert (=> b!1095140 (= e!625237 tp_is_empty!26997)))

(declare-fun mapIsEmpty!42259 () Bool)

(assert (=> mapIsEmpty!42259 mapRes!42259))

(declare-fun b!1095141 () Bool)

(declare-fun e!625236 () Bool)

(assert (=> b!1095141 (= e!625236 tp_is_empty!26997)))

(declare-fun condMapEmpty!42259 () Bool)

(declare-fun mapDefault!42259 () ValueCell!12789)

(assert (=> mapNonEmpty!42253 (= condMapEmpty!42259 (= mapRest!42253 ((as const (Array (_ BitVec 32) ValueCell!12789)) mapDefault!42259)))))

(assert (=> mapNonEmpty!42253 (= tp!80768 (and e!625236 mapRes!42259))))

(assert (= (and mapNonEmpty!42253 condMapEmpty!42259) mapIsEmpty!42259))

(assert (= (and mapNonEmpty!42253 (not condMapEmpty!42259)) mapNonEmpty!42259))

(assert (= (and mapNonEmpty!42259 ((_ is ValueCellFull!12789) mapValue!42259)) b!1095140))

(assert (= (and mapNonEmpty!42253 ((_ is ValueCellFull!12789) mapDefault!42259)) b!1095141))

(declare-fun m!1014855 () Bool)

(assert (=> mapNonEmpty!42259 m!1014855))

(check-sat (not bm!45756) (not bm!45759) (not b!1095131) (not b!1095129) (not b!1095106) (not b!1095103) (not bm!45761) (not bm!45760) (not b!1095117) (not b!1095105) (not b!1095122) tp_is_empty!26997 (not b!1095120) (not b!1095132) (not b!1095123) (not b!1095116) (not mapNonEmpty!42259))
(check-sat)
