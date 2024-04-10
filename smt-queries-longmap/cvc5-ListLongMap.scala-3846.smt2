; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52886 () Bool)

(assert start!52886)

(declare-fun b!576542 () Bool)

(declare-fun res!364778 () Bool)

(declare-fun e!331685 () Bool)

(assert (=> b!576542 (=> (not res!364778) (not e!331685))))

(declare-datatypes ((array!35974 0))(
  ( (array!35975 (arr!17268 (Array (_ BitVec 32) (_ BitVec 64))) (size!17632 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35974)

(declare-datatypes ((List!11348 0))(
  ( (Nil!11345) (Cons!11344 (h!12386 (_ BitVec 64)) (t!17576 List!11348)) )
))
(declare-fun arrayNoDuplicates!0 (array!35974 (_ BitVec 32) List!11348) Bool)

(assert (=> b!576542 (= res!364778 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11345))))

(declare-fun b!576543 () Bool)

(declare-fun res!364779 () Bool)

(declare-fun e!331684 () Bool)

(assert (=> b!576543 (=> (not res!364779) (not e!331684))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576543 (= res!364779 (validKeyInArray!0 k!1914))))

(declare-fun res!364777 () Bool)

(assert (=> start!52886 (=> (not res!364777) (not e!331684))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52886 (= res!364777 (validMask!0 mask!3119))))

(assert (=> start!52886 e!331684))

(assert (=> start!52886 true))

(declare-fun array_inv!13064 (array!35974) Bool)

(assert (=> start!52886 (array_inv!13064 a!3118)))

(declare-fun b!576544 () Bool)

(declare-fun lt!263702 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5717 0))(
  ( (MissingZero!5717 (index!25095 (_ BitVec 32))) (Found!5717 (index!25096 (_ BitVec 32))) (Intermediate!5717 (undefined!6529 Bool) (index!25097 (_ BitVec 32)) (x!53988 (_ BitVec 32))) (Undefined!5717) (MissingVacant!5717 (index!25098 (_ BitVec 32))) )
))
(declare-fun lt!263703 () SeekEntryResult!5717)

(declare-fun e!331686 () Bool)

(declare-fun lt!263699 () array!35974)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35974 (_ BitVec 32)) SeekEntryResult!5717)

(assert (=> b!576544 (= e!331686 (= lt!263703 (seekEntryOrOpen!0 lt!263702 lt!263699 mask!3119)))))

(declare-fun b!576545 () Bool)

(declare-fun e!331683 () Bool)

(assert (=> b!576545 (= e!331685 e!331683)))

(declare-fun res!364782 () Bool)

(assert (=> b!576545 (=> (not res!364782) (not e!331683))))

(declare-fun lt!263700 () (_ BitVec 32))

(declare-fun lt!263697 () SeekEntryResult!5717)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35974 (_ BitVec 32)) SeekEntryResult!5717)

(assert (=> b!576545 (= res!364782 (= lt!263697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263700 lt!263702 lt!263699 mask!3119)))))

