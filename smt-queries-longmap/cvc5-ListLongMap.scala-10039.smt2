; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118338 () Bool)

(assert start!118338)

(declare-fun b!1384087 () Bool)

(declare-fun e!784340 () Bool)

(assert (=> b!1384087 (= e!784340 false)))

(declare-datatypes ((Unit!46131 0))(
  ( (Unit!46132) )
))
(declare-fun lt!608774 () Unit!46131)

(declare-fun e!784341 () Unit!46131)

(assert (=> b!1384087 (= lt!608774 e!784341)))

(declare-fun c!128682 () Bool)

(declare-fun e!784343 () Bool)

(assert (=> b!1384087 (= c!128682 e!784343)))

(declare-fun res!925607 () Bool)

(assert (=> b!1384087 (=> (not res!925607) (not e!784343))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1384087 (= res!925607 (not (= startIndex!16 i!1065)))))

(declare-fun b!1384088 () Bool)

(declare-fun res!925608 () Bool)

(assert (=> b!1384088 (=> (not res!925608) (not e!784340))))

(declare-datatypes ((array!94641 0))(
  ( (array!94642 (arr!45698 (Array (_ BitVec 32) (_ BitVec 64))) (size!46248 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94641)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384088 (= res!925608 (validKeyInArray!0 (select (arr!45698 a!2938) i!1065)))))

(declare-fun b!1384089 () Bool)

(declare-fun lt!608775 () Unit!46131)

(assert (=> b!1384089 (= e!784341 lt!608775)))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun lt!608773 () Unit!46131)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46131)

(assert (=> b!1384089 (= lt!608773 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10091 0))(
  ( (MissingZero!10091 (index!42735 (_ BitVec 32))) (Found!10091 (index!42736 (_ BitVec 32))) (Intermediate!10091 (undefined!10903 Bool) (index!42737 (_ BitVec 32)) (x!124244 (_ BitVec 32))) (Undefined!10091) (MissingVacant!10091 (index!42738 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94641 (_ BitVec 32)) SeekEntryResult!10091)

(assert (=> b!1384089 (= (seekEntryOrOpen!0 (select (arr!45698 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45698 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94642 (store (arr!45698 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46248 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94641 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46131)

(assert (=> b!1384089 (= lt!608775 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94641 (_ BitVec 32)) Bool)

(assert (=> b!1384089 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun res!925603 () Bool)

(assert (=> start!118338 (=> (not res!925603) (not e!784340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118338 (= res!925603 (validMask!0 mask!2987))))

(assert (=> start!118338 e!784340))

(assert (=> start!118338 true))

(declare-fun array_inv!34726 (array!94641) Bool)

(assert (=> start!118338 (array_inv!34726 a!2938)))

(declare-fun b!1384090 () Bool)

(declare-fun res!925605 () Bool)

(assert (=> b!1384090 (=> (not res!925605) (not e!784340))))

(assert (=> b!1384090 (= res!925605 (and (= (size!46248 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46248 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46248 a!2938))))))

(declare-fun b!1384091 () Bool)

(declare-fun res!925604 () Bool)

(assert (=> b!1384091 (=> (not res!925604) (not e!784340))))

(declare-datatypes ((List!32226 0))(
  ( (Nil!32223) (Cons!32222 (h!33431 (_ BitVec 64)) (t!46920 List!32226)) )
))
(declare-fun arrayNoDuplicates!0 (array!94641 (_ BitVec 32) List!32226) Bool)

(assert (=> b!1384091 (= res!925604 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32223))))

(declare-fun b!1384092 () Bool)

(declare-fun res!925606 () Bool)

(assert (=> b!1384092 (=> (not res!925606) (not e!784340))))

(assert (=> b!1384092 (= res!925606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1384093 () Bool)

(assert (=> b!1384093 (= e!784343 (validKeyInArray!0 (select (arr!45698 a!2938) startIndex!16)))))

(declare-fun b!1384094 () Bool)

(declare-fun res!925609 () Bool)

(assert (=> b!1384094 (=> (not res!925609) (not e!784340))))

(assert (=> b!1384094 (= res!925609 (and (not (= (select (arr!45698 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45698 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1384095 () Bool)

(declare-fun Unit!46133 () Unit!46131)

(assert (=> b!1384095 (= e!784341 Unit!46133)))

(assert (= (and start!118338 res!925603) b!1384090))

(assert (= (and b!1384090 res!925605) b!1384088))

(assert (= (and b!1384088 res!925608) b!1384091))

(assert (= (and b!1384091 res!925604) b!1384092))

(assert (= (and b!1384092 res!925606) b!1384094))

(assert (= (and b!1384094 res!925609) b!1384087))

(assert (= (and b!1384087 res!925607) b!1384093))

(assert (= (and b!1384087 c!128682) b!1384089))

(assert (= (and b!1384087 (not c!128682)) b!1384095))

(declare-fun m!1269291 () Bool)

(assert (=> start!118338 m!1269291))

(declare-fun m!1269293 () Bool)

(assert (=> start!118338 m!1269293))

(declare-fun m!1269295 () Bool)

(assert (=> b!1384093 m!1269295))

(assert (=> b!1384093 m!1269295))

(declare-fun m!1269297 () Bool)

(assert (=> b!1384093 m!1269297))

(declare-fun m!1269299 () Bool)

(assert (=> b!1384089 m!1269299))

(declare-fun m!1269301 () Bool)

(assert (=> b!1384089 m!1269301))

(assert (=> b!1384089 m!1269301))

(declare-fun m!1269303 () Bool)

(assert (=> b!1384089 m!1269303))

(declare-fun m!1269305 () Bool)

(assert (=> b!1384089 m!1269305))

(declare-fun m!1269307 () Bool)

(assert (=> b!1384089 m!1269307))

(assert (=> b!1384089 m!1269295))

(declare-fun m!1269309 () Bool)

(assert (=> b!1384089 m!1269309))

(assert (=> b!1384089 m!1269295))

(declare-fun m!1269311 () Bool)

(assert (=> b!1384089 m!1269311))

(declare-fun m!1269313 () Bool)

(assert (=> b!1384088 m!1269313))

(assert (=> b!1384088 m!1269313))

(declare-fun m!1269315 () Bool)

(assert (=> b!1384088 m!1269315))

(assert (=> b!1384094 m!1269313))

(declare-fun m!1269317 () Bool)

(assert (=> b!1384092 m!1269317))

(declare-fun m!1269319 () Bool)

(assert (=> b!1384091 m!1269319))

(push 1)

(assert (not b!1384093))

(assert (not b!1384089))

(assert (not start!118338))

(assert (not b!1384092))

(assert (not b!1384091))

(assert (not b!1384088))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

