; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45354 () Bool)

(assert start!45354)

(declare-fun b!497927 () Bool)

(declare-fun e!291834 () Bool)

(assert (=> b!497927 (= e!291834 true)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3940 0))(
  ( (MissingZero!3940 (index!17942 (_ BitVec 32))) (Found!3940 (index!17943 (_ BitVec 32))) (Intermediate!3940 (undefined!4752 Bool) (index!17944 (_ BitVec 32)) (x!47004 (_ BitVec 32))) (Undefined!3940) (MissingVacant!3940 (index!17945 (_ BitVec 32))) )
))
(declare-fun lt!225389 () SeekEntryResult!3940)

(declare-fun lt!225388 () (_ BitVec 64))

(declare-datatypes ((array!32189 0))(
  ( (array!32190 (arr!15476 (Array (_ BitVec 32) (_ BitVec 64))) (size!15841 (_ BitVec 32))) )
))
(declare-fun lt!225394 () array!32189)

(declare-fun lt!225387 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32189 (_ BitVec 32)) SeekEntryResult!3940)

(assert (=> b!497927 (= lt!225389 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225387 lt!225388 lt!225394 mask!3524))))

(declare-fun b!497928 () Bool)

(declare-datatypes ((Unit!14830 0))(
  ( (Unit!14831) )
))
(declare-fun e!291836 () Unit!14830)

(declare-fun Unit!14832 () Unit!14830)

(assert (=> b!497928 (= e!291836 Unit!14832)))

(declare-fun b!497929 () Bool)

(declare-fun res!300208 () Bool)

(declare-fun e!291837 () Bool)

(assert (=> b!497929 (=> (not res!300208) (not e!291837))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497929 (= res!300208 (validKeyInArray!0 k0!2280))))

(declare-fun e!291835 () Bool)

(declare-fun b!497930 () Bool)

(declare-fun a!3235 () array!32189)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32189 (_ BitVec 32)) SeekEntryResult!3940)

(assert (=> b!497930 (= e!291835 (= (seekEntryOrOpen!0 (select (arr!15476 a!3235) j!176) a!3235 mask!3524) (Found!3940 j!176)))))

(declare-fun b!497931 () Bool)

(declare-fun res!300209 () Bool)

(assert (=> b!497931 (=> (not res!300209) (not e!291837))))

