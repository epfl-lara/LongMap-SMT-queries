; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127592 () Bool)

(assert start!127592)

(declare-fun b!1499215 () Bool)

(declare-fun res!1020486 () Bool)

(declare-fun e!839123 () Bool)

(assert (=> b!1499215 (=> (not res!1020486) (not e!839123))))

(declare-datatypes ((array!99967 0))(
  ( (array!99968 (arr!48244 (Array (_ BitVec 32) (_ BitVec 64))) (size!48796 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99967)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499215 (= res!1020486 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48796 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48796 a!2850)) (= (select (arr!48244 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48244 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48796 a!2850))))))

(declare-fun b!1499216 () Bool)

(declare-fun e!839122 () Bool)

(assert (=> b!1499216 (= e!839123 e!839122)))

(declare-fun res!1020485 () Bool)

(assert (=> b!1499216 (=> (not res!1020485) (not e!839122))))

(declare-fun lt!652477 () (_ BitVec 32))

(assert (=> b!1499216 (= res!1020485 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652477 #b00000000000000000000000000000000) (bvslt lt!652477 (size!48796 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499216 (= lt!652477 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499217 () Bool)

(declare-fun res!1020488 () Bool)

(assert (=> b!1499217 (=> (not res!1020488) (not e!839123))))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12475 0))(
  ( (MissingZero!12475 (index!52292 (_ BitVec 32))) (Found!12475 (index!52293 (_ BitVec 32))) (Intermediate!12475 (undefined!13287 Bool) (index!52294 (_ BitVec 32)) (x!133984 (_ BitVec 32))) (Undefined!12475) (MissingVacant!12475 (index!52295 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99967 (_ BitVec 32)) SeekEntryResult!12475)

(assert (=> b!1499217 (= res!1020488 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48244 a!2850) j!87) a!2850 mask!2661) (Found!12475 j!87)))))

(declare-fun b!1499218 () Bool)

(declare-fun res!1020481 () Bool)

(assert (=> b!1499218 (=> (not res!1020481) (not e!839123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99967 (_ BitVec 32)) Bool)

(assert (=> b!1499218 (= res!1020481 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499219 () Bool)

(declare-fun res!1020480 () Bool)

(assert (=> b!1499219 (=> (not res!1020480) (not e!839123))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499219 (= res!1020480 (validKeyInArray!0 (select (arr!48244 a!2850) i!996)))))

(declare-fun b!1499220 () Bool)

(assert (=> b!1499220 (= e!839122 false)))

(declare-fun lt!652476 () SeekEntryResult!12475)

(assert (=> b!1499220 (= lt!652476 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652477 vacantBefore!10 (select (arr!48244 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499221 () Bool)

(declare-fun res!1020483 () Bool)

(assert (=> b!1499221 (=> (not res!1020483) (not e!839123))))

(assert (=> b!1499221 (= res!1020483 (not (= (select (arr!48244 a!2850) index!625) (select (arr!48244 a!2850) j!87))))))

(declare-fun b!1499222 () Bool)

(declare-fun res!1020479 () Bool)

(assert (=> b!1499222 (=> (not res!1020479) (not e!839123))))

(assert (=> b!1499222 (= res!1020479 (and (= (size!48796 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48796 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48796 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499223 () Bool)

(declare-fun res!1020484 () Bool)

(assert (=> b!1499223 (=> (not res!1020484) (not e!839123))))

(assert (=> b!1499223 (= res!1020484 (validKeyInArray!0 (select (arr!48244 a!2850) j!87)))))

(declare-fun b!1499224 () Bool)

(declare-fun res!1020482 () Bool)

(assert (=> b!1499224 (=> (not res!1020482) (not e!839123))))

(declare-datatypes ((List!34814 0))(
  ( (Nil!34811) (Cons!34810 (h!36208 (_ BitVec 64)) (t!49500 List!34814)) )
))
(declare-fun arrayNoDuplicates!0 (array!99967 (_ BitVec 32) List!34814) Bool)

(assert (=> b!1499224 (= res!1020482 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34811))))

(declare-fun res!1020487 () Bool)

(assert (=> start!127592 (=> (not res!1020487) (not e!839123))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127592 (= res!1020487 (validMask!0 mask!2661))))

(assert (=> start!127592 e!839123))

(assert (=> start!127592 true))

(declare-fun array_inv!37477 (array!99967) Bool)

(assert (=> start!127592 (array_inv!37477 a!2850)))

(assert (= (and start!127592 res!1020487) b!1499222))

(assert (= (and b!1499222 res!1020479) b!1499219))

(assert (= (and b!1499219 res!1020480) b!1499223))

(assert (= (and b!1499223 res!1020484) b!1499218))

(assert (= (and b!1499218 res!1020481) b!1499224))

(assert (= (and b!1499224 res!1020482) b!1499215))

(assert (= (and b!1499215 res!1020486) b!1499217))

(assert (= (and b!1499217 res!1020488) b!1499221))

(assert (= (and b!1499221 res!1020483) b!1499216))

(assert (= (and b!1499216 res!1020485) b!1499220))

(declare-fun m!1381855 () Bool)

(assert (=> b!1499216 m!1381855))

(declare-fun m!1381857 () Bool)

(assert (=> b!1499217 m!1381857))

(assert (=> b!1499217 m!1381857))

(declare-fun m!1381859 () Bool)

(assert (=> b!1499217 m!1381859))

(declare-fun m!1381861 () Bool)

(assert (=> start!127592 m!1381861))

(declare-fun m!1381863 () Bool)

(assert (=> start!127592 m!1381863))

(declare-fun m!1381865 () Bool)

(assert (=> b!1499219 m!1381865))

(assert (=> b!1499219 m!1381865))

(declare-fun m!1381867 () Bool)

(assert (=> b!1499219 m!1381867))

(declare-fun m!1381869 () Bool)

(assert (=> b!1499224 m!1381869))

(assert (=> b!1499223 m!1381857))

(assert (=> b!1499223 m!1381857))

(declare-fun m!1381871 () Bool)

(assert (=> b!1499223 m!1381871))

(assert (=> b!1499220 m!1381857))

(assert (=> b!1499220 m!1381857))

(declare-fun m!1381873 () Bool)

(assert (=> b!1499220 m!1381873))

(declare-fun m!1381875 () Bool)

(assert (=> b!1499218 m!1381875))

(declare-fun m!1381877 () Bool)

(assert (=> b!1499215 m!1381877))

(declare-fun m!1381879 () Bool)

(assert (=> b!1499215 m!1381879))

(declare-fun m!1381881 () Bool)

(assert (=> b!1499215 m!1381881))

(declare-fun m!1381883 () Bool)

(assert (=> b!1499221 m!1381883))

(assert (=> b!1499221 m!1381857))

(check-sat (not b!1499224) (not b!1499216) (not b!1499223) (not b!1499218) (not b!1499219) (not start!127592) (not b!1499220) (not b!1499217))
(check-sat)
