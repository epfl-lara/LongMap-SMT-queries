; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131304 () Bool)

(assert start!131304)

(declare-fun b!1539738 () Bool)

(declare-fun res!1056541 () Bool)

(declare-fun e!856405 () Bool)

(assert (=> b!1539738 (=> (not res!1056541) (not e!856405))))

(declare-datatypes ((array!102291 0))(
  ( (array!102292 (arr!49357 (Array (_ BitVec 32) (_ BitVec 64))) (size!49907 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102291)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1539738 (= res!1056541 (not (= (select (arr!49357 a!2792) index!463) (select (arr!49357 a!2792) j!64))))))

(declare-fun b!1539739 () Bool)

(declare-fun res!1056537 () Bool)

(assert (=> b!1539739 (=> (not res!1056537) (not e!856405))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102291 (_ BitVec 32)) Bool)

(assert (=> b!1539739 (= res!1056537 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1539740 () Bool)

(declare-fun res!1056539 () Bool)

(assert (=> b!1539740 (=> (not res!1056539) (not e!856405))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13483 0))(
  ( (MissingZero!13483 (index!56327 (_ BitVec 32))) (Found!13483 (index!56328 (_ BitVec 32))) (Intermediate!13483 (undefined!14295 Bool) (index!56329 (_ BitVec 32)) (x!138060 (_ BitVec 32))) (Undefined!13483) (MissingVacant!13483 (index!56330 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102291 (_ BitVec 32)) SeekEntryResult!13483)

(assert (=> b!1539740 (= res!1056539 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49357 a!2792) j!64) a!2792 mask!2480) (Found!13483 j!64)))))

(declare-fun b!1539742 () Bool)

(declare-fun res!1056538 () Bool)

(assert (=> b!1539742 (=> (not res!1056538) (not e!856405))))

(declare-datatypes ((List!35831 0))(
  ( (Nil!35828) (Cons!35827 (h!37272 (_ BitVec 64)) (t!50525 List!35831)) )
))
(declare-fun arrayNoDuplicates!0 (array!102291 (_ BitVec 32) List!35831) Bool)

(assert (=> b!1539742 (= res!1056538 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35828))))

(declare-fun b!1539743 () Bool)

(assert (=> b!1539743 (= e!856405 false)))

(declare-fun lt!665122 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1539743 (= lt!665122 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1539744 () Bool)

(declare-fun res!1056540 () Bool)

(assert (=> b!1539744 (=> (not res!1056540) (not e!856405))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1539744 (= res!1056540 (and (= (size!49907 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49907 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49907 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1539741 () Bool)

(declare-fun res!1056543 () Bool)

(assert (=> b!1539741 (=> (not res!1056543) (not e!856405))))

(assert (=> b!1539741 (= res!1056543 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49907 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49907 a!2792)) (= (select (arr!49357 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1056544 () Bool)

(assert (=> start!131304 (=> (not res!1056544) (not e!856405))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131304 (= res!1056544 (validMask!0 mask!2480))))

(assert (=> start!131304 e!856405))

(assert (=> start!131304 true))

(declare-fun array_inv!38385 (array!102291) Bool)

(assert (=> start!131304 (array_inv!38385 a!2792)))

(declare-fun b!1539745 () Bool)

(declare-fun res!1056536 () Bool)

(assert (=> b!1539745 (=> (not res!1056536) (not e!856405))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1539745 (= res!1056536 (validKeyInArray!0 (select (arr!49357 a!2792) i!951)))))

(declare-fun b!1539746 () Bool)

(declare-fun res!1056542 () Bool)

(assert (=> b!1539746 (=> (not res!1056542) (not e!856405))))

(assert (=> b!1539746 (= res!1056542 (validKeyInArray!0 (select (arr!49357 a!2792) j!64)))))

(assert (= (and start!131304 res!1056544) b!1539744))

(assert (= (and b!1539744 res!1056540) b!1539745))

(assert (= (and b!1539745 res!1056536) b!1539746))

(assert (= (and b!1539746 res!1056542) b!1539739))

(assert (= (and b!1539739 res!1056537) b!1539742))

(assert (= (and b!1539742 res!1056538) b!1539741))

(assert (= (and b!1539741 res!1056543) b!1539740))

(assert (= (and b!1539740 res!1056539) b!1539738))

(assert (= (and b!1539738 res!1056541) b!1539743))

(declare-fun m!1421931 () Bool)

(assert (=> start!131304 m!1421931))

(declare-fun m!1421933 () Bool)

(assert (=> start!131304 m!1421933))

(declare-fun m!1421935 () Bool)

(assert (=> b!1539738 m!1421935))

(declare-fun m!1421937 () Bool)

(assert (=> b!1539738 m!1421937))

(declare-fun m!1421939 () Bool)

(assert (=> b!1539739 m!1421939))

(declare-fun m!1421941 () Bool)

(assert (=> b!1539741 m!1421941))

(declare-fun m!1421943 () Bool)

(assert (=> b!1539742 m!1421943))

(declare-fun m!1421945 () Bool)

(assert (=> b!1539745 m!1421945))

(assert (=> b!1539745 m!1421945))

(declare-fun m!1421947 () Bool)

(assert (=> b!1539745 m!1421947))

(declare-fun m!1421949 () Bool)

(assert (=> b!1539743 m!1421949))

(assert (=> b!1539740 m!1421937))

(assert (=> b!1539740 m!1421937))

(declare-fun m!1421951 () Bool)

(assert (=> b!1539740 m!1421951))

(assert (=> b!1539746 m!1421937))

(assert (=> b!1539746 m!1421937))

(declare-fun m!1421953 () Bool)

(assert (=> b!1539746 m!1421953))

(push 1)

(assert (not start!131304))

(assert (not b!1539742))

(assert (not b!1539746))

(assert (not b!1539743))

(assert (not b!1539739))

(assert (not b!1539745))

(assert (not b!1539740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

