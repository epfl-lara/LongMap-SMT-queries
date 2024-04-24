; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47606 () Bool)

(assert start!47606)

(declare-fun b!523725 () Bool)

(declare-fun res!320940 () Bool)

(declare-fun e!305443 () Bool)

(assert (=> b!523725 (=> res!320940 e!305443)))

(declare-datatypes ((SeekEntryResult!4429 0))(
  ( (MissingZero!4429 (index!19925 (_ BitVec 32))) (Found!4429 (index!19926 (_ BitVec 32))) (Intermediate!4429 (undefined!5241 Bool) (index!19927 (_ BitVec 32)) (x!49054 (_ BitVec 32))) (Undefined!4429) (MissingVacant!4429 (index!19928 (_ BitVec 32))) )
))
(declare-fun lt!240352 () SeekEntryResult!4429)

(get-info :version)

(assert (=> b!523725 (= res!320940 (or (undefined!5241 lt!240352) (not ((_ is Intermediate!4429) lt!240352))))))

(declare-fun b!523726 () Bool)

(declare-datatypes ((Unit!16327 0))(
  ( (Unit!16328) )
))
(declare-fun e!305447 () Unit!16327)

(declare-fun Unit!16329 () Unit!16327)

(assert (=> b!523726 (= e!305447 Unit!16329)))

(declare-fun lt!240348 () Unit!16327)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!240353 () (_ BitVec 32))

