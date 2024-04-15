; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130704 () Bool)

(assert start!130704)

(declare-fun b!1533150 () Bool)

(declare-fun res!1050426 () Bool)

(declare-fun e!854043 () Bool)

(assert (=> b!1533150 (=> (not res!1050426) (not e!854043))))

(declare-datatypes ((array!101800 0))(
  ( (array!101801 (arr!49117 (Array (_ BitVec 32) (_ BitVec 64))) (size!49669 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101800)

(declare-datatypes ((List!35669 0))(
  ( (Nil!35666) (Cons!35665 (h!37111 (_ BitVec 64)) (t!50355 List!35669)) )
))
(declare-fun arrayNoDuplicates!0 (array!101800 (_ BitVec 32) List!35669) Bool)

(assert (=> b!1533150 (= res!1050426 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35666))))

(declare-fun b!1533151 () Bool)

(declare-fun res!1050423 () Bool)

(assert (=> b!1533151 (=> (not res!1050423) (not e!854043))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533151 (= res!1050423 (validKeyInArray!0 (select (arr!49117 a!2792) j!64)))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun b!1533152 () Bool)

(assert (=> b!1533152 (= e!854043 (and (= (select (arr!49117 a!2792) index!463) (select (arr!49117 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480))))))

(declare-fun res!1050427 () Bool)

(assert (=> start!130704 (=> (not res!1050427) (not e!854043))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130704 (= res!1050427 (validMask!0 mask!2480))))

(assert (=> start!130704 e!854043))

(assert (=> start!130704 true))

(declare-fun array_inv!38350 (array!101800) Bool)

(assert (=> start!130704 (array_inv!38350 a!2792)))

(declare-fun b!1533153 () Bool)

(declare-fun res!1050425 () Bool)

(assert (=> b!1533153 (=> (not res!1050425) (not e!854043))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533153 (= res!1050425 (and (= (size!49669 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49669 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49669 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533154 () Bool)

(declare-fun res!1050422 () Bool)

(assert (=> b!1533154 (=> (not res!1050422) (not e!854043))))

(assert (=> b!1533154 (= res!1050422 (validKeyInArray!0 (select (arr!49117 a!2792) i!951)))))

(declare-fun b!1533155 () Bool)

(declare-fun res!1050424 () Bool)

(assert (=> b!1533155 (=> (not res!1050424) (not e!854043))))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1533155 (= res!1050424 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49669 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49669 a!2792)) (= (select (arr!49117 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533156 () Bool)

(declare-fun res!1050421 () Bool)

(assert (=> b!1533156 (=> (not res!1050421) (not e!854043))))

(declare-datatypes ((SeekEntryResult!13274 0))(
  ( (MissingZero!13274 (index!55491 (_ BitVec 32))) (Found!13274 (index!55492 (_ BitVec 32))) (Intermediate!13274 (undefined!14086 Bool) (index!55493 (_ BitVec 32)) (x!137263 (_ BitVec 32))) (Undefined!13274) (MissingVacant!13274 (index!55494 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101800 (_ BitVec 32)) SeekEntryResult!13274)

(assert (=> b!1533156 (= res!1050421 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49117 a!2792) j!64) a!2792 mask!2480) (Found!13274 j!64)))))

(declare-fun b!1533157 () Bool)

(declare-fun res!1050420 () Bool)

(assert (=> b!1533157 (=> (not res!1050420) (not e!854043))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101800 (_ BitVec 32)) Bool)

(assert (=> b!1533157 (= res!1050420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130704 res!1050427) b!1533153))

(assert (= (and b!1533153 res!1050425) b!1533154))

(assert (= (and b!1533154 res!1050422) b!1533151))

(assert (= (and b!1533151 res!1050423) b!1533157))

(assert (= (and b!1533157 res!1050420) b!1533150))

(assert (= (and b!1533150 res!1050426) b!1533155))

(assert (= (and b!1533155 res!1050424) b!1533156))

(assert (= (and b!1533156 res!1050421) b!1533152))

(declare-fun m!1415261 () Bool)

(assert (=> b!1533155 m!1415261))

(declare-fun m!1415263 () Bool)

(assert (=> b!1533151 m!1415263))

(assert (=> b!1533151 m!1415263))

(declare-fun m!1415265 () Bool)

(assert (=> b!1533151 m!1415265))

(declare-fun m!1415267 () Bool)

(assert (=> b!1533157 m!1415267))

(declare-fun m!1415269 () Bool)

(assert (=> start!130704 m!1415269))

(declare-fun m!1415271 () Bool)

(assert (=> start!130704 m!1415271))

(declare-fun m!1415273 () Bool)

(assert (=> b!1533154 m!1415273))

(assert (=> b!1533154 m!1415273))

(declare-fun m!1415275 () Bool)

(assert (=> b!1533154 m!1415275))

(assert (=> b!1533156 m!1415263))

(assert (=> b!1533156 m!1415263))

(declare-fun m!1415277 () Bool)

(assert (=> b!1533156 m!1415277))

(declare-fun m!1415279 () Bool)

(assert (=> b!1533152 m!1415279))

(assert (=> b!1533152 m!1415263))

(declare-fun m!1415281 () Bool)

(assert (=> b!1533150 m!1415281))

(check-sat (not start!130704) (not b!1533150) (not b!1533154) (not b!1533157) (not b!1533151) (not b!1533156))
(check-sat)
