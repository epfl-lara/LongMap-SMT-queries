; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131122 () Bool)

(assert start!131122)

(declare-fun b!1535597 () Bool)

(declare-fun res!1051197 () Bool)

(declare-fun e!855619 () Bool)

(assert (=> b!1535597 (=> (not res!1051197) (not e!855619))))

(declare-datatypes ((array!101957 0))(
  ( (array!101958 (arr!49188 (Array (_ BitVec 32) (_ BitVec 64))) (size!49739 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101957)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535597 (= res!1051197 (validKeyInArray!0 (select (arr!49188 a!2792) j!64)))))

(declare-fun b!1535598 () Bool)

(declare-fun res!1051203 () Bool)

(assert (=> b!1535598 (=> (not res!1051203) (not e!855619))))

(declare-datatypes ((List!35649 0))(
  ( (Nil!35646) (Cons!35645 (h!37108 (_ BitVec 64)) (t!50335 List!35649)) )
))
(declare-fun arrayNoDuplicates!0 (array!101957 (_ BitVec 32) List!35649) Bool)

(assert (=> b!1535598 (= res!1051203 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35646))))

(declare-fun res!1051200 () Bool)

(assert (=> start!131122 (=> (not res!1051200) (not e!855619))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131122 (= res!1051200 (validMask!0 mask!2480))))

(assert (=> start!131122 e!855619))

(assert (=> start!131122 true))

(declare-fun array_inv!38469 (array!101957) Bool)

(assert (=> start!131122 (array_inv!38469 a!2792)))

(declare-fun b!1535599 () Bool)

(assert (=> b!1535599 (= e!855619 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13215 0))(
  ( (MissingZero!13215 (index!55255 (_ BitVec 32))) (Found!13215 (index!55256 (_ BitVec 32))) (Intermediate!13215 (undefined!14027 Bool) (index!55257 (_ BitVec 32)) (x!137232 (_ BitVec 32))) (Undefined!13215) (MissingVacant!13215 (index!55258 (_ BitVec 32))) )
))
(declare-fun lt!664668 () SeekEntryResult!13215)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101957 (_ BitVec 32)) SeekEntryResult!13215)

(assert (=> b!1535599 (= lt!664668 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49188 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535600 () Bool)

(declare-fun res!1051199 () Bool)

(assert (=> b!1535600 (=> (not res!1051199) (not e!855619))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535600 (= res!1051199 (and (= (size!49739 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49739 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49739 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535601 () Bool)

(declare-fun res!1051198 () Bool)

(assert (=> b!1535601 (=> (not res!1051198) (not e!855619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101957 (_ BitVec 32)) Bool)

(assert (=> b!1535601 (= res!1051198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535602 () Bool)

(declare-fun res!1051201 () Bool)

(assert (=> b!1535602 (=> (not res!1051201) (not e!855619))))

(assert (=> b!1535602 (= res!1051201 (validKeyInArray!0 (select (arr!49188 a!2792) i!951)))))

(declare-fun b!1535603 () Bool)

(declare-fun res!1051202 () Bool)

(assert (=> b!1535603 (=> (not res!1051202) (not e!855619))))

(assert (=> b!1535603 (= res!1051202 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49739 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49739 a!2792)) (= (select (arr!49188 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!131122 res!1051200) b!1535600))

(assert (= (and b!1535600 res!1051199) b!1535602))

(assert (= (and b!1535602 res!1051201) b!1535597))

(assert (= (and b!1535597 res!1051197) b!1535601))

(assert (= (and b!1535601 res!1051198) b!1535598))

(assert (= (and b!1535598 res!1051203) b!1535603))

(assert (= (and b!1535603 res!1051202) b!1535599))

(declare-fun m!1418165 () Bool)

(assert (=> b!1535602 m!1418165))

(assert (=> b!1535602 m!1418165))

(declare-fun m!1418167 () Bool)

(assert (=> b!1535602 m!1418167))

(declare-fun m!1418169 () Bool)

(assert (=> b!1535597 m!1418169))

(assert (=> b!1535597 m!1418169))

(declare-fun m!1418171 () Bool)

(assert (=> b!1535597 m!1418171))

(declare-fun m!1418173 () Bool)

(assert (=> b!1535598 m!1418173))

(declare-fun m!1418175 () Bool)

(assert (=> start!131122 m!1418175))

(declare-fun m!1418177 () Bool)

(assert (=> start!131122 m!1418177))

(declare-fun m!1418179 () Bool)

(assert (=> b!1535603 m!1418179))

(declare-fun m!1418181 () Bool)

(assert (=> b!1535601 m!1418181))

(assert (=> b!1535599 m!1418169))

(assert (=> b!1535599 m!1418169))

(declare-fun m!1418183 () Bool)

(assert (=> b!1535599 m!1418183))

(push 1)

(assert (not b!1535598))

(assert (not start!131122))

(assert (not b!1535602))

(assert (not b!1535601))

(assert (not b!1535599))

(assert (not b!1535597))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

