; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120380 () Bool)

(assert start!120380)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95742 0))(
  ( (array!95743 (arr!46222 (Array (_ BitVec 32) (_ BitVec 64))) (size!46774 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95742)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun b!1401263 () Bool)

(declare-fun e!793437 () Bool)

(declare-datatypes ((SeekEntryResult!10565 0))(
  ( (MissingZero!10565 (index!44637 (_ BitVec 32))) (Found!10565 (index!44638 (_ BitVec 32))) (Intermediate!10565 (undefined!11377 Bool) (index!44639 (_ BitVec 32)) (x!126269 (_ BitVec 32))) (Undefined!10565) (MissingVacant!10565 (index!44640 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95742 (_ BitVec 32)) SeekEntryResult!10565)

(assert (=> b!1401263 (= e!793437 (= (seekEntryOrOpen!0 (select (arr!46222 a!2901) j!112) a!2901 mask!2840) (Found!10565 j!112)))))

(declare-fun b!1401264 () Bool)

(declare-fun e!793434 () Bool)

(declare-fun e!793436 () Bool)

(assert (=> b!1401264 (= e!793434 (not e!793436))))

(declare-fun res!939833 () Bool)

(assert (=> b!1401264 (=> res!939833 e!793436)))

(declare-fun lt!616678 () SeekEntryResult!10565)

(get-info :version)

(assert (=> b!1401264 (= res!939833 (or (not ((_ is Intermediate!10565) lt!616678)) (undefined!11377 lt!616678)))))

(assert (=> b!1401264 e!793437))

(declare-fun res!939835 () Bool)

(assert (=> b!1401264 (=> (not res!939835) (not e!793437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95742 (_ BitVec 32)) Bool)

(assert (=> b!1401264 (= res!939835 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46977 0))(
  ( (Unit!46978) )
))
(declare-fun lt!616676 () Unit!46977)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46977)

(assert (=> b!1401264 (= lt!616676 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616679 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95742 (_ BitVec 32)) SeekEntryResult!10565)

(assert (=> b!1401264 (= lt!616678 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616679 (select (arr!46222 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401264 (= lt!616679 (toIndex!0 (select (arr!46222 a!2901) j!112) mask!2840))))

(declare-fun b!1401265 () Bool)

(declare-fun res!939830 () Bool)

(assert (=> b!1401265 (=> (not res!939830) (not e!793434))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401265 (= res!939830 (validKeyInArray!0 (select (arr!46222 a!2901) j!112)))))

(declare-fun b!1401266 () Bool)

(declare-fun e!793438 () Bool)

(declare-fun e!793435 () Bool)

(assert (=> b!1401266 (= e!793438 e!793435)))

(declare-fun res!939826 () Bool)

(assert (=> b!1401266 (=> res!939826 e!793435)))

(declare-fun lt!616673 () SeekEntryResult!10565)

(assert (=> b!1401266 (= res!939826 (or (bvslt (x!126269 lt!616678) #b00000000000000000000000000000000) (bvsgt (x!126269 lt!616678) #b01111111111111111111111111111110) (bvslt (x!126269 lt!616673) #b00000000000000000000000000000000) (bvsgt (x!126269 lt!616673) #b01111111111111111111111111111110) (bvslt lt!616679 #b00000000000000000000000000000000) (bvsge lt!616679 (size!46774 a!2901)) (bvslt (index!44639 lt!616678) #b00000000000000000000000000000000) (bvsge (index!44639 lt!616678) (size!46774 a!2901)) (bvslt (index!44639 lt!616673) #b00000000000000000000000000000000) (bvsge (index!44639 lt!616673) (size!46774 a!2901)) (not (= lt!616678 (Intermediate!10565 false (index!44639 lt!616678) (x!126269 lt!616678)))) (not (= lt!616673 (Intermediate!10565 false (index!44639 lt!616673) (x!126269 lt!616673))))))))

(declare-fun e!793433 () Bool)

(assert (=> b!1401266 e!793433))

(declare-fun res!939828 () Bool)

(assert (=> b!1401266 (=> (not res!939828) (not e!793433))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401266 (= res!939828 (and (not (undefined!11377 lt!616673)) (= (index!44639 lt!616673) i!1037) (bvslt (x!126269 lt!616673) (x!126269 lt!616678)) (= (select (store (arr!46222 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44639 lt!616673)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616672 () Unit!46977)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95742 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46977)

(assert (=> b!1401266 (= lt!616672 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616679 (x!126269 lt!616678) (index!44639 lt!616678) (x!126269 lt!616673) (index!44639 lt!616673) (undefined!11377 lt!616673) mask!2840))))

(declare-fun b!1401267 () Bool)

(declare-fun res!939834 () Bool)

(assert (=> b!1401267 (=> (not res!939834) (not e!793434))))

(assert (=> b!1401267 (= res!939834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401268 () Bool)

(declare-fun res!939832 () Bool)

(assert (=> b!1401268 (=> (not res!939832) (not e!793434))))

(declare-datatypes ((List!32819 0))(
  ( (Nil!32816) (Cons!32815 (h!34063 (_ BitVec 64)) (t!47505 List!32819)) )
))
(declare-fun arrayNoDuplicates!0 (array!95742 (_ BitVec 32) List!32819) Bool)

(assert (=> b!1401268 (= res!939832 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32816))))

(declare-fun b!1401269 () Bool)

(declare-fun res!939825 () Bool)

(assert (=> b!1401269 (=> (not res!939825) (not e!793434))))

(assert (=> b!1401269 (= res!939825 (validKeyInArray!0 (select (arr!46222 a!2901) i!1037)))))

(declare-fun b!1401270 () Bool)

(assert (=> b!1401270 (= e!793435 true)))

(declare-fun lt!616675 () SeekEntryResult!10565)

(declare-fun lt!616677 () array!95742)

(declare-fun lt!616674 () (_ BitVec 64))

(assert (=> b!1401270 (= lt!616675 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616679 lt!616674 lt!616677 mask!2840))))

(declare-fun res!939829 () Bool)

(assert (=> start!120380 (=> (not res!939829) (not e!793434))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120380 (= res!939829 (validMask!0 mask!2840))))

(assert (=> start!120380 e!793434))

(assert (=> start!120380 true))

(declare-fun array_inv!35455 (array!95742) Bool)

(assert (=> start!120380 (array_inv!35455 a!2901)))

(declare-fun b!1401271 () Bool)

(assert (=> b!1401271 (= e!793436 e!793438)))

(declare-fun res!939827 () Bool)

(assert (=> b!1401271 (=> res!939827 e!793438)))

(assert (=> b!1401271 (= res!939827 (or (= lt!616678 lt!616673) (not ((_ is Intermediate!10565) lt!616673))))))

(assert (=> b!1401271 (= lt!616673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616674 mask!2840) lt!616674 lt!616677 mask!2840))))

(assert (=> b!1401271 (= lt!616674 (select (store (arr!46222 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401271 (= lt!616677 (array!95743 (store (arr!46222 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46774 a!2901)))))

(declare-fun b!1401272 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95742 (_ BitVec 32)) SeekEntryResult!10565)

(assert (=> b!1401272 (= e!793433 (= (seekEntryOrOpen!0 lt!616674 lt!616677 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126269 lt!616673) (index!44639 lt!616673) (index!44639 lt!616673) (select (arr!46222 a!2901) j!112) lt!616677 mask!2840)))))

(declare-fun b!1401273 () Bool)

(declare-fun res!939831 () Bool)

(assert (=> b!1401273 (=> (not res!939831) (not e!793434))))

(assert (=> b!1401273 (= res!939831 (and (= (size!46774 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46774 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46774 a!2901)) (not (= i!1037 j!112))))))

(assert (= (and start!120380 res!939829) b!1401273))

(assert (= (and b!1401273 res!939831) b!1401269))

(assert (= (and b!1401269 res!939825) b!1401265))

(assert (= (and b!1401265 res!939830) b!1401267))

(assert (= (and b!1401267 res!939834) b!1401268))

(assert (= (and b!1401268 res!939832) b!1401264))

(assert (= (and b!1401264 res!939835) b!1401263))

(assert (= (and b!1401264 (not res!939833)) b!1401271))

(assert (= (and b!1401271 (not res!939827)) b!1401266))

(assert (= (and b!1401266 res!939828) b!1401272))

(assert (= (and b!1401266 (not res!939826)) b!1401270))

(declare-fun m!1288561 () Bool)

(assert (=> b!1401266 m!1288561))

(declare-fun m!1288563 () Bool)

(assert (=> b!1401266 m!1288563))

(declare-fun m!1288565 () Bool)

(assert (=> b!1401266 m!1288565))

(declare-fun m!1288567 () Bool)

(assert (=> b!1401265 m!1288567))

(assert (=> b!1401265 m!1288567))

(declare-fun m!1288569 () Bool)

(assert (=> b!1401265 m!1288569))

(declare-fun m!1288571 () Bool)

(assert (=> b!1401268 m!1288571))

(declare-fun m!1288573 () Bool)

(assert (=> b!1401272 m!1288573))

(assert (=> b!1401272 m!1288567))

(assert (=> b!1401272 m!1288567))

(declare-fun m!1288575 () Bool)

(assert (=> b!1401272 m!1288575))

(declare-fun m!1288577 () Bool)

(assert (=> b!1401269 m!1288577))

(assert (=> b!1401269 m!1288577))

(declare-fun m!1288579 () Bool)

(assert (=> b!1401269 m!1288579))

(declare-fun m!1288581 () Bool)

(assert (=> b!1401267 m!1288581))

(declare-fun m!1288583 () Bool)

(assert (=> b!1401271 m!1288583))

(assert (=> b!1401271 m!1288583))

(declare-fun m!1288585 () Bool)

(assert (=> b!1401271 m!1288585))

(assert (=> b!1401271 m!1288561))

(declare-fun m!1288587 () Bool)

(assert (=> b!1401271 m!1288587))

(assert (=> b!1401264 m!1288567))

(declare-fun m!1288589 () Bool)

(assert (=> b!1401264 m!1288589))

(assert (=> b!1401264 m!1288567))

(declare-fun m!1288591 () Bool)

(assert (=> b!1401264 m!1288591))

(declare-fun m!1288593 () Bool)

(assert (=> b!1401264 m!1288593))

(assert (=> b!1401264 m!1288567))

(declare-fun m!1288595 () Bool)

(assert (=> b!1401264 m!1288595))

(declare-fun m!1288597 () Bool)

(assert (=> b!1401270 m!1288597))

(declare-fun m!1288599 () Bool)

(assert (=> start!120380 m!1288599))

(declare-fun m!1288601 () Bool)

(assert (=> start!120380 m!1288601))

(assert (=> b!1401263 m!1288567))

(assert (=> b!1401263 m!1288567))

(declare-fun m!1288603 () Bool)

(assert (=> b!1401263 m!1288603))

(check-sat (not b!1401268) (not b!1401269) (not b!1401265) (not b!1401264) (not b!1401267) (not b!1401263) (not start!120380) (not b!1401271) (not b!1401272) (not b!1401266) (not b!1401270))
(check-sat)
