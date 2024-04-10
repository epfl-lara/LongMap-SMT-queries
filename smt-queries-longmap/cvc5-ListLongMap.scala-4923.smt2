; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67782 () Bool)

(assert start!67782)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42822 0))(
  ( (array!42823 (arr!20499 (Array (_ BitVec 32) (_ BitVec 64))) (size!20920 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42822)

(declare-fun e!437837 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!787691 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8099 0))(
  ( (MissingZero!8099 (index!34764 (_ BitVec 32))) (Found!8099 (index!34765 (_ BitVec 32))) (Intermediate!8099 (undefined!8911 Bool) (index!34766 (_ BitVec 32)) (x!65703 (_ BitVec 32))) (Undefined!8099) (MissingVacant!8099 (index!34767 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42822 (_ BitVec 32)) SeekEntryResult!8099)

(assert (=> b!787691 (= e!437837 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20499 a!3186) j!159) a!3186 mask!3328) (Found!8099 j!159)))))

(declare-fun b!787692 () Bool)

(declare-fun res!533531 () Bool)

(declare-fun e!437831 () Bool)

(assert (=> b!787692 (=> (not res!533531) (not e!437831))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787692 (= res!533531 (validKeyInArray!0 k!2102))))

(declare-fun b!787693 () Bool)

(declare-fun res!533534 () Bool)

(assert (=> b!787693 (=> (not res!533534) (not e!437831))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!787693 (= res!533534 (and (= (size!20920 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20920 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20920 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787694 () Bool)

(declare-datatypes ((Unit!27284 0))(
  ( (Unit!27285) )
))
(declare-fun e!437835 () Unit!27284)

(declare-fun Unit!27286 () Unit!27284)

(assert (=> b!787694 (= e!437835 Unit!27286)))

(assert (=> b!787694 false))

(declare-fun b!787695 () Bool)

(declare-fun res!533535 () Bool)

(assert (=> b!787695 (=> (not res!533535) (not e!437831))))

(assert (=> b!787695 (= res!533535 (validKeyInArray!0 (select (arr!20499 a!3186) j!159)))))

(declare-fun b!787696 () Bool)

(declare-fun e!437832 () Bool)

(declare-fun e!437834 () Bool)

(assert (=> b!787696 (= e!437832 e!437834)))

(declare-fun res!533527 () Bool)

(assert (=> b!787696 (=> (not res!533527) (not e!437834))))

(declare-fun lt!351392 () SeekEntryResult!8099)

(declare-fun lt!351384 () SeekEntryResult!8099)

(assert (=> b!787696 (= res!533527 (= lt!351392 lt!351384))))

(declare-fun lt!351386 () array!42822)

(declare-fun lt!351389 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42822 (_ BitVec 32)) SeekEntryResult!8099)

(assert (=> b!787696 (= lt!351384 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351389 lt!351386 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787696 (= lt!351392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351389 mask!3328) lt!351389 lt!351386 mask!3328))))

(assert (=> b!787696 (= lt!351389 (select (store (arr!20499 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787696 (= lt!351386 (array!42823 (store (arr!20499 a!3186) i!1173 k!2102) (size!20920 a!3186)))))

(declare-fun b!787697 () Bool)

(declare-fun e!437840 () Bool)

(assert (=> b!787697 (= e!437840 e!437832)))

(declare-fun res!533532 () Bool)

(assert (=> b!787697 (=> (not res!533532) (not e!437832))))

(declare-fun lt!351387 () SeekEntryResult!8099)

(assert (=> b!787697 (= res!533532 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20499 a!3186) j!159) mask!3328) (select (arr!20499 a!3186) j!159) a!3186 mask!3328) lt!351387))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787697 (= lt!351387 (Intermediate!8099 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787698 () Bool)

(assert (=> b!787698 (= e!437837 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20499 a!3186) j!159) a!3186 mask!3328) lt!351387))))

(declare-fun b!787699 () Bool)

(declare-fun e!437833 () Bool)

(declare-fun e!437838 () Bool)

(assert (=> b!787699 (= e!437833 e!437838)))

(declare-fun res!533537 () Bool)

(assert (=> b!787699 (=> res!533537 e!437838)))

(declare-fun lt!351390 () (_ BitVec 64))

(assert (=> b!787699 (= res!533537 (= lt!351390 lt!351389))))

(assert (=> b!787699 (= lt!351390 (select (store (arr!20499 a!3186) i!1173 k!2102) index!1321))))

(declare-fun e!437839 () Bool)

(declare-fun lt!351382 () SeekEntryResult!8099)

(declare-fun b!787700 () Bool)

(assert (=> b!787700 (= e!437839 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20499 a!3186) j!159) a!3186 mask!3328) lt!351382))))

(declare-fun b!787701 () Bool)

(declare-fun res!533526 () Bool)

