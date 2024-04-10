; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131060 () Bool)

(assert start!131060)

(declare-fun b!1537737 () Bool)

(declare-fun res!1054822 () Bool)

(declare-fun e!855745 () Bool)

(assert (=> b!1537737 (=> (not res!1054822) (not e!855745))))

(declare-datatypes ((array!102158 0))(
  ( (array!102159 (arr!49295 (Array (_ BitVec 32) (_ BitVec 64))) (size!49845 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102158)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102158 (_ BitVec 32)) Bool)

(assert (=> b!1537737 (= res!1054822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537738 () Bool)

(declare-fun res!1054823 () Bool)

(assert (=> b!1537738 (=> (not res!1054823) (not e!855745))))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun x!510 () (_ BitVec 32))

(assert (=> b!1537738 (= res!1054823 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49845 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49845 a!2792)) (= (select (arr!49295 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537739 () Bool)

(assert (=> b!1537739 (= e!855745 false)))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13421 0))(
  ( (MissingZero!13421 (index!56079 (_ BitVec 32))) (Found!13421 (index!56080 (_ BitVec 32))) (Intermediate!13421 (undefined!14233 Bool) (index!56081 (_ BitVec 32)) (x!137823 (_ BitVec 32))) (Undefined!13421) (MissingVacant!13421 (index!56082 (_ BitVec 32))) )
))
(declare-fun lt!664777 () SeekEntryResult!13421)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102158 (_ BitVec 32)) SeekEntryResult!13421)

(assert (=> b!1537739 (= lt!664777 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49295 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1537740 () Bool)

(declare-fun res!1054825 () Bool)

(assert (=> b!1537740 (=> (not res!1054825) (not e!855745))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537740 (= res!1054825 (validKeyInArray!0 (select (arr!49295 a!2792) j!64)))))

(declare-fun b!1537741 () Bool)

(declare-fun res!1054828 () Bool)

(assert (=> b!1537741 (=> (not res!1054828) (not e!855745))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537741 (= res!1054828 (validKeyInArray!0 (select (arr!49295 a!2792) i!951)))))

(declare-fun b!1537742 () Bool)

(declare-fun res!1054827 () Bool)

(assert (=> b!1537742 (=> (not res!1054827) (not e!855745))))

(assert (=> b!1537742 (= res!1054827 (and (= (size!49845 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49845 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49845 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537736 () Bool)

(declare-fun res!1054824 () Bool)

(assert (=> b!1537736 (=> (not res!1054824) (not e!855745))))

(declare-datatypes ((List!35769 0))(
  ( (Nil!35766) (Cons!35765 (h!37210 (_ BitVec 64)) (t!50463 List!35769)) )
))
(declare-fun arrayNoDuplicates!0 (array!102158 (_ BitVec 32) List!35769) Bool)

(assert (=> b!1537736 (= res!1054824 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35766))))

(declare-fun res!1054826 () Bool)

(assert (=> start!131060 (=> (not res!1054826) (not e!855745))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131060 (= res!1054826 (validMask!0 mask!2480))))

(assert (=> start!131060 e!855745))

(assert (=> start!131060 true))

(declare-fun array_inv!38323 (array!102158) Bool)

(assert (=> start!131060 (array_inv!38323 a!2792)))

(assert (= (and start!131060 res!1054826) b!1537742))

(assert (= (and b!1537742 res!1054827) b!1537741))

(assert (= (and b!1537741 res!1054828) b!1537740))

(assert (= (and b!1537740 res!1054825) b!1537737))

(assert (= (and b!1537737 res!1054822) b!1537736))

(assert (= (and b!1537736 res!1054824) b!1537738))

(assert (= (and b!1537738 res!1054823) b!1537739))

(declare-fun m!1420251 () Bool)

(assert (=> b!1537737 m!1420251))

(declare-fun m!1420253 () Bool)

(assert (=> b!1537738 m!1420253))

(declare-fun m!1420255 () Bool)

(assert (=> start!131060 m!1420255))

(declare-fun m!1420257 () Bool)

(assert (=> start!131060 m!1420257))

(declare-fun m!1420259 () Bool)

(assert (=> b!1537740 m!1420259))

(assert (=> b!1537740 m!1420259))

(declare-fun m!1420261 () Bool)

(assert (=> b!1537740 m!1420261))

(declare-fun m!1420263 () Bool)

(assert (=> b!1537741 m!1420263))

(assert (=> b!1537741 m!1420263))

(declare-fun m!1420265 () Bool)

(assert (=> b!1537741 m!1420265))

(declare-fun m!1420267 () Bool)

(assert (=> b!1537736 m!1420267))

(assert (=> b!1537739 m!1420259))

(assert (=> b!1537739 m!1420259))

(declare-fun m!1420269 () Bool)

(assert (=> b!1537739 m!1420269))

(push 1)

(assert (not b!1537740))

(assert (not b!1537739))

(assert (not start!131060))

(assert (not b!1537736))

(assert (not b!1537741))

(assert (not b!1537737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

