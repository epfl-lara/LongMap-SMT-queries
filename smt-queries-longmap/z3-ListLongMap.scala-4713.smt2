; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65318 () Bool)

(assert start!65318)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun e!414767 () Bool)

(declare-fun b!742175 () Bool)

(declare-datatypes ((array!41508 0))(
  ( (array!41509 (arr!19868 (Array (_ BitVec 32) (_ BitVec 64))) (size!20289 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41508)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7465 0))(
  ( (MissingZero!7465 (index!32228 (_ BitVec 32))) (Found!7465 (index!32229 (_ BitVec 32))) (Intermediate!7465 (undefined!8277 Bool) (index!32230 (_ BitVec 32)) (x!63210 (_ BitVec 32))) (Undefined!7465) (MissingVacant!7465 (index!32231 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41508 (_ BitVec 32)) SeekEntryResult!7465)

(assert (=> b!742175 (= e!414767 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19868 a!3186) j!159) a!3186 mask!3328) (Found!7465 j!159)))))

(declare-fun b!742176 () Bool)

(declare-fun e!414766 () Bool)

(declare-fun e!414763 () Bool)

(assert (=> b!742176 (= e!414766 e!414763)))

(declare-fun res!499508 () Bool)

(assert (=> b!742176 (=> (not res!499508) (not e!414763))))

(declare-fun lt!329581 () SeekEntryResult!7465)

(declare-fun lt!329579 () SeekEntryResult!7465)

(assert (=> b!742176 (= res!499508 (= lt!329581 lt!329579))))

(declare-fun lt!329576 () (_ BitVec 64))

(declare-fun lt!329575 () array!41508)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41508 (_ BitVec 32)) SeekEntryResult!7465)

(assert (=> b!742176 (= lt!329579 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329576 lt!329575 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!742176 (= lt!329581 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329576 mask!3328) lt!329576 lt!329575 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!742176 (= lt!329576 (select (store (arr!19868 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!742176 (= lt!329575 (array!41509 (store (arr!19868 a!3186) i!1173 k0!2102) (size!20289 a!3186)))))

(declare-fun b!742177 () Bool)

(declare-fun res!499513 () Bool)

(declare-fun e!414769 () Bool)

(assert (=> b!742177 (=> res!499513 e!414769)))

(assert (=> b!742177 (= res!499513 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19868 a!3186) j!159) a!3186 mask!3328) (Found!7465 j!159))))))

(declare-fun b!742178 () Bool)

(declare-fun res!499511 () Bool)

(declare-fun e!414761 () Bool)

(assert (=> b!742178 (=> (not res!499511) (not e!414761))))

