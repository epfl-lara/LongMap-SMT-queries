; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127760 () Bool)

(assert start!127760)

(declare-fun b!1501402 () Bool)

(declare-fun res!1022478 () Bool)

(declare-fun e!839914 () Bool)

(assert (=> b!1501402 (=> (not res!1022478) (not e!839914))))

(declare-datatypes ((array!100141 0))(
  ( (array!100142 (arr!48330 (Array (_ BitVec 32) (_ BitVec 64))) (size!48880 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100141)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501402 (= res!1022478 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48880 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48880 a!2850)) (= (select (arr!48330 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48330 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48880 a!2850))))))

(declare-fun b!1501403 () Bool)

(declare-fun e!839912 () Bool)

(assert (=> b!1501403 (= e!839914 e!839912)))

(declare-fun res!1022485 () Bool)

(assert (=> b!1501403 (=> (not res!1022485) (not e!839912))))

(declare-datatypes ((SeekEntryResult!12540 0))(
  ( (MissingZero!12540 (index!52552 (_ BitVec 32))) (Found!12540 (index!52553 (_ BitVec 32))) (Intermediate!12540 (undefined!13352 Bool) (index!52554 (_ BitVec 32)) (x!134214 (_ BitVec 32))) (Undefined!12540) (MissingVacant!12540 (index!52555 (_ BitVec 32))) )
))
(declare-fun lt!653164 () SeekEntryResult!12540)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100141 (_ BitVec 32)) SeekEntryResult!12540)

(assert (=> b!1501403 (= res!1022485 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48330 a!2850) j!87) a!2850 mask!2661) lt!653164))))

(assert (=> b!1501403 (= lt!653164 (Found!12540 j!87))))

(declare-fun b!1501404 () Bool)

(declare-fun res!1022487 () Bool)

(assert (=> b!1501404 (=> (not res!1022487) (not e!839914))))

