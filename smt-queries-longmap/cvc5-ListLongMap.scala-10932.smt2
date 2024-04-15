; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127884 () Bool)

(assert start!127884)

(declare-fun b!1502507 () Bool)

(declare-fun res!1023579 () Bool)

(declare-fun e!840275 () Bool)

(assert (=> b!1502507 (=> (not res!1023579) (not e!840275))))

(declare-datatypes ((array!100193 0))(
  ( (array!100194 (arr!48354 (Array (_ BitVec 32) (_ BitVec 64))) (size!48906 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100193)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502507 (= res!1023579 (validKeyInArray!0 (select (arr!48354 a!2850) i!996)))))

(declare-fun b!1502508 () Bool)

(declare-fun res!1023575 () Bool)

(assert (=> b!1502508 (=> (not res!1023575) (not e!840275))))

(declare-datatypes ((List!34924 0))(
  ( (Nil!34921) (Cons!34920 (h!36318 (_ BitVec 64)) (t!49610 List!34924)) )
))
(declare-fun arrayNoDuplicates!0 (array!100193 (_ BitVec 32) List!34924) Bool)

(assert (=> b!1502508 (= res!1023575 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34921))))

(declare-fun b!1502509 () Bool)

(declare-fun res!1023574 () Bool)

(assert (=> b!1502509 (=> (not res!1023574) (not e!840275))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502509 (= res!1023574 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48906 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48906 a!2850)) (= (select (arr!48354 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48354 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48906 a!2850))))))

(declare-fun b!1502511 () Bool)

(assert (=> b!1502511 (= e!840275 false)))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!653179 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502511 (= lt!653179 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1502512 () Bool)

(declare-fun res!1023580 () Bool)

(assert (=> b!1502512 (=> (not res!1023580) (not e!840275))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12573 0))(
  ( (MissingZero!12573 (index!52684 (_ BitVec 32))) (Found!12573 (index!52685 (_ BitVec 32))) (Intermediate!12573 (undefined!13385 Bool) (index!52686 (_ BitVec 32)) (x!134376 (_ BitVec 32))) (Undefined!12573) (MissingVacant!12573 (index!52687 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100193 (_ BitVec 32)) SeekEntryResult!12573)

(assert (=> b!1502512 (= res!1023580 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48354 a!2850) j!87) a!2850 mask!2661) (Found!12573 j!87)))))

(declare-fun b!1502513 () Bool)

(declare-fun res!1023577 () Bool)

(assert (=> b!1502513 (=> (not res!1023577) (not e!840275))))

(assert (=> b!1502513 (= res!1023577 (and (= (size!48906 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48906 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48906 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502514 () Bool)

(declare-fun res!1023578 () Bool)

(assert (=> b!1502514 (=> (not res!1023578) (not e!840275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100193 (_ BitVec 32)) Bool)

(assert (=> b!1502514 (= res!1023578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502515 () Bool)

(declare-fun res!1023581 () Bool)

(assert (=> b!1502515 (=> (not res!1023581) (not e!840275))))

(assert (=> b!1502515 (= res!1023581 (not (= (select (arr!48354 a!2850) index!625) (select (arr!48354 a!2850) j!87))))))

(declare-fun res!1023573 () Bool)

(assert (=> start!127884 (=> (not res!1023573) (not e!840275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127884 (= res!1023573 (validMask!0 mask!2661))))

(assert (=> start!127884 e!840275))

(assert (=> start!127884 true))

(declare-fun array_inv!37587 (array!100193) Bool)

(assert (=> start!127884 (array_inv!37587 a!2850)))

(declare-fun b!1502510 () Bool)

(declare-fun res!1023576 () Bool)

(assert (=> b!1502510 (=> (not res!1023576) (not e!840275))))

(assert (=> b!1502510 (= res!1023576 (validKeyInArray!0 (select (arr!48354 a!2850) j!87)))))

(assert (= (and start!127884 res!1023573) b!1502513))

(assert (= (and b!1502513 res!1023577) b!1502507))

(assert (= (and b!1502507 res!1023579) b!1502510))

(assert (= (and b!1502510 res!1023576) b!1502514))

(assert (= (and b!1502514 res!1023578) b!1502508))

(assert (= (and b!1502508 res!1023575) b!1502509))

(assert (= (and b!1502509 res!1023574) b!1502512))

(assert (= (and b!1502512 res!1023580) b!1502515))

(assert (= (and b!1502515 res!1023581) b!1502511))

(declare-fun m!1385181 () Bool)

(assert (=> b!1502512 m!1385181))

(assert (=> b!1502512 m!1385181))

(declare-fun m!1385183 () Bool)

(assert (=> b!1502512 m!1385183))

(assert (=> b!1502510 m!1385181))

(assert (=> b!1502510 m!1385181))

(declare-fun m!1385185 () Bool)

(assert (=> b!1502510 m!1385185))

(declare-fun m!1385187 () Bool)

(assert (=> b!1502508 m!1385187))

(declare-fun m!1385189 () Bool)

(assert (=> b!1502509 m!1385189))

(declare-fun m!1385191 () Bool)

(assert (=> b!1502509 m!1385191))

(declare-fun m!1385193 () Bool)

(assert (=> b!1502509 m!1385193))

(declare-fun m!1385195 () Bool)

(assert (=> b!1502515 m!1385195))

(assert (=> b!1502515 m!1385181))

(declare-fun m!1385197 () Bool)

(assert (=> b!1502507 m!1385197))

(assert (=> b!1502507 m!1385197))

(declare-fun m!1385199 () Bool)

(assert (=> b!1502507 m!1385199))

(declare-fun m!1385201 () Bool)

(assert (=> b!1502511 m!1385201))

(declare-fun m!1385203 () Bool)

(assert (=> start!127884 m!1385203))

(declare-fun m!1385205 () Bool)

(assert (=> start!127884 m!1385205))

(declare-fun m!1385207 () Bool)

(assert (=> b!1502514 m!1385207))

(push 1)

(assert (not b!1502507))

(assert (not b!1502512))

(assert (not start!127884))

(assert (not b!1502510))

(assert (not b!1502508))

(assert (not b!1502511))

(assert (not b!1502514))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

