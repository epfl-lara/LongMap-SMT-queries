; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64622 () Bool)

(assert start!64622)

(declare-fun b!727842 () Bool)

(declare-fun res!488539 () Bool)

(declare-fun e!407438 () Bool)

(assert (=> b!727842 (=> (not res!488539) (not e!407438))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727842 (= res!488539 (validKeyInArray!0 k0!2102))))

(declare-fun res!488543 () Bool)

(assert (=> start!64622 (=> (not res!488543) (not e!407438))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64622 (= res!488543 (validMask!0 mask!3328))))

(assert (=> start!64622 e!407438))

(assert (=> start!64622 true))

(declare-datatypes ((array!41088 0))(
  ( (array!41089 (arr!19664 (Array (_ BitVec 32) (_ BitVec 64))) (size!20085 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41088)

(declare-fun array_inv!15547 (array!41088) Bool)

(assert (=> start!64622 (array_inv!15547 a!3186)))

(declare-fun b!727843 () Bool)

(declare-fun res!488540 () Bool)

(declare-fun e!407442 () Bool)

(assert (=> b!727843 (=> (not res!488540) (not e!407442))))

(declare-fun e!407440 () Bool)

(assert (=> b!727843 (= res!488540 e!407440)))

(declare-fun c!80028 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727843 (= c!80028 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727844 () Bool)

(declare-fun res!488537 () Bool)

(assert (=> b!727844 (=> (not res!488537) (not e!407438))))

(declare-fun arrayContainsKey!0 (array!41088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727844 (= res!488537 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7261 0))(
  ( (MissingZero!7261 (index!31412 (_ BitVec 32))) (Found!7261 (index!31413 (_ BitVec 32))) (Intermediate!7261 (undefined!8073 Bool) (index!31414 (_ BitVec 32)) (x!62414 (_ BitVec 32))) (Undefined!7261) (MissingVacant!7261 (index!31415 (_ BitVec 32))) )
))
(declare-fun lt!322250 () SeekEntryResult!7261)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!727845 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41088 (_ BitVec 32)) SeekEntryResult!7261)

(assert (=> b!727845 (= e!407440 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19664 a!3186) j!159) a!3186 mask!3328) lt!322250))))

(declare-fun b!727846 () Bool)

(declare-fun res!488544 () Bool)

(declare-fun e!407435 () Bool)

(assert (=> b!727846 (=> (not res!488544) (not e!407435))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!727846 (= res!488544 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20085 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20085 a!3186))))))

(declare-fun b!727847 () Bool)

(assert (=> b!727847 (= e!407438 e!407435)))

(declare-fun res!488546 () Bool)

(assert (=> b!727847 (=> (not res!488546) (not e!407435))))

