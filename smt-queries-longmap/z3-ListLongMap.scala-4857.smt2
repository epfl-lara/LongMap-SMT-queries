; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66914 () Bool)

(assert start!66914)

(declare-fun b!772119 () Bool)

(declare-fun e!429841 () Bool)

(declare-fun e!429845 () Bool)

(assert (=> b!772119 (= e!429841 e!429845)))

(declare-fun res!522272 () Bool)

(assert (=> b!772119 (=> (not res!522272) (not e!429845))))

(declare-datatypes ((SeekEntryResult!7902 0))(
  ( (MissingZero!7902 (index!33976 (_ BitVec 32))) (Found!7902 (index!33977 (_ BitVec 32))) (Intermediate!7902 (undefined!8714 Bool) (index!33978 (_ BitVec 32)) (x!64909 (_ BitVec 32))) (Undefined!7902) (MissingVacant!7902 (index!33979 (_ BitVec 32))) )
))
(declare-fun lt!343759 () SeekEntryResult!7902)

(declare-fun lt!343751 () SeekEntryResult!7902)

(assert (=> b!772119 (= res!522272 (= lt!343759 lt!343751))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343750 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42407 0))(
  ( (array!42408 (arr!20302 (Array (_ BitVec 32) (_ BitVec 64))) (size!20723 (_ BitVec 32))) )
))
(declare-fun lt!343755 () array!42407)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42407 (_ BitVec 32)) SeekEntryResult!7902)