(declare-datatypes ((array!33307 0))(
  ( (array!33308 (arr!16006 (Array (_ BitVec 32) (_ BitVec 64))) (size!16370 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33307)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16327)

(assert (=> b!523726 (= lt!240348 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240353 #b00000000000000000000000000000000 (index!19927 lt!240352) (x!49054 lt!240352) mask!3524))))

(declare-fun lt!240351 () (_ BitVec 64))

(declare-fun res!320939 () Bool)

(declare-fun lt!240349 () array!33307)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33307 (_ BitVec 32)) SeekEntryResult!4429)

(assert (=> b!523726 (= res!320939 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240353 lt!240351 lt!240349 mask!3524) (Intermediate!4429 false (index!19927 lt!240352) (x!49054 lt!240352))))))

(declare-fun e!305448 () Bool)

(assert (=> b!523726 (=> (not res!320939) (not e!305448))))

(assert (=> b!523726 e!305448))

(declare-fun b!523727 () Bool)

(declare-fun res!320938 () Bool)

(declare-fun e!305445 () Bool)

(assert (=> b!523727 (=> (not res!320938) (not e!305445))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33307 (_ BitVec 32)) Bool)

(assert (=> b!523727 (= res!320938 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!523728 () Bool)

(declare-fun res!320933 () Bool)

(declare-fun e!305446 () Bool)

(assert (=> b!523728 (=> (not res!320933) (not e!305446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!523728 (= res!320933 (validKeyInArray!0 k0!2280))))

(declare-fun b!523729 () Bool)

(assert (=> b!523729 (= e!305448 false)))

(declare-fun b!523731 () Bool)

(assert (=> b!523731 (= e!305443 (or (bvsgt #b00000000000000000000000000000000 (x!49054 lt!240352)) (bvsgt (x!49054 lt!240352) #b01111111111111111111111111111110) (bvslt lt!240353 #b00000000000000000000000000000000) (bvsge lt!240353 (size!16370 a!3235)) (and (bvsge (index!19927 lt!240352) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240352) (size!16370 a!3235)))))))

(assert (=> b!523731 (and (or (= (select (arr!16006 a!3235) (index!19927 lt!240352)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16006 a!3235) (index!19927 lt!240352)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16006 a!3235) (index!19927 lt!240352)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16006 a!3235) (index!19927 lt!240352)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!240355 () Unit!16327)

(assert (=> b!523731 (= lt!240355 e!305447)))

(declare-fun c!61700 () Bool)

(assert (=> b!523731 (= c!61700 (= (select (arr!16006 a!3235) (index!19927 lt!240352)) (select (arr!16006 a!3235) j!176)))))

(assert (=> b!523731 (and (bvslt (x!49054 lt!240352) #b01111111111111111111111111111110) (or (= (select (arr!16006 a!3235) (index!19927 lt!240352)) (select (arr!16006 a!3235) j!176)) (= (select (arr!16006 a!3235) (index!19927 lt!240352)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16006 a!3235) (index!19927 lt!240352)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523732 () Bool)

(assert (=> b!523732 (= e!305445 (not e!305443))))

(declare-fun res!320935 () Bool)

(assert (=> b!523732 (=> res!320935 e!305443)))

(declare-fun lt!240347 () (_ BitVec 32))

(assert (=> b!523732 (= res!320935 (= lt!240352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240347 lt!240351 lt!240349 mask!3524)))))

(assert (=> b!523732 (= lt!240352 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240353 (select (arr!16006 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523732 (= lt!240347 (toIndex!0 lt!240351 mask!3524))))

(assert (=> b!523732 (= lt!240351 (select (store (arr!16006 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!523732 (= lt!240353 (toIndex!0 (select (arr!16006 a!3235) j!176) mask!3524))))

(assert (=> b!523732 (= lt!240349 (array!33308 (store (arr!16006 a!3235) i!1204 k0!2280) (size!16370 a!3235)))))

(declare-fun e!305442 () Bool)

(assert (=> b!523732 e!305442))

(declare-fun res!320936 () Bool)

(assert (=> b!523732 (=> (not res!320936) (not e!305442))))

(assert (=> b!523732 (= res!320936 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240354 () Unit!16327)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16327)

(assert (=> b!523732 (= lt!240354 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!523733 () Bool)

(declare-fun res!320937 () Bool)

(assert (=> b!523733 (=> (not res!320937) (not e!305446))))

(assert (=> b!523733 (= res!320937 (validKeyInArray!0 (select (arr!16006 a!3235) j!176)))))

(declare-fun b!523734 () Bool)

(declare-fun res!320944 () Bool)

(assert (=> b!523734 (=> (not res!320944) (not e!305446))))

(assert (=> b!523734 (= res!320944 (and (= (size!16370 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16370 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16370 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!523735 () Bool)

(declare-fun res!320934 () Bool)

(assert (=> b!523735 (=> (not res!320934) (not e!305445))))

(declare-datatypes ((List!10071 0))(
  ( (Nil!10068) (Cons!10067 (h!10995 (_ BitVec 64)) (t!16291 List!10071)) )
))
(declare-fun arrayNoDuplicates!0 (array!33307 (_ BitVec 32) List!10071) Bool)

(assert (=> b!523735 (= res!320934 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10068))))

(declare-fun b!523736 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33307 (_ BitVec 32)) SeekEntryResult!4429)

(assert (=> b!523736 (= e!305442 (= (seekEntryOrOpen!0 (select (arr!16006 a!3235) j!176) a!3235 mask!3524) (Found!4429 j!176)))))

(declare-fun b!523737 () Bool)

(declare-fun res!320943 () Bool)

(assert (=> b!523737 (=> (not res!320943) (not e!305446))))

(declare-fun arrayContainsKey!0 (array!33307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!523737 (= res!320943 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!523738 () Bool)

(assert (=> b!523738 (= e!305446 e!305445)))

(declare-fun res!320941 () Bool)

(assert (=> b!523738 (=> (not res!320941) (not e!305445))))

(declare-fun lt!240350 () SeekEntryResult!4429)

(assert (=> b!523738 (= res!320941 (or (= lt!240350 (MissingZero!4429 i!1204)) (= lt!240350 (MissingVacant!4429 i!1204))))))

(assert (=> b!523738 (= lt!240350 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!523730 () Bool)

(declare-fun Unit!16330 () Unit!16327)

(assert (=> b!523730 (= e!305447 Unit!16330)))

(declare-fun res!320942 () Bool)

(assert (=> start!47606 (=> (not res!320942) (not e!305446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47606 (= res!320942 (validMask!0 mask!3524))))

(assert (=> start!47606 e!305446))

(assert (=> start!47606 true))

(declare-fun array_inv!11865 (array!33307) Bool)

(assert (=> start!47606 (array_inv!11865 a!3235)))

(assert (= (and start!47606 res!320942) b!523734))

(assert (= (and b!523734 res!320944) b!523733))

(assert (= (and b!523733 res!320937) b!523728))

(assert (= (and b!523728 res!320933) b!523737))

(assert (= (and b!523737 res!320943) b!523738))

(assert (= (and b!523738 res!320941) b!523727))

(assert (= (and b!523727 res!320938) b!523735))

(assert (= (and b!523735 res!320934) b!523732))

(assert (= (and b!523732 res!320936) b!523736))

(assert (= (and b!523732 (not res!320935)) b!523725))

(assert (= (and b!523725 (not res!320940)) b!523731))

(assert (= (and b!523731 c!61700) b!523726))

(assert (= (and b!523731 (not c!61700)) b!523730))

(assert (= (and b!523726 res!320939) b!523729))

(declare-fun m!504697 () Bool)

(assert (=> b!523728 m!504697))

(declare-fun m!504699 () Bool)

(assert (=> b!523738 m!504699))

(declare-fun m!504701 () Bool)

(assert (=> b!523727 m!504701))

(declare-fun m!504703 () Bool)

(assert (=> b!523733 m!504703))

(assert (=> b!523733 m!504703))

(declare-fun m!504705 () Bool)

(assert (=> b!523733 m!504705))

(assert (=> b!523736 m!504703))

(assert (=> b!523736 m!504703))

(declare-fun m!504707 () Bool)

(assert (=> b!523736 m!504707))

(declare-fun m!504709 () Bool)

(assert (=> b!523726 m!504709))

(declare-fun m!504711 () Bool)

(assert (=> b!523726 m!504711))

(declare-fun m!504713 () Bool)

(assert (=> b!523732 m!504713))

(declare-fun m!504715 () Bool)

(assert (=> b!523732 m!504715))

(declare-fun m!504717 () Bool)

(assert (=> b!523732 m!504717))

(declare-fun m!504719 () Bool)

(assert (=> b!523732 m!504719))

(assert (=> b!523732 m!504703))

(declare-fun m!504721 () Bool)

(assert (=> b!523732 m!504721))

(assert (=> b!523732 m!504703))

(declare-fun m!504723 () Bool)

(assert (=> b!523732 m!504723))

(declare-fun m!504725 () Bool)

(assert (=> b!523732 m!504725))

(assert (=> b!523732 m!504703))

(declare-fun m!504727 () Bool)

(assert (=> b!523732 m!504727))

(declare-fun m!504729 () Bool)

(assert (=> start!47606 m!504729))

(declare-fun m!504731 () Bool)

(assert (=> start!47606 m!504731))

(declare-fun m!504733 () Bool)

(assert (=> b!523731 m!504733))

(assert (=> b!523731 m!504703))

(declare-fun m!504735 () Bool)

(assert (=> b!523735 m!504735))

(declare-fun m!504737 () Bool)

(assert (=> b!523737 m!504737))

(check-sat (not b!523735) (not b!523727) (not b!523733) (not b!523732) (not b!523738) (not b!523726) (not b!523736) (not b!523737) (not b!523728) (not start!47606))
(check-sat)
(get-model)

(declare-fun b!523841 () Bool)

(declare-fun e!305503 () SeekEntryResult!4429)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!523841 (= e!305503 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) (select (arr!16006 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!523842 () Bool)

(declare-fun lt!240415 () SeekEntryResult!4429)

(assert (=> b!523842 (and (bvsge (index!19927 lt!240415) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240415) (size!16370 a!3235)))))

(declare-fun res!321023 () Bool)

(assert (=> b!523842 (= res!321023 (= (select (arr!16006 a!3235) (index!19927 lt!240415)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305501 () Bool)

(assert (=> b!523842 (=> res!321023 e!305501)))

(declare-fun d!80659 () Bool)

(declare-fun e!305505 () Bool)

(assert (=> d!80659 e!305505))

(declare-fun c!61714 () Bool)

(assert (=> d!80659 (= c!61714 (and ((_ is Intermediate!4429) lt!240415) (undefined!5241 lt!240415)))))

(declare-fun e!305504 () SeekEntryResult!4429)

(assert (=> d!80659 (= lt!240415 e!305504)))

(declare-fun c!61715 () Bool)

(assert (=> d!80659 (= c!61715 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240414 () (_ BitVec 64))

(assert (=> d!80659 (= lt!240414 (select (arr!16006 a!3235) lt!240353))))

(assert (=> d!80659 (validMask!0 mask!3524)))

(assert (=> d!80659 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240353 (select (arr!16006 a!3235) j!176) a!3235 mask!3524) lt!240415)))

(declare-fun b!523843 () Bool)

(assert (=> b!523843 (= e!305505 (bvsge (x!49054 lt!240415) #b01111111111111111111111111111110))))

(declare-fun b!523844 () Bool)

(assert (=> b!523844 (and (bvsge (index!19927 lt!240415) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240415) (size!16370 a!3235)))))

(declare-fun res!321024 () Bool)

(assert (=> b!523844 (= res!321024 (= (select (arr!16006 a!3235) (index!19927 lt!240415)) (select (arr!16006 a!3235) j!176)))))

(assert (=> b!523844 (=> res!321024 e!305501)))

(declare-fun e!305502 () Bool)

(assert (=> b!523844 (= e!305502 e!305501)))

(declare-fun b!523845 () Bool)

(assert (=> b!523845 (= e!305504 e!305503)))

(declare-fun c!61713 () Bool)

(assert (=> b!523845 (= c!61713 (or (= lt!240414 (select (arr!16006 a!3235) j!176)) (= (bvadd lt!240414 lt!240414) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523846 () Bool)

(assert (=> b!523846 (and (bvsge (index!19927 lt!240415) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240415) (size!16370 a!3235)))))

(assert (=> b!523846 (= e!305501 (= (select (arr!16006 a!3235) (index!19927 lt!240415)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523847 () Bool)

(assert (=> b!523847 (= e!305503 (Intermediate!4429 false lt!240353 #b00000000000000000000000000000000))))

(declare-fun b!523848 () Bool)

(assert (=> b!523848 (= e!305504 (Intermediate!4429 true lt!240353 #b00000000000000000000000000000000))))

(declare-fun b!523849 () Bool)

(assert (=> b!523849 (= e!305505 e!305502)))

(declare-fun res!321025 () Bool)

(assert (=> b!523849 (= res!321025 (and ((_ is Intermediate!4429) lt!240415) (not (undefined!5241 lt!240415)) (bvslt (x!49054 lt!240415) #b01111111111111111111111111111110) (bvsge (x!49054 lt!240415) #b00000000000000000000000000000000) (bvsge (x!49054 lt!240415) #b00000000000000000000000000000000)))))

(assert (=> b!523849 (=> (not res!321025) (not e!305502))))

(assert (= (and d!80659 c!61715) b!523848))

(assert (= (and d!80659 (not c!61715)) b!523845))

(assert (= (and b!523845 c!61713) b!523847))

(assert (= (and b!523845 (not c!61713)) b!523841))

(assert (= (and d!80659 c!61714) b!523843))

(assert (= (and d!80659 (not c!61714)) b!523849))

(assert (= (and b!523849 res!321025) b!523844))

(assert (= (and b!523844 (not res!321024)) b!523842))

(assert (= (and b!523842 (not res!321023)) b!523846))

(declare-fun m!504823 () Bool)

(assert (=> d!80659 m!504823))

(assert (=> d!80659 m!504729))

(declare-fun m!504825 () Bool)

(assert (=> b!523842 m!504825))

(declare-fun m!504827 () Bool)

(assert (=> b!523841 m!504827))

(assert (=> b!523841 m!504827))

(assert (=> b!523841 m!504703))

(declare-fun m!504829 () Bool)

(assert (=> b!523841 m!504829))

(assert (=> b!523844 m!504825))

(assert (=> b!523846 m!504825))

(assert (=> b!523732 d!80659))

(declare-fun d!80661 () Bool)

(declare-fun lt!240421 () (_ BitVec 32))

(declare-fun lt!240420 () (_ BitVec 32))

(assert (=> d!80661 (= lt!240421 (bvmul (bvxor lt!240420 (bvlshr lt!240420 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80661 (= lt!240420 ((_ extract 31 0) (bvand (bvxor (select (arr!16006 a!3235) j!176) (bvlshr (select (arr!16006 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80661 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!321026 (let ((h!10998 ((_ extract 31 0) (bvand (bvxor (select (arr!16006 a!3235) j!176) (bvlshr (select (arr!16006 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49058 (bvmul (bvxor h!10998 (bvlshr h!10998 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49058 (bvlshr x!49058 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!321026 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!321026 #b00000000000000000000000000000000))))))

(assert (=> d!80661 (= (toIndex!0 (select (arr!16006 a!3235) j!176) mask!3524) (bvand (bvxor lt!240421 (bvlshr lt!240421 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523732 d!80661))

(declare-fun b!523858 () Bool)

(declare-fun e!305514 () Bool)

(declare-fun call!31839 () Bool)

(assert (=> b!523858 (= e!305514 call!31839)))

(declare-fun b!523859 () Bool)

(declare-fun e!305513 () Bool)

(assert (=> b!523859 (= e!305514 e!305513)))

(declare-fun lt!240429 () (_ BitVec 64))

(assert (=> b!523859 (= lt!240429 (select (arr!16006 a!3235) j!176))))

(declare-fun lt!240430 () Unit!16327)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33307 (_ BitVec 64) (_ BitVec 32)) Unit!16327)

(assert (=> b!523859 (= lt!240430 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240429 j!176))))

(assert (=> b!523859 (arrayContainsKey!0 a!3235 lt!240429 #b00000000000000000000000000000000)))

(declare-fun lt!240428 () Unit!16327)

(assert (=> b!523859 (= lt!240428 lt!240430)))

(declare-fun res!321032 () Bool)

(assert (=> b!523859 (= res!321032 (= (seekEntryOrOpen!0 (select (arr!16006 a!3235) j!176) a!3235 mask!3524) (Found!4429 j!176)))))

(assert (=> b!523859 (=> (not res!321032) (not e!305513))))

(declare-fun bm!31836 () Bool)

(assert (=> bm!31836 (= call!31839 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80663 () Bool)

(declare-fun res!321031 () Bool)

(declare-fun e!305512 () Bool)

(assert (=> d!80663 (=> res!321031 e!305512)))

(assert (=> d!80663 (= res!321031 (bvsge j!176 (size!16370 a!3235)))))

(assert (=> d!80663 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!305512)))

(declare-fun b!523860 () Bool)

(assert (=> b!523860 (= e!305512 e!305514)))

(declare-fun c!61718 () Bool)

(assert (=> b!523860 (= c!61718 (validKeyInArray!0 (select (arr!16006 a!3235) j!176)))))

(declare-fun b!523861 () Bool)

(assert (=> b!523861 (= e!305513 call!31839)))

(assert (= (and d!80663 (not res!321031)) b!523860))

(assert (= (and b!523860 c!61718) b!523859))

(assert (= (and b!523860 (not c!61718)) b!523858))

(assert (= (and b!523859 res!321032) b!523861))

(assert (= (or b!523861 b!523858) bm!31836))

(assert (=> b!523859 m!504703))

(declare-fun m!504831 () Bool)

(assert (=> b!523859 m!504831))

(declare-fun m!504833 () Bool)

(assert (=> b!523859 m!504833))

(assert (=> b!523859 m!504703))

(assert (=> b!523859 m!504707))

(declare-fun m!504835 () Bool)

(assert (=> bm!31836 m!504835))

(assert (=> b!523860 m!504703))

(assert (=> b!523860 m!504703))

(assert (=> b!523860 m!504705))

(assert (=> b!523732 d!80663))

(declare-fun b!523862 () Bool)

(declare-fun e!305517 () SeekEntryResult!4429)

(assert (=> b!523862 (= e!305517 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240347 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!240351 lt!240349 mask!3524))))

(declare-fun b!523863 () Bool)

(declare-fun lt!240432 () SeekEntryResult!4429)

(assert (=> b!523863 (and (bvsge (index!19927 lt!240432) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240432) (size!16370 lt!240349)))))

(declare-fun res!321033 () Bool)

(assert (=> b!523863 (= res!321033 (= (select (arr!16006 lt!240349) (index!19927 lt!240432)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305515 () Bool)

(assert (=> b!523863 (=> res!321033 e!305515)))

(declare-fun d!80667 () Bool)

(declare-fun e!305519 () Bool)

(assert (=> d!80667 e!305519))

(declare-fun c!61720 () Bool)

(assert (=> d!80667 (= c!61720 (and ((_ is Intermediate!4429) lt!240432) (undefined!5241 lt!240432)))))

(declare-fun e!305518 () SeekEntryResult!4429)

(assert (=> d!80667 (= lt!240432 e!305518)))

(declare-fun c!61721 () Bool)

(assert (=> d!80667 (= c!61721 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240431 () (_ BitVec 64))

(assert (=> d!80667 (= lt!240431 (select (arr!16006 lt!240349) lt!240347))))

(assert (=> d!80667 (validMask!0 mask!3524)))

(assert (=> d!80667 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240347 lt!240351 lt!240349 mask!3524) lt!240432)))

(declare-fun b!523864 () Bool)

(assert (=> b!523864 (= e!305519 (bvsge (x!49054 lt!240432) #b01111111111111111111111111111110))))

(declare-fun b!523865 () Bool)

(assert (=> b!523865 (and (bvsge (index!19927 lt!240432) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240432) (size!16370 lt!240349)))))

(declare-fun res!321034 () Bool)

(assert (=> b!523865 (= res!321034 (= (select (arr!16006 lt!240349) (index!19927 lt!240432)) lt!240351))))

(assert (=> b!523865 (=> res!321034 e!305515)))

(declare-fun e!305516 () Bool)

(assert (=> b!523865 (= e!305516 e!305515)))

(declare-fun b!523866 () Bool)

(assert (=> b!523866 (= e!305518 e!305517)))

(declare-fun c!61719 () Bool)

(assert (=> b!523866 (= c!61719 (or (= lt!240431 lt!240351) (= (bvadd lt!240431 lt!240431) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523867 () Bool)

(assert (=> b!523867 (and (bvsge (index!19927 lt!240432) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240432) (size!16370 lt!240349)))))

(assert (=> b!523867 (= e!305515 (= (select (arr!16006 lt!240349) (index!19927 lt!240432)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523868 () Bool)

(assert (=> b!523868 (= e!305517 (Intermediate!4429 false lt!240347 #b00000000000000000000000000000000))))

(declare-fun b!523869 () Bool)

(assert (=> b!523869 (= e!305518 (Intermediate!4429 true lt!240347 #b00000000000000000000000000000000))))

(declare-fun b!523870 () Bool)

(assert (=> b!523870 (= e!305519 e!305516)))

(declare-fun res!321035 () Bool)

(assert (=> b!523870 (= res!321035 (and ((_ is Intermediate!4429) lt!240432) (not (undefined!5241 lt!240432)) (bvslt (x!49054 lt!240432) #b01111111111111111111111111111110) (bvsge (x!49054 lt!240432) #b00000000000000000000000000000000) (bvsge (x!49054 lt!240432) #b00000000000000000000000000000000)))))

(assert (=> b!523870 (=> (not res!321035) (not e!305516))))

(assert (= (and d!80667 c!61721) b!523869))

(assert (= (and d!80667 (not c!61721)) b!523866))

(assert (= (and b!523866 c!61719) b!523868))

(assert (= (and b!523866 (not c!61719)) b!523862))

(assert (= (and d!80667 c!61720) b!523864))

(assert (= (and d!80667 (not c!61720)) b!523870))

(assert (= (and b!523870 res!321035) b!523865))

(assert (= (and b!523865 (not res!321034)) b!523863))

(assert (= (and b!523863 (not res!321033)) b!523867))

(declare-fun m!504837 () Bool)

(assert (=> d!80667 m!504837))

(assert (=> d!80667 m!504729))

(declare-fun m!504839 () Bool)

(assert (=> b!523863 m!504839))

(declare-fun m!504841 () Bool)

(assert (=> b!523862 m!504841))

(assert (=> b!523862 m!504841))

(declare-fun m!504843 () Bool)

(assert (=> b!523862 m!504843))

(assert (=> b!523865 m!504839))

(assert (=> b!523867 m!504839))

(assert (=> b!523732 d!80667))

(declare-fun d!80669 () Bool)

(assert (=> d!80669 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!240435 () Unit!16327)

(declare-fun choose!38 (array!33307 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16327)

(assert (=> d!80669 (= lt!240435 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!80669 (validMask!0 mask!3524)))

(assert (=> d!80669 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!240435)))

(declare-fun bs!16472 () Bool)

(assert (= bs!16472 d!80669))

(assert (=> bs!16472 m!504723))

(declare-fun m!504845 () Bool)

(assert (=> bs!16472 m!504845))

(assert (=> bs!16472 m!504729))

(assert (=> b!523732 d!80669))

(declare-fun d!80671 () Bool)

(declare-fun lt!240437 () (_ BitVec 32))

(declare-fun lt!240436 () (_ BitVec 32))

(assert (=> d!80671 (= lt!240437 (bvmul (bvxor lt!240436 (bvlshr lt!240436 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!80671 (= lt!240436 ((_ extract 31 0) (bvand (bvxor lt!240351 (bvlshr lt!240351 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!80671 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!321026 (let ((h!10998 ((_ extract 31 0) (bvand (bvxor lt!240351 (bvlshr lt!240351 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!49058 (bvmul (bvxor h!10998 (bvlshr h!10998 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!49058 (bvlshr x!49058 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!321026 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!321026 #b00000000000000000000000000000000))))))

(assert (=> d!80671 (= (toIndex!0 lt!240351 mask!3524) (bvand (bvxor lt!240437 (bvlshr lt!240437 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!523732 d!80671))

(declare-fun b!523871 () Bool)

(declare-fun e!305522 () Bool)

(declare-fun call!31840 () Bool)

(assert (=> b!523871 (= e!305522 call!31840)))

(declare-fun b!523872 () Bool)

(declare-fun e!305521 () Bool)

(assert (=> b!523872 (= e!305522 e!305521)))

(declare-fun lt!240439 () (_ BitVec 64))

(assert (=> b!523872 (= lt!240439 (select (arr!16006 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!240440 () Unit!16327)

(assert (=> b!523872 (= lt!240440 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!240439 #b00000000000000000000000000000000))))

(assert (=> b!523872 (arrayContainsKey!0 a!3235 lt!240439 #b00000000000000000000000000000000)))

(declare-fun lt!240438 () Unit!16327)

(assert (=> b!523872 (= lt!240438 lt!240440)))

(declare-fun res!321037 () Bool)

(assert (=> b!523872 (= res!321037 (= (seekEntryOrOpen!0 (select (arr!16006 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4429 #b00000000000000000000000000000000)))))

(assert (=> b!523872 (=> (not res!321037) (not e!305521))))

(declare-fun bm!31837 () Bool)

(assert (=> bm!31837 (= call!31840 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!80675 () Bool)

(declare-fun res!321036 () Bool)

(declare-fun e!305520 () Bool)

(assert (=> d!80675 (=> res!321036 e!305520)))

(assert (=> d!80675 (= res!321036 (bvsge #b00000000000000000000000000000000 (size!16370 a!3235)))))

(assert (=> d!80675 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!305520)))

(declare-fun b!523873 () Bool)

(assert (=> b!523873 (= e!305520 e!305522)))

(declare-fun c!61722 () Bool)

(assert (=> b!523873 (= c!61722 (validKeyInArray!0 (select (arr!16006 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!523874 () Bool)

(assert (=> b!523874 (= e!305521 call!31840)))

(assert (= (and d!80675 (not res!321036)) b!523873))

(assert (= (and b!523873 c!61722) b!523872))

(assert (= (and b!523873 (not c!61722)) b!523871))

(assert (= (and b!523872 res!321037) b!523874))

(assert (= (or b!523874 b!523871) bm!31837))

(declare-fun m!504847 () Bool)

(assert (=> b!523872 m!504847))

(declare-fun m!504849 () Bool)

(assert (=> b!523872 m!504849))

(declare-fun m!504851 () Bool)

(assert (=> b!523872 m!504851))

(assert (=> b!523872 m!504847))

(declare-fun m!504853 () Bool)

(assert (=> b!523872 m!504853))

(declare-fun m!504855 () Bool)

(assert (=> bm!31837 m!504855))

(assert (=> b!523873 m!504847))

(assert (=> b!523873 m!504847))

(declare-fun m!504857 () Bool)

(assert (=> b!523873 m!504857))

(assert (=> b!523727 d!80675))

(declare-fun d!80677 () Bool)

(declare-fun e!305531 () Bool)

(assert (=> d!80677 e!305531))

(declare-fun res!321046 () Bool)

(assert (=> d!80677 (=> (not res!321046) (not e!305531))))

(assert (=> d!80677 (= res!321046 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16370 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16370 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!16370 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16370 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16370 a!3235))))))

(declare-fun lt!240449 () Unit!16327)

(declare-fun choose!47 (array!33307 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16327)

(assert (=> d!80677 (= lt!240449 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!240353 #b00000000000000000000000000000000 (index!19927 lt!240352) (x!49054 lt!240352) mask!3524))))

(assert (=> d!80677 (validMask!0 mask!3524)))

(assert (=> d!80677 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!240353 #b00000000000000000000000000000000 (index!19927 lt!240352) (x!49054 lt!240352) mask!3524) lt!240449)))

(declare-fun b!523883 () Bool)

(assert (=> b!523883 (= e!305531 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240353 (select (store (arr!16006 a!3235) i!1204 k0!2280) j!176) (array!33308 (store (arr!16006 a!3235) i!1204 k0!2280) (size!16370 a!3235)) mask!3524) (Intermediate!4429 false (index!19927 lt!240352) (x!49054 lt!240352))))))

(assert (= (and d!80677 res!321046) b!523883))

(declare-fun m!504867 () Bool)

(assert (=> d!80677 m!504867))

(assert (=> d!80677 m!504729))

(assert (=> b!523883 m!504713))

(assert (=> b!523883 m!504717))

(assert (=> b!523883 m!504717))

(declare-fun m!504869 () Bool)

(assert (=> b!523883 m!504869))

(assert (=> b!523726 d!80677))

(declare-fun e!305534 () SeekEntryResult!4429)

(declare-fun b!523884 () Bool)

(assert (=> b!523884 (= e!305534 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!240353 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) mask!3524) lt!240351 lt!240349 mask!3524))))

(declare-fun b!523885 () Bool)

(declare-fun lt!240451 () SeekEntryResult!4429)

(assert (=> b!523885 (and (bvsge (index!19927 lt!240451) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240451) (size!16370 lt!240349)))))

(declare-fun res!321047 () Bool)

(assert (=> b!523885 (= res!321047 (= (select (arr!16006 lt!240349) (index!19927 lt!240451)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!305532 () Bool)

(assert (=> b!523885 (=> res!321047 e!305532)))

(declare-fun d!80683 () Bool)

(declare-fun e!305536 () Bool)

(assert (=> d!80683 e!305536))

(declare-fun c!61724 () Bool)

(assert (=> d!80683 (= c!61724 (and ((_ is Intermediate!4429) lt!240451) (undefined!5241 lt!240451)))))

(declare-fun e!305535 () SeekEntryResult!4429)

(assert (=> d!80683 (= lt!240451 e!305535)))

(declare-fun c!61725 () Bool)

(assert (=> d!80683 (= c!61725 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!240450 () (_ BitVec 64))

(assert (=> d!80683 (= lt!240450 (select (arr!16006 lt!240349) lt!240353))))

(assert (=> d!80683 (validMask!0 mask!3524)))

(assert (=> d!80683 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240353 lt!240351 lt!240349 mask!3524) lt!240451)))

(declare-fun b!523886 () Bool)

(assert (=> b!523886 (= e!305536 (bvsge (x!49054 lt!240451) #b01111111111111111111111111111110))))

(declare-fun b!523887 () Bool)

(assert (=> b!523887 (and (bvsge (index!19927 lt!240451) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240451) (size!16370 lt!240349)))))

(declare-fun res!321048 () Bool)

(assert (=> b!523887 (= res!321048 (= (select (arr!16006 lt!240349) (index!19927 lt!240451)) lt!240351))))

(assert (=> b!523887 (=> res!321048 e!305532)))

(declare-fun e!305533 () Bool)

(assert (=> b!523887 (= e!305533 e!305532)))

(declare-fun b!523888 () Bool)

(assert (=> b!523888 (= e!305535 e!305534)))

(declare-fun c!61723 () Bool)

(assert (=> b!523888 (= c!61723 (or (= lt!240450 lt!240351) (= (bvadd lt!240450 lt!240450) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!523889 () Bool)

(assert (=> b!523889 (and (bvsge (index!19927 lt!240451) #b00000000000000000000000000000000) (bvslt (index!19927 lt!240451) (size!16370 lt!240349)))))

(assert (=> b!523889 (= e!305532 (= (select (arr!16006 lt!240349) (index!19927 lt!240451)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!523890 () Bool)

(assert (=> b!523890 (= e!305534 (Intermediate!4429 false lt!240353 #b00000000000000000000000000000000))))

(declare-fun b!523891 () Bool)

(assert (=> b!523891 (= e!305535 (Intermediate!4429 true lt!240353 #b00000000000000000000000000000000))))

(declare-fun b!523892 () Bool)

(assert (=> b!523892 (= e!305536 e!305533)))

(declare-fun res!321049 () Bool)

(assert (=> b!523892 (= res!321049 (and ((_ is Intermediate!4429) lt!240451) (not (undefined!5241 lt!240451)) (bvslt (x!49054 lt!240451) #b01111111111111111111111111111110) (bvsge (x!49054 lt!240451) #b00000000000000000000000000000000) (bvsge (x!49054 lt!240451) #b00000000000000000000000000000000)))))

(assert (=> b!523892 (=> (not res!321049) (not e!305533))))

(assert (= (and d!80683 c!61725) b!523891))

(assert (= (and d!80683 (not c!61725)) b!523888))

(assert (= (and b!523888 c!61723) b!523890))

(assert (= (and b!523888 (not c!61723)) b!523884))

(assert (= (and d!80683 c!61724) b!523886))

(assert (= (and d!80683 (not c!61724)) b!523892))

(assert (= (and b!523892 res!321049) b!523887))

(assert (= (and b!523887 (not res!321048)) b!523885))

(assert (= (and b!523885 (not res!321047)) b!523889))

(declare-fun m!504871 () Bool)

(assert (=> d!80683 m!504871))

(assert (=> d!80683 m!504729))

(declare-fun m!504873 () Bool)

(assert (=> b!523885 m!504873))

(assert (=> b!523884 m!504827))

(assert (=> b!523884 m!504827))

(declare-fun m!504875 () Bool)

(assert (=> b!523884 m!504875))

(assert (=> b!523887 m!504873))

(assert (=> b!523889 m!504873))

(assert (=> b!523726 d!80683))

(declare-fun d!80685 () Bool)

(declare-fun res!321054 () Bool)

(declare-fun e!305541 () Bool)

(assert (=> d!80685 (=> res!321054 e!305541)))

(assert (=> d!80685 (= res!321054 (= (select (arr!16006 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!80685 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!305541)))

(declare-fun b!523897 () Bool)

(declare-fun e!305542 () Bool)

(assert (=> b!523897 (= e!305541 e!305542)))

(declare-fun res!321055 () Bool)

(assert (=> b!523897 (=> (not res!321055) (not e!305542))))

(assert (=> b!523897 (= res!321055 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16370 a!3235)))))

(declare-fun b!523898 () Bool)

(assert (=> b!523898 (= e!305542 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!80685 (not res!321054)) b!523897))

(assert (= (and b!523897 res!321055) b!523898))

(assert (=> d!80685 m!504847))

(declare-fun m!504877 () Bool)

(assert (=> b!523898 m!504877))

(assert (=> b!523737 d!80685))

(declare-fun d!80687 () Bool)

(assert (=> d!80687 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523728 d!80687))

(declare-fun b!523980 () Bool)

(declare-fun e!305592 () SeekEntryResult!4429)

(declare-fun lt!240472 () SeekEntryResult!4429)

(assert (=> b!523980 (= e!305592 (Found!4429 (index!19927 lt!240472)))))

(declare-fun b!523981 () Bool)

(declare-fun e!305591 () SeekEntryResult!4429)

(assert (=> b!523981 (= e!305591 e!305592)))

(declare-fun lt!240471 () (_ BitVec 64))

(assert (=> b!523981 (= lt!240471 (select (arr!16006 a!3235) (index!19927 lt!240472)))))

(declare-fun c!61755 () Bool)

(assert (=> b!523981 (= c!61755 (= lt!240471 k0!2280))))

(declare-fun d!80689 () Bool)

(declare-fun lt!240470 () SeekEntryResult!4429)

(assert (=> d!80689 (and (or ((_ is Undefined!4429) lt!240470) (not ((_ is Found!4429) lt!240470)) (and (bvsge (index!19926 lt!240470) #b00000000000000000000000000000000) (bvslt (index!19926 lt!240470) (size!16370 a!3235)))) (or ((_ is Undefined!4429) lt!240470) ((_ is Found!4429) lt!240470) (not ((_ is MissingZero!4429) lt!240470)) (and (bvsge (index!19925 lt!240470) #b00000000000000000000000000000000) (bvslt (index!19925 lt!240470) (size!16370 a!3235)))) (or ((_ is Undefined!4429) lt!240470) ((_ is Found!4429) lt!240470) ((_ is MissingZero!4429) lt!240470) (not ((_ is MissingVacant!4429) lt!240470)) (and (bvsge (index!19928 lt!240470) #b00000000000000000000000000000000) (bvslt (index!19928 lt!240470) (size!16370 a!3235)))) (or ((_ is Undefined!4429) lt!240470) (ite ((_ is Found!4429) lt!240470) (= (select (arr!16006 a!3235) (index!19926 lt!240470)) k0!2280) (ite ((_ is MissingZero!4429) lt!240470) (= (select (arr!16006 a!3235) (index!19925 lt!240470)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4429) lt!240470) (= (select (arr!16006 a!3235) (index!19928 lt!240470)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80689 (= lt!240470 e!305591)))

(declare-fun c!61753 () Bool)

(assert (=> d!80689 (= c!61753 (and ((_ is Intermediate!4429) lt!240472) (undefined!5241 lt!240472)))))

(assert (=> d!80689 (= lt!240472 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!80689 (validMask!0 mask!3524)))

(assert (=> d!80689 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!240470)))

(declare-fun b!523982 () Bool)

(declare-fun e!305593 () SeekEntryResult!4429)

(assert (=> b!523982 (= e!305593 (MissingZero!4429 (index!19927 lt!240472)))))

(declare-fun b!523983 () Bool)

(assert (=> b!523983 (= e!305591 Undefined!4429)))

(declare-fun b!523984 () Bool)

(declare-fun c!61754 () Bool)

(assert (=> b!523984 (= c!61754 (= lt!240471 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!523984 (= e!305592 e!305593)))

(declare-fun b!523985 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33307 (_ BitVec 32)) SeekEntryResult!4429)

(assert (=> b!523985 (= e!305593 (seekKeyOrZeroReturnVacant!0 (x!49054 lt!240472) (index!19927 lt!240472) (index!19927 lt!240472) k0!2280 a!3235 mask!3524))))

(assert (= (and d!80689 c!61753) b!523983))

(assert (= (and d!80689 (not c!61753)) b!523981))

(assert (= (and b!523981 c!61755) b!523980))

(assert (= (and b!523981 (not c!61755)) b!523984))

(assert (= (and b!523984 c!61754) b!523982))

(assert (= (and b!523984 (not c!61754)) b!523985))

(declare-fun m!504903 () Bool)

(assert (=> b!523981 m!504903))

(declare-fun m!504905 () Bool)

(assert (=> d!80689 m!504905))

(assert (=> d!80689 m!504905))

(declare-fun m!504907 () Bool)

(assert (=> d!80689 m!504907))

(assert (=> d!80689 m!504729))

(declare-fun m!504909 () Bool)

(assert (=> d!80689 m!504909))

(declare-fun m!504911 () Bool)

(assert (=> d!80689 m!504911))

(declare-fun m!504913 () Bool)

(assert (=> d!80689 m!504913))

(declare-fun m!504915 () Bool)

(assert (=> b!523985 m!504915))

(assert (=> b!523738 d!80689))

(declare-fun d!80701 () Bool)

(assert (=> d!80701 (= (validKeyInArray!0 (select (arr!16006 a!3235) j!176)) (and (not (= (select (arr!16006 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16006 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!523733 d!80701))

(declare-fun d!80703 () Bool)

(declare-fun res!321098 () Bool)

(declare-fun e!305614 () Bool)

(assert (=> d!80703 (=> res!321098 e!305614)))

(assert (=> d!80703 (= res!321098 (bvsge #b00000000000000000000000000000000 (size!16370 a!3235)))))

(assert (=> d!80703 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10068) e!305614)))

(declare-fun b!524008 () Bool)

(declare-fun e!305611 () Bool)

(declare-fun contains!2749 (List!10071 (_ BitVec 64)) Bool)

(assert (=> b!524008 (= e!305611 (contains!2749 Nil!10068 (select (arr!16006 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!524009 () Bool)

(declare-fun e!305612 () Bool)

(declare-fun call!31849 () Bool)

(assert (=> b!524009 (= e!305612 call!31849)))

(declare-fun b!524010 () Bool)

(declare-fun e!305613 () Bool)

(assert (=> b!524010 (= e!305613 e!305612)))

(declare-fun c!61761 () Bool)

(assert (=> b!524010 (= c!61761 (validKeyInArray!0 (select (arr!16006 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!524011 () Bool)

(assert (=> b!524011 (= e!305612 call!31849)))

(declare-fun b!524012 () Bool)

(assert (=> b!524012 (= e!305614 e!305613)))

(declare-fun res!321097 () Bool)

(assert (=> b!524012 (=> (not res!321097) (not e!305613))))

(assert (=> b!524012 (= res!321097 (not e!305611))))

(declare-fun res!321096 () Bool)

(assert (=> b!524012 (=> (not res!321096) (not e!305611))))

(assert (=> b!524012 (= res!321096 (validKeyInArray!0 (select (arr!16006 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31846 () Bool)

(assert (=> bm!31846 (= call!31849 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!61761 (Cons!10067 (select (arr!16006 a!3235) #b00000000000000000000000000000000) Nil!10068) Nil!10068)))))

(assert (= (and d!80703 (not res!321098)) b!524012))

(assert (= (and b!524012 res!321096) b!524008))

(assert (= (and b!524012 res!321097) b!524010))

(assert (= (and b!524010 c!61761) b!524011))

(assert (= (and b!524010 (not c!61761)) b!524009))

(assert (= (or b!524011 b!524009) bm!31846))

(assert (=> b!524008 m!504847))

(assert (=> b!524008 m!504847))

(declare-fun m!504925 () Bool)

(assert (=> b!524008 m!504925))

(assert (=> b!524010 m!504847))

(assert (=> b!524010 m!504847))

(assert (=> b!524010 m!504857))

(assert (=> b!524012 m!504847))

(assert (=> b!524012 m!504847))

(assert (=> b!524012 m!504857))

(assert (=> bm!31846 m!504847))

(declare-fun m!504927 () Bool)

(assert (=> bm!31846 m!504927))

(assert (=> b!523735 d!80703))

(declare-fun b!524013 () Bool)

(declare-fun e!305616 () SeekEntryResult!4429)

(declare-fun lt!240484 () SeekEntryResult!4429)

(assert (=> b!524013 (= e!305616 (Found!4429 (index!19927 lt!240484)))))

(declare-fun b!524014 () Bool)

(declare-fun e!305615 () SeekEntryResult!4429)

(assert (=> b!524014 (= e!305615 e!305616)))

(declare-fun lt!240483 () (_ BitVec 64))

(assert (=> b!524014 (= lt!240483 (select (arr!16006 a!3235) (index!19927 lt!240484)))))

(declare-fun c!61764 () Bool)

(assert (=> b!524014 (= c!61764 (= lt!240483 (select (arr!16006 a!3235) j!176)))))

(declare-fun d!80707 () Bool)

(declare-fun lt!240482 () SeekEntryResult!4429)

(assert (=> d!80707 (and (or ((_ is Undefined!4429) lt!240482) (not ((_ is Found!4429) lt!240482)) (and (bvsge (index!19926 lt!240482) #b00000000000000000000000000000000) (bvslt (index!19926 lt!240482) (size!16370 a!3235)))) (or ((_ is Undefined!4429) lt!240482) ((_ is Found!4429) lt!240482) (not ((_ is MissingZero!4429) lt!240482)) (and (bvsge (index!19925 lt!240482) #b00000000000000000000000000000000) (bvslt (index!19925 lt!240482) (size!16370 a!3235)))) (or ((_ is Undefined!4429) lt!240482) ((_ is Found!4429) lt!240482) ((_ is MissingZero!4429) lt!240482) (not ((_ is MissingVacant!4429) lt!240482)) (and (bvsge (index!19928 lt!240482) #b00000000000000000000000000000000) (bvslt (index!19928 lt!240482) (size!16370 a!3235)))) (or ((_ is Undefined!4429) lt!240482) (ite ((_ is Found!4429) lt!240482) (= (select (arr!16006 a!3235) (index!19926 lt!240482)) (select (arr!16006 a!3235) j!176)) (ite ((_ is MissingZero!4429) lt!240482) (= (select (arr!16006 a!3235) (index!19925 lt!240482)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4429) lt!240482) (= (select (arr!16006 a!3235) (index!19928 lt!240482)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!80707 (= lt!240482 e!305615)))

(declare-fun c!61762 () Bool)

(assert (=> d!80707 (= c!61762 (and ((_ is Intermediate!4429) lt!240484) (undefined!5241 lt!240484)))))

(assert (=> d!80707 (= lt!240484 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16006 a!3235) j!176) mask!3524) (select (arr!16006 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!80707 (validMask!0 mask!3524)))

(assert (=> d!80707 (= (seekEntryOrOpen!0 (select (arr!16006 a!3235) j!176) a!3235 mask!3524) lt!240482)))

(declare-fun b!524015 () Bool)

(declare-fun e!305617 () SeekEntryResult!4429)

(assert (=> b!524015 (= e!305617 (MissingZero!4429 (index!19927 lt!240484)))))

(declare-fun b!524016 () Bool)

(assert (=> b!524016 (= e!305615 Undefined!4429)))

(declare-fun b!524017 () Bool)

(declare-fun c!61763 () Bool)

(assert (=> b!524017 (= c!61763 (= lt!240483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524017 (= e!305616 e!305617)))

(declare-fun b!524018 () Bool)

(assert (=> b!524018 (= e!305617 (seekKeyOrZeroReturnVacant!0 (x!49054 lt!240484) (index!19927 lt!240484) (index!19927 lt!240484) (select (arr!16006 a!3235) j!176) a!3235 mask!3524))))

(assert (= (and d!80707 c!61762) b!524016))

(assert (= (and d!80707 (not c!61762)) b!524014))

(assert (= (and b!524014 c!61764) b!524013))

(assert (= (and b!524014 (not c!61764)) b!524017))

(assert (= (and b!524017 c!61763) b!524015))

(assert (= (and b!524017 (not c!61763)) b!524018))

(declare-fun m!504929 () Bool)

(assert (=> b!524014 m!504929))

(assert (=> d!80707 m!504703))

(assert (=> d!80707 m!504721))

(assert (=> d!80707 m!504721))

(assert (=> d!80707 m!504703))

(declare-fun m!504931 () Bool)

(assert (=> d!80707 m!504931))

(assert (=> d!80707 m!504729))

(declare-fun m!504933 () Bool)

(assert (=> d!80707 m!504933))

(declare-fun m!504935 () Bool)

(assert (=> d!80707 m!504935))

(declare-fun m!504937 () Bool)

(assert (=> d!80707 m!504937))

(assert (=> b!524018 m!504703))

(declare-fun m!504939 () Bool)

(assert (=> b!524018 m!504939))

(assert (=> b!523736 d!80707))

(declare-fun d!80709 () Bool)

(assert (=> d!80709 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!47606 d!80709))

(declare-fun d!80725 () Bool)

(assert (=> d!80725 (= (array_inv!11865 a!3235) (bvsge (size!16370 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!47606 d!80725))

(check-sat (not d!80677) (not b!523859) (not d!80707) (not b!523860) (not d!80683) (not b!524012) (not bm!31836) (not b!524018) (not d!80669) (not bm!31846) (not b!523985) (not b!523883) (not b!523862) (not b!523872) (not b!523841) (not b!523873) (not d!80689) (not b!523884) (not b!523898) (not b!524008) (not bm!31837) (not d!80659) (not b!524010) (not d!80667))
(check-sat)
