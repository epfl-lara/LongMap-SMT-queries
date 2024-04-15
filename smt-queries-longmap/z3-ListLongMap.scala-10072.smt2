; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118562 () Bool)

(assert start!118562)

(declare-fun res!927323 () Bool)

(declare-fun e!785233 () Bool)

(assert (=> start!118562 (=> (not res!927323) (not e!785233))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118562 (= res!927323 (validMask!0 mask!2987))))

(assert (=> start!118562 e!785233))

(assert (=> start!118562 true))

(declare-datatypes ((array!94791 0))(
  ( (array!94792 (arr!45772 (Array (_ BitVec 32) (_ BitVec 64))) (size!46324 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94791)

(declare-fun array_inv!35005 (array!94791) Bool)

(assert (=> start!118562 (array_inv!35005 a!2938)))

(declare-fun b!1386030 () Bool)

(declare-fun res!927324 () Bool)

(assert (=> b!1386030 (=> (not res!927324) (not e!785233))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386030 (= res!927324 (and (= (size!46324 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46324 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46324 a!2938))))))

(declare-fun b!1386031 () Bool)

(assert (=> b!1386031 (= e!785233 (not (or (bvsgt #b00000000000000000000000000000000 (size!46324 a!2938)) (bvsle startIndex!16 (size!46324 a!2938)))))))

(declare-datatypes ((SeekEntryResult!10141 0))(
  ( (MissingZero!10141 (index!42935 (_ BitVec 32))) (Found!10141 (index!42936 (_ BitVec 32))) (Intermediate!10141 (undefined!10953 Bool) (index!42937 (_ BitVec 32)) (x!124555 (_ BitVec 32))) (Undefined!10141) (MissingVacant!10141 (index!42938 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94791 (_ BitVec 32)) SeekEntryResult!10141)

(assert (=> b!1386031 (= (seekEntryOrOpen!0 (select (arr!45772 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45772 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94792 (store (arr!45772 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46324 a!2938)) mask!2987))))

(declare-datatypes ((Unit!46113 0))(
  ( (Unit!46114) )
))
(declare-fun lt!609188 () Unit!46113)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94791 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46113)

(assert (=> b!1386031 (= lt!609188 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-fun b!1386032 () Bool)

(declare-fun res!927329 () Bool)

(assert (=> b!1386032 (=> (not res!927329) (not e!785233))))

(assert (=> b!1386032 (= res!927329 (and (not (= (select (arr!45772 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45772 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= startIndex!16 i!1065))))))

(declare-fun b!1386033 () Bool)

(declare-fun res!927326 () Bool)

(assert (=> b!1386033 (=> (not res!927326) (not e!785233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94791 (_ BitVec 32)) Bool)

(assert (=> b!1386033 (= res!927326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386034 () Bool)

(declare-fun res!927327 () Bool)

(assert (=> b!1386034 (=> (not res!927327) (not e!785233))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386034 (= res!927327 (validKeyInArray!0 (select (arr!45772 a!2938) startIndex!16)))))

(declare-fun b!1386035 () Bool)

(declare-fun res!927325 () Bool)

(assert (=> b!1386035 (=> (not res!927325) (not e!785233))))

(assert (=> b!1386035 (= res!927325 (validKeyInArray!0 (select (arr!45772 a!2938) i!1065)))))

(declare-fun b!1386036 () Bool)

(declare-fun res!927328 () Bool)

(assert (=> b!1386036 (=> (not res!927328) (not e!785233))))

(declare-datatypes ((List!32378 0))(
  ( (Nil!32375) (Cons!32374 (h!33583 (_ BitVec 64)) (t!47064 List!32378)) )
))
(declare-fun arrayNoDuplicates!0 (array!94791 (_ BitVec 32) List!32378) Bool)

(assert (=> b!1386036 (= res!927328 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32375))))

(assert (= (and start!118562 res!927323) b!1386030))

(assert (= (and b!1386030 res!927324) b!1386035))

(assert (= (and b!1386035 res!927325) b!1386036))

(assert (= (and b!1386036 res!927328) b!1386033))

(assert (= (and b!1386033 res!927326) b!1386032))

(assert (= (and b!1386032 res!927329) b!1386034))

(assert (= (and b!1386034 res!927327) b!1386031))

(declare-fun m!1270911 () Bool)

(assert (=> b!1386034 m!1270911))

(assert (=> b!1386034 m!1270911))

(declare-fun m!1270913 () Bool)

(assert (=> b!1386034 m!1270913))

(declare-fun m!1270915 () Bool)

(assert (=> b!1386032 m!1270915))

(declare-fun m!1270917 () Bool)

(assert (=> start!118562 m!1270917))

(declare-fun m!1270919 () Bool)

(assert (=> start!118562 m!1270919))

(declare-fun m!1270921 () Bool)

(assert (=> b!1386036 m!1270921))

(declare-fun m!1270923 () Bool)

(assert (=> b!1386031 m!1270923))

(assert (=> b!1386031 m!1270923))

(declare-fun m!1270925 () Bool)

(assert (=> b!1386031 m!1270925))

(declare-fun m!1270927 () Bool)

(assert (=> b!1386031 m!1270927))

(declare-fun m!1270929 () Bool)

(assert (=> b!1386031 m!1270929))

(assert (=> b!1386031 m!1270911))

(assert (=> b!1386031 m!1270911))

(declare-fun m!1270931 () Bool)

(assert (=> b!1386031 m!1270931))

(assert (=> b!1386035 m!1270915))

(assert (=> b!1386035 m!1270915))

(declare-fun m!1270933 () Bool)

(assert (=> b!1386035 m!1270933))

(declare-fun m!1270935 () Bool)

(assert (=> b!1386033 m!1270935))

(check-sat (not start!118562) (not b!1386033) (not b!1386034) (not b!1386036) (not b!1386031) (not b!1386035))
(check-sat)
