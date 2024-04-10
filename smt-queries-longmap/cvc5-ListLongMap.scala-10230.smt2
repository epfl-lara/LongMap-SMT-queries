; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120432 () Bool)

(assert start!120432)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95841 0))(
  ( (array!95842 (arr!46271 (Array (_ BitVec 32) (_ BitVec 64))) (size!46821 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95841)

(declare-fun lt!617438 () (_ BitVec 64))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1402136 () Bool)

(declare-datatypes ((SeekEntryResult!10588 0))(
  ( (MissingZero!10588 (index!44729 (_ BitVec 32))) (Found!10588 (index!44730 (_ BitVec 32))) (Intermediate!10588 (undefined!11400 Bool) (index!44731 (_ BitVec 32)) (x!126359 (_ BitVec 32))) (Undefined!10588) (MissingVacant!10588 (index!44732 (_ BitVec 32))) )
))
(declare-fun lt!617443 () SeekEntryResult!10588)

(declare-fun lt!617442 () array!95841)

(declare-fun e!793977 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95841 (_ BitVec 32)) SeekEntryResult!10588)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95841 (_ BitVec 32)) SeekEntryResult!10588)

(assert (=> b!1402136 (= e!793977 (= (seekEntryOrOpen!0 lt!617438 lt!617442 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126359 lt!617443) (index!44731 lt!617443) (index!44731 lt!617443) (select (arr!46271 a!2901) j!112) lt!617442 mask!2840)))))

(declare-fun b!1402137 () Bool)

(declare-fun e!793979 () Bool)

(declare-fun e!793981 () Bool)

(assert (=> b!1402137 (= e!793979 e!793981)))

(declare-fun res!940654 () Bool)

(assert (=> b!1402137 (=> res!940654 e!793981)))

(declare-fun lt!617441 () SeekEntryResult!10588)

(declare-fun lt!617445 () (_ BitVec 32))

