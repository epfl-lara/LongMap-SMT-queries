; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46720 () Bool)

(assert start!46720)

(declare-fun b!515743 () Bool)

(declare-fun res!315307 () Bool)

(declare-fun e!301087 () Bool)

(assert (=> b!515743 (=> (not res!315307) (not e!301087))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515743 (= res!315307 (validKeyInArray!0 k!2280))))

(declare-fun b!515744 () Bool)

(declare-fun e!301086 () Bool)

(assert (=> b!515744 (= e!301087 e!301086)))

(declare-fun res!315315 () Bool)

(assert (=> b!515744 (=> (not res!315315) (not e!301086))))

(declare-datatypes ((SeekEntryResult!4351 0))(
  ( (MissingZero!4351 (index!19592 (_ BitVec 32))) (Found!4351 (index!19593 (_ BitVec 32))) (Intermediate!4351 (undefined!5163 Bool) (index!19594 (_ BitVec 32)) (x!48554 (_ BitVec 32))) (Undefined!4351) (MissingVacant!4351 (index!19595 (_ BitVec 32))) )
))
(declare-fun lt!236103 () SeekEntryResult!4351)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!515744 (= res!315315 (or (= lt!236103 (MissingZero!4351 i!1204)) (= lt!236103 (MissingVacant!4351 i!1204))))))

