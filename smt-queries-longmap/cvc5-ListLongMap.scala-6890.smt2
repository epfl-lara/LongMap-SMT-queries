; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86594 () Bool)

(assert start!86594)

(declare-fun b!1004205 () Bool)

(declare-fun res!673684 () Bool)

(declare-fun e!565510 () Bool)

(assert (=> b!1004205 (=> (not res!673684) (not e!565510))))

(declare-fun j!170 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!9455 0))(
  ( (MissingZero!9455 (index!40191 (_ BitVec 32))) (Found!9455 (index!40192 (_ BitVec 32))) (Intermediate!9455 (undefined!10267 Bool) (index!40193 (_ BitVec 32)) (x!87595 (_ BitVec 32))) (Undefined!9455) (MissingVacant!9455 (index!40194 (_ BitVec 32))) )
))
(declare-fun lt!444063 () SeekEntryResult!9455)

(declare-datatypes ((array!63395 0))(
  ( (array!63396 (arr!30523 (Array (_ BitVec 32) (_ BitVec 64))) (size!31025 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63395)

(declare-fun lt!444059 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63395 (_ BitVec 32)) SeekEntryResult!9455)

(assert (=> b!1004205 (= res!673684 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444059 (select (arr!30523 a!3219) j!170) a!3219 mask!3464) lt!444063))))

(declare-fun b!1004206 () Bool)

(declare-fun e!565506 () Bool)

(declare-fun e!565507 () Bool)

(assert (=> b!1004206 (= e!565506 e!565507)))

(declare-fun res!673695 () Bool)

(assert (=> b!1004206 (=> (not res!673695) (not e!565507))))

(declare-fun lt!444061 () SeekEntryResult!9455)

(assert (=> b!1004206 (= res!673695 (= lt!444061 lt!444063))))

(declare-fun index!1507 () (_ BitVec 32))

(assert (=> b!1004206 (= lt!444061 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30523 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004207 () Bool)

(declare-fun e!565505 () Bool)

(assert (=> b!1004207 (= e!565505 e!565506)))

(declare-fun res!673697 () Bool)

(assert (=> b!1004207 (=> (not res!673697) (not e!565506))))

(declare-fun lt!444060 () SeekEntryResult!9455)

(assert (=> b!1004207 (= res!673697 (= lt!444060 lt!444063))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1004207 (= lt!444063 (Intermediate!9455 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004207 (= lt!444060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30523 a!3219) j!170) mask!3464) (select (arr!30523 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1004209 () Bool)

(declare-fun res!673698 () Bool)

(declare-fun e!565504 () Bool)

(assert (=> b!1004209 (=> (not res!673698) (not e!565504))))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1004209 (= res!673698 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1004210 () Bool)

(declare-fun res!673693 () Bool)

(assert (=> b!1004210 (=> (not res!673693) (not e!565505))))

(assert (=> b!1004210 (= res!673693 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31025 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31025 a!3219))))))

(declare-fun b!1004211 () Bool)

(assert (=> b!1004211 (= e!565504 e!565510)))

(declare-fun res!673683 () Bool)

(assert (=> b!1004211 (=> (not res!673683) (not e!565510))))

(assert (=> b!1004211 (= res!673683 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1245) resX!38) (bvsge (bvadd #b00000000000000000000000000000001 x!1245) #b00000000000000000000000000000000) (bvsge lt!444059 #b00000000000000000000000000000000) (bvslt lt!444059 (size!31025 a!3219))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1004211 (= lt!444059 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1004212 () Bool)

(assert (=> b!1004212 (= e!565507 e!565504)))

(declare-fun res!673694 () Bool)

(assert (=> b!1004212 (=> (not res!673694) (not e!565504))))

(declare-fun lt!444064 () array!63395)

(declare-fun lt!444062 () (_ BitVec 64))

(assert (=> b!1004212 (= res!673694 (not (= lt!444060 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444062 mask!3464) lt!444062 lt!444064 mask!3464))))))

(declare-fun k!2224 () (_ BitVec 64))

(assert (=> b!1004212 (= lt!444062 (select (store (arr!30523 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1004212 (= lt!444064 (array!63396 (store (arr!30523 a!3219) i!1194 k!2224) (size!31025 a!3219)))))

(declare-fun b!1004213 () Bool)

(declare-fun res!673688 () Bool)

(declare-fun e!565508 () Bool)

(assert (=> b!1004213 (=> (not res!673688) (not e!565508))))

(declare-fun arrayContainsKey!0 (array!63395 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1004213 (= res!673688 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1004214 () Bool)

(declare-fun res!673691 () Bool)

(assert (=> b!1004214 (=> (not res!673691) (not e!565504))))

(assert (=> b!1004214 (= res!673691 (not (= lt!444061 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444062 lt!444064 mask!3464))))))

(declare-fun b!1004215 () Bool)

(declare-fun res!673685 () Bool)

(assert (=> b!1004215 (=> (not res!673685) (not e!565508))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1004215 (= res!673685 (validKeyInArray!0 (select (arr!30523 a!3219) j!170)))))

(declare-fun b!1004216 () Bool)

(declare-fun res!673689 () Bool)

(assert (=> b!1004216 (=> (not res!673689) (not e!565505))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63395 (_ BitVec 32)) Bool)

(assert (=> b!1004216 (= res!673689 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1004217 () Bool)

(declare-fun res!673686 () Bool)

(assert (=> b!1004217 (=> (not res!673686) (not e!565508))))

(assert (=> b!1004217 (= res!673686 (and (= (size!31025 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31025 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31025 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1004218 () Bool)

(assert (=> b!1004218 (= e!565510 false)))

(declare-fun lt!444065 () SeekEntryResult!9455)

(assert (=> b!1004218 (= lt!444065 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1245) lt!444059 lt!444062 lt!444064 mask!3464))))

(declare-fun res!673692 () Bool)

(assert (=> start!86594 (=> (not res!673692) (not e!565508))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86594 (= res!673692 (validMask!0 mask!3464))))

(assert (=> start!86594 e!565508))

(declare-fun array_inv!23647 (array!63395) Bool)

(assert (=> start!86594 (array_inv!23647 a!3219)))

(assert (=> start!86594 true))

(declare-fun b!1004208 () Bool)

(assert (=> b!1004208 (= e!565508 e!565505)))

(declare-fun res!673696 () Bool)

(assert (=> b!1004208 (=> (not res!673696) (not e!565505))))

(declare-fun lt!444058 () SeekEntryResult!9455)

(assert (=> b!1004208 (= res!673696 (or (= lt!444058 (MissingVacant!9455 i!1194)) (= lt!444058 (MissingZero!9455 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63395 (_ BitVec 32)) SeekEntryResult!9455)

(assert (=> b!1004208 (= lt!444058 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1004219 () Bool)

(declare-fun res!673687 () Bool)

(assert (=> b!1004219 (=> (not res!673687) (not e!565505))))

(declare-datatypes ((List!21199 0))(
  ( (Nil!21196) (Cons!21195 (h!22372 (_ BitVec 64)) (t!30200 List!21199)) )
))
(declare-fun arrayNoDuplicates!0 (array!63395 (_ BitVec 32) List!21199) Bool)

(assert (=> b!1004219 (= res!673687 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21196))))

(declare-fun b!1004220 () Bool)

(declare-fun res!673690 () Bool)

(assert (=> b!1004220 (=> (not res!673690) (not e!565508))))

(assert (=> b!1004220 (= res!673690 (validKeyInArray!0 k!2224))))

(assert (= (and start!86594 res!673692) b!1004217))

(assert (= (and b!1004217 res!673686) b!1004215))

(assert (= (and b!1004215 res!673685) b!1004220))

(assert (= (and b!1004220 res!673690) b!1004213))

(assert (= (and b!1004213 res!673688) b!1004208))

(assert (= (and b!1004208 res!673696) b!1004216))

(assert (= (and b!1004216 res!673689) b!1004219))

(assert (= (and b!1004219 res!673687) b!1004210))

(assert (= (and b!1004210 res!673693) b!1004207))

(assert (= (and b!1004207 res!673697) b!1004206))

(assert (= (and b!1004206 res!673695) b!1004212))

(assert (= (and b!1004212 res!673694) b!1004214))

(assert (= (and b!1004214 res!673691) b!1004209))

(assert (= (and b!1004209 res!673698) b!1004211))

(assert (= (and b!1004211 res!673683) b!1004205))

(assert (= (and b!1004205 res!673684) b!1004218))

(declare-fun m!929789 () Bool)

(assert (=> b!1004212 m!929789))

(assert (=> b!1004212 m!929789))

(declare-fun m!929791 () Bool)

(assert (=> b!1004212 m!929791))

(declare-fun m!929793 () Bool)

(assert (=> b!1004212 m!929793))

(declare-fun m!929795 () Bool)

(assert (=> b!1004212 m!929795))

(declare-fun m!929797 () Bool)

(assert (=> b!1004207 m!929797))

(assert (=> b!1004207 m!929797))

(declare-fun m!929799 () Bool)

(assert (=> b!1004207 m!929799))

(assert (=> b!1004207 m!929799))

(assert (=> b!1004207 m!929797))

(declare-fun m!929801 () Bool)

(assert (=> b!1004207 m!929801))

(declare-fun m!929803 () Bool)

(assert (=> b!1004208 m!929803))

(declare-fun m!929805 () Bool)

(assert (=> b!1004218 m!929805))

(assert (=> b!1004205 m!929797))

(assert (=> b!1004205 m!929797))

(declare-fun m!929807 () Bool)

(assert (=> b!1004205 m!929807))

(declare-fun m!929809 () Bool)

(assert (=> b!1004220 m!929809))

(declare-fun m!929811 () Bool)

(assert (=> b!1004216 m!929811))

(declare-fun m!929813 () Bool)

(assert (=> start!86594 m!929813))

(declare-fun m!929815 () Bool)

(assert (=> start!86594 m!929815))

(declare-fun m!929817 () Bool)

(assert (=> b!1004211 m!929817))

(declare-fun m!929819 () Bool)

(assert (=> b!1004219 m!929819))

(declare-fun m!929821 () Bool)

(assert (=> b!1004214 m!929821))

(assert (=> b!1004206 m!929797))

(assert (=> b!1004206 m!929797))

(declare-fun m!929823 () Bool)

(assert (=> b!1004206 m!929823))

(declare-fun m!929825 () Bool)

(assert (=> b!1004213 m!929825))

(assert (=> b!1004215 m!929797))

(assert (=> b!1004215 m!929797))

(declare-fun m!929827 () Bool)

(assert (=> b!1004215 m!929827))

(push 1)

