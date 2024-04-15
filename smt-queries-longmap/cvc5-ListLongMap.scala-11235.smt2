; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130996 () Bool)

(assert start!130996)

(declare-fun b!1537278 () Bool)

(declare-fun res!1054548 () Bool)

(declare-fun e!855504 () Bool)

(assert (=> b!1537278 (=> (not res!1054548) (not e!855504))))

(declare-datatypes ((array!102092 0))(
  ( (array!102093 (arr!49263 (Array (_ BitVec 32) (_ BitVec 64))) (size!49815 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102092)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1537278 (= res!1054548 (validKeyInArray!0 (select (arr!49263 a!2792) j!64)))))

(declare-fun res!1054552 () Bool)

(assert (=> start!130996 (=> (not res!1054552) (not e!855504))))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130996 (= res!1054552 (validMask!0 mask!2480))))

(assert (=> start!130996 e!855504))

(assert (=> start!130996 true))

(declare-fun array_inv!38496 (array!102092) Bool)

(assert (=> start!130996 (array_inv!38496 a!2792)))

(declare-fun b!1537279 () Bool)

(declare-fun res!1054551 () Bool)

(assert (=> b!1537279 (=> (not res!1054551) (not e!855504))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102092 (_ BitVec 32)) Bool)

(assert (=> b!1537279 (= res!1054551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1537280 () Bool)

(declare-fun res!1054549 () Bool)

(assert (=> b!1537280 (=> (not res!1054549) (not e!855504))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1537280 (= res!1054549 (validKeyInArray!0 (select (arr!49263 a!2792) i!951)))))

(declare-fun b!1537281 () Bool)

(declare-fun res!1054550 () Bool)

(assert (=> b!1537281 (=> (not res!1054550) (not e!855504))))

(assert (=> b!1537281 (= res!1054550 (and (= (size!49815 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49815 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49815 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1537282 () Bool)

(assert (=> b!1537282 (= e!855504 false)))

(declare-fun lt!664470 () Bool)

(declare-datatypes ((List!35815 0))(
  ( (Nil!35812) (Cons!35811 (h!37257 (_ BitVec 64)) (t!50501 List!35815)) )
))
(declare-fun arrayNoDuplicates!0 (array!102092 (_ BitVec 32) List!35815) Bool)

(assert (=> b!1537282 (= lt!664470 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35812))))

(assert (= (and start!130996 res!1054552) b!1537281))

(assert (= (and b!1537281 res!1054550) b!1537280))

(assert (= (and b!1537280 res!1054549) b!1537278))

(assert (= (and b!1537278 res!1054548) b!1537279))

(assert (= (and b!1537279 res!1054551) b!1537282))

(declare-fun m!1419223 () Bool)

(assert (=> b!1537278 m!1419223))

(assert (=> b!1537278 m!1419223))

(declare-fun m!1419225 () Bool)

(assert (=> b!1537278 m!1419225))

(declare-fun m!1419227 () Bool)

(assert (=> b!1537279 m!1419227))

(declare-fun m!1419229 () Bool)

(assert (=> b!1537280 m!1419229))

(assert (=> b!1537280 m!1419229))

(declare-fun m!1419231 () Bool)

(assert (=> b!1537280 m!1419231))

(declare-fun m!1419233 () Bool)

(assert (=> start!130996 m!1419233))

(declare-fun m!1419235 () Bool)

(assert (=> start!130996 m!1419235))

(declare-fun m!1419237 () Bool)

(assert (=> b!1537282 m!1419237))

(push 1)

(assert (not b!1537282))

(assert (not start!130996))

(assert (not b!1537279))

(assert (not b!1537280))

(assert (not b!1537278))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

