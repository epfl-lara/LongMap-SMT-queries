; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65580 () Bool)

(assert start!65580)

(declare-fun b!746408 () Bool)

(declare-fun res!502830 () Bool)

(declare-fun e!416937 () Bool)

(assert (=> b!746408 (=> (not res!502830) (not e!416937))))

(declare-datatypes ((array!41623 0))(
  ( (array!41624 (arr!19921 (Array (_ BitVec 32) (_ BitVec 64))) (size!20341 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41623)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!746408 (= res!502830 (and (= (size!20341 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20341 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20341 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746409 () Bool)

(declare-fun res!502834 () Bool)

(declare-fun e!416932 () Bool)

(assert (=> b!746409 (=> (not res!502834) (not e!416932))))

(declare-datatypes ((List!13830 0))(
  ( (Nil!13827) (Cons!13826 (h!14904 (_ BitVec 64)) (t!20137 List!13830)) )
))
(declare-fun arrayNoDuplicates!0 (array!41623 (_ BitVec 32) List!13830) Bool)

(assert (=> b!746409 (= res!502834 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13827))))

(declare-fun b!746410 () Bool)

(assert (=> b!746410 (= e!416937 e!416932)))

(declare-fun res!502822 () Bool)

(assert (=> b!746410 (=> (not res!502822) (not e!416932))))

(declare-datatypes ((SeekEntryResult!7477 0))(
  ( (MissingZero!7477 (index!32276 (_ BitVec 32))) (Found!7477 (index!32277 (_ BitVec 32))) (Intermediate!7477 (undefined!8289 Bool) (index!32278 (_ BitVec 32)) (x!63391 (_ BitVec 32))) (Undefined!7477) (MissingVacant!7477 (index!32279 (_ BitVec 32))) )
))
(declare-fun lt!331608 () SeekEntryResult!7477)

(assert (=> b!746410 (= res!502822 (or (= lt!331608 (MissingZero!7477 i!1173)) (= lt!331608 (MissingVacant!7477 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41623 (_ BitVec 32)) SeekEntryResult!7477)

(assert (=> b!746410 (= lt!331608 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746411 () Bool)

(declare-fun res!502819 () Bool)

(assert (=> b!746411 (=> (not res!502819) (not e!416932))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!746411 (= res!502819 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20341 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20341 a!3186))))))

(declare-fun b!746412 () Bool)

(declare-fun res!502831 () Bool)

(assert (=> b!746412 (=> (not res!502831) (not e!416937))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746412 (= res!502831 (validKeyInArray!0 (select (arr!19921 a!3186) j!159)))))

(declare-fun b!746413 () Bool)

(declare-fun res!502832 () Bool)

(declare-fun e!416938 () Bool)

(assert (=> b!746413 (=> (not res!502832) (not e!416938))))

(declare-fun e!416933 () Bool)

(assert (=> b!746413 (= res!502832 e!416933)))

(declare-fun c!82178 () Bool)

(assert (=> b!746413 (= c!82178 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!416936 () Bool)

(declare-fun lt!331604 () SeekEntryResult!7477)

(declare-fun b!746414 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41623 (_ BitVec 32)) SeekEntryResult!7477)

(assert (=> b!746414 (= e!416936 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19921 a!3186) j!159) a!3186 mask!3328) lt!331604))))

(declare-fun b!746415 () Bool)

(assert (=> b!746415 (= e!416932 e!416938)))

(declare-fun res!502829 () Bool)

(assert (=> b!746415 (=> (not res!502829) (not e!416938))))

(declare-fun lt!331600 () SeekEntryResult!7477)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41623 (_ BitVec 32)) SeekEntryResult!7477)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746415 (= res!502829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19921 a!3186) j!159) mask!3328) (select (arr!19921 a!3186) j!159) a!3186 mask!3328) lt!331600))))

