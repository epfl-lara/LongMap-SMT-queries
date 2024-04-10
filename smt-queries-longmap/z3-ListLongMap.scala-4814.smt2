; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66226 () Bool)

(assert start!66226)

(declare-fun e!425090 () Bool)

(declare-datatypes ((array!42131 0))(
  ( (array!42132 (arr!20173 (Array (_ BitVec 32) (_ BitVec 64))) (size!20594 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42131)

(declare-fun b!762698 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7773 0))(
  ( (MissingZero!7773 (index!33460 (_ BitVec 32))) (Found!7773 (index!33461 (_ BitVec 32))) (Intermediate!7773 (undefined!8585 Bool) (index!33462 (_ BitVec 32)) (x!64369 (_ BitVec 32))) (Undefined!7773) (MissingVacant!7773 (index!33463 (_ BitVec 32))) )
))
(declare-fun lt!339632 () SeekEntryResult!7773)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42131 (_ BitVec 32)) SeekEntryResult!7773)

(assert (=> b!762698 (= e!425090 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20173 a!3186) j!159) a!3186 mask!3328) lt!339632)))))

(declare-fun b!762699 () Bool)

(declare-fun res!515784 () Bool)

(declare-fun e!425091 () Bool)

(assert (=> b!762699 (=> (not res!515784) (not e!425091))))

(declare-datatypes ((List!14175 0))(
  ( (Nil!14172) (Cons!14171 (h!15255 (_ BitVec 64)) (t!20490 List!14175)) )
))
(declare-fun arrayNoDuplicates!0 (array!42131 (_ BitVec 32) List!14175) Bool)

(assert (=> b!762699 (= res!515784 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14172))))

(declare-fun b!762700 () Bool)

(declare-fun e!425094 () Bool)

(assert (=> b!762700 (= e!425091 e!425094)))

(declare-fun res!515782 () Bool)

