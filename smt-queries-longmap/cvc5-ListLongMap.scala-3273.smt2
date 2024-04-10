; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45582 () Bool)

(assert start!45582)

(declare-fun b!501769 () Bool)

(declare-fun res!303267 () Bool)

(declare-fun e!293942 () Bool)

(assert (=> b!501769 (=> (not res!303267) (not e!293942))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32338 0))(
  ( (array!32339 (arr!15549 (Array (_ BitVec 32) (_ BitVec 64))) (size!15913 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32338)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!501769 (= res!303267 (and (= (size!15913 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15913 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15913 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501770 () Bool)

(declare-fun res!303272 () Bool)

(assert (=> b!501770 (=> (not res!303272) (not e!293942))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501770 (= res!303272 (validKeyInArray!0 k!2280))))

(declare-fun b!501771 () Bool)

(declare-fun e!293938 () Bool)

(assert (=> b!501771 (= e!293938 false)))

(declare-fun res!303273 () Bool)

(assert (=> start!45582 (=> (not res!303273) (not e!293942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45582 (= res!303273 (validMask!0 mask!3524))))

(assert (=> start!45582 e!293942))

(assert (=> start!45582 true))

(declare-fun array_inv!11345 (array!32338) Bool)

(assert (=> start!45582 (array_inv!11345 a!3235)))

(declare-fun b!501772 () Bool)

(declare-fun res!303276 () Bool)

(declare-fun e!293946 () Bool)

(assert (=> b!501772 (=> res!303276 e!293946)))

(declare-datatypes ((SeekEntryResult!4016 0))(
  ( (MissingZero!4016 (index!18252 (_ BitVec 32))) (Found!4016 (index!18253 (_ BitVec 32))) (Intermediate!4016 (undefined!4828 Bool) (index!18254 (_ BitVec 32)) (x!47289 (_ BitVec 32))) (Undefined!4016) (MissingVacant!4016 (index!18255 (_ BitVec 32))) )
))
(declare-fun lt!227946 () SeekEntryResult!4016)

(assert (=> b!501772 (= res!303276 (or (undefined!4828 lt!227946) (not (is-Intermediate!4016 lt!227946))))))

(declare-fun b!501773 () Bool)

(declare-fun res!303266 () Bool)

(declare-fun e!293945 () Bool)

(assert (=> b!501773 (=> (not res!303266) (not e!293945))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32338 (_ BitVec 32)) Bool)

(assert (=> b!501773 (= res!303266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501774 () Bool)

(assert (=> b!501774 (= e!293942 e!293945)))

(declare-fun res!303265 () Bool)

(assert (=> b!501774 (=> (not res!303265) (not e!293945))))

(declare-fun lt!227950 () SeekEntryResult!4016)

(assert (=> b!501774 (= res!303265 (or (= lt!227950 (MissingZero!4016 i!1204)) (= lt!227950 (MissingVacant!4016 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32338 (_ BitVec 32)) SeekEntryResult!4016)

(assert (=> b!501774 (= lt!227950 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!501775 () Bool)

(declare-fun e!293940 () Bool)

(assert (=> b!501775 (= e!293940 (= (seekEntryOrOpen!0 (select (arr!15549 a!3235) j!176) a!3235 mask!3524) (Found!4016 j!176)))))

(declare-fun b!501776 () Bool)

(declare-fun e!293944 () Bool)

(assert (=> b!501776 (= e!293944 true)))

(declare-fun lt!227949 () array!32338)

(declare-fun lt!227947 () (_ BitVec 32))

(declare-fun lt!227952 () SeekEntryResult!4016)

(declare-fun lt!227943 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32338 (_ BitVec 32)) SeekEntryResult!4016)

(assert (=> b!501776 (= lt!227952 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227947 lt!227943 lt!227949 mask!3524))))

(declare-fun b!501777 () Bool)

(declare-datatypes ((Unit!15140 0))(
  ( (Unit!15141) )
))
(declare-fun e!293939 () Unit!15140)

(declare-fun Unit!15142 () Unit!15140)

(assert (=> b!501777 (= e!293939 Unit!15142)))

(declare-fun b!501778 () Bool)

(declare-fun res!303277 () Bool)

(assert (=> b!501778 (=> (not res!303277) (not e!293942))))

(assert (=> b!501778 (= res!303277 (validKeyInArray!0 (select (arr!15549 a!3235) j!176)))))

(declare-fun b!501779 () Bool)

(declare-fun Unit!15143 () Unit!15140)

(assert (=> b!501779 (= e!293939 Unit!15143)))

(declare-fun lt!227948 () Unit!15140)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32338 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15140)

(assert (=> b!501779 (= lt!227948 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!227947 #b00000000000000000000000000000000 (index!18254 lt!227946) (x!47289 lt!227946) mask!3524))))

(declare-fun res!303278 () Bool)

(assert (=> b!501779 (= res!303278 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227947 lt!227943 lt!227949 mask!3524) (Intermediate!4016 false (index!18254 lt!227946) (x!47289 lt!227946))))))

(assert (=> b!501779 (=> (not res!303278) (not e!293938))))

(assert (=> b!501779 e!293938))

(declare-fun b!501780 () Bool)

(declare-fun res!303274 () Bool)

(assert (=> b!501780 (=> (not res!303274) (not e!293945))))

(declare-datatypes ((List!9707 0))(
  ( (Nil!9704) (Cons!9703 (h!10580 (_ BitVec 64)) (t!15935 List!9707)) )
))
(declare-fun arrayNoDuplicates!0 (array!32338 (_ BitVec 32) List!9707) Bool)

(assert (=> b!501780 (= res!303274 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9704))))

(declare-fun b!501781 () Bool)

(declare-fun e!293943 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32338 (_ BitVec 32)) SeekEntryResult!4016)

(assert (=> b!501781 (= e!293943 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!227947 (index!18254 lt!227946) (select (arr!15549 a!3235) j!176) a!3235 mask!3524) (Found!4016 j!176))))))

(declare-fun b!501782 () Bool)

(assert (=> b!501782 (= e!293946 e!293944)))

(declare-fun res!303264 () Bool)

(assert (=> b!501782 (=> res!303264 e!293944)))

(assert (=> b!501782 (= res!303264 (or (bvsgt (x!47289 lt!227946) #b01111111111111111111111111111110) (bvslt lt!227947 #b00000000000000000000000000000000) (bvsge lt!227947 (size!15913 a!3235)) (bvslt (index!18254 lt!227946) #b00000000000000000000000000000000) (bvsge (index!18254 lt!227946) (size!15913 a!3235)) (not (= lt!227946 (Intermediate!4016 false (index!18254 lt!227946) (x!47289 lt!227946))))))))

(assert (=> b!501782 (= (index!18254 lt!227946) i!1204)))

(declare-fun lt!227951 () Unit!15140)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32338 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15140)

(assert (=> b!501782 (= lt!227951 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!227947 #b00000000000000000000000000000000 (index!18254 lt!227946) (x!47289 lt!227946) mask!3524))))

(assert (=> b!501782 (and (or (= (select (arr!15549 a!3235) (index!18254 lt!227946)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15549 a!3235) (index!18254 lt!227946)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15549 a!3235) (index!18254 lt!227946)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15549 a!3235) (index!18254 lt!227946)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!227945 () Unit!15140)

(assert (=> b!501782 (= lt!227945 e!293939)))

(declare-fun c!59531 () Bool)

(assert (=> b!501782 (= c!59531 (= (select (arr!15549 a!3235) (index!18254 lt!227946)) (select (arr!15549 a!3235) j!176)))))

(assert (=> b!501782 (and (bvslt (x!47289 lt!227946) #b01111111111111111111111111111110) (or (= (select (arr!15549 a!3235) (index!18254 lt!227946)) (select (arr!15549 a!3235) j!176)) (= (select (arr!15549 a!3235) (index!18254 lt!227946)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15549 a!3235) (index!18254 lt!227946)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501783 () Bool)

(assert (=> b!501783 (= e!293945 (not e!293946))))

(declare-fun res!303271 () Bool)

(assert (=> b!501783 (=> res!303271 e!293946)))

(declare-fun lt!227944 () (_ BitVec 32))

(assert (=> b!501783 (= res!303271 (= lt!227946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227944 lt!227943 lt!227949 mask!3524)))))

(assert (=> b!501783 (= lt!227946 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227947 (select (arr!15549 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501783 (= lt!227944 (toIndex!0 lt!227943 mask!3524))))

(assert (=> b!501783 (= lt!227943 (select (store (arr!15549 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!501783 (= lt!227947 (toIndex!0 (select (arr!15549 a!3235) j!176) mask!3524))))

(assert (=> b!501783 (= lt!227949 (array!32339 (store (arr!15549 a!3235) i!1204 k!2280) (size!15913 a!3235)))))

(assert (=> b!501783 e!293940))

(declare-fun res!303268 () Bool)

(assert (=> b!501783 (=> (not res!303268) (not e!293940))))

(assert (=> b!501783 (= res!303268 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227953 () Unit!15140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32338 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15140)

(assert (=> b!501783 (= lt!227953 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501784 () Bool)

(declare-fun res!303275 () Bool)

(assert (=> b!501784 (=> res!303275 e!293944)))

(assert (=> b!501784 (= res!303275 e!293943)))

(declare-fun res!303270 () Bool)

(assert (=> b!501784 (=> (not res!303270) (not e!293943))))

(assert (=> b!501784 (= res!303270 (bvsgt #b00000000000000000000000000000000 (x!47289 lt!227946)))))

(declare-fun b!501785 () Bool)

(declare-fun res!303269 () Bool)

(assert (=> b!501785 (=> (not res!303269) (not e!293942))))

(declare-fun arrayContainsKey!0 (array!32338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501785 (= res!303269 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45582 res!303273) b!501769))

(assert (= (and b!501769 res!303267) b!501778))

(assert (= (and b!501778 res!303277) b!501770))

(assert (= (and b!501770 res!303272) b!501785))

(assert (= (and b!501785 res!303269) b!501774))

(assert (= (and b!501774 res!303265) b!501773))

(assert (= (and b!501773 res!303266) b!501780))

(assert (= (and b!501780 res!303274) b!501783))

(assert (= (and b!501783 res!303268) b!501775))

(assert (= (and b!501783 (not res!303271)) b!501772))

(assert (= (and b!501772 (not res!303276)) b!501782))

(assert (= (and b!501782 c!59531) b!501779))

(assert (= (and b!501782 (not c!59531)) b!501777))

(assert (= (and b!501779 res!303278) b!501771))

(assert (= (and b!501782 (not res!303264)) b!501784))

(assert (= (and b!501784 res!303270) b!501781))

(assert (= (and b!501784 (not res!303275)) b!501776))

(declare-fun m!482769 () Bool)

(assert (=> b!501782 m!482769))

(declare-fun m!482771 () Bool)

(assert (=> b!501782 m!482771))

(declare-fun m!482773 () Bool)

(assert (=> b!501782 m!482773))

(declare-fun m!482775 () Bool)

(assert (=> b!501773 m!482775))

(assert (=> b!501775 m!482773))

(assert (=> b!501775 m!482773))

(declare-fun m!482777 () Bool)

(assert (=> b!501775 m!482777))

(assert (=> b!501778 m!482773))

(assert (=> b!501778 m!482773))

(declare-fun m!482779 () Bool)

(assert (=> b!501778 m!482779))

(declare-fun m!482781 () Bool)

(assert (=> b!501776 m!482781))

(declare-fun m!482783 () Bool)

(assert (=> b!501780 m!482783))

(declare-fun m!482785 () Bool)

(assert (=> b!501774 m!482785))

(assert (=> b!501781 m!482773))

(assert (=> b!501781 m!482773))

(declare-fun m!482787 () Bool)

(assert (=> b!501781 m!482787))

(declare-fun m!482789 () Bool)

(assert (=> b!501779 m!482789))

(assert (=> b!501779 m!482781))

(declare-fun m!482791 () Bool)

(assert (=> start!45582 m!482791))

(declare-fun m!482793 () Bool)

(assert (=> start!45582 m!482793))

(declare-fun m!482795 () Bool)

(assert (=> b!501785 m!482795))

(declare-fun m!482797 () Bool)

(assert (=> b!501770 m!482797))

(declare-fun m!482799 () Bool)

(assert (=> b!501783 m!482799))

(declare-fun m!482801 () Bool)

(assert (=> b!501783 m!482801))

(declare-fun m!482803 () Bool)

(assert (=> b!501783 m!482803))

(assert (=> b!501783 m!482773))

(declare-fun m!482805 () Bool)

(assert (=> b!501783 m!482805))

(declare-fun m!482807 () Bool)

(assert (=> b!501783 m!482807))

(assert (=> b!501783 m!482773))

(declare-fun m!482809 () Bool)

(assert (=> b!501783 m!482809))

(assert (=> b!501783 m!482773))

(declare-fun m!482811 () Bool)

(assert (=> b!501783 m!482811))

(declare-fun m!482813 () Bool)

(assert (=> b!501783 m!482813))

(push 1)

