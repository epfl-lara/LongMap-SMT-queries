; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130908 () Bool)

(assert start!130908)

(declare-fun b!1535453 () Bool)

(declare-fun res!1052542 () Bool)

(declare-fun e!854801 () Bool)

(assert (=> b!1535453 (=> (not res!1052542) (not e!854801))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102006 0))(
  ( (array!102007 (arr!49219 (Array (_ BitVec 32) (_ BitVec 64))) (size!49769 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102006)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535453 (= res!1052542 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49769 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49769 a!2792)) (= (select (arr!49219 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535454 () Bool)

(declare-fun e!854802 () Bool)

(assert (=> b!1535454 (= e!854801 e!854802)))

(declare-fun res!1052548 () Bool)

(assert (=> b!1535454 (=> (not res!1052548) (not e!854802))))

(declare-fun lt!664062 () (_ BitVec 32))

(assert (=> b!1535454 (= res!1052548 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664062 #b00000000000000000000000000000000) (bvslt lt!664062 (size!49769 a!2792))))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535454 (= lt!664062 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1535455 () Bool)

(declare-fun res!1052540 () Bool)

(assert (=> b!1535455 (=> (not res!1052540) (not e!854801))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13351 0))(
  ( (MissingZero!13351 (index!55799 (_ BitVec 32))) (Found!13351 (index!55800 (_ BitVec 32))) (Intermediate!13351 (undefined!14163 Bool) (index!55801 (_ BitVec 32)) (x!137545 (_ BitVec 32))) (Undefined!13351) (MissingVacant!13351 (index!55802 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102006 (_ BitVec 32)) SeekEntryResult!13351)

(assert (=> b!1535455 (= res!1052540 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49219 a!2792) j!64) a!2792 mask!2480) (Found!13351 j!64)))))

(declare-fun res!1052539 () Bool)

(assert (=> start!130908 (=> (not res!1052539) (not e!854801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130908 (= res!1052539 (validMask!0 mask!2480))))

(assert (=> start!130908 e!854801))

(assert (=> start!130908 true))

(declare-fun array_inv!38247 (array!102006) Bool)

(assert (=> start!130908 (array_inv!38247 a!2792)))

(declare-fun b!1535456 () Bool)

(assert (=> b!1535456 (= e!854802 false)))

(declare-fun lt!664063 () SeekEntryResult!13351)

(assert (=> b!1535456 (= lt!664063 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664062 vacantIndex!5 (select (arr!49219 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535457 () Bool)

(declare-fun res!1052547 () Bool)

(assert (=> b!1535457 (=> (not res!1052547) (not e!854801))))

(assert (=> b!1535457 (= res!1052547 (not (= (select (arr!49219 a!2792) index!463) (select (arr!49219 a!2792) j!64))))))

(declare-fun b!1535458 () Bool)

(declare-fun res!1052541 () Bool)

(assert (=> b!1535458 (=> (not res!1052541) (not e!854801))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535458 (= res!1052541 (and (= (size!49769 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49769 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49769 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535459 () Bool)

(declare-fun res!1052545 () Bool)

(assert (=> b!1535459 (=> (not res!1052545) (not e!854801))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102006 (_ BitVec 32)) Bool)

(assert (=> b!1535459 (= res!1052545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535460 () Bool)

(declare-fun res!1052543 () Bool)

(assert (=> b!1535460 (=> (not res!1052543) (not e!854801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535460 (= res!1052543 (validKeyInArray!0 (select (arr!49219 a!2792) j!64)))))

(declare-fun b!1535461 () Bool)

(declare-fun res!1052546 () Bool)

(assert (=> b!1535461 (=> (not res!1052546) (not e!854801))))

(declare-datatypes ((List!35693 0))(
  ( (Nil!35690) (Cons!35689 (h!37134 (_ BitVec 64)) (t!50387 List!35693)) )
))
(declare-fun arrayNoDuplicates!0 (array!102006 (_ BitVec 32) List!35693) Bool)

(assert (=> b!1535461 (= res!1052546 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35690))))

(declare-fun b!1535462 () Bool)

(declare-fun res!1052544 () Bool)

(assert (=> b!1535462 (=> (not res!1052544) (not e!854801))))

(assert (=> b!1535462 (= res!1052544 (validKeyInArray!0 (select (arr!49219 a!2792) i!951)))))

(assert (= (and start!130908 res!1052539) b!1535458))

(assert (= (and b!1535458 res!1052541) b!1535462))

(assert (= (and b!1535462 res!1052544) b!1535460))

(assert (= (and b!1535460 res!1052543) b!1535459))

(assert (= (and b!1535459 res!1052545) b!1535461))

(assert (= (and b!1535461 res!1052546) b!1535453))

(assert (= (and b!1535453 res!1052542) b!1535455))

(assert (= (and b!1535455 res!1052540) b!1535457))

(assert (= (and b!1535457 res!1052547) b!1535454))

(assert (= (and b!1535454 res!1052548) b!1535456))

(declare-fun m!1417969 () Bool)

(assert (=> b!1535455 m!1417969))

(assert (=> b!1535455 m!1417969))

(declare-fun m!1417971 () Bool)

(assert (=> b!1535455 m!1417971))

(assert (=> b!1535456 m!1417969))

(assert (=> b!1535456 m!1417969))

(declare-fun m!1417973 () Bool)

(assert (=> b!1535456 m!1417973))

(declare-fun m!1417975 () Bool)

(assert (=> b!1535462 m!1417975))

(assert (=> b!1535462 m!1417975))

(declare-fun m!1417977 () Bool)

(assert (=> b!1535462 m!1417977))

(assert (=> b!1535460 m!1417969))

(assert (=> b!1535460 m!1417969))

(declare-fun m!1417979 () Bool)

(assert (=> b!1535460 m!1417979))

(declare-fun m!1417981 () Bool)

(assert (=> b!1535453 m!1417981))

(declare-fun m!1417983 () Bool)

(assert (=> b!1535459 m!1417983))

(declare-fun m!1417985 () Bool)

(assert (=> b!1535454 m!1417985))

(declare-fun m!1417987 () Bool)

(assert (=> b!1535457 m!1417987))

(assert (=> b!1535457 m!1417969))

(declare-fun m!1417989 () Bool)

(assert (=> start!130908 m!1417989))

(declare-fun m!1417991 () Bool)

(assert (=> start!130908 m!1417991))

(declare-fun m!1417993 () Bool)

(assert (=> b!1535461 m!1417993))

(push 1)

(assert (not b!1535462))

(assert (not b!1535455))

(assert (not start!130908))

(assert (not b!1535460))

(assert (not b!1535461))

(assert (not b!1535459))

(assert (not b!1535454))

(assert (not b!1535456))

(check-sat)

