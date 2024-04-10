; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128062 () Bool)

(assert start!128062)

(declare-fun b!1504173 () Bool)

(declare-fun res!1024969 () Bool)

(declare-fun e!840834 () Bool)

(assert (=> b!1504173 (=> (not res!1024969) (not e!840834))))

(declare-datatypes ((array!100338 0))(
  ( (array!100339 (arr!48424 (Array (_ BitVec 32) (_ BitVec 64))) (size!48974 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100338)

(declare-datatypes ((List!34916 0))(
  ( (Nil!34913) (Cons!34912 (h!36309 (_ BitVec 64)) (t!49610 List!34916)) )
))
(declare-fun arrayNoDuplicates!0 (array!100338 (_ BitVec 32) List!34916) Bool)

(assert (=> b!1504173 (= res!1024969 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34913))))

(declare-fun res!1024965 () Bool)

(assert (=> start!128062 (=> (not res!1024965) (not e!840834))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128062 (= res!1024965 (validMask!0 mask!2661))))

(assert (=> start!128062 e!840834))

(assert (=> start!128062 true))

(declare-fun array_inv!37452 (array!100338) Bool)

(assert (=> start!128062 (array_inv!37452 a!2850)))

(declare-fun b!1504174 () Bool)

(declare-fun res!1024967 () Bool)

(assert (=> b!1504174 (=> (not res!1024967) (not e!840834))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(assert (=> b!1504174 (= res!1024967 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48974 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48974 a!2850)) (= (select (arr!48424 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48424 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48974 a!2850))))))

(declare-fun b!1504175 () Bool)

(declare-fun res!1024964 () Bool)

(assert (=> b!1504175 (=> (not res!1024964) (not e!840834))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1504175 (= res!1024964 (not (= (select (arr!48424 a!2850) index!625) (select (arr!48424 a!2850) j!87))))))

(declare-fun b!1504176 () Bool)

(declare-fun res!1024962 () Bool)

(assert (=> b!1504176 (=> (not res!1024962) (not e!840834))))

(declare-datatypes ((SeekEntryResult!12622 0))(
  ( (MissingZero!12622 (index!52880 (_ BitVec 32))) (Found!12622 (index!52881 (_ BitVec 32))) (Intermediate!12622 (undefined!13434 Bool) (index!52882 (_ BitVec 32)) (x!134556 (_ BitVec 32))) (Undefined!12622) (MissingVacant!12622 (index!52883 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100338 (_ BitVec 32)) SeekEntryResult!12622)

(assert (=> b!1504176 (= res!1024962 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48424 a!2850) j!87) a!2850 mask!2661) (Found!12622 j!87)))))

(declare-fun b!1504177 () Bool)

(declare-fun res!1024968 () Bool)

(assert (=> b!1504177 (=> (not res!1024968) (not e!840834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504177 (= res!1024968 (validKeyInArray!0 (select (arr!48424 a!2850) i!996)))))

(declare-fun b!1504178 () Bool)

(declare-fun res!1024961 () Bool)

(assert (=> b!1504178 (=> (not res!1024961) (not e!840834))))

(assert (=> b!1504178 (= res!1024961 (validKeyInArray!0 (select (arr!48424 a!2850) j!87)))))

(declare-fun b!1504179 () Bool)

(assert (=> b!1504179 (= e!840834 false)))

(declare-fun lt!653647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504179 (= lt!653647 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504180 () Bool)

(declare-fun res!1024963 () Bool)

(assert (=> b!1504180 (=> (not res!1024963) (not e!840834))))

(assert (=> b!1504180 (= res!1024963 (and (= (size!48974 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48974 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48974 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504181 () Bool)

(declare-fun res!1024966 () Bool)

(assert (=> b!1504181 (=> (not res!1024966) (not e!840834))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100338 (_ BitVec 32)) Bool)

(assert (=> b!1504181 (= res!1024966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128062 res!1024965) b!1504180))

(assert (= (and b!1504180 res!1024963) b!1504177))

(assert (= (and b!1504177 res!1024968) b!1504178))

(assert (= (and b!1504178 res!1024961) b!1504181))

(assert (= (and b!1504181 res!1024966) b!1504173))

(assert (= (and b!1504173 res!1024969) b!1504174))

(assert (= (and b!1504174 res!1024967) b!1504176))

(assert (= (and b!1504176 res!1024962) b!1504175))

(assert (= (and b!1504175 res!1024964) b!1504179))

(declare-fun m!1387383 () Bool)

(assert (=> b!1504175 m!1387383))

(declare-fun m!1387385 () Bool)

(assert (=> b!1504175 m!1387385))

(declare-fun m!1387387 () Bool)

(assert (=> b!1504174 m!1387387))

(declare-fun m!1387389 () Bool)

(assert (=> b!1504174 m!1387389))

(declare-fun m!1387391 () Bool)

(assert (=> b!1504174 m!1387391))

(assert (=> b!1504176 m!1387385))

(assert (=> b!1504176 m!1387385))

(declare-fun m!1387393 () Bool)

(assert (=> b!1504176 m!1387393))

(assert (=> b!1504178 m!1387385))

(assert (=> b!1504178 m!1387385))

(declare-fun m!1387395 () Bool)

(assert (=> b!1504178 m!1387395))

(declare-fun m!1387397 () Bool)

(assert (=> b!1504179 m!1387397))

(declare-fun m!1387399 () Bool)

(assert (=> b!1504177 m!1387399))

(assert (=> b!1504177 m!1387399))

(declare-fun m!1387401 () Bool)

(assert (=> b!1504177 m!1387401))

(declare-fun m!1387403 () Bool)

(assert (=> start!128062 m!1387403))

(declare-fun m!1387405 () Bool)

(assert (=> start!128062 m!1387405))

(declare-fun m!1387407 () Bool)

(assert (=> b!1504181 m!1387407))

(declare-fun m!1387409 () Bool)

(assert (=> b!1504173 m!1387409))

(push 1)

(assert (not b!1504173))

(assert (not b!1504179))

(assert (not b!1504176))

(assert (not b!1504181))

(assert (not b!1504178))

(assert (not start!128062))

(assert (not b!1504177))

(check-sat)

(pop 1)

