; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131110 () Bool)

(assert start!131110)

(declare-fun b!1535462 () Bool)

(declare-fun res!1051067 () Bool)

(declare-fun e!855582 () Bool)

(assert (=> b!1535462 (=> (not res!1051067) (not e!855582))))

(declare-datatypes ((array!101945 0))(
  ( (array!101946 (arr!49182 (Array (_ BitVec 32) (_ BitVec 64))) (size!49733 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101945)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535462 (= res!1051067 (validKeyInArray!0 (select (arr!49182 a!2792) i!951)))))

(declare-fun b!1535463 () Bool)

(assert (=> b!1535463 (= e!855582 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13209 0))(
  ( (MissingZero!13209 (index!55231 (_ BitVec 32))) (Found!13209 (index!55232 (_ BitVec 32))) (Intermediate!13209 (undefined!14021 Bool) (index!55233 (_ BitVec 32)) (x!137210 (_ BitVec 32))) (Undefined!13209) (MissingVacant!13209 (index!55234 (_ BitVec 32))) )
))
(declare-fun lt!664659 () SeekEntryResult!13209)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101945 (_ BitVec 32)) SeekEntryResult!13209)

(assert (=> b!1535463 (= lt!664659 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49182 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1051066 () Bool)

(assert (=> start!131110 (=> (not res!1051066) (not e!855582))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131110 (= res!1051066 (validMask!0 mask!2480))))

(assert (=> start!131110 e!855582))

(assert (=> start!131110 true))

(declare-fun array_inv!38463 (array!101945) Bool)

(assert (=> start!131110 (array_inv!38463 a!2792)))

(declare-fun b!1535464 () Bool)

(declare-fun res!1051064 () Bool)

(assert (=> b!1535464 (=> (not res!1051064) (not e!855582))))

(assert (=> b!1535464 (= res!1051064 (and (= (size!49733 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49733 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49733 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535465 () Bool)

(declare-fun res!1051063 () Bool)

(assert (=> b!1535465 (=> (not res!1051063) (not e!855582))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101945 (_ BitVec 32)) Bool)

(assert (=> b!1535465 (= res!1051063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535466 () Bool)

(declare-fun res!1051068 () Bool)

(assert (=> b!1535466 (=> (not res!1051068) (not e!855582))))

(declare-datatypes ((List!35643 0))(
  ( (Nil!35640) (Cons!35639 (h!37102 (_ BitVec 64)) (t!50329 List!35643)) )
))
(declare-fun arrayNoDuplicates!0 (array!101945 (_ BitVec 32) List!35643) Bool)

(assert (=> b!1535466 (= res!1051068 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35640))))

(declare-fun b!1535467 () Bool)

(declare-fun res!1051065 () Bool)

(assert (=> b!1535467 (=> (not res!1051065) (not e!855582))))

(assert (=> b!1535467 (= res!1051065 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49733 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49733 a!2792)) (= (select (arr!49182 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1535468 () Bool)

(declare-fun res!1051062 () Bool)

(assert (=> b!1535468 (=> (not res!1051062) (not e!855582))))

(assert (=> b!1535468 (= res!1051062 (validKeyInArray!0 (select (arr!49182 a!2792) j!64)))))

(assert (= (and start!131110 res!1051066) b!1535464))

(assert (= (and b!1535464 res!1051064) b!1535462))

(assert (= (and b!1535462 res!1051067) b!1535468))

(assert (= (and b!1535468 res!1051062) b!1535465))

(assert (= (and b!1535465 res!1051063) b!1535466))

(assert (= (and b!1535466 res!1051068) b!1535467))

(assert (= (and b!1535467 res!1051065) b!1535463))

(declare-fun m!1418039 () Bool)

(assert (=> b!1535462 m!1418039))

(assert (=> b!1535462 m!1418039))

(declare-fun m!1418041 () Bool)

(assert (=> b!1535462 m!1418041))

(declare-fun m!1418043 () Bool)

(assert (=> b!1535466 m!1418043))

(declare-fun m!1418045 () Bool)

(assert (=> b!1535468 m!1418045))

(assert (=> b!1535468 m!1418045))

(declare-fun m!1418047 () Bool)

(assert (=> b!1535468 m!1418047))

(assert (=> b!1535463 m!1418045))

(assert (=> b!1535463 m!1418045))

(declare-fun m!1418049 () Bool)

(assert (=> b!1535463 m!1418049))

(declare-fun m!1418051 () Bool)

(assert (=> b!1535467 m!1418051))

(declare-fun m!1418053 () Bool)

(assert (=> b!1535465 m!1418053))

(declare-fun m!1418055 () Bool)

(assert (=> start!131110 m!1418055))

(declare-fun m!1418057 () Bool)

(assert (=> start!131110 m!1418057))

(push 1)

(assert (not b!1535462))

(assert (not b!1535466))

(assert (not b!1535463))

(assert (not b!1535468))

(assert (not b!1535465))

(assert (not start!131110))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

