; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130808 () Bool)

(assert start!130808)

(declare-fun b!1534091 () Bool)

(declare-fun res!1051182 () Bool)

(declare-fun e!854403 () Bool)

(assert (=> b!1534091 (=> (not res!1051182) (not e!854403))))

(declare-datatypes ((array!101906 0))(
  ( (array!101907 (arr!49169 (Array (_ BitVec 32) (_ BitVec 64))) (size!49719 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101906)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1534091 (= res!1051182 (and (= (size!49719 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49719 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49719 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534092 () Bool)

(declare-fun res!1051183 () Bool)

(assert (=> b!1534092 (=> (not res!1051183) (not e!854403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534092 (= res!1051183 (validKeyInArray!0 (select (arr!49169 a!2792) i!951)))))

(declare-fun b!1534093 () Bool)

(declare-fun res!1051181 () Bool)

(assert (=> b!1534093 (=> (not res!1051181) (not e!854403))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534093 (= res!1051181 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49719 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49719 a!2792)) (= (select (arr!49169 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534094 () Bool)

(declare-fun res!1051179 () Bool)

(assert (=> b!1534094 (=> (not res!1051179) (not e!854403))))

(assert (=> b!1534094 (= res!1051179 (validKeyInArray!0 (select (arr!49169 a!2792) j!64)))))

(declare-fun res!1051178 () Bool)

(assert (=> start!130808 (=> (not res!1051178) (not e!854403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130808 (= res!1051178 (validMask!0 mask!2480))))

(assert (=> start!130808 e!854403))

(assert (=> start!130808 true))

(declare-fun array_inv!38197 (array!101906) Bool)

(assert (=> start!130808 (array_inv!38197 a!2792)))

(declare-fun b!1534095 () Bool)

(assert (=> b!1534095 (= e!854403 false)))

(declare-datatypes ((SeekEntryResult!13301 0))(
  ( (MissingZero!13301 (index!55599 (_ BitVec 32))) (Found!13301 (index!55600 (_ BitVec 32))) (Intermediate!13301 (undefined!14113 Bool) (index!55601 (_ BitVec 32)) (x!137367 (_ BitVec 32))) (Undefined!13301) (MissingVacant!13301 (index!55602 (_ BitVec 32))) )
))
(declare-fun lt!663832 () SeekEntryResult!13301)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101906 (_ BitVec 32)) SeekEntryResult!13301)

(assert (=> b!1534095 (= lt!663832 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49169 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1534096 () Bool)

(declare-fun res!1051177 () Bool)

(assert (=> b!1534096 (=> (not res!1051177) (not e!854403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101906 (_ BitVec 32)) Bool)

(assert (=> b!1534096 (= res!1051177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534097 () Bool)

(declare-fun res!1051180 () Bool)

(assert (=> b!1534097 (=> (not res!1051180) (not e!854403))))

(declare-datatypes ((List!35643 0))(
  ( (Nil!35640) (Cons!35639 (h!37084 (_ BitVec 64)) (t!50337 List!35643)) )
))
(declare-fun arrayNoDuplicates!0 (array!101906 (_ BitVec 32) List!35643) Bool)

(assert (=> b!1534097 (= res!1051180 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35640))))

(assert (= (and start!130808 res!1051178) b!1534091))

(assert (= (and b!1534091 res!1051182) b!1534092))

(assert (= (and b!1534092 res!1051183) b!1534094))

(assert (= (and b!1534094 res!1051179) b!1534096))

(assert (= (and b!1534096 res!1051177) b!1534097))

(assert (= (and b!1534097 res!1051180) b!1534093))

(assert (= (and b!1534093 res!1051181) b!1534095))

(declare-fun m!1416765 () Bool)

(assert (=> b!1534093 m!1416765))

(declare-fun m!1416767 () Bool)

(assert (=> b!1534094 m!1416767))

(assert (=> b!1534094 m!1416767))

(declare-fun m!1416769 () Bool)

(assert (=> b!1534094 m!1416769))

(assert (=> b!1534095 m!1416767))

(assert (=> b!1534095 m!1416767))

(declare-fun m!1416771 () Bool)

(assert (=> b!1534095 m!1416771))

(declare-fun m!1416773 () Bool)

(assert (=> b!1534092 m!1416773))

(assert (=> b!1534092 m!1416773))

(declare-fun m!1416775 () Bool)

(assert (=> b!1534092 m!1416775))

(declare-fun m!1416777 () Bool)

(assert (=> b!1534097 m!1416777))

(declare-fun m!1416779 () Bool)

(assert (=> start!130808 m!1416779))

(declare-fun m!1416781 () Bool)

(assert (=> start!130808 m!1416781))

(declare-fun m!1416783 () Bool)

(assert (=> b!1534096 m!1416783))

(push 1)

(assert (not b!1534092))

(assert (not b!1534094))

(assert (not b!1534097))

(assert (not start!130808))

(assert (not b!1534095))

(assert (not b!1534096))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

