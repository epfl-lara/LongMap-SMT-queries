; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130764 () Bool)

(assert start!130764)

(declare-fun b!1533583 () Bool)

(declare-fun res!1050670 () Bool)

(declare-fun e!854271 () Bool)

(assert (=> b!1533583 (=> (not res!1050670) (not e!854271))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101862 0))(
  ( (array!101863 (arr!49147 (Array (_ BitVec 32) (_ BitVec 64))) (size!49697 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101862)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13279 0))(
  ( (MissingZero!13279 (index!55511 (_ BitVec 32))) (Found!13279 (index!55512 (_ BitVec 32))) (Intermediate!13279 (undefined!14091 Bool) (index!55513 (_ BitVec 32)) (x!137281 (_ BitVec 32))) (Undefined!13279) (MissingVacant!13279 (index!55514 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101862 (_ BitVec 32)) SeekEntryResult!13279)

(assert (=> b!1533583 (= res!1050670 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49147 a!2792) j!64) a!2792 mask!2480) (Found!13279 j!64)))))

(declare-fun b!1533584 () Bool)

(declare-fun res!1050673 () Bool)

(assert (=> b!1533584 (=> (not res!1050673) (not e!854271))))

(assert (=> b!1533584 (= res!1050673 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49697 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49697 a!2792)) (= (select (arr!49147 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1533585 () Bool)

(declare-fun res!1050675 () Bool)

(assert (=> b!1533585 (=> (not res!1050675) (not e!854271))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1533585 (= res!1050675 (validKeyInArray!0 (select (arr!49147 a!2792) j!64)))))

(declare-fun b!1533586 () Bool)

(declare-fun res!1050672 () Bool)

(assert (=> b!1533586 (=> (not res!1050672) (not e!854271))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1533586 (= res!1050672 (validKeyInArray!0 (select (arr!49147 a!2792) i!951)))))

(declare-fun res!1050674 () Bool)

(assert (=> start!130764 (=> (not res!1050674) (not e!854271))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130764 (= res!1050674 (validMask!0 mask!2480))))

(assert (=> start!130764 e!854271))

(assert (=> start!130764 true))

(declare-fun array_inv!38175 (array!101862) Bool)

(assert (=> start!130764 (array_inv!38175 a!2792)))

(declare-fun b!1533587 () Bool)

(assert (=> b!1533587 (= e!854271 (and (= (select (arr!49147 a!2792) index!463) (select (arr!49147 a!2792) j!64)) (bvsge mask!2480 #b00000000000000000000000000000000) (bvslt index!463 (bvadd #b00000000000000000000000000000001 mask!2480)) (bvslt vacantIndex!5 (bvadd #b00000000000000000000000000000001 mask!2480)) (not (= (select (store (arr!49147 a!2792) i!951 #b1000000000000000000000000000000000000000000000000000000000000000) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1533588 () Bool)

(declare-fun res!1050676 () Bool)

(assert (=> b!1533588 (=> (not res!1050676) (not e!854271))))

(declare-datatypes ((List!35621 0))(
  ( (Nil!35618) (Cons!35617 (h!37062 (_ BitVec 64)) (t!50315 List!35621)) )
))
(declare-fun arrayNoDuplicates!0 (array!101862 (_ BitVec 32) List!35621) Bool)

(assert (=> b!1533588 (= res!1050676 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35618))))

(declare-fun b!1533589 () Bool)

(declare-fun res!1050671 () Bool)

(assert (=> b!1533589 (=> (not res!1050671) (not e!854271))))

(assert (=> b!1533589 (= res!1050671 (and (= (size!49697 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49697 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49697 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1533590 () Bool)

(declare-fun res!1050669 () Bool)

(assert (=> b!1533590 (=> (not res!1050669) (not e!854271))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101862 (_ BitVec 32)) Bool)

(assert (=> b!1533590 (= res!1050669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(assert (= (and start!130764 res!1050674) b!1533589))

(assert (= (and b!1533589 res!1050671) b!1533586))

(assert (= (and b!1533586 res!1050672) b!1533585))

(assert (= (and b!1533585 res!1050675) b!1533590))

(assert (= (and b!1533590 res!1050669) b!1533588))

(assert (= (and b!1533588 res!1050676) b!1533584))

(assert (= (and b!1533584 res!1050673) b!1533583))

(assert (= (and b!1533583 res!1050670) b!1533587))

(declare-fun m!1416271 () Bool)

(assert (=> b!1533585 m!1416271))

(assert (=> b!1533585 m!1416271))

(declare-fun m!1416273 () Bool)

(assert (=> b!1533585 m!1416273))

(declare-fun m!1416275 () Bool)

(assert (=> b!1533587 m!1416275))

(assert (=> b!1533587 m!1416271))

(declare-fun m!1416277 () Bool)

(assert (=> b!1533587 m!1416277))

(declare-fun m!1416279 () Bool)

(assert (=> b!1533587 m!1416279))

(declare-fun m!1416281 () Bool)

(assert (=> b!1533586 m!1416281))

(assert (=> b!1533586 m!1416281))

(declare-fun m!1416283 () Bool)

(assert (=> b!1533586 m!1416283))

(assert (=> b!1533583 m!1416271))

(assert (=> b!1533583 m!1416271))

(declare-fun m!1416285 () Bool)

(assert (=> b!1533583 m!1416285))

(declare-fun m!1416287 () Bool)

(assert (=> b!1533584 m!1416287))

(declare-fun m!1416289 () Bool)

(assert (=> b!1533588 m!1416289))

(declare-fun m!1416291 () Bool)

(assert (=> start!130764 m!1416291))

(declare-fun m!1416293 () Bool)

(assert (=> start!130764 m!1416293))

(declare-fun m!1416295 () Bool)

(assert (=> b!1533590 m!1416295))

(push 1)

(assert (not b!1533590))

(assert (not b!1533586))

(assert (not start!130764))

(assert (not b!1533583))

(assert (not b!1533588))

(assert (not b!1533585))

(check-sat)

(pop 1)

(push 1)

(check-sat)

