; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66000 () Bool)

(assert start!66000)

(declare-fun b!760095 () Bool)

(declare-fun res!514170 () Bool)

(declare-fun e!423801 () Bool)

(assert (=> b!760095 (=> (not res!514170) (not e!423801))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!760095 (= res!514170 (validKeyInArray!0 k0!2102))))

(declare-fun res!514180 () Bool)

(assert (=> start!66000 (=> (not res!514180) (not e!423801))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66000 (= res!514180 (validMask!0 mask!3328))))

(assert (=> start!66000 e!423801))

(assert (=> start!66000 true))

(declare-datatypes ((array!42043 0))(
  ( (array!42044 (arr!20131 (Array (_ BitVec 32) (_ BitVec 64))) (size!20551 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42043)

(declare-fun array_inv!15990 (array!42043) Bool)

(assert (=> start!66000 (array_inv!15990 a!3186)))

(declare-fun b!760096 () Bool)

(declare-fun res!514168 () Bool)

(declare-fun e!423799 () Bool)

(assert (=> b!760096 (=> (not res!514168) (not e!423799))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!760096 (= res!514168 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20551 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20551 a!3186))))))

(declare-fun b!760097 () Bool)

(declare-fun e!423803 () Bool)

(declare-fun e!423800 () Bool)

(assert (=> b!760097 (= e!423803 e!423800)))

(declare-fun res!514171 () Bool)

(assert (=> b!760097 (=> (not res!514171) (not e!423800))))

(declare-fun lt!338686 () array!42043)

(declare-fun lt!338687 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7687 0))(
  ( (MissingZero!7687 (index!33116 (_ BitVec 32))) (Found!7687 (index!33117 (_ BitVec 32))) (Intermediate!7687 (undefined!8499 Bool) (index!33118 (_ BitVec 32)) (x!64161 (_ BitVec 32))) (Undefined!7687) (MissingVacant!7687 (index!33119 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42043 (_ BitVec 32)) SeekEntryResult!7687)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!760097 (= res!514171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!338687 mask!3328) lt!338687 lt!338686 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!338687 lt!338686 mask!3328)))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!760097 (= lt!338687 (select (store (arr!20131 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!760097 (= lt!338686 (array!42044 (store (arr!20131 a!3186) i!1173 k0!2102) (size!20551 a!3186)))))

(declare-fun b!760098 () Bool)

(declare-fun res!514167 () Bool)

(assert (=> b!760098 (=> (not res!514167) (not e!423803))))

(declare-fun e!423802 () Bool)

(assert (=> b!760098 (= res!514167 e!423802)))

(declare-fun c!83348 () Bool)

(assert (=> b!760098 (= c!83348 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!760099 () Bool)

(declare-fun res!514177 () Bool)

(assert (=> b!760099 (=> (not res!514177) (not e!423801))))

(assert (=> b!760099 (= res!514177 (and (= (size!20551 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20551 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20551 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!760100 () Bool)

(declare-fun res!514176 () Bool)

(assert (=> b!760100 (=> (not res!514176) (not e!423799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42043 (_ BitVec 32)) Bool)

(assert (=> b!760100 (= res!514176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!760101 () Bool)

(declare-fun res!514172 () Bool)

(assert (=> b!760101 (=> (not res!514172) (not e!423801))))

(declare-fun arrayContainsKey!0 (array!42043 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!760101 (= res!514172 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!423798 () Bool)

(declare-fun b!760102 () Bool)

(declare-fun lt!338684 () SeekEntryResult!7687)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42043 (_ BitVec 32)) SeekEntryResult!7687)

(assert (=> b!760102 (= e!423798 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20131 a!3186) j!159) a!3186 mask!3328) lt!338684))))

(declare-fun b!760103 () Bool)

(assert (=> b!760103 (= e!423801 e!423799)))

(declare-fun res!514173 () Bool)

(assert (=> b!760103 (=> (not res!514173) (not e!423799))))

(declare-fun lt!338683 () SeekEntryResult!7687)

(assert (=> b!760103 (= res!514173 (or (= lt!338683 (MissingZero!7687 i!1173)) (= lt!338683 (MissingVacant!7687 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42043 (_ BitVec 32)) SeekEntryResult!7687)

(assert (=> b!760103 (= lt!338683 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!760104 () Bool)

(declare-fun res!514175 () Bool)

(assert (=> b!760104 (=> (not res!514175) (not e!423801))))

(assert (=> b!760104 (= res!514175 (validKeyInArray!0 (select (arr!20131 a!3186) j!159)))))

(declare-fun b!760105 () Bool)

(declare-fun res!514174 () Bool)

(assert (=> b!760105 (=> (not res!514174) (not e!423803))))

(assert (=> b!760105 (= res!514174 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20131 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!338685 () SeekEntryResult!7687)

(declare-fun b!760106 () Bool)

(assert (=> b!760106 (= e!423802 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20131 a!3186) j!159) a!3186 mask!3328) lt!338685))))

(declare-fun b!760107 () Bool)

(assert (=> b!760107 (= e!423800 (not true))))

(declare-fun e!423797 () Bool)

(assert (=> b!760107 e!423797))

(declare-fun res!514169 () Bool)

(assert (=> b!760107 (=> (not res!514169) (not e!423797))))

(assert (=> b!760107 (= res!514169 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26293 0))(
  ( (Unit!26294) )
))
(declare-fun lt!338688 () Unit!26293)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42043 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26293)

(assert (=> b!760107 (= lt!338688 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!760108 () Bool)

(assert (=> b!760108 (= e!423797 e!423798)))

(declare-fun res!514179 () Bool)

(assert (=> b!760108 (=> (not res!514179) (not e!423798))))

(assert (=> b!760108 (= res!514179 (= (seekEntryOrOpen!0 (select (arr!20131 a!3186) j!159) a!3186 mask!3328) lt!338684))))

(assert (=> b!760108 (= lt!338684 (Found!7687 j!159))))

(declare-fun b!760109 () Bool)

(assert (=> b!760109 (= e!423799 e!423803)))

(declare-fun res!514166 () Bool)

(assert (=> b!760109 (=> (not res!514166) (not e!423803))))

(assert (=> b!760109 (= res!514166 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20131 a!3186) j!159) mask!3328) (select (arr!20131 a!3186) j!159) a!3186 mask!3328) lt!338685))))

(assert (=> b!760109 (= lt!338685 (Intermediate!7687 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!760110 () Bool)

(declare-fun res!514178 () Bool)

(assert (=> b!760110 (=> (not res!514178) (not e!423799))))

(declare-datatypes ((List!14040 0))(
  ( (Nil!14037) (Cons!14036 (h!15114 (_ BitVec 64)) (t!20347 List!14040)) )
))
(declare-fun arrayNoDuplicates!0 (array!42043 (_ BitVec 32) List!14040) Bool)

(assert (=> b!760110 (= res!514178 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14037))))

(declare-fun b!760111 () Bool)

(assert (=> b!760111 (= e!423802 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20131 a!3186) j!159) a!3186 mask!3328) (Found!7687 j!159)))))

(assert (= (and start!66000 res!514180) b!760099))

(assert (= (and b!760099 res!514177) b!760104))

(assert (= (and b!760104 res!514175) b!760095))

(assert (= (and b!760095 res!514170) b!760101))

(assert (= (and b!760101 res!514172) b!760103))

(assert (= (and b!760103 res!514173) b!760100))

(assert (= (and b!760100 res!514176) b!760110))

(assert (= (and b!760110 res!514178) b!760096))

(assert (= (and b!760096 res!514168) b!760109))

(assert (= (and b!760109 res!514166) b!760105))

(assert (= (and b!760105 res!514174) b!760098))

(assert (= (and b!760098 c!83348) b!760106))

(assert (= (and b!760098 (not c!83348)) b!760111))

(assert (= (and b!760098 res!514167) b!760097))

(assert (= (and b!760097 res!514171) b!760107))

(assert (= (and b!760107 res!514169) b!760108))

(assert (= (and b!760108 res!514179) b!760102))

(declare-fun m!707877 () Bool)

(assert (=> b!760107 m!707877))

(declare-fun m!707879 () Bool)

(assert (=> b!760107 m!707879))

(declare-fun m!707881 () Bool)

(assert (=> b!760103 m!707881))

(declare-fun m!707883 () Bool)

(assert (=> start!66000 m!707883))

(declare-fun m!707885 () Bool)

(assert (=> start!66000 m!707885))

(declare-fun m!707887 () Bool)

(assert (=> b!760100 m!707887))

(declare-fun m!707889 () Bool)

(assert (=> b!760101 m!707889))

(declare-fun m!707891 () Bool)

(assert (=> b!760109 m!707891))

(assert (=> b!760109 m!707891))

(declare-fun m!707893 () Bool)

(assert (=> b!760109 m!707893))

(assert (=> b!760109 m!707893))

(assert (=> b!760109 m!707891))

(declare-fun m!707895 () Bool)

(assert (=> b!760109 m!707895))

(declare-fun m!707897 () Bool)

(assert (=> b!760110 m!707897))

(assert (=> b!760102 m!707891))

(assert (=> b!760102 m!707891))

(declare-fun m!707899 () Bool)

(assert (=> b!760102 m!707899))

(declare-fun m!707901 () Bool)

(assert (=> b!760095 m!707901))

(declare-fun m!707903 () Bool)

(assert (=> b!760105 m!707903))

(assert (=> b!760108 m!707891))

(assert (=> b!760108 m!707891))

(declare-fun m!707905 () Bool)

(assert (=> b!760108 m!707905))

(assert (=> b!760111 m!707891))

(assert (=> b!760111 m!707891))

(declare-fun m!707907 () Bool)

(assert (=> b!760111 m!707907))

(assert (=> b!760104 m!707891))

(assert (=> b!760104 m!707891))

(declare-fun m!707909 () Bool)

(assert (=> b!760104 m!707909))

(assert (=> b!760106 m!707891))

(assert (=> b!760106 m!707891))

(declare-fun m!707911 () Bool)

(assert (=> b!760106 m!707911))

(declare-fun m!707913 () Bool)

(assert (=> b!760097 m!707913))

(declare-fun m!707915 () Bool)

(assert (=> b!760097 m!707915))

(declare-fun m!707917 () Bool)

(assert (=> b!760097 m!707917))

(declare-fun m!707919 () Bool)

(assert (=> b!760097 m!707919))

(assert (=> b!760097 m!707919))

(declare-fun m!707921 () Bool)

(assert (=> b!760097 m!707921))

(check-sat (not b!760107) (not b!760103) (not b!760110) (not b!760095) (not b!760102) (not b!760097) (not b!760111) (not b!760108) (not b!760100) (not b!760109) (not b!760106) (not b!760101) (not b!760104) (not start!66000))
(check-sat)
