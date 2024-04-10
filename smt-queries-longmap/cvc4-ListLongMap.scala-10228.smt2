; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120424 () Bool)

(assert start!120424)

(declare-fun b!1402004 () Bool)

(declare-fun e!793894 () Bool)

(assert (=> b!1402004 (= e!793894 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95833 0))(
  ( (array!95834 (arr!46267 (Array (_ BitVec 32) (_ BitVec 64))) (size!46817 (_ BitVec 32))) )
))
(declare-fun lt!617348 () array!95833)

(declare-fun lt!617345 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10584 0))(
  ( (MissingZero!10584 (index!44713 (_ BitVec 32))) (Found!10584 (index!44714 (_ BitVec 32))) (Intermediate!10584 (undefined!11396 Bool) (index!44715 (_ BitVec 32)) (x!126339 (_ BitVec 32))) (Undefined!10584) (MissingVacant!10584 (index!44716 (_ BitVec 32))) )
))
(declare-fun lt!617344 () SeekEntryResult!10584)

(declare-fun lt!617349 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95833 (_ BitVec 32)) SeekEntryResult!10584)

(assert (=> b!1402004 (= lt!617344 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617345 lt!617349 lt!617348 mask!2840))))

(declare-fun b!1402006 () Bool)

(declare-fun e!793897 () Bool)

(assert (=> b!1402006 (= e!793897 e!793894)))

(declare-fun res!940515 () Bool)

(assert (=> b!1402006 (=> res!940515 e!793894)))

(declare-fun a!2901 () array!95833)

(declare-fun lt!617347 () SeekEntryResult!10584)

(declare-fun lt!617342 () SeekEntryResult!10584)

