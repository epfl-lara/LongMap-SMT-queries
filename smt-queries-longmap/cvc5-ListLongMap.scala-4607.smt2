; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64276 () Bool)

(assert start!64276)

(declare-fun b!721814 () Bool)

(declare-fun res!483625 () Bool)

(declare-fun e!404702 () Bool)

(assert (=> b!721814 (=> (not res!483625) (not e!404702))))

(declare-fun e!404705 () Bool)

(assert (=> b!721814 (= res!483625 e!404705)))

(declare-fun c!79471 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!721814 (= c!79471 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!721815 () Bool)

(declare-fun e!404703 () Bool)

(declare-fun e!404701 () Bool)

(assert (=> b!721815 (= e!404703 e!404701)))

(declare-fun res!483618 () Bool)

(assert (=> b!721815 (=> (not res!483618) (not e!404701))))

(declare-datatypes ((SeekEntryResult!7151 0))(
  ( (MissingZero!7151 (index!30972 (_ BitVec 32))) (Found!7151 (index!30973 (_ BitVec 32))) (Intermediate!7151 (undefined!7963 Bool) (index!30974 (_ BitVec 32)) (x!61984 (_ BitVec 32))) (Undefined!7151) (MissingVacant!7151 (index!30975 (_ BitVec 32))) )
))
(declare-fun lt!320161 () SeekEntryResult!7151)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!721815 (= res!483618 (or (= lt!320161 (MissingZero!7151 i!1173)) (= lt!320161 (MissingVacant!7151 i!1173))))))

(declare-datatypes ((array!40857 0))(
  ( (array!40858 (arr!19551 (Array (_ BitVec 32) (_ BitVec 64))) (size!19972 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40857)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40857 (_ BitVec 32)) SeekEntryResult!7151)

(assert (=> b!721815 (= lt!320161 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!721816 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40857 (_ BitVec 32)) SeekEntryResult!7151)

(assert (=> b!721816 (= e!404705 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19551 a!3186) j!159) a!3186 mask!3328) (Found!7151 j!159)))))

(declare-fun b!721817 () Bool)

(declare-fun res!483615 () Bool)

(assert (=> b!721817 (=> (not res!483615) (not e!404703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!721817 (= res!483615 (validKeyInArray!0 k!2102))))

(declare-fun b!721818 () Bool)

(declare-fun res!483626 () Bool)

(assert (=> b!721818 (=> (not res!483626) (not e!404701))))

(assert (=> b!721818 (= res!483626 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19972 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19972 a!3186))))))

(declare-fun b!721819 () Bool)

(assert (=> b!721819 (= e!404701 e!404702)))

(declare-fun res!483619 () Bool)

(assert (=> b!721819 (=> (not res!483619) (not e!404702))))

(declare-fun lt!320162 () SeekEntryResult!7151)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40857 (_ BitVec 32)) SeekEntryResult!7151)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!721819 (= res!483619 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19551 a!3186) j!159) mask!3328) (select (arr!19551 a!3186) j!159) a!3186 mask!3328) lt!320162))))

(assert (=> b!721819 (= lt!320162 (Intermediate!7151 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!721820 () Bool)

(declare-fun res!483623 () Bool)

(assert (=> b!721820 (=> (not res!483623) (not e!404702))))

(assert (=> b!721820 (= res!483623 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19551 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!721821 () Bool)

(declare-fun res!483621 () Bool)

(assert (=> b!721821 (=> (not res!483621) (not e!404703))))

(assert (=> b!721821 (= res!483621 (validKeyInArray!0 (select (arr!19551 a!3186) j!159)))))

(declare-fun b!721822 () Bool)

(assert (=> b!721822 (= e!404705 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19551 a!3186) j!159) a!3186 mask!3328) lt!320162))))

(declare-fun b!721823 () Bool)

(declare-fun res!483617 () Bool)

(assert (=> b!721823 (=> (not res!483617) (not e!404701))))

(declare-datatypes ((List!13553 0))(
  ( (Nil!13550) (Cons!13549 (h!14603 (_ BitVec 64)) (t!19868 List!13553)) )
))
(declare-fun arrayNoDuplicates!0 (array!40857 (_ BitVec 32) List!13553) Bool)

(assert (=> b!721823 (= res!483617 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13550))))

