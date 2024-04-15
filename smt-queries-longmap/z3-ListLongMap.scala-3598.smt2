; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49506 () Bool)

(assert start!49506)

(declare-fun res!338937 () Bool)

(declare-fun e!314858 () Bool)

(assert (=> start!49506 (=> (not res!338937) (not e!314858))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49506 (= res!338937 (validMask!0 mask!3216))))

(assert (=> start!49506 e!314858))

(assert (=> start!49506 true))

(declare-datatypes ((array!34386 0))(
  ( (array!34387 (arr!16523 (Array (_ BitVec 32) (_ BitVec 64))) (size!16888 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34386)

(declare-fun array_inv!12406 (array!34386) Bool)

(assert (=> start!49506 (array_inv!12406 a!3154)))

(declare-fun b!544691 () Bool)

(declare-fun res!338948 () Bool)

(assert (=> b!544691 (=> (not res!338948) (not e!314858))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544691 (= res!338948 (validKeyInArray!0 k0!1998))))

(declare-fun b!544692 () Bool)

(declare-fun e!314856 () Bool)

(assert (=> b!544692 (= e!314858 e!314856)))

(declare-fun res!338947 () Bool)

(assert (=> b!544692 (=> (not res!338947) (not e!314856))))

(declare-datatypes ((SeekEntryResult!4978 0))(
  ( (MissingZero!4978 (index!22136 (_ BitVec 32))) (Found!4978 (index!22137 (_ BitVec 32))) (Intermediate!4978 (undefined!5790 Bool) (index!22138 (_ BitVec 32)) (x!51068 (_ BitVec 32))) (Undefined!4978) (MissingVacant!4978 (index!22139 (_ BitVec 32))) )
))
(declare-fun lt!248428 () SeekEntryResult!4978)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544692 (= res!338947 (or (= lt!248428 (MissingZero!4978 i!1153)) (= lt!248428 (MissingVacant!4978 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34386 (_ BitVec 32)) SeekEntryResult!4978)

(assert (=> b!544692 (= lt!248428 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544693 () Bool)

(declare-fun res!338946 () Bool)

(assert (=> b!544693 (=> (not res!338946) (not e!314858))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!544693 (= res!338946 (validKeyInArray!0 (select (arr!16523 a!3154) j!147)))))

(declare-fun b!544694 () Bool)

(declare-fun res!338942 () Bool)

(assert (=> b!544694 (=> (not res!338942) (not e!314856))))

(declare-datatypes ((List!10681 0))(
  ( (Nil!10678) (Cons!10677 (h!11638 (_ BitVec 64)) (t!16900 List!10681)) )
))
(declare-fun arrayNoDuplicates!0 (array!34386 (_ BitVec 32) List!10681) Bool)

(assert (=> b!544694 (= res!338942 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10678))))

(declare-fun b!544695 () Bool)

(declare-fun res!338944 () Bool)

(declare-fun e!314859 () Bool)

(assert (=> b!544695 (=> (not res!338944) (not e!314859))))

(declare-fun lt!248427 () SeekEntryResult!4978)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34386 (_ BitVec 32)) SeekEntryResult!4978)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544695 (= res!338944 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16523 a!3154) j!147) mask!3216) (select (arr!16523 a!3154) j!147) a!3154 mask!3216) lt!248427))))

(declare-fun b!544696 () Bool)

(declare-fun res!338938 () Bool)

(assert (=> b!544696 (=> (not res!338938) (not e!314856))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544696 (= res!338938 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16888 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16888 a!3154)) (= (select (arr!16523 a!3154) resIndex!32) (select (arr!16523 a!3154) j!147))))))

(declare-fun b!544697 () Bool)

(declare-fun res!338943 () Bool)

(assert (=> b!544697 (=> (not res!338943) (not e!314858))))

