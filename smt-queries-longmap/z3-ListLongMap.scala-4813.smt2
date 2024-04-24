; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66338 () Bool)

(assert start!66338)

(declare-fun b!763187 () Bool)

(declare-fun res!515929 () Bool)

(declare-fun e!425450 () Bool)

(assert (=> b!763187 (=> (not res!515929) (not e!425450))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42121 0))(
  ( (array!42122 (arr!20164 (Array (_ BitVec 32) (_ BitVec 64))) (size!20584 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42121)

(assert (=> b!763187 (= res!515929 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20164 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763188 () Bool)

(declare-fun res!515922 () Bool)

(declare-fun e!425449 () Bool)

(assert (=> b!763188 (=> (not res!515922) (not e!425449))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763188 (= res!515922 (validKeyInArray!0 (select (arr!20164 a!3186) j!159)))))

(declare-fun b!763189 () Bool)

(assert (=> b!763189 (= e!425450 false)))

(declare-fun lt!339865 () Bool)

(declare-fun e!425447 () Bool)

(assert (=> b!763189 (= lt!339865 e!425447)))

(declare-fun c!84023 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763189 (= c!84023 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763190 () Bool)

(declare-fun e!425446 () Bool)

(assert (=> b!763190 (= e!425446 e!425450)))

(declare-fun res!515920 () Bool)

(assert (=> b!763190 (=> (not res!515920) (not e!425450))))

(declare-datatypes ((SeekEntryResult!7720 0))(
  ( (MissingZero!7720 (index!33248 (_ BitVec 32))) (Found!7720 (index!33249 (_ BitVec 32))) (Intermediate!7720 (undefined!8532 Bool) (index!33250 (_ BitVec 32)) (x!64319 (_ BitVec 32))) (Undefined!7720) (MissingVacant!7720 (index!33251 (_ BitVec 32))) )
))
(declare-fun lt!339867 () SeekEntryResult!7720)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42121 (_ BitVec 32)) SeekEntryResult!7720)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763190 (= res!515920 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20164 a!3186) j!159) mask!3328) (select (arr!20164 a!3186) j!159) a!3186 mask!3328) lt!339867))))

(assert (=> b!763190 (= lt!339867 (Intermediate!7720 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763191 () Bool)

(declare-fun res!515924 () Bool)

(assert (=> b!763191 (=> (not res!515924) (not e!425446))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42121 (_ BitVec 32)) Bool)

(assert (=> b!763191 (= res!515924 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763192 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763192 (= e!425447 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20164 a!3186) j!159) a!3186 mask!3328) lt!339867)))))

(declare-fun b!763193 () Bool)

(declare-fun res!515930 () Bool)

(assert (=> b!763193 (=> (not res!515930) (not e!425446))))

(assert (=> b!763193 (= res!515930 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20584 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20584 a!3186))))))

(declare-fun b!763194 () Bool)

(declare-fun res!515921 () Bool)

(assert (=> b!763194 (=> (not res!515921) (not e!425449))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!763194 (= res!515921 (validKeyInArray!0 k0!2102))))

(declare-fun b!763195 () Bool)

(assert (=> b!763195 (= e!425449 e!425446)))

(declare-fun res!515923 () Bool)

(assert (=> b!763195 (=> (not res!515923) (not e!425446))))

(declare-fun lt!339866 () SeekEntryResult!7720)

(assert (=> b!763195 (= res!515923 (or (= lt!339866 (MissingZero!7720 i!1173)) (= lt!339866 (MissingVacant!7720 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42121 (_ BitVec 32)) SeekEntryResult!7720)

(assert (=> b!763195 (= lt!339866 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!515925 () Bool)

(assert (=> start!66338 (=> (not res!515925) (not e!425449))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66338 (= res!515925 (validMask!0 mask!3328))))

(assert (=> start!66338 e!425449))

(assert (=> start!66338 true))

(declare-fun array_inv!16023 (array!42121) Bool)

(assert (=> start!66338 (array_inv!16023 a!3186)))

(declare-fun b!763196 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42121 (_ BitVec 32)) SeekEntryResult!7720)

(assert (=> b!763196 (= e!425447 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20164 a!3186) j!159) a!3186 mask!3328) (Found!7720 j!159))))))

