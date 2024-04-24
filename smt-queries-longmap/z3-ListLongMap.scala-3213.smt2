; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45014 () Bool)

(assert start!45014)

(declare-fun b!493945 () Bool)

(declare-fun e!289972 () Bool)

(assert (=> b!493945 (= e!289972 true)))

(declare-datatypes ((SeekEntryResult!3787 0))(
  ( (MissingZero!3787 (index!17327 (_ BitVec 32))) (Found!3787 (index!17328 (_ BitVec 32))) (Intermediate!3787 (undefined!4599 Bool) (index!17329 (_ BitVec 32)) (x!46550 (_ BitVec 32))) (Undefined!3787) (MissingVacant!3787 (index!17330 (_ BitVec 32))) )
))
(declare-fun lt!223528 () SeekEntryResult!3787)

(assert (=> b!493945 (= lt!223528 Undefined!3787)))

(declare-fun b!493946 () Bool)

(declare-fun res!296569 () Bool)

(declare-fun e!289973 () Bool)

(assert (=> b!493946 (=> (not res!296569) (not e!289973))))

(declare-datatypes ((array!31960 0))(
  ( (array!31961 (arr!15364 (Array (_ BitVec 32) (_ BitVec 64))) (size!15728 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31960)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31960 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!493946 (= res!296569 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!493947 () Bool)

(declare-fun e!289971 () Bool)

(assert (=> b!493947 (= e!289971 (not e!289972))))

(declare-fun res!296571 () Bool)

(assert (=> b!493947 (=> res!296571 e!289972)))

(declare-fun lt!223527 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!223523 () SeekEntryResult!3787)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31960 (_ BitVec 32)) SeekEntryResult!3787)

(assert (=> b!493947 (= res!296571 (= lt!223523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223527 (select (store (arr!15364 a!3235) i!1204 k0!2280) j!176) (array!31961 (store (arr!15364 a!3235) i!1204 k0!2280) (size!15728 a!3235)) mask!3524)))))

(declare-fun lt!223525 () (_ BitVec 32))

(assert (=> b!493947 (= lt!223523 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!223525 (select (arr!15364 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!493947 (= lt!223527 (toIndex!0 (select (store (arr!15364 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!493947 (= lt!223525 (toIndex!0 (select (arr!15364 a!3235) j!176) mask!3524))))

(assert (=> b!493947 (= lt!223528 (Found!3787 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31960 (_ BitVec 32)) SeekEntryResult!3787)

(assert (=> b!493947 (= lt!223528 (seekEntryOrOpen!0 (select (arr!15364 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31960 (_ BitVec 32)) Bool)

(assert (=> b!493947 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14581 0))(
  ( (Unit!14582) )
))
(declare-fun lt!223526 () Unit!14581)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31960 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14581)

(assert (=> b!493947 (= lt!223526 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!493948 () Bool)

(assert (=> b!493948 (= e!289973 e!289971)))

(declare-fun res!296572 () Bool)

(assert (=> b!493948 (=> (not res!296572) (not e!289971))))

(declare-fun lt!223524 () SeekEntryResult!3787)

(assert (=> b!493948 (= res!296572 (or (= lt!223524 (MissingZero!3787 i!1204)) (= lt!223524 (MissingVacant!3787 i!1204))))))

(assert (=> b!493948 (= lt!223524 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!493949 () Bool)

(declare-fun res!296578 () Bool)

(assert (=> b!493949 (=> (not res!296578) (not e!289973))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!493949 (= res!296578 (validKeyInArray!0 k0!2280))))

(declare-fun res!296577 () Bool)

(assert (=> start!45014 (=> (not res!296577) (not e!289973))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45014 (= res!296577 (validMask!0 mask!3524))))

(assert (=> start!45014 e!289973))

(assert (=> start!45014 true))

(declare-fun array_inv!11223 (array!31960) Bool)

(assert (=> start!45014 (array_inv!11223 a!3235)))

(declare-fun b!493950 () Bool)

(declare-fun res!296570 () Bool)

(assert (=> b!493950 (=> (not res!296570) (not e!289971))))

(declare-datatypes ((List!9429 0))(
  ( (Nil!9426) (Cons!9425 (h!10293 (_ BitVec 64)) (t!15649 List!9429)) )
))
(declare-fun arrayNoDuplicates!0 (array!31960 (_ BitVec 32) List!9429) Bool)

(assert (=> b!493950 (= res!296570 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9426))))

(declare-fun b!493951 () Bool)

(declare-fun res!296574 () Bool)

(assert (=> b!493951 (=> (not res!296574) (not e!289973))))

(assert (=> b!493951 (= res!296574 (validKeyInArray!0 (select (arr!15364 a!3235) j!176)))))

(declare-fun b!493952 () Bool)

(declare-fun res!296576 () Bool)

(assert (=> b!493952 (=> res!296576 e!289972)))

(get-info :version)

(assert (=> b!493952 (= res!296576 (or (not ((_ is Intermediate!3787) lt!223523)) (not (undefined!4599 lt!223523))))))

(declare-fun b!493953 () Bool)

(declare-fun res!296575 () Bool)

(assert (=> b!493953 (=> (not res!296575) (not e!289973))))

(assert (=> b!493953 (= res!296575 (and (= (size!15728 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15728 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15728 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!493954 () Bool)

(declare-fun res!296573 () Bool)

(assert (=> b!493954 (=> (not res!296573) (not e!289971))))

(assert (=> b!493954 (= res!296573 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!45014 res!296577) b!493953))

(assert (= (and b!493953 res!296575) b!493951))

(assert (= (and b!493951 res!296574) b!493949))

(assert (= (and b!493949 res!296578) b!493946))

(assert (= (and b!493946 res!296569) b!493948))

(assert (= (and b!493948 res!296572) b!493954))

(assert (= (and b!493954 res!296573) b!493950))

(assert (= (and b!493950 res!296570) b!493947))

(assert (= (and b!493947 (not res!296571)) b!493952))

(assert (= (and b!493952 (not res!296576)) b!493945))

(declare-fun m!475147 () Bool)

(assert (=> start!45014 m!475147))

(declare-fun m!475149 () Bool)

(assert (=> start!45014 m!475149))

(declare-fun m!475151 () Bool)

(assert (=> b!493951 m!475151))

(assert (=> b!493951 m!475151))

(declare-fun m!475153 () Bool)

(assert (=> b!493951 m!475153))

(declare-fun m!475155 () Bool)

(assert (=> b!493946 m!475155))

(declare-fun m!475157 () Bool)

(assert (=> b!493950 m!475157))

(declare-fun m!475159 () Bool)

(assert (=> b!493947 m!475159))

(declare-fun m!475161 () Bool)

(assert (=> b!493947 m!475161))

(declare-fun m!475163 () Bool)

(assert (=> b!493947 m!475163))

(assert (=> b!493947 m!475151))

(declare-fun m!475165 () Bool)

(assert (=> b!493947 m!475165))

(assert (=> b!493947 m!475151))

(declare-fun m!475167 () Bool)

(assert (=> b!493947 m!475167))

(assert (=> b!493947 m!475151))

(declare-fun m!475169 () Bool)

(assert (=> b!493947 m!475169))

(assert (=> b!493947 m!475151))

(declare-fun m!475171 () Bool)

(assert (=> b!493947 m!475171))

(assert (=> b!493947 m!475163))

(declare-fun m!475173 () Bool)

(assert (=> b!493947 m!475173))

(assert (=> b!493947 m!475163))

(declare-fun m!475175 () Bool)

(assert (=> b!493947 m!475175))

(declare-fun m!475177 () Bool)

(assert (=> b!493948 m!475177))

(declare-fun m!475179 () Bool)

(assert (=> b!493954 m!475179))

(declare-fun m!475181 () Bool)

(assert (=> b!493949 m!475181))

(check-sat (not b!493948) (not b!493951) (not b!493954) (not b!493950) (not start!45014) (not b!493949) (not b!493947) (not b!493946))
(check-sat)