(assert (=> b!787701 (=> (not res!533526) (not e!437832))))

(assert (=> b!787701 (= res!533526 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20499 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!533533 () Bool)

(assert (=> start!67782 (=> (not res!533533) (not e!437831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67782 (= res!533533 (validMask!0 mask!3328))))

(assert (=> start!67782 e!437831))

(assert (=> start!67782 true))

(declare-fun array_inv!16295 (array!42822) Bool)

(assert (=> start!67782 (array_inv!16295 a!3186)))

(declare-fun b!787702 () Bool)

(declare-fun res!533530 () Bool)

(assert (=> b!787702 (=> (not res!533530) (not e!437840))))

(declare-datatypes ((List!14501 0))(
  ( (Nil!14498) (Cons!14497 (h!15620 (_ BitVec 64)) (t!20816 List!14501)) )
))
(declare-fun arrayNoDuplicates!0 (array!42822 (_ BitVec 32) List!14501) Bool)

(assert (=> b!787702 (= res!533530 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14498))))

(declare-fun b!787703 () Bool)

(declare-fun res!533525 () Bool)

(declare-fun e!437829 () Bool)

(assert (=> b!787703 (=> (not res!533525) (not e!437829))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42822 (_ BitVec 32)) SeekEntryResult!8099)

(assert (=> b!787703 (= res!533525 (= (seekEntryOrOpen!0 lt!351389 lt!351386 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351389 lt!351386 mask!3328)))))

(declare-fun b!787704 () Bool)

(declare-fun e!437830 () Bool)

(assert (=> b!787704 (= e!437830 e!437833)))

(declare-fun res!533538 () Bool)

(assert (=> b!787704 (=> res!533538 e!437833)))

(declare-fun lt!351385 () SeekEntryResult!8099)

(assert (=> b!787704 (= res!533538 (not (= lt!351385 lt!351382)))))

(assert (=> b!787704 (= lt!351385 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20499 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787705 () Bool)

(declare-fun res!533523 () Bool)

(assert (=> b!787705 (=> (not res!533523) (not e!437831))))

(declare-fun arrayContainsKey!0 (array!42822 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787705 (= res!533523 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787706 () Bool)

(assert (=> b!787706 (= e!437834 (not e!437830))))

(declare-fun res!533539 () Bool)

(assert (=> b!787706 (=> res!533539 e!437830)))

(assert (=> b!787706 (= res!533539 (or (not (is-Intermediate!8099 lt!351384)) (bvslt x!1131 (x!65703 lt!351384)) (not (= x!1131 (x!65703 lt!351384))) (not (= index!1321 (index!34766 lt!351384)))))))

(assert (=> b!787706 e!437839))

(declare-fun res!533529 () Bool)

(assert (=> b!787706 (=> (not res!533529) (not e!437839))))

(declare-fun lt!351381 () SeekEntryResult!8099)

(assert (=> b!787706 (= res!533529 (= lt!351381 lt!351382))))

(assert (=> b!787706 (= lt!351382 (Found!8099 j!159))))

(assert (=> b!787706 (= lt!351381 (seekEntryOrOpen!0 (select (arr!20499 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42822 (_ BitVec 32)) Bool)

(assert (=> b!787706 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351388 () Unit!27284)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42822 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27284)

(assert (=> b!787706 (= lt!351388 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787707 () Bool)

(assert (=> b!787707 (= e!437838 true)))

(assert (=> b!787707 e!437829))

(declare-fun res!533540 () Bool)

(assert (=> b!787707 (=> (not res!533540) (not e!437829))))

(assert (=> b!787707 (= res!533540 (= lt!351390 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!351383 () Unit!27284)

(assert (=> b!787707 (= lt!351383 e!437835)))

(declare-fun c!87493 () Bool)

(assert (=> b!787707 (= c!87493 (= lt!351390 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787708 () Bool)

(declare-fun res!533524 () Bool)

(assert (=> b!787708 (=> (not res!533524) (not e!437840))))

(assert (=> b!787708 (= res!533524 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20920 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20920 a!3186))))))

(declare-fun b!787709 () Bool)

(declare-fun Unit!27287 () Unit!27284)

(assert (=> b!787709 (= e!437835 Unit!27287)))

(declare-fun b!787710 () Bool)

(assert (=> b!787710 (= e!437829 (= lt!351381 lt!351385))))

(declare-fun b!787711 () Bool)

(assert (=> b!787711 (= e!437831 e!437840)))

(declare-fun res!533536 () Bool)

(assert (=> b!787711 (=> (not res!533536) (not e!437840))))

(declare-fun lt!351391 () SeekEntryResult!8099)

(assert (=> b!787711 (= res!533536 (or (= lt!351391 (MissingZero!8099 i!1173)) (= lt!351391 (MissingVacant!8099 i!1173))))))

(assert (=> b!787711 (= lt!351391 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787712 () Bool)

(declare-fun res!533522 () Bool)

(assert (=> b!787712 (=> (not res!533522) (not e!437832))))

(assert (=> b!787712 (= res!533522 e!437837)))

(declare-fun c!87492 () Bool)

(assert (=> b!787712 (= c!87492 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787713 () Bool)

(declare-fun res!533528 () Bool)

(assert (=> b!787713 (=> (not res!533528) (not e!437840))))

(assert (=> b!787713 (= res!533528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67782 res!533533) b!787693))

(assert (= (and b!787693 res!533534) b!787695))

(assert (= (and b!787695 res!533535) b!787692))

(assert (= (and b!787692 res!533531) b!787705))

(assert (= (and b!787705 res!533523) b!787711))

(assert (= (and b!787711 res!533536) b!787713))

(assert (= (and b!787713 res!533528) b!787702))

(assert (= (and b!787702 res!533530) b!787708))

(assert (= (and b!787708 res!533524) b!787697))

(assert (= (and b!787697 res!533532) b!787701))

(assert (= (and b!787701 res!533526) b!787712))

(assert (= (and b!787712 c!87492) b!787698))

(assert (= (and b!787712 (not c!87492)) b!787691))

(assert (= (and b!787712 res!533522) b!787696))

(assert (= (and b!787696 res!533527) b!787706))

(assert (= (and b!787706 res!533529) b!787700))

(assert (= (and b!787706 (not res!533539)) b!787704))

(assert (= (and b!787704 (not res!533538)) b!787699))

(assert (= (and b!787699 (not res!533537)) b!787707))

(assert (= (and b!787707 c!87493) b!787694))

(assert (= (and b!787707 (not c!87493)) b!787709))

(assert (= (and b!787707 res!533540) b!787703))

(assert (= (and b!787703 res!533525) b!787710))

(declare-fun m!729209 () Bool)

(assert (=> b!787698 m!729209))

(assert (=> b!787698 m!729209))

(declare-fun m!729211 () Bool)

(assert (=> b!787698 m!729211))

(declare-fun m!729213 () Bool)

(assert (=> b!787705 m!729213))

(assert (=> b!787706 m!729209))

(assert (=> b!787706 m!729209))

(declare-fun m!729215 () Bool)

(assert (=> b!787706 m!729215))

(declare-fun m!729217 () Bool)

(assert (=> b!787706 m!729217))

(declare-fun m!729219 () Bool)

(assert (=> b!787706 m!729219))

(declare-fun m!729221 () Bool)

(assert (=> b!787711 m!729221))

(declare-fun m!729223 () Bool)

(assert (=> b!787713 m!729223))

(assert (=> b!787704 m!729209))

(assert (=> b!787704 m!729209))

(declare-fun m!729225 () Bool)

(assert (=> b!787704 m!729225))

(declare-fun m!729227 () Bool)

(assert (=> b!787696 m!729227))

(declare-fun m!729229 () Bool)

(assert (=> b!787696 m!729229))

(declare-fun m!729231 () Bool)

(assert (=> b!787696 m!729231))

(declare-fun m!729233 () Bool)

(assert (=> b!787696 m!729233))

(assert (=> b!787696 m!729227))

(declare-fun m!729235 () Bool)

(assert (=> b!787696 m!729235))

(declare-fun m!729237 () Bool)

(assert (=> b!787702 m!729237))

(assert (=> b!787697 m!729209))

(assert (=> b!787697 m!729209))

(declare-fun m!729239 () Bool)

(assert (=> b!787697 m!729239))

(assert (=> b!787697 m!729239))

(assert (=> b!787697 m!729209))

(declare-fun m!729241 () Bool)

(assert (=> b!787697 m!729241))

(declare-fun m!729243 () Bool)

(assert (=> b!787703 m!729243))

(declare-fun m!729245 () Bool)

(assert (=> b!787703 m!729245))

(declare-fun m!729247 () Bool)

(assert (=> start!67782 m!729247))

(declare-fun m!729249 () Bool)

(assert (=> start!67782 m!729249))

(assert (=> b!787700 m!729209))

(assert (=> b!787700 m!729209))

(declare-fun m!729251 () Bool)

(assert (=> b!787700 m!729251))

(assert (=> b!787699 m!729229))

(declare-fun m!729253 () Bool)

(assert (=> b!787699 m!729253))

(declare-fun m!729255 () Bool)

(assert (=> b!787701 m!729255))

(assert (=> b!787695 m!729209))

(assert (=> b!787695 m!729209))

(declare-fun m!729257 () Bool)

(assert (=> b!787695 m!729257))

(assert (=> b!787691 m!729209))

(assert (=> b!787691 m!729209))

(assert (=> b!787691 m!729225))

(declare-fun m!729259 () Bool)

(assert (=> b!787692 m!729259))

(push 1)

