; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118402 () Bool)

(assert start!118402)

(declare-fun b!1384987 () Bool)

(declare-datatypes ((Unit!46227 0))(
  ( (Unit!46228) )
))
(declare-fun e!784760 () Unit!46227)

(declare-fun Unit!46229 () Unit!46227)

(assert (=> b!1384987 (= e!784760 Unit!46229)))

(declare-fun b!1384988 () Bool)

(declare-fun res!926311 () Bool)

(declare-fun e!784763 () Bool)

(assert (=> b!1384988 (=> (not res!926311) (not e!784763))))

(declare-datatypes ((array!94705 0))(
  ( (array!94706 (arr!45730 (Array (_ BitVec 32) (_ BitVec 64))) (size!46280 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94705)

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384988 (= res!926311 (and (not (= (select (arr!45730 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45730 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!926312 () Bool)

(assert (=> start!118402 (=> (not res!926312) (not e!784763))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118402 (= res!926312 (validMask!0 mask!2987))))

(assert (=> start!118402 e!784763))

(assert (=> start!118402 true))

(declare-fun array_inv!34758 (array!94705) Bool)

(assert (=> start!118402 (array_inv!34758 a!2938)))

(declare-fun b!1384989 () Bool)

(declare-fun res!926317 () Bool)

(assert (=> b!1384989 (=> (not res!926317) (not e!784763))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384989 (= res!926317 (and (= (size!46280 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46280 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46280 a!2938))))))

(declare-fun b!1384990 () Bool)

(declare-fun res!926315 () Bool)

(assert (=> b!1384990 (=> (not res!926315) (not e!784763))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94705 (_ BitVec 32)) Bool)

(assert (=> b!1384990 (= res!926315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384991 () Bool)

(declare-fun res!926313 () Bool)

(assert (=> b!1384991 (=> (not res!926313) (not e!784763))))

(declare-datatypes ((List!32258 0))(
  ( (Nil!32255) (Cons!32254 (h!33463 (_ BitVec 64)) (t!46952 List!32258)) )
))
(declare-fun arrayNoDuplicates!0 (array!94705 (_ BitVec 32) List!32258) Bool)

(assert (=> b!1384991 (= res!926313 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32255))))

(declare-fun b!1384992 () Bool)

(declare-fun e!784761 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384992 (= e!784761 (validKeyInArray!0 (select (arr!45730 a!2938) startIndex!16)))))

(declare-fun b!1384993 () Bool)

(declare-fun res!926314 () Bool)

(assert (=> b!1384993 (=> (not res!926314) (not e!784763))))

(assert (=> b!1384993 (= res!926314 (validKeyInArray!0 (select (arr!45730 a!2938) i!1065)))))

(declare-fun b!1384994 () Bool)

(declare-fun lt!609135 () Unit!46227)

(assert (=> b!1384994 (= e!784760 lt!609135)))

(declare-fun lt!609133 () Unit!46227)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46227)

(assert (=> b!1384994 (= lt!609133 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10123 0))(
  ( (MissingZero!10123 (index!42863 (_ BitVec 32))) (Found!10123 (index!42864 (_ BitVec 32))) (Intermediate!10123 (undefined!10935 Bool) (index!42865 (_ BitVec 32)) (x!124356 (_ BitVec 32))) (Undefined!10123) (MissingVacant!10123 (index!42866 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94705 (_ BitVec 32)) SeekEntryResult!10123)

(assert (=> b!1384994 (= (seekEntryOrOpen!0 (select (arr!45730 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45730 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94706 (store (arr!45730 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46280 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94705 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46227)

(assert (=> b!1384994 (= lt!609135 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1384994 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1384995 () Bool)

(assert (=> b!1384995 (= e!784763 false)))

(declare-fun lt!609134 () Unit!46227)

(assert (=> b!1384995 (= lt!609134 e!784760)))

(declare-fun c!128778 () Bool)

(assert (=> b!1384995 (= c!128778 e!784761)))

(declare-fun res!926316 () Bool)

(assert (=> b!1384995 (=> (not res!926316) (not e!784761))))

(assert (=> b!1384995 (= res!926316 (not (= startIndex!16 i!1065)))))

(assert (= (and start!118402 res!926312) b!1384989))

(assert (= (and b!1384989 res!926317) b!1384993))

(assert (= (and b!1384993 res!926314) b!1384991))

(assert (= (and b!1384991 res!926313) b!1384990))

(assert (= (and b!1384990 res!926315) b!1384988))

(assert (= (and b!1384988 res!926311) b!1384995))

(assert (= (and b!1384995 res!926316) b!1384992))

(assert (= (and b!1384995 c!128778) b!1384994))

(assert (= (and b!1384995 (not c!128778)) b!1384987))

(declare-fun m!1270299 () Bool)

(assert (=> b!1384990 m!1270299))

(declare-fun m!1270301 () Bool)

(assert (=> b!1384988 m!1270301))

(declare-fun m!1270303 () Bool)

(assert (=> b!1384991 m!1270303))

(declare-fun m!1270305 () Bool)

(assert (=> start!118402 m!1270305))

(declare-fun m!1270307 () Bool)

(assert (=> start!118402 m!1270307))

(declare-fun m!1270309 () Bool)

(assert (=> b!1384992 m!1270309))

(assert (=> b!1384992 m!1270309))

(declare-fun m!1270311 () Bool)

(assert (=> b!1384992 m!1270311))

(assert (=> b!1384993 m!1270301))

(assert (=> b!1384993 m!1270301))

(declare-fun m!1270313 () Bool)

(assert (=> b!1384993 m!1270313))

(declare-fun m!1270315 () Bool)

(assert (=> b!1384994 m!1270315))

(declare-fun m!1270317 () Bool)

(assert (=> b!1384994 m!1270317))

(assert (=> b!1384994 m!1270317))

(declare-fun m!1270319 () Bool)

(assert (=> b!1384994 m!1270319))

(declare-fun m!1270321 () Bool)

(assert (=> b!1384994 m!1270321))

(declare-fun m!1270323 () Bool)

(assert (=> b!1384994 m!1270323))

(assert (=> b!1384994 m!1270309))

(declare-fun m!1270325 () Bool)

(assert (=> b!1384994 m!1270325))

(assert (=> b!1384994 m!1270309))

(declare-fun m!1270327 () Bool)

(assert (=> b!1384994 m!1270327))

(push 1)

(assert (not b!1384991))

(assert (not b!1384992))

(assert (not start!118402))

(assert (not b!1384994))

(assert (not b!1384990))