(assert (=> b!772119 (= lt!343751 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343750 lt!343755 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772119 (= lt!343759 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343750 mask!3328) lt!343750 lt!343755 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun a!3186 () array!42407)

(assert (=> b!772119 (= lt!343750 (select (store (arr!20302 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!772119 (= lt!343755 (array!42408 (store (arr!20302 a!3186) i!1173 k0!2102) (size!20723 a!3186)))))

(declare-fun b!772120 () Bool)

(declare-fun res!522270 () Bool)

(assert (=> b!772120 (=> (not res!522270) (not e!429841))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!772120 (= res!522270 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20302 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!772121 () Bool)

(declare-fun res!522266 () Bool)

(declare-fun e!429839 () Bool)

(assert (=> b!772121 (=> (not res!522266) (not e!429839))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772121 (= res!522266 (validKeyInArray!0 k0!2102))))

(declare-fun b!772122 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!429837 () Bool)

(declare-fun lt!343758 () SeekEntryResult!7902)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42407 (_ BitVec 32)) SeekEntryResult!7902)

(assert (=> b!772122 (= e!429837 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!343758))))

(declare-fun b!772123 () Bool)

(declare-fun e!429843 () Bool)

(assert (=> b!772123 (= e!429843 true)))

(declare-datatypes ((Unit!26622 0))(
  ( (Unit!26623) )
))
(declare-fun lt!343760 () Unit!26622)

(declare-fun e!429838 () Unit!26622)

(assert (=> b!772123 (= lt!343760 e!429838)))

(declare-fun c!85327 () Bool)

(assert (=> b!772123 (= c!85327 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!343752 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772123 (= lt!343752 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772124 () Bool)

(declare-fun Unit!26624 () Unit!26622)

(assert (=> b!772124 (= e!429838 Unit!26624)))

(declare-fun lt!343756 () SeekEntryResult!7902)

(assert (=> b!772124 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343752 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!343756)))

(declare-fun b!772125 () Bool)

(declare-fun Unit!26625 () Unit!26622)

(assert (=> b!772125 (= e!429838 Unit!26625)))

(declare-fun lt!343753 () SeekEntryResult!7902)

(assert (=> b!772125 (= lt!343753 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20302 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!772125 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343752 resIntermediateIndex!5 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) (Found!7902 j!159))))

(declare-fun b!772126 () Bool)

(declare-fun res!522269 () Bool)

(assert (=> b!772126 (=> (not res!522269) (not e!429839))))

(assert (=> b!772126 (= res!522269 (and (= (size!20723 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20723 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20723 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772127 () Bool)

(declare-fun e!429836 () Bool)

(assert (=> b!772127 (= e!429836 e!429841)))

(declare-fun res!522267 () Bool)

(assert (=> b!772127 (=> (not res!522267) (not e!429841))))

(assert (=> b!772127 (= res!522267 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20302 a!3186) j!159) mask!3328) (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!343756))))

(assert (=> b!772127 (= lt!343756 (Intermediate!7902 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772128 () Bool)

(declare-fun res!522268 () Bool)

(assert (=> b!772128 (=> (not res!522268) (not e!429839))))

(declare-fun arrayContainsKey!0 (array!42407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772128 (= res!522268 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772129 () Bool)

(assert (=> b!772129 (= e!429839 e!429836)))

(declare-fun res!522261 () Bool)

(assert (=> b!772129 (=> (not res!522261) (not e!429836))))

(declare-fun lt!343754 () SeekEntryResult!7902)

(assert (=> b!772129 (= res!522261 (or (= lt!343754 (MissingZero!7902 i!1173)) (= lt!343754 (MissingVacant!7902 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42407 (_ BitVec 32)) SeekEntryResult!7902)

(assert (=> b!772129 (= lt!343754 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!772130 () Bool)

(declare-fun res!522263 () Bool)

(assert (=> b!772130 (=> (not res!522263) (not e!429836))))

(assert (=> b!772130 (= res!522263 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20723 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20723 a!3186))))))

(declare-fun res!522264 () Bool)

(assert (=> start!66914 (=> (not res!522264) (not e!429839))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66914 (= res!522264 (validMask!0 mask!3328))))

(assert (=> start!66914 e!429839))

(assert (=> start!66914 true))

(declare-fun array_inv!16098 (array!42407) Bool)

(assert (=> start!66914 (array_inv!16098 a!3186)))

(declare-fun e!429840 () Bool)

(declare-fun b!772118 () Bool)

(assert (=> b!772118 (= e!429840 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!343756))))

(declare-fun b!772131 () Bool)

(declare-fun res!522271 () Bool)

(assert (=> b!772131 (=> (not res!522271) (not e!429836))))

(declare-datatypes ((List!14304 0))(
  ( (Nil!14301) (Cons!14300 (h!15402 (_ BitVec 64)) (t!20619 List!14304)) )
))
(declare-fun arrayNoDuplicates!0 (array!42407 (_ BitVec 32) List!14304) Bool)

(assert (=> b!772131 (= res!522271 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14301))))

(declare-fun b!772132 () Bool)

(assert (=> b!772132 (= e!429840 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) (Found!7902 j!159)))))

(declare-fun b!772133 () Bool)

(assert (=> b!772133 (= e!429845 (not e!429843))))

(declare-fun res!522262 () Bool)

(assert (=> b!772133 (=> res!522262 e!429843)))

(get-info :version)

(assert (=> b!772133 (= res!522262 (or (not ((_ is Intermediate!7902) lt!343751)) (bvsge x!1131 (x!64909 lt!343751))))))

(declare-fun e!429842 () Bool)

(assert (=> b!772133 e!429842))

(declare-fun res!522275 () Bool)

(assert (=> b!772133 (=> (not res!522275) (not e!429842))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42407 (_ BitVec 32)) Bool)

(assert (=> b!772133 (= res!522275 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343757 () Unit!26622)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26622)

(assert (=> b!772133 (= lt!343757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772134 () Bool)

(assert (=> b!772134 (= e!429842 e!429837)))

(declare-fun res!522274 () Bool)

(assert (=> b!772134 (=> (not res!522274) (not e!429837))))

(assert (=> b!772134 (= res!522274 (= (seekEntryOrOpen!0 (select (arr!20302 a!3186) j!159) a!3186 mask!3328) lt!343758))))

(assert (=> b!772134 (= lt!343758 (Found!7902 j!159))))

(declare-fun b!772135 () Bool)

(declare-fun res!522260 () Bool)

(assert (=> b!772135 (=> (not res!522260) (not e!429836))))

(assert (=> b!772135 (= res!522260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772136 () Bool)

(declare-fun res!522265 () Bool)

(assert (=> b!772136 (=> (not res!522265) (not e!429841))))

(assert (=> b!772136 (= res!522265 e!429840)))

(declare-fun c!85326 () Bool)

(assert (=> b!772136 (= c!85326 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772137 () Bool)

(declare-fun res!522273 () Bool)

(assert (=> b!772137 (=> (not res!522273) (not e!429839))))

(assert (=> b!772137 (= res!522273 (validKeyInArray!0 (select (arr!20302 a!3186) j!159)))))

(assert (= (and start!66914 res!522264) b!772126))

(assert (= (and b!772126 res!522269) b!772137))

(assert (= (and b!772137 res!522273) b!772121))

(assert (= (and b!772121 res!522266) b!772128))

(assert (= (and b!772128 res!522268) b!772129))

(assert (= (and b!772129 res!522261) b!772135))

(assert (= (and b!772135 res!522260) b!772131))

(assert (= (and b!772131 res!522271) b!772130))

(assert (= (and b!772130 res!522263) b!772127))

(assert (= (and b!772127 res!522267) b!772120))

(assert (= (and b!772120 res!522270) b!772136))

(assert (= (and b!772136 c!85326) b!772118))

(assert (= (and b!772136 (not c!85326)) b!772132))

(assert (= (and b!772136 res!522265) b!772119))

(assert (= (and b!772119 res!522272) b!772133))

(assert (= (and b!772133 res!522275) b!772134))

(assert (= (and b!772134 res!522274) b!772122))

(assert (= (and b!772133 (not res!522262)) b!772123))

(assert (= (and b!772123 c!85327) b!772124))

(assert (= (and b!772123 (not c!85327)) b!772125))

(declare-fun m!717099 () Bool)

(assert (=> b!772123 m!717099))

(declare-fun m!717101 () Bool)

(assert (=> start!66914 m!717101))

(declare-fun m!717103 () Bool)

(assert (=> start!66914 m!717103))

(declare-fun m!717105 () Bool)

(assert (=> b!772134 m!717105))

(assert (=> b!772134 m!717105))

(declare-fun m!717107 () Bool)

(assert (=> b!772134 m!717107))

(declare-fun m!717109 () Bool)

(assert (=> b!772135 m!717109))

(declare-fun m!717111 () Bool)

(assert (=> b!772128 m!717111))

(assert (=> b!772125 m!717105))

(assert (=> b!772125 m!717105))

(declare-fun m!717113 () Bool)

(assert (=> b!772125 m!717113))

(assert (=> b!772125 m!717105))

(declare-fun m!717115 () Bool)

(assert (=> b!772125 m!717115))

(assert (=> b!772127 m!717105))

(assert (=> b!772127 m!717105))

(declare-fun m!717117 () Bool)

(assert (=> b!772127 m!717117))

(assert (=> b!772127 m!717117))

(assert (=> b!772127 m!717105))

(declare-fun m!717119 () Bool)

(assert (=> b!772127 m!717119))

(declare-fun m!717121 () Bool)

(assert (=> b!772120 m!717121))

(assert (=> b!772132 m!717105))

(assert (=> b!772132 m!717105))

(assert (=> b!772132 m!717113))

(declare-fun m!717123 () Bool)

(assert (=> b!772119 m!717123))

(declare-fun m!717125 () Bool)

(assert (=> b!772119 m!717125))

(declare-fun m!717127 () Bool)

(assert (=> b!772119 m!717127))

(declare-fun m!717129 () Bool)

(assert (=> b!772119 m!717129))

(assert (=> b!772119 m!717127))

(declare-fun m!717131 () Bool)

(assert (=> b!772119 m!717131))

(declare-fun m!717133 () Bool)

(assert (=> b!772133 m!717133))

(declare-fun m!717135 () Bool)

(assert (=> b!772133 m!717135))

(declare-fun m!717137 () Bool)

(assert (=> b!772131 m!717137))

(assert (=> b!772124 m!717105))

(assert (=> b!772124 m!717105))

(declare-fun m!717139 () Bool)

(assert (=> b!772124 m!717139))

(assert (=> b!772122 m!717105))

(assert (=> b!772122 m!717105))

(declare-fun m!717141 () Bool)

(assert (=> b!772122 m!717141))

(declare-fun m!717143 () Bool)

(assert (=> b!772129 m!717143))

(declare-fun m!717145 () Bool)

(assert (=> b!772121 m!717145))

(assert (=> b!772118 m!717105))

(assert (=> b!772118 m!717105))

(declare-fun m!717147 () Bool)

(assert (=> b!772118 m!717147))

(assert (=> b!772137 m!717105))

(assert (=> b!772137 m!717105))

(declare-fun m!717149 () Bool)

(assert (=> b!772137 m!717149))

(check-sat (not b!772123) (not b!772125) (not b!772118) (not b!772135) (not start!66914) (not b!772134) (not b!772122) (not b!772137) (not b!772129) (not b!772124) (not b!772133) (not b!772121) (not b!772119) (not b!772127) (not b!772132) (not b!772131) (not b!772128))
(check-sat)
