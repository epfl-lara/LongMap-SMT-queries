; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120344 () Bool)

(assert start!120344)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95706 0))(
  ( (array!95707 (arr!46204 (Array (_ BitVec 32) (_ BitVec 64))) (size!46756 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95706)

(declare-fun b!1400669 () Bool)

(declare-fun e!793056 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10547 0))(
  ( (MissingZero!10547 (index!44565 (_ BitVec 32))) (Found!10547 (index!44566 (_ BitVec 32))) (Intermediate!10547 (undefined!11359 Bool) (index!44567 (_ BitVec 32)) (x!126203 (_ BitVec 32))) (Undefined!10547) (MissingVacant!10547 (index!44568 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95706 (_ BitVec 32)) SeekEntryResult!10547)

(assert (=> b!1400669 (= e!793056 (= (seekEntryOrOpen!0 (select (arr!46204 a!2901) j!112) a!2901 mask!2840) (Found!10547 j!112)))))

(declare-fun b!1400670 () Bool)

(declare-fun res!939240 () Bool)

(declare-fun e!793059 () Bool)

(assert (=> b!1400670 (=> (not res!939240) (not e!793059))))

(declare-datatypes ((List!32801 0))(
  ( (Nil!32798) (Cons!32797 (h!34045 (_ BitVec 64)) (t!47487 List!32801)) )
))
(declare-fun arrayNoDuplicates!0 (array!95706 (_ BitVec 32) List!32801) Bool)

(assert (=> b!1400670 (= res!939240 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32798))))

(declare-fun b!1400672 () Bool)

(declare-fun res!939241 () Bool)

(assert (=> b!1400672 (=> (not res!939241) (not e!793059))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1400672 (= res!939241 (and (= (size!46756 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46756 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46756 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400673 () Bool)

(declare-fun res!939232 () Bool)

(assert (=> b!1400673 (=> (not res!939232) (not e!793059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95706 (_ BitVec 32)) Bool)

(assert (=> b!1400673 (= res!939232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400674 () Bool)

(declare-fun res!939235 () Bool)

(assert (=> b!1400674 (=> (not res!939235) (not e!793059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400674 (= res!939235 (validKeyInArray!0 (select (arr!46204 a!2901) j!112)))))

(declare-fun b!1400675 () Bool)

(declare-fun e!793060 () Bool)

(assert (=> b!1400675 (= e!793059 (not e!793060))))

(declare-fun res!939234 () Bool)

(assert (=> b!1400675 (=> res!939234 e!793060)))

(declare-fun lt!616246 () SeekEntryResult!10547)

(get-info :version)

(assert (=> b!1400675 (= res!939234 (or (not ((_ is Intermediate!10547) lt!616246)) (undefined!11359 lt!616246)))))

(assert (=> b!1400675 e!793056))

(declare-fun res!939237 () Bool)

(assert (=> b!1400675 (=> (not res!939237) (not e!793056))))

(assert (=> b!1400675 (= res!939237 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46941 0))(
  ( (Unit!46942) )
))
(declare-fun lt!616243 () Unit!46941)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46941)

(assert (=> b!1400675 (= lt!616243 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!616242 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95706 (_ BitVec 32)) SeekEntryResult!10547)

(assert (=> b!1400675 (= lt!616246 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616242 (select (arr!46204 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400675 (= lt!616242 (toIndex!0 (select (arr!46204 a!2901) j!112) mask!2840))))

(declare-fun b!1400671 () Bool)

(declare-fun e!793058 () Bool)

(assert (=> b!1400671 (= e!793060 e!793058)))

(declare-fun res!939238 () Bool)

(assert (=> b!1400671 (=> res!939238 e!793058)))

(declare-fun lt!616241 () SeekEntryResult!10547)

(assert (=> b!1400671 (= res!939238 (or (= lt!616246 lt!616241) (not ((_ is Intermediate!10547) lt!616241))))))

(declare-fun lt!616245 () (_ BitVec 64))

(declare-fun lt!616240 () array!95706)

(assert (=> b!1400671 (= lt!616241 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616245 mask!2840) lt!616245 lt!616240 mask!2840))))

(assert (=> b!1400671 (= lt!616245 (select (store (arr!46204 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400671 (= lt!616240 (array!95707 (store (arr!46204 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46756 a!2901)))))

(declare-fun res!939236 () Bool)

(assert (=> start!120344 (=> (not res!939236) (not e!793059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120344 (= res!939236 (validMask!0 mask!2840))))

(assert (=> start!120344 e!793059))

(assert (=> start!120344 true))

(declare-fun array_inv!35437 (array!95706) Bool)

(assert (=> start!120344 (array_inv!35437 a!2901)))

(declare-fun b!1400676 () Bool)

(declare-fun res!939233 () Bool)

(assert (=> b!1400676 (=> (not res!939233) (not e!793059))))

(assert (=> b!1400676 (= res!939233 (validKeyInArray!0 (select (arr!46204 a!2901) i!1037)))))

(declare-fun b!1400677 () Bool)

(declare-fun e!793055 () Bool)

(assert (=> b!1400677 (= e!793055 true)))

(declare-fun lt!616244 () SeekEntryResult!10547)

(assert (=> b!1400677 (= lt!616244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616242 lt!616245 lt!616240 mask!2840))))

(declare-fun b!1400678 () Bool)

(assert (=> b!1400678 (= e!793058 e!793055)))

(declare-fun res!939239 () Bool)

(assert (=> b!1400678 (=> res!939239 e!793055)))

(assert (=> b!1400678 (= res!939239 (or (bvslt (x!126203 lt!616246) #b00000000000000000000000000000000) (bvsgt (x!126203 lt!616246) #b01111111111111111111111111111110) (bvslt (x!126203 lt!616241) #b00000000000000000000000000000000) (bvsgt (x!126203 lt!616241) #b01111111111111111111111111111110) (bvslt lt!616242 #b00000000000000000000000000000000) (bvsge lt!616242 (size!46756 a!2901)) (bvslt (index!44567 lt!616246) #b00000000000000000000000000000000) (bvsge (index!44567 lt!616246) (size!46756 a!2901)) (bvslt (index!44567 lt!616241) #b00000000000000000000000000000000) (bvsge (index!44567 lt!616241) (size!46756 a!2901)) (not (= lt!616246 (Intermediate!10547 false (index!44567 lt!616246) (x!126203 lt!616246)))) (not (= lt!616241 (Intermediate!10547 false (index!44567 lt!616241) (x!126203 lt!616241))))))))

(declare-fun e!793061 () Bool)

(assert (=> b!1400678 e!793061))

(declare-fun res!939231 () Bool)

(assert (=> b!1400678 (=> (not res!939231) (not e!793061))))

(assert (=> b!1400678 (= res!939231 (and (not (undefined!11359 lt!616241)) (= (index!44567 lt!616241) i!1037) (bvslt (x!126203 lt!616241) (x!126203 lt!616246)) (= (select (store (arr!46204 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44567 lt!616241)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!616247 () Unit!46941)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95706 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46941)

(assert (=> b!1400678 (= lt!616247 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616242 (x!126203 lt!616246) (index!44567 lt!616246) (x!126203 lt!616241) (index!44567 lt!616241) (undefined!11359 lt!616241) mask!2840))))

(declare-fun b!1400679 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95706 (_ BitVec 32)) SeekEntryResult!10547)

(assert (=> b!1400679 (= e!793061 (= (seekEntryOrOpen!0 lt!616245 lt!616240 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126203 lt!616241) (index!44567 lt!616241) (index!44567 lt!616241) (select (arr!46204 a!2901) j!112) lt!616240 mask!2840)))))

(assert (= (and start!120344 res!939236) b!1400672))

(assert (= (and b!1400672 res!939241) b!1400676))

(assert (= (and b!1400676 res!939233) b!1400674))

(assert (= (and b!1400674 res!939235) b!1400673))

(assert (= (and b!1400673 res!939232) b!1400670))

(assert (= (and b!1400670 res!939240) b!1400675))

(assert (= (and b!1400675 res!939237) b!1400669))

(assert (= (and b!1400675 (not res!939234)) b!1400671))

(assert (= (and b!1400671 (not res!939238)) b!1400678))

(assert (= (and b!1400678 res!939231) b!1400679))

(assert (= (and b!1400678 (not res!939239)) b!1400677))

(declare-fun m!1287769 () Bool)

(assert (=> b!1400671 m!1287769))

(assert (=> b!1400671 m!1287769))

(declare-fun m!1287771 () Bool)

(assert (=> b!1400671 m!1287771))

(declare-fun m!1287773 () Bool)

(assert (=> b!1400671 m!1287773))

(declare-fun m!1287775 () Bool)

(assert (=> b!1400671 m!1287775))

(declare-fun m!1287777 () Bool)

(assert (=> b!1400669 m!1287777))

(assert (=> b!1400669 m!1287777))

(declare-fun m!1287779 () Bool)

(assert (=> b!1400669 m!1287779))

(declare-fun m!1287781 () Bool)

(assert (=> b!1400673 m!1287781))

(declare-fun m!1287783 () Bool)

(assert (=> b!1400670 m!1287783))

(declare-fun m!1287785 () Bool)

(assert (=> b!1400679 m!1287785))

(assert (=> b!1400679 m!1287777))

(assert (=> b!1400679 m!1287777))

(declare-fun m!1287787 () Bool)

(assert (=> b!1400679 m!1287787))

(declare-fun m!1287789 () Bool)

(assert (=> b!1400677 m!1287789))

(assert (=> b!1400678 m!1287773))

(declare-fun m!1287791 () Bool)

(assert (=> b!1400678 m!1287791))

(declare-fun m!1287793 () Bool)

(assert (=> b!1400678 m!1287793))

(assert (=> b!1400674 m!1287777))

(assert (=> b!1400674 m!1287777))

(declare-fun m!1287795 () Bool)

(assert (=> b!1400674 m!1287795))

(declare-fun m!1287797 () Bool)

(assert (=> start!120344 m!1287797))

(declare-fun m!1287799 () Bool)

(assert (=> start!120344 m!1287799))

(declare-fun m!1287801 () Bool)

(assert (=> b!1400676 m!1287801))

(assert (=> b!1400676 m!1287801))

(declare-fun m!1287803 () Bool)

(assert (=> b!1400676 m!1287803))

(assert (=> b!1400675 m!1287777))

(declare-fun m!1287805 () Bool)

(assert (=> b!1400675 m!1287805))

(assert (=> b!1400675 m!1287777))

(declare-fun m!1287807 () Bool)

(assert (=> b!1400675 m!1287807))

(declare-fun m!1287809 () Bool)

(assert (=> b!1400675 m!1287809))

(assert (=> b!1400675 m!1287777))

(declare-fun m!1287811 () Bool)

(assert (=> b!1400675 m!1287811))

(check-sat (not b!1400679) (not b!1400673) (not b!1400677) (not b!1400676) (not b!1400674) (not b!1400670) (not b!1400675) (not b!1400671) (not b!1400678) (not b!1400669) (not start!120344))
(check-sat)
