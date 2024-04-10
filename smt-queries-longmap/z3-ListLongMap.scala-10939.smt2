; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127970 () Bool)

(assert start!127970)

(declare-fun b!1503363 () Bool)

(declare-fun res!1024244 () Bool)

(declare-fun e!840594 () Bool)

(assert (=> b!1503363 (=> (not res!1024244) (not e!840594))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-datatypes ((array!100285 0))(
  ( (array!100286 (arr!48399 (Array (_ BitVec 32) (_ BitVec 64))) (size!48949 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100285)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12597 0))(
  ( (MissingZero!12597 (index!52780 (_ BitVec 32))) (Found!12597 (index!52781 (_ BitVec 32))) (Intermediate!12597 (undefined!13409 Bool) (index!52782 (_ BitVec 32)) (x!134461 (_ BitVec 32))) (Undefined!12597) (MissingVacant!12597 (index!52783 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100285 (_ BitVec 32)) SeekEntryResult!12597)

(assert (=> b!1503363 (= res!1024244 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48399 a!2850) j!87) a!2850 mask!2661) (Found!12597 j!87)))))

(declare-fun b!1503364 () Bool)

(assert (=> b!1503364 (= e!840594 false)))

(declare-fun lt!653518 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503364 (= lt!653518 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503365 () Bool)

(declare-fun res!1024248 () Bool)

(assert (=> b!1503365 (=> (not res!1024248) (not e!840594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100285 (_ BitVec 32)) Bool)

(assert (=> b!1503365 (= res!1024248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503366 () Bool)

(declare-fun res!1024242 () Bool)

(assert (=> b!1503366 (=> (not res!1024242) (not e!840594))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503366 (= res!1024242 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48949 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48949 a!2850)) (= (select (arr!48399 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48399 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48949 a!2850))))))

(declare-fun res!1024246 () Bool)

(assert (=> start!127970 (=> (not res!1024246) (not e!840594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127970 (= res!1024246 (validMask!0 mask!2661))))

(assert (=> start!127970 e!840594))

(assert (=> start!127970 true))

(declare-fun array_inv!37427 (array!100285) Bool)

(assert (=> start!127970 (array_inv!37427 a!2850)))

(declare-fun b!1503367 () Bool)

(declare-fun res!1024249 () Bool)

(assert (=> b!1503367 (=> (not res!1024249) (not e!840594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503367 (= res!1024249 (validKeyInArray!0 (select (arr!48399 a!2850) i!996)))))

(declare-fun b!1503368 () Bool)

(declare-fun res!1024247 () Bool)

(assert (=> b!1503368 (=> (not res!1024247) (not e!840594))))

(assert (=> b!1503368 (= res!1024247 (and (= (size!48949 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48949 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48949 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503369 () Bool)

(declare-fun res!1024245 () Bool)

(assert (=> b!1503369 (=> (not res!1024245) (not e!840594))))

(assert (=> b!1503369 (= res!1024245 (validKeyInArray!0 (select (arr!48399 a!2850) j!87)))))

(declare-fun b!1503370 () Bool)

(declare-fun res!1024241 () Bool)

(assert (=> b!1503370 (=> (not res!1024241) (not e!840594))))

(declare-datatypes ((List!34891 0))(
  ( (Nil!34888) (Cons!34887 (h!36284 (_ BitVec 64)) (t!49585 List!34891)) )
))
(declare-fun arrayNoDuplicates!0 (array!100285 (_ BitVec 32) List!34891) Bool)

(assert (=> b!1503370 (= res!1024241 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34888))))

(declare-fun b!1503371 () Bool)

(declare-fun res!1024243 () Bool)

(assert (=> b!1503371 (=> (not res!1024243) (not e!840594))))

(assert (=> b!1503371 (= res!1024243 (not (= (select (arr!48399 a!2850) index!625) (select (arr!48399 a!2850) j!87))))))

(assert (= (and start!127970 res!1024246) b!1503368))

(assert (= (and b!1503368 res!1024247) b!1503367))

(assert (= (and b!1503367 res!1024249) b!1503369))

(assert (= (and b!1503369 res!1024245) b!1503365))

(assert (= (and b!1503365 res!1024248) b!1503370))

(assert (= (and b!1503370 res!1024241) b!1503366))

(assert (= (and b!1503366 res!1024242) b!1503363))

(assert (= (and b!1503363 res!1024244) b!1503371))

(assert (= (and b!1503371 res!1024243) b!1503364))

(declare-fun m!1386611 () Bool)

(assert (=> b!1503363 m!1386611))

(assert (=> b!1503363 m!1386611))

(declare-fun m!1386613 () Bool)

(assert (=> b!1503363 m!1386613))

(declare-fun m!1386615 () Bool)

(assert (=> b!1503370 m!1386615))

(declare-fun m!1386617 () Bool)

(assert (=> b!1503366 m!1386617))

(declare-fun m!1386619 () Bool)

(assert (=> b!1503366 m!1386619))

(declare-fun m!1386621 () Bool)

(assert (=> b!1503366 m!1386621))

(declare-fun m!1386623 () Bool)

(assert (=> start!127970 m!1386623))

(declare-fun m!1386625 () Bool)

(assert (=> start!127970 m!1386625))

(declare-fun m!1386627 () Bool)

(assert (=> b!1503367 m!1386627))

(assert (=> b!1503367 m!1386627))

(declare-fun m!1386629 () Bool)

(assert (=> b!1503367 m!1386629))

(declare-fun m!1386631 () Bool)

(assert (=> b!1503371 m!1386631))

(assert (=> b!1503371 m!1386611))

(assert (=> b!1503369 m!1386611))

(assert (=> b!1503369 m!1386611))

(declare-fun m!1386633 () Bool)

(assert (=> b!1503369 m!1386633))

(declare-fun m!1386635 () Bool)

(assert (=> b!1503365 m!1386635))

(declare-fun m!1386637 () Bool)

(assert (=> b!1503364 m!1386637))

(check-sat (not b!1503370) (not b!1503367) (not start!127970) (not b!1503364) (not b!1503363) (not b!1503365) (not b!1503369))
