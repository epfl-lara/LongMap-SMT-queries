; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64326 () Bool)

(assert start!64326)

(declare-fun b!721892 () Bool)

(declare-fun res!483586 () Bool)

(declare-fun e!404831 () Bool)

(assert (=> b!721892 (=> (not res!483586) (not e!404831))))

(declare-datatypes ((array!40840 0))(
  ( (array!40841 (arr!19540 (Array (_ BitVec 32) (_ BitVec 64))) (size!19960 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40840)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721892 (= res!483586 (validKeyInArray!0 (select (arr!19540 a!3186) j!159)))))

(declare-fun b!721894 () Bool)

(declare-fun res!483581 () Bool)

(declare-fun e!404832 () Bool)

(assert (=> b!721894 (=> (not res!483581) (not e!404832))))

(declare-datatypes ((List!13449 0))(
  ( (Nil!13446) (Cons!13445 (h!14502 (_ BitVec 64)) (t!19756 List!13449)) )
))
(declare-fun arrayNoDuplicates!0 (array!40840 (_ BitVec 32) List!13449) Bool)

(assert (=> b!721894 (= res!483581 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13446))))

(declare-fun b!721895 () Bool)

(declare-fun res!483592 () Bool)

(declare-fun e!404834 () Bool)

(assert (=> b!721895 (=> (not res!483592) (not e!404834))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721895 (= res!483592 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19540 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7096 0))(
  ( (MissingZero!7096 (index!30752 (_ BitVec 32))) (Found!7096 (index!30753 (_ BitVec 32))) (Intermediate!7096 (undefined!7908 Bool) (index!30754 (_ BitVec 32)) (x!61916 (_ BitVec 32))) (Undefined!7096) (MissingVacant!7096 (index!30755 (_ BitVec 32))) )
))
(declare-fun lt!320240 () SeekEntryResult!7096)

(declare-fun e!404833 () Bool)

(declare-fun b!721896 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40840 (_ BitVec 32)) SeekEntryResult!7096)

(assert (=> b!721896 (= e!404833 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19540 a!3186) j!159) a!3186 mask!3328) lt!320240))))

(declare-fun b!721897 () Bool)

(assert (=> b!721897 (= e!404831 e!404832)))

(declare-fun res!483582 () Bool)

(assert (=> b!721897 (=> (not res!483582) (not e!404832))))

(declare-fun lt!320239 () SeekEntryResult!7096)

