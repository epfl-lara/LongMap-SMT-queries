; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119602 () Bool)

(assert start!119602)

(declare-fun res!932575 () Bool)

(declare-fun e!788879 () Bool)

(assert (=> start!119602 (=> (not res!932575) (not e!788879))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119602 (= res!932575 (validMask!0 mask!2840))))

(assert (=> start!119602 e!788879))

(assert (=> start!119602 true))

(declare-datatypes ((array!95284 0))(
  ( (array!95285 (arr!46000 (Array (_ BitVec 32) (_ BitVec 64))) (size!46550 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95284)

(declare-fun array_inv!35028 (array!95284) Bool)

(assert (=> start!119602 (array_inv!35028 a!2901)))

(declare-fun b!1393163 () Bool)

(declare-fun e!788882 () Bool)

(assert (=> b!1393163 (= e!788882 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10317 0))(
  ( (MissingZero!10317 (index!43639 (_ BitVec 32))) (Found!10317 (index!43640 (_ BitVec 32))) (Intermediate!10317 (undefined!11129 Bool) (index!43641 (_ BitVec 32)) (x!125321 (_ BitVec 32))) (Undefined!10317) (MissingVacant!10317 (index!43642 (_ BitVec 32))) )
))
(declare-fun lt!611887 () SeekEntryResult!10317)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95284 (_ BitVec 32)) SeekEntryResult!10317)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393163 (= lt!611887 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46000 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46000 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95285 (store (arr!46000 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46550 a!2901)) mask!2840))))

(declare-fun b!1393164 () Bool)

(declare-fun res!932572 () Bool)

(assert (=> b!1393164 (=> (not res!932572) (not e!788879))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393164 (= res!932572 (validKeyInArray!0 (select (arr!46000 a!2901) j!112)))))

(declare-fun b!1393165 () Bool)

(declare-fun res!932578 () Bool)

(assert (=> b!1393165 (=> (not res!932578) (not e!788879))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95284 (_ BitVec 32)) Bool)

(assert (=> b!1393165 (= res!932578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393166 () Bool)

(declare-fun res!932573 () Bool)

(assert (=> b!1393166 (=> (not res!932573) (not e!788879))))

(declare-datatypes ((List!32519 0))(
  ( (Nil!32516) (Cons!32515 (h!33748 (_ BitVec 64)) (t!47213 List!32519)) )
))
(declare-fun arrayNoDuplicates!0 (array!95284 (_ BitVec 32) List!32519) Bool)

(assert (=> b!1393166 (= res!932573 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32516))))

(declare-fun b!1393167 () Bool)

(declare-fun e!788881 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95284 (_ BitVec 32)) SeekEntryResult!10317)

(assert (=> b!1393167 (= e!788881 (= (seekEntryOrOpen!0 (select (arr!46000 a!2901) j!112) a!2901 mask!2840) (Found!10317 j!112)))))

(declare-fun b!1393168 () Bool)

(declare-fun res!932574 () Bool)

(assert (=> b!1393168 (=> (not res!932574) (not e!788879))))

(assert (=> b!1393168 (= res!932574 (validKeyInArray!0 (select (arr!46000 a!2901) i!1037)))))

(declare-fun b!1393169 () Bool)

(declare-fun res!932577 () Bool)

(assert (=> b!1393169 (=> (not res!932577) (not e!788879))))

(assert (=> b!1393169 (= res!932577 (and (= (size!46550 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46550 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46550 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393170 () Bool)

(assert (=> b!1393170 (= e!788879 (not e!788882))))

(declare-fun res!932576 () Bool)

(assert (=> b!1393170 (=> res!932576 e!788882)))

(declare-fun lt!611889 () SeekEntryResult!10317)

(assert (=> b!1393170 (= res!932576 (or (not (is-Intermediate!10317 lt!611889)) (undefined!11129 lt!611889)))))

(assert (=> b!1393170 e!788881))

(declare-fun res!932571 () Bool)

(assert (=> b!1393170 (=> (not res!932571) (not e!788881))))

(assert (=> b!1393170 (= res!932571 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46638 0))(
  ( (Unit!46639) )
))
(declare-fun lt!611888 () Unit!46638)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95284 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46638)

(assert (=> b!1393170 (= lt!611888 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393170 (= lt!611889 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46000 a!2901) j!112) mask!2840) (select (arr!46000 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119602 res!932575) b!1393169))

(assert (= (and b!1393169 res!932577) b!1393168))

(assert (= (and b!1393168 res!932574) b!1393164))

(assert (= (and b!1393164 res!932572) b!1393165))

(assert (= (and b!1393165 res!932578) b!1393166))

(assert (= (and b!1393166 res!932573) b!1393170))

(assert (= (and b!1393170 res!932571) b!1393167))

(assert (= (and b!1393170 (not res!932576)) b!1393163))

(declare-fun m!1278959 () Bool)

(assert (=> b!1393167 m!1278959))

(assert (=> b!1393167 m!1278959))

(declare-fun m!1278961 () Bool)

(assert (=> b!1393167 m!1278961))

(assert (=> b!1393164 m!1278959))

(assert (=> b!1393164 m!1278959))

(declare-fun m!1278963 () Bool)

(assert (=> b!1393164 m!1278963))

(declare-fun m!1278965 () Bool)

(assert (=> b!1393163 m!1278965))

(declare-fun m!1278967 () Bool)

(assert (=> b!1393163 m!1278967))

(assert (=> b!1393163 m!1278967))

(declare-fun m!1278969 () Bool)

(assert (=> b!1393163 m!1278969))

(assert (=> b!1393163 m!1278969))

(assert (=> b!1393163 m!1278967))

(declare-fun m!1278971 () Bool)

(assert (=> b!1393163 m!1278971))

(declare-fun m!1278973 () Bool)

(assert (=> b!1393165 m!1278973))

(declare-fun m!1278975 () Bool)

(assert (=> start!119602 m!1278975))

(declare-fun m!1278977 () Bool)

(assert (=> start!119602 m!1278977))

(assert (=> b!1393170 m!1278959))

(declare-fun m!1278979 () Bool)

(assert (=> b!1393170 m!1278979))

(assert (=> b!1393170 m!1278959))

(declare-fun m!1278981 () Bool)

(assert (=> b!1393170 m!1278981))

(assert (=> b!1393170 m!1278979))

(assert (=> b!1393170 m!1278959))

(declare-fun m!1278983 () Bool)

(assert (=> b!1393170 m!1278983))

(declare-fun m!1278985 () Bool)

(assert (=> b!1393170 m!1278985))

(declare-fun m!1278987 () Bool)

(assert (=> b!1393168 m!1278987))

(assert (=> b!1393168 m!1278987))

(declare-fun m!1278989 () Bool)

(assert (=> b!1393168 m!1278989))

(declare-fun m!1278991 () Bool)

(assert (=> b!1393166 m!1278991))

(push 1)

(assert (not start!119602))

(assert (not b!1393165))

(assert (not b!1393168))

(assert (not b!1393164))

(assert (not b!1393170))

(assert (not b!1393166))

(assert (not b!1393163))

(assert (not b!1393167))

(check-sat)

