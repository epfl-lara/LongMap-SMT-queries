; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64498 () Bool)

(assert start!64498)

(declare-fun b!725774 () Bool)

(declare-fun e!406410 () Bool)

(declare-fun e!406408 () Bool)

(assert (=> b!725774 (= e!406410 e!406408)))

(declare-fun res!486839 () Bool)

(assert (=> b!725774 (=> (not res!486839) (not e!406408))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41016 0))(
  ( (array!41017 (arr!19629 (Array (_ BitVec 32) (_ BitVec 64))) (size!20050 (_ BitVec 32))) )
))
(declare-fun lt!321464 () array!41016)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!321467 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!7229 0))(
  ( (MissingZero!7229 (index!31284 (_ BitVec 32))) (Found!7229 (index!31285 (_ BitVec 32))) (Intermediate!7229 (undefined!8041 Bool) (index!31286 (_ BitVec 32)) (x!62279 (_ BitVec 32))) (Undefined!7229) (MissingVacant!7229 (index!31287 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41016 (_ BitVec 32)) SeekEntryResult!7229)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725774 (= res!486839 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321467 mask!3328) lt!321467 lt!321464 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321467 lt!321464 mask!3328)))))

(declare-fun a!3186 () array!41016)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!725774 (= lt!321467 (select (store (arr!19629 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725774 (= lt!321464 (array!41017 (store (arr!19629 a!3186) i!1173 k!2102) (size!20050 a!3186)))))

(declare-fun b!725775 () Bool)

(declare-fun res!486845 () Bool)

(declare-fun e!406414 () Bool)

(assert (=> b!725775 (=> (not res!486845) (not e!406414))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725775 (= res!486845 (validKeyInArray!0 (select (arr!19629 a!3186) j!159)))))

(declare-fun b!725776 () Bool)

(declare-fun e!406413 () Bool)

(assert (=> b!725776 (= e!406414 e!406413)))

(declare-fun res!486837 () Bool)

(assert (=> b!725776 (=> (not res!486837) (not e!406413))))

(declare-fun lt!321463 () SeekEntryResult!7229)

(assert (=> b!725776 (= res!486837 (or (= lt!321463 (MissingZero!7229 i!1173)) (= lt!321463 (MissingVacant!7229 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41016 (_ BitVec 32)) SeekEntryResult!7229)

(assert (=> b!725776 (= lt!321463 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725777 () Bool)

(declare-fun res!486843 () Bool)

(assert (=> b!725777 (=> (not res!486843) (not e!406414))))

(declare-fun arrayContainsKey!0 (array!41016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725777 (= res!486843 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!725778 () Bool)

(declare-fun lt!321462 () SeekEntryResult!7229)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!406412 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41016 (_ BitVec 32)) SeekEntryResult!7229)

(assert (=> b!725778 (= e!406412 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19629 a!3186) j!159) a!3186 mask!3328) lt!321462))))

(declare-fun b!725780 () Bool)

(declare-fun e!406415 () Bool)

(assert (=> b!725780 (= e!406415 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19629 a!3186) j!159) a!3186 mask!3328) (Found!7229 j!159)))))

(declare-fun b!725781 () Bool)

(declare-fun res!486835 () Bool)

(assert (=> b!725781 (=> (not res!486835) (not e!406413))))

(assert (=> b!725781 (= res!486835 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20050 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20050 a!3186))))))

(declare-fun b!725782 () Bool)

(declare-fun e!406411 () Bool)

(assert (=> b!725782 (= e!406411 e!406412)))

(declare-fun res!486840 () Bool)

(assert (=> b!725782 (=> (not res!486840) (not e!406412))))

(assert (=> b!725782 (= res!486840 (= (seekEntryOrOpen!0 (select (arr!19629 a!3186) j!159) a!3186 mask!3328) lt!321462))))

(assert (=> b!725782 (= lt!321462 (Found!7229 j!159))))

(declare-fun b!725783 () Bool)

(declare-fun res!486836 () Bool)

(assert (=> b!725783 (=> (not res!486836) (not e!406410))))

(assert (=> b!725783 (= res!486836 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19629 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725784 () Bool)

(assert (=> b!725784 (= e!406413 e!406410)))

(declare-fun res!486834 () Bool)

(assert (=> b!725784 (=> (not res!486834) (not e!406410))))

(declare-fun lt!321465 () SeekEntryResult!7229)

(assert (=> b!725784 (= res!486834 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19629 a!3186) j!159) mask!3328) (select (arr!19629 a!3186) j!159) a!3186 mask!3328) lt!321465))))

