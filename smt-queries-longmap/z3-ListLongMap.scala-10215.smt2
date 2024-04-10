; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120344 () Bool)

(assert start!120344)

(declare-datatypes ((array!95753 0))(
  ( (array!95754 (arr!46227 (Array (_ BitVec 32) (_ BitVec 64))) (size!46777 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95753)

(declare-fun lt!616382 () array!95753)

(declare-fun b!1400684 () Bool)

(declare-fun e!793053 () Bool)

(declare-datatypes ((SeekEntryResult!10544 0))(
  ( (MissingZero!10544 (index!44553 (_ BitVec 32))) (Found!10544 (index!44554 (_ BitVec 32))) (Intermediate!10544 (undefined!11356 Bool) (index!44555 (_ BitVec 32)) (x!126195 (_ BitVec 32))) (Undefined!10544) (MissingVacant!10544 (index!44556 (_ BitVec 32))) )
))
(declare-fun lt!616388 () SeekEntryResult!10544)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!616389 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95753 (_ BitVec 32)) SeekEntryResult!10544)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95753 (_ BitVec 32)) SeekEntryResult!10544)

(assert (=> b!1400684 (= e!793053 (= (seekEntryOrOpen!0 lt!616389 lt!616382 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126195 lt!616388) (index!44555 lt!616388) (index!44555 lt!616388) (select (arr!46227 a!2901) j!112) lt!616382 mask!2840)))))

(declare-fun b!1400685 () Bool)

(declare-fun e!793057 () Bool)

(declare-fun e!793055 () Bool)

(assert (=> b!1400685 (= e!793057 (not e!793055))))

(declare-fun res!939198 () Bool)

(assert (=> b!1400685 (=> res!939198 e!793055)))

(declare-fun lt!616383 () SeekEntryResult!10544)

(get-info :version)

(assert (=> b!1400685 (= res!939198 (or (not ((_ is Intermediate!10544) lt!616383)) (undefined!11356 lt!616383)))))

(declare-fun e!793056 () Bool)

(assert (=> b!1400685 e!793056))

(declare-fun res!939200 () Bool)

(assert (=> b!1400685 (=> (not res!939200) (not e!793056))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95753 (_ BitVec 32)) Bool)

(assert (=> b!1400685 (= res!939200 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47092 0))(
  ( (Unit!47093) )
))
(declare-fun lt!616384 () Unit!47092)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47092)

