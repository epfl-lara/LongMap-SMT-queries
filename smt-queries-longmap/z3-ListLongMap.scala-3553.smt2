; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48890 () Bool)

(assert start!48890)

(declare-fun b!538840 () Bool)

(declare-fun e!312445 () Bool)

(declare-fun e!312441 () Bool)

(assert (=> b!538840 (= e!312445 e!312441)))

(declare-fun res!334047 () Bool)

(assert (=> b!538840 (=> (not res!334047) (not e!312441))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34102 0))(
  ( (array!34103 (arr!16390 (Array (_ BitVec 32) (_ BitVec 64))) (size!16754 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34102)

(declare-datatypes ((SeekEntryResult!4848 0))(
  ( (MissingZero!4848 (index!21616 (_ BitVec 32))) (Found!4848 (index!21617 (_ BitVec 32))) (Intermediate!4848 (undefined!5660 Bool) (index!21618 (_ BitVec 32)) (x!50535 (_ BitVec 32))) (Undefined!4848) (MissingVacant!4848 (index!21619 (_ BitVec 32))) )
))
(declare-fun lt!246986 () SeekEntryResult!4848)

(declare-fun lt!246983 () SeekEntryResult!4848)

(assert (=> b!538840 (= res!334047 (and (= lt!246983 lt!246986) (not (= (select (arr!16390 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16390 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16390 a!3154) index!1177) (select (arr!16390 a!3154) j!147)))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34102 (_ BitVec 32)) SeekEntryResult!4848)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538840 (= lt!246983 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16390 a!3154) j!147) mask!3216) (select (arr!16390 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538841 () Bool)

(declare-fun res!334056 () Bool)

(declare-fun e!312444 () Bool)

(assert (=> b!538841 (=> (not res!334056) (not e!312444))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538841 (= res!334056 (validKeyInArray!0 k0!1998))))

(declare-fun b!538842 () Bool)

(declare-fun e!312447 () Bool)

(assert (=> b!538842 (= e!312444 e!312447)))

(declare-fun res!334054 () Bool)

(assert (=> b!538842 (=> (not res!334054) (not e!312447))))

(declare-fun lt!246985 () SeekEntryResult!4848)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538842 (= res!334054 (or (= lt!246985 (MissingZero!4848 i!1153)) (= lt!246985 (MissingVacant!4848 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34102 (_ BitVec 32)) SeekEntryResult!4848)

(assert (=> b!538842 (= lt!246985 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!538843 () Bool)

(declare-fun e!312446 () Bool)

(assert (=> b!538843 (= e!312441 e!312446)))

(declare-fun res!334055 () Bool)

(assert (=> b!538843 (=> (not res!334055) (not e!312446))))

(declare-fun lt!246988 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!538843 (= res!334055 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246988 #b00000000000000000000000000000000) (bvslt lt!246988 (size!16754 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!538843 (= lt!246988 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!538844 () Bool)

(assert (=> b!538844 (= e!312447 e!312445)))

(declare-fun res!334046 () Bool)

(assert (=> b!538844 (=> (not res!334046) (not e!312445))))

(declare-fun lt!246987 () SeekEntryResult!4848)

(assert (=> b!538844 (= res!334046 (= lt!246986 lt!246987))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!538844 (= lt!246987 (Intermediate!4848 false resIndex!32 resX!32))))

(assert (=> b!538844 (= lt!246986 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16390 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538845 () Bool)

(declare-fun e!312443 () Bool)

(assert (=> b!538845 (= e!312446 e!312443)))

(declare-fun res!334053 () Bool)

(assert (=> b!538845 (=> (not res!334053) (not e!312443))))

(declare-fun lt!246984 () SeekEntryResult!4848)

(assert (=> b!538845 (= res!334053 (and (= lt!246984 lt!246987) (= lt!246983 lt!246984)))))

(assert (=> b!538845 (= lt!246984 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246988 (select (arr!16390 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!538846 () Bool)

(declare-fun res!334057 () Bool)

(assert (=> b!538846 (=> (not res!334057) (not e!312447))))

(assert (=> b!538846 (= res!334057 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16754 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16754 a!3154)) (= (select (arr!16390 a!3154) resIndex!32) (select (arr!16390 a!3154) j!147))))))

(declare-fun e!312442 () Bool)

(declare-fun b!538847 () Bool)

(assert (=> b!538847 (= e!312442 (validKeyInArray!0 (select (store (arr!16390 a!3154) i!1153 k0!1998) j!147)))))

(declare-fun b!538848 () Bool)

(assert (=> b!538848 (= e!312443 (not e!312442))))

(declare-fun res!334058 () Bool)

(assert (=> b!538848 (=> res!334058 e!312442)))

(assert (=> b!538848 (= res!334058 (or (bvslt mask!3216 #b00000000000000000000000000000000) (bvsge index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(assert (=> b!538848 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246988 (select (store (arr!16390 a!3154) i!1153 k0!1998) j!147) (array!34103 (store (arr!16390 a!3154) i!1153 k0!1998) (size!16754 a!3154)) mask!3216) lt!246987)))

(declare-datatypes ((Unit!16880 0))(
  ( (Unit!16881) )
))
(declare-fun lt!246982 () Unit!16880)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34102 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16880)

(assert (=> b!538848 (= lt!246982 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!246988 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!538849 () Bool)

(declare-fun res!334049 () Bool)

(assert (=> b!538849 (=> (not res!334049) (not e!312444))))

(assert (=> b!538849 (= res!334049 (and (= (size!16754 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16754 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16754 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!334045 () Bool)

(assert (=> start!48890 (=> (not res!334045) (not e!312444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48890 (= res!334045 (validMask!0 mask!3216))))

(assert (=> start!48890 e!312444))

(assert (=> start!48890 true))

(declare-fun array_inv!12186 (array!34102) Bool)

(assert (=> start!48890 (array_inv!12186 a!3154)))

(declare-fun b!538850 () Bool)

(declare-fun res!334051 () Bool)

(assert (=> b!538850 (=> (not res!334051) (not e!312444))))

(declare-fun arrayContainsKey!0 (array!34102 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538850 (= res!334051 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538851 () Bool)

(declare-fun res!334050 () Bool)

(assert (=> b!538851 (=> (not res!334050) (not e!312444))))

(assert (=> b!538851 (= res!334050 (validKeyInArray!0 (select (arr!16390 a!3154) j!147)))))

(declare-fun b!538852 () Bool)

(declare-fun res!334052 () Bool)

(assert (=> b!538852 (=> (not res!334052) (not e!312447))))

(declare-datatypes ((List!10509 0))(
  ( (Nil!10506) (Cons!10505 (h!11448 (_ BitVec 64)) (t!16737 List!10509)) )
))
(declare-fun arrayNoDuplicates!0 (array!34102 (_ BitVec 32) List!10509) Bool)

(assert (=> b!538852 (= res!334052 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10506))))

(declare-fun b!538853 () Bool)

(declare-fun res!334048 () Bool)

(assert (=> b!538853 (=> (not res!334048) (not e!312447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34102 (_ BitVec 32)) Bool)

(assert (=> b!538853 (= res!334048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48890 res!334045) b!538849))

(assert (= (and b!538849 res!334049) b!538851))

(assert (= (and b!538851 res!334050) b!538841))

(assert (= (and b!538841 res!334056) b!538850))

(assert (= (and b!538850 res!334051) b!538842))

(assert (= (and b!538842 res!334054) b!538853))

(assert (= (and b!538853 res!334048) b!538852))

(assert (= (and b!538852 res!334052) b!538846))

(assert (= (and b!538846 res!334057) b!538844))

(assert (= (and b!538844 res!334046) b!538840))

(assert (= (and b!538840 res!334047) b!538843))

(assert (= (and b!538843 res!334055) b!538845))

(assert (= (and b!538845 res!334053) b!538848))

(assert (= (and b!538848 (not res!334058)) b!538847))

(declare-fun m!517947 () Bool)

(assert (=> b!538842 m!517947))

(declare-fun m!517949 () Bool)

(assert (=> b!538840 m!517949))

(declare-fun m!517951 () Bool)

(assert (=> b!538840 m!517951))

(assert (=> b!538840 m!517951))

(declare-fun m!517953 () Bool)

(assert (=> b!538840 m!517953))

(assert (=> b!538840 m!517953))

(assert (=> b!538840 m!517951))

(declare-fun m!517955 () Bool)

(assert (=> b!538840 m!517955))

(declare-fun m!517957 () Bool)

(assert (=> b!538847 m!517957))

(declare-fun m!517959 () Bool)

(assert (=> b!538847 m!517959))

(assert (=> b!538847 m!517959))

(declare-fun m!517961 () Bool)

(assert (=> b!538847 m!517961))

(declare-fun m!517963 () Bool)

(assert (=> b!538850 m!517963))

(declare-fun m!517965 () Bool)

(assert (=> b!538841 m!517965))

(declare-fun m!517967 () Bool)

(assert (=> start!48890 m!517967))

(declare-fun m!517969 () Bool)

(assert (=> start!48890 m!517969))

(declare-fun m!517971 () Bool)

(assert (=> b!538853 m!517971))

(declare-fun m!517973 () Bool)

(assert (=> b!538852 m!517973))

(declare-fun m!517975 () Bool)

(assert (=> b!538843 m!517975))

(assert (=> b!538845 m!517951))

(assert (=> b!538845 m!517951))

(declare-fun m!517977 () Bool)

(assert (=> b!538845 m!517977))

(assert (=> b!538851 m!517951))

(assert (=> b!538851 m!517951))

(declare-fun m!517979 () Bool)

(assert (=> b!538851 m!517979))

(assert (=> b!538844 m!517951))

(assert (=> b!538844 m!517951))

(declare-fun m!517981 () Bool)

(assert (=> b!538844 m!517981))

(declare-fun m!517983 () Bool)

(assert (=> b!538846 m!517983))

(assert (=> b!538846 m!517951))

(assert (=> b!538848 m!517957))

(assert (=> b!538848 m!517959))

(assert (=> b!538848 m!517959))

(declare-fun m!517985 () Bool)

(assert (=> b!538848 m!517985))

(declare-fun m!517987 () Bool)

(assert (=> b!538848 m!517987))

(check-sat (not b!538845) (not b!538851) (not b!538848) (not b!538847) (not b!538840) (not b!538844) (not b!538843) (not b!538853) (not b!538850) (not b!538842) (not start!48890) (not b!538852) (not b!538841))
