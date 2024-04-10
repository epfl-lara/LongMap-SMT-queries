; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118628 () Bool)

(assert start!118628)

(declare-fun b!1386904 () Bool)

(declare-fun res!928003 () Bool)

(declare-fun e!785605 () Bool)

(assert (=> b!1386904 (=> (not res!928003) (not e!785605))))

(declare-datatypes ((array!94904 0))(
  ( (array!94905 (arr!45828 (Array (_ BitVec 32) (_ BitVec 64))) (size!46378 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94904)

(declare-datatypes ((List!32356 0))(
  ( (Nil!32353) (Cons!32352 (h!33561 (_ BitVec 64)) (t!47050 List!32356)) )
))
(declare-fun arrayNoDuplicates!0 (array!94904 (_ BitVec 32) List!32356) Bool)

(assert (=> b!1386904 (= res!928003 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32353))))

(declare-fun b!1386905 () Bool)

(declare-datatypes ((Unit!46355 0))(
  ( (Unit!46356) )
))
(declare-fun e!785604 () Unit!46355)

(declare-fun lt!609619 () Unit!46355)

(assert (=> b!1386905 (= e!785604 lt!609619)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!609621 () Unit!46355)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46355)

(assert (=> b!1386905 (= lt!609621 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10171 0))(
  ( (MissingZero!10171 (index!43055 (_ BitVec 32))) (Found!10171 (index!43056 (_ BitVec 32))) (Intermediate!10171 (undefined!10983 Bool) (index!43057 (_ BitVec 32)) (x!124668 (_ BitVec 32))) (Undefined!10171) (MissingVacant!10171 (index!43058 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94904 (_ BitVec 32)) SeekEntryResult!10171)

(assert (=> b!1386905 (= (seekEntryOrOpen!0 (select (arr!45828 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45828 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94905 (store (arr!45828 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46378 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94904 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46355)

(assert (=> b!1386905 (= lt!609619 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94904 (_ BitVec 32)) Bool)

(assert (=> b!1386905 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!928004 () Bool)

(assert (=> start!118628 (=> (not res!928004) (not e!785605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118628 (= res!928004 (validMask!0 mask!2987))))

(assert (=> start!118628 e!785605))

(assert (=> start!118628 true))

(declare-fun array_inv!34856 (array!94904) Bool)

(assert (=> start!118628 (array_inv!34856 a!2938)))

(declare-fun b!1386906 () Bool)

(declare-fun res!928000 () Bool)

(assert (=> b!1386906 (=> (not res!928000) (not e!785605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386906 (= res!928000 (validKeyInArray!0 (select (arr!45828 a!2938) i!1065)))))

(declare-fun b!1386907 () Bool)

(declare-fun res!928006 () Bool)

(assert (=> b!1386907 (=> (not res!928006) (not e!785605))))

(assert (=> b!1386907 (= res!928006 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386908 () Bool)

(declare-fun e!785603 () Bool)

(assert (=> b!1386908 (= e!785603 (validKeyInArray!0 (select (arr!45828 a!2938) startIndex!16)))))

(declare-fun b!1386909 () Bool)

(assert (=> b!1386909 (= e!785605 false)))

(declare-fun lt!609620 () Unit!46355)

(assert (=> b!1386909 (= lt!609620 e!785604)))

(declare-fun c!128892 () Bool)

(assert (=> b!1386909 (= c!128892 e!785603)))

(declare-fun res!928005 () Bool)

(assert (=> b!1386909 (=> (not res!928005) (not e!785603))))

(assert (=> b!1386909 (= res!928005 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386910 () Bool)

(declare-fun res!928001 () Bool)

(assert (=> b!1386910 (=> (not res!928001) (not e!785605))))

(assert (=> b!1386910 (= res!928001 (and (= (size!46378 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46378 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46378 a!2938))))))

(declare-fun b!1386911 () Bool)

(declare-fun res!928002 () Bool)

(assert (=> b!1386911 (=> (not res!928002) (not e!785605))))

(assert (=> b!1386911 (= res!928002 (and (not (= (select (arr!45828 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45828 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386912 () Bool)

(declare-fun Unit!46357 () Unit!46355)

(assert (=> b!1386912 (= e!785604 Unit!46357)))

(assert (= (and start!118628 res!928004) b!1386910))

(assert (= (and b!1386910 res!928001) b!1386906))

(assert (= (and b!1386906 res!928000) b!1386904))

(assert (= (and b!1386904 res!928003) b!1386907))

(assert (= (and b!1386907 res!928006) b!1386911))

(assert (= (and b!1386911 res!928002) b!1386909))

(assert (= (and b!1386909 res!928005) b!1386908))

(assert (= (and b!1386909 c!128892) b!1386905))

(assert (= (and b!1386909 (not c!128892)) b!1386912))

(declare-fun m!1272321 () Bool)

(assert (=> b!1386907 m!1272321))

(declare-fun m!1272323 () Bool)

(assert (=> start!118628 m!1272323))

(declare-fun m!1272325 () Bool)

(assert (=> start!118628 m!1272325))

(declare-fun m!1272327 () Bool)

(assert (=> b!1386904 m!1272327))

(declare-fun m!1272329 () Bool)

(assert (=> b!1386911 m!1272329))

(declare-fun m!1272331 () Bool)

(assert (=> b!1386908 m!1272331))

(assert (=> b!1386908 m!1272331))

(declare-fun m!1272333 () Bool)

(assert (=> b!1386908 m!1272333))

(declare-fun m!1272335 () Bool)

(assert (=> b!1386905 m!1272335))

(declare-fun m!1272337 () Bool)

(assert (=> b!1386905 m!1272337))

(assert (=> b!1386905 m!1272337))

(declare-fun m!1272339 () Bool)

(assert (=> b!1386905 m!1272339))

(declare-fun m!1272341 () Bool)

(assert (=> b!1386905 m!1272341))

(declare-fun m!1272343 () Bool)

(assert (=> b!1386905 m!1272343))

(assert (=> b!1386905 m!1272331))

(declare-fun m!1272345 () Bool)

(assert (=> b!1386905 m!1272345))

(assert (=> b!1386905 m!1272331))

(declare-fun m!1272347 () Bool)

(assert (=> b!1386905 m!1272347))

(assert (=> b!1386906 m!1272329))

(assert (=> b!1386906 m!1272329))

(declare-fun m!1272349 () Bool)

(assert (=> b!1386906 m!1272349))

(check-sat (not start!118628) (not b!1386906) (not b!1386907) (not b!1386905) (not b!1386904) (not b!1386908))
