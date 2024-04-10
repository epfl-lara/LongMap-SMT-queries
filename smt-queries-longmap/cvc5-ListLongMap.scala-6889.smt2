; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86588 () Bool)

(assert start!86588)

(declare-fun res!673552 () Bool)

(declare-fun e!565444 () Bool)

(assert (=> start!86588 (=> (not res!673552) (not e!565444))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86588 (= res!673552 (validMask!0 mask!3464))))

(assert (=> start!86588 e!565444))

(declare-datatypes ((array!63389 0))(
  ( (array!63390 (arr!30520 (Array (_ BitVec 32) (_ BitVec 64))) (size!31022 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63389)

(declare-fun array_inv!23644 (array!63389) Bool)

(assert (=> start!86588 (array_inv!23644 a!3219)))

(assert (=> start!86588 true))

(declare-fun b!1004061 () Bool)

(declare-fun e!565446 () Bool)

(declare-fun e!565447 () Bool)

(assert (=> b!1004061 (= e!565446 e!565447)))

(declare-fun res!673553 () Bool)

(assert (=> b!1004061 (=> (not res!673553) (not e!565447))))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun lt!443989 () (_ BitVec 32))

(assert (=> b!1004061 (= res!673553 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!443989 #b00000000000000000000000000000000) (bvslt lt!443989 (size!31022 a!3219))))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004061 (= lt!443989 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1004062 () Bool)

(declare-fun res!673551 () Bool)

(assert (=> b!1004062 (=> (not res!673551) (not e!565447))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9452 0))(
  ( (MissingZero!9452 (index!40179 (_ BitVec 32))) (Found!9452 (index!40180 (_ BitVec 32))) (Intermediate!9452 (undefined!10264 Bool) (index!40181 (_ BitVec 32)) (x!87584 (_ BitVec 32))) (Undefined!9452) (MissingVacant!9452 (index!40182 (_ BitVec 32))) )
))
(declare-fun lt!443986 () SeekEntryResult!9452)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63389 (_ BitVec 32)) SeekEntryResult!9452)

(assert (=> b!1004062 (= res!673551 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443989 (select (arr!30520 a!3219) j!170) a!3219 mask!3464) lt!443986))))

(declare-fun b!1004063 () Bool)

(declare-fun res!673541 () Bool)

(assert (=> b!1004063 (=> (not res!673541) (not e!565444))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004063 (= res!673541 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004064 () Bool)

(declare-fun res!673548 () Bool)

(declare-fun e!565443 () Bool)

(assert (=> b!1004064 (=> (not res!673548) (not e!565443))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63389 (_ BitVec 32)) Bool)

(assert (=> b!1004064 (= res!673548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004065 () Bool)

(declare-fun res!673547 () Bool)

(assert (=> b!1004065 (=> (not res!673547) (not e!565444))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004065 (= res!673547 (and (= (size!31022 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31022 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31022 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004066 () Bool)

(declare-fun res!673543 () Bool)

(assert (=> b!1004066 (=> (not res!673543) (not e!565446))))

(declare-fun resIndex!38 () (_ BitVec 32))

(assert (=> b!1004066 (= res!673543 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004067 () Bool)

(declare-fun res!673546 () Bool)

(assert (=> b!1004067 (=> (not res!673546) (not e!565446))))

(declare-fun lt!443991 () (_ BitVec 64))

(declare-fun lt!443993 () array!63389)

(declare-fun lt!443988 () SeekEntryResult!9452)

(assert (=> b!1004067 (= res!673546 (not (= lt!443988 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!443991 lt!443993 mask!3464))))))

(declare-fun b!1004068 () Bool)

(declare-fun res!673540 () Bool)

(assert (=> b!1004068 (=> (not res!673540) (not e!565444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004068 (= res!673540 (validKeyInArray!0 (select (arr!30520 a!3219) j!170)))))

(declare-fun b!1004069 () Bool)

(declare-fun res!673544 () Bool)

(assert (=> b!1004069 (=> (not res!673544) (not e!565444))))

(assert (=> b!1004069 (= res!673544 (validKeyInArray!0 k!2224))))

(declare-fun b!1004070 () Bool)

(declare-fun e!565445 () Bool)

(declare-fun e!565442 () Bool)

(assert (=> b!1004070 (= e!565445 e!565442)))

(declare-fun res!673549 () Bool)

(assert (=> b!1004070 (=> (not res!673549) (not e!565442))))

(assert (=> b!1004070 (= res!673549 (= lt!443988 lt!443986))))

(assert (=> b!1004070 (= lt!443988 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30520 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004071 () Bool)

(assert (=> b!1004071 (= e!565444 e!565443)))

(declare-fun res!673539 () Bool)

(assert (=> b!1004071 (=> (not res!673539) (not e!565443))))

(declare-fun lt!443987 () SeekEntryResult!9452)

(assert (=> b!1004071 (= res!673539 (or (= lt!443987 (MissingVacant!9452 i!1194)) (= lt!443987 (MissingZero!9452 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63389 (_ BitVec 32)) SeekEntryResult!9452)

(assert (=> b!1004071 (= lt!443987 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1004072 () Bool)

(assert (=> b!1004072 (= e!565442 e!565446)))

(declare-fun res!673545 () Bool)

(assert (=> b!1004072 (=> (not res!673545) (not e!565446))))

(declare-fun lt!443990 () SeekEntryResult!9452)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004072 (= res!673545 (not (= lt!443990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!443991 mask!3464) lt!443991 lt!443993 mask!3464))))))

(assert (=> b!1004072 (= lt!443991 (select (store (arr!30520 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004072 (= lt!443993 (array!63390 (store (arr!30520 a!3219) i!1194 k!2224) (size!31022 a!3219)))))

(declare-fun b!1004073 () Bool)

(assert (=> b!1004073 (= e!565443 e!565445)))

(declare-fun res!673542 () Bool)

(assert (=> b!1004073 (=> (not res!673542) (not e!565445))))

(assert (=> b!1004073 (= res!673542 (= lt!443990 lt!443986))))

(assert (=> b!1004073 (= lt!443986 (Intermediate!9452 false resIndex!38 resX!38))))

(assert (=> b!1004073 (= lt!443990 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30520 a!3219) j!170) mask!3464) (select (arr!30520 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004074 () Bool)

(declare-fun res!673550 () Bool)

(assert (=> b!1004074 (=> (not res!673550) (not e!565443))))

(declare-datatypes ((List!21196 0))(
  ( (Nil!21193) (Cons!21192 (h!22369 (_ BitVec 64)) (t!30197 List!21196)) )
))
(declare-fun arrayNoDuplicates!0 (array!63389 (_ BitVec 32) List!21196) Bool)

(assert (=> b!1004074 (= res!673550 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21193))))

(declare-fun b!1004075 () Bool)

(declare-fun res!673554 () Bool)

(assert (=> b!1004075 (=> (not res!673554) (not e!565443))))

(assert (=> b!1004075 (= res!673554 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31022 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31022 a!3219))))))

(declare-fun b!1004076 () Bool)

(assert (=> b!1004076 (= e!565447 false)))

(declare-fun lt!443992 () SeekEntryResult!9452)

(assert (=> b!1004076 (= lt!443992 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!443989 lt!443991 lt!443993 mask!3464))))

(assert (= (and start!86588 res!673552) b!1004065))

(assert (= (and b!1004065 res!673547) b!1004068))

(assert (= (and b!1004068 res!673540) b!1004069))

(assert (= (and b!1004069 res!673544) b!1004063))

(assert (= (and b!1004063 res!673541) b!1004071))

(assert (= (and b!1004071 res!673539) b!1004064))

(assert (= (and b!1004064 res!673548) b!1004074))

(assert (= (and b!1004074 res!673550) b!1004075))

(assert (= (and b!1004075 res!673554) b!1004073))

(assert (= (and b!1004073 res!673542) b!1004070))

(assert (= (and b!1004070 res!673549) b!1004072))

(assert (= (and b!1004072 res!673545) b!1004067))

(assert (= (and b!1004067 res!673546) b!1004066))

(assert (= (and b!1004066 res!673543) b!1004061))

(assert (= (and b!1004061 res!673553) b!1004062))

(assert (= (and b!1004062 res!673551) b!1004076))

(declare-fun m!929669 () Bool)

(assert (=> b!1004071 m!929669))

(declare-fun m!929671 () Bool)

(assert (=> b!1004061 m!929671))

(declare-fun m!929673 () Bool)

(assert (=> b!1004067 m!929673))

(declare-fun m!929675 () Bool)

(assert (=> b!1004062 m!929675))

(assert (=> b!1004062 m!929675))

(declare-fun m!929677 () Bool)

(assert (=> b!1004062 m!929677))

(assert (=> b!1004070 m!929675))

(assert (=> b!1004070 m!929675))

(declare-fun m!929679 () Bool)

(assert (=> b!1004070 m!929679))

(declare-fun m!929681 () Bool)

(assert (=> b!1004072 m!929681))

(assert (=> b!1004072 m!929681))

(declare-fun m!929683 () Bool)

(assert (=> b!1004072 m!929683))

(declare-fun m!929685 () Bool)

(assert (=> b!1004072 m!929685))

(declare-fun m!929687 () Bool)

(assert (=> b!1004072 m!929687))

(declare-fun m!929689 () Bool)

(assert (=> b!1004064 m!929689))

(declare-fun m!929691 () Bool)

(assert (=> start!86588 m!929691))

(declare-fun m!929693 () Bool)

(assert (=> start!86588 m!929693))

(assert (=> b!1004068 m!929675))

(assert (=> b!1004068 m!929675))

(declare-fun m!929695 () Bool)

(assert (=> b!1004068 m!929695))

(declare-fun m!929697 () Bool)

(assert (=> b!1004076 m!929697))

(declare-fun m!929699 () Bool)

(assert (=> b!1004074 m!929699))

(declare-fun m!929701 () Bool)

(assert (=> b!1004063 m!929701))

(assert (=> b!1004073 m!929675))

(assert (=> b!1004073 m!929675))

(declare-fun m!929703 () Bool)

(assert (=> b!1004073 m!929703))

(assert (=> b!1004073 m!929703))

(assert (=> b!1004073 m!929675))

(declare-fun m!929705 () Bool)

(assert (=> b!1004073 m!929705))

(declare-fun m!929707 () Bool)

(assert (=> b!1004069 m!929707))

(push 1)

