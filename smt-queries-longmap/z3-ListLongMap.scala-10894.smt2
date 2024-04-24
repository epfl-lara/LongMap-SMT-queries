; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127928 () Bool)

(assert start!127928)

(declare-fun b!1501189 () Bool)

(declare-fun res!1021083 () Bool)

(declare-fun e!840407 () Bool)

(assert (=> b!1501189 (=> (not res!1021083) (not e!840407))))

(declare-datatypes ((array!100123 0))(
  ( (array!100124 (arr!48316 (Array (_ BitVec 32) (_ BitVec 64))) (size!48867 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100123)

(declare-datatypes ((List!34795 0))(
  ( (Nil!34792) (Cons!34791 (h!36203 (_ BitVec 64)) (t!49481 List!34795)) )
))
(declare-fun arrayNoDuplicates!0 (array!100123 (_ BitVec 32) List!34795) Bool)

(assert (=> b!1501189 (= res!1021083 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34792))))

(declare-fun b!1501190 () Bool)

(declare-fun res!1021085 () Bool)

(assert (=> b!1501190 (=> (not res!1021085) (not e!840407))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501190 (= res!1021085 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48867 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48867 a!2850)) (= (select (arr!48316 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48316 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48867 a!2850))))))

(declare-fun res!1021090 () Bool)

(assert (=> start!127928 (=> (not res!1021090) (not e!840407))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127928 (= res!1021090 (validMask!0 mask!2661))))

(assert (=> start!127928 e!840407))

(assert (=> start!127928 true))

(declare-fun array_inv!37597 (array!100123) Bool)

(assert (=> start!127928 (array_inv!37597 a!2850)))

(declare-fun b!1501191 () Bool)

(declare-fun res!1021087 () Bool)

(assert (=> b!1501191 (=> (not res!1021087) (not e!840407))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12419 0))(
  ( (MissingZero!12419 (index!52068 (_ BitVec 32))) (Found!12419 (index!52069 (_ BitVec 32))) (Intermediate!12419 (undefined!13231 Bool) (index!52070 (_ BitVec 32)) (x!133954 (_ BitVec 32))) (Undefined!12419) (MissingVacant!12419 (index!52071 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100123 (_ BitVec 32)) SeekEntryResult!12419)

(assert (=> b!1501191 (= res!1021087 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48316 a!2850) j!87) a!2850 mask!2661) (Found!12419 j!87)))))

(declare-fun b!1501192 () Bool)

(declare-fun res!1021082 () Bool)

(assert (=> b!1501192 (=> (not res!1021082) (not e!840407))))

(assert (=> b!1501192 (= res!1021082 (not (= (select (arr!48316 a!2850) index!625) (select (arr!48316 a!2850) j!87))))))

(declare-fun b!1501193 () Bool)

(declare-fun res!1021088 () Bool)

(assert (=> b!1501193 (=> (not res!1021088) (not e!840407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501193 (= res!1021088 (validKeyInArray!0 (select (arr!48316 a!2850) j!87)))))

(declare-fun b!1501194 () Bool)

(declare-fun e!840408 () Bool)

(assert (=> b!1501194 (= e!840407 e!840408)))

(declare-fun res!1021084 () Bool)

(assert (=> b!1501194 (=> (not res!1021084) (not e!840408))))

(declare-fun lt!653384 () (_ BitVec 32))

(assert (=> b!1501194 (= res!1021084 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653384 #b00000000000000000000000000000000) (bvslt lt!653384 (size!48867 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501194 (= lt!653384 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1501195 () Bool)

(declare-fun res!1021091 () Bool)

(assert (=> b!1501195 (=> (not res!1021091) (not e!840407))))

(assert (=> b!1501195 (= res!1021091 (and (= (size!48867 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48867 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48867 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501196 () Bool)

(assert (=> b!1501196 (= e!840408 false)))

(declare-fun lt!653385 () SeekEntryResult!12419)

(assert (=> b!1501196 (= lt!653385 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653384 vacantBefore!10 (select (arr!48316 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501197 () Bool)

(declare-fun res!1021086 () Bool)

(assert (=> b!1501197 (=> (not res!1021086) (not e!840407))))

(assert (=> b!1501197 (= res!1021086 (validKeyInArray!0 (select (arr!48316 a!2850) i!996)))))

(declare-fun b!1501198 () Bool)

(declare-fun res!1021089 () Bool)

(assert (=> b!1501198 (=> (not res!1021089) (not e!840407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100123 (_ BitVec 32)) Bool)

(assert (=> b!1501198 (= res!1021089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(assert (= (and start!127928 res!1021090) b!1501195))

(assert (= (and b!1501195 res!1021091) b!1501197))

(assert (= (and b!1501197 res!1021086) b!1501193))

(assert (= (and b!1501193 res!1021088) b!1501198))

(assert (= (and b!1501198 res!1021089) b!1501189))

(assert (= (and b!1501189 res!1021083) b!1501190))

(assert (= (and b!1501190 res!1021085) b!1501191))

(assert (= (and b!1501191 res!1021087) b!1501192))

(assert (= (and b!1501192 res!1021082) b!1501194))

(assert (= (and b!1501194 res!1021084) b!1501196))

(declare-fun m!1384333 () Bool)

(assert (=> b!1501198 m!1384333))

(declare-fun m!1384335 () Bool)

(assert (=> start!127928 m!1384335))

(declare-fun m!1384337 () Bool)

(assert (=> start!127928 m!1384337))

(declare-fun m!1384339 () Bool)

(assert (=> b!1501196 m!1384339))

(assert (=> b!1501196 m!1384339))

(declare-fun m!1384341 () Bool)

(assert (=> b!1501196 m!1384341))

(declare-fun m!1384343 () Bool)

(assert (=> b!1501190 m!1384343))

(declare-fun m!1384345 () Bool)

(assert (=> b!1501190 m!1384345))

(declare-fun m!1384347 () Bool)

(assert (=> b!1501190 m!1384347))

(declare-fun m!1384349 () Bool)

(assert (=> b!1501194 m!1384349))

(assert (=> b!1501193 m!1384339))

(assert (=> b!1501193 m!1384339))

(declare-fun m!1384351 () Bool)

(assert (=> b!1501193 m!1384351))

(declare-fun m!1384353 () Bool)

(assert (=> b!1501189 m!1384353))

(declare-fun m!1384355 () Bool)

(assert (=> b!1501192 m!1384355))

(assert (=> b!1501192 m!1384339))

(assert (=> b!1501191 m!1384339))

(assert (=> b!1501191 m!1384339))

(declare-fun m!1384357 () Bool)

(assert (=> b!1501191 m!1384357))

(declare-fun m!1384359 () Bool)

(assert (=> b!1501197 m!1384359))

(assert (=> b!1501197 m!1384359))

(declare-fun m!1384361 () Bool)

(assert (=> b!1501197 m!1384361))

(check-sat (not b!1501193) (not b!1501191) (not b!1501194) (not b!1501198) (not b!1501197) (not start!127928) (not b!1501196) (not b!1501189))
(check-sat)
