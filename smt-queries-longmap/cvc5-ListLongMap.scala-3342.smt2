; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46044 () Bool)

(assert start!46044)

(declare-fun b!509892 () Bool)

(declare-fun res!310742 () Bool)

(declare-fun e!298124 () Bool)

(assert (=> b!509892 (=> (not res!310742) (not e!298124))))

(declare-datatypes ((array!32755 0))(
  ( (array!32756 (arr!15756 (Array (_ BitVec 32) (_ BitVec 64))) (size!16120 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32755)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509892 (= res!310742 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!310743 () Bool)

(assert (=> start!46044 (=> (not res!310743) (not e!298124))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46044 (= res!310743 (validMask!0 mask!3524))))

(assert (=> start!46044 e!298124))

(assert (=> start!46044 true))

(declare-fun array_inv!11552 (array!32755) Bool)

(assert (=> start!46044 (array_inv!11552 a!3235)))

(declare-fun b!509893 () Bool)

(declare-fun res!310745 () Bool)

(assert (=> b!509893 (=> (not res!310745) (not e!298124))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509893 (= res!310745 (validKeyInArray!0 k!2280))))

(declare-fun b!509894 () Bool)

(declare-fun res!310737 () Bool)

(assert (=> b!509894 (=> (not res!310737) (not e!298124))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509894 (= res!310737 (and (= (size!16120 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16120 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16120 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509895 () Bool)

(declare-fun e!298123 () Bool)

(assert (=> b!509895 (= e!298124 e!298123)))

(declare-fun res!310741 () Bool)

(assert (=> b!509895 (=> (not res!310741) (not e!298123))))

(declare-datatypes ((SeekEntryResult!4223 0))(
  ( (MissingZero!4223 (index!19080 (_ BitVec 32))) (Found!4223 (index!19081 (_ BitVec 32))) (Intermediate!4223 (undefined!5035 Bool) (index!19082 (_ BitVec 32)) (x!48048 (_ BitVec 32))) (Undefined!4223) (MissingVacant!4223 (index!19083 (_ BitVec 32))) )
))
(declare-fun lt!233022 () SeekEntryResult!4223)

(assert (=> b!509895 (= res!310741 (or (= lt!233022 (MissingZero!4223 i!1204)) (= lt!233022 (MissingVacant!4223 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32755 (_ BitVec 32)) SeekEntryResult!4223)

(assert (=> b!509895 (= lt!233022 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!509896 () Bool)

(declare-fun res!310740 () Bool)

(assert (=> b!509896 (=> (not res!310740) (not e!298123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32755 (_ BitVec 32)) Bool)

(assert (=> b!509896 (= res!310740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509897 () Bool)

(declare-fun res!310739 () Bool)

(assert (=> b!509897 (=> (not res!310739) (not e!298123))))

(declare-datatypes ((List!9914 0))(
  ( (Nil!9911) (Cons!9910 (h!10787 (_ BitVec 64)) (t!16142 List!9914)) )
))
(declare-fun arrayNoDuplicates!0 (array!32755 (_ BitVec 32) List!9914) Bool)

(assert (=> b!509897 (= res!310739 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9911))))

(declare-fun b!509898 () Bool)

(declare-fun res!310738 () Bool)

(assert (=> b!509898 (=> (not res!310738) (not e!298124))))

(assert (=> b!509898 (= res!310738 (validKeyInArray!0 (select (arr!15756 a!3235) j!176)))))

(declare-fun b!509899 () Bool)

(declare-fun e!298122 () Bool)

(assert (=> b!509899 (= e!298122 (= (seekEntryOrOpen!0 (select (arr!15756 a!3235) j!176) a!3235 mask!3524) (Found!4223 j!176)))))

(declare-fun b!509900 () Bool)

(assert (=> b!509900 (= e!298123 (not true))))

(declare-fun lt!233019 () (_ BitVec 32))

(declare-fun lt!233023 () SeekEntryResult!4223)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32755 (_ BitVec 32)) SeekEntryResult!4223)

(assert (=> b!509900 (= lt!233023 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233019 (select (store (arr!15756 a!3235) i!1204 k!2280) j!176) (array!32756 (store (arr!15756 a!3235) i!1204 k!2280) (size!16120 a!3235)) mask!3524))))

(declare-fun lt!233018 () (_ BitVec 32))

(declare-fun lt!233021 () SeekEntryResult!4223)

(assert (=> b!509900 (= lt!233021 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233018 (select (arr!15756 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509900 (= lt!233019 (toIndex!0 (select (store (arr!15756 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!509900 (= lt!233018 (toIndex!0 (select (arr!15756 a!3235) j!176) mask!3524))))

(assert (=> b!509900 e!298122))

(declare-fun res!310744 () Bool)

(assert (=> b!509900 (=> (not res!310744) (not e!298122))))

(assert (=> b!509900 (= res!310744 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15704 0))(
  ( (Unit!15705) )
))
(declare-fun lt!233020 () Unit!15704)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32755 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15704)

(assert (=> b!509900 (= lt!233020 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46044 res!310743) b!509894))

(assert (= (and b!509894 res!310737) b!509898))

(assert (= (and b!509898 res!310738) b!509893))

(assert (= (and b!509893 res!310745) b!509892))

(assert (= (and b!509892 res!310742) b!509895))

(assert (= (and b!509895 res!310741) b!509896))

(assert (= (and b!509896 res!310740) b!509897))

(assert (= (and b!509897 res!310739) b!509900))

(assert (= (and b!509900 res!310744) b!509899))

(declare-fun m!490929 () Bool)

(assert (=> b!509899 m!490929))

(assert (=> b!509899 m!490929))

(declare-fun m!490931 () Bool)

(assert (=> b!509899 m!490931))

(assert (=> b!509898 m!490929))

(assert (=> b!509898 m!490929))

(declare-fun m!490933 () Bool)

(assert (=> b!509898 m!490933))

(declare-fun m!490935 () Bool)

(assert (=> b!509900 m!490935))

(declare-fun m!490937 () Bool)

(assert (=> b!509900 m!490937))

(declare-fun m!490939 () Bool)

(assert (=> b!509900 m!490939))

(assert (=> b!509900 m!490929))

(declare-fun m!490941 () Bool)

(assert (=> b!509900 m!490941))

(assert (=> b!509900 m!490929))

(declare-fun m!490943 () Bool)

(assert (=> b!509900 m!490943))

(assert (=> b!509900 m!490929))

(declare-fun m!490945 () Bool)

(assert (=> b!509900 m!490945))

(assert (=> b!509900 m!490939))

(declare-fun m!490947 () Bool)

(assert (=> b!509900 m!490947))

(assert (=> b!509900 m!490939))

(declare-fun m!490949 () Bool)

(assert (=> b!509900 m!490949))

(declare-fun m!490951 () Bool)

(assert (=> start!46044 m!490951))

(declare-fun m!490953 () Bool)

(assert (=> start!46044 m!490953))

(declare-fun m!490955 () Bool)

(assert (=> b!509893 m!490955))

(declare-fun m!490957 () Bool)

(assert (=> b!509895 m!490957))

(declare-fun m!490959 () Bool)

(assert (=> b!509897 m!490959))

(declare-fun m!490961 () Bool)

(assert (=> b!509896 m!490961))

(declare-fun m!490963 () Bool)

(assert (=> b!509892 m!490963))

(push 1)