(assert (=> b!746415 (= lt!331600 (Intermediate!7477 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746416 () Bool)

(declare-fun res!502828 () Bool)

(assert (=> b!746416 (=> (not res!502828) (not e!416937))))

(assert (=> b!746416 (= res!502828 (validKeyInArray!0 k0!2102))))

(declare-fun b!746417 () Bool)

(declare-fun e!416940 () Bool)

(declare-fun e!416939 () Bool)

(assert (=> b!746417 (= e!416940 (not e!416939))))

(declare-fun res!502833 () Bool)

(assert (=> b!746417 (=> res!502833 e!416939)))

(declare-fun lt!331602 () SeekEntryResult!7477)

(get-info :version)

(assert (=> b!746417 (= res!502833 (or (not ((_ is Intermediate!7477) lt!331602)) (bvslt x!1131 (x!63391 lt!331602)) (not (= x!1131 (x!63391 lt!331602))) (not (= index!1321 (index!32278 lt!331602)))))))

(assert (=> b!746417 e!416936))

(declare-fun res!502827 () Bool)

(assert (=> b!746417 (=> (not res!502827) (not e!416936))))

(declare-fun lt!331607 () SeekEntryResult!7477)

(assert (=> b!746417 (= res!502827 (= lt!331607 lt!331604))))

(assert (=> b!746417 (= lt!331604 (Found!7477 j!159))))

(assert (=> b!746417 (= lt!331607 (seekEntryOrOpen!0 (select (arr!19921 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41623 (_ BitVec 32)) Bool)

(assert (=> b!746417 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25513 0))(
  ( (Unit!25514) )
))
(declare-fun lt!331603 () Unit!25513)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41623 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25513)

(assert (=> b!746417 (= lt!331603 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746418 () Bool)

(assert (=> b!746418 (= e!416933 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19921 a!3186) j!159) a!3186 mask!3328) lt!331600))))

(declare-fun b!746420 () Bool)

(declare-fun e!416934 () Bool)

(assert (=> b!746420 (= e!416934 true)))

(declare-fun lt!331601 () SeekEntryResult!7477)

(assert (=> b!746420 (= lt!331607 lt!331601)))

(declare-fun b!746421 () Bool)

(declare-fun res!502820 () Bool)

(assert (=> b!746421 (=> (not res!502820) (not e!416932))))

(assert (=> b!746421 (= res!502820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746422 () Bool)

(declare-fun res!502823 () Bool)

(assert (=> b!746422 (=> (not res!502823) (not e!416938))))

(assert (=> b!746422 (= res!502823 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19921 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746423 () Bool)

(declare-fun res!502826 () Bool)

(assert (=> b!746423 (=> (not res!502826) (not e!416937))))

(declare-fun arrayContainsKey!0 (array!41623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746423 (= res!502826 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746424 () Bool)

(assert (=> b!746424 (= e!416938 e!416940)))

(declare-fun res!502825 () Bool)

(assert (=> b!746424 (=> (not res!502825) (not e!416940))))

(declare-fun lt!331606 () SeekEntryResult!7477)

(assert (=> b!746424 (= res!502825 (= lt!331606 lt!331602))))

(declare-fun lt!331605 () array!41623)

(declare-fun lt!331599 () (_ BitVec 64))

(assert (=> b!746424 (= lt!331602 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331599 lt!331605 mask!3328))))

(assert (=> b!746424 (= lt!331606 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331599 mask!3328) lt!331599 lt!331605 mask!3328))))

(assert (=> b!746424 (= lt!331599 (select (store (arr!19921 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746424 (= lt!331605 (array!41624 (store (arr!19921 a!3186) i!1173 k0!2102) (size!20341 a!3186)))))

(declare-fun b!746425 () Bool)

(assert (=> b!746425 (= e!416933 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19921 a!3186) j!159) a!3186 mask!3328) (Found!7477 j!159)))))

(declare-fun b!746419 () Bool)

(assert (=> b!746419 (= e!416939 e!416934)))

(declare-fun res!502824 () Bool)

(assert (=> b!746419 (=> res!502824 e!416934)))

(assert (=> b!746419 (= res!502824 (or (not (= lt!331601 lt!331604)) (= (select (store (arr!19921 a!3186) i!1173 k0!2102) index!1321) lt!331599) (not (= (select (store (arr!19921 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!746419 (= lt!331601 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19921 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!502821 () Bool)

(assert (=> start!65580 (=> (not res!502821) (not e!416937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65580 (= res!502821 (validMask!0 mask!3328))))

(assert (=> start!65580 e!416937))

(assert (=> start!65580 true))

(declare-fun array_inv!15780 (array!41623) Bool)

(assert (=> start!65580 (array_inv!15780 a!3186)))

(assert (= (and start!65580 res!502821) b!746408))

(assert (= (and b!746408 res!502830) b!746412))

(assert (= (and b!746412 res!502831) b!746416))

(assert (= (and b!746416 res!502828) b!746423))

(assert (= (and b!746423 res!502826) b!746410))

(assert (= (and b!746410 res!502822) b!746421))

(assert (= (and b!746421 res!502820) b!746409))

(assert (= (and b!746409 res!502834) b!746411))

(assert (= (and b!746411 res!502819) b!746415))

(assert (= (and b!746415 res!502829) b!746422))

(assert (= (and b!746422 res!502823) b!746413))

(assert (= (and b!746413 c!82178) b!746418))

(assert (= (and b!746413 (not c!82178)) b!746425))

(assert (= (and b!746413 res!502832) b!746424))

(assert (= (and b!746424 res!502825) b!746417))

(assert (= (and b!746417 res!502827) b!746414))

(assert (= (and b!746417 (not res!502833)) b!746419))

(assert (= (and b!746419 (not res!502824)) b!746420))

(declare-fun m!697167 () Bool)

(assert (=> b!746412 m!697167))

(assert (=> b!746412 m!697167))

(declare-fun m!697169 () Bool)

(assert (=> b!746412 m!697169))

(declare-fun m!697171 () Bool)

(assert (=> start!65580 m!697171))

(declare-fun m!697173 () Bool)

(assert (=> start!65580 m!697173))

(declare-fun m!697175 () Bool)

(assert (=> b!746416 m!697175))

(declare-fun m!697177 () Bool)

(assert (=> b!746421 m!697177))

(declare-fun m!697179 () Bool)

(assert (=> b!746424 m!697179))

(declare-fun m!697181 () Bool)

(assert (=> b!746424 m!697181))

(declare-fun m!697183 () Bool)

(assert (=> b!746424 m!697183))

(declare-fun m!697185 () Bool)

(assert (=> b!746424 m!697185))

(assert (=> b!746424 m!697185))

(declare-fun m!697187 () Bool)

(assert (=> b!746424 m!697187))

(assert (=> b!746425 m!697167))

(assert (=> b!746425 m!697167))

(declare-fun m!697189 () Bool)

(assert (=> b!746425 m!697189))

(assert (=> b!746418 m!697167))

(assert (=> b!746418 m!697167))

(declare-fun m!697191 () Bool)

(assert (=> b!746418 m!697191))

(assert (=> b!746415 m!697167))

(assert (=> b!746415 m!697167))

(declare-fun m!697193 () Bool)

(assert (=> b!746415 m!697193))

(assert (=> b!746415 m!697193))

(assert (=> b!746415 m!697167))

(declare-fun m!697195 () Bool)

(assert (=> b!746415 m!697195))

(assert (=> b!746417 m!697167))

(assert (=> b!746417 m!697167))

(declare-fun m!697197 () Bool)

(assert (=> b!746417 m!697197))

(declare-fun m!697199 () Bool)

(assert (=> b!746417 m!697199))

(declare-fun m!697201 () Bool)

(assert (=> b!746417 m!697201))

(assert (=> b!746414 m!697167))

(assert (=> b!746414 m!697167))

(declare-fun m!697203 () Bool)

(assert (=> b!746414 m!697203))

(declare-fun m!697205 () Bool)

(assert (=> b!746410 m!697205))

(declare-fun m!697207 () Bool)

(assert (=> b!746422 m!697207))

(declare-fun m!697209 () Bool)

(assert (=> b!746409 m!697209))

(assert (=> b!746419 m!697181))

(declare-fun m!697211 () Bool)

(assert (=> b!746419 m!697211))

(assert (=> b!746419 m!697167))

(assert (=> b!746419 m!697167))

(assert (=> b!746419 m!697189))

(declare-fun m!697213 () Bool)

(assert (=> b!746423 m!697213))

(check-sat (not b!746421) (not b!746412) (not start!65580) (not b!746410) (not b!746419) (not b!746423) (not b!746414) (not b!746418) (not b!746425) (not b!746424) (not b!746417) (not b!746409) (not b!746415) (not b!746416))
(check-sat)
