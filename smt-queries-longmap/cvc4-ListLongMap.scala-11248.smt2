; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131160 () Bool)

(assert start!131160)

(declare-fun b!1538658 () Bool)

(declare-fun res!1055637 () Bool)

(declare-fun e!856044 () Bool)

(assert (=> b!1538658 (=> (not res!1055637) (not e!856044))))

(declare-datatypes ((array!102225 0))(
  ( (array!102226 (arr!49327 (Array (_ BitVec 32) (_ BitVec 64))) (size!49877 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102225)

(declare-fun i!951 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1538658 (= res!1055637 (validKeyInArray!0 (select (arr!49327 a!2792) i!951)))))

(declare-fun b!1538659 () Bool)

(declare-fun res!1055641 () Bool)

(assert (=> b!1538659 (=> (not res!1055641) (not e!856044))))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1538659 (= res!1055641 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49877 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49877 a!2792)) (= (select (arr!49327 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1538660 () Bool)

(assert (=> b!1538660 (= e!856044 false)))

(declare-fun lt!664924 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1538660 (= lt!664924 (nextIndex!0 index!463 x!510 mask!2480))))

(declare-fun b!1538661 () Bool)

(declare-fun res!1055640 () Bool)

(assert (=> b!1538661 (=> (not res!1055640) (not e!856044))))

(declare-fun j!64 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13453 0))(
  ( (MissingZero!13453 (index!56207 (_ BitVec 32))) (Found!13453 (index!56208 (_ BitVec 32))) (Intermediate!13453 (undefined!14265 Bool) (index!56209 (_ BitVec 32)) (x!137938 (_ BitVec 32))) (Undefined!13453) (MissingVacant!13453 (index!56210 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102225 (_ BitVec 32)) SeekEntryResult!13453)

(assert (=> b!1538661 (= res!1055640 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49327 a!2792) j!64) a!2792 mask!2480) (Found!13453 j!64)))))

(declare-fun b!1538662 () Bool)

(declare-fun res!1055643 () Bool)

(assert (=> b!1538662 (=> (not res!1055643) (not e!856044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102225 (_ BitVec 32)) Bool)

(assert (=> b!1538662 (= res!1055643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1538663 () Bool)

(declare-fun res!1055638 () Bool)

(assert (=> b!1538663 (=> (not res!1055638) (not e!856044))))

(declare-datatypes ((List!35801 0))(
  ( (Nil!35798) (Cons!35797 (h!37242 (_ BitVec 64)) (t!50495 List!35801)) )
))
(declare-fun arrayNoDuplicates!0 (array!102225 (_ BitVec 32) List!35801) Bool)

(assert (=> b!1538663 (= res!1055638 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35798))))

(declare-fun b!1538665 () Bool)

(declare-fun res!1055636 () Bool)

(assert (=> b!1538665 (=> (not res!1055636) (not e!856044))))

(assert (=> b!1538665 (= res!1055636 (not (= (select (arr!49327 a!2792) index!463) (select (arr!49327 a!2792) j!64))))))

(declare-fun b!1538666 () Bool)

(declare-fun res!1055639 () Bool)

(assert (=> b!1538666 (=> (not res!1055639) (not e!856044))))

(assert (=> b!1538666 (= res!1055639 (validKeyInArray!0 (select (arr!49327 a!2792) j!64)))))

(declare-fun res!1055644 () Bool)

(assert (=> start!131160 (=> (not res!1055644) (not e!856044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131160 (= res!1055644 (validMask!0 mask!2480))))

(assert (=> start!131160 e!856044))

(assert (=> start!131160 true))

(declare-fun array_inv!38355 (array!102225) Bool)

(assert (=> start!131160 (array_inv!38355 a!2792)))

(declare-fun b!1538664 () Bool)

(declare-fun res!1055642 () Bool)

(assert (=> b!1538664 (=> (not res!1055642) (not e!856044))))

(assert (=> b!1538664 (= res!1055642 (and (= (size!49877 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49877 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49877 a!2792)) (not (= i!951 j!64))))))

(assert (= (and start!131160 res!1055644) b!1538664))

(assert (= (and b!1538664 res!1055642) b!1538658))

(assert (= (and b!1538658 res!1055637) b!1538666))

(assert (= (and b!1538666 res!1055639) b!1538662))

(assert (= (and b!1538662 res!1055643) b!1538663))

(assert (= (and b!1538663 res!1055638) b!1538659))

(assert (= (and b!1538659 res!1055641) b!1538661))

(assert (= (and b!1538661 res!1055640) b!1538665))

(assert (= (and b!1538665 res!1055636) b!1538660))

(declare-fun m!1421067 () Bool)

(assert (=> b!1538660 m!1421067))

(declare-fun m!1421069 () Bool)

(assert (=> b!1538661 m!1421069))

(assert (=> b!1538661 m!1421069))

(declare-fun m!1421071 () Bool)

(assert (=> b!1538661 m!1421071))

(assert (=> b!1538666 m!1421069))

(assert (=> b!1538666 m!1421069))

(declare-fun m!1421073 () Bool)

(assert (=> b!1538666 m!1421073))

(declare-fun m!1421075 () Bool)

(assert (=> b!1538659 m!1421075))

(declare-fun m!1421077 () Bool)

(assert (=> b!1538665 m!1421077))

(assert (=> b!1538665 m!1421069))

(declare-fun m!1421079 () Bool)

(assert (=> b!1538658 m!1421079))

(assert (=> b!1538658 m!1421079))

(declare-fun m!1421081 () Bool)

(assert (=> b!1538658 m!1421081))

(declare-fun m!1421083 () Bool)

(assert (=> b!1538662 m!1421083))

(declare-fun m!1421085 () Bool)

(assert (=> start!131160 m!1421085))

(declare-fun m!1421087 () Bool)

(assert (=> start!131160 m!1421087))

(declare-fun m!1421089 () Bool)

(assert (=> b!1538663 m!1421089))

(push 1)

(assert (not b!1538662))

(assert (not b!1538658))

(assert (not b!1538666))

(assert (not b!1538661))

(assert (not b!1538663))

(assert (not b!1538660))

(assert (not start!131160))

(check-sat)

(pop 1)

(push 1)

(check-sat)

