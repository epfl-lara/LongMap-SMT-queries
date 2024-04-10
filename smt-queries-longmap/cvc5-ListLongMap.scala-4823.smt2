; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66278 () Bool)

(assert start!66278)

(declare-fun b!763750 () Bool)

(declare-fun e!425480 () Bool)

(declare-fun e!425483 () Bool)

(assert (=> b!763750 (= e!425480 e!425483)))

(declare-fun res!516679 () Bool)

(assert (=> b!763750 (=> (not res!516679) (not e!425483))))

(declare-datatypes ((SeekEntryResult!7799 0))(
  ( (MissingZero!7799 (index!33564 (_ BitVec 32))) (Found!7799 (index!33565 (_ BitVec 32))) (Intermediate!7799 (undefined!8611 Bool) (index!33566 (_ BitVec 32)) (x!64467 (_ BitVec 32))) (Undefined!7799) (MissingVacant!7799 (index!33567 (_ BitVec 32))) )
))
(declare-fun lt!339924 () SeekEntryResult!7799)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763750 (= res!516679 (or (= lt!339924 (MissingZero!7799 i!1173)) (= lt!339924 (MissingVacant!7799 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42183 0))(
  ( (array!42184 (arr!20199 (Array (_ BitVec 32) (_ BitVec 64))) (size!20620 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42183)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42183 (_ BitVec 32)) SeekEntryResult!7799)

(assert (=> b!763750 (= lt!339924 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763751 () Bool)

(declare-fun res!516687 () Bool)

(assert (=> b!763751 (=> (not res!516687) (not e!425480))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763751 (= res!516687 (validKeyInArray!0 (select (arr!20199 a!3186) j!159)))))

(declare-fun b!763752 () Bool)

(declare-fun res!516678 () Bool)

(assert (=> b!763752 (=> (not res!516678) (not e!425483))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!763752 (= res!516678 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20620 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20620 a!3186))))))

(declare-fun b!763753 () Bool)

(declare-fun res!516682 () Bool)

(assert (=> b!763753 (=> (not res!516682) (not e!425480))))

(declare-fun arrayContainsKey!0 (array!42183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763753 (= res!516682 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763755 () Bool)

(declare-fun res!516684 () Bool)

(assert (=> b!763755 (=> (not res!516684) (not e!425480))))

(assert (=> b!763755 (= res!516684 (validKeyInArray!0 k!2102))))

(declare-fun b!763756 () Bool)

(declare-fun e!425482 () Bool)

(assert (=> b!763756 (= e!425482 false)))

(declare-fun lt!339927 () SeekEntryResult!7799)

(declare-fun lt!339928 () (_ BitVec 64))

(declare-fun lt!339929 () array!42183)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42183 (_ BitVec 32)) SeekEntryResult!7799)

(assert (=> b!763756 (= lt!339927 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339928 lt!339929 mask!3328))))

(declare-fun lt!339926 () SeekEntryResult!7799)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763756 (= lt!339926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339928 mask!3328) lt!339928 lt!339929 mask!3328))))