(assert (=> b!762700 (=> (not res!515782) (not e!425094))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762700 (= res!515782 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20173 a!3186) j!159) mask!3328) (select (arr!20173 a!3186) j!159) a!3186 mask!3328) lt!339632))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762700 (= lt!339632 (Intermediate!7773 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762701 () Bool)

(declare-fun res!515788 () Bool)

(declare-fun e!425092 () Bool)

(assert (=> b!762701 (=> (not res!515788) (not e!425092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762701 (= res!515788 (validKeyInArray!0 (select (arr!20173 a!3186) j!159)))))

(declare-fun b!762702 () Bool)

(declare-fun res!515790 () Bool)

(assert (=> b!762702 (=> (not res!515790) (not e!425092))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762702 (= res!515790 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!515783 () Bool)

(assert (=> start!66226 (=> (not res!515783) (not e!425092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66226 (= res!515783 (validMask!0 mask!3328))))

(assert (=> start!66226 e!425092))

(assert (=> start!66226 true))

(declare-fun array_inv!15969 (array!42131) Bool)

(assert (=> start!66226 (array_inv!15969 a!3186)))

(declare-fun b!762703 () Bool)

(assert (=> b!762703 (= e!425092 e!425091)))

(declare-fun res!515786 () Bool)

(assert (=> b!762703 (=> (not res!515786) (not e!425091))))

(declare-fun lt!339630 () SeekEntryResult!7773)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!762703 (= res!515786 (or (= lt!339630 (MissingZero!7773 i!1173)) (= lt!339630 (MissingVacant!7773 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42131 (_ BitVec 32)) SeekEntryResult!7773)

(assert (=> b!762703 (= lt!339630 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762704 () Bool)

(declare-fun res!515785 () Bool)

(assert (=> b!762704 (=> (not res!515785) (not e!425094))))

(assert (=> b!762704 (= res!515785 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20173 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762705 () Bool)

(assert (=> b!762705 (= e!425094 false)))

(declare-fun lt!339631 () Bool)

(assert (=> b!762705 (= lt!339631 e!425090)))

(declare-fun c!83845 () Bool)

(assert (=> b!762705 (= c!83845 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762706 () Bool)

(declare-fun res!515781 () Bool)

(assert (=> b!762706 (=> (not res!515781) (not e!425091))))

(assert (=> b!762706 (= res!515781 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20594 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20594 a!3186))))))

(declare-fun b!762707 () Bool)

(declare-fun res!515789 () Bool)

(assert (=> b!762707 (=> (not res!515789) (not e!425092))))

(assert (=> b!762707 (= res!515789 (validKeyInArray!0 k0!2102))))

(declare-fun b!762708 () Bool)

(declare-fun res!515787 () Bool)

(assert (=> b!762708 (=> (not res!515787) (not e!425092))))

(assert (=> b!762708 (= res!515787 (and (= (size!20594 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20594 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20594 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762709 () Bool)

(declare-fun res!515791 () Bool)

(assert (=> b!762709 (=> (not res!515791) (not e!425091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42131 (_ BitVec 32)) Bool)

(assert (=> b!762709 (= res!515791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762710 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42131 (_ BitVec 32)) SeekEntryResult!7773)

(assert (=> b!762710 (= e!425090 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20173 a!3186) j!159) a!3186 mask!3328) (Found!7773 j!159))))))

(assert (= (and start!66226 res!515783) b!762708))

(assert (= (and b!762708 res!515787) b!762701))

(assert (= (and b!762701 res!515788) b!762707))

(assert (= (and b!762707 res!515789) b!762702))

(assert (= (and b!762702 res!515790) b!762703))

(assert (= (and b!762703 res!515786) b!762709))

(assert (= (and b!762709 res!515791) b!762699))

(assert (= (and b!762699 res!515784) b!762706))

(assert (= (and b!762706 res!515781) b!762700))

(assert (= (and b!762700 res!515782) b!762704))

(assert (= (and b!762704 res!515785) b!762705))

(assert (= (and b!762705 c!83845) b!762698))

(assert (= (and b!762705 (not c!83845)) b!762710))

(declare-fun m!709375 () Bool)

(assert (=> b!762707 m!709375))

(declare-fun m!709377 () Bool)

(assert (=> b!762701 m!709377))

(assert (=> b!762701 m!709377))

(declare-fun m!709379 () Bool)

(assert (=> b!762701 m!709379))

(declare-fun m!709381 () Bool)

(assert (=> b!762699 m!709381))

(assert (=> b!762710 m!709377))

(assert (=> b!762710 m!709377))

(declare-fun m!709383 () Bool)

(assert (=> b!762710 m!709383))

(assert (=> b!762698 m!709377))

(assert (=> b!762698 m!709377))

(declare-fun m!709385 () Bool)

(assert (=> b!762698 m!709385))

(declare-fun m!709387 () Bool)

(assert (=> b!762702 m!709387))

(declare-fun m!709389 () Bool)

(assert (=> start!66226 m!709389))

(declare-fun m!709391 () Bool)

(assert (=> start!66226 m!709391))

(declare-fun m!709393 () Bool)

(assert (=> b!762704 m!709393))

(declare-fun m!709395 () Bool)

(assert (=> b!762709 m!709395))

(assert (=> b!762700 m!709377))

(assert (=> b!762700 m!709377))

(declare-fun m!709397 () Bool)

(assert (=> b!762700 m!709397))

(assert (=> b!762700 m!709397))

(assert (=> b!762700 m!709377))

(declare-fun m!709399 () Bool)

(assert (=> b!762700 m!709399))

(declare-fun m!709401 () Bool)

(assert (=> b!762703 m!709401))

(check-sat (not b!762700) (not b!762710) (not b!762703) (not b!762698) (not b!762702) (not b!762709) (not b!762701) (not b!762707) (not start!66226) (not b!762699))
(check-sat)