(assert (=> b!1501404 (= res!1022487 (and (= (size!48880 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48880 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48880 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501405 () Bool)

(declare-fun res!1022482 () Bool)

(assert (=> b!1501405 (=> (not res!1022482) (not e!839914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501405 (= res!1022482 (validKeyInArray!0 (select (arr!48330 a!2850) i!996)))))

(declare-fun b!1501406 () Bool)

(declare-fun e!839913 () Bool)

(assert (=> b!1501406 (= e!839912 e!839913)))

(declare-fun res!1022481 () Bool)

(assert (=> b!1501406 (=> (not res!1022481) (not e!839913))))

(declare-fun lt!653163 () (_ BitVec 32))

(assert (=> b!1501406 (= res!1022481 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653163 #b00000000000000000000000000000000) (bvslt lt!653163 (size!48880 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501406 (= lt!653163 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun res!1022486 () Bool)

(assert (=> start!127760 (=> (not res!1022486) (not e!839914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127760 (= res!1022486 (validMask!0 mask!2661))))

(assert (=> start!127760 e!839914))

(assert (=> start!127760 true))

(declare-fun array_inv!37358 (array!100141) Bool)

(assert (=> start!127760 (array_inv!37358 a!2850)))

(declare-fun b!1501407 () Bool)

(declare-fun res!1022484 () Bool)

(assert (=> b!1501407 (=> (not res!1022484) (not e!839913))))

(assert (=> b!1501407 (= res!1022484 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653163 vacantBefore!10 (select (arr!48330 a!2850) j!87) a!2850 mask!2661) lt!653164))))

(declare-fun b!1501408 () Bool)

(declare-fun res!1022480 () Bool)

(assert (=> b!1501408 (=> (not res!1022480) (not e!839914))))

(assert (=> b!1501408 (= res!1022480 (validKeyInArray!0 (select (arr!48330 a!2850) j!87)))))

(declare-fun b!1501409 () Bool)

(declare-fun res!1022483 () Bool)

(assert (=> b!1501409 (=> (not res!1022483) (not e!839914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100141 (_ BitVec 32)) Bool)

(assert (=> b!1501409 (= res!1022483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501410 () Bool)

(declare-fun res!1022479 () Bool)

(assert (=> b!1501410 (=> (not res!1022479) (not e!839912))))

(assert (=> b!1501410 (= res!1022479 (not (= (select (arr!48330 a!2850) index!625) (select (arr!48330 a!2850) j!87))))))

(declare-fun b!1501411 () Bool)

(assert (=> b!1501411 (= e!839913 (not true))))

(assert (=> b!1501411 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653163 vacantAfter!10 (select (store (arr!48330 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100142 (store (arr!48330 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48880 a!2850)) mask!2661) lt!653164)))

(declare-datatypes ((Unit!50234 0))(
  ( (Unit!50235) )
))
(declare-fun lt!653162 () Unit!50234)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50234)

(assert (=> b!1501411 (= lt!653162 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653163 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501412 () Bool)

(declare-fun res!1022488 () Bool)

(assert (=> b!1501412 (=> (not res!1022488) (not e!839914))))

(declare-datatypes ((List!34822 0))(
  ( (Nil!34819) (Cons!34818 (h!36215 (_ BitVec 64)) (t!49516 List!34822)) )
))
(declare-fun arrayNoDuplicates!0 (array!100141 (_ BitVec 32) List!34822) Bool)

(assert (=> b!1501412 (= res!1022488 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34819))))

(assert (= (and start!127760 res!1022486) b!1501404))

(assert (= (and b!1501404 res!1022487) b!1501405))

(assert (= (and b!1501405 res!1022482) b!1501408))

(assert (= (and b!1501408 res!1022480) b!1501409))

(assert (= (and b!1501409 res!1022483) b!1501412))

(assert (= (and b!1501412 res!1022488) b!1501402))

(assert (= (and b!1501402 res!1022478) b!1501403))

(assert (= (and b!1501403 res!1022485) b!1501410))

(assert (= (and b!1501410 res!1022479) b!1501406))

(assert (= (and b!1501406 res!1022481) b!1501407))

(assert (= (and b!1501407 res!1022484) b!1501411))

(declare-fun m!1384633 () Bool)

(assert (=> b!1501410 m!1384633))

(declare-fun m!1384635 () Bool)

(assert (=> b!1501410 m!1384635))

(declare-fun m!1384637 () Bool)

(assert (=> start!127760 m!1384637))

(declare-fun m!1384639 () Bool)

(assert (=> start!127760 m!1384639))

(declare-fun m!1384641 () Bool)

(assert (=> b!1501405 m!1384641))

(assert (=> b!1501405 m!1384641))

(declare-fun m!1384643 () Bool)

(assert (=> b!1501405 m!1384643))

(declare-fun m!1384645 () Bool)

(assert (=> b!1501409 m!1384645))

(declare-fun m!1384647 () Bool)

(assert (=> b!1501411 m!1384647))

(declare-fun m!1384649 () Bool)

(assert (=> b!1501411 m!1384649))

(assert (=> b!1501411 m!1384649))

(declare-fun m!1384651 () Bool)

(assert (=> b!1501411 m!1384651))

(declare-fun m!1384653 () Bool)

(assert (=> b!1501411 m!1384653))

(assert (=> b!1501407 m!1384635))

(assert (=> b!1501407 m!1384635))

(declare-fun m!1384655 () Bool)

(assert (=> b!1501407 m!1384655))

(declare-fun m!1384657 () Bool)

(assert (=> b!1501406 m!1384657))

(declare-fun m!1384659 () Bool)

(assert (=> b!1501402 m!1384659))

(assert (=> b!1501402 m!1384647))

(declare-fun m!1384661 () Bool)

(assert (=> b!1501402 m!1384661))

(assert (=> b!1501408 m!1384635))

(assert (=> b!1501408 m!1384635))

(declare-fun m!1384663 () Bool)

(assert (=> b!1501408 m!1384663))

(declare-fun m!1384665 () Bool)

(assert (=> b!1501412 m!1384665))

(assert (=> b!1501403 m!1384635))

(assert (=> b!1501403 m!1384635))

(declare-fun m!1384667 () Bool)

(assert (=> b!1501403 m!1384667))

(check-sat (not start!127760) (not b!1501405) (not b!1501407) (not b!1501411) (not b!1501406) (not b!1501403) (not b!1501408) (not b!1501409) (not b!1501412))
(check-sat)
