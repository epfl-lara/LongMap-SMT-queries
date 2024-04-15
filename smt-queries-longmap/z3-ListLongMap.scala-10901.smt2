; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127622 () Bool)

(assert start!127622)

(declare-fun b!1499665 () Bool)

(declare-fun res!1020930 () Bool)

(declare-fun e!839257 () Bool)

(assert (=> b!1499665 (=> (not res!1020930) (not e!839257))))

(declare-datatypes ((array!99997 0))(
  ( (array!99998 (arr!48259 (Array (_ BitVec 32) (_ BitVec 64))) (size!48811 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99997)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99997 (_ BitVec 32)) Bool)

(assert (=> b!1499665 (= res!1020930 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1499666 () Bool)

(declare-fun res!1020938 () Bool)

(assert (=> b!1499666 (=> (not res!1020938) (not e!839257))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1499666 (= res!1020938 (validKeyInArray!0 (select (arr!48259 a!2850) i!996)))))

(declare-fun res!1020934 () Bool)

(assert (=> start!127622 (=> (not res!1020934) (not e!839257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127622 (= res!1020934 (validMask!0 mask!2661))))

(assert (=> start!127622 e!839257))

(assert (=> start!127622 true))

(declare-fun array_inv!37492 (array!99997) Bool)

(assert (=> start!127622 (array_inv!37492 a!2850)))

(declare-fun b!1499667 () Bool)

(declare-fun res!1020936 () Bool)

(assert (=> b!1499667 (=> (not res!1020936) (not e!839257))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12490 0))(
  ( (MissingZero!12490 (index!52352 (_ BitVec 32))) (Found!12490 (index!52353 (_ BitVec 32))) (Intermediate!12490 (undefined!13302 Bool) (index!52354 (_ BitVec 32)) (x!134039 (_ BitVec 32))) (Undefined!12490) (MissingVacant!12490 (index!52355 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99997 (_ BitVec 32)) SeekEntryResult!12490)

(assert (=> b!1499667 (= res!1020936 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48259 a!2850) j!87) a!2850 mask!2661) (Found!12490 j!87)))))

(declare-fun b!1499668 () Bool)

(declare-fun e!839259 () Bool)

(assert (=> b!1499668 (= e!839257 e!839259)))

(declare-fun res!1020935 () Bool)

(assert (=> b!1499668 (=> (not res!1020935) (not e!839259))))

(declare-fun lt!652566 () (_ BitVec 32))

(assert (=> b!1499668 (= res!1020935 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!652566 #b00000000000000000000000000000000) (bvslt lt!652566 (size!48811 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1499668 (= lt!652566 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1499669 () Bool)

(declare-fun res!1020937 () Bool)

(assert (=> b!1499669 (=> (not res!1020937) (not e!839257))))

(assert (=> b!1499669 (= res!1020937 (and (= (size!48811 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48811 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48811 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1499670 () Bool)

(declare-fun res!1020929 () Bool)

(assert (=> b!1499670 (=> (not res!1020929) (not e!839257))))

(assert (=> b!1499670 (= res!1020929 (validKeyInArray!0 (select (arr!48259 a!2850) j!87)))))

(declare-fun b!1499671 () Bool)

(declare-fun res!1020931 () Bool)

(assert (=> b!1499671 (=> (not res!1020931) (not e!839257))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1499671 (= res!1020931 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48811 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48811 a!2850)) (= (select (arr!48259 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48259 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48811 a!2850))))))

(declare-fun b!1499672 () Bool)

(declare-fun res!1020933 () Bool)

(assert (=> b!1499672 (=> (not res!1020933) (not e!839257))))

(assert (=> b!1499672 (= res!1020933 (not (= (select (arr!48259 a!2850) index!625) (select (arr!48259 a!2850) j!87))))))

(declare-fun b!1499673 () Bool)

(assert (=> b!1499673 (= e!839259 false)))

(declare-fun lt!652567 () SeekEntryResult!12490)

(assert (=> b!1499673 (= lt!652567 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!652566 vacantBefore!10 (select (arr!48259 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1499674 () Bool)

(declare-fun res!1020932 () Bool)

(assert (=> b!1499674 (=> (not res!1020932) (not e!839257))))

(declare-datatypes ((List!34829 0))(
  ( (Nil!34826) (Cons!34825 (h!36223 (_ BitVec 64)) (t!49515 List!34829)) )
))
(declare-fun arrayNoDuplicates!0 (array!99997 (_ BitVec 32) List!34829) Bool)

(assert (=> b!1499674 (= res!1020932 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34826))))

(assert (= (and start!127622 res!1020934) b!1499669))

(assert (= (and b!1499669 res!1020937) b!1499666))

(assert (= (and b!1499666 res!1020938) b!1499670))

(assert (= (and b!1499670 res!1020929) b!1499665))

(assert (= (and b!1499665 res!1020930) b!1499674))

(assert (= (and b!1499674 res!1020932) b!1499671))

(assert (= (and b!1499671 res!1020931) b!1499667))

(assert (= (and b!1499667 res!1020936) b!1499672))

(assert (= (and b!1499672 res!1020933) b!1499668))

(assert (= (and b!1499668 res!1020935) b!1499673))

(declare-fun m!1382305 () Bool)

(assert (=> b!1499668 m!1382305))

(declare-fun m!1382307 () Bool)

(assert (=> b!1499671 m!1382307))

(declare-fun m!1382309 () Bool)

(assert (=> b!1499671 m!1382309))

(declare-fun m!1382311 () Bool)

(assert (=> b!1499671 m!1382311))

(declare-fun m!1382313 () Bool)

(assert (=> b!1499672 m!1382313))

(declare-fun m!1382315 () Bool)

(assert (=> b!1499672 m!1382315))

(assert (=> b!1499667 m!1382315))

(assert (=> b!1499667 m!1382315))

(declare-fun m!1382317 () Bool)

(assert (=> b!1499667 m!1382317))

(declare-fun m!1382319 () Bool)

(assert (=> b!1499665 m!1382319))

(assert (=> b!1499673 m!1382315))

(assert (=> b!1499673 m!1382315))

(declare-fun m!1382321 () Bool)

(assert (=> b!1499673 m!1382321))

(declare-fun m!1382323 () Bool)

(assert (=> b!1499674 m!1382323))

(declare-fun m!1382325 () Bool)

(assert (=> b!1499666 m!1382325))

(assert (=> b!1499666 m!1382325))

(declare-fun m!1382327 () Bool)

(assert (=> b!1499666 m!1382327))

(declare-fun m!1382329 () Bool)

(assert (=> start!127622 m!1382329))

(declare-fun m!1382331 () Bool)

(assert (=> start!127622 m!1382331))

(assert (=> b!1499670 m!1382315))

(assert (=> b!1499670 m!1382315))

(declare-fun m!1382333 () Bool)

(assert (=> b!1499670 m!1382333))

(check-sat (not b!1499667) (not b!1499674) (not b!1499670) (not b!1499665) (not start!127622) (not b!1499666) (not b!1499673) (not b!1499668))
(check-sat)
