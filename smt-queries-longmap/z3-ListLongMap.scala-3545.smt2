; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48886 () Bool)

(assert start!48886)

(declare-fun b!538060 () Bool)

(declare-fun res!333167 () Bool)

(declare-fun e!312092 () Bool)

(assert (=> b!538060 (=> (not res!333167) (not e!312092))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538060 (= res!333167 (validKeyInArray!0 k0!1998))))

(declare-fun b!538061 () Bool)

(declare-fun res!333166 () Bool)

(assert (=> b!538061 (=> (not res!333166) (not e!312092))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34046 0))(
  ( (array!34047 (arr!16360 (Array (_ BitVec 32) (_ BitVec 64))) (size!16724 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34046)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538061 (= res!333166 (and (= (size!16724 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16724 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16724 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538062 () Bool)

(declare-fun res!333169 () Bool)

(declare-fun e!312093 () Bool)

(assert (=> b!538062 (=> (not res!333169) (not e!312093))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538062 (= res!333169 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16724 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16724 a!3154)) (= (select (arr!16360 a!3154) resIndex!32) (select (arr!16360 a!3154) j!147))))))

(declare-fun b!538063 () Bool)

(declare-fun e!312089 () Bool)

(assert (=> b!538063 (= e!312089 false)))

(declare-datatypes ((SeekEntryResult!4774 0))(
  ( (MissingZero!4774 (index!21320 (_ BitVec 32))) (Found!4774 (index!21321 (_ BitVec 32))) (Intermediate!4774 (undefined!5586 Bool) (index!21322 (_ BitVec 32)) (x!50400 (_ BitVec 32))) (Undefined!4774) (MissingVacant!4774 (index!21323 (_ BitVec 32))) )
))
(declare-fun lt!246642 () SeekEntryResult!4774)

(declare-fun lt!246643 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34046 (_ BitVec 32)) SeekEntryResult!4774)

(assert (=> b!538063 (= lt!246642 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246643 (select (arr!16360 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538064 () Bool)

(assert (=> b!538064 (= e!312092 e!312093)))

(declare-fun res!333165 () Bool)

(assert (=> b!538064 (=> (not res!333165) (not e!312093))))

(declare-fun lt!246641 () SeekEntryResult!4774)

(assert (=> b!538064 (= res!333165 (or (= lt!246641 (MissingZero!4774 i!1153)) (= lt!246641 (MissingVacant!4774 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34046 (_ BitVec 32)) SeekEntryResult!4774)

(assert (=> b!538064 (= lt!246641 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538065 () Bool)

(declare-fun res!333170 () Bool)

(assert (=> b!538065 (=> (not res!333170) (not e!312092))))

(assert (=> b!538065 (= res!333170 (validKeyInArray!0 (select (arr!16360 a!3154) j!147)))))

(declare-fun res!333172 () Bool)

(assert (=> start!48886 (=> (not res!333172) (not e!312092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48886 (= res!333172 (validMask!0 mask!3216))))

(assert (=> start!48886 e!312092))

(assert (=> start!48886 true))

(declare-fun array_inv!12219 (array!34046) Bool)

(assert (=> start!48886 (array_inv!12219 a!3154)))

(declare-fun b!538066 () Bool)

(declare-fun e!312091 () Bool)

(assert (=> b!538066 (= e!312093 e!312091)))

(declare-fun res!333161 () Bool)

(assert (=> b!538066 (=> (not res!333161) (not e!312091))))

(declare-fun lt!246640 () SeekEntryResult!4774)

(assert (=> b!538066 (= res!333161 (= lt!246640 (Intermediate!4774 false resIndex!32 resX!32)))))

(assert (=> b!538066 (= lt!246640 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16360 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538067 () Bool)

(declare-fun res!333160 () Bool)

(assert (=> b!538067 (=> (not res!333160) (not e!312093))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34046 (_ BitVec 32)) Bool)

(assert (=> b!538067 (= res!333160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538068 () Bool)

(declare-fun res!333164 () Bool)

(assert (=> b!538068 (=> (not res!333164) (not e!312091))))

(assert (=> b!538068 (= res!333164 (and (not (= (select (arr!16360 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16360 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16360 a!3154) index!1177) (select (arr!16360 a!3154) j!147)))))))

(declare-fun b!538069 () Bool)

(declare-fun res!333168 () Bool)

(assert (=> b!538069 (=> (not res!333168) (not e!312093))))

(declare-datatypes ((List!10386 0))(
  ( (Nil!10383) (Cons!10382 (h!11328 (_ BitVec 64)) (t!16606 List!10386)) )
))
(declare-fun arrayNoDuplicates!0 (array!34046 (_ BitVec 32) List!10386) Bool)

(assert (=> b!538069 (= res!333168 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10383))))

(declare-fun b!538070 () Bool)

(assert (=> b!538070 (= e!312091 e!312089)))

(declare-fun res!333171 () Bool)

(assert (=> b!538070 (=> (not res!333171) (not e!312089))))

(assert (=> b!538070 (= res!333171 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246643 #b00000000000000000000000000000000) (bvslt lt!246643 (size!16724 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538070 (= lt!246643 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!538071 () Bool)

(declare-fun res!333163 () Bool)

(assert (=> b!538071 (=> (not res!333163) (not e!312091))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538071 (= res!333163 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16360 a!3154) j!147) mask!3216) (select (arr!16360 a!3154) j!147) a!3154 mask!3216) lt!246640))))

(declare-fun b!538072 () Bool)

(declare-fun res!333162 () Bool)

(assert (=> b!538072 (=> (not res!333162) (not e!312092))))

(declare-fun arrayContainsKey!0 (array!34046 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538072 (= res!333162 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48886 res!333172) b!538061))

(assert (= (and b!538061 res!333166) b!538065))

(assert (= (and b!538065 res!333170) b!538060))

(assert (= (and b!538060 res!333167) b!538072))

(assert (= (and b!538072 res!333162) b!538064))

(assert (= (and b!538064 res!333165) b!538067))

(assert (= (and b!538067 res!333160) b!538069))

(assert (= (and b!538069 res!333168) b!538062))

(assert (= (and b!538062 res!333169) b!538066))

(assert (= (and b!538066 res!333161) b!538071))

(assert (= (and b!538071 res!333163) b!538068))

(assert (= (and b!538068 res!333164) b!538070))

(assert (= (and b!538070 res!333171) b!538063))

(declare-fun m!517339 () Bool)

(assert (=> b!538067 m!517339))

(declare-fun m!517341 () Bool)

(assert (=> b!538071 m!517341))

(assert (=> b!538071 m!517341))

(declare-fun m!517343 () Bool)

(assert (=> b!538071 m!517343))

(assert (=> b!538071 m!517343))

(assert (=> b!538071 m!517341))

(declare-fun m!517345 () Bool)

(assert (=> b!538071 m!517345))

(assert (=> b!538065 m!517341))

(assert (=> b!538065 m!517341))

(declare-fun m!517347 () Bool)

(assert (=> b!538065 m!517347))

(declare-fun m!517349 () Bool)

(assert (=> b!538060 m!517349))

(assert (=> b!538063 m!517341))

(assert (=> b!538063 m!517341))

(declare-fun m!517351 () Bool)

(assert (=> b!538063 m!517351))

(assert (=> b!538066 m!517341))

(assert (=> b!538066 m!517341))

(declare-fun m!517353 () Bool)

(assert (=> b!538066 m!517353))

(declare-fun m!517355 () Bool)

(assert (=> b!538068 m!517355))

(assert (=> b!538068 m!517341))

(declare-fun m!517357 () Bool)

(assert (=> b!538062 m!517357))

(assert (=> b!538062 m!517341))

(declare-fun m!517359 () Bool)

(assert (=> b!538069 m!517359))

(declare-fun m!517361 () Bool)

(assert (=> start!48886 m!517361))

(declare-fun m!517363 () Bool)

(assert (=> start!48886 m!517363))

(declare-fun m!517365 () Bool)

(assert (=> b!538070 m!517365))

(declare-fun m!517367 () Bool)

(assert (=> b!538064 m!517367))

(declare-fun m!517369 () Bool)

(assert (=> b!538072 m!517369))

(check-sat (not b!538063) (not b!538072) (not b!538066) (not b!538060) (not b!538067) (not b!538071) (not b!538069) (not b!538070) (not b!538064) (not start!48886) (not b!538065))
(check-sat)
