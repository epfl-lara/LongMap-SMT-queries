; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120314 () Bool)

(assert start!120314)

(declare-fun b!1400174 () Bool)

(declare-fun res!938740 () Bool)

(declare-fun e!792743 () Bool)

(assert (=> b!1400174 (=> (not res!938740) (not e!792743))))

(declare-datatypes ((array!95676 0))(
  ( (array!95677 (arr!46189 (Array (_ BitVec 32) (_ BitVec 64))) (size!46741 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95676)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95676 (_ BitVec 32)) Bool)

(assert (=> b!1400174 (= res!938740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400175 () Bool)

(declare-fun res!938739 () Bool)

(assert (=> b!1400175 (=> (not res!938739) (not e!792743))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400175 (= res!938739 (validKeyInArray!0 (select (arr!46189 a!2901) j!112)))))

(declare-fun e!792746 () Bool)

(declare-datatypes ((SeekEntryResult!10532 0))(
  ( (MissingZero!10532 (index!44505 (_ BitVec 32))) (Found!10532 (index!44506 (_ BitVec 32))) (Intermediate!10532 (undefined!11344 Bool) (index!44507 (_ BitVec 32)) (x!126148 (_ BitVec 32))) (Undefined!10532) (MissingVacant!10532 (index!44508 (_ BitVec 32))) )
))
(declare-fun lt!615885 () SeekEntryResult!10532)

(declare-fun lt!615880 () (_ BitVec 64))

(declare-fun lt!615884 () array!95676)

(declare-fun b!1400176 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95676 (_ BitVec 32)) SeekEntryResult!10532)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95676 (_ BitVec 32)) SeekEntryResult!10532)

(assert (=> b!1400176 (= e!792746 (= (seekEntryOrOpen!0 lt!615880 lt!615884 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126148 lt!615885) (index!44507 lt!615885) (index!44507 lt!615885) (select (arr!46189 a!2901) j!112) lt!615884 mask!2840)))))

(declare-fun b!1400177 () Bool)

(declare-fun e!792744 () Bool)

(declare-fun e!792741 () Bool)

(assert (=> b!1400177 (= e!792744 e!792741)))

(declare-fun res!938741 () Bool)

(assert (=> b!1400177 (=> res!938741 e!792741)))

(declare-fun lt!615883 () SeekEntryResult!10532)

(get-info :version)

