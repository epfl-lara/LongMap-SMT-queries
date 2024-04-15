; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64166 () Bool)

(assert start!64166)

(declare-fun b!720619 () Bool)

(declare-fun res!482873 () Bool)

(declare-fun e!404120 () Bool)

(assert (=> b!720619 (=> (not res!482873) (not e!404120))))

(declare-datatypes ((array!40821 0))(
  ( (array!40822 (arr!19535 (Array (_ BitVec 32) (_ BitVec 64))) (size!19956 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40821)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720619 (= res!482873 (and (= (size!19956 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19956 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19956 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720620 () Bool)

(declare-fun e!404121 () Bool)

(assert (=> b!720620 (= e!404121 false)))

(declare-fun lt!319670 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720620 (= lt!319670 (toIndex!0 (select (store (arr!19535 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun res!482872 () Bool)

(assert (=> start!64166 (=> (not res!482872) (not e!404120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64166 (= res!482872 (validMask!0 mask!3328))))

(assert (=> start!64166 e!404120))

(assert (=> start!64166 true))

(declare-fun array_inv!15418 (array!40821) Bool)

(assert (=> start!64166 (array_inv!15418 a!3186)))

(declare-fun b!720621 () Bool)

(declare-fun res!482866 () Bool)

(declare-fun e!404122 () Bool)

(assert (=> b!720621 (=> (not res!482866) (not e!404122))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720621 (= res!482866 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19956 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19956 a!3186))))))

(declare-fun b!720622 () Bool)

(declare-fun res!482871 () Bool)

(assert (=> b!720622 (=> (not res!482871) (not e!404121))))

(assert (=> b!720622 (= res!482871 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19535 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720623 () Bool)

(assert (=> b!720623 (= e!404120 e!404122)))

(declare-fun res!482863 () Bool)

(assert (=> b!720623 (=> (not res!482863) (not e!404122))))

(declare-datatypes ((SeekEntryResult!7132 0))(
  ( (MissingZero!7132 (index!30896 (_ BitVec 32))) (Found!7132 (index!30897 (_ BitVec 32))) (Intermediate!7132 (undefined!7944 Bool) (index!30898 (_ BitVec 32)) (x!61911 (_ BitVec 32))) (Undefined!7132) (MissingVacant!7132 (index!30899 (_ BitVec 32))) )
))
(declare-fun lt!319668 () SeekEntryResult!7132)

(assert (=> b!720623 (= res!482863 (or (= lt!319668 (MissingZero!7132 i!1173)) (= lt!319668 (MissingVacant!7132 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40821 (_ BitVec 32)) SeekEntryResult!7132)

(assert (=> b!720623 (= lt!319668 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720624 () Bool)

(declare-fun res!482870 () Bool)

(assert (=> b!720624 (=> (not res!482870) (not e!404122))))

(declare-datatypes ((List!13576 0))(
  ( (Nil!13573) (Cons!13572 (h!14623 (_ BitVec 64)) (t!19882 List!13576)) )
))
(declare-fun arrayNoDuplicates!0 (array!40821 (_ BitVec 32) List!13576) Bool)

(assert (=> b!720624 (= res!482870 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13573))))

(declare-fun b!720625 () Bool)

(declare-fun res!482868 () Bool)

(assert (=> b!720625 (=> (not res!482868) (not e!404120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720625 (= res!482868 (validKeyInArray!0 (select (arr!19535 a!3186) j!159)))))

(declare-fun e!404118 () Bool)

(declare-fun b!720626 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40821 (_ BitVec 32)) SeekEntryResult!7132)

(assert (=> b!720626 (= e!404118 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19535 a!3186) j!159) a!3186 mask!3328) (Found!7132 j!159)))))

(declare-fun b!720627 () Bool)

(declare-fun res!482864 () Bool)

(assert (=> b!720627 (=> (not res!482864) (not e!404121))))

(assert (=> b!720627 (= res!482864 e!404118)))

(declare-fun c!79248 () Bool)

(assert (=> b!720627 (= c!79248 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!720628 () Bool)

(declare-fun res!482865 () Bool)

(assert (=> b!720628 (=> (not res!482865) (not e!404120))))

(declare-fun arrayContainsKey!0 (array!40821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720628 (= res!482865 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720629 () Bool)

(declare-fun lt!319669 () SeekEntryResult!7132)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40821 (_ BitVec 32)) SeekEntryResult!7132)

(assert (=> b!720629 (= e!404118 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19535 a!3186) j!159) a!3186 mask!3328) lt!319669))))

(declare-fun b!720630 () Bool)

(declare-fun res!482867 () Bool)

(assert (=> b!720630 (=> (not res!482867) (not e!404122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40821 (_ BitVec 32)) Bool)

(assert (=> b!720630 (= res!482867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720631 () Bool)

(assert (=> b!720631 (= e!404122 e!404121)))

(declare-fun res!482874 () Bool)

(assert (=> b!720631 (=> (not res!482874) (not e!404121))))

(assert (=> b!720631 (= res!482874 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19535 a!3186) j!159) mask!3328) (select (arr!19535 a!3186) j!159) a!3186 mask!3328) lt!319669))))

(assert (=> b!720631 (= lt!319669 (Intermediate!7132 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720632 () Bool)

(declare-fun res!482869 () Bool)

(assert (=> b!720632 (=> (not res!482869) (not e!404120))))

(assert (=> b!720632 (= res!482869 (validKeyInArray!0 k0!2102))))

(assert (= (and start!64166 res!482872) b!720619))

(assert (= (and b!720619 res!482873) b!720625))

(assert (= (and b!720625 res!482868) b!720632))

(assert (= (and b!720632 res!482869) b!720628))

(assert (= (and b!720628 res!482865) b!720623))

(assert (= (and b!720623 res!482863) b!720630))

(assert (= (and b!720630 res!482867) b!720624))

(assert (= (and b!720624 res!482870) b!720621))

(assert (= (and b!720621 res!482866) b!720631))

(assert (= (and b!720631 res!482874) b!720622))

(assert (= (and b!720622 res!482871) b!720627))

(assert (= (and b!720627 c!79248) b!720629))

(assert (= (and b!720627 (not c!79248)) b!720626))

(assert (= (and b!720627 res!482864) b!720620))

(declare-fun m!675107 () Bool)

(assert (=> b!720624 m!675107))

(declare-fun m!675109 () Bool)

(assert (=> start!64166 m!675109))

(declare-fun m!675111 () Bool)

(assert (=> start!64166 m!675111))

(declare-fun m!675113 () Bool)

(assert (=> b!720623 m!675113))

(declare-fun m!675115 () Bool)

(assert (=> b!720622 m!675115))

(declare-fun m!675117 () Bool)

(assert (=> b!720620 m!675117))

(declare-fun m!675119 () Bool)

(assert (=> b!720620 m!675119))

(assert (=> b!720620 m!675119))

(declare-fun m!675121 () Bool)

(assert (=> b!720620 m!675121))

(declare-fun m!675123 () Bool)

(assert (=> b!720628 m!675123))

(declare-fun m!675125 () Bool)

(assert (=> b!720632 m!675125))

(declare-fun m!675127 () Bool)

(assert (=> b!720631 m!675127))

(assert (=> b!720631 m!675127))

(declare-fun m!675129 () Bool)

(assert (=> b!720631 m!675129))

(assert (=> b!720631 m!675129))

(assert (=> b!720631 m!675127))

(declare-fun m!675131 () Bool)

(assert (=> b!720631 m!675131))

(assert (=> b!720629 m!675127))

(assert (=> b!720629 m!675127))

(declare-fun m!675133 () Bool)

(assert (=> b!720629 m!675133))

(declare-fun m!675135 () Bool)

(assert (=> b!720630 m!675135))

(assert (=> b!720625 m!675127))

(assert (=> b!720625 m!675127))

(declare-fun m!675137 () Bool)

(assert (=> b!720625 m!675137))

(assert (=> b!720626 m!675127))

(assert (=> b!720626 m!675127))

(declare-fun m!675139 () Bool)

(assert (=> b!720626 m!675139))

(check-sat (not b!720626) (not b!720623) (not b!720629) (not b!720632) (not start!64166) (not b!720631) (not b!720625) (not b!720628) (not b!720620) (not b!720630) (not b!720624))
(check-sat)