(assert (=> b!721897 (= res!483582 (or (= lt!320239 (MissingZero!7096 i!1173)) (= lt!320239 (MissingVacant!7096 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40840 (_ BitVec 32)) SeekEntryResult!7096)

(assert (=> b!721897 (= lt!320239 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721898 () Bool)

(declare-fun res!483580 () Bool)

(assert (=> b!721898 (=> (not res!483580) (not e!404832))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721898 (= res!483580 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19960 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19960 a!3186))))))

(declare-fun b!721899 () Bool)

(declare-fun res!483584 () Bool)

(assert (=> b!721899 (=> (not res!483584) (not e!404831))))

(declare-fun arrayContainsKey!0 (array!40840 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721899 (= res!483584 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721900 () Bool)

(declare-fun res!483590 () Bool)

(assert (=> b!721900 (=> (not res!483590) (not e!404834))))

(assert (=> b!721900 (= res!483590 e!404833)))

(declare-fun c!79529 () Bool)

(assert (=> b!721900 (= c!79529 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721901 () Bool)

(assert (=> b!721901 (= e!404832 e!404834)))

(declare-fun res!483589 () Bool)

(assert (=> b!721901 (=> (not res!483589) (not e!404834))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721901 (= res!483589 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19540 a!3186) j!159) mask!3328) (select (arr!19540 a!3186) j!159) a!3186 mask!3328) lt!320240))))

(assert (=> b!721901 (= lt!320240 (Intermediate!7096 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721902 () Bool)

(declare-fun res!483585 () Bool)

(assert (=> b!721902 (=> (not res!483585) (not e!404832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40840 (_ BitVec 32)) Bool)

(assert (=> b!721902 (= res!483585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721903 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40840 (_ BitVec 32)) SeekEntryResult!7096)

(assert (=> b!721903 (= e!404833 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19540 a!3186) j!159) a!3186 mask!3328) (Found!7096 j!159)))))

(declare-fun b!721904 () Bool)

(declare-fun res!483587 () Bool)

(assert (=> b!721904 (=> (not res!483587) (not e!404831))))

(assert (=> b!721904 (= res!483587 (and (= (size!19960 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19960 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19960 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721893 () Bool)

(declare-fun e!404835 () Bool)

(assert (=> b!721893 (= e!404834 e!404835)))

(declare-fun res!483588 () Bool)

(assert (=> b!721893 (=> (not res!483588) (not e!404835))))

(declare-fun lt!320241 () (_ BitVec 32))

(assert (=> b!721893 (= res!483588 (and (bvsge mask!3328 #b00000000000000000000000000000000) (bvsge lt!320241 #b00000000000000000000000000000000) (bvslt lt!320241 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!721893 (= lt!320241 (toIndex!0 (select (store (arr!19540 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun res!483583 () Bool)

(assert (=> start!64326 (=> (not res!483583) (not e!404831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64326 (= res!483583 (validMask!0 mask!3328))))

(assert (=> start!64326 e!404831))

(assert (=> start!64326 true))

(declare-fun array_inv!15399 (array!40840) Bool)

(assert (=> start!64326 (array_inv!15399 a!3186)))

(declare-fun b!721905 () Bool)

(assert (=> b!721905 (= e!404835 (not (validKeyInArray!0 (select (store (arr!19540 a!3186) i!1173 k0!2102) j!159))))))

(declare-fun b!721906 () Bool)

(declare-fun res!483591 () Bool)

(assert (=> b!721906 (=> (not res!483591) (not e!404831))))

(assert (=> b!721906 (= res!483591 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64326 res!483583) b!721904))

(assert (= (and b!721904 res!483587) b!721892))

(assert (= (and b!721892 res!483586) b!721906))

(assert (= (and b!721906 res!483591) b!721899))

(assert (= (and b!721899 res!483584) b!721897))

(assert (= (and b!721897 res!483582) b!721902))

(assert (= (and b!721902 res!483585) b!721894))

(assert (= (and b!721894 res!483581) b!721898))

(assert (= (and b!721898 res!483580) b!721901))

(assert (= (and b!721901 res!483589) b!721895))

(assert (= (and b!721895 res!483592) b!721900))

(assert (= (and b!721900 c!79529) b!721896))

(assert (= (and b!721900 (not c!79529)) b!721903))

(assert (= (and b!721900 res!483590) b!721893))

(assert (= (and b!721893 res!483588) b!721905))

(declare-fun m!677181 () Bool)

(assert (=> b!721894 m!677181))

(declare-fun m!677183 () Bool)

(assert (=> b!721903 m!677183))

(assert (=> b!721903 m!677183))

(declare-fun m!677185 () Bool)

(assert (=> b!721903 m!677185))

(assert (=> b!721901 m!677183))

(assert (=> b!721901 m!677183))

(declare-fun m!677187 () Bool)

(assert (=> b!721901 m!677187))

(assert (=> b!721901 m!677187))

(assert (=> b!721901 m!677183))

(declare-fun m!677189 () Bool)

(assert (=> b!721901 m!677189))

(declare-fun m!677191 () Bool)

(assert (=> b!721897 m!677191))

(declare-fun m!677193 () Bool)

(assert (=> b!721902 m!677193))

(declare-fun m!677195 () Bool)

(assert (=> b!721906 m!677195))

(declare-fun m!677197 () Bool)

(assert (=> b!721905 m!677197))

(declare-fun m!677199 () Bool)

(assert (=> b!721905 m!677199))

(assert (=> b!721905 m!677199))

(declare-fun m!677201 () Bool)

(assert (=> b!721905 m!677201))

(declare-fun m!677203 () Bool)

(assert (=> start!64326 m!677203))

(declare-fun m!677205 () Bool)

(assert (=> start!64326 m!677205))

(declare-fun m!677207 () Bool)

(assert (=> b!721895 m!677207))

(assert (=> b!721896 m!677183))

(assert (=> b!721896 m!677183))

(declare-fun m!677209 () Bool)

(assert (=> b!721896 m!677209))

(assert (=> b!721893 m!677197))

(assert (=> b!721893 m!677199))

(assert (=> b!721893 m!677199))

(declare-fun m!677211 () Bool)

(assert (=> b!721893 m!677211))

(assert (=> b!721892 m!677183))

(assert (=> b!721892 m!677183))

(declare-fun m!677213 () Bool)

(assert (=> b!721892 m!677213))

(declare-fun m!677215 () Bool)

(assert (=> b!721899 m!677215))

(check-sat (not start!64326) (not b!721906) (not b!721897) (not b!721892) (not b!721899) (not b!721903) (not b!721901) (not b!721905) (not b!721894) (not b!721893) (not b!721902) (not b!721896))
(check-sat)
