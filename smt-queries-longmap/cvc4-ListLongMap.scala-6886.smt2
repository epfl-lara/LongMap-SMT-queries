; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86574 () Bool)

(assert start!86574)

(declare-fun b!1003725 () Bool)

(declare-fun res!673214 () Bool)

(declare-fun e!565297 () Bool)

(assert (=> b!1003725 (=> (not res!673214) (not e!565297))))

(declare-datatypes ((array!63375 0))(
  ( (array!63376 (arr!30513 (Array (_ BitVec 32) (_ BitVec 64))) (size!31015 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63375)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63375 (_ BitVec 32)) Bool)

(assert (=> b!1003725 (= res!673214 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun res!673204 () Bool)

(declare-fun e!565298 () Bool)

(assert (=> start!86574 (=> (not res!673204) (not e!565298))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86574 (= res!673204 (validMask!0 mask!3464))))

(assert (=> start!86574 e!565298))

(declare-fun array_inv!23637 (array!63375) Bool)

(assert (=> start!86574 (array_inv!23637 a!3219)))

(assert (=> start!86574 true))

(declare-fun b!1003726 () Bool)

(declare-fun res!673205 () Bool)

(assert (=> b!1003726 (=> (not res!673205) (not e!565298))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003726 (= res!673205 (validKeyInArray!0 k!2224))))

(declare-fun b!1003727 () Bool)

(declare-fun res!673210 () Bool)

(assert (=> b!1003727 (=> (not res!673210) (not e!565297))))

(declare-datatypes ((List!21189 0))(
  ( (Nil!21186) (Cons!21185 (h!22362 (_ BitVec 64)) (t!30190 List!21189)) )
))
(declare-fun arrayNoDuplicates!0 (array!63375 (_ BitVec 32) List!21189) Bool)

(assert (=> b!1003727 (= res!673210 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21186))))

(declare-fun b!1003728 () Bool)

(declare-fun e!565294 () Bool)

(declare-fun e!565295 () Bool)

(assert (=> b!1003728 (= e!565294 e!565295)))

(declare-fun res!673213 () Bool)

(assert (=> b!1003728 (=> (not res!673213) (not e!565295))))

(declare-datatypes ((SeekEntryResult!9445 0))(
  ( (MissingZero!9445 (index!40151 (_ BitVec 32))) (Found!9445 (index!40152 (_ BitVec 32))) (Intermediate!9445 (undefined!10257 Bool) (index!40153 (_ BitVec 32)) (x!87553 (_ BitVec 32))) (Undefined!9445) (MissingVacant!9445 (index!40154 (_ BitVec 32))) )
))
(declare-fun lt!443820 () SeekEntryResult!9445)

(declare-fun lt!443825 () SeekEntryResult!9445)

(assert (=> b!1003728 (= res!673213 (= lt!443820 lt!443825))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63375 (_ BitVec 32)) SeekEntryResult!9445)

(assert (=> b!1003728 (= lt!443820 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30513 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003729 () Bool)

(declare-fun res!673216 () Bool)

(assert (=> b!1003729 (=> (not res!673216) (not e!565298))))

(declare-fun arrayContainsKey!0 (array!63375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003729 (= res!673216 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003730 () Bool)

(declare-fun e!565299 () Bool)

(declare-fun e!565296 () Bool)

(assert (=> b!1003730 (= e!565299 e!565296)))

(declare-fun res!673211 () Bool)

(assert (=> b!1003730 (=> (not res!673211) (not e!565296))))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443819 () (_ BitVec 32))

(assert (=> b!1003730 (= res!673211 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443819 #b00000000000000000000000000000000) (bvslt lt!443819 (size!31015 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003730 (= lt!443819 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003731 () Bool)

(declare-fun res!673207 () Bool)

(assert (=> b!1003731 (=> (not res!673207) (not e!565299))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003731 (= res!673207 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003732 () Bool)

(assert (=> b!1003732 (= e!565296 false)))

(declare-fun lt!443821 () array!63375)

(declare-fun lt!443824 () (_ BitVec 64))

(declare-fun lt!443822 () SeekEntryResult!9445)

(assert (=> b!1003732 (= lt!443822 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443819 lt!443824 lt!443821 mask!3464))))

(declare-fun b!1003733 () Bool)

(declare-fun res!673206 () Bool)

(assert (=> b!1003733 (=> (not res!673206) (not e!565299))))

(assert (=> b!1003733 (= res!673206 (not (= lt!443820 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443824 lt!443821 mask!3464))))))

(declare-fun b!1003734 () Bool)

(assert (=> b!1003734 (= e!565298 e!565297)))

(declare-fun res!673209 () Bool)

(assert (=> b!1003734 (=> (not res!673209) (not e!565297))))

(declare-fun lt!443818 () SeekEntryResult!9445)

(assert (=> b!1003734 (= res!673209 (or (= lt!443818 (MissingVacant!9445 i!1194)) (= lt!443818 (MissingZero!9445 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63375 (_ BitVec 32)) SeekEntryResult!9445)

(assert (=> b!1003734 (= lt!443818 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003735 () Bool)

(assert (=> b!1003735 (= e!565297 e!565294)))

(declare-fun res!673217 () Bool)

(assert (=> b!1003735 (=> (not res!673217) (not e!565294))))

(declare-fun lt!443823 () SeekEntryResult!9445)

(assert (=> b!1003735 (= res!673217 (= lt!443823 lt!443825))))

(assert (=> b!1003735 (= lt!443825 (Intermediate!9445 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003735 (= lt!443823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30513 a!3219) j!170) mask!3464) (select (arr!30513 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003736 () Bool)

(assert (=> b!1003736 (= e!565295 e!565299)))

(declare-fun res!673218 () Bool)

(assert (=> b!1003736 (=> (not res!673218) (not e!565299))))

(assert (=> b!1003736 (= res!673218 (not (= lt!443823 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443824 mask!3464) lt!443824 lt!443821 mask!3464))))))

(assert (=> b!1003736 (= lt!443824 (select (store (arr!30513 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003736 (= lt!443821 (array!63376 (store (arr!30513 a!3219) i!1194 k!2224) (size!31015 a!3219)))))

(declare-fun b!1003737 () Bool)

(declare-fun res!673212 () Bool)

(assert (=> b!1003737 (=> (not res!673212) (not e!565298))))

(assert (=> b!1003737 (= res!673212 (validKeyInArray!0 (select (arr!30513 a!3219) j!170)))))

(declare-fun b!1003738 () Bool)

(declare-fun res!673215 () Bool)

(assert (=> b!1003738 (=> (not res!673215) (not e!565296))))

(assert (=> b!1003738 (= res!673215 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443819 (select (arr!30513 a!3219) j!170) a!3219 mask!3464) lt!443825))))

(declare-fun b!1003739 () Bool)

(declare-fun res!673208 () Bool)

(assert (=> b!1003739 (=> (not res!673208) (not e!565298))))

(assert (=> b!1003739 (= res!673208 (and (= (size!31015 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31015 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31015 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1003740 () Bool)

(declare-fun res!673203 () Bool)

(assert (=> b!1003740 (=> (not res!673203) (not e!565297))))

(assert (=> b!1003740 (= res!673203 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31015 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31015 a!3219))))))

(assert (= (and start!86574 res!673204) b!1003739))

(assert (= (and b!1003739 res!673208) b!1003737))

(assert (= (and b!1003737 res!673212) b!1003726))

(assert (= (and b!1003726 res!673205) b!1003729))

(assert (= (and b!1003729 res!673216) b!1003734))

(assert (= (and b!1003734 res!673209) b!1003725))

(assert (= (and b!1003725 res!673214) b!1003727))

(assert (= (and b!1003727 res!673210) b!1003740))

(assert (= (and b!1003740 res!673203) b!1003735))

(assert (= (and b!1003735 res!673217) b!1003728))

(assert (= (and b!1003728 res!673213) b!1003736))

(assert (= (and b!1003736 res!673218) b!1003733))

(assert (= (and b!1003733 res!673206) b!1003731))

(assert (= (and b!1003731 res!673207) b!1003730))

(assert (= (and b!1003730 res!673211) b!1003738))

(assert (= (and b!1003738 res!673215) b!1003732))

(declare-fun m!929389 () Bool)

(assert (=> b!1003726 m!929389))

(declare-fun m!929391 () Bool)

(assert (=> b!1003737 m!929391))

(assert (=> b!1003737 m!929391))

(declare-fun m!929393 () Bool)

(assert (=> b!1003737 m!929393))

(declare-fun m!929395 () Bool)

(assert (=> b!1003725 m!929395))

(assert (=> b!1003738 m!929391))

(assert (=> b!1003738 m!929391))

(declare-fun m!929397 () Bool)

(assert (=> b!1003738 m!929397))

(declare-fun m!929399 () Bool)

(assert (=> start!86574 m!929399))

(declare-fun m!929401 () Bool)

(assert (=> start!86574 m!929401))

(declare-fun m!929403 () Bool)

(assert (=> b!1003736 m!929403))

(assert (=> b!1003736 m!929403))

(declare-fun m!929405 () Bool)

(assert (=> b!1003736 m!929405))

(declare-fun m!929407 () Bool)

(assert (=> b!1003736 m!929407))

(declare-fun m!929409 () Bool)

(assert (=> b!1003736 m!929409))

(declare-fun m!929411 () Bool)

(assert (=> b!1003733 m!929411))

(assert (=> b!1003735 m!929391))

(assert (=> b!1003735 m!929391))

(declare-fun m!929413 () Bool)

(assert (=> b!1003735 m!929413))

(assert (=> b!1003735 m!929413))

(assert (=> b!1003735 m!929391))

(declare-fun m!929415 () Bool)

(assert (=> b!1003735 m!929415))

(assert (=> b!1003728 m!929391))

(assert (=> b!1003728 m!929391))

(declare-fun m!929417 () Bool)

(assert (=> b!1003728 m!929417))

(declare-fun m!929419 () Bool)

(assert (=> b!1003730 m!929419))

(declare-fun m!929421 () Bool)

(assert (=> b!1003729 m!929421))

(declare-fun m!929423 () Bool)

(assert (=> b!1003734 m!929423))

(declare-fun m!929425 () Bool)

(assert (=> b!1003732 m!929425))

(declare-fun m!929427 () Bool)

(assert (=> b!1003727 m!929427))

(push 1)