(assert (=> b!1402006 (= res!940515 (or (bvslt (x!126339 lt!617347) #b00000000000000000000000000000000) (bvsgt (x!126339 lt!617347) #b01111111111111111111111111111110) (bvslt (x!126339 lt!617342) #b00000000000000000000000000000000) (bvsgt (x!126339 lt!617342) #b01111111111111111111111111111110) (bvslt lt!617345 #b00000000000000000000000000000000) (bvsge lt!617345 (size!46817 a!2901)) (bvslt (index!44715 lt!617347) #b00000000000000000000000000000000) (bvsge (index!44715 lt!617347) (size!46817 a!2901)) (bvslt (index!44715 lt!617342) #b00000000000000000000000000000000) (bvsge (index!44715 lt!617342) (size!46817 a!2901)) (not (= lt!617347 (Intermediate!10584 false (index!44715 lt!617347) (x!126339 lt!617347)))) (not (= lt!617342 (Intermediate!10584 false (index!44715 lt!617342) (x!126339 lt!617342))))))))

(declare-fun e!793898 () Bool)

(assert (=> b!1402006 e!793898))

(declare-fun res!940521 () Bool)

(assert (=> b!1402006 (=> (not res!940521) (not e!793898))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1402006 (= res!940521 (and (not (undefined!11396 lt!617342)) (= (index!44715 lt!617342) i!1037) (bvslt (x!126339 lt!617342) (x!126339 lt!617347)) (= (select (store (arr!46267 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44715 lt!617342)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47172 0))(
  ( (Unit!47173) )
))
(declare-fun lt!617346 () Unit!47172)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47172)

(assert (=> b!1402006 (= lt!617346 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617345 (x!126339 lt!617347) (index!44715 lt!617347) (x!126339 lt!617342) (index!44715 lt!617342) (undefined!11396 lt!617342) mask!2840))))

(declare-fun b!1402007 () Bool)

(declare-fun e!793895 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95833 (_ BitVec 32)) SeekEntryResult!10584)

(assert (=> b!1402007 (= e!793895 (= (seekEntryOrOpen!0 (select (arr!46267 a!2901) j!112) a!2901 mask!2840) (Found!10584 j!112)))))

(declare-fun b!1402008 () Bool)

(declare-fun e!793892 () Bool)

(declare-fun e!793893 () Bool)

(assert (=> b!1402008 (= e!793892 (not e!793893))))

(declare-fun res!940517 () Bool)

(assert (=> b!1402008 (=> res!940517 e!793893)))

(assert (=> b!1402008 (= res!940517 (or (not (is-Intermediate!10584 lt!617347)) (undefined!11396 lt!617347)))))

(assert (=> b!1402008 e!793895))

(declare-fun res!940518 () Bool)

(assert (=> b!1402008 (=> (not res!940518) (not e!793895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95833 (_ BitVec 32)) Bool)

(assert (=> b!1402008 (= res!940518 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!617343 () Unit!47172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47172)

(assert (=> b!1402008 (= lt!617343 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402008 (= lt!617347 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617345 (select (arr!46267 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402008 (= lt!617345 (toIndex!0 (select (arr!46267 a!2901) j!112) mask!2840))))

(declare-fun b!1402009 () Bool)

(declare-fun res!940516 () Bool)

(assert (=> b!1402009 (=> (not res!940516) (not e!793892))))

(declare-datatypes ((List!32786 0))(
  ( (Nil!32783) (Cons!32782 (h!34030 (_ BitVec 64)) (t!47480 List!32786)) )
))
(declare-fun arrayNoDuplicates!0 (array!95833 (_ BitVec 32) List!32786) Bool)

(assert (=> b!1402009 (= res!940516 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32783))))

(declare-fun b!1402010 () Bool)

(declare-fun res!940522 () Bool)

(assert (=> b!1402010 (=> (not res!940522) (not e!793892))))

(assert (=> b!1402010 (= res!940522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!940520 () Bool)

(assert (=> start!120424 (=> (not res!940520) (not e!793892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120424 (= res!940520 (validMask!0 mask!2840))))

(assert (=> start!120424 e!793892))

(assert (=> start!120424 true))

(declare-fun array_inv!35295 (array!95833) Bool)

(assert (=> start!120424 (array_inv!35295 a!2901)))

(declare-fun b!1402005 () Bool)

(assert (=> b!1402005 (= e!793893 e!793897)))

(declare-fun res!940519 () Bool)

(assert (=> b!1402005 (=> res!940519 e!793897)))

(assert (=> b!1402005 (= res!940519 (or (= lt!617347 lt!617342) (not (is-Intermediate!10584 lt!617342))))))

(assert (=> b!1402005 (= lt!617342 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617349 mask!2840) lt!617349 lt!617348 mask!2840))))

(assert (=> b!1402005 (= lt!617349 (select (store (arr!46267 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402005 (= lt!617348 (array!95834 (store (arr!46267 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46817 a!2901)))))

(declare-fun b!1402011 () Bool)

(declare-fun res!940524 () Bool)

(assert (=> b!1402011 (=> (not res!940524) (not e!793892))))

(assert (=> b!1402011 (= res!940524 (and (= (size!46817 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46817 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46817 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402012 () Bool)

(declare-fun res!940523 () Bool)

(assert (=> b!1402012 (=> (not res!940523) (not e!793892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402012 (= res!940523 (validKeyInArray!0 (select (arr!46267 a!2901) j!112)))))

(declare-fun b!1402013 () Bool)

(declare-fun res!940525 () Bool)

(assert (=> b!1402013 (=> (not res!940525) (not e!793892))))

(assert (=> b!1402013 (= res!940525 (validKeyInArray!0 (select (arr!46267 a!2901) i!1037)))))

(declare-fun b!1402014 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95833 (_ BitVec 32)) SeekEntryResult!10584)

(assert (=> b!1402014 (= e!793898 (= (seekEntryOrOpen!0 lt!617349 lt!617348 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126339 lt!617342) (index!44715 lt!617342) (index!44715 lt!617342) (select (arr!46267 a!2901) j!112) lt!617348 mask!2840)))))

(assert (= (and start!120424 res!940520) b!1402011))

(assert (= (and b!1402011 res!940524) b!1402013))

(assert (= (and b!1402013 res!940525) b!1402012))

(assert (= (and b!1402012 res!940523) b!1402010))

(assert (= (and b!1402010 res!940522) b!1402009))

(assert (= (and b!1402009 res!940516) b!1402008))

(assert (= (and b!1402008 res!940518) b!1402007))

(assert (= (and b!1402008 (not res!940517)) b!1402005))

(assert (= (and b!1402005 (not res!940519)) b!1402006))

(assert (= (and b!1402006 res!940521) b!1402014))

(assert (= (and b!1402006 (not res!940515)) b!1402004))

(declare-fun m!1289977 () Bool)

(assert (=> b!1402012 m!1289977))

(assert (=> b!1402012 m!1289977))

(declare-fun m!1289979 () Bool)

(assert (=> b!1402012 m!1289979))

(declare-fun m!1289981 () Bool)

(assert (=> b!1402014 m!1289981))

(assert (=> b!1402014 m!1289977))

(assert (=> b!1402014 m!1289977))

(declare-fun m!1289983 () Bool)

(assert (=> b!1402014 m!1289983))

(declare-fun m!1289985 () Bool)

(assert (=> b!1402010 m!1289985))

(declare-fun m!1289987 () Bool)

(assert (=> b!1402004 m!1289987))

(declare-fun m!1289989 () Bool)

(assert (=> b!1402006 m!1289989))

(declare-fun m!1289991 () Bool)

(assert (=> b!1402006 m!1289991))

(declare-fun m!1289993 () Bool)

(assert (=> b!1402006 m!1289993))

(declare-fun m!1289995 () Bool)

(assert (=> b!1402005 m!1289995))

(assert (=> b!1402005 m!1289995))

(declare-fun m!1289997 () Bool)

(assert (=> b!1402005 m!1289997))

(assert (=> b!1402005 m!1289989))

(declare-fun m!1289999 () Bool)

(assert (=> b!1402005 m!1289999))

(assert (=> b!1402008 m!1289977))

(declare-fun m!1290001 () Bool)

(assert (=> b!1402008 m!1290001))

(assert (=> b!1402008 m!1289977))

(assert (=> b!1402008 m!1289977))

(declare-fun m!1290003 () Bool)

(assert (=> b!1402008 m!1290003))

(declare-fun m!1290005 () Bool)

(assert (=> b!1402008 m!1290005))

(declare-fun m!1290007 () Bool)

(assert (=> b!1402008 m!1290007))

(assert (=> b!1402007 m!1289977))

(assert (=> b!1402007 m!1289977))

(declare-fun m!1290009 () Bool)

(assert (=> b!1402007 m!1290009))

(declare-fun m!1290011 () Bool)

(assert (=> b!1402013 m!1290011))

(assert (=> b!1402013 m!1290011))

(declare-fun m!1290013 () Bool)

(assert (=> b!1402013 m!1290013))

(declare-fun m!1290015 () Bool)

(assert (=> b!1402009 m!1290015))

(declare-fun m!1290017 () Bool)

(assert (=> start!120424 m!1290017))

(declare-fun m!1290019 () Bool)

(assert (=> start!120424 m!1290019))

(push 1)

