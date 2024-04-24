; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128100 () Bool)

(assert start!128100)

(declare-fun b!1503720 () Bool)

(declare-fun res!1023616 () Bool)

(declare-fun e!841235 () Bool)

(assert (=> b!1503720 (=> (not res!1023616) (not e!841235))))

(declare-datatypes ((array!100295 0))(
  ( (array!100296 (arr!48402 (Array (_ BitVec 32) (_ BitVec 64))) (size!48953 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100295)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100295 (_ BitVec 32)) Bool)

(assert (=> b!1503720 (= res!1023616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503721 () Bool)

(declare-fun res!1023613 () Bool)

(assert (=> b!1503721 (=> (not res!1023613) (not e!841235))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503721 (= res!1023613 (validKeyInArray!0 (select (arr!48402 a!2850) i!996)))))

(declare-fun b!1503722 () Bool)

(declare-fun res!1023614 () Bool)

(assert (=> b!1503722 (=> (not res!1023614) (not e!841235))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503722 (= res!1023614 (and (= (size!48953 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48953 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48953 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503723 () Bool)

(declare-fun res!1023617 () Bool)

(assert (=> b!1503723 (=> (not res!1023617) (not e!841235))))

(assert (=> b!1503723 (= res!1023617 (validKeyInArray!0 (select (arr!48402 a!2850) j!87)))))

(declare-fun res!1023615 () Bool)

(assert (=> start!128100 (=> (not res!1023615) (not e!841235))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128100 (= res!1023615 (validMask!0 mask!2661))))

(assert (=> start!128100 e!841235))

(assert (=> start!128100 true))

(declare-fun array_inv!37683 (array!100295) Bool)

(assert (=> start!128100 (array_inv!37683 a!2850)))

(declare-fun b!1503724 () Bool)

(assert (=> b!1503724 (= e!841235 false)))

(declare-fun lt!653946 () Bool)

(declare-datatypes ((List!34881 0))(
  ( (Nil!34878) (Cons!34877 (h!36289 (_ BitVec 64)) (t!49567 List!34881)) )
))
(declare-fun arrayNoDuplicates!0 (array!100295 (_ BitVec 32) List!34881) Bool)

(assert (=> b!1503724 (= lt!653946 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34878))))

(assert (= (and start!128100 res!1023615) b!1503722))

(assert (= (and b!1503722 res!1023614) b!1503721))

(assert (= (and b!1503721 res!1023613) b!1503723))

(assert (= (and b!1503723 res!1023617) b!1503720))

(assert (= (and b!1503720 res!1023616) b!1503724))

(declare-fun m!1386951 () Bool)

(assert (=> b!1503723 m!1386951))

(assert (=> b!1503723 m!1386951))

(declare-fun m!1386953 () Bool)

(assert (=> b!1503723 m!1386953))

(declare-fun m!1386955 () Bool)

(assert (=> b!1503721 m!1386955))

(assert (=> b!1503721 m!1386955))

(declare-fun m!1386957 () Bool)

(assert (=> b!1503721 m!1386957))

(declare-fun m!1386959 () Bool)

(assert (=> b!1503720 m!1386959))

(declare-fun m!1386961 () Bool)

(assert (=> start!128100 m!1386961))

(declare-fun m!1386963 () Bool)

(assert (=> start!128100 m!1386963))

(declare-fun m!1386965 () Bool)

(assert (=> b!1503724 m!1386965))

(push 1)

(assert (not b!1503720))

(assert (not b!1503724))

(assert (not start!128100))

(assert (not b!1503721))

(assert (not b!1503723))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

