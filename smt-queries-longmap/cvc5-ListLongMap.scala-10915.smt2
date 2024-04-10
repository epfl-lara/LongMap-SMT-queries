; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127752 () Bool)

(assert start!127752)

(declare-fun b!1501270 () Bool)

(declare-fun e!839865 () Bool)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1501270 (= e!839865 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(declare-datatypes ((array!100133 0))(
  ( (array!100134 (arr!48326 (Array (_ BitVec 32) (_ BitVec 64))) (size!48876 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100133)

(declare-datatypes ((SeekEntryResult!12536 0))(
  ( (MissingZero!12536 (index!52536 (_ BitVec 32))) (Found!12536 (index!52537 (_ BitVec 32))) (Intermediate!12536 (undefined!13348 Bool) (index!52538 (_ BitVec 32)) (x!134202 (_ BitVec 32))) (Undefined!12536) (MissingVacant!12536 (index!52539 (_ BitVec 32))) )
))
(declare-fun lt!653128 () SeekEntryResult!12536)

(declare-fun lt!653126 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100133 (_ BitVec 32)) SeekEntryResult!12536)

(assert (=> b!1501270 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653126 vacantAfter!10 (select (store (arr!48326 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100134 (store (arr!48326 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48876 a!2850)) mask!2661) lt!653128)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50226 0))(
  ( (Unit!50227) )
))
(declare-fun lt!653127 () Unit!50226)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100133 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50226)

(assert (=> b!1501270 (= lt!653127 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653126 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501271 () Bool)

(declare-fun e!839863 () Bool)

(declare-fun e!839864 () Bool)

(assert (=> b!1501271 (= e!839863 e!839864)))

(declare-fun res!1022349 () Bool)

(assert (=> b!1501271 (=> (not res!1022349) (not e!839864))))

(assert (=> b!1501271 (= res!1022349 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48326 a!2850) j!87) a!2850 mask!2661) lt!653128))))

(assert (=> b!1501271 (= lt!653128 (Found!12536 j!87))))

(declare-fun b!1501272 () Bool)

(declare-fun res!1022356 () Bool)

(assert (=> b!1501272 (=> (not res!1022356) (not e!839863))))

(declare-datatypes ((List!34818 0))(
  ( (Nil!34815) (Cons!34814 (h!36211 (_ BitVec 64)) (t!49512 List!34818)) )
))
(declare-fun arrayNoDuplicates!0 (array!100133 (_ BitVec 32) List!34818) Bool)

(assert (=> b!1501272 (= res!1022356 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34815))))

(declare-fun b!1501273 () Bool)

(declare-fun res!1022347 () Bool)

