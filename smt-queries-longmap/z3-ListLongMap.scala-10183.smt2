; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120026 () Bool)

(assert start!120026)

(declare-fun res!936226 () Bool)

(declare-fun e!791061 () Bool)

(assert (=> start!120026 (=> (not res!936226) (not e!791061))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120026 (= res!936226 (validMask!0 mask!2840))))

(assert (=> start!120026 e!791061))

(assert (=> start!120026 true))

(declare-datatypes ((array!95555 0))(
  ( (array!95556 (arr!46131 (Array (_ BitVec 32) (_ BitVec 64))) (size!46681 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95555)

(declare-fun array_inv!35159 (array!95555) Bool)

(assert (=> start!120026 (array_inv!35159 a!2901)))

(declare-fun b!1397311 () Bool)

(declare-fun e!791063 () Bool)

(assert (=> b!1397311 (= e!791061 (not e!791063))))

(declare-fun res!936229 () Bool)

(assert (=> b!1397311 (=> res!936229 e!791063)))

(declare-datatypes ((SeekEntryResult!10448 0))(
  ( (MissingZero!10448 (index!44163 (_ BitVec 32))) (Found!10448 (index!44164 (_ BitVec 32))) (Intermediate!10448 (undefined!11260 Bool) (index!44165 (_ BitVec 32)) (x!125822 (_ BitVec 32))) (Undefined!10448) (MissingVacant!10448 (index!44166 (_ BitVec 32))) )
))
(declare-fun lt!614108 () SeekEntryResult!10448)

(get-info :version)

(assert (=> b!1397311 (= res!936229 (or (not ((_ is Intermediate!10448) lt!614108)) (undefined!11260 lt!614108)))))

(declare-fun e!791060 () Bool)

(assert (=> b!1397311 e!791060))

(declare-fun res!936225 () Bool)

(assert (=> b!1397311 (=> (not res!936225) (not e!791060))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95555 (_ BitVec 32)) Bool)

(assert (=> b!1397311 (= res!936225 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46900 0))(
  ( (Unit!46901) )
))
(declare-fun lt!614107 () Unit!46900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95555 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46900)

(assert (=> b!1397311 (= lt!614107 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614106 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95555 (_ BitVec 32)) SeekEntryResult!10448)

(assert (=> b!1397311 (= lt!614108 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614106 (select (arr!46131 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397311 (= lt!614106 (toIndex!0 (select (arr!46131 a!2901) j!112) mask!2840))))

(declare-fun b!1397312 () Bool)

(declare-fun res!936230 () Bool)

(assert (=> b!1397312 (=> (not res!936230) (not e!791061))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397312 (= res!936230 (validKeyInArray!0 (select (arr!46131 a!2901) i!1037)))))

(declare-fun b!1397313 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95555 (_ BitVec 32)) SeekEntryResult!10448)

(assert (=> b!1397313 (= e!791060 (= (seekEntryOrOpen!0 (select (arr!46131 a!2901) j!112) a!2901 mask!2840) (Found!10448 j!112)))))

(declare-fun b!1397314 () Bool)

(declare-fun res!936224 () Bool)

(assert (=> b!1397314 (=> (not res!936224) (not e!791061))))

(declare-datatypes ((List!32650 0))(
  ( (Nil!32647) (Cons!32646 (h!33888 (_ BitVec 64)) (t!47344 List!32650)) )
))
(declare-fun arrayNoDuplicates!0 (array!95555 (_ BitVec 32) List!32650) Bool)

(assert (=> b!1397314 (= res!936224 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32647))))

(declare-fun b!1397315 () Bool)

(declare-fun res!936231 () Bool)

(assert (=> b!1397315 (=> (not res!936231) (not e!791061))))

(assert (=> b!1397315 (= res!936231 (and (= (size!46681 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46681 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46681 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397316 () Bool)

(declare-fun res!936227 () Bool)

(assert (=> b!1397316 (=> (not res!936227) (not e!791061))))

(assert (=> b!1397316 (= res!936227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1397317 () Bool)

(declare-fun e!791059 () Bool)

(assert (=> b!1397317 (= e!791059 true)))

(declare-fun lt!614104 () array!95555)

(declare-fun lt!614103 () (_ BitVec 64))

(declare-fun lt!614109 () SeekEntryResult!10448)

(assert (=> b!1397317 (= lt!614109 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614106 lt!614103 lt!614104 mask!2840))))

(declare-fun b!1397318 () Bool)

(assert (=> b!1397318 (= e!791063 e!791059)))

(declare-fun res!936232 () Bool)

(assert (=> b!1397318 (=> res!936232 e!791059)))

(declare-fun lt!614105 () SeekEntryResult!10448)

(assert (=> b!1397318 (= res!936232 (or (= lt!614108 lt!614105) (not ((_ is Intermediate!10448) lt!614105)) (bvslt (x!125822 lt!614108) #b00000000000000000000000000000000) (bvsgt (x!125822 lt!614108) #b01111111111111111111111111111110) (bvslt lt!614106 #b00000000000000000000000000000000) (bvsge lt!614106 (size!46681 a!2901)) (bvslt (index!44165 lt!614108) #b00000000000000000000000000000000) (bvsge (index!44165 lt!614108) (size!46681 a!2901)) (not (= lt!614108 (Intermediate!10448 false (index!44165 lt!614108) (x!125822 lt!614108)))) (not (= lt!614105 (Intermediate!10448 (undefined!11260 lt!614105) (index!44165 lt!614105) (x!125822 lt!614105))))))))

(assert (=> b!1397318 (= lt!614105 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614103 mask!2840) lt!614103 lt!614104 mask!2840))))

(assert (=> b!1397318 (= lt!614103 (select (store (arr!46131 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397318 (= lt!614104 (array!95556 (store (arr!46131 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46681 a!2901)))))

(declare-fun b!1397319 () Bool)

(declare-fun res!936228 () Bool)

(assert (=> b!1397319 (=> (not res!936228) (not e!791061))))

(assert (=> b!1397319 (= res!936228 (validKeyInArray!0 (select (arr!46131 a!2901) j!112)))))

(assert (= (and start!120026 res!936226) b!1397315))

(assert (= (and b!1397315 res!936231) b!1397312))

(assert (= (and b!1397312 res!936230) b!1397319))

(assert (= (and b!1397319 res!936228) b!1397316))

(assert (= (and b!1397316 res!936227) b!1397314))

(assert (= (and b!1397314 res!936224) b!1397311))

(assert (= (and b!1397311 res!936225) b!1397313))

(assert (= (and b!1397311 (not res!936229)) b!1397318))

(assert (= (and b!1397318 (not res!936232)) b!1397317))

(declare-fun m!1284039 () Bool)

(assert (=> b!1397311 m!1284039))

(declare-fun m!1284041 () Bool)

(assert (=> b!1397311 m!1284041))

(assert (=> b!1397311 m!1284039))

(declare-fun m!1284043 () Bool)

(assert (=> b!1397311 m!1284043))

(assert (=> b!1397311 m!1284039))

(declare-fun m!1284045 () Bool)

(assert (=> b!1397311 m!1284045))

(declare-fun m!1284047 () Bool)

(assert (=> b!1397311 m!1284047))

(assert (=> b!1397319 m!1284039))

(assert (=> b!1397319 m!1284039))

(declare-fun m!1284049 () Bool)

(assert (=> b!1397319 m!1284049))

(declare-fun m!1284051 () Bool)

(assert (=> b!1397312 m!1284051))

(assert (=> b!1397312 m!1284051))

(declare-fun m!1284053 () Bool)

(assert (=> b!1397312 m!1284053))

(declare-fun m!1284055 () Bool)

(assert (=> b!1397317 m!1284055))

(declare-fun m!1284057 () Bool)

(assert (=> b!1397314 m!1284057))

(declare-fun m!1284059 () Bool)

(assert (=> start!120026 m!1284059))

(declare-fun m!1284061 () Bool)

(assert (=> start!120026 m!1284061))

(declare-fun m!1284063 () Bool)

(assert (=> b!1397318 m!1284063))

(assert (=> b!1397318 m!1284063))

(declare-fun m!1284065 () Bool)

(assert (=> b!1397318 m!1284065))

(declare-fun m!1284067 () Bool)

(assert (=> b!1397318 m!1284067))

(declare-fun m!1284069 () Bool)

(assert (=> b!1397318 m!1284069))

(declare-fun m!1284071 () Bool)

(assert (=> b!1397316 m!1284071))

(assert (=> b!1397313 m!1284039))

(assert (=> b!1397313 m!1284039))

(declare-fun m!1284073 () Bool)

(assert (=> b!1397313 m!1284073))

(check-sat (not b!1397311) (not b!1397319) (not b!1397318) (not b!1397312) (not b!1397316) (not b!1397314) (not b!1397317) (not b!1397313) (not start!120026))
(check-sat)
