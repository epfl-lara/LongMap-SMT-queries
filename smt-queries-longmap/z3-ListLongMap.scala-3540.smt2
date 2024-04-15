; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48798 () Bool)

(assert start!48798)

(declare-fun b!537004 () Bool)

(declare-fun res!332357 () Bool)

(declare-fun e!311561 () Bool)

(assert (=> b!537004 (=> (not res!332357) (not e!311561))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34020 0))(
  ( (array!34021 (arr!16349 (Array (_ BitVec 32) (_ BitVec 64))) (size!16714 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34020)

(assert (=> b!537004 (= res!332357 (and (not (= (select (arr!16349 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16349 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16349 a!3154) index!1177) (select (arr!16349 a!3154) j!147)))))))

(declare-fun res!332354 () Bool)

(declare-fun e!311563 () Bool)

(assert (=> start!48798 (=> (not res!332354) (not e!311563))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48798 (= res!332354 (validMask!0 mask!3216))))

(assert (=> start!48798 e!311563))

(assert (=> start!48798 true))

(declare-fun array_inv!12232 (array!34020) Bool)

(assert (=> start!48798 (array_inv!12232 a!3154)))

(declare-fun b!537005 () Bool)

(declare-fun e!311564 () Bool)

(assert (=> b!537005 (= e!311564 false)))

(declare-fun lt!246118 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4804 0))(
  ( (MissingZero!4804 (index!21440 (_ BitVec 32))) (Found!4804 (index!21441 (_ BitVec 32))) (Intermediate!4804 (undefined!5616 Bool) (index!21442 (_ BitVec 32)) (x!50382 (_ BitVec 32))) (Undefined!4804) (MissingVacant!4804 (index!21443 (_ BitVec 32))) )
))
(declare-fun lt!246121 () SeekEntryResult!4804)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34020 (_ BitVec 32)) SeekEntryResult!4804)

