; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120554 () Bool)

(assert start!120554)

(declare-fun b!1402187 () Bool)

(declare-fun e!794023 () Bool)

(assert (=> b!1402187 (= e!794023 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10511 0))(
  ( (MissingZero!10511 (index!44421 (_ BitVec 32))) (Found!10511 (index!44422 (_ BitVec 32))) (Intermediate!10511 (undefined!11323 Bool) (index!44423 (_ BitVec 32)) (x!126213 (_ BitVec 32))) (Undefined!10511) (MissingVacant!10511 (index!44424 (_ BitVec 32))) )
))
(declare-fun lt!617046 () SeekEntryResult!10511)

(declare-datatypes ((array!95885 0))(
  ( (array!95886 (arr!46291 (Array (_ BitVec 32) (_ BitVec 64))) (size!46842 (_ BitVec 32))) )
))
(declare-fun lt!617050 () array!95885)

(declare-fun lt!617049 () (_ BitVec 32))

(declare-fun lt!617048 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95885 (_ BitVec 32)) SeekEntryResult!10511)

(assert (=> b!1402187 (= lt!617046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617049 lt!617048 lt!617050 mask!2840))))

(declare-fun b!1402188 () Bool)

(declare-fun res!940021 () Bool)

(declare-fun e!794021 () Bool)

(assert (=> b!1402188 (=> (not res!940021) (not e!794021))))

(declare-fun a!2901 () array!95885)

(declare-datatypes ((List!32797 0))(
  ( (Nil!32794) (Cons!32793 (h!34049 (_ BitVec 64)) (t!47483 List!32797)) )
))
(declare-fun arrayNoDuplicates!0 (array!95885 (_ BitVec 32) List!32797) Bool)

(assert (=> b!1402188 (= res!940021 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32794))))

(declare-fun b!1402189 () Bool)

(declare-fun e!794024 () Bool)

(assert (=> b!1402189 (= e!794024 e!794023)))

(declare-fun res!940015 () Bool)

(assert (=> b!1402189 (=> res!940015 e!794023)))

(declare-fun lt!617045 () SeekEntryResult!10511)

(declare-fun lt!617044 () SeekEntryResult!10511)

