; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118632 () Bool)

(assert start!118632)

(declare-fun b!1386958 () Bool)

(declare-datatypes ((Unit!46361 0))(
  ( (Unit!46362) )
))
(declare-fun e!785627 () Unit!46361)

(declare-fun lt!609638 () Unit!46361)

(assert (=> b!1386958 (= e!785627 lt!609638)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94908 0))(
  ( (array!94909 (arr!45830 (Array (_ BitVec 32) (_ BitVec 64))) (size!46380 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94908)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lt!609637 () Unit!46361)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46361)

(assert (=> b!1386958 (= lt!609637 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10173 0))(
  ( (MissingZero!10173 (index!43063 (_ BitVec 32))) (Found!10173 (index!43064 (_ BitVec 32))) (Intermediate!10173 (undefined!10985 Bool) (index!43065 (_ BitVec 32)) (x!124678 (_ BitVec 32))) (Undefined!10173) (MissingVacant!10173 (index!43066 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94908 (_ BitVec 32)) SeekEntryResult!10173)

(assert (=> b!1386958 (= (seekEntryOrOpen!0 (select (arr!45830 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45830 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94909 (store (arr!45830 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46380 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94908 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46361)

(assert (=> b!1386958 (= lt!609638 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94908 (_ BitVec 32)) Bool)

(assert (=> b!1386958 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!928048 () Bool)

(declare-fun e!785629 () Bool)

(assert (=> start!118632 (=> (not res!928048) (not e!785629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118632 (= res!928048 (validMask!0 mask!2987))))

(assert (=> start!118632 e!785629))

(assert (=> start!118632 true))

(declare-fun array_inv!34858 (array!94908) Bool)

(assert (=> start!118632 (array_inv!34858 a!2938)))

(declare-fun b!1386959 () Bool)

(declare-fun res!928044 () Bool)

(assert (=> b!1386959 (=> (not res!928044) (not e!785629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386959 (= res!928044 (validKeyInArray!0 (select (arr!45830 a!2938) i!1065)))))

(declare-fun b!1386960 () Bool)

(declare-fun Unit!46363 () Unit!46361)

(assert (=> b!1386960 (= e!785627 Unit!46363)))

(declare-fun b!1386961 () Bool)

(assert (=> b!1386961 (= e!785629 (and (bvslt startIndex!16 (bvsub (size!46380 a!2938) #b00000000000000000000000000000001)) (bvsge (bvadd #b00000000000000000000000000000001 startIndex!16) #b00000000000000000000000000000000) (bvsge (bvsub (size!46380 a!2938) (bvadd #b00000000000000000000000000000001 startIndex!16)) (bvsub (size!46380 a!2938) startIndex!16))))))

(declare-fun lt!609639 () Unit!46361)

(assert (=> b!1386961 (= lt!609639 e!785627)))

(declare-fun c!128898 () Bool)

(declare-fun e!785628 () Bool)

(assert (=> b!1386961 (= c!128898 e!785628)))

(declare-fun res!928043 () Bool)

(assert (=> b!1386961 (=> (not res!928043) (not e!785628))))

(assert (=> b!1386961 (= res!928043 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386962 () Bool)

(declare-fun res!928042 () Bool)

(assert (=> b!1386962 (=> (not res!928042) (not e!785629))))

(declare-datatypes ((List!32358 0))(
  ( (Nil!32355) (Cons!32354 (h!33563 (_ BitVec 64)) (t!47052 List!32358)) )
))
(declare-fun arrayNoDuplicates!0 (array!94908 (_ BitVec 32) List!32358) Bool)

(assert (=> b!1386962 (= res!928042 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32355))))

(declare-fun b!1386963 () Bool)

(assert (=> b!1386963 (= e!785628 (validKeyInArray!0 (select (arr!45830 a!2938) startIndex!16)))))

(declare-fun b!1386964 () Bool)

(declare-fun res!928045 () Bool)

(assert (=> b!1386964 (=> (not res!928045) (not e!785629))))

(assert (=> b!1386964 (= res!928045 (and (not (= (select (arr!45830 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45830 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386965 () Bool)

(declare-fun res!928047 () Bool)

(assert (=> b!1386965 (=> (not res!928047) (not e!785629))))

(assert (=> b!1386965 (= res!928047 (and (= (size!46380 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46380 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46380 a!2938))))))

(declare-fun b!1386966 () Bool)

(declare-fun res!928046 () Bool)

(assert (=> b!1386966 (=> (not res!928046) (not e!785629))))

(assert (=> b!1386966 (= res!928046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(assert (= (and start!118632 res!928048) b!1386965))

(assert (= (and b!1386965 res!928047) b!1386959))

(assert (= (and b!1386959 res!928044) b!1386962))

(assert (= (and b!1386962 res!928042) b!1386966))

(assert (= (and b!1386966 res!928046) b!1386964))

(assert (= (and b!1386964 res!928045) b!1386961))

(assert (= (and b!1386961 res!928043) b!1386963))

(assert (= (and b!1386961 c!128898) b!1386958))

(assert (= (and b!1386961 (not c!128898)) b!1386960))

(declare-fun m!1272381 () Bool)

(assert (=> b!1386964 m!1272381))

(declare-fun m!1272383 () Bool)

(assert (=> b!1386966 m!1272383))

(declare-fun m!1272385 () Bool)

(assert (=> b!1386963 m!1272385))

(assert (=> b!1386963 m!1272385))

(declare-fun m!1272387 () Bool)

(assert (=> b!1386963 m!1272387))

(assert (=> b!1386959 m!1272381))

(assert (=> b!1386959 m!1272381))

(declare-fun m!1272389 () Bool)

(assert (=> b!1386959 m!1272389))

(declare-fun m!1272391 () Bool)

(assert (=> b!1386962 m!1272391))

(declare-fun m!1272393 () Bool)

(assert (=> b!1386958 m!1272393))

(declare-fun m!1272395 () Bool)

(assert (=> b!1386958 m!1272395))

(assert (=> b!1386958 m!1272395))

(declare-fun m!1272397 () Bool)

(assert (=> b!1386958 m!1272397))

(declare-fun m!1272399 () Bool)

(assert (=> b!1386958 m!1272399))

(declare-fun m!1272401 () Bool)

(assert (=> b!1386958 m!1272401))

(assert (=> b!1386958 m!1272385))

(declare-fun m!1272403 () Bool)

(assert (=> b!1386958 m!1272403))

(assert (=> b!1386958 m!1272385))

(declare-fun m!1272405 () Bool)

(assert (=> b!1386958 m!1272405))

(declare-fun m!1272407 () Bool)

(assert (=> start!118632 m!1272407))

(declare-fun m!1272409 () Bool)

(assert (=> start!118632 m!1272409))

(push 1)

(assert (not b!1386963))

(assert (not b!1386962))

(assert (not start!118632))

(assert (not b!1386959))

(assert (not b!1386958))

(assert (not b!1386966))

(check-sat)

(pop 1)

(push 1)

(check-sat)

