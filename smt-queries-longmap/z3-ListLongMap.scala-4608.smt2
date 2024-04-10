; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64284 () Bool)

(assert start!64284)

(declare-fun b!721977 () Bool)

(declare-fun res!483762 () Bool)

(declare-fun e!404762 () Bool)

(assert (=> b!721977 (=> (not res!483762) (not e!404762))))

(declare-datatypes ((array!40865 0))(
  ( (array!40866 (arr!19555 (Array (_ BitVec 32) (_ BitVec 64))) (size!19976 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40865)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721977 (= res!483762 (validKeyInArray!0 (select (arr!19555 a!3186) j!159)))))

(declare-fun b!721978 () Bool)

(declare-fun res!483764 () Bool)

(declare-fun e!404765 () Bool)

(assert (=> b!721978 (=> (not res!483764) (not e!404765))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721978 (= res!483764 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19976 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19976 a!3186))))))

(declare-fun b!721979 () Bool)

(declare-fun res!483759 () Bool)

(assert (=> b!721979 (=> (not res!483759) (not e!404762))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!721979 (= res!483759 (and (= (size!19976 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19976 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19976 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!721980 () Bool)

(assert (=> b!721980 (= e!404762 e!404765)))

(declare-fun res!483755 () Bool)

(assert (=> b!721980 (=> (not res!483755) (not e!404765))))

(declare-datatypes ((SeekEntryResult!7155 0))(
  ( (MissingZero!7155 (index!30988 (_ BitVec 32))) (Found!7155 (index!30989 (_ BitVec 32))) (Intermediate!7155 (undefined!7967 Bool) (index!30990 (_ BitVec 32)) (x!61996 (_ BitVec 32))) (Undefined!7155) (MissingVacant!7155 (index!30991 (_ BitVec 32))) )
))
(declare-fun lt!320191 () SeekEntryResult!7155)

(assert (=> b!721980 (= res!483755 (or (= lt!320191 (MissingZero!7155 i!1173)) (= lt!320191 (MissingVacant!7155 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40865 (_ BitVec 32)) SeekEntryResult!7155)

(assert (=> b!721980 (= lt!320191 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!721981 () Bool)

(declare-fun res!483758 () Bool)

(assert (=> b!721981 (=> (not res!483758) (not e!404765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40865 (_ BitVec 32)) Bool)

(assert (=> b!721981 (= res!483758 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721982 () Bool)

(declare-fun res!483756 () Bool)

(assert (=> b!721982 (=> (not res!483756) (not e!404762))))

(declare-fun arrayContainsKey!0 (array!40865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721982 (= res!483756 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!404761 () Bool)

(declare-fun b!721983 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40865 (_ BitVec 32)) SeekEntryResult!7155)

(assert (=> b!721983 (= e!404761 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19555 a!3186) j!159) a!3186 mask!3328) (Found!7155 j!159))))))

(declare-fun res!483760 () Bool)

(assert (=> start!64284 (=> (not res!483760) (not e!404762))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64284 (= res!483760 (validMask!0 mask!3328))))

(assert (=> start!64284 e!404762))

(assert (=> start!64284 true))

(declare-fun array_inv!15351 (array!40865) Bool)

(assert (=> start!64284 (array_inv!15351 a!3186)))

(declare-fun b!721984 () Bool)

(declare-fun res!483754 () Bool)

(assert (=> b!721984 (=> (not res!483754) (not e!404765))))

(declare-datatypes ((List!13557 0))(
  ( (Nil!13554) (Cons!13553 (h!14607 (_ BitVec 64)) (t!19872 List!13557)) )
))
(declare-fun arrayNoDuplicates!0 (array!40865 (_ BitVec 32) List!13557) Bool)

(assert (=> b!721984 (= res!483754 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13554))))

(declare-fun b!721985 () Bool)

(declare-fun res!483763 () Bool)

(declare-fun e!404764 () Bool)

(assert (=> b!721985 (=> (not res!483763) (not e!404764))))

(assert (=> b!721985 (= res!483763 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19555 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721986 () Bool)

(declare-fun lt!320190 () SeekEntryResult!7155)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40865 (_ BitVec 32)) SeekEntryResult!7155)

(assert (=> b!721986 (= e!404761 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19555 a!3186) j!159) a!3186 mask!3328) lt!320190)))))

(declare-fun b!721987 () Bool)

(assert (=> b!721987 (= e!404764 false)))

(declare-fun lt!320192 () Bool)

(assert (=> b!721987 (= lt!320192 e!404761)))

(declare-fun c!79483 () Bool)

(assert (=> b!721987 (= c!79483 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721988 () Bool)

(assert (=> b!721988 (= e!404765 e!404764)))

(declare-fun res!483757 () Bool)

(assert (=> b!721988 (=> (not res!483757) (not e!404764))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721988 (= res!483757 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19555 a!3186) j!159) mask!3328) (select (arr!19555 a!3186) j!159) a!3186 mask!3328) lt!320190))))

(assert (=> b!721988 (= lt!320190 (Intermediate!7155 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721989 () Bool)

(declare-fun res!483761 () Bool)

(assert (=> b!721989 (=> (not res!483761) (not e!404762))))

(assert (=> b!721989 (= res!483761 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64284 res!483760) b!721979))

(assert (= (and b!721979 res!483759) b!721977))

(assert (= (and b!721977 res!483762) b!721989))

(assert (= (and b!721989 res!483761) b!721982))

(assert (= (and b!721982 res!483756) b!721980))

(assert (= (and b!721980 res!483755) b!721981))

(assert (= (and b!721981 res!483758) b!721984))

(assert (= (and b!721984 res!483754) b!721978))

(assert (= (and b!721978 res!483764) b!721988))

(assert (= (and b!721988 res!483757) b!721985))

(assert (= (and b!721985 res!483763) b!721987))

(assert (= (and b!721987 c!79483) b!721986))

(assert (= (and b!721987 (not c!79483)) b!721983))

(declare-fun m!676637 () Bool)

(assert (=> b!721981 m!676637))

(declare-fun m!676639 () Bool)

(assert (=> b!721989 m!676639))

(declare-fun m!676641 () Bool)

(assert (=> b!721977 m!676641))

(assert (=> b!721977 m!676641))

(declare-fun m!676643 () Bool)

(assert (=> b!721977 m!676643))

(declare-fun m!676645 () Bool)

(assert (=> b!721980 m!676645))

(declare-fun m!676647 () Bool)

(assert (=> b!721984 m!676647))

(declare-fun m!676649 () Bool)

(assert (=> b!721985 m!676649))

(declare-fun m!676651 () Bool)

(assert (=> start!64284 m!676651))

(declare-fun m!676653 () Bool)

(assert (=> start!64284 m!676653))

(declare-fun m!676655 () Bool)

(assert (=> b!721982 m!676655))

(assert (=> b!721988 m!676641))

(assert (=> b!721988 m!676641))

(declare-fun m!676657 () Bool)

(assert (=> b!721988 m!676657))

(assert (=> b!721988 m!676657))

(assert (=> b!721988 m!676641))

(declare-fun m!676659 () Bool)

(assert (=> b!721988 m!676659))

(assert (=> b!721983 m!676641))

(assert (=> b!721983 m!676641))

(declare-fun m!676661 () Bool)

(assert (=> b!721983 m!676661))

(assert (=> b!721986 m!676641))

(assert (=> b!721986 m!676641))

(declare-fun m!676663 () Bool)

(assert (=> b!721986 m!676663))

(check-sat (not start!64284) (not b!721989) (not b!721980) (not b!721983) (not b!721986) (not b!721988) (not b!721977) (not b!721984) (not b!721981) (not b!721982))
(check-sat)