(assert (=> b!1402189 (= res!940015 (or (bvslt (x!126213 lt!617044) #b00000000000000000000000000000000) (bvsgt (x!126213 lt!617044) #b01111111111111111111111111111110) (bvslt (x!126213 lt!617045) #b00000000000000000000000000000000) (bvsgt (x!126213 lt!617045) #b01111111111111111111111111111110) (bvslt lt!617049 #b00000000000000000000000000000000) (bvsge lt!617049 (size!46842 a!2901)) (bvslt (index!44423 lt!617044) #b00000000000000000000000000000000) (bvsge (index!44423 lt!617044) (size!46842 a!2901)) (bvslt (index!44423 lt!617045) #b00000000000000000000000000000000) (bvsge (index!44423 lt!617045) (size!46842 a!2901)) (not (= lt!617044 (Intermediate!10511 false (index!44423 lt!617044) (x!126213 lt!617044)))) (not (= lt!617045 (Intermediate!10511 false (index!44423 lt!617045) (x!126213 lt!617045))))))))

(declare-fun e!794022 () Bool)

(assert (=> b!1402189 e!794022))

(declare-fun res!940017 () Bool)

(assert (=> b!1402189 (=> (not res!940017) (not e!794022))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402189 (= res!940017 (and (not (undefined!11323 lt!617045)) (= (index!44423 lt!617045) i!1037) (bvslt (x!126213 lt!617045) (x!126213 lt!617044)) (= (select (store (arr!46291 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44423 lt!617045)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47053 0))(
  ( (Unit!47054) )
))
(declare-fun lt!617051 () Unit!47053)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47053)

(assert (=> b!1402189 (= lt!617051 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617049 (x!126213 lt!617044) (index!44423 lt!617044) (x!126213 lt!617045) (index!44423 lt!617045) (undefined!11323 lt!617045) mask!2840))))

(declare-fun b!1402190 () Bool)

(declare-fun e!794026 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95885 (_ BitVec 32)) SeekEntryResult!10511)

(assert (=> b!1402190 (= e!794026 (= (seekEntryOrOpen!0 (select (arr!46291 a!2901) j!112) a!2901 mask!2840) (Found!10511 j!112)))))

(declare-fun b!1402191 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95885 (_ BitVec 32)) SeekEntryResult!10511)

(assert (=> b!1402191 (= e!794022 (= (seekEntryOrOpen!0 lt!617048 lt!617050 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126213 lt!617045) (index!44423 lt!617045) (index!44423 lt!617045) (select (arr!46291 a!2901) j!112) lt!617050 mask!2840)))))

(declare-fun res!940020 () Bool)

(assert (=> start!120554 (=> (not res!940020) (not e!794021))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120554 (= res!940020 (validMask!0 mask!2840))))

(assert (=> start!120554 e!794021))

(assert (=> start!120554 true))

(declare-fun array_inv!35572 (array!95885) Bool)

(assert (=> start!120554 (array_inv!35572 a!2901)))

(declare-fun b!1402192 () Bool)

(declare-fun res!940019 () Bool)

(assert (=> b!1402192 (=> (not res!940019) (not e!794021))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95885 (_ BitVec 32)) Bool)

(assert (=> b!1402192 (= res!940019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402193 () Bool)

(declare-fun res!940023 () Bool)

(assert (=> b!1402193 (=> (not res!940023) (not e!794021))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402193 (= res!940023 (validKeyInArray!0 (select (arr!46291 a!2901) j!112)))))

(declare-fun b!1402194 () Bool)

(declare-fun res!940018 () Bool)

(assert (=> b!1402194 (=> (not res!940018) (not e!794021))))

(assert (=> b!1402194 (= res!940018 (validKeyInArray!0 (select (arr!46291 a!2901) i!1037)))))

(declare-fun b!1402195 () Bool)

(declare-fun e!794025 () Bool)

(assert (=> b!1402195 (= e!794025 e!794024)))

(declare-fun res!940016 () Bool)

(assert (=> b!1402195 (=> res!940016 e!794024)))

(get-info :version)

(assert (=> b!1402195 (= res!940016 (or (= lt!617044 lt!617045) (not ((_ is Intermediate!10511) lt!617045))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402195 (= lt!617045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617048 mask!2840) lt!617048 lt!617050 mask!2840))))

(assert (=> b!1402195 (= lt!617048 (select (store (arr!46291 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402195 (= lt!617050 (array!95886 (store (arr!46291 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46842 a!2901)))))

(declare-fun b!1402196 () Bool)

(assert (=> b!1402196 (= e!794021 (not e!794025))))

(declare-fun res!940022 () Bool)

(assert (=> b!1402196 (=> res!940022 e!794025)))

(assert (=> b!1402196 (= res!940022 (or (not ((_ is Intermediate!10511) lt!617044)) (undefined!11323 lt!617044)))))

(assert (=> b!1402196 e!794026))

(declare-fun res!940014 () Bool)

(assert (=> b!1402196 (=> (not res!940014) (not e!794026))))

(assert (=> b!1402196 (= res!940014 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617047 () Unit!47053)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95885 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47053)

(assert (=> b!1402196 (= lt!617047 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402196 (= lt!617044 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617049 (select (arr!46291 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402196 (= lt!617049 (toIndex!0 (select (arr!46291 a!2901) j!112) mask!2840))))

(declare-fun b!1402197 () Bool)

(declare-fun res!940024 () Bool)

(assert (=> b!1402197 (=> (not res!940024) (not e!794021))))

(assert (=> b!1402197 (= res!940024 (and (= (size!46842 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46842 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46842 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120554 res!940020) b!1402197))

(assert (= (and b!1402197 res!940024) b!1402194))

(assert (= (and b!1402194 res!940018) b!1402193))

(assert (= (and b!1402193 res!940023) b!1402192))

(assert (= (and b!1402192 res!940019) b!1402188))

(assert (= (and b!1402188 res!940021) b!1402196))

(assert (= (and b!1402196 res!940014) b!1402190))

(assert (= (and b!1402196 (not res!940022)) b!1402195))

(assert (= (and b!1402195 (not res!940016)) b!1402189))

(assert (= (and b!1402189 res!940017) b!1402191))

(assert (= (and b!1402189 (not res!940015)) b!1402187))

(declare-fun m!1290073 () Bool)

(assert (=> b!1402190 m!1290073))

(assert (=> b!1402190 m!1290073))

(declare-fun m!1290075 () Bool)

(assert (=> b!1402190 m!1290075))

(declare-fun m!1290077 () Bool)

(assert (=> b!1402188 m!1290077))

(declare-fun m!1290079 () Bool)

(assert (=> b!1402187 m!1290079))

(declare-fun m!1290081 () Bool)

(assert (=> b!1402195 m!1290081))

(assert (=> b!1402195 m!1290081))

(declare-fun m!1290083 () Bool)

(assert (=> b!1402195 m!1290083))

(declare-fun m!1290085 () Bool)

(assert (=> b!1402195 m!1290085))

(declare-fun m!1290087 () Bool)

(assert (=> b!1402195 m!1290087))

(assert (=> b!1402193 m!1290073))

(assert (=> b!1402193 m!1290073))

(declare-fun m!1290089 () Bool)

(assert (=> b!1402193 m!1290089))

(declare-fun m!1290091 () Bool)

(assert (=> start!120554 m!1290091))

(declare-fun m!1290093 () Bool)

(assert (=> start!120554 m!1290093))

(declare-fun m!1290095 () Bool)

(assert (=> b!1402194 m!1290095))

(assert (=> b!1402194 m!1290095))

(declare-fun m!1290097 () Bool)

(assert (=> b!1402194 m!1290097))

(declare-fun m!1290099 () Bool)

(assert (=> b!1402192 m!1290099))

(assert (=> b!1402196 m!1290073))

(declare-fun m!1290101 () Bool)

(assert (=> b!1402196 m!1290101))

(assert (=> b!1402196 m!1290073))

(declare-fun m!1290103 () Bool)

(assert (=> b!1402196 m!1290103))

(assert (=> b!1402196 m!1290073))

(declare-fun m!1290105 () Bool)

(assert (=> b!1402196 m!1290105))

(declare-fun m!1290107 () Bool)

(assert (=> b!1402196 m!1290107))

(assert (=> b!1402189 m!1290085))

(declare-fun m!1290109 () Bool)

(assert (=> b!1402189 m!1290109))

(declare-fun m!1290111 () Bool)

(assert (=> b!1402189 m!1290111))

(declare-fun m!1290113 () Bool)

(assert (=> b!1402191 m!1290113))

(assert (=> b!1402191 m!1290073))

(assert (=> b!1402191 m!1290073))

(declare-fun m!1290115 () Bool)

(assert (=> b!1402191 m!1290115))

(check-sat (not start!120554) (not b!1402194) (not b!1402187) (not b!1402193) (not b!1402190) (not b!1402195) (not b!1402191) (not b!1402196) (not b!1402192) (not b!1402189) (not b!1402188))
(check-sat)
