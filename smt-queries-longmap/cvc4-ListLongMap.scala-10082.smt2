; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118630 () Bool)

(assert start!118630)

(declare-fun b!1386931 () Bool)

(declare-fun res!928023 () Bool)

(declare-fun e!785617 () Bool)

(assert (=> b!1386931 (=> (not res!928023) (not e!785617))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94906 0))(
  ( (array!94907 (arr!45829 (Array (_ BitVec 32) (_ BitVec 64))) (size!46379 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94906)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386931 (= res!928023 (and (= (size!46379 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46379 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46379 a!2938))))))

(declare-fun b!1386932 () Bool)

(declare-fun res!928024 () Bool)

(assert (=> b!1386932 (=> (not res!928024) (not e!785617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386932 (= res!928024 (validKeyInArray!0 (select (arr!45829 a!2938) i!1065)))))

(declare-fun b!1386933 () Bool)

(declare-fun e!785615 () Bool)

(assert (=> b!1386933 (= e!785615 (validKeyInArray!0 (select (arr!45829 a!2938) startIndex!16)))))

(declare-fun res!928026 () Bool)

(assert (=> start!118630 (=> (not res!928026) (not e!785617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118630 (= res!928026 (validMask!0 mask!2987))))

(assert (=> start!118630 e!785617))

(assert (=> start!118630 true))

(declare-fun array_inv!34857 (array!94906) Bool)

(assert (=> start!118630 (array_inv!34857 a!2938)))

(declare-fun b!1386934 () Bool)

(declare-fun res!928022 () Bool)

(assert (=> b!1386934 (=> (not res!928022) (not e!785617))))

(declare-datatypes ((List!32357 0))(
  ( (Nil!32354) (Cons!32353 (h!33562 (_ BitVec 64)) (t!47051 List!32357)) )
))
(declare-fun arrayNoDuplicates!0 (array!94906 (_ BitVec 32) List!32357) Bool)

(assert (=> b!1386934 (= res!928022 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32354))))

(declare-fun b!1386935 () Bool)

(declare-datatypes ((Unit!46358 0))(
  ( (Unit!46359) )
))
(declare-fun e!785616 () Unit!46358)

(declare-fun lt!609629 () Unit!46358)

(assert (=> b!1386935 (= e!785616 lt!609629)))

(declare-fun lt!609630 () Unit!46358)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46358)

(assert (=> b!1386935 (= lt!609630 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10172 0))(
  ( (MissingZero!10172 (index!43059 (_ BitVec 32))) (Found!10172 (index!43060 (_ BitVec 32))) (Intermediate!10172 (undefined!10984 Bool) (index!43061 (_ BitVec 32)) (x!124669 (_ BitVec 32))) (Undefined!10172) (MissingVacant!10172 (index!43062 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94906 (_ BitVec 32)) SeekEntryResult!10172)

(assert (=> b!1386935 (= (seekEntryOrOpen!0 (select (arr!45829 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45829 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94907 (store (arr!45829 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46379 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46358)

(assert (=> b!1386935 (= lt!609629 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94906 (_ BitVec 32)) Bool)

(assert (=> b!1386935 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386936 () Bool)

(declare-fun res!928025 () Bool)

(assert (=> b!1386936 (=> (not res!928025) (not e!785617))))

(assert (=> b!1386936 (= res!928025 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386937 () Bool)

(declare-fun res!928027 () Bool)

(assert (=> b!1386937 (=> (not res!928027) (not e!785617))))

(assert (=> b!1386937 (= res!928027 (and (not (= (select (arr!45829 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45829 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386938 () Bool)

(declare-fun Unit!46360 () Unit!46358)

(assert (=> b!1386938 (= e!785616 Unit!46360)))

(declare-fun b!1386939 () Bool)

(assert (=> b!1386939 (= e!785617 false)))

(declare-fun lt!609628 () Unit!46358)

(assert (=> b!1386939 (= lt!609628 e!785616)))

(declare-fun c!128895 () Bool)

(assert (=> b!1386939 (= c!128895 e!785615)))

(declare-fun res!928021 () Bool)

(assert (=> b!1386939 (=> (not res!928021) (not e!785615))))

(assert (=> b!1386939 (= res!928021 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118630 res!928026) b!1386931))

(assert (= (and b!1386931 res!928023) b!1386932))

(assert (= (and b!1386932 res!928024) b!1386934))

(assert (= (and b!1386934 res!928022) b!1386936))

(assert (= (and b!1386936 res!928025) b!1386937))

(assert (= (and b!1386937 res!928027) b!1386939))

(assert (= (and b!1386939 res!928021) b!1386933))

(assert (= (and b!1386939 c!128895) b!1386935))

(assert (= (and b!1386939 (not c!128895)) b!1386938))

(declare-fun m!1272351 () Bool)

(assert (=> b!1386934 m!1272351))

(declare-fun m!1272353 () Bool)

(assert (=> b!1386935 m!1272353))

(declare-fun m!1272355 () Bool)

(assert (=> b!1386935 m!1272355))

(assert (=> b!1386935 m!1272355))

(declare-fun m!1272357 () Bool)

(assert (=> b!1386935 m!1272357))

(declare-fun m!1272359 () Bool)

(assert (=> b!1386935 m!1272359))

(declare-fun m!1272361 () Bool)

(assert (=> b!1386935 m!1272361))

(declare-fun m!1272363 () Bool)

(assert (=> b!1386935 m!1272363))

(declare-fun m!1272365 () Bool)

(assert (=> b!1386935 m!1272365))

(assert (=> b!1386935 m!1272363))

(declare-fun m!1272367 () Bool)

(assert (=> b!1386935 m!1272367))

(declare-fun m!1272369 () Bool)

(assert (=> b!1386932 m!1272369))

(assert (=> b!1386932 m!1272369))

(declare-fun m!1272371 () Bool)

(assert (=> b!1386932 m!1272371))

(assert (=> b!1386937 m!1272369))

(assert (=> b!1386933 m!1272363))

(assert (=> b!1386933 m!1272363))

(declare-fun m!1272373 () Bool)

(assert (=> b!1386933 m!1272373))

(declare-fun m!1272375 () Bool)

(assert (=> start!118630 m!1272375))

(declare-fun m!1272377 () Bool)

(assert (=> start!118630 m!1272377))

(declare-fun m!1272379 () Bool)

(assert (=> b!1386936 m!1272379))

(push 1)

(assert (not b!1386936))

(assert (not start!118630))

(assert (not b!1386934))

(assert (not b!1386932))

(assert (not b!1386935))

(assert (not b!1386933))