(declare-fun lt!263698 () (_ BitVec 32))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!576545 (= lt!263697 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263698 (select (arr!17268 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576545 (= lt!263700 (toIndex!0 lt!263702 mask!3119))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576545 (= lt!263702 (select (store (arr!17268 a!3118) i!1132 k!1914) j!142))))

(assert (=> b!576545 (= lt!263698 (toIndex!0 (select (arr!17268 a!3118) j!142) mask!3119))))

(assert (=> b!576545 (= lt!263699 (array!35975 (store (arr!17268 a!3118) i!1132 k!1914) (size!17632 a!3118)))))

(declare-fun b!576546 () Bool)

(declare-fun res!364784 () Bool)

(assert (=> b!576546 (=> (not res!364784) (not e!331684))))

(assert (=> b!576546 (= res!364784 (and (= (size!17632 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17632 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17632 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576547 () Bool)

(assert (=> b!576547 (= e!331684 e!331685)))

(declare-fun res!364775 () Bool)

(assert (=> b!576547 (=> (not res!364775) (not e!331685))))

(declare-fun lt!263701 () SeekEntryResult!5717)

(assert (=> b!576547 (= res!364775 (or (= lt!263701 (MissingZero!5717 i!1132)) (= lt!263701 (MissingVacant!5717 i!1132))))))

(assert (=> b!576547 (= lt!263701 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!576548 () Bool)

(declare-fun res!364783 () Bool)

(assert (=> b!576548 (=> (not res!364783) (not e!331684))))

(declare-fun arrayContainsKey!0 (array!35974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576548 (= res!364783 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576549 () Bool)

(declare-fun res!364780 () Bool)

(assert (=> b!576549 (=> (not res!364780) (not e!331684))))

(assert (=> b!576549 (= res!364780 (validKeyInArray!0 (select (arr!17268 a!3118) j!142)))))

(declare-fun b!576550 () Bool)

(declare-fun res!364776 () Bool)

(assert (=> b!576550 (=> (not res!364776) (not e!331685))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35974 (_ BitVec 32)) Bool)

(assert (=> b!576550 (= res!364776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576551 () Bool)

(assert (=> b!576551 (= e!331683 (not e!331686))))

(declare-fun res!364781 () Bool)

(assert (=> b!576551 (=> res!364781 e!331686)))

(declare-fun lt!263696 () Bool)

(assert (=> b!576551 (= res!364781 (or (and (not lt!263696) (undefined!6529 lt!263697)) (and (not lt!263696) (not (undefined!6529 lt!263697)))))))

(assert (=> b!576551 (= lt!263696 (not (is-Intermediate!5717 lt!263697)))))

(assert (=> b!576551 (= lt!263703 (Found!5717 j!142))))

(assert (=> b!576551 (= lt!263703 (seekEntryOrOpen!0 (select (arr!17268 a!3118) j!142) a!3118 mask!3119))))

(assert (=> b!576551 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!18136 0))(
  ( (Unit!18137) )
))
(declare-fun lt!263704 () Unit!18136)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18136)

(assert (=> b!576551 (= lt!263704 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52886 res!364777) b!576546))

(assert (= (and b!576546 res!364784) b!576549))

(assert (= (and b!576549 res!364780) b!576543))

(assert (= (and b!576543 res!364779) b!576548))

(assert (= (and b!576548 res!364783) b!576547))

(assert (= (and b!576547 res!364775) b!576550))

(assert (= (and b!576550 res!364776) b!576542))

(assert (= (and b!576542 res!364778) b!576545))

(assert (= (and b!576545 res!364782) b!576551))

(assert (= (and b!576551 (not res!364781)) b!576544))

(declare-fun m!555525 () Bool)

(assert (=> b!576545 m!555525))

(declare-fun m!555527 () Bool)

(assert (=> b!576545 m!555527))

(declare-fun m!555529 () Bool)

(assert (=> b!576545 m!555529))

(assert (=> b!576545 m!555527))

(declare-fun m!555531 () Bool)

(assert (=> b!576545 m!555531))

(assert (=> b!576545 m!555527))

(declare-fun m!555533 () Bool)

(assert (=> b!576545 m!555533))

(declare-fun m!555535 () Bool)

(assert (=> b!576545 m!555535))

(declare-fun m!555537 () Bool)

(assert (=> b!576545 m!555537))

(declare-fun m!555539 () Bool)

(assert (=> b!576543 m!555539))

(declare-fun m!555541 () Bool)

(assert (=> b!576542 m!555541))

(declare-fun m!555543 () Bool)

(assert (=> b!576550 m!555543))

(assert (=> b!576549 m!555527))

(assert (=> b!576549 m!555527))

(declare-fun m!555545 () Bool)

(assert (=> b!576549 m!555545))

(declare-fun m!555547 () Bool)

(assert (=> b!576544 m!555547))

(declare-fun m!555549 () Bool)

(assert (=> start!52886 m!555549))

(declare-fun m!555551 () Bool)

(assert (=> start!52886 m!555551))

(declare-fun m!555553 () Bool)

(assert (=> b!576548 m!555553))

(assert (=> b!576551 m!555527))

(assert (=> b!576551 m!555527))

(declare-fun m!555555 () Bool)

(assert (=> b!576551 m!555555))

(declare-fun m!555557 () Bool)

(assert (=> b!576551 m!555557))

(declare-fun m!555559 () Bool)

(assert (=> b!576551 m!555559))

(declare-fun m!555561 () Bool)

(assert (=> b!576547 m!555561))

(push 1)

(assert (not b!576545))

(assert (not b!576543))

(assert (not start!52886))

(assert (not b!576549))

(assert (not b!576544))

(assert (not b!576550))

(assert (not b!576548))

(assert (not b!576547))

(assert (not b!576551))

(assert (not b!576542))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85415 () Bool)

(declare-fun lt!263783 () SeekEntryResult!5717)

(assert (=> d!85415 (and (or (is-Undefined!5717 lt!263783) (not (is-Found!5717 lt!263783)) (and (bvsge (index!25096 lt!263783) #b00000000000000000000000000000000) (bvslt (index!25096 lt!263783) (size!17632 a!3118)))) (or (is-Undefined!5717 lt!263783) (is-Found!5717 lt!263783) (not (is-MissingZero!5717 lt!263783)) (and (bvsge (index!25095 lt!263783) #b00000000000000000000000000000000) (bvslt (index!25095 lt!263783) (size!17632 a!3118)))) (or (is-Undefined!5717 lt!263783) (is-Found!5717 lt!263783) (is-MissingZero!5717 lt!263783) (not (is-MissingVacant!5717 lt!263783)) (and (bvsge (index!25098 lt!263783) #b00000000000000000000000000000000) (bvslt (index!25098 lt!263783) (size!17632 a!3118)))) (or (is-Undefined!5717 lt!263783) (ite (is-Found!5717 lt!263783) (= (select (arr!17268 a!3118) (index!25096 lt!263783)) (select (arr!17268 a!3118) j!142)) (ite (is-MissingZero!5717 lt!263783) (= (select (arr!17268 a!3118) (index!25095 lt!263783)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5717 lt!263783) (= (select (arr!17268 a!3118) (index!25098 lt!263783)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!331758 () SeekEntryResult!5717)

(assert (=> d!85415 (= lt!263783 e!331758)))

(declare-fun c!66271 () Bool)

(declare-fun lt!263782 () SeekEntryResult!5717)

(assert (=> d!85415 (= c!66271 (and (is-Intermediate!5717 lt!263782) (undefined!6529 lt!263782)))))

(assert (=> d!85415 (= lt!263782 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17268 a!3118) j!142) mask!3119) (select (arr!17268 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!85415 (validMask!0 mask!3119)))

(assert (=> d!85415 (= (seekEntryOrOpen!0 (select (arr!17268 a!3118) j!142) a!3118 mask!3119) lt!263783)))

(declare-fun b!576678 () Bool)

(declare-fun c!66272 () Bool)

(declare-fun lt!263784 () (_ BitVec 64))

(assert (=> b!576678 (= c!66272 (= lt!263784 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331759 () SeekEntryResult!5717)

(declare-fun e!331760 () SeekEntryResult!5717)

(assert (=> b!576678 (= e!331759 e!331760)))

(declare-fun b!576679 () Bool)

(assert (=> b!576679 (= e!331758 Undefined!5717)))

(declare-fun b!576680 () Bool)

(assert (=> b!576680 (= e!331758 e!331759)))

(assert (=> b!576680 (= lt!263784 (select (arr!17268 a!3118) (index!25097 lt!263782)))))

(declare-fun c!66270 () Bool)

(assert (=> b!576680 (= c!66270 (= lt!263784 (select (arr!17268 a!3118) j!142)))))

(declare-fun b!576681 () Bool)

(assert (=> b!576681 (= e!331759 (Found!5717 (index!25097 lt!263782)))))

(declare-fun b!576682 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35974 (_ BitVec 32)) SeekEntryResult!5717)

(assert (=> b!576682 (= e!331760 (seekKeyOrZeroReturnVacant!0 (x!53988 lt!263782) (index!25097 lt!263782) (index!25097 lt!263782) (select (arr!17268 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!576683 () Bool)

(assert (=> b!576683 (= e!331760 (MissingZero!5717 (index!25097 lt!263782)))))

(assert (= (and d!85415 c!66271) b!576679))

(assert (= (and d!85415 (not c!66271)) b!576680))

(assert (= (and b!576680 c!66270) b!576681))

(assert (= (and b!576680 (not c!66270)) b!576678))

(assert (= (and b!576678 c!66272) b!576683))

(assert (= (and b!576678 (not c!66272)) b!576682))

(assert (=> d!85415 m!555527))

(assert (=> d!85415 m!555529))

(declare-fun m!555669 () Bool)

(assert (=> d!85415 m!555669))

(assert (=> d!85415 m!555549))

(declare-fun m!555671 () Bool)

(assert (=> d!85415 m!555671))

(declare-fun m!555673 () Bool)

(assert (=> d!85415 m!555673))

(assert (=> d!85415 m!555529))

(assert (=> d!85415 m!555527))

(declare-fun m!555675 () Bool)

(assert (=> d!85415 m!555675))

(declare-fun m!555677 () Bool)

(assert (=> b!576680 m!555677))

(assert (=> b!576682 m!555527))

(declare-fun m!555679 () Bool)

(assert (=> b!576682 m!555679))

(assert (=> b!576551 d!85415))

(declare-fun b!576710 () Bool)

(declare-fun e!331778 () Bool)

(declare-fun call!32735 () Bool)

(assert (=> b!576710 (= e!331778 call!32735)))

(declare-fun b!576711 () Bool)

(declare-fun e!331776 () Bool)

(assert (=> b!576711 (= e!331776 e!331778)))

(declare-fun c!66284 () Bool)

(assert (=> b!576711 (= c!66284 (validKeyInArray!0 (select (arr!17268 a!3118) j!142)))))

(declare-fun b!576712 () Bool)

(declare-fun e!331777 () Bool)

(assert (=> b!576712 (= e!331777 call!32735)))

(declare-fun b!576713 () Bool)

(assert (=> b!576713 (= e!331778 e!331777)))

(declare-fun lt!263808 () (_ BitVec 64))

(assert (=> b!576713 (= lt!263808 (select (arr!17268 a!3118) j!142))))

(declare-fun lt!263810 () Unit!18136)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35974 (_ BitVec 64) (_ BitVec 32)) Unit!18136)

(assert (=> b!576713 (= lt!263810 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263808 j!142))))

(assert (=> b!576713 (arrayContainsKey!0 a!3118 lt!263808 #b00000000000000000000000000000000)))

(declare-fun lt!263809 () Unit!18136)

(assert (=> b!576713 (= lt!263809 lt!263810)))

(declare-fun res!364875 () Bool)

(assert (=> b!576713 (= res!364875 (= (seekEntryOrOpen!0 (select (arr!17268 a!3118) j!142) a!3118 mask!3119) (Found!5717 j!142)))))

(assert (=> b!576713 (=> (not res!364875) (not e!331777))))

(declare-fun d!85425 () Bool)

(declare-fun res!364874 () Bool)

(assert (=> d!85425 (=> res!364874 e!331776)))

(assert (=> d!85425 (= res!364874 (bvsge j!142 (size!17632 a!3118)))))

(assert (=> d!85425 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!331776)))

(declare-fun bm!32732 () Bool)

(assert (=> bm!32732 (= call!32735 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!85425 (not res!364874)) b!576711))

(assert (= (and b!576711 c!66284) b!576713))

(assert (= (and b!576711 (not c!66284)) b!576710))

(assert (= (and b!576713 res!364875) b!576712))

(assert (= (or b!576712 b!576710) bm!32732))

(assert (=> b!576711 m!555527))

(assert (=> b!576711 m!555527))

(assert (=> b!576711 m!555545))

(assert (=> b!576713 m!555527))

(declare-fun m!555693 () Bool)

(assert (=> b!576713 m!555693))

(declare-fun m!555695 () Bool)

(assert (=> b!576713 m!555695))

(assert (=> b!576713 m!555527))

(assert (=> b!576713 m!555555))

(declare-fun m!555697 () Bool)

(assert (=> bm!32732 m!555697))

(assert (=> b!576551 d!85425))

(declare-fun d!85433 () Bool)

(assert (=> d!85433 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!263819 () Unit!18136)

(declare-fun choose!38 (array!35974 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18136)

(assert (=> d!85433 (= lt!263819 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!85433 (validMask!0 mask!3119)))

(assert (=> d!85433 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!263819)))

(declare-fun bs!17818 () Bool)

(assert (= bs!17818 d!85433))

(assert (=> bs!17818 m!555557))

(declare-fun m!555699 () Bool)

(assert (=> bs!17818 m!555699))

(assert (=> bs!17818 m!555549))

(assert (=> b!576551 d!85433))

(declare-fun b!576754 () Bool)

(declare-fun e!331805 () Bool)

(declare-fun call!32741 () Bool)

(assert (=> b!576754 (= e!331805 call!32741)))

(declare-fun bm!32738 () Bool)

(declare-fun c!66299 () Bool)

(assert (=> bm!32738 (= call!32741 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!66299 (Cons!11344 (select (arr!17268 a!3118) #b00000000000000000000000000000000) Nil!11345) Nil!11345)))))

(declare-fun b!576755 () Bool)

(assert (=> b!576755 (= e!331805 call!32741)))

(declare-fun b!576756 () Bool)

(declare-fun e!331807 () Bool)

(declare-fun e!331806 () Bool)

(assert (=> b!576756 (= e!331807 e!331806)))

(declare-fun res!364890 () Bool)

(assert (=> b!576756 (=> (not res!364890) (not e!331806))))

(declare-fun e!331808 () Bool)

(assert (=> b!576756 (= res!364890 (not e!331808))))

(declare-fun res!364889 () Bool)

(assert (=> b!576756 (=> (not res!364889) (not e!331808))))

(assert (=> b!576756 (= res!364889 (validKeyInArray!0 (select (arr!17268 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!85435 () Bool)

(declare-fun res!364888 () Bool)

(assert (=> d!85435 (=> res!364888 e!331807)))

(assert (=> d!85435 (= res!364888 (bvsge #b00000000000000000000000000000000 (size!17632 a!3118)))))

(assert (=> d!85435 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11345) e!331807)))

(declare-fun b!576757 () Bool)

(assert (=> b!576757 (= e!331806 e!331805)))

(assert (=> b!576757 (= c!66299 (validKeyInArray!0 (select (arr!17268 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576758 () Bool)

(declare-fun contains!2897 (List!11348 (_ BitVec 64)) Bool)

(assert (=> b!576758 (= e!331808 (contains!2897 Nil!11345 (select (arr!17268 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!85435 (not res!364888)) b!576756))

(assert (= (and b!576756 res!364889) b!576758))

(assert (= (and b!576756 res!364890) b!576757))

(assert (= (and b!576757 c!66299) b!576755))

(assert (= (and b!576757 (not c!66299)) b!576754))

(assert (= (or b!576755 b!576754) bm!32738))

(declare-fun m!555723 () Bool)

(assert (=> bm!32738 m!555723))

(declare-fun m!555725 () Bool)

(assert (=> bm!32738 m!555725))

(assert (=> b!576756 m!555723))

(assert (=> b!576756 m!555723))

(declare-fun m!555727 () Bool)

(assert (=> b!576756 m!555727))

(assert (=> b!576757 m!555723))

(assert (=> b!576757 m!555723))

(assert (=> b!576757 m!555727))

(assert (=> b!576758 m!555723))

(assert (=> b!576758 m!555723))

(declare-fun m!555729 () Bool)

(assert (=> b!576758 m!555729))

(assert (=> b!576542 d!85435))

(declare-fun d!85443 () Bool)

(declare-fun lt!263839 () SeekEntryResult!5717)

(assert (=> d!85443 (and (or (is-Undefined!5717 lt!263839) (not (is-Found!5717 lt!263839)) (and (bvsge (index!25096 lt!263839) #b00000000000000000000000000000000) (bvslt (index!25096 lt!263839) (size!17632 a!3118)))) (or (is-Undefined!5717 lt!263839) (is-Found!5717 lt!263839) (not (is-MissingZero!5717 lt!263839)) (and (bvsge (index!25095 lt!263839) #b00000000000000000000000000000000) (bvslt (index!25095 lt!263839) (size!17632 a!3118)))) (or (is-Undefined!5717 lt!263839) (is-Found!5717 lt!263839) (is-MissingZero!5717 lt!263839) (not (is-MissingVacant!5717 lt!263839)) (and (bvsge (index!25098 lt!263839) #b00000000000000000000000000000000) (bvslt (index!25098 lt!263839) (size!17632 a!3118)))) (or (is-Undefined!5717 lt!263839) (ite (is-Found!5717 lt!263839) (= (select (arr!17268 a!3118) (index!25096 lt!263839)) k!1914) (ite (is-MissingZero!5717 lt!263839) (= (select (arr!17268 a!3118) (index!25095 lt!263839)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5717 lt!263839) (= (select (arr!17268 a!3118) (index!25098 lt!263839)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!331812 () SeekEntryResult!5717)

(assert (=> d!85443 (= lt!263839 e!331812)))

(declare-fun c!66304 () Bool)

(declare-fun lt!263838 () SeekEntryResult!5717)

(assert (=> d!85443 (= c!66304 (and (is-Intermediate!5717 lt!263838) (undefined!6529 lt!263838)))))

(assert (=> d!85443 (= lt!263838 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!85443 (validMask!0 mask!3119)))

(assert (=> d!85443 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!263839)))

(declare-fun b!576765 () Bool)

(declare-fun c!66305 () Bool)

(declare-fun lt!263840 () (_ BitVec 64))

(assert (=> b!576765 (= c!66305 (= lt!263840 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!331813 () SeekEntryResult!5717)

(declare-fun e!331814 () SeekEntryResult!5717)

(assert (=> b!576765 (= e!331813 e!331814)))

(declare-fun b!576766 () Bool)

(assert (=> b!576766 (= e!331812 Undefined!5717)))

(declare-fun b!576767 () Bool)

(assert (=> b!576767 (= e!331812 e!331813)))

(assert (=> b!576767 (= lt!263840 (select (arr!17268 a!3118) (index!25097 lt!263838)))))

(declare-fun c!66303 () Bool)

(assert (=> b!576767 (= c!66303 (= lt!263840 k!1914))))

(declare-fun b!576768 () Bool)

(assert (=> b!576768 (= e!331813 (Found!5717 (index!25097 lt!263838)))))

(declare-fun b!576769 () Bool)

(assert (=> b!576769 (= e!331814 (seekKeyOrZeroReturnVacant!0 (x!53988 lt!263838) (index!25097 lt!263838) (index!25097 lt!263838) k!1914 a!3118 mask!3119))))

(declare-fun b!576770 () Bool)

(assert (=> b!576770 (= e!331814 (MissingZero!5717 (index!25097 lt!263838)))))

(assert (= (and d!85443 c!66304) b!576766))

(assert (= (and d!85443 (not c!66304)) b!576767))

(assert (= (and b!576767 c!66303) b!576768))

(assert (= (and b!576767 (not c!66303)) b!576765))

(assert (= (and b!576765 c!66305) b!576770))

(assert (= (and b!576765 (not c!66305)) b!576769))

(declare-fun m!555741 () Bool)

(assert (=> d!85443 m!555741))

(declare-fun m!555745 () Bool)

(assert (=> d!85443 m!555745))

(assert (=> d!85443 m!555549))

(declare-fun m!555747 () Bool)

(assert (=> d!85443 m!555747))

(declare-fun m!555749 () Bool)

(assert (=> d!85443 m!555749))

(assert (=> d!85443 m!555741))

(declare-fun m!555751 () Bool)

(assert (=> d!85443 m!555751))

(declare-fun m!555753 () Bool)

(assert (=> b!576767 m!555753))

(declare-fun m!555755 () Bool)

(assert (=> b!576769 m!555755))

(assert (=> b!576547 d!85443))

(declare-fun d!85447 () Bool)

(assert (=> d!85447 (= (validKeyInArray!0 (select (arr!17268 a!3118) j!142)) (and (not (= (select (arr!17268 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17268 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576549 d!85447))

(declare-fun d!85451 () Bool)

(assert (=> d!85451 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!576543 d!85451))

(declare-fun d!85453 () Bool)

(declare-fun res!364897 () Bool)

(declare-fun e!331822 () Bool)

(assert (=> d!85453 (=> res!364897 e!331822)))

(assert (=> d!85453 (= res!364897 (= (select (arr!17268 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!85453 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!331822)))

(declare-fun b!576779 () Bool)

(declare-fun e!331823 () Bool)

(assert (=> b!576779 (= e!331822 e!331823)))

(declare-fun res!364898 () Bool)

(assert (=> b!576779 (=> (not res!364898) (not e!331823))))

(assert (=> b!576779 (= res!364898 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17632 a!3118)))))

(declare-fun b!576780 () Bool)

(assert (=> b!576780 (= e!331823 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!85453 (not res!364897)) b!576779))

(assert (= (and b!576779 res!364898) b!576780))

(assert (=> d!85453 m!555723))

(declare-fun m!555763 () Bool)

(assert (=> b!576780 m!555763))

(assert (=> b!576548 d!85453))

(declare-fun b!576862 () Bool)

(declare-fun lt!263865 () SeekEntryResult!5717)

(assert (=> b!576862 (and (bvsge (index!25097 lt!263865) #b00000000000000000000000000000000) (bvslt (index!25097 lt!263865) (size!17632 lt!263699)))))

(declare-fun e!331873 () Bool)

(assert (=> b!576862 (= e!331873 (= (select (arr!17268 lt!263699) (index!25097 lt!263865)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!576863 () Bool)

(assert (=> b!576863 (and (bvsge (index!25097 lt!263865) #b00000000000000000000000000000000) (bvslt (index!25097 lt!263865) (size!17632 lt!263699)))))

(declare-fun res!364927 () Bool)

(assert (=> b!576863 (= res!364927 (= (select (arr!17268 lt!263699) (index!25097 lt!263865)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576863 (=> res!364927 e!331873)))

(declare-fun e!331874 () SeekEntryResult!5717)

(declare-fun b!576864 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576864 (= e!331874 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263700 #b00000000000000000000000000000000 mask!3119) lt!263702 lt!263699 mask!3119))))

(declare-fun d!85455 () Bool)

(declare-fun e!331872 () Bool)

(assert (=> d!85455 e!331872))

(declare-fun c!66336 () Bool)

(assert (=> d!85455 (= c!66336 (and (is-Intermediate!5717 lt!263865) (undefined!6529 lt!263865)))))

(declare-fun e!331875 () SeekEntryResult!5717)

(assert (=> d!85455 (= lt!263865 e!331875)))

(declare-fun c!66335 () Bool)

(assert (=> d!85455 (= c!66335 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263866 () (_ BitVec 64))

(assert (=> d!85455 (= lt!263866 (select (arr!17268 lt!263699) lt!263700))))

(assert (=> d!85455 (validMask!0 mask!3119)))

(assert (=> d!85455 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263700 lt!263702 lt!263699 mask!3119) lt!263865)))

(declare-fun b!576865 () Bool)

(assert (=> b!576865 (= e!331875 e!331874)))

(declare-fun c!66334 () Bool)

(assert (=> b!576865 (= c!66334 (or (= lt!263866 lt!263702) (= (bvadd lt!263866 lt!263866) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576866 () Bool)

(assert (=> b!576866 (and (bvsge (index!25097 lt!263865) #b00000000000000000000000000000000) (bvslt (index!25097 lt!263865) (size!17632 lt!263699)))))

(declare-fun res!364928 () Bool)

(assert (=> b!576866 (= res!364928 (= (select (arr!17268 lt!263699) (index!25097 lt!263865)) lt!263702))))

(assert (=> b!576866 (=> res!364928 e!331873)))

(declare-fun e!331876 () Bool)

(assert (=> b!576866 (= e!331876 e!331873)))

(declare-fun b!576867 () Bool)

(assert (=> b!576867 (= e!331874 (Intermediate!5717 false lt!263700 #b00000000000000000000000000000000))))

(declare-fun b!576868 () Bool)

(assert (=> b!576868 (= e!331872 (bvsge (x!53988 lt!263865) #b01111111111111111111111111111110))))

(declare-fun b!576869 () Bool)

(assert (=> b!576869 (= e!331872 e!331876)))

(declare-fun res!364929 () Bool)

(assert (=> b!576869 (= res!364929 (and (is-Intermediate!5717 lt!263865) (not (undefined!6529 lt!263865)) (bvslt (x!53988 lt!263865) #b01111111111111111111111111111110) (bvsge (x!53988 lt!263865) #b00000000000000000000000000000000) (bvsge (x!53988 lt!263865) #b00000000000000000000000000000000)))))

(assert (=> b!576869 (=> (not res!364929) (not e!331876))))

(declare-fun b!576870 () Bool)

(assert (=> b!576870 (= e!331875 (Intermediate!5717 true lt!263700 #b00000000000000000000000000000000))))

(assert (= (and d!85455 c!66335) b!576870))

(assert (= (and d!85455 (not c!66335)) b!576865))

(assert (= (and b!576865 c!66334) b!576867))

(assert (= (and b!576865 (not c!66334)) b!576864))

(assert (= (and d!85455 c!66336) b!576868))

(assert (= (and d!85455 (not c!66336)) b!576869))

(assert (= (and b!576869 res!364929) b!576866))

(assert (= (and b!576866 (not res!364928)) b!576863))

(assert (= (and b!576863 (not res!364927)) b!576862))

(declare-fun m!555813 () Bool)

(assert (=> b!576862 m!555813))

(assert (=> b!576863 m!555813))

(assert (=> b!576866 m!555813))

(declare-fun m!555815 () Bool)

(assert (=> d!85455 m!555815))

(assert (=> d!85455 m!555549))

(declare-fun m!555817 () Bool)

(assert (=> b!576864 m!555817))

(assert (=> b!576864 m!555817))

(declare-fun m!555819 () Bool)

(assert (=> b!576864 m!555819))

(assert (=> b!576545 d!85455))

(declare-fun b!576871 () Bool)

(declare-fun lt!263871 () SeekEntryResult!5717)

(assert (=> b!576871 (and (bvsge (index!25097 lt!263871) #b00000000000000000000000000000000) (bvslt (index!25097 lt!263871) (size!17632 a!3118)))))

(declare-fun e!331878 () Bool)

(assert (=> b!576871 (= e!331878 (= (select (arr!17268 a!3118) (index!25097 lt!263871)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!576872 () Bool)

(assert (=> b!576872 (and (bvsge (index!25097 lt!263871) #b00000000000000000000000000000000) (bvslt (index!25097 lt!263871) (size!17632 a!3118)))))

(declare-fun res!364930 () Bool)

(assert (=> b!576872 (= res!364930 (= (select (arr!17268 a!3118) (index!25097 lt!263871)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!576872 (=> res!364930 e!331878)))

(declare-fun e!331879 () SeekEntryResult!5717)

(declare-fun b!576873 () Bool)

(assert (=> b!576873 (= e!331879 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!263698 #b00000000000000000000000000000000 mask!3119) (select (arr!17268 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!85471 () Bool)

(declare-fun e!331877 () Bool)

(assert (=> d!85471 e!331877))

(declare-fun c!66339 () Bool)

(assert (=> d!85471 (= c!66339 (and (is-Intermediate!5717 lt!263871) (undefined!6529 lt!263871)))))

(declare-fun e!331880 () SeekEntryResult!5717)

(assert (=> d!85471 (= lt!263871 e!331880)))

(declare-fun c!66338 () Bool)

(assert (=> d!85471 (= c!66338 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!263872 () (_ BitVec 64))

(assert (=> d!85471 (= lt!263872 (select (arr!17268 a!3118) lt!263698))))

(assert (=> d!85471 (validMask!0 mask!3119)))

(assert (=> d!85471 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!263698 (select (arr!17268 a!3118) j!142) a!3118 mask!3119) lt!263871)))

(declare-fun b!576874 () Bool)

(assert (=> b!576874 (= e!331880 e!331879)))

(declare-fun c!66337 () Bool)

(assert (=> b!576874 (= c!66337 (or (= lt!263872 (select (arr!17268 a!3118) j!142)) (= (bvadd lt!263872 lt!263872) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!576875 () Bool)

(assert (=> b!576875 (and (bvsge (index!25097 lt!263871) #b00000000000000000000000000000000) (bvslt (index!25097 lt!263871) (size!17632 a!3118)))))

(declare-fun res!364931 () Bool)

(assert (=> b!576875 (= res!364931 (= (select (arr!17268 a!3118) (index!25097 lt!263871)) (select (arr!17268 a!3118) j!142)))))

(assert (=> b!576875 (=> res!364931 e!331878)))

(declare-fun e!331881 () Bool)

(assert (=> b!576875 (= e!331881 e!331878)))

(declare-fun b!576876 () Bool)

(assert (=> b!576876 (= e!331879 (Intermediate!5717 false lt!263698 #b00000000000000000000000000000000))))

(declare-fun b!576877 () Bool)

(assert (=> b!576877 (= e!331877 (bvsge (x!53988 lt!263871) #b01111111111111111111111111111110))))

(declare-fun b!576878 () Bool)

(assert (=> b!576878 (= e!331877 e!331881)))

(declare-fun res!364932 () Bool)

(assert (=> b!576878 (= res!364932 (and (is-Intermediate!5717 lt!263871) (not (undefined!6529 lt!263871)) (bvslt (x!53988 lt!263871) #b01111111111111111111111111111110) (bvsge (x!53988 lt!263871) #b00000000000000000000000000000000) (bvsge (x!53988 lt!263871) #b00000000000000000000000000000000)))))

(assert (=> b!576878 (=> (not res!364932) (not e!331881))))

(declare-fun b!576879 () Bool)

(assert (=> b!576879 (= e!331880 (Intermediate!5717 true lt!263698 #b00000000000000000000000000000000))))

(assert (= (and d!85471 c!66338) b!576879))

(assert (= (and d!85471 (not c!66338)) b!576874))

(assert (= (and b!576874 c!66337) b!576876))

(assert (= (and b!576874 (not c!66337)) b!576873))

(assert (= (and d!85471 c!66339) b!576877))

(assert (= (and d!85471 (not c!66339)) b!576878))

(assert (= (and b!576878 res!364932) b!576875))

(assert (= (and b!576875 (not res!364931)) b!576872))

(assert (= (and b!576872 (not res!364930)) b!576871))

(declare-fun m!555821 () Bool)

(assert (=> b!576871 m!555821))

(assert (=> b!576872 m!555821))

(assert (=> b!576875 m!555821))

(declare-fun m!555823 () Bool)

(assert (=> d!85471 m!555823))

(assert (=> d!85471 m!555549))

(declare-fun m!555825 () Bool)

(assert (=> b!576873 m!555825))

(assert (=> b!576873 m!555825))

(assert (=> b!576873 m!555527))

(declare-fun m!555827 () Bool)

(assert (=> b!576873 m!555827))

(assert (=> b!576545 d!85471))

(declare-fun d!85477 () Bool)

(declare-fun lt!263882 () (_ BitVec 32))

(declare-fun lt!263881 () (_ BitVec 32))

(assert (=> d!85477 (= lt!263882 (bvmul (bvxor lt!263881 (bvlshr lt!263881 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85477 (= lt!263881 ((_ extract 31 0) (bvand (bvxor lt!263702 (bvlshr lt!263702 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85477 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364933 (let ((h!12391 ((_ extract 31 0) (bvand (bvxor lt!263702 (bvlshr lt!263702 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53996 (bvmul (bvxor h!12391 (bvlshr h!12391 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53996 (bvlshr x!53996 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364933 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364933 #b00000000000000000000000000000000))))))

(assert (=> d!85477 (= (toIndex!0 lt!263702 mask!3119) (bvand (bvxor lt!263882 (bvlshr lt!263882 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576545 d!85477))

(declare-fun d!85481 () Bool)

(declare-fun lt!263884 () (_ BitVec 32))

(declare-fun lt!263883 () (_ BitVec 32))

(assert (=> d!85481 (= lt!263884 (bvmul (bvxor lt!263883 (bvlshr lt!263883 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!85481 (= lt!263883 ((_ extract 31 0) (bvand (bvxor (select (arr!17268 a!3118) j!142) (bvlshr (select (arr!17268 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!85481 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!364933 (let ((h!12391 ((_ extract 31 0) (bvand (bvxor (select (arr!17268 a!3118) j!142) (bvlshr (select (arr!17268 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53996 (bvmul (bvxor h!12391 (bvlshr h!12391 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53996 (bvlshr x!53996 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!364933 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!364933 #b00000000000000000000000000000000))))))

(assert (=> d!85481 (= (toIndex!0 (select (arr!17268 a!3118) j!142) mask!3119) (bvand (bvxor lt!263884 (bvlshr lt!263884 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!576545 d!85481))

(declare-fun d!85483 () Bool)

(assert (=> d!85483 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!52886 d!85483))

(declare-fun d!85493 () Bool)

(assert (=> d!85493 (= (array_inv!13064 a!3118) (bvsge (size!17632 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!52886 d!85493))

(declare-fun b!576911 () Bool)

(declare-fun e!331908 () Bool)

(declare-fun call!32750 () Bool)

(assert (=> b!576911 (= e!331908 call!32750)))

(declare-fun b!576912 () Bool)

(declare-fun e!331906 () Bool)

(assert (=> b!576912 (= e!331906 e!331908)))

(declare-fun c!66347 () Bool)

(assert (=> b!576912 (= c!66347 (validKeyInArray!0 (select (arr!17268 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!576913 () Bool)

(declare-fun e!331907 () Bool)

(assert (=> b!576913 (= e!331907 call!32750)))

(declare-fun b!576914 () Bool)

(assert (=> b!576914 (= e!331908 e!331907)))

(declare-fun lt!263891 () (_ BitVec 64))

(assert (=> b!576914 (= lt!263891 (select (arr!17268 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!263893 () Unit!18136)

(assert (=> b!576914 (= lt!263893 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!263891 #b00000000000000000000000000000000))))

(assert (=> b!576914 (arrayContainsKey!0 a!3118 lt!263891 #b00000000000000000000000000000000)))

(declare-fun lt!263892 () Unit!18136)

(assert (=> b!576914 (= lt!263892 lt!263893)))

(declare-fun res!364952 () Bool)

(assert (=> b!576914 (= res!364952 (= (seekEntryOrOpen!0 (select (arr!17268 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5717 #b00000000000000000000000000000000)))))

(assert (=> b!576914 (=> (not res!364952) (not e!331907))))

(declare-fun d!85495 () Bool)

(declare-fun res!364951 () Bool)

(assert (=> d!85495 (=> res!364951 e!331906)))

(assert (=> d!85495 (= res!364951 (bvsge #b00000000000000000000000000000000 (size!17632 a!3118)))))

(assert (=> d!85495 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!331906)))

(declare-fun bm!32747 () Bool)

(assert (=> bm!32747 (= call!32750 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!85495 (not res!364951)) b!576912))

(assert (= (and b!576912 c!66347) b!576914))

(assert (= (and b!576912 (not c!66347)) b!576911))

(assert (= (and b!576914 res!364952) b!576913))

(assert (= (or b!576913 b!576911) bm!32747))

(assert (=> b!576912 m!555723))

(assert (=> b!576912 m!555723))

(assert (=> b!576912 m!555727))

(assert (=> b!576914 m!555723))

(declare-fun m!555859 () Bool)

(assert (=> b!576914 m!555859))

(declare-fun m!555861 () Bool)

(assert (=> b!576914 m!555861))

(assert (=> b!576914 m!555723))

(declare-fun m!555863 () Bool)

(assert (=> b!576914 m!555863))

(declare-fun m!555865 () Bool)

(assert (=> bm!32747 m!555865))

(assert (=> b!576550 d!85495))

(declare-fun d!85497 () Bool)

(declare-fun lt!263895 () SeekEntryResult!5717)

(assert (=> d!85497 (and (or (is-Undefined!5717 lt!263895) (not (is-Found!5717 lt!263895)) (and (bvsge (index!25096 lt!263895) #b00000000000000000000000000000000) (bvslt (index!25096 lt!263895) (size!17632 lt!263699)))) (or (is-Undefined!5717 lt!263895) (is-Found!5717 lt!263895) (not (is-MissingZero!5717 lt!263895)) (and (bvsge (index!25095 lt!263895) #b00000000000000000000000000000000) (bvslt (index!25095 lt!263895) (size!17632 lt!263699)))) (or (is-Undefined!5717 lt!263895) (is-Found!5717 lt!263895) (is-MissingZero!5717 lt!263895) (not (is-MissingVacant!5717 lt!263895)) (and (bvsge (index!25098 lt!263895) #b00000000000000000000000000000000) (bvslt (index!25098 lt!263895) (size!17632 lt!263699)))) (or (is-Undefined!5717 lt!263895) (ite (is-Found!5717 lt!263895) (= (select (arr!17268 lt!263699) (index!25096 lt!263895)) lt!263702) (ite (is-MissingZero!5717 lt!263895) (= (select (arr!17268 lt!263699) (index!25095 lt!263895)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5717 lt!263895) (= (select (arr!17268 lt!263699) (index!25098 lt!263895)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

