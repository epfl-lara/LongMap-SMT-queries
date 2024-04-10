; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131052 () Bool)

(assert start!131052)

(declare-fun b!1537652 () Bool)

(declare-fun res!1054743 () Bool)

(declare-fun e!855720 () Bool)

(assert (=> b!1537652 (=> (not res!1054743) (not e!855720))))

(declare-datatypes ((array!102150 0))(
  ( (array!102151 (arr!49291 (Array (_ BitVec 32) (_ BitVec 64))) (size!49841 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102150)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102150 (_ BitVec 32)) Bool)

(assert (=> b!1537652 (= res!1054743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537653 () Bool)

(assert (=> b!1537653 (= e!855720 false)))

(declare-fun x!510 () (_ BitVec 32))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13417 0))(
  ( (MissingZero!13417 (index!56063 (_ BitVec 32))) (Found!13417 (index!56064 (_ BitVec 32))) (Intermediate!13417 (undefined!14229 Bool) (index!56065 (_ BitVec 32)) (x!137803 (_ BitVec 32))) (Undefined!13417) (MissingVacant!13417 (index!56066 (_ BitVec 32))) )
))
(declare-fun lt!664765 () SeekEntryResult!13417)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102150 (_ BitVec 32)) SeekEntryResult!13417)

(assert (=> b!1537653 (= lt!664765 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49291 a!2792) j!64) a!2792 mask!2480))))

(declare-fun res!1054738 () Bool)

(assert (=> start!131052 (=> (not res!1054738) (not e!855720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131052 (= res!1054738 (validMask!0 mask!2480))))

(assert (=> start!131052 e!855720))

(assert (=> start!131052 true))

(declare-fun array_inv!38319 (array!102150) Bool)

(assert (=> start!131052 (array_inv!38319 a!2792)))

(declare-fun b!1537654 () Bool)

(declare-fun res!1054742 () Bool)

(assert (=> b!1537654 (=> (not res!1054742) (not e!855720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537654 (= res!1054742 (validKeyInArray!0 (select (arr!49291 a!2792) j!64)))))

(declare-fun b!1537655 () Bool)

(declare-fun res!1054741 () Bool)

(assert (=> b!1537655 (=> (not res!1054741) (not e!855720))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537655 (= res!1054741 (validKeyInArray!0 (select (arr!49291 a!2792) i!951)))))

(declare-fun b!1537656 () Bool)

(declare-fun res!1054740 () Bool)

(assert (=> b!1537656 (=> (not res!1054740) (not e!855720))))

(assert (=> b!1537656 (= res!1054740 (and (= (size!49841 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49841 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49841 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537657 () Bool)

(declare-fun res!1054744 () Bool)

(assert (=> b!1537657 (=> (not res!1054744) (not e!855720))))

(assert (=> b!1537657 (= res!1054744 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49841 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49841 a!2792)) (= (select (arr!49291 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1537658 () Bool)

(declare-fun res!1054739 () Bool)

(assert (=> b!1537658 (=> (not res!1054739) (not e!855720))))

(declare-datatypes ((List!35765 0))(
  ( (Nil!35762) (Cons!35761 (h!37206 (_ BitVec 64)) (t!50459 List!35765)) )
))
(declare-fun arrayNoDuplicates!0 (array!102150 (_ BitVec 32) List!35765) Bool)

(assert (=> b!1537658 (= res!1054739 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35762))))

(assert (= (and start!131052 res!1054738) b!1537656))

(assert (= (and b!1537656 res!1054740) b!1537655))

(assert (= (and b!1537655 res!1054741) b!1537654))

(assert (= (and b!1537654 res!1054742) b!1537652))

(assert (= (and b!1537652 res!1054743) b!1537658))

(assert (= (and b!1537658 res!1054739) b!1537657))

(assert (= (and b!1537657 res!1054744) b!1537653))

(declare-fun m!1420171 () Bool)

(assert (=> b!1537654 m!1420171))

(assert (=> b!1537654 m!1420171))

(declare-fun m!1420173 () Bool)

(assert (=> b!1537654 m!1420173))

(declare-fun m!1420175 () Bool)

(assert (=> b!1537657 m!1420175))

(declare-fun m!1420177 () Bool)

(assert (=> b!1537652 m!1420177))

(declare-fun m!1420179 () Bool)

(assert (=> b!1537655 m!1420179))

(assert (=> b!1537655 m!1420179))

(declare-fun m!1420181 () Bool)

(assert (=> b!1537655 m!1420181))

(declare-fun m!1420183 () Bool)

(assert (=> b!1537658 m!1420183))

(assert (=> b!1537653 m!1420171))

(assert (=> b!1537653 m!1420171))

(declare-fun m!1420185 () Bool)

(assert (=> b!1537653 m!1420185))

(declare-fun m!1420187 () Bool)

(assert (=> start!131052 m!1420187))

(declare-fun m!1420189 () Bool)

(assert (=> start!131052 m!1420189))

(push 1)

(assert (not b!1537658))

(assert (not b!1537653))

(assert (not b!1537652))

(assert (not b!1537654))

(assert (not b!1537655))

(assert (not start!131052))

(check-sat)

(pop 1)

(push 1)

(check-sat)

