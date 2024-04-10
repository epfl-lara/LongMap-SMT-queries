; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118328 () Bool)

(assert start!118328)

(declare-fun b!1383952 () Bool)

(declare-datatypes ((Unit!46116 0))(
  ( (Unit!46117) )
))
(declare-fun e!784282 () Unit!46116)

(declare-fun Unit!46118 () Unit!46116)

(assert (=> b!1383952 (= e!784282 Unit!46118)))

(declare-fun b!1383953 () Bool)

(declare-fun lt!608730 () Unit!46116)

(assert (=> b!1383953 (= e!784282 lt!608730)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun lt!608729 () Unit!46116)

(declare-datatypes ((array!94631 0))(
  ( (array!94632 (arr!45693 (Array (_ BitVec 32) (_ BitVec 64))) (size!46243 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94631)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46116)

(assert (=> b!1383953 (= lt!608729 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10086 0))(
  ( (MissingZero!10086 (index!42715 (_ BitVec 32))) (Found!10086 (index!42716 (_ BitVec 32))) (Intermediate!10086 (undefined!10898 Bool) (index!42717 (_ BitVec 32)) (x!124223 (_ BitVec 32))) (Undefined!10086) (MissingVacant!10086 (index!42718 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94631 (_ BitVec 32)) SeekEntryResult!10086)

(assert (=> b!1383953 (= (seekEntryOrOpen!0 (select (arr!45693 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45693 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94632 (store (arr!45693 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46243 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94631 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46116)

(assert (=> b!1383953 (= lt!608730 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94631 (_ BitVec 32)) Bool)

(assert (=> b!1383953 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1383954 () Bool)

(declare-fun res!925501 () Bool)

(declare-fun e!784281 () Bool)

(assert (=> b!1383954 (=> (not res!925501) (not e!784281))))

(assert (=> b!1383954 (= res!925501 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383956 () Bool)

(declare-fun res!925500 () Bool)

(assert (=> b!1383956 (=> (not res!925500) (not e!784281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383956 (= res!925500 (validKeyInArray!0 (select (arr!45693 a!2938) i!1065)))))

(declare-fun b!1383957 () Bool)

(declare-fun e!784280 () Bool)

(assert (=> b!1383957 (= e!784280 (validKeyInArray!0 (select (arr!45693 a!2938) startIndex!16)))))

(declare-fun b!1383958 () Bool)

(declare-fun res!925504 () Bool)

(assert (=> b!1383958 (=> (not res!925504) (not e!784281))))

(assert (=> b!1383958 (= res!925504 (and (= (size!46243 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46243 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46243 a!2938))))))

(declare-fun b!1383955 () Bool)

(assert (=> b!1383955 (= e!784281 false)))

(declare-fun lt!608728 () Unit!46116)

(assert (=> b!1383955 (= lt!608728 e!784282)))

(declare-fun c!128667 () Bool)

(assert (=> b!1383955 (= c!128667 e!784280)))

(declare-fun res!925499 () Bool)

(assert (=> b!1383955 (=> (not res!925499) (not e!784280))))

(assert (=> b!1383955 (= res!925499 (not (= startIndex!16 i!1065)))))

(declare-fun res!925502 () Bool)

(assert (=> start!118328 (=> (not res!925502) (not e!784281))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118328 (= res!925502 (validMask!0 mask!2987))))

(assert (=> start!118328 e!784281))

(assert (=> start!118328 true))

(declare-fun array_inv!34721 (array!94631) Bool)

(assert (=> start!118328 (array_inv!34721 a!2938)))

(declare-fun b!1383959 () Bool)

(declare-fun res!925498 () Bool)

(assert (=> b!1383959 (=> (not res!925498) (not e!784281))))

(assert (=> b!1383959 (= res!925498 (and (not (= (select (arr!45693 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45693 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383960 () Bool)

(declare-fun res!925503 () Bool)

(assert (=> b!1383960 (=> (not res!925503) (not e!784281))))

(declare-datatypes ((List!32221 0))(
  ( (Nil!32218) (Cons!32217 (h!33426 (_ BitVec 64)) (t!46915 List!32221)) )
))
(declare-fun arrayNoDuplicates!0 (array!94631 (_ BitVec 32) List!32221) Bool)

(assert (=> b!1383960 (= res!925503 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32218))))

(assert (= (and start!118328 res!925502) b!1383958))

(assert (= (and b!1383958 res!925504) b!1383956))

(assert (= (and b!1383956 res!925500) b!1383960))

(assert (= (and b!1383960 res!925503) b!1383954))

(assert (= (and b!1383954 res!925501) b!1383959))

(assert (= (and b!1383959 res!925498) b!1383955))

(assert (= (and b!1383955 res!925499) b!1383957))

(assert (= (and b!1383955 c!128667) b!1383953))

(assert (= (and b!1383955 (not c!128667)) b!1383952))

(declare-fun m!1269141 () Bool)

(assert (=> b!1383957 m!1269141))

(assert (=> b!1383957 m!1269141))

(declare-fun m!1269143 () Bool)

(assert (=> b!1383957 m!1269143))

(declare-fun m!1269145 () Bool)

(assert (=> b!1383954 m!1269145))

(declare-fun m!1269147 () Bool)

(assert (=> start!118328 m!1269147))

(declare-fun m!1269149 () Bool)

(assert (=> start!118328 m!1269149))

(declare-fun m!1269151 () Bool)

(assert (=> b!1383960 m!1269151))

(declare-fun m!1269153 () Bool)

(assert (=> b!1383959 m!1269153))

(declare-fun m!1269155 () Bool)

(assert (=> b!1383953 m!1269155))

(declare-fun m!1269157 () Bool)

(assert (=> b!1383953 m!1269157))

(assert (=> b!1383953 m!1269157))

(declare-fun m!1269159 () Bool)

(assert (=> b!1383953 m!1269159))

(declare-fun m!1269161 () Bool)

(assert (=> b!1383953 m!1269161))

(declare-fun m!1269163 () Bool)

(assert (=> b!1383953 m!1269163))

(assert (=> b!1383953 m!1269141))

(declare-fun m!1269165 () Bool)

(assert (=> b!1383953 m!1269165))

(assert (=> b!1383953 m!1269141))

(declare-fun m!1269167 () Bool)

(assert (=> b!1383953 m!1269167))

(assert (=> b!1383956 m!1269153))

(assert (=> b!1383956 m!1269153))

(declare-fun m!1269169 () Bool)

(assert (=> b!1383956 m!1269169))

(check-sat (not b!1383957) (not b!1383960) (not start!118328) (not b!1383954) (not b!1383953) (not b!1383956))
