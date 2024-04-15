; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44370 () Bool)

(assert start!44370)

(declare-fun b!487526 () Bool)

(declare-fun res!290940 () Bool)

(declare-fun e!286821 () Bool)

(assert (=> b!487526 (=> (not res!290940) (not e!286821))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487526 (= res!290940 (validKeyInArray!0 k0!2280))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!487527 () Bool)

(declare-datatypes ((array!31586 0))(
  ( (array!31587 (arr!15185 (Array (_ BitVec 32) (_ BitVec 64))) (size!15550 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31586)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!286820 () Bool)

(declare-datatypes ((SeekEntryResult!3649 0))(
  ( (MissingZero!3649 (index!16775 (_ BitVec 32))) (Found!3649 (index!16776 (_ BitVec 32))) (Intermediate!3649 (undefined!4461 Bool) (index!16777 (_ BitVec 32)) (x!45904 (_ BitVec 32))) (Undefined!3649) (MissingVacant!3649 (index!16778 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31586 (_ BitVec 32)) SeekEntryResult!3649)

(assert (=> b!487527 (= e!286820 (= (seekEntryOrOpen!0 (select (arr!15185 a!3235) j!176) a!3235 mask!3524) (Found!3649 j!176)))))

(declare-fun b!487528 () Bool)

(declare-fun e!286818 () Bool)

(assert (=> b!487528 (= e!286821 e!286818)))

(declare-fun res!290945 () Bool)

(assert (=> b!487528 (=> (not res!290945) (not e!286818))))

(declare-fun lt!219927 () SeekEntryResult!3649)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487528 (= res!290945 (or (= lt!219927 (MissingZero!3649 i!1204)) (= lt!219927 (MissingVacant!3649 i!1204))))))

(assert (=> b!487528 (= lt!219927 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487530 () Bool)

(assert (=> b!487530 (= e!286818 (not true))))

(declare-fun lt!219926 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487530 (= lt!219926 (toIndex!0 (select (arr!15185 a!3235) j!176) mask!3524))))

(assert (=> b!487530 e!286820))

(declare-fun res!290946 () Bool)

(assert (=> b!487530 (=> (not res!290946) (not e!286820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31586 (_ BitVec 32)) Bool)

(assert (=> b!487530 (= res!290946 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14230 0))(
  ( (Unit!14231) )
))
(declare-fun lt!219928 () Unit!14230)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31586 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14230)

(assert (=> b!487530 (= lt!219928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487531 () Bool)

(declare-fun res!290942 () Bool)

(assert (=> b!487531 (=> (not res!290942) (not e!286821))))

(declare-fun arrayContainsKey!0 (array!31586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487531 (= res!290942 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487532 () Bool)

(declare-fun res!290944 () Bool)

(assert (=> b!487532 (=> (not res!290944) (not e!286821))))

(assert (=> b!487532 (= res!290944 (validKeyInArray!0 (select (arr!15185 a!3235) j!176)))))

(declare-fun b!487533 () Bool)

(declare-fun res!290943 () Bool)

(assert (=> b!487533 (=> (not res!290943) (not e!286818))))

(assert (=> b!487533 (= res!290943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487534 () Bool)

(declare-fun res!290948 () Bool)

(assert (=> b!487534 (=> (not res!290948) (not e!286818))))

(declare-datatypes ((List!9382 0))(
  ( (Nil!9379) (Cons!9378 (h!10234 (_ BitVec 64)) (t!15601 List!9382)) )
))
(declare-fun arrayNoDuplicates!0 (array!31586 (_ BitVec 32) List!9382) Bool)

(assert (=> b!487534 (= res!290948 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9379))))

(declare-fun b!487529 () Bool)

(declare-fun res!290947 () Bool)

(assert (=> b!487529 (=> (not res!290947) (not e!286821))))

(assert (=> b!487529 (= res!290947 (and (= (size!15550 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15550 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15550 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!290941 () Bool)

(assert (=> start!44370 (=> (not res!290941) (not e!286821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44370 (= res!290941 (validMask!0 mask!3524))))

(assert (=> start!44370 e!286821))

(assert (=> start!44370 true))

(declare-fun array_inv!11068 (array!31586) Bool)

(assert (=> start!44370 (array_inv!11068 a!3235)))

(assert (= (and start!44370 res!290941) b!487529))

(assert (= (and b!487529 res!290947) b!487532))

(assert (= (and b!487532 res!290944) b!487526))

(assert (= (and b!487526 res!290940) b!487531))

(assert (= (and b!487531 res!290942) b!487528))

(assert (= (and b!487528 res!290945) b!487533))

(assert (= (and b!487533 res!290943) b!487534))

(assert (= (and b!487534 res!290948) b!487530))

(assert (= (and b!487530 res!290946) b!487527))

(declare-fun m!466831 () Bool)

(assert (=> start!44370 m!466831))

(declare-fun m!466833 () Bool)

(assert (=> start!44370 m!466833))

(declare-fun m!466835 () Bool)

(assert (=> b!487534 m!466835))

(declare-fun m!466837 () Bool)

(assert (=> b!487531 m!466837))

(declare-fun m!466839 () Bool)

(assert (=> b!487533 m!466839))

(declare-fun m!466841 () Bool)

(assert (=> b!487532 m!466841))

(assert (=> b!487532 m!466841))

(declare-fun m!466843 () Bool)

(assert (=> b!487532 m!466843))

(assert (=> b!487530 m!466841))

(assert (=> b!487530 m!466841))

(declare-fun m!466845 () Bool)

(assert (=> b!487530 m!466845))

(declare-fun m!466847 () Bool)

(assert (=> b!487530 m!466847))

(declare-fun m!466849 () Bool)

(assert (=> b!487530 m!466849))

(declare-fun m!466851 () Bool)

(assert (=> b!487528 m!466851))

(declare-fun m!466853 () Bool)

(assert (=> b!487526 m!466853))

(assert (=> b!487527 m!466841))

(assert (=> b!487527 m!466841))

(declare-fun m!466855 () Bool)

(assert (=> b!487527 m!466855))

(check-sat (not b!487526) (not b!487533) (not start!44370) (not b!487528) (not b!487530) (not b!487527) (not b!487534) (not b!487532) (not b!487531))
(check-sat)
