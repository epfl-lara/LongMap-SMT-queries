; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127988 () Bool)

(assert start!127988)

(declare-fun b!1503606 () Bool)

(declare-fun res!1024485 () Bool)

(declare-fun e!840649 () Bool)

(assert (=> b!1503606 (=> (not res!1024485) (not e!840649))))

(declare-datatypes ((array!100303 0))(
  ( (array!100304 (arr!48408 (Array (_ BitVec 32) (_ BitVec 64))) (size!48958 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100303)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503606 (= res!1024485 (not (= (select (arr!48408 a!2850) index!625) (select (arr!48408 a!2850) j!87))))))

(declare-fun b!1503607 () Bool)

(declare-fun res!1024490 () Bool)

(assert (=> b!1503607 (=> (not res!1024490) (not e!840649))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100303 (_ BitVec 32)) Bool)

(assert (=> b!1503607 (= res!1024490 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503608 () Bool)

(declare-fun res!1024488 () Bool)

(assert (=> b!1503608 (=> (not res!1024488) (not e!840649))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12606 0))(
  ( (MissingZero!12606 (index!52816 (_ BitVec 32))) (Found!12606 (index!52817 (_ BitVec 32))) (Intermediate!12606 (undefined!13418 Bool) (index!52818 (_ BitVec 32)) (x!134494 (_ BitVec 32))) (Undefined!12606) (MissingVacant!12606 (index!52819 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100303 (_ BitVec 32)) SeekEntryResult!12606)

(assert (=> b!1503608 (= res!1024488 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48408 a!2850) j!87) a!2850 mask!2661) (Found!12606 j!87)))))

(declare-fun b!1503609 () Bool)

(declare-fun res!1024489 () Bool)

(assert (=> b!1503609 (=> (not res!1024489) (not e!840649))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1503609 (= res!1024489 (and (= (size!48958 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48958 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48958 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503610 () Bool)

(assert (=> b!1503610 (= e!840649 false)))

(declare-fun lt!653545 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503610 (= lt!653545 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503611 () Bool)

(declare-fun res!1024486 () Bool)

(assert (=> b!1503611 (=> (not res!1024486) (not e!840649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503611 (= res!1024486 (validKeyInArray!0 (select (arr!48408 a!2850) j!87)))))

(declare-fun b!1503612 () Bool)

(declare-fun res!1024484 () Bool)

(assert (=> b!1503612 (=> (not res!1024484) (not e!840649))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503612 (= res!1024484 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48958 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48958 a!2850)) (= (select (arr!48408 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48408 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48958 a!2850))))))

(declare-fun b!1503613 () Bool)

(declare-fun res!1024487 () Bool)

(assert (=> b!1503613 (=> (not res!1024487) (not e!840649))))

(assert (=> b!1503613 (= res!1024487 (validKeyInArray!0 (select (arr!48408 a!2850) i!996)))))

(declare-fun b!1503614 () Bool)

(declare-fun res!1024492 () Bool)

(assert (=> b!1503614 (=> (not res!1024492) (not e!840649))))

(declare-datatypes ((List!34900 0))(
  ( (Nil!34897) (Cons!34896 (h!36293 (_ BitVec 64)) (t!49594 List!34900)) )
))
(declare-fun arrayNoDuplicates!0 (array!100303 (_ BitVec 32) List!34900) Bool)

(assert (=> b!1503614 (= res!1024492 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34897))))

(declare-fun res!1024491 () Bool)

(assert (=> start!127988 (=> (not res!1024491) (not e!840649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127988 (= res!1024491 (validMask!0 mask!2661))))

(assert (=> start!127988 e!840649))

(assert (=> start!127988 true))

(declare-fun array_inv!37436 (array!100303) Bool)

(assert (=> start!127988 (array_inv!37436 a!2850)))

(assert (= (and start!127988 res!1024491) b!1503609))

(assert (= (and b!1503609 res!1024489) b!1503613))

(assert (= (and b!1503613 res!1024487) b!1503611))

(assert (= (and b!1503611 res!1024486) b!1503607))

(assert (= (and b!1503607 res!1024490) b!1503614))

(assert (= (and b!1503614 res!1024492) b!1503612))

(assert (= (and b!1503612 res!1024484) b!1503608))

(assert (= (and b!1503608 res!1024488) b!1503606))

(assert (= (and b!1503606 res!1024485) b!1503610))

(declare-fun m!1386863 () Bool)

(assert (=> b!1503607 m!1386863))

(declare-fun m!1386865 () Bool)

(assert (=> b!1503610 m!1386865))

(declare-fun m!1386867 () Bool)

(assert (=> b!1503614 m!1386867))

(declare-fun m!1386869 () Bool)

(assert (=> start!127988 m!1386869))

(declare-fun m!1386871 () Bool)

(assert (=> start!127988 m!1386871))

(declare-fun m!1386873 () Bool)

(assert (=> b!1503606 m!1386873))

(declare-fun m!1386875 () Bool)

(assert (=> b!1503606 m!1386875))

(declare-fun m!1386877 () Bool)

(assert (=> b!1503613 m!1386877))

(assert (=> b!1503613 m!1386877))

(declare-fun m!1386879 () Bool)

(assert (=> b!1503613 m!1386879))

(declare-fun m!1386881 () Bool)

(assert (=> b!1503612 m!1386881))

(declare-fun m!1386883 () Bool)

(assert (=> b!1503612 m!1386883))

(declare-fun m!1386885 () Bool)

(assert (=> b!1503612 m!1386885))

(assert (=> b!1503608 m!1386875))

(assert (=> b!1503608 m!1386875))

(declare-fun m!1386887 () Bool)

(assert (=> b!1503608 m!1386887))

(assert (=> b!1503611 m!1386875))

(assert (=> b!1503611 m!1386875))

(declare-fun m!1386889 () Bool)

(assert (=> b!1503611 m!1386889))

(check-sat (not b!1503614) (not b!1503607) (not b!1503613) (not b!1503610) (not start!127988) (not b!1503611) (not b!1503608))
