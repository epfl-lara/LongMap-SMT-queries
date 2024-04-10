; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131046 () Bool)

(assert start!131046)

(declare-fun res!1054677 () Bool)

(declare-fun e!855703 () Bool)

(assert (=> start!131046 (=> (not res!1054677) (not e!855703))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131046 (= res!1054677 (validMask!0 mask!2480))))

(assert (=> start!131046 e!855703))

(assert (=> start!131046 true))

(declare-datatypes ((array!102144 0))(
  ( (array!102145 (arr!49288 (Array (_ BitVec 32) (_ BitVec 64))) (size!49838 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102144)

(declare-fun array_inv!38316 (array!102144) Bool)

(assert (=> start!131046 (array_inv!38316 a!2792)))

(declare-fun b!1537591 () Bool)

(declare-fun res!1054678 () Bool)

(assert (=> b!1537591 (=> (not res!1054678) (not e!855703))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537591 (= res!1054678 (validKeyInArray!0 (select (arr!49288 a!2792) j!64)))))

(declare-fun b!1537592 () Bool)

(declare-fun res!1054680 () Bool)

(assert (=> b!1537592 (=> (not res!1054680) (not e!855703))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537592 (= res!1054680 (and (= (size!49838 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49838 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49838 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537593 () Bool)

(declare-fun res!1054679 () Bool)

(assert (=> b!1537593 (=> (not res!1054679) (not e!855703))))

(assert (=> b!1537593 (= res!1054679 (validKeyInArray!0 (select (arr!49288 a!2792) i!951)))))

(declare-fun b!1537594 () Bool)

(declare-fun res!1054681 () Bool)

(assert (=> b!1537594 (=> (not res!1054681) (not e!855703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102144 (_ BitVec 32)) Bool)

(assert (=> b!1537594 (= res!1054681 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537595 () Bool)

(assert (=> b!1537595 (= e!855703 false)))

(declare-fun lt!664756 () Bool)

(declare-datatypes ((List!35762 0))(
  ( (Nil!35759) (Cons!35758 (h!37203 (_ BitVec 64)) (t!50456 List!35762)) )
))
(declare-fun arrayNoDuplicates!0 (array!102144 (_ BitVec 32) List!35762) Bool)

(assert (=> b!1537595 (= lt!664756 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35759))))

(assert (= (and start!131046 res!1054677) b!1537592))

(assert (= (and b!1537592 res!1054680) b!1537593))

(assert (= (and b!1537593 res!1054679) b!1537591))

(assert (= (and b!1537591 res!1054678) b!1537594))

(assert (= (and b!1537594 res!1054681) b!1537595))

(declare-fun m!1420115 () Bool)

(assert (=> b!1537595 m!1420115))

(declare-fun m!1420117 () Bool)

(assert (=> b!1537593 m!1420117))

(assert (=> b!1537593 m!1420117))

(declare-fun m!1420119 () Bool)

(assert (=> b!1537593 m!1420119))

(declare-fun m!1420121 () Bool)

(assert (=> b!1537594 m!1420121))

(declare-fun m!1420123 () Bool)

(assert (=> b!1537591 m!1420123))

(assert (=> b!1537591 m!1420123))

(declare-fun m!1420125 () Bool)

(assert (=> b!1537591 m!1420125))

(declare-fun m!1420127 () Bool)

(assert (=> start!131046 m!1420127))

(declare-fun m!1420129 () Bool)

(assert (=> start!131046 m!1420129))

(push 1)

(assert (not b!1537591))

(assert (not b!1537595))

(assert (not b!1537594))

(assert (not start!131046))

(assert (not b!1537593))

(check-sat)

(pop 1)

(push 1)

(check-sat)

