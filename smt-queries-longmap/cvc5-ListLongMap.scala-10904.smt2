; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127686 () Bool)

(assert start!127686)

(declare-fun b!1500251 () Bool)

(declare-fun res!1021328 () Bool)

(declare-fun e!839537 () Bool)

(assert (=> b!1500251 (=> (not res!1021328) (not e!839537))))

(declare-datatypes ((array!100067 0))(
  ( (array!100068 (arr!48293 (Array (_ BitVec 32) (_ BitVec 64))) (size!48843 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100067)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1500251 (= res!1021328 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48843 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48843 a!2850)) (= (select (arr!48293 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48293 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48843 a!2850))))))

(declare-fun b!1500252 () Bool)

(declare-fun res!1021327 () Bool)

(assert (=> b!1500252 (=> (not res!1021327) (not e!839537))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1500252 (= res!1021327 (validKeyInArray!0 (select (arr!48293 a!2850) i!996)))))

(declare-fun res!1021332 () Bool)

(assert (=> start!127686 (=> (not res!1021332) (not e!839537))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127686 (= res!1021332 (validMask!0 mask!2661))))

(assert (=> start!127686 e!839537))

(assert (=> start!127686 true))

(declare-fun array_inv!37321 (array!100067) Bool)

(assert (=> start!127686 (array_inv!37321 a!2850)))

(declare-fun b!1500253 () Bool)

(declare-fun e!839539 () Bool)

(assert (=> b!1500253 (= e!839537 e!839539)))

(declare-fun res!1021335 () Bool)

(assert (=> b!1500253 (=> (not res!1021335) (not e!839539))))

(declare-fun lt!652899 () (_ BitVec 32))

(assert (=> b!1500253 (= res!1021335 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652899 #b00000000000000000000000000000000) (bvslt lt!652899 (size!48843 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1500253 (= lt!652899 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1500254 () Bool)

(declare-fun res!1021336 () Bool)

(assert (=> b!1500254 (=> (not res!1021336) (not e!839537))))

(declare-datatypes ((List!34785 0))(
  ( (Nil!34782) (Cons!34781 (h!36178 (_ BitVec 64)) (t!49479 List!34785)) )
))
(declare-fun arrayNoDuplicates!0 (array!100067 (_ BitVec 32) List!34785) Bool)

(assert (=> b!1500254 (= res!1021336 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34782))))

(declare-fun b!1500255 () Bool)

(declare-fun res!1021334 () Bool)

(assert (=> b!1500255 (=> (not res!1021334) (not e!839537))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100067 (_ BitVec 32)) Bool)

(assert (=> b!1500255 (= res!1021334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1500256 () Bool)

(assert (=> b!1500256 (= e!839539 false)))

(declare-datatypes ((SeekEntryResult!12503 0))(
  ( (MissingZero!12503 (index!52404 (_ BitVec 32))) (Found!12503 (index!52405 (_ BitVec 32))) (Intermediate!12503 (undefined!13315 Bool) (index!52406 (_ BitVec 32)) (x!134081 (_ BitVec 32))) (Undefined!12503) (MissingVacant!12503 (index!52407 (_ BitVec 32))) )
))
(declare-fun lt!652900 () SeekEntryResult!12503)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100067 (_ BitVec 32)) SeekEntryResult!12503)

(assert (=> b!1500256 (= lt!652900 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652899 vacantBefore!10 (select (arr!48293 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1500257 () Bool)

(declare-fun res!1021329 () Bool)

(assert (=> b!1500257 (=> (not res!1021329) (not e!839537))))

(assert (=> b!1500257 (= res!1021329 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48293 a!2850) j!87) a!2850 mask!2661) (Found!12503 j!87)))))

(declare-fun b!1500258 () Bool)

(declare-fun res!1021333 () Bool)

(assert (=> b!1500258 (=> (not res!1021333) (not e!839537))))

(assert (=> b!1500258 (= res!1021333 (not (= (select (arr!48293 a!2850) index!625) (select (arr!48293 a!2850) j!87))))))

(declare-fun b!1500259 () Bool)

(declare-fun res!1021331 () Bool)

(assert (=> b!1500259 (=> (not res!1021331) (not e!839537))))

(assert (=> b!1500259 (= res!1021331 (and (= (size!48843 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48843 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48843 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1500260 () Bool)

(declare-fun res!1021330 () Bool)

(assert (=> b!1500260 (=> (not res!1021330) (not e!839537))))

(assert (=> b!1500260 (= res!1021330 (validKeyInArray!0 (select (arr!48293 a!2850) j!87)))))

(assert (= (and start!127686 res!1021332) b!1500259))

(assert (= (and b!1500259 res!1021331) b!1500252))

(assert (= (and b!1500252 res!1021327) b!1500260))

(assert (= (and b!1500260 res!1021330) b!1500255))

(assert (= (and b!1500255 res!1021334) b!1500254))

(assert (= (and b!1500254 res!1021336) b!1500251))

(assert (= (and b!1500251 res!1021328) b!1500257))

(assert (= (and b!1500257 res!1021329) b!1500258))

(assert (= (and b!1500258 res!1021333) b!1500253))

(assert (= (and b!1500253 res!1021335) b!1500256))

(declare-fun m!1383445 () Bool)

(assert (=> b!1500258 m!1383445))

(declare-fun m!1383447 () Bool)

(assert (=> b!1500258 m!1383447))

(declare-fun m!1383449 () Bool)

(assert (=> start!127686 m!1383449))

(declare-fun m!1383451 () Bool)

(assert (=> start!127686 m!1383451))

(declare-fun m!1383453 () Bool)

(assert (=> b!1500252 m!1383453))

(assert (=> b!1500252 m!1383453))

(declare-fun m!1383455 () Bool)

(assert (=> b!1500252 m!1383455))

(declare-fun m!1383457 () Bool)

(assert (=> b!1500254 m!1383457))

(declare-fun m!1383459 () Bool)

(assert (=> b!1500253 m!1383459))

(declare-fun m!1383461 () Bool)

(assert (=> b!1500251 m!1383461))

(declare-fun m!1383463 () Bool)

(assert (=> b!1500251 m!1383463))

(declare-fun m!1383465 () Bool)

(assert (=> b!1500251 m!1383465))

(declare-fun m!1383467 () Bool)

(assert (=> b!1500255 m!1383467))

(assert (=> b!1500260 m!1383447))

(assert (=> b!1500260 m!1383447))

(declare-fun m!1383469 () Bool)

(assert (=> b!1500260 m!1383469))

(assert (=> b!1500257 m!1383447))

(assert (=> b!1500257 m!1383447))

(declare-fun m!1383471 () Bool)

(assert (=> b!1500257 m!1383471))

(assert (=> b!1500256 m!1383447))

(assert (=> b!1500256 m!1383447))

(declare-fun m!1383473 () Bool)

(assert (=> b!1500256 m!1383473))

(push 1)

