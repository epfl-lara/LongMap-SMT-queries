; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86814 () Bool)

(assert start!86814)

(declare-fun b!1006698 () Bool)

(declare-fun res!675790 () Bool)

(declare-fun e!566600 () Bool)

(assert (=> b!1006698 (=> (not res!675790) (not e!566600))))

(declare-datatypes ((array!63513 0))(
  ( (array!63514 (arr!30579 (Array (_ BitVec 32) (_ BitVec 64))) (size!31081 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63513)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63513 (_ BitVec 32)) Bool)

(assert (=> b!1006698 (= res!675790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006699 () Bool)

(declare-fun res!675795 () Bool)

(declare-fun e!566605 () Bool)

(assert (=> b!1006699 (=> (not res!675795) (not e!566605))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006699 (= res!675795 (validKeyInArray!0 k!2224))))

(declare-fun b!1006700 () Bool)

(declare-fun e!566601 () Bool)

(declare-fun e!566604 () Bool)

(assert (=> b!1006700 (= e!566601 e!566604)))

(declare-fun res!675794 () Bool)

(assert (=> b!1006700 (=> (not res!675794) (not e!566604))))

(declare-datatypes ((SeekEntryResult!9511 0))(
  ( (MissingZero!9511 (index!40415 (_ BitVec 32))) (Found!9511 (index!40416 (_ BitVec 32))) (Intermediate!9511 (undefined!10323 Bool) (index!40417 (_ BitVec 32)) (x!87807 (_ BitVec 32))) (Undefined!9511) (MissingVacant!9511 (index!40418 (_ BitVec 32))) )
))
(declare-fun lt!444881 () SeekEntryResult!9511)

(declare-fun lt!444876 () SeekEntryResult!9511)

(assert (=> b!1006700 (= res!675794 (= lt!444881 lt!444876))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63513 (_ BitVec 32)) SeekEntryResult!9511)

(assert (=> b!1006700 (= lt!444881 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30579 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006701 () Bool)

(declare-fun res!675787 () Bool)

(assert (=> b!1006701 (=> (not res!675787) (not e!566600))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006701 (= res!675787 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31081 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31081 a!3219))))))

(declare-fun b!1006702 () Bool)

(declare-fun res!675788 () Bool)

(assert (=> b!1006702 (=> (not res!675788) (not e!566605))))

(assert (=> b!1006702 (= res!675788 (validKeyInArray!0 (select (arr!30579 a!3219) j!170)))))

(declare-fun res!675797 () Bool)

(assert (=> start!86814 (=> (not res!675797) (not e!566605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86814 (= res!675797 (validMask!0 mask!3464))))

(assert (=> start!86814 e!566605))

(declare-fun array_inv!23703 (array!63513) Bool)

(assert (=> start!86814 (array_inv!23703 a!3219)))

(assert (=> start!86814 true))

(declare-fun b!1006703 () Bool)

(assert (=> b!1006703 (= e!566605 e!566600)))

(declare-fun res!675789 () Bool)

(assert (=> b!1006703 (=> (not res!675789) (not e!566600))))

(declare-fun lt!444880 () SeekEntryResult!9511)

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1006703 (= res!675789 (or (= lt!444880 (MissingVacant!9511 i!1194)) (= lt!444880 (MissingZero!9511 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63513 (_ BitVec 32)) SeekEntryResult!9511)

(assert (=> b!1006703 (= lt!444880 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1006704 () Bool)

(declare-fun res!675791 () Bool)

(assert (=> b!1006704 (=> (not res!675791) (not e!566605))))

(declare-fun arrayContainsKey!0 (array!63513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006704 (= res!675791 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1006705 () Bool)

(declare-fun res!675792 () Bool)

(assert (=> b!1006705 (=> (not res!675792) (not e!566605))))

(assert (=> b!1006705 (= res!675792 (and (= (size!31081 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31081 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31081 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006706 () Bool)

(declare-fun res!675793 () Bool)

(declare-fun e!566603 () Bool)

(assert (=> b!1006706 (=> (not res!675793) (not e!566603))))

(declare-fun lt!444878 () array!63513)

(declare-fun lt!444877 () (_ BitVec 64))

(assert (=> b!1006706 (= res!675793 (not (= lt!444881 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444877 lt!444878 mask!3464))))))

(declare-fun b!1006707 () Bool)

(declare-fun res!675796 () Bool)

(assert (=> b!1006707 (=> (not res!675796) (not e!566600))))

(declare-datatypes ((List!21255 0))(
  ( (Nil!21252) (Cons!21251 (h!22434 (_ BitVec 64)) (t!30256 List!21255)) )
))
(declare-fun arrayNoDuplicates!0 (array!63513 (_ BitVec 32) List!21255) Bool)

(assert (=> b!1006707 (= res!675796 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21252))))

(declare-fun b!1006708 () Bool)

(assert (=> b!1006708 (= e!566600 e!566601)))

(declare-fun res!675798 () Bool)

(assert (=> b!1006708 (=> (not res!675798) (not e!566601))))

(declare-fun lt!444879 () SeekEntryResult!9511)

(assert (=> b!1006708 (= res!675798 (= lt!444879 lt!444876))))

(assert (=> b!1006708 (= lt!444876 (Intermediate!9511 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006708 (= lt!444879 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30579 a!3219) j!170) mask!3464) (select (arr!30579 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006709 () Bool)

(assert (=> b!1006709 (= e!566603 (bvslt (bvsub #b01111111111111111111111111111110 x!1245) #b00000000000000000000000000000000))))

(declare-fun b!1006710 () Bool)

(assert (=> b!1006710 (= e!566604 e!566603)))

(declare-fun res!675786 () Bool)

(assert (=> b!1006710 (=> (not res!675786) (not e!566603))))

(assert (=> b!1006710 (= res!675786 (not (= lt!444879 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444877 mask!3464) lt!444877 lt!444878 mask!3464))))))

(assert (=> b!1006710 (= lt!444877 (select (store (arr!30579 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1006710 (= lt!444878 (array!63514 (store (arr!30579 a!3219) i!1194 k!2224) (size!31081 a!3219)))))

(assert (= (and start!86814 res!675797) b!1006705))

(assert (= (and b!1006705 res!675792) b!1006702))

(assert (= (and b!1006702 res!675788) b!1006699))

(assert (= (and b!1006699 res!675795) b!1006704))

(assert (= (and b!1006704 res!675791) b!1006703))

(assert (= (and b!1006703 res!675789) b!1006698))

(assert (= (and b!1006698 res!675790) b!1006707))

(assert (= (and b!1006707 res!675796) b!1006701))

(assert (= (and b!1006701 res!675787) b!1006708))

(assert (= (and b!1006708 res!675798) b!1006700))

(assert (= (and b!1006700 res!675794) b!1006710))

(assert (= (and b!1006710 res!675786) b!1006706))

(assert (= (and b!1006706 res!675793) b!1006709))

(declare-fun m!931777 () Bool)

(assert (=> b!1006698 m!931777))

(declare-fun m!931779 () Bool)

(assert (=> b!1006710 m!931779))

(assert (=> b!1006710 m!931779))

(declare-fun m!931781 () Bool)

(assert (=> b!1006710 m!931781))

(declare-fun m!931783 () Bool)

(assert (=> b!1006710 m!931783))

(declare-fun m!931785 () Bool)

(assert (=> b!1006710 m!931785))

(declare-fun m!931787 () Bool)

(assert (=> b!1006700 m!931787))

(assert (=> b!1006700 m!931787))

(declare-fun m!931789 () Bool)

(assert (=> b!1006700 m!931789))

(assert (=> b!1006708 m!931787))

(assert (=> b!1006708 m!931787))

(declare-fun m!931791 () Bool)

(assert (=> b!1006708 m!931791))

(assert (=> b!1006708 m!931791))

(assert (=> b!1006708 m!931787))

(declare-fun m!931793 () Bool)

(assert (=> b!1006708 m!931793))

(declare-fun m!931795 () Bool)

(assert (=> b!1006707 m!931795))

(declare-fun m!931797 () Bool)

(assert (=> b!1006703 m!931797))

(declare-fun m!931799 () Bool)

(assert (=> b!1006699 m!931799))

(assert (=> b!1006702 m!931787))

(assert (=> b!1006702 m!931787))

(declare-fun m!931801 () Bool)

(assert (=> b!1006702 m!931801))

(declare-fun m!931803 () Bool)

(assert (=> start!86814 m!931803))

(declare-fun m!931805 () Bool)

(assert (=> start!86814 m!931805))

(declare-fun m!931807 () Bool)

(assert (=> b!1006706 m!931807))

(declare-fun m!931809 () Bool)

(assert (=> b!1006704 m!931809))

(push 1)

(assert (not start!86814))

(assert (not b!1006700))

(assert (not b!1006699))

(assert (not b!1006704))

(assert (not b!1006706))

(assert (not b!1006707))

(assert (not b!1006703))

(assert (not b!1006710))

(assert (not b!1006698))

(assert (not b!1006702))

(assert (not b!1006708))

(check-sat)

(pop 1)

(push 1)

(check-sat)

