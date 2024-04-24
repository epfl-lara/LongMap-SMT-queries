; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66368 () Bool)

(assert start!66368)

(declare-fun b!763783 () Bool)

(declare-fun res!516436 () Bool)

(declare-fun e!425672 () Bool)

(assert (=> b!763783 (=> (not res!516436) (not e!425672))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763783 (= res!516436 (validKeyInArray!0 k0!2102))))

(declare-fun b!763784 () Bool)

(declare-fun res!516432 () Bool)

(declare-fun e!425671 () Bool)

(assert (=> b!763784 (=> (not res!516432) (not e!425671))))

(declare-fun e!425675 () Bool)

(assert (=> b!763784 (= res!516432 e!425675)))

(declare-fun c!84068 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763784 (= c!84068 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763785 () Bool)

(declare-fun res!516429 () Bool)

(assert (=> b!763785 (=> (not res!516429) (not e!425672))))

(declare-datatypes ((array!42151 0))(
  ( (array!42152 (arr!20179 (Array (_ BitVec 32) (_ BitVec 64))) (size!20599 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42151)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!763785 (= res!516429 (and (= (size!20599 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20599 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20599 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763786 () Bool)

(declare-fun e!425674 () Bool)

(assert (=> b!763786 (= e!425672 e!425674)))

(declare-fun res!516431 () Bool)

(assert (=> b!763786 (=> (not res!516431) (not e!425674))))

(declare-datatypes ((SeekEntryResult!7735 0))(
  ( (MissingZero!7735 (index!33308 (_ BitVec 32))) (Found!7735 (index!33309 (_ BitVec 32))) (Intermediate!7735 (undefined!8547 Bool) (index!33310 (_ BitVec 32)) (x!64374 (_ BitVec 32))) (Undefined!7735) (MissingVacant!7735 (index!33311 (_ BitVec 32))) )
))
(declare-fun lt!340000 () SeekEntryResult!7735)

(assert (=> b!763786 (= res!516431 (or (= lt!340000 (MissingZero!7735 i!1173)) (= lt!340000 (MissingVacant!7735 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42151 (_ BitVec 32)) SeekEntryResult!7735)

(assert (=> b!763786 (= lt!340000 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!763787 () Bool)

(declare-fun res!516430 () Bool)

(assert (=> b!763787 (=> (not res!516430) (not e!425674))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763787 (= res!516430 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20599 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20599 a!3186))))))

(declare-fun b!763788 () Bool)

(declare-fun res!516428 () Bool)

(assert (=> b!763788 (=> (not res!516428) (not e!425672))))

(assert (=> b!763788 (= res!516428 (validKeyInArray!0 (select (arr!20179 a!3186) j!159)))))

(declare-fun b!763789 () Bool)

(declare-fun res!516437 () Bool)

(assert (=> b!763789 (=> (not res!516437) (not e!425672))))

(declare-fun arrayContainsKey!0 (array!42151 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763789 (= res!516437 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763790 () Bool)

(assert (=> b!763790 (= e!425674 e!425671)))

(declare-fun res!516435 () Bool)

(assert (=> b!763790 (=> (not res!516435) (not e!425671))))

(declare-fun lt!340002 () SeekEntryResult!7735)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42151 (_ BitVec 32)) SeekEntryResult!7735)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763790 (= res!516435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20179 a!3186) j!159) mask!3328) (select (arr!20179 a!3186) j!159) a!3186 mask!3328) lt!340002))))

(assert (=> b!763790 (= lt!340002 (Intermediate!7735 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763791 () Bool)

(declare-fun res!516427 () Bool)

(assert (=> b!763791 (=> (not res!516427) (not e!425671))))

(assert (=> b!763791 (= res!516427 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20179 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763793 () Bool)

(declare-fun res!516433 () Bool)

(assert (=> b!763793 (=> (not res!516433) (not e!425674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42151 (_ BitVec 32)) Bool)

(assert (=> b!763793 (= res!516433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763794 () Bool)

(declare-fun res!516426 () Bool)

(assert (=> b!763794 (=> (not res!516426) (not e!425674))))

(declare-datatypes ((List!14088 0))(
  ( (Nil!14085) (Cons!14084 (h!15174 (_ BitVec 64)) (t!20395 List!14088)) )
))
(declare-fun arrayNoDuplicates!0 (array!42151 (_ BitVec 32) List!14088) Bool)

(assert (=> b!763794 (= res!516426 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14085))))

(declare-fun b!763795 () Bool)

(assert (=> b!763795 (= e!425671 false)))

(declare-fun lt!340001 () (_ BitVec 32))

(assert (=> b!763795 (= lt!340001 (toIndex!0 (select (store (arr!20179 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!763796 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42151 (_ BitVec 32)) SeekEntryResult!7735)

(assert (=> b!763796 (= e!425675 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20179 a!3186) j!159) a!3186 mask!3328) (Found!7735 j!159)))))

(declare-fun res!516434 () Bool)

(assert (=> start!66368 (=> (not res!516434) (not e!425672))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66368 (= res!516434 (validMask!0 mask!3328))))

(assert (=> start!66368 e!425672))

(assert (=> start!66368 true))

(declare-fun array_inv!16038 (array!42151) Bool)

(assert (=> start!66368 (array_inv!16038 a!3186)))

(declare-fun b!763792 () Bool)

(assert (=> b!763792 (= e!425675 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20179 a!3186) j!159) a!3186 mask!3328) lt!340002))))

(assert (= (and start!66368 res!516434) b!763785))

(assert (= (and b!763785 res!516429) b!763788))

(assert (= (and b!763788 res!516428) b!763783))

(assert (= (and b!763783 res!516436) b!763789))

(assert (= (and b!763789 res!516437) b!763786))

(assert (= (and b!763786 res!516431) b!763793))

(assert (= (and b!763793 res!516433) b!763794))

(assert (= (and b!763794 res!516426) b!763787))

(assert (= (and b!763787 res!516430) b!763790))

(assert (= (and b!763790 res!516435) b!763791))

(assert (= (and b!763791 res!516427) b!763784))

(assert (= (and b!763784 c!84068) b!763792))

(assert (= (and b!763784 (not c!84068)) b!763796))

(assert (= (and b!763784 res!516432) b!763795))

(declare-fun m!710725 () Bool)

(assert (=> b!763790 m!710725))

(assert (=> b!763790 m!710725))

(declare-fun m!710727 () Bool)

(assert (=> b!763790 m!710727))

(assert (=> b!763790 m!710727))

(assert (=> b!763790 m!710725))

(declare-fun m!710729 () Bool)

(assert (=> b!763790 m!710729))

(assert (=> b!763796 m!710725))

(assert (=> b!763796 m!710725))

(declare-fun m!710731 () Bool)

(assert (=> b!763796 m!710731))

(assert (=> b!763788 m!710725))

(assert (=> b!763788 m!710725))

(declare-fun m!710733 () Bool)

(assert (=> b!763788 m!710733))

(declare-fun m!710735 () Bool)

(assert (=> b!763793 m!710735))

(declare-fun m!710737 () Bool)

(assert (=> start!66368 m!710737))

(declare-fun m!710739 () Bool)

(assert (=> start!66368 m!710739))

(declare-fun m!710741 () Bool)

(assert (=> b!763783 m!710741))

(declare-fun m!710743 () Bool)

(assert (=> b!763794 m!710743))

(declare-fun m!710745 () Bool)

(assert (=> b!763795 m!710745))

(declare-fun m!710747 () Bool)

(assert (=> b!763795 m!710747))

(assert (=> b!763795 m!710747))

(declare-fun m!710749 () Bool)

(assert (=> b!763795 m!710749))

(declare-fun m!710751 () Bool)

(assert (=> b!763789 m!710751))

(assert (=> b!763792 m!710725))

(assert (=> b!763792 m!710725))

(declare-fun m!710753 () Bool)

(assert (=> b!763792 m!710753))

(declare-fun m!710755 () Bool)

(assert (=> b!763786 m!710755))

(declare-fun m!710757 () Bool)

(assert (=> b!763791 m!710757))

(check-sat (not b!763792) (not b!763796) (not b!763795) (not b!763789) (not b!763794) (not b!763786) (not start!66368) (not b!763793) (not b!763783) (not b!763790) (not b!763788))
(check-sat)
