; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120020 () Bool)

(assert start!120020)

(declare-fun b!1397230 () Bool)

(declare-fun e!791014 () Bool)

(declare-fun e!791018 () Bool)

(assert (=> b!1397230 (= e!791014 (not e!791018))))

(declare-fun res!936146 () Bool)

(assert (=> b!1397230 (=> res!936146 e!791018)))

(declare-datatypes ((SeekEntryResult!10445 0))(
  ( (MissingZero!10445 (index!44151 (_ BitVec 32))) (Found!10445 (index!44152 (_ BitVec 32))) (Intermediate!10445 (undefined!11257 Bool) (index!44153 (_ BitVec 32)) (x!125811 (_ BitVec 32))) (Undefined!10445) (MissingVacant!10445 (index!44154 (_ BitVec 32))) )
))
(declare-fun lt!614043 () SeekEntryResult!10445)

(get-info :version)

(assert (=> b!1397230 (= res!936146 (or (not ((_ is Intermediate!10445) lt!614043)) (undefined!11257 lt!614043)))))

(declare-fun e!791016 () Bool)

(assert (=> b!1397230 e!791016))

(declare-fun res!936143 () Bool)

(assert (=> b!1397230 (=> (not res!936143) (not e!791016))))

(declare-datatypes ((array!95549 0))(
  ( (array!95550 (arr!46128 (Array (_ BitVec 32) (_ BitVec 64))) (size!46678 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95549)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95549 (_ BitVec 32)) Bool)

(assert (=> b!1397230 (= res!936143 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46894 0))(
  ( (Unit!46895) )
))
(declare-fun lt!614044 () Unit!46894)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95549 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46894)

(assert (=> b!1397230 (= lt!614044 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!614042 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95549 (_ BitVec 32)) SeekEntryResult!10445)

(assert (=> b!1397230 (= lt!614043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614042 (select (arr!46128 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1397230 (= lt!614042 (toIndex!0 (select (arr!46128 a!2901) j!112) mask!2840))))

(declare-fun b!1397231 () Bool)

(declare-fun res!936145 () Bool)

(assert (=> b!1397231 (=> (not res!936145) (not e!791014))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1397231 (= res!936145 (validKeyInArray!0 (select (arr!46128 a!2901) j!112)))))

(declare-fun b!1397232 () Bool)

(declare-fun res!936147 () Bool)

(assert (=> b!1397232 (=> (not res!936147) (not e!791014))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1397232 (= res!936147 (validKeyInArray!0 (select (arr!46128 a!2901) i!1037)))))

(declare-fun b!1397233 () Bool)

(declare-fun res!936148 () Bool)

(assert (=> b!1397233 (=> (not res!936148) (not e!791014))))

(assert (=> b!1397233 (= res!936148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!936151 () Bool)

(assert (=> start!120020 (=> (not res!936151) (not e!791014))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120020 (= res!936151 (validMask!0 mask!2840))))

(assert (=> start!120020 e!791014))

(assert (=> start!120020 true))

(declare-fun array_inv!35156 (array!95549) Bool)

(assert (=> start!120020 (array_inv!35156 a!2901)))

(declare-fun b!1397234 () Bool)

(declare-fun res!936150 () Bool)

(assert (=> b!1397234 (=> (not res!936150) (not e!791014))))

(assert (=> b!1397234 (= res!936150 (and (= (size!46678 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46678 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46678 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1397235 () Bool)

(declare-fun e!791017 () Bool)

(assert (=> b!1397235 (= e!791018 e!791017)))

(declare-fun res!936149 () Bool)

(assert (=> b!1397235 (=> res!936149 e!791017)))

(declare-fun lt!614041 () SeekEntryResult!10445)

(assert (=> b!1397235 (= res!936149 (or (= lt!614043 lt!614041) (not ((_ is Intermediate!10445) lt!614041)) (bvslt (x!125811 lt!614043) #b00000000000000000000000000000000) (bvsgt (x!125811 lt!614043) #b01111111111111111111111111111110) (bvslt lt!614042 #b00000000000000000000000000000000) (bvsge lt!614042 (size!46678 a!2901)) (bvslt (index!44153 lt!614043) #b00000000000000000000000000000000) (bvsge (index!44153 lt!614043) (size!46678 a!2901)) (not (= lt!614043 (Intermediate!10445 false (index!44153 lt!614043) (x!125811 lt!614043)))) (not (= lt!614041 (Intermediate!10445 (undefined!11257 lt!614041) (index!44153 lt!614041) (x!125811 lt!614041))))))))

(declare-fun lt!614046 () (_ BitVec 64))

(declare-fun lt!614040 () array!95549)

(assert (=> b!1397235 (= lt!614041 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!614046 mask!2840) lt!614046 lt!614040 mask!2840))))

(assert (=> b!1397235 (= lt!614046 (select (store (arr!46128 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1397235 (= lt!614040 (array!95550 (store (arr!46128 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46678 a!2901)))))

(declare-fun b!1397236 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95549 (_ BitVec 32)) SeekEntryResult!10445)

(assert (=> b!1397236 (= e!791016 (= (seekEntryOrOpen!0 (select (arr!46128 a!2901) j!112) a!2901 mask!2840) (Found!10445 j!112)))))

(declare-fun b!1397237 () Bool)

(declare-fun res!936144 () Bool)

(assert (=> b!1397237 (=> (not res!936144) (not e!791014))))

(declare-datatypes ((List!32647 0))(
  ( (Nil!32644) (Cons!32643 (h!33885 (_ BitVec 64)) (t!47341 List!32647)) )
))
(declare-fun arrayNoDuplicates!0 (array!95549 (_ BitVec 32) List!32647) Bool)

(assert (=> b!1397237 (= res!936144 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32644))))

(declare-fun b!1397238 () Bool)

(assert (=> b!1397238 (= e!791017 true)))

(declare-fun lt!614045 () SeekEntryResult!10445)

(assert (=> b!1397238 (= lt!614045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!614042 lt!614046 lt!614040 mask!2840))))

(assert (= (and start!120020 res!936151) b!1397234))

(assert (= (and b!1397234 res!936150) b!1397232))

(assert (= (and b!1397232 res!936147) b!1397231))

(assert (= (and b!1397231 res!936145) b!1397233))

(assert (= (and b!1397233 res!936148) b!1397237))

(assert (= (and b!1397237 res!936144) b!1397230))

(assert (= (and b!1397230 res!936143) b!1397236))

(assert (= (and b!1397230 (not res!936146)) b!1397235))

(assert (= (and b!1397235 (not res!936149)) b!1397238))

(declare-fun m!1283931 () Bool)

(assert (=> b!1397231 m!1283931))

(assert (=> b!1397231 m!1283931))

(declare-fun m!1283933 () Bool)

(assert (=> b!1397231 m!1283933))

(declare-fun m!1283935 () Bool)

(assert (=> start!120020 m!1283935))

(declare-fun m!1283937 () Bool)

(assert (=> start!120020 m!1283937))

(declare-fun m!1283939 () Bool)

(assert (=> b!1397238 m!1283939))

(declare-fun m!1283941 () Bool)

(assert (=> b!1397232 m!1283941))

(assert (=> b!1397232 m!1283941))

(declare-fun m!1283943 () Bool)

(assert (=> b!1397232 m!1283943))

(declare-fun m!1283945 () Bool)

(assert (=> b!1397235 m!1283945))

(assert (=> b!1397235 m!1283945))

(declare-fun m!1283947 () Bool)

(assert (=> b!1397235 m!1283947))

(declare-fun m!1283949 () Bool)

(assert (=> b!1397235 m!1283949))

(declare-fun m!1283951 () Bool)

(assert (=> b!1397235 m!1283951))

(declare-fun m!1283953 () Bool)

(assert (=> b!1397237 m!1283953))

(assert (=> b!1397236 m!1283931))

(assert (=> b!1397236 m!1283931))

(declare-fun m!1283955 () Bool)

(assert (=> b!1397236 m!1283955))

(assert (=> b!1397230 m!1283931))

(declare-fun m!1283957 () Bool)

(assert (=> b!1397230 m!1283957))

(assert (=> b!1397230 m!1283931))

(declare-fun m!1283959 () Bool)

(assert (=> b!1397230 m!1283959))

(declare-fun m!1283961 () Bool)

(assert (=> b!1397230 m!1283961))

(assert (=> b!1397230 m!1283931))

(declare-fun m!1283963 () Bool)

(assert (=> b!1397230 m!1283963))

(declare-fun m!1283965 () Bool)

(assert (=> b!1397233 m!1283965))

(check-sat (not b!1397235) (not b!1397236) (not b!1397238) (not start!120020) (not b!1397233) (not b!1397237) (not b!1397231) (not b!1397232) (not b!1397230))
(check-sat)