(assert (=> b!1400177 (= res!938741 (or (= lt!615883 lt!615885) (not ((_ is Intermediate!10532) lt!615885))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95676 (_ BitVec 32)) SeekEntryResult!10532)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400177 (= lt!615885 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615880 mask!2840) lt!615880 lt!615884 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400177 (= lt!615880 (select (store (arr!46189 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400177 (= lt!615884 (array!95677 (store (arr!46189 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46741 a!2901)))))

(declare-fun b!1400178 () Bool)

(declare-fun res!938737 () Bool)

(assert (=> b!1400178 (=> (not res!938737) (not e!792743))))

(assert (=> b!1400178 (= res!938737 (and (= (size!46741 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46741 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46741 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400179 () Bool)

(declare-fun e!792742 () Bool)

(assert (=> b!1400179 (= e!792742 true)))

(declare-fun lt!615886 () (_ BitVec 32))

(declare-fun lt!615882 () SeekEntryResult!10532)

(assert (=> b!1400179 (= lt!615882 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615886 lt!615880 lt!615884 mask!2840))))

(declare-fun b!1400181 () Bool)

(declare-fun res!938738 () Bool)

(assert (=> b!1400181 (=> (not res!938738) (not e!792743))))

(assert (=> b!1400181 (= res!938738 (validKeyInArray!0 (select (arr!46189 a!2901) i!1037)))))

(declare-fun b!1400182 () Bool)

(declare-fun res!938746 () Bool)

(assert (=> b!1400182 (=> (not res!938746) (not e!792743))))

(declare-datatypes ((List!32786 0))(
  ( (Nil!32783) (Cons!32782 (h!34030 (_ BitVec 64)) (t!47472 List!32786)) )
))
(declare-fun arrayNoDuplicates!0 (array!95676 (_ BitVec 32) List!32786) Bool)

(assert (=> b!1400182 (= res!938746 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32783))))

(declare-fun b!1400183 () Bool)

(assert (=> b!1400183 (= e!792741 e!792742)))

(declare-fun res!938744 () Bool)

(assert (=> b!1400183 (=> res!938744 e!792742)))

(assert (=> b!1400183 (= res!938744 (or (bvslt (x!126148 lt!615883) #b00000000000000000000000000000000) (bvsgt (x!126148 lt!615883) #b01111111111111111111111111111110) (bvslt (x!126148 lt!615885) #b00000000000000000000000000000000) (bvsgt (x!126148 lt!615885) #b01111111111111111111111111111110) (bvslt lt!615886 #b00000000000000000000000000000000) (bvsge lt!615886 (size!46741 a!2901)) (bvslt (index!44507 lt!615883) #b00000000000000000000000000000000) (bvsge (index!44507 lt!615883) (size!46741 a!2901)) (bvslt (index!44507 lt!615885) #b00000000000000000000000000000000) (bvsge (index!44507 lt!615885) (size!46741 a!2901)) (not (= lt!615883 (Intermediate!10532 false (index!44507 lt!615883) (x!126148 lt!615883)))) (not (= lt!615885 (Intermediate!10532 false (index!44507 lt!615885) (x!126148 lt!615885))))))))

(assert (=> b!1400183 e!792746))

(declare-fun res!938745 () Bool)

(assert (=> b!1400183 (=> (not res!938745) (not e!792746))))

(assert (=> b!1400183 (= res!938745 (and (not (undefined!11344 lt!615885)) (= (index!44507 lt!615885) i!1037) (bvslt (x!126148 lt!615885) (x!126148 lt!615883)) (= (select (store (arr!46189 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44507 lt!615885)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!46911 0))(
  ( (Unit!46912) )
))
(declare-fun lt!615887 () Unit!46911)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46911)

(assert (=> b!1400183 (= lt!615887 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615886 (x!126148 lt!615883) (index!44507 lt!615883) (x!126148 lt!615885) (index!44507 lt!615885) (undefined!11344 lt!615885) mask!2840))))

(declare-fun e!792740 () Bool)

(declare-fun b!1400184 () Bool)

(assert (=> b!1400184 (= e!792740 (= (seekEntryOrOpen!0 (select (arr!46189 a!2901) j!112) a!2901 mask!2840) (Found!10532 j!112)))))

(declare-fun res!938742 () Bool)

(assert (=> start!120314 (=> (not res!938742) (not e!792743))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120314 (= res!938742 (validMask!0 mask!2840))))

(assert (=> start!120314 e!792743))

(assert (=> start!120314 true))

(declare-fun array_inv!35422 (array!95676) Bool)

(assert (=> start!120314 (array_inv!35422 a!2901)))

(declare-fun b!1400180 () Bool)

(assert (=> b!1400180 (= e!792743 (not e!792744))))

(declare-fun res!938743 () Bool)

(assert (=> b!1400180 (=> res!938743 e!792744)))

(assert (=> b!1400180 (= res!938743 (or (not ((_ is Intermediate!10532) lt!615883)) (undefined!11344 lt!615883)))))

(assert (=> b!1400180 e!792740))

(declare-fun res!938736 () Bool)

(assert (=> b!1400180 (=> (not res!938736) (not e!792740))))

(assert (=> b!1400180 (= res!938736 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!615881 () Unit!46911)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95676 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46911)

(assert (=> b!1400180 (= lt!615881 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400180 (= lt!615883 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615886 (select (arr!46189 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400180 (= lt!615886 (toIndex!0 (select (arr!46189 a!2901) j!112) mask!2840))))

(assert (= (and start!120314 res!938742) b!1400178))

(assert (= (and b!1400178 res!938737) b!1400181))

(assert (= (and b!1400181 res!938738) b!1400175))

(assert (= (and b!1400175 res!938739) b!1400174))

(assert (= (and b!1400174 res!938740) b!1400182))

(assert (= (and b!1400182 res!938746) b!1400180))

(assert (= (and b!1400180 res!938736) b!1400184))

(assert (= (and b!1400180 (not res!938743)) b!1400177))

(assert (= (and b!1400177 (not res!938741)) b!1400183))

(assert (= (and b!1400183 res!938745) b!1400176))

(assert (= (and b!1400183 (not res!938744)) b!1400179))

(declare-fun m!1287109 () Bool)

(assert (=> b!1400174 m!1287109))

(declare-fun m!1287111 () Bool)

(assert (=> b!1400181 m!1287111))

(assert (=> b!1400181 m!1287111))

(declare-fun m!1287113 () Bool)

(assert (=> b!1400181 m!1287113))

(declare-fun m!1287115 () Bool)

(assert (=> b!1400184 m!1287115))

(assert (=> b!1400184 m!1287115))

(declare-fun m!1287117 () Bool)

(assert (=> b!1400184 m!1287117))

(assert (=> b!1400180 m!1287115))

(declare-fun m!1287119 () Bool)

(assert (=> b!1400180 m!1287119))

(assert (=> b!1400180 m!1287115))

(assert (=> b!1400180 m!1287115))

(declare-fun m!1287121 () Bool)

(assert (=> b!1400180 m!1287121))

(declare-fun m!1287123 () Bool)

(assert (=> b!1400180 m!1287123))

(declare-fun m!1287125 () Bool)

(assert (=> b!1400180 m!1287125))

(declare-fun m!1287127 () Bool)

(assert (=> b!1400177 m!1287127))

(assert (=> b!1400177 m!1287127))

(declare-fun m!1287129 () Bool)

(assert (=> b!1400177 m!1287129))

(declare-fun m!1287131 () Bool)

(assert (=> b!1400177 m!1287131))

(declare-fun m!1287133 () Bool)

(assert (=> b!1400177 m!1287133))

(declare-fun m!1287135 () Bool)

(assert (=> b!1400176 m!1287135))

(assert (=> b!1400176 m!1287115))

(assert (=> b!1400176 m!1287115))

(declare-fun m!1287137 () Bool)

(assert (=> b!1400176 m!1287137))

(assert (=> b!1400175 m!1287115))

(assert (=> b!1400175 m!1287115))

(declare-fun m!1287139 () Bool)

(assert (=> b!1400175 m!1287139))

(declare-fun m!1287141 () Bool)

(assert (=> b!1400182 m!1287141))

(assert (=> b!1400183 m!1287131))

(declare-fun m!1287143 () Bool)

(assert (=> b!1400183 m!1287143))

(declare-fun m!1287145 () Bool)

(assert (=> b!1400183 m!1287145))

(declare-fun m!1287147 () Bool)

(assert (=> b!1400179 m!1287147))

(declare-fun m!1287149 () Bool)

(assert (=> start!120314 m!1287149))

(declare-fun m!1287151 () Bool)

(assert (=> start!120314 m!1287151))

(check-sat (not b!1400179) (not b!1400176) (not b!1400182) (not b!1400180) (not b!1400184) (not b!1400181) (not start!120314) (not b!1400174) (not b!1400177) (not b!1400183) (not b!1400175))
(check-sat)
