; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86592 () Bool)

(assert start!86592)

(declare-fun b!1004157 () Bool)

(declare-fun res!673638 () Bool)

(declare-fun e!565483 () Bool)

(assert (=> b!1004157 (=> (not res!673638) (not e!565483))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9454 0))(
  ( (MissingZero!9454 (index!40187 (_ BitVec 32))) (Found!9454 (index!40188 (_ BitVec 32))) (Intermediate!9454 (undefined!10266 Bool) (index!40189 (_ BitVec 32)) (x!87586 (_ BitVec 32))) (Undefined!9454) (MissingVacant!9454 (index!40190 (_ BitVec 32))) )
))
(declare-fun lt!444037 () SeekEntryResult!9454)

(declare-fun lt!444034 () (_ BitVec 64))

(declare-datatypes ((array!63393 0))(
  ( (array!63394 (arr!30522 (Array (_ BitVec 32) (_ BitVec 64))) (size!31024 (_ BitVec 32))) )
))
(declare-fun lt!444041 () array!63393)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63393 (_ BitVec 32)) SeekEntryResult!9454)

(assert (=> b!1004157 (= res!673638 (not (= lt!444037 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444034 lt!444041 mask!3464))))))

(declare-fun b!1004158 () Bool)

(declare-fun res!673650 () Bool)

(declare-fun e!565487 () Bool)

(assert (=> b!1004158 (=> (not res!673650) (not e!565487))))

(declare-fun a!3219 () array!63393)

(declare-fun j!170 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004158 (= res!673650 (validKeyInArray!0 (select (arr!30522 a!3219) j!170)))))

(declare-fun b!1004159 () Bool)

(declare-fun res!673641 () Bool)

