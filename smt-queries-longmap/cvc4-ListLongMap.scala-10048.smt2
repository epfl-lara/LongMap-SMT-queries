; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118396 () Bool)

(assert start!118396)

(declare-fun b!1384906 () Bool)

(declare-datatypes ((Unit!46218 0))(
  ( (Unit!46219) )
))
(declare-fun e!784726 () Unit!46218)

(declare-fun lt!609108 () Unit!46218)

(assert (=> b!1384906 (= e!784726 lt!609108)))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94699 0))(
  ( (array!94700 (arr!45727 (Array (_ BitVec 32) (_ BitVec 64))) (size!46277 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94699)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun lt!609106 () Unit!46218)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46218)

(assert (=> b!1384906 (= lt!609106 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10120 0))(
  ( (MissingZero!10120 (index!42851 (_ BitVec 32))) (Found!10120 (index!42852 (_ BitVec 32))) (Intermediate!10120 (undefined!10932 Bool) (index!42853 (_ BitVec 32)) (x!124345 (_ BitVec 32))) (Undefined!10120) (MissingVacant!10120 (index!42854 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94699 (_ BitVec 32)) SeekEntryResult!10120)

(assert (=> b!1384906 (= (seekEntryOrOpen!0 (select (arr!45727 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45727 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94700 (store (arr!45727 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46277 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94699 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46218)

(assert (=> b!1384906 (= lt!609108 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94699 (_ BitVec 32)) Bool)

(assert (=> b!1384906 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384907 () Bool)

(declare-fun res!926254 () Bool)

(declare-fun e!784727 () Bool)

(assert (=> b!1384907 (=> (not res!926254) (not e!784727))))

(assert (=> b!1384907 (= res!926254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384908 () Bool)

(assert (=> b!1384908 (= e!784727 false)))

(declare-fun lt!609107 () Unit!46218)

(assert (=> b!1384908 (= lt!609107 e!784726)))

(declare-fun c!128769 () Bool)

(declare-fun e!784724 () Bool)

(assert (=> b!1384908 (= c!128769 e!784724)))

(declare-fun res!926249 () Bool)

(assert (=> b!1384908 (=> (not res!926249) (not e!784724))))

(assert (=> b!1384908 (= res!926249 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384909 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384909 (= e!784724 (validKeyInArray!0 (select (arr!45727 a!2938) startIndex!16)))))

(declare-fun b!1384910 () Bool)

(declare-fun res!926253 () Bool)

(assert (=> b!1384910 (=> (not res!926253) (not e!784727))))

(assert (=> b!1384910 (= res!926253 (validKeyInArray!0 (select (arr!45727 a!2938) i!1065)))))

(declare-fun b!1384911 () Bool)

(declare-fun res!926252 () Bool)

(assert (=> b!1384911 (=> (not res!926252) (not e!784727))))

(assert (=> b!1384911 (= res!926252 (and (not (= (select (arr!45727 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45727 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!926248 () Bool)

(assert (=> start!118396 (=> (not res!926248) (not e!784727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118396 (= res!926248 (validMask!0 mask!2987))))

(assert (=> start!118396 e!784727))

(assert (=> start!118396 true))

(declare-fun array_inv!34755 (array!94699) Bool)

(assert (=> start!118396 (array_inv!34755 a!2938)))

(declare-fun b!1384912 () Bool)

(declare-fun res!926250 () Bool)

(assert (=> b!1384912 (=> (not res!926250) (not e!784727))))

(declare-datatypes ((List!32255 0))(
  ( (Nil!32252) (Cons!32251 (h!33460 (_ BitVec 64)) (t!46949 List!32255)) )
))
(declare-fun arrayNoDuplicates!0 (array!94699 (_ BitVec 32) List!32255) Bool)

(assert (=> b!1384912 (= res!926250 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32252))))

(declare-fun b!1384913 () Bool)

(declare-fun res!926251 () Bool)

(assert (=> b!1384913 (=> (not res!926251) (not e!784727))))

(assert (=> b!1384913 (= res!926251 (and (= (size!46277 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46277 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46277 a!2938))))))

(declare-fun b!1384914 () Bool)

(declare-fun Unit!46220 () Unit!46218)

(assert (=> b!1384914 (= e!784726 Unit!46220)))

(assert (= (and start!118396 res!926248) b!1384913))

(assert (= (and b!1384913 res!926251) b!1384910))

(assert (= (and b!1384910 res!926253) b!1384912))

(assert (= (and b!1384912 res!926250) b!1384907))

(assert (= (and b!1384907 res!926254) b!1384911))

(assert (= (and b!1384911 res!926252) b!1384908))

(assert (= (and b!1384908 res!926249) b!1384909))

(assert (= (and b!1384908 c!128769) b!1384906))

(assert (= (and b!1384908 (not c!128769)) b!1384914))

(declare-fun m!1270209 () Bool)

(assert (=> b!1384909 m!1270209))

(assert (=> b!1384909 m!1270209))

(declare-fun m!1270211 () Bool)

(assert (=> b!1384909 m!1270211))

(declare-fun m!1270213 () Bool)

(assert (=> start!118396 m!1270213))

(declare-fun m!1270215 () Bool)

(assert (=> start!118396 m!1270215))

(declare-fun m!1270217 () Bool)

(assert (=> b!1384907 m!1270217))

(declare-fun m!1270219 () Bool)

(assert (=> b!1384906 m!1270219))

(declare-fun m!1270221 () Bool)

(assert (=> b!1384906 m!1270221))

(assert (=> b!1384906 m!1270221))

(declare-fun m!1270223 () Bool)

(assert (=> b!1384906 m!1270223))

(declare-fun m!1270225 () Bool)

(assert (=> b!1384906 m!1270225))

(declare-fun m!1270227 () Bool)

(assert (=> b!1384906 m!1270227))

(assert (=> b!1384906 m!1270209))

(declare-fun m!1270229 () Bool)

(assert (=> b!1384906 m!1270229))

(assert (=> b!1384906 m!1270209))

(declare-fun m!1270231 () Bool)

(assert (=> b!1384906 m!1270231))

(declare-fun m!1270233 () Bool)

(assert (=> b!1384911 m!1270233))

(assert (=> b!1384910 m!1270233))

(assert (=> b!1384910 m!1270233))

(declare-fun m!1270235 () Bool)

(assert (=> b!1384910 m!1270235))

(declare-fun m!1270237 () Bool)

(assert (=> b!1384912 m!1270237))

(push 1)

(assert (not b!1384910))

(assert (not start!118396))

(assert (not b!1384907))

(assert (not b!1384909))

(assert (not b!1384912))

(assert (not b!1384906))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

