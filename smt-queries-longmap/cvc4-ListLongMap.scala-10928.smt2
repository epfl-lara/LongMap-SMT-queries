; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127870 () Bool)

(assert start!127870)

(declare-fun b!1502384 () Bool)

(declare-fun res!1023375 () Bool)

(declare-fun e!840295 () Bool)

(assert (=> b!1502384 (=> (not res!1023375) (not e!840295))))

(declare-datatypes ((array!100218 0))(
  ( (array!100219 (arr!48367 (Array (_ BitVec 32) (_ BitVec 64))) (size!48917 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100218)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502384 (= res!1023375 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48917 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48917 a!2850)) (= (select (arr!48367 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48367 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48917 a!2850))))))

(declare-fun res!1023374 () Bool)

(assert (=> start!127870 (=> (not res!1023374) (not e!840295))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127870 (= res!1023374 (validMask!0 mask!2661))))

(assert (=> start!127870 e!840295))

(assert (=> start!127870 true))

(declare-fun array_inv!37395 (array!100218) Bool)

(assert (=> start!127870 (array_inv!37395 a!2850)))

(declare-fun b!1502385 () Bool)

(declare-fun res!1023370 () Bool)

(assert (=> b!1502385 (=> (not res!1023370) (not e!840295))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1502385 (= res!1023370 (and (= (size!48917 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48917 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48917 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502386 () Bool)

(declare-fun res!1023376 () Bool)

(assert (=> b!1502386 (=> (not res!1023376) (not e!840295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100218 (_ BitVec 32)) Bool)

(assert (=> b!1502386 (= res!1023376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502387 () Bool)

(declare-fun res!1023373 () Bool)

(assert (=> b!1502387 (=> (not res!1023373) (not e!840295))))

(declare-datatypes ((List!34859 0))(
  ( (Nil!34856) (Cons!34855 (h!36252 (_ BitVec 64)) (t!49553 List!34859)) )
))
(declare-fun arrayNoDuplicates!0 (array!100218 (_ BitVec 32) List!34859) Bool)

(assert (=> b!1502387 (= res!1023373 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34856))))

(declare-fun b!1502388 () Bool)

(declare-fun res!1023372 () Bool)

(assert (=> b!1502388 (=> (not res!1023372) (not e!840295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502388 (= res!1023372 (validKeyInArray!0 (select (arr!48367 a!2850) i!996)))))

(declare-fun b!1502389 () Bool)

(declare-fun res!1023371 () Bool)

(assert (=> b!1502389 (=> (not res!1023371) (not e!840295))))

(assert (=> b!1502389 (= res!1023371 (validKeyInArray!0 (select (arr!48367 a!2850) j!87)))))

(declare-fun b!1502390 () Bool)

(assert (=> b!1502390 (= e!840295 false)))

(declare-datatypes ((SeekEntryResult!12565 0))(
  ( (MissingZero!12565 (index!52652 (_ BitVec 32))) (Found!12565 (index!52653 (_ BitVec 32))) (Intermediate!12565 (undefined!13377 Bool) (index!52654 (_ BitVec 32)) (x!134338 (_ BitVec 32))) (Undefined!12565) (MissingVacant!12565 (index!52655 (_ BitVec 32))) )
))
(declare-fun lt!653371 () SeekEntryResult!12565)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100218 (_ BitVec 32)) SeekEntryResult!12565)

(assert (=> b!1502390 (= lt!653371 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48367 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127870 res!1023374) b!1502385))

(assert (= (and b!1502385 res!1023370) b!1502388))

(assert (= (and b!1502388 res!1023372) b!1502389))

(assert (= (and b!1502389 res!1023371) b!1502386))

(assert (= (and b!1502386 res!1023376) b!1502387))

(assert (= (and b!1502387 res!1023373) b!1502384))

(assert (= (and b!1502384 res!1023375) b!1502390))

(declare-fun m!1385641 () Bool)

(assert (=> b!1502388 m!1385641))

(assert (=> b!1502388 m!1385641))

(declare-fun m!1385643 () Bool)

(assert (=> b!1502388 m!1385643))

(declare-fun m!1385645 () Bool)

(assert (=> b!1502390 m!1385645))

(assert (=> b!1502390 m!1385645))

(declare-fun m!1385647 () Bool)

(assert (=> b!1502390 m!1385647))

(declare-fun m!1385649 () Bool)

(assert (=> b!1502386 m!1385649))

(assert (=> b!1502389 m!1385645))

(assert (=> b!1502389 m!1385645))

(declare-fun m!1385651 () Bool)

(assert (=> b!1502389 m!1385651))

(declare-fun m!1385653 () Bool)

(assert (=> b!1502384 m!1385653))

(declare-fun m!1385655 () Bool)

(assert (=> b!1502384 m!1385655))

(declare-fun m!1385657 () Bool)

(assert (=> b!1502384 m!1385657))

(declare-fun m!1385659 () Bool)

(assert (=> start!127870 m!1385659))

(declare-fun m!1385661 () Bool)

(assert (=> start!127870 m!1385661))

(declare-fun m!1385663 () Bool)

(assert (=> b!1502387 m!1385663))

(push 1)

(assert (not b!1502389))

(assert (not b!1502390))

(assert (not b!1502386))

(assert (not b!1502388))

(assert (not b!1502387))

(assert (not start!127870))

(check-sat)

(pop 1)

(push 1)

(check-sat)

