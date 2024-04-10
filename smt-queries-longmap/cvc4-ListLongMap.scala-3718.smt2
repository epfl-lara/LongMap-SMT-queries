; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51108 () Bool)

(assert start!51108)

(declare-fun b!558652 () Bool)

(declare-fun res!350521 () Bool)

(declare-fun e!321817 () Bool)

(assert (=> b!558652 (=> (not res!350521) (not e!321817))))

(declare-datatypes ((array!35162 0))(
  ( (array!35163 (arr!16886 (Array (_ BitVec 32) (_ BitVec 64))) (size!17250 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35162)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35162 (_ BitVec 32)) Bool)

(assert (=> b!558652 (= res!350521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!350515 () Bool)

(declare-fun e!321818 () Bool)

(assert (=> start!51108 (=> (not res!350515) (not e!321818))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51108 (= res!350515 (validMask!0 mask!3119))))

(assert (=> start!51108 e!321818))

(assert (=> start!51108 true))

(declare-fun array_inv!12682 (array!35162) Bool)

(assert (=> start!51108 (array_inv!12682 a!3118)))

(declare-fun b!558653 () Bool)

(assert (=> b!558653 (= e!321818 e!321817)))

(declare-fun res!350518 () Bool)

(assert (=> b!558653 (=> (not res!350518) (not e!321817))))

(declare-datatypes ((SeekEntryResult!5335 0))(
  ( (MissingZero!5335 (index!23567 (_ BitVec 32))) (Found!5335 (index!23568 (_ BitVec 32))) (Intermediate!5335 (undefined!6147 Bool) (index!23569 (_ BitVec 32)) (x!52459 (_ BitVec 32))) (Undefined!5335) (MissingVacant!5335 (index!23570 (_ BitVec 32))) )
))
(declare-fun lt!253893 () SeekEntryResult!5335)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!558653 (= res!350518 (or (= lt!253893 (MissingZero!5335 i!1132)) (= lt!253893 (MissingVacant!5335 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35162 (_ BitVec 32)) SeekEntryResult!5335)

(assert (=> b!558653 (= lt!253893 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558654 () Bool)

(declare-fun e!321819 () Bool)

(assert (=> b!558654 (= e!321817 e!321819)))

(declare-fun res!350525 () Bool)

(assert (=> b!558654 (=> (not res!350525) (not e!321819))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!253892 () (_ BitVec 32))

(declare-fun lt!253894 () SeekEntryResult!5335)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35162 (_ BitVec 32)) SeekEntryResult!5335)

(assert (=> b!558654 (= res!350525 (= lt!253894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253892 (select (store (arr!16886 a!3118) i!1132 k!1914) j!142) (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118)) mask!3119)))))

(declare-fun lt!253896 () (_ BitVec 32))

(assert (=> b!558654 (= lt!253894 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253896 (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558654 (= lt!253892 (toIndex!0 (select (store (arr!16886 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558654 (= lt!253896 (toIndex!0 (select (arr!16886 a!3118) j!142) mask!3119))))

(declare-fun b!558655 () Bool)

(declare-fun res!350523 () Bool)

(assert (=> b!558655 (=> (not res!350523) (not e!321818))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558655 (= res!350523 (validKeyInArray!0 k!1914))))

(declare-fun lt!253897 () SeekEntryResult!5335)

(declare-fun b!558656 () Bool)

(declare-fun e!321816 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35162 (_ BitVec 32)) SeekEntryResult!5335)

(assert (=> b!558656 (= e!321816 (= lt!253897 (seekKeyOrZeroReturnVacant!0 (x!52459 lt!253894) (index!23569 lt!253894) (index!23569 lt!253894) (select (arr!16886 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!558657 () Bool)

(declare-fun e!321814 () Bool)

(assert (=> b!558657 (= e!321814 e!321816)))

(declare-fun res!350524 () Bool)

(assert (=> b!558657 (=> res!350524 e!321816)))

(assert (=> b!558657 (= res!350524 (or (undefined!6147 lt!253894) (not (is-Intermediate!5335 lt!253894)) (= (select (arr!16886 a!3118) (index!23569 lt!253894)) (select (arr!16886 a!3118) j!142)) (= (select (arr!16886 a!3118) (index!23569 lt!253894)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558658 () Bool)

(declare-fun res!350522 () Bool)

(assert (=> b!558658 (=> (not res!350522) (not e!321817))))

(declare-datatypes ((List!10966 0))(
  ( (Nil!10963) (Cons!10962 (h!11956 (_ BitVec 64)) (t!17194 List!10966)) )
))
(declare-fun arrayNoDuplicates!0 (array!35162 (_ BitVec 32) List!10966) Bool)

(assert (=> b!558658 (= res!350522 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10963))))

(declare-fun b!558659 () Bool)

(declare-fun res!350517 () Bool)

(assert (=> b!558659 (=> (not res!350517) (not e!321818))))

(assert (=> b!558659 (= res!350517 (validKeyInArray!0 (select (arr!16886 a!3118) j!142)))))

(declare-fun b!558660 () Bool)

(assert (=> b!558660 (= e!321819 (not (or (undefined!6147 lt!253894) (not (is-Intermediate!5335 lt!253894)) (= (select (arr!16886 a!3118) (index!23569 lt!253894)) (select (arr!16886 a!3118) j!142)) (= (select (arr!16886 a!3118) (index!23569 lt!253894)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23569 lt!253894) #b00000000000000000000000000000000) (bvslt (index!23569 lt!253894) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(assert (=> b!558660 e!321814))

(declare-fun res!350520 () Bool)

(assert (=> b!558660 (=> (not res!350520) (not e!321814))))

(assert (=> b!558660 (= res!350520 (= lt!253897 (Found!5335 j!142)))))

(assert (=> b!558660 (= lt!253897 (seekEntryOrOpen!0 (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!558660 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17444 0))(
  ( (Unit!17445) )
))
(declare-fun lt!253895 () Unit!17444)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17444)

(assert (=> b!558660 (= lt!253895 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558661 () Bool)

(declare-fun res!350519 () Bool)

(assert (=> b!558661 (=> (not res!350519) (not e!321818))))

(assert (=> b!558661 (= res!350519 (and (= (size!17250 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17250 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17250 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558662 () Bool)

(declare-fun res!350516 () Bool)

(assert (=> b!558662 (=> (not res!350516) (not e!321818))))

(declare-fun arrayContainsKey!0 (array!35162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558662 (= res!350516 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!51108 res!350515) b!558661))

(assert (= (and b!558661 res!350519) b!558659))

(assert (= (and b!558659 res!350517) b!558655))

(assert (= (and b!558655 res!350523) b!558662))

(assert (= (and b!558662 res!350516) b!558653))

(assert (= (and b!558653 res!350518) b!558652))

(assert (= (and b!558652 res!350521) b!558658))

(assert (= (and b!558658 res!350522) b!558654))

(assert (= (and b!558654 res!350525) b!558660))

(assert (= (and b!558660 res!350520) b!558657))

(assert (= (and b!558657 (not res!350524)) b!558656))

(declare-fun m!536675 () Bool)

(assert (=> b!558657 m!536675))

(declare-fun m!536677 () Bool)

(assert (=> b!558657 m!536677))

(declare-fun m!536679 () Bool)

(assert (=> b!558652 m!536679))

(assert (=> b!558660 m!536677))

(assert (=> b!558660 m!536675))

(declare-fun m!536681 () Bool)

(assert (=> b!558660 m!536681))

(declare-fun m!536683 () Bool)

(assert (=> b!558660 m!536683))

(assert (=> b!558660 m!536677))

(declare-fun m!536685 () Bool)

(assert (=> b!558660 m!536685))

(declare-fun m!536687 () Bool)

(assert (=> start!51108 m!536687))

(declare-fun m!536689 () Bool)

(assert (=> start!51108 m!536689))

(assert (=> b!558659 m!536677))

(assert (=> b!558659 m!536677))

(declare-fun m!536691 () Bool)

(assert (=> b!558659 m!536691))

(declare-fun m!536693 () Bool)

(assert (=> b!558658 m!536693))

(declare-fun m!536695 () Bool)

(assert (=> b!558655 m!536695))

(assert (=> b!558654 m!536677))

(declare-fun m!536697 () Bool)

(assert (=> b!558654 m!536697))

(assert (=> b!558654 m!536677))

(declare-fun m!536699 () Bool)

(assert (=> b!558654 m!536699))

(declare-fun m!536701 () Bool)

(assert (=> b!558654 m!536701))

(assert (=> b!558654 m!536677))

(declare-fun m!536703 () Bool)

(assert (=> b!558654 m!536703))

(assert (=> b!558654 m!536699))

(declare-fun m!536705 () Bool)

(assert (=> b!558654 m!536705))

(assert (=> b!558654 m!536699))

(declare-fun m!536707 () Bool)

(assert (=> b!558654 m!536707))

(assert (=> b!558656 m!536677))

(assert (=> b!558656 m!536677))

(declare-fun m!536709 () Bool)

(assert (=> b!558656 m!536709))

(declare-fun m!536711 () Bool)

(assert (=> b!558653 m!536711))

(declare-fun m!536713 () Bool)

(assert (=> b!558662 m!536713))

(push 1)

(assert (not start!51108))

(assert (not b!558658))

(assert (not b!558656))

(assert (not b!558659))

(assert (not b!558654))

(assert (not b!558660))

(assert (not b!558655))

(assert (not b!558662))

(assert (not b!558652))

(assert (not b!558653))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!558753 () Bool)

(declare-fun e!321877 () SeekEntryResult!5335)

(declare-fun lt!253934 () SeekEntryResult!5335)

(assert (=> b!558753 (= e!321877 (Found!5335 (index!23569 lt!253934)))))

(declare-fun b!558754 () Bool)

(declare-fun c!64446 () Bool)

(declare-fun lt!253936 () (_ BitVec 64))

(assert (=> b!558754 (= c!64446 (= lt!253936 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321878 () SeekEntryResult!5335)

(assert (=> b!558754 (= e!321877 e!321878)))

(declare-fun b!558756 () Bool)

(declare-fun e!321876 () SeekEntryResult!5335)

(assert (=> b!558756 (= e!321876 Undefined!5335)))

(declare-fun b!558757 () Bool)

(assert (=> b!558757 (= e!321876 e!321877)))

(assert (=> b!558757 (= lt!253936 (select (arr!16886 a!3118) (index!23569 lt!253934)))))

(declare-fun c!64448 () Bool)

(assert (=> b!558757 (= c!64448 (= lt!253936 (select (arr!16886 a!3118) j!142)))))

(declare-fun b!558758 () Bool)

(assert (=> b!558758 (= e!321878 (MissingZero!5335 (index!23569 lt!253934)))))

(declare-fun d!83593 () Bool)

(declare-fun lt!253935 () SeekEntryResult!5335)

(assert (=> d!83593 (and (or (is-Undefined!5335 lt!253935) (not (is-Found!5335 lt!253935)) (and (bvsge (index!23568 lt!253935) #b00000000000000000000000000000000) (bvslt (index!23568 lt!253935) (size!17250 a!3118)))) (or (is-Undefined!5335 lt!253935) (is-Found!5335 lt!253935) (not (is-MissingZero!5335 lt!253935)) (and (bvsge (index!23567 lt!253935) #b00000000000000000000000000000000) (bvslt (index!23567 lt!253935) (size!17250 a!3118)))) (or (is-Undefined!5335 lt!253935) (is-Found!5335 lt!253935) (is-MissingZero!5335 lt!253935) (not (is-MissingVacant!5335 lt!253935)) (and (bvsge (index!23570 lt!253935) #b00000000000000000000000000000000) (bvslt (index!23570 lt!253935) (size!17250 a!3118)))) (or (is-Undefined!5335 lt!253935) (ite (is-Found!5335 lt!253935) (= (select (arr!16886 a!3118) (index!23568 lt!253935)) (select (arr!16886 a!3118) j!142)) (ite (is-MissingZero!5335 lt!253935) (= (select (arr!16886 a!3118) (index!23567 lt!253935)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5335 lt!253935) (= (select (arr!16886 a!3118) (index!23570 lt!253935)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83593 (= lt!253935 e!321876)))

(declare-fun c!64447 () Bool)

(assert (=> d!83593 (= c!64447 (and (is-Intermediate!5335 lt!253934) (undefined!6147 lt!253934)))))

(assert (=> d!83593 (= lt!253934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16886 a!3118) j!142) mask!3119) (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83593 (validMask!0 mask!3119)))

(assert (=> d!83593 (= (seekEntryOrOpen!0 (select (arr!16886 a!3118) j!142) a!3118 mask!3119) lt!253935)))

(declare-fun b!558755 () Bool)

(assert (=> b!558755 (= e!321878 (seekKeyOrZeroReturnVacant!0 (x!52459 lt!253934) (index!23569 lt!253934) (index!23569 lt!253934) (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83593 c!64447) b!558756))

(assert (= (and d!83593 (not c!64447)) b!558757))

(assert (= (and b!558757 c!64448) b!558753))

(assert (= (and b!558757 (not c!64448)) b!558754))

(assert (= (and b!558754 c!64446) b!558758))

(assert (= (and b!558754 (not c!64446)) b!558755))

(declare-fun m!536761 () Bool)

(assert (=> b!558757 m!536761))

(declare-fun m!536763 () Bool)

(assert (=> d!83593 m!536763))

(assert (=> d!83593 m!536677))

(assert (=> d!83593 m!536697))

(assert (=> d!83593 m!536687))

(assert (=> d!83593 m!536697))

(assert (=> d!83593 m!536677))

(declare-fun m!536765 () Bool)

(assert (=> d!83593 m!536765))

(declare-fun m!536767 () Bool)

(assert (=> d!83593 m!536767))

(declare-fun m!536769 () Bool)

(assert (=> d!83593 m!536769))

(assert (=> b!558755 m!536677))

(declare-fun m!536771 () Bool)

(assert (=> b!558755 m!536771))

(assert (=> b!558660 d!83593))

(declare-fun b!558807 () Bool)

(declare-fun e!321908 () Bool)

(declare-fun e!321907 () Bool)

(assert (=> b!558807 (= e!321908 e!321907)))

(declare-fun c!64467 () Bool)

(assert (=> b!558807 (= c!64467 (validKeyInArray!0 (select (arr!16886 a!3118) j!142)))))

(declare-fun b!558808 () Bool)

(declare-fun e!321909 () Bool)

(assert (=> b!558808 (= e!321907 e!321909)))

(declare-fun lt!253974 () (_ BitVec 64))

(assert (=> b!558808 (= lt!253974 (select (arr!16886 a!3118) j!142))))

(declare-fun lt!253973 () Unit!17444)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35162 (_ BitVec 64) (_ BitVec 32)) Unit!17444)

(assert (=> b!558808 (= lt!253973 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253974 j!142))))

(assert (=> b!558808 (arrayContainsKey!0 a!3118 lt!253974 #b00000000000000000000000000000000)))

(declare-fun lt!253975 () Unit!17444)

(assert (=> b!558808 (= lt!253975 lt!253973)))

(declare-fun res!350557 () Bool)

(assert (=> b!558808 (= res!350557 (= (seekEntryOrOpen!0 (select (arr!16886 a!3118) j!142) a!3118 mask!3119) (Found!5335 j!142)))))

(assert (=> b!558808 (=> (not res!350557) (not e!321909))))

(declare-fun b!558809 () Bool)

(declare-fun call!32403 () Bool)

(assert (=> b!558809 (= e!321909 call!32403)))

(declare-fun d!83603 () Bool)

(declare-fun res!350556 () Bool)

(assert (=> d!83603 (=> res!350556 e!321908)))

(assert (=> d!83603 (= res!350556 (bvsge j!142 (size!17250 a!3118)))))

(assert (=> d!83603 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!321908)))

(declare-fun b!558810 () Bool)

(assert (=> b!558810 (= e!321907 call!32403)))

(declare-fun bm!32400 () Bool)

(assert (=> bm!32400 (= call!32403 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83603 (not res!350556)) b!558807))

(assert (= (and b!558807 c!64467) b!558808))

(assert (= (and b!558807 (not c!64467)) b!558810))

(assert (= (and b!558808 res!350557) b!558809))

(assert (= (or b!558809 b!558810) bm!32400))

(assert (=> b!558807 m!536677))

(assert (=> b!558807 m!536677))

(assert (=> b!558807 m!536691))

(assert (=> b!558808 m!536677))

(declare-fun m!536815 () Bool)

(assert (=> b!558808 m!536815))

(declare-fun m!536817 () Bool)

(assert (=> b!558808 m!536817))

(assert (=> b!558808 m!536677))

(assert (=> b!558808 m!536685))

(declare-fun m!536819 () Bool)

(assert (=> bm!32400 m!536819))

(assert (=> b!558660 d!83603))

(declare-fun d!83619 () Bool)

(assert (=> d!83619 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253978 () Unit!17444)

(declare-fun choose!38 (array!35162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17444)

(assert (=> d!83619 (= lt!253978 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83619 (validMask!0 mask!3119)))

(assert (=> d!83619 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253978)))

(declare-fun bs!17388 () Bool)

(assert (= bs!17388 d!83619))

(assert (=> bs!17388 m!536681))

(declare-fun m!536821 () Bool)

(assert (=> bs!17388 m!536821))

(assert (=> bs!17388 m!536687))

(assert (=> b!558660 d!83619))

(declare-fun d!83621 () Bool)

(assert (=> d!83621 (= (validKeyInArray!0 (select (arr!16886 a!3118) j!142)) (and (not (= (select (arr!16886 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16886 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558659 d!83621))

(declare-fun d!83627 () Bool)

(declare-fun e!321971 () Bool)

(assert (=> d!83627 e!321971))

(declare-fun c!64496 () Bool)

(declare-fun lt!254002 () SeekEntryResult!5335)

(assert (=> d!83627 (= c!64496 (and (is-Intermediate!5335 lt!254002) (undefined!6147 lt!254002)))))

(declare-fun e!321972 () SeekEntryResult!5335)

(assert (=> d!83627 (= lt!254002 e!321972)))

(declare-fun c!64498 () Bool)

(assert (=> d!83627 (= c!64498 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254001 () (_ BitVec 64))

(assert (=> d!83627 (= lt!254001 (select (arr!16886 (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118))) lt!253892))))

(assert (=> d!83627 (validMask!0 mask!3119)))

(assert (=> d!83627 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253892 (select (store (arr!16886 a!3118) i!1132 k!1914) j!142) (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118)) mask!3119) lt!254002)))

(declare-fun b!558905 () Bool)

(assert (=> b!558905 (and (bvsge (index!23569 lt!254002) #b00000000000000000000000000000000) (bvslt (index!23569 lt!254002) (size!17250 (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118)))))))

(declare-fun res!350599 () Bool)

(assert (=> b!558905 (= res!350599 (= (select (arr!16886 (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118))) (index!23569 lt!254002)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321973 () Bool)

(assert (=> b!558905 (=> res!350599 e!321973)))

(declare-fun b!558906 () Bool)

(declare-fun e!321974 () SeekEntryResult!5335)

(assert (=> b!558906 (= e!321972 e!321974)))

(declare-fun c!64497 () Bool)

(assert (=> b!558906 (= c!64497 (or (= lt!254001 (select (store (arr!16886 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!254001 lt!254001) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558907 () Bool)

(assert (=> b!558907 (and (bvsge (index!23569 lt!254002) #b00000000000000000000000000000000) (bvslt (index!23569 lt!254002) (size!17250 (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118)))))))

(declare-fun res!350597 () Bool)

(assert (=> b!558907 (= res!350597 (= (select (arr!16886 (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118))) (index!23569 lt!254002)) (select (store (arr!16886 a!3118) i!1132 k!1914) j!142)))))

(assert (=> b!558907 (=> res!350597 e!321973)))

(declare-fun e!321970 () Bool)

(assert (=> b!558907 (= e!321970 e!321973)))

(declare-fun b!558908 () Bool)

(assert (=> b!558908 (= e!321971 e!321970)))

(declare-fun res!350598 () Bool)

(assert (=> b!558908 (= res!350598 (and (is-Intermediate!5335 lt!254002) (not (undefined!6147 lt!254002)) (bvslt (x!52459 lt!254002) #b01111111111111111111111111111110) (bvsge (x!52459 lt!254002) #b00000000000000000000000000000000) (bvsge (x!52459 lt!254002) #b00000000000000000000000000000000)))))

(assert (=> b!558908 (=> (not res!350598) (not e!321970))))

(declare-fun b!558909 () Bool)

(assert (=> b!558909 (= e!321974 (Intermediate!5335 false lt!253892 #b00000000000000000000000000000000))))

(declare-fun b!558910 () Bool)

(assert (=> b!558910 (and (bvsge (index!23569 lt!254002) #b00000000000000000000000000000000) (bvslt (index!23569 lt!254002) (size!17250 (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118)))))))

(assert (=> b!558910 (= e!321973 (= (select (arr!16886 (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118))) (index!23569 lt!254002)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!558911 () Bool)

(assert (=> b!558911 (= e!321971 (bvsge (x!52459 lt!254002) #b01111111111111111111111111111110))))

(declare-fun b!558912 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558912 (= e!321974 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253892 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16886 a!3118) i!1132 k!1914) j!142) (array!35163 (store (arr!16886 a!3118) i!1132 k!1914) (size!17250 a!3118)) mask!3119))))

(declare-fun b!558913 () Bool)

(assert (=> b!558913 (= e!321972 (Intermediate!5335 true lt!253892 #b00000000000000000000000000000000))))

(assert (= (and d!83627 c!64498) b!558913))

(assert (= (and d!83627 (not c!64498)) b!558906))

(assert (= (and b!558906 c!64497) b!558909))

(assert (= (and b!558906 (not c!64497)) b!558912))

(assert (= (and d!83627 c!64496) b!558911))

(assert (= (and d!83627 (not c!64496)) b!558908))

(assert (= (and b!558908 res!350598) b!558907))

(assert (= (and b!558907 (not res!350597)) b!558905))

(assert (= (and b!558905 (not res!350599)) b!558910))

(declare-fun m!536871 () Bool)

(assert (=> b!558910 m!536871))

(declare-fun m!536873 () Bool)

(assert (=> d!83627 m!536873))

(assert (=> d!83627 m!536687))

(assert (=> b!558907 m!536871))

(declare-fun m!536875 () Bool)

(assert (=> b!558912 m!536875))

(assert (=> b!558912 m!536875))

(assert (=> b!558912 m!536699))

(declare-fun m!536877 () Bool)

(assert (=> b!558912 m!536877))

(assert (=> b!558905 m!536871))

(assert (=> b!558654 d!83627))

(declare-fun d!83649 () Bool)

(declare-fun e!321976 () Bool)

(assert (=> d!83649 e!321976))

(declare-fun c!64499 () Bool)

(declare-fun lt!254008 () SeekEntryResult!5335)

(assert (=> d!83649 (= c!64499 (and (is-Intermediate!5335 lt!254008) (undefined!6147 lt!254008)))))

(declare-fun e!321977 () SeekEntryResult!5335)

(assert (=> d!83649 (= lt!254008 e!321977)))

(declare-fun c!64501 () Bool)

(assert (=> d!83649 (= c!64501 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!254007 () (_ BitVec 64))

(assert (=> d!83649 (= lt!254007 (select (arr!16886 a!3118) lt!253896))))

(assert (=> d!83649 (validMask!0 mask!3119)))

(assert (=> d!83649 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253896 (select (arr!16886 a!3118) j!142) a!3118 mask!3119) lt!254008)))

(declare-fun b!558914 () Bool)

(assert (=> b!558914 (and (bvsge (index!23569 lt!254008) #b00000000000000000000000000000000) (bvslt (index!23569 lt!254008) (size!17250 a!3118)))))

(declare-fun res!350602 () Bool)

(assert (=> b!558914 (= res!350602 (= (select (arr!16886 a!3118) (index!23569 lt!254008)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321978 () Bool)

(assert (=> b!558914 (=> res!350602 e!321978)))

(declare-fun b!558915 () Bool)

(declare-fun e!321979 () SeekEntryResult!5335)

(assert (=> b!558915 (= e!321977 e!321979)))

(declare-fun c!64500 () Bool)

(assert (=> b!558915 (= c!64500 (or (= lt!254007 (select (arr!16886 a!3118) j!142)) (= (bvadd lt!254007 lt!254007) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558916 () Bool)

(assert (=> b!558916 (and (bvsge (index!23569 lt!254008) #b00000000000000000000000000000000) (bvslt (index!23569 lt!254008) (size!17250 a!3118)))))

(declare-fun res!350600 () Bool)

(assert (=> b!558916 (= res!350600 (= (select (arr!16886 a!3118) (index!23569 lt!254008)) (select (arr!16886 a!3118) j!142)))))

(assert (=> b!558916 (=> res!350600 e!321978)))

(declare-fun e!321975 () Bool)

(assert (=> b!558916 (= e!321975 e!321978)))

(declare-fun b!558917 () Bool)

(assert (=> b!558917 (= e!321976 e!321975)))

(declare-fun res!350601 () Bool)

(assert (=> b!558917 (= res!350601 (and (is-Intermediate!5335 lt!254008) (not (undefined!6147 lt!254008)) (bvslt (x!52459 lt!254008) #b01111111111111111111111111111110) (bvsge (x!52459 lt!254008) #b00000000000000000000000000000000) (bvsge (x!52459 lt!254008) #b00000000000000000000000000000000)))))

(assert (=> b!558917 (=> (not res!350601) (not e!321975))))

(declare-fun b!558918 () Bool)

(assert (=> b!558918 (= e!321979 (Intermediate!5335 false lt!253896 #b00000000000000000000000000000000))))

(declare-fun b!558919 () Bool)

(assert (=> b!558919 (and (bvsge (index!23569 lt!254008) #b00000000000000000000000000000000) (bvslt (index!23569 lt!254008) (size!17250 a!3118)))))

(assert (=> b!558919 (= e!321978 (= (select (arr!16886 a!3118) (index!23569 lt!254008)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!558920 () Bool)

(assert (=> b!558920 (= e!321976 (bvsge (x!52459 lt!254008) #b01111111111111111111111111111110))))

(declare-fun b!558921 () Bool)

(assert (=> b!558921 (= e!321979 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253896 #b00000000000000000000000000000000 mask!3119) (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558922 () Bool)

(assert (=> b!558922 (= e!321977 (Intermediate!5335 true lt!253896 #b00000000000000000000000000000000))))

(assert (= (and d!83649 c!64501) b!558922))

(assert (= (and d!83649 (not c!64501)) b!558915))

(assert (= (and b!558915 c!64500) b!558918))

(assert (= (and b!558915 (not c!64500)) b!558921))

(assert (= (and d!83649 c!64499) b!558920))

(assert (= (and d!83649 (not c!64499)) b!558917))

(assert (= (and b!558917 res!350601) b!558916))

(assert (= (and b!558916 (not res!350600)) b!558914))

(assert (= (and b!558914 (not res!350602)) b!558919))

(declare-fun m!536879 () Bool)

(assert (=> b!558919 m!536879))

(declare-fun m!536881 () Bool)

(assert (=> d!83649 m!536881))

(assert (=> d!83649 m!536687))

(assert (=> b!558916 m!536879))

(declare-fun m!536883 () Bool)

(assert (=> b!558921 m!536883))

(assert (=> b!558921 m!536883))

(assert (=> b!558921 m!536677))

(declare-fun m!536885 () Bool)

(assert (=> b!558921 m!536885))

(assert (=> b!558914 m!536879))

(assert (=> b!558654 d!83649))

(declare-fun d!83651 () Bool)

(declare-fun lt!254018 () (_ BitVec 32))

(declare-fun lt!254017 () (_ BitVec 32))

(assert (=> d!83651 (= lt!254018 (bvmul (bvxor lt!254017 (bvlshr lt!254017 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83651 (= lt!254017 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16886 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16886 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83651 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350603 (let ((h!11958 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16886 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16886 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52465 (bvmul (bvxor h!11958 (bvlshr h!11958 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52465 (bvlshr x!52465 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350603 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350603 #b00000000000000000000000000000000))))))

(assert (=> d!83651 (= (toIndex!0 (select (store (arr!16886 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!254018 (bvlshr lt!254018 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558654 d!83651))

(declare-fun d!83653 () Bool)

(declare-fun lt!254020 () (_ BitVec 32))

(declare-fun lt!254019 () (_ BitVec 32))

(assert (=> d!83653 (= lt!254020 (bvmul (bvxor lt!254019 (bvlshr lt!254019 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83653 (= lt!254019 ((_ extract 31 0) (bvand (bvxor (select (arr!16886 a!3118) j!142) (bvlshr (select (arr!16886 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83653 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350603 (let ((h!11958 ((_ extract 31 0) (bvand (bvxor (select (arr!16886 a!3118) j!142) (bvlshr (select (arr!16886 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52465 (bvmul (bvxor h!11958 (bvlshr h!11958 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52465 (bvlshr x!52465 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350603 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350603 #b00000000000000000000000000000000))))))

(assert (=> d!83653 (= (toIndex!0 (select (arr!16886 a!3118) j!142) mask!3119) (bvand (bvxor lt!254020 (bvlshr lt!254020 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558654 d!83653))

(declare-fun b!558935 () Bool)

(declare-fun e!321987 () SeekEntryResult!5335)

(declare-fun lt!254021 () SeekEntryResult!5335)

(assert (=> b!558935 (= e!321987 (Found!5335 (index!23569 lt!254021)))))

(declare-fun b!558936 () Bool)

(declare-fun c!64508 () Bool)

(declare-fun lt!254023 () (_ BitVec 64))

(assert (=> b!558936 (= c!64508 (= lt!254023 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!321988 () SeekEntryResult!5335)

(assert (=> b!558936 (= e!321987 e!321988)))

(declare-fun b!558938 () Bool)

(declare-fun e!321986 () SeekEntryResult!5335)

(assert (=> b!558938 (= e!321986 Undefined!5335)))

(declare-fun b!558939 () Bool)

(assert (=> b!558939 (= e!321986 e!321987)))

(assert (=> b!558939 (= lt!254023 (select (arr!16886 a!3118) (index!23569 lt!254021)))))

(declare-fun c!64510 () Bool)

(assert (=> b!558939 (= c!64510 (= lt!254023 k!1914))))

(declare-fun b!558940 () Bool)

(assert (=> b!558940 (= e!321988 (MissingZero!5335 (index!23569 lt!254021)))))

(declare-fun d!83655 () Bool)

(declare-fun lt!254022 () SeekEntryResult!5335)

(assert (=> d!83655 (and (or (is-Undefined!5335 lt!254022) (not (is-Found!5335 lt!254022)) (and (bvsge (index!23568 lt!254022) #b00000000000000000000000000000000) (bvslt (index!23568 lt!254022) (size!17250 a!3118)))) (or (is-Undefined!5335 lt!254022) (is-Found!5335 lt!254022) (not (is-MissingZero!5335 lt!254022)) (and (bvsge (index!23567 lt!254022) #b00000000000000000000000000000000) (bvslt (index!23567 lt!254022) (size!17250 a!3118)))) (or (is-Undefined!5335 lt!254022) (is-Found!5335 lt!254022) (is-MissingZero!5335 lt!254022) (not (is-MissingVacant!5335 lt!254022)) (and (bvsge (index!23570 lt!254022) #b00000000000000000000000000000000) (bvslt (index!23570 lt!254022) (size!17250 a!3118)))) (or (is-Undefined!5335 lt!254022) (ite (is-Found!5335 lt!254022) (= (select (arr!16886 a!3118) (index!23568 lt!254022)) k!1914) (ite (is-MissingZero!5335 lt!254022) (= (select (arr!16886 a!3118) (index!23567 lt!254022)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5335 lt!254022) (= (select (arr!16886 a!3118) (index!23570 lt!254022)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83655 (= lt!254022 e!321986)))

(declare-fun c!64509 () Bool)

(assert (=> d!83655 (= c!64509 (and (is-Intermediate!5335 lt!254021) (undefined!6147 lt!254021)))))

(assert (=> d!83655 (= lt!254021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83655 (validMask!0 mask!3119)))

(assert (=> d!83655 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!254022)))

(declare-fun b!558937 () Bool)

(assert (=> b!558937 (= e!321988 (seekKeyOrZeroReturnVacant!0 (x!52459 lt!254021) (index!23569 lt!254021) (index!23569 lt!254021) k!1914 a!3118 mask!3119))))

(assert (= (and d!83655 c!64509) b!558938))

(assert (= (and d!83655 (not c!64509)) b!558939))

(assert (= (and b!558939 c!64510) b!558935))

(assert (= (and b!558939 (not c!64510)) b!558936))

(assert (= (and b!558936 c!64508) b!558940))

(assert (= (and b!558936 (not c!64508)) b!558937))

(declare-fun m!536887 () Bool)

(assert (=> b!558939 m!536887))

(declare-fun m!536889 () Bool)

(assert (=> d!83655 m!536889))

(declare-fun m!536891 () Bool)

(assert (=> d!83655 m!536891))

(assert (=> d!83655 m!536687))

(assert (=> d!83655 m!536891))

(declare-fun m!536893 () Bool)

(assert (=> d!83655 m!536893))

(declare-fun m!536895 () Bool)

(assert (=> d!83655 m!536895))

(declare-fun m!536897 () Bool)

(assert (=> d!83655 m!536897))

(declare-fun m!536899 () Bool)

(assert (=> b!558937 m!536899))

(assert (=> b!558653 d!83655))

(declare-fun b!558975 () Bool)

(declare-fun e!322011 () Bool)

(declare-fun e!322013 () Bool)

(assert (=> b!558975 (= e!322011 e!322013)))

(declare-fun c!64519 () Bool)

(assert (=> b!558975 (= c!64519 (validKeyInArray!0 (select (arr!16886 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558976 () Bool)

(declare-fun e!322012 () Bool)

(declare-fun contains!2856 (List!10966 (_ BitVec 64)) Bool)

(assert (=> b!558976 (= e!322012 (contains!2856 Nil!10963 (select (arr!16886 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558977 () Bool)

(declare-fun call!32413 () Bool)

(assert (=> b!558977 (= e!322013 call!32413)))

(declare-fun b!558978 () Bool)

(assert (=> b!558978 (= e!322013 call!32413)))

(declare-fun b!558979 () Bool)

(declare-fun e!322014 () Bool)

(assert (=> b!558979 (= e!322014 e!322011)))

(declare-fun res!350624 () Bool)

(assert (=> b!558979 (=> (not res!350624) (not e!322011))))

(assert (=> b!558979 (= res!350624 (not e!322012))))

(declare-fun res!350623 () Bool)

(assert (=> b!558979 (=> (not res!350623) (not e!322012))))

(assert (=> b!558979 (= res!350623 (validKeyInArray!0 (select (arr!16886 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83657 () Bool)

(declare-fun res!350622 () Bool)

(assert (=> d!83657 (=> res!350622 e!322014)))

(assert (=> d!83657 (= res!350622 (bvsge #b00000000000000000000000000000000 (size!17250 a!3118)))))

(assert (=> d!83657 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10963) e!322014)))

(declare-fun bm!32410 () Bool)

(assert (=> bm!32410 (= call!32413 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64519 (Cons!10962 (select (arr!16886 a!3118) #b00000000000000000000000000000000) Nil!10963) Nil!10963)))))

(assert (= (and d!83657 (not res!350622)) b!558979))

(assert (= (and b!558979 res!350623) b!558976))

(assert (= (and b!558979 res!350624) b!558975))

(assert (= (and b!558975 c!64519) b!558977))

(assert (= (and b!558975 (not c!64519)) b!558978))

(assert (= (or b!558977 b!558978) bm!32410))

(declare-fun m!536917 () Bool)

(assert (=> b!558975 m!536917))

(assert (=> b!558975 m!536917))

(declare-fun m!536919 () Bool)

(assert (=> b!558975 m!536919))

(assert (=> b!558976 m!536917))

(assert (=> b!558976 m!536917))

(declare-fun m!536921 () Bool)

(assert (=> b!558976 m!536921))

(assert (=> b!558979 m!536917))

(assert (=> b!558979 m!536917))

(assert (=> b!558979 m!536919))

(assert (=> bm!32410 m!536917))

(declare-fun m!536923 () Bool)

(assert (=> bm!32410 m!536923))

(assert (=> b!558658 d!83657))

(declare-fun b!558980 () Bool)

(declare-fun e!322016 () Bool)

(declare-fun e!322015 () Bool)

(assert (=> b!558980 (= e!322016 e!322015)))

(declare-fun c!64520 () Bool)

(assert (=> b!558980 (= c!64520 (validKeyInArray!0 (select (arr!16886 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558981 () Bool)

(declare-fun e!322017 () Bool)

(assert (=> b!558981 (= e!322015 e!322017)))

(declare-fun lt!254029 () (_ BitVec 64))

(assert (=> b!558981 (= lt!254029 (select (arr!16886 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!254028 () Unit!17444)

(assert (=> b!558981 (= lt!254028 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!254029 #b00000000000000000000000000000000))))

(assert (=> b!558981 (arrayContainsKey!0 a!3118 lt!254029 #b00000000000000000000000000000000)))

(declare-fun lt!254030 () Unit!17444)

(assert (=> b!558981 (= lt!254030 lt!254028)))

(declare-fun res!350627 () Bool)

(assert (=> b!558981 (= res!350627 (= (seekEntryOrOpen!0 (select (arr!16886 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5335 #b00000000000000000000000000000000)))))

(assert (=> b!558981 (=> (not res!350627) (not e!322017))))

(declare-fun b!558982 () Bool)

(declare-fun call!32414 () Bool)

(assert (=> b!558982 (= e!322017 call!32414)))

(declare-fun d!83663 () Bool)

(declare-fun res!350626 () Bool)

(assert (=> d!83663 (=> res!350626 e!322016)))

(assert (=> d!83663 (= res!350626 (bvsge #b00000000000000000000000000000000 (size!17250 a!3118)))))

(assert (=> d!83663 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!322016)))

(declare-fun b!558983 () Bool)

(assert (=> b!558983 (= e!322015 call!32414)))

(declare-fun bm!32411 () Bool)

(assert (=> bm!32411 (= call!32414 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!83663 (not res!350626)) b!558980))

(assert (= (and b!558980 c!64520) b!558981))

(assert (= (and b!558980 (not c!64520)) b!558983))

(assert (= (and b!558981 res!350627) b!558982))

(assert (= (or b!558982 b!558983) bm!32411))

(assert (=> b!558980 m!536917))

(assert (=> b!558980 m!536917))

(assert (=> b!558980 m!536919))

(assert (=> b!558981 m!536917))

(declare-fun m!536925 () Bool)

(assert (=> b!558981 m!536925))

(declare-fun m!536927 () Bool)

(assert (=> b!558981 m!536927))

(assert (=> b!558981 m!536917))

(declare-fun m!536929 () Bool)

(assert (=> b!558981 m!536929))

(declare-fun m!536931 () Bool)

(assert (=> bm!32411 m!536931))

(assert (=> b!558652 d!83663))

(declare-fun d!83665 () Bool)

(declare-fun res!350632 () Bool)

(declare-fun e!322022 () Bool)

(assert (=> d!83665 (=> res!350632 e!322022)))

(assert (=> d!83665 (= res!350632 (= (select (arr!16886 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83665 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!322022)))

(declare-fun b!558988 () Bool)

(declare-fun e!322023 () Bool)

(assert (=> b!558988 (= e!322022 e!322023)))

(declare-fun res!350633 () Bool)

(assert (=> b!558988 (=> (not res!350633) (not e!322023))))

(assert (=> b!558988 (= res!350633 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17250 a!3118)))))

(declare-fun b!558989 () Bool)

(assert (=> b!558989 (= e!322023 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83665 (not res!350632)) b!558988))

(assert (= (and b!558988 res!350633) b!558989))

(assert (=> d!83665 m!536917))

(declare-fun m!536933 () Bool)

(assert (=> b!558989 m!536933))

(assert (=> b!558662 d!83665))

(declare-fun b!559002 () Bool)

(declare-fun c!64527 () Bool)

(declare-fun lt!254043 () (_ BitVec 64))

(assert (=> b!559002 (= c!64527 (= lt!254043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!322032 () SeekEntryResult!5335)

(declare-fun e!322030 () SeekEntryResult!5335)

(assert (=> b!559002 (= e!322032 e!322030)))

(declare-fun b!559003 () Bool)

(declare-fun e!322031 () SeekEntryResult!5335)

(assert (=> b!559003 (= e!322031 Undefined!5335)))

(declare-fun b!559004 () Bool)

(assert (=> b!559004 (= e!322030 (MissingVacant!5335 (index!23569 lt!253894)))))

(declare-fun d!83667 () Bool)

(declare-fun lt!254044 () SeekEntryResult!5335)

(assert (=> d!83667 (and (or (is-Undefined!5335 lt!254044) (not (is-Found!5335 lt!254044)) (and (bvsge (index!23568 lt!254044) #b00000000000000000000000000000000) (bvslt (index!23568 lt!254044) (size!17250 a!3118)))) (or (is-Undefined!5335 lt!254044) (is-Found!5335 lt!254044) (not (is-MissingVacant!5335 lt!254044)) (not (= (index!23570 lt!254044) (index!23569 lt!253894))) (and (bvsge (index!23570 lt!254044) #b00000000000000000000000000000000) (bvslt (index!23570 lt!254044) (size!17250 a!3118)))) (or (is-Undefined!5335 lt!254044) (ite (is-Found!5335 lt!254044) (= (select (arr!16886 a!3118) (index!23568 lt!254044)) (select (arr!16886 a!3118) j!142)) (and (is-MissingVacant!5335 lt!254044) (= (index!23570 lt!254044) (index!23569 lt!253894)) (= (select (arr!16886 a!3118) (index!23570 lt!254044)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!83667 (= lt!254044 e!322031)))

(declare-fun c!64528 () Bool)

(assert (=> d!83667 (= c!64528 (bvsge (x!52459 lt!253894) #b01111111111111111111111111111110))))

(assert (=> d!83667 (= lt!254043 (select (arr!16886 a!3118) (index!23569 lt!253894)))))

(assert (=> d!83667 (validMask!0 mask!3119)))

(assert (=> d!83667 (= (seekKeyOrZeroReturnVacant!0 (x!52459 lt!253894) (index!23569 lt!253894) (index!23569 lt!253894) (select (arr!16886 a!3118) j!142) a!3118 mask!3119) lt!254044)))

(declare-fun b!559005 () Bool)

(assert (=> b!559005 (= e!322031 e!322032)))

(declare-fun c!64529 () Bool)

(assert (=> b!559005 (= c!64529 (= lt!254043 (select (arr!16886 a!3118) j!142)))))

(declare-fun b!559006 () Bool)

(assert (=> b!559006 (= e!322032 (Found!5335 (index!23569 lt!253894)))))

(declare-fun b!559007 () Bool)

(assert (=> b!559007 (= e!322030 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52459 lt!253894) #b00000000000000000000000000000001) (nextIndex!0 (index!23569 lt!253894) (x!52459 lt!253894) mask!3119) (index!23569 lt!253894) (select (arr!16886 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!83667 c!64528) b!559003))

(assert (= (and d!83667 (not c!64528)) b!559005))

(assert (= (and b!559005 c!64529) b!559006))

(assert (= (and b!559005 (not c!64529)) b!559002))

(assert (= (and b!559002 c!64527) b!559004))

(assert (= (and b!559002 (not c!64527)) b!559007))

(declare-fun m!536935 () Bool)

(assert (=> d!83667 m!536935))

(declare-fun m!536937 () Bool)

(assert (=> d!83667 m!536937))

(assert (=> d!83667 m!536675))

(assert (=> d!83667 m!536687))

(declare-fun m!536939 () Bool)

(assert (=> b!559007 m!536939))

(assert (=> b!559007 m!536939))

(assert (=> b!559007 m!536677))

(declare-fun m!536941 () Bool)

(assert (=> b!559007 m!536941))

(assert (=> b!558656 d!83667))

(declare-fun d!83671 () Bool)

(assert (=> d!83671 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51108 d!83671))

(declare-fun d!83673 () Bool)

(assert (=> d!83673 (= (array_inv!12682 a!3118) (bvsge (size!17250 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51108 d!83673))

(declare-fun d!83675 () Bool)

(assert (=> d!83675 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558655 d!83675))

(push 1)

