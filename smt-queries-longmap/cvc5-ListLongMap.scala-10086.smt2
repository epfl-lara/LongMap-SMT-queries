; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118758 () Bool)

(assert start!118758)

(declare-fun b!1387792 () Bool)

(declare-fun res!928478 () Bool)

(declare-fun e!786136 () Bool)

(assert (=> b!1387792 (=> (not res!928478) (not e!786136))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-datatypes ((array!94882 0))(
  ( (array!94883 (arr!45816 (Array (_ BitVec 32) (_ BitVec 64))) (size!46368 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94882)

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1387792 (= res!928478 (and (= (size!46368 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46368 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46368 a!2938))))))

(declare-fun b!1387793 () Bool)

(assert (=> b!1387793 (= e!786136 false)))

(declare-datatypes ((Unit!46239 0))(
  ( (Unit!46240) )
))
(declare-fun lt!609885 () Unit!46239)

(declare-fun e!786135 () Unit!46239)

(assert (=> b!1387793 (= lt!609885 e!786135)))

(declare-fun c!129101 () Bool)

(declare-fun e!786133 () Bool)

(assert (=> b!1387793 (= c!129101 e!786133)))

(declare-fun res!928484 () Bool)

(assert (=> b!1387793 (=> (not res!928484) (not e!786133))))

(assert (=> b!1387793 (= res!928484 (not (= startIndex!16 i!1065)))))

(declare-fun b!1387794 () Bool)

(declare-fun res!928482 () Bool)

(assert (=> b!1387794 (=> (not res!928482) (not e!786136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94882 (_ BitVec 32)) Bool)

(assert (=> b!1387794 (= res!928482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun res!928480 () Bool)

(assert (=> start!118758 (=> (not res!928480) (not e!786136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118758 (= res!928480 (validMask!0 mask!2987))))

(assert (=> start!118758 e!786136))

(assert (=> start!118758 true))

(declare-fun array_inv!35049 (array!94882) Bool)

(assert (=> start!118758 (array_inv!35049 a!2938)))

(declare-fun b!1387795 () Bool)

(declare-fun res!928481 () Bool)

(assert (=> b!1387795 (=> (not res!928481) (not e!786136))))

(declare-datatypes ((List!32422 0))(
  ( (Nil!32419) (Cons!32418 (h!33630 (_ BitVec 64)) (t!47108 List!32422)) )
))
(declare-fun arrayNoDuplicates!0 (array!94882 (_ BitVec 32) List!32422) Bool)

(assert (=> b!1387795 (= res!928481 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32419))))

(declare-fun b!1387796 () Bool)

(declare-fun res!928483 () Bool)

(assert (=> b!1387796 (=> (not res!928483) (not e!786136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1387796 (= res!928483 (validKeyInArray!0 (select (arr!45816 a!2938) i!1065)))))

(declare-fun b!1387797 () Bool)

(declare-fun Unit!46241 () Unit!46239)

(assert (=> b!1387797 (= e!786135 Unit!46241)))

(declare-fun b!1387798 () Bool)

(declare-fun res!928479 () Bool)

(assert (=> b!1387798 (=> (not res!928479) (not e!786136))))

(assert (=> b!1387798 (= res!928479 (and (not (= (select (arr!45816 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45816 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1387799 () Bool)

(declare-fun lt!609887 () Unit!46239)

(assert (=> b!1387799 (= e!786135 lt!609887)))

(declare-fun lt!609886 () Unit!46239)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46239)

(assert (=> b!1387799 (= lt!609886 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10185 0))(
  ( (MissingZero!10185 (index!43111 (_ BitVec 32))) (Found!10185 (index!43112 (_ BitVec 32))) (Intermediate!10185 (undefined!10997 Bool) (index!43113 (_ BitVec 32)) (x!124720 (_ BitVec 32))) (Undefined!10185) (MissingVacant!10185 (index!43114 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94882 (_ BitVec 32)) SeekEntryResult!10185)

(assert (=> b!1387799 (= (seekEntryOrOpen!0 (select (arr!45816 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45816 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94883 (store (arr!45816 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46368 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94882 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46239)

(assert (=> b!1387799 (= lt!609887 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1387799 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1387800 () Bool)

(assert (=> b!1387800 (= e!786133 (validKeyInArray!0 (select (arr!45816 a!2938) startIndex!16)))))

(assert (= (and start!118758 res!928480) b!1387792))

(assert (= (and b!1387792 res!928478) b!1387796))

(assert (= (and b!1387796 res!928483) b!1387795))

(assert (= (and b!1387795 res!928481) b!1387794))

(assert (= (and b!1387794 res!928482) b!1387798))

(assert (= (and b!1387798 res!928479) b!1387793))

(assert (= (and b!1387793 res!928484) b!1387800))

(assert (= (and b!1387793 c!129101) b!1387799))

(assert (= (and b!1387793 (not c!129101)) b!1387797))

(declare-fun m!1273011 () Bool)

(assert (=> b!1387795 m!1273011))

(declare-fun m!1273013 () Bool)

(assert (=> b!1387796 m!1273013))

(assert (=> b!1387796 m!1273013))

(declare-fun m!1273015 () Bool)

(assert (=> b!1387796 m!1273015))

(declare-fun m!1273017 () Bool)

(assert (=> b!1387800 m!1273017))

(assert (=> b!1387800 m!1273017))

(declare-fun m!1273019 () Bool)

(assert (=> b!1387800 m!1273019))

(declare-fun m!1273021 () Bool)

(assert (=> b!1387794 m!1273021))

(declare-fun m!1273023 () Bool)

(assert (=> b!1387799 m!1273023))

(declare-fun m!1273025 () Bool)

(assert (=> b!1387799 m!1273025))

(assert (=> b!1387799 m!1273025))

(declare-fun m!1273027 () Bool)

(assert (=> b!1387799 m!1273027))

(declare-fun m!1273029 () Bool)

(assert (=> b!1387799 m!1273029))

(declare-fun m!1273031 () Bool)

(assert (=> b!1387799 m!1273031))

(assert (=> b!1387799 m!1273017))

(declare-fun m!1273033 () Bool)

(assert (=> b!1387799 m!1273033))

(assert (=> b!1387799 m!1273017))

(declare-fun m!1273035 () Bool)

(assert (=> b!1387799 m!1273035))

(assert (=> b!1387798 m!1273013))

(declare-fun m!1273037 () Bool)

(assert (=> start!118758 m!1273037))

(declare-fun m!1273039 () Bool)

(assert (=> start!118758 m!1273039))

(push 1)

(assert (not b!1387795))

(assert (not b!1387796))

(assert (not start!118758))

(assert (not b!1387800))

(assert (not b!1387794))

(assert (not b!1387799))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

