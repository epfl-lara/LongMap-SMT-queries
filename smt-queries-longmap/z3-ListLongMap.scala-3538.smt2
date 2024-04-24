; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48844 () Bool)

(assert start!48844)

(declare-fun b!537241 () Bool)

(declare-fun res!332353 () Bool)

(declare-fun e!311775 () Bool)

(assert (=> b!537241 (=> (not res!332353) (not e!311775))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34004 0))(
  ( (array!34005 (arr!16339 (Array (_ BitVec 32) (_ BitVec 64))) (size!16703 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34004)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537241 (= res!332353 (and (= (size!16703 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16703 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16703 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537242 () Bool)

(declare-fun res!332349 () Bool)

(declare-fun e!311774 () Bool)

(assert (=> b!537242 (=> (not res!332349) (not e!311774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34004 (_ BitVec 32)) Bool)

(assert (=> b!537242 (= res!332349 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537243 () Bool)

(declare-fun res!332343 () Bool)

(assert (=> b!537243 (=> (not res!332343) (not e!311775))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537243 (= res!332343 (validKeyInArray!0 k0!1998))))

(declare-fun b!537245 () Bool)

(declare-fun res!332345 () Bool)

(assert (=> b!537245 (=> (not res!332345) (not e!311775))))

(declare-fun arrayContainsKey!0 (array!34004 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537245 (= res!332345 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537246 () Bool)

(declare-fun res!332352 () Bool)

(assert (=> b!537246 (=> (not res!332352) (not e!311774))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537246 (= res!332352 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16703 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16703 a!3154)) (= (select (arr!16339 a!3154) resIndex!32) (select (arr!16339 a!3154) j!147))))))

(declare-fun b!537247 () Bool)

(declare-fun res!332348 () Bool)

(assert (=> b!537247 (=> (not res!332348) (not e!311775))))

(assert (=> b!537247 (= res!332348 (validKeyInArray!0 (select (arr!16339 a!3154) j!147)))))

(declare-fun b!537248 () Bool)

(declare-fun res!332344 () Bool)

(declare-fun e!311777 () Bool)

(assert (=> b!537248 (=> (not res!332344) (not e!311777))))

(declare-datatypes ((SeekEntryResult!4753 0))(
  ( (MissingZero!4753 (index!21236 (_ BitVec 32))) (Found!4753 (index!21237 (_ BitVec 32))) (Intermediate!4753 (undefined!5565 Bool) (index!21238 (_ BitVec 32)) (x!50323 (_ BitVec 32))) (Undefined!4753) (MissingVacant!4753 (index!21239 (_ BitVec 32))) )
))
(declare-fun lt!246391 () SeekEntryResult!4753)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34004 (_ BitVec 32)) SeekEntryResult!4753)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537248 (= res!332344 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16339 a!3154) j!147) mask!3216) (select (arr!16339 a!3154) j!147) a!3154 mask!3216) lt!246391))))

(declare-fun b!537249 () Bool)

(declare-fun res!332342 () Bool)

(assert (=> b!537249 (=> (not res!332342) (not e!311774))))

(declare-datatypes ((List!10365 0))(
  ( (Nil!10362) (Cons!10361 (h!11307 (_ BitVec 64)) (t!16585 List!10365)) )
))
(declare-fun arrayNoDuplicates!0 (array!34004 (_ BitVec 32) List!10365) Bool)

(assert (=> b!537249 (= res!332342 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10362))))

(declare-fun b!537250 () Bool)

(declare-fun res!332351 () Bool)

(assert (=> b!537250 (=> (not res!332351) (not e!311777))))

(assert (=> b!537250 (= res!332351 (and (not (= (select (arr!16339 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16339 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16339 a!3154) index!1177) (select (arr!16339 a!3154) j!147)))))))

(declare-fun b!537251 () Bool)

(assert (=> b!537251 (= e!311775 e!311774)))

(declare-fun res!332347 () Bool)

(assert (=> b!537251 (=> (not res!332347) (not e!311774))))

(declare-fun lt!246389 () SeekEntryResult!4753)

