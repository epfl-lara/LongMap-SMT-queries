; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128468 () Bool)

(assert start!128468)

(declare-fun b!1506576 () Bool)

(declare-fun e!842241 () Bool)

(declare-fun x!647 () (_ BitVec 32))

(assert (=> b!1506576 (= e!842241 (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!647)) (bvsub #b01111111111111111111111111111110 x!647)))))

(declare-fun b!1506577 () Bool)

(declare-fun res!1025989 () Bool)

(assert (=> b!1506577 (=> (not res!1025989) (not e!842241))))

(declare-datatypes ((SeekEntryResult!12578 0))(
  ( (MissingZero!12578 (index!52704 (_ BitVec 32))) (Found!12578 (index!52705 (_ BitVec 32))) (Intermediate!12578 (undefined!13390 Bool) (index!52706 (_ BitVec 32)) (x!134593 (_ BitVec 32))) (Undefined!12578) (MissingVacant!12578 (index!52707 (_ BitVec 32))) )
))
(declare-fun lt!654465 () SeekEntryResult!12578)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun lt!654466 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((array!100480 0))(
  ( (array!100481 (arr!48487 (Array (_ BitVec 32) (_ BitVec 64))) (size!49038 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100480)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100480 (_ BitVec 32)) SeekEntryResult!12578)

(assert (=> b!1506577 (= res!1025989 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!654466 vacantBefore!10 (select (arr!48487 a!2850) j!87) a!2850 mask!2661) lt!654465))))

(declare-fun b!1506578 () Bool)

(declare-fun e!842243 () Bool)

(declare-fun e!842244 () Bool)

(assert (=> b!1506578 (= e!842243 e!842244)))

(declare-fun res!1025998 () Bool)

(assert (=> b!1506578 (=> (not res!1025998) (not e!842244))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1506578 (= res!1025998 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48487 a!2850) j!87) a!2850 mask!2661) lt!654465))))

(assert (=> b!1506578 (= lt!654465 (Found!12578 j!87))))

(declare-fun b!1506579 () Bool)

(declare-fun res!1025997 () Bool)

(assert (=> b!1506579 (=> (not res!1025997) (not e!842243))))

(declare-datatypes ((List!34966 0))(
  ( (Nil!34963) (Cons!34962 (h!36374 (_ BitVec 64)) (t!49652 List!34966)) )
))
(declare-fun arrayNoDuplicates!0 (array!100480 (_ BitVec 32) List!34966) Bool)

(assert (=> b!1506579 (= res!1025997 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34963))))

(declare-fun b!1506580 () Bool)

(declare-fun res!1025990 () Bool)

(assert (=> b!1506580 (=> (not res!1025990) (not e!842243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100480 (_ BitVec 32)) Bool)

(assert (=> b!1506580 (= res!1025990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1506581 () Bool)

(declare-fun res!1025991 () Bool)

(assert (=> b!1506581 (=> (not res!1025991) (not e!842243))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1506581 (= res!1025991 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49038 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49038 a!2850)) (= (select (arr!48487 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48487 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49038 a!2850))))))

(declare-fun b!1506582 () Bool)

(declare-fun res!1025992 () Bool)

(assert (=> b!1506582 (=> (not res!1025992) (not e!842243))))

(assert (=> b!1506582 (= res!1025992 (and (= (size!49038 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49038 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49038 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1506584 () Bool)

(assert (=> b!1506584 (= e!842244 e!842241)))

(declare-fun res!1025993 () Bool)

(assert (=> b!1506584 (=> (not res!1025993) (not e!842241))))

(assert (=> b!1506584 (= res!1025993 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!654466 #b00000000000000000000000000000000) (bvslt lt!654466 (size!49038 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1506584 (= lt!654466 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1506585 () Bool)

(declare-fun res!1025995 () Bool)

(assert (=> b!1506585 (=> (not res!1025995) (not e!842243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1506585 (= res!1025995 (validKeyInArray!0 (select (arr!48487 a!2850) i!996)))))

(declare-fun b!1506586 () Bool)

(declare-fun res!1025996 () Bool)

(assert (=> b!1506586 (=> (not res!1025996) (not e!842243))))

(assert (=> b!1506586 (= res!1025996 (validKeyInArray!0 (select (arr!48487 a!2850) j!87)))))

(declare-fun res!1025999 () Bool)

(assert (=> start!128468 (=> (not res!1025999) (not e!842243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128468 (= res!1025999 (validMask!0 mask!2661))))

(assert (=> start!128468 e!842243))

(assert (=> start!128468 true))

(declare-fun array_inv!37768 (array!100480) Bool)

(assert (=> start!128468 (array_inv!37768 a!2850)))

(declare-fun b!1506583 () Bool)

(declare-fun res!1025994 () Bool)

(assert (=> b!1506583 (=> (not res!1025994) (not e!842244))))

(assert (=> b!1506583 (= res!1025994 (not (= (select (arr!48487 a!2850) index!625) (select (arr!48487 a!2850) j!87))))))

(assert (= (and start!128468 res!1025999) b!1506582))

(assert (= (and b!1506582 res!1025992) b!1506585))

(assert (= (and b!1506585 res!1025995) b!1506586))

(assert (= (and b!1506586 res!1025996) b!1506580))

(assert (= (and b!1506580 res!1025990) b!1506579))

(assert (= (and b!1506579 res!1025997) b!1506581))

(assert (= (and b!1506581 res!1025991) b!1506578))

(assert (= (and b!1506578 res!1025998) b!1506583))

(assert (= (and b!1506583 res!1025994) b!1506584))

(assert (= (and b!1506584 res!1025993) b!1506577))

(assert (= (and b!1506577 res!1025989) b!1506576))

(declare-fun m!1389633 () Bool)

(assert (=> b!1506580 m!1389633))

(declare-fun m!1389635 () Bool)

(assert (=> b!1506584 m!1389635))

(declare-fun m!1389637 () Bool)

(assert (=> b!1506583 m!1389637))

(declare-fun m!1389639 () Bool)

(assert (=> b!1506583 m!1389639))

(declare-fun m!1389641 () Bool)

(assert (=> b!1506585 m!1389641))

(assert (=> b!1506585 m!1389641))

(declare-fun m!1389643 () Bool)

(assert (=> b!1506585 m!1389643))

(assert (=> b!1506586 m!1389639))

(assert (=> b!1506586 m!1389639))

(declare-fun m!1389645 () Bool)

(assert (=> b!1506586 m!1389645))

(assert (=> b!1506577 m!1389639))

(assert (=> b!1506577 m!1389639))

(declare-fun m!1389647 () Bool)

(assert (=> b!1506577 m!1389647))

(declare-fun m!1389649 () Bool)

(assert (=> b!1506579 m!1389649))

(declare-fun m!1389651 () Bool)

(assert (=> start!128468 m!1389651))

(declare-fun m!1389653 () Bool)

(assert (=> start!128468 m!1389653))

(declare-fun m!1389655 () Bool)

(assert (=> b!1506581 m!1389655))

(declare-fun m!1389657 () Bool)

(assert (=> b!1506581 m!1389657))

(declare-fun m!1389659 () Bool)

(assert (=> b!1506581 m!1389659))

(assert (=> b!1506578 m!1389639))

(assert (=> b!1506578 m!1389639))

(declare-fun m!1389661 () Bool)

(assert (=> b!1506578 m!1389661))

(check-sat (not start!128468) (not b!1506586) (not b!1506578) (not b!1506579) (not b!1506577) (not b!1506584) (not b!1506585) (not b!1506580))
(check-sat)
