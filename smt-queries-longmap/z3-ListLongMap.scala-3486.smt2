; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48386 () Bool)

(assert start!48386)

(declare-fun b!531673 () Bool)

(declare-fun e!309681 () Bool)

(declare-fun e!309680 () Bool)

(assert (=> b!531673 (= e!309681 e!309680)))

(declare-fun res!327164 () Bool)

(assert (=> b!531673 (=> (not res!327164) (not e!309680))))

(declare-datatypes ((SeekEntryResult!4647 0))(
  ( (MissingZero!4647 (index!20812 (_ BitVec 32))) (Found!4647 (index!20813 (_ BitVec 32))) (Intermediate!4647 (undefined!5459 Bool) (index!20814 (_ BitVec 32)) (x!49789 (_ BitVec 32))) (Undefined!4647) (MissingVacant!4647 (index!20815 (_ BitVec 32))) )
))
(declare-fun lt!245053 () SeekEntryResult!4647)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531673 (= res!327164 (or (= lt!245053 (MissingZero!4647 i!1153)) (= lt!245053 (MissingVacant!4647 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33694 0))(
  ( (array!33695 (arr!16189 (Array (_ BitVec 32) (_ BitVec 64))) (size!16553 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33694)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33694 (_ BitVec 32)) SeekEntryResult!4647)

(assert (=> b!531673 (= lt!245053 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531674 () Bool)

(declare-fun res!327167 () Bool)

(assert (=> b!531674 (=> (not res!327167) (not e!309681))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531674 (= res!327167 (validKeyInArray!0 (select (arr!16189 a!3154) j!147)))))

(declare-fun b!531675 () Bool)

(declare-fun res!327170 () Bool)

(assert (=> b!531675 (=> (not res!327170) (not e!309680))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33694 (_ BitVec 32)) Bool)

(assert (=> b!531675 (= res!327170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531676 () Bool)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!531676 (= e!309680 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16553 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16553 a!3154)) (= (select (arr!16189 a!3154) resIndex!32) (select (arr!16189 a!3154) j!147)) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!531677 () Bool)

(declare-fun res!327163 () Bool)

(assert (=> b!531677 (=> (not res!327163) (not e!309681))))

(assert (=> b!531677 (= res!327163 (validKeyInArray!0 k0!1998))))

(declare-fun b!531678 () Bool)

(declare-fun res!327168 () Bool)

(assert (=> b!531678 (=> (not res!327168) (not e!309681))))

(declare-fun arrayContainsKey!0 (array!33694 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531678 (= res!327168 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531679 () Bool)

(declare-fun res!327165 () Bool)

(assert (=> b!531679 (=> (not res!327165) (not e!309681))))

(assert (=> b!531679 (= res!327165 (and (= (size!16553 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16553 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16553 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!327169 () Bool)

(assert (=> start!48386 (=> (not res!327169) (not e!309681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48386 (= res!327169 (validMask!0 mask!3216))))

(assert (=> start!48386 e!309681))

(assert (=> start!48386 true))

(declare-fun array_inv!11985 (array!33694) Bool)

(assert (=> start!48386 (array_inv!11985 a!3154)))

(declare-fun b!531680 () Bool)

(declare-fun res!327166 () Bool)

(assert (=> b!531680 (=> (not res!327166) (not e!309680))))

(declare-datatypes ((List!10308 0))(
  ( (Nil!10305) (Cons!10304 (h!11244 (_ BitVec 64)) (t!16536 List!10308)) )
))
(declare-fun arrayNoDuplicates!0 (array!33694 (_ BitVec 32) List!10308) Bool)

(assert (=> b!531680 (= res!327166 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10305))))

(assert (= (and start!48386 res!327169) b!531679))

(assert (= (and b!531679 res!327165) b!531674))

(assert (= (and b!531674 res!327167) b!531677))

(assert (= (and b!531677 res!327163) b!531678))

(assert (= (and b!531678 res!327168) b!531673))

(assert (= (and b!531673 res!327164) b!531675))

(assert (= (and b!531675 res!327170) b!531680))

(assert (= (and b!531680 res!327166) b!531676))

(declare-fun m!512045 () Bool)

(assert (=> b!531674 m!512045))

(assert (=> b!531674 m!512045))

(declare-fun m!512047 () Bool)

(assert (=> b!531674 m!512047))

(declare-fun m!512049 () Bool)

(assert (=> b!531676 m!512049))

(assert (=> b!531676 m!512045))

(declare-fun m!512051 () Bool)

(assert (=> b!531673 m!512051))

(declare-fun m!512053 () Bool)

(assert (=> b!531678 m!512053))

(declare-fun m!512055 () Bool)

(assert (=> b!531675 m!512055))

(declare-fun m!512057 () Bool)

(assert (=> start!48386 m!512057))

(declare-fun m!512059 () Bool)

(assert (=> start!48386 m!512059))

(declare-fun m!512061 () Bool)

(assert (=> b!531677 m!512061))

(declare-fun m!512063 () Bool)

(assert (=> b!531680 m!512063))

(check-sat (not b!531675) (not b!531673) (not b!531680) (not b!531674) (not b!531677) (not b!531678) (not start!48386))
(check-sat)
