; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48836 () Bool)

(assert start!48836)

(declare-fun b!537782 () Bool)

(declare-fun res!332998 () Bool)

(declare-fun e!311930 () Bool)

(assert (=> b!537782 (=> (not res!332998) (not e!311930))))

(declare-datatypes ((array!34048 0))(
  ( (array!34049 (arr!16363 (Array (_ BitVec 32) (_ BitVec 64))) (size!16727 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34048)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34048 (_ BitVec 32)) Bool)

(assert (=> b!537782 (= res!332998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537783 () Bool)

(declare-fun e!311931 () Bool)

(declare-fun e!311934 () Bool)

(assert (=> b!537783 (= e!311931 e!311934)))

(declare-fun res!332987 () Bool)

(assert (=> b!537783 (=> (not res!332987) (not e!311934))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246510 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537783 (= res!332987 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246510 #b00000000000000000000000000000000) (bvslt lt!246510 (size!16727 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537783 (= lt!246510 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537784 () Bool)

(declare-fun res!332990 () Bool)

(declare-fun e!311932 () Bool)

(assert (=> b!537784 (=> (not res!332990) (not e!311932))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537784 (= res!332990 (validKeyInArray!0 k0!1998))))

(declare-fun b!537785 () Bool)

(declare-fun res!332999 () Bool)

(assert (=> b!537785 (=> (not res!332999) (not e!311931))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!537785 (= res!332999 (and (not (= (select (arr!16363 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16363 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16363 a!3154) index!1177) (select (arr!16363 a!3154) j!147)))))))

(declare-fun b!537786 () Bool)

(declare-fun res!332991 () Bool)

(assert (=> b!537786 (=> (not res!332991) (not e!311932))))

(declare-fun arrayContainsKey!0 (array!34048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537786 (= res!332991 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537787 () Bool)

(assert (=> b!537787 (= e!311930 e!311931)))

(declare-fun res!332989 () Bool)

(assert (=> b!537787 (=> (not res!332989) (not e!311931))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4821 0))(
  ( (MissingZero!4821 (index!21508 (_ BitVec 32))) (Found!4821 (index!21509 (_ BitVec 32))) (Intermediate!4821 (undefined!5633 Bool) (index!21510 (_ BitVec 32)) (x!50436 (_ BitVec 32))) (Undefined!4821) (MissingVacant!4821 (index!21511 (_ BitVec 32))) )
))
(declare-fun lt!246509 () SeekEntryResult!4821)

(assert (=> b!537787 (= res!332989 (= lt!246509 (Intermediate!4821 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34048 (_ BitVec 32)) SeekEntryResult!4821)

(assert (=> b!537787 (= lt!246509 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16363 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537788 () Bool)

(declare-fun res!332988 () Bool)

(assert (=> b!537788 (=> (not res!332988) (not e!311931))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537788 (= res!332988 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16363 a!3154) j!147) mask!3216) (select (arr!16363 a!3154) j!147) a!3154 mask!3216) lt!246509))))

(declare-fun b!537789 () Bool)

(declare-fun res!332995 () Bool)

(assert (=> b!537789 (=> (not res!332995) (not e!311930))))

(assert (=> b!537789 (= res!332995 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16727 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16727 a!3154)) (= (select (arr!16363 a!3154) resIndex!32) (select (arr!16363 a!3154) j!147))))))

(declare-fun res!332993 () Bool)

(assert (=> start!48836 (=> (not res!332993) (not e!311932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48836 (= res!332993 (validMask!0 mask!3216))))

(assert (=> start!48836 e!311932))

(assert (=> start!48836 true))

(declare-fun array_inv!12159 (array!34048) Bool)

(assert (=> start!48836 (array_inv!12159 a!3154)))

(declare-fun b!537790 () Bool)

(declare-fun res!332997 () Bool)

(assert (=> b!537790 (=> (not res!332997) (not e!311932))))

(assert (=> b!537790 (= res!332997 (validKeyInArray!0 (select (arr!16363 a!3154) j!147)))))

(declare-fun b!537791 () Bool)

(declare-fun res!332996 () Bool)

(assert (=> b!537791 (=> (not res!332996) (not e!311930))))

(declare-datatypes ((List!10482 0))(
  ( (Nil!10479) (Cons!10478 (h!11421 (_ BitVec 64)) (t!16710 List!10482)) )
))
(declare-fun arrayNoDuplicates!0 (array!34048 (_ BitVec 32) List!10482) Bool)

(assert (=> b!537791 (= res!332996 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10479))))

(declare-fun b!537792 () Bool)

(assert (=> b!537792 (= e!311932 e!311930)))

(declare-fun res!332992 () Bool)

(assert (=> b!537792 (=> (not res!332992) (not e!311930))))

(declare-fun lt!246511 () SeekEntryResult!4821)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537792 (= res!332992 (or (= lt!246511 (MissingZero!4821 i!1153)) (= lt!246511 (MissingVacant!4821 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34048 (_ BitVec 32)) SeekEntryResult!4821)

(assert (=> b!537792 (= lt!246511 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537793 () Bool)

(assert (=> b!537793 (= e!311934 false)))

(declare-fun lt!246508 () SeekEntryResult!4821)

(assert (=> b!537793 (= lt!246508 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246510 (select (arr!16363 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537794 () Bool)

(declare-fun res!332994 () Bool)

(assert (=> b!537794 (=> (not res!332994) (not e!311932))))

(assert (=> b!537794 (= res!332994 (and (= (size!16727 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16727 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16727 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48836 res!332993) b!537794))

(assert (= (and b!537794 res!332994) b!537790))

(assert (= (and b!537790 res!332997) b!537784))

(assert (= (and b!537784 res!332990) b!537786))

(assert (= (and b!537786 res!332991) b!537792))

(assert (= (and b!537792 res!332992) b!537782))

(assert (= (and b!537782 res!332998) b!537791))

(assert (= (and b!537791 res!332996) b!537789))

(assert (= (and b!537789 res!332995) b!537787))

(assert (= (and b!537787 res!332989) b!537788))

(assert (= (and b!537788 res!332988) b!537785))

(assert (= (and b!537785 res!332999) b!537783))

(assert (= (and b!537783 res!332987) b!537793))

(declare-fun m!516953 () Bool)

(assert (=> b!537793 m!516953))

(assert (=> b!537793 m!516953))

(declare-fun m!516955 () Bool)

(assert (=> b!537793 m!516955))

(declare-fun m!516957 () Bool)

(assert (=> start!48836 m!516957))

(declare-fun m!516959 () Bool)

(assert (=> start!48836 m!516959))

(declare-fun m!516961 () Bool)

(assert (=> b!537785 m!516961))

(assert (=> b!537785 m!516953))

(declare-fun m!516963 () Bool)

(assert (=> b!537791 m!516963))

(declare-fun m!516965 () Bool)

(assert (=> b!537789 m!516965))

(assert (=> b!537789 m!516953))

(assert (=> b!537787 m!516953))

(assert (=> b!537787 m!516953))

(declare-fun m!516967 () Bool)

(assert (=> b!537787 m!516967))

(declare-fun m!516969 () Bool)

(assert (=> b!537792 m!516969))

(declare-fun m!516971 () Bool)

(assert (=> b!537783 m!516971))

(declare-fun m!516973 () Bool)

(assert (=> b!537784 m!516973))

(declare-fun m!516975 () Bool)

(assert (=> b!537782 m!516975))

(declare-fun m!516977 () Bool)

(assert (=> b!537786 m!516977))

(assert (=> b!537790 m!516953))

(assert (=> b!537790 m!516953))

(declare-fun m!516979 () Bool)

(assert (=> b!537790 m!516979))

(assert (=> b!537788 m!516953))

(assert (=> b!537788 m!516953))

(declare-fun m!516981 () Bool)

(assert (=> b!537788 m!516981))

(assert (=> b!537788 m!516981))

(assert (=> b!537788 m!516953))

(declare-fun m!516983 () Bool)

(assert (=> b!537788 m!516983))

(check-sat (not b!537783) (not b!537787) (not b!537791) (not b!537792) (not b!537790) (not b!537784) (not b!537793) (not b!537786) (not start!48836) (not b!537788) (not b!537782))
(check-sat)
