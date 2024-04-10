; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131172 () Bool)

(assert start!131172)

(declare-fun b!1538820 () Bool)

(declare-fun res!1055804 () Bool)

(declare-fun e!856081 () Bool)

(assert (=> b!1538820 (=> (not res!1055804) (not e!856081))))

(declare-datatypes ((array!102237 0))(
  ( (array!102238 (arr!49333 (Array (_ BitVec 32) (_ BitVec 64))) (size!49883 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102237)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538820 (= res!1055804 (validKeyInArray!0 (select (arr!49333 a!2792) i!951)))))

(declare-fun b!1538821 () Bool)

(declare-fun res!1055803 () Bool)

(assert (=> b!1538821 (=> (not res!1055803) (not e!856081))))

(declare-datatypes ((List!35807 0))(
  ( (Nil!35804) (Cons!35803 (h!37248 (_ BitVec 64)) (t!50501 List!35807)) )
))
(declare-fun arrayNoDuplicates!0 (array!102237 (_ BitVec 32) List!35807) Bool)

(assert (=> b!1538821 (= res!1055803 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35804))))

(declare-fun b!1538822 () Bool)

(declare-fun res!1055801 () Bool)

(assert (=> b!1538822 (=> (not res!1055801) (not e!856081))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102237 (_ BitVec 32)) Bool)

(assert (=> b!1538822 (= res!1055801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538823 () Bool)

(assert (=> b!1538823 (= e!856081 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun lt!664942 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538823 (= lt!664942 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538824 () Bool)

(declare-fun res!1055798 () Bool)

(assert (=> b!1538824 (=> (not res!1055798) (not e!856081))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(assert (=> b!1538824 (= res!1055798 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49883 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49883 a!2792)) (= (select (arr!49333 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538825 () Bool)

(declare-fun res!1055805 () Bool)

(assert (=> b!1538825 (=> (not res!1055805) (not e!856081))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1538825 (= res!1055805 (and (= (size!49883 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49883 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49883 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1055806 () Bool)

(assert (=> start!131172 (=> (not res!1055806) (not e!856081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131172 (= res!1055806 (validMask!0 mask!2480))))

(assert (=> start!131172 e!856081))

(assert (=> start!131172 true))

(declare-fun array_inv!38361 (array!102237) Bool)

(assert (=> start!131172 (array_inv!38361 a!2792)))

(declare-fun b!1538826 () Bool)

(declare-fun res!1055799 () Bool)

(assert (=> b!1538826 (=> (not res!1055799) (not e!856081))))

(assert (=> b!1538826 (= res!1055799 (validKeyInArray!0 (select (arr!49333 a!2792) j!64)))))

(declare-fun b!1538827 () Bool)

(declare-fun res!1055800 () Bool)

(assert (=> b!1538827 (=> (not res!1055800) (not e!856081))))

(assert (=> b!1538827 (= res!1055800 (not (= (select (arr!49333 a!2792) index!463) (select (arr!49333 a!2792) j!64))))))

(declare-fun b!1538828 () Bool)

(declare-fun res!1055802 () Bool)

(assert (=> b!1538828 (=> (not res!1055802) (not e!856081))))

(declare-datatypes ((SeekEntryResult!13459 0))(
  ( (MissingZero!13459 (index!56231 (_ BitVec 32))) (Found!13459 (index!56232 (_ BitVec 32))) (Intermediate!13459 (undefined!14271 Bool) (index!56233 (_ BitVec 32)) (x!137960 (_ BitVec 32))) (Undefined!13459) (MissingVacant!13459 (index!56234 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102237 (_ BitVec 32)) SeekEntryResult!13459)

(assert (=> b!1538828 (= res!1055802 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49333 a!2792) j!64) a!2792 mask!2480) (Found!13459 j!64)))))

(assert (= (and start!131172 res!1055806) b!1538825))

(assert (= (and b!1538825 res!1055805) b!1538820))

(assert (= (and b!1538820 res!1055804) b!1538826))

(assert (= (and b!1538826 res!1055799) b!1538822))

(assert (= (and b!1538822 res!1055801) b!1538821))

(assert (= (and b!1538821 res!1055803) b!1538824))

(assert (= (and b!1538824 res!1055798) b!1538828))

(assert (= (and b!1538828 res!1055802) b!1538827))

(assert (= (and b!1538827 res!1055800) b!1538823))

(declare-fun m!1421211 () Bool)

(assert (=> b!1538820 m!1421211))

(assert (=> b!1538820 m!1421211))

(declare-fun m!1421213 () Bool)

(assert (=> b!1538820 m!1421213))

(declare-fun m!1421215 () Bool)

(assert (=> start!131172 m!1421215))

(declare-fun m!1421217 () Bool)

(assert (=> start!131172 m!1421217))

(declare-fun m!1421219 () Bool)

(assert (=> b!1538823 m!1421219))

(declare-fun m!1421221 () Bool)

(assert (=> b!1538826 m!1421221))

(assert (=> b!1538826 m!1421221))

(declare-fun m!1421223 () Bool)

(assert (=> b!1538826 m!1421223))

(declare-fun m!1421225 () Bool)

(assert (=> b!1538827 m!1421225))

(assert (=> b!1538827 m!1421221))

(declare-fun m!1421227 () Bool)

(assert (=> b!1538821 m!1421227))

(declare-fun m!1421229 () Bool)

(assert (=> b!1538824 m!1421229))

(declare-fun m!1421231 () Bool)

(assert (=> b!1538822 m!1421231))

(assert (=> b!1538828 m!1421221))

(assert (=> b!1538828 m!1421221))

(declare-fun m!1421233 () Bool)

(assert (=> b!1538828 m!1421233))

(push 1)

(assert (not b!1538828))

(assert (not b!1538821))

(assert (not start!131172))

(assert (not b!1538826))

(assert (not b!1538820))

(assert (not b!1538823))

(assert (not b!1538822))

(check-sat)