(assert (=> b!1402137 (= res!940654 (or (bvslt (x!126359 lt!617441) #b00000000000000000000000000000000) (bvsgt (x!126359 lt!617441) #b01111111111111111111111111111110) (bvslt (x!126359 lt!617443) #b00000000000000000000000000000000) (bvsgt (x!126359 lt!617443) #b01111111111111111111111111111110) (bvslt lt!617445 #b00000000000000000000000000000000) (bvsge lt!617445 (size!46821 a!2901)) (bvslt (index!44731 lt!617441) #b00000000000000000000000000000000) (bvsge (index!44731 lt!617441) (size!46821 a!2901)) (bvslt (index!44731 lt!617443) #b00000000000000000000000000000000) (bvsge (index!44731 lt!617443) (size!46821 a!2901)) (not (= lt!617441 (Intermediate!10588 false (index!44731 lt!617441) (x!126359 lt!617441)))) (not (= lt!617443 (Intermediate!10588 false (index!44731 lt!617443) (x!126359 lt!617443))))))))

(assert (=> b!1402137 e!793977))

(declare-fun res!940651 () Bool)

(assert (=> b!1402137 (=> (not res!940651) (not e!793977))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402137 (= res!940651 (and (not (undefined!11400 lt!617443)) (= (index!44731 lt!617443) i!1037) (bvslt (x!126359 lt!617443) (x!126359 lt!617441)) (= (select (store (arr!46271 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44731 lt!617443)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47180 0))(
  ( (Unit!47181) )
))
(declare-fun lt!617440 () Unit!47180)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47180)

(assert (=> b!1402137 (= lt!617440 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617445 (x!126359 lt!617441) (index!44731 lt!617441) (x!126359 lt!617443) (index!44731 lt!617443) (undefined!11400 lt!617443) mask!2840))))

(declare-fun res!940656 () Bool)

(declare-fun e!793980 () Bool)

(assert (=> start!120432 (=> (not res!940656) (not e!793980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120432 (= res!940656 (validMask!0 mask!2840))))

(assert (=> start!120432 e!793980))

(assert (=> start!120432 true))

(declare-fun array_inv!35299 (array!95841) Bool)

(assert (=> start!120432 (array_inv!35299 a!2901)))

(declare-fun b!1402138 () Bool)

(declare-fun e!793978 () Bool)

(assert (=> b!1402138 (= e!793980 (not e!793978))))

(declare-fun res!940657 () Bool)

(assert (=> b!1402138 (=> res!940657 e!793978)))

(assert (=> b!1402138 (= res!940657 (or (not (is-Intermediate!10588 lt!617441)) (undefined!11400 lt!617441)))))

(declare-fun e!793982 () Bool)

(assert (=> b!1402138 e!793982))

(declare-fun res!940655 () Bool)

(assert (=> b!1402138 (=> (not res!940655) (not e!793982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95841 (_ BitVec 32)) Bool)

(assert (=> b!1402138 (= res!940655 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617444 () Unit!47180)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95841 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47180)

(assert (=> b!1402138 (= lt!617444 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95841 (_ BitVec 32)) SeekEntryResult!10588)

(assert (=> b!1402138 (= lt!617441 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617445 (select (arr!46271 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402138 (= lt!617445 (toIndex!0 (select (arr!46271 a!2901) j!112) mask!2840))))

(declare-fun b!1402139 () Bool)

(declare-fun res!940647 () Bool)

(assert (=> b!1402139 (=> (not res!940647) (not e!793980))))

(declare-datatypes ((List!32790 0))(
  ( (Nil!32787) (Cons!32786 (h!34034 (_ BitVec 64)) (t!47484 List!32790)) )
))
(declare-fun arrayNoDuplicates!0 (array!95841 (_ BitVec 32) List!32790) Bool)

(assert (=> b!1402139 (= res!940647 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32787))))

(declare-fun b!1402140 () Bool)

(assert (=> b!1402140 (= e!793978 e!793979)))

(declare-fun res!940650 () Bool)

(assert (=> b!1402140 (=> res!940650 e!793979)))

(assert (=> b!1402140 (= res!940650 (or (= lt!617441 lt!617443) (not (is-Intermediate!10588 lt!617443))))))

(assert (=> b!1402140 (= lt!617443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617438 mask!2840) lt!617438 lt!617442 mask!2840))))

(assert (=> b!1402140 (= lt!617438 (select (store (arr!46271 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402140 (= lt!617442 (array!95842 (store (arr!46271 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46821 a!2901)))))

(declare-fun b!1402141 () Bool)

(declare-fun res!940653 () Bool)

(assert (=> b!1402141 (=> (not res!940653) (not e!793980))))

(assert (=> b!1402141 (= res!940653 (and (= (size!46821 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46821 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46821 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402142 () Bool)

(declare-fun res!940652 () Bool)

(assert (=> b!1402142 (=> (not res!940652) (not e!793980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402142 (= res!940652 (validKeyInArray!0 (select (arr!46271 a!2901) j!112)))))

(declare-fun b!1402143 () Bool)

(declare-fun res!940649 () Bool)

(assert (=> b!1402143 (=> (not res!940649) (not e!793980))))

(assert (=> b!1402143 (= res!940649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402144 () Bool)

(assert (=> b!1402144 (= e!793982 (= (seekEntryOrOpen!0 (select (arr!46271 a!2901) j!112) a!2901 mask!2840) (Found!10588 j!112)))))

(declare-fun b!1402145 () Bool)

(assert (=> b!1402145 (= e!793981 true)))

(declare-fun lt!617439 () SeekEntryResult!10588)

(assert (=> b!1402145 (= lt!617439 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617445 lt!617438 lt!617442 mask!2840))))

(declare-fun b!1402146 () Bool)

(declare-fun res!940648 () Bool)

(assert (=> b!1402146 (=> (not res!940648) (not e!793980))))

(assert (=> b!1402146 (= res!940648 (validKeyInArray!0 (select (arr!46271 a!2901) i!1037)))))

(assert (= (and start!120432 res!940656) b!1402141))

(assert (= (and b!1402141 res!940653) b!1402146))

(assert (= (and b!1402146 res!940648) b!1402142))

(assert (= (and b!1402142 res!940652) b!1402143))

(assert (= (and b!1402143 res!940649) b!1402139))

(assert (= (and b!1402139 res!940647) b!1402138))

(assert (= (and b!1402138 res!940655) b!1402144))

(assert (= (and b!1402138 (not res!940657)) b!1402140))

(assert (= (and b!1402140 (not res!940650)) b!1402137))

(assert (= (and b!1402137 res!940651) b!1402136))

(assert (= (and b!1402137 (not res!940654)) b!1402145))

(declare-fun m!1290153 () Bool)

(assert (=> b!1402145 m!1290153))

(declare-fun m!1290155 () Bool)

(assert (=> b!1402142 m!1290155))

(assert (=> b!1402142 m!1290155))

(declare-fun m!1290157 () Bool)

(assert (=> b!1402142 m!1290157))

(declare-fun m!1290159 () Bool)

(assert (=> b!1402139 m!1290159))

(declare-fun m!1290161 () Bool)

(assert (=> b!1402137 m!1290161))

(declare-fun m!1290163 () Bool)

(assert (=> b!1402137 m!1290163))

(declare-fun m!1290165 () Bool)

(assert (=> b!1402137 m!1290165))

(declare-fun m!1290167 () Bool)

(assert (=> b!1402143 m!1290167))

(assert (=> b!1402144 m!1290155))

(assert (=> b!1402144 m!1290155))

(declare-fun m!1290169 () Bool)

(assert (=> b!1402144 m!1290169))

(declare-fun m!1290171 () Bool)

(assert (=> start!120432 m!1290171))

(declare-fun m!1290173 () Bool)

(assert (=> start!120432 m!1290173))

(declare-fun m!1290175 () Bool)

(assert (=> b!1402136 m!1290175))

(assert (=> b!1402136 m!1290155))

(assert (=> b!1402136 m!1290155))

(declare-fun m!1290177 () Bool)

(assert (=> b!1402136 m!1290177))

(declare-fun m!1290179 () Bool)

(assert (=> b!1402140 m!1290179))

(assert (=> b!1402140 m!1290179))

(declare-fun m!1290181 () Bool)

(assert (=> b!1402140 m!1290181))

(assert (=> b!1402140 m!1290161))

(declare-fun m!1290183 () Bool)

(assert (=> b!1402140 m!1290183))

(assert (=> b!1402138 m!1290155))

(declare-fun m!1290185 () Bool)

(assert (=> b!1402138 m!1290185))

(assert (=> b!1402138 m!1290155))

(assert (=> b!1402138 m!1290155))

(declare-fun m!1290187 () Bool)

(assert (=> b!1402138 m!1290187))

(declare-fun m!1290189 () Bool)

(assert (=> b!1402138 m!1290189))

(declare-fun m!1290191 () Bool)

(assert (=> b!1402138 m!1290191))

(declare-fun m!1290193 () Bool)

(assert (=> b!1402146 m!1290193))

(assert (=> b!1402146 m!1290193))

(declare-fun m!1290195 () Bool)

(assert (=> b!1402146 m!1290195))

(push 1)

