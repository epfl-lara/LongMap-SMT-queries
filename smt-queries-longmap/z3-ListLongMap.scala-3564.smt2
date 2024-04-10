; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49010 () Bool)

(assert start!49010)

(declare-fun b!540026 () Bool)

(declare-fun res!335078 () Bool)

(declare-fun e!312944 () Bool)

(assert (=> b!540026 (=> (not res!335078) (not e!312944))))

(declare-datatypes ((array!34171 0))(
  ( (array!34172 (arr!16423 (Array (_ BitVec 32) (_ BitVec 64))) (size!16787 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34171)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540026 (= res!335078 (validKeyInArray!0 (select (arr!16423 a!3154) j!147)))))

(declare-fun res!335076 () Bool)

(assert (=> start!49010 (=> (not res!335076) (not e!312944))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49010 (= res!335076 (validMask!0 mask!3216))))

(assert (=> start!49010 e!312944))

(assert (=> start!49010 true))

(declare-fun array_inv!12219 (array!34171) Bool)

(assert (=> start!49010 (array_inv!12219 a!3154)))

(declare-fun b!540027 () Bool)

(declare-fun e!312943 () Bool)

(assert (=> b!540027 (= e!312944 e!312943)))

(declare-fun res!335081 () Bool)

(assert (=> b!540027 (=> (not res!335081) (not e!312943))))

(declare-datatypes ((SeekEntryResult!4881 0))(
  ( (MissingZero!4881 (index!21748 (_ BitVec 32))) (Found!4881 (index!21749 (_ BitVec 32))) (Intermediate!4881 (undefined!5693 Bool) (index!21750 (_ BitVec 32)) (x!50662 (_ BitVec 32))) (Undefined!4881) (MissingVacant!4881 (index!21751 (_ BitVec 32))) )
))
(declare-fun lt!247296 () SeekEntryResult!4881)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540027 (= res!335081 (or (= lt!247296 (MissingZero!4881 i!1153)) (= lt!247296 (MissingVacant!4881 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34171 (_ BitVec 32)) SeekEntryResult!4881)

(assert (=> b!540027 (= lt!247296 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540028 () Bool)

(declare-fun res!335075 () Bool)

(assert (=> b!540028 (=> (not res!335075) (not e!312943))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34171 (_ BitVec 32)) SeekEntryResult!4881)

(assert (=> b!540028 (= res!335075 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16423 a!3154) j!147) a!3154 mask!3216) (Intermediate!4881 false resIndex!32 resX!32)))))

(declare-fun b!540029 () Bool)

(declare-fun res!335080 () Bool)

(assert (=> b!540029 (=> (not res!335080) (not e!312944))))

(assert (=> b!540029 (= res!335080 (and (= (size!16787 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16787 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16787 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540030 () Bool)

(declare-fun res!335077 () Bool)

(assert (=> b!540030 (=> (not res!335077) (not e!312943))))

(assert (=> b!540030 (= res!335077 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16787 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16787 a!3154)) (= (select (arr!16423 a!3154) resIndex!32) (select (arr!16423 a!3154) j!147))))))

(declare-fun b!540031 () Bool)

(declare-fun res!335074 () Bool)

(assert (=> b!540031 (=> (not res!335074) (not e!312943))))

(declare-datatypes ((List!10542 0))(
  ( (Nil!10539) (Cons!10538 (h!11484 (_ BitVec 64)) (t!16770 List!10542)) )
))
(declare-fun arrayNoDuplicates!0 (array!34171 (_ BitVec 32) List!10542) Bool)

(assert (=> b!540031 (= res!335074 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10539))))

(declare-fun b!540032 () Bool)

(declare-fun res!335072 () Bool)

(assert (=> b!540032 (=> (not res!335072) (not e!312943))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34171 (_ BitVec 32)) Bool)

(assert (=> b!540032 (= res!335072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540033 () Bool)

(declare-fun res!335073 () Bool)

(assert (=> b!540033 (=> (not res!335073) (not e!312944))))

(declare-fun arrayContainsKey!0 (array!34171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540033 (= res!335073 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540034 () Bool)

(declare-fun res!335079 () Bool)

(assert (=> b!540034 (=> (not res!335079) (not e!312944))))

(assert (=> b!540034 (= res!335079 (validKeyInArray!0 k0!1998))))

(declare-fun b!540035 () Bool)

(assert (=> b!540035 (= e!312943 false)))

(declare-fun lt!247297 () SeekEntryResult!4881)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540035 (= lt!247297 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16423 a!3154) j!147) mask!3216) (select (arr!16423 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49010 res!335076) b!540029))

(assert (= (and b!540029 res!335080) b!540026))

(assert (= (and b!540026 res!335078) b!540034))

(assert (= (and b!540034 res!335079) b!540033))

(assert (= (and b!540033 res!335073) b!540027))

(assert (= (and b!540027 res!335081) b!540032))

(assert (= (and b!540032 res!335072) b!540031))

(assert (= (and b!540031 res!335074) b!540030))

(assert (= (and b!540030 res!335077) b!540028))

(assert (= (and b!540028 res!335075) b!540035))

(declare-fun m!518879 () Bool)

(assert (=> b!540027 m!518879))

(declare-fun m!518881 () Bool)

(assert (=> b!540030 m!518881))

(declare-fun m!518883 () Bool)

(assert (=> b!540030 m!518883))

(assert (=> b!540026 m!518883))

(assert (=> b!540026 m!518883))

(declare-fun m!518885 () Bool)

(assert (=> b!540026 m!518885))

(declare-fun m!518887 () Bool)

(assert (=> b!540033 m!518887))

(assert (=> b!540028 m!518883))

(assert (=> b!540028 m!518883))

(declare-fun m!518889 () Bool)

(assert (=> b!540028 m!518889))

(assert (=> b!540035 m!518883))

(assert (=> b!540035 m!518883))

(declare-fun m!518891 () Bool)

(assert (=> b!540035 m!518891))

(assert (=> b!540035 m!518891))

(assert (=> b!540035 m!518883))

(declare-fun m!518893 () Bool)

(assert (=> b!540035 m!518893))

(declare-fun m!518895 () Bool)

(assert (=> start!49010 m!518895))

(declare-fun m!518897 () Bool)

(assert (=> start!49010 m!518897))

(declare-fun m!518899 () Bool)

(assert (=> b!540034 m!518899))

(declare-fun m!518901 () Bool)

(assert (=> b!540031 m!518901))

(declare-fun m!518903 () Bool)

(assert (=> b!540032 m!518903))

(check-sat (not b!540031) (not b!540035) (not b!540034) (not b!540032) (not b!540027) (not start!49010) (not b!540026) (not b!540028) (not b!540033))
(check-sat)