(assert (=> b!742178 (= res!499511 (and (= (size!20289 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20289 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20289 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!742179 () Bool)

(declare-fun e!414768 () Bool)

(assert (=> b!742179 (= e!414761 e!414768)))

(declare-fun res!499509 () Bool)

(assert (=> b!742179 (=> (not res!499509) (not e!414768))))

(declare-fun lt!329578 () SeekEntryResult!7465)

(assert (=> b!742179 (= res!499509 (or (= lt!329578 (MissingZero!7465 i!1173)) (= lt!329578 (MissingVacant!7465 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41508 (_ BitVec 32)) SeekEntryResult!7465)

(assert (=> b!742179 (= lt!329578 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!499515 () Bool)

(assert (=> start!65318 (=> (not res!499515) (not e!414761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65318 (= res!499515 (validMask!0 mask!3328))))

(assert (=> start!65318 e!414761))

(assert (=> start!65318 true))

(declare-fun array_inv!15751 (array!41508) Bool)

(assert (=> start!65318 (array_inv!15751 a!3186)))

(declare-fun b!742180 () Bool)

(declare-fun res!499521 () Bool)

(assert (=> b!742180 (=> (not res!499521) (not e!414766))))

(assert (=> b!742180 (= res!499521 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19868 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!329580 () SeekEntryResult!7465)

(declare-fun b!742181 () Bool)

(assert (=> b!742181 (= e!414767 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19868 a!3186) j!159) a!3186 mask!3328) lt!329580))))

(declare-fun e!414762 () Bool)

(declare-fun b!742182 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun lt!329577 () SeekEntryResult!7465)

(assert (=> b!742182 (= e!414762 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19868 a!3186) j!159) a!3186 mask!3328) lt!329577))))

(declare-fun b!742183 () Bool)

(declare-fun res!499512 () Bool)

(assert (=> b!742183 (=> (not res!499512) (not e!414761))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!742183 (= res!499512 (validKeyInArray!0 k0!2102))))

(declare-fun b!742184 () Bool)

(declare-fun res!499516 () Bool)

(assert (=> b!742184 (=> (not res!499516) (not e!414766))))

(assert (=> b!742184 (= res!499516 e!414767)))

(declare-fun c!81714 () Bool)

(assert (=> b!742184 (= c!81714 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!742185 () Bool)

(declare-fun res!499523 () Bool)

(assert (=> b!742185 (=> (not res!499523) (not e!414761))))

(declare-fun arrayContainsKey!0 (array!41508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!742185 (= res!499523 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!742186 () Bool)

(assert (=> b!742186 (= e!414763 (not e!414769))))

(declare-fun res!499520 () Bool)

(assert (=> b!742186 (=> res!499520 e!414769)))

(get-info :version)

(assert (=> b!742186 (= res!499520 (or (not ((_ is Intermediate!7465) lt!329579)) (bvslt x!1131 (x!63210 lt!329579)) (not (= x!1131 (x!63210 lt!329579))) (not (= index!1321 (index!32230 lt!329579)))))))

(declare-fun e!414765 () Bool)

(assert (=> b!742186 e!414765))

(declare-fun res!499522 () Bool)

(assert (=> b!742186 (=> (not res!499522) (not e!414765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41508 (_ BitVec 32)) Bool)

(assert (=> b!742186 (= res!499522 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25382 0))(
  ( (Unit!25383) )
))
(declare-fun lt!329582 () Unit!25382)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41508 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25382)

(assert (=> b!742186 (= lt!329582 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!742187 () Bool)

(declare-fun res!499519 () Bool)

(assert (=> b!742187 (=> (not res!499519) (not e!414768))))

(assert (=> b!742187 (= res!499519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!742188 () Bool)

(assert (=> b!742188 (= e!414768 e!414766)))

(declare-fun res!499510 () Bool)

(assert (=> b!742188 (=> (not res!499510) (not e!414766))))

(assert (=> b!742188 (= res!499510 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19868 a!3186) j!159) mask!3328) (select (arr!19868 a!3186) j!159) a!3186 mask!3328) lt!329580))))

(assert (=> b!742188 (= lt!329580 (Intermediate!7465 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!742189 () Bool)

(declare-fun res!499517 () Bool)

(assert (=> b!742189 (=> (not res!499517) (not e!414768))))

(assert (=> b!742189 (= res!499517 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20289 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20289 a!3186))))))

(declare-fun b!742190 () Bool)

(assert (=> b!742190 (= e!414769 (or (not (= (select (store (arr!19868 a!3186) i!1173 k0!2102) index!1321) lt!329576)) (undefined!8277 lt!329579) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!742191 () Bool)

(assert (=> b!742191 (= e!414765 e!414762)))

(declare-fun res!499518 () Bool)

(assert (=> b!742191 (=> (not res!499518) (not e!414762))))

(assert (=> b!742191 (= res!499518 (= (seekEntryOrOpen!0 (select (arr!19868 a!3186) j!159) a!3186 mask!3328) lt!329577))))

(assert (=> b!742191 (= lt!329577 (Found!7465 j!159))))

(declare-fun b!742192 () Bool)

(declare-fun res!499524 () Bool)

(assert (=> b!742192 (=> (not res!499524) (not e!414761))))

(assert (=> b!742192 (= res!499524 (validKeyInArray!0 (select (arr!19868 a!3186) j!159)))))

(declare-fun b!742193 () Bool)

(declare-fun res!499514 () Bool)

(assert (=> b!742193 (=> (not res!499514) (not e!414768))))

(declare-datatypes ((List!13909 0))(
  ( (Nil!13906) (Cons!13905 (h!14977 (_ BitVec 64)) (t!20215 List!13909)) )
))
(declare-fun arrayNoDuplicates!0 (array!41508 (_ BitVec 32) List!13909) Bool)

(assert (=> b!742193 (= res!499514 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13906))))

(assert (= (and start!65318 res!499515) b!742178))

(assert (= (and b!742178 res!499511) b!742192))

(assert (= (and b!742192 res!499524) b!742183))

(assert (= (and b!742183 res!499512) b!742185))

(assert (= (and b!742185 res!499523) b!742179))

(assert (= (and b!742179 res!499509) b!742187))

(assert (= (and b!742187 res!499519) b!742193))

(assert (= (and b!742193 res!499514) b!742189))

(assert (= (and b!742189 res!499517) b!742188))

(assert (= (and b!742188 res!499510) b!742180))

(assert (= (and b!742180 res!499521) b!742184))

(assert (= (and b!742184 c!81714) b!742181))

(assert (= (and b!742184 (not c!81714)) b!742175))

(assert (= (and b!742184 res!499516) b!742176))

(assert (= (and b!742176 res!499508) b!742186))

(assert (= (and b!742186 res!499522) b!742191))

(assert (= (and b!742191 res!499518) b!742182))

(assert (= (and b!742186 (not res!499520)) b!742177))

(assert (= (and b!742177 (not res!499513)) b!742190))

(declare-fun m!692531 () Bool)

(assert (=> b!742183 m!692531))

(declare-fun m!692533 () Bool)

(assert (=> b!742186 m!692533))

(declare-fun m!692535 () Bool)

(assert (=> b!742186 m!692535))

(declare-fun m!692537 () Bool)

(assert (=> b!742182 m!692537))

(assert (=> b!742182 m!692537))

(declare-fun m!692539 () Bool)

(assert (=> b!742182 m!692539))

(assert (=> b!742188 m!692537))

(assert (=> b!742188 m!692537))

(declare-fun m!692541 () Bool)

(assert (=> b!742188 m!692541))

(assert (=> b!742188 m!692541))

(assert (=> b!742188 m!692537))

(declare-fun m!692543 () Bool)

(assert (=> b!742188 m!692543))

(declare-fun m!692545 () Bool)

(assert (=> b!742176 m!692545))

(declare-fun m!692547 () Bool)

(assert (=> b!742176 m!692547))

(declare-fun m!692549 () Bool)

(assert (=> b!742176 m!692549))

(declare-fun m!692551 () Bool)

(assert (=> b!742176 m!692551))

(assert (=> b!742176 m!692551))

(declare-fun m!692553 () Bool)

(assert (=> b!742176 m!692553))

(declare-fun m!692555 () Bool)

(assert (=> b!742180 m!692555))

(assert (=> b!742190 m!692547))

(declare-fun m!692557 () Bool)

(assert (=> b!742190 m!692557))

(assert (=> b!742181 m!692537))

(assert (=> b!742181 m!692537))

(declare-fun m!692559 () Bool)

(assert (=> b!742181 m!692559))

(declare-fun m!692561 () Bool)

(assert (=> b!742193 m!692561))

(assert (=> b!742175 m!692537))

(assert (=> b!742175 m!692537))

(declare-fun m!692563 () Bool)

(assert (=> b!742175 m!692563))

(declare-fun m!692565 () Bool)

(assert (=> b!742179 m!692565))

(assert (=> b!742192 m!692537))

(assert (=> b!742192 m!692537))

(declare-fun m!692567 () Bool)

(assert (=> b!742192 m!692567))

(declare-fun m!692569 () Bool)

(assert (=> b!742187 m!692569))

(declare-fun m!692571 () Bool)

(assert (=> start!65318 m!692571))

(declare-fun m!692573 () Bool)

(assert (=> start!65318 m!692573))

(declare-fun m!692575 () Bool)

(assert (=> b!742185 m!692575))

(assert (=> b!742191 m!692537))

(assert (=> b!742191 m!692537))

(declare-fun m!692577 () Bool)

(assert (=> b!742191 m!692577))

(assert (=> b!742177 m!692537))

(assert (=> b!742177 m!692537))

(assert (=> b!742177 m!692563))

(check-sat (not b!742188) (not b!742176) (not b!742191) (not b!742181) (not b!742177) (not b!742185) (not b!742175) (not b!742182) (not b!742193) (not b!742186) (not b!742187) (not b!742179) (not start!65318) (not b!742192) (not b!742183))
(check-sat)