(assert (=> b!725784 (= lt!321465 (Intermediate!7229 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725779 () Bool)

(declare-fun res!486848 () Bool)

(assert (=> b!725779 (=> (not res!486848) (not e!406414))))

(assert (=> b!725779 (= res!486848 (validKeyInArray!0 k!2102))))

(declare-fun res!486844 () Bool)

(assert (=> start!64498 (=> (not res!486844) (not e!406414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64498 (= res!486844 (validMask!0 mask!3328))))

(assert (=> start!64498 e!406414))

(assert (=> start!64498 true))

(declare-fun array_inv!15425 (array!41016) Bool)

(assert (=> start!64498 (array_inv!15425 a!3186)))

(declare-fun b!725785 () Bool)

(declare-fun res!486846 () Bool)

(assert (=> b!725785 (=> (not res!486846) (not e!406414))))

(assert (=> b!725785 (= res!486846 (and (= (size!20050 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20050 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20050 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725786 () Bool)

(declare-fun res!486841 () Bool)

(assert (=> b!725786 (=> (not res!486841) (not e!406410))))

(assert (=> b!725786 (= res!486841 e!406415)))

(declare-fun c!79843 () Bool)

(assert (=> b!725786 (= c!79843 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725787 () Bool)

(assert (=> b!725787 (= e!406408 (not true))))

(assert (=> b!725787 e!406411))

(declare-fun res!486838 () Bool)

(assert (=> b!725787 (=> (not res!486838) (not e!406411))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41016 (_ BitVec 32)) Bool)

(assert (=> b!725787 (= res!486838 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24776 0))(
  ( (Unit!24777) )
))
(declare-fun lt!321466 () Unit!24776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41016 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24776)

(assert (=> b!725787 (= lt!321466 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725788 () Bool)

(assert (=> b!725788 (= e!406415 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19629 a!3186) j!159) a!3186 mask!3328) lt!321465))))

(declare-fun b!725789 () Bool)

(declare-fun res!486842 () Bool)

(assert (=> b!725789 (=> (not res!486842) (not e!406413))))

(assert (=> b!725789 (= res!486842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725790 () Bool)

(declare-fun res!486847 () Bool)

(assert (=> b!725790 (=> (not res!486847) (not e!406413))))

(declare-datatypes ((List!13631 0))(
  ( (Nil!13628) (Cons!13627 (h!14684 (_ BitVec 64)) (t!19946 List!13631)) )
))
(declare-fun arrayNoDuplicates!0 (array!41016 (_ BitVec 32) List!13631) Bool)

(assert (=> b!725790 (= res!486847 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13628))))

(assert (= (and start!64498 res!486844) b!725785))

(assert (= (and b!725785 res!486846) b!725775))

(assert (= (and b!725775 res!486845) b!725779))

(assert (= (and b!725779 res!486848) b!725777))

(assert (= (and b!725777 res!486843) b!725776))

(assert (= (and b!725776 res!486837) b!725789))

(assert (= (and b!725789 res!486842) b!725790))

(assert (= (and b!725790 res!486847) b!725781))

(assert (= (and b!725781 res!486835) b!725784))

(assert (= (and b!725784 res!486834) b!725783))

(assert (= (and b!725783 res!486836) b!725786))

(assert (= (and b!725786 c!79843) b!725788))

(assert (= (and b!725786 (not c!79843)) b!725780))

(assert (= (and b!725786 res!486841) b!725774))

(assert (= (and b!725774 res!486839) b!725787))

(assert (= (and b!725787 res!486838) b!725782))

(assert (= (and b!725782 res!486840) b!725778))

(declare-fun m!679903 () Bool)

(assert (=> b!725787 m!679903))

(declare-fun m!679905 () Bool)

(assert (=> b!725787 m!679905))

(declare-fun m!679907 () Bool)

(assert (=> b!725777 m!679907))

(declare-fun m!679909 () Bool)

(assert (=> b!725782 m!679909))

(assert (=> b!725782 m!679909))

(declare-fun m!679911 () Bool)

(assert (=> b!725782 m!679911))

(declare-fun m!679913 () Bool)

(assert (=> b!725774 m!679913))

(declare-fun m!679915 () Bool)

(assert (=> b!725774 m!679915))

(declare-fun m!679917 () Bool)

(assert (=> b!725774 m!679917))

(declare-fun m!679919 () Bool)

(assert (=> b!725774 m!679919))

(assert (=> b!725774 m!679913))

(declare-fun m!679921 () Bool)

(assert (=> b!725774 m!679921))

(declare-fun m!679923 () Bool)

(assert (=> b!725790 m!679923))

(declare-fun m!679925 () Bool)

(assert (=> start!64498 m!679925))

(declare-fun m!679927 () Bool)

(assert (=> start!64498 m!679927))

(assert (=> b!725784 m!679909))

(assert (=> b!725784 m!679909))

(declare-fun m!679929 () Bool)

(assert (=> b!725784 m!679929))

(assert (=> b!725784 m!679929))

(assert (=> b!725784 m!679909))

(declare-fun m!679931 () Bool)

(assert (=> b!725784 m!679931))

(assert (=> b!725780 m!679909))

(assert (=> b!725780 m!679909))

(declare-fun m!679933 () Bool)

(assert (=> b!725780 m!679933))

(assert (=> b!725788 m!679909))

(assert (=> b!725788 m!679909))

(declare-fun m!679935 () Bool)

(assert (=> b!725788 m!679935))

(declare-fun m!679937 () Bool)

(assert (=> b!725779 m!679937))

(declare-fun m!679939 () Bool)

(assert (=> b!725783 m!679939))

(declare-fun m!679941 () Bool)

(assert (=> b!725789 m!679941))

(assert (=> b!725775 m!679909))

(assert (=> b!725775 m!679909))

(declare-fun m!679943 () Bool)

(assert (=> b!725775 m!679943))

(assert (=> b!725778 m!679909))

(assert (=> b!725778 m!679909))

(declare-fun m!679945 () Bool)

(assert (=> b!725778 m!679945))

(declare-fun m!679947 () Bool)

(assert (=> b!725776 m!679947))

(push 1)

