; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131140 () Bool)

(assert start!131140)

(declare-fun b!1538388 () Bool)

(declare-fun res!1055366 () Bool)

(declare-fun e!855984 () Bool)

(assert (=> b!1538388 (=> (not res!1055366) (not e!855984))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102205 0))(
  ( (array!102206 (arr!49317 (Array (_ BitVec 32) (_ BitVec 64))) (size!49867 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102205)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538388 (= res!1055366 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49867 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49867 a!2792)) (= (select (arr!49317 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1055369 () Bool)

(assert (=> start!131140 (=> (not res!1055369) (not e!855984))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131140 (= res!1055369 (validMask!0 mask!2480))))

(assert (=> start!131140 e!855984))

(assert (=> start!131140 true))

(declare-fun array_inv!38345 (array!102205) Bool)

(assert (=> start!131140 (array_inv!38345 a!2792)))

(declare-fun b!1538389 () Bool)

(declare-fun res!1055370 () Bool)

(assert (=> b!1538389 (=> (not res!1055370) (not e!855984))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13443 0))(
  ( (MissingZero!13443 (index!56167 (_ BitVec 32))) (Found!13443 (index!56168 (_ BitVec 32))) (Intermediate!13443 (undefined!14255 Bool) (index!56169 (_ BitVec 32)) (x!137904 (_ BitVec 32))) (Undefined!13443) (MissingVacant!13443 (index!56170 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102205 (_ BitVec 32)) SeekEntryResult!13443)

(assert (=> b!1538389 (= res!1055370 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49317 a!2792) j!64) a!2792 mask!2480) (Found!13443 j!64)))))

(declare-fun b!1538390 () Bool)

(declare-fun res!1055368 () Bool)

(assert (=> b!1538390 (=> (not res!1055368) (not e!855984))))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538390 (= res!1055368 (validKeyInArray!0 (select (arr!49317 a!2792) i!951)))))

(declare-fun b!1538391 () Bool)

(assert (=> b!1538391 (= e!855984 false)))

(declare-fun lt!664894 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538391 (= lt!664894 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538392 () Bool)

(declare-fun res!1055367 () Bool)

(assert (=> b!1538392 (=> (not res!1055367) (not e!855984))))

(assert (=> b!1538392 (= res!1055367 (validKeyInArray!0 (select (arr!49317 a!2792) j!64)))))

(declare-fun b!1538393 () Bool)

(declare-fun res!1055373 () Bool)

(assert (=> b!1538393 (=> (not res!1055373) (not e!855984))))

(assert (=> b!1538393 (= res!1055373 (and (= (size!49867 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49867 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49867 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538394 () Bool)

(declare-fun res!1055374 () Bool)

(assert (=> b!1538394 (=> (not res!1055374) (not e!855984))))

(declare-datatypes ((List!35791 0))(
  ( (Nil!35788) (Cons!35787 (h!37232 (_ BitVec 64)) (t!50485 List!35791)) )
))
(declare-fun arrayNoDuplicates!0 (array!102205 (_ BitVec 32) List!35791) Bool)

(assert (=> b!1538394 (= res!1055374 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35788))))

(declare-fun b!1538395 () Bool)

(declare-fun res!1055371 () Bool)

(assert (=> b!1538395 (=> (not res!1055371) (not e!855984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102205 (_ BitVec 32)) Bool)

(assert (=> b!1538395 (= res!1055371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538396 () Bool)

(declare-fun res!1055372 () Bool)

(assert (=> b!1538396 (=> (not res!1055372) (not e!855984))))

(assert (=> b!1538396 (= res!1055372 (not (= (select (arr!49317 a!2792) index!463) (select (arr!49317 a!2792) j!64))))))

(assert (= (and start!131140 res!1055369) b!1538393))

(assert (= (and b!1538393 res!1055373) b!1538390))

(assert (= (and b!1538390 res!1055368) b!1538392))

(assert (= (and b!1538392 res!1055367) b!1538395))

(assert (= (and b!1538395 res!1055371) b!1538394))

(assert (= (and b!1538394 res!1055374) b!1538388))

(assert (= (and b!1538388 res!1055366) b!1538389))

(assert (= (and b!1538389 res!1055370) b!1538396))

(assert (= (and b!1538396 res!1055372) b!1538391))

(declare-fun m!1420827 () Bool)

(assert (=> b!1538396 m!1420827))

(declare-fun m!1420829 () Bool)

(assert (=> b!1538396 m!1420829))

(declare-fun m!1420831 () Bool)

(assert (=> b!1538390 m!1420831))

(assert (=> b!1538390 m!1420831))

(declare-fun m!1420833 () Bool)

(assert (=> b!1538390 m!1420833))

(declare-fun m!1420835 () Bool)

(assert (=> start!131140 m!1420835))

(declare-fun m!1420837 () Bool)

(assert (=> start!131140 m!1420837))

(declare-fun m!1420839 () Bool)

(assert (=> b!1538394 m!1420839))

(declare-fun m!1420841 () Bool)

(assert (=> b!1538395 m!1420841))

(assert (=> b!1538392 m!1420829))

(assert (=> b!1538392 m!1420829))

(declare-fun m!1420843 () Bool)

(assert (=> b!1538392 m!1420843))

(assert (=> b!1538389 m!1420829))

(assert (=> b!1538389 m!1420829))

(declare-fun m!1420845 () Bool)

(assert (=> b!1538389 m!1420845))

(declare-fun m!1420847 () Bool)

(assert (=> b!1538388 m!1420847))

(declare-fun m!1420849 () Bool)

(assert (=> b!1538391 m!1420849))

(check-sat (not b!1538394) (not b!1538389) (not b!1538390) (not b!1538395) (not start!131140) (not b!1538391) (not b!1538392))
