; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119198 () Bool)

(assert start!119198)

(declare-fun b!1390416 () Bool)

(declare-fun res!930631 () Bool)

(declare-fun e!787405 () Bool)

(assert (=> b!1390416 (=> (not res!930631) (not e!787405))))

(declare-datatypes ((array!95088 0))(
  ( (array!95089 (arr!45910 (Array (_ BitVec 32) (_ BitVec 64))) (size!46462 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95088)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390416 (= res!930631 (validKeyInArray!0 (select (arr!45910 a!2901) i!1037)))))

(declare-fun b!1390417 () Bool)

(declare-datatypes ((SeekEntryResult!10253 0))(
  ( (MissingZero!10253 (index!43383 (_ BitVec 32))) (Found!10253 (index!43384 (_ BitVec 32))) (Intermediate!10253 (undefined!11065 Bool) (index!43385 (_ BitVec 32)) (x!125056 (_ BitVec 32))) (Undefined!10253) (MissingVacant!10253 (index!43386 (_ BitVec 32))) )
))
(declare-fun lt!610651 () SeekEntryResult!10253)

(declare-fun mask!2840 () (_ BitVec 32))

(get-info :version)

(assert (=> b!1390417 (= e!787405 (not (or (not ((_ is Intermediate!10253) lt!610651)) (undefined!11065 lt!610651) (bvsge mask!2840 #b00000000000000000000000000000000))))))

(declare-fun e!787404 () Bool)

(assert (=> b!1390417 e!787404))

(declare-fun res!930632 () Bool)

(assert (=> b!1390417 (=> (not res!930632) (not e!787404))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95088 (_ BitVec 32)) Bool)

(assert (=> b!1390417 (= res!930632 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46353 0))(
  ( (Unit!46354) )
))
(declare-fun lt!610652 () Unit!46353)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46353)

(assert (=> b!1390417 (= lt!610652 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95088 (_ BitVec 32)) SeekEntryResult!10253)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390417 (= lt!610651 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45910 a!2901) j!112) mask!2840) (select (arr!45910 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1390418 () Bool)

(declare-fun res!930630 () Bool)

(assert (=> b!1390418 (=> (not res!930630) (not e!787405))))

(declare-datatypes ((List!32507 0))(
  ( (Nil!32504) (Cons!32503 (h!33721 (_ BitVec 64)) (t!47193 List!32507)) )
))
(declare-fun arrayNoDuplicates!0 (array!95088 (_ BitVec 32) List!32507) Bool)

(assert (=> b!1390418 (= res!930630 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32504))))

(declare-fun b!1390420 () Bool)

(declare-fun res!930634 () Bool)

(assert (=> b!1390420 (=> (not res!930634) (not e!787405))))

(assert (=> b!1390420 (= res!930634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390421 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95088 (_ BitVec 32)) SeekEntryResult!10253)

(assert (=> b!1390421 (= e!787404 (= (seekEntryOrOpen!0 (select (arr!45910 a!2901) j!112) a!2901 mask!2840) (Found!10253 j!112)))))

(declare-fun b!1390422 () Bool)

(declare-fun res!930628 () Bool)

(assert (=> b!1390422 (=> (not res!930628) (not e!787405))))

(assert (=> b!1390422 (= res!930628 (and (= (size!46462 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46462 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46462 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!930629 () Bool)

(assert (=> start!119198 (=> (not res!930629) (not e!787405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119198 (= res!930629 (validMask!0 mask!2840))))

(assert (=> start!119198 e!787405))

(assert (=> start!119198 true))

(declare-fun array_inv!35143 (array!95088) Bool)

(assert (=> start!119198 (array_inv!35143 a!2901)))

(declare-fun b!1390419 () Bool)

(declare-fun res!930633 () Bool)

(assert (=> b!1390419 (=> (not res!930633) (not e!787405))))

(assert (=> b!1390419 (= res!930633 (validKeyInArray!0 (select (arr!45910 a!2901) j!112)))))

(assert (= (and start!119198 res!930629) b!1390422))

(assert (= (and b!1390422 res!930628) b!1390416))

(assert (= (and b!1390416 res!930631) b!1390419))

(assert (= (and b!1390419 res!930633) b!1390420))

(assert (= (and b!1390420 res!930634) b!1390418))

(assert (= (and b!1390418 res!930630) b!1390417))

(assert (= (and b!1390417 res!930632) b!1390421))

(declare-fun m!1275823 () Bool)

(assert (=> b!1390418 m!1275823))

(declare-fun m!1275825 () Bool)

(assert (=> b!1390416 m!1275825))

(assert (=> b!1390416 m!1275825))

(declare-fun m!1275827 () Bool)

(assert (=> b!1390416 m!1275827))

(declare-fun m!1275829 () Bool)

(assert (=> b!1390419 m!1275829))

(assert (=> b!1390419 m!1275829))

(declare-fun m!1275831 () Bool)

(assert (=> b!1390419 m!1275831))

(assert (=> b!1390417 m!1275829))

(declare-fun m!1275833 () Bool)

(assert (=> b!1390417 m!1275833))

(assert (=> b!1390417 m!1275829))

(declare-fun m!1275835 () Bool)

(assert (=> b!1390417 m!1275835))

(assert (=> b!1390417 m!1275833))

(assert (=> b!1390417 m!1275829))

(declare-fun m!1275837 () Bool)

(assert (=> b!1390417 m!1275837))

(declare-fun m!1275839 () Bool)

(assert (=> b!1390417 m!1275839))

(assert (=> b!1390421 m!1275829))

(assert (=> b!1390421 m!1275829))

(declare-fun m!1275841 () Bool)

(assert (=> b!1390421 m!1275841))

(declare-fun m!1275843 () Bool)

(assert (=> b!1390420 m!1275843))

(declare-fun m!1275845 () Bool)

(assert (=> start!119198 m!1275845))

(declare-fun m!1275847 () Bool)

(assert (=> start!119198 m!1275847))

(check-sat (not b!1390420) (not b!1390419) (not b!1390421) (not b!1390417) (not start!119198) (not b!1390418) (not b!1390416))
(check-sat)
