; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65422 () Bool)

(assert start!65422)

(declare-fun b!744837 () Bool)

(declare-fun e!416053 () Bool)

(declare-fun e!416051 () Bool)

(assert (=> b!744837 (= e!416053 e!416051)))

(declare-fun res!501794 () Bool)

(assert (=> b!744837 (=> (not res!501794) (not e!416051))))

(declare-datatypes ((SeekEntryResult!7511 0))(
  ( (MissingZero!7511 (index!32412 (_ BitVec 32))) (Found!7511 (index!32413 (_ BitVec 32))) (Intermediate!7511 (undefined!8323 Bool) (index!32414 (_ BitVec 32)) (x!63373 (_ BitVec 32))) (Undefined!7511) (MissingVacant!7511 (index!32415 (_ BitVec 32))) )
))
(declare-fun lt!330899 () SeekEntryResult!7511)

(declare-datatypes ((array!41595 0))(
  ( (array!41596 (arr!19911 (Array (_ BitVec 32) (_ BitVec 64))) (size!20332 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41595)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41595 (_ BitVec 32)) SeekEntryResult!7511)

(assert (=> b!744837 (= res!501794 (= (seekEntryOrOpen!0 (select (arr!19911 a!3186) j!159) a!3186 mask!3328) lt!330899))))

(assert (=> b!744837 (= lt!330899 (Found!7511 j!159))))

(declare-fun b!744838 () Bool)

(declare-fun e!416056 () Bool)

(declare-fun e!416057 () Bool)

(assert (=> b!744838 (= e!416056 e!416057)))

(declare-fun res!501793 () Bool)

(assert (=> b!744838 (=> (not res!501793) (not e!416057))))

(declare-fun lt!330895 () SeekEntryResult!7511)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!744838 (= res!501793 (or (= lt!330895 (MissingZero!7511 i!1173)) (= lt!330895 (MissingVacant!7511 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!744838 (= lt!330895 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!416055 () Bool)

(declare-fun b!744839 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41595 (_ BitVec 32)) SeekEntryResult!7511)

(assert (=> b!744839 (= e!416055 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19911 a!3186) j!159) a!3186 mask!3328) (Found!7511 j!159)))))

(declare-fun b!744840 () Bool)

(declare-fun e!416049 () Bool)

(assert (=> b!744840 (= e!416057 e!416049)))

(declare-fun res!501778 () Bool)

(assert (=> b!744840 (=> (not res!501778) (not e!416049))))

(declare-fun lt!330902 () SeekEntryResult!7511)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41595 (_ BitVec 32)) SeekEntryResult!7511)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!744840 (= res!501778 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19911 a!3186) j!159) mask!3328) (select (arr!19911 a!3186) j!159) a!3186 mask!3328) lt!330902))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!744840 (= lt!330902 (Intermediate!7511 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun lt!330898 () (_ BitVec 64))

(declare-fun e!416054 () Bool)

(declare-fun b!744841 () Bool)

(assert (=> b!744841 (= e!416054 (or (= (select (store (arr!19911 a!3186) i!1173 k!2102) index!1321) lt!330898) (not (= (select (store (arr!19911 a!3186) i!1173 k!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun b!744842 () Bool)

(declare-fun res!501789 () Bool)

(assert (=> b!744842 (=> res!501789 e!416054)))

(assert (=> b!744842 (= res!501789 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19911 a!3186) j!159) a!3186 mask!3328) (Found!7511 j!159))))))

(declare-fun b!744843 () Bool)

(declare-fun res!501783 () Bool)

(assert (=> b!744843 (=> (not res!501783) (not e!416057))))

(declare-datatypes ((List!13913 0))(
  ( (Nil!13910) (Cons!13909 (h!14981 (_ BitVec 64)) (t!20228 List!13913)) )
))
(declare-fun arrayNoDuplicates!0 (array!41595 (_ BitVec 32) List!13913) Bool)

(assert (=> b!744843 (= res!501783 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13910))))

(declare-fun b!744844 () Bool)

(declare-fun res!501788 () Bool)

(assert (=> b!744844 (=> (not res!501788) (not e!416057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41595 (_ BitVec 32)) Bool)

(assert (=> b!744844 (= res!501788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!744845 () Bool)

(declare-fun res!501785 () Bool)

(assert (=> b!744845 (=> (not res!501785) (not e!416056))))

(declare-fun arrayContainsKey!0 (array!41595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!744845 (= res!501785 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!501792 () Bool)

(assert (=> start!65422 (=> (not res!501792) (not e!416056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65422 (= res!501792 (validMask!0 mask!3328))))

(assert (=> start!65422 e!416056))

(assert (=> start!65422 true))

(declare-fun array_inv!15707 (array!41595) Bool)

(assert (=> start!65422 (array_inv!15707 a!3186)))

(declare-fun b!744846 () Bool)

(declare-fun res!501779 () Bool)

(assert (=> b!744846 (=> (not res!501779) (not e!416056))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!744846 (= res!501779 (validKeyInArray!0 (select (arr!19911 a!3186) j!159)))))

(declare-fun b!744847 () Bool)

(assert (=> b!744847 (= e!416051 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19911 a!3186) j!159) a!3186 mask!3328) lt!330899))))

(declare-fun b!744848 () Bool)

(declare-fun res!501786 () Bool)

(assert (=> b!744848 (=> (not res!501786) (not e!416049))))

(assert (=> b!744848 (= res!501786 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19911 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!744849 () Bool)

(declare-fun res!501784 () Bool)

(assert (=> b!744849 (=> (not res!501784) (not e!416057))))

(assert (=> b!744849 (= res!501784 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20332 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20332 a!3186))))))

(declare-fun b!744850 () Bool)

(declare-fun res!501790 () Bool)

(assert (=> b!744850 (=> (not res!501790) (not e!416049))))

(assert (=> b!744850 (= res!501790 e!416055)))

(declare-fun c!81910 () Bool)

(assert (=> b!744850 (= c!81910 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!744851 () Bool)

(declare-fun res!501791 () Bool)

(assert (=> b!744851 (=> (not res!501791) (not e!416056))))

(assert (=> b!744851 (= res!501791 (validKeyInArray!0 k!2102))))

(declare-fun b!744852 () Bool)

(assert (=> b!744852 (= e!416055 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19911 a!3186) j!159) a!3186 mask!3328) lt!330902))))

(declare-fun b!744853 () Bool)

(declare-fun e!416052 () Bool)

(assert (=> b!744853 (= e!416052 (not e!416054))))

(declare-fun res!501781 () Bool)

(assert (=> b!744853 (=> res!501781 e!416054)))

(declare-fun lt!330896 () SeekEntryResult!7511)

(assert (=> b!744853 (= res!501781 (or (not (is-Intermediate!7511 lt!330896)) (bvslt x!1131 (x!63373 lt!330896)) (not (= x!1131 (x!63373 lt!330896))) (not (= index!1321 (index!32414 lt!330896)))))))

(assert (=> b!744853 e!416053))

(declare-fun res!501782 () Bool)

(assert (=> b!744853 (=> (not res!501782) (not e!416053))))

(assert (=> b!744853 (= res!501782 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25502 0))(
  ( (Unit!25503) )
))
(declare-fun lt!330900 () Unit!25502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41595 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25502)

(assert (=> b!744853 (= lt!330900 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!744854 () Bool)

(declare-fun res!501780 () Bool)

(assert (=> b!744854 (=> (not res!501780) (not e!416056))))

(assert (=> b!744854 (= res!501780 (and (= (size!20332 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20332 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20332 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!744855 () Bool)

(assert (=> b!744855 (= e!416049 e!416052)))

(declare-fun res!501787 () Bool)

(assert (=> b!744855 (=> (not res!501787) (not e!416052))))

(declare-fun lt!330901 () SeekEntryResult!7511)

(assert (=> b!744855 (= res!501787 (= lt!330901 lt!330896))))

(declare-fun lt!330897 () array!41595)

(assert (=> b!744855 (= lt!330896 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330898 lt!330897 mask!3328))))

(assert (=> b!744855 (= lt!330901 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330898 mask!3328) lt!330898 lt!330897 mask!3328))))

(assert (=> b!744855 (= lt!330898 (select (store (arr!19911 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!744855 (= lt!330897 (array!41596 (store (arr!19911 a!3186) i!1173 k!2102) (size!20332 a!3186)))))

(assert (= (and start!65422 res!501792) b!744854))

(assert (= (and b!744854 res!501780) b!744846))

(assert (= (and b!744846 res!501779) b!744851))

(assert (= (and b!744851 res!501791) b!744845))

(assert (= (and b!744845 res!501785) b!744838))

(assert (= (and b!744838 res!501793) b!744844))

(assert (= (and b!744844 res!501788) b!744843))

(assert (= (and b!744843 res!501783) b!744849))

(assert (= (and b!744849 res!501784) b!744840))

(assert (= (and b!744840 res!501778) b!744848))

(assert (= (and b!744848 res!501786) b!744850))

(assert (= (and b!744850 c!81910) b!744852))

(assert (= (and b!744850 (not c!81910)) b!744839))

(assert (= (and b!744850 res!501790) b!744855))

(assert (= (and b!744855 res!501787) b!744853))

(assert (= (and b!744853 res!501782) b!744837))

(assert (= (and b!744837 res!501794) b!744847))

(assert (= (and b!744853 (not res!501781)) b!744842))

(assert (= (and b!744842 (not res!501789)) b!744841))

(declare-fun m!695305 () Bool)

(assert (=> b!744846 m!695305))

(assert (=> b!744846 m!695305))

(declare-fun m!695307 () Bool)

(assert (=> b!744846 m!695307))

(declare-fun m!695309 () Bool)

(assert (=> b!744848 m!695309))

(declare-fun m!695311 () Bool)

(assert (=> b!744851 m!695311))

(assert (=> b!744837 m!695305))

(assert (=> b!744837 m!695305))

(declare-fun m!695313 () Bool)

(assert (=> b!744837 m!695313))

(assert (=> b!744839 m!695305))

(assert (=> b!744839 m!695305))

(declare-fun m!695315 () Bool)

(assert (=> b!744839 m!695315))

(assert (=> b!744840 m!695305))

(assert (=> b!744840 m!695305))

(declare-fun m!695317 () Bool)

(assert (=> b!744840 m!695317))

(assert (=> b!744840 m!695317))

(assert (=> b!744840 m!695305))

(declare-fun m!695319 () Bool)

(assert (=> b!744840 m!695319))

(declare-fun m!695321 () Bool)

(assert (=> b!744844 m!695321))

(declare-fun m!695323 () Bool)

(assert (=> b!744855 m!695323))

(declare-fun m!695325 () Bool)

(assert (=> b!744855 m!695325))

(declare-fun m!695327 () Bool)

(assert (=> b!744855 m!695327))

(assert (=> b!744855 m!695323))

(declare-fun m!695329 () Bool)

(assert (=> b!744855 m!695329))

(declare-fun m!695331 () Bool)

(assert (=> b!744855 m!695331))

(assert (=> b!744852 m!695305))

(assert (=> b!744852 m!695305))

(declare-fun m!695333 () Bool)

(assert (=> b!744852 m!695333))

(declare-fun m!695335 () Bool)

(assert (=> b!744853 m!695335))

(declare-fun m!695337 () Bool)

(assert (=> b!744853 m!695337))

(assert (=> b!744842 m!695305))

(assert (=> b!744842 m!695305))

(assert (=> b!744842 m!695315))

(assert (=> b!744841 m!695329))

(declare-fun m!695339 () Bool)

(assert (=> b!744841 m!695339))

(declare-fun m!695341 () Bool)

(assert (=> b!744845 m!695341))

(declare-fun m!695343 () Bool)

(assert (=> b!744843 m!695343))

(declare-fun m!695345 () Bool)

(assert (=> start!65422 m!695345))

(declare-fun m!695347 () Bool)

(assert (=> start!65422 m!695347))

(assert (=> b!744847 m!695305))

(assert (=> b!744847 m!695305))

(declare-fun m!695349 () Bool)

(assert (=> b!744847 m!695349))

(declare-fun m!695351 () Bool)

(assert (=> b!744838 m!695351))

(push 1)

(assert (not b!744847))

(assert (not b!744840))

(assert (not b!744843))

(assert (not b!744851))

(assert (not b!744838))

(assert (not b!744837))

(assert (not b!744839))

(assert (not b!744853))

(assert (not b!744855))

(assert (not b!744852))

(assert (not b!744845))

(assert (not b!744844))

(assert (not b!744846))

(assert (not start!65422))

(assert (not b!744842))

(check-sat)

(pop 1)

(push 1)

(check-sat)