(assert (=> b!537251 (= res!332347 (or (= lt!246389 (MissingZero!4753 i!1153)) (= lt!246389 (MissingVacant!4753 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34004 (_ BitVec 32)) SeekEntryResult!4753)

(assert (=> b!537251 (= lt!246389 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537244 () Bool)

(assert (=> b!537244 (= e!311774 e!311777)))

(declare-fun res!332350 () Bool)

(assert (=> b!537244 (=> (not res!332350) (not e!311777))))

(assert (=> b!537244 (= res!332350 (= lt!246391 (Intermediate!4753 false resIndex!32 resX!32)))))

(assert (=> b!537244 (= lt!246391 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16339 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!332341 () Bool)

(assert (=> start!48844 (=> (not res!332341) (not e!311775))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48844 (= res!332341 (validMask!0 mask!3216))))

(assert (=> start!48844 e!311775))

(assert (=> start!48844 true))

(declare-fun array_inv!12198 (array!34004) Bool)

(assert (=> start!48844 (array_inv!12198 a!3154)))

(declare-fun b!537252 () Bool)

(declare-fun e!311776 () Bool)

(assert (=> b!537252 (= e!311776 false)))

(declare-fun lt!246388 () (_ BitVec 32))

(declare-fun lt!246390 () SeekEntryResult!4753)

(assert (=> b!537252 (= lt!246390 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246388 (select (arr!16339 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537253 () Bool)

(assert (=> b!537253 (= e!311777 e!311776)))

(declare-fun res!332346 () Bool)

(assert (=> b!537253 (=> (not res!332346) (not e!311776))))

(assert (=> b!537253 (= res!332346 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246388 #b00000000000000000000000000000000) (bvslt lt!246388 (size!16703 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537253 (= lt!246388 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (= (and start!48844 res!332341) b!537241))

(assert (= (and b!537241 res!332353) b!537247))

(assert (= (and b!537247 res!332348) b!537243))

(assert (= (and b!537243 res!332343) b!537245))

(assert (= (and b!537245 res!332345) b!537251))

(assert (= (and b!537251 res!332347) b!537242))

(assert (= (and b!537242 res!332349) b!537249))

(assert (= (and b!537249 res!332342) b!537246))

(assert (= (and b!537246 res!332352) b!537244))

(assert (= (and b!537244 res!332350) b!537248))

(assert (= (and b!537248 res!332344) b!537250))

(assert (= (and b!537250 res!332351) b!537253))

(assert (= (and b!537253 res!332346) b!537252))

(declare-fun m!516667 () Bool)

(assert (=> b!537252 m!516667))

(assert (=> b!537252 m!516667))

(declare-fun m!516669 () Bool)

(assert (=> b!537252 m!516669))

(declare-fun m!516671 () Bool)

(assert (=> b!537251 m!516671))

(declare-fun m!516673 () Bool)

(assert (=> b!537249 m!516673))

(declare-fun m!516675 () Bool)

(assert (=> b!537245 m!516675))

(assert (=> b!537248 m!516667))

(assert (=> b!537248 m!516667))

(declare-fun m!516677 () Bool)

(assert (=> b!537248 m!516677))

(assert (=> b!537248 m!516677))

(assert (=> b!537248 m!516667))

(declare-fun m!516679 () Bool)

(assert (=> b!537248 m!516679))

(declare-fun m!516681 () Bool)

(assert (=> b!537243 m!516681))

(declare-fun m!516683 () Bool)

(assert (=> b!537246 m!516683))

(assert (=> b!537246 m!516667))

(declare-fun m!516685 () Bool)

(assert (=> b!537242 m!516685))

(declare-fun m!516687 () Bool)

(assert (=> b!537250 m!516687))

(assert (=> b!537250 m!516667))

(declare-fun m!516689 () Bool)

(assert (=> start!48844 m!516689))

(declare-fun m!516691 () Bool)

(assert (=> start!48844 m!516691))

(assert (=> b!537244 m!516667))

(assert (=> b!537244 m!516667))

(declare-fun m!516693 () Bool)

(assert (=> b!537244 m!516693))

(declare-fun m!516695 () Bool)

(assert (=> b!537253 m!516695))

(assert (=> b!537247 m!516667))

(assert (=> b!537247 m!516667))

(declare-fun m!516697 () Bool)

(assert (=> b!537247 m!516697))

(check-sat (not b!537252) (not b!537248) (not b!537245) (not b!537244) (not b!537253) (not b!537249) (not b!537243) (not b!537247) (not b!537251) (not b!537242) (not start!48844))
(check-sat)
