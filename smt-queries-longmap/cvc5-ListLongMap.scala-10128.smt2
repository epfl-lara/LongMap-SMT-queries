; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119616 () Bool)

(assert start!119616)

(declare-fun b!1393001 () Bool)

(declare-fun e!788910 () Bool)

(declare-fun e!788911 () Bool)

(assert (=> b!1393001 (= e!788910 (not e!788911))))

(declare-fun res!932037 () Bool)

(assert (=> b!1393001 (=> res!932037 e!788911)))

(declare-datatypes ((SeekEntryResult!10240 0))(
  ( (MissingZero!10240 (index!43331 (_ BitVec 32))) (Found!10240 (index!43332 (_ BitVec 32))) (Intermediate!10240 (undefined!11052 Bool) (index!43333 (_ BitVec 32)) (x!125163 (_ BitVec 32))) (Undefined!10240) (MissingVacant!10240 (index!43334 (_ BitVec 32))) )
))
(declare-fun lt!611774 () SeekEntryResult!10240)

(assert (=> b!1393001 (= res!932037 (or (not (is-Intermediate!10240 lt!611774)) (undefined!11052 lt!611774)))))

(declare-fun e!788909 () Bool)

(assert (=> b!1393001 e!788909))

(declare-fun res!932044 () Bool)

(assert (=> b!1393001 (=> (not res!932044) (not e!788909))))

(declare-datatypes ((array!95322 0))(
  ( (array!95323 (arr!46020 (Array (_ BitVec 32) (_ BitVec 64))) (size!46571 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95322)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95322 (_ BitVec 32)) Bool)

(assert (=> b!1393001 (= res!932044 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46511 0))(
  ( (Unit!46512) )
))
(declare-fun lt!611772 () Unit!46511)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95322 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46511)

(assert (=> b!1393001 (= lt!611772 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95322 (_ BitVec 32)) SeekEntryResult!10240)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393001 (= lt!611774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46020 a!2901) j!112) mask!2840) (select (arr!46020 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!932039 () Bool)

(assert (=> start!119616 (=> (not res!932039) (not e!788910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119616 (= res!932039 (validMask!0 mask!2840))))

(assert (=> start!119616 e!788910))

(assert (=> start!119616 true))

(declare-fun array_inv!35301 (array!95322) Bool)

(assert (=> start!119616 (array_inv!35301 a!2901)))

(declare-fun b!1393002 () Bool)

(assert (=> b!1393002 (= e!788911 true)))

(declare-fun lt!611773 () (_ BitVec 32))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393002 (= lt!611773 (toIndex!0 (select (store (arr!46020 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840))))

(declare-fun b!1393003 () Bool)

(declare-fun res!932043 () Bool)

(assert (=> b!1393003 (=> (not res!932043) (not e!788910))))

(assert (=> b!1393003 (= res!932043 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393004 () Bool)

(declare-fun res!932038 () Bool)

(assert (=> b!1393004 (=> (not res!932038) (not e!788910))))

(declare-datatypes ((List!32526 0))(
  ( (Nil!32523) (Cons!32522 (h!33757 (_ BitVec 64)) (t!47212 List!32526)) )
))
(declare-fun arrayNoDuplicates!0 (array!95322 (_ BitVec 32) List!32526) Bool)

(assert (=> b!1393004 (= res!932038 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32523))))

(declare-fun b!1393005 () Bool)

(declare-fun res!932040 () Bool)

(assert (=> b!1393005 (=> (not res!932040) (not e!788910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393005 (= res!932040 (validKeyInArray!0 (select (arr!46020 a!2901) i!1037)))))

(declare-fun b!1393006 () Bool)

(declare-fun res!932042 () Bool)

(assert (=> b!1393006 (=> (not res!932042) (not e!788910))))

(assert (=> b!1393006 (= res!932042 (and (= (size!46571 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46571 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46571 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393007 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95322 (_ BitVec 32)) SeekEntryResult!10240)

(assert (=> b!1393007 (= e!788909 (= (seekEntryOrOpen!0 (select (arr!46020 a!2901) j!112) a!2901 mask!2840) (Found!10240 j!112)))))

(declare-fun b!1393008 () Bool)

(declare-fun res!932041 () Bool)

(assert (=> b!1393008 (=> (not res!932041) (not e!788910))))

(assert (=> b!1393008 (= res!932041 (validKeyInArray!0 (select (arr!46020 a!2901) j!112)))))

(assert (= (and start!119616 res!932039) b!1393006))

(assert (= (and b!1393006 res!932042) b!1393005))

(assert (= (and b!1393005 res!932040) b!1393008))

(assert (= (and b!1393008 res!932041) b!1393003))

(assert (= (and b!1393003 res!932043) b!1393004))

(assert (= (and b!1393004 res!932038) b!1393001))

(assert (= (and b!1393001 res!932044) b!1393007))

(assert (= (and b!1393001 (not res!932037)) b!1393002))

(declare-fun m!1278959 () Bool)

(assert (=> b!1393001 m!1278959))

(declare-fun m!1278961 () Bool)

(assert (=> b!1393001 m!1278961))

(assert (=> b!1393001 m!1278959))

(declare-fun m!1278963 () Bool)

(assert (=> b!1393001 m!1278963))

(assert (=> b!1393001 m!1278961))

(assert (=> b!1393001 m!1278959))

(declare-fun m!1278965 () Bool)

(assert (=> b!1393001 m!1278965))

(declare-fun m!1278967 () Bool)

(assert (=> b!1393001 m!1278967))

(declare-fun m!1278969 () Bool)

(assert (=> b!1393003 m!1278969))

(assert (=> b!1393007 m!1278959))

(assert (=> b!1393007 m!1278959))

(declare-fun m!1278971 () Bool)

(assert (=> b!1393007 m!1278971))

(assert (=> b!1393008 m!1278959))

(assert (=> b!1393008 m!1278959))

(declare-fun m!1278973 () Bool)

(assert (=> b!1393008 m!1278973))

(declare-fun m!1278975 () Bool)

(assert (=> b!1393005 m!1278975))

(assert (=> b!1393005 m!1278975))

(declare-fun m!1278977 () Bool)

(assert (=> b!1393005 m!1278977))

(declare-fun m!1278979 () Bool)

(assert (=> start!119616 m!1278979))

(declare-fun m!1278981 () Bool)

(assert (=> start!119616 m!1278981))

(declare-fun m!1278983 () Bool)

(assert (=> b!1393004 m!1278983))

(declare-fun m!1278985 () Bool)

(assert (=> b!1393002 m!1278985))

(declare-fun m!1278987 () Bool)

(assert (=> b!1393002 m!1278987))

(assert (=> b!1393002 m!1278987))

(declare-fun m!1278989 () Bool)

(assert (=> b!1393002 m!1278989))

(push 1)

(assert (not b!1393002))

(assert (not b!1393008))

(assert (not b!1393003))

(assert (not b!1393007))

(assert (not b!1393005))

(assert (not b!1393004))

(assert (not b!1393001))

(assert (not start!119616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

