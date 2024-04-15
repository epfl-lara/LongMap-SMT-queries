; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49320 () Bool)

(assert start!49320)

(declare-fun b!543203 () Bool)

(declare-fun res!337903 () Bool)

(declare-fun e!314137 () Bool)

(assert (=> b!543203 (=> (not res!337903) (not e!314137))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34338 0))(
  ( (array!34339 (arr!16502 (Array (_ BitVec 32) (_ BitVec 64))) (size!16867 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34338)

(assert (=> b!543203 (= res!337903 (and (not (= (select (arr!16502 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16502 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16502 a!3154) index!1177) (select (arr!16502 a!3154) j!147)))))))

(declare-fun b!543204 () Bool)

(declare-fun e!314138 () Bool)

(assert (=> b!543204 (= e!314138 e!314137)))

(declare-fun res!337899 () Bool)

(assert (=> b!543204 (=> (not res!337899) (not e!314137))))

(declare-datatypes ((SeekEntryResult!4957 0))(
  ( (MissingZero!4957 (index!22052 (_ BitVec 32))) (Found!4957 (index!22053 (_ BitVec 32))) (Intermediate!4957 (undefined!5769 Bool) (index!22054 (_ BitVec 32)) (x!50967 (_ BitVec 32))) (Undefined!4957) (MissingVacant!4957 (index!22055 (_ BitVec 32))) )
))
(declare-fun lt!247948 () SeekEntryResult!4957)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543204 (= res!337899 (= lt!247948 (Intermediate!4957 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34338 (_ BitVec 32)) SeekEntryResult!4957)

(assert (=> b!543204 (= lt!247948 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16502 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543205 () Bool)

(declare-fun res!337897 () Bool)

(assert (=> b!543205 (=> (not res!337897) (not e!314137))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543205 (= res!337897 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16502 a!3154) j!147) mask!3216) (select (arr!16502 a!3154) j!147) a!3154 mask!3216) lt!247948))))

(declare-fun b!543206 () Bool)

(assert (=> b!543206 (= e!314137 false)))

(declare-fun lt!247946 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543206 (= lt!247946 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543208 () Bool)

(declare-fun res!337896 () Bool)

(declare-fun e!314136 () Bool)

(assert (=> b!543208 (=> (not res!337896) (not e!314136))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543208 (= res!337896 (and (= (size!16867 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16867 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16867 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543209 () Bool)

(declare-fun res!337898 () Bool)

(assert (=> b!543209 (=> (not res!337898) (not e!314136))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34338 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543209 (= res!337898 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543210 () Bool)

(declare-fun res!337907 () Bool)

(assert (=> b!543210 (=> (not res!337907) (not e!314136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543210 (= res!337907 (validKeyInArray!0 (select (arr!16502 a!3154) j!147)))))

(declare-fun b!543211 () Bool)

(assert (=> b!543211 (= e!314136 e!314138)))

(declare-fun res!337900 () Bool)

(assert (=> b!543211 (=> (not res!337900) (not e!314138))))

(declare-fun lt!247947 () SeekEntryResult!4957)

(assert (=> b!543211 (= res!337900 (or (= lt!247947 (MissingZero!4957 i!1153)) (= lt!247947 (MissingVacant!4957 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34338 (_ BitVec 32)) SeekEntryResult!4957)

(assert (=> b!543211 (= lt!247947 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543212 () Bool)

(declare-fun res!337904 () Bool)

(assert (=> b!543212 (=> (not res!337904) (not e!314138))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34338 (_ BitVec 32)) Bool)

(assert (=> b!543212 (= res!337904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543207 () Bool)

(declare-fun res!337901 () Bool)

(assert (=> b!543207 (=> (not res!337901) (not e!314138))))

(assert (=> b!543207 (= res!337901 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16867 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16867 a!3154)) (= (select (arr!16502 a!3154) resIndex!32) (select (arr!16502 a!3154) j!147))))))

(declare-fun res!337906 () Bool)

(assert (=> start!49320 (=> (not res!337906) (not e!314136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49320 (= res!337906 (validMask!0 mask!3216))))

(assert (=> start!49320 e!314136))

(assert (=> start!49320 true))

(declare-fun array_inv!12385 (array!34338) Bool)

(assert (=> start!49320 (array_inv!12385 a!3154)))

(declare-fun b!543213 () Bool)

(declare-fun res!337902 () Bool)

(assert (=> b!543213 (=> (not res!337902) (not e!314138))))

(declare-datatypes ((List!10660 0))(
  ( (Nil!10657) (Cons!10656 (h!11611 (_ BitVec 64)) (t!16879 List!10660)) )
))
(declare-fun arrayNoDuplicates!0 (array!34338 (_ BitVec 32) List!10660) Bool)

(assert (=> b!543213 (= res!337902 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10657))))

(declare-fun b!543214 () Bool)

(declare-fun res!337905 () Bool)

(assert (=> b!543214 (=> (not res!337905) (not e!314136))))

(assert (=> b!543214 (= res!337905 (validKeyInArray!0 k0!1998))))

(assert (= (and start!49320 res!337906) b!543208))

(assert (= (and b!543208 res!337896) b!543210))

(assert (= (and b!543210 res!337907) b!543214))

(assert (= (and b!543214 res!337905) b!543209))

(assert (= (and b!543209 res!337898) b!543211))

(assert (= (and b!543211 res!337900) b!543212))

(assert (= (and b!543212 res!337904) b!543213))

(assert (= (and b!543213 res!337902) b!543207))

(assert (= (and b!543207 res!337901) b!543204))

(assert (= (and b!543204 res!337899) b!543205))

(assert (= (and b!543205 res!337897) b!543203))

(assert (= (and b!543203 res!337903) b!543206))

(declare-fun m!520807 () Bool)

(assert (=> b!543214 m!520807))

(declare-fun m!520809 () Bool)

(assert (=> b!543212 m!520809))

(declare-fun m!520811 () Bool)

(assert (=> b!543204 m!520811))

(assert (=> b!543204 m!520811))

(declare-fun m!520813 () Bool)

(assert (=> b!543204 m!520813))

(declare-fun m!520815 () Bool)

(assert (=> start!49320 m!520815))

(declare-fun m!520817 () Bool)

(assert (=> start!49320 m!520817))

(declare-fun m!520819 () Bool)

(assert (=> b!543209 m!520819))

(declare-fun m!520821 () Bool)

(assert (=> b!543213 m!520821))

(declare-fun m!520823 () Bool)

(assert (=> b!543206 m!520823))

(declare-fun m!520825 () Bool)

(assert (=> b!543207 m!520825))

(assert (=> b!543207 m!520811))

(assert (=> b!543205 m!520811))

(assert (=> b!543205 m!520811))

(declare-fun m!520827 () Bool)

(assert (=> b!543205 m!520827))

(assert (=> b!543205 m!520827))

(assert (=> b!543205 m!520811))

(declare-fun m!520829 () Bool)

(assert (=> b!543205 m!520829))

(assert (=> b!543210 m!520811))

(assert (=> b!543210 m!520811))

(declare-fun m!520831 () Bool)

(assert (=> b!543210 m!520831))

(declare-fun m!520833 () Bool)

(assert (=> b!543203 m!520833))

(assert (=> b!543203 m!520811))

(declare-fun m!520835 () Bool)

(assert (=> b!543211 m!520835))

(check-sat (not b!543206) (not b!543212) (not b!543210) (not b!543211) (not b!543209) (not b!543213) (not start!49320) (not b!543205) (not b!543204) (not b!543214))
(check-sat)
