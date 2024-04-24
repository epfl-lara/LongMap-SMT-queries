; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131500 () Bool)

(assert start!131500)

(declare-fun b!1540403 () Bool)

(declare-fun res!1055915 () Bool)

(declare-fun e!857320 () Bool)

(assert (=> b!1540403 (=> (not res!1055915) (not e!857320))))

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!102302 0))(
  ( (array!102303 (arr!49359 (Array (_ BitVec 32) (_ BitVec 64))) (size!49910 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!102302)

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1540403 (= res!1055915 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49910 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49910 a!2792)) (= (select (arr!49359 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1540404 () Bool)

(declare-fun res!1055917 () Bool)

(assert (=> b!1540404 (=> (not res!1055917) (not e!857320))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1540404 (= res!1055917 (and (= (size!49910 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49910 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49910 a!2792)) (not (= i!951 j!64))))))

(declare-fun res!1055918 () Bool)

(assert (=> start!131500 (=> (not res!1055918) (not e!857320))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131500 (= res!1055918 (validMask!0 mask!2480))))

(assert (=> start!131500 e!857320))

(assert (=> start!131500 true))

(declare-fun array_inv!38640 (array!102302) Bool)

(assert (=> start!131500 (array_inv!38640 a!2792)))

(declare-fun b!1540405 () Bool)

(declare-fun res!1055916 () Bool)

(assert (=> b!1540405 (=> (not res!1055916) (not e!857320))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1540405 (= res!1055916 (validKeyInArray!0 (select (arr!49359 a!2792) i!951)))))

(declare-fun b!1540406 () Bool)

(declare-fun res!1055913 () Bool)

(assert (=> b!1540406 (=> (not res!1055913) (not e!857320))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102302 (_ BitVec 32)) Bool)

(assert (=> b!1540406 (= res!1055913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1540407 () Bool)

(assert (=> b!1540407 (= e!857320 false)))

(declare-datatypes ((SeekEntryResult!13380 0))(
  ( (MissingZero!13380 (index!55915 (_ BitVec 32))) (Found!13380 (index!55916 (_ BitVec 32))) (Intermediate!13380 (undefined!14192 Bool) (index!55917 (_ BitVec 32)) (x!137856 (_ BitVec 32))) (Undefined!13380) (MissingVacant!13380 (index!55918 (_ BitVec 32))) )
))
(declare-fun lt!665721 () SeekEntryResult!13380)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!102302 (_ BitVec 32)) SeekEntryResult!13380)

(assert (=> b!1540407 (= lt!665721 (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49359 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1540408 () Bool)

(declare-fun res!1055914 () Bool)

(assert (=> b!1540408 (=> (not res!1055914) (not e!857320))))

(declare-datatypes ((List!35820 0))(
  ( (Nil!35817) (Cons!35816 (h!37279 (_ BitVec 64)) (t!50506 List!35820)) )
))
(declare-fun arrayNoDuplicates!0 (array!102302 (_ BitVec 32) List!35820) Bool)

(assert (=> b!1540408 (= res!1055914 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35817))))

(declare-fun b!1540409 () Bool)

(declare-fun res!1055919 () Bool)

(assert (=> b!1540409 (=> (not res!1055919) (not e!857320))))

(assert (=> b!1540409 (= res!1055919 (validKeyInArray!0 (select (arr!49359 a!2792) j!64)))))

(assert (= (and start!131500 res!1055918) b!1540404))

(assert (= (and b!1540404 res!1055917) b!1540405))

(assert (= (and b!1540405 res!1055916) b!1540409))

(assert (= (and b!1540409 res!1055919) b!1540406))

(assert (= (and b!1540406 res!1055913) b!1540408))

(assert (= (and b!1540408 res!1055914) b!1540403))

(assert (= (and b!1540403 res!1055915) b!1540407))

(declare-fun m!1422707 () Bool)

(assert (=> b!1540406 m!1422707))

(declare-fun m!1422709 () Bool)

(assert (=> start!131500 m!1422709))

(declare-fun m!1422711 () Bool)

(assert (=> start!131500 m!1422711))

(declare-fun m!1422713 () Bool)

(assert (=> b!1540405 m!1422713))

(assert (=> b!1540405 m!1422713))

(declare-fun m!1422715 () Bool)

(assert (=> b!1540405 m!1422715))

(declare-fun m!1422717 () Bool)

(assert (=> b!1540408 m!1422717))

(declare-fun m!1422719 () Bool)

(assert (=> b!1540407 m!1422719))

(assert (=> b!1540407 m!1422719))

(declare-fun m!1422721 () Bool)

(assert (=> b!1540407 m!1422721))

(declare-fun m!1422723 () Bool)

(assert (=> b!1540403 m!1422723))

(assert (=> b!1540409 m!1422719))

(assert (=> b!1540409 m!1422719))

(declare-fun m!1422725 () Bool)

(assert (=> b!1540409 m!1422725))

(push 1)

(assert (not b!1540407))

(assert (not start!131500))

(assert (not b!1540409))

(assert (not b!1540406))

(assert (not b!1540405))

(assert (not b!1540408))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

