; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46106 () Bool)

(assert start!46106)

(declare-fun b!510729 () Bool)

(declare-fun res!311580 () Bool)

(declare-fun e!298494 () Bool)

(assert (=> b!510729 (=> (not res!311580) (not e!298494))))

(declare-datatypes ((array!32817 0))(
  ( (array!32818 (arr!15787 (Array (_ BitVec 32) (_ BitVec 64))) (size!16151 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32817)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32817 (_ BitVec 32)) Bool)

(assert (=> b!510729 (= res!311580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510730 () Bool)

(declare-fun res!311575 () Bool)

(declare-fun e!298497 () Bool)

(assert (=> b!510730 (=> (not res!311575) (not e!298497))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510730 (= res!311575 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510731 () Bool)

(assert (=> b!510731 (= e!298497 e!298494)))

(declare-fun res!311582 () Bool)

(assert (=> b!510731 (=> (not res!311582) (not e!298494))))

(declare-datatypes ((SeekEntryResult!4254 0))(
  ( (MissingZero!4254 (index!19204 (_ BitVec 32))) (Found!4254 (index!19205 (_ BitVec 32))) (Intermediate!4254 (undefined!5066 Bool) (index!19206 (_ BitVec 32)) (x!48159 (_ BitVec 32))) (Undefined!4254) (MissingVacant!4254 (index!19207 (_ BitVec 32))) )
))
(declare-fun lt!233578 () SeekEntryResult!4254)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!510731 (= res!311582 (or (= lt!233578 (MissingZero!4254 i!1204)) (= lt!233578 (MissingVacant!4254 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32817 (_ BitVec 32)) SeekEntryResult!4254)

(assert (=> b!510731 (= lt!233578 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510733 () Bool)

(declare-fun res!311576 () Bool)

(assert (=> b!510733 (=> (not res!311576) (not e!298497))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!510733 (= res!311576 (and (= (size!16151 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16151 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16151 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!510734 () Bool)

(declare-fun e!298495 () Bool)

(assert (=> b!510734 (= e!298495 true)))

(declare-fun lt!233581 () (_ BitVec 64))

(declare-fun lt!233579 () SeekEntryResult!4254)

(declare-fun lt!233576 () array!32817)

(assert (=> b!510734 (= lt!233579 (seekEntryOrOpen!0 lt!233581 lt!233576 mask!3524))))

(declare-datatypes ((Unit!15766 0))(
  ( (Unit!15767) )
))
(declare-fun lt!233577 () Unit!15766)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32817 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15766)

(assert (=> b!510734 (= lt!233577 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!510735 () Bool)

(declare-fun res!311581 () Bool)

(assert (=> b!510735 (=> (not res!311581) (not e!298497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510735 (= res!311581 (validKeyInArray!0 (select (arr!15787 a!3235) j!176)))))

(declare-fun b!510736 () Bool)

(assert (=> b!510736 (= e!298494 (not e!298495))))

(declare-fun res!311574 () Bool)

(assert (=> b!510736 (=> res!311574 e!298495)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32817 (_ BitVec 32)) SeekEntryResult!4254)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510736 (= res!311574 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15787 a!3235) j!176) mask!3524) (select (arr!15787 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!233581 mask!3524) lt!233581 lt!233576 mask!3524))))))

(assert (=> b!510736 (= lt!233581 (select (store (arr!15787 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!510736 (= lt!233576 (array!32818 (store (arr!15787 a!3235) i!1204 k0!2280) (size!16151 a!3235)))))

(assert (=> b!510736 (= lt!233579 (Found!4254 j!176))))

(assert (=> b!510736 (= lt!233579 (seekEntryOrOpen!0 (select (arr!15787 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!510736 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!233580 () Unit!15766)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15766)

(assert (=> b!510736 (= lt!233580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510737 () Bool)

(declare-fun res!311579 () Bool)

(assert (=> b!510737 (=> (not res!311579) (not e!298494))))

(declare-datatypes ((List!9945 0))(
  ( (Nil!9942) (Cons!9941 (h!10818 (_ BitVec 64)) (t!16173 List!9945)) )
))
(declare-fun arrayNoDuplicates!0 (array!32817 (_ BitVec 32) List!9945) Bool)

(assert (=> b!510737 (= res!311579 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9942))))

(declare-fun b!510732 () Bool)

(declare-fun res!311578 () Bool)

(assert (=> b!510732 (=> (not res!311578) (not e!298497))))

(assert (=> b!510732 (= res!311578 (validKeyInArray!0 k0!2280))))

(declare-fun res!311577 () Bool)

(assert (=> start!46106 (=> (not res!311577) (not e!298497))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46106 (= res!311577 (validMask!0 mask!3524))))

(assert (=> start!46106 e!298497))

(assert (=> start!46106 true))

(declare-fun array_inv!11583 (array!32817) Bool)

(assert (=> start!46106 (array_inv!11583 a!3235)))

(assert (= (and start!46106 res!311577) b!510733))

(assert (= (and b!510733 res!311576) b!510735))

(assert (= (and b!510735 res!311581) b!510732))

(assert (= (and b!510732 res!311578) b!510730))

(assert (= (and b!510730 res!311575) b!510731))

(assert (= (and b!510731 res!311582) b!510729))

(assert (= (and b!510729 res!311580) b!510737))

(assert (= (and b!510737 res!311579) b!510736))

(assert (= (and b!510736 (not res!311574)) b!510734))

(declare-fun m!492133 () Bool)

(assert (=> b!510735 m!492133))

(assert (=> b!510735 m!492133))

(declare-fun m!492135 () Bool)

(assert (=> b!510735 m!492135))

(declare-fun m!492137 () Bool)

(assert (=> b!510730 m!492137))

(declare-fun m!492139 () Bool)

(assert (=> b!510734 m!492139))

(declare-fun m!492141 () Bool)

(assert (=> b!510734 m!492141))

(declare-fun m!492143 () Bool)

(assert (=> b!510731 m!492143))

(declare-fun m!492145 () Bool)

(assert (=> b!510737 m!492145))

(declare-fun m!492147 () Bool)

(assert (=> start!46106 m!492147))

(declare-fun m!492149 () Bool)

(assert (=> start!46106 m!492149))

(declare-fun m!492151 () Bool)

(assert (=> b!510729 m!492151))

(declare-fun m!492153 () Bool)

(assert (=> b!510736 m!492153))

(declare-fun m!492155 () Bool)

(assert (=> b!510736 m!492155))

(declare-fun m!492157 () Bool)

(assert (=> b!510736 m!492157))

(declare-fun m!492159 () Bool)

(assert (=> b!510736 m!492159))

(declare-fun m!492161 () Bool)

(assert (=> b!510736 m!492161))

(assert (=> b!510736 m!492133))

(declare-fun m!492163 () Bool)

(assert (=> b!510736 m!492163))

(assert (=> b!510736 m!492159))

(declare-fun m!492165 () Bool)

(assert (=> b!510736 m!492165))

(assert (=> b!510736 m!492133))

(assert (=> b!510736 m!492161))

(assert (=> b!510736 m!492133))

(declare-fun m!492167 () Bool)

(assert (=> b!510736 m!492167))

(assert (=> b!510736 m!492133))

(declare-fun m!492169 () Bool)

(assert (=> b!510736 m!492169))

(declare-fun m!492171 () Bool)

(assert (=> b!510732 m!492171))

(check-sat (not b!510734) (not b!510735) (not b!510729) (not b!510736) (not b!510737) (not b!510732) (not start!46106) (not b!510730) (not b!510731))
(check-sat)
