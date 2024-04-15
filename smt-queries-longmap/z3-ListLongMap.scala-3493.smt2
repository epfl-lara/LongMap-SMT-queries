; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48462 () Bool)

(assert start!48462)

(declare-fun b!532138 () Bool)

(declare-fun e!309839 () Bool)

(assert (=> b!532138 (= e!309839 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33735 0))(
  ( (array!33736 (arr!16208 (Array (_ BitVec 32) (_ BitVec 64))) (size!16573 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33735)

(declare-fun lt!244971 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532138 (= lt!244971 (toIndex!0 (select (arr!16208 a!3154) j!147) mask!3216))))

(declare-fun b!532139 () Bool)

(declare-fun e!309840 () Bool)

(assert (=> b!532139 (= e!309840 e!309839)))

(declare-fun res!327629 () Bool)

(assert (=> b!532139 (=> (not res!327629) (not e!309839))))

(declare-datatypes ((SeekEntryResult!4663 0))(
  ( (MissingZero!4663 (index!20876 (_ BitVec 32))) (Found!4663 (index!20877 (_ BitVec 32))) (Intermediate!4663 (undefined!5475 Bool) (index!20878 (_ BitVec 32)) (x!49859 (_ BitVec 32))) (Undefined!4663) (MissingVacant!4663 (index!20879 (_ BitVec 32))) )
))
(declare-fun lt!244972 () SeekEntryResult!4663)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532139 (= res!327629 (or (= lt!244972 (MissingZero!4663 i!1153)) (= lt!244972 (MissingVacant!4663 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33735 (_ BitVec 32)) SeekEntryResult!4663)

(assert (=> b!532139 (= lt!244972 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532140 () Bool)

(declare-fun res!327632 () Bool)

(assert (=> b!532140 (=> (not res!327632) (not e!309840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532140 (= res!327632 (validKeyInArray!0 (select (arr!16208 a!3154) j!147)))))

(declare-fun b!532141 () Bool)

(declare-fun res!327630 () Bool)

(assert (=> b!532141 (=> (not res!327630) (not e!309839))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33735 (_ BitVec 32)) SeekEntryResult!4663)

(assert (=> b!532141 (= res!327630 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16208 a!3154) j!147) a!3154 mask!3216) (Intermediate!4663 false resIndex!32 resX!32)))))

(declare-fun b!532142 () Bool)

(declare-fun res!327631 () Bool)

(assert (=> b!532142 (=> (not res!327631) (not e!309839))))

(assert (=> b!532142 (= res!327631 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16573 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16573 a!3154)) (= (select (arr!16208 a!3154) resIndex!32) (select (arr!16208 a!3154) j!147))))))

(declare-fun res!327626 () Bool)

(assert (=> start!48462 (=> (not res!327626) (not e!309840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48462 (= res!327626 (validMask!0 mask!3216))))

(assert (=> start!48462 e!309840))

(assert (=> start!48462 true))

(declare-fun array_inv!12091 (array!33735) Bool)

(assert (=> start!48462 (array_inv!12091 a!3154)))

(declare-fun b!532143 () Bool)

(declare-fun res!327635 () Bool)

(assert (=> b!532143 (=> (not res!327635) (not e!309839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33735 (_ BitVec 32)) Bool)

(assert (=> b!532143 (= res!327635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532144 () Bool)

(declare-fun res!327627 () Bool)

(assert (=> b!532144 (=> (not res!327627) (not e!309839))))

(declare-datatypes ((List!10366 0))(
  ( (Nil!10363) (Cons!10362 (h!11302 (_ BitVec 64)) (t!16585 List!10366)) )
))
(declare-fun arrayNoDuplicates!0 (array!33735 (_ BitVec 32) List!10366) Bool)

(assert (=> b!532144 (= res!327627 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10363))))

(declare-fun b!532145 () Bool)

(declare-fun res!327628 () Bool)

(assert (=> b!532145 (=> (not res!327628) (not e!309840))))

(declare-fun arrayContainsKey!0 (array!33735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532145 (= res!327628 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532146 () Bool)

(declare-fun res!327634 () Bool)

(assert (=> b!532146 (=> (not res!327634) (not e!309840))))

(assert (=> b!532146 (= res!327634 (and (= (size!16573 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16573 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16573 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532147 () Bool)

(declare-fun res!327633 () Bool)

(assert (=> b!532147 (=> (not res!327633) (not e!309840))))

(assert (=> b!532147 (= res!327633 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48462 res!327626) b!532146))

(assert (= (and b!532146 res!327634) b!532140))

(assert (= (and b!532140 res!327632) b!532147))

(assert (= (and b!532147 res!327633) b!532145))

(assert (= (and b!532145 res!327628) b!532139))

(assert (= (and b!532139 res!327629) b!532143))

(assert (= (and b!532143 res!327635) b!532144))

(assert (= (and b!532144 res!327627) b!532142))

(assert (= (and b!532142 res!327631) b!532141))

(assert (= (and b!532141 res!327630) b!532138))

(declare-fun m!511813 () Bool)

(assert (=> start!48462 m!511813))

(declare-fun m!511815 () Bool)

(assert (=> start!48462 m!511815))

(declare-fun m!511817 () Bool)

(assert (=> b!532140 m!511817))

(assert (=> b!532140 m!511817))

(declare-fun m!511819 () Bool)

(assert (=> b!532140 m!511819))

(declare-fun m!511821 () Bool)

(assert (=> b!532143 m!511821))

(declare-fun m!511823 () Bool)

(assert (=> b!532147 m!511823))

(declare-fun m!511825 () Bool)

(assert (=> b!532142 m!511825))

(assert (=> b!532142 m!511817))

(declare-fun m!511827 () Bool)

(assert (=> b!532139 m!511827))

(declare-fun m!511829 () Bool)

(assert (=> b!532144 m!511829))

(assert (=> b!532138 m!511817))

(assert (=> b!532138 m!511817))

(declare-fun m!511831 () Bool)

(assert (=> b!532138 m!511831))

(assert (=> b!532141 m!511817))

(assert (=> b!532141 m!511817))

(declare-fun m!511833 () Bool)

(assert (=> b!532141 m!511833))

(declare-fun m!511835 () Bool)

(assert (=> b!532145 m!511835))

(check-sat (not b!532144) (not b!532140) (not start!48462) (not b!532139) (not b!532143) (not b!532147) (not b!532141) (not b!532138) (not b!532145))
(check-sat)
