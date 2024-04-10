; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130754 () Bool)

(assert start!130754)

(declare-fun b!1533463 () Bool)

(declare-fun res!1050550 () Bool)

(declare-fun e!854242 () Bool)

(assert (=> b!1533463 (=> (not res!1050550) (not e!854242))))

(declare-datatypes ((array!101852 0))(
  ( (array!101853 (arr!49142 (Array (_ BitVec 32) (_ BitVec 64))) (size!49692 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101852)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101852 (_ BitVec 32)) Bool)

(assert (=> b!1533463 (= res!1050550 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1533464 () Bool)

(declare-fun res!1050553 () Bool)

(assert (=> b!1533464 (=> (not res!1050553) (not e!854242))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533464 (= res!1050553 (and (= (size!49692 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49692 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49692 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533466 () Bool)

(declare-fun res!1050555 () Bool)

(assert (=> b!1533466 (=> (not res!1050555) (not e!854242))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13274 0))(
  ( (MissingZero!13274 (index!55491 (_ BitVec 32))) (Found!13274 (index!55492 (_ BitVec 32))) (Intermediate!13274 (undefined!14086 Bool) (index!55493 (_ BitVec 32)) (x!137268 (_ BitVec 32))) (Undefined!13274) (MissingVacant!13274 (index!55494 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101852 (_ BitVec 32)) SeekEntryResult!13274)

(assert (=> b!1533466 (= res!1050555 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49142 a!2792) j!64) a!2792 mask!2480) (Found!13274 j!64)))))

(declare-fun b!1533467 () Bool)

(declare-fun res!1050554 () Bool)

(assert (=> b!1533467 (=> (not res!1050554) (not e!854242))))

(assert (=> b!1533467 (= res!1050554 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49692 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49692 a!2792)) (= (select (arr!49142 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533468 () Bool)

(declare-fun res!1050551 () Bool)

(assert (=> b!1533468 (=> (not res!1050551) (not e!854242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533468 (= res!1050551 (validKeyInArray!0 (select (arr!49142 a!2792) i!951)))))

(declare-fun b!1533469 () Bool)

(declare-fun res!1050549 () Bool)

(assert (=> b!1533469 (=> (not res!1050549) (not e!854242))))

(declare-datatypes ((List!35616 0))(
  ( (Nil!35613) (Cons!35612 (h!37057 (_ BitVec 64)) (t!50310 List!35616)) )
))
(declare-fun arrayNoDuplicates!0 (array!101852 (_ BitVec 32) List!35616) Bool)

(assert (=> b!1533469 (= res!1050549 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35613))))

(declare-fun b!1533470 () Bool)

(declare-fun res!1050552 () Bool)

(assert (=> b!1533470 (=> (not res!1050552) (not e!854242))))

(assert (=> b!1533470 (= res!1050552 (validKeyInArray!0 (select (arr!49142 a!2792) j!64)))))

(declare-fun res!1050556 () Bool)

(assert (=> start!130754 (=> (not res!1050556) (not e!854242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130754 (= res!1050556 (validMask!0 mask!2480))))

(assert (=> start!130754 e!854242))

(assert (=> start!130754 true))

(declare-fun array_inv!38170 (array!101852) Bool)

(assert (=> start!130754 (array_inv!38170 a!2792)))

(declare-fun b!1533465 () Bool)

(assert (=> b!1533465 (= e!854242 (and (= (select (arr!49142 a!2792) index!463) (select (arr!49142 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(assert (= (and start!130754 res!1050556) b!1533464))

(assert (= (and b!1533464 res!1050553) b!1533468))

(assert (= (and b!1533468 res!1050551) b!1533470))

(assert (= (and b!1533470 res!1050552) b!1533463))

(assert (= (and b!1533463 res!1050550) b!1533469))

(assert (= (and b!1533469 res!1050549) b!1533467))

(assert (= (and b!1533467 res!1050554) b!1533466))

(assert (= (and b!1533466 res!1050555) b!1533465))

(declare-fun m!1416153 () Bool)

(assert (=> b!1533470 m!1416153))

(assert (=> b!1533470 m!1416153))

(declare-fun m!1416155 () Bool)

(assert (=> b!1533470 m!1416155))

(declare-fun m!1416157 () Bool)

(assert (=> start!130754 m!1416157))

(declare-fun m!1416159 () Bool)

(assert (=> start!130754 m!1416159))

(declare-fun m!1416161 () Bool)

(assert (=> b!1533463 m!1416161))

(assert (=> b!1533466 m!1416153))

(assert (=> b!1533466 m!1416153))

(declare-fun m!1416163 () Bool)

(assert (=> b!1533466 m!1416163))

(declare-fun m!1416165 () Bool)

(assert (=> b!1533468 m!1416165))

(assert (=> b!1533468 m!1416165))

(declare-fun m!1416167 () Bool)

(assert (=> b!1533468 m!1416167))

(declare-fun m!1416169 () Bool)

(assert (=> b!1533467 m!1416169))

(declare-fun m!1416171 () Bool)

(assert (=> b!1533465 m!1416171))

(assert (=> b!1533465 m!1416153))

(declare-fun m!1416173 () Bool)

(assert (=> b!1533469 m!1416173))

(push 1)

(assert (not b!1533463))

(assert (not b!1533470))

(assert (not b!1533468))

(assert (not start!130754))

(assert (not b!1533469))

(assert (not b!1533466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

