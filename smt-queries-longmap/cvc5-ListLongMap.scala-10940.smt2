; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!128280 () Bool)

(assert start!128280)

(declare-fun b!1505303 () Bool)

(declare-fun res!1025008 () Bool)

(declare-fun e!841754 () Bool)

(assert (=> b!1505303 (=> (not res!1025008) (not e!841754))))

(declare-datatypes ((array!100409 0))(
  ( (array!100410 (arr!48456 (Array (_ BitVec 32) (_ BitVec 64))) (size!49007 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100409)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505303 (= res!1025008 (validKeyInArray!0 (select (arr!48456 a!2850) j!87)))))

(declare-fun b!1505304 () Bool)

(declare-fun res!1025009 () Bool)

(assert (=> b!1505304 (=> (not res!1025009) (not e!841754))))

(declare-fun index!625 () (_ BitVec 32))

(assert (=> b!1505304 (= res!1025009 (not (= (select (arr!48456 a!2850) index!625) (select (arr!48456 a!2850) j!87))))))

(declare-fun b!1505305 () Bool)

(assert (=> b!1505305 (= e!841754 false)))

(declare-fun lt!654193 () (_ BitVec 32))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1505305 (= lt!654193 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1505306 () Bool)

(declare-fun res!1025005 () Bool)

(assert (=> b!1505306 (=> (not res!1025005) (not e!841754))))

(declare-datatypes ((List!34935 0))(
  ( (Nil!34932) (Cons!34931 (h!36343 (_ BitVec 64)) (t!49621 List!34935)) )
))
(declare-fun arrayNoDuplicates!0 (array!100409 (_ BitVec 32) List!34935) Bool)

(assert (=> b!1505306 (= res!1025005 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34932))))

(declare-fun b!1505307 () Bool)

(declare-fun res!1025012 () Bool)

(assert (=> b!1505307 (=> (not res!1025012) (not e!841754))))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12547 0))(
  ( (MissingZero!12547 (index!52580 (_ BitVec 32))) (Found!12547 (index!52581 (_ BitVec 32))) (Intermediate!12547 (undefined!13359 Bool) (index!52582 (_ BitVec 32)) (x!134456 (_ BitVec 32))) (Undefined!12547) (MissingVacant!12547 (index!52583 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100409 (_ BitVec 32)) SeekEntryResult!12547)

(assert (=> b!1505307 (= res!1025012 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48456 a!2850) j!87) a!2850 mask!2661) (Found!12547 j!87)))))

(declare-fun b!1505309 () Bool)

(declare-fun res!1025011 () Bool)

(assert (=> b!1505309 (=> (not res!1025011) (not e!841754))))

(declare-fun i!996 () (_ BitVec 32))

(assert (=> b!1505309 (= res!1025011 (validKeyInArray!0 (select (arr!48456 a!2850) i!996)))))

(declare-fun b!1505310 () Bool)

(declare-fun res!1025004 () Bool)

(assert (=> b!1505310 (=> (not res!1025004) (not e!841754))))

(assert (=> b!1505310 (= res!1025004 (and (= (size!49007 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!49007 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!49007 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1505311 () Bool)

(declare-fun res!1025006 () Bool)

(assert (=> b!1505311 (=> (not res!1025006) (not e!841754))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100409 (_ BitVec 32)) Bool)

(assert (=> b!1505311 (= res!1025006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1505308 () Bool)

(declare-fun res!1025010 () Bool)

(assert (=> b!1505308 (=> (not res!1025010) (not e!841754))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1505308 (= res!1025010 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!49007 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!49007 a!2850)) (= (select (arr!48456 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48456 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!49007 a!2850))))))

(declare-fun res!1025007 () Bool)

(assert (=> start!128280 (=> (not res!1025007) (not e!841754))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128280 (= res!1025007 (validMask!0 mask!2661))))

(assert (=> start!128280 e!841754))

(assert (=> start!128280 true))

(declare-fun array_inv!37737 (array!100409) Bool)

(assert (=> start!128280 (array_inv!37737 a!2850)))

(assert (= (and start!128280 res!1025007) b!1505310))

(assert (= (and b!1505310 res!1025004) b!1505309))

(assert (= (and b!1505309 res!1025011) b!1505303))

(assert (= (and b!1505303 res!1025008) b!1505311))

(assert (= (and b!1505311 res!1025006) b!1505306))

(assert (= (and b!1505306 res!1025005) b!1505308))

(assert (= (and b!1505308 res!1025010) b!1505307))

(assert (= (and b!1505307 res!1025012) b!1505304))

(assert (= (and b!1505304 res!1025009) b!1505305))

(declare-fun m!1388495 () Bool)

(assert (=> start!128280 m!1388495))

(declare-fun m!1388497 () Bool)

(assert (=> start!128280 m!1388497))

(declare-fun m!1388499 () Bool)

(assert (=> b!1505305 m!1388499))

(declare-fun m!1388501 () Bool)

(assert (=> b!1505304 m!1388501))

(declare-fun m!1388503 () Bool)

(assert (=> b!1505304 m!1388503))

(declare-fun m!1388505 () Bool)

(assert (=> b!1505306 m!1388505))

(declare-fun m!1388507 () Bool)

(assert (=> b!1505311 m!1388507))

(declare-fun m!1388509 () Bool)

(assert (=> b!1505309 m!1388509))

(assert (=> b!1505309 m!1388509))

(declare-fun m!1388511 () Bool)

(assert (=> b!1505309 m!1388511))

(assert (=> b!1505307 m!1388503))

(assert (=> b!1505307 m!1388503))

(declare-fun m!1388513 () Bool)

(assert (=> b!1505307 m!1388513))

(declare-fun m!1388515 () Bool)

(assert (=> b!1505308 m!1388515))

(declare-fun m!1388517 () Bool)

(assert (=> b!1505308 m!1388517))

(declare-fun m!1388519 () Bool)

(assert (=> b!1505308 m!1388519))

(assert (=> b!1505303 m!1388503))

(assert (=> b!1505303 m!1388503))

(declare-fun m!1388521 () Bool)

(assert (=> b!1505303 m!1388521))

(push 1)

(assert (not b!1505307))

(assert (not b!1505303))

(assert (not b!1505306))

(assert (not start!128280))

(assert (not b!1505309))

(assert (not b!1505305))

(assert (not b!1505311))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

