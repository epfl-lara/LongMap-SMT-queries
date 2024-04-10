; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48840 () Bool)

(assert start!48840)

(declare-fun b!537861 () Bool)

(declare-fun e!311962 () Bool)

(assert (=> b!537861 (= e!311962 false)))

(declare-fun lt!246534 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4823 0))(
  ( (MissingZero!4823 (index!21516 (_ BitVec 32))) (Found!4823 (index!21517 (_ BitVec 32))) (Intermediate!4823 (undefined!5635 Bool) (index!21518 (_ BitVec 32)) (x!50446 (_ BitVec 32))) (Undefined!4823) (MissingVacant!4823 (index!21519 (_ BitVec 32))) )
))
(declare-fun lt!246533 () SeekEntryResult!4823)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34052 0))(
  ( (array!34053 (arr!16365 (Array (_ BitVec 32) (_ BitVec 64))) (size!16729 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34052)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34052 (_ BitVec 32)) SeekEntryResult!4823)

(assert (=> b!537861 (= lt!246533 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246534 (select (arr!16365 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537862 () Bool)

(declare-fun res!333073 () Bool)

(declare-fun e!311963 () Bool)

(assert (=> b!537862 (=> (not res!333073) (not e!311963))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537862 (= res!333073 (validKeyInArray!0 (select (arr!16365 a!3154) j!147)))))

(declare-fun b!537863 () Bool)

(declare-fun e!311961 () Bool)

(assert (=> b!537863 (= e!311961 e!311962)))

(declare-fun res!333077 () Bool)

(assert (=> b!537863 (=> (not res!333077) (not e!311962))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!537863 (= res!333077 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246534 #b00000000000000000000000000000000) (bvslt lt!246534 (size!16729 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537863 (= lt!246534 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!537864 () Bool)

(declare-fun res!333065 () Bool)

(assert (=> b!537864 (=> (not res!333065) (not e!311963))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!537864 (= res!333065 (validKeyInArray!0 k!1998))))

(declare-fun b!537865 () Bool)

(declare-fun res!333067 () Bool)

(declare-fun e!311964 () Bool)

(assert (=> b!537865 (=> (not res!333067) (not e!311964))))

(declare-datatypes ((List!10484 0))(
  ( (Nil!10481) (Cons!10480 (h!11423 (_ BitVec 64)) (t!16712 List!10484)) )
))
(declare-fun arrayNoDuplicates!0 (array!34052 (_ BitVec 32) List!10484) Bool)

(assert (=> b!537865 (= res!333067 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10481))))

(declare-fun b!537866 () Bool)

(declare-fun res!333071 () Bool)

(assert (=> b!537866 (=> (not res!333071) (not e!311964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34052 (_ BitVec 32)) Bool)

(assert (=> b!537866 (= res!333071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537867 () Bool)

(assert (=> b!537867 (= e!311963 e!311964)))

(declare-fun res!333075 () Bool)

(assert (=> b!537867 (=> (not res!333075) (not e!311964))))

(declare-fun lt!246532 () SeekEntryResult!4823)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537867 (= res!333075 (or (= lt!246532 (MissingZero!4823 i!1153)) (= lt!246532 (MissingVacant!4823 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34052 (_ BitVec 32)) SeekEntryResult!4823)

(assert (=> b!537867 (= lt!246532 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!537868 () Bool)

(declare-fun res!333074 () Bool)

(assert (=> b!537868 (=> (not res!333074) (not e!311963))))

(declare-fun arrayContainsKey!0 (array!34052 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537868 (= res!333074 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537869 () Bool)

(assert (=> b!537869 (= e!311964 e!311961)))

(declare-fun res!333066 () Bool)

(assert (=> b!537869 (=> (not res!333066) (not e!311961))))

(declare-fun lt!246535 () SeekEntryResult!4823)

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!537869 (= res!333066 (= lt!246535 (Intermediate!4823 false resIndex!32 resX!32)))))

(assert (=> b!537869 (= lt!246535 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16365 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537870 () Bool)

(declare-fun res!333070 () Bool)

(assert (=> b!537870 (=> (not res!333070) (not e!311963))))

(assert (=> b!537870 (= res!333070 (and (= (size!16729 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16729 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16729 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537860 () Bool)

(declare-fun res!333072 () Bool)

(assert (=> b!537860 (=> (not res!333072) (not e!311961))))

(assert (=> b!537860 (= res!333072 (and (not (= (select (arr!16365 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16365 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16365 a!3154) index!1177) (select (arr!16365 a!3154) j!147)))))))

(declare-fun res!333068 () Bool)

(assert (=> start!48840 (=> (not res!333068) (not e!311963))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48840 (= res!333068 (validMask!0 mask!3216))))

(assert (=> start!48840 e!311963))

(assert (=> start!48840 true))

(declare-fun array_inv!12161 (array!34052) Bool)

(assert (=> start!48840 (array_inv!12161 a!3154)))

(declare-fun b!537871 () Bool)

(declare-fun res!333076 () Bool)

(assert (=> b!537871 (=> (not res!333076) (not e!311961))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537871 (= res!333076 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16365 a!3154) j!147) mask!3216) (select (arr!16365 a!3154) j!147) a!3154 mask!3216) lt!246535))))

(declare-fun b!537872 () Bool)

(declare-fun res!333069 () Bool)

(assert (=> b!537872 (=> (not res!333069) (not e!311964))))

(assert (=> b!537872 (= res!333069 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16729 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16729 a!3154)) (= (select (arr!16365 a!3154) resIndex!32) (select (arr!16365 a!3154) j!147))))))

(assert (= (and start!48840 res!333068) b!537870))

(assert (= (and b!537870 res!333070) b!537862))

(assert (= (and b!537862 res!333073) b!537864))

(assert (= (and b!537864 res!333065) b!537868))

(assert (= (and b!537868 res!333074) b!537867))

(assert (= (and b!537867 res!333075) b!537866))

(assert (= (and b!537866 res!333071) b!537865))

(assert (= (and b!537865 res!333067) b!537872))

(assert (= (and b!537872 res!333069) b!537869))

(assert (= (and b!537869 res!333066) b!537871))

(assert (= (and b!537871 res!333076) b!537860))

(assert (= (and b!537860 res!333072) b!537863))

(assert (= (and b!537863 res!333077) b!537861))

(declare-fun m!517017 () Bool)

(assert (=> b!537861 m!517017))

(assert (=> b!537861 m!517017))

(declare-fun m!517019 () Bool)

(assert (=> b!537861 m!517019))

(assert (=> b!537869 m!517017))

(assert (=> b!537869 m!517017))

(declare-fun m!517021 () Bool)

(assert (=> b!537869 m!517021))

(assert (=> b!537862 m!517017))

(assert (=> b!537862 m!517017))

(declare-fun m!517023 () Bool)

(assert (=> b!537862 m!517023))

(declare-fun m!517025 () Bool)

(assert (=> b!537863 m!517025))

(declare-fun m!517027 () Bool)

(assert (=> b!537867 m!517027))

(declare-fun m!517029 () Bool)

(assert (=> b!537868 m!517029))

(declare-fun m!517031 () Bool)

(assert (=> b!537864 m!517031))

(declare-fun m!517033 () Bool)

(assert (=> b!537860 m!517033))

(assert (=> b!537860 m!517017))

(declare-fun m!517035 () Bool)

(assert (=> b!537865 m!517035))

(declare-fun m!517037 () Bool)

(assert (=> b!537872 m!517037))

(assert (=> b!537872 m!517017))

(declare-fun m!517039 () Bool)

(assert (=> b!537866 m!517039))

(declare-fun m!517041 () Bool)

(assert (=> start!48840 m!517041))

(declare-fun m!517043 () Bool)

(assert (=> start!48840 m!517043))

(assert (=> b!537871 m!517017))

(assert (=> b!537871 m!517017))

(declare-fun m!517045 () Bool)

(assert (=> b!537871 m!517045))

(assert (=> b!537871 m!517045))

(assert (=> b!537871 m!517017))

(declare-fun m!517047 () Bool)

(assert (=> b!537871 m!517047))

(push 1)