(assert (=> b!537005 (= lt!246121 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246118 (select (arr!16349 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537006 () Bool)

(declare-fun res!332358 () Bool)

(declare-fun e!311562 () Bool)

(assert (=> b!537006 (=> (not res!332358) (not e!311562))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537006 (= res!332358 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16714 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16714 a!3154)) (= (select (arr!16349 a!3154) resIndex!32) (select (arr!16349 a!3154) j!147))))))

(declare-fun b!537007 () Bool)

(declare-fun res!332351 () Bool)

(assert (=> b!537007 (=> (not res!332351) (not e!311562))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34020 (_ BitVec 32)) Bool)

(assert (=> b!537007 (= res!332351 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537008 () Bool)

(assert (=> b!537008 (= e!311561 e!311564)))

(declare-fun res!332361 () Bool)

(assert (=> b!537008 (=> (not res!332361) (not e!311564))))

(assert (=> b!537008 (= res!332361 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246118 #b00000000000000000000000000000000) (bvslt lt!246118 (size!16714 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537008 (= lt!246118 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537009 () Bool)

(assert (=> b!537009 (= e!311563 e!311562)))

(declare-fun res!332353 () Bool)

(assert (=> b!537009 (=> (not res!332353) (not e!311562))))

(declare-fun lt!246119 () SeekEntryResult!4804)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537009 (= res!332353 (or (= lt!246119 (MissingZero!4804 i!1153)) (= lt!246119 (MissingVacant!4804 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34020 (_ BitVec 32)) SeekEntryResult!4804)

(assert (=> b!537009 (= lt!246119 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537010 () Bool)

(declare-fun res!332352 () Bool)

(assert (=> b!537010 (=> (not res!332352) (not e!311563))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537010 (= res!332352 (validKeyInArray!0 k0!1998))))

(declare-fun b!537011 () Bool)

(declare-fun res!332362 () Bool)

(assert (=> b!537011 (=> (not res!332362) (not e!311561))))

(declare-fun lt!246120 () SeekEntryResult!4804)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537011 (= res!332362 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16349 a!3154) j!147) mask!3216) (select (arr!16349 a!3154) j!147) a!3154 mask!3216) lt!246120))))

(declare-fun b!537012 () Bool)

(declare-fun res!332359 () Bool)

(assert (=> b!537012 (=> (not res!332359) (not e!311562))))

(declare-datatypes ((List!10507 0))(
  ( (Nil!10504) (Cons!10503 (h!11446 (_ BitVec 64)) (t!16726 List!10507)) )
))
(declare-fun arrayNoDuplicates!0 (array!34020 (_ BitVec 32) List!10507) Bool)

(assert (=> b!537012 (= res!332359 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10504))))

(declare-fun b!537013 () Bool)

(assert (=> b!537013 (= e!311562 e!311561)))

(declare-fun res!332356 () Bool)

(assert (=> b!537013 (=> (not res!332356) (not e!311561))))

(assert (=> b!537013 (= res!332356 (= lt!246120 (Intermediate!4804 false resIndex!32 resX!32)))))

(assert (=> b!537013 (= lt!246120 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16349 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537014 () Bool)

(declare-fun res!332355 () Bool)

(assert (=> b!537014 (=> (not res!332355) (not e!311563))))

(declare-fun arrayContainsKey!0 (array!34020 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537014 (= res!332355 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537015 () Bool)

(declare-fun res!332363 () Bool)

(assert (=> b!537015 (=> (not res!332363) (not e!311563))))

(assert (=> b!537015 (= res!332363 (validKeyInArray!0 (select (arr!16349 a!3154) j!147)))))

(declare-fun b!537016 () Bool)

(declare-fun res!332360 () Bool)

(assert (=> b!537016 (=> (not res!332360) (not e!311563))))

(assert (=> b!537016 (= res!332360 (and (= (size!16714 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16714 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16714 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48798 res!332354) b!537016))

(assert (= (and b!537016 res!332360) b!537015))

(assert (= (and b!537015 res!332363) b!537010))

(assert (= (and b!537010 res!332352) b!537014))

(assert (= (and b!537014 res!332355) b!537009))

(assert (= (and b!537009 res!332353) b!537007))

(assert (= (and b!537007 res!332351) b!537012))

(assert (= (and b!537012 res!332359) b!537006))

(assert (= (and b!537006 res!332358) b!537013))

(assert (= (and b!537013 res!332356) b!537011))

(assert (= (and b!537011 res!332362) b!537004))

(assert (= (and b!537004 res!332357) b!537008))

(assert (= (and b!537008 res!332361) b!537005))

(declare-fun m!515785 () Bool)

(assert (=> b!537011 m!515785))

(assert (=> b!537011 m!515785))

(declare-fun m!515787 () Bool)

(assert (=> b!537011 m!515787))

(assert (=> b!537011 m!515787))

(assert (=> b!537011 m!515785))

(declare-fun m!515789 () Bool)

(assert (=> b!537011 m!515789))

(declare-fun m!515791 () Bool)

(assert (=> b!537009 m!515791))

(assert (=> b!537015 m!515785))

(assert (=> b!537015 m!515785))

(declare-fun m!515793 () Bool)

(assert (=> b!537015 m!515793))

(declare-fun m!515795 () Bool)

(assert (=> b!537014 m!515795))

(assert (=> b!537005 m!515785))

(assert (=> b!537005 m!515785))

(declare-fun m!515797 () Bool)

(assert (=> b!537005 m!515797))

(declare-fun m!515799 () Bool)

(assert (=> start!48798 m!515799))

(declare-fun m!515801 () Bool)

(assert (=> start!48798 m!515801))

(declare-fun m!515803 () Bool)

(assert (=> b!537010 m!515803))

(assert (=> b!537013 m!515785))

(assert (=> b!537013 m!515785))

(declare-fun m!515805 () Bool)

(assert (=> b!537013 m!515805))

(declare-fun m!515807 () Bool)

(assert (=> b!537012 m!515807))

(declare-fun m!515809 () Bool)

(assert (=> b!537007 m!515809))

(declare-fun m!515811 () Bool)

(assert (=> b!537004 m!515811))

(assert (=> b!537004 m!515785))

(declare-fun m!515813 () Bool)

(assert (=> b!537006 m!515813))

(assert (=> b!537006 m!515785))

(declare-fun m!515815 () Bool)

(assert (=> b!537008 m!515815))

(check-sat (not b!537013) (not b!537012) (not b!537015) (not b!537005) (not b!537011) (not b!537014) (not start!48798) (not b!537008) (not b!537009) (not b!537010) (not b!537007))
(check-sat)
