; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127698 () Bool)

(assert start!127698)

(declare-fun b!1500431 () Bool)

(declare-fun e!839591 () Bool)

(declare-fun e!839593 () Bool)

(assert (=> b!1500431 (= e!839591 e!839593)))

(declare-fun res!1021514 () Bool)

(assert (=> b!1500431 (=> (not res!1021514) (not e!839593))))

(declare-datatypes ((array!100079 0))(
  ( (array!100080 (arr!48299 (Array (_ BitVec 32) (_ BitVec 64))) (size!48849 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100079)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!652936 () (_ BitVec 32))

(assert (=> b!1500431 (= res!1021514 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652936 #b00000000000000000000000000000000) (bvslt lt!652936 (size!48849 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500431 (= lt!652936 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500432 () Bool)

(declare-fun res!1021510 () Bool)

(assert (=> b!1500432 (=> (not res!1021510) (not e!839591))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1500432 (= res!1021510 (and (= (size!48849 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48849 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48849 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500433 () Bool)

(declare-fun res!1021507 () Bool)

(assert (=> b!1500433 (=> (not res!1021507) (not e!839591))))

(assert (=> b!1500433 (= res!1021507 (not (= (select (arr!48299 a!2850) index!625) (select (arr!48299 a!2850) j!87))))))

(declare-fun b!1500434 () Bool)

(declare-fun res!1021513 () Bool)

(assert (=> b!1500434 (=> (not res!1021513) (not e!839591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500434 (= res!1021513 (validKeyInArray!0 (select (arr!48299 a!2850) j!87)))))

(declare-fun b!1500435 () Bool)

(declare-fun res!1021512 () Bool)

(assert (=> b!1500435 (=> (not res!1021512) (not e!839591))))

(declare-datatypes ((List!34791 0))(
  ( (Nil!34788) (Cons!34787 (h!36184 (_ BitVec 64)) (t!49485 List!34791)) )
))
(declare-fun arrayNoDuplicates!0 (array!100079 (_ BitVec 32) List!34791) Bool)

(assert (=> b!1500435 (= res!1021512 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34788))))

(declare-fun b!1500436 () Bool)

(declare-fun res!1021515 () Bool)

(assert (=> b!1500436 (=> (not res!1021515) (not e!839591))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500436 (= res!1021515 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48849 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48849 a!2850)) (= (select (arr!48299 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48299 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48849 a!2850))))))

(declare-fun b!1500437 () Bool)

(declare-fun res!1021508 () Bool)

(assert (=> b!1500437 (=> (not res!1021508) (not e!839591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100079 (_ BitVec 32)) Bool)

(assert (=> b!1500437 (= res!1021508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1021511 () Bool)

(assert (=> start!127698 (=> (not res!1021511) (not e!839591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127698 (= res!1021511 (validMask!0 mask!2661))))

(assert (=> start!127698 e!839591))

(assert (=> start!127698 true))

(declare-fun array_inv!37327 (array!100079) Bool)

(assert (=> start!127698 (array_inv!37327 a!2850)))

(declare-fun b!1500438 () Bool)

(declare-fun res!1021516 () Bool)

(assert (=> b!1500438 (=> (not res!1021516) (not e!839591))))

(declare-datatypes ((SeekEntryResult!12509 0))(
  ( (MissingZero!12509 (index!52428 (_ BitVec 32))) (Found!12509 (index!52429 (_ BitVec 32))) (Intermediate!12509 (undefined!13321 Bool) (index!52430 (_ BitVec 32)) (x!134103 (_ BitVec 32))) (Undefined!12509) (MissingVacant!12509 (index!52431 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100079 (_ BitVec 32)) SeekEntryResult!12509)

(assert (=> b!1500438 (= res!1021516 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48299 a!2850) j!87) a!2850 mask!2661) (Found!12509 j!87)))))

(declare-fun b!1500439 () Bool)

(declare-fun res!1021509 () Bool)

(assert (=> b!1500439 (=> (not res!1021509) (not e!839591))))

(assert (=> b!1500439 (= res!1021509 (validKeyInArray!0 (select (arr!48299 a!2850) i!996)))))

(declare-fun b!1500440 () Bool)

(assert (=> b!1500440 (= e!839593 false)))

(declare-fun lt!652935 () SeekEntryResult!12509)

(assert (=> b!1500440 (= lt!652935 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652936 vacantBefore!10 (select (arr!48299 a!2850) j!87) a!2850 mask!2661))))

(assert (= (and start!127698 res!1021511) b!1500432))

(assert (= (and b!1500432 res!1021510) b!1500439))

(assert (= (and b!1500439 res!1021509) b!1500434))

(assert (= (and b!1500434 res!1021513) b!1500437))

(assert (= (and b!1500437 res!1021508) b!1500435))

(assert (= (and b!1500435 res!1021512) b!1500436))

(assert (= (and b!1500436 res!1021515) b!1500438))

(assert (= (and b!1500438 res!1021516) b!1500433))

(assert (= (and b!1500433 res!1021507) b!1500431))

(assert (= (and b!1500431 res!1021514) b!1500440))

(declare-fun m!1383625 () Bool)

(assert (=> b!1500434 m!1383625))

(assert (=> b!1500434 m!1383625))

(declare-fun m!1383627 () Bool)

(assert (=> b!1500434 m!1383627))

(assert (=> b!1500440 m!1383625))

(assert (=> b!1500440 m!1383625))

(declare-fun m!1383629 () Bool)

(assert (=> b!1500440 m!1383629))

(declare-fun m!1383631 () Bool)

(assert (=> b!1500437 m!1383631))

(declare-fun m!1383633 () Bool)

(assert (=> b!1500436 m!1383633))

(declare-fun m!1383635 () Bool)

(assert (=> b!1500436 m!1383635))

(declare-fun m!1383637 () Bool)

(assert (=> b!1500436 m!1383637))

(declare-fun m!1383639 () Bool)

(assert (=> start!127698 m!1383639))

(declare-fun m!1383641 () Bool)

(assert (=> start!127698 m!1383641))

(declare-fun m!1383643 () Bool)

(assert (=> b!1500433 m!1383643))

(assert (=> b!1500433 m!1383625))

(declare-fun m!1383645 () Bool)

(assert (=> b!1500431 m!1383645))

(declare-fun m!1383647 () Bool)

(assert (=> b!1500435 m!1383647))

(assert (=> b!1500438 m!1383625))

(assert (=> b!1500438 m!1383625))

(declare-fun m!1383649 () Bool)

(assert (=> b!1500438 m!1383649))

(declare-fun m!1383651 () Bool)

(assert (=> b!1500439 m!1383651))

(assert (=> b!1500439 m!1383651))

(declare-fun m!1383653 () Bool)

(assert (=> b!1500439 m!1383653))

(push 1)