(declare-fun lt!322255 () SeekEntryResult!7261)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727847 (= res!488546 (or (= lt!322255 (MissingZero!7261 i!1173)) (= lt!322255 (MissingVacant!7261 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41088 (_ BitVec 32)) SeekEntryResult!7261)

(assert (=> b!727847 (= lt!322255 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!727848 () Bool)

(declare-fun res!488541 () Bool)

(assert (=> b!727848 (=> (not res!488541) (not e!407442))))

(assert (=> b!727848 (= res!488541 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19664 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727849 () Bool)

(declare-fun e!407436 () Bool)

(assert (=> b!727849 (= e!407436 true)))

(declare-fun lt!322256 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727849 (= lt!322256 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727850 () Bool)

(declare-fun res!488550 () Bool)

(assert (=> b!727850 (=> (not res!488550) (not e!407435))))

(declare-datatypes ((List!13705 0))(
  ( (Nil!13702) (Cons!13701 (h!14761 (_ BitVec 64)) (t!20011 List!13705)) )
))
(declare-fun arrayNoDuplicates!0 (array!41088 (_ BitVec 32) List!13705) Bool)

(assert (=> b!727850 (= res!488550 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13702))))

(declare-fun b!727851 () Bool)

(declare-fun e!407441 () Bool)

(declare-fun e!407437 () Bool)

(assert (=> b!727851 (= e!407441 e!407437)))

(declare-fun res!488536 () Bool)

(assert (=> b!727851 (=> (not res!488536) (not e!407437))))

(declare-fun lt!322254 () SeekEntryResult!7261)

(assert (=> b!727851 (= res!488536 (= (seekEntryOrOpen!0 (select (arr!19664 a!3186) j!159) a!3186 mask!3328) lt!322254))))

(assert (=> b!727851 (= lt!322254 (Found!7261 j!159))))

(declare-fun b!727852 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41088 (_ BitVec 32)) SeekEntryResult!7261)

(assert (=> b!727852 (= e!407437 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19664 a!3186) j!159) a!3186 mask!3328) lt!322254))))

(declare-fun b!727853 () Bool)

(declare-fun res!488542 () Bool)

(assert (=> b!727853 (=> (not res!488542) (not e!407438))))

(assert (=> b!727853 (= res!488542 (validKeyInArray!0 (select (arr!19664 a!3186) j!159)))))

(declare-fun b!727854 () Bool)

(declare-fun e!407439 () Bool)

(assert (=> b!727854 (= e!407442 e!407439)))

(declare-fun res!488535 () Bool)

(assert (=> b!727854 (=> (not res!488535) (not e!407439))))

(declare-fun lt!322253 () SeekEntryResult!7261)

(declare-fun lt!322248 () SeekEntryResult!7261)

(assert (=> b!727854 (= res!488535 (= lt!322253 lt!322248))))

(declare-fun lt!322252 () (_ BitVec 64))

(declare-fun lt!322249 () array!41088)

(assert (=> b!727854 (= lt!322248 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322252 lt!322249 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727854 (= lt!322253 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322252 mask!3328) lt!322252 lt!322249 mask!3328))))

(assert (=> b!727854 (= lt!322252 (select (store (arr!19664 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!727854 (= lt!322249 (array!41089 (store (arr!19664 a!3186) i!1173 k0!2102) (size!20085 a!3186)))))

(declare-fun b!727855 () Bool)

(declare-fun res!488545 () Bool)

(assert (=> b!727855 (=> (not res!488545) (not e!407435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41088 (_ BitVec 32)) Bool)

(assert (=> b!727855 (= res!488545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!727856 () Bool)

(assert (=> b!727856 (= e!407440 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19664 a!3186) j!159) a!3186 mask!3328) (Found!7261 j!159)))))

(declare-fun b!727857 () Bool)

(assert (=> b!727857 (= e!407435 e!407442)))

(declare-fun res!488538 () Bool)

(assert (=> b!727857 (=> (not res!488538) (not e!407442))))

(assert (=> b!727857 (= res!488538 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19664 a!3186) j!159) mask!3328) (select (arr!19664 a!3186) j!159) a!3186 mask!3328) lt!322250))))

