; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86552 () Bool)

(assert start!86552)

(declare-fun b!1003197 () Bool)

(declare-fun res!672684 () Bool)

(declare-fun e!565069 () Bool)

(assert (=> b!1003197 (=> (not res!672684) (not e!565069))))

(declare-datatypes ((array!63353 0))(
  ( (array!63354 (arr!30502 (Array (_ BitVec 32) (_ BitVec 64))) (size!31004 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63353)

(declare-datatypes ((List!21178 0))(
  ( (Nil!21175) (Cons!21174 (h!22351 (_ BitVec 64)) (t!30179 List!21178)) )
))
(declare-fun arrayNoDuplicates!0 (array!63353 (_ BitVec 32) List!21178) Bool)

(assert (=> b!1003197 (= res!672684 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21175))))

(declare-fun b!1003198 () Bool)

(declare-fun e!565063 () Bool)

(assert (=> b!1003198 (= e!565069 e!565063)))

(declare-fun res!672686 () Bool)

(assert (=> b!1003198 (=> (not res!672686) (not e!565063))))

(declare-datatypes ((SeekEntryResult!9434 0))(
  ( (MissingZero!9434 (index!40107 (_ BitVec 32))) (Found!9434 (index!40108 (_ BitVec 32))) (Intermediate!9434 (undefined!10246 Bool) (index!40109 (_ BitVec 32)) (x!87518 (_ BitVec 32))) (Undefined!9434) (MissingVacant!9434 (index!40110 (_ BitVec 32))) )
))
(declare-fun lt!443556 () SeekEntryResult!9434)

(declare-fun lt!443561 () SeekEntryResult!9434)

(assert (=> b!1003198 (= res!672686 (= lt!443556 lt!443561))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1003198 (= lt!443561 (Intermediate!9434 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63353 (_ BitVec 32)) SeekEntryResult!9434)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003198 (= lt!443556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30502 a!3219) j!170) mask!3464) (select (arr!30502 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003199 () Bool)

(declare-fun res!672678 () Bool)

(declare-fun e!565066 () Bool)

(assert (=> b!1003199 (=> (not res!672678) (not e!565066))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63353 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003199 (= res!672678 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003200 () Bool)

(declare-fun res!672682 () Bool)

(assert (=> b!1003200 (=> (not res!672682) (not e!565069))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1003200 (= res!672682 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31004 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31004 a!3219))))))

(declare-fun b!1003201 () Bool)

(declare-fun res!672680 () Bool)

(declare-fun e!565067 () Bool)

(assert (=> b!1003201 (=> (not res!672680) (not e!565067))))

(declare-fun lt!443554 () SeekEntryResult!9434)

(declare-fun lt!443557 () array!63353)

(declare-fun lt!443560 () (_ BitVec 64))

(assert (=> b!1003201 (= res!672680 (not (= lt!443554 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443560 lt!443557 mask!3464))))))

(declare-fun res!672687 () Bool)

(assert (=> start!86552 (=> (not res!672687) (not e!565066))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86552 (= res!672687 (validMask!0 mask!3464))))

(assert (=> start!86552 e!565066))

(declare-fun array_inv!23626 (array!63353) Bool)

(assert (=> start!86552 (array_inv!23626 a!3219)))

(assert (=> start!86552 true))

(declare-fun b!1003202 () Bool)

(declare-fun res!672677 () Bool)

(assert (=> b!1003202 (=> (not res!672677) (not e!565066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003202 (= res!672677 (validKeyInArray!0 k!2224))))

(declare-fun b!1003203 () Bool)

(declare-fun e!565068 () Bool)

(assert (=> b!1003203 (= e!565068 false)))

(declare-fun lt!443555 () (_ BitVec 32))

(declare-fun lt!443559 () SeekEntryResult!9434)

(assert (=> b!1003203 (= lt!443559 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443555 lt!443560 lt!443557 mask!3464))))

(declare-fun b!1003204 () Bool)

(assert (=> b!1003204 (= e!565067 e!565068)))

(declare-fun res!672676 () Bool)

(assert (=> b!1003204 (=> (not res!672676) (not e!565068))))

(assert (=> b!1003204 (= res!672676 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443555 #b00000000000000000000000000000000) (bvslt lt!443555 (size!31004 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003204 (= lt!443555 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003205 () Bool)

(declare-fun res!672690 () Bool)

(assert (=> b!1003205 (=> (not res!672690) (not e!565069))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63353 (_ BitVec 32)) Bool)

(assert (=> b!1003205 (= res!672690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003206 () Bool)

(declare-fun res!672683 () Bool)

(assert (=> b!1003206 (=> (not res!672683) (not e!565068))))

(assert (=> b!1003206 (= res!672683 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443555 (select (arr!30502 a!3219) j!170) a!3219 mask!3464) lt!443561))))

(declare-fun b!1003207 () Bool)

(declare-fun res!672689 () Bool)

(assert (=> b!1003207 (=> (not res!672689) (not e!565067))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003207 (= res!672689 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003208 () Bool)

(declare-fun e!565065 () Bool)

(assert (=> b!1003208 (= e!565063 e!565065)))

(declare-fun res!672688 () Bool)

(assert (=> b!1003208 (=> (not res!672688) (not e!565065))))

(assert (=> b!1003208 (= res!672688 (= lt!443554 lt!443561))))

(assert (=> b!1003208 (= lt!443554 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30502 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003209 () Bool)

(declare-fun res!672685 () Bool)

(assert (=> b!1003209 (=> (not res!672685) (not e!565066))))

(assert (=> b!1003209 (= res!672685 (and (= (size!31004 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31004 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31004 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003210 () Bool)

(declare-fun res!672675 () Bool)

(assert (=> b!1003210 (=> (not res!672675) (not e!565066))))

(assert (=> b!1003210 (= res!672675 (validKeyInArray!0 (select (arr!30502 a!3219) j!170)))))

(declare-fun b!1003211 () Bool)

(assert (=> b!1003211 (= e!565066 e!565069)))

(declare-fun res!672679 () Bool)

(assert (=> b!1003211 (=> (not res!672679) (not e!565069))))

(declare-fun lt!443558 () SeekEntryResult!9434)

(assert (=> b!1003211 (= res!672679 (or (= lt!443558 (MissingVacant!9434 i!1194)) (= lt!443558 (MissingZero!9434 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63353 (_ BitVec 32)) SeekEntryResult!9434)

(assert (=> b!1003211 (= lt!443558 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003212 () Bool)

(assert (=> b!1003212 (= e!565065 e!565067)))

(declare-fun res!672681 () Bool)

(assert (=> b!1003212 (=> (not res!672681) (not e!565067))))

(assert (=> b!1003212 (= res!672681 (not (= lt!443556 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443560 mask!3464) lt!443560 lt!443557 mask!3464))))))

(assert (=> b!1003212 (= lt!443560 (select (store (arr!30502 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003212 (= lt!443557 (array!63354 (store (arr!30502 a!3219) i!1194 k!2224) (size!31004 a!3219)))))

(assert (= (and start!86552 res!672687) b!1003209))

(assert (= (and b!1003209 res!672685) b!1003210))

(assert (= (and b!1003210 res!672675) b!1003202))

(assert (= (and b!1003202 res!672677) b!1003199))

(assert (= (and b!1003199 res!672678) b!1003211))

(assert (= (and b!1003211 res!672679) b!1003205))

(assert (= (and b!1003205 res!672690) b!1003197))

(assert (= (and b!1003197 res!672684) b!1003200))

(assert (= (and b!1003200 res!672682) b!1003198))

(assert (= (and b!1003198 res!672686) b!1003208))

(assert (= (and b!1003208 res!672688) b!1003212))

(assert (= (and b!1003212 res!672681) b!1003201))

(assert (= (and b!1003201 res!672680) b!1003207))

(assert (= (and b!1003207 res!672689) b!1003204))

(assert (= (and b!1003204 res!672676) b!1003206))

(assert (= (and b!1003206 res!672683) b!1003203))

(declare-fun m!928949 () Bool)

(assert (=> b!1003212 m!928949))

(assert (=> b!1003212 m!928949))

(declare-fun m!928951 () Bool)

(assert (=> b!1003212 m!928951))

(declare-fun m!928953 () Bool)

(assert (=> b!1003212 m!928953))

(declare-fun m!928955 () Bool)

(assert (=> b!1003212 m!928955))

(declare-fun m!928957 () Bool)

(assert (=> b!1003208 m!928957))

(assert (=> b!1003208 m!928957))

(declare-fun m!928959 () Bool)

(assert (=> b!1003208 m!928959))

(declare-fun m!928961 () Bool)

(assert (=> b!1003211 m!928961))

(declare-fun m!928963 () Bool)

(assert (=> b!1003199 m!928963))

(assert (=> b!1003210 m!928957))

(assert (=> b!1003210 m!928957))

(declare-fun m!928965 () Bool)

(assert (=> b!1003210 m!928965))

(assert (=> b!1003198 m!928957))

(assert (=> b!1003198 m!928957))

(declare-fun m!928967 () Bool)

(assert (=> b!1003198 m!928967))

(assert (=> b!1003198 m!928967))

(assert (=> b!1003198 m!928957))

(declare-fun m!928969 () Bool)

(assert (=> b!1003198 m!928969))

(declare-fun m!928971 () Bool)

(assert (=> b!1003204 m!928971))

(declare-fun m!928973 () Bool)

(assert (=> b!1003201 m!928973))

(declare-fun m!928975 () Bool)

(assert (=> b!1003197 m!928975))

(assert (=> b!1003206 m!928957))

(assert (=> b!1003206 m!928957))

(declare-fun m!928977 () Bool)

(assert (=> b!1003206 m!928977))

(declare-fun m!928979 () Bool)

(assert (=> b!1003203 m!928979))

(declare-fun m!928981 () Bool)

(assert (=> b!1003205 m!928981))

(declare-fun m!928983 () Bool)

(assert (=> b!1003202 m!928983))

(declare-fun m!928985 () Bool)

(assert (=> start!86552 m!928985))

(declare-fun m!928987 () Bool)

(assert (=> start!86552 m!928987))

(push 1)

