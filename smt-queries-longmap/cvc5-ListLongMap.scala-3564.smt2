; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49008 () Bool)

(assert start!49008)

(declare-fun b!539996 () Bool)

(declare-fun res!335043 () Bool)

(declare-fun e!312936 () Bool)

(assert (=> b!539996 (=> (not res!335043) (not e!312936))))

(declare-datatypes ((array!34169 0))(
  ( (array!34170 (arr!16422 (Array (_ BitVec 32) (_ BitVec 64))) (size!16786 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34169)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539996 (= res!335043 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539997 () Bool)

(declare-fun res!335050 () Bool)

(assert (=> b!539997 (=> (not res!335050) (not e!312936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539997 (= res!335050 (validKeyInArray!0 k!1998))))

(declare-fun b!539998 () Bool)

(declare-fun e!312934 () Bool)

(assert (=> b!539998 (= e!312936 e!312934)))

(declare-fun res!335049 () Bool)

(assert (=> b!539998 (=> (not res!335049) (not e!312934))))

(declare-datatypes ((SeekEntryResult!4880 0))(
  ( (MissingZero!4880 (index!21744 (_ BitVec 32))) (Found!4880 (index!21745 (_ BitVec 32))) (Intermediate!4880 (undefined!5692 Bool) (index!21746 (_ BitVec 32)) (x!50661 (_ BitVec 32))) (Undefined!4880) (MissingVacant!4880 (index!21747 (_ BitVec 32))) )
))
(declare-fun lt!247291 () SeekEntryResult!4880)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539998 (= res!335049 (or (= lt!247291 (MissingZero!4880 i!1153)) (= lt!247291 (MissingVacant!4880 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34169 (_ BitVec 32)) SeekEntryResult!4880)

(assert (=> b!539998 (= lt!247291 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!539999 () Bool)

(declare-fun res!335042 () Bool)

(assert (=> b!539999 (=> (not res!335042) (not e!312934))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34169 (_ BitVec 32)) SeekEntryResult!4880)

(assert (=> b!539999 (= res!335042 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16422 a!3154) j!147) a!3154 mask!3216) (Intermediate!4880 false resIndex!32 resX!32)))))

(declare-fun b!540001 () Bool)

(declare-fun res!335045 () Bool)

(assert (=> b!540001 (=> (not res!335045) (not e!312936))))

(assert (=> b!540001 (= res!335045 (and (= (size!16786 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16786 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16786 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540002 () Bool)

(declare-fun res!335048 () Bool)

(assert (=> b!540002 (=> (not res!335048) (not e!312936))))

(assert (=> b!540002 (= res!335048 (validKeyInArray!0 (select (arr!16422 a!3154) j!147)))))

(declare-fun b!540003 () Bool)

(declare-fun res!335047 () Bool)

(assert (=> b!540003 (=> (not res!335047) (not e!312934))))

(assert (=> b!540003 (= res!335047 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16786 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16786 a!3154)) (= (select (arr!16422 a!3154) resIndex!32) (select (arr!16422 a!3154) j!147))))))

(declare-fun b!540004 () Bool)

(declare-fun res!335044 () Bool)

(assert (=> b!540004 (=> (not res!335044) (not e!312934))))

(declare-datatypes ((List!10541 0))(
  ( (Nil!10538) (Cons!10537 (h!11483 (_ BitVec 64)) (t!16769 List!10541)) )
))
(declare-fun arrayNoDuplicates!0 (array!34169 (_ BitVec 32) List!10541) Bool)

(assert (=> b!540004 (= res!335044 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10538))))

(declare-fun b!540005 () Bool)

(assert (=> b!540005 (= e!312934 false)))

(declare-fun lt!247290 () SeekEntryResult!4880)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540005 (= lt!247290 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16422 a!3154) j!147) mask!3216) (select (arr!16422 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!335046 () Bool)

(assert (=> start!49008 (=> (not res!335046) (not e!312936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49008 (= res!335046 (validMask!0 mask!3216))))

(assert (=> start!49008 e!312936))

(assert (=> start!49008 true))

(declare-fun array_inv!12218 (array!34169) Bool)

(assert (=> start!49008 (array_inv!12218 a!3154)))

(declare-fun b!540000 () Bool)

(declare-fun res!335051 () Bool)

(assert (=> b!540000 (=> (not res!335051) (not e!312934))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34169 (_ BitVec 32)) Bool)

(assert (=> b!540000 (= res!335051 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49008 res!335046) b!540001))

(assert (= (and b!540001 res!335045) b!540002))

(assert (= (and b!540002 res!335048) b!539997))

(assert (= (and b!539997 res!335050) b!539996))

(assert (= (and b!539996 res!335043) b!539998))

(assert (= (and b!539998 res!335049) b!540000))

(assert (= (and b!540000 res!335051) b!540004))

(assert (= (and b!540004 res!335044) b!540003))

(assert (= (and b!540003 res!335047) b!539999))

(assert (= (and b!539999 res!335042) b!540005))

(declare-fun m!518853 () Bool)

(assert (=> b!539999 m!518853))

(assert (=> b!539999 m!518853))

(declare-fun m!518855 () Bool)

(assert (=> b!539999 m!518855))

(declare-fun m!518857 () Bool)

(assert (=> b!539996 m!518857))

(declare-fun m!518859 () Bool)

(assert (=> b!540004 m!518859))

(declare-fun m!518861 () Bool)

(assert (=> start!49008 m!518861))

(declare-fun m!518863 () Bool)

(assert (=> start!49008 m!518863))

(declare-fun m!518865 () Bool)

(assert (=> b!539997 m!518865))

(declare-fun m!518867 () Bool)

(assert (=> b!540000 m!518867))

(declare-fun m!518869 () Bool)

(assert (=> b!539998 m!518869))

(assert (=> b!540005 m!518853))

(assert (=> b!540005 m!518853))

(declare-fun m!518871 () Bool)

(assert (=> b!540005 m!518871))

(assert (=> b!540005 m!518871))

(assert (=> b!540005 m!518853))

(declare-fun m!518873 () Bool)

(assert (=> b!540005 m!518873))

(declare-fun m!518875 () Bool)

(assert (=> b!540003 m!518875))

(assert (=> b!540003 m!518853))

(assert (=> b!540002 m!518853))

(assert (=> b!540002 m!518853))

(declare-fun m!518877 () Bool)

(assert (=> b!540002 m!518877))

(push 1)

