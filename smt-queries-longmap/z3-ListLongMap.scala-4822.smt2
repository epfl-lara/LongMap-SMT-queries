; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66274 () Bool)

(assert start!66274)

(declare-fun b!763666 () Bool)

(declare-fun res!516607 () Bool)

(declare-fun e!425452 () Bool)

(assert (=> b!763666 (=> (not res!516607) (not e!425452))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42179 0))(
  ( (array!42180 (arr!20197 (Array (_ BitVec 32) (_ BitVec 64))) (size!20618 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42179)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763666 (= res!516607 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20197 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763667 () Bool)

(declare-fun res!516616 () Bool)

(declare-fun e!425451 () Bool)

(assert (=> b!763667 (=> (not res!516616) (not e!425451))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763667 (= res!516616 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20618 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20618 a!3186))))))

(declare-fun b!763668 () Bool)

(assert (=> b!763668 (= e!425452 false)))

(declare-fun lt!339888 () array!42179)

(declare-datatypes ((SeekEntryResult!7797 0))(
  ( (MissingZero!7797 (index!33556 (_ BitVec 32))) (Found!7797 (index!33557 (_ BitVec 32))) (Intermediate!7797 (undefined!8609 Bool) (index!33558 (_ BitVec 32)) (x!64457 (_ BitVec 32))) (Undefined!7797) (MissingVacant!7797 (index!33559 (_ BitVec 32))) )
))
(declare-fun lt!339889 () SeekEntryResult!7797)

(declare-fun lt!339890 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42179 (_ BitVec 32)) SeekEntryResult!7797)

(assert (=> b!763668 (= lt!339889 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339890 lt!339888 mask!3328))))

