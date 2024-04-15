; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!96346 () Bool)

(assert start!96346)

(declare-fun b!1094848 () Bool)

(declare-fun res!730675 () Bool)

(declare-fun e!625063 () Bool)

(assert (=> b!1094848 (=> (not res!730675) (not e!625063))))

(declare-datatypes ((array!70818 0))(
  ( (array!70819 (arr!34082 (Array (_ BitVec 32) (_ BitVec 64))) (size!34620 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70818)

(assert (=> b!1094848 (= res!730675 (bvslt (size!34620 _keys!1070) #b01111111111111111111111111111111))))

(declare-fun b!1094849 () Bool)

(declare-fun res!730678 () Bool)

(declare-fun e!625066 () Bool)

(assert (=> b!1094849 (=> (not res!730678) (not e!625066))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!41121 0))(
  ( (V!41122 (val!13554 Int)) )
))
(declare-datatypes ((ValueCell!12788 0))(
  ( (ValueCellFull!12788 (v!16174 V!41121)) (EmptyCell!12788) )
))
(declare-datatypes ((array!70820 0))(
  ( (array!70821 (arr!34083 (Array (_ BitVec 32) ValueCell!12788)) (size!34621 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70820)

(assert (=> b!1094849 (= res!730678 (and (= (size!34621 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34620 _keys!1070) (size!34621 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun res!730673 () Bool)

(assert (=> start!96346 (=> (not res!730673) (not e!625066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96346 (= res!730673 (validMask!0 mask!1414))))

(assert (=> start!96346 e!625066))

(assert (=> start!96346 true))

(declare-fun array_inv!26298 (array!70818) Bool)

(assert (=> start!96346 (array_inv!26298 _keys!1070)))

(declare-fun e!625065 () Bool)

(declare-fun array_inv!26299 (array!70820) Bool)

(assert (=> start!96346 (and (array_inv!26299 _values!874) e!625065)))

(declare-fun b!1094850 () Bool)

(declare-fun e!625064 () Bool)

(declare-fun tp_is_empty!26995 () Bool)

(assert (=> b!1094850 (= e!625064 tp_is_empty!26995)))

(declare-fun b!1094851 () Bool)

(declare-fun res!730681 () Bool)

(assert (=> b!1094851 (=> (not res!730681) (not e!625066))))

(declare-fun k0!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1094851 (= res!730681 (= (select (arr!34082 _keys!1070) i!650) k0!904))))

(declare-fun mapIsEmpty!42250 () Bool)

(declare-fun mapRes!42250 () Bool)

(assert (=> mapIsEmpty!42250 mapRes!42250))

(declare-fun b!1094852 () Bool)

(declare-fun res!730680 () Bool)

(assert (=> b!1094852 (=> (not res!730680) (not e!625066))))

(declare-datatypes ((List!23865 0))(
  ( (Nil!23862) (Cons!23861 (h!25070 (_ BitVec 64)) (t!33863 List!23865)) )
))
(declare-fun arrayNoDuplicates!0 (array!70818 (_ BitVec 32) List!23865) Bool)

(assert (=> b!1094852 (= res!730680 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23862))))

(declare-fun b!1094853 () Bool)

(declare-fun arrayContainsKey!0 (array!70818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1094853 (= e!625063 (not (arrayContainsKey!0 _keys!1070 k0!904 i!650)))))

(declare-fun b!1094854 () Bool)

(declare-fun res!730682 () Bool)

(assert (=> b!1094854 (=> (not res!730682) (not e!625066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1094854 (= res!730682 (validKeyInArray!0 k0!904))))

(declare-fun b!1094855 () Bool)

(declare-fun res!730677 () Bool)

(assert (=> b!1094855 (=> (not res!730677) (not e!625066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70818 (_ BitVec 32)) Bool)

(assert (=> b!1094855 (= res!730677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1094856 () Bool)

(assert (=> b!1094856 (= e!625066 e!625063)))

(declare-fun res!730674 () Bool)

(assert (=> b!1094856 (=> (not res!730674) (not e!625063))))

(declare-fun lt!489533 () array!70818)

(assert (=> b!1094856 (= res!730674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489533 mask!1414))))

(assert (=> b!1094856 (= lt!489533 (array!70819 (store (arr!34082 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34620 _keys!1070)))))

(declare-fun mapNonEmpty!42250 () Bool)

(declare-fun tp!80765 () Bool)

(assert (=> mapNonEmpty!42250 (= mapRes!42250 (and tp!80765 e!625064))))

(declare-fun mapValue!42250 () ValueCell!12788)

(declare-fun mapKey!42250 () (_ BitVec 32))

(declare-fun mapRest!42250 () (Array (_ BitVec 32) ValueCell!12788))

(assert (=> mapNonEmpty!42250 (= (arr!34083 _values!874) (store mapRest!42250 mapKey!42250 mapValue!42250))))

(declare-fun b!1094857 () Bool)

(declare-fun res!730676 () Bool)

(assert (=> b!1094857 (=> (not res!730676) (not e!625066))))

(assert (=> b!1094857 (= res!730676 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34620 _keys!1070))))))

(declare-fun b!1094858 () Bool)

(declare-fun e!625068 () Bool)

(assert (=> b!1094858 (= e!625065 (and e!625068 mapRes!42250))))

(declare-fun condMapEmpty!42250 () Bool)

(declare-fun mapDefault!42250 () ValueCell!12788)

(assert (=> b!1094858 (= condMapEmpty!42250 (= (arr!34083 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12788)) mapDefault!42250)))))

(declare-fun b!1094859 () Bool)

(assert (=> b!1094859 (= e!625068 tp_is_empty!26995)))

(declare-fun b!1094860 () Bool)

(declare-fun res!730679 () Bool)

(assert (=> b!1094860 (=> (not res!730679) (not e!625063))))

(assert (=> b!1094860 (= res!730679 (arrayNoDuplicates!0 lt!489533 #b00000000000000000000000000000000 Nil!23862))))

(assert (= (and start!96346 res!730673) b!1094849))

(assert (= (and b!1094849 res!730678) b!1094855))

(assert (= (and b!1094855 res!730677) b!1094852))

(assert (= (and b!1094852 res!730680) b!1094857))

(assert (= (and b!1094857 res!730676) b!1094854))

(assert (= (and b!1094854 res!730682) b!1094851))

(assert (= (and b!1094851 res!730681) b!1094856))

(assert (= (and b!1094856 res!730674) b!1094860))

(assert (= (and b!1094860 res!730679) b!1094848))

(assert (= (and b!1094848 res!730675) b!1094853))

(assert (= (and b!1094858 condMapEmpty!42250) mapIsEmpty!42250))

(assert (= (and b!1094858 (not condMapEmpty!42250)) mapNonEmpty!42250))

(get-info :version)

(assert (= (and mapNonEmpty!42250 ((_ is ValueCellFull!12788) mapValue!42250)) b!1094850))

(assert (= (and b!1094858 ((_ is ValueCellFull!12788) mapDefault!42250)) b!1094859))

(assert (= start!96346 b!1094858))

(declare-fun m!1014123 () Bool)

(assert (=> b!1094851 m!1014123))

(declare-fun m!1014125 () Bool)

(assert (=> b!1094860 m!1014125))

(declare-fun m!1014127 () Bool)

(assert (=> b!1094856 m!1014127))

(declare-fun m!1014129 () Bool)

(assert (=> b!1094856 m!1014129))

(declare-fun m!1014131 () Bool)

(assert (=> b!1094852 m!1014131))

(declare-fun m!1014133 () Bool)

(assert (=> mapNonEmpty!42250 m!1014133))

(declare-fun m!1014135 () Bool)

(assert (=> b!1094853 m!1014135))

(declare-fun m!1014137 () Bool)

(assert (=> start!96346 m!1014137))

(declare-fun m!1014139 () Bool)

(assert (=> start!96346 m!1014139))

(declare-fun m!1014141 () Bool)

(assert (=> start!96346 m!1014141))

(declare-fun m!1014143 () Bool)

(assert (=> b!1094855 m!1014143))

(declare-fun m!1014145 () Bool)

(assert (=> b!1094854 m!1014145))

(check-sat (not mapNonEmpty!42250) (not b!1094854) (not b!1094855) (not b!1094853) (not b!1094852) (not b!1094856) (not b!1094860) (not start!96346) tp_is_empty!26995)
(check-sat)
(get-model)

(declare-fun d!130079 () Bool)

(declare-fun res!730749 () Bool)

(declare-fun e!625114 () Bool)

(assert (=> d!130079 (=> res!730749 e!625114)))

(assert (=> d!130079 (= res!730749 (bvsge #b00000000000000000000000000000000 (size!34620 _keys!1070)))))

(assert (=> d!130079 (= (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23862) e!625114)))

(declare-fun b!1094949 () Bool)

(declare-fun e!625115 () Bool)

(declare-fun call!45736 () Bool)

(assert (=> b!1094949 (= e!625115 call!45736)))

(declare-fun bm!45733 () Bool)

(declare-fun c!108314 () Bool)

(assert (=> bm!45733 (= call!45736 (arrayNoDuplicates!0 _keys!1070 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108314 (Cons!23861 (select (arr!34082 _keys!1070) #b00000000000000000000000000000000) Nil!23862) Nil!23862)))))

(declare-fun b!1094950 () Bool)

(declare-fun e!625116 () Bool)

(assert (=> b!1094950 (= e!625116 e!625115)))

(assert (=> b!1094950 (= c!108314 (validKeyInArray!0 (select (arr!34082 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1094951 () Bool)

(assert (=> b!1094951 (= e!625114 e!625116)))

(declare-fun res!730750 () Bool)

(assert (=> b!1094951 (=> (not res!730750) (not e!625116))))

(declare-fun e!625113 () Bool)

(assert (=> b!1094951 (= res!730750 (not e!625113))))

(declare-fun res!730751 () Bool)

(assert (=> b!1094951 (=> (not res!730751) (not e!625113))))

(assert (=> b!1094951 (= res!730751 (validKeyInArray!0 (select (arr!34082 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1094952 () Bool)

(declare-fun contains!6346 (List!23865 (_ BitVec 64)) Bool)

(assert (=> b!1094952 (= e!625113 (contains!6346 Nil!23862 (select (arr!34082 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1094953 () Bool)

(assert (=> b!1094953 (= e!625115 call!45736)))

(assert (= (and d!130079 (not res!730749)) b!1094951))

(assert (= (and b!1094951 res!730751) b!1094952))

(assert (= (and b!1094951 res!730750) b!1094950))

(assert (= (and b!1094950 c!108314) b!1094953))

(assert (= (and b!1094950 (not c!108314)) b!1094949))

(assert (= (or b!1094953 b!1094949) bm!45733))

(declare-fun m!1014195 () Bool)

(assert (=> bm!45733 m!1014195))

(declare-fun m!1014197 () Bool)

(assert (=> bm!45733 m!1014197))

(assert (=> b!1094950 m!1014195))

(assert (=> b!1094950 m!1014195))

(declare-fun m!1014199 () Bool)

(assert (=> b!1094950 m!1014199))

(assert (=> b!1094951 m!1014195))

(assert (=> b!1094951 m!1014195))

(assert (=> b!1094951 m!1014199))

(assert (=> b!1094952 m!1014195))

(assert (=> b!1094952 m!1014195))

(declare-fun m!1014201 () Bool)

(assert (=> b!1094952 m!1014201))

(assert (=> b!1094852 d!130079))

(declare-fun d!130081 () Bool)

(assert (=> d!130081 (= (validMask!0 mask!1414) (and (or (= mask!1414 #b00000000000000000000000000000111) (= mask!1414 #b00000000000000000000000000001111) (= mask!1414 #b00000000000000000000000000011111) (= mask!1414 #b00000000000000000000000000111111) (= mask!1414 #b00000000000000000000000001111111) (= mask!1414 #b00000000000000000000000011111111) (= mask!1414 #b00000000000000000000000111111111) (= mask!1414 #b00000000000000000000001111111111) (= mask!1414 #b00000000000000000000011111111111) (= mask!1414 #b00000000000000000000111111111111) (= mask!1414 #b00000000000000000001111111111111) (= mask!1414 #b00000000000000000011111111111111) (= mask!1414 #b00000000000000000111111111111111) (= mask!1414 #b00000000000000001111111111111111) (= mask!1414 #b00000000000000011111111111111111) (= mask!1414 #b00000000000000111111111111111111) (= mask!1414 #b00000000000001111111111111111111) (= mask!1414 #b00000000000011111111111111111111) (= mask!1414 #b00000000000111111111111111111111) (= mask!1414 #b00000000001111111111111111111111) (= mask!1414 #b00000000011111111111111111111111) (= mask!1414 #b00000000111111111111111111111111) (= mask!1414 #b00000001111111111111111111111111) (= mask!1414 #b00000011111111111111111111111111) (= mask!1414 #b00000111111111111111111111111111) (= mask!1414 #b00001111111111111111111111111111) (= mask!1414 #b00011111111111111111111111111111) (= mask!1414 #b00111111111111111111111111111111)) (bvsle mask!1414 #b00111111111111111111111111111111)))))

(assert (=> start!96346 d!130081))

(declare-fun d!130083 () Bool)

(assert (=> d!130083 (= (array_inv!26298 _keys!1070) (bvsge (size!34620 _keys!1070) #b00000000000000000000000000000000))))

(assert (=> start!96346 d!130083))

(declare-fun d!130085 () Bool)

(assert (=> d!130085 (= (array_inv!26299 _values!874) (bvsge (size!34621 _values!874) #b00000000000000000000000000000000))))

(assert (=> start!96346 d!130085))

(declare-fun d!130087 () Bool)

(assert (=> d!130087 (= (validKeyInArray!0 k0!904) (and (not (= k0!904 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!904 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1094854 d!130087))

(declare-fun d!130089 () Bool)

(declare-fun res!730756 () Bool)

(declare-fun e!625121 () Bool)

(assert (=> d!130089 (=> res!730756 e!625121)))

(assert (=> d!130089 (= res!730756 (= (select (arr!34082 _keys!1070) i!650) k0!904))))

(assert (=> d!130089 (= (arrayContainsKey!0 _keys!1070 k0!904 i!650) e!625121)))

(declare-fun b!1094958 () Bool)

(declare-fun e!625122 () Bool)

(assert (=> b!1094958 (= e!625121 e!625122)))

(declare-fun res!730757 () Bool)

(assert (=> b!1094958 (=> (not res!730757) (not e!625122))))

(assert (=> b!1094958 (= res!730757 (bvslt (bvadd i!650 #b00000000000000000000000000000001) (size!34620 _keys!1070)))))

(declare-fun b!1094959 () Bool)

(assert (=> b!1094959 (= e!625122 (arrayContainsKey!0 _keys!1070 k0!904 (bvadd i!650 #b00000000000000000000000000000001)))))

(assert (= (and d!130089 (not res!730756)) b!1094958))

(assert (= (and b!1094958 res!730757) b!1094959))

(assert (=> d!130089 m!1014123))

(declare-fun m!1014203 () Bool)

(assert (=> b!1094959 m!1014203))

(assert (=> b!1094853 d!130089))

(declare-fun b!1094968 () Bool)

(declare-fun e!625130 () Bool)

(declare-fun e!625131 () Bool)

(assert (=> b!1094968 (= e!625130 e!625131)))

(declare-fun c!108317 () Bool)

(assert (=> b!1094968 (= c!108317 (validKeyInArray!0 (select (arr!34082 _keys!1070) #b00000000000000000000000000000000)))))

(declare-fun b!1094969 () Bool)

(declare-fun e!625129 () Bool)

(declare-fun call!45739 () Bool)

(assert (=> b!1094969 (= e!625129 call!45739)))

(declare-fun bm!45736 () Bool)

(assert (=> bm!45736 (= call!45739 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1070 mask!1414))))

(declare-fun b!1094970 () Bool)

(assert (=> b!1094970 (= e!625131 call!45739)))

(declare-fun d!130091 () Bool)

(declare-fun res!730763 () Bool)

(assert (=> d!130091 (=> res!730763 e!625130)))

(assert (=> d!130091 (= res!730763 (bvsge #b00000000000000000000000000000000 (size!34620 _keys!1070)))))

(assert (=> d!130091 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414) e!625130)))

(declare-fun b!1094971 () Bool)

(assert (=> b!1094971 (= e!625131 e!625129)))

(declare-fun lt!489546 () (_ BitVec 64))

(assert (=> b!1094971 (= lt!489546 (select (arr!34082 _keys!1070) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!35863 0))(
  ( (Unit!35864) )
))
(declare-fun lt!489548 () Unit!35863)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70818 (_ BitVec 64) (_ BitVec 32)) Unit!35863)

(assert (=> b!1094971 (= lt!489548 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 lt!489546 #b00000000000000000000000000000000))))

(assert (=> b!1094971 (arrayContainsKey!0 _keys!1070 lt!489546 #b00000000000000000000000000000000)))

(declare-fun lt!489547 () Unit!35863)

(assert (=> b!1094971 (= lt!489547 lt!489548)))

(declare-fun res!730762 () Bool)

(declare-datatypes ((SeekEntryResult!9904 0))(
  ( (MissingZero!9904 (index!41987 (_ BitVec 32))) (Found!9904 (index!41988 (_ BitVec 32))) (Intermediate!9904 (undefined!10716 Bool) (index!41989 (_ BitVec 32)) (x!98426 (_ BitVec 32))) (Undefined!9904) (MissingVacant!9904 (index!41990 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!70818 (_ BitVec 32)) SeekEntryResult!9904)

(assert (=> b!1094971 (= res!730762 (= (seekEntryOrOpen!0 (select (arr!34082 _keys!1070) #b00000000000000000000000000000000) _keys!1070 mask!1414) (Found!9904 #b00000000000000000000000000000000)))))

(assert (=> b!1094971 (=> (not res!730762) (not e!625129))))

(assert (= (and d!130091 (not res!730763)) b!1094968))

(assert (= (and b!1094968 c!108317) b!1094971))

(assert (= (and b!1094968 (not c!108317)) b!1094970))

(assert (= (and b!1094971 res!730762) b!1094969))

(assert (= (or b!1094969 b!1094970) bm!45736))

(assert (=> b!1094968 m!1014195))

(assert (=> b!1094968 m!1014195))

(assert (=> b!1094968 m!1014199))

(declare-fun m!1014205 () Bool)

(assert (=> bm!45736 m!1014205))

(assert (=> b!1094971 m!1014195))

(declare-fun m!1014207 () Bool)

(assert (=> b!1094971 m!1014207))

(declare-fun m!1014209 () Bool)

(assert (=> b!1094971 m!1014209))

(assert (=> b!1094971 m!1014195))

(declare-fun m!1014211 () Bool)

(assert (=> b!1094971 m!1014211))

(assert (=> b!1094855 d!130091))

(declare-fun d!130093 () Bool)

(declare-fun res!730764 () Bool)

(declare-fun e!625133 () Bool)

(assert (=> d!130093 (=> res!730764 e!625133)))

(assert (=> d!130093 (= res!730764 (bvsge #b00000000000000000000000000000000 (size!34620 lt!489533)))))

(assert (=> d!130093 (= (arrayNoDuplicates!0 lt!489533 #b00000000000000000000000000000000 Nil!23862) e!625133)))

(declare-fun b!1094972 () Bool)

(declare-fun e!625134 () Bool)

(declare-fun call!45740 () Bool)

(assert (=> b!1094972 (= e!625134 call!45740)))

(declare-fun bm!45737 () Bool)

(declare-fun c!108318 () Bool)

(assert (=> bm!45737 (= call!45740 (arrayNoDuplicates!0 lt!489533 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!108318 (Cons!23861 (select (arr!34082 lt!489533) #b00000000000000000000000000000000) Nil!23862) Nil!23862)))))

(declare-fun b!1094973 () Bool)

(declare-fun e!625135 () Bool)

(assert (=> b!1094973 (= e!625135 e!625134)))

(assert (=> b!1094973 (= c!108318 (validKeyInArray!0 (select (arr!34082 lt!489533) #b00000000000000000000000000000000)))))

(declare-fun b!1094974 () Bool)

(assert (=> b!1094974 (= e!625133 e!625135)))

(declare-fun res!730765 () Bool)

(assert (=> b!1094974 (=> (not res!730765) (not e!625135))))

(declare-fun e!625132 () Bool)

(assert (=> b!1094974 (= res!730765 (not e!625132))))

(declare-fun res!730766 () Bool)

(assert (=> b!1094974 (=> (not res!730766) (not e!625132))))

(assert (=> b!1094974 (= res!730766 (validKeyInArray!0 (select (arr!34082 lt!489533) #b00000000000000000000000000000000)))))

(declare-fun b!1094975 () Bool)

(assert (=> b!1094975 (= e!625132 (contains!6346 Nil!23862 (select (arr!34082 lt!489533) #b00000000000000000000000000000000)))))

(declare-fun b!1094976 () Bool)

(assert (=> b!1094976 (= e!625134 call!45740)))

(assert (= (and d!130093 (not res!730764)) b!1094974))

(assert (= (and b!1094974 res!730766) b!1094975))

(assert (= (and b!1094974 res!730765) b!1094973))

(assert (= (and b!1094973 c!108318) b!1094976))

(assert (= (and b!1094973 (not c!108318)) b!1094972))

(assert (= (or b!1094976 b!1094972) bm!45737))

(declare-fun m!1014213 () Bool)

(assert (=> bm!45737 m!1014213))

(declare-fun m!1014215 () Bool)

(assert (=> bm!45737 m!1014215))

(assert (=> b!1094973 m!1014213))

(assert (=> b!1094973 m!1014213))

(declare-fun m!1014217 () Bool)

(assert (=> b!1094973 m!1014217))

(assert (=> b!1094974 m!1014213))

(assert (=> b!1094974 m!1014213))

(assert (=> b!1094974 m!1014217))

(assert (=> b!1094975 m!1014213))

(assert (=> b!1094975 m!1014213))

(declare-fun m!1014219 () Bool)

(assert (=> b!1094975 m!1014219))

(assert (=> b!1094860 d!130093))

(declare-fun b!1094977 () Bool)

(declare-fun e!625137 () Bool)

(declare-fun e!625138 () Bool)

(assert (=> b!1094977 (= e!625137 e!625138)))

(declare-fun c!108319 () Bool)

(assert (=> b!1094977 (= c!108319 (validKeyInArray!0 (select (arr!34082 lt!489533) #b00000000000000000000000000000000)))))

(declare-fun b!1094978 () Bool)

(declare-fun e!625136 () Bool)

(declare-fun call!45741 () Bool)

(assert (=> b!1094978 (= e!625136 call!45741)))

(declare-fun bm!45738 () Bool)

(assert (=> bm!45738 (= call!45741 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!489533 mask!1414))))

(declare-fun b!1094979 () Bool)

(assert (=> b!1094979 (= e!625138 call!45741)))

(declare-fun d!130095 () Bool)

(declare-fun res!730768 () Bool)

(assert (=> d!130095 (=> res!730768 e!625137)))

(assert (=> d!130095 (= res!730768 (bvsge #b00000000000000000000000000000000 (size!34620 lt!489533)))))

(assert (=> d!130095 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!489533 mask!1414) e!625137)))

(declare-fun b!1094980 () Bool)

(assert (=> b!1094980 (= e!625138 e!625136)))

(declare-fun lt!489549 () (_ BitVec 64))

(assert (=> b!1094980 (= lt!489549 (select (arr!34082 lt!489533) #b00000000000000000000000000000000))))

(declare-fun lt!489551 () Unit!35863)

(assert (=> b!1094980 (= lt!489551 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!489533 lt!489549 #b00000000000000000000000000000000))))

(assert (=> b!1094980 (arrayContainsKey!0 lt!489533 lt!489549 #b00000000000000000000000000000000)))

(declare-fun lt!489550 () Unit!35863)

(assert (=> b!1094980 (= lt!489550 lt!489551)))

(declare-fun res!730767 () Bool)

(assert (=> b!1094980 (= res!730767 (= (seekEntryOrOpen!0 (select (arr!34082 lt!489533) #b00000000000000000000000000000000) lt!489533 mask!1414) (Found!9904 #b00000000000000000000000000000000)))))

(assert (=> b!1094980 (=> (not res!730767) (not e!625136))))

(assert (= (and d!130095 (not res!730768)) b!1094977))

(assert (= (and b!1094977 c!108319) b!1094980))

(assert (= (and b!1094977 (not c!108319)) b!1094979))

(assert (= (and b!1094980 res!730767) b!1094978))

(assert (= (or b!1094978 b!1094979) bm!45738))

(assert (=> b!1094977 m!1014213))

(assert (=> b!1094977 m!1014213))

(assert (=> b!1094977 m!1014217))

(declare-fun m!1014221 () Bool)

(assert (=> bm!45738 m!1014221))

(assert (=> b!1094980 m!1014213))

(declare-fun m!1014223 () Bool)

(assert (=> b!1094980 m!1014223))

(declare-fun m!1014225 () Bool)

(assert (=> b!1094980 m!1014225))

(assert (=> b!1094980 m!1014213))

(declare-fun m!1014227 () Bool)

(assert (=> b!1094980 m!1014227))

(assert (=> b!1094856 d!130095))

(declare-fun mapIsEmpty!42259 () Bool)

(declare-fun mapRes!42259 () Bool)

(assert (=> mapIsEmpty!42259 mapRes!42259))

(declare-fun b!1094987 () Bool)

(declare-fun e!625143 () Bool)

(assert (=> b!1094987 (= e!625143 tp_is_empty!26995)))

(declare-fun b!1094988 () Bool)

(declare-fun e!625144 () Bool)

(assert (=> b!1094988 (= e!625144 tp_is_empty!26995)))

(declare-fun condMapEmpty!42259 () Bool)

(declare-fun mapDefault!42259 () ValueCell!12788)

(assert (=> mapNonEmpty!42250 (= condMapEmpty!42259 (= mapRest!42250 ((as const (Array (_ BitVec 32) ValueCell!12788)) mapDefault!42259)))))

(assert (=> mapNonEmpty!42250 (= tp!80765 (and e!625144 mapRes!42259))))

(declare-fun mapNonEmpty!42259 () Bool)

(declare-fun tp!80774 () Bool)

(assert (=> mapNonEmpty!42259 (= mapRes!42259 (and tp!80774 e!625143))))

(declare-fun mapValue!42259 () ValueCell!12788)

(declare-fun mapRest!42259 () (Array (_ BitVec 32) ValueCell!12788))

(declare-fun mapKey!42259 () (_ BitVec 32))

(assert (=> mapNonEmpty!42259 (= mapRest!42250 (store mapRest!42259 mapKey!42259 mapValue!42259))))

(assert (= (and mapNonEmpty!42250 condMapEmpty!42259) mapIsEmpty!42259))

(assert (= (and mapNonEmpty!42250 (not condMapEmpty!42259)) mapNonEmpty!42259))

(assert (= (and mapNonEmpty!42259 ((_ is ValueCellFull!12788) mapValue!42259)) b!1094987))

(assert (= (and mapNonEmpty!42250 ((_ is ValueCellFull!12788) mapDefault!42259)) b!1094988))

(declare-fun m!1014229 () Bool)

(assert (=> mapNonEmpty!42259 m!1014229))

(check-sat (not b!1094959) (not b!1094951) (not mapNonEmpty!42259) tp_is_empty!26995 (not b!1094968) (not b!1094950) (not b!1094975) (not b!1094973) (not b!1094952) (not b!1094980) (not bm!45738) (not b!1094971) (not bm!45737) (not bm!45736) (not bm!45733) (not b!1094977) (not b!1094974))
(check-sat)
