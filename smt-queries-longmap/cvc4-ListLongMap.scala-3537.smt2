; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48796 () Bool)

(assert start!48796)

(declare-fun b!537002 () Bool)

(declare-fun res!332212 () Bool)

(declare-fun e!311634 () Bool)

(assert (=> b!537002 (=> (not res!332212) (not e!311634))))

(declare-datatypes ((array!34008 0))(
  ( (array!34009 (arr!16343 (Array (_ BitVec 32) (_ BitVec 64))) (size!16707 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34008)

(declare-datatypes ((List!10462 0))(
  ( (Nil!10459) (Cons!10458 (h!11401 (_ BitVec 64)) (t!16690 List!10462)) )
))
(declare-fun arrayNoDuplicates!0 (array!34008 (_ BitVec 32) List!10462) Bool)

(assert (=> b!537002 (= res!332212 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10459))))

(declare-fun b!537003 () Bool)

(declare-fun res!332207 () Bool)

(declare-fun e!311633 () Bool)

(assert (=> b!537003 (=> (not res!332207) (not e!311633))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537003 (= res!332207 (and (= (size!16707 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16707 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16707 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537004 () Bool)

(declare-fun res!332210 () Bool)

(assert (=> b!537004 (=> (not res!332210) (not e!311634))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537004 (= res!332210 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16707 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16707 a!3154)) (= (select (arr!16343 a!3154) resIndex!32) (select (arr!16343 a!3154) j!147))))))

(declare-fun b!537005 () Bool)

(declare-fun res!332218 () Bool)

(assert (=> b!537005 (=> (not res!332218) (not e!311633))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34008 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537005 (= res!332218 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537006 () Bool)

(declare-fun res!332219 () Bool)

(declare-fun e!311630 () Bool)

(assert (=> b!537006 (=> (not res!332219) (not e!311630))))

(declare-datatypes ((SeekEntryResult!4801 0))(
  ( (MissingZero!4801 (index!21428 (_ BitVec 32))) (Found!4801 (index!21429 (_ BitVec 32))) (Intermediate!4801 (undefined!5613 Bool) (index!21430 (_ BitVec 32)) (x!50360 (_ BitVec 32))) (Undefined!4801) (MissingVacant!4801 (index!21431 (_ BitVec 32))) )
))
(declare-fun lt!246269 () SeekEntryResult!4801)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34008 (_ BitVec 32)) SeekEntryResult!4801)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537006 (= res!332219 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16343 a!3154) j!147) mask!3216) (select (arr!16343 a!3154) j!147) a!3154 mask!3216) lt!246269))))

(declare-fun res!332214 () Bool)

(assert (=> start!48796 (=> (not res!332214) (not e!311633))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48796 (= res!332214 (validMask!0 mask!3216))))

(assert (=> start!48796 e!311633))

(assert (=> start!48796 true))

(declare-fun array_inv!12139 (array!34008) Bool)

(assert (=> start!48796 (array_inv!12139 a!3154)))

(declare-fun b!537007 () Bool)

(declare-fun res!332213 () Bool)

(assert (=> b!537007 (=> (not res!332213) (not e!311630))))

(assert (=> b!537007 (= res!332213 (and (not (= (select (arr!16343 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16343 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16343 a!3154) index!1177) (select (arr!16343 a!3154) j!147)))))))

(declare-fun b!537008 () Bool)

(assert (=> b!537008 (= e!311633 e!311634)))

(declare-fun res!332217 () Bool)

(assert (=> b!537008 (=> (not res!332217) (not e!311634))))

(declare-fun lt!246268 () SeekEntryResult!4801)

