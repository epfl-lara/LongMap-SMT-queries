; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46094 () Bool)

(assert start!46094)

(declare-fun b!510567 () Bool)

(declare-fun res!311417 () Bool)

(declare-fun e!298425 () Bool)

(assert (=> b!510567 (=> (not res!311417) (not e!298425))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32805 0))(
  ( (array!32806 (arr!15781 (Array (_ BitVec 32) (_ BitVec 64))) (size!16145 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32805)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510567 (= res!311417 (and (= (size!16145 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16145 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16145 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510568 () Bool)

(declare-fun res!311420 () Bool)

(assert (=> b!510568 (=> (not res!311420) (not e!298425))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32805 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510568 (= res!311420 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!311419 () Bool)

(assert (=> start!46094 (=> (not res!311419) (not e!298425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46094 (= res!311419 (validMask!0 mask!3524))))

(assert (=> start!46094 e!298425))

(assert (=> start!46094 true))

(declare-fun array_inv!11577 (array!32805) Bool)

(assert (=> start!46094 (array_inv!11577 a!3235)))

(declare-fun b!510569 () Bool)

(declare-fun res!311414 () Bool)

(assert (=> b!510569 (=> (not res!311414) (not e!298425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510569 (= res!311414 (validKeyInArray!0 k0!2280))))

(declare-fun b!510570 () Bool)

(declare-fun res!311415 () Bool)

(declare-fun e!298423 () Bool)

(assert (=> b!510570 (=> (not res!311415) (not e!298423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32805 (_ BitVec 32)) Bool)

(assert (=> b!510570 (= res!311415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510571 () Bool)

(assert (=> b!510571 (= e!298425 e!298423)))

(declare-fun res!311416 () Bool)

(assert (=> b!510571 (=> (not res!311416) (not e!298423))))

(declare-datatypes ((SeekEntryResult!4248 0))(
  ( (MissingZero!4248 (index!19180 (_ BitVec 32))) (Found!4248 (index!19181 (_ BitVec 32))) (Intermediate!4248 (undefined!5060 Bool) (index!19182 (_ BitVec 32)) (x!48137 (_ BitVec 32))) (Undefined!4248) (MissingVacant!4248 (index!19183 (_ BitVec 32))) )
))
(declare-fun lt!233471 () SeekEntryResult!4248)

(assert (=> b!510571 (= res!311416 (or (= lt!233471 (MissingZero!4248 i!1204)) (= lt!233471 (MissingVacant!4248 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32805 (_ BitVec 32)) SeekEntryResult!4248)

(assert (=> b!510571 (= lt!233471 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510572 () Bool)

(declare-fun e!298424 () Bool)

(assert (=> b!510572 (= e!298423 (not e!298424))))

(declare-fun res!311413 () Bool)

(assert (=> b!510572 (=> res!311413 e!298424)))

(declare-fun lt!233472 () array!32805)

(declare-fun lt!233470 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32805 (_ BitVec 32)) SeekEntryResult!4248)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510572 (= res!311413 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15781 a!3235) j!176) mask!3524) (select (arr!15781 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233470 mask!3524) lt!233470 lt!233472 mask!3524))))))

(assert (=> b!510572 (= lt!233470 (select (store (arr!15781 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510572 (= lt!233472 (array!32806 (store (arr!15781 a!3235) i!1204 k0!2280) (size!16145 a!3235)))))

(declare-fun lt!233473 () SeekEntryResult!4248)

(assert (=> b!510572 (= lt!233473 (Found!4248 j!176))))

(assert (=> b!510572 (= lt!233473 (seekEntryOrOpen!0 (select (arr!15781 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510572 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15754 0))(
  ( (Unit!15755) )
))
(declare-fun lt!233469 () Unit!15754)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15754)

(assert (=> b!510572 (= lt!233469 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510573 () Bool)

(declare-fun res!311418 () Bool)

(assert (=> b!510573 (=> (not res!311418) (not e!298423))))

(declare-datatypes ((List!9939 0))(
  ( (Nil!9936) (Cons!9935 (h!10812 (_ BitVec 64)) (t!16167 List!9939)) )
))
(declare-fun arrayNoDuplicates!0 (array!32805 (_ BitVec 32) List!9939) Bool)

(assert (=> b!510573 (= res!311418 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9936))))

(declare-fun b!510574 () Bool)

(declare-fun res!311412 () Bool)

(assert (=> b!510574 (=> (not res!311412) (not e!298425))))

(assert (=> b!510574 (= res!311412 (validKeyInArray!0 (select (arr!15781 a!3235) j!176)))))

(declare-fun b!510575 () Bool)

(assert (=> b!510575 (= e!298424 true)))

(assert (=> b!510575 (= lt!233473 (seekEntryOrOpen!0 lt!233470 lt!233472 mask!3524))))

(declare-fun lt!233468 () Unit!15754)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32805 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15754)

(assert (=> b!510575 (= lt!233468 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(assert (= (and start!46094 res!311419) b!510567))

(assert (= (and b!510567 res!311417) b!510574))

(assert (= (and b!510574 res!311412) b!510569))

(assert (= (and b!510569 res!311414) b!510568))

(assert (= (and b!510568 res!311420) b!510571))

(assert (= (and b!510571 res!311416) b!510570))

(assert (= (and b!510570 res!311415) b!510573))

(assert (= (and b!510573 res!311418) b!510572))

(assert (= (and b!510572 (not res!311413)) b!510575))

(declare-fun m!491893 () Bool)

(assert (=> b!510574 m!491893))

(assert (=> b!510574 m!491893))

(declare-fun m!491895 () Bool)

(assert (=> b!510574 m!491895))

(declare-fun m!491897 () Bool)

(assert (=> b!510568 m!491897))

(declare-fun m!491899 () Bool)

(assert (=> b!510575 m!491899))

(declare-fun m!491901 () Bool)

(assert (=> b!510575 m!491901))

(declare-fun m!491903 () Bool)

(assert (=> b!510571 m!491903))

(declare-fun m!491905 () Bool)

(assert (=> b!510573 m!491905))

(declare-fun m!491907 () Bool)

(assert (=> start!46094 m!491907))

(declare-fun m!491909 () Bool)

(assert (=> start!46094 m!491909))

(declare-fun m!491911 () Bool)

(assert (=> b!510572 m!491911))

(declare-fun m!491913 () Bool)

(assert (=> b!510572 m!491913))

(declare-fun m!491915 () Bool)

(assert (=> b!510572 m!491915))

(declare-fun m!491917 () Bool)

(assert (=> b!510572 m!491917))

(assert (=> b!510572 m!491893))

(declare-fun m!491919 () Bool)

(assert (=> b!510572 m!491919))

(declare-fun m!491921 () Bool)

(assert (=> b!510572 m!491921))

(declare-fun m!491923 () Bool)

(assert (=> b!510572 m!491923))

(assert (=> b!510572 m!491893))

(assert (=> b!510572 m!491917))

(assert (=> b!510572 m!491893))

(assert (=> b!510572 m!491921))

(declare-fun m!491925 () Bool)

(assert (=> b!510572 m!491925))

(assert (=> b!510572 m!491893))

(declare-fun m!491927 () Bool)

(assert (=> b!510572 m!491927))

(declare-fun m!491929 () Bool)

(assert (=> b!510569 m!491929))

(declare-fun m!491931 () Bool)

(assert (=> b!510570 m!491931))

(check-sat (not b!510572) (not b!510570) (not b!510574) (not b!510573) (not b!510568) (not start!46094) (not b!510575) (not b!510571) (not b!510569))
(check-sat)