(assert (=> b!1400685 (= lt!616384 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616385 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95753 (_ BitVec 32)) SeekEntryResult!10544)

(assert (=> b!1400685 (= lt!616383 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616385 (select (arr!46227 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400685 (= lt!616385 (toIndex!0 (select (arr!46227 a!2901) j!112) mask!2840))))

(declare-fun res!939203 () Bool)

(assert (=> start!120344 (=> (not res!939203) (not e!793057))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120344 (= res!939203 (validMask!0 mask!2840))))

(assert (=> start!120344 e!793057))

(assert (=> start!120344 true))

(declare-fun array_inv!35255 (array!95753) Bool)

(assert (=> start!120344 (array_inv!35255 a!2901)))

(declare-fun b!1400686 () Bool)

(declare-fun res!939201 () Bool)

(assert (=> b!1400686 (=> (not res!939201) (not e!793057))))

(declare-datatypes ((List!32746 0))(
  ( (Nil!32743) (Cons!32742 (h!33990 (_ BitVec 64)) (t!47440 List!32746)) )
))
(declare-fun arrayNoDuplicates!0 (array!95753 (_ BitVec 32) List!32746) Bool)

(assert (=> b!1400686 (= res!939201 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32743))))

(declare-fun b!1400687 () Bool)

(declare-fun res!939205 () Bool)

(assert (=> b!1400687 (=> (not res!939205) (not e!793057))))

(assert (=> b!1400687 (= res!939205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400688 () Bool)

(declare-fun e!793052 () Bool)

(assert (=> b!1400688 (= e!793055 e!793052)))

(declare-fun res!939199 () Bool)

(assert (=> b!1400688 (=> res!939199 e!793052)))

(assert (=> b!1400688 (= res!939199 (or (= lt!616383 lt!616388) (not ((_ is Intermediate!10544) lt!616388))))))

(assert (=> b!1400688 (= lt!616388 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616389 mask!2840) lt!616389 lt!616382 mask!2840))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400688 (= lt!616389 (select (store (arr!46227 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400688 (= lt!616382 (array!95754 (store (arr!46227 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46777 a!2901)))))

(declare-fun b!1400689 () Bool)

(declare-fun res!939196 () Bool)

(assert (=> b!1400689 (=> (not res!939196) (not e!793057))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400689 (= res!939196 (validKeyInArray!0 (select (arr!46227 a!2901) j!112)))))

(declare-fun b!1400690 () Bool)

(declare-fun res!939197 () Bool)

(assert (=> b!1400690 (=> (not res!939197) (not e!793057))))

(assert (=> b!1400690 (= res!939197 (and (= (size!46777 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46777 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46777 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400691 () Bool)

(declare-fun e!793058 () Bool)

(assert (=> b!1400691 (= e!793052 e!793058)))

(declare-fun res!939195 () Bool)

(assert (=> b!1400691 (=> res!939195 e!793058)))

(assert (=> b!1400691 (= res!939195 (or (bvslt (x!126195 lt!616383) #b00000000000000000000000000000000) (bvsgt (x!126195 lt!616383) #b01111111111111111111111111111110) (bvslt (x!126195 lt!616388) #b00000000000000000000000000000000) (bvsgt (x!126195 lt!616388) #b01111111111111111111111111111110) (bvslt lt!616385 #b00000000000000000000000000000000) (bvsge lt!616385 (size!46777 a!2901)) (bvslt (index!44555 lt!616383) #b00000000000000000000000000000000) (bvsge (index!44555 lt!616383) (size!46777 a!2901)) (bvslt (index!44555 lt!616388) #b00000000000000000000000000000000) (bvsge (index!44555 lt!616388) (size!46777 a!2901)) (not (= lt!616383 (Intermediate!10544 false (index!44555 lt!616383) (x!126195 lt!616383)))) (not (= lt!616388 (Intermediate!10544 false (index!44555 lt!616388) (x!126195 lt!616388))))))))

(assert (=> b!1400691 e!793053))

(declare-fun res!939202 () Bool)

(assert (=> b!1400691 (=> (not res!939202) (not e!793053))))

(assert (=> b!1400691 (= res!939202 (and (not (undefined!11356 lt!616388)) (= (index!44555 lt!616388) i!1037) (bvslt (x!126195 lt!616388) (x!126195 lt!616383)) (= (select (store (arr!46227 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44555 lt!616388)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616387 () Unit!47092)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95753 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47092)

(assert (=> b!1400691 (= lt!616387 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616385 (x!126195 lt!616383) (index!44555 lt!616383) (x!126195 lt!616388) (index!44555 lt!616388) (undefined!11356 lt!616388) mask!2840))))

(declare-fun b!1400692 () Bool)

(declare-fun res!939204 () Bool)

(assert (=> b!1400692 (=> (not res!939204) (not e!793057))))

(assert (=> b!1400692 (= res!939204 (validKeyInArray!0 (select (arr!46227 a!2901) i!1037)))))

(declare-fun b!1400693 () Bool)

(assert (=> b!1400693 (= e!793058 true)))

(declare-fun lt!616386 () SeekEntryResult!10544)

(assert (=> b!1400693 (= lt!616386 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616385 lt!616389 lt!616382 mask!2840))))

(declare-fun b!1400694 () Bool)

(assert (=> b!1400694 (= e!793056 (= (seekEntryOrOpen!0 (select (arr!46227 a!2901) j!112) a!2901 mask!2840) (Found!10544 j!112)))))

(assert (= (and start!120344 res!939203) b!1400690))

(assert (= (and b!1400690 res!939197) b!1400692))

(assert (= (and b!1400692 res!939204) b!1400689))

(assert (= (and b!1400689 res!939196) b!1400687))

(assert (= (and b!1400687 res!939205) b!1400686))

(assert (= (and b!1400686 res!939201) b!1400685))

(assert (= (and b!1400685 res!939200) b!1400694))

(assert (= (and b!1400685 (not res!939198)) b!1400688))

(assert (= (and b!1400688 (not res!939199)) b!1400691))

(assert (= (and b!1400691 res!939202) b!1400684))

(assert (= (and b!1400691 (not res!939195)) b!1400693))

(declare-fun m!1288217 () Bool)

(assert (=> b!1400693 m!1288217))

(declare-fun m!1288219 () Bool)

(assert (=> b!1400684 m!1288219))

(declare-fun m!1288221 () Bool)

(assert (=> b!1400684 m!1288221))

(assert (=> b!1400684 m!1288221))

(declare-fun m!1288223 () Bool)

(assert (=> b!1400684 m!1288223))

(declare-fun m!1288225 () Bool)

(assert (=> b!1400687 m!1288225))

(declare-fun m!1288227 () Bool)

(assert (=> start!120344 m!1288227))

(declare-fun m!1288229 () Bool)

(assert (=> start!120344 m!1288229))

(declare-fun m!1288231 () Bool)

(assert (=> b!1400686 m!1288231))

(assert (=> b!1400689 m!1288221))

(assert (=> b!1400689 m!1288221))

(declare-fun m!1288233 () Bool)

(assert (=> b!1400689 m!1288233))

(declare-fun m!1288235 () Bool)

(assert (=> b!1400691 m!1288235))

(declare-fun m!1288237 () Bool)

(assert (=> b!1400691 m!1288237))

(declare-fun m!1288239 () Bool)

(assert (=> b!1400691 m!1288239))

(assert (=> b!1400685 m!1288221))

(declare-fun m!1288241 () Bool)

(assert (=> b!1400685 m!1288241))

(assert (=> b!1400685 m!1288221))

(assert (=> b!1400685 m!1288221))

(declare-fun m!1288243 () Bool)

(assert (=> b!1400685 m!1288243))

(declare-fun m!1288245 () Bool)

(assert (=> b!1400685 m!1288245))

(declare-fun m!1288247 () Bool)

(assert (=> b!1400685 m!1288247))

(assert (=> b!1400694 m!1288221))

(assert (=> b!1400694 m!1288221))

(declare-fun m!1288249 () Bool)

(assert (=> b!1400694 m!1288249))

(declare-fun m!1288251 () Bool)

(assert (=> b!1400688 m!1288251))

(assert (=> b!1400688 m!1288251))

(declare-fun m!1288253 () Bool)

(assert (=> b!1400688 m!1288253))

(assert (=> b!1400688 m!1288235))

(declare-fun m!1288255 () Bool)

(assert (=> b!1400688 m!1288255))

(declare-fun m!1288257 () Bool)

(assert (=> b!1400692 m!1288257))

(assert (=> b!1400692 m!1288257))

(declare-fun m!1288259 () Bool)

(assert (=> b!1400692 m!1288259))

(check-sat (not b!1400693) (not b!1400692) (not start!120344) (not b!1400691) (not b!1400686) (not b!1400685) (not b!1400684) (not b!1400689) (not b!1400688) (not b!1400694) (not b!1400687))
(check-sat)
