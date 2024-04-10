; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64280 () Bool)

(assert start!64280)

(declare-fun b!721898 () Bool)

(declare-fun res!483687 () Bool)

(declare-fun e!404735 () Bool)

(assert (=> b!721898 (=> (not res!483687) (not e!404735))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!40861 0))(
  ( (array!40862 (arr!19553 (Array (_ BitVec 32) (_ BitVec 64))) (size!19974 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40861)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721898 (= res!483687 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19553 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721899 () Bool)

(declare-fun res!483690 () Bool)

(declare-fun e!404733 () Bool)

(assert (=> b!721899 (=> (not res!483690) (not e!404733))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721899 (= res!483690 (validKeyInArray!0 k!2102))))

(declare-fun b!721900 () Bool)

(declare-fun res!483695 () Bool)

(declare-fun e!404732 () Bool)

(assert (=> b!721900 (=> (not res!483695) (not e!404732))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721900 (= res!483695 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19974 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19974 a!3186))))))

(declare-fun b!721901 () Bool)

(declare-fun res!483693 () Bool)

(assert (=> b!721901 (=> (not res!483693) (not e!404733))))

(declare-fun arrayContainsKey!0 (array!40861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721901 (= res!483693 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721902 () Bool)

(declare-fun res!483689 () Bool)

(assert (=> b!721902 (=> (not res!483689) (not e!404733))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!721902 (= res!483689 (and (= (size!19974 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19974 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19974 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721903 () Bool)

(assert (=> b!721903 (= e!404735 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!721904 () Bool)

(assert (=> b!721904 (= e!404733 e!404732)))

(declare-fun res!483692 () Bool)

(assert (=> b!721904 (=> (not res!483692) (not e!404732))))

(declare-datatypes ((SeekEntryResult!7153 0))(
  ( (MissingZero!7153 (index!30980 (_ BitVec 32))) (Found!7153 (index!30981 (_ BitVec 32))) (Intermediate!7153 (undefined!7965 Bool) (index!30982 (_ BitVec 32)) (x!61986 (_ BitVec 32))) (Undefined!7153) (MissingVacant!7153 (index!30983 (_ BitVec 32))) )
))
(declare-fun lt!320173 () SeekEntryResult!7153)

(assert (=> b!721904 (= res!483692 (or (= lt!320173 (MissingZero!7153 i!1173)) (= lt!320173 (MissingVacant!7153 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40861 (_ BitVec 32)) SeekEntryResult!7153)

(assert (=> b!721904 (= lt!320173 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!721905 () Bool)

(declare-fun e!404734 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40861 (_ BitVec 32)) SeekEntryResult!7153)

(assert (=> b!721905 (= e!404734 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19553 a!3186) j!159) a!3186 mask!3328) (Found!7153 j!159)))))

(declare-fun b!721906 () Bool)

(declare-fun res!483698 () Bool)

(assert (=> b!721906 (=> (not res!483698) (not e!404735))))

(assert (=> b!721906 (= res!483698 e!404734)))

(declare-fun c!79477 () Bool)

(assert (=> b!721906 (= c!79477 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721907 () Bool)

(declare-fun res!483691 () Bool)

(assert (=> b!721907 (=> (not res!483691) (not e!404732))))

(declare-datatypes ((List!13555 0))(
  ( (Nil!13552) (Cons!13551 (h!14605 (_ BitVec 64)) (t!19870 List!13555)) )
))
(declare-fun arrayNoDuplicates!0 (array!40861 (_ BitVec 32) List!13555) Bool)

(assert (=> b!721907 (= res!483691 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13552))))

(declare-fun lt!320174 () SeekEntryResult!7153)

(declare-fun b!721908 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40861 (_ BitVec 32)) SeekEntryResult!7153)

(assert (=> b!721908 (= e!404734 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19553 a!3186) j!159) a!3186 mask!3328) lt!320174))))

(declare-fun res!483697 () Bool)

(assert (=> start!64280 (=> (not res!483697) (not e!404733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64280 (= res!483697 (validMask!0 mask!3328))))

(assert (=> start!64280 e!404733))

(assert (=> start!64280 true))

(declare-fun array_inv!15349 (array!40861) Bool)

(assert (=> start!64280 (array_inv!15349 a!3186)))

(declare-fun b!721909 () Bool)

(assert (=> b!721909 (= e!404732 e!404735)))

(declare-fun res!483688 () Bool)

(assert (=> b!721909 (=> (not res!483688) (not e!404735))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721909 (= res!483688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19553 a!3186) j!159) mask!3328) (select (arr!19553 a!3186) j!159) a!3186 mask!3328) lt!320174))))

(assert (=> b!721909 (= lt!320174 (Intermediate!7153 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721910 () Bool)

(declare-fun res!483696 () Bool)

(assert (=> b!721910 (=> (not res!483696) (not e!404732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40861 (_ BitVec 32)) Bool)

(assert (=> b!721910 (= res!483696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721911 () Bool)

(declare-fun res!483694 () Bool)

(assert (=> b!721911 (=> (not res!483694) (not e!404733))))

(assert (=> b!721911 (= res!483694 (validKeyInArray!0 (select (arr!19553 a!3186) j!159)))))

(assert (= (and start!64280 res!483697) b!721902))

(assert (= (and b!721902 res!483689) b!721911))

(assert (= (and b!721911 res!483694) b!721899))

(assert (= (and b!721899 res!483690) b!721901))

(assert (= (and b!721901 res!483693) b!721904))

(assert (= (and b!721904 res!483692) b!721910))

(assert (= (and b!721910 res!483696) b!721907))

(assert (= (and b!721907 res!483691) b!721900))

(assert (= (and b!721900 res!483695) b!721909))

(assert (= (and b!721909 res!483688) b!721898))

(assert (= (and b!721898 res!483687) b!721906))

(assert (= (and b!721906 c!79477) b!721908))

(assert (= (and b!721906 (not c!79477)) b!721905))

(assert (= (and b!721906 res!483698) b!721903))

(declare-fun m!676581 () Bool)

(assert (=> b!721910 m!676581))

(declare-fun m!676583 () Bool)

(assert (=> start!64280 m!676583))

(declare-fun m!676585 () Bool)

(assert (=> start!64280 m!676585))

(declare-fun m!676587 () Bool)

(assert (=> b!721909 m!676587))

(assert (=> b!721909 m!676587))

(declare-fun m!676589 () Bool)

(assert (=> b!721909 m!676589))

(assert (=> b!721909 m!676589))

(assert (=> b!721909 m!676587))

(declare-fun m!676591 () Bool)

(assert (=> b!721909 m!676591))

(assert (=> b!721911 m!676587))

(assert (=> b!721911 m!676587))

(declare-fun m!676593 () Bool)

(assert (=> b!721911 m!676593))

(assert (=> b!721905 m!676587))

(assert (=> b!721905 m!676587))

(declare-fun m!676595 () Bool)

(assert (=> b!721905 m!676595))

(declare-fun m!676597 () Bool)

(assert (=> b!721898 m!676597))

(declare-fun m!676599 () Bool)

(assert (=> b!721899 m!676599))

(assert (=> b!721908 m!676587))

(assert (=> b!721908 m!676587))

(declare-fun m!676601 () Bool)

(assert (=> b!721908 m!676601))

(declare-fun m!676603 () Bool)

(assert (=> b!721901 m!676603))

(declare-fun m!676605 () Bool)

(assert (=> b!721904 m!676605))

(declare-fun m!676607 () Bool)

(assert (=> b!721907 m!676607))

(push 1)

(assert (not b!721908))

(assert (not b!721909))

(assert (not b!721907))

(assert (not b!721901))

(assert (not b!721910))

(assert (not start!64280))

(assert (not b!721905))

(assert (not b!721904))

(assert (not b!721899))

(assert (not b!721911))

(check-sat)

(pop 1)

