; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127944 () Bool)

(assert start!127944)

(declare-fun res!1023890 () Bool)

(declare-fun e!840517 () Bool)

(assert (=> start!127944 (=> (not res!1023890) (not e!840517))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127944 (= res!1023890 (validMask!0 mask!2661))))

(assert (=> start!127944 e!840517))

(assert (=> start!127944 true))

(declare-datatypes ((array!100259 0))(
  ( (array!100260 (arr!48386 (Array (_ BitVec 32) (_ BitVec 64))) (size!48936 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100259)

(declare-fun array_inv!37414 (array!100259) Bool)

(assert (=> start!127944 (array_inv!37414 a!2850)))

(declare-fun b!1503012 () Bool)

(declare-fun res!1023891 () Bool)

(assert (=> b!1503012 (=> (not res!1023891) (not e!840517))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503012 (= res!1023891 (validKeyInArray!0 (select (arr!48386 a!2850) j!87)))))

(declare-fun b!1503013 () Bool)

(declare-fun res!1023896 () Bool)

(assert (=> b!1503013 (=> (not res!1023896) (not e!840517))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1503013 (= res!1023896 (not (= (select (arr!48386 a!2850) index!625) (select (arr!48386 a!2850) j!87))))))

(declare-fun b!1503014 () Bool)

(declare-fun res!1023897 () Bool)

(assert (=> b!1503014 (=> (not res!1023897) (not e!840517))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503014 (= res!1023897 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48936 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48936 a!2850)) (= (select (arr!48386 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48386 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48936 a!2850))))))

(declare-fun b!1503015 () Bool)

(declare-fun res!1023893 () Bool)

(assert (=> b!1503015 (=> (not res!1023893) (not e!840517))))

(assert (=> b!1503015 (= res!1023893 (validKeyInArray!0 (select (arr!48386 a!2850) i!996)))))

(declare-fun b!1503016 () Bool)

(declare-fun res!1023895 () Bool)

(assert (=> b!1503016 (=> (not res!1023895) (not e!840517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100259 (_ BitVec 32)) Bool)

(assert (=> b!1503016 (= res!1023895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503017 () Bool)

(declare-fun res!1023898 () Bool)

(assert (=> b!1503017 (=> (not res!1023898) (not e!840517))))

(declare-datatypes ((List!34878 0))(
  ( (Nil!34875) (Cons!34874 (h!36271 (_ BitVec 64)) (t!49572 List!34878)) )
))
(declare-fun arrayNoDuplicates!0 (array!100259 (_ BitVec 32) List!34878) Bool)

(assert (=> b!1503017 (= res!1023898 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34875))))

(declare-fun b!1503018 () Bool)

(declare-fun res!1023892 () Bool)

(assert (=> b!1503018 (=> (not res!1023892) (not e!840517))))

(declare-datatypes ((SeekEntryResult!12584 0))(
  ( (MissingZero!12584 (index!52728 (_ BitVec 32))) (Found!12584 (index!52729 (_ BitVec 32))) (Intermediate!12584 (undefined!13396 Bool) (index!52730 (_ BitVec 32)) (x!134416 (_ BitVec 32))) (Undefined!12584) (MissingVacant!12584 (index!52731 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100259 (_ BitVec 32)) SeekEntryResult!12584)

(assert (=> b!1503018 (= res!1023892 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48386 a!2850) j!87) a!2850 mask!2661) (Found!12584 j!87)))))

(declare-fun b!1503019 () Bool)

(declare-fun res!1023894 () Bool)

(assert (=> b!1503019 (=> (not res!1023894) (not e!840517))))

(assert (=> b!1503019 (= res!1023894 (and (= (size!48936 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48936 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48936 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503020 () Bool)

(assert (=> b!1503020 (= e!840517 false)))

(declare-fun lt!653479 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503020 (= lt!653479 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127944 res!1023890) b!1503019))

(assert (= (and b!1503019 res!1023894) b!1503015))

(assert (= (and b!1503015 res!1023893) b!1503012))

(assert (= (and b!1503012 res!1023891) b!1503016))

(assert (= (and b!1503016 res!1023895) b!1503017))

(assert (= (and b!1503017 res!1023898) b!1503014))

(assert (= (and b!1503014 res!1023897) b!1503018))

(assert (= (and b!1503018 res!1023892) b!1503013))

(assert (= (and b!1503013 res!1023896) b!1503020))

(declare-fun m!1386247 () Bool)

(assert (=> b!1503018 m!1386247))

(assert (=> b!1503018 m!1386247))

(declare-fun m!1386249 () Bool)

(assert (=> b!1503018 m!1386249))

(assert (=> b!1503012 m!1386247))

(assert (=> b!1503012 m!1386247))

(declare-fun m!1386251 () Bool)

(assert (=> b!1503012 m!1386251))

(declare-fun m!1386253 () Bool)

(assert (=> b!1503014 m!1386253))

(declare-fun m!1386255 () Bool)

(assert (=> b!1503014 m!1386255))

(declare-fun m!1386257 () Bool)

(assert (=> b!1503014 m!1386257))

(declare-fun m!1386259 () Bool)

(assert (=> start!127944 m!1386259))

(declare-fun m!1386261 () Bool)

(assert (=> start!127944 m!1386261))

(declare-fun m!1386263 () Bool)

(assert (=> b!1503020 m!1386263))

(declare-fun m!1386265 () Bool)

(assert (=> b!1503016 m!1386265))

(declare-fun m!1386267 () Bool)

(assert (=> b!1503015 m!1386267))

(assert (=> b!1503015 m!1386267))

(declare-fun m!1386269 () Bool)

(assert (=> b!1503015 m!1386269))

(declare-fun m!1386271 () Bool)

(assert (=> b!1503013 m!1386271))

(assert (=> b!1503013 m!1386247))

(declare-fun m!1386273 () Bool)

(assert (=> b!1503017 m!1386273))

(push 1)

(assert (not start!127944))

(assert (not b!1503015))

(assert (not b!1503020))

(assert (not b!1503017))

(assert (not b!1503012))

(assert (not b!1503016))

(assert (not b!1503018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

