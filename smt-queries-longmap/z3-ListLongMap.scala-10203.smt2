; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120392 () Bool)

(assert start!120392)

(declare-fun b!1400308 () Bool)

(declare-fun res!938372 () Bool)

(declare-fun e!792850 () Bool)

(assert (=> b!1400308 (=> (not res!938372) (not e!792850))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95786 0))(
  ( (array!95787 (arr!46243 (Array (_ BitVec 32) (_ BitVec 64))) (size!46794 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95786)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400308 (= res!938372 (and (= (size!46794 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46794 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46794 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400309 () Bool)

(declare-fun res!938380 () Bool)

(assert (=> b!1400309 (=> (not res!938380) (not e!792850))))

(declare-datatypes ((List!32749 0))(
  ( (Nil!32746) (Cons!32745 (h!33998 (_ BitVec 64)) (t!47435 List!32749)) )
))
(declare-fun arrayNoDuplicates!0 (array!95786 (_ BitVec 32) List!32749) Bool)

(assert (=> b!1400309 (= res!938380 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32746))))

(declare-fun b!1400310 () Bool)

(declare-fun res!938379 () Bool)

(assert (=> b!1400310 (=> (not res!938379) (not e!792850))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400310 (= res!938379 (validKeyInArray!0 (select (arr!46243 a!2901) i!1037)))))

(declare-fun res!938377 () Bool)

(assert (=> start!120392 (=> (not res!938377) (not e!792850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120392 (= res!938377 (validMask!0 mask!2840))))

(assert (=> start!120392 e!792850))

(assert (=> start!120392 true))

(declare-fun array_inv!35524 (array!95786) Bool)

(assert (=> start!120392 (array_inv!35524 a!2901)))

(declare-fun b!1400311 () Bool)

(declare-fun e!792852 () Bool)

(assert (=> b!1400311 (= e!792850 (not e!792852))))

(declare-fun res!938374 () Bool)

(assert (=> b!1400311 (=> res!938374 e!792852)))

(declare-datatypes ((SeekEntryResult!10463 0))(
  ( (MissingZero!10463 (index!44226 (_ BitVec 32))) (Found!10463 (index!44227 (_ BitVec 32))) (Intermediate!10463 (undefined!11275 Bool) (index!44228 (_ BitVec 32)) (x!126025 (_ BitVec 32))) (Undefined!10463) (MissingVacant!10463 (index!44229 (_ BitVec 32))) )
))
(declare-fun lt!615771 () SeekEntryResult!10463)

(get-info :version)

(assert (=> b!1400311 (= res!938374 (or (not ((_ is Intermediate!10463) lt!615771)) (undefined!11275 lt!615771)))))

(declare-fun e!792853 () Bool)

(assert (=> b!1400311 e!792853))

(declare-fun res!938378 () Bool)

(assert (=> b!1400311 (=> (not res!938378) (not e!792853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95786 (_ BitVec 32)) Bool)

(assert (=> b!1400311 (= res!938378 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46957 0))(
  ( (Unit!46958) )
))
(declare-fun lt!615769 () Unit!46957)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46957)

(assert (=> b!1400311 (= lt!615769 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!615773 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95786 (_ BitVec 32)) SeekEntryResult!10463)

(assert (=> b!1400311 (= lt!615771 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!615773 (select (arr!46243 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400311 (= lt!615773 (toIndex!0 (select (arr!46243 a!2901) j!112) mask!2840))))

(declare-fun b!1400312 () Bool)

(declare-fun res!938376 () Bool)

(assert (=> b!1400312 (=> (not res!938376) (not e!792850))))

(assert (=> b!1400312 (= res!938376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400313 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95786 (_ BitVec 32)) SeekEntryResult!10463)

(assert (=> b!1400313 (= e!792853 (= (seekEntryOrOpen!0 (select (arr!46243 a!2901) j!112) a!2901 mask!2840) (Found!10463 j!112)))))

(declare-fun b!1400314 () Bool)

(declare-fun res!938373 () Bool)

(assert (=> b!1400314 (=> (not res!938373) (not e!792850))))

(assert (=> b!1400314 (= res!938373 (validKeyInArray!0 (select (arr!46243 a!2901) j!112)))))

(declare-fun b!1400315 () Bool)

(declare-fun e!792851 () Bool)

(assert (=> b!1400315 (= e!792851 true)))

(declare-fun lt!615770 () SeekEntryResult!10463)

(assert (=> b!1400315 (and (not (undefined!11275 lt!615770)) (= (index!44228 lt!615770) i!1037) (bvslt (x!126025 lt!615770) (x!126025 lt!615771)) (= (select (store (arr!46243 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44228 lt!615770)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!615768 () Unit!46957)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95786 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46957)

(assert (=> b!1400315 (= lt!615768 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!615773 (x!126025 lt!615771) (index!44228 lt!615771) (x!126025 lt!615770) (index!44228 lt!615770) (undefined!11275 lt!615770) mask!2840))))

(declare-fun b!1400316 () Bool)

(assert (=> b!1400316 (= e!792852 e!792851)))

(declare-fun res!938375 () Bool)

(assert (=> b!1400316 (=> res!938375 e!792851)))

(assert (=> b!1400316 (= res!938375 (or (= lt!615771 lt!615770) (not ((_ is Intermediate!10463) lt!615770))))))

(declare-fun lt!615772 () (_ BitVec 64))

(assert (=> b!1400316 (= lt!615770 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!615772 mask!2840) lt!615772 (array!95787 (store (arr!46243 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46794 a!2901)) mask!2840))))

(assert (=> b!1400316 (= lt!615772 (select (store (arr!46243 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (= (and start!120392 res!938377) b!1400308))

(assert (= (and b!1400308 res!938372) b!1400310))

(assert (= (and b!1400310 res!938379) b!1400314))

(assert (= (and b!1400314 res!938373) b!1400312))

(assert (= (and b!1400312 res!938376) b!1400309))

(assert (= (and b!1400309 res!938380) b!1400311))

(assert (= (and b!1400311 res!938378) b!1400313))

(assert (= (and b!1400311 (not res!938374)) b!1400316))

(assert (= (and b!1400316 (not res!938375)) b!1400315))

(declare-fun m!1287769 () Bool)

(assert (=> b!1400314 m!1287769))

(assert (=> b!1400314 m!1287769))

(declare-fun m!1287771 () Bool)

(assert (=> b!1400314 m!1287771))

(declare-fun m!1287773 () Bool)

(assert (=> b!1400310 m!1287773))

(assert (=> b!1400310 m!1287773))

(declare-fun m!1287775 () Bool)

(assert (=> b!1400310 m!1287775))

(declare-fun m!1287777 () Bool)

(assert (=> start!120392 m!1287777))

(declare-fun m!1287779 () Bool)

(assert (=> start!120392 m!1287779))

(assert (=> b!1400313 m!1287769))

(assert (=> b!1400313 m!1287769))

(declare-fun m!1287781 () Bool)

(assert (=> b!1400313 m!1287781))

(declare-fun m!1287783 () Bool)

(assert (=> b!1400315 m!1287783))

(declare-fun m!1287785 () Bool)

(assert (=> b!1400315 m!1287785))

(declare-fun m!1287787 () Bool)

(assert (=> b!1400315 m!1287787))

(declare-fun m!1287789 () Bool)

(assert (=> b!1400316 m!1287789))

(assert (=> b!1400316 m!1287783))

(assert (=> b!1400316 m!1287789))

(declare-fun m!1287791 () Bool)

(assert (=> b!1400316 m!1287791))

(declare-fun m!1287793 () Bool)

(assert (=> b!1400316 m!1287793))

(declare-fun m!1287795 () Bool)

(assert (=> b!1400312 m!1287795))

(declare-fun m!1287797 () Bool)

(assert (=> b!1400309 m!1287797))

(assert (=> b!1400311 m!1287769))

(declare-fun m!1287799 () Bool)

(assert (=> b!1400311 m!1287799))

(assert (=> b!1400311 m!1287769))

(declare-fun m!1287801 () Bool)

(assert (=> b!1400311 m!1287801))

(declare-fun m!1287803 () Bool)

(assert (=> b!1400311 m!1287803))

(assert (=> b!1400311 m!1287769))

(declare-fun m!1287805 () Bool)

(assert (=> b!1400311 m!1287805))

(check-sat (not start!120392) (not b!1400316) (not b!1400310) (not b!1400315) (not b!1400313) (not b!1400314) (not b!1400309) (not b!1400312) (not b!1400311))
(check-sat)
