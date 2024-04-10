; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48398 () Bool)

(assert start!48398)

(declare-fun b!531808 () Bool)

(declare-fun res!327305 () Bool)

(declare-fun e!309734 () Bool)

(assert (=> b!531808 (=> (not res!327305) (not e!309734))))

(declare-datatypes ((array!33706 0))(
  ( (array!33707 (arr!16195 (Array (_ BitVec 32) (_ BitVec 64))) (size!16559 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33706)

(declare-datatypes ((List!10314 0))(
  ( (Nil!10311) (Cons!10310 (h!11250 (_ BitVec 64)) (t!16542 List!10314)) )
))
(declare-fun arrayNoDuplicates!0 (array!33706 (_ BitVec 32) List!10314) Bool)

(assert (=> b!531808 (= res!327305 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10311))))

(declare-fun b!531809 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!531809 (= e!309734 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16559 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16559 a!3154)) (= (select (arr!16195 a!3154) resIndex!32) (select (arr!16195 a!3154) j!147)) (bvsge mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216))))))

(declare-fun b!531810 () Bool)

(declare-fun res!327300 () Bool)

(assert (=> b!531810 (=> (not res!327300) (not e!309734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33706 (_ BitVec 32)) Bool)

(assert (=> b!531810 (= res!327300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531811 () Bool)

(declare-fun res!327304 () Bool)

(declare-fun e!309735 () Bool)

(assert (=> b!531811 (=> (not res!327304) (not e!309735))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531811 (= res!327304 (and (= (size!16559 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16559 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16559 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531812 () Bool)

(declare-fun res!327301 () Bool)

(assert (=> b!531812 (=> (not res!327301) (not e!309735))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531812 (= res!327301 (validKeyInArray!0 k0!1998))))

(declare-fun res!327303 () Bool)

(assert (=> start!48398 (=> (not res!327303) (not e!309735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48398 (= res!327303 (validMask!0 mask!3216))))

(assert (=> start!48398 e!309735))

(assert (=> start!48398 true))

(declare-fun array_inv!11991 (array!33706) Bool)

(assert (=> start!48398 (array_inv!11991 a!3154)))

(declare-fun b!531813 () Bool)

(assert (=> b!531813 (= e!309735 e!309734)))

(declare-fun res!327302 () Bool)

(assert (=> b!531813 (=> (not res!327302) (not e!309734))))

(declare-datatypes ((SeekEntryResult!4653 0))(
  ( (MissingZero!4653 (index!20836 (_ BitVec 32))) (Found!4653 (index!20837 (_ BitVec 32))) (Intermediate!4653 (undefined!5465 Bool) (index!20838 (_ BitVec 32)) (x!49811 (_ BitVec 32))) (Undefined!4653) (MissingVacant!4653 (index!20839 (_ BitVec 32))) )
))
(declare-fun lt!245080 () SeekEntryResult!4653)

(assert (=> b!531813 (= res!327302 (or (= lt!245080 (MissingZero!4653 i!1153)) (= lt!245080 (MissingVacant!4653 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33706 (_ BitVec 32)) SeekEntryResult!4653)

(assert (=> b!531813 (= lt!245080 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531814 () Bool)

(declare-fun res!327298 () Bool)

(assert (=> b!531814 (=> (not res!327298) (not e!309735))))

(declare-fun arrayContainsKey!0 (array!33706 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531814 (= res!327298 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531815 () Bool)

(declare-fun res!327299 () Bool)

(assert (=> b!531815 (=> (not res!327299) (not e!309735))))

(assert (=> b!531815 (= res!327299 (validKeyInArray!0 (select (arr!16195 a!3154) j!147)))))

(assert (= (and start!48398 res!327303) b!531811))

(assert (= (and b!531811 res!327304) b!531815))

(assert (= (and b!531815 res!327299) b!531812))

(assert (= (and b!531812 res!327301) b!531814))

(assert (= (and b!531814 res!327298) b!531813))

(assert (= (and b!531813 res!327302) b!531810))

(assert (= (and b!531810 res!327300) b!531808))

(assert (= (and b!531808 res!327305) b!531809))

(declare-fun m!512159 () Bool)

(assert (=> start!48398 m!512159))

(declare-fun m!512161 () Bool)

(assert (=> start!48398 m!512161))

(declare-fun m!512163 () Bool)

(assert (=> b!531809 m!512163))

(declare-fun m!512165 () Bool)

(assert (=> b!531809 m!512165))

(declare-fun m!512167 () Bool)

(assert (=> b!531808 m!512167))

(declare-fun m!512169 () Bool)

(assert (=> b!531814 m!512169))

(declare-fun m!512171 () Bool)

(assert (=> b!531813 m!512171))

(declare-fun m!512173 () Bool)

(assert (=> b!531810 m!512173))

(assert (=> b!531815 m!512165))

(assert (=> b!531815 m!512165))

(declare-fun m!512175 () Bool)

(assert (=> b!531815 m!512175))

(declare-fun m!512177 () Bool)

(assert (=> b!531812 m!512177))

(check-sat (not b!531808) (not b!531813) (not b!531814) (not b!531810) (not b!531812) (not b!531815) (not start!48398))
(check-sat)