(declare-fun lt!339892 () SeekEntryResult!7797)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763668 (= lt!339892 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339890 mask!3328) lt!339890 lt!339888 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!763668 (= lt!339890 (select (store (arr!20197 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!763668 (= lt!339888 (array!42180 (store (arr!20197 a!3186) i!1173 k0!2102) (size!20618 a!3186)))))

(declare-fun b!763669 () Bool)

(declare-fun res!516605 () Bool)

(assert (=> b!763669 (=> (not res!516605) (not e!425451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42179 (_ BitVec 32)) Bool)

(assert (=> b!763669 (= res!516605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763670 () Bool)

(declare-fun res!516614 () Bool)

(declare-fun e!425453 () Bool)

(assert (=> b!763670 (=> (not res!516614) (not e!425453))))

(declare-fun arrayContainsKey!0 (array!42179 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763670 (= res!516614 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!425454 () Bool)

(declare-fun b!763671 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42179 (_ BitVec 32)) SeekEntryResult!7797)

(assert (=> b!763671 (= e!425454 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20197 a!3186) j!159) a!3186 mask!3328) (Found!7797 j!159)))))

(declare-fun b!763673 () Bool)

(declare-fun res!516609 () Bool)

(assert (=> b!763673 (=> (not res!516609) (not e!425453))))

(assert (=> b!763673 (= res!516609 (and (= (size!20618 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20618 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20618 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763674 () Bool)

(assert (=> b!763674 (= e!425451 e!425452)))

(declare-fun res!516612 () Bool)

(assert (=> b!763674 (=> (not res!516612) (not e!425452))))

(declare-fun lt!339893 () SeekEntryResult!7797)

(assert (=> b!763674 (= res!516612 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20197 a!3186) j!159) mask!3328) (select (arr!20197 a!3186) j!159) a!3186 mask!3328) lt!339893))))

(assert (=> b!763674 (= lt!339893 (Intermediate!7797 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763675 () Bool)

(assert (=> b!763675 (= e!425454 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20197 a!3186) j!159) a!3186 mask!3328) lt!339893))))

(declare-fun b!763672 () Bool)

(assert (=> b!763672 (= e!425453 e!425451)))

(declare-fun res!516610 () Bool)

(assert (=> b!763672 (=> (not res!516610) (not e!425451))))

(declare-fun lt!339891 () SeekEntryResult!7797)

(assert (=> b!763672 (= res!516610 (or (= lt!339891 (MissingZero!7797 i!1173)) (= lt!339891 (MissingVacant!7797 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42179 (_ BitVec 32)) SeekEntryResult!7797)

(assert (=> b!763672 (= lt!339891 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!516606 () Bool)

(assert (=> start!66274 (=> (not res!516606) (not e!425453))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66274 (= res!516606 (validMask!0 mask!3328))))

(assert (=> start!66274 e!425453))

(assert (=> start!66274 true))

(declare-fun array_inv!15993 (array!42179) Bool)

(assert (=> start!66274 (array_inv!15993 a!3186)))

(declare-fun b!763676 () Bool)

(declare-fun res!516613 () Bool)

(assert (=> b!763676 (=> (not res!516613) (not e!425451))))

(declare-datatypes ((List!14199 0))(
  ( (Nil!14196) (Cons!14195 (h!15279 (_ BitVec 64)) (t!20514 List!14199)) )
))
(declare-fun arrayNoDuplicates!0 (array!42179 (_ BitVec 32) List!14199) Bool)

(assert (=> b!763676 (= res!516613 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14196))))

(declare-fun b!763677 () Bool)

(declare-fun res!516611 () Bool)

(assert (=> b!763677 (=> (not res!516611) (not e!425453))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763677 (= res!516611 (validKeyInArray!0 k0!2102))))

(declare-fun b!763678 () Bool)

(declare-fun res!516608 () Bool)

(assert (=> b!763678 (=> (not res!516608) (not e!425453))))

(assert (=> b!763678 (= res!516608 (validKeyInArray!0 (select (arr!20197 a!3186) j!159)))))

(declare-fun b!763679 () Bool)

(declare-fun res!516615 () Bool)

(assert (=> b!763679 (=> (not res!516615) (not e!425452))))

(assert (=> b!763679 (= res!516615 e!425454)))

(declare-fun c!83917 () Bool)

(assert (=> b!763679 (= c!83917 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66274 res!516606) b!763673))

(assert (= (and b!763673 res!516609) b!763678))

(assert (= (and b!763678 res!516608) b!763677))

(assert (= (and b!763677 res!516611) b!763670))

(assert (= (and b!763670 res!516614) b!763672))

(assert (= (and b!763672 res!516610) b!763669))

(assert (= (and b!763669 res!516605) b!763676))

(assert (= (and b!763676 res!516613) b!763667))

(assert (= (and b!763667 res!516616) b!763674))

(assert (= (and b!763674 res!516612) b!763666))

(assert (= (and b!763666 res!516607) b!763679))

(assert (= (and b!763679 c!83917) b!763675))

(assert (= (and b!763679 (not c!83917)) b!763671))

(assert (= (and b!763679 res!516615) b!763668))

(declare-fun m!710123 () Bool)

(assert (=> b!763677 m!710123))

(declare-fun m!710125 () Bool)

(assert (=> start!66274 m!710125))

(declare-fun m!710127 () Bool)

(assert (=> start!66274 m!710127))

(declare-fun m!710129 () Bool)

(assert (=> b!763670 m!710129))

(declare-fun m!710131 () Bool)

(assert (=> b!763678 m!710131))

(assert (=> b!763678 m!710131))

(declare-fun m!710133 () Bool)

(assert (=> b!763678 m!710133))

(declare-fun m!710135 () Bool)

(assert (=> b!763668 m!710135))

(declare-fun m!710137 () Bool)

(assert (=> b!763668 m!710137))

(declare-fun m!710139 () Bool)

(assert (=> b!763668 m!710139))

(declare-fun m!710141 () Bool)

(assert (=> b!763668 m!710141))

(assert (=> b!763668 m!710141))

(declare-fun m!710143 () Bool)

(assert (=> b!763668 m!710143))

(declare-fun m!710145 () Bool)

(assert (=> b!763676 m!710145))

(assert (=> b!763674 m!710131))

(assert (=> b!763674 m!710131))

(declare-fun m!710147 () Bool)

(assert (=> b!763674 m!710147))

(assert (=> b!763674 m!710147))

(assert (=> b!763674 m!710131))

(declare-fun m!710149 () Bool)

(assert (=> b!763674 m!710149))

(assert (=> b!763675 m!710131))

(assert (=> b!763675 m!710131))

(declare-fun m!710151 () Bool)

(assert (=> b!763675 m!710151))

(assert (=> b!763671 m!710131))

(assert (=> b!763671 m!710131))

(declare-fun m!710153 () Bool)

(assert (=> b!763671 m!710153))

(declare-fun m!710155 () Bool)

(assert (=> b!763669 m!710155))

(declare-fun m!710157 () Bool)

(assert (=> b!763666 m!710157))

(declare-fun m!710159 () Bool)

(assert (=> b!763672 m!710159))

(check-sat (not b!763677) (not b!763675) (not b!763676) (not b!763669) (not b!763670) (not b!763668) (not b!763672) (not b!763674) (not start!66274) (not b!763671) (not b!763678))
(check-sat)
