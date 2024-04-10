; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48788 () Bool)

(assert start!48788)

(declare-fun res!332051 () Bool)

(declare-fun e!311571 () Bool)

(assert (=> start!48788 (=> (not res!332051) (not e!311571))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48788 (= res!332051 (validMask!0 mask!3216))))

(assert (=> start!48788 e!311571))

(assert (=> start!48788 true))

(declare-datatypes ((array!34000 0))(
  ( (array!34001 (arr!16339 (Array (_ BitVec 32) (_ BitVec 64))) (size!16703 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34000)

(declare-fun array_inv!12135 (array!34000) Bool)

(assert (=> start!48788 (array_inv!12135 a!3154)))

(declare-fun b!536846 () Bool)

(declare-fun e!311570 () Bool)

(declare-fun e!311573 () Bool)

(assert (=> b!536846 (= e!311570 e!311573)))

(declare-fun res!332053 () Bool)

(assert (=> b!536846 (=> (not res!332053) (not e!311573))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4797 0))(
  ( (MissingZero!4797 (index!21412 (_ BitVec 32))) (Found!4797 (index!21413 (_ BitVec 32))) (Intermediate!4797 (undefined!5609 Bool) (index!21414 (_ BitVec 32)) (x!50348 (_ BitVec 32))) (Undefined!4797) (MissingVacant!4797 (index!21415 (_ BitVec 32))) )
))
(declare-fun lt!246220 () SeekEntryResult!4797)

(assert (=> b!536846 (= res!332053 (= lt!246220 (Intermediate!4797 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34000 (_ BitVec 32)) SeekEntryResult!4797)

(assert (=> b!536846 (= lt!246220 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16339 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536847 () Bool)

(declare-fun res!332063 () Bool)

(assert (=> b!536847 (=> (not res!332063) (not e!311571))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536847 (= res!332063 (validKeyInArray!0 k0!1998))))

(declare-fun b!536848 () Bool)

(declare-fun res!332059 () Bool)

(assert (=> b!536848 (=> (not res!332059) (not e!311573))))

(assert (=> b!536848 (= res!332059 (and (not (= (select (arr!16339 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16339 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16339 a!3154) index!1177) (select (arr!16339 a!3154) j!147)))))))

(declare-fun b!536849 () Bool)

(declare-fun res!332056 () Bool)

(assert (=> b!536849 (=> (not res!332056) (not e!311570))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34000 (_ BitVec 32)) Bool)

(assert (=> b!536849 (= res!332056 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536850 () Bool)

(declare-fun res!332061 () Bool)

(assert (=> b!536850 (=> (not res!332061) (not e!311571))))

(declare-fun arrayContainsKey!0 (array!34000 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536850 (= res!332061 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536851 () Bool)

(declare-fun res!332054 () Bool)

(assert (=> b!536851 (=> (not res!332054) (not e!311570))))

(declare-datatypes ((List!10458 0))(
  ( (Nil!10455) (Cons!10454 (h!11397 (_ BitVec 64)) (t!16686 List!10458)) )
))
(declare-fun arrayNoDuplicates!0 (array!34000 (_ BitVec 32) List!10458) Bool)

(assert (=> b!536851 (= res!332054 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10455))))

(declare-fun b!536852 () Bool)

(declare-fun e!311572 () Bool)

(assert (=> b!536852 (= e!311573 e!311572)))

(declare-fun res!332058 () Bool)

(assert (=> b!536852 (=> (not res!332058) (not e!311572))))

(declare-fun lt!246221 () (_ BitVec 32))

(assert (=> b!536852 (= res!332058 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246221 #b00000000000000000000000000000000) (bvslt lt!246221 (size!16703 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536852 (= lt!246221 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536853 () Bool)

(assert (=> b!536853 (= e!311571 e!311570)))

(declare-fun res!332060 () Bool)

(assert (=> b!536853 (=> (not res!332060) (not e!311570))))

(declare-fun lt!246222 () SeekEntryResult!4797)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536853 (= res!332060 (or (= lt!246222 (MissingZero!4797 i!1153)) (= lt!246222 (MissingVacant!4797 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34000 (_ BitVec 32)) SeekEntryResult!4797)

(assert (=> b!536853 (= lt!246222 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536854 () Bool)

(declare-fun res!332052 () Bool)

(assert (=> b!536854 (=> (not res!332052) (not e!311571))))

(assert (=> b!536854 (= res!332052 (and (= (size!16703 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16703 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16703 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536855 () Bool)

(declare-fun res!332057 () Bool)

(assert (=> b!536855 (=> (not res!332057) (not e!311571))))

(assert (=> b!536855 (= res!332057 (validKeyInArray!0 (select (arr!16339 a!3154) j!147)))))

(declare-fun b!536856 () Bool)

(assert (=> b!536856 (= e!311572 false)))

(declare-fun lt!246223 () SeekEntryResult!4797)

(assert (=> b!536856 (= lt!246223 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246221 (select (arr!16339 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536857 () Bool)

(declare-fun res!332055 () Bool)

(assert (=> b!536857 (=> (not res!332055) (not e!311573))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536857 (= res!332055 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16339 a!3154) j!147) mask!3216) (select (arr!16339 a!3154) j!147) a!3154 mask!3216) lt!246220))))

(declare-fun b!536858 () Bool)

(declare-fun res!332062 () Bool)

(assert (=> b!536858 (=> (not res!332062) (not e!311570))))

(assert (=> b!536858 (= res!332062 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16703 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16703 a!3154)) (= (select (arr!16339 a!3154) resIndex!32) (select (arr!16339 a!3154) j!147))))))

(assert (= (and start!48788 res!332051) b!536854))

(assert (= (and b!536854 res!332052) b!536855))

(assert (= (and b!536855 res!332057) b!536847))

(assert (= (and b!536847 res!332063) b!536850))

(assert (= (and b!536850 res!332061) b!536853))

(assert (= (and b!536853 res!332060) b!536849))

(assert (= (and b!536849 res!332056) b!536851))

(assert (= (and b!536851 res!332054) b!536858))

(assert (= (and b!536858 res!332062) b!536846))

(assert (= (and b!536846 res!332053) b!536857))

(assert (= (and b!536857 res!332055) b!536848))

(assert (= (and b!536848 res!332059) b!536852))

(assert (= (and b!536852 res!332058) b!536856))

(declare-fun m!516185 () Bool)

(assert (=> start!48788 m!516185))

(declare-fun m!516187 () Bool)

(assert (=> start!48788 m!516187))

(declare-fun m!516189 () Bool)

(assert (=> b!536849 m!516189))

(declare-fun m!516191 () Bool)

(assert (=> b!536856 m!516191))

(assert (=> b!536856 m!516191))

(declare-fun m!516193 () Bool)

(assert (=> b!536856 m!516193))

(declare-fun m!516195 () Bool)

(assert (=> b!536847 m!516195))

(declare-fun m!516197 () Bool)

(assert (=> b!536858 m!516197))

(assert (=> b!536858 m!516191))

(declare-fun m!516199 () Bool)

(assert (=> b!536848 m!516199))

(assert (=> b!536848 m!516191))

(declare-fun m!516201 () Bool)

(assert (=> b!536850 m!516201))

(declare-fun m!516203 () Bool)

(assert (=> b!536851 m!516203))

(assert (=> b!536857 m!516191))

(assert (=> b!536857 m!516191))

(declare-fun m!516205 () Bool)

(assert (=> b!536857 m!516205))

(assert (=> b!536857 m!516205))

(assert (=> b!536857 m!516191))

(declare-fun m!516207 () Bool)

(assert (=> b!536857 m!516207))

(declare-fun m!516209 () Bool)

(assert (=> b!536853 m!516209))

(declare-fun m!516211 () Bool)

(assert (=> b!536852 m!516211))

(assert (=> b!536846 m!516191))

(assert (=> b!536846 m!516191))

(declare-fun m!516213 () Bool)

(assert (=> b!536846 m!516213))

(assert (=> b!536855 m!516191))

(assert (=> b!536855 m!516191))

(declare-fun m!516215 () Bool)

(assert (=> b!536855 m!516215))

(check-sat (not b!536846) (not b!536851) (not b!536855) (not b!536847) (not b!536849) (not b!536850) (not b!536856) (not b!536852) (not b!536853) (not b!536857) (not start!48788))
(check-sat)
