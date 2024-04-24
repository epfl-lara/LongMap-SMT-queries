; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120644 () Bool)

(assert start!120644)

(declare-fun b!1403643 () Bool)

(declare-fun res!941474 () Bool)

(declare-fun e!794909 () Bool)

(assert (=> b!1403643 (=> (not res!941474) (not e!794909))))

(declare-datatypes ((array!95975 0))(
  ( (array!95976 (arr!46336 (Array (_ BitVec 32) (_ BitVec 64))) (size!46887 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95975)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95975 (_ BitVec 32)) Bool)

(assert (=> b!1403643 (= res!941474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403644 () Bool)

(declare-fun e!794910 () Bool)

(assert (=> b!1403644 (= e!794909 (not e!794910))))

(declare-fun res!941479 () Bool)

(assert (=> b!1403644 (=> res!941479 e!794910)))

(declare-datatypes ((SeekEntryResult!10556 0))(
  ( (MissingZero!10556 (index!44601 (_ BitVec 32))) (Found!10556 (index!44602 (_ BitVec 32))) (Intermediate!10556 (undefined!11368 Bool) (index!44603 (_ BitVec 32)) (x!126378 (_ BitVec 32))) (Undefined!10556) (MissingVacant!10556 (index!44604 (_ BitVec 32))) )
))
(declare-fun lt!618190 () SeekEntryResult!10556)

(get-info :version)

(assert (=> b!1403644 (= res!941479 (or (not ((_ is Intermediate!10556) lt!618190)) (undefined!11368 lt!618190)))))

(declare-fun lt!618185 () SeekEntryResult!10556)

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403644 (= lt!618185 (Found!10556 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95975 (_ BitVec 32)) SeekEntryResult!10556)

(assert (=> b!1403644 (= lt!618185 (seekEntryOrOpen!0 (select (arr!46336 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1403644 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47143 0))(
  ( (Unit!47144) )
))
(declare-fun lt!618186 () Unit!47143)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47143)

(assert (=> b!1403644 (= lt!618186 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618189 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95975 (_ BitVec 32)) SeekEntryResult!10556)

(assert (=> b!1403644 (= lt!618190 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618189 (select (arr!46336 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403644 (= lt!618189 (toIndex!0 (select (arr!46336 a!2901) j!112) mask!2840))))

(declare-fun b!1403645 () Bool)

(declare-fun res!941473 () Bool)

(declare-fun e!794912 () Bool)

(assert (=> b!1403645 (=> res!941473 e!794912)))

(declare-fun lt!618183 () array!95975)

(declare-fun lt!618191 () (_ BitVec 64))

(declare-fun lt!618184 () SeekEntryResult!10556)

(assert (=> b!1403645 (= res!941473 (not (= lt!618184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!618189 lt!618191 lt!618183 mask!2840))))))

(declare-fun b!1403646 () Bool)

(assert (=> b!1403646 (= e!794912 true)))

(declare-fun lt!618188 () SeekEntryResult!10556)

(assert (=> b!1403646 (= lt!618185 lt!618188)))

(declare-fun lt!618187 () Unit!47143)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47143)

(assert (=> b!1403646 (= lt!618187 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618189 (x!126378 lt!618190) (index!44603 lt!618190) (x!126378 lt!618184) (index!44603 lt!618184) mask!2840))))

(declare-fun b!1403647 () Bool)

(declare-fun res!941472 () Bool)

(assert (=> b!1403647 (=> (not res!941472) (not e!794909))))

(assert (=> b!1403647 (= res!941472 (and (= (size!46887 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46887 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46887 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403648 () Bool)

(declare-fun e!794911 () Bool)

(assert (=> b!1403648 (= e!794911 e!794912)))

(declare-fun res!941478 () Bool)

(assert (=> b!1403648 (=> res!941478 e!794912)))

(assert (=> b!1403648 (= res!941478 (or (bvslt (x!126378 lt!618190) #b00000000000000000000000000000000) (bvsgt (x!126378 lt!618190) #b01111111111111111111111111111110) (bvslt (x!126378 lt!618184) #b00000000000000000000000000000000) (bvsgt (x!126378 lt!618184) #b01111111111111111111111111111110) (bvslt lt!618189 #b00000000000000000000000000000000) (bvsge lt!618189 (size!46887 a!2901)) (bvslt (index!44603 lt!618190) #b00000000000000000000000000000000) (bvsge (index!44603 lt!618190) (size!46887 a!2901)) (bvslt (index!44603 lt!618184) #b00000000000000000000000000000000) (bvsge (index!44603 lt!618184) (size!46887 a!2901)) (not (= lt!618190 (Intermediate!10556 false (index!44603 lt!618190) (x!126378 lt!618190)))) (not (= lt!618184 (Intermediate!10556 false (index!44603 lt!618184) (x!126378 lt!618184))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95975 (_ BitVec 32)) SeekEntryResult!10556)

(assert (=> b!1403648 (= lt!618188 (seekKeyOrZeroReturnVacant!0 (x!126378 lt!618184) (index!44603 lt!618184) (index!44603 lt!618184) (select (arr!46336 a!2901) j!112) lt!618183 mask!2840))))

(assert (=> b!1403648 (= lt!618188 (seekEntryOrOpen!0 lt!618191 lt!618183 mask!2840))))

(assert (=> b!1403648 (and (not (undefined!11368 lt!618184)) (= (index!44603 lt!618184) i!1037) (bvslt (x!126378 lt!618184) (x!126378 lt!618190)) (= (select (store (arr!46336 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44603 lt!618184)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!618182 () Unit!47143)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47143)

(assert (=> b!1403648 (= lt!618182 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!618189 (x!126378 lt!618190) (index!44603 lt!618190) (x!126378 lt!618184) (index!44603 lt!618184) (undefined!11368 lt!618184) mask!2840))))

(declare-fun b!1403649 () Bool)

(declare-fun res!941470 () Bool)

(assert (=> b!1403649 (=> (not res!941470) (not e!794909))))

(declare-datatypes ((List!32842 0))(
  ( (Nil!32839) (Cons!32838 (h!34094 (_ BitVec 64)) (t!47528 List!32842)) )
))
(declare-fun arrayNoDuplicates!0 (array!95975 (_ BitVec 32) List!32842) Bool)

(assert (=> b!1403649 (= res!941470 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32839))))

(declare-fun b!1403650 () Bool)

(declare-fun res!941477 () Bool)

(assert (=> b!1403650 (=> (not res!941477) (not e!794909))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403650 (= res!941477 (validKeyInArray!0 (select (arr!46336 a!2901) i!1037)))))

(declare-fun b!1403651 () Bool)

(assert (=> b!1403651 (= e!794910 e!794911)))

(declare-fun res!941475 () Bool)

(assert (=> b!1403651 (=> res!941475 e!794911)))

(assert (=> b!1403651 (= res!941475 (or (= lt!618190 lt!618184) (not ((_ is Intermediate!10556) lt!618184))))))

(assert (=> b!1403651 (= lt!618184 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!618191 mask!2840) lt!618191 lt!618183 mask!2840))))

(assert (=> b!1403651 (= lt!618191 (select (store (arr!46336 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1403651 (= lt!618183 (array!95976 (store (arr!46336 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46887 a!2901)))))

(declare-fun b!1403652 () Bool)

(declare-fun res!941471 () Bool)

(assert (=> b!1403652 (=> (not res!941471) (not e!794909))))

(assert (=> b!1403652 (= res!941471 (validKeyInArray!0 (select (arr!46336 a!2901) j!112)))))

(declare-fun res!941476 () Bool)

(assert (=> start!120644 (=> (not res!941476) (not e!794909))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120644 (= res!941476 (validMask!0 mask!2840))))

(assert (=> start!120644 e!794909))

(assert (=> start!120644 true))

(declare-fun array_inv!35617 (array!95975) Bool)

(assert (=> start!120644 (array_inv!35617 a!2901)))

(assert (= (and start!120644 res!941476) b!1403647))

(assert (= (and b!1403647 res!941472) b!1403650))

(assert (= (and b!1403650 res!941477) b!1403652))

(assert (= (and b!1403652 res!941471) b!1403643))

(assert (= (and b!1403643 res!941474) b!1403649))

(assert (= (and b!1403649 res!941470) b!1403644))

(assert (= (and b!1403644 (not res!941479)) b!1403651))

(assert (= (and b!1403651 (not res!941475)) b!1403648))

(assert (= (and b!1403648 (not res!941478)) b!1403645))

(assert (= (and b!1403645 (not res!941473)) b!1403646))

(declare-fun m!1292071 () Bool)

(assert (=> b!1403649 m!1292071))

(declare-fun m!1292073 () Bool)

(assert (=> b!1403646 m!1292073))

(declare-fun m!1292075 () Bool)

(assert (=> b!1403651 m!1292075))

(assert (=> b!1403651 m!1292075))

(declare-fun m!1292077 () Bool)

(assert (=> b!1403651 m!1292077))

(declare-fun m!1292079 () Bool)

(assert (=> b!1403651 m!1292079))

(declare-fun m!1292081 () Bool)

(assert (=> b!1403651 m!1292081))

(declare-fun m!1292083 () Bool)

(assert (=> b!1403648 m!1292083))

(declare-fun m!1292085 () Bool)

(assert (=> b!1403648 m!1292085))

(declare-fun m!1292087 () Bool)

(assert (=> b!1403648 m!1292087))

(declare-fun m!1292089 () Bool)

(assert (=> b!1403648 m!1292089))

(assert (=> b!1403648 m!1292079))

(assert (=> b!1403648 m!1292085))

(declare-fun m!1292091 () Bool)

(assert (=> b!1403648 m!1292091))

(assert (=> b!1403644 m!1292085))

(declare-fun m!1292093 () Bool)

(assert (=> b!1403644 m!1292093))

(assert (=> b!1403644 m!1292085))

(assert (=> b!1403644 m!1292085))

(declare-fun m!1292095 () Bool)

(assert (=> b!1403644 m!1292095))

(declare-fun m!1292097 () Bool)

(assert (=> b!1403644 m!1292097))

(assert (=> b!1403644 m!1292085))

(declare-fun m!1292099 () Bool)

(assert (=> b!1403644 m!1292099))

(declare-fun m!1292101 () Bool)

(assert (=> b!1403644 m!1292101))

(declare-fun m!1292103 () Bool)

(assert (=> b!1403650 m!1292103))

(assert (=> b!1403650 m!1292103))

(declare-fun m!1292105 () Bool)

(assert (=> b!1403650 m!1292105))

(declare-fun m!1292107 () Bool)

(assert (=> b!1403643 m!1292107))

(declare-fun m!1292109 () Bool)

(assert (=> start!120644 m!1292109))

(declare-fun m!1292111 () Bool)

(assert (=> start!120644 m!1292111))

(assert (=> b!1403652 m!1292085))

(assert (=> b!1403652 m!1292085))

(declare-fun m!1292113 () Bool)

(assert (=> b!1403652 m!1292113))

(declare-fun m!1292115 () Bool)

(assert (=> b!1403645 m!1292115))

(check-sat (not b!1403643) (not b!1403652) (not b!1403649) (not b!1403645) (not start!120644) (not b!1403644) (not b!1403651) (not b!1403650) (not b!1403646) (not b!1403648))
(check-sat)
