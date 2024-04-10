; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127690 () Bool)

(assert start!127690)

(declare-fun b!1500311 () Bool)

(declare-fun res!1021389 () Bool)

(declare-fun e!839556 () Bool)

(assert (=> b!1500311 (=> (not res!1021389) (not e!839556))))

(declare-datatypes ((array!100071 0))(
  ( (array!100072 (arr!48295 (Array (_ BitVec 32) (_ BitVec 64))) (size!48845 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100071)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100071 (_ BitVec 32)) Bool)

(assert (=> b!1500311 (= res!1021389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500312 () Bool)

(declare-fun res!1021396 () Bool)

(assert (=> b!1500312 (=> (not res!1021396) (not e!839556))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12505 0))(
  ( (MissingZero!12505 (index!52412 (_ BitVec 32))) (Found!12505 (index!52413 (_ BitVec 32))) (Intermediate!12505 (undefined!13317 Bool) (index!52414 (_ BitVec 32)) (x!134083 (_ BitVec 32))) (Undefined!12505) (MissingVacant!12505 (index!52415 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100071 (_ BitVec 32)) SeekEntryResult!12505)

(assert (=> b!1500312 (= res!1021396 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48295 a!2850) j!87) a!2850 mask!2661) (Found!12505 j!87)))))

(declare-fun b!1500313 () Bool)

(declare-fun res!1021392 () Bool)

(assert (=> b!1500313 (=> (not res!1021392) (not e!839556))))

(assert (=> b!1500313 (= res!1021392 (not (= (select (arr!48295 a!2850) index!625) (select (arr!48295 a!2850) j!87))))))

(declare-fun b!1500314 () Bool)

(declare-fun e!839557 () Bool)

(assert (=> b!1500314 (= e!839557 false)))

(declare-fun lt!652912 () (_ BitVec 32))

(declare-fun lt!652911 () SeekEntryResult!12505)

(assert (=> b!1500314 (= lt!652911 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652912 vacantBefore!10 (select (arr!48295 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500315 () Bool)

(assert (=> b!1500315 (= e!839556 e!839557)))

(declare-fun res!1021391 () Bool)

(assert (=> b!1500315 (=> (not res!1021391) (not e!839557))))

(assert (=> b!1500315 (= res!1021391 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652912 #b00000000000000000000000000000000) (bvslt lt!652912 (size!48845 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500315 (= lt!652912 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500316 () Bool)

(declare-fun res!1021390 () Bool)

(assert (=> b!1500316 (=> (not res!1021390) (not e!839556))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500316 (= res!1021390 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48845 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48845 a!2850)) (= (select (arr!48295 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48295 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48845 a!2850))))))

(declare-fun b!1500317 () Bool)

(declare-fun res!1021394 () Bool)

(assert (=> b!1500317 (=> (not res!1021394) (not e!839556))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500317 (= res!1021394 (validKeyInArray!0 (select (arr!48295 a!2850) j!87)))))

(declare-fun b!1500319 () Bool)

(declare-fun res!1021388 () Bool)

(assert (=> b!1500319 (=> (not res!1021388) (not e!839556))))

(assert (=> b!1500319 (= res!1021388 (and (= (size!48845 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48845 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48845 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500320 () Bool)

(declare-fun res!1021393 () Bool)

(assert (=> b!1500320 (=> (not res!1021393) (not e!839556))))

(declare-datatypes ((List!34787 0))(
  ( (Nil!34784) (Cons!34783 (h!36180 (_ BitVec 64)) (t!49481 List!34787)) )
))
(declare-fun arrayNoDuplicates!0 (array!100071 (_ BitVec 32) List!34787) Bool)

(assert (=> b!1500320 (= res!1021393 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34784))))

(declare-fun res!1021395 () Bool)

(assert (=> start!127690 (=> (not res!1021395) (not e!839556))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127690 (= res!1021395 (validMask!0 mask!2661))))

(assert (=> start!127690 e!839556))

(assert (=> start!127690 true))

(declare-fun array_inv!37323 (array!100071) Bool)

(assert (=> start!127690 (array_inv!37323 a!2850)))

(declare-fun b!1500318 () Bool)

(declare-fun res!1021387 () Bool)

(assert (=> b!1500318 (=> (not res!1021387) (not e!839556))))

(assert (=> b!1500318 (= res!1021387 (validKeyInArray!0 (select (arr!48295 a!2850) i!996)))))

(assert (= (and start!127690 res!1021395) b!1500319))

(assert (= (and b!1500319 res!1021388) b!1500318))

(assert (= (and b!1500318 res!1021387) b!1500317))

(assert (= (and b!1500317 res!1021394) b!1500311))

(assert (= (and b!1500311 res!1021389) b!1500320))

(assert (= (and b!1500320 res!1021393) b!1500316))

(assert (= (and b!1500316 res!1021390) b!1500312))

(assert (= (and b!1500312 res!1021396) b!1500313))

(assert (= (and b!1500313 res!1021392) b!1500315))

(assert (= (and b!1500315 res!1021391) b!1500314))

(declare-fun m!1383505 () Bool)

(assert (=> b!1500316 m!1383505))

(declare-fun m!1383507 () Bool)

(assert (=> b!1500316 m!1383507))

(declare-fun m!1383509 () Bool)

(assert (=> b!1500316 m!1383509))

(declare-fun m!1383511 () Bool)

(assert (=> b!1500318 m!1383511))

(assert (=> b!1500318 m!1383511))

(declare-fun m!1383513 () Bool)

(assert (=> b!1500318 m!1383513))

(declare-fun m!1383515 () Bool)

(assert (=> b!1500311 m!1383515))

(declare-fun m!1383517 () Bool)

(assert (=> start!127690 m!1383517))

(declare-fun m!1383519 () Bool)

(assert (=> start!127690 m!1383519))

(declare-fun m!1383521 () Bool)

(assert (=> b!1500314 m!1383521))

(assert (=> b!1500314 m!1383521))

(declare-fun m!1383523 () Bool)

(assert (=> b!1500314 m!1383523))

(declare-fun m!1383525 () Bool)

(assert (=> b!1500313 m!1383525))

(assert (=> b!1500313 m!1383521))

(declare-fun m!1383527 () Bool)

(assert (=> b!1500320 m!1383527))

(assert (=> b!1500317 m!1383521))

(assert (=> b!1500317 m!1383521))

(declare-fun m!1383529 () Bool)

(assert (=> b!1500317 m!1383529))

(assert (=> b!1500312 m!1383521))

(assert (=> b!1500312 m!1383521))

(declare-fun m!1383531 () Bool)

(assert (=> b!1500312 m!1383531))

(declare-fun m!1383533 () Bool)

(assert (=> b!1500315 m!1383533))

(push 1)

(assert (not b!1500314))

(assert (not b!1500311))

(assert (not b!1500315))

(assert (not b!1500318))

(assert (not b!1500312))

(assert (not b!1500320))

(assert (not b!1500317))

(assert (not start!127690))

(check-sat)

