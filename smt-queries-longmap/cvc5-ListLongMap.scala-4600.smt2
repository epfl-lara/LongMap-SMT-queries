; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64174 () Bool)

(assert start!64174)

(declare-fun b!720617 () Bool)

(declare-fun e!404185 () Bool)

(assert (=> b!720617 (= e!404185 false)))

(declare-datatypes ((array!40812 0))(
  ( (array!40813 (arr!19530 (Array (_ BitVec 32) (_ BitVec 64))) (size!19951 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40812)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!319854 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720617 (= lt!319854 (toIndex!0 (select (store (arr!19530 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!720618 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!404186 () Bool)

(declare-datatypes ((SeekEntryResult!7130 0))(
  ( (MissingZero!7130 (index!30888 (_ BitVec 32))) (Found!7130 (index!30889 (_ BitVec 32))) (Intermediate!7130 (undefined!7942 Bool) (index!30890 (_ BitVec 32)) (x!61898 (_ BitVec 32))) (Undefined!7130) (MissingVacant!7130 (index!30891 (_ BitVec 32))) )
))
(declare-fun lt!319856 () SeekEntryResult!7130)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40812 (_ BitVec 32)) SeekEntryResult!7130)

(assert (=> b!720618 (= e!404186 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19530 a!3186) j!159) a!3186 mask!3328) lt!319856))))

(declare-fun b!720619 () Bool)

(declare-fun res!482764 () Bool)

(declare-fun e!404182 () Bool)

(assert (=> b!720619 (=> (not res!482764) (not e!404182))))

(declare-datatypes ((List!13532 0))(
  ( (Nil!13529) (Cons!13528 (h!14579 (_ BitVec 64)) (t!19847 List!13532)) )
))
(declare-fun arrayNoDuplicates!0 (array!40812 (_ BitVec 32) List!13532) Bool)

(assert (=> b!720619 (= res!482764 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13529))))

(declare-fun b!720620 () Bool)

(declare-fun res!482765 () Bool)

(assert (=> b!720620 (=> (not res!482765) (not e!404182))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720620 (= res!482765 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19951 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19951 a!3186))))))

(declare-fun b!720621 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40812 (_ BitVec 32)) SeekEntryResult!7130)

(assert (=> b!720621 (= e!404186 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19530 a!3186) j!159) a!3186 mask!3328) (Found!7130 j!159)))))

(declare-fun b!720622 () Bool)

(assert (=> b!720622 (= e!404182 e!404185)))

(declare-fun res!482763 () Bool)

(assert (=> b!720622 (=> (not res!482763) (not e!404185))))

(assert (=> b!720622 (= res!482763 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19530 a!3186) j!159) mask!3328) (select (arr!19530 a!3186) j!159) a!3186 mask!3328) lt!319856))))