(declare-fun res!483624 () Bool)

(assert (=> start!64276 (=> (not res!483624) (not e!404703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64276 (= res!483624 (validMask!0 mask!3328))))

(assert (=> start!64276 e!404703))

(assert (=> start!64276 true))

(declare-fun array_inv!15347 (array!40857) Bool)

(assert (=> start!64276 (array_inv!15347 a!3186)))

(declare-fun b!721824 () Bool)

(declare-fun res!483622 () Bool)

(assert (=> b!721824 (=> (not res!483622) (not e!404701))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40857 (_ BitVec 32)) Bool)

(assert (=> b!721824 (= res!483622 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!721825 () Bool)

(declare-fun res!483616 () Bool)

(assert (=> b!721825 (=> (not res!483616) (not e!404703))))

(declare-fun arrayContainsKey!0 (array!40857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!721825 (= res!483616 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!721826 () Bool)

(assert (=> b!721826 (= e!404702 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun b!721827 () Bool)

(declare-fun res!483620 () Bool)

(assert (=> b!721827 (=> (not res!483620) (not e!404703))))

(assert (=> b!721827 (= res!483620 (and (= (size!19972 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19972 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19972 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64276 res!483624) b!721827))

(assert (= (and b!721827 res!483620) b!721821))

(assert (= (and b!721821 res!483621) b!721817))

(assert (= (and b!721817 res!483615) b!721825))

(assert (= (and b!721825 res!483616) b!721815))

(assert (= (and b!721815 res!483618) b!721824))

(assert (= (and b!721824 res!483622) b!721823))

(assert (= (and b!721823 res!483617) b!721818))

(assert (= (and b!721818 res!483626) b!721819))

(assert (= (and b!721819 res!483619) b!721820))

(assert (= (and b!721820 res!483623) b!721814))

(assert (= (and b!721814 c!79471) b!721822))

(assert (= (and b!721814 (not c!79471)) b!721816))

(assert (= (and b!721814 res!483625) b!721826))

(declare-fun m!676525 () Bool)

(assert (=> b!721825 m!676525))

(declare-fun m!676527 () Bool)

(assert (=> start!64276 m!676527))

(declare-fun m!676529 () Bool)

(assert (=> start!64276 m!676529))

(declare-fun m!676531 () Bool)

(assert (=> b!721822 m!676531))

(assert (=> b!721822 m!676531))

(declare-fun m!676533 () Bool)

(assert (=> b!721822 m!676533))

(declare-fun m!676535 () Bool)

(assert (=> b!721817 m!676535))

(assert (=> b!721821 m!676531))

(assert (=> b!721821 m!676531))

(declare-fun m!676537 () Bool)

(assert (=> b!721821 m!676537))

(declare-fun m!676539 () Bool)

(assert (=> b!721815 m!676539))

(assert (=> b!721816 m!676531))

(assert (=> b!721816 m!676531))

(declare-fun m!676541 () Bool)

(assert (=> b!721816 m!676541))

(declare-fun m!676543 () Bool)

(assert (=> b!721824 m!676543))

(declare-fun m!676545 () Bool)

(assert (=> b!721823 m!676545))

(assert (=> b!721819 m!676531))

(assert (=> b!721819 m!676531))

(declare-fun m!676547 () Bool)

(assert (=> b!721819 m!676547))

(assert (=> b!721819 m!676547))

(assert (=> b!721819 m!676531))

(declare-fun m!676549 () Bool)

(assert (=> b!721819 m!676549))

(declare-fun m!676551 () Bool)

(assert (=> b!721820 m!676551))

(push 1)

