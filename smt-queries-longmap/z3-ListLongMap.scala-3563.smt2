; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49004 () Bool)

(assert start!49004)

(declare-fun b!539936 () Bool)

(declare-fun res!334991 () Bool)

(declare-fun e!312916 () Bool)

(assert (=> b!539936 (=> (not res!334991) (not e!312916))))

(declare-datatypes ((array!34165 0))(
  ( (array!34166 (arr!16420 (Array (_ BitVec 32) (_ BitVec 64))) (size!16784 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34165)

(declare-datatypes ((List!10539 0))(
  ( (Nil!10536) (Cons!10535 (h!11481 (_ BitVec 64)) (t!16767 List!10539)) )
))
(declare-fun arrayNoDuplicates!0 (array!34165 (_ BitVec 32) List!10539) Bool)

(assert (=> b!539936 (= res!334991 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10536))))

(declare-fun b!539937 () Bool)

(declare-fun res!334987 () Bool)

(declare-fun e!312918 () Bool)

(assert (=> b!539937 (=> (not res!334987) (not e!312918))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539937 (= res!334987 (validKeyInArray!0 (select (arr!16420 a!3154) j!147)))))

(declare-fun b!539938 () Bool)

(declare-fun res!334984 () Bool)

(assert (=> b!539938 (=> (not res!334984) (not e!312916))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4878 0))(
  ( (MissingZero!4878 (index!21736 (_ BitVec 32))) (Found!4878 (index!21737 (_ BitVec 32))) (Intermediate!4878 (undefined!5690 Bool) (index!21738 (_ BitVec 32)) (x!50651 (_ BitVec 32))) (Undefined!4878) (MissingVacant!4878 (index!21739 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34165 (_ BitVec 32)) SeekEntryResult!4878)

(assert (=> b!539938 (= res!334984 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16420 a!3154) j!147) a!3154 mask!3216) (Intermediate!4878 false resIndex!32 resX!32)))))

(declare-fun b!539939 () Bool)

(assert (=> b!539939 (= e!312916 false)))

(declare-fun lt!247278 () SeekEntryResult!4878)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539939 (= lt!247278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16420 a!3154) j!147) mask!3216) (select (arr!16420 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!539940 () Bool)

(declare-fun res!334990 () Bool)

(assert (=> b!539940 (=> (not res!334990) (not e!312918))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539940 (= res!334990 (and (= (size!16784 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16784 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16784 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!334986 () Bool)

(assert (=> start!49004 (=> (not res!334986) (not e!312918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49004 (= res!334986 (validMask!0 mask!3216))))

(assert (=> start!49004 e!312918))

(assert (=> start!49004 true))

(declare-fun array_inv!12216 (array!34165) Bool)

(assert (=> start!49004 (array_inv!12216 a!3154)))

(declare-fun b!539941 () Bool)

(assert (=> b!539941 (= e!312918 e!312916)))

(declare-fun res!334989 () Bool)

(assert (=> b!539941 (=> (not res!334989) (not e!312916))))

(declare-fun lt!247279 () SeekEntryResult!4878)

(assert (=> b!539941 (= res!334989 (or (= lt!247279 (MissingZero!4878 i!1153)) (= lt!247279 (MissingVacant!4878 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34165 (_ BitVec 32)) SeekEntryResult!4878)

(assert (=> b!539941 (= lt!247279 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539942 () Bool)

(declare-fun res!334985 () Bool)

(assert (=> b!539942 (=> (not res!334985) (not e!312916))))

(assert (=> b!539942 (= res!334985 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16784 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16784 a!3154)) (= (select (arr!16420 a!3154) resIndex!32) (select (arr!16420 a!3154) j!147))))))

(declare-fun b!539943 () Bool)

(declare-fun res!334982 () Bool)

(assert (=> b!539943 (=> (not res!334982) (not e!312918))))

(declare-fun arrayContainsKey!0 (array!34165 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539943 (= res!334982 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539944 () Bool)

(declare-fun res!334983 () Bool)

(assert (=> b!539944 (=> (not res!334983) (not e!312916))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34165 (_ BitVec 32)) Bool)

(assert (=> b!539944 (= res!334983 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539945 () Bool)

(declare-fun res!334988 () Bool)

(assert (=> b!539945 (=> (not res!334988) (not e!312918))))

(assert (=> b!539945 (= res!334988 (validKeyInArray!0 k0!1998))))

(assert (= (and start!49004 res!334986) b!539940))

(assert (= (and b!539940 res!334990) b!539937))

(assert (= (and b!539937 res!334987) b!539945))

(assert (= (and b!539945 res!334988) b!539943))

(assert (= (and b!539943 res!334982) b!539941))

(assert (= (and b!539941 res!334989) b!539944))

(assert (= (and b!539944 res!334983) b!539936))

(assert (= (and b!539936 res!334991) b!539942))

(assert (= (and b!539942 res!334985) b!539938))

(assert (= (and b!539938 res!334984) b!539939))

(declare-fun m!518801 () Bool)

(assert (=> b!539944 m!518801))

(declare-fun m!518803 () Bool)

(assert (=> b!539945 m!518803))

(declare-fun m!518805 () Bool)

(assert (=> b!539941 m!518805))

(declare-fun m!518807 () Bool)

(assert (=> b!539936 m!518807))

(declare-fun m!518809 () Bool)

(assert (=> b!539937 m!518809))

(assert (=> b!539937 m!518809))

(declare-fun m!518811 () Bool)

(assert (=> b!539937 m!518811))

(declare-fun m!518813 () Bool)

(assert (=> b!539942 m!518813))

(assert (=> b!539942 m!518809))

(assert (=> b!539938 m!518809))

(assert (=> b!539938 m!518809))

(declare-fun m!518815 () Bool)

(assert (=> b!539938 m!518815))

(assert (=> b!539939 m!518809))

(assert (=> b!539939 m!518809))

(declare-fun m!518817 () Bool)

(assert (=> b!539939 m!518817))

(assert (=> b!539939 m!518817))

(assert (=> b!539939 m!518809))

(declare-fun m!518819 () Bool)

(assert (=> b!539939 m!518819))

(declare-fun m!518821 () Bool)

(assert (=> start!49004 m!518821))

(declare-fun m!518823 () Bool)

(assert (=> start!49004 m!518823))

(declare-fun m!518825 () Bool)

(assert (=> b!539943 m!518825))

(check-sat (not b!539936) (not b!539941) (not b!539945) (not b!539937) (not b!539938) (not b!539943) (not b!539944) (not start!49004) (not b!539939))
(check-sat)