(assert (=> b!720622 (= lt!319856 (Intermediate!7130 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720623 () Bool)

(declare-fun res!482758 () Bool)

(declare-fun e!404184 () Bool)

(assert (=> b!720623 (=> (not res!482758) (not e!404184))))

(assert (=> b!720623 (= res!482758 (and (= (size!19951 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19951 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19951 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720624 () Bool)

(declare-fun res!482768 () Bool)

(assert (=> b!720624 (=> (not res!482768) (not e!404184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720624 (= res!482768 (validKeyInArray!0 (select (arr!19530 a!3186) j!159)))))

(declare-fun b!720625 () Bool)

(declare-fun res!482761 () Bool)

(assert (=> b!720625 (=> (not res!482761) (not e!404185))))

(assert (=> b!720625 (= res!482761 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19530 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!482762 () Bool)

(assert (=> start!64174 (=> (not res!482762) (not e!404184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64174 (= res!482762 (validMask!0 mask!3328))))

(assert (=> start!64174 e!404184))

(assert (=> start!64174 true))

(declare-fun array_inv!15326 (array!40812) Bool)

(assert (=> start!64174 (array_inv!15326 a!3186)))

(declare-fun b!720626 () Bool)

(declare-fun res!482759 () Bool)

(assert (=> b!720626 (=> (not res!482759) (not e!404182))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40812 (_ BitVec 32)) Bool)

(assert (=> b!720626 (= res!482759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720627 () Bool)

(declare-fun res!482760 () Bool)

(assert (=> b!720627 (=> (not res!482760) (not e!404184))))

(declare-fun arrayContainsKey!0 (array!40812 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720627 (= res!482760 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720628 () Bool)

(declare-fun res!482766 () Bool)

(assert (=> b!720628 (=> (not res!482766) (not e!404184))))

(assert (=> b!720628 (= res!482766 (validKeyInArray!0 k!2102))))

(declare-fun b!720629 () Bool)

(assert (=> b!720629 (= e!404184 e!404182)))

(declare-fun res!482757 () Bool)

(assert (=> b!720629 (=> (not res!482757) (not e!404182))))

(declare-fun lt!319855 () SeekEntryResult!7130)

(assert (=> b!720629 (= res!482757 (or (= lt!319855 (MissingZero!7130 i!1173)) (= lt!319855 (MissingVacant!7130 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40812 (_ BitVec 32)) SeekEntryResult!7130)

(assert (=> b!720629 (= lt!319855 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720630 () Bool)

(declare-fun res!482767 () Bool)

(assert (=> b!720630 (=> (not res!482767) (not e!404185))))

(assert (=> b!720630 (= res!482767 e!404186)))

(declare-fun c!79300 () Bool)

(assert (=> b!720630 (= c!79300 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!64174 res!482762) b!720623))

(assert (= (and b!720623 res!482758) b!720624))

(assert (= (and b!720624 res!482768) b!720628))

(assert (= (and b!720628 res!482766) b!720627))

(assert (= (and b!720627 res!482760) b!720629))

(assert (= (and b!720629 res!482757) b!720626))

(assert (= (and b!720626 res!482759) b!720619))

(assert (= (and b!720619 res!482764) b!720620))

(assert (= (and b!720620 res!482765) b!720622))

(assert (= (and b!720622 res!482763) b!720625))

(assert (= (and b!720625 res!482761) b!720630))

(assert (= (and b!720630 c!79300) b!720618))

(assert (= (and b!720630 (not c!79300)) b!720621))

(assert (= (and b!720630 res!482767) b!720617))

(declare-fun m!675661 () Bool)

(assert (=> b!720628 m!675661))

(declare-fun m!675663 () Bool)

(assert (=> b!720625 m!675663))

(declare-fun m!675665 () Bool)

(assert (=> b!720624 m!675665))

(assert (=> b!720624 m!675665))

(declare-fun m!675667 () Bool)

(assert (=> b!720624 m!675667))

(declare-fun m!675669 () Bool)

(assert (=> b!720619 m!675669))

(declare-fun m!675671 () Bool)

(assert (=> b!720617 m!675671))

(declare-fun m!675673 () Bool)

(assert (=> b!720617 m!675673))

(assert (=> b!720617 m!675673))

(declare-fun m!675675 () Bool)

(assert (=> b!720617 m!675675))

(assert (=> b!720618 m!675665))

(assert (=> b!720618 m!675665))

(declare-fun m!675677 () Bool)

(assert (=> b!720618 m!675677))

(declare-fun m!675679 () Bool)

(assert (=> start!64174 m!675679))

(declare-fun m!675681 () Bool)

(assert (=> start!64174 m!675681))

(assert (=> b!720622 m!675665))

(assert (=> b!720622 m!675665))

(declare-fun m!675683 () Bool)

(assert (=> b!720622 m!675683))

(assert (=> b!720622 m!675683))

(assert (=> b!720622 m!675665))

(declare-fun m!675685 () Bool)

(assert (=> b!720622 m!675685))

(assert (=> b!720621 m!675665))

(assert (=> b!720621 m!675665))

(declare-fun m!675687 () Bool)

(assert (=> b!720621 m!675687))

(declare-fun m!675689 () Bool)

(assert (=> b!720629 m!675689))

(declare-fun m!675691 () Bool)

(assert (=> b!720627 m!675691))

(declare-fun m!675693 () Bool)

(assert (=> b!720626 m!675693))

(push 1)

