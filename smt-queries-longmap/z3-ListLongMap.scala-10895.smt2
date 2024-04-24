; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127934 () Bool)

(assert start!127934)

(declare-fun b!1501279 () Bool)

(declare-fun res!1021181 () Bool)

(declare-fun e!840435 () Bool)

(assert (=> b!1501279 (=> (not res!1021181) (not e!840435))))

(declare-datatypes ((array!100129 0))(
  ( (array!100130 (arr!48319 (Array (_ BitVec 32) (_ BitVec 64))) (size!48870 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100129)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501279 (= res!1021181 (not (= (select (arr!48319 a!2850) index!625) (select (arr!48319 a!2850) j!87))))))

(declare-fun b!1501280 () Bool)

(declare-fun res!1021175 () Bool)

(assert (=> b!1501280 (=> (not res!1021175) (not e!840435))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100129 (_ BitVec 32)) Bool)

(assert (=> b!1501280 (= res!1021175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501281 () Bool)

(declare-fun res!1021179 () Bool)

(assert (=> b!1501281 (=> (not res!1021179) (not e!840435))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501281 (= res!1021179 (validKeyInArray!0 (select (arr!48319 a!2850) j!87)))))

(declare-fun b!1501282 () Bool)

(declare-fun res!1021172 () Bool)

(assert (=> b!1501282 (=> (not res!1021172) (not e!840435))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1501282 (= res!1021172 (and (= (size!48870 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48870 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48870 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501283 () Bool)

(declare-fun e!840434 () Bool)

(assert (=> b!1501283 (= e!840435 e!840434)))

(declare-fun res!1021177 () Bool)

(assert (=> b!1501283 (=> (not res!1021177) (not e!840434))))

(declare-fun lt!653403 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1501283 (= res!1021177 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653403 #b00000000000000000000000000000000) (bvslt lt!653403 (size!48870 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501283 (= lt!653403 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1501284 () Bool)

(declare-fun res!1021176 () Bool)

(assert (=> b!1501284 (=> (not res!1021176) (not e!840435))))

(assert (=> b!1501284 (= res!1021176 (validKeyInArray!0 (select (arr!48319 a!2850) i!996)))))

(declare-fun b!1501285 () Bool)

(declare-fun res!1021174 () Bool)

(assert (=> b!1501285 (=> (not res!1021174) (not e!840435))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501285 (= res!1021174 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48870 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48870 a!2850)) (= (select (arr!48319 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48319 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48870 a!2850))))))

(declare-fun b!1501286 () Bool)

(declare-fun res!1021180 () Bool)

(assert (=> b!1501286 (=> (not res!1021180) (not e!840435))))

(declare-datatypes ((List!34798 0))(
  ( (Nil!34795) (Cons!34794 (h!36206 (_ BitVec 64)) (t!49484 List!34798)) )
))
(declare-fun arrayNoDuplicates!0 (array!100129 (_ BitVec 32) List!34798) Bool)

(assert (=> b!1501286 (= res!1021180 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34795))))

(declare-fun res!1021173 () Bool)

(assert (=> start!127934 (=> (not res!1021173) (not e!840435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127934 (= res!1021173 (validMask!0 mask!2661))))

(assert (=> start!127934 e!840435))

(assert (=> start!127934 true))

(declare-fun array_inv!37600 (array!100129) Bool)

(assert (=> start!127934 (array_inv!37600 a!2850)))

(declare-fun b!1501287 () Bool)

(assert (=> b!1501287 (= e!840434 false)))

(declare-datatypes ((SeekEntryResult!12422 0))(
  ( (MissingZero!12422 (index!52080 (_ BitVec 32))) (Found!12422 (index!52081 (_ BitVec 32))) (Intermediate!12422 (undefined!13234 Bool) (index!52082 (_ BitVec 32)) (x!133965 (_ BitVec 32))) (Undefined!12422) (MissingVacant!12422 (index!52083 (_ BitVec 32))) )
))
(declare-fun lt!653402 () SeekEntryResult!12422)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100129 (_ BitVec 32)) SeekEntryResult!12422)

(assert (=> b!1501287 (= lt!653402 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653403 vacantBefore!10 (select (arr!48319 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1501288 () Bool)

(declare-fun res!1021178 () Bool)

(assert (=> b!1501288 (=> (not res!1021178) (not e!840435))))

(assert (=> b!1501288 (= res!1021178 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48319 a!2850) j!87) a!2850 mask!2661) (Found!12422 j!87)))))

(assert (= (and start!127934 res!1021173) b!1501282))

(assert (= (and b!1501282 res!1021172) b!1501284))

(assert (= (and b!1501284 res!1021176) b!1501281))

(assert (= (and b!1501281 res!1021179) b!1501280))

(assert (= (and b!1501280 res!1021175) b!1501286))

(assert (= (and b!1501286 res!1021180) b!1501285))

(assert (= (and b!1501285 res!1021174) b!1501288))

(assert (= (and b!1501288 res!1021178) b!1501279))

(assert (= (and b!1501279 res!1021181) b!1501283))

(assert (= (and b!1501283 res!1021177) b!1501287))

(declare-fun m!1384423 () Bool)

(assert (=> b!1501285 m!1384423))

(declare-fun m!1384425 () Bool)

(assert (=> b!1501285 m!1384425))

(declare-fun m!1384427 () Bool)

(assert (=> b!1501285 m!1384427))

(declare-fun m!1384429 () Bool)

(assert (=> b!1501279 m!1384429))

(declare-fun m!1384431 () Bool)

(assert (=> b!1501279 m!1384431))

(declare-fun m!1384433 () Bool)

(assert (=> b!1501280 m!1384433))

(declare-fun m!1384435 () Bool)

(assert (=> b!1501283 m!1384435))

(assert (=> b!1501288 m!1384431))

(assert (=> b!1501288 m!1384431))

(declare-fun m!1384437 () Bool)

(assert (=> b!1501288 m!1384437))

(declare-fun m!1384439 () Bool)

(assert (=> start!127934 m!1384439))

(declare-fun m!1384441 () Bool)

(assert (=> start!127934 m!1384441))

(assert (=> b!1501287 m!1384431))

(assert (=> b!1501287 m!1384431))

(declare-fun m!1384443 () Bool)

(assert (=> b!1501287 m!1384443))

(declare-fun m!1384445 () Bool)

(assert (=> b!1501284 m!1384445))

(assert (=> b!1501284 m!1384445))

(declare-fun m!1384447 () Bool)

(assert (=> b!1501284 m!1384447))

(assert (=> b!1501281 m!1384431))

(assert (=> b!1501281 m!1384431))

(declare-fun m!1384449 () Bool)

(assert (=> b!1501281 m!1384449))

(declare-fun m!1384451 () Bool)

(assert (=> b!1501286 m!1384451))

(check-sat (not b!1501284) (not b!1501286) (not start!127934) (not b!1501280) (not b!1501288) (not b!1501287) (not b!1501281) (not b!1501283))
(check-sat)