(declare-fun arrayContainsKey!0 (array!34386 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544697 (= res!338943 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544698 () Bool)

(assert (=> b!544698 (= e!314859 false)))

(declare-fun lt!248426 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544698 (= lt!248426 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544699 () Bool)

(assert (=> b!544699 (= e!314856 e!314859)))

(declare-fun res!338940 () Bool)

(assert (=> b!544699 (=> (not res!338940) (not e!314859))))

(assert (=> b!544699 (= res!338940 (= lt!248427 (Intermediate!4978 false resIndex!32 resX!32)))))

(assert (=> b!544699 (= lt!248427 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16523 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544700 () Bool)

(declare-fun res!338945 () Bool)

(assert (=> b!544700 (=> (not res!338945) (not e!314859))))

(assert (=> b!544700 (= res!338945 (and (not (= (select (arr!16523 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16523 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16523 a!3154) index!1177) (select (arr!16523 a!3154) j!147)))))))

(declare-fun b!544701 () Bool)

(declare-fun res!338939 () Bool)

(assert (=> b!544701 (=> (not res!338939) (not e!314856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34386 (_ BitVec 32)) Bool)

(assert (=> b!544701 (= res!338939 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544702 () Bool)

(declare-fun res!338941 () Bool)

(assert (=> b!544702 (=> (not res!338941) (not e!314858))))

(assert (=> b!544702 (= res!338941 (and (= (size!16888 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16888 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16888 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49506 res!338937) b!544702))

(assert (= (and b!544702 res!338941) b!544693))

(assert (= (and b!544693 res!338946) b!544691))

(assert (= (and b!544691 res!338948) b!544697))

(assert (= (and b!544697 res!338943) b!544692))

(assert (= (and b!544692 res!338947) b!544701))

(assert (= (and b!544701 res!338939) b!544694))

(assert (= (and b!544694 res!338942) b!544696))

(assert (= (and b!544696 res!338938) b!544699))

(assert (= (and b!544699 res!338940) b!544695))

(assert (= (and b!544695 res!338944) b!544700))

(assert (= (and b!544700 res!338945) b!544698))

(declare-fun m!521941 () Bool)

(assert (=> b!544692 m!521941))

(declare-fun m!521943 () Bool)

(assert (=> b!544701 m!521943))

(declare-fun m!521945 () Bool)

(assert (=> b!544694 m!521945))

(declare-fun m!521947 () Bool)

(assert (=> b!544696 m!521947))

(declare-fun m!521949 () Bool)

(assert (=> b!544696 m!521949))

(assert (=> b!544695 m!521949))

(assert (=> b!544695 m!521949))

(declare-fun m!521951 () Bool)

(assert (=> b!544695 m!521951))

(assert (=> b!544695 m!521951))

(assert (=> b!544695 m!521949))

(declare-fun m!521953 () Bool)

(assert (=> b!544695 m!521953))

(declare-fun m!521955 () Bool)

(assert (=> b!544698 m!521955))

(assert (=> b!544699 m!521949))

(assert (=> b!544699 m!521949))

(declare-fun m!521957 () Bool)

(assert (=> b!544699 m!521957))

(declare-fun m!521959 () Bool)

(assert (=> start!49506 m!521959))

(declare-fun m!521961 () Bool)

(assert (=> start!49506 m!521961))

(assert (=> b!544693 m!521949))

(assert (=> b!544693 m!521949))

(declare-fun m!521963 () Bool)

(assert (=> b!544693 m!521963))

(declare-fun m!521965 () Bool)

(assert (=> b!544691 m!521965))

(declare-fun m!521967 () Bool)

(assert (=> b!544697 m!521967))

(declare-fun m!521969 () Bool)

(assert (=> b!544700 m!521969))

(assert (=> b!544700 m!521949))

(check-sat (not b!544698) (not b!544694) (not b!544693) (not b!544697) (not b!544692) (not b!544699) (not start!49506) (not b!544701) (not b!544691) (not b!544695))
(check-sat)
