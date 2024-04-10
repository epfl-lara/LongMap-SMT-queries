; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86576 () Bool)

(assert start!86576)

(declare-fun b!1003773 () Bool)

(declare-fun res!673263 () Bool)

(declare-fun e!565319 () Bool)

(assert (=> b!1003773 (=> (not res!673263) (not e!565319))))

(declare-datatypes ((array!63377 0))(
  ( (array!63378 (arr!30514 (Array (_ BitVec 32) (_ BitVec 64))) (size!31016 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63377)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63377 (_ BitVec 32)) Bool)

(assert (=> b!1003773 (= res!673263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1003774 () Bool)

(declare-fun res!673262 () Bool)

(declare-fun e!565321 () Bool)

(assert (=> b!1003774 (=> (not res!673262) (not e!565321))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1003774 (= res!673262 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1003775 () Bool)

(declare-fun res!673256 () Bool)

(assert (=> b!1003775 (=> (not res!673256) (not e!565319))))

(declare-datatypes ((List!21190 0))(
  ( (Nil!21187) (Cons!21186 (h!22363 (_ BitVec 64)) (t!30191 List!21190)) )
))
(declare-fun arrayNoDuplicates!0 (array!63377 (_ BitVec 32) List!21190) Bool)

(assert (=> b!1003775 (= res!673256 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21187))))

(declare-fun b!1003776 () Bool)

(declare-fun res!673266 () Bool)

(declare-fun e!565316 () Bool)

(assert (=> b!1003776 (=> (not res!673266) (not e!565316))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1003776 (= res!673266 (validKeyInArray!0 k!2224))))

(declare-fun b!1003777 () Bool)

(declare-fun e!565315 () Bool)

(assert (=> b!1003777 (= e!565321 e!565315)))

(declare-fun res!673254 () Bool)

(assert (=> b!1003777 (=> (not res!673254) (not e!565315))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443844 () (_ BitVec 32))

(assert (=> b!1003777 (= res!673254 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443844 #b00000000000000000000000000000000) (bvslt lt!443844 (size!31016 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003777 (= lt!443844 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1003778 () Bool)

(declare-fun res!673259 () Bool)

(assert (=> b!1003778 (=> (not res!673259) (not e!565321))))

(declare-fun lt!443846 () array!63377)

(declare-datatypes ((SeekEntryResult!9446 0))(
  ( (MissingZero!9446 (index!40155 (_ BitVec 32))) (Found!9446 (index!40156 (_ BitVec 32))) (Intermediate!9446 (undefined!10258 Bool) (index!40157 (_ BitVec 32)) (x!87562 (_ BitVec 32))) (Undefined!9446) (MissingVacant!9446 (index!40158 (_ BitVec 32))) )
))
(declare-fun lt!443843 () SeekEntryResult!9446)

(declare-fun lt!443842 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63377 (_ BitVec 32)) SeekEntryResult!9446)

(assert (=> b!1003778 (= res!673259 (not (= lt!443843 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443842 lt!443846 mask!3464))))))

(declare-fun b!1003779 () Bool)

(declare-fun res!673257 () Bool)

(assert (=> b!1003779 (=> (not res!673257) (not e!565316))))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1003779 (= res!673257 (and (= (size!31016 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31016 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31016 a!3219)) (not (= i!1194 j!170))))))

(declare-fun res!673251 () Bool)

(assert (=> start!86576 (=> (not res!673251) (not e!565316))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86576 (= res!673251 (validMask!0 mask!3464))))

(assert (=> start!86576 e!565316))

(declare-fun array_inv!23638 (array!63377) Bool)

(assert (=> start!86576 (array_inv!23638 a!3219)))

(assert (=> start!86576 true))

(declare-fun b!1003780 () Bool)

(declare-fun res!673265 () Bool)

(assert (=> b!1003780 (=> (not res!673265) (not e!565316))))

(declare-fun arrayContainsKey!0 (array!63377 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1003780 (= res!673265 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1003781 () Bool)

(declare-fun res!673261 () Bool)

(assert (=> b!1003781 (=> (not res!673261) (not e!565316))))

(assert (=> b!1003781 (= res!673261 (validKeyInArray!0 (select (arr!30514 a!3219) j!170)))))

(declare-fun b!1003782 () Bool)

(declare-fun res!673252 () Bool)

(assert (=> b!1003782 (=> (not res!673252) (not e!565319))))

(assert (=> b!1003782 (= res!673252 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31016 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31016 a!3219))))))

(declare-fun b!1003783 () Bool)

(assert (=> b!1003783 (= e!565315 false)))

(declare-fun lt!443849 () SeekEntryResult!9446)

(assert (=> b!1003783 (= lt!443849 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443844 lt!443842 lt!443846 mask!3464))))

(declare-fun b!1003784 () Bool)

(declare-fun e!565320 () Bool)

(declare-fun e!565317 () Bool)

(assert (=> b!1003784 (= e!565320 e!565317)))

(declare-fun res!673258 () Bool)

(assert (=> b!1003784 (=> (not res!673258) (not e!565317))))

(declare-fun lt!443845 () SeekEntryResult!9446)

(assert (=> b!1003784 (= res!673258 (= lt!443843 lt!443845))))

(assert (=> b!1003784 (= lt!443843 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30514 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003785 () Bool)

(declare-fun res!673253 () Bool)

(assert (=> b!1003785 (=> (not res!673253) (not e!565315))))

(assert (=> b!1003785 (= res!673253 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443844 (select (arr!30514 a!3219) j!170) a!3219 mask!3464) lt!443845))))

(declare-fun b!1003786 () Bool)

(assert (=> b!1003786 (= e!565316 e!565319)))

(declare-fun res!673260 () Bool)

(assert (=> b!1003786 (=> (not res!673260) (not e!565319))))

(declare-fun lt!443848 () SeekEntryResult!9446)

(assert (=> b!1003786 (= res!673260 (or (= lt!443848 (MissingVacant!9446 i!1194)) (= lt!443848 (MissingZero!9446 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63377 (_ BitVec 32)) SeekEntryResult!9446)

(assert (=> b!1003786 (= lt!443848 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1003787 () Bool)

(assert (=> b!1003787 (= e!565319 e!565320)))

(declare-fun res!673255 () Bool)

(assert (=> b!1003787 (=> (not res!673255) (not e!565320))))

(declare-fun lt!443847 () SeekEntryResult!9446)

(assert (=> b!1003787 (= res!673255 (= lt!443847 lt!443845))))

(assert (=> b!1003787 (= lt!443845 (Intermediate!9446 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1003787 (= lt!443847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30514 a!3219) j!170) mask!3464) (select (arr!30514 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1003788 () Bool)

(assert (=> b!1003788 (= e!565317 e!565321)))

(declare-fun res!673264 () Bool)

(assert (=> b!1003788 (=> (not res!673264) (not e!565321))))

(assert (=> b!1003788 (= res!673264 (not (= lt!443847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443842 mask!3464) lt!443842 lt!443846 mask!3464))))))

(assert (=> b!1003788 (= lt!443842 (select (store (arr!30514 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1003788 (= lt!443846 (array!63378 (store (arr!30514 a!3219) i!1194 k!2224) (size!31016 a!3219)))))

(assert (= (and start!86576 res!673251) b!1003779))

(assert (= (and b!1003779 res!673257) b!1003781))

(assert (= (and b!1003781 res!673261) b!1003776))

(assert (= (and b!1003776 res!673266) b!1003780))

(assert (= (and b!1003780 res!673265) b!1003786))

(assert (= (and b!1003786 res!673260) b!1003773))

(assert (= (and b!1003773 res!673263) b!1003775))

(assert (= (and b!1003775 res!673256) b!1003782))

(assert (= (and b!1003782 res!673252) b!1003787))

(assert (= (and b!1003787 res!673255) b!1003784))

(assert (= (and b!1003784 res!673258) b!1003788))

(assert (= (and b!1003788 res!673264) b!1003778))

(assert (= (and b!1003778 res!673259) b!1003774))

(assert (= (and b!1003774 res!673262) b!1003777))

(assert (= (and b!1003777 res!673254) b!1003785))

(assert (= (and b!1003785 res!673253) b!1003783))

(declare-fun m!929429 () Bool)

(assert (=> b!1003783 m!929429))

(declare-fun m!929431 () Bool)

(assert (=> b!1003784 m!929431))

(assert (=> b!1003784 m!929431))

(declare-fun m!929433 () Bool)

(assert (=> b!1003784 m!929433))

(assert (=> b!1003785 m!929431))

(assert (=> b!1003785 m!929431))

(declare-fun m!929435 () Bool)

(assert (=> b!1003785 m!929435))

(declare-fun m!929437 () Bool)

(assert (=> b!1003788 m!929437))

(assert (=> b!1003788 m!929437))

(declare-fun m!929439 () Bool)

(assert (=> b!1003788 m!929439))

(declare-fun m!929441 () Bool)

(assert (=> b!1003788 m!929441))

(declare-fun m!929443 () Bool)

(assert (=> b!1003788 m!929443))

(declare-fun m!929445 () Bool)

(assert (=> start!86576 m!929445))

(declare-fun m!929447 () Bool)

(assert (=> start!86576 m!929447))

(assert (=> b!1003787 m!929431))

(assert (=> b!1003787 m!929431))

(declare-fun m!929449 () Bool)

(assert (=> b!1003787 m!929449))

(assert (=> b!1003787 m!929449))

(assert (=> b!1003787 m!929431))

(declare-fun m!929451 () Bool)

(assert (=> b!1003787 m!929451))

(declare-fun m!929453 () Bool)

(assert (=> b!1003776 m!929453))

(declare-fun m!929455 () Bool)

(assert (=> b!1003780 m!929455))

(declare-fun m!929457 () Bool)

(assert (=> b!1003775 m!929457))

(assert (=> b!1003781 m!929431))

(assert (=> b!1003781 m!929431))

(declare-fun m!929459 () Bool)

(assert (=> b!1003781 m!929459))

(declare-fun m!929461 () Bool)

(assert (=> b!1003777 m!929461))

(declare-fun m!929463 () Bool)

(assert (=> b!1003773 m!929463))

(declare-fun m!929465 () Bool)

(assert (=> b!1003778 m!929465))

(declare-fun m!929467 () Bool)

(assert (=> b!1003786 m!929467))

(push 1)

