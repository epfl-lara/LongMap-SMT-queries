; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130820 () Bool)

(assert start!130820)

(declare-fun b!1534217 () Bool)

(declare-fun res!1051307 () Bool)

(declare-fun e!854439 () Bool)

(assert (=> b!1534217 (=> (not res!1051307) (not e!854439))))

(declare-datatypes ((array!101918 0))(
  ( (array!101919 (arr!49175 (Array (_ BitVec 32) (_ BitVec 64))) (size!49725 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101918)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534217 (= res!1051307 (validKeyInArray!0 (select (arr!49175 a!2792) i!951)))))

(declare-fun b!1534219 () Bool)

(declare-fun res!1051304 () Bool)

(assert (=> b!1534219 (=> (not res!1051304) (not e!854439))))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534219 (= res!1051304 (validKeyInArray!0 (select (arr!49175 a!2792) j!64)))))

(declare-fun b!1534220 () Bool)

(declare-fun res!1051309 () Bool)

(assert (=> b!1534220 (=> (not res!1051309) (not e!854439))))

(declare-fun mask!2480 () (_ BitVec 32))

(assert (=> b!1534220 (= res!1051309 (and (= (size!49725 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49725 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49725 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534221 () Bool)

(assert (=> b!1534221 (= e!854439 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13307 0))(
  ( (MissingZero!13307 (index!55623 (_ BitVec 32))) (Found!13307 (index!55624 (_ BitVec 32))) (Intermediate!13307 (undefined!14119 Bool) (index!55625 (_ BitVec 32)) (x!137389 (_ BitVec 32))) (Undefined!13307) (MissingVacant!13307 (index!55626 (_ BitVec 32))) )
))
(declare-fun lt!663850 () SeekEntryResult!13307)

(declare-fun index!463 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101918 (_ BitVec 32)) SeekEntryResult!13307)

(assert (=> b!1534221 (= lt!663850 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49175 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534222 () Bool)

(declare-fun res!1051305 () Bool)

(assert (=> b!1534222 (=> (not res!1051305) (not e!854439))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101918 (_ BitVec 32)) Bool)

(assert (=> b!1534222 (= res!1051305 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534223 () Bool)

(declare-fun res!1051306 () Bool)

(assert (=> b!1534223 (=> (not res!1051306) (not e!854439))))

(assert (=> b!1534223 (= res!1051306 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49725 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49725 a!2792)) (= (select (arr!49175 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1051308 () Bool)

(assert (=> start!130820 (=> (not res!1051308) (not e!854439))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130820 (= res!1051308 (validMask!0 mask!2480))))

(assert (=> start!130820 e!854439))

(assert (=> start!130820 true))

(declare-fun array_inv!38203 (array!101918) Bool)

(assert (=> start!130820 (array_inv!38203 a!2792)))

(declare-fun b!1534218 () Bool)

(declare-fun res!1051303 () Bool)

(assert (=> b!1534218 (=> (not res!1051303) (not e!854439))))

(declare-datatypes ((List!35649 0))(
  ( (Nil!35646) (Cons!35645 (h!37090 (_ BitVec 64)) (t!50343 List!35649)) )
))
(declare-fun arrayNoDuplicates!0 (array!101918 (_ BitVec 32) List!35649) Bool)

(assert (=> b!1534218 (= res!1051303 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35646))))

(assert (= (and start!130820 res!1051308) b!1534220))

(assert (= (and b!1534220 res!1051309) b!1534217))

(assert (= (and b!1534217 res!1051307) b!1534219))

(assert (= (and b!1534219 res!1051304) b!1534222))

(assert (= (and b!1534222 res!1051305) b!1534218))

(assert (= (and b!1534218 res!1051303) b!1534223))

(assert (= (and b!1534223 res!1051306) b!1534221))

(declare-fun m!1416885 () Bool)

(assert (=> start!130820 m!1416885))

(declare-fun m!1416887 () Bool)

(assert (=> start!130820 m!1416887))

(declare-fun m!1416889 () Bool)

(assert (=> b!1534222 m!1416889))

(declare-fun m!1416891 () Bool)

(assert (=> b!1534223 m!1416891))

(declare-fun m!1416893 () Bool)

(assert (=> b!1534221 m!1416893))

(assert (=> b!1534221 m!1416893))

(declare-fun m!1416895 () Bool)

(assert (=> b!1534221 m!1416895))

(declare-fun m!1416897 () Bool)

(assert (=> b!1534217 m!1416897))

(assert (=> b!1534217 m!1416897))

(declare-fun m!1416899 () Bool)

(assert (=> b!1534217 m!1416899))

(declare-fun m!1416901 () Bool)

(assert (=> b!1534218 m!1416901))

(assert (=> b!1534219 m!1416893))

(assert (=> b!1534219 m!1416893))

(declare-fun m!1416903 () Bool)

(assert (=> b!1534219 m!1416903))

(push 1)

(assert (not b!1534217))

(assert (not start!130820))

(assert (not b!1534219))

(assert (not b!1534222))

(assert (not b!1534221))

(assert (not b!1534218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

