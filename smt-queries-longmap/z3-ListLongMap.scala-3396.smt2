; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46850 () Bool)

(assert start!46850)

(declare-fun b!517189 () Bool)

(declare-fun res!316571 () Bool)

(declare-fun e!301796 () Bool)

(assert (=> b!517189 (=> (not res!316571) (not e!301796))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33105 0))(
  ( (array!33106 (arr!15919 (Array (_ BitVec 32) (_ BitVec 64))) (size!16283 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33105)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!517189 (= res!316571 (and (= (size!16283 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16283 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16283 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!517190 () Bool)

(declare-fun res!316570 () Bool)

(assert (=> b!517190 (=> (not res!316570) (not e!301796))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!517190 (= res!316570 (validKeyInArray!0 k0!2280))))

(declare-fun b!517191 () Bool)

(declare-fun e!301799 () Bool)

(assert (=> b!517191 (= e!301796 e!301799)))

(declare-fun res!316573 () Bool)

(assert (=> b!517191 (=> (not res!316573) (not e!301799))))

(declare-datatypes ((SeekEntryResult!4386 0))(
  ( (MissingZero!4386 (index!19732 (_ BitVec 32))) (Found!4386 (index!19733 (_ BitVec 32))) (Intermediate!4386 (undefined!5198 Bool) (index!19734 (_ BitVec 32)) (x!48691 (_ BitVec 32))) (Undefined!4386) (MissingVacant!4386 (index!19735 (_ BitVec 32))) )
))
(declare-fun lt!236757 () SeekEntryResult!4386)

(assert (=> b!517191 (= res!316573 (or (= lt!236757 (MissingZero!4386 i!1204)) (= lt!236757 (MissingVacant!4386 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33105 (_ BitVec 32)) SeekEntryResult!4386)

(assert (=> b!517191 (= lt!236757 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!517192 () Bool)

(declare-fun res!316580 () Bool)

(assert (=> b!517192 (=> (not res!316580) (not e!301796))))

(declare-fun arrayContainsKey!0 (array!33105 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!517192 (= res!316580 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!517193 () Bool)

(declare-fun res!316576 () Bool)

(assert (=> b!517193 (=> (not res!316576) (not e!301799))))

(declare-datatypes ((List!10077 0))(
  ( (Nil!10074) (Cons!10073 (h!10974 (_ BitVec 64)) (t!16305 List!10077)) )
))
(declare-fun arrayNoDuplicates!0 (array!33105 (_ BitVec 32) List!10077) Bool)

(assert (=> b!517193 (= res!316576 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10074))))

(declare-fun b!517194 () Bool)

(declare-fun lt!236755 () SeekEntryResult!4386)

(declare-fun lt!236754 () (_ BitVec 32))

(declare-fun e!301797 () Bool)

(assert (=> b!517194 (= e!301797 (or (not (= (select (arr!15919 a!3235) (index!19734 lt!236755)) (select (arr!15919 a!3235) j!176))) (bvsgt (x!48691 lt!236755) #b01111111111111111111111111111110) (bvsgt #b00000000000000000000000000000000 (x!48691 lt!236755)) (and (bvsge lt!236754 #b00000000000000000000000000000000) (bvslt lt!236754 (size!16283 a!3235)))))))

(assert (=> b!517194 (and (bvslt (x!48691 lt!236755) #b01111111111111111111111111111110) (or (= (select (arr!15919 a!3235) (index!19734 lt!236755)) (select (arr!15919 a!3235) j!176)) (= (select (arr!15919 a!3235) (index!19734 lt!236755)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15919 a!3235) (index!19734 lt!236755)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!517195 () Bool)

(declare-fun res!316577 () Bool)

(assert (=> b!517195 (=> (not res!316577) (not e!301799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33105 (_ BitVec 32)) Bool)

(assert (=> b!517195 (= res!316577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!517196 () Bool)

(declare-fun res!316572 () Bool)

(assert (=> b!517196 (=> (not res!316572) (not e!301796))))

(assert (=> b!517196 (= res!316572 (validKeyInArray!0 (select (arr!15919 a!3235) j!176)))))

(declare-fun b!517197 () Bool)

(declare-fun res!316574 () Bool)

(assert (=> b!517197 (=> res!316574 e!301797)))

(get-info :version)

(assert (=> b!517197 (= res!316574 (or (undefined!5198 lt!236755) (not ((_ is Intermediate!4386) lt!236755))))))

(declare-fun e!301800 () Bool)

(declare-fun b!517198 () Bool)

(assert (=> b!517198 (= e!301800 (= (seekEntryOrOpen!0 (select (arr!15919 a!3235) j!176) a!3235 mask!3524) (Found!4386 j!176)))))

(declare-fun b!517199 () Bool)

(assert (=> b!517199 (= e!301799 (not e!301797))))

(declare-fun res!316579 () Bool)

(assert (=> b!517199 (=> res!316579 e!301797)))

(declare-fun lt!236758 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33105 (_ BitVec 32)) SeekEntryResult!4386)

(assert (=> b!517199 (= res!316579 (= lt!236755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236758 (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235)) mask!3524)))))

(assert (=> b!517199 (= lt!236755 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236754 (select (arr!15919 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517199 (= lt!236758 (toIndex!0 (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!517199 (= lt!236754 (toIndex!0 (select (arr!15919 a!3235) j!176) mask!3524))))

(assert (=> b!517199 e!301800))

(declare-fun res!316578 () Bool)

(assert (=> b!517199 (=> (not res!316578) (not e!301800))))

(assert (=> b!517199 (= res!316578 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16030 0))(
  ( (Unit!16031) )
))
(declare-fun lt!236756 () Unit!16030)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16030)

(assert (=> b!517199 (= lt!236756 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!316575 () Bool)

(assert (=> start!46850 (=> (not res!316575) (not e!301796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46850 (= res!316575 (validMask!0 mask!3524))))

(assert (=> start!46850 e!301796))

(assert (=> start!46850 true))

(declare-fun array_inv!11715 (array!33105) Bool)

(assert (=> start!46850 (array_inv!11715 a!3235)))

(assert (= (and start!46850 res!316575) b!517189))

(assert (= (and b!517189 res!316571) b!517196))

(assert (= (and b!517196 res!316572) b!517190))

(assert (= (and b!517190 res!316570) b!517192))

(assert (= (and b!517192 res!316580) b!517191))

(assert (= (and b!517191 res!316573) b!517195))

(assert (= (and b!517195 res!316577) b!517193))

(assert (= (and b!517193 res!316576) b!517199))

(assert (= (and b!517199 res!316578) b!517198))

(assert (= (and b!517199 (not res!316579)) b!517197))

(assert (= (and b!517197 (not res!316574)) b!517194))

(declare-fun m!498659 () Bool)

(assert (=> b!517199 m!498659))

(declare-fun m!498661 () Bool)

(assert (=> b!517199 m!498661))

(declare-fun m!498663 () Bool)

(assert (=> b!517199 m!498663))

(assert (=> b!517199 m!498663))

(declare-fun m!498665 () Bool)

(assert (=> b!517199 m!498665))

(declare-fun m!498667 () Bool)

(assert (=> b!517199 m!498667))

(declare-fun m!498669 () Bool)

(assert (=> b!517199 m!498669))

(assert (=> b!517199 m!498667))

(declare-fun m!498671 () Bool)

(assert (=> b!517199 m!498671))

(assert (=> b!517199 m!498667))

(declare-fun m!498673 () Bool)

(assert (=> b!517199 m!498673))

(assert (=> b!517199 m!498663))

(declare-fun m!498675 () Bool)

(assert (=> b!517199 m!498675))

(assert (=> b!517198 m!498667))

(assert (=> b!517198 m!498667))

(declare-fun m!498677 () Bool)

(assert (=> b!517198 m!498677))

(declare-fun m!498679 () Bool)

(assert (=> b!517194 m!498679))

(assert (=> b!517194 m!498667))

(assert (=> b!517196 m!498667))

(assert (=> b!517196 m!498667))

(declare-fun m!498681 () Bool)

(assert (=> b!517196 m!498681))

(declare-fun m!498683 () Bool)

(assert (=> b!517193 m!498683))

(declare-fun m!498685 () Bool)

(assert (=> b!517190 m!498685))

(declare-fun m!498687 () Bool)

(assert (=> start!46850 m!498687))

(declare-fun m!498689 () Bool)

(assert (=> start!46850 m!498689))

(declare-fun m!498691 () Bool)

(assert (=> b!517195 m!498691))

(declare-fun m!498693 () Bool)

(assert (=> b!517192 m!498693))

(declare-fun m!498695 () Bool)

(assert (=> b!517191 m!498695))

(check-sat (not b!517193) (not b!517199) (not b!517192) (not b!517196) (not b!517198) (not start!46850) (not b!517195) (not b!517191) (not b!517190))
(check-sat)
(get-model)

(declare-fun b!517251 () Bool)

(declare-fun e!301828 () SeekEntryResult!4386)

(assert (=> b!517251 (= e!301828 (Intermediate!4386 false lt!236758 #b00000000000000000000000000000000))))

(declare-fun b!517252 () Bool)

(declare-fun e!301829 () Bool)

(declare-fun lt!236779 () SeekEntryResult!4386)

(assert (=> b!517252 (= e!301829 (bvsge (x!48691 lt!236779) #b01111111111111111111111111111110))))

(declare-fun b!517253 () Bool)

(declare-fun e!301826 () Bool)

(assert (=> b!517253 (= e!301829 e!301826)))

(declare-fun res!316620 () Bool)

(assert (=> b!517253 (= res!316620 (and ((_ is Intermediate!4386) lt!236779) (not (undefined!5198 lt!236779)) (bvslt (x!48691 lt!236779) #b01111111111111111111111111111110) (bvsge (x!48691 lt!236779) #b00000000000000000000000000000000) (bvsge (x!48691 lt!236779) #b00000000000000000000000000000000)))))

(assert (=> b!517253 (=> (not res!316620) (not e!301826))))

(declare-fun b!517254 () Bool)

(declare-fun e!301830 () SeekEntryResult!4386)

(assert (=> b!517254 (= e!301830 (Intermediate!4386 true lt!236758 #b00000000000000000000000000000000))))

(declare-fun b!517255 () Bool)

(assert (=> b!517255 (and (bvsge (index!19734 lt!236779) #b00000000000000000000000000000000) (bvslt (index!19734 lt!236779) (size!16283 (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235)))))))

(declare-fun res!316621 () Bool)

(assert (=> b!517255 (= res!316621 (= (select (arr!15919 (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235))) (index!19734 lt!236779)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301827 () Bool)

(assert (=> b!517255 (=> res!316621 e!301827)))

(declare-fun b!517256 () Bool)

(assert (=> b!517256 (= e!301830 e!301828)))

(declare-fun lt!236778 () (_ BitVec 64))

(declare-fun c!60607 () Bool)

(assert (=> b!517256 (= c!60607 (or (= lt!236778 (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!236778 lt!236778) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79669 () Bool)

(assert (=> d!79669 e!301829))

(declare-fun c!60608 () Bool)

(assert (=> d!79669 (= c!60608 (and ((_ is Intermediate!4386) lt!236779) (undefined!5198 lt!236779)))))

(assert (=> d!79669 (= lt!236779 e!301830)))

(declare-fun c!60606 () Bool)

(assert (=> d!79669 (= c!60606 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79669 (= lt!236778 (select (arr!15919 (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235))) lt!236758))))

(assert (=> d!79669 (validMask!0 mask!3524)))

(assert (=> d!79669 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236758 (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235)) mask!3524) lt!236779)))

(declare-fun b!517257 () Bool)

(assert (=> b!517257 (and (bvsge (index!19734 lt!236779) #b00000000000000000000000000000000) (bvslt (index!19734 lt!236779) (size!16283 (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235)))))))

(declare-fun res!316622 () Bool)

(assert (=> b!517257 (= res!316622 (= (select (arr!15919 (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235))) (index!19734 lt!236779)) (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176)))))

(assert (=> b!517257 (=> res!316622 e!301827)))

(assert (=> b!517257 (= e!301826 e!301827)))

(declare-fun b!517258 () Bool)

(assert (=> b!517258 (and (bvsge (index!19734 lt!236779) #b00000000000000000000000000000000) (bvslt (index!19734 lt!236779) (size!16283 (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235)))))))

(assert (=> b!517258 (= e!301827 (= (select (arr!15919 (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235))) (index!19734 lt!236779)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517259 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!517259 (= e!301828 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236758 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) (array!33106 (store (arr!15919 a!3235) i!1204 k0!2280) (size!16283 a!3235)) mask!3524))))

(assert (= (and d!79669 c!60606) b!517254))

(assert (= (and d!79669 (not c!60606)) b!517256))

(assert (= (and b!517256 c!60607) b!517251))

(assert (= (and b!517256 (not c!60607)) b!517259))

(assert (= (and d!79669 c!60608) b!517252))

(assert (= (and d!79669 (not c!60608)) b!517253))

(assert (= (and b!517253 res!316620) b!517257))

(assert (= (and b!517257 (not res!316622)) b!517255))

(assert (= (and b!517255 (not res!316621)) b!517258))

(declare-fun m!498735 () Bool)

(assert (=> b!517258 m!498735))

(declare-fun m!498737 () Bool)

(assert (=> d!79669 m!498737))

(assert (=> d!79669 m!498687))

(declare-fun m!498739 () Bool)

(assert (=> b!517259 m!498739))

(assert (=> b!517259 m!498739))

(assert (=> b!517259 m!498663))

(declare-fun m!498741 () Bool)

(assert (=> b!517259 m!498741))

(assert (=> b!517255 m!498735))

(assert (=> b!517257 m!498735))

(assert (=> b!517199 d!79669))

(declare-fun bm!31661 () Bool)

(declare-fun call!31664 () Bool)

(assert (=> bm!31661 (= call!31664 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517270 () Bool)

(declare-fun e!301839 () Bool)

(declare-fun e!301837 () Bool)

(assert (=> b!517270 (= e!301839 e!301837)))

(declare-fun c!60611 () Bool)

(assert (=> b!517270 (= c!60611 (validKeyInArray!0 (select (arr!15919 a!3235) j!176)))))

(declare-fun d!79673 () Bool)

(declare-fun res!316627 () Bool)

(assert (=> d!79673 (=> res!316627 e!301839)))

(assert (=> d!79673 (= res!316627 (bvsge j!176 (size!16283 a!3235)))))

(assert (=> d!79673 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!301839)))

(declare-fun b!517271 () Bool)

(declare-fun e!301838 () Bool)

(assert (=> b!517271 (= e!301837 e!301838)))

(declare-fun lt!236790 () (_ BitVec 64))

(assert (=> b!517271 (= lt!236790 (select (arr!15919 a!3235) j!176))))

(declare-fun lt!236792 () Unit!16030)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33105 (_ BitVec 64) (_ BitVec 32)) Unit!16030)

(assert (=> b!517271 (= lt!236792 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236790 j!176))))

(assert (=> b!517271 (arrayContainsKey!0 a!3235 lt!236790 #b00000000000000000000000000000000)))

(declare-fun lt!236791 () Unit!16030)

(assert (=> b!517271 (= lt!236791 lt!236792)))

(declare-fun res!316628 () Bool)

(assert (=> b!517271 (= res!316628 (= (seekEntryOrOpen!0 (select (arr!15919 a!3235) j!176) a!3235 mask!3524) (Found!4386 j!176)))))

(assert (=> b!517271 (=> (not res!316628) (not e!301838))))

(declare-fun b!517272 () Bool)

(assert (=> b!517272 (= e!301838 call!31664)))

(declare-fun b!517273 () Bool)

(assert (=> b!517273 (= e!301837 call!31664)))

(assert (= (and d!79673 (not res!316627)) b!517270))

(assert (= (and b!517270 c!60611) b!517271))

(assert (= (and b!517270 (not c!60611)) b!517273))

(assert (= (and b!517271 res!316628) b!517272))

(assert (= (or b!517272 b!517273) bm!31661))

(declare-fun m!498743 () Bool)

(assert (=> bm!31661 m!498743))

(assert (=> b!517270 m!498667))

(assert (=> b!517270 m!498667))

(assert (=> b!517270 m!498681))

(assert (=> b!517271 m!498667))

(declare-fun m!498745 () Bool)

(assert (=> b!517271 m!498745))

(declare-fun m!498747 () Bool)

(assert (=> b!517271 m!498747))

(assert (=> b!517271 m!498667))

(assert (=> b!517271 m!498677))

(assert (=> b!517199 d!79673))

(declare-fun d!79675 () Bool)

(assert (=> d!79675 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!236800 () Unit!16030)

(declare-fun choose!38 (array!33105 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16030)

(assert (=> d!79675 (= lt!236800 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!79675 (validMask!0 mask!3524)))

(assert (=> d!79675 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!236800)))

(declare-fun bs!16336 () Bool)

(assert (= bs!16336 d!79675))

(assert (=> bs!16336 m!498671))

(declare-fun m!498749 () Bool)

(assert (=> bs!16336 m!498749))

(assert (=> bs!16336 m!498687))

(assert (=> b!517199 d!79675))

(declare-fun d!79677 () Bool)

(declare-fun lt!236806 () (_ BitVec 32))

(declare-fun lt!236805 () (_ BitVec 32))

(assert (=> d!79677 (= lt!236806 (bvmul (bvxor lt!236805 (bvlshr lt!236805 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79677 (= lt!236805 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79677 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316629 (let ((h!10976 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48694 (bvmul (bvxor h!10976 (bvlshr h!10976 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48694 (bvlshr x!48694 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316629 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316629 #b00000000000000000000000000000000))))))

(assert (=> d!79677 (= (toIndex!0 (select (store (arr!15919 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!236806 (bvlshr lt!236806 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517199 d!79677))

(declare-fun b!517290 () Bool)

(declare-fun e!301851 () SeekEntryResult!4386)

(assert (=> b!517290 (= e!301851 (Intermediate!4386 false lt!236754 #b00000000000000000000000000000000))))

(declare-fun b!517291 () Bool)

(declare-fun e!301852 () Bool)

(declare-fun lt!236808 () SeekEntryResult!4386)

(assert (=> b!517291 (= e!301852 (bvsge (x!48691 lt!236808) #b01111111111111111111111111111110))))

(declare-fun b!517292 () Bool)

(declare-fun e!301849 () Bool)

(assert (=> b!517292 (= e!301852 e!301849)))

(declare-fun res!316630 () Bool)

(assert (=> b!517292 (= res!316630 (and ((_ is Intermediate!4386) lt!236808) (not (undefined!5198 lt!236808)) (bvslt (x!48691 lt!236808) #b01111111111111111111111111111110) (bvsge (x!48691 lt!236808) #b00000000000000000000000000000000) (bvsge (x!48691 lt!236808) #b00000000000000000000000000000000)))))

(assert (=> b!517292 (=> (not res!316630) (not e!301849))))

(declare-fun b!517293 () Bool)

(declare-fun e!301853 () SeekEntryResult!4386)

(assert (=> b!517293 (= e!301853 (Intermediate!4386 true lt!236754 #b00000000000000000000000000000000))))

(declare-fun b!517294 () Bool)

(assert (=> b!517294 (and (bvsge (index!19734 lt!236808) #b00000000000000000000000000000000) (bvslt (index!19734 lt!236808) (size!16283 a!3235)))))

(declare-fun res!316631 () Bool)

(assert (=> b!517294 (= res!316631 (= (select (arr!15919 a!3235) (index!19734 lt!236808)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301850 () Bool)

(assert (=> b!517294 (=> res!316631 e!301850)))

(declare-fun b!517295 () Bool)

(assert (=> b!517295 (= e!301853 e!301851)))

(declare-fun c!60622 () Bool)

(declare-fun lt!236807 () (_ BitVec 64))

(assert (=> b!517295 (= c!60622 (or (= lt!236807 (select (arr!15919 a!3235) j!176)) (= (bvadd lt!236807 lt!236807) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!79685 () Bool)

(assert (=> d!79685 e!301852))

(declare-fun c!60623 () Bool)

(assert (=> d!79685 (= c!60623 (and ((_ is Intermediate!4386) lt!236808) (undefined!5198 lt!236808)))))

(assert (=> d!79685 (= lt!236808 e!301853)))

(declare-fun c!60621 () Bool)

(assert (=> d!79685 (= c!60621 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!79685 (= lt!236807 (select (arr!15919 a!3235) lt!236754))))

(assert (=> d!79685 (validMask!0 mask!3524)))

(assert (=> d!79685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236754 (select (arr!15919 a!3235) j!176) a!3235 mask!3524) lt!236808)))

(declare-fun b!517296 () Bool)

(assert (=> b!517296 (and (bvsge (index!19734 lt!236808) #b00000000000000000000000000000000) (bvslt (index!19734 lt!236808) (size!16283 a!3235)))))

(declare-fun res!316632 () Bool)

(assert (=> b!517296 (= res!316632 (= (select (arr!15919 a!3235) (index!19734 lt!236808)) (select (arr!15919 a!3235) j!176)))))

(assert (=> b!517296 (=> res!316632 e!301850)))

(assert (=> b!517296 (= e!301849 e!301850)))

(declare-fun b!517297 () Bool)

(assert (=> b!517297 (and (bvsge (index!19734 lt!236808) #b00000000000000000000000000000000) (bvslt (index!19734 lt!236808) (size!16283 a!3235)))))

(assert (=> b!517297 (= e!301850 (= (select (arr!15919 a!3235) (index!19734 lt!236808)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!517298 () Bool)

(assert (=> b!517298 (= e!301851 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!236754 #b00000000000000000000000000000000 mask!3524) (select (arr!15919 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!79685 c!60621) b!517293))

(assert (= (and d!79685 (not c!60621)) b!517295))

(assert (= (and b!517295 c!60622) b!517290))

(assert (= (and b!517295 (not c!60622)) b!517298))

(assert (= (and d!79685 c!60623) b!517291))

(assert (= (and d!79685 (not c!60623)) b!517292))

(assert (= (and b!517292 res!316630) b!517296))

(assert (= (and b!517296 (not res!316632)) b!517294))

(assert (= (and b!517294 (not res!316631)) b!517297))

(declare-fun m!498763 () Bool)

(assert (=> b!517297 m!498763))

(declare-fun m!498765 () Bool)

(assert (=> d!79685 m!498765))

(assert (=> d!79685 m!498687))

(declare-fun m!498767 () Bool)

(assert (=> b!517298 m!498767))

(assert (=> b!517298 m!498767))

(assert (=> b!517298 m!498667))

(declare-fun m!498769 () Bool)

(assert (=> b!517298 m!498769))

(assert (=> b!517294 m!498763))

(assert (=> b!517296 m!498763))

(assert (=> b!517199 d!79685))

(declare-fun d!79687 () Bool)

(declare-fun lt!236810 () (_ BitVec 32))

(declare-fun lt!236809 () (_ BitVec 32))

(assert (=> d!79687 (= lt!236810 (bvmul (bvxor lt!236809 (bvlshr lt!236809 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!79687 (= lt!236809 ((_ extract 31 0) (bvand (bvxor (select (arr!15919 a!3235) j!176) (bvlshr (select (arr!15919 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!79687 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!316629 (let ((h!10976 ((_ extract 31 0) (bvand (bvxor (select (arr!15919 a!3235) j!176) (bvlshr (select (arr!15919 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48694 (bvmul (bvxor h!10976 (bvlshr h!10976 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48694 (bvlshr x!48694 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!316629 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!316629 #b00000000000000000000000000000000))))))

(assert (=> d!79687 (= (toIndex!0 (select (arr!15919 a!3235) j!176) mask!3524) (bvand (bvxor lt!236810 (bvlshr lt!236810 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!517199 d!79687))

(declare-fun d!79689 () Bool)

(assert (=> d!79689 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46850 d!79689))

(declare-fun d!79701 () Bool)

(assert (=> d!79701 (= (array_inv!11715 a!3235) (bvsge (size!16283 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46850 d!79701))

(declare-fun b!517330 () Bool)

(declare-fun e!301877 () Bool)

(declare-fun call!31670 () Bool)

(assert (=> b!517330 (= e!301877 call!31670)))

(declare-fun bm!31667 () Bool)

(declare-fun c!60632 () Bool)

(assert (=> bm!31667 (= call!31670 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!60632 (Cons!10073 (select (arr!15919 a!3235) #b00000000000000000000000000000000) Nil!10074) Nil!10074)))))

(declare-fun b!517332 () Bool)

(assert (=> b!517332 (= e!301877 call!31670)))

(declare-fun b!517331 () Bool)

(declare-fun e!301880 () Bool)

(assert (=> b!517331 (= e!301880 e!301877)))

(assert (=> b!517331 (= c!60632 (validKeyInArray!0 (select (arr!15919 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79703 () Bool)

(declare-fun res!316649 () Bool)

(declare-fun e!301879 () Bool)

(assert (=> d!79703 (=> res!316649 e!301879)))

(assert (=> d!79703 (= res!316649 (bvsge #b00000000000000000000000000000000 (size!16283 a!3235)))))

(assert (=> d!79703 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10074) e!301879)))

(declare-fun b!517333 () Bool)

(assert (=> b!517333 (= e!301879 e!301880)))

(declare-fun res!316650 () Bool)

(assert (=> b!517333 (=> (not res!316650) (not e!301880))))

(declare-fun e!301878 () Bool)

(assert (=> b!517333 (= res!316650 (not e!301878))))

(declare-fun res!316648 () Bool)

(assert (=> b!517333 (=> (not res!316648) (not e!301878))))

(assert (=> b!517333 (= res!316648 (validKeyInArray!0 (select (arr!15919 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!517334 () Bool)

(declare-fun contains!2744 (List!10077 (_ BitVec 64)) Bool)

(assert (=> b!517334 (= e!301878 (contains!2744 Nil!10074 (select (arr!15919 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!79703 (not res!316649)) b!517333))

(assert (= (and b!517333 res!316648) b!517334))

(assert (= (and b!517333 res!316650) b!517331))

(assert (= (and b!517331 c!60632) b!517330))

(assert (= (and b!517331 (not c!60632)) b!517332))

(assert (= (or b!517330 b!517332) bm!31667))

(declare-fun m!498793 () Bool)

(assert (=> bm!31667 m!498793))

(declare-fun m!498795 () Bool)

(assert (=> bm!31667 m!498795))

(assert (=> b!517331 m!498793))

(assert (=> b!517331 m!498793))

(declare-fun m!498797 () Bool)

(assert (=> b!517331 m!498797))

(assert (=> b!517333 m!498793))

(assert (=> b!517333 m!498793))

(assert (=> b!517333 m!498797))

(assert (=> b!517334 m!498793))

(assert (=> b!517334 m!498793))

(declare-fun m!498799 () Bool)

(assert (=> b!517334 m!498799))

(assert (=> b!517193 d!79703))

(declare-fun bm!31668 () Bool)

(declare-fun call!31671 () Bool)

(assert (=> bm!31668 (= call!31671 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!517337 () Bool)

(declare-fun e!301885 () Bool)

(declare-fun e!301883 () Bool)

(assert (=> b!517337 (= e!301885 e!301883)))

(declare-fun c!60633 () Bool)

(assert (=> b!517337 (= c!60633 (validKeyInArray!0 (select (arr!15919 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!79707 () Bool)

(declare-fun res!316653 () Bool)

(assert (=> d!79707 (=> res!316653 e!301885)))

(assert (=> d!79707 (= res!316653 (bvsge #b00000000000000000000000000000000 (size!16283 a!3235)))))

(assert (=> d!79707 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!301885)))

(declare-fun b!517338 () Bool)

(declare-fun e!301884 () Bool)

(assert (=> b!517338 (= e!301883 e!301884)))

(declare-fun lt!236814 () (_ BitVec 64))

(assert (=> b!517338 (= lt!236814 (select (arr!15919 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!236816 () Unit!16030)

(assert (=> b!517338 (= lt!236816 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!236814 #b00000000000000000000000000000000))))

(assert (=> b!517338 (arrayContainsKey!0 a!3235 lt!236814 #b00000000000000000000000000000000)))

(declare-fun lt!236815 () Unit!16030)

(assert (=> b!517338 (= lt!236815 lt!236816)))

(declare-fun res!316654 () Bool)

(assert (=> b!517338 (= res!316654 (= (seekEntryOrOpen!0 (select (arr!15919 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4386 #b00000000000000000000000000000000)))))

(assert (=> b!517338 (=> (not res!316654) (not e!301884))))

(declare-fun b!517339 () Bool)

(assert (=> b!517339 (= e!301884 call!31671)))

(declare-fun b!517340 () Bool)

(assert (=> b!517340 (= e!301883 call!31671)))

(assert (= (and d!79707 (not res!316653)) b!517337))

(assert (= (and b!517337 c!60633) b!517338))

(assert (= (and b!517337 (not c!60633)) b!517340))

(assert (= (and b!517338 res!316654) b!517339))

(assert (= (or b!517339 b!517340) bm!31668))

(declare-fun m!498801 () Bool)

(assert (=> bm!31668 m!498801))

(assert (=> b!517337 m!498793))

(assert (=> b!517337 m!498793))

(assert (=> b!517337 m!498797))

(assert (=> b!517338 m!498793))

(declare-fun m!498803 () Bool)

(assert (=> b!517338 m!498803))

(declare-fun m!498805 () Bool)

(assert (=> b!517338 m!498805))

(assert (=> b!517338 m!498793))

(declare-fun m!498807 () Bool)

(assert (=> b!517338 m!498807))

(assert (=> b!517195 d!79707))

(declare-fun d!79709 () Bool)

(assert (=> d!79709 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517190 d!79709))

(declare-fun b!517399 () Bool)

(declare-fun e!301924 () SeekEntryResult!4386)

(declare-fun lt!236851 () SeekEntryResult!4386)

(assert (=> b!517399 (= e!301924 (Found!4386 (index!19734 lt!236851)))))

(declare-fun b!517400 () Bool)

(declare-fun e!301923 () SeekEntryResult!4386)

(assert (=> b!517400 (= e!301923 e!301924)))

(declare-fun lt!236852 () (_ BitVec 64))

(assert (=> b!517400 (= lt!236852 (select (arr!15919 a!3235) (index!19734 lt!236851)))))

(declare-fun c!60655 () Bool)

(assert (=> b!517400 (= c!60655 (= lt!236852 k0!2280))))

(declare-fun b!517401 () Bool)

(declare-fun c!60657 () Bool)

(assert (=> b!517401 (= c!60657 (= lt!236852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301925 () SeekEntryResult!4386)

(assert (=> b!517401 (= e!301924 e!301925)))

(declare-fun d!79711 () Bool)

(declare-fun lt!236850 () SeekEntryResult!4386)

(assert (=> d!79711 (and (or ((_ is Undefined!4386) lt!236850) (not ((_ is Found!4386) lt!236850)) (and (bvsge (index!19733 lt!236850) #b00000000000000000000000000000000) (bvslt (index!19733 lt!236850) (size!16283 a!3235)))) (or ((_ is Undefined!4386) lt!236850) ((_ is Found!4386) lt!236850) (not ((_ is MissingZero!4386) lt!236850)) (and (bvsge (index!19732 lt!236850) #b00000000000000000000000000000000) (bvslt (index!19732 lt!236850) (size!16283 a!3235)))) (or ((_ is Undefined!4386) lt!236850) ((_ is Found!4386) lt!236850) ((_ is MissingZero!4386) lt!236850) (not ((_ is MissingVacant!4386) lt!236850)) (and (bvsge (index!19735 lt!236850) #b00000000000000000000000000000000) (bvslt (index!19735 lt!236850) (size!16283 a!3235)))) (or ((_ is Undefined!4386) lt!236850) (ite ((_ is Found!4386) lt!236850) (= (select (arr!15919 a!3235) (index!19733 lt!236850)) k0!2280) (ite ((_ is MissingZero!4386) lt!236850) (= (select (arr!15919 a!3235) (index!19732 lt!236850)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4386) lt!236850) (= (select (arr!15919 a!3235) (index!19735 lt!236850)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79711 (= lt!236850 e!301923)))

(declare-fun c!60656 () Bool)

(assert (=> d!79711 (= c!60656 (and ((_ is Intermediate!4386) lt!236851) (undefined!5198 lt!236851)))))

(assert (=> d!79711 (= lt!236851 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!79711 (validMask!0 mask!3524)))

(assert (=> d!79711 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!236850)))

(declare-fun b!517402 () Bool)

(assert (=> b!517402 (= e!301923 Undefined!4386)))

(declare-fun b!517403 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33105 (_ BitVec 32)) SeekEntryResult!4386)

(assert (=> b!517403 (= e!301925 (seekKeyOrZeroReturnVacant!0 (x!48691 lt!236851) (index!19734 lt!236851) (index!19734 lt!236851) k0!2280 a!3235 mask!3524))))

(declare-fun b!517404 () Bool)

(assert (=> b!517404 (= e!301925 (MissingZero!4386 (index!19734 lt!236851)))))

(assert (= (and d!79711 c!60656) b!517402))

(assert (= (and d!79711 (not c!60656)) b!517400))

(assert (= (and b!517400 c!60655) b!517399))

(assert (= (and b!517400 (not c!60655)) b!517401))

(assert (= (and b!517401 c!60657) b!517404))

(assert (= (and b!517401 (not c!60657)) b!517403))

(declare-fun m!498845 () Bool)

(assert (=> b!517400 m!498845))

(declare-fun m!498847 () Bool)

(assert (=> d!79711 m!498847))

(declare-fun m!498849 () Bool)

(assert (=> d!79711 m!498849))

(declare-fun m!498851 () Bool)

(assert (=> d!79711 m!498851))

(assert (=> d!79711 m!498847))

(declare-fun m!498853 () Bool)

(assert (=> d!79711 m!498853))

(assert (=> d!79711 m!498687))

(declare-fun m!498855 () Bool)

(assert (=> d!79711 m!498855))

(declare-fun m!498857 () Bool)

(assert (=> b!517403 m!498857))

(assert (=> b!517191 d!79711))

(declare-fun d!79727 () Bool)

(assert (=> d!79727 (= (validKeyInArray!0 (select (arr!15919 a!3235) j!176)) (and (not (= (select (arr!15919 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15919 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!517196 d!79727))

(declare-fun b!517415 () Bool)

(declare-fun e!301935 () SeekEntryResult!4386)

(declare-fun lt!236858 () SeekEntryResult!4386)

(assert (=> b!517415 (= e!301935 (Found!4386 (index!19734 lt!236858)))))

(declare-fun b!517416 () Bool)

(declare-fun e!301934 () SeekEntryResult!4386)

(assert (=> b!517416 (= e!301934 e!301935)))

(declare-fun lt!236859 () (_ BitVec 64))

(assert (=> b!517416 (= lt!236859 (select (arr!15919 a!3235) (index!19734 lt!236858)))))

(declare-fun c!60662 () Bool)

(assert (=> b!517416 (= c!60662 (= lt!236859 (select (arr!15919 a!3235) j!176)))))

(declare-fun b!517417 () Bool)

(declare-fun c!60664 () Bool)

(assert (=> b!517417 (= c!60664 (= lt!236859 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!301936 () SeekEntryResult!4386)

(assert (=> b!517417 (= e!301935 e!301936)))

(declare-fun d!79729 () Bool)

(declare-fun lt!236857 () SeekEntryResult!4386)

(assert (=> d!79729 (and (or ((_ is Undefined!4386) lt!236857) (not ((_ is Found!4386) lt!236857)) (and (bvsge (index!19733 lt!236857) #b00000000000000000000000000000000) (bvslt (index!19733 lt!236857) (size!16283 a!3235)))) (or ((_ is Undefined!4386) lt!236857) ((_ is Found!4386) lt!236857) (not ((_ is MissingZero!4386) lt!236857)) (and (bvsge (index!19732 lt!236857) #b00000000000000000000000000000000) (bvslt (index!19732 lt!236857) (size!16283 a!3235)))) (or ((_ is Undefined!4386) lt!236857) ((_ is Found!4386) lt!236857) ((_ is MissingZero!4386) lt!236857) (not ((_ is MissingVacant!4386) lt!236857)) (and (bvsge (index!19735 lt!236857) #b00000000000000000000000000000000) (bvslt (index!19735 lt!236857) (size!16283 a!3235)))) (or ((_ is Undefined!4386) lt!236857) (ite ((_ is Found!4386) lt!236857) (= (select (arr!15919 a!3235) (index!19733 lt!236857)) (select (arr!15919 a!3235) j!176)) (ite ((_ is MissingZero!4386) lt!236857) (= (select (arr!15919 a!3235) (index!19732 lt!236857)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4386) lt!236857) (= (select (arr!15919 a!3235) (index!19735 lt!236857)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!79729 (= lt!236857 e!301934)))

(declare-fun c!60663 () Bool)

(assert (=> d!79729 (= c!60663 (and ((_ is Intermediate!4386) lt!236858) (undefined!5198 lt!236858)))))

(assert (=> d!79729 (= lt!236858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15919 a!3235) j!176) mask!3524) (select (arr!15919 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!79729 (validMask!0 mask!3524)))

(assert (=> d!79729 (= (seekEntryOrOpen!0 (select (arr!15919 a!3235) j!176) a!3235 mask!3524) lt!236857)))

(declare-fun b!517418 () Bool)

(assert (=> b!517418 (= e!301934 Undefined!4386)))

(declare-fun b!517419 () Bool)

(assert (=> b!517419 (= e!301936 (seekKeyOrZeroReturnVacant!0 (x!48691 lt!236858) (index!19734 lt!236858) (index!19734 lt!236858) (select (arr!15919 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!517422 () Bool)

(assert (=> b!517422 (= e!301936 (MissingZero!4386 (index!19734 lt!236858)))))

(assert (= (and d!79729 c!60663) b!517418))

(assert (= (and d!79729 (not c!60663)) b!517416))

(assert (= (and b!517416 c!60662) b!517415))

(assert (= (and b!517416 (not c!60662)) b!517417))

(assert (= (and b!517417 c!60664) b!517422))

(assert (= (and b!517417 (not c!60664)) b!517419))

(declare-fun m!498859 () Bool)

(assert (=> b!517416 m!498859))

(assert (=> d!79729 m!498669))

(assert (=> d!79729 m!498667))

(declare-fun m!498861 () Bool)

(assert (=> d!79729 m!498861))

(declare-fun m!498863 () Bool)

(assert (=> d!79729 m!498863))

(assert (=> d!79729 m!498667))

(assert (=> d!79729 m!498669))

(declare-fun m!498865 () Bool)

(assert (=> d!79729 m!498865))

(assert (=> d!79729 m!498687))

(declare-fun m!498867 () Bool)

(assert (=> d!79729 m!498867))

(assert (=> b!517419 m!498667))

(declare-fun m!498869 () Bool)

(assert (=> b!517419 m!498869))

(assert (=> b!517198 d!79729))

(declare-fun d!79731 () Bool)

(declare-fun res!316687 () Bool)

(declare-fun e!301952 () Bool)

(assert (=> d!79731 (=> res!316687 e!301952)))

(assert (=> d!79731 (= res!316687 (= (select (arr!15919 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!79731 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!301952)))

(declare-fun b!517445 () Bool)

(declare-fun e!301953 () Bool)

(assert (=> b!517445 (= e!301952 e!301953)))

(declare-fun res!316688 () Bool)

(assert (=> b!517445 (=> (not res!316688) (not e!301953))))

(assert (=> b!517445 (= res!316688 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16283 a!3235)))))

(declare-fun b!517446 () Bool)

(assert (=> b!517446 (= e!301953 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!79731 (not res!316687)) b!517445))

(assert (= (and b!517445 res!316688) b!517446))

(assert (=> d!79731 m!498793))

(declare-fun m!498885 () Bool)

(assert (=> b!517446 m!498885))

(assert (=> b!517192 d!79731))

(check-sat (not bm!31667) (not d!79729) (not b!517337) (not b!517259) (not bm!31661) (not b!517333) (not b!517271) (not b!517298) (not b!517446) (not b!517403) (not b!517338) (not b!517270) (not b!517331) (not b!517419) (not bm!31668) (not b!517334) (not d!79669) (not d!79675) (not d!79711) (not d!79685))
(check-sat)