(assert (=> b!1501273 (=> (not res!1022347) (not e!839863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501273 (= res!1022347 (validKeyInArray!0 (select (arr!48326 a!2850) i!996)))))

(declare-fun res!1022352 () Bool)

(assert (=> start!127752 (=> (not res!1022352) (not e!839863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127752 (= res!1022352 (validMask!0 mask!2661))))

(assert (=> start!127752 e!839863))

(assert (=> start!127752 true))

(declare-fun array_inv!37354 (array!100133) Bool)

(assert (=> start!127752 (array_inv!37354 a!2850)))

(declare-fun b!1501274 () Bool)

(assert (=> b!1501274 (= e!839864 e!839865)))

(declare-fun res!1022348 () Bool)

(assert (=> b!1501274 (=> (not res!1022348) (not e!839865))))

(assert (=> b!1501274 (= res!1022348 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653126 #b00000000000000000000000000000000) (bvslt lt!653126 (size!48876 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501274 (= lt!653126 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501275 () Bool)

(declare-fun res!1022355 () Bool)

(assert (=> b!1501275 (=> (not res!1022355) (not e!839863))))

(assert (=> b!1501275 (= res!1022355 (and (= (size!48876 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48876 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48876 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501276 () Bool)

(declare-fun res!1022354 () Bool)

(assert (=> b!1501276 (=> (not res!1022354) (not e!839864))))

(assert (=> b!1501276 (= res!1022354 (not (= (select (arr!48326 a!2850) index!625) (select (arr!48326 a!2850) j!87))))))

(declare-fun b!1501277 () Bool)

(declare-fun res!1022353 () Bool)

(assert (=> b!1501277 (=> (not res!1022353) (not e!839865))))

(assert (=> b!1501277 (= res!1022353 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653126 vacantBefore!10 (select (arr!48326 a!2850) j!87) a!2850 mask!2661) lt!653128))))

(declare-fun b!1501278 () Bool)

(declare-fun res!1022350 () Bool)

(assert (=> b!1501278 (=> (not res!1022350) (not e!839863))))

(assert (=> b!1501278 (= res!1022350 (validKeyInArray!0 (select (arr!48326 a!2850) j!87)))))

(declare-fun b!1501279 () Bool)

(declare-fun res!1022351 () Bool)

(assert (=> b!1501279 (=> (not res!1022351) (not e!839863))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100133 (_ BitVec 32)) Bool)

(assert (=> b!1501279 (= res!1022351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501280 () Bool)

(declare-fun res!1022346 () Bool)

(assert (=> b!1501280 (=> (not res!1022346) (not e!839863))))

(assert (=> b!1501280 (= res!1022346 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48876 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48876 a!2850)) (= (select (arr!48326 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48326 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48876 a!2850))))))

(assert (= (and start!127752 res!1022352) b!1501275))

(assert (= (and b!1501275 res!1022355) b!1501273))

(assert (= (and b!1501273 res!1022347) b!1501278))

(assert (= (and b!1501278 res!1022350) b!1501279))

(assert (= (and b!1501279 res!1022351) b!1501272))

(assert (= (and b!1501272 res!1022356) b!1501280))

(assert (= (and b!1501280 res!1022346) b!1501271))

(assert (= (and b!1501271 res!1022349) b!1501276))

(assert (= (and b!1501276 res!1022354) b!1501274))

(assert (= (and b!1501274 res!1022348) b!1501277))

(assert (= (and b!1501277 res!1022353) b!1501270))

(declare-fun m!1384489 () Bool)

(assert (=> b!1501271 m!1384489))

(assert (=> b!1501271 m!1384489))

(declare-fun m!1384491 () Bool)

(assert (=> b!1501271 m!1384491))

(declare-fun m!1384493 () Bool)

(assert (=> b!1501270 m!1384493))

(declare-fun m!1384495 () Bool)

(assert (=> b!1501270 m!1384495))

(assert (=> b!1501270 m!1384495))

(declare-fun m!1384497 () Bool)

(assert (=> b!1501270 m!1384497))

(declare-fun m!1384499 () Bool)

(assert (=> b!1501270 m!1384499))

(declare-fun m!1384501 () Bool)

(assert (=> b!1501280 m!1384501))

(assert (=> b!1501280 m!1384493))

(declare-fun m!1384503 () Bool)

(assert (=> b!1501280 m!1384503))

(assert (=> b!1501278 m!1384489))

(assert (=> b!1501278 m!1384489))

(declare-fun m!1384505 () Bool)

(assert (=> b!1501278 m!1384505))

(declare-fun m!1384507 () Bool)

(assert (=> b!1501272 m!1384507))

(declare-fun m!1384509 () Bool)

(assert (=> b!1501279 m!1384509))

(declare-fun m!1384511 () Bool)

(assert (=> b!1501276 m!1384511))

(assert (=> b!1501276 m!1384489))

(declare-fun m!1384513 () Bool)

(assert (=> b!1501274 m!1384513))

(declare-fun m!1384515 () Bool)

(assert (=> b!1501273 m!1384515))

(assert (=> b!1501273 m!1384515))

(declare-fun m!1384517 () Bool)

(assert (=> b!1501273 m!1384517))

(assert (=> b!1501277 m!1384489))

(assert (=> b!1501277 m!1384489))

(declare-fun m!1384519 () Bool)

(assert (=> b!1501277 m!1384519))

(declare-fun m!1384521 () Bool)

(assert (=> start!127752 m!1384521))

(declare-fun m!1384523 () Bool)

(assert (=> start!127752 m!1384523))

(push 1)

(assert (not start!127752))

(assert (not b!1501278))

(assert (not b!1501277))

(assert (not b!1501270))

(assert (not b!1501279))

(assert (not b!1501271))

(assert (not b!1501273))

(assert (not b!1501272))

(assert (not b!1501274))

(check-sat)

(pop 1)

(push 1)

(check-sat)

