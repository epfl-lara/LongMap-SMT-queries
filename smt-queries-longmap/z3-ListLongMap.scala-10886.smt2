; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127846 () Bool)

(assert start!127846)

(declare-fun b!1500477 () Bool)

(declare-fun res!1020459 () Bool)

(declare-fun e!840171 () Bool)

(assert (=> b!1500477 (=> (not res!1020459) (not e!840171))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100072 0))(
  ( (array!100073 (arr!48292 (Array (_ BitVec 32) (_ BitVec 64))) (size!48843 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100072)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12395 0))(
  ( (MissingZero!12395 (index!51972 (_ BitVec 32))) (Found!12395 (index!51973 (_ BitVec 32))) (Intermediate!12395 (undefined!13207 Bool) (index!51974 (_ BitVec 32)) (x!133863 (_ BitVec 32))) (Undefined!12395) (MissingVacant!12395 (index!51975 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100072 (_ BitVec 32)) SeekEntryResult!12395)

(assert (=> b!1500477 (= res!1020459 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48292 a!2850) j!87) a!2850 mask!2661) (Found!12395 j!87)))))

(declare-fun b!1500478 () Bool)

(declare-fun res!1020461 () Bool)

(assert (=> b!1500478 (=> (not res!1020461) (not e!840171))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500478 (= res!1020461 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48843 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48843 a!2850)) (= (select (arr!48292 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48292 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48843 a!2850))))))

(declare-fun b!1500479 () Bool)

(declare-fun res!1020458 () Bool)

(assert (=> b!1500479 (=> (not res!1020458) (not e!840171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500479 (= res!1020458 (validKeyInArray!0 (select (arr!48292 a!2850) j!87)))))

(declare-fun res!1020454 () Bool)

(assert (=> start!127846 (=> (not res!1020454) (not e!840171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127846 (= res!1020454 (validMask!0 mask!2661))))

(assert (=> start!127846 e!840171))

(assert (=> start!127846 true))

(declare-fun array_inv!37573 (array!100072) Bool)

(assert (=> start!127846 (array_inv!37573 a!2850)))

(declare-fun b!1500480 () Bool)

(declare-fun res!1020460 () Bool)

(assert (=> b!1500480 (=> (not res!1020460) (not e!840171))))

(assert (=> b!1500480 (= res!1020460 (validKeyInArray!0 (select (arr!48292 a!2850) i!996)))))

(declare-fun b!1500481 () Bool)

(declare-fun res!1020455 () Bool)

(assert (=> b!1500481 (=> (not res!1020455) (not e!840171))))

(assert (=> b!1500481 (= res!1020455 (and (= (size!48843 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48843 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48843 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500482 () Bool)

(assert (=> b!1500482 (= e!840171 (and (= (select (arr!48292 a!2850) index!625) (select (arr!48292 a!2850) j!87)) (= j!87 index!625) (bvsge mask!2661 #b00000000000000000000000000000000) (bvslt index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661))))))

(declare-fun b!1500483 () Bool)

(declare-fun res!1020456 () Bool)

(assert (=> b!1500483 (=> (not res!1020456) (not e!840171))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100072 (_ BitVec 32)) Bool)

(assert (=> b!1500483 (= res!1020456 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500484 () Bool)

(declare-fun res!1020457 () Bool)

(assert (=> b!1500484 (=> (not res!1020457) (not e!840171))))

(declare-datatypes ((List!34771 0))(
  ( (Nil!34768) (Cons!34767 (h!36179 (_ BitVec 64)) (t!49457 List!34771)) )
))
(declare-fun arrayNoDuplicates!0 (array!100072 (_ BitVec 32) List!34771) Bool)

(assert (=> b!1500484 (= res!1020457 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34768))))

(assert (= (and start!127846 res!1020454) b!1500481))

(assert (= (and b!1500481 res!1020455) b!1500480))

(assert (= (and b!1500480 res!1020460) b!1500479))

(assert (= (and b!1500479 res!1020458) b!1500483))

(assert (= (and b!1500483 res!1020456) b!1500484))

(assert (= (and b!1500484 res!1020457) b!1500478))

(assert (= (and b!1500478 res!1020461) b!1500477))

(assert (= (and b!1500477 res!1020459) b!1500482))

(declare-fun m!1383641 () Bool)

(assert (=> b!1500482 m!1383641))

(declare-fun m!1383643 () Bool)

(assert (=> b!1500482 m!1383643))

(declare-fun m!1383645 () Bool)

(assert (=> b!1500480 m!1383645))

(assert (=> b!1500480 m!1383645))

(declare-fun m!1383647 () Bool)

(assert (=> b!1500480 m!1383647))

(assert (=> b!1500477 m!1383643))

(assert (=> b!1500477 m!1383643))

(declare-fun m!1383649 () Bool)

(assert (=> b!1500477 m!1383649))

(declare-fun m!1383651 () Bool)

(assert (=> b!1500484 m!1383651))

(declare-fun m!1383653 () Bool)

(assert (=> start!127846 m!1383653))

(declare-fun m!1383655 () Bool)

(assert (=> start!127846 m!1383655))

(declare-fun m!1383657 () Bool)

(assert (=> b!1500478 m!1383657))

(declare-fun m!1383659 () Bool)

(assert (=> b!1500478 m!1383659))

(declare-fun m!1383661 () Bool)

(assert (=> b!1500478 m!1383661))

(assert (=> b!1500479 m!1383643))

(assert (=> b!1500479 m!1383643))

(declare-fun m!1383663 () Bool)

(assert (=> b!1500479 m!1383663))

(declare-fun m!1383665 () Bool)

(assert (=> b!1500483 m!1383665))

(check-sat (not b!1500479) (not b!1500484) (not b!1500483) (not b!1500480) (not start!127846) (not b!1500477))
(check-sat)