(assert (=> b!537008 (= res!332217 (or (= lt!246268 (MissingZero!4801 i!1153)) (= lt!246268 (MissingVacant!4801 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34008 (_ BitVec 32)) SeekEntryResult!4801)

(assert (=> b!537008 (= lt!246268 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537009 () Bool)

(declare-fun e!311632 () Bool)

(assert (=> b!537009 (= e!311632 false)))

(declare-fun lt!246270 () SeekEntryResult!4801)

(declare-fun lt!246271 () (_ BitVec 32))

(assert (=> b!537009 (= lt!246270 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246271 (select (arr!16343 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537010 () Bool)

(declare-fun res!332208 () Bool)

(assert (=> b!537010 (=> (not res!332208) (not e!311634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34008 (_ BitVec 32)) Bool)

(assert (=> b!537010 (= res!332208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537011 () Bool)

(declare-fun res!332216 () Bool)

(assert (=> b!537011 (=> (not res!332216) (not e!311633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537011 (= res!332216 (validKeyInArray!0 k!1998))))

(declare-fun b!537012 () Bool)

(declare-fun res!332211 () Bool)

(assert (=> b!537012 (=> (not res!332211) (not e!311633))))

(assert (=> b!537012 (= res!332211 (validKeyInArray!0 (select (arr!16343 a!3154) j!147)))))

(declare-fun b!537013 () Bool)

(assert (=> b!537013 (= e!311630 e!311632)))

(declare-fun res!332215 () Bool)

(assert (=> b!537013 (=> (not res!332215) (not e!311632))))

(assert (=> b!537013 (= res!332215 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246271 #b00000000000000000000000000000000) (bvslt lt!246271 (size!16707 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537013 (= lt!246271 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537014 () Bool)

(assert (=> b!537014 (= e!311634 e!311630)))

(declare-fun res!332209 () Bool)

(assert (=> b!537014 (=> (not res!332209) (not e!311630))))

(assert (=> b!537014 (= res!332209 (= lt!246269 (Intermediate!4801 false resIndex!32 resX!32)))))

(assert (=> b!537014 (= lt!246269 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16343 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48796 res!332214) b!537003))

(assert (= (and b!537003 res!332207) b!537012))

(assert (= (and b!537012 res!332211) b!537011))

(assert (= (and b!537011 res!332216) b!537005))

(assert (= (and b!537005 res!332218) b!537008))

(assert (= (and b!537008 res!332217) b!537010))

(assert (= (and b!537010 res!332208) b!537002))

(assert (= (and b!537002 res!332212) b!537004))

(assert (= (and b!537004 res!332210) b!537014))

(assert (= (and b!537014 res!332209) b!537006))

(assert (= (and b!537006 res!332219) b!537007))

(assert (= (and b!537007 res!332213) b!537013))

(assert (= (and b!537013 res!332215) b!537009))

(declare-fun m!516313 () Bool)

(assert (=> b!537013 m!516313))

(declare-fun m!516315 () Bool)

(assert (=> b!537006 m!516315))

(assert (=> b!537006 m!516315))

(declare-fun m!516317 () Bool)

(assert (=> b!537006 m!516317))

(assert (=> b!537006 m!516317))

(assert (=> b!537006 m!516315))

(declare-fun m!516319 () Bool)

(assert (=> b!537006 m!516319))

(declare-fun m!516321 () Bool)

(assert (=> b!537011 m!516321))

(declare-fun m!516323 () Bool)

(assert (=> b!537007 m!516323))

(assert (=> b!537007 m!516315))

(declare-fun m!516325 () Bool)

(assert (=> b!537004 m!516325))

(assert (=> b!537004 m!516315))

(declare-fun m!516327 () Bool)

(assert (=> b!537002 m!516327))

(declare-fun m!516329 () Bool)

(assert (=> b!537010 m!516329))

(assert (=> b!537009 m!516315))

(assert (=> b!537009 m!516315))

(declare-fun m!516331 () Bool)

(assert (=> b!537009 m!516331))

(assert (=> b!537014 m!516315))

(assert (=> b!537014 m!516315))

(declare-fun m!516333 () Bool)

(assert (=> b!537014 m!516333))

(assert (=> b!537012 m!516315))

(assert (=> b!537012 m!516315))

(declare-fun m!516335 () Bool)

(assert (=> b!537012 m!516335))

(declare-fun m!516337 () Bool)

(assert (=> start!48796 m!516337))

(declare-fun m!516339 () Bool)

(assert (=> start!48796 m!516339))

(declare-fun m!516341 () Bool)

(assert (=> b!537008 m!516341))

(declare-fun m!516343 () Bool)

(assert (=> b!537005 m!516343))

(push 1)

(assert (not b!537005))

(assert (not b!537011))

(assert (not b!537008))

(assert (not b!537013))

(assert (not b!537012))

(assert (not b!537009))

