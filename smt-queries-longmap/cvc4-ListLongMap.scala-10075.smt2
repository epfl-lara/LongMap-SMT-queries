; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118588 () Bool)

(assert start!118588)

(declare-fun res!927583 () Bool)

(declare-fun e!785364 () Bool)

(assert (=> start!118588 (=> (not res!927583) (not e!785364))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118588 (= res!927583 (validMask!0 mask!2987))))

(assert (=> start!118588 e!785364))

(assert (=> start!118588 true))

(declare-datatypes ((array!94864 0))(
  ( (array!94865 (arr!45808 (Array (_ BitVec 32) (_ BitVec 64))) (size!46358 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94864)

(declare-fun array_inv!34836 (array!94864) Bool)

(assert (=> start!118588 (array_inv!34836 a!2938)))

(declare-fun b!1386364 () Bool)

(declare-fun res!927584 () Bool)

(assert (=> b!1386364 (=> (not res!927584) (not e!785364))))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1386364 (= res!927584 (and (not (= (select (arr!45808 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45808 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386365 () Bool)

(declare-fun res!927585 () Bool)

(assert (=> b!1386365 (=> (not res!927585) (not e!785364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386365 (= res!927585 (validKeyInArray!0 (select (arr!45808 a!2938) i!1065)))))

(declare-fun b!1386366 () Bool)

(declare-fun res!927586 () Bool)

(assert (=> b!1386366 (=> (not res!927586) (not e!785364))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386366 (= res!927586 (and (= (size!46358 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46358 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46358 a!2938))))))

(declare-fun b!1386367 () Bool)

(assert (=> b!1386367 (= e!785364 false)))

(declare-datatypes ((Unit!46295 0))(
  ( (Unit!46296) )
))
(declare-fun lt!609441 () Unit!46295)

(declare-fun e!785366 () Unit!46295)

(assert (=> b!1386367 (= lt!609441 e!785366)))

(declare-fun c!128832 () Bool)

(declare-fun e!785363 () Bool)

(assert (=> b!1386367 (= c!128832 e!785363)))

(declare-fun res!927580 () Bool)

(assert (=> b!1386367 (=> (not res!927580) (not e!785363))))

(assert (=> b!1386367 (= res!927580 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386368 () Bool)

(declare-fun res!927582 () Bool)

(assert (=> b!1386368 (=> (not res!927582) (not e!785364))))

(declare-datatypes ((List!32336 0))(
  ( (Nil!32333) (Cons!32332 (h!33541 (_ BitVec 64)) (t!47030 List!32336)) )
))
(declare-fun arrayNoDuplicates!0 (array!94864 (_ BitVec 32) List!32336) Bool)

(assert (=> b!1386368 (= res!927582 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32333))))

(declare-fun b!1386369 () Bool)

(declare-fun res!927581 () Bool)

(assert (=> b!1386369 (=> (not res!927581) (not e!785364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94864 (_ BitVec 32)) Bool)

(assert (=> b!1386369 (= res!927581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386370 () Bool)

(assert (=> b!1386370 (= e!785363 (validKeyInArray!0 (select (arr!45808 a!2938) startIndex!16)))))

(declare-fun b!1386371 () Bool)

(declare-fun Unit!46297 () Unit!46295)

(assert (=> b!1386371 (= e!785366 Unit!46297)))

(declare-fun b!1386372 () Bool)

(declare-fun lt!609440 () Unit!46295)

(assert (=> b!1386372 (= e!785366 lt!609440)))

(declare-fun lt!609439 () Unit!46295)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46295)

(assert (=> b!1386372 (= lt!609439 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10151 0))(
  ( (MissingZero!10151 (index!42975 (_ BitVec 32))) (Found!10151 (index!42976 (_ BitVec 32))) (Intermediate!10151 (undefined!10963 Bool) (index!42977 (_ BitVec 32)) (x!124592 (_ BitVec 32))) (Undefined!10151) (MissingVacant!10151 (index!42978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94864 (_ BitVec 32)) SeekEntryResult!10151)

(assert (=> b!1386372 (= (seekEntryOrOpen!0 (select (arr!45808 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45808 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94865 (store (arr!45808 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46358 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94864 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46295)

(assert (=> b!1386372 (= lt!609440 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386372 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(assert (= (and start!118588 res!927583) b!1386366))

(assert (= (and b!1386366 res!927586) b!1386365))

(assert (= (and b!1386365 res!927585) b!1386368))

(assert (= (and b!1386368 res!927582) b!1386369))

(assert (= (and b!1386369 res!927581) b!1386364))

(assert (= (and b!1386364 res!927584) b!1386367))

(assert (= (and b!1386367 res!927580) b!1386370))

(assert (= (and b!1386367 c!128832) b!1386372))

(assert (= (and b!1386367 (not c!128832)) b!1386371))

(declare-fun m!1271721 () Bool)

(assert (=> b!1386372 m!1271721))

(declare-fun m!1271723 () Bool)

(assert (=> b!1386372 m!1271723))

(assert (=> b!1386372 m!1271723))

(declare-fun m!1271725 () Bool)

(assert (=> b!1386372 m!1271725))

(declare-fun m!1271727 () Bool)

(assert (=> b!1386372 m!1271727))

(declare-fun m!1271729 () Bool)

(assert (=> b!1386372 m!1271729))

(declare-fun m!1271731 () Bool)

(assert (=> b!1386372 m!1271731))

(declare-fun m!1271733 () Bool)

(assert (=> b!1386372 m!1271733))

(assert (=> b!1386372 m!1271731))

(declare-fun m!1271735 () Bool)

(assert (=> b!1386372 m!1271735))

(declare-fun m!1271737 () Bool)

(assert (=> b!1386365 m!1271737))

(assert (=> b!1386365 m!1271737))

(declare-fun m!1271739 () Bool)

(assert (=> b!1386365 m!1271739))

(declare-fun m!1271741 () Bool)

(assert (=> start!118588 m!1271741))

(declare-fun m!1271743 () Bool)

(assert (=> start!118588 m!1271743))

(declare-fun m!1271745 () Bool)

(assert (=> b!1386369 m!1271745))

(assert (=> b!1386370 m!1271731))

(assert (=> b!1386370 m!1271731))

(declare-fun m!1271747 () Bool)

(assert (=> b!1386370 m!1271747))

(declare-fun m!1271749 () Bool)

(assert (=> b!1386368 m!1271749))

(assert (=> b!1386364 m!1271737))

(push 1)

(assert (not b!1386368))

(assert (not start!118588))

(assert (not b!1386369))

(assert (not b!1386370))

(assert (not b!1386372))

(assert (not b!1386365))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

