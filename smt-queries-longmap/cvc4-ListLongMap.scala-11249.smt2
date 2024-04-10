; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131166 () Bool)

(assert start!131166)

(declare-fun b!1538739 () Bool)

(declare-fun res!1055718 () Bool)

(declare-fun e!856062 () Bool)

(assert (=> b!1538739 (=> (not res!1055718) (not e!856062))))

(declare-datatypes ((array!102231 0))(
  ( (array!102232 (arr!49330 (Array (_ BitVec 32) (_ BitVec 64))) (size!49880 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102231)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1538739 (= res!1055718 (and (= (size!49880 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49880 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49880 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1538741 () Bool)

(declare-fun res!1055720 () Bool)

(assert (=> b!1538741 (=> (not res!1055720) (not e!856062))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538741 (= res!1055720 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49880 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49880 a!2792)) (= (select (arr!49330 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538742 () Bool)

(declare-fun res!1055725 () Bool)

(assert (=> b!1538742 (=> (not res!1055725) (not e!856062))))

(declare-datatypes ((SeekEntryResult!13456 0))(
  ( (MissingZero!13456 (index!56219 (_ BitVec 32))) (Found!13456 (index!56220 (_ BitVec 32))) (Intermediate!13456 (undefined!14268 Bool) (index!56221 (_ BitVec 32)) (x!137949 (_ BitVec 32))) (Undefined!13456) (MissingVacant!13456 (index!56222 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102231 (_ BitVec 32)) SeekEntryResult!13456)

(assert (=> b!1538742 (= res!1055725 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49330 a!2792) j!64) a!2792 mask!2480) (Found!13456 j!64)))))

(declare-fun b!1538743 () Bool)

(declare-fun res!1055723 () Bool)

(assert (=> b!1538743 (=> (not res!1055723) (not e!856062))))

(declare-datatypes ((List!35804 0))(
  ( (Nil!35801) (Cons!35800 (h!37245 (_ BitVec 64)) (t!50498 List!35804)) )
))
(declare-fun arrayNoDuplicates!0 (array!102231 (_ BitVec 32) List!35804) Bool)

(assert (=> b!1538743 (= res!1055723 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35801))))

(declare-fun b!1538744 () Bool)

(assert (=> b!1538744 (= e!856062 false)))

(declare-fun lt!664933 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538744 (= lt!664933 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538745 () Bool)

(declare-fun res!1055724 () Bool)

(assert (=> b!1538745 (=> (not res!1055724) (not e!856062))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102231 (_ BitVec 32)) Bool)

(assert (=> b!1538745 (= res!1055724 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538740 () Bool)

(declare-fun res!1055721 () Bool)

(assert (=> b!1538740 (=> (not res!1055721) (not e!856062))))

(assert (=> b!1538740 (= res!1055721 (not (= (select (arr!49330 a!2792) index!463) (select (arr!49330 a!2792) j!64))))))

(declare-fun res!1055722 () Bool)

(assert (=> start!131166 (=> (not res!1055722) (not e!856062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131166 (= res!1055722 (validMask!0 mask!2480))))

(assert (=> start!131166 e!856062))

(assert (=> start!131166 true))

(declare-fun array_inv!38358 (array!102231) Bool)

(assert (=> start!131166 (array_inv!38358 a!2792)))

(declare-fun b!1538746 () Bool)

(declare-fun res!1055717 () Bool)

(assert (=> b!1538746 (=> (not res!1055717) (not e!856062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538746 (= res!1055717 (validKeyInArray!0 (select (arr!49330 a!2792) j!64)))))

(declare-fun b!1538747 () Bool)

(declare-fun res!1055719 () Bool)

(assert (=> b!1538747 (=> (not res!1055719) (not e!856062))))

(assert (=> b!1538747 (= res!1055719 (validKeyInArray!0 (select (arr!49330 a!2792) i!951)))))

(assert (= (and start!131166 res!1055722) b!1538739))

(assert (= (and b!1538739 res!1055718) b!1538747))

(assert (= (and b!1538747 res!1055719) b!1538746))

(assert (= (and b!1538746 res!1055717) b!1538745))

(assert (= (and b!1538745 res!1055724) b!1538743))

(assert (= (and b!1538743 res!1055723) b!1538741))

(assert (= (and b!1538741 res!1055720) b!1538742))

(assert (= (and b!1538742 res!1055725) b!1538740))

(assert (= (and b!1538740 res!1055721) b!1538744))

(declare-fun m!1421139 () Bool)

(assert (=> b!1538743 m!1421139))

(declare-fun m!1421141 () Bool)

(assert (=> b!1538745 m!1421141))

(declare-fun m!1421143 () Bool)

(assert (=> b!1538742 m!1421143))

(assert (=> b!1538742 m!1421143))

(declare-fun m!1421145 () Bool)

(assert (=> b!1538742 m!1421145))

(declare-fun m!1421147 () Bool)

(assert (=> b!1538744 m!1421147))

(declare-fun m!1421149 () Bool)

(assert (=> b!1538747 m!1421149))

(assert (=> b!1538747 m!1421149))

(declare-fun m!1421151 () Bool)

(assert (=> b!1538747 m!1421151))

(declare-fun m!1421153 () Bool)

(assert (=> b!1538741 m!1421153))

(declare-fun m!1421155 () Bool)

(assert (=> b!1538740 m!1421155))

(assert (=> b!1538740 m!1421143))

(assert (=> b!1538746 m!1421143))

(assert (=> b!1538746 m!1421143))

(declare-fun m!1421157 () Bool)

(assert (=> b!1538746 m!1421157))

(declare-fun m!1421159 () Bool)

(assert (=> start!131166 m!1421159))

(declare-fun m!1421161 () Bool)

(assert (=> start!131166 m!1421161))

(push 1)

(assert (not b!1538746))

(assert (not start!131166))

(assert (not b!1538744))

(assert (not b!1538745))

(assert (not b!1538742))

(assert (not b!1538747))

(assert (not b!1538743))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

