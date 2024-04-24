; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128000 () Bool)

(assert start!128000)

(declare-fun b!1502269 () Bool)

(declare-fun res!1022163 () Bool)

(declare-fun e!840732 () Bool)

(assert (=> b!1502269 (=> (not res!1022163) (not e!840732))))

(declare-datatypes ((array!100195 0))(
  ( (array!100196 (arr!48352 (Array (_ BitVec 32) (_ BitVec 64))) (size!48903 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100195)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502269 (= res!1022163 (not (= (select (arr!48352 a!2850) index!625) (select (arr!48352 a!2850) j!87))))))

(declare-fun b!1502270 () Bool)

(declare-fun res!1022166 () Bool)

(assert (=> b!1502270 (=> (not res!1022166) (not e!840732))))

(declare-datatypes ((List!34831 0))(
  ( (Nil!34828) (Cons!34827 (h!36239 (_ BitVec 64)) (t!49517 List!34831)) )
))
(declare-fun arrayNoDuplicates!0 (array!100195 (_ BitVec 32) List!34831) Bool)

(assert (=> b!1502270 (= res!1022166 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34828))))

(declare-fun b!1502271 () Bool)

(declare-fun res!1022168 () Bool)

(assert (=> b!1502271 (=> (not res!1022168) (not e!840732))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502271 (= res!1022168 (validKeyInArray!0 (select (arr!48352 a!2850) i!996)))))

(declare-fun res!1022169 () Bool)

(assert (=> start!128000 (=> (not res!1022169) (not e!840732))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128000 (= res!1022169 (validMask!0 mask!2661))))

(assert (=> start!128000 e!840732))

(assert (=> start!128000 true))

(declare-fun array_inv!37633 (array!100195) Bool)

(assert (=> start!128000 (array_inv!37633 a!2850)))

(declare-fun b!1502272 () Bool)

(declare-fun res!1022170 () Bool)

(assert (=> b!1502272 (=> (not res!1022170) (not e!840732))))

(assert (=> b!1502272 (= res!1022170 (and (= (size!48903 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48903 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48903 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502273 () Bool)

(declare-fun e!840730 () Bool)

(assert (=> b!1502273 (= e!840730 false)))

(declare-fun lt!653601 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12455 0))(
  ( (MissingZero!12455 (index!52212 (_ BitVec 32))) (Found!12455 (index!52213 (_ BitVec 32))) (Intermediate!12455 (undefined!13267 Bool) (index!52214 (_ BitVec 32)) (x!134086 (_ BitVec 32))) (Undefined!12455) (MissingVacant!12455 (index!52215 (_ BitVec 32))) )
))
(declare-fun lt!653600 () SeekEntryResult!12455)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100195 (_ BitVec 32)) SeekEntryResult!12455)

(assert (=> b!1502273 (= lt!653600 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653601 vacantBefore!10 (select (arr!48352 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502274 () Bool)

(declare-fun res!1022171 () Bool)

(assert (=> b!1502274 (=> (not res!1022171) (not e!840732))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502274 (= res!1022171 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48903 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48903 a!2850)) (= (select (arr!48352 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48352 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48903 a!2850))))))

(declare-fun b!1502275 () Bool)

(assert (=> b!1502275 (= e!840732 e!840730)))

(declare-fun res!1022165 () Bool)

(assert (=> b!1502275 (=> (not res!1022165) (not e!840730))))

(assert (=> b!1502275 (= res!1022165 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653601 #b00000000000000000000000000000000) (bvslt lt!653601 (size!48903 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1502275 (= lt!653601 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1502276 () Bool)

(declare-fun res!1022162 () Bool)

(assert (=> b!1502276 (=> (not res!1022162) (not e!840732))))

(assert (=> b!1502276 (= res!1022162 (validKeyInArray!0 (select (arr!48352 a!2850) j!87)))))

(declare-fun b!1502277 () Bool)

(declare-fun res!1022164 () Bool)

(assert (=> b!1502277 (=> (not res!1022164) (not e!840732))))

(assert (=> b!1502277 (= res!1022164 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48352 a!2850) j!87) a!2850 mask!2661) (Found!12455 j!87)))))

(declare-fun b!1502278 () Bool)

(declare-fun res!1022167 () Bool)

(assert (=> b!1502278 (=> (not res!1022167) (not e!840732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100195 (_ BitVec 32)) Bool)

(assert (=> b!1502278 (= res!1022167 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!128000 res!1022169) b!1502272))

(assert (= (and b!1502272 res!1022170) b!1502271))

(assert (= (and b!1502271 res!1022168) b!1502276))

(assert (= (and b!1502276 res!1022162) b!1502278))

(assert (= (and b!1502278 res!1022167) b!1502270))

(assert (= (and b!1502270 res!1022166) b!1502274))

(assert (= (and b!1502274 res!1022171) b!1502277))

(assert (= (and b!1502277 res!1022164) b!1502269))

(assert (= (and b!1502269 res!1022163) b!1502275))

(assert (= (and b!1502275 res!1022165) b!1502273))

(declare-fun m!1385413 () Bool)

(assert (=> b!1502273 m!1385413))

(assert (=> b!1502273 m!1385413))

(declare-fun m!1385415 () Bool)

(assert (=> b!1502273 m!1385415))

(declare-fun m!1385417 () Bool)

(assert (=> b!1502278 m!1385417))

(assert (=> b!1502276 m!1385413))

(assert (=> b!1502276 m!1385413))

(declare-fun m!1385419 () Bool)

(assert (=> b!1502276 m!1385419))

(declare-fun m!1385421 () Bool)

(assert (=> b!1502271 m!1385421))

(assert (=> b!1502271 m!1385421))

(declare-fun m!1385423 () Bool)

(assert (=> b!1502271 m!1385423))

(declare-fun m!1385425 () Bool)

(assert (=> start!128000 m!1385425))

(declare-fun m!1385427 () Bool)

(assert (=> start!128000 m!1385427))

(assert (=> b!1502277 m!1385413))

(assert (=> b!1502277 m!1385413))

(declare-fun m!1385429 () Bool)

(assert (=> b!1502277 m!1385429))

(declare-fun m!1385431 () Bool)

(assert (=> b!1502274 m!1385431))

(declare-fun m!1385433 () Bool)

(assert (=> b!1502274 m!1385433))

(declare-fun m!1385435 () Bool)

(assert (=> b!1502274 m!1385435))

(declare-fun m!1385437 () Bool)

(assert (=> b!1502275 m!1385437))

(declare-fun m!1385439 () Bool)

(assert (=> b!1502270 m!1385439))

(declare-fun m!1385441 () Bool)

(assert (=> b!1502269 m!1385441))

(assert (=> b!1502269 m!1385413))

(check-sat (not b!1502275) (not b!1502273) (not start!128000) (not b!1502277) (not b!1502271) (not b!1502278) (not b!1502276) (not b!1502270))
(check-sat)
