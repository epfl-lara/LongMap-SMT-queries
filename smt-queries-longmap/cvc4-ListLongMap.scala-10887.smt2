; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127588 () Bool)

(assert start!127588)

(declare-fun b!1498883 () Bool)

(declare-fun res!1019959 () Bool)

(declare-fun e!839143 () Bool)

(assert (=> b!1498883 (=> (not res!1019959) (not e!839143))))

(declare-datatypes ((array!99969 0))(
  ( (array!99970 (arr!48244 (Array (_ BitVec 32) (_ BitVec 64))) (size!48794 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99969)

(declare-fun j!87 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1498883 (= res!1019959 (validKeyInArray!0 (select (arr!48244 a!2850) j!87)))))

(declare-fun b!1498884 () Bool)

(declare-fun res!1019965 () Bool)

(assert (=> b!1498884 (=> (not res!1019965) (not e!839143))))

(declare-datatypes ((List!34736 0))(
  ( (Nil!34733) (Cons!34732 (h!36129 (_ BitVec 64)) (t!49430 List!34736)) )
))
(declare-fun arrayNoDuplicates!0 (array!99969 (_ BitVec 32) List!34736) Bool)

(assert (=> b!1498884 (= res!1019965 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34733))))

(declare-fun res!1019961 () Bool)

(assert (=> start!127588 (=> (not res!1019961) (not e!839143))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127588 (= res!1019961 (validMask!0 mask!2661))))

(assert (=> start!127588 e!839143))

(assert (=> start!127588 true))

(declare-fun array_inv!37272 (array!99969) Bool)

(assert (=> start!127588 (array_inv!37272 a!2850)))

(declare-fun b!1498885 () Bool)

(declare-fun res!1019960 () Bool)

(assert (=> b!1498885 (=> (not res!1019960) (not e!839143))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1498885 (= res!1019960 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48794 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48794 a!2850)) (= (select (arr!48244 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48244 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48794 a!2850))))))

(declare-fun b!1498886 () Bool)

(declare-fun res!1019964 () Bool)

(assert (=> b!1498886 (=> (not res!1019964) (not e!839143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99969 (_ BitVec 32)) Bool)

(assert (=> b!1498886 (= res!1019964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1498887 () Bool)

(declare-fun res!1019963 () Bool)

(assert (=> b!1498887 (=> (not res!1019963) (not e!839143))))

(assert (=> b!1498887 (= res!1019963 (validKeyInArray!0 (select (arr!48244 a!2850) i!996)))))

(declare-fun b!1498888 () Bool)

(assert (=> b!1498888 (= e!839143 false)))

(declare-datatypes ((SeekEntryResult!12454 0))(
  ( (MissingZero!12454 (index!52208 (_ BitVec 32))) (Found!12454 (index!52209 (_ BitVec 32))) (Intermediate!12454 (undefined!13266 Bool) (index!52210 (_ BitVec 32)) (x!133896 (_ BitVec 32))) (Undefined!12454) (MissingVacant!12454 (index!52211 (_ BitVec 32))) )
))
(declare-fun lt!652678 () SeekEntryResult!12454)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99969 (_ BitVec 32)) SeekEntryResult!12454)

(assert (=> b!1498888 (= lt!652678 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48244 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1498889 () Bool)

(declare-fun res!1019962 () Bool)

(assert (=> b!1498889 (=> (not res!1019962) (not e!839143))))

(assert (=> b!1498889 (= res!1019962 (and (= (size!48794 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48794 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48794 a!2850)) (not (= i!996 j!87))))))

(assert (= (and start!127588 res!1019961) b!1498889))

(assert (= (and b!1498889 res!1019962) b!1498887))

(assert (= (and b!1498887 res!1019963) b!1498883))

(assert (= (and b!1498883 res!1019959) b!1498886))

(assert (= (and b!1498886 res!1019964) b!1498884))

(assert (= (and b!1498884 res!1019965) b!1498885))

(assert (= (and b!1498885 res!1019960) b!1498888))

(declare-fun m!1382041 () Bool)

(assert (=> b!1498887 m!1382041))

(assert (=> b!1498887 m!1382041))

(declare-fun m!1382043 () Bool)

(assert (=> b!1498887 m!1382043))

(declare-fun m!1382045 () Bool)

(assert (=> b!1498884 m!1382045))

(declare-fun m!1382047 () Bool)

(assert (=> b!1498883 m!1382047))

(assert (=> b!1498883 m!1382047))

(declare-fun m!1382049 () Bool)

(assert (=> b!1498883 m!1382049))

(declare-fun m!1382051 () Bool)

(assert (=> start!127588 m!1382051))

(declare-fun m!1382053 () Bool)

(assert (=> start!127588 m!1382053))

(declare-fun m!1382055 () Bool)

(assert (=> b!1498886 m!1382055))

(assert (=> b!1498888 m!1382047))

(assert (=> b!1498888 m!1382047))

(declare-fun m!1382057 () Bool)

(assert (=> b!1498888 m!1382057))

(declare-fun m!1382059 () Bool)

(assert (=> b!1498885 m!1382059))

(declare-fun m!1382061 () Bool)

(assert (=> b!1498885 m!1382061))

(declare-fun m!1382063 () Bool)

(assert (=> b!1498885 m!1382063))

(push 1)

(assert (not b!1498884))

(assert (not b!1498888))

(assert (not b!1498883))

(assert (not start!127588))

(assert (not b!1498887))

(assert (not b!1498886))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