(assert (=> b!763756 (= lt!339928 (select (store (arr!20199 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!763756 (= lt!339929 (array!42184 (store (arr!20199 a!3186) i!1173 k!2102) (size!20620 a!3186)))))

(declare-fun b!763757 () Bool)

(declare-fun res!516677 () Bool)

(assert (=> b!763757 (=> (not res!516677) (not e!425480))))

(assert (=> b!763757 (= res!516677 (and (= (size!20620 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20620 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20620 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763758 () Bool)

(declare-fun res!516685 () Bool)

(assert (=> b!763758 (=> (not res!516685) (not e!425482))))

(assert (=> b!763758 (= res!516685 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20199 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763759 () Bool)

(declare-fun lt!339925 () SeekEntryResult!7799)

(declare-fun e!425484 () Bool)

(assert (=> b!763759 (= e!425484 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20199 a!3186) j!159) a!3186 mask!3328) lt!339925))))

(declare-fun b!763760 () Bool)

(declare-fun res!516680 () Bool)

(assert (=> b!763760 (=> (not res!516680) (not e!425483))))

(declare-datatypes ((List!14201 0))(
  ( (Nil!14198) (Cons!14197 (h!15281 (_ BitVec 64)) (t!20516 List!14201)) )
))
(declare-fun arrayNoDuplicates!0 (array!42183 (_ BitVec 32) List!14201) Bool)

(assert (=> b!763760 (= res!516680 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14198))))

(declare-fun b!763761 () Bool)

(assert (=> b!763761 (= e!425483 e!425482)))

(declare-fun res!516688 () Bool)

(assert (=> b!763761 (=> (not res!516688) (not e!425482))))

(assert (=> b!763761 (= res!516688 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20199 a!3186) j!159) mask!3328) (select (arr!20199 a!3186) j!159) a!3186 mask!3328) lt!339925))))

(assert (=> b!763761 (= lt!339925 (Intermediate!7799 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763762 () Bool)

(declare-fun res!516686 () Bool)

(assert (=> b!763762 (=> (not res!516686) (not e!425482))))

(assert (=> b!763762 (= res!516686 e!425484)))

(declare-fun c!83923 () Bool)

(assert (=> b!763762 (= c!83923 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!763763 () Bool)

(declare-fun res!516683 () Bool)

(assert (=> b!763763 (=> (not res!516683) (not e!425483))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42183 (_ BitVec 32)) Bool)

(assert (=> b!763763 (= res!516683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!516681 () Bool)

(assert (=> start!66278 (=> (not res!516681) (not e!425480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66278 (= res!516681 (validMask!0 mask!3328))))

(assert (=> start!66278 e!425480))

(assert (=> start!66278 true))

(declare-fun array_inv!15995 (array!42183) Bool)

(assert (=> start!66278 (array_inv!15995 a!3186)))

(declare-fun b!763754 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42183 (_ BitVec 32)) SeekEntryResult!7799)

(assert (=> b!763754 (= e!425484 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20199 a!3186) j!159) a!3186 mask!3328) (Found!7799 j!159)))))

(assert (= (and start!66278 res!516681) b!763757))

(assert (= (and b!763757 res!516677) b!763751))

(assert (= (and b!763751 res!516687) b!763755))

(assert (= (and b!763755 res!516684) b!763753))

(assert (= (and b!763753 res!516682) b!763750))

(assert (= (and b!763750 res!516679) b!763763))

(assert (= (and b!763763 res!516683) b!763760))

(assert (= (and b!763760 res!516680) b!763752))

(assert (= (and b!763752 res!516678) b!763761))

(assert (= (and b!763761 res!516688) b!763758))

(assert (= (and b!763758 res!516685) b!763762))

(assert (= (and b!763762 c!83923) b!763759))

(assert (= (and b!763762 (not c!83923)) b!763754))

(assert (= (and b!763762 res!516686) b!763756))

(declare-fun m!710199 () Bool)

(assert (=> b!763755 m!710199))

(declare-fun m!710201 () Bool)

(assert (=> b!763754 m!710201))

(assert (=> b!763754 m!710201))

(declare-fun m!710203 () Bool)

(assert (=> b!763754 m!710203))

(declare-fun m!710205 () Bool)

(assert (=> start!66278 m!710205))

(declare-fun m!710207 () Bool)

(assert (=> start!66278 m!710207))

(declare-fun m!710209 () Bool)

(assert (=> b!763756 m!710209))

(declare-fun m!710211 () Bool)

(assert (=> b!763756 m!710211))

(declare-fun m!710213 () Bool)

(assert (=> b!763756 m!710213))

(declare-fun m!710215 () Bool)

(assert (=> b!763756 m!710215))

(declare-fun m!710217 () Bool)

(assert (=> b!763756 m!710217))

(assert (=> b!763756 m!710209))

(declare-fun m!710219 () Bool)

(assert (=> b!763763 m!710219))

(declare-fun m!710221 () Bool)

(assert (=> b!763753 m!710221))

(declare-fun m!710223 () Bool)

(assert (=> b!763760 m!710223))

(declare-fun m!710225 () Bool)

(assert (=> b!763750 m!710225))

(declare-fun m!710227 () Bool)

(assert (=> b!763758 m!710227))

(assert (=> b!763751 m!710201))

(assert (=> b!763751 m!710201))

(declare-fun m!710229 () Bool)

(assert (=> b!763751 m!710229))

(assert (=> b!763761 m!710201))

(assert (=> b!763761 m!710201))

(declare-fun m!710231 () Bool)

(assert (=> b!763761 m!710231))

(assert (=> b!763761 m!710231))

(assert (=> b!763761 m!710201))

(declare-fun m!710233 () Bool)

(assert (=> b!763761 m!710233))

(assert (=> b!763759 m!710201))

(assert (=> b!763759 m!710201))

(declare-fun m!710235 () Bool)

(assert (=> b!763759 m!710235))

(push 1)

