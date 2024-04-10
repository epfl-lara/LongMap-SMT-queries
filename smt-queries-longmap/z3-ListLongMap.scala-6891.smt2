; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86602 () Bool)

(assert start!86602)

(declare-fun b!1004397 () Bool)

(declare-fun res!673881 () Bool)

(declare-fun e!565594 () Bool)

(assert (=> b!1004397 (=> (not res!673881) (not e!565594))))

(declare-datatypes ((array!63403 0))(
  ( (array!63404 (arr!30527 (Array (_ BitVec 32) (_ BitVec 64))) (size!31029 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63403)

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63403 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004397 (= res!673881 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004398 () Bool)

(declare-fun res!673876 () Bool)

(declare-fun e!565592 () Bool)

(assert (=> b!1004398 (=> (not res!673876) (not e!565592))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004398 (= res!673876 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31029 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31029 a!3219))))))

(declare-fun b!1004399 () Bool)

(declare-fun e!565589 () Bool)

(assert (=> b!1004399 (= e!565592 e!565589)))

(declare-fun res!673887 () Bool)

(assert (=> b!1004399 (=> (not res!673887) (not e!565589))))

(declare-datatypes ((SeekEntryResult!9459 0))(
  ( (MissingZero!9459 (index!40207 (_ BitVec 32))) (Found!9459 (index!40208 (_ BitVec 32))) (Intermediate!9459 (undefined!10271 Bool) (index!40209 (_ BitVec 32)) (x!87607 (_ BitVec 32))) (Undefined!9459) (MissingVacant!9459 (index!40210 (_ BitVec 32))) )
))
(declare-fun lt!444160 () SeekEntryResult!9459)

(declare-fun lt!444154 () SeekEntryResult!9459)

(assert (=> b!1004399 (= res!673887 (= lt!444160 lt!444154))))

(assert (=> b!1004399 (= lt!444154 (Intermediate!9459 false resIndex!38 resX!38))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63403 (_ BitVec 32)) SeekEntryResult!9459)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004399 (= lt!444160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30527 a!3219) j!170) mask!3464) (select (arr!30527 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004400 () Bool)

(assert (=> b!1004400 (= e!565594 e!565592)))

(declare-fun res!673877 () Bool)

(assert (=> b!1004400 (=> (not res!673877) (not e!565592))))

(declare-fun lt!444157 () SeekEntryResult!9459)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004400 (= res!673877 (or (= lt!444157 (MissingVacant!9459 i!1194)) (= lt!444157 (MissingZero!9459 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63403 (_ BitVec 32)) SeekEntryResult!9459)

(assert (=> b!1004400 (= lt!444157 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun res!673886 () Bool)

(assert (=> start!86602 (=> (not res!673886) (not e!565594))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86602 (= res!673886 (validMask!0 mask!3464))))

(assert (=> start!86602 e!565594))

(declare-fun array_inv!23651 (array!63403) Bool)

(assert (=> start!86602 (array_inv!23651 a!3219)))

(assert (=> start!86602 true))

(declare-fun b!1004401 () Bool)

(declare-fun e!565593 () Bool)

(assert (=> b!1004401 (= e!565589 e!565593)))

(declare-fun res!673889 () Bool)

(assert (=> b!1004401 (=> (not res!673889) (not e!565593))))

(declare-fun lt!444158 () SeekEntryResult!9459)

(assert (=> b!1004401 (= res!673889 (= lt!444158 lt!444154))))

(assert (=> b!1004401 (= lt!444158 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30527 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004402 () Bool)

(declare-fun res!673882 () Bool)

(declare-fun e!565591 () Bool)

(assert (=> b!1004402 (=> (not res!673882) (not e!565591))))

(assert (=> b!1004402 (= res!673882 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004403 () Bool)

(declare-fun e!565590 () Bool)

(assert (=> b!1004403 (= e!565590 false)))

(declare-fun lt!444155 () (_ BitVec 32))

(declare-fun lt!444156 () SeekEntryResult!9459)

(declare-fun lt!444159 () array!63403)

(declare-fun lt!444161 () (_ BitVec 64))

(assert (=> b!1004403 (= lt!444156 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444155 lt!444161 lt!444159 mask!3464))))

(declare-fun b!1004404 () Bool)

(declare-fun res!673875 () Bool)

(assert (=> b!1004404 (=> (not res!673875) (not e!565591))))

(assert (=> b!1004404 (= res!673875 (not (= lt!444158 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444161 lt!444159 mask!3464))))))

(declare-fun b!1004405 () Bool)

(assert (=> b!1004405 (= e!565591 e!565590)))

(declare-fun res!673884 () Bool)

(assert (=> b!1004405 (=> (not res!673884) (not e!565590))))

(assert (=> b!1004405 (= res!673884 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444155 #b00000000000000000000000000000000) (bvslt lt!444155 (size!31029 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004405 (= lt!444155 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1004406 () Bool)

(declare-fun res!673878 () Bool)

(assert (=> b!1004406 (=> (not res!673878) (not e!565594))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004406 (= res!673878 (validKeyInArray!0 k0!2224))))

(declare-fun b!1004407 () Bool)

(declare-fun res!673880 () Bool)

(assert (=> b!1004407 (=> (not res!673880) (not e!565592))))

(declare-datatypes ((List!21203 0))(
  ( (Nil!21200) (Cons!21199 (h!22376 (_ BitVec 64)) (t!30204 List!21203)) )
))
(declare-fun arrayNoDuplicates!0 (array!63403 (_ BitVec 32) List!21203) Bool)

(assert (=> b!1004407 (= res!673880 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21200))))

(declare-fun b!1004408 () Bool)

(declare-fun res!673879 () Bool)

(assert (=> b!1004408 (=> (not res!673879) (not e!565592))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63403 (_ BitVec 32)) Bool)

(assert (=> b!1004408 (= res!673879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004409 () Bool)

(assert (=> b!1004409 (= e!565593 e!565591)))

(declare-fun res!673883 () Bool)

(assert (=> b!1004409 (=> (not res!673883) (not e!565591))))

(assert (=> b!1004409 (= res!673883 (not (= lt!444160 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444161 mask!3464) lt!444161 lt!444159 mask!3464))))))

(assert (=> b!1004409 (= lt!444161 (select (store (arr!30527 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1004409 (= lt!444159 (array!63404 (store (arr!30527 a!3219) i!1194 k0!2224) (size!31029 a!3219)))))

(declare-fun b!1004410 () Bool)

(declare-fun res!673885 () Bool)

(assert (=> b!1004410 (=> (not res!673885) (not e!565594))))

(assert (=> b!1004410 (= res!673885 (and (= (size!31029 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31029 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31029 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004411 () Bool)

(declare-fun res!673888 () Bool)

(assert (=> b!1004411 (=> (not res!673888) (not e!565590))))

(assert (=> b!1004411 (= res!673888 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444155 (select (arr!30527 a!3219) j!170) a!3219 mask!3464) lt!444154))))

(declare-fun b!1004412 () Bool)

(declare-fun res!673890 () Bool)

(assert (=> b!1004412 (=> (not res!673890) (not e!565594))))

(assert (=> b!1004412 (= res!673890 (validKeyInArray!0 (select (arr!30527 a!3219) j!170)))))

(assert (= (and start!86602 res!673886) b!1004410))

(assert (= (and b!1004410 res!673885) b!1004412))

(assert (= (and b!1004412 res!673890) b!1004406))

(assert (= (and b!1004406 res!673878) b!1004397))

(assert (= (and b!1004397 res!673881) b!1004400))

(assert (= (and b!1004400 res!673877) b!1004408))

(assert (= (and b!1004408 res!673879) b!1004407))

(assert (= (and b!1004407 res!673880) b!1004398))

(assert (= (and b!1004398 res!673876) b!1004399))

(assert (= (and b!1004399 res!673887) b!1004401))

(assert (= (and b!1004401 res!673889) b!1004409))

(assert (= (and b!1004409 res!673883) b!1004404))

(assert (= (and b!1004404 res!673875) b!1004402))

(assert (= (and b!1004402 res!673882) b!1004405))

(assert (= (and b!1004405 res!673884) b!1004411))

(assert (= (and b!1004411 res!673888) b!1004403))

(declare-fun m!929949 () Bool)

(assert (=> b!1004399 m!929949))

(assert (=> b!1004399 m!929949))

(declare-fun m!929951 () Bool)

(assert (=> b!1004399 m!929951))

(assert (=> b!1004399 m!929951))

(assert (=> b!1004399 m!929949))

(declare-fun m!929953 () Bool)

(assert (=> b!1004399 m!929953))

(declare-fun m!929955 () Bool)

(assert (=> b!1004407 m!929955))

(assert (=> b!1004412 m!929949))

(assert (=> b!1004412 m!929949))

(declare-fun m!929957 () Bool)

(assert (=> b!1004412 m!929957))

(declare-fun m!929959 () Bool)

(assert (=> b!1004400 m!929959))

(assert (=> b!1004401 m!929949))

(assert (=> b!1004401 m!929949))

(declare-fun m!929961 () Bool)

(assert (=> b!1004401 m!929961))

(declare-fun m!929963 () Bool)

(assert (=> b!1004406 m!929963))

(declare-fun m!929965 () Bool)

(assert (=> b!1004408 m!929965))

(declare-fun m!929967 () Bool)

(assert (=> b!1004403 m!929967))

(declare-fun m!929969 () Bool)

(assert (=> b!1004405 m!929969))

(declare-fun m!929971 () Bool)

(assert (=> b!1004409 m!929971))

(assert (=> b!1004409 m!929971))

(declare-fun m!929973 () Bool)

(assert (=> b!1004409 m!929973))

(declare-fun m!929975 () Bool)

(assert (=> b!1004409 m!929975))

(declare-fun m!929977 () Bool)

(assert (=> b!1004409 m!929977))

(declare-fun m!929979 () Bool)

(assert (=> b!1004404 m!929979))

(declare-fun m!929981 () Bool)

(assert (=> b!1004397 m!929981))

(declare-fun m!929983 () Bool)

(assert (=> start!86602 m!929983))

(declare-fun m!929985 () Bool)

(assert (=> start!86602 m!929985))

(assert (=> b!1004411 m!929949))

(assert (=> b!1004411 m!929949))

(declare-fun m!929987 () Bool)

(assert (=> b!1004411 m!929987))

(check-sat (not start!86602) (not b!1004405) (not b!1004409) (not b!1004407) (not b!1004411) (not b!1004400) (not b!1004412) (not b!1004401) (not b!1004403) (not b!1004404) (not b!1004408) (not b!1004406) (not b!1004399) (not b!1004397))
(check-sat)
