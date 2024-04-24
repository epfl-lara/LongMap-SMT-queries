; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64152 () Bool)

(assert start!64152)

(declare-fun res!482451 () Bool)

(declare-fun e!404065 () Bool)

(assert (=> start!64152 (=> (not res!482451) (not e!404065))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64152 (= res!482451 (validMask!0 mask!3328))))

(assert (=> start!64152 e!404065))

(assert (=> start!64152 true))

(declare-datatypes ((array!40780 0))(
  ( (array!40781 (arr!19513 (Array (_ BitVec 32) (_ BitVec 64))) (size!19933 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40780)

(declare-fun array_inv!15372 (array!40780) Bool)

(assert (=> start!64152 (array_inv!15372 a!3186)))

(declare-fun b!720206 () Bool)

(declare-fun res!482455 () Bool)

(assert (=> b!720206 (=> (not res!482455) (not e!404065))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720206 (= res!482455 (validKeyInArray!0 k0!2102))))

(declare-fun b!720207 () Bool)

(declare-fun e!404066 () Bool)

(assert (=> b!720207 (= e!404066 false)))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7069 0))(
  ( (MissingZero!7069 (index!30644 (_ BitVec 32))) (Found!7069 (index!30645 (_ BitVec 32))) (Intermediate!7069 (undefined!7881 Bool) (index!30646 (_ BitVec 32)) (x!61799 (_ BitVec 32))) (Undefined!7069) (MissingVacant!7069 (index!30647 (_ BitVec 32))) )
))
(declare-fun lt!319797 () SeekEntryResult!7069)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40780 (_ BitVec 32)) SeekEntryResult!7069)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720207 (= lt!319797 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19513 a!3186) j!159) mask!3328) (select (arr!19513 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!720208 () Bool)

(declare-fun res!482456 () Bool)

(assert (=> b!720208 (=> (not res!482456) (not e!404066))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720208 (= res!482456 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19933 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19933 a!3186))))))

(declare-fun b!720209 () Bool)

(declare-fun res!482450 () Bool)

(assert (=> b!720209 (=> (not res!482450) (not e!404066))))

(declare-datatypes ((List!13422 0))(
  ( (Nil!13419) (Cons!13418 (h!14469 (_ BitVec 64)) (t!19729 List!13422)) )
))
(declare-fun arrayNoDuplicates!0 (array!40780 (_ BitVec 32) List!13422) Bool)

(assert (=> b!720209 (= res!482450 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13419))))

(declare-fun b!720210 () Bool)

(declare-fun res!482458 () Bool)

(assert (=> b!720210 (=> (not res!482458) (not e!404065))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720210 (= res!482458 (and (= (size!19933 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19933 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19933 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720211 () Bool)

(assert (=> b!720211 (= e!404065 e!404066)))

(declare-fun res!482454 () Bool)

(assert (=> b!720211 (=> (not res!482454) (not e!404066))))

(declare-fun lt!319796 () SeekEntryResult!7069)

(assert (=> b!720211 (= res!482454 (or (= lt!319796 (MissingZero!7069 i!1173)) (= lt!319796 (MissingVacant!7069 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40780 (_ BitVec 32)) SeekEntryResult!7069)

(assert (=> b!720211 (= lt!319796 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!720212 () Bool)

(declare-fun res!482452 () Bool)

(assert (=> b!720212 (=> (not res!482452) (not e!404066))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40780 (_ BitVec 32)) Bool)

(assert (=> b!720212 (= res!482452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720213 () Bool)

(declare-fun res!482453 () Bool)

(assert (=> b!720213 (=> (not res!482453) (not e!404065))))

(assert (=> b!720213 (= res!482453 (validKeyInArray!0 (select (arr!19513 a!3186) j!159)))))

(declare-fun b!720214 () Bool)

(declare-fun res!482457 () Bool)

(assert (=> b!720214 (=> (not res!482457) (not e!404065))))

(declare-fun arrayContainsKey!0 (array!40780 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720214 (= res!482457 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!64152 res!482451) b!720210))

(assert (= (and b!720210 res!482458) b!720213))

(assert (= (and b!720213 res!482453) b!720206))

(assert (= (and b!720206 res!482455) b!720214))

(assert (= (and b!720214 res!482457) b!720211))

(assert (= (and b!720211 res!482454) b!720212))

(assert (= (and b!720212 res!482452) b!720209))

(assert (= (and b!720209 res!482450) b!720208))

(assert (= (and b!720208 res!482456) b!720207))

(declare-fun m!676047 () Bool)

(assert (=> b!720214 m!676047))

(declare-fun m!676049 () Bool)

(assert (=> b!720209 m!676049))

(declare-fun m!676051 () Bool)

(assert (=> start!64152 m!676051))

(declare-fun m!676053 () Bool)

(assert (=> start!64152 m!676053))

(declare-fun m!676055 () Bool)

(assert (=> b!720211 m!676055))

(declare-fun m!676057 () Bool)

(assert (=> b!720206 m!676057))

(declare-fun m!676059 () Bool)

(assert (=> b!720207 m!676059))

(assert (=> b!720207 m!676059))

(declare-fun m!676061 () Bool)

(assert (=> b!720207 m!676061))

(assert (=> b!720207 m!676061))

(assert (=> b!720207 m!676059))

(declare-fun m!676063 () Bool)

(assert (=> b!720207 m!676063))

(assert (=> b!720213 m!676059))

(assert (=> b!720213 m!676059))

(declare-fun m!676065 () Bool)

(assert (=> b!720213 m!676065))

(declare-fun m!676067 () Bool)

(assert (=> b!720212 m!676067))

(check-sat (not b!720207) (not start!64152) (not b!720209) (not b!720211) (not b!720206) (not b!720212) (not b!720213) (not b!720214))
(check-sat)
