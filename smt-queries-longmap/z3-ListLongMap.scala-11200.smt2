; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130834 () Bool)

(assert start!130834)

(declare-fun b!1534378 () Bool)

(declare-fun res!1051465 () Bool)

(declare-fun e!854481 () Bool)

(assert (=> b!1534378 (=> (not res!1051465) (not e!854481))))

(declare-datatypes ((array!101932 0))(
  ( (array!101933 (arr!49182 (Array (_ BitVec 32) (_ BitVec 64))) (size!49732 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101932)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534378 (= res!1051465 (validKeyInArray!0 (select (arr!49182 a!2792) j!64)))))

(declare-fun b!1534379 () Bool)

(declare-fun res!1051471 () Bool)

(assert (=> b!1534379 (=> (not res!1051471) (not e!854481))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13314 0))(
  ( (MissingZero!13314 (index!55651 (_ BitVec 32))) (Found!13314 (index!55652 (_ BitVec 32))) (Intermediate!13314 (undefined!14126 Bool) (index!55653 (_ BitVec 32)) (x!137412 (_ BitVec 32))) (Undefined!13314) (MissingVacant!13314 (index!55654 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101932 (_ BitVec 32)) SeekEntryResult!13314)

(assert (=> b!1534379 (= res!1051471 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49182 a!2792) j!64) a!2792 mask!2480) (Found!13314 j!64)))))

(declare-fun b!1534380 () Bool)

(declare-fun res!1051468 () Bool)

(assert (=> b!1534380 (=> (not res!1051468) (not e!854481))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534380 (= res!1051468 (and (= (size!49732 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49732 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49732 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534381 () Bool)

(assert (=> b!1534381 (= e!854481 (and (not (= (select (arr!49182 a!2792) index!463) (select (arr!49182 a!2792) j!64))) (bvsge mask!2480 #b00000000000000000000000000000000) (bvsge index!463 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun b!1534382 () Bool)

(declare-fun res!1051467 () Bool)

(assert (=> b!1534382 (=> (not res!1051467) (not e!854481))))

(assert (=> b!1534382 (= res!1051467 (validKeyInArray!0 (select (arr!49182 a!2792) i!951)))))

(declare-fun res!1051466 () Bool)

(assert (=> start!130834 (=> (not res!1051466) (not e!854481))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130834 (= res!1051466 (validMask!0 mask!2480))))

(assert (=> start!130834 e!854481))

(assert (=> start!130834 true))

(declare-fun array_inv!38210 (array!101932) Bool)

(assert (=> start!130834 (array_inv!38210 a!2792)))

(declare-fun b!1534383 () Bool)

(declare-fun res!1051470 () Bool)

(assert (=> b!1534383 (=> (not res!1051470) (not e!854481))))

(assert (=> b!1534383 (= res!1051470 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49732 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49732 a!2792)) (= (select (arr!49182 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534384 () Bool)

(declare-fun res!1051469 () Bool)

(assert (=> b!1534384 (=> (not res!1051469) (not e!854481))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101932 (_ BitVec 32)) Bool)

(assert (=> b!1534384 (= res!1051469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534385 () Bool)

(declare-fun res!1051464 () Bool)

(assert (=> b!1534385 (=> (not res!1051464) (not e!854481))))

(declare-datatypes ((List!35656 0))(
  ( (Nil!35653) (Cons!35652 (h!37097 (_ BitVec 64)) (t!50350 List!35656)) )
))
(declare-fun arrayNoDuplicates!0 (array!101932 (_ BitVec 32) List!35656) Bool)

(assert (=> b!1534385 (= res!1051464 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35653))))

(assert (= (and start!130834 res!1051466) b!1534380))

(assert (= (and b!1534380 res!1051468) b!1534382))

(assert (= (and b!1534382 res!1051467) b!1534378))

(assert (= (and b!1534378 res!1051465) b!1534384))

(assert (= (and b!1534384 res!1051469) b!1534385))

(assert (= (and b!1534385 res!1051464) b!1534383))

(assert (= (and b!1534383 res!1051470) b!1534379))

(assert (= (and b!1534379 res!1051471) b!1534381))

(declare-fun m!1417033 () Bool)

(assert (=> b!1534384 m!1417033))

(declare-fun m!1417035 () Bool)

(assert (=> b!1534385 m!1417035))

(declare-fun m!1417037 () Bool)

(assert (=> start!130834 m!1417037))

(declare-fun m!1417039 () Bool)

(assert (=> start!130834 m!1417039))

(declare-fun m!1417041 () Bool)

(assert (=> b!1534382 m!1417041))

(assert (=> b!1534382 m!1417041))

(declare-fun m!1417043 () Bool)

(assert (=> b!1534382 m!1417043))

(declare-fun m!1417045 () Bool)

(assert (=> b!1534379 m!1417045))

(assert (=> b!1534379 m!1417045))

(declare-fun m!1417047 () Bool)

(assert (=> b!1534379 m!1417047))

(assert (=> b!1534378 m!1417045))

(assert (=> b!1534378 m!1417045))

(declare-fun m!1417049 () Bool)

(assert (=> b!1534378 m!1417049))

(declare-fun m!1417051 () Bool)

(assert (=> b!1534383 m!1417051))

(declare-fun m!1417053 () Bool)

(assert (=> b!1534381 m!1417053))

(assert (=> b!1534381 m!1417045))

(check-sat (not b!1534379) (not b!1534382) (not start!130834) (not b!1534378) (not b!1534384) (not b!1534385))
(check-sat)