(assert (=> b!1004159 (=> (not res!673641) (not e!565487))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004159 (= res!673641 (and (= (size!31024 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31024 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31024 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004160 () Bool)

(declare-fun e!565488 () Bool)

(assert (=> b!1004160 (= e!565487 e!565488)))

(declare-fun res!673648 () Bool)

(assert (=> b!1004160 (=> (not res!673648) (not e!565488))))

(declare-fun lt!444040 () SeekEntryResult!9454)

(assert (=> b!1004160 (= res!673648 (or (= lt!444040 (MissingVacant!9454 i!1194)) (= lt!444040 (MissingZero!9454 i!1194))))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63393 (_ BitVec 32)) SeekEntryResult!9454)

(assert (=> b!1004160 (= lt!444040 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1004162 () Bool)

(declare-fun res!673649 () Bool)

(declare-fun e!565486 () Bool)

(assert (=> b!1004162 (=> (not res!673649) (not e!565486))))

(declare-fun lt!444035 () SeekEntryResult!9454)

(declare-fun lt!444039 () (_ BitVec 32))

(assert (=> b!1004162 (= res!673649 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444039 (select (arr!30522 a!3219) j!170) a!3219 mask!3464) lt!444035))))

(declare-fun b!1004163 () Bool)

(declare-fun res!673637 () Bool)

(assert (=> b!1004163 (=> (not res!673637) (not e!565487))))

(declare-fun arrayContainsKey!0 (array!63393 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004163 (= res!673637 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004164 () Bool)

(declare-fun res!673635 () Bool)

(assert (=> b!1004164 (=> (not res!673635) (not e!565488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63393 (_ BitVec 32)) Bool)

(assert (=> b!1004164 (= res!673635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004165 () Bool)

(declare-fun res!673640 () Bool)

(assert (=> b!1004165 (=> (not res!673640) (not e!565488))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004165 (= res!673640 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31024 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31024 a!3219))))))

(declare-fun b!1004166 () Bool)

(declare-fun res!673642 () Bool)

(assert (=> b!1004166 (=> (not res!673642) (not e!565483))))

(assert (=> b!1004166 (= res!673642 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004167 () Bool)

(declare-fun e!565485 () Bool)

(assert (=> b!1004167 (= e!565488 e!565485)))

(declare-fun res!673647 () Bool)

(assert (=> b!1004167 (=> (not res!673647) (not e!565485))))

(declare-fun lt!444038 () SeekEntryResult!9454)

(assert (=> b!1004167 (= res!673647 (= lt!444038 lt!444035))))

(assert (=> b!1004167 (= lt!444035 (Intermediate!9454 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004167 (= lt!444038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30522 a!3219) j!170) mask!3464) (select (arr!30522 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004168 () Bool)

(assert (=> b!1004168 (= e!565483 e!565486)))

(declare-fun res!673643 () Bool)

(assert (=> b!1004168 (=> (not res!673643) (not e!565486))))

(assert (=> b!1004168 (= res!673643 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444039 #b00000000000000000000000000000000) (bvslt lt!444039 (size!31024 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004168 (= lt!444039 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun res!673645 () Bool)

(assert (=> start!86592 (=> (not res!673645) (not e!565487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86592 (= res!673645 (validMask!0 mask!3464))))

(assert (=> start!86592 e!565487))

(declare-fun array_inv!23646 (array!63393) Bool)

(assert (=> start!86592 (array_inv!23646 a!3219)))

(assert (=> start!86592 true))

(declare-fun b!1004161 () Bool)

(assert (=> b!1004161 (= e!565486 false)))

(declare-fun lt!444036 () SeekEntryResult!9454)

(assert (=> b!1004161 (= lt!444036 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444039 lt!444034 lt!444041 mask!3464))))

(declare-fun b!1004169 () Bool)

(declare-fun res!673646 () Bool)

(assert (=> b!1004169 (=> (not res!673646) (not e!565487))))

(assert (=> b!1004169 (= res!673646 (validKeyInArray!0 k!2224))))

(declare-fun b!1004170 () Bool)

(declare-fun e!565489 () Bool)

(assert (=> b!1004170 (= e!565485 e!565489)))

(declare-fun res!673636 () Bool)

(assert (=> b!1004170 (=> (not res!673636) (not e!565489))))

(assert (=> b!1004170 (= res!673636 (= lt!444037 lt!444035))))

(assert (=> b!1004170 (= lt!444037 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30522 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004171 () Bool)

(declare-fun res!673644 () Bool)

(assert (=> b!1004171 (=> (not res!673644) (not e!565488))))

(declare-datatypes ((List!21198 0))(
  ( (Nil!21195) (Cons!21194 (h!22371 (_ BitVec 64)) (t!30199 List!21198)) )
))
(declare-fun arrayNoDuplicates!0 (array!63393 (_ BitVec 32) List!21198) Bool)

(assert (=> b!1004171 (= res!673644 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21195))))

(declare-fun b!1004172 () Bool)

(assert (=> b!1004172 (= e!565489 e!565483)))

(declare-fun res!673639 () Bool)

(assert (=> b!1004172 (=> (not res!673639) (not e!565483))))

(assert (=> b!1004172 (= res!673639 (not (= lt!444038 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444034 mask!3464) lt!444034 lt!444041 mask!3464))))))

(assert (=> b!1004172 (= lt!444034 (select (store (arr!30522 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004172 (= lt!444041 (array!63394 (store (arr!30522 a!3219) i!1194 k!2224) (size!31024 a!3219)))))

(assert (= (and start!86592 res!673645) b!1004159))

(assert (= (and b!1004159 res!673641) b!1004158))

(assert (= (and b!1004158 res!673650) b!1004169))

(assert (= (and b!1004169 res!673646) b!1004163))

(assert (= (and b!1004163 res!673637) b!1004160))

(assert (= (and b!1004160 res!673648) b!1004164))

(assert (= (and b!1004164 res!673635) b!1004171))

(assert (= (and b!1004171 res!673644) b!1004165))

(assert (= (and b!1004165 res!673640) b!1004167))

(assert (= (and b!1004167 res!673647) b!1004170))

(assert (= (and b!1004170 res!673636) b!1004172))

(assert (= (and b!1004172 res!673639) b!1004157))

(assert (= (and b!1004157 res!673638) b!1004166))

(assert (= (and b!1004166 res!673642) b!1004168))

(assert (= (and b!1004168 res!673643) b!1004162))

(assert (= (and b!1004162 res!673649) b!1004161))

(declare-fun m!929749 () Bool)

(assert (=> b!1004170 m!929749))

(assert (=> b!1004170 m!929749))

(declare-fun m!929751 () Bool)

(assert (=> b!1004170 m!929751))

(assert (=> b!1004162 m!929749))

(assert (=> b!1004162 m!929749))

(declare-fun m!929753 () Bool)

(assert (=> b!1004162 m!929753))

(declare-fun m!929755 () Bool)

(assert (=> b!1004169 m!929755))

(declare-fun m!929757 () Bool)

(assert (=> b!1004164 m!929757))

(declare-fun m!929759 () Bool)

(assert (=> b!1004161 m!929759))

(declare-fun m!929761 () Bool)

(assert (=> b!1004171 m!929761))

(declare-fun m!929763 () Bool)

(assert (=> b!1004168 m!929763))

(assert (=> b!1004167 m!929749))

(assert (=> b!1004167 m!929749))

(declare-fun m!929765 () Bool)

(assert (=> b!1004167 m!929765))

(assert (=> b!1004167 m!929765))

(assert (=> b!1004167 m!929749))

(declare-fun m!929767 () Bool)

(assert (=> b!1004167 m!929767))

(declare-fun m!929769 () Bool)

(assert (=> b!1004160 m!929769))

(declare-fun m!929771 () Bool)

(assert (=> b!1004172 m!929771))

(assert (=> b!1004172 m!929771))

(declare-fun m!929773 () Bool)

(assert (=> b!1004172 m!929773))

(declare-fun m!929775 () Bool)

(assert (=> b!1004172 m!929775))

(declare-fun m!929777 () Bool)

(assert (=> b!1004172 m!929777))

(declare-fun m!929779 () Bool)

(assert (=> start!86592 m!929779))

(declare-fun m!929781 () Bool)

(assert (=> start!86592 m!929781))

(declare-fun m!929783 () Bool)

(assert (=> b!1004157 m!929783))

(assert (=> b!1004158 m!929749))

(assert (=> b!1004158 m!929749))

(declare-fun m!929785 () Bool)

(assert (=> b!1004158 m!929785))

(declare-fun m!929787 () Bool)

(assert (=> b!1004163 m!929787))

(push 1)