(declare-datatypes ((array!33032 0))(
  ( (array!33033 (arr!15884 (Array (_ BitVec 32) (_ BitVec 64))) (size!16248 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33032)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33032 (_ BitVec 32)) SeekEntryResult!4351)

(assert (=> b!515744 (= lt!236103 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun e!301085 () Bool)

(declare-fun b!515745 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!515745 (= e!301085 (= (seekEntryOrOpen!0 (select (arr!15884 a!3235) j!176) a!3235 mask!3524) (Found!4351 j!176)))))

(declare-fun b!515746 () Bool)

(declare-fun e!301089 () Bool)

(assert (=> b!515746 (= e!301086 (not e!301089))))

(declare-fun res!315316 () Bool)

(assert (=> b!515746 (=> res!315316 e!301089)))

(declare-fun lt!236102 () SeekEntryResult!4351)

(declare-fun lt!236104 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33032 (_ BitVec 32)) SeekEntryResult!4351)

(assert (=> b!515746 (= res!315316 (= lt!236102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236104 (select (store (arr!15884 a!3235) i!1204 k!2280) j!176) (array!33033 (store (arr!15884 a!3235) i!1204 k!2280) (size!16248 a!3235)) mask!3524)))))

(declare-fun lt!236101 () (_ BitVec 32))

(assert (=> b!515746 (= lt!236102 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236101 (select (arr!15884 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515746 (= lt!236104 (toIndex!0 (select (store (arr!15884 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515746 (= lt!236101 (toIndex!0 (select (arr!15884 a!3235) j!176) mask!3524))))

(assert (=> b!515746 e!301085))

(declare-fun res!315313 () Bool)

(assert (=> b!515746 (=> (not res!315313) (not e!301085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33032 (_ BitVec 32)) Bool)

(assert (=> b!515746 (= res!315313 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15960 0))(
  ( (Unit!15961) )
))
(declare-fun lt!236100 () Unit!15960)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15960)

(assert (=> b!515746 (= lt!236100 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515747 () Bool)

(declare-fun res!315310 () Bool)

(assert (=> b!515747 (=> res!315310 e!301089)))

(assert (=> b!515747 (= res!315310 (or (undefined!5163 lt!236102) (not (is-Intermediate!4351 lt!236102))))))

(declare-fun b!515748 () Bool)

(declare-fun res!315309 () Bool)

(assert (=> b!515748 (=> (not res!315309) (not e!301086))))

(declare-datatypes ((List!10042 0))(
  ( (Nil!10039) (Cons!10038 (h!10936 (_ BitVec 64)) (t!16270 List!10042)) )
))
(declare-fun arrayNoDuplicates!0 (array!33032 (_ BitVec 32) List!10042) Bool)

(assert (=> b!515748 (= res!315309 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10039))))

(declare-fun b!515749 () Bool)

(declare-fun res!315312 () Bool)

(assert (=> b!515749 (=> (not res!315312) (not e!301087))))

(declare-fun arrayContainsKey!0 (array!33032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515749 (= res!315312 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515750 () Bool)

(declare-fun res!315317 () Bool)

(assert (=> b!515750 (=> (not res!315317) (not e!301087))))

(assert (=> b!515750 (= res!315317 (validKeyInArray!0 (select (arr!15884 a!3235) j!176)))))

(declare-fun b!515751 () Bool)

(declare-fun res!315314 () Bool)

(assert (=> b!515751 (=> (not res!315314) (not e!301087))))

(assert (=> b!515751 (= res!315314 (and (= (size!16248 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16248 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16248 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515752 () Bool)

(assert (=> b!515752 (= e!301089 true)))

(assert (=> b!515752 (and (bvslt (x!48554 lt!236102) #b01111111111111111111111111111110) (or (= (select (arr!15884 a!3235) (index!19594 lt!236102)) (select (arr!15884 a!3235) j!176)) (= (select (arr!15884 a!3235) (index!19594 lt!236102)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15884 a!3235) (index!19594 lt!236102)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!515753 () Bool)

(declare-fun res!315311 () Bool)

(assert (=> b!515753 (=> (not res!315311) (not e!301086))))

(assert (=> b!515753 (= res!315311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!315308 () Bool)

(assert (=> start!46720 (=> (not res!315308) (not e!301087))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46720 (= res!315308 (validMask!0 mask!3524))))

(assert (=> start!46720 e!301087))

(assert (=> start!46720 true))

(declare-fun array_inv!11680 (array!33032) Bool)

(assert (=> start!46720 (array_inv!11680 a!3235)))

(assert (= (and start!46720 res!315308) b!515751))

(assert (= (and b!515751 res!315314) b!515750))

(assert (= (and b!515750 res!315317) b!515743))

(assert (= (and b!515743 res!315307) b!515749))

(assert (= (and b!515749 res!315312) b!515744))

(assert (= (and b!515744 res!315315) b!515753))

(assert (= (and b!515753 res!315311) b!515748))

(assert (= (and b!515748 res!315309) b!515746))

(assert (= (and b!515746 res!315313) b!515745))

(assert (= (and b!515746 (not res!315316)) b!515747))

(assert (= (and b!515747 (not res!315310)) b!515752))

(declare-fun m!497125 () Bool)

(assert (=> b!515749 m!497125))

(declare-fun m!497127 () Bool)

(assert (=> b!515744 m!497127))

(declare-fun m!497129 () Bool)

(assert (=> b!515748 m!497129))

(declare-fun m!497131 () Bool)

(assert (=> b!515745 m!497131))

(assert (=> b!515745 m!497131))

(declare-fun m!497133 () Bool)

(assert (=> b!515745 m!497133))

(assert (=> b!515750 m!497131))

(assert (=> b!515750 m!497131))

(declare-fun m!497135 () Bool)

(assert (=> b!515750 m!497135))

(declare-fun m!497137 () Bool)

(assert (=> b!515753 m!497137))

(declare-fun m!497139 () Bool)

(assert (=> b!515752 m!497139))

(assert (=> b!515752 m!497131))

(declare-fun m!497141 () Bool)

(assert (=> b!515743 m!497141))

(declare-fun m!497143 () Bool)

(assert (=> b!515746 m!497143))

(declare-fun m!497145 () Bool)

(assert (=> b!515746 m!497145))

(declare-fun m!497147 () Bool)

(assert (=> b!515746 m!497147))

(assert (=> b!515746 m!497131))

(declare-fun m!497149 () Bool)

(assert (=> b!515746 m!497149))

(assert (=> b!515746 m!497131))

(declare-fun m!497151 () Bool)

(assert (=> b!515746 m!497151))

(assert (=> b!515746 m!497131))

(declare-fun m!497153 () Bool)

(assert (=> b!515746 m!497153))

(assert (=> b!515746 m!497147))

(declare-fun m!497155 () Bool)

(assert (=> b!515746 m!497155))

(assert (=> b!515746 m!497147))

(declare-fun m!497157 () Bool)

(assert (=> b!515746 m!497157))

(declare-fun m!497159 () Bool)

(assert (=> start!46720 m!497159))

(declare-fun m!497161 () Bool)

(assert (=> start!46720 m!497161))

(push 1)

