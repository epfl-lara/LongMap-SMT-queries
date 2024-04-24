; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63996 () Bool)

(assert start!63996)

(declare-fun b!718550 () Bool)

(declare-fun res!480887 () Bool)

(declare-fun e!403471 () Bool)

(assert (=> b!718550 (=> (not res!480887) (not e!403471))))

(declare-datatypes ((array!40669 0))(
  ( (array!40670 (arr!19459 (Array (_ BitVec 32) (_ BitVec 64))) (size!19879 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40669)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!718550 (= res!480887 (and (= (size!19879 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19879 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19879 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!718551 () Bool)

(declare-fun res!480881 () Bool)

(assert (=> b!718551 (=> (not res!480881) (not e!403471))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!718551 (= res!480881 (validKeyInArray!0 (select (arr!19459 a!3186) j!159)))))

(declare-fun b!718552 () Bool)

(declare-fun e!403472 () Bool)

(assert (=> b!718552 (= e!403471 e!403472)))

(declare-fun res!480882 () Bool)

(assert (=> b!718552 (=> (not res!480882) (not e!403472))))

(declare-datatypes ((SeekEntryResult!7015 0))(
  ( (MissingZero!7015 (index!30428 (_ BitVec 32))) (Found!7015 (index!30429 (_ BitVec 32))) (Intermediate!7015 (undefined!7827 Bool) (index!30430 (_ BitVec 32)) (x!61598 (_ BitVec 32))) (Undefined!7015) (MissingVacant!7015 (index!30431 (_ BitVec 32))) )
))
(declare-fun lt!319446 () SeekEntryResult!7015)

(assert (=> b!718552 (= res!480882 (or (= lt!319446 (MissingZero!7015 i!1173)) (= lt!319446 (MissingVacant!7015 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40669 (_ BitVec 32)) SeekEntryResult!7015)

(assert (=> b!718552 (= lt!319446 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!718553 () Bool)

(declare-fun res!480884 () Bool)

(assert (=> b!718553 (=> (not res!480884) (not e!403472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40669 (_ BitVec 32)) Bool)

(assert (=> b!718553 (= res!480884 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!480885 () Bool)

(assert (=> start!63996 (=> (not res!480885) (not e!403471))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63996 (= res!480885 (validMask!0 mask!3328))))

(assert (=> start!63996 e!403471))

(assert (=> start!63996 true))

(declare-fun array_inv!15318 (array!40669) Bool)

(assert (=> start!63996 (array_inv!15318 a!3186)))

(declare-fun b!718554 () Bool)

(declare-fun res!480886 () Bool)

(assert (=> b!718554 (=> (not res!480886) (not e!403471))))

(declare-fun arrayContainsKey!0 (array!40669 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!718554 (= res!480886 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!718555 () Bool)

(assert (=> b!718555 (= e!403472 false)))

(declare-fun lt!319445 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!718555 (= lt!319445 (toIndex!0 (select (arr!19459 a!3186) j!159) mask!3328))))

(declare-fun b!718556 () Bool)

(declare-fun res!480889 () Bool)

(assert (=> b!718556 (=> (not res!480889) (not e!403471))))

(assert (=> b!718556 (= res!480889 (validKeyInArray!0 k0!2102))))

(declare-fun b!718557 () Bool)

(declare-fun res!480883 () Bool)

(assert (=> b!718557 (=> (not res!480883) (not e!403472))))

(declare-datatypes ((List!13368 0))(
  ( (Nil!13365) (Cons!13364 (h!14412 (_ BitVec 64)) (t!19675 List!13368)) )
))
(declare-fun arrayNoDuplicates!0 (array!40669 (_ BitVec 32) List!13368) Bool)

(assert (=> b!718557 (= res!480883 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13365))))

(declare-fun b!718558 () Bool)

(declare-fun res!480888 () Bool)

(assert (=> b!718558 (=> (not res!480888) (not e!403472))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!718558 (= res!480888 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19879 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19879 a!3186))))))

(assert (= (and start!63996 res!480885) b!718550))

(assert (= (and b!718550 res!480887) b!718551))

(assert (= (and b!718551 res!480881) b!718556))

(assert (= (and b!718556 res!480889) b!718554))

(assert (= (and b!718554 res!480886) b!718552))

(assert (= (and b!718552 res!480882) b!718553))

(assert (= (and b!718553 res!480884) b!718557))

(assert (= (and b!718557 res!480883) b!718558))

(assert (= (and b!718558 res!480888) b!718555))

(declare-fun m!674769 () Bool)

(assert (=> b!718555 m!674769))

(assert (=> b!718555 m!674769))

(declare-fun m!674771 () Bool)

(assert (=> b!718555 m!674771))

(declare-fun m!674773 () Bool)

(assert (=> b!718553 m!674773))

(declare-fun m!674775 () Bool)

(assert (=> b!718557 m!674775))

(declare-fun m!674777 () Bool)

(assert (=> start!63996 m!674777))

(declare-fun m!674779 () Bool)

(assert (=> start!63996 m!674779))

(declare-fun m!674781 () Bool)

(assert (=> b!718552 m!674781))

(declare-fun m!674783 () Bool)

(assert (=> b!718554 m!674783))

(declare-fun m!674785 () Bool)

(assert (=> b!718556 m!674785))

(assert (=> b!718551 m!674769))

(assert (=> b!718551 m!674769))

(declare-fun m!674787 () Bool)

(assert (=> b!718551 m!674787))

(check-sat (not b!718554) (not start!63996) (not b!718552) (not b!718556) (not b!718551) (not b!718555) (not b!718557) (not b!718553))
(check-sat)
