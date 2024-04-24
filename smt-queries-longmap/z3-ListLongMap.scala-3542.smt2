; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48868 () Bool)

(assert start!48868)

(declare-fun res!332818 () Bool)

(declare-fun e!311955 () Bool)

(assert (=> start!48868 (=> (not res!332818) (not e!311955))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48868 (= res!332818 (validMask!0 mask!3216))))

(assert (=> start!48868 e!311955))

(assert (=> start!48868 true))

(declare-datatypes ((array!34028 0))(
  ( (array!34029 (arr!16351 (Array (_ BitVec 32) (_ BitVec 64))) (size!16715 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34028)

(declare-fun array_inv!12210 (array!34028) Bool)

(assert (=> start!48868 (array_inv!12210 a!3154)))

(declare-fun b!537709 () Bool)

(declare-fun e!311958 () Bool)

(assert (=> b!537709 (= e!311958 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4765 0))(
  ( (MissingZero!4765 (index!21284 (_ BitVec 32))) (Found!4765 (index!21285 (_ BitVec 32))) (Intermediate!4765 (undefined!5577 Bool) (index!21286 (_ BitVec 32)) (x!50367 (_ BitVec 32))) (Undefined!4765) (MissingVacant!4765 (index!21287 (_ BitVec 32))) )
))
(declare-fun lt!246535 () SeekEntryResult!4765)

(declare-fun lt!246533 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34028 (_ BitVec 32)) SeekEntryResult!4765)

(assert (=> b!537709 (= lt!246535 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246533 (select (arr!16351 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537710 () Bool)

(declare-fun res!332809 () Bool)

(assert (=> b!537710 (=> (not res!332809) (not e!311955))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537710 (= res!332809 (validKeyInArray!0 k0!1998))))

(declare-fun b!537711 () Bool)

(declare-fun res!332812 () Bool)

(declare-fun e!311956 () Bool)

(assert (=> b!537711 (=> (not res!332812) (not e!311956))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537711 (= res!332812 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16715 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16715 a!3154)) (= (select (arr!16351 a!3154) resIndex!32) (select (arr!16351 a!3154) j!147))))))

(declare-fun b!537712 () Bool)

(declare-fun res!332820 () Bool)

(assert (=> b!537712 (=> (not res!332820) (not e!311955))))

(declare-fun arrayContainsKey!0 (array!34028 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537712 (= res!332820 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537713 () Bool)

(assert (=> b!537713 (= e!311955 e!311956)))

(declare-fun res!332821 () Bool)

(assert (=> b!537713 (=> (not res!332821) (not e!311956))))

(declare-fun lt!246532 () SeekEntryResult!4765)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537713 (= res!332821 (or (= lt!246532 (MissingZero!4765 i!1153)) (= lt!246532 (MissingVacant!4765 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34028 (_ BitVec 32)) SeekEntryResult!4765)

(assert (=> b!537713 (= lt!246532 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537714 () Bool)

(declare-fun res!332815 () Bool)

(declare-fun e!311954 () Bool)

(assert (=> b!537714 (=> (not res!332815) (not e!311954))))

(assert (=> b!537714 (= res!332815 (and (not (= (select (arr!16351 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16351 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16351 a!3154) index!1177) (select (arr!16351 a!3154) j!147)))))))

(declare-fun b!537715 () Bool)

(declare-fun res!332811 () Bool)

(assert (=> b!537715 (=> (not res!332811) (not e!311955))))

(assert (=> b!537715 (= res!332811 (validKeyInArray!0 (select (arr!16351 a!3154) j!147)))))

(declare-fun b!537716 () Bool)

(assert (=> b!537716 (= e!311954 e!311958)))

(declare-fun res!332817 () Bool)

(assert (=> b!537716 (=> (not res!332817) (not e!311958))))

(assert (=> b!537716 (= res!332817 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246533 #b00000000000000000000000000000000) (bvslt lt!246533 (size!16715 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537716 (= lt!246533 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!537717 () Bool)

(declare-fun res!332813 () Bool)

(assert (=> b!537717 (=> (not res!332813) (not e!311956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34028 (_ BitVec 32)) Bool)

(assert (=> b!537717 (= res!332813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537718 () Bool)

(declare-fun res!332816 () Bool)

(assert (=> b!537718 (=> (not res!332816) (not e!311954))))

(declare-fun lt!246534 () SeekEntryResult!4765)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537718 (= res!332816 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16351 a!3154) j!147) mask!3216) (select (arr!16351 a!3154) j!147) a!3154 mask!3216) lt!246534))))

(declare-fun b!537719 () Bool)

(declare-fun res!332819 () Bool)

(assert (=> b!537719 (=> (not res!332819) (not e!311956))))

(declare-datatypes ((List!10377 0))(
  ( (Nil!10374) (Cons!10373 (h!11319 (_ BitVec 64)) (t!16597 List!10377)) )
))
(declare-fun arrayNoDuplicates!0 (array!34028 (_ BitVec 32) List!10377) Bool)

(assert (=> b!537719 (= res!332819 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10374))))

(declare-fun b!537720 () Bool)

(declare-fun res!332814 () Bool)

(assert (=> b!537720 (=> (not res!332814) (not e!311955))))

(assert (=> b!537720 (= res!332814 (and (= (size!16715 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16715 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16715 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537721 () Bool)

(assert (=> b!537721 (= e!311956 e!311954)))

(declare-fun res!332810 () Bool)

(assert (=> b!537721 (=> (not res!332810) (not e!311954))))

(assert (=> b!537721 (= res!332810 (= lt!246534 (Intermediate!4765 false resIndex!32 resX!32)))))

(assert (=> b!537721 (= lt!246534 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16351 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!48868 res!332818) b!537720))

(assert (= (and b!537720 res!332814) b!537715))

(assert (= (and b!537715 res!332811) b!537710))

(assert (= (and b!537710 res!332809) b!537712))

(assert (= (and b!537712 res!332820) b!537713))

(assert (= (and b!537713 res!332821) b!537717))

(assert (= (and b!537717 res!332813) b!537719))

(assert (= (and b!537719 res!332819) b!537711))

(assert (= (and b!537711 res!332812) b!537721))

(assert (= (and b!537721 res!332810) b!537718))

(assert (= (and b!537718 res!332816) b!537714))

(assert (= (and b!537714 res!332815) b!537716))

(assert (= (and b!537716 res!332817) b!537709))

(declare-fun m!517051 () Bool)

(assert (=> b!537715 m!517051))

(assert (=> b!537715 m!517051))

(declare-fun m!517053 () Bool)

(assert (=> b!537715 m!517053))

(declare-fun m!517055 () Bool)

(assert (=> start!48868 m!517055))

(declare-fun m!517057 () Bool)

(assert (=> start!48868 m!517057))

(declare-fun m!517059 () Bool)

(assert (=> b!537716 m!517059))

(declare-fun m!517061 () Bool)

(assert (=> b!537711 m!517061))

(assert (=> b!537711 m!517051))

(declare-fun m!517063 () Bool)

(assert (=> b!537717 m!517063))

(assert (=> b!537721 m!517051))

(assert (=> b!537721 m!517051))

(declare-fun m!517065 () Bool)

(assert (=> b!537721 m!517065))

(declare-fun m!517067 () Bool)

(assert (=> b!537710 m!517067))

(declare-fun m!517069 () Bool)

(assert (=> b!537712 m!517069))

(assert (=> b!537718 m!517051))

(assert (=> b!537718 m!517051))

(declare-fun m!517071 () Bool)

(assert (=> b!537718 m!517071))

(assert (=> b!537718 m!517071))

(assert (=> b!537718 m!517051))

(declare-fun m!517073 () Bool)

(assert (=> b!537718 m!517073))

(declare-fun m!517075 () Bool)

(assert (=> b!537713 m!517075))

(assert (=> b!537709 m!517051))

(assert (=> b!537709 m!517051))

(declare-fun m!517077 () Bool)

(assert (=> b!537709 m!517077))

(declare-fun m!517079 () Bool)

(assert (=> b!537719 m!517079))

(declare-fun m!517081 () Bool)

(assert (=> b!537714 m!517081))

(assert (=> b!537714 m!517051))

(check-sat (not b!537718) (not b!537717) (not b!537713) (not b!537715) (not b!537709) (not b!537719) (not start!48868) (not b!537710) (not b!537712) (not b!537721) (not b!537716))
(check-sat)
