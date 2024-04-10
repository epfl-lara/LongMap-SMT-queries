; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!118330 () Bool)

(assert start!118330)

(declare-fun b!1383979 () Bool)

(declare-fun e!784295 () Bool)

(assert (=> b!1383979 (= e!784295 false)))

(declare-datatypes ((Unit!46119 0))(
  ( (Unit!46120) )
))
(declare-fun lt!608738 () Unit!46119)

(declare-fun e!784293 () Unit!46119)

(assert (=> b!1383979 (= lt!608738 e!784293)))

(declare-fun c!128670 () Bool)

(declare-fun e!784294 () Bool)

(assert (=> b!1383979 (= c!128670 e!784294)))

(declare-fun res!925524 () Bool)

(assert (=> b!1383979 (=> (not res!925524) (not e!784294))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun i!1065 () (_ BitVec 32))

(assert (=> b!1383979 (= res!925524 (not (= startIndex!16 i!1065)))))

(declare-fun res!925521 () Bool)

(assert (=> start!118330 (=> (not res!925521) (not e!784295))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118330 (= res!925521 (validMask!0 mask!2987))))

(assert (=> start!118330 e!784295))

(assert (=> start!118330 true))

(declare-datatypes ((array!94633 0))(
  ( (array!94634 (arr!45694 (Array (_ BitVec 32) (_ BitVec 64))) (size!46244 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94633)

(declare-fun array_inv!34722 (array!94633) Bool)

(assert (=> start!118330 (array_inv!34722 a!2938)))

(declare-fun b!1383980 () Bool)

(declare-fun res!925520 () Bool)

(assert (=> b!1383980 (=> (not res!925520) (not e!784295))))

(assert (=> b!1383980 (= res!925520 (and (= (size!46244 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46244 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46244 a!2938))))))

(declare-fun b!1383981 () Bool)

(declare-fun res!925523 () Bool)

(assert (=> b!1383981 (=> (not res!925523) (not e!784295))))

(assert (=> b!1383981 (= res!925523 (and (not (= (select (arr!45694 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45694 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1383982 () Bool)

(declare-fun res!925525 () Bool)

(assert (=> b!1383982 (=> (not res!925525) (not e!784295))))

(declare-datatypes ((List!32222 0))(
  ( (Nil!32219) (Cons!32218 (h!33427 (_ BitVec 64)) (t!46916 List!32222)) )
))
(declare-fun arrayNoDuplicates!0 (array!94633 (_ BitVec 32) List!32222) Bool)

(assert (=> b!1383982 (= res!925525 (arrayNoDuplicates!0 a!2938 #b00000000000000000000000000000000 Nil!32219))))

(declare-fun b!1383983 () Bool)

(declare-fun res!925519 () Bool)

(assert (=> b!1383983 (=> (not res!925519) (not e!784295))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!94633 (_ BitVec 32)) Bool)

(assert (=> b!1383983 (= res!925519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2938 mask!2987))))

(declare-fun b!1383984 () Bool)

(declare-fun Unit!46121 () Unit!46119)

(assert (=> b!1383984 (= e!784293 Unit!46121)))

(declare-fun b!1383985 () Bool)

(declare-fun lt!608739 () Unit!46119)

(assert (=> b!1383985 (= e!784293 lt!608739)))

(declare-fun lt!608737 () Unit!46119)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 (array!94633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46119)

(assert (=> b!1383985 (= lt!608737 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2!0 a!2938 i!1065 startIndex!16 mask!2987))))

(declare-datatypes ((SeekEntryResult!10087 0))(
  ( (MissingZero!10087 (index!42719 (_ BitVec 32))) (Found!10087 (index!42720 (_ BitVec 32))) (Intermediate!10087 (undefined!10899 Bool) (index!42721 (_ BitVec 32)) (x!124224 (_ BitVec 32))) (Undefined!10087) (MissingVacant!10087 (index!42722 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!94633 (_ BitVec 32)) SeekEntryResult!10087)

(assert (=> b!1383985 (= (seekEntryOrOpen!0 (select (arr!45694 a!2938) startIndex!16) a!2938 mask!2987) (seekEntryOrOpen!0 (select (store (arr!45694 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) startIndex!16) (array!94634 (store (arr!45694 a!2938) i!1065 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46244 a!2938)) mask!2987))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!94633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46119)

(assert (=> b!1383985 (= lt!608739 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2938 mask!2987 #b00000000000000000000000000000000 startIndex!16))))

(assert (=> b!1383985 (arrayForallSeekEntryOrOpenFound!0 startIndex!16 a!2938 mask!2987)))

(declare-fun b!1383986 () Bool)

(declare-fun res!925522 () Bool)

(assert (=> b!1383986 (=> (not res!925522) (not e!784295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1383986 (= res!925522 (validKeyInArray!0 (select (arr!45694 a!2938) i!1065)))))

(declare-fun b!1383987 () Bool)

(assert (=> b!1383987 (= e!784294 (validKeyInArray!0 (select (arr!45694 a!2938) startIndex!16)))))

(assert (= (and start!118330 res!925521) b!1383980))

(assert (= (and b!1383980 res!925520) b!1383986))

(assert (= (and b!1383986 res!925522) b!1383982))

(assert (= (and b!1383982 res!925525) b!1383983))

(assert (= (and b!1383983 res!925519) b!1383981))

(assert (= (and b!1383981 res!925523) b!1383979))

(assert (= (and b!1383979 res!925524) b!1383987))

(assert (= (and b!1383979 c!128670) b!1383985))

(assert (= (and b!1383979 (not c!128670)) b!1383984))

(declare-fun m!1269171 () Bool)

(assert (=> start!118330 m!1269171))

(declare-fun m!1269173 () Bool)

(assert (=> start!118330 m!1269173))

(declare-fun m!1269175 () Bool)

(assert (=> b!1383986 m!1269175))

(assert (=> b!1383986 m!1269175))

(declare-fun m!1269177 () Bool)

(assert (=> b!1383986 m!1269177))

(declare-fun m!1269179 () Bool)

(assert (=> b!1383982 m!1269179))

(declare-fun m!1269181 () Bool)

(assert (=> b!1383985 m!1269181))

(declare-fun m!1269183 () Bool)

(assert (=> b!1383985 m!1269183))

(assert (=> b!1383985 m!1269183))

(declare-fun m!1269185 () Bool)

(assert (=> b!1383985 m!1269185))

(declare-fun m!1269187 () Bool)

(assert (=> b!1383985 m!1269187))

(declare-fun m!1269189 () Bool)

(assert (=> b!1383985 m!1269189))

(declare-fun m!1269191 () Bool)

(assert (=> b!1383985 m!1269191))

(declare-fun m!1269193 () Bool)

(assert (=> b!1383985 m!1269193))

(assert (=> b!1383985 m!1269191))

(declare-fun m!1269195 () Bool)

(assert (=> b!1383985 m!1269195))

(assert (=> b!1383981 m!1269175))

(assert (=> b!1383987 m!1269191))

(assert (=> b!1383987 m!1269191))

(declare-fun m!1269197 () Bool)

(assert (=> b!1383987 m!1269197))

(declare-fun m!1269199 () Bool)

(assert (=> b!1383983 m!1269199))

(push 1)

(assert (not start!118330))

(assert (not b!1383986))

(assert (not b!1383987))

(assert (not b!1383985))

(assert (not b!1383982))

(assert (not b!1383983))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

