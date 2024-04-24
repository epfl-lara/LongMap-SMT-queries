; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120792 () Bool)

(assert start!120792)

(declare-fun b!1405363 () Bool)

(declare-fun res!943192 () Bool)

(declare-fun e!795706 () Bool)

(assert (=> b!1405363 (=> (not res!943192) (not e!795706))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96123 0))(
  ( (array!96124 (arr!46410 (Array (_ BitVec 32) (_ BitVec 64))) (size!46961 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96123)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1405363 (= res!943192 (and (= (size!46961 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46961 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46961 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!943194 () Bool)

(assert (=> start!120792 (=> (not res!943194) (not e!795706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120792 (= res!943194 (validMask!0 mask!2840))))

(assert (=> start!120792 e!795706))

(assert (=> start!120792 true))

(declare-fun array_inv!35691 (array!96123) Bool)

(assert (=> start!120792 (array_inv!35691 a!2901)))

(declare-fun b!1405364 () Bool)

(declare-fun res!943195 () Bool)

(assert (=> b!1405364 (=> (not res!943195) (not e!795706))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1405364 (= res!943195 (validKeyInArray!0 (select (arr!46410 a!2901) i!1037)))))

(declare-fun b!1405365 () Bool)

(declare-fun res!943193 () Bool)

(assert (=> b!1405365 (=> (not res!943193) (not e!795706))))

(declare-datatypes ((List!32916 0))(
  ( (Nil!32913) (Cons!32912 (h!34168 (_ BitVec 64)) (t!47602 List!32916)) )
))
(declare-fun arrayNoDuplicates!0 (array!96123 (_ BitVec 32) List!32916) Bool)

(assert (=> b!1405365 (= res!943193 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32913))))

(declare-fun b!1405366 () Bool)

(declare-fun res!943191 () Bool)

(assert (=> b!1405366 (=> (not res!943191) (not e!795706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96123 (_ BitVec 32)) Bool)

(assert (=> b!1405366 (= res!943191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1405367 () Bool)

(declare-fun res!943190 () Bool)

(assert (=> b!1405367 (=> (not res!943190) (not e!795706))))

(assert (=> b!1405367 (= res!943190 (validKeyInArray!0 (select (arr!46410 a!2901) j!112)))))

(declare-fun b!1405368 () Bool)

(assert (=> b!1405368 (= e!795706 false)))

(declare-datatypes ((SeekEntryResult!10624 0))(
  ( (MissingZero!10624 (index!44873 (_ BitVec 32))) (Found!10624 (index!44874 (_ BitVec 32))) (Intermediate!10624 (undefined!11436 Bool) (index!44875 (_ BitVec 32)) (x!126638 (_ BitVec 32))) (Undefined!10624) (MissingVacant!10624 (index!44876 (_ BitVec 32))) )
))
(declare-fun lt!619007 () SeekEntryResult!10624)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96123 (_ BitVec 32)) SeekEntryResult!10624)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1405368 (= lt!619007 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46410 a!2901) j!112) mask!2840) (select (arr!46410 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!120792 res!943194) b!1405363))

(assert (= (and b!1405363 res!943192) b!1405364))

(assert (= (and b!1405364 res!943195) b!1405367))

(assert (= (and b!1405367 res!943190) b!1405366))

(assert (= (and b!1405366 res!943191) b!1405365))

(assert (= (and b!1405365 res!943193) b!1405368))

(declare-fun m!1294409 () Bool)

(assert (=> b!1405365 m!1294409))

(declare-fun m!1294411 () Bool)

(assert (=> b!1405366 m!1294411))

(declare-fun m!1294413 () Bool)

(assert (=> b!1405367 m!1294413))

(assert (=> b!1405367 m!1294413))

(declare-fun m!1294415 () Bool)

(assert (=> b!1405367 m!1294415))

(declare-fun m!1294417 () Bool)

(assert (=> start!120792 m!1294417))

(declare-fun m!1294419 () Bool)

(assert (=> start!120792 m!1294419))

(assert (=> b!1405368 m!1294413))

(assert (=> b!1405368 m!1294413))

(declare-fun m!1294421 () Bool)

(assert (=> b!1405368 m!1294421))

(assert (=> b!1405368 m!1294421))

(assert (=> b!1405368 m!1294413))

(declare-fun m!1294423 () Bool)

(assert (=> b!1405368 m!1294423))

(declare-fun m!1294425 () Bool)

(assert (=> b!1405364 m!1294425))

(assert (=> b!1405364 m!1294425))

(declare-fun m!1294427 () Bool)

(assert (=> b!1405364 m!1294427))

(push 1)

(assert (not b!1405366))

(assert (not start!120792))

(assert (not b!1405367))

(assert (not b!1405364))

(assert (not b!1405365))

(assert (not b!1405368))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