(declare-fun b!763197 () Bool)

(declare-fun res!515927 () Bool)

(assert (=> b!763197 (=> (not res!515927) (not e!425449))))

(declare-fun arrayContainsKey!0 (array!42121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763197 (= res!515927 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763198 () Bool)

(declare-fun res!515926 () Bool)

(assert (=> b!763198 (=> (not res!515926) (not e!425449))))

(assert (=> b!763198 (= res!515926 (and (= (size!20584 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20584 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20584 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763199 () Bool)

(declare-fun res!515928 () Bool)

(assert (=> b!763199 (=> (not res!515928) (not e!425446))))

(declare-datatypes ((List!14073 0))(
  ( (Nil!14070) (Cons!14069 (h!15159 (_ BitVec 64)) (t!20380 List!14073)) )
))
(declare-fun arrayNoDuplicates!0 (array!42121 (_ BitVec 32) List!14073) Bool)

(assert (=> b!763199 (= res!515928 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14070))))

(assert (= (and start!66338 res!515925) b!763198))

(assert (= (and b!763198 res!515926) b!763188))

(assert (= (and b!763188 res!515922) b!763194))

(assert (= (and b!763194 res!515921) b!763197))

(assert (= (and b!763197 res!515927) b!763195))

(assert (= (and b!763195 res!515923) b!763191))

(assert (= (and b!763191 res!515924) b!763199))

(assert (= (and b!763199 res!515928) b!763193))

(assert (= (and b!763193 res!515930) b!763190))

(assert (= (and b!763190 res!515920) b!763187))

(assert (= (and b!763187 res!515929) b!763189))

(assert (= (and b!763189 c!84023) b!763192))

(assert (= (and b!763189 (not c!84023)) b!763196))

(declare-fun m!710287 () Bool)

(assert (=> b!763188 m!710287))

(assert (=> b!763188 m!710287))

(declare-fun m!710289 () Bool)

(assert (=> b!763188 m!710289))

(assert (=> b!763190 m!710287))

(assert (=> b!763190 m!710287))

(declare-fun m!710291 () Bool)

(assert (=> b!763190 m!710291))

(assert (=> b!763190 m!710291))

(assert (=> b!763190 m!710287))

(declare-fun m!710293 () Bool)

(assert (=> b!763190 m!710293))

(declare-fun m!710295 () Bool)

(assert (=> b!763191 m!710295))

(declare-fun m!710297 () Bool)

(assert (=> b!763199 m!710297))

(assert (=> b!763196 m!710287))

(assert (=> b!763196 m!710287))

(declare-fun m!710299 () Bool)

(assert (=> b!763196 m!710299))

(declare-fun m!710301 () Bool)

(assert (=> start!66338 m!710301))

(declare-fun m!710303 () Bool)

(assert (=> start!66338 m!710303))

(declare-fun m!710305 () Bool)

(assert (=> b!763187 m!710305))

(assert (=> b!763192 m!710287))

(assert (=> b!763192 m!710287))

(declare-fun m!710307 () Bool)

(assert (=> b!763192 m!710307))

(declare-fun m!710309 () Bool)

(assert (=> b!763197 m!710309))

(declare-fun m!710311 () Bool)

(assert (=> b!763195 m!710311))

(declare-fun m!710313 () Bool)

(assert (=> b!763194 m!710313))

(check-sat (not start!66338) (not b!763199) (not b!763192) (not b!763191) (not b!763197) (not b!763194) (not b!763195) (not b!763190) (not b!763188) (not b!763196))
(check-sat)
