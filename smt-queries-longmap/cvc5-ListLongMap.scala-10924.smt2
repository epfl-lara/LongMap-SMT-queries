; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128112 () Bool)

(assert start!128112)

(declare-fun b!1503826 () Bool)

(declare-fun res!1023722 () Bool)

(declare-fun e!841272 () Bool)

(assert (=> b!1503826 (=> (not res!1023722) (not e!841272))))

(declare-datatypes ((array!100307 0))(
  ( (array!100308 (arr!48408 (Array (_ BitVec 32) (_ BitVec 64))) (size!48959 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100307)

(declare-datatypes ((List!34887 0))(
  ( (Nil!34884) (Cons!34883 (h!36295 (_ BitVec 64)) (t!49573 List!34887)) )
))
(declare-fun arrayNoDuplicates!0 (array!100307 (_ BitVec 32) List!34887) Bool)

(assert (=> b!1503826 (= res!1023722 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34884))))

(declare-fun b!1503827 () Bool)

(declare-fun res!1023725 () Bool)

(assert (=> b!1503827 (=> (not res!1023725) (not e!841272))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100307 (_ BitVec 32)) Bool)

(assert (=> b!1503827 (= res!1023725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503829 () Bool)

(declare-fun res!1023719 () Bool)

(assert (=> b!1503829 (=> (not res!1023719) (not e!841272))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503829 (= res!1023719 (validKeyInArray!0 (select (arr!48408 a!2850) i!996)))))

(declare-fun b!1503830 () Bool)

(declare-fun res!1023721 () Bool)

(assert (=> b!1503830 (=> (not res!1023721) (not e!841272))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503830 (= res!1023721 (and (= (size!48959 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48959 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48959 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503831 () Bool)

(declare-fun res!1023723 () Bool)

(assert (=> b!1503831 (=> (not res!1023723) (not e!841272))))

(assert (=> b!1503831 (= res!1023723 (validKeyInArray!0 (select (arr!48408 a!2850) j!87)))))

(declare-fun b!1503832 () Bool)

(assert (=> b!1503832 (= e!841272 false)))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12499 0))(
  ( (MissingZero!12499 (index!52388 (_ BitVec 32))) (Found!12499 (index!52389 (_ BitVec 32))) (Intermediate!12499 (undefined!13311 Bool) (index!52390 (_ BitVec 32)) (x!134274 (_ BitVec 32))) (Undefined!12499) (MissingVacant!12499 (index!52391 (_ BitVec 32))) )
))
(declare-fun lt!653964 () SeekEntryResult!12499)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100307 (_ BitVec 32)) SeekEntryResult!12499)

(assert (=> b!1503832 (= lt!653964 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48408 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1503828 () Bool)

(declare-fun res!1023724 () Bool)

(assert (=> b!1503828 (=> (not res!1023724) (not e!841272))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1503828 (= res!1023724 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48959 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48959 a!2850)) (= (select (arr!48408 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48408 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48959 a!2850))))))

(declare-fun res!1023720 () Bool)

(assert (=> start!128112 (=> (not res!1023720) (not e!841272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128112 (= res!1023720 (validMask!0 mask!2661))))

(assert (=> start!128112 e!841272))

(assert (=> start!128112 true))

(declare-fun array_inv!37689 (array!100307) Bool)

(assert (=> start!128112 (array_inv!37689 a!2850)))

(assert (= (and start!128112 res!1023720) b!1503830))

(assert (= (and b!1503830 res!1023721) b!1503829))

(assert (= (and b!1503829 res!1023719) b!1503831))

(assert (= (and b!1503831 res!1023723) b!1503827))

(assert (= (and b!1503827 res!1023725) b!1503826))

(assert (= (and b!1503826 res!1023722) b!1503828))

(assert (= (and b!1503828 res!1023724) b!1503832))

(declare-fun m!1387063 () Bool)

(assert (=> b!1503831 m!1387063))

(assert (=> b!1503831 m!1387063))

(declare-fun m!1387065 () Bool)

(assert (=> b!1503831 m!1387065))

(assert (=> b!1503832 m!1387063))

(assert (=> b!1503832 m!1387063))

(declare-fun m!1387067 () Bool)

(assert (=> b!1503832 m!1387067))

(declare-fun m!1387069 () Bool)

(assert (=> start!128112 m!1387069))

(declare-fun m!1387071 () Bool)

(assert (=> start!128112 m!1387071))

(declare-fun m!1387073 () Bool)

(assert (=> b!1503827 m!1387073))

(declare-fun m!1387075 () Bool)

(assert (=> b!1503829 m!1387075))

(assert (=> b!1503829 m!1387075))

(declare-fun m!1387077 () Bool)

(assert (=> b!1503829 m!1387077))

(declare-fun m!1387079 () Bool)

(assert (=> b!1503828 m!1387079))

(declare-fun m!1387081 () Bool)

(assert (=> b!1503828 m!1387081))

(declare-fun m!1387083 () Bool)

(assert (=> b!1503828 m!1387083))

(declare-fun m!1387085 () Bool)

(assert (=> b!1503826 m!1387085))

(push 1)

(assert (not b!1503832))

(assert (not b!1503826))

(assert (not b!1503829))

(assert (not b!1503831))

(assert (not b!1503827))

(assert (not start!128112))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

