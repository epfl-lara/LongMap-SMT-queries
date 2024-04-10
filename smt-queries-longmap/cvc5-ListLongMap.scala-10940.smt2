; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127974 () Bool)

(assert start!127974)

(declare-fun b!1503417 () Bool)

(declare-fun res!1024301 () Bool)

(declare-fun e!840606 () Bool)

(assert (=> b!1503417 (=> (not res!1024301) (not e!840606))))

(declare-datatypes ((array!100289 0))(
  ( (array!100290 (arr!48401 (Array (_ BitVec 32) (_ BitVec 64))) (size!48951 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100289)

(declare-datatypes ((List!34893 0))(
  ( (Nil!34890) (Cons!34889 (h!36286 (_ BitVec 64)) (t!49587 List!34893)) )
))
(declare-fun arrayNoDuplicates!0 (array!100289 (_ BitVec 32) List!34893) Bool)

(assert (=> b!1503417 (= res!1024301 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34890))))

(declare-fun b!1503418 () Bool)

(declare-fun res!1024299 () Bool)

(assert (=> b!1503418 (=> (not res!1024299) (not e!840606))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100289 (_ BitVec 32)) Bool)

(assert (=> b!1503418 (= res!1024299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503419 () Bool)

(declare-fun res!1024298 () Bool)

(assert (=> b!1503419 (=> (not res!1024298) (not e!840606))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503419 (= res!1024298 (validKeyInArray!0 (select (arr!48401 a!2850) i!996)))))

(declare-fun res!1024300 () Bool)

(assert (=> start!127974 (=> (not res!1024300) (not e!840606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127974 (= res!1024300 (validMask!0 mask!2661))))

(assert (=> start!127974 e!840606))

(assert (=> start!127974 true))

(declare-fun array_inv!37429 (array!100289) Bool)

(assert (=> start!127974 (array_inv!37429 a!2850)))

(declare-fun b!1503420 () Bool)

(declare-fun res!1024302 () Bool)

(assert (=> b!1503420 (=> (not res!1024302) (not e!840606))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503420 (= res!1024302 (not (= (select (arr!48401 a!2850) index!625) (select (arr!48401 a!2850) j!87))))))

(declare-fun b!1503421 () Bool)

(declare-fun res!1024295 () Bool)

(assert (=> b!1503421 (=> (not res!1024295) (not e!840606))))

(assert (=> b!1503421 (= res!1024295 (validKeyInArray!0 (select (arr!48401 a!2850) j!87)))))

(declare-fun b!1503422 () Bool)

(assert (=> b!1503422 (= e!840606 false)))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653524 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503422 (= lt!653524 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1503423 () Bool)

(declare-fun res!1024303 () Bool)

(assert (=> b!1503423 (=> (not res!1024303) (not e!840606))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12599 0))(
  ( (MissingZero!12599 (index!52788 (_ BitVec 32))) (Found!12599 (index!52789 (_ BitVec 32))) (Intermediate!12599 (undefined!13411 Bool) (index!52790 (_ BitVec 32)) (x!134471 (_ BitVec 32))) (Undefined!12599) (MissingVacant!12599 (index!52791 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100289 (_ BitVec 32)) SeekEntryResult!12599)

(assert (=> b!1503423 (= res!1024303 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48401 a!2850) j!87) a!2850 mask!2661) (Found!12599 j!87)))))

(declare-fun b!1503424 () Bool)

(declare-fun res!1024296 () Bool)

(assert (=> b!1503424 (=> (not res!1024296) (not e!840606))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503424 (= res!1024296 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48951 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48951 a!2850)) (= (select (arr!48401 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48401 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48951 a!2850))))))

(declare-fun b!1503425 () Bool)

(declare-fun res!1024297 () Bool)

(assert (=> b!1503425 (=> (not res!1024297) (not e!840606))))

(assert (=> b!1503425 (= res!1024297 (and (= (size!48951 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48951 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48951 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127974 res!1024300) b!1503425))

(assert (= (and b!1503425 res!1024297) b!1503419))

(assert (= (and b!1503419 res!1024298) b!1503421))

(assert (= (and b!1503421 res!1024295) b!1503418))

(assert (= (and b!1503418 res!1024299) b!1503417))

(assert (= (and b!1503417 res!1024301) b!1503424))

(assert (= (and b!1503424 res!1024296) b!1503423))

(assert (= (and b!1503423 res!1024303) b!1503420))

(assert (= (and b!1503420 res!1024302) b!1503422))

(declare-fun m!1386667 () Bool)

(assert (=> b!1503420 m!1386667))

(declare-fun m!1386669 () Bool)

(assert (=> b!1503420 m!1386669))

(assert (=> b!1503421 m!1386669))

(assert (=> b!1503421 m!1386669))

(declare-fun m!1386671 () Bool)

(assert (=> b!1503421 m!1386671))

(assert (=> b!1503423 m!1386669))

(assert (=> b!1503423 m!1386669))

(declare-fun m!1386673 () Bool)

(assert (=> b!1503423 m!1386673))

(declare-fun m!1386675 () Bool)

(assert (=> start!127974 m!1386675))

(declare-fun m!1386677 () Bool)

(assert (=> start!127974 m!1386677))

(declare-fun m!1386679 () Bool)

(assert (=> b!1503418 m!1386679))

(declare-fun m!1386681 () Bool)

(assert (=> b!1503419 m!1386681))

(assert (=> b!1503419 m!1386681))

(declare-fun m!1386683 () Bool)

(assert (=> b!1503419 m!1386683))

(declare-fun m!1386685 () Bool)

(assert (=> b!1503417 m!1386685))

(declare-fun m!1386687 () Bool)

(assert (=> b!1503424 m!1386687))

(declare-fun m!1386689 () Bool)

(assert (=> b!1503424 m!1386689))

(declare-fun m!1386691 () Bool)

(assert (=> b!1503424 m!1386691))

(declare-fun m!1386693 () Bool)

(assert (=> b!1503422 m!1386693))

(push 1)

(assert (not b!1503421))

(assert (not b!1503422))

(assert (not start!127974))

(assert (not b!1503418))

(assert (not b!1503419))

(assert (not b!1503423))

(assert (not b!1503417))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

