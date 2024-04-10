; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127632 () Bool)

(assert start!127632)

(declare-fun b!1499441 () Bool)

(declare-fun res!1020525 () Bool)

(declare-fun e!839294 () Bool)

(assert (=> b!1499441 (=> (not res!1020525) (not e!839294))))

(declare-datatypes ((array!100013 0))(
  ( (array!100014 (arr!48266 (Array (_ BitVec 32) (_ BitVec 64))) (size!48816 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100013)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499441 (= res!1020525 (validKeyInArray!0 (select (arr!48266 a!2850) i!996)))))

(declare-fun b!1499442 () Bool)

(declare-fun res!1020518 () Bool)

(assert (=> b!1499442 (=> (not res!1020518) (not e!839294))))

(declare-datatypes ((List!34758 0))(
  ( (Nil!34755) (Cons!34754 (h!36151 (_ BitVec 64)) (t!49452 List!34758)) )
))
(declare-fun arrayNoDuplicates!0 (array!100013 (_ BitVec 32) List!34758) Bool)

(assert (=> b!1499442 (= res!1020518 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34755))))

(declare-fun b!1499443 () Bool)

(declare-fun res!1020517 () Bool)

(assert (=> b!1499443 (=> (not res!1020517) (not e!839294))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499443 (= res!1020517 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48816 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48816 a!2850)) (= (select (arr!48266 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48266 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48816 a!2850))))))

(declare-fun b!1499444 () Bool)

(declare-fun res!1020523 () Bool)

(assert (=> b!1499444 (=> (not res!1020523) (not e!839294))))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(assert (=> b!1499444 (= res!1020523 (and (= (size!48816 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48816 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48816 a!2850)) (not (= i!996 j!87))))))

(declare-fun res!1020521 () Bool)

(assert (=> start!127632 (=> (not res!1020521) (not e!839294))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127632 (= res!1020521 (validMask!0 mask!2661))))

(assert (=> start!127632 e!839294))

(assert (=> start!127632 true))

(declare-fun array_inv!37294 (array!100013) Bool)

(assert (=> start!127632 (array_inv!37294 a!2850)))

(declare-fun b!1499445 () Bool)

(declare-fun res!1020520 () Bool)

(assert (=> b!1499445 (=> (not res!1020520) (not e!839294))))

(assert (=> b!1499445 (= res!1020520 (validKeyInArray!0 (select (arr!48266 a!2850) j!87)))))

(declare-fun b!1499446 () Bool)

(declare-fun res!1020526 () Bool)

(assert (=> b!1499446 (=> (not res!1020526) (not e!839294))))

(declare-datatypes ((SeekEntryResult!12476 0))(
  ( (MissingZero!12476 (index!52296 (_ BitVec 32))) (Found!12476 (index!52297 (_ BitVec 32))) (Intermediate!12476 (undefined!13288 Bool) (index!52298 (_ BitVec 32)) (x!133982 (_ BitVec 32))) (Undefined!12476) (MissingVacant!12476 (index!52299 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100013 (_ BitVec 32)) SeekEntryResult!12476)

(assert (=> b!1499446 (= res!1020526 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48266 a!2850) j!87) a!2850 mask!2661) (Found!12476 j!87)))))

(declare-fun b!1499447 () Bool)

(declare-fun e!839295 () Bool)

(assert (=> b!1499447 (= e!839294 e!839295)))

(declare-fun res!1020524 () Bool)

(assert (=> b!1499447 (=> (not res!1020524) (not e!839295))))

(declare-fun lt!652737 () (_ BitVec 32))

(assert (=> b!1499447 (= res!1020524 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652737 #b00000000000000000000000000000000) (bvslt lt!652737 (size!48816 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499447 (= lt!652737 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499448 () Bool)

(declare-fun res!1020522 () Bool)

(assert (=> b!1499448 (=> (not res!1020522) (not e!839294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100013 (_ BitVec 32)) Bool)

(assert (=> b!1499448 (= res!1020522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499449 () Bool)

(assert (=> b!1499449 (= e!839295 false)))

(declare-fun lt!652738 () SeekEntryResult!12476)

(assert (=> b!1499449 (= lt!652738 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652737 vacantBefore!10 (select (arr!48266 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499450 () Bool)

(declare-fun res!1020519 () Bool)

(assert (=> b!1499450 (=> (not res!1020519) (not e!839294))))

(assert (=> b!1499450 (= res!1020519 (not (= (select (arr!48266 a!2850) index!625) (select (arr!48266 a!2850) j!87))))))

(assert (= (and start!127632 res!1020521) b!1499444))

(assert (= (and b!1499444 res!1020523) b!1499441))

(assert (= (and b!1499441 res!1020525) b!1499445))

(assert (= (and b!1499445 res!1020520) b!1499448))

(assert (= (and b!1499448 res!1020522) b!1499442))

(assert (= (and b!1499442 res!1020518) b!1499443))

(assert (= (and b!1499443 res!1020517) b!1499446))

(assert (= (and b!1499446 res!1020526) b!1499450))

(assert (= (and b!1499450 res!1020519) b!1499447))

(assert (= (and b!1499447 res!1020524) b!1499449))

(declare-fun m!1382635 () Bool)

(assert (=> b!1499446 m!1382635))

(assert (=> b!1499446 m!1382635))

(declare-fun m!1382637 () Bool)

(assert (=> b!1499446 m!1382637))

(declare-fun m!1382639 () Bool)

(assert (=> b!1499441 m!1382639))

(assert (=> b!1499441 m!1382639))

(declare-fun m!1382641 () Bool)

(assert (=> b!1499441 m!1382641))

(declare-fun m!1382643 () Bool)

(assert (=> b!1499442 m!1382643))

(declare-fun m!1382645 () Bool)

(assert (=> b!1499443 m!1382645))

(declare-fun m!1382647 () Bool)

(assert (=> b!1499443 m!1382647))

(declare-fun m!1382649 () Bool)

(assert (=> b!1499443 m!1382649))

(declare-fun m!1382651 () Bool)

(assert (=> b!1499447 m!1382651))

(declare-fun m!1382653 () Bool)

(assert (=> b!1499450 m!1382653))

(assert (=> b!1499450 m!1382635))

(assert (=> b!1499445 m!1382635))

(assert (=> b!1499445 m!1382635))

(declare-fun m!1382655 () Bool)

(assert (=> b!1499445 m!1382655))

(declare-fun m!1382657 () Bool)

(assert (=> b!1499448 m!1382657))

(assert (=> b!1499449 m!1382635))

(assert (=> b!1499449 m!1382635))

(declare-fun m!1382659 () Bool)

(assert (=> b!1499449 m!1382659))

(declare-fun m!1382661 () Bool)

(assert (=> start!127632 m!1382661))

(declare-fun m!1382663 () Bool)

(assert (=> start!127632 m!1382663))

(push 1)

