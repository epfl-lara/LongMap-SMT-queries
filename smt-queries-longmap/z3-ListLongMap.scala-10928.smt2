; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127868 () Bool)

(assert start!127868)

(declare-fun b!1502363 () Bool)

(declare-fun res!1023355 () Bool)

(declare-fun e!840288 () Bool)

(assert (=> b!1502363 (=> (not res!1023355) (not e!840288))))

(declare-datatypes ((array!100216 0))(
  ( (array!100217 (arr!48366 (Array (_ BitVec 32) (_ BitVec 64))) (size!48916 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100216)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502363 (= res!1023355 (validKeyInArray!0 (select (arr!48366 a!2850) i!996)))))

(declare-fun b!1502364 () Bool)

(declare-fun res!1023353 () Bool)

(assert (=> b!1502364 (=> (not res!1023353) (not e!840288))))

(declare-datatypes ((List!34858 0))(
  ( (Nil!34855) (Cons!34854 (h!36251 (_ BitVec 64)) (t!49552 List!34858)) )
))
(declare-fun arrayNoDuplicates!0 (array!100216 (_ BitVec 32) List!34858) Bool)

(assert (=> b!1502364 (= res!1023353 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34855))))

(declare-fun b!1502365 () Bool)

(assert (=> b!1502365 (= e!840288 false)))

(declare-datatypes ((SeekEntryResult!12564 0))(
  ( (MissingZero!12564 (index!52648 (_ BitVec 32))) (Found!12564 (index!52649 (_ BitVec 32))) (Intermediate!12564 (undefined!13376 Bool) (index!52650 (_ BitVec 32)) (x!134337 (_ BitVec 32))) (Undefined!12564) (MissingVacant!12564 (index!52651 (_ BitVec 32))) )
))
(declare-fun lt!653368 () SeekEntryResult!12564)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100216 (_ BitVec 32)) SeekEntryResult!12564)

(assert (=> b!1502365 (= lt!653368 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48366 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502366 () Bool)

(declare-fun res!1023352 () Bool)

(assert (=> b!1502366 (=> (not res!1023352) (not e!840288))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502366 (= res!1023352 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48916 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48916 a!2850)) (= (select (arr!48366 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48366 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48916 a!2850))))))

(declare-fun b!1502367 () Bool)

(declare-fun res!1023349 () Bool)

(assert (=> b!1502367 (=> (not res!1023349) (not e!840288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100216 (_ BitVec 32)) Bool)

(assert (=> b!1502367 (= res!1023349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1023351 () Bool)

(assert (=> start!127868 (=> (not res!1023351) (not e!840288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127868 (= res!1023351 (validMask!0 mask!2661))))

(assert (=> start!127868 e!840288))

(assert (=> start!127868 true))

(declare-fun array_inv!37394 (array!100216) Bool)

(assert (=> start!127868 (array_inv!37394 a!2850)))

(declare-fun b!1502368 () Bool)

(declare-fun res!1023350 () Bool)

(assert (=> b!1502368 (=> (not res!1023350) (not e!840288))))

(assert (=> b!1502368 (= res!1023350 (and (= (size!48916 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48916 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48916 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502369 () Bool)

(declare-fun res!1023354 () Bool)

(assert (=> b!1502369 (=> (not res!1023354) (not e!840288))))

(assert (=> b!1502369 (= res!1023354 (validKeyInArray!0 (select (arr!48366 a!2850) j!87)))))

(assert (= (and start!127868 res!1023351) b!1502368))

(assert (= (and b!1502368 res!1023350) b!1502363))

(assert (= (and b!1502363 res!1023355) b!1502369))

(assert (= (and b!1502369 res!1023354) b!1502367))

(assert (= (and b!1502367 res!1023349) b!1502364))

(assert (= (and b!1502364 res!1023353) b!1502366))

(assert (= (and b!1502366 res!1023352) b!1502365))

(declare-fun m!1385617 () Bool)

(assert (=> start!127868 m!1385617))

(declare-fun m!1385619 () Bool)

(assert (=> start!127868 m!1385619))

(declare-fun m!1385621 () Bool)

(assert (=> b!1502364 m!1385621))

(declare-fun m!1385623 () Bool)

(assert (=> b!1502366 m!1385623))

(declare-fun m!1385625 () Bool)

(assert (=> b!1502366 m!1385625))

(declare-fun m!1385627 () Bool)

(assert (=> b!1502366 m!1385627))

(declare-fun m!1385629 () Bool)

(assert (=> b!1502365 m!1385629))

(assert (=> b!1502365 m!1385629))

(declare-fun m!1385631 () Bool)

(assert (=> b!1502365 m!1385631))

(assert (=> b!1502369 m!1385629))

(assert (=> b!1502369 m!1385629))

(declare-fun m!1385633 () Bool)

(assert (=> b!1502369 m!1385633))

(declare-fun m!1385635 () Bool)

(assert (=> b!1502363 m!1385635))

(assert (=> b!1502363 m!1385635))

(declare-fun m!1385637 () Bool)

(assert (=> b!1502363 m!1385637))

(declare-fun m!1385639 () Bool)

(assert (=> b!1502367 m!1385639))

(check-sat (not b!1502365) (not b!1502369) (not b!1502364) (not start!127868) (not b!1502363) (not b!1502367))
