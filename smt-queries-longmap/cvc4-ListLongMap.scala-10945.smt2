; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128050 () Bool)

(assert start!128050)

(declare-fun res!1024803 () Bool)

(declare-fun e!840799 () Bool)

(assert (=> start!128050 (=> (not res!1024803) (not e!840799))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128050 (= res!1024803 (validMask!0 mask!2661))))

(assert (=> start!128050 e!840799))

(assert (=> start!128050 true))

(declare-datatypes ((array!100326 0))(
  ( (array!100327 (arr!48418 (Array (_ BitVec 32) (_ BitVec 64))) (size!48968 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100326)

(declare-fun array_inv!37446 (array!100326) Bool)

(assert (=> start!128050 (array_inv!37446 a!2850)))

(declare-fun b!1504011 () Bool)

(declare-fun res!1024804 () Bool)

(assert (=> b!1504011 (=> (not res!1024804) (not e!840799))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12616 0))(
  ( (MissingZero!12616 (index!52856 (_ BitVec 32))) (Found!12616 (index!52857 (_ BitVec 32))) (Intermediate!12616 (undefined!13428 Bool) (index!52858 (_ BitVec 32)) (x!134534 (_ BitVec 32))) (Undefined!12616) (MissingVacant!12616 (index!52859 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100326 (_ BitVec 32)) SeekEntryResult!12616)

(assert (=> b!1504011 (= res!1024804 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48418 a!2850) j!87) a!2850 mask!2661) (Found!12616 j!87)))))

(declare-fun b!1504012 () Bool)

(declare-fun res!1024806 () Bool)

(assert (=> b!1504012 (=> (not res!1024806) (not e!840799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504012 (= res!1024806 (validKeyInArray!0 (select (arr!48418 a!2850) j!87)))))

(declare-fun b!1504013 () Bool)

(declare-fun res!1024801 () Bool)

(assert (=> b!1504013 (=> (not res!1024801) (not e!840799))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504013 (= res!1024801 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48968 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48968 a!2850)) (= (select (arr!48418 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48418 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48968 a!2850))))))

(declare-fun b!1504014 () Bool)

(declare-fun res!1024799 () Bool)

(assert (=> b!1504014 (=> (not res!1024799) (not e!840799))))

(assert (=> b!1504014 (= res!1024799 (validKeyInArray!0 (select (arr!48418 a!2850) i!996)))))

(declare-fun b!1504015 () Bool)

(declare-fun res!1024807 () Bool)

(assert (=> b!1504015 (=> (not res!1024807) (not e!840799))))

(declare-datatypes ((List!34910 0))(
  ( (Nil!34907) (Cons!34906 (h!36303 (_ BitVec 64)) (t!49604 List!34910)) )
))
(declare-fun arrayNoDuplicates!0 (array!100326 (_ BitVec 32) List!34910) Bool)

(assert (=> b!1504015 (= res!1024807 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34907))))

(declare-fun b!1504016 () Bool)

(assert (=> b!1504016 (= e!840799 false)))

(declare-fun lt!653629 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504016 (= lt!653629 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504017 () Bool)

(declare-fun res!1024805 () Bool)

(assert (=> b!1504017 (=> (not res!1024805) (not e!840799))))

(assert (=> b!1504017 (= res!1024805 (and (= (size!48968 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48968 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48968 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504018 () Bool)

(declare-fun res!1024802 () Bool)

(assert (=> b!1504018 (=> (not res!1024802) (not e!840799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100326 (_ BitVec 32)) Bool)

(assert (=> b!1504018 (= res!1024802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504019 () Bool)

(declare-fun res!1024800 () Bool)

(assert (=> b!1504019 (=> (not res!1024800) (not e!840799))))

(assert (=> b!1504019 (= res!1024800 (not (= (select (arr!48418 a!2850) index!625) (select (arr!48418 a!2850) j!87))))))

(assert (= (and start!128050 res!1024803) b!1504017))

(assert (= (and b!1504017 res!1024805) b!1504014))

(assert (= (and b!1504014 res!1024799) b!1504012))

(assert (= (and b!1504012 res!1024806) b!1504018))

(assert (= (and b!1504018 res!1024802) b!1504015))

(assert (= (and b!1504015 res!1024807) b!1504013))

(assert (= (and b!1504013 res!1024801) b!1504011))

(assert (= (and b!1504011 res!1024804) b!1504019))

(assert (= (and b!1504019 res!1024800) b!1504016))

(declare-fun m!1387215 () Bool)

(assert (=> b!1504015 m!1387215))

(declare-fun m!1387217 () Bool)

(assert (=> b!1504019 m!1387217))

(declare-fun m!1387219 () Bool)

(assert (=> b!1504019 m!1387219))

(assert (=> b!1504012 m!1387219))

(assert (=> b!1504012 m!1387219))

(declare-fun m!1387221 () Bool)

(assert (=> b!1504012 m!1387221))

(declare-fun m!1387223 () Bool)

(assert (=> b!1504018 m!1387223))

(assert (=> b!1504011 m!1387219))

(assert (=> b!1504011 m!1387219))

(declare-fun m!1387225 () Bool)

(assert (=> b!1504011 m!1387225))

(declare-fun m!1387227 () Bool)

(assert (=> start!128050 m!1387227))

(declare-fun m!1387229 () Bool)

(assert (=> start!128050 m!1387229))

(declare-fun m!1387231 () Bool)

(assert (=> b!1504014 m!1387231))

(assert (=> b!1504014 m!1387231))

(declare-fun m!1387233 () Bool)

(assert (=> b!1504014 m!1387233))

(declare-fun m!1387235 () Bool)

(assert (=> b!1504016 m!1387235))

(declare-fun m!1387237 () Bool)

(assert (=> b!1504013 m!1387237))

(declare-fun m!1387239 () Bool)

(assert (=> b!1504013 m!1387239))

(declare-fun m!1387241 () Bool)

(assert (=> b!1504013 m!1387241))

(push 1)

(assert (not b!1504016))

(assert (not b!1504011))

(assert (not b!1504018))

(assert (not b!1504015))

(assert (not b!1504014))

(assert (not start!128050))

(assert (not b!1504012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

