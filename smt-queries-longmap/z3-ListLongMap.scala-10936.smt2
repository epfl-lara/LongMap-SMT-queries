; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127952 () Bool)

(assert start!127952)

(declare-fun b!1503120 () Bool)

(declare-fun res!1024005 () Bool)

(declare-fun e!840540 () Bool)

(assert (=> b!1503120 (=> (not res!1024005) (not e!840540))))

(declare-datatypes ((array!100267 0))(
  ( (array!100268 (arr!48390 (Array (_ BitVec 32) (_ BitVec 64))) (size!48940 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100267)

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1503120 (= res!1024005 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48940 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48940 a!2850)) (= (select (arr!48390 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48390 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48940 a!2850))))))

(declare-fun b!1503121 () Bool)

(declare-fun res!1023999 () Bool)

(assert (=> b!1503121 (=> (not res!1023999) (not e!840540))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503121 (= res!1023999 (validKeyInArray!0 (select (arr!48390 a!2850) i!996)))))

(declare-fun b!1503122 () Bool)

(declare-fun res!1023998 () Bool)

(assert (=> b!1503122 (=> (not res!1023998) (not e!840540))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100267 (_ BitVec 32)) Bool)

(assert (=> b!1503122 (= res!1023998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun res!1024004 () Bool)

(assert (=> start!127952 (=> (not res!1024004) (not e!840540))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127952 (= res!1024004 (validMask!0 mask!2661))))

(assert (=> start!127952 e!840540))

(assert (=> start!127952 true))

(declare-fun array_inv!37418 (array!100267) Bool)

(assert (=> start!127952 (array_inv!37418 a!2850)))

(declare-fun b!1503123 () Bool)

(declare-fun res!1024000 () Bool)

(assert (=> b!1503123 (=> (not res!1024000) (not e!840540))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12588 0))(
  ( (MissingZero!12588 (index!52744 (_ BitVec 32))) (Found!12588 (index!52745 (_ BitVec 32))) (Intermediate!12588 (undefined!13400 Bool) (index!52746 (_ BitVec 32)) (x!134428 (_ BitVec 32))) (Undefined!12588) (MissingVacant!12588 (index!52747 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100267 (_ BitVec 32)) SeekEntryResult!12588)

(assert (=> b!1503123 (= res!1024000 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48390 a!2850) j!87) a!2850 mask!2661) (Found!12588 j!87)))))

(declare-fun b!1503124 () Bool)

(declare-fun res!1024003 () Bool)

(assert (=> b!1503124 (=> (not res!1024003) (not e!840540))))

(assert (=> b!1503124 (= res!1024003 (not (= (select (arr!48390 a!2850) index!625) (select (arr!48390 a!2850) j!87))))))

(declare-fun b!1503125 () Bool)

(declare-fun res!1024006 () Bool)

(assert (=> b!1503125 (=> (not res!1024006) (not e!840540))))

(declare-datatypes ((List!34882 0))(
  ( (Nil!34879) (Cons!34878 (h!36275 (_ BitVec 64)) (t!49576 List!34882)) )
))
(declare-fun arrayNoDuplicates!0 (array!100267 (_ BitVec 32) List!34882) Bool)

(assert (=> b!1503125 (= res!1024006 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34879))))

(declare-fun b!1503126 () Bool)

(declare-fun res!1024002 () Bool)

(assert (=> b!1503126 (=> (not res!1024002) (not e!840540))))

(assert (=> b!1503126 (= res!1024002 (and (= (size!48940 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48940 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48940 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503127 () Bool)

(declare-fun res!1024001 () Bool)

(assert (=> b!1503127 (=> (not res!1024001) (not e!840540))))

(assert (=> b!1503127 (= res!1024001 (validKeyInArray!0 (select (arr!48390 a!2850) j!87)))))

(declare-fun b!1503128 () Bool)

(assert (=> b!1503128 (= e!840540 false)))

(declare-fun lt!653491 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503128 (= lt!653491 (nextIndex!0 index!625 x!647 mask!2661))))

(assert (= (and start!127952 res!1024004) b!1503126))

(assert (= (and b!1503126 res!1024002) b!1503121))

(assert (= (and b!1503121 res!1023999) b!1503127))

(assert (= (and b!1503127 res!1024001) b!1503122))

(assert (= (and b!1503122 res!1023998) b!1503125))

(assert (= (and b!1503125 res!1024006) b!1503120))

(assert (= (and b!1503120 res!1024005) b!1503123))

(assert (= (and b!1503123 res!1024000) b!1503124))

(assert (= (and b!1503124 res!1024003) b!1503128))

(declare-fun m!1386359 () Bool)

(assert (=> b!1503122 m!1386359))

(declare-fun m!1386361 () Bool)

(assert (=> b!1503125 m!1386361))

(declare-fun m!1386363 () Bool)

(assert (=> b!1503124 m!1386363))

(declare-fun m!1386365 () Bool)

(assert (=> b!1503124 m!1386365))

(assert (=> b!1503123 m!1386365))

(assert (=> b!1503123 m!1386365))

(declare-fun m!1386367 () Bool)

(assert (=> b!1503123 m!1386367))

(assert (=> b!1503127 m!1386365))

(assert (=> b!1503127 m!1386365))

(declare-fun m!1386369 () Bool)

(assert (=> b!1503127 m!1386369))

(declare-fun m!1386371 () Bool)

(assert (=> b!1503121 m!1386371))

(assert (=> b!1503121 m!1386371))

(declare-fun m!1386373 () Bool)

(assert (=> b!1503121 m!1386373))

(declare-fun m!1386375 () Bool)

(assert (=> start!127952 m!1386375))

(declare-fun m!1386377 () Bool)

(assert (=> start!127952 m!1386377))

(declare-fun m!1386379 () Bool)

(assert (=> b!1503120 m!1386379))

(declare-fun m!1386381 () Bool)

(assert (=> b!1503120 m!1386381))

(declare-fun m!1386383 () Bool)

(assert (=> b!1503120 m!1386383))

(declare-fun m!1386385 () Bool)

(assert (=> b!1503128 m!1386385))

(check-sat (not b!1503127) (not b!1503128) (not b!1503121) (not b!1503123) (not b!1503122) (not start!127952) (not b!1503125))
