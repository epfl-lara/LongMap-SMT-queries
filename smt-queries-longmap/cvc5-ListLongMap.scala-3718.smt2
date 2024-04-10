; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51104 () Bool)

(assert start!51104)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5333 0))(
  ( (MissingZero!5333 (index!23559 (_ BitVec 32))) (Found!5333 (index!23560 (_ BitVec 32))) (Intermediate!5333 (undefined!6145 Bool) (index!23561 (_ BitVec 32)) (x!52457 (_ BitVec 32))) (Undefined!5333) (MissingVacant!5333 (index!23562 (_ BitVec 32))) )
))
(declare-fun lt!253860 () SeekEntryResult!5333)

(declare-fun b!558586 () Bool)

(declare-fun e!321778 () Bool)

(declare-datatypes ((array!35158 0))(
  ( (array!35159 (arr!16884 (Array (_ BitVec 32) (_ BitVec 64))) (size!17248 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35158)

(assert (=> b!558586 (= e!321778 (not (or (undefined!6145 lt!253860) (not (is-Intermediate!5333 lt!253860)) (= (select (arr!16884 a!3118) (index!23561 lt!253860)) (select (arr!16884 a!3118) j!142)) (= (select (arr!16884 a!3118) (index!23561 lt!253860)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt mask!3119 #b00000000000000000000000000000000) (and (bvsge (index!23561 lt!253860) #b00000000000000000000000000000000) (bvslt (index!23561 lt!253860) (bvadd #b00000000000000000000000000000001 mask!3119))))))))

(declare-fun e!321781 () Bool)

(assert (=> b!558586 e!321781))

(declare-fun res!350457 () Bool)

(assert (=> b!558586 (=> (not res!350457) (not e!321781))))

(declare-fun lt!253859 () SeekEntryResult!5333)

(assert (=> b!558586 (= res!350457 (= lt!253859 (Found!5333 j!142)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35158 (_ BitVec 32)) SeekEntryResult!5333)

(assert (=> b!558586 (= lt!253859 (seekEntryOrOpen!0 (select (arr!16884 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35158 (_ BitVec 32)) Bool)

(assert (=> b!558586 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17440 0))(
  ( (Unit!17441) )
))
(declare-fun lt!253857 () Unit!17440)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17440)

(assert (=> b!558586 (= lt!253857 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!558587 () Bool)

(declare-fun res!350450 () Bool)

(declare-fun e!321779 () Bool)

(assert (=> b!558587 (=> (not res!350450) (not e!321779))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!558587 (= res!350450 (validKeyInArray!0 k!1914))))

(declare-fun b!558588 () Bool)

(declare-fun e!321780 () Bool)

(assert (=> b!558588 (= e!321781 e!321780)))

(declare-fun res!350452 () Bool)

(assert (=> b!558588 (=> res!350452 e!321780)))

(assert (=> b!558588 (= res!350452 (or (undefined!6145 lt!253860) (not (is-Intermediate!5333 lt!253860)) (= (select (arr!16884 a!3118) (index!23561 lt!253860)) (select (arr!16884 a!3118) j!142)) (= (select (arr!16884 a!3118) (index!23561 lt!253860)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!558589 () Bool)

(declare-fun e!321783 () Bool)

(assert (=> b!558589 (= e!321783 e!321778)))

(declare-fun res!350459 () Bool)

(assert (=> b!558589 (=> (not res!350459) (not e!321778))))

(declare-fun lt!253861 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35158 (_ BitVec 32)) SeekEntryResult!5333)

(assert (=> b!558589 (= res!350459 (= lt!253860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253861 (select (store (arr!16884 a!3118) i!1132 k!1914) j!142) (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118)) mask!3119)))))

(declare-fun lt!253858 () (_ BitVec 32))

(assert (=> b!558589 (= lt!253860 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253858 (select (arr!16884 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558589 (= lt!253861 (toIndex!0 (select (store (arr!16884 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!558589 (= lt!253858 (toIndex!0 (select (arr!16884 a!3118) j!142) mask!3119))))

(declare-fun b!558590 () Bool)

(declare-fun res!350453 () Bool)

(assert (=> b!558590 (=> (not res!350453) (not e!321783))))

(declare-datatypes ((List!10964 0))(
  ( (Nil!10961) (Cons!10960 (h!11954 (_ BitVec 64)) (t!17192 List!10964)) )
))
(declare-fun arrayNoDuplicates!0 (array!35158 (_ BitVec 32) List!10964) Bool)

(assert (=> b!558590 (= res!350453 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10961))))

(declare-fun b!558591 () Bool)

(assert (=> b!558591 (= e!321779 e!321783)))

(declare-fun res!350455 () Bool)

(assert (=> b!558591 (=> (not res!350455) (not e!321783))))

(declare-fun lt!253856 () SeekEntryResult!5333)

(assert (=> b!558591 (= res!350455 (or (= lt!253856 (MissingZero!5333 i!1132)) (= lt!253856 (MissingVacant!5333 i!1132))))))

(assert (=> b!558591 (= lt!253856 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!558592 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35158 (_ BitVec 32)) SeekEntryResult!5333)

(assert (=> b!558592 (= e!321780 (= lt!253859 (seekKeyOrZeroReturnVacant!0 (x!52457 lt!253860) (index!23561 lt!253860) (index!23561 lt!253860) (select (arr!16884 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun res!350456 () Bool)

(assert (=> start!51104 (=> (not res!350456) (not e!321779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51104 (= res!350456 (validMask!0 mask!3119))))

(assert (=> start!51104 e!321779))

(assert (=> start!51104 true))

(declare-fun array_inv!12680 (array!35158) Bool)

(assert (=> start!51104 (array_inv!12680 a!3118)))

(declare-fun b!558593 () Bool)

(declare-fun res!350454 () Bool)

(assert (=> b!558593 (=> (not res!350454) (not e!321779))))

(declare-fun arrayContainsKey!0 (array!35158 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!558593 (= res!350454 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!558594 () Bool)

(declare-fun res!350451 () Bool)

(assert (=> b!558594 (=> (not res!350451) (not e!321783))))

(assert (=> b!558594 (= res!350451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!558595 () Bool)

(declare-fun res!350449 () Bool)

(assert (=> b!558595 (=> (not res!350449) (not e!321779))))

(assert (=> b!558595 (= res!350449 (and (= (size!17248 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17248 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17248 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!558596 () Bool)

(declare-fun res!350458 () Bool)

(assert (=> b!558596 (=> (not res!350458) (not e!321779))))

(assert (=> b!558596 (= res!350458 (validKeyInArray!0 (select (arr!16884 a!3118) j!142)))))

(assert (= (and start!51104 res!350456) b!558595))

(assert (= (and b!558595 res!350449) b!558596))

(assert (= (and b!558596 res!350458) b!558587))

(assert (= (and b!558587 res!350450) b!558593))

(assert (= (and b!558593 res!350454) b!558591))

(assert (= (and b!558591 res!350455) b!558594))

(assert (= (and b!558594 res!350451) b!558590))

(assert (= (and b!558590 res!350453) b!558589))

(assert (= (and b!558589 res!350459) b!558586))

(assert (= (and b!558586 res!350457) b!558588))

(assert (= (and b!558588 (not res!350452)) b!558592))

(declare-fun m!536595 () Bool)

(assert (=> b!558591 m!536595))

(declare-fun m!536597 () Bool)

(assert (=> b!558596 m!536597))

(assert (=> b!558596 m!536597))

(declare-fun m!536599 () Bool)

(assert (=> b!558596 m!536599))

(assert (=> b!558589 m!536597))

(declare-fun m!536601 () Bool)

(assert (=> b!558589 m!536601))

(assert (=> b!558589 m!536597))

(declare-fun m!536603 () Bool)

(assert (=> b!558589 m!536603))

(assert (=> b!558589 m!536597))

(declare-fun m!536605 () Bool)

(assert (=> b!558589 m!536605))

(declare-fun m!536607 () Bool)

(assert (=> b!558589 m!536607))

(assert (=> b!558589 m!536605))

(declare-fun m!536609 () Bool)

(assert (=> b!558589 m!536609))

(assert (=> b!558589 m!536605))

(declare-fun m!536611 () Bool)

(assert (=> b!558589 m!536611))

(declare-fun m!536613 () Bool)

(assert (=> b!558586 m!536613))

(assert (=> b!558586 m!536597))

(declare-fun m!536615 () Bool)

(assert (=> b!558586 m!536615))

(declare-fun m!536617 () Bool)

(assert (=> b!558586 m!536617))

(assert (=> b!558586 m!536597))

(declare-fun m!536619 () Bool)

(assert (=> b!558586 m!536619))

(assert (=> b!558592 m!536597))

(assert (=> b!558592 m!536597))

(declare-fun m!536621 () Bool)

(assert (=> b!558592 m!536621))

(assert (=> b!558588 m!536613))

(assert (=> b!558588 m!536597))

(declare-fun m!536623 () Bool)

(assert (=> b!558587 m!536623))

(declare-fun m!536625 () Bool)

(assert (=> b!558594 m!536625))

(declare-fun m!536627 () Bool)

(assert (=> b!558590 m!536627))

(declare-fun m!536629 () Bool)

(assert (=> start!51104 m!536629))

(declare-fun m!536631 () Bool)

(assert (=> start!51104 m!536631))

(declare-fun m!536633 () Bool)

(assert (=> b!558593 m!536633))

(push 1)

(assert (not b!558592))

(assert (not b!558596))

(assert (not b!558591))

(assert (not b!558586))

(assert (not b!558594))

(assert (not start!51104))

(assert (not b!558587))

(assert (not b!558590))

(assert (not b!558589))

(assert (not b!558593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!558695 () Bool)

(declare-fun e!321841 () Bool)

(declare-fun e!321843 () Bool)

(assert (=> b!558695 (= e!321841 e!321843)))

(declare-fun lt!253911 () (_ BitVec 64))

(assert (=> b!558695 (= lt!253911 (select (arr!16884 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!253912 () Unit!17440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35158 (_ BitVec 64) (_ BitVec 32)) Unit!17440)

(assert (=> b!558695 (= lt!253912 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253911 #b00000000000000000000000000000000))))

(assert (=> b!558695 (arrayContainsKey!0 a!3118 lt!253911 #b00000000000000000000000000000000)))

(declare-fun lt!253910 () Unit!17440)

(assert (=> b!558695 (= lt!253910 lt!253912)))

(declare-fun res!350536 () Bool)

(assert (=> b!558695 (= res!350536 (= (seekEntryOrOpen!0 (select (arr!16884 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5333 #b00000000000000000000000000000000)))))

(assert (=> b!558695 (=> (not res!350536) (not e!321843))))

(declare-fun bm!32393 () Bool)

(declare-fun call!32396 () Bool)

(assert (=> bm!32393 (= call!32396 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!558697 () Bool)

(assert (=> b!558697 (= e!321843 call!32396)))

(declare-fun b!558698 () Bool)

(assert (=> b!558698 (= e!321841 call!32396)))

(declare-fun b!558696 () Bool)

(declare-fun e!321842 () Bool)

(assert (=> b!558696 (= e!321842 e!321841)))

(declare-fun c!64421 () Bool)

(assert (=> b!558696 (= c!64421 (validKeyInArray!0 (select (arr!16884 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!83585 () Bool)

(declare-fun res!350537 () Bool)

(assert (=> d!83585 (=> res!350537 e!321842)))

(assert (=> d!83585 (= res!350537 (bvsge #b00000000000000000000000000000000 (size!17248 a!3118)))))

(assert (=> d!83585 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!321842)))

(assert (= (and d!83585 (not res!350537)) b!558696))

(assert (= (and b!558696 c!64421) b!558695))

(assert (= (and b!558696 (not c!64421)) b!558698))

(assert (= (and b!558695 res!350536) b!558697))

(assert (= (or b!558697 b!558698) bm!32393))

(declare-fun m!536727 () Bool)

(assert (=> b!558695 m!536727))

(declare-fun m!536729 () Bool)

(assert (=> b!558695 m!536729))

(declare-fun m!536731 () Bool)

(assert (=> b!558695 m!536731))

(assert (=> b!558695 m!536727))

(declare-fun m!536733 () Bool)

(assert (=> b!558695 m!536733))

(declare-fun m!536735 () Bool)

(assert (=> bm!32393 m!536735))

(assert (=> b!558696 m!536727))

(assert (=> b!558696 m!536727))

(declare-fun m!536737 () Bool)

(assert (=> b!558696 m!536737))

(assert (=> b!558594 d!83585))

(declare-fun d!83591 () Bool)

(declare-fun res!350542 () Bool)

(declare-fun e!321848 () Bool)

(assert (=> d!83591 (=> res!350542 e!321848)))

(assert (=> d!83591 (= res!350542 (= (select (arr!16884 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!83591 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!321848)))

(declare-fun b!558703 () Bool)

(declare-fun e!321849 () Bool)

(assert (=> b!558703 (= e!321848 e!321849)))

(declare-fun res!350543 () Bool)

(assert (=> b!558703 (=> (not res!350543) (not e!321849))))

(assert (=> b!558703 (= res!350543 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17248 a!3118)))))

(declare-fun b!558704 () Bool)

(assert (=> b!558704 (= e!321849 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!83591 (not res!350542)) b!558703))

(assert (= (and b!558703 res!350543) b!558704))

(assert (=> d!83591 m!536727))

(declare-fun m!536739 () Bool)

(assert (=> b!558704 m!536739))

(assert (=> b!558593 d!83591))

(declare-fun d!83595 () Bool)

(assert (=> d!83595 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558587 d!83595))

(declare-fun b!558729 () Bool)

(declare-fun e!321864 () SeekEntryResult!5333)

(declare-fun e!321862 () SeekEntryResult!5333)

(assert (=> b!558729 (= e!321864 e!321862)))

(declare-fun lt!253923 () (_ BitVec 64))

(declare-fun c!64434 () Bool)

(assert (=> b!558729 (= c!64434 (= lt!253923 (select (arr!16884 a!3118) j!142)))))

(declare-fun b!558730 () Bool)

(declare-fun e!321863 () SeekEntryResult!5333)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!558730 (= e!321863 (seekKeyOrZeroReturnVacant!0 (bvadd (x!52457 lt!253860) #b00000000000000000000000000000001) (nextIndex!0 (index!23561 lt!253860) (x!52457 lt!253860) mask!3119) (index!23561 lt!253860) (select (arr!16884 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558731 () Bool)

(assert (=> b!558731 (= e!321864 Undefined!5333)))

(declare-fun b!558732 () Bool)

(assert (=> b!558732 (= e!321863 (MissingVacant!5333 (index!23561 lt!253860)))))

(declare-fun b!558733 () Bool)

(assert (=> b!558733 (= e!321862 (Found!5333 (index!23561 lt!253860)))))

(declare-fun b!558734 () Bool)

(declare-fun c!64436 () Bool)

(assert (=> b!558734 (= c!64436 (= lt!253923 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558734 (= e!321862 e!321863)))

(declare-fun d!83597 () Bool)

(declare-fun lt!253924 () SeekEntryResult!5333)

(assert (=> d!83597 (and (or (is-Undefined!5333 lt!253924) (not (is-Found!5333 lt!253924)) (and (bvsge (index!23560 lt!253924) #b00000000000000000000000000000000) (bvslt (index!23560 lt!253924) (size!17248 a!3118)))) (or (is-Undefined!5333 lt!253924) (is-Found!5333 lt!253924) (not (is-MissingVacant!5333 lt!253924)) (not (= (index!23562 lt!253924) (index!23561 lt!253860))) (and (bvsge (index!23562 lt!253924) #b00000000000000000000000000000000) (bvslt (index!23562 lt!253924) (size!17248 a!3118)))) (or (is-Undefined!5333 lt!253924) (ite (is-Found!5333 lt!253924) (= (select (arr!16884 a!3118) (index!23560 lt!253924)) (select (arr!16884 a!3118) j!142)) (and (is-MissingVacant!5333 lt!253924) (= (index!23562 lt!253924) (index!23561 lt!253860)) (= (select (arr!16884 a!3118) (index!23562 lt!253924)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!83597 (= lt!253924 e!321864)))

(declare-fun c!64435 () Bool)

(assert (=> d!83597 (= c!64435 (bvsge (x!52457 lt!253860) #b01111111111111111111111111111110))))

(assert (=> d!83597 (= lt!253923 (select (arr!16884 a!3118) (index!23561 lt!253860)))))

(assert (=> d!83597 (validMask!0 mask!3119)))

(assert (=> d!83597 (= (seekKeyOrZeroReturnVacant!0 (x!52457 lt!253860) (index!23561 lt!253860) (index!23561 lt!253860) (select (arr!16884 a!3118) j!142) a!3118 mask!3119) lt!253924)))

(assert (= (and d!83597 c!64435) b!558731))

(assert (= (and d!83597 (not c!64435)) b!558729))

(assert (= (and b!558729 c!64434) b!558733))

(assert (= (and b!558729 (not c!64434)) b!558734))

(assert (= (and b!558734 c!64436) b!558732))

(assert (= (and b!558734 (not c!64436)) b!558730))

(declare-fun m!536741 () Bool)

(assert (=> b!558730 m!536741))

(assert (=> b!558730 m!536741))

(assert (=> b!558730 m!536597))

(declare-fun m!536743 () Bool)

(assert (=> b!558730 m!536743))

(declare-fun m!536745 () Bool)

(assert (=> d!83597 m!536745))

(declare-fun m!536747 () Bool)

(assert (=> d!83597 m!536747))

(assert (=> d!83597 m!536613))

(assert (=> d!83597 m!536629))

(assert (=> b!558592 d!83597))

(declare-fun b!558784 () Bool)

(declare-fun e!321892 () SeekEntryResult!5333)

(declare-fun lt!253954 () SeekEntryResult!5333)

(assert (=> b!558784 (= e!321892 (MissingZero!5333 (index!23561 lt!253954)))))

(declare-fun b!558785 () Bool)

(declare-fun e!321894 () SeekEntryResult!5333)

(assert (=> b!558785 (= e!321894 Undefined!5333)))

(declare-fun b!558786 () Bool)

(declare-fun e!321893 () SeekEntryResult!5333)

(assert (=> b!558786 (= e!321894 e!321893)))

(declare-fun lt!253953 () (_ BitVec 64))

(assert (=> b!558786 (= lt!253953 (select (arr!16884 a!3118) (index!23561 lt!253954)))))

(declare-fun c!64460 () Bool)

(assert (=> b!558786 (= c!64460 (= lt!253953 k!1914))))

(declare-fun b!558787 () Bool)

(declare-fun c!64459 () Bool)

(assert (=> b!558787 (= c!64459 (= lt!253953 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558787 (= e!321893 e!321892)))

(declare-fun b!558788 () Bool)

(assert (=> b!558788 (= e!321893 (Found!5333 (index!23561 lt!253954)))))

(declare-fun b!558783 () Bool)

(assert (=> b!558783 (= e!321892 (seekKeyOrZeroReturnVacant!0 (x!52457 lt!253954) (index!23561 lt!253954) (index!23561 lt!253954) k!1914 a!3118 mask!3119))))

(declare-fun d!83599 () Bool)

(declare-fun lt!253952 () SeekEntryResult!5333)

(assert (=> d!83599 (and (or (is-Undefined!5333 lt!253952) (not (is-Found!5333 lt!253952)) (and (bvsge (index!23560 lt!253952) #b00000000000000000000000000000000) (bvslt (index!23560 lt!253952) (size!17248 a!3118)))) (or (is-Undefined!5333 lt!253952) (is-Found!5333 lt!253952) (not (is-MissingZero!5333 lt!253952)) (and (bvsge (index!23559 lt!253952) #b00000000000000000000000000000000) (bvslt (index!23559 lt!253952) (size!17248 a!3118)))) (or (is-Undefined!5333 lt!253952) (is-Found!5333 lt!253952) (is-MissingZero!5333 lt!253952) (not (is-MissingVacant!5333 lt!253952)) (and (bvsge (index!23562 lt!253952) #b00000000000000000000000000000000) (bvslt (index!23562 lt!253952) (size!17248 a!3118)))) (or (is-Undefined!5333 lt!253952) (ite (is-Found!5333 lt!253952) (= (select (arr!16884 a!3118) (index!23560 lt!253952)) k!1914) (ite (is-MissingZero!5333 lt!253952) (= (select (arr!16884 a!3118) (index!23559 lt!253952)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5333 lt!253952) (= (select (arr!16884 a!3118) (index!23562 lt!253952)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83599 (= lt!253952 e!321894)))

(declare-fun c!64458 () Bool)

(assert (=> d!83599 (= c!64458 (and (is-Intermediate!5333 lt!253954) (undefined!6145 lt!253954)))))

(assert (=> d!83599 (= lt!253954 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!83599 (validMask!0 mask!3119)))

(assert (=> d!83599 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!253952)))

(assert (= (and d!83599 c!64458) b!558785))

(assert (= (and d!83599 (not c!64458)) b!558786))

(assert (= (and b!558786 c!64460) b!558788))

(assert (= (and b!558786 (not c!64460)) b!558787))

(assert (= (and b!558787 c!64459) b!558784))

(assert (= (and b!558787 (not c!64459)) b!558783))

(declare-fun m!536779 () Bool)

(assert (=> b!558786 m!536779))

(declare-fun m!536781 () Bool)

(assert (=> b!558783 m!536781))

(assert (=> d!83599 m!536629))

(declare-fun m!536783 () Bool)

(assert (=> d!83599 m!536783))

(declare-fun m!536785 () Bool)

(assert (=> d!83599 m!536785))

(declare-fun m!536787 () Bool)

(assert (=> d!83599 m!536787))

(declare-fun m!536789 () Bool)

(assert (=> d!83599 m!536789))

(assert (=> d!83599 m!536785))

(declare-fun m!536791 () Bool)

(assert (=> d!83599 m!536791))

(assert (=> b!558591 d!83599))

(declare-fun b!558790 () Bool)

(declare-fun e!321895 () SeekEntryResult!5333)

(declare-fun lt!253957 () SeekEntryResult!5333)

(assert (=> b!558790 (= e!321895 (MissingZero!5333 (index!23561 lt!253957)))))

(declare-fun b!558791 () Bool)

(declare-fun e!321897 () SeekEntryResult!5333)

(assert (=> b!558791 (= e!321897 Undefined!5333)))

(declare-fun b!558792 () Bool)

(declare-fun e!321896 () SeekEntryResult!5333)

(assert (=> b!558792 (= e!321897 e!321896)))

(declare-fun lt!253956 () (_ BitVec 64))

(assert (=> b!558792 (= lt!253956 (select (arr!16884 a!3118) (index!23561 lt!253957)))))

(declare-fun c!64463 () Bool)

(assert (=> b!558792 (= c!64463 (= lt!253956 (select (arr!16884 a!3118) j!142)))))

(declare-fun b!558793 () Bool)

(declare-fun c!64462 () Bool)

(assert (=> b!558793 (= c!64462 (= lt!253956 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558793 (= e!321896 e!321895)))

(declare-fun b!558794 () Bool)

(assert (=> b!558794 (= e!321896 (Found!5333 (index!23561 lt!253957)))))

(declare-fun b!558789 () Bool)

(assert (=> b!558789 (= e!321895 (seekKeyOrZeroReturnVacant!0 (x!52457 lt!253957) (index!23561 lt!253957) (index!23561 lt!253957) (select (arr!16884 a!3118) j!142) a!3118 mask!3119))))

(declare-fun d!83607 () Bool)

(declare-fun lt!253955 () SeekEntryResult!5333)

(assert (=> d!83607 (and (or (is-Undefined!5333 lt!253955) (not (is-Found!5333 lt!253955)) (and (bvsge (index!23560 lt!253955) #b00000000000000000000000000000000) (bvslt (index!23560 lt!253955) (size!17248 a!3118)))) (or (is-Undefined!5333 lt!253955) (is-Found!5333 lt!253955) (not (is-MissingZero!5333 lt!253955)) (and (bvsge (index!23559 lt!253955) #b00000000000000000000000000000000) (bvslt (index!23559 lt!253955) (size!17248 a!3118)))) (or (is-Undefined!5333 lt!253955) (is-Found!5333 lt!253955) (is-MissingZero!5333 lt!253955) (not (is-MissingVacant!5333 lt!253955)) (and (bvsge (index!23562 lt!253955) #b00000000000000000000000000000000) (bvslt (index!23562 lt!253955) (size!17248 a!3118)))) (or (is-Undefined!5333 lt!253955) (ite (is-Found!5333 lt!253955) (= (select (arr!16884 a!3118) (index!23560 lt!253955)) (select (arr!16884 a!3118) j!142)) (ite (is-MissingZero!5333 lt!253955) (= (select (arr!16884 a!3118) (index!23559 lt!253955)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5333 lt!253955) (= (select (arr!16884 a!3118) (index!23562 lt!253955)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!83607 (= lt!253955 e!321897)))

(declare-fun c!64461 () Bool)

(assert (=> d!83607 (= c!64461 (and (is-Intermediate!5333 lt!253957) (undefined!6145 lt!253957)))))

(assert (=> d!83607 (= lt!253957 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16884 a!3118) j!142) mask!3119) (select (arr!16884 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!83607 (validMask!0 mask!3119)))

(assert (=> d!83607 (= (seekEntryOrOpen!0 (select (arr!16884 a!3118) j!142) a!3118 mask!3119) lt!253955)))

(assert (= (and d!83607 c!64461) b!558791))

(assert (= (and d!83607 (not c!64461)) b!558792))

(assert (= (and b!558792 c!64463) b!558794))

(assert (= (and b!558792 (not c!64463)) b!558793))

(assert (= (and b!558793 c!64462) b!558790))

(assert (= (and b!558793 (not c!64462)) b!558789))

(declare-fun m!536793 () Bool)

(assert (=> b!558792 m!536793))

(assert (=> b!558789 m!536597))

(declare-fun m!536795 () Bool)

(assert (=> b!558789 m!536795))

(assert (=> d!83607 m!536629))

(declare-fun m!536797 () Bool)

(assert (=> d!83607 m!536797))

(assert (=> d!83607 m!536601))

(assert (=> d!83607 m!536597))

(declare-fun m!536799 () Bool)

(assert (=> d!83607 m!536799))

(declare-fun m!536801 () Bool)

(assert (=> d!83607 m!536801))

(assert (=> d!83607 m!536597))

(assert (=> d!83607 m!536601))

(declare-fun m!536803 () Bool)

(assert (=> d!83607 m!536803))

(assert (=> b!558586 d!83607))

(declare-fun b!558795 () Bool)

(declare-fun e!321898 () Bool)

(declare-fun e!321900 () Bool)

(assert (=> b!558795 (= e!321898 e!321900)))

(declare-fun lt!253959 () (_ BitVec 64))

(assert (=> b!558795 (= lt!253959 (select (arr!16884 a!3118) j!142))))

(declare-fun lt!253960 () Unit!17440)

(assert (=> b!558795 (= lt!253960 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!253959 j!142))))

(assert (=> b!558795 (arrayContainsKey!0 a!3118 lt!253959 #b00000000000000000000000000000000)))

(declare-fun lt!253958 () Unit!17440)

(assert (=> b!558795 (= lt!253958 lt!253960)))

(declare-fun res!350550 () Bool)

(assert (=> b!558795 (= res!350550 (= (seekEntryOrOpen!0 (select (arr!16884 a!3118) j!142) a!3118 mask!3119) (Found!5333 j!142)))))

(assert (=> b!558795 (=> (not res!350550) (not e!321900))))

(declare-fun bm!32397 () Bool)

(declare-fun call!32400 () Bool)

(assert (=> bm!32397 (= call!32400 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(declare-fun b!558797 () Bool)

(assert (=> b!558797 (= e!321900 call!32400)))

(declare-fun b!558798 () Bool)

(assert (=> b!558798 (= e!321898 call!32400)))

(declare-fun b!558796 () Bool)

(declare-fun e!321899 () Bool)

(assert (=> b!558796 (= e!321899 e!321898)))

(declare-fun c!64464 () Bool)

(assert (=> b!558796 (= c!64464 (validKeyInArray!0 (select (arr!16884 a!3118) j!142)))))

(declare-fun d!83609 () Bool)

(declare-fun res!350551 () Bool)

(assert (=> d!83609 (=> res!350551 e!321899)))

(assert (=> d!83609 (= res!350551 (bvsge j!142 (size!17248 a!3118)))))

(assert (=> d!83609 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!321899)))

(assert (= (and d!83609 (not res!350551)) b!558796))

(assert (= (and b!558796 c!64464) b!558795))

(assert (= (and b!558796 (not c!64464)) b!558798))

(assert (= (and b!558795 res!350550) b!558797))

(assert (= (or b!558797 b!558798) bm!32397))

(assert (=> b!558795 m!536597))

(declare-fun m!536805 () Bool)

(assert (=> b!558795 m!536805))

(declare-fun m!536807 () Bool)

(assert (=> b!558795 m!536807))

(assert (=> b!558795 m!536597))

(assert (=> b!558795 m!536619))

(declare-fun m!536809 () Bool)

(assert (=> bm!32397 m!536809))

(assert (=> b!558796 m!536597))

(assert (=> b!558796 m!536597))

(assert (=> b!558796 m!536599))

(assert (=> b!558586 d!83609))

(declare-fun d!83611 () Bool)

(assert (=> d!83611 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!253972 () Unit!17440)

(declare-fun choose!38 (array!35158 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17440)

(assert (=> d!83611 (= lt!253972 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!83611 (validMask!0 mask!3119)))

(assert (=> d!83611 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!253972)))

(declare-fun bs!17387 () Bool)

(assert (= bs!17387 d!83611))

(assert (=> bs!17387 m!536615))

(declare-fun m!536813 () Bool)

(assert (=> bs!17387 m!536813))

(assert (=> bs!17387 m!536629))

(assert (=> b!558586 d!83611))

(declare-fun d!83615 () Bool)

(assert (=> d!83615 (= (validKeyInArray!0 (select (arr!16884 a!3118) j!142)) (and (not (= (select (arr!16884 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16884 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!558596 d!83615))

(declare-fun d!83617 () Bool)

(assert (=> d!83617 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51104 d!83617))

(declare-fun d!83623 () Bool)

(assert (=> d!83623 (= (array_inv!12680 a!3118) (bvsge (size!17248 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51104 d!83623))

(declare-fun d!83625 () Bool)

(declare-fun res!350565 () Bool)

(declare-fun e!321918 () Bool)

(assert (=> d!83625 (=> res!350565 e!321918)))

(assert (=> d!83625 (= res!350565 (bvsge #b00000000000000000000000000000000 (size!17248 a!3118)))))

(assert (=> d!83625 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10961) e!321918)))

(declare-fun b!558821 () Bool)

(declare-fun e!321919 () Bool)

(assert (=> b!558821 (= e!321918 e!321919)))

(declare-fun res!350564 () Bool)

(assert (=> b!558821 (=> (not res!350564) (not e!321919))))

(declare-fun e!321921 () Bool)

(assert (=> b!558821 (= res!350564 (not e!321921))))

(declare-fun res!350566 () Bool)

(assert (=> b!558821 (=> (not res!350566) (not e!321921))))

(assert (=> b!558821 (= res!350566 (validKeyInArray!0 (select (arr!16884 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558822 () Bool)

(declare-fun e!321920 () Bool)

(declare-fun call!32406 () Bool)

(assert (=> b!558822 (= e!321920 call!32406)))

(declare-fun bm!32403 () Bool)

(declare-fun c!64470 () Bool)

(assert (=> bm!32403 (= call!32406 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!64470 (Cons!10960 (select (arr!16884 a!3118) #b00000000000000000000000000000000) Nil!10961) Nil!10961)))))

(declare-fun b!558823 () Bool)

(assert (=> b!558823 (= e!321919 e!321920)))

(assert (=> b!558823 (= c!64470 (validKeyInArray!0 (select (arr!16884 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!558824 () Bool)

(assert (=> b!558824 (= e!321920 call!32406)))

(declare-fun b!558825 () Bool)

(declare-fun contains!2854 (List!10964 (_ BitVec 64)) Bool)

(assert (=> b!558825 (= e!321921 (contains!2854 Nil!10961 (select (arr!16884 a!3118) #b00000000000000000000000000000000)))))

(assert (= (and d!83625 (not res!350565)) b!558821))

(assert (= (and b!558821 res!350566) b!558825))

(assert (= (and b!558821 res!350564) b!558823))

(assert (= (and b!558823 c!64470) b!558822))

(assert (= (and b!558823 (not c!64470)) b!558824))

(assert (= (or b!558822 b!558824) bm!32403))

(assert (=> b!558821 m!536727))

(assert (=> b!558821 m!536727))

(assert (=> b!558821 m!536737))

(assert (=> bm!32403 m!536727))

(declare-fun m!536823 () Bool)

(assert (=> bm!32403 m!536823))

(assert (=> b!558823 m!536727))

(assert (=> b!558823 m!536727))

(assert (=> b!558823 m!536737))

(assert (=> b!558825 m!536727))

(assert (=> b!558825 m!536727))

(declare-fun m!536825 () Bool)

(assert (=> b!558825 m!536825))

(assert (=> b!558590 d!83625))

(declare-fun b!558883 () Bool)

(declare-fun lt!253994 () SeekEntryResult!5333)

(assert (=> b!558883 (and (bvsge (index!23561 lt!253994) #b00000000000000000000000000000000) (bvslt (index!23561 lt!253994) (size!17248 (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118)))))))

(declare-fun res!350588 () Bool)

(assert (=> b!558883 (= res!350588 (= (select (arr!16884 (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118))) (index!23561 lt!253994)) (select (store (arr!16884 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!321958 () Bool)

(assert (=> b!558883 (=> res!350588 e!321958)))

(declare-fun e!321961 () Bool)

(assert (=> b!558883 (= e!321961 e!321958)))

(declare-fun b!558884 () Bool)

(declare-fun e!321962 () SeekEntryResult!5333)

(declare-fun e!321959 () SeekEntryResult!5333)

(assert (=> b!558884 (= e!321962 e!321959)))

(declare-fun lt!253993 () (_ BitVec 64))

(declare-fun c!64491 () Bool)

(assert (=> b!558884 (= c!64491 (or (= lt!253993 (select (store (arr!16884 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!253993 lt!253993) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83633 () Bool)

(declare-fun e!321960 () Bool)

(assert (=> d!83633 e!321960))

(declare-fun c!64492 () Bool)

(assert (=> d!83633 (= c!64492 (and (is-Intermediate!5333 lt!253994) (undefined!6145 lt!253994)))))

(assert (=> d!83633 (= lt!253994 e!321962)))

(declare-fun c!64490 () Bool)

(assert (=> d!83633 (= c!64490 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83633 (= lt!253993 (select (arr!16884 (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118))) lt!253861))))

(assert (=> d!83633 (validMask!0 mask!3119)))

(assert (=> d!83633 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253861 (select (store (arr!16884 a!3118) i!1132 k!1914) j!142) (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118)) mask!3119) lt!253994)))

(declare-fun b!558885 () Bool)

(assert (=> b!558885 (and (bvsge (index!23561 lt!253994) #b00000000000000000000000000000000) (bvslt (index!23561 lt!253994) (size!17248 (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118)))))))

(declare-fun res!350587 () Bool)

(assert (=> b!558885 (= res!350587 (= (select (arr!16884 (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118))) (index!23561 lt!253994)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558885 (=> res!350587 e!321958)))

(declare-fun b!558886 () Bool)

(assert (=> b!558886 (= e!321960 e!321961)))

(declare-fun res!350586 () Bool)

(assert (=> b!558886 (= res!350586 (and (is-Intermediate!5333 lt!253994) (not (undefined!6145 lt!253994)) (bvslt (x!52457 lt!253994) #b01111111111111111111111111111110) (bvsge (x!52457 lt!253994) #b00000000000000000000000000000000) (bvsge (x!52457 lt!253994) #b00000000000000000000000000000000)))))

(assert (=> b!558886 (=> (not res!350586) (not e!321961))))

(declare-fun b!558887 () Bool)

(assert (=> b!558887 (= e!321960 (bvsge (x!52457 lt!253994) #b01111111111111111111111111111110))))

(declare-fun b!558888 () Bool)

(assert (=> b!558888 (= e!321962 (Intermediate!5333 true lt!253861 #b00000000000000000000000000000000))))

(declare-fun b!558889 () Bool)

(assert (=> b!558889 (= e!321959 (Intermediate!5333 false lt!253861 #b00000000000000000000000000000000))))

(declare-fun b!558890 () Bool)

(assert (=> b!558890 (= e!321959 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253861 #b00000000000000000000000000000000 mask!3119) (select (store (arr!16884 a!3118) i!1132 k!1914) j!142) (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118)) mask!3119))))

(declare-fun b!558891 () Bool)

(assert (=> b!558891 (and (bvsge (index!23561 lt!253994) #b00000000000000000000000000000000) (bvslt (index!23561 lt!253994) (size!17248 (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118)))))))

(assert (=> b!558891 (= e!321958 (= (select (arr!16884 (array!35159 (store (arr!16884 a!3118) i!1132 k!1914) (size!17248 a!3118))) (index!23561 lt!253994)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!83633 c!64490) b!558888))

(assert (= (and d!83633 (not c!64490)) b!558884))

(assert (= (and b!558884 c!64491) b!558889))

(assert (= (and b!558884 (not c!64491)) b!558890))

(assert (= (and d!83633 c!64492) b!558887))

(assert (= (and d!83633 (not c!64492)) b!558886))

(assert (= (and b!558886 res!350586) b!558883))

(assert (= (and b!558883 (not res!350588)) b!558885))

(assert (= (and b!558885 (not res!350587)) b!558891))

(declare-fun m!536855 () Bool)

(assert (=> b!558883 m!536855))

(declare-fun m!536857 () Bool)

(assert (=> b!558890 m!536857))

(assert (=> b!558890 m!536857))

(assert (=> b!558890 m!536605))

(declare-fun m!536859 () Bool)

(assert (=> b!558890 m!536859))

(declare-fun m!536861 () Bool)

(assert (=> d!83633 m!536861))

(assert (=> d!83633 m!536629))

(assert (=> b!558891 m!536855))

(assert (=> b!558885 m!536855))

(assert (=> b!558589 d!83633))

(declare-fun b!558896 () Bool)

(declare-fun lt!253996 () SeekEntryResult!5333)

(assert (=> b!558896 (and (bvsge (index!23561 lt!253996) #b00000000000000000000000000000000) (bvslt (index!23561 lt!253996) (size!17248 a!3118)))))

(declare-fun res!350595 () Bool)

(assert (=> b!558896 (= res!350595 (= (select (arr!16884 a!3118) (index!23561 lt!253996)) (select (arr!16884 a!3118) j!142)))))

(declare-fun e!321965 () Bool)

(assert (=> b!558896 (=> res!350595 e!321965)))

(declare-fun e!321968 () Bool)

(assert (=> b!558896 (= e!321968 e!321965)))

(declare-fun b!558897 () Bool)

(declare-fun e!321969 () SeekEntryResult!5333)

(declare-fun e!321966 () SeekEntryResult!5333)

(assert (=> b!558897 (= e!321969 e!321966)))

(declare-fun c!64494 () Bool)

(declare-fun lt!253995 () (_ BitVec 64))

(assert (=> b!558897 (= c!64494 (or (= lt!253995 (select (arr!16884 a!3118) j!142)) (= (bvadd lt!253995 lt!253995) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!83643 () Bool)

(declare-fun e!321967 () Bool)

(assert (=> d!83643 e!321967))

(declare-fun c!64495 () Bool)

(assert (=> d!83643 (= c!64495 (and (is-Intermediate!5333 lt!253996) (undefined!6145 lt!253996)))))

(assert (=> d!83643 (= lt!253996 e!321969)))

(declare-fun c!64493 () Bool)

(assert (=> d!83643 (= c!64493 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!83643 (= lt!253995 (select (arr!16884 a!3118) lt!253858))))

(assert (=> d!83643 (validMask!0 mask!3119)))

(assert (=> d!83643 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!253858 (select (arr!16884 a!3118) j!142) a!3118 mask!3119) lt!253996)))

(declare-fun b!558898 () Bool)

(assert (=> b!558898 (and (bvsge (index!23561 lt!253996) #b00000000000000000000000000000000) (bvslt (index!23561 lt!253996) (size!17248 a!3118)))))

(declare-fun res!350594 () Bool)

(assert (=> b!558898 (= res!350594 (= (select (arr!16884 a!3118) (index!23561 lt!253996)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!558898 (=> res!350594 e!321965)))

(declare-fun b!558899 () Bool)

(assert (=> b!558899 (= e!321967 e!321968)))

(declare-fun res!350593 () Bool)

(assert (=> b!558899 (= res!350593 (and (is-Intermediate!5333 lt!253996) (not (undefined!6145 lt!253996)) (bvslt (x!52457 lt!253996) #b01111111111111111111111111111110) (bvsge (x!52457 lt!253996) #b00000000000000000000000000000000) (bvsge (x!52457 lt!253996) #b00000000000000000000000000000000)))))

(assert (=> b!558899 (=> (not res!350593) (not e!321968))))

(declare-fun b!558900 () Bool)

(assert (=> b!558900 (= e!321967 (bvsge (x!52457 lt!253996) #b01111111111111111111111111111110))))

(declare-fun b!558901 () Bool)

(assert (=> b!558901 (= e!321969 (Intermediate!5333 true lt!253858 #b00000000000000000000000000000000))))

(declare-fun b!558902 () Bool)

(assert (=> b!558902 (= e!321966 (Intermediate!5333 false lt!253858 #b00000000000000000000000000000000))))

(declare-fun b!558903 () Bool)

(assert (=> b!558903 (= e!321966 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!253858 #b00000000000000000000000000000000 mask!3119) (select (arr!16884 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!558904 () Bool)

(assert (=> b!558904 (and (bvsge (index!23561 lt!253996) #b00000000000000000000000000000000) (bvslt (index!23561 lt!253996) (size!17248 a!3118)))))

(assert (=> b!558904 (= e!321965 (= (select (arr!16884 a!3118) (index!23561 lt!253996)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!83643 c!64493) b!558901))

(assert (= (and d!83643 (not c!64493)) b!558897))

(assert (= (and b!558897 c!64494) b!558902))

(assert (= (and b!558897 (not c!64494)) b!558903))

(assert (= (and d!83643 c!64495) b!558900))

(assert (= (and d!83643 (not c!64495)) b!558899))

(assert (= (and b!558899 res!350593) b!558896))

(assert (= (and b!558896 (not res!350595)) b!558898))

(assert (= (and b!558898 (not res!350594)) b!558904))

(declare-fun m!536863 () Bool)

(assert (=> b!558896 m!536863))

(declare-fun m!536865 () Bool)

(assert (=> b!558903 m!536865))

(assert (=> b!558903 m!536865))

(assert (=> b!558903 m!536597))

(declare-fun m!536867 () Bool)

(assert (=> b!558903 m!536867))

(declare-fun m!536869 () Bool)

(assert (=> d!83643 m!536869))

(assert (=> d!83643 m!536629))

(assert (=> b!558904 m!536863))

(assert (=> b!558898 m!536863))

(assert (=> b!558589 d!83643))

(declare-fun d!83645 () Bool)

(declare-fun lt!254004 () (_ BitVec 32))

(declare-fun lt!254003 () (_ BitVec 32))

(assert (=> d!83645 (= lt!254004 (bvmul (bvxor lt!254003 (bvlshr lt!254003 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83645 (= lt!254003 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16884 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16884 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83645 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350596 (let ((h!11957 ((_ extract 31 0) (bvand (bvxor (select (store (arr!16884 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!16884 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52464 (bvmul (bvxor h!11957 (bvlshr h!11957 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52464 (bvlshr x!52464 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350596 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350596 #b00000000000000000000000000000000))))))

(assert (=> d!83645 (= (toIndex!0 (select (store (arr!16884 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!254004 (bvlshr lt!254004 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558589 d!83645))

(declare-fun d!83647 () Bool)

(declare-fun lt!254006 () (_ BitVec 32))

(declare-fun lt!254005 () (_ BitVec 32))

(assert (=> d!83647 (= lt!254006 (bvmul (bvxor lt!254005 (bvlshr lt!254005 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!83647 (= lt!254005 ((_ extract 31 0) (bvand (bvxor (select (arr!16884 a!3118) j!142) (bvlshr (select (arr!16884 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!83647 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!350596 (let ((h!11957 ((_ extract 31 0) (bvand (bvxor (select (arr!16884 a!3118) j!142) (bvlshr (select (arr!16884 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!52464 (bvmul (bvxor h!11957 (bvlshr h!11957 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!52464 (bvlshr x!52464 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!350596 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!350596 #b00000000000000000000000000000000))))))

(assert (=> d!83647 (= (toIndex!0 (select (arr!16884 a!3118) j!142) mask!3119) (bvand (bvxor lt!254006 (bvlshr lt!254006 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!558589 d!83647))

(push 1)

(assert (not b!558730))

(assert (not b!558821))

(assert (not b!558825))

(assert (not b!558890))

(assert (not b!558823))

(assert (not bm!32393))

(assert (not b!558903))

(assert (not d!83607))

(assert (not d!83643))

(assert (not b!558795))

(assert (not d!83597))

(assert (not b!558796))

(assert (not bm!32397))

(assert (not b!558696))

(assert (not b!558704))

(assert (not d!83599))

(assert (not b!558783))

(assert (not b!558695))

(assert (not d!83611))

(assert (not d!83633))

(assert (not b!558789))

(assert (not bm!32403))

(check-sat)

(pop 1)

(push 1)

(check-sat)