(declare-fun arrayContainsKey!0 (array!32189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497931 (= res!300209 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497932 () Bool)

(declare-fun res!300198 () Bool)

(assert (=> b!497932 (=> (not res!300198) (not e!291837))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497932 (= res!300198 (and (= (size!15841 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15841 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15841 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497933 () Bool)

(declare-fun res!300200 () Bool)

(declare-fun e!291839 () Bool)

(assert (=> b!497933 (=> res!300200 e!291839)))

(declare-fun lt!225391 () SeekEntryResult!3940)

(get-info :version)

(assert (=> b!497933 (= res!300200 (or (undefined!4752 lt!225391) (not ((_ is Intermediate!3940) lt!225391))))))

(declare-fun b!497934 () Bool)

(declare-fun res!300203 () Bool)

(declare-fun e!291833 () Bool)

(assert (=> b!497934 (=> (not res!300203) (not e!291833))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32189 (_ BitVec 32)) Bool)

(assert (=> b!497934 (= res!300203 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497935 () Bool)

(assert (=> b!497935 (= e!291833 (not e!291839))))

(declare-fun res!300205 () Bool)

(assert (=> b!497935 (=> res!300205 e!291839)))

(declare-fun lt!225385 () (_ BitVec 32))

(assert (=> b!497935 (= res!300205 (= lt!225391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225385 lt!225388 lt!225394 mask!3524)))))

(assert (=> b!497935 (= lt!225391 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225387 (select (arr!15476 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497935 (= lt!225385 (toIndex!0 lt!225388 mask!3524))))

(assert (=> b!497935 (= lt!225388 (select (store (arr!15476 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!497935 (= lt!225387 (toIndex!0 (select (arr!15476 a!3235) j!176) mask!3524))))

(assert (=> b!497935 (= lt!225394 (array!32190 (store (arr!15476 a!3235) i!1204 k0!2280) (size!15841 a!3235)))))

(assert (=> b!497935 e!291835))

(declare-fun res!300206 () Bool)

(assert (=> b!497935 (=> (not res!300206) (not e!291835))))

(assert (=> b!497935 (= res!300206 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225390 () Unit!14830)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32189 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14830)

(assert (=> b!497935 (= lt!225390 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497936 () Bool)

(declare-fun res!300201 () Bool)

(assert (=> b!497936 (=> (not res!300201) (not e!291837))))

(assert (=> b!497936 (= res!300201 (validKeyInArray!0 (select (arr!15476 a!3235) j!176)))))

(declare-fun b!497937 () Bool)

(declare-fun e!291840 () Bool)

(assert (=> b!497937 (= e!291840 false)))

(declare-fun res!300197 () Bool)

(assert (=> start!45354 (=> (not res!300197) (not e!291837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45354 (= res!300197 (validMask!0 mask!3524))))

(assert (=> start!45354 e!291837))

(assert (=> start!45354 true))

(declare-fun array_inv!11359 (array!32189) Bool)

(assert (=> start!45354 (array_inv!11359 a!3235)))

(declare-fun b!497938 () Bool)

(declare-fun res!300204 () Bool)

(assert (=> b!497938 (=> (not res!300204) (not e!291833))))

(declare-datatypes ((List!9673 0))(
  ( (Nil!9670) (Cons!9669 (h!10543 (_ BitVec 64)) (t!15892 List!9673)) )
))
(declare-fun arrayNoDuplicates!0 (array!32189 (_ BitVec 32) List!9673) Bool)

(assert (=> b!497938 (= res!300204 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9670))))

(declare-fun b!497939 () Bool)

(declare-fun Unit!14833 () Unit!14830)

(assert (=> b!497939 (= e!291836 Unit!14833)))

(declare-fun lt!225393 () Unit!14830)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32189 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14830)

(assert (=> b!497939 (= lt!225393 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225387 #b00000000000000000000000000000000 (index!17944 lt!225391) (x!47004 lt!225391) mask!3524))))

(declare-fun res!300207 () Bool)

(assert (=> b!497939 (= res!300207 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225387 lt!225388 lt!225394 mask!3524) (Intermediate!3940 false (index!17944 lt!225391) (x!47004 lt!225391))))))

(assert (=> b!497939 (=> (not res!300207) (not e!291840))))

(assert (=> b!497939 e!291840))

(declare-fun b!497940 () Bool)

(assert (=> b!497940 (= e!291839 e!291834)))

(declare-fun res!300202 () Bool)

(assert (=> b!497940 (=> res!300202 e!291834)))

(assert (=> b!497940 (= res!300202 (or (bvsgt #b00000000000000000000000000000000 (x!47004 lt!225391)) (bvsgt (x!47004 lt!225391) #b01111111111111111111111111111110) (bvslt lt!225387 #b00000000000000000000000000000000) (bvsge lt!225387 (size!15841 a!3235)) (bvslt (index!17944 lt!225391) #b00000000000000000000000000000000) (bvsge (index!17944 lt!225391) (size!15841 a!3235)) (not (= lt!225391 (Intermediate!3940 false (index!17944 lt!225391) (x!47004 lt!225391))))))))

(assert (=> b!497940 (and (or (= (select (arr!15476 a!3235) (index!17944 lt!225391)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15476 a!3235) (index!17944 lt!225391)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15476 a!3235) (index!17944 lt!225391)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15476 a!3235) (index!17944 lt!225391)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225392 () Unit!14830)

(assert (=> b!497940 (= lt!225392 e!291836)))

(declare-fun c!59142 () Bool)

(assert (=> b!497940 (= c!59142 (= (select (arr!15476 a!3235) (index!17944 lt!225391)) (select (arr!15476 a!3235) j!176)))))

(assert (=> b!497940 (and (bvslt (x!47004 lt!225391) #b01111111111111111111111111111110) (or (= (select (arr!15476 a!3235) (index!17944 lt!225391)) (select (arr!15476 a!3235) j!176)) (= (select (arr!15476 a!3235) (index!17944 lt!225391)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15476 a!3235) (index!17944 lt!225391)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497941 () Bool)

(assert (=> b!497941 (= e!291837 e!291833)))

(declare-fun res!300199 () Bool)

(assert (=> b!497941 (=> (not res!300199) (not e!291833))))

(declare-fun lt!225386 () SeekEntryResult!3940)

(assert (=> b!497941 (= res!300199 (or (= lt!225386 (MissingZero!3940 i!1204)) (= lt!225386 (MissingVacant!3940 i!1204))))))

(assert (=> b!497941 (= lt!225386 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(assert (= (and start!45354 res!300197) b!497932))

(assert (= (and b!497932 res!300198) b!497936))

(assert (= (and b!497936 res!300201) b!497929))

(assert (= (and b!497929 res!300208) b!497931))

(assert (= (and b!497931 res!300209) b!497941))

(assert (= (and b!497941 res!300199) b!497934))

(assert (= (and b!497934 res!300203) b!497938))

(assert (= (and b!497938 res!300204) b!497935))

(assert (= (and b!497935 res!300206) b!497930))

(assert (= (and b!497935 (not res!300205)) b!497933))

(assert (= (and b!497933 (not res!300200)) b!497940))

(assert (= (and b!497940 c!59142) b!497939))

(assert (= (and b!497940 (not c!59142)) b!497928))

(assert (= (and b!497939 res!300207) b!497937))

(assert (= (and b!497940 (not res!300202)) b!497927))

(declare-fun m!478729 () Bool)

(assert (=> b!497940 m!478729))

(declare-fun m!478731 () Bool)

(assert (=> b!497940 m!478731))

(assert (=> b!497930 m!478731))

(assert (=> b!497930 m!478731))

(declare-fun m!478733 () Bool)

(assert (=> b!497930 m!478733))

(declare-fun m!478735 () Bool)

(assert (=> start!45354 m!478735))

(declare-fun m!478737 () Bool)

(assert (=> start!45354 m!478737))

(declare-fun m!478739 () Bool)

(assert (=> b!497931 m!478739))

(assert (=> b!497936 m!478731))

(assert (=> b!497936 m!478731))

(declare-fun m!478741 () Bool)

(assert (=> b!497936 m!478741))

(declare-fun m!478743 () Bool)

(assert (=> b!497941 m!478743))

(declare-fun m!478745 () Bool)

(assert (=> b!497938 m!478745))

(declare-fun m!478747 () Bool)

(assert (=> b!497935 m!478747))

(declare-fun m!478749 () Bool)

(assert (=> b!497935 m!478749))

(declare-fun m!478751 () Bool)

(assert (=> b!497935 m!478751))

(assert (=> b!497935 m!478731))

(declare-fun m!478753 () Bool)

(assert (=> b!497935 m!478753))

(assert (=> b!497935 m!478731))

(declare-fun m!478755 () Bool)

(assert (=> b!497935 m!478755))

(assert (=> b!497935 m!478731))

(declare-fun m!478757 () Bool)

(assert (=> b!497935 m!478757))

(declare-fun m!478759 () Bool)

(assert (=> b!497935 m!478759))

(declare-fun m!478761 () Bool)

(assert (=> b!497935 m!478761))

(declare-fun m!478763 () Bool)

(assert (=> b!497934 m!478763))

(declare-fun m!478765 () Bool)

(assert (=> b!497927 m!478765))

(declare-fun m!478767 () Bool)

(assert (=> b!497939 m!478767))

(assert (=> b!497939 m!478765))

(declare-fun m!478769 () Bool)

(assert (=> b!497929 m!478769))

(check-sat (not b!497929) (not b!497935) (not b!497936) (not b!497941) (not b!497931) (not b!497927) (not b!497934) (not start!45354) (not b!497930) (not b!497939) (not b!497938))
(check-sat)
