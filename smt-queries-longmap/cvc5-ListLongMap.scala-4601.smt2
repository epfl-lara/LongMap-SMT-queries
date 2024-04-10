; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64180 () Bool)

(assert start!64180)

(declare-fun b!720743 () Bool)

(declare-fun e!404228 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!720743 (= e!404228 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-datatypes ((array!40818 0))(
  ( (array!40819 (arr!19533 (Array (_ BitVec 32) (_ BitVec 64))) (size!19954 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40818)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun lt!319881 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720743 (= lt!319881 (toIndex!0 (select (store (arr!19533 a!3186) i!1173 k!2102) j!159) mask!3328))))

(declare-fun b!720744 () Bool)

(declare-fun res!482870 () Bool)

(declare-fun e!404229 () Bool)

(assert (=> b!720744 (=> (not res!482870) (not e!404229))))

(declare-datatypes ((List!13535 0))(
  ( (Nil!13532) (Cons!13531 (h!14582 (_ BitVec 64)) (t!19850 List!13535)) )
))
(declare-fun arrayNoDuplicates!0 (array!40818 (_ BitVec 32) List!13535) Bool)

(assert (=> b!720744 (= res!482870 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13532))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!720745 () Bool)

(declare-fun e!404231 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7133 0))(
  ( (MissingZero!7133 (index!30900 (_ BitVec 32))) (Found!7133 (index!30901 (_ BitVec 32))) (Intermediate!7133 (undefined!7945 Bool) (index!30902 (_ BitVec 32)) (x!61909 (_ BitVec 32))) (Undefined!7133) (MissingVacant!7133 (index!30903 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40818 (_ BitVec 32)) SeekEntryResult!7133)

(assert (=> b!720745 (= e!404231 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19533 a!3186) j!159) a!3186 mask!3328) (Found!7133 j!159)))))

(declare-fun b!720746 () Bool)

(assert (=> b!720746 (= e!404229 e!404228)))

(declare-fun res!482867 () Bool)

(assert (=> b!720746 (=> (not res!482867) (not e!404228))))

(declare-fun lt!319883 () SeekEntryResult!7133)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40818 (_ BitVec 32)) SeekEntryResult!7133)

(assert (=> b!720746 (= res!482867 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19533 a!3186) j!159) mask!3328) (select (arr!19533 a!3186) j!159) a!3186 mask!3328) lt!319883))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720746 (= lt!319883 (Intermediate!7133 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!482871 () Bool)

(declare-fun e!404227 () Bool)

(assert (=> start!64180 (=> (not res!482871) (not e!404227))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64180 (= res!482871 (validMask!0 mask!3328))))

(assert (=> start!64180 e!404227))

(assert (=> start!64180 true))

(declare-fun array_inv!15329 (array!40818) Bool)

(assert (=> start!64180 (array_inv!15329 a!3186)))

(declare-fun b!720747 () Bool)

(declare-fun res!482868 () Bool)

(assert (=> b!720747 (=> (not res!482868) (not e!404227))))

(declare-fun arrayContainsKey!0 (array!40818 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720747 (= res!482868 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720748 () Bool)

(declare-fun res!482873 () Bool)

(assert (=> b!720748 (=> (not res!482873) (not e!404229))))

(assert (=> b!720748 (= res!482873 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19954 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19954 a!3186))))))

(declare-fun b!720749 () Bool)

(declare-fun res!482874 () Bool)

(assert (=> b!720749 (=> (not res!482874) (not e!404227))))

