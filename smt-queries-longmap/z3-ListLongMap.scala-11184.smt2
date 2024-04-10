; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130738 () Bool)

(assert start!130738)

(declare-fun b!1533284 () Bool)

(declare-fun res!1050374 () Bool)

(declare-fun e!854194 () Bool)

(assert (=> b!1533284 (=> (not res!1050374) (not e!854194))))

(declare-datatypes ((array!101836 0))(
  ( (array!101837 (arr!49134 (Array (_ BitVec 32) (_ BitVec 64))) (size!49684 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101836)

(declare-datatypes ((List!35608 0))(
  ( (Nil!35605) (Cons!35604 (h!37049 (_ BitVec 64)) (t!50302 List!35608)) )
))
(declare-fun arrayNoDuplicates!0 (array!101836 (_ BitVec 32) List!35608) Bool)

(assert (=> b!1533284 (= res!1050374 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35605))))

(declare-fun b!1533285 () Bool)

(assert (=> b!1533285 (= e!854194 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13266 0))(
  ( (MissingZero!13266 (index!55459 (_ BitVec 32))) (Found!13266 (index!55460 (_ BitVec 32))) (Intermediate!13266 (undefined!14078 Bool) (index!55461 (_ BitVec 32)) (x!137236 (_ BitVec 32))) (Undefined!13266) (MissingVacant!13266 (index!55462 (_ BitVec 32))) )
))
(declare-fun lt!663790 () SeekEntryResult!13266)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101836 (_ BitVec 32)) SeekEntryResult!13266)

(assert (=> b!1533285 (= lt!663790 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49134 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1050373 () Bool)

(assert (=> start!130738 (=> (not res!1050373) (not e!854194))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130738 (= res!1050373 (validMask!0 mask!2480))))

(assert (=> start!130738 e!854194))

(assert (=> start!130738 true))

(declare-fun array_inv!38162 (array!101836) Bool)

(assert (=> start!130738 (array_inv!38162 a!2792)))

(declare-fun b!1533286 () Bool)

(declare-fun res!1050371 () Bool)

(assert (=> b!1533286 (=> (not res!1050371) (not e!854194))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533286 (= res!1050371 (and (= (size!49684 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49684 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49684 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533287 () Bool)

(declare-fun res!1050376 () Bool)

(assert (=> b!1533287 (=> (not res!1050376) (not e!854194))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101836 (_ BitVec 32)) Bool)

(assert (=> b!1533287 (= res!1050376 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533288 () Bool)

(declare-fun res!1050372 () Bool)

(assert (=> b!1533288 (=> (not res!1050372) (not e!854194))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533288 (= res!1050372 (validKeyInArray!0 (select (arr!49134 a!2792) i!951)))))

(declare-fun b!1533289 () Bool)

(declare-fun res!1050375 () Bool)

(assert (=> b!1533289 (=> (not res!1050375) (not e!854194))))

(assert (=> b!1533289 (= res!1050375 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49684 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49684 a!2792)) (= (select (arr!49134 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533290 () Bool)

(declare-fun res!1050370 () Bool)

(assert (=> b!1533290 (=> (not res!1050370) (not e!854194))))

(assert (=> b!1533290 (= res!1050370 (validKeyInArray!0 (select (arr!49134 a!2792) j!64)))))

(assert (= (and start!130738 res!1050373) b!1533286))

(assert (= (and b!1533286 res!1050371) b!1533288))

(assert (= (and b!1533288 res!1050372) b!1533290))

(assert (= (and b!1533290 res!1050370) b!1533287))

(assert (= (and b!1533287 res!1050376) b!1533284))

(assert (= (and b!1533284 res!1050374) b!1533289))

(assert (= (and b!1533289 res!1050375) b!1533285))

(declare-fun m!1415987 () Bool)

(assert (=> b!1533289 m!1415987))

(declare-fun m!1415989 () Bool)

(assert (=> start!130738 m!1415989))

(declare-fun m!1415991 () Bool)

(assert (=> start!130738 m!1415991))

(declare-fun m!1415993 () Bool)

(assert (=> b!1533290 m!1415993))

(assert (=> b!1533290 m!1415993))

(declare-fun m!1415995 () Bool)

(assert (=> b!1533290 m!1415995))

(declare-fun m!1415997 () Bool)

(assert (=> b!1533287 m!1415997))

(assert (=> b!1533285 m!1415993))

(assert (=> b!1533285 m!1415993))

(declare-fun m!1415999 () Bool)

(assert (=> b!1533285 m!1415999))

(declare-fun m!1416001 () Bool)

(assert (=> b!1533284 m!1416001))

(declare-fun m!1416003 () Bool)

(assert (=> b!1533288 m!1416003))

(assert (=> b!1533288 m!1416003))

(declare-fun m!1416005 () Bool)

(assert (=> b!1533288 m!1416005))

(check-sat (not b!1533285) (not b!1533290) (not b!1533284) (not b!1533288) (not start!130738) (not b!1533287))
