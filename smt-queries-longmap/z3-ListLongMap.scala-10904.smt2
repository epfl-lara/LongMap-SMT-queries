; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127988 () Bool)

(assert start!127988)

(declare-fun b!1502089 () Bool)

(declare-fun res!1021987 () Bool)

(declare-fun e!840678 () Bool)

(assert (=> b!1502089 (=> (not res!1021987) (not e!840678))))

(declare-datatypes ((array!100183 0))(
  ( (array!100184 (arr!48346 (Array (_ BitVec 32) (_ BitVec 64))) (size!48897 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100183)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502089 (= res!1021987 (validKeyInArray!0 (select (arr!48346 a!2850) j!87)))))

(declare-fun b!1502090 () Bool)

(declare-fun e!840676 () Bool)

(assert (=> b!1502090 (= e!840676 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12449 0))(
  ( (MissingZero!12449 (index!52188 (_ BitVec 32))) (Found!12449 (index!52189 (_ BitVec 32))) (Intermediate!12449 (undefined!13261 Bool) (index!52190 (_ BitVec 32)) (x!134064 (_ BitVec 32))) (Undefined!12449) (MissingVacant!12449 (index!52191 (_ BitVec 32))) )
))
(declare-fun lt!653564 () SeekEntryResult!12449)

(declare-fun lt!653565 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100183 (_ BitVec 32)) SeekEntryResult!12449)

(assert (=> b!1502090 (= lt!653564 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653565 vacantBefore!10 (select (arr!48346 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502091 () Bool)

(declare-fun res!1021984 () Bool)

(assert (=> b!1502091 (=> (not res!1021984) (not e!840678))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1502091 (= res!1021984 (not (= (select (arr!48346 a!2850) index!625) (select (arr!48346 a!2850) j!87))))))

(declare-fun res!1021982 () Bool)

(assert (=> start!127988 (=> (not res!1021982) (not e!840678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127988 (= res!1021982 (validMask!0 mask!2661))))

(assert (=> start!127988 e!840678))

(assert (=> start!127988 true))

(declare-fun array_inv!37627 (array!100183) Bool)

(assert (=> start!127988 (array_inv!37627 a!2850)))

(declare-fun b!1502092 () Bool)

(declare-fun res!1021989 () Bool)

(assert (=> b!1502092 (=> (not res!1021989) (not e!840678))))

(assert (=> b!1502092 (= res!1021989 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48346 a!2850) j!87) a!2850 mask!2661) (Found!12449 j!87)))))

(declare-fun b!1502093 () Bool)

(declare-fun res!1021985 () Bool)

(assert (=> b!1502093 (=> (not res!1021985) (not e!840678))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1502093 (= res!1021985 (and (= (size!48897 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48897 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48897 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502094 () Bool)

(declare-fun res!1021990 () Bool)

(assert (=> b!1502094 (=> (not res!1021990) (not e!840678))))

(declare-datatypes ((List!34825 0))(
  ( (Nil!34822) (Cons!34821 (h!36233 (_ BitVec 64)) (t!49511 List!34825)) )
))
(declare-fun arrayNoDuplicates!0 (array!100183 (_ BitVec 32) List!34825) Bool)

(assert (=> b!1502094 (= res!1021990 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34822))))

(declare-fun b!1502095 () Bool)

(declare-fun res!1021983 () Bool)

(assert (=> b!1502095 (=> (not res!1021983) (not e!840678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100183 (_ BitVec 32)) Bool)

(assert (=> b!1502095 (= res!1021983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502096 () Bool)

(declare-fun res!1021988 () Bool)

(assert (=> b!1502096 (=> (not res!1021988) (not e!840678))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502096 (= res!1021988 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48897 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48897 a!2850)) (= (select (arr!48346 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48346 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48897 a!2850))))))

(declare-fun b!1502097 () Bool)

(assert (=> b!1502097 (= e!840678 e!840676)))

(declare-fun res!1021991 () Bool)

(assert (=> b!1502097 (=> (not res!1021991) (not e!840676))))

(assert (=> b!1502097 (= res!1021991 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653565 #b00000000000000000000000000000000) (bvslt lt!653565 (size!48897 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502097 (= lt!653565 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502098 () Bool)

(declare-fun res!1021986 () Bool)

(assert (=> b!1502098 (=> (not res!1021986) (not e!840678))))

(assert (=> b!1502098 (= res!1021986 (validKeyInArray!0 (select (arr!48346 a!2850) i!996)))))

(assert (= (and start!127988 res!1021982) b!1502093))

(assert (= (and b!1502093 res!1021985) b!1502098))

(assert (= (and b!1502098 res!1021986) b!1502089))

(assert (= (and b!1502089 res!1021987) b!1502095))

(assert (= (and b!1502095 res!1021983) b!1502094))

(assert (= (and b!1502094 res!1021990) b!1502096))

(assert (= (and b!1502096 res!1021988) b!1502092))

(assert (= (and b!1502092 res!1021989) b!1502091))

(assert (= (and b!1502091 res!1021984) b!1502097))

(assert (= (and b!1502097 res!1021991) b!1502090))

(declare-fun m!1385233 () Bool)

(assert (=> start!127988 m!1385233))

(declare-fun m!1385235 () Bool)

(assert (=> start!127988 m!1385235))

(declare-fun m!1385237 () Bool)

(assert (=> b!1502098 m!1385237))

(assert (=> b!1502098 m!1385237))

(declare-fun m!1385239 () Bool)

(assert (=> b!1502098 m!1385239))

(declare-fun m!1385241 () Bool)

(assert (=> b!1502094 m!1385241))

(declare-fun m!1385243 () Bool)

(assert (=> b!1502095 m!1385243))

(declare-fun m!1385245 () Bool)

(assert (=> b!1502096 m!1385245))

(declare-fun m!1385247 () Bool)

(assert (=> b!1502096 m!1385247))

(declare-fun m!1385249 () Bool)

(assert (=> b!1502096 m!1385249))

(declare-fun m!1385251 () Bool)

(assert (=> b!1502090 m!1385251))

(assert (=> b!1502090 m!1385251))

(declare-fun m!1385253 () Bool)

(assert (=> b!1502090 m!1385253))

(declare-fun m!1385255 () Bool)

(assert (=> b!1502097 m!1385255))

(assert (=> b!1502092 m!1385251))

(assert (=> b!1502092 m!1385251))

(declare-fun m!1385257 () Bool)

(assert (=> b!1502092 m!1385257))

(assert (=> b!1502089 m!1385251))

(assert (=> b!1502089 m!1385251))

(declare-fun m!1385259 () Bool)

(assert (=> b!1502089 m!1385259))

(declare-fun m!1385261 () Bool)

(assert (=> b!1502091 m!1385261))

(assert (=> b!1502091 m!1385251))

(check-sat (not start!127988) (not b!1502098) (not b!1502092) (not b!1502095) (not b!1502090) (not b!1502094) (not b!1502097) (not b!1502089))
(check-sat)
