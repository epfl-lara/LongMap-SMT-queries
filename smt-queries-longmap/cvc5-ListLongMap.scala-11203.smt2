; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130850 () Bool)

(assert start!130850)

(declare-fun b!1534583 () Bool)

(declare-fun res!1051673 () Bool)

(declare-fun e!854541 () Bool)

(assert (=> b!1534583 (=> (not res!1051673) (not e!854541))))

(declare-datatypes ((array!101948 0))(
  ( (array!101949 (arr!49190 (Array (_ BitVec 32) (_ BitVec 64))) (size!49740 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101948)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(assert (=> b!1534583 (= res!1051673 (and (= (size!49740 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49740 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49740 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1534584 () Bool)

(declare-fun res!1051675 () Bool)

(assert (=> b!1534584 (=> (not res!1051675) (not e!854541))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1534584 (= res!1051675 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49740 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49740 a!2792)) (= (select (arr!49190 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1534585 () Bool)

(declare-fun res!1051674 () Bool)

(assert (=> b!1534585 (=> (not res!1051674) (not e!854541))))

(assert (=> b!1534585 (= res!1051674 (not (= (select (arr!49190 a!2792) index!463) (select (arr!49190 a!2792) j!64))))))

(declare-fun b!1534586 () Bool)

(declare-fun e!854542 () Bool)

(assert (=> b!1534586 (= e!854541 e!854542)))

(declare-fun res!1051672 () Bool)

(assert (=> b!1534586 (=> (not res!1051672) (not e!854542))))

(declare-fun lt!663888 () (_ BitVec 32))

(assert (=> b!1534586 (= res!1051672 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!663888 #b00000000000000000000000000000000) (bvslt lt!663888 (size!49740 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1534586 (= lt!663888 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1534587 () Bool)

(declare-fun res!1051676 () Bool)

(assert (=> b!1534587 (=> (not res!1051676) (not e!854541))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1534587 (= res!1051676 (validKeyInArray!0 (select (arr!49190 a!2792) i!951)))))

(declare-fun b!1534588 () Bool)

(declare-fun res!1051669 () Bool)

(assert (=> b!1534588 (=> (not res!1051669) (not e!854541))))

(declare-datatypes ((SeekEntryResult!13322 0))(
  ( (MissingZero!13322 (index!55683 (_ BitVec 32))) (Found!13322 (index!55684 (_ BitVec 32))) (Intermediate!13322 (undefined!14134 Bool) (index!55685 (_ BitVec 32)) (x!137444 (_ BitVec 32))) (Undefined!13322) (MissingVacant!13322 (index!55686 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101948 (_ BitVec 32)) SeekEntryResult!13322)

(assert (=> b!1534588 (= res!1051669 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49190 a!2792) j!64) a!2792 mask!2480) (Found!13322 j!64)))))

(declare-fun b!1534589 () Bool)

(declare-fun res!1051677 () Bool)

(assert (=> b!1534589 (=> (not res!1051677) (not e!854541))))

(declare-datatypes ((List!35664 0))(
  ( (Nil!35661) (Cons!35660 (h!37105 (_ BitVec 64)) (t!50358 List!35664)) )
))
(declare-fun arrayNoDuplicates!0 (array!101948 (_ BitVec 32) List!35664) Bool)

(assert (=> b!1534589 (= res!1051677 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35661))))

(declare-fun res!1051670 () Bool)

(assert (=> start!130850 (=> (not res!1051670) (not e!854541))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130850 (= res!1051670 (validMask!0 mask!2480))))

(assert (=> start!130850 e!854541))

(assert (=> start!130850 true))

(declare-fun array_inv!38218 (array!101948) Bool)

(assert (=> start!130850 (array_inv!38218 a!2792)))

(declare-fun b!1534590 () Bool)

(declare-fun res!1051678 () Bool)

(assert (=> b!1534590 (=> (not res!1051678) (not e!854541))))

(assert (=> b!1534590 (= res!1051678 (validKeyInArray!0 (select (arr!49190 a!2792) j!64)))))

(declare-fun b!1534591 () Bool)

(declare-fun res!1051671 () Bool)

(assert (=> b!1534591 (=> (not res!1051671) (not e!854541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101948 (_ BitVec 32)) Bool)

(assert (=> b!1534591 (= res!1051671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1534592 () Bool)

(assert (=> b!1534592 (= e!854542 false)))

(declare-fun lt!663889 () SeekEntryResult!13322)

(assert (=> b!1534592 (= lt!663889 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!663888 vacantIndex!5 (select (arr!49190 a!2792) j!64) a!2792 mask!2480))))

(assert (= (and start!130850 res!1051670) b!1534583))

(assert (= (and b!1534583 res!1051673) b!1534587))

(assert (= (and b!1534587 res!1051676) b!1534590))

(assert (= (and b!1534590 res!1051678) b!1534591))

(assert (= (and b!1534591 res!1051671) b!1534589))

(assert (= (and b!1534589 res!1051677) b!1534584))

(assert (= (and b!1534584 res!1051675) b!1534588))

(assert (= (and b!1534588 res!1051669) b!1534585))

(assert (= (and b!1534585 res!1051674) b!1534586))

(assert (= (and b!1534586 res!1051672) b!1534592))

(declare-fun m!1417215 () Bool)

(assert (=> b!1534592 m!1417215))

(assert (=> b!1534592 m!1417215))

(declare-fun m!1417217 () Bool)

(assert (=> b!1534592 m!1417217))

(declare-fun m!1417219 () Bool)

(assert (=> start!130850 m!1417219))

(declare-fun m!1417221 () Bool)

(assert (=> start!130850 m!1417221))

(declare-fun m!1417223 () Bool)

(assert (=> b!1534587 m!1417223))

(assert (=> b!1534587 m!1417223))

(declare-fun m!1417225 () Bool)

(assert (=> b!1534587 m!1417225))

(assert (=> b!1534590 m!1417215))

(assert (=> b!1534590 m!1417215))

(declare-fun m!1417227 () Bool)

(assert (=> b!1534590 m!1417227))

(declare-fun m!1417229 () Bool)

(assert (=> b!1534591 m!1417229))

(declare-fun m!1417231 () Bool)

(assert (=> b!1534589 m!1417231))

(declare-fun m!1417233 () Bool)

(assert (=> b!1534586 m!1417233))

(declare-fun m!1417235 () Bool)

(assert (=> b!1534585 m!1417235))

(assert (=> b!1534585 m!1417215))

(declare-fun m!1417237 () Bool)

(assert (=> b!1534584 m!1417237))

(assert (=> b!1534588 m!1417215))

(assert (=> b!1534588 m!1417215))

(declare-fun m!1417239 () Bool)

(assert (=> b!1534588 m!1417239))

(push 1)

