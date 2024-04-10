; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118626 () Bool)

(assert start!118626)

(declare-fun b!1386877 () Bool)

(declare-fun res!927985 () Bool)

(declare-fun e!785591 () Bool)

(assert (=> b!1386877 (=> (not res!927985) (not e!785591))))

(declare-datatypes ((array!94902 0))(
  ( (array!94903 (arr!45827 (Array (_ BitVec 32) (_ BitVec 64))) (size!46377 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94902)

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94902 (_ BitVec 32)) Bool)

(assert (=> b!1386877 (= res!927985 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1386878 () Bool)

(declare-fun res!927982 () Bool)

(assert (=> b!1386878 (=> (not res!927982) (not e!785591))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1386878 (= res!927982 (and (= (size!46377 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46377 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46377 a!2938))))))

(declare-fun b!1386879 () Bool)

(declare-fun res!927983 () Bool)

(assert (=> b!1386879 (=> (not res!927983) (not e!785591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1386879 (= res!927983 (validKeyInArray!0 (select (arr!45827 a!2938) i!1065)))))

(declare-fun res!927980 () Bool)

(assert (=> start!118626 (=> (not res!927980) (not e!785591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118626 (= res!927980 (validMask!0 mask!2987))))

(assert (=> start!118626 e!785591))

(assert (=> start!118626 true))

(declare-fun array_inv!34855 (array!94902) Bool)

(assert (=> start!118626 (array_inv!34855 a!2938)))

(declare-fun b!1386880 () Bool)

(declare-fun res!927984 () Bool)

(assert (=> b!1386880 (=> (not res!927984) (not e!785591))))

(declare-datatypes ((List!32355 0))(
  ( (Nil!32352) (Cons!32351 (h!33560 (_ BitVec 64)) (t!47049 List!32355)) )
))
(declare-fun arrayNoDuplicates!0 (array!94902 (_ BitVec 32) List!32355) Bool)

(assert (=> b!1386880 (= res!927984 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32352))))

(declare-fun b!1386881 () Bool)

(declare-datatypes ((Unit!46352 0))(
  ( (Unit!46353) )
))
(declare-fun e!785593 () Unit!46352)

(declare-fun lt!609611 () Unit!46352)

(assert (=> b!1386881 (= e!785593 lt!609611)))

(declare-fun lt!609610 () Unit!46352)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46352)

(assert (=> b!1386881 (= lt!609610 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10170 0))(
  ( (MissingZero!10170 (index!43051 (_ BitVec 32))) (Found!10170 (index!43052 (_ BitVec 32))) (Intermediate!10170 (undefined!10982 Bool) (index!43053 (_ BitVec 32)) (x!124667 (_ BitVec 32))) (Undefined!10170) (MissingVacant!10170 (index!43054 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94902 (_ BitVec 32)) SeekEntryResult!10170)

(assert (=> b!1386881 (= (seekEntryOrOpen!0 (select (arr!45827 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45827 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94903 (store (arr!45827 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46377 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94902 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46352)

(assert (=> b!1386881 (= lt!609611 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1386881 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1386882 () Bool)

(declare-fun Unit!46354 () Unit!46352)

(assert (=> b!1386882 (= e!785593 Unit!46354)))

(declare-fun b!1386883 () Bool)

(declare-fun res!927979 () Bool)

(assert (=> b!1386883 (=> (not res!927979) (not e!785591))))

(assert (=> b!1386883 (= res!927979 (and (not (= (select (arr!45827 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45827 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1386884 () Bool)

(assert (=> b!1386884 (= e!785591 false)))

(declare-fun lt!609612 () Unit!46352)

(assert (=> b!1386884 (= lt!609612 e!785593)))

(declare-fun c!128889 () Bool)

(declare-fun e!785594 () Bool)

(assert (=> b!1386884 (= c!128889 e!785594)))

(declare-fun res!927981 () Bool)

(assert (=> b!1386884 (=> (not res!927981) (not e!785594))))

(assert (=> b!1386884 (= res!927981 (not (= startIndex!16 i!1065)))))

(declare-fun b!1386885 () Bool)

(assert (=> b!1386885 (= e!785594 (validKeyInArray!0 (select (arr!45827 a!2938) startIndex!16)))))

(assert (= (and start!118626 res!927980) b!1386878))

(assert (= (and b!1386878 res!927982) b!1386879))

(assert (= (and b!1386879 res!927983) b!1386880))

(assert (= (and b!1386880 res!927984) b!1386877))

(assert (= (and b!1386877 res!927985) b!1386883))

(assert (= (and b!1386883 res!927979) b!1386884))

(assert (= (and b!1386884 res!927981) b!1386885))

(assert (= (and b!1386884 c!128889) b!1386881))

(assert (= (and b!1386884 (not c!128889)) b!1386882))

(declare-fun m!1272291 () Bool)

(assert (=> b!1386883 m!1272291))

(declare-fun m!1272293 () Bool)

(assert (=> start!118626 m!1272293))

(declare-fun m!1272295 () Bool)

(assert (=> start!118626 m!1272295))

(assert (=> b!1386879 m!1272291))

(assert (=> b!1386879 m!1272291))

(declare-fun m!1272297 () Bool)

(assert (=> b!1386879 m!1272297))

(declare-fun m!1272299 () Bool)

(assert (=> b!1386885 m!1272299))

(assert (=> b!1386885 m!1272299))

(declare-fun m!1272301 () Bool)

(assert (=> b!1386885 m!1272301))

(declare-fun m!1272303 () Bool)

(assert (=> b!1386880 m!1272303))

(declare-fun m!1272305 () Bool)

(assert (=> b!1386881 m!1272305))

(declare-fun m!1272307 () Bool)

(assert (=> b!1386881 m!1272307))

(assert (=> b!1386881 m!1272307))

(declare-fun m!1272309 () Bool)

(assert (=> b!1386881 m!1272309))

(declare-fun m!1272311 () Bool)

(assert (=> b!1386881 m!1272311))

(declare-fun m!1272313 () Bool)

(assert (=> b!1386881 m!1272313))

(assert (=> b!1386881 m!1272299))

(declare-fun m!1272315 () Bool)

(assert (=> b!1386881 m!1272315))

(assert (=> b!1386881 m!1272299))

(declare-fun m!1272317 () Bool)

(assert (=> b!1386881 m!1272317))

(declare-fun m!1272319 () Bool)

(assert (=> b!1386877 m!1272319))

(push 1)

(assert (not start!118626))

(assert (not b!1386879))

(assert (not b!1386880))

(assert (not b!1386877))

(assert (not b!1386885))

(assert (not b!1386881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

