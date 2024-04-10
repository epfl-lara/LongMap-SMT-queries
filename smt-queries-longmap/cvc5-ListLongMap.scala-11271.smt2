; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131468 () Bool)

(assert start!131468)

(declare-fun b!1540963 () Bool)

(declare-fun res!1057510 () Bool)

(declare-fun e!857023 () Bool)

(assert (=> b!1540963 (=> (not res!1057510) (not e!857023))))

(declare-datatypes ((array!102371 0))(
  ( (array!102372 (arr!49394 (Array (_ BitVec 32) (_ BitVec 64))) (size!49944 (_ BitVec 32))) )
))
(declare-fun a!3920 () array!102371)

(declare-fun from!3298 () (_ BitVec 32))

(declare-fun mask!4052 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102371 (_ BitVec 32)) Bool)

(assert (=> b!1540963 (= res!1057510 (arrayForallSeekEntryOrOpenFound!0 from!3298 a!3920 mask!4052))))

(declare-fun res!1057511 () Bool)

(assert (=> start!131468 (=> (not res!1057511) (not e!857023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131468 (= res!1057511 (validMask!0 mask!4052))))

(assert (=> start!131468 e!857023))

(assert (=> start!131468 true))

(declare-fun array_inv!38422 (array!102371) Bool)

(assert (=> start!131468 (array_inv!38422 a!3920)))

(declare-fun b!1540964 () Bool)

(declare-fun res!1057512 () Bool)

(assert (=> b!1540964 (=> (not res!1057512) (not e!857023))))

(declare-fun newFrom!293 () (_ BitVec 32))

(assert (=> b!1540964 (= res!1057512 (and (bvslt from!3298 newFrom!293) (bvsge (bvadd #b00000000000000000000000000000001 from!3298) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!3298) (size!49944 a!3920))))))

(declare-fun b!1540965 () Bool)

(assert (=> b!1540965 (= e!857023 (not true))))

(assert (=> b!1540965 (arrayForallSeekEntryOrOpenFound!0 newFrom!293 a!3920 mask!4052)))

(declare-datatypes ((Unit!51450 0))(
  ( (Unit!51451) )
))
(declare-fun lt!665554 () Unit!51450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!102371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51450)

(assert (=> b!1540965 (= lt!665554 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3920 mask!4052 (bvadd #b00000000000000000000000000000001 from!3298) newFrom!293))))

(declare-fun b!1540966 () Bool)

(declare-fun res!1057513 () Bool)

(assert (=> b!1540966 (=> (not res!1057513) (not e!857023))))

(assert (=> b!1540966 (= res!1057513 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000001 from!3298) a!3920 mask!4052))))

(declare-fun b!1540967 () Bool)

(declare-fun res!1057509 () Bool)

(assert (=> b!1540967 (=> (not res!1057509) (not e!857023))))

(assert (=> b!1540967 (= res!1057509 (and (= (size!49944 a!3920) (bvadd #b00000000000000000000000000000001 mask!4052)) (bvsge from!3298 #b00000000000000000000000000000000) (bvsle from!3298 (size!49944 a!3920)) (bvsge newFrom!293 from!3298) (bvsle newFrom!293 (size!49944 a!3920))))))

(assert (= (and start!131468 res!1057511) b!1540967))

(assert (= (and b!1540967 res!1057509) b!1540963))

(assert (= (and b!1540963 res!1057510) b!1540964))

(assert (= (and b!1540964 res!1057512) b!1540966))

(assert (= (and b!1540966 res!1057513) b!1540965))

(declare-fun m!1423011 () Bool)

(assert (=> b!1540963 m!1423011))

(declare-fun m!1423013 () Bool)

(assert (=> start!131468 m!1423013))

(declare-fun m!1423015 () Bool)

(assert (=> start!131468 m!1423015))

(declare-fun m!1423017 () Bool)

(assert (=> b!1540965 m!1423017))

(declare-fun m!1423019 () Bool)

(assert (=> b!1540965 m!1423019))

(declare-fun m!1423021 () Bool)

(assert (=> b!1540966 m!1423021))

(push 1)

(assert (not b!1540963))

(assert (not b!1540965))

(assert (not start!131468))

(assert (not b!1540966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

