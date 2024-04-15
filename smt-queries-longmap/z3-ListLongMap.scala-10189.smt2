; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120056 () Bool)

(assert start!120056)

(declare-fun b!1397690 () Bool)

(declare-fun res!936661 () Bool)

(declare-fun e!791278 () Bool)

(assert (=> b!1397690 (=> (not res!936661) (not e!791278))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95538 0))(
  ( (array!95539 (arr!46123 (Array (_ BitVec 32) (_ BitVec 64))) (size!46675 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95538)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1397690 (= res!936661 (and (= (size!46675 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46675 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46675 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397691 () Bool)

(declare-fun res!936659 () Bool)

(assert (=> b!1397691 (=> (not res!936659) (not e!791278))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397691 (= res!936659 (validKeyInArray!0 (select (arr!46123 a!2901) j!112)))))

(declare-fun b!1397692 () Bool)

(declare-fun res!936660 () Bool)

(assert (=> b!1397692 (=> (not res!936660) (not e!791278))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95538 (_ BitVec 32)) Bool)

(assert (=> b!1397692 (= res!936660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397693 () Bool)

(declare-fun e!791276 () Bool)

(declare-fun e!791279 () Bool)

(assert (=> b!1397693 (= e!791276 e!791279)))

(declare-fun res!936653 () Bool)

(assert (=> b!1397693 (=> res!936653 e!791279)))

(declare-datatypes ((SeekEntryResult!10466 0))(
  ( (MissingZero!10466 (index!44235 (_ BitVec 32))) (Found!10466 (index!44236 (_ BitVec 32))) (Intermediate!10466 (undefined!11278 Bool) (index!44237 (_ BitVec 32)) (x!125885 (_ BitVec 32))) (Undefined!10466) (MissingVacant!10466 (index!44238 (_ BitVec 32))) )
))
(declare-fun lt!614276 () SeekEntryResult!10466)

(declare-fun lt!614271 () (_ BitVec 32))

(declare-fun lt!614273 () SeekEntryResult!10466)

(get-info :version)

(assert (=> b!1397693 (= res!936653 (or (= lt!614273 lt!614276) (not ((_ is Intermediate!10466) lt!614276)) (bvslt (x!125885 lt!614273) #b00000000000000000000000000000000) (bvsgt (x!125885 lt!614273) #b01111111111111111111111111111110) (bvslt lt!614271 #b00000000000000000000000000000000) (bvsge lt!614271 (size!46675 a!2901)) (bvslt (index!44237 lt!614273) #b00000000000000000000000000000000) (bvsge (index!44237 lt!614273) (size!46675 a!2901)) (not (= lt!614273 (Intermediate!10466 false (index!44237 lt!614273) (x!125885 lt!614273)))) (not (= lt!614276 (Intermediate!10466 (undefined!11278 lt!614276) (index!44237 lt!614276) (x!125885 lt!614276))))))))

(declare-fun lt!614272 () (_ BitVec 64))

(declare-fun lt!614274 () array!95538)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95538 (_ BitVec 32)) SeekEntryResult!10466)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397693 (= lt!614276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614272 mask!2840) lt!614272 lt!614274 mask!2840))))

(assert (=> b!1397693 (= lt!614272 (select (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397693 (= lt!614274 (array!95539 (store (arr!46123 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46675 a!2901)))))

(declare-fun b!1397694 () Bool)

(declare-fun res!936658 () Bool)

(assert (=> b!1397694 (=> (not res!936658) (not e!791278))))

(assert (=> b!1397694 (= res!936658 (validKeyInArray!0 (select (arr!46123 a!2901) i!1037)))))

(declare-fun b!1397695 () Bool)

(assert (=> b!1397695 (= e!791279 true)))

(declare-fun lt!614270 () SeekEntryResult!10466)

(assert (=> b!1397695 (= lt!614270 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614271 lt!614272 lt!614274 mask!2840))))

(declare-fun b!1397689 () Bool)

(declare-fun e!791277 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95538 (_ BitVec 32)) SeekEntryResult!10466)

(assert (=> b!1397689 (= e!791277 (= (seekEntryOrOpen!0 (select (arr!46123 a!2901) j!112) a!2901 mask!2840) (Found!10466 j!112)))))

(declare-fun res!936657 () Bool)

(assert (=> start!120056 (=> (not res!936657) (not e!791278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120056 (= res!936657 (validMask!0 mask!2840))))

(assert (=> start!120056 e!791278))

(assert (=> start!120056 true))

(declare-fun array_inv!35356 (array!95538) Bool)

(assert (=> start!120056 (array_inv!35356 a!2901)))

(declare-fun b!1397696 () Bool)

(assert (=> b!1397696 (= e!791278 (not e!791276))))

(declare-fun res!936656 () Bool)

(assert (=> b!1397696 (=> res!936656 e!791276)))

(assert (=> b!1397696 (= res!936656 (or (not ((_ is Intermediate!10466) lt!614273)) (undefined!11278 lt!614273)))))

(assert (=> b!1397696 e!791277))

(declare-fun res!936655 () Bool)

(assert (=> b!1397696 (=> (not res!936655) (not e!791277))))

(assert (=> b!1397696 (= res!936655 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46779 0))(
  ( (Unit!46780) )
))
(declare-fun lt!614275 () Unit!46779)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95538 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46779)

(assert (=> b!1397696 (= lt!614275 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1397696 (= lt!614273 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614271 (select (arr!46123 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1397696 (= lt!614271 (toIndex!0 (select (arr!46123 a!2901) j!112) mask!2840))))

(declare-fun b!1397697 () Bool)

(declare-fun res!936654 () Bool)

(assert (=> b!1397697 (=> (not res!936654) (not e!791278))))

(declare-datatypes ((List!32720 0))(
  ( (Nil!32717) (Cons!32716 (h!33958 (_ BitVec 64)) (t!47406 List!32720)) )
))
(declare-fun arrayNoDuplicates!0 (array!95538 (_ BitVec 32) List!32720) Bool)

(assert (=> b!1397697 (= res!936654 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32717))))

(assert (= (and start!120056 res!936657) b!1397690))

(assert (= (and b!1397690 res!936661) b!1397694))

(assert (= (and b!1397694 res!936658) b!1397691))

(assert (= (and b!1397691 res!936659) b!1397692))

(assert (= (and b!1397692 res!936660) b!1397697))

(assert (= (and b!1397697 res!936654) b!1397696))

(assert (= (and b!1397696 res!936655) b!1397689))

(assert (= (and b!1397696 (not res!936656)) b!1397693))

(assert (= (and b!1397693 (not res!936653)) b!1397695))

(declare-fun m!1284115 () Bool)

(assert (=> b!1397689 m!1284115))

(assert (=> b!1397689 m!1284115))

(declare-fun m!1284117 () Bool)

(assert (=> b!1397689 m!1284117))

(declare-fun m!1284119 () Bool)

(assert (=> b!1397692 m!1284119))

(assert (=> b!1397696 m!1284115))

(declare-fun m!1284121 () Bool)

(assert (=> b!1397696 m!1284121))

(assert (=> b!1397696 m!1284115))

(declare-fun m!1284123 () Bool)

(assert (=> b!1397696 m!1284123))

(assert (=> b!1397696 m!1284115))

(declare-fun m!1284125 () Bool)

(assert (=> b!1397696 m!1284125))

(declare-fun m!1284127 () Bool)

(assert (=> b!1397696 m!1284127))

(declare-fun m!1284129 () Bool)

(assert (=> b!1397697 m!1284129))

(declare-fun m!1284131 () Bool)

(assert (=> start!120056 m!1284131))

(declare-fun m!1284133 () Bool)

(assert (=> start!120056 m!1284133))

(declare-fun m!1284135 () Bool)

(assert (=> b!1397695 m!1284135))

(declare-fun m!1284137 () Bool)

(assert (=> b!1397693 m!1284137))

(assert (=> b!1397693 m!1284137))

(declare-fun m!1284139 () Bool)

(assert (=> b!1397693 m!1284139))

(declare-fun m!1284141 () Bool)

(assert (=> b!1397693 m!1284141))

(declare-fun m!1284143 () Bool)

(assert (=> b!1397693 m!1284143))

(declare-fun m!1284145 () Bool)

(assert (=> b!1397694 m!1284145))

(assert (=> b!1397694 m!1284145))

(declare-fun m!1284147 () Bool)

(assert (=> b!1397694 m!1284147))

(assert (=> b!1397691 m!1284115))

(assert (=> b!1397691 m!1284115))

(declare-fun m!1284149 () Bool)

(assert (=> b!1397691 m!1284149))

(check-sat (not b!1397694) (not b!1397696) (not b!1397693) (not b!1397691) (not b!1397695) (not b!1397697) (not b!1397692) (not b!1397689) (not start!120056))
(check-sat)
