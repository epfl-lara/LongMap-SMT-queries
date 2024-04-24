; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118620 () Bool)

(assert start!118620)

(declare-fun b!1386376 () Bool)

(declare-fun res!926893 () Bool)

(declare-fun e!785646 () Bool)

(assert (=> b!1386376 (=> (not res!926893) (not e!785646))))

(declare-datatypes ((array!94821 0))(
  ( (array!94822 (arr!45786 (Array (_ BitVec 32) (_ BitVec 64))) (size!46337 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94821)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94821 (_ BitVec 32)) Bool)

(assert (=> b!1386376 (= res!926893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386377 () Bool)

(declare-fun res!926894 () Bool)

(assert (=> b!1386377 (=> (not res!926894) (not e!785646))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386377 (= res!926894 (and (not (= (select (arr!45786 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45786 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386378 () Bool)

(declare-datatypes ((Unit!46175 0))(
  ( (Unit!46176) )
))
(declare-fun e!785647 () Unit!46175)

(declare-fun Unit!46177 () Unit!46175)

(assert (=> b!1386378 (= e!785647 Unit!46177)))

(declare-fun b!1386379 () Bool)

(declare-fun res!926895 () Bool)

(assert (=> b!1386379 (=> (not res!926895) (not e!785646))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386379 (= res!926895 (and (= (size!46337 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46337 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46337 a!2938))))))

(declare-fun b!1386380 () Bool)

(declare-fun res!926896 () Bool)

(assert (=> b!1386380 (=> (not res!926896) (not e!785646))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386380 (= res!926896 (validKeyInArray!0 (select (arr!45786 a!2938) i!1065)))))

(declare-fun b!1386381 () Bool)

(assert (=> b!1386381 (= e!785646 false)))

(declare-fun lt!609642 () Unit!46175)

(assert (=> b!1386381 (= lt!609642 e!785647)))

(declare-fun c!129189 () Bool)

(declare-fun e!785644 () Bool)

(assert (=> b!1386381 (= c!129189 e!785644)))

(declare-fun res!926897 () Bool)

(assert (=> b!1386381 (=> (not res!926897) (not e!785644))))

(assert (=> b!1386381 (= res!926897 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386383 () Bool)

(assert (=> b!1386383 (= e!785644 (validKeyInArray!0 (select (arr!45786 a!2938) startIndex!16)))))

(declare-fun b!1386384 () Bool)

(declare-fun res!926898 () Bool)

(assert (=> b!1386384 (=> (not res!926898) (not e!785646))))

(declare-datatypes ((List!32301 0))(
  ( (Nil!32298) (Cons!32297 (h!33515 (_ BitVec 64)) (t!46987 List!32301)) )
))
(declare-fun arrayNoDuplicates!0 (array!94821 (_ BitVec 32) List!32301) Bool)

(assert (=> b!1386384 (= res!926898 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32298))))

(declare-fun b!1386382 () Bool)

(declare-fun lt!609640 () Unit!46175)

(assert (=> b!1386382 (= e!785647 lt!609640)))

(declare-fun lt!609641 () Unit!46175)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46175)

(assert (=> b!1386382 (= lt!609641 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10082 0))(
  ( (MissingZero!10082 (index!42699 (_ BitVec 32))) (Found!10082 (index!42700 (_ BitVec 32))) (Intermediate!10082 (undefined!10894 Bool) (index!42701 (_ BitVec 32)) (x!124345 (_ BitVec 32))) (Undefined!10082) (MissingVacant!10082 (index!42702 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94821 (_ BitVec 32)) SeekEntryResult!10082)

(assert (=> b!1386382 (= (seekEntryOrOpen!0 (select (arr!45786 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45786 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94822 (store (arr!45786 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46337 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94821 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46175)

(assert (=> b!1386382 (= lt!609640 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386382 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!926899 () Bool)

(assert (=> start!118620 (=> (not res!926899) (not e!785646))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118620 (= res!926899 (validMask!0 mask!2987))))

(assert (=> start!118620 e!785646))

(assert (=> start!118620 true))

(declare-fun array_inv!35067 (array!94821) Bool)

(assert (=> start!118620 (array_inv!35067 a!2938)))

(assert (= (and start!118620 res!926899) b!1386379))

(assert (= (and b!1386379 res!926895) b!1386380))

(assert (= (and b!1386380 res!926896) b!1386384))

(assert (= (and b!1386384 res!926898) b!1386376))

(assert (= (and b!1386376 res!926893) b!1386377))

(assert (= (and b!1386377 res!926894) b!1386381))

(assert (= (and b!1386381 res!926897) b!1386383))

(assert (= (and b!1386381 c!129189) b!1386382))

(assert (= (and b!1386381 (not c!129189)) b!1386378))

(declare-fun m!1272021 () Bool)

(assert (=> b!1386382 m!1272021))

(declare-fun m!1272023 () Bool)

(assert (=> b!1386382 m!1272023))

(assert (=> b!1386382 m!1272023))

(declare-fun m!1272025 () Bool)

(assert (=> b!1386382 m!1272025))

(declare-fun m!1272027 () Bool)

(assert (=> b!1386382 m!1272027))

(declare-fun m!1272029 () Bool)

(assert (=> b!1386382 m!1272029))

(declare-fun m!1272031 () Bool)

(assert (=> b!1386382 m!1272031))

(declare-fun m!1272033 () Bool)

(assert (=> b!1386382 m!1272033))

(assert (=> b!1386382 m!1272031))

(declare-fun m!1272035 () Bool)

(assert (=> b!1386382 m!1272035))

(declare-fun m!1272037 () Bool)

(assert (=> b!1386380 m!1272037))

(assert (=> b!1386380 m!1272037))

(declare-fun m!1272039 () Bool)

(assert (=> b!1386380 m!1272039))

(declare-fun m!1272041 () Bool)

(assert (=> b!1386376 m!1272041))

(assert (=> b!1386377 m!1272037))

(assert (=> b!1386383 m!1272031))

(assert (=> b!1386383 m!1272031))

(declare-fun m!1272043 () Bool)

(assert (=> b!1386383 m!1272043))

(declare-fun m!1272045 () Bool)

(assert (=> b!1386384 m!1272045))

(declare-fun m!1272047 () Bool)

(assert (=> start!118620 m!1272047))

(declare-fun m!1272049 () Bool)

(assert (=> start!118620 m!1272049))

(push 1)

(assert (not b!1386382))

(assert (not b!1386384))

(assert (not b!1386376))

(assert (not b!1386383))

(assert (not b!1386380))

(assert (not start!118620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