(assert (=> b!720749 (= res!482874 (and (= (size!19954 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19954 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19954 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720750 () Bool)

(assert (=> b!720750 (= e!404227 e!404229)))

(declare-fun res!482869 () Bool)

(assert (=> b!720750 (=> (not res!482869) (not e!404229))))

(declare-fun lt!319882 () SeekEntryResult!7133)

(assert (=> b!720750 (= res!482869 (or (= lt!319882 (MissingZero!7133 i!1173)) (= lt!319882 (MissingVacant!7133 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40818 (_ BitVec 32)) SeekEntryResult!7133)

(assert (=> b!720750 (= lt!319882 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720751 () Bool)

(declare-fun res!482875 () Bool)

(assert (=> b!720751 (=> (not res!482875) (not e!404229))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40818 (_ BitVec 32)) Bool)

(assert (=> b!720751 (= res!482875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720752 () Bool)

(assert (=> b!720752 (= e!404231 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19533 a!3186) j!159) a!3186 mask!3328) lt!319883))))

(declare-fun b!720753 () Bool)

(declare-fun res!482865 () Bool)

(assert (=> b!720753 (=> (not res!482865) (not e!404228))))

(assert (=> b!720753 (= res!482865 e!404231)))

(declare-fun c!79309 () Bool)

(assert (=> b!720753 (= c!79309 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720754 () Bool)

(declare-fun res!482876 () Bool)

(assert (=> b!720754 (=> (not res!482876) (not e!404227))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720754 (= res!482876 (validKeyInArray!0 k!2102))))

(declare-fun b!720755 () Bool)

(declare-fun res!482872 () Bool)

(assert (=> b!720755 (=> (not res!482872) (not e!404228))))

(assert (=> b!720755 (= res!482872 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19533 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720756 () Bool)

(declare-fun res!482866 () Bool)

(assert (=> b!720756 (=> (not res!482866) (not e!404227))))

(assert (=> b!720756 (= res!482866 (validKeyInArray!0 (select (arr!19533 a!3186) j!159)))))

(assert (= (and start!64180 res!482871) b!720749))

(assert (= (and b!720749 res!482874) b!720756))

(assert (= (and b!720756 res!482866) b!720754))

(assert (= (and b!720754 res!482876) b!720747))

(assert (= (and b!720747 res!482868) b!720750))

(assert (= (and b!720750 res!482869) b!720751))

(assert (= (and b!720751 res!482875) b!720744))

(assert (= (and b!720744 res!482870) b!720748))

(assert (= (and b!720748 res!482873) b!720746))

(assert (= (and b!720746 res!482867) b!720755))

(assert (= (and b!720755 res!482872) b!720753))

(assert (= (and b!720753 c!79309) b!720752))

(assert (= (and b!720753 (not c!79309)) b!720745))

(assert (= (and b!720753 res!482865) b!720743))

(declare-fun m!675763 () Bool)

(assert (=> start!64180 m!675763))

(declare-fun m!675765 () Bool)

(assert (=> start!64180 m!675765))

(declare-fun m!675767 () Bool)

(assert (=> b!720747 m!675767))

(declare-fun m!675769 () Bool)

(assert (=> b!720744 m!675769))

(declare-fun m!675771 () Bool)

(assert (=> b!720755 m!675771))

(declare-fun m!675773 () Bool)

(assert (=> b!720743 m!675773))

(declare-fun m!675775 () Bool)

(assert (=> b!720743 m!675775))

(assert (=> b!720743 m!675775))

(declare-fun m!675777 () Bool)

(assert (=> b!720743 m!675777))

(declare-fun m!675779 () Bool)

(assert (=> b!720745 m!675779))

(assert (=> b!720745 m!675779))

(declare-fun m!675781 () Bool)

(assert (=> b!720745 m!675781))

(assert (=> b!720746 m!675779))

(assert (=> b!720746 m!675779))

(declare-fun m!675783 () Bool)

(assert (=> b!720746 m!675783))

(assert (=> b!720746 m!675783))

(assert (=> b!720746 m!675779))

(declare-fun m!675785 () Bool)

(assert (=> b!720746 m!675785))

(declare-fun m!675787 () Bool)

(assert (=> b!720754 m!675787))

(declare-fun m!675789 () Bool)

(assert (=> b!720751 m!675789))

(assert (=> b!720756 m!675779))

(assert (=> b!720756 m!675779))

(declare-fun m!675791 () Bool)

(assert (=> b!720756 m!675791))

(assert (=> b!720752 m!675779))

(assert (=> b!720752 m!675779))

(declare-fun m!675793 () Bool)

(assert (=> b!720752 m!675793))

(declare-fun m!675795 () Bool)

(assert (=> b!720750 m!675795))

(push 1)

