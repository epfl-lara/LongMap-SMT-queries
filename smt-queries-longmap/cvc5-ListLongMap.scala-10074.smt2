; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118794 () Bool)

(assert start!118794)

(declare-fun b!1387591 () Bool)

(declare-datatypes ((Unit!46227 0))(
  ( (Unit!46228) )
))
(declare-fun e!786178 () Unit!46227)

(declare-fun lt!609893 () Unit!46227)

(assert (=> b!1387591 (= e!786178 lt!609893)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94968 0))(
  ( (array!94969 (arr!45858 (Array (_ BitVec 32) (_ BitVec 64))) (size!46409 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94968)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609892 () Unit!46227)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46227)

(assert (=> b!1387591 (= lt!609892 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10105 0))(
  ( (MissingZero!10105 (index!42791 (_ BitVec 32))) (Found!10105 (index!42792 (_ BitVec 32))) (Intermediate!10105 (undefined!10917 Bool) (index!42793 (_ BitVec 32)) (x!124560 (_ BitVec 32))) (Undefined!10105) (MissingVacant!10105 (index!42794 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94968 (_ BitVec 32)) SeekEntryResult!10105)

(assert (=> b!1387591 (= (seekEntryOrOpen!0 (select (arr!45858 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45858 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94969 (store (arr!45858 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46409 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94968 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46227)

(assert (=> b!1387591 (= lt!609893 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94968 (_ BitVec 32)) Bool)

(assert (=> b!1387591 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!928041 () Bool)

(declare-fun e!786175 () Bool)

(assert (=> start!118794 (=> (not res!928041) (not e!786175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118794 (= res!928041 (validMask!0 mask!2987))))

(assert (=> start!118794 e!786175))

(assert (=> start!118794 true))

(declare-fun array_inv!35139 (array!94968) Bool)

(assert (=> start!118794 (array_inv!35139 a!2938)))

(declare-fun b!1387592 () Bool)

(declare-fun e!786177 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387592 (= e!786177 (validKeyInArray!0 (select (arr!45858 a!2938) startIndex!16)))))

(declare-fun b!1387593 () Bool)

(declare-fun res!928039 () Bool)

(assert (=> b!1387593 (=> (not res!928039) (not e!786175))))

(assert (=> b!1387593 (= res!928039 (and (= (size!46409 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46409 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46409 a!2938))))))

(declare-fun b!1387594 () Bool)

(declare-fun res!928040 () Bool)

(assert (=> b!1387594 (=> (not res!928040) (not e!786175))))

(assert (=> b!1387594 (= res!928040 (validKeyInArray!0 (select (arr!45858 a!2938) i!1065)))))

(declare-fun b!1387595 () Bool)

(declare-fun res!928042 () Bool)

(assert (=> b!1387595 (=> (not res!928042) (not e!786175))))

(assert (=> b!1387595 (= res!928042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1387596 () Bool)

(assert (=> b!1387596 (= e!786175 false)))

(declare-fun lt!609894 () Unit!46227)

(assert (=> b!1387596 (= lt!609894 e!786178)))

(declare-fun c!129225 () Bool)

(assert (=> b!1387596 (= c!129225 e!786177)))

(declare-fun res!928037 () Bool)

(assert (=> b!1387596 (=> (not res!928037) (not e!786177))))

(assert (=> b!1387596 (= res!928037 (not (= startIndex!16 i!1065)))))

(declare-fun b!1387597 () Bool)

(declare-fun res!928038 () Bool)

(assert (=> b!1387597 (=> (not res!928038) (not e!786175))))

(assert (=> b!1387597 (= res!928038 (and (not (= (select (arr!45858 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45858 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387598 () Bool)

(declare-fun res!928036 () Bool)

(assert (=> b!1387598 (=> (not res!928036) (not e!786175))))

(declare-datatypes ((List!32373 0))(
  ( (Nil!32370) (Cons!32369 (h!33587 (_ BitVec 64)) (t!47059 List!32373)) )
))
(declare-fun arrayNoDuplicates!0 (array!94968 (_ BitVec 32) List!32373) Bool)

(assert (=> b!1387598 (= res!928036 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32370))))

(declare-fun b!1387599 () Bool)

(declare-fun Unit!46229 () Unit!46227)

(assert (=> b!1387599 (= e!786178 Unit!46229)))

(assert (= (and start!118794 res!928041) b!1387593))

(assert (= (and b!1387593 res!928039) b!1387594))

(assert (= (and b!1387594 res!928040) b!1387598))

(assert (= (and b!1387598 res!928036) b!1387595))

(assert (= (and b!1387595 res!928042) b!1387597))

(assert (= (and b!1387597 res!928038) b!1387596))

(assert (= (and b!1387596 res!928037) b!1387592))

(assert (= (and b!1387596 c!129225) b!1387591))

(assert (= (and b!1387596 (not c!129225)) b!1387599))

(declare-fun m!1273263 () Bool)

(assert (=> b!1387598 m!1273263))

(declare-fun m!1273265 () Bool)

(assert (=> b!1387591 m!1273265))

(declare-fun m!1273267 () Bool)

(assert (=> b!1387591 m!1273267))

(assert (=> b!1387591 m!1273267))

(declare-fun m!1273269 () Bool)

(assert (=> b!1387591 m!1273269))

(declare-fun m!1273271 () Bool)

(assert (=> b!1387591 m!1273271))

(declare-fun m!1273273 () Bool)

(assert (=> b!1387591 m!1273273))

(declare-fun m!1273275 () Bool)

(assert (=> b!1387591 m!1273275))

(declare-fun m!1273277 () Bool)

(assert (=> b!1387591 m!1273277))

(assert (=> b!1387591 m!1273275))

(declare-fun m!1273279 () Bool)

(assert (=> b!1387591 m!1273279))

(declare-fun m!1273281 () Bool)

(assert (=> b!1387597 m!1273281))

(assert (=> b!1387594 m!1273281))

(assert (=> b!1387594 m!1273281))

(declare-fun m!1273283 () Bool)

(assert (=> b!1387594 m!1273283))

(declare-fun m!1273285 () Bool)

(assert (=> start!118794 m!1273285))

(declare-fun m!1273287 () Bool)

(assert (=> start!118794 m!1273287))

(declare-fun m!1273289 () Bool)

(assert (=> b!1387595 m!1273289))

(assert (=> b!1387592 m!1273275))

(assert (=> b!1387592 m!1273275))

(declare-fun m!1273291 () Bool)

(assert (=> b!1387592 m!1273291))

(push 1)

(assert (not b!1387595))

(assert (not start!118794))

(assert (not b!1387591))

(assert (not b!1387594))

(assert (not b!1387598))

(assert (not b!1387592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

