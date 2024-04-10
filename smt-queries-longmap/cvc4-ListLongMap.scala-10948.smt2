; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128068 () Bool)

(assert start!128068)

(declare-fun res!1025043 () Bool)

(declare-fun e!840853 () Bool)

(assert (=> start!128068 (=> (not res!1025043) (not e!840853))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128068 (= res!1025043 (validMask!0 mask!2661))))

(assert (=> start!128068 e!840853))

(assert (=> start!128068 true))

(declare-datatypes ((array!100344 0))(
  ( (array!100345 (arr!48427 (Array (_ BitVec 32) (_ BitVec 64))) (size!48977 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100344)

(declare-fun array_inv!37455 (array!100344) Bool)

(assert (=> start!128068 (array_inv!37455 a!2850)))

(declare-fun b!1504254 () Bool)

(declare-fun res!1025050 () Bool)

(assert (=> b!1504254 (=> (not res!1025050) (not e!840853))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12625 0))(
  ( (MissingZero!12625 (index!52892 (_ BitVec 32))) (Found!12625 (index!52893 (_ BitVec 32))) (Intermediate!12625 (undefined!13437 Bool) (index!52894 (_ BitVec 32)) (x!134567 (_ BitVec 32))) (Undefined!12625) (MissingVacant!12625 (index!52895 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100344 (_ BitVec 32)) SeekEntryResult!12625)

(assert (=> b!1504254 (= res!1025050 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48427 a!2850) j!87) a!2850 mask!2661) (Found!12625 j!87)))))

(declare-fun b!1504255 () Bool)

(declare-fun res!1025044 () Bool)

(assert (=> b!1504255 (=> (not res!1025044) (not e!840853))))

(assert (=> b!1504255 (= res!1025044 (not (= (select (arr!48427 a!2850) index!625) (select (arr!48427 a!2850) j!87))))))

(declare-fun b!1504256 () Bool)

(declare-fun res!1025045 () Bool)

(assert (=> b!1504256 (=> (not res!1025045) (not e!840853))))

(declare-datatypes ((List!34919 0))(
  ( (Nil!34916) (Cons!34915 (h!36312 (_ BitVec 64)) (t!49613 List!34919)) )
))
(declare-fun arrayNoDuplicates!0 (array!100344 (_ BitVec 32) List!34919) Bool)

(assert (=> b!1504256 (= res!1025045 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34916))))

(declare-fun b!1504257 () Bool)

(declare-fun res!1025049 () Bool)

(assert (=> b!1504257 (=> (not res!1025049) (not e!840853))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100344 (_ BitVec 32)) Bool)

(assert (=> b!1504257 (= res!1025049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1504258 () Bool)

(declare-fun res!1025042 () Bool)

(assert (=> b!1504258 (=> (not res!1025042) (not e!840853))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1504258 (= res!1025042 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48977 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48977 a!2850)) (= (select (arr!48427 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48427 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48977 a!2850))))))

(declare-fun b!1504259 () Bool)

(declare-fun res!1025046 () Bool)

(assert (=> b!1504259 (=> (not res!1025046) (not e!840853))))

(assert (=> b!1504259 (= res!1025046 (and (= (size!48977 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48977 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48977 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1504260 () Bool)

(declare-fun res!1025048 () Bool)

(assert (=> b!1504260 (=> (not res!1025048) (not e!840853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1504260 (= res!1025048 (validKeyInArray!0 (select (arr!48427 a!2850) j!87)))))

(declare-fun b!1504261 () Bool)

(assert (=> b!1504261 (= e!840853 false)))

(declare-fun lt!653656 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1504261 (= lt!653656 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1504262 () Bool)

(declare-fun res!1025047 () Bool)

(assert (=> b!1504262 (=> (not res!1025047) (not e!840853))))

(assert (=> b!1504262 (= res!1025047 (validKeyInArray!0 (select (arr!48427 a!2850) i!996)))))

(assert (= (and start!128068 res!1025043) b!1504259))

(assert (= (and b!1504259 res!1025046) b!1504262))

(assert (= (and b!1504262 res!1025047) b!1504260))

(assert (= (and b!1504260 res!1025048) b!1504257))

(assert (= (and b!1504257 res!1025049) b!1504256))

(assert (= (and b!1504256 res!1025045) b!1504258))

(assert (= (and b!1504258 res!1025042) b!1504254))

(assert (= (and b!1504254 res!1025050) b!1504255))

(assert (= (and b!1504255 res!1025044) b!1504261))

(declare-fun m!1387467 () Bool)

(assert (=> b!1504258 m!1387467))

(declare-fun m!1387469 () Bool)

(assert (=> b!1504258 m!1387469))

(declare-fun m!1387471 () Bool)

(assert (=> b!1504258 m!1387471))

(declare-fun m!1387473 () Bool)

(assert (=> b!1504261 m!1387473))

(declare-fun m!1387475 () Bool)

(assert (=> start!128068 m!1387475))

(declare-fun m!1387477 () Bool)

(assert (=> start!128068 m!1387477))

(declare-fun m!1387479 () Bool)

(assert (=> b!1504257 m!1387479))

(declare-fun m!1387481 () Bool)

(assert (=> b!1504260 m!1387481))

(assert (=> b!1504260 m!1387481))

(declare-fun m!1387483 () Bool)

(assert (=> b!1504260 m!1387483))

(declare-fun m!1387485 () Bool)

(assert (=> b!1504256 m!1387485))

(assert (=> b!1504254 m!1387481))

(assert (=> b!1504254 m!1387481))

(declare-fun m!1387487 () Bool)

(assert (=> b!1504254 m!1387487))

(declare-fun m!1387489 () Bool)

(assert (=> b!1504262 m!1387489))

(assert (=> b!1504262 m!1387489))

(declare-fun m!1387491 () Bool)

(assert (=> b!1504262 m!1387491))

(declare-fun m!1387493 () Bool)

(assert (=> b!1504255 m!1387493))

(assert (=> b!1504255 m!1387481))

(push 1)

(assert (not b!1504256))

(assert (not b!1504257))

(assert (not b!1504262))

(assert (not start!128068))

(assert (not b!1504254))

(assert (not b!1504260))

(assert (not b!1504261))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

