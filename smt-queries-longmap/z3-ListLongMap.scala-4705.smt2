; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65418 () Bool)

(assert start!65418)

(declare-fun b!741933 () Bool)

(declare-fun res!498842 () Bool)

(declare-fun e!414810 () Bool)

(assert (=> b!741933 (=> (not res!498842) (not e!414810))))

(declare-datatypes ((array!41461 0))(
  ( (array!41462 (arr!19840 (Array (_ BitVec 32) (_ BitVec 64))) (size!20260 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41461)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741933 (= res!498842 (validKeyInArray!0 (select (arr!19840 a!3186) j!159)))))

(declare-fun b!741935 () Bool)

(declare-fun res!498838 () Bool)

(declare-fun e!414811 () Bool)

(assert (=> b!741935 (=> (not res!498838) (not e!414811))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41461 (_ BitVec 32)) Bool)

(assert (=> b!741935 (= res!498838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741936 () Bool)

(declare-fun res!498835 () Bool)

(declare-fun e!414806 () Bool)

(assert (=> b!741936 (=> (not res!498835) (not e!414806))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!741936 (= res!498835 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19840 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741937 () Bool)

(declare-fun e!414808 () Bool)

(assert (=> b!741937 (= e!414806 e!414808)))

(declare-fun res!498837 () Bool)

(assert (=> b!741937 (=> (not res!498837) (not e!414808))))

(declare-datatypes ((SeekEntryResult!7396 0))(
  ( (MissingZero!7396 (index!31952 (_ BitVec 32))) (Found!7396 (index!31953 (_ BitVec 32))) (Intermediate!7396 (undefined!8208 Bool) (index!31954 (_ BitVec 32)) (x!63094 (_ BitVec 32))) (Undefined!7396) (MissingVacant!7396 (index!31955 (_ BitVec 32))) )
))
(declare-fun lt!329617 () SeekEntryResult!7396)

(declare-fun lt!329619 () SeekEntryResult!7396)

(assert (=> b!741937 (= res!498837 (= lt!329617 lt!329619))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!329618 () array!41461)

(declare-fun lt!329616 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41461 (_ BitVec 32)) SeekEntryResult!7396)

(assert (=> b!741937 (= lt!329619 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329616 lt!329618 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741937 (= lt!329617 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329616 mask!3328) lt!329616 lt!329618 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!741937 (= lt!329616 (select (store (arr!19840 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741937 (= lt!329618 (array!41462 (store (arr!19840 a!3186) i!1173 k0!2102) (size!20260 a!3186)))))

(declare-fun b!741938 () Bool)

(declare-fun res!498836 () Bool)

(assert (=> b!741938 (=> (not res!498836) (not e!414806))))

(declare-fun e!414812 () Bool)

(assert (=> b!741938 (= res!498836 e!414812)))

(declare-fun c!81935 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741938 (= c!81935 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741939 () Bool)

(declare-fun lt!329620 () SeekEntryResult!7396)

(assert (=> b!741939 (= e!414812 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329620))))

(declare-fun b!741940 () Bool)

(declare-fun e!414813 () Bool)

(declare-fun e!414809 () Bool)

(assert (=> b!741940 (= e!414813 e!414809)))

(declare-fun res!498833 () Bool)

(assert (=> b!741940 (=> (not res!498833) (not e!414809))))

(declare-fun lt!329615 () SeekEntryResult!7396)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41461 (_ BitVec 32)) SeekEntryResult!7396)

(assert (=> b!741940 (= res!498833 (= (seekEntryOrOpen!0 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329615))))

(assert (=> b!741940 (= lt!329615 (Found!7396 j!159))))

(declare-fun b!741941 () Bool)

(get-info :version)

(assert (=> b!741941 (= e!414808 (not (or (not ((_ is Intermediate!7396) lt!329619)) (not (= x!1131 (x!63094 lt!329619))) (not (= index!1321 (index!31954 lt!329619))) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(assert (=> b!741941 e!414813))

(declare-fun res!498841 () Bool)

(assert (=> b!741941 (=> (not res!498841) (not e!414813))))

(assert (=> b!741941 (= res!498841 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25351 0))(
  ( (Unit!25352) )
))
(declare-fun lt!329621 () Unit!25351)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41461 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25351)

(assert (=> b!741941 (= lt!329621 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741942 () Bool)

(assert (=> b!741942 (= e!414811 e!414806)))

(declare-fun res!498844 () Bool)

(assert (=> b!741942 (=> (not res!498844) (not e!414806))))

(assert (=> b!741942 (= res!498844 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19840 a!3186) j!159) mask!3328) (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329620))))

(assert (=> b!741942 (= lt!329620 (Intermediate!7396 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741943 () Bool)

(declare-fun res!498830 () Bool)

(assert (=> b!741943 (=> (not res!498830) (not e!414810))))

(assert (=> b!741943 (= res!498830 (validKeyInArray!0 k0!2102))))

(declare-fun b!741934 () Bool)

(declare-fun res!498831 () Bool)

(assert (=> b!741934 (=> (not res!498831) (not e!414811))))

(declare-datatypes ((List!13749 0))(
  ( (Nil!13746) (Cons!13745 (h!14823 (_ BitVec 64)) (t!20056 List!13749)) )
))
(declare-fun arrayNoDuplicates!0 (array!41461 (_ BitVec 32) List!13749) Bool)

(assert (=> b!741934 (= res!498831 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13746))))

(declare-fun res!498843 () Bool)

(assert (=> start!65418 (=> (not res!498843) (not e!414810))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65418 (= res!498843 (validMask!0 mask!3328))))

(assert (=> start!65418 e!414810))

(assert (=> start!65418 true))

(declare-fun array_inv!15699 (array!41461) Bool)

(assert (=> start!65418 (array_inv!15699 a!3186)))

(declare-fun b!741944 () Bool)

(declare-fun res!498840 () Bool)

(assert (=> b!741944 (=> (not res!498840) (not e!414810))))

(declare-fun arrayContainsKey!0 (array!41461 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741944 (= res!498840 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741945 () Bool)

(declare-fun res!498832 () Bool)

(assert (=> b!741945 (=> (not res!498832) (not e!414811))))

(assert (=> b!741945 (= res!498832 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20260 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20260 a!3186))))))

(declare-fun b!741946 () Bool)

(declare-fun res!498839 () Bool)

(assert (=> b!741946 (=> (not res!498839) (not e!414810))))

(assert (=> b!741946 (= res!498839 (and (= (size!20260 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20260 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20260 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741947 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41461 (_ BitVec 32)) SeekEntryResult!7396)

(assert (=> b!741947 (= e!414809 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) lt!329615))))

(declare-fun b!741948 () Bool)

(assert (=> b!741948 (= e!414810 e!414811)))

(declare-fun res!498834 () Bool)

(assert (=> b!741948 (=> (not res!498834) (not e!414811))))

(declare-fun lt!329622 () SeekEntryResult!7396)

(assert (=> b!741948 (= res!498834 (or (= lt!329622 (MissingZero!7396 i!1173)) (= lt!329622 (MissingVacant!7396 i!1173))))))

(assert (=> b!741948 (= lt!329622 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741949 () Bool)

(assert (=> b!741949 (= e!414812 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19840 a!3186) j!159) a!3186 mask!3328) (Found!7396 j!159)))))

(assert (= (and start!65418 res!498843) b!741946))

(assert (= (and b!741946 res!498839) b!741933))

(assert (= (and b!741933 res!498842) b!741943))

(assert (= (and b!741943 res!498830) b!741944))

(assert (= (and b!741944 res!498840) b!741948))

(assert (= (and b!741948 res!498834) b!741935))

(assert (= (and b!741935 res!498838) b!741934))

(assert (= (and b!741934 res!498831) b!741945))

(assert (= (and b!741945 res!498832) b!741942))

(assert (= (and b!741942 res!498844) b!741936))

(assert (= (and b!741936 res!498835) b!741938))

(assert (= (and b!741938 c!81935) b!741939))

(assert (= (and b!741938 (not c!81935)) b!741949))

(assert (= (and b!741938 res!498836) b!741937))

(assert (= (and b!741937 res!498837) b!741941))

(assert (= (and b!741941 res!498841) b!741940))

(assert (= (and b!741940 res!498833) b!741947))

(declare-fun m!693345 () Bool)

(assert (=> b!741943 m!693345))

(declare-fun m!693347 () Bool)

(assert (=> b!741947 m!693347))

(assert (=> b!741947 m!693347))

(declare-fun m!693349 () Bool)

(assert (=> b!741947 m!693349))

(declare-fun m!693351 () Bool)

(assert (=> b!741935 m!693351))

(assert (=> b!741942 m!693347))

(assert (=> b!741942 m!693347))

(declare-fun m!693353 () Bool)

(assert (=> b!741942 m!693353))

(assert (=> b!741942 m!693353))

(assert (=> b!741942 m!693347))

(declare-fun m!693355 () Bool)

(assert (=> b!741942 m!693355))

(declare-fun m!693357 () Bool)

(assert (=> b!741941 m!693357))

(declare-fun m!693359 () Bool)

(assert (=> b!741941 m!693359))

(assert (=> b!741940 m!693347))

(assert (=> b!741940 m!693347))

(declare-fun m!693361 () Bool)

(assert (=> b!741940 m!693361))

(assert (=> b!741949 m!693347))

(assert (=> b!741949 m!693347))

(declare-fun m!693363 () Bool)

(assert (=> b!741949 m!693363))

(declare-fun m!693365 () Bool)

(assert (=> b!741937 m!693365))

(declare-fun m!693367 () Bool)

(assert (=> b!741937 m!693367))

(declare-fun m!693369 () Bool)

(assert (=> b!741937 m!693369))

(declare-fun m!693371 () Bool)

(assert (=> b!741937 m!693371))

(declare-fun m!693373 () Bool)

(assert (=> b!741937 m!693373))

(assert (=> b!741937 m!693367))

(assert (=> b!741939 m!693347))

(assert (=> b!741939 m!693347))

(declare-fun m!693375 () Bool)

(assert (=> b!741939 m!693375))

(declare-fun m!693377 () Bool)

(assert (=> b!741936 m!693377))

(declare-fun m!693379 () Bool)

(assert (=> b!741948 m!693379))

(declare-fun m!693381 () Bool)

(assert (=> b!741944 m!693381))

(declare-fun m!693383 () Bool)

(assert (=> start!65418 m!693383))

(declare-fun m!693385 () Bool)

(assert (=> start!65418 m!693385))

(assert (=> b!741933 m!693347))

(assert (=> b!741933 m!693347))

(declare-fun m!693387 () Bool)

(assert (=> b!741933 m!693387))

(declare-fun m!693389 () Bool)

(assert (=> b!741934 m!693389))

(check-sat (not b!741937) (not b!741939) (not b!741933) (not b!741944) (not b!741949) (not b!741947) (not b!741935) (not b!741940) (not b!741942) (not start!65418) (not b!741941) (not b!741943) (not b!741934) (not b!741948))
(check-sat)