(assert (=> b!727857 (= lt!322250 (Intermediate!7261 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!727858 () Bool)

(assert (=> b!727858 (= e!407439 (not e!407436))))

(declare-fun res!488548 () Bool)

(assert (=> b!727858 (=> res!488548 e!407436)))

(get-info :version)

(assert (=> b!727858 (= res!488548 (or (not ((_ is Intermediate!7261) lt!322248)) (bvsge x!1131 (x!62414 lt!322248))))))

(assert (=> b!727858 e!407441))

(declare-fun res!488547 () Bool)

(assert (=> b!727858 (=> (not res!488547) (not e!407441))))

(assert (=> b!727858 (= res!488547 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24812 0))(
  ( (Unit!24813) )
))
(declare-fun lt!322251 () Unit!24812)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41088 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24812)

(assert (=> b!727858 (= lt!322251 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727859 () Bool)

(declare-fun res!488549 () Bool)

(assert (=> b!727859 (=> (not res!488549) (not e!407438))))

(assert (=> b!727859 (= res!488549 (and (= (size!20085 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20085 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20085 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!64622 res!488543) b!727859))

(assert (= (and b!727859 res!488549) b!727853))

(assert (= (and b!727853 res!488542) b!727842))

(assert (= (and b!727842 res!488539) b!727844))

(assert (= (and b!727844 res!488537) b!727847))

(assert (= (and b!727847 res!488546) b!727855))

(assert (= (and b!727855 res!488545) b!727850))

(assert (= (and b!727850 res!488550) b!727846))

(assert (= (and b!727846 res!488544) b!727857))

(assert (= (and b!727857 res!488538) b!727848))

(assert (= (and b!727848 res!488541) b!727843))

(assert (= (and b!727843 c!80028) b!727845))

(assert (= (and b!727843 (not c!80028)) b!727856))

(assert (= (and b!727843 res!488540) b!727854))

(assert (= (and b!727854 res!488535) b!727858))

(assert (= (and b!727858 res!488547) b!727851))

(assert (= (and b!727851 res!488536) b!727852))

(assert (= (and b!727858 (not res!488548)) b!727849))

(declare-fun m!681125 () Bool)

(assert (=> b!727845 m!681125))

(assert (=> b!727845 m!681125))

(declare-fun m!681127 () Bool)

(assert (=> b!727845 m!681127))

(declare-fun m!681129 () Bool)

(assert (=> b!727848 m!681129))

(declare-fun m!681131 () Bool)

(assert (=> start!64622 m!681131))

(declare-fun m!681133 () Bool)

(assert (=> start!64622 m!681133))

(declare-fun m!681135 () Bool)

(assert (=> b!727842 m!681135))

(assert (=> b!727851 m!681125))

(assert (=> b!727851 m!681125))

(declare-fun m!681137 () Bool)

(assert (=> b!727851 m!681137))

(declare-fun m!681139 () Bool)

(assert (=> b!727855 m!681139))

(assert (=> b!727853 m!681125))

(assert (=> b!727853 m!681125))

(declare-fun m!681141 () Bool)

(assert (=> b!727853 m!681141))

(declare-fun m!681143 () Bool)

(assert (=> b!727844 m!681143))

(assert (=> b!727856 m!681125))

(assert (=> b!727856 m!681125))

(declare-fun m!681145 () Bool)

(assert (=> b!727856 m!681145))

(declare-fun m!681147 () Bool)

(assert (=> b!727850 m!681147))

(declare-fun m!681149 () Bool)

(assert (=> b!727854 m!681149))

(declare-fun m!681151 () Bool)

(assert (=> b!727854 m!681151))

(declare-fun m!681153 () Bool)

(assert (=> b!727854 m!681153))

(declare-fun m!681155 () Bool)

(assert (=> b!727854 m!681155))

(declare-fun m!681157 () Bool)

(assert (=> b!727854 m!681157))

(assert (=> b!727854 m!681149))

(declare-fun m!681159 () Bool)

(assert (=> b!727858 m!681159))

(declare-fun m!681161 () Bool)

(assert (=> b!727858 m!681161))

(declare-fun m!681163 () Bool)

(assert (=> b!727847 m!681163))

(assert (=> b!727857 m!681125))

(assert (=> b!727857 m!681125))

(declare-fun m!681165 () Bool)

(assert (=> b!727857 m!681165))

(assert (=> b!727857 m!681165))

(assert (=> b!727857 m!681125))

(declare-fun m!681167 () Bool)

(assert (=> b!727857 m!681167))

(declare-fun m!681169 () Bool)

(assert (=> b!727849 m!681169))

(assert (=> b!727852 m!681125))

(assert (=> b!727852 m!681125))

(declare-fun m!681171 () Bool)

(assert (=> b!727852 m!681171))

(check-sat (not b!727849) (not start!64622) (not b!727854) (not b!727844) (not b!727856) (not b!727857) (not b!727845) (not b!727850) (not b!727851) (not b!727847) (not b!727853) (not b!727855) (not b!727842) (not b!727858) (not b!727852))
(check-sat)
