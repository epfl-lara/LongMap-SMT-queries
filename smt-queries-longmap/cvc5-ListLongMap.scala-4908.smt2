; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67692 () Bool)

(assert start!67692)

(declare-fun b!784586 () Bool)

(declare-fun res!530971 () Bool)

(declare-fun e!436213 () Bool)

(assert (=> b!784586 (=> (not res!530971) (not e!436213))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42732 0))(
  ( (array!42733 (arr!20454 (Array (_ BitVec 32) (_ BitVec 64))) (size!20875 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42732)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!784586 (= res!530971 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20454 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!784587 () Bool)

(declare-fun res!530966 () Bool)

(declare-fun e!436217 () Bool)

(assert (=> b!784587 (=> (not res!530966) (not e!436217))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42732 (_ BitVec 32)) Bool)

(assert (=> b!784587 (= res!530966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!530969 () Bool)

(declare-fun e!436212 () Bool)

(assert (=> start!67692 (=> (not res!530969) (not e!436212))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67692 (= res!530969 (validMask!0 mask!3328))))

(assert (=> start!67692 e!436212))

(assert (=> start!67692 true))

(declare-fun array_inv!16250 (array!42732) Bool)

(assert (=> start!67692 (array_inv!16250 a!3186)))

(declare-fun b!784588 () Bool)

(declare-fun res!530968 () Bool)

(assert (=> b!784588 (=> (not res!530968) (not e!436217))))

(declare-datatypes ((List!14456 0))(
  ( (Nil!14453) (Cons!14452 (h!15575 (_ BitVec 64)) (t!20771 List!14456)) )
))
(declare-fun arrayNoDuplicates!0 (array!42732 (_ BitVec 32) List!14456) Bool)

(assert (=> b!784588 (= res!530968 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14453))))

(declare-fun b!784589 () Bool)

(declare-fun res!530970 () Bool)

(assert (=> b!784589 (=> (not res!530970) (not e!436212))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!784589 (= res!530970 (validKeyInArray!0 k!2102))))

(declare-fun b!784590 () Bool)

(declare-datatypes ((Unit!27104 0))(
  ( (Unit!27105) )
))
(declare-fun e!436210 () Unit!27104)

(declare-fun Unit!27106 () Unit!27104)

(assert (=> b!784590 (= e!436210 Unit!27106)))

(assert (=> b!784590 false))

(declare-fun b!784591 () Bool)

(declare-fun res!530961 () Bool)

(assert (=> b!784591 (=> (not res!530961) (not e!436212))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!784591 (= res!530961 (and (= (size!20875 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20875 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20875 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!784592 () Bool)

(declare-fun e!436216 () Bool)

(declare-fun e!436214 () Bool)

(assert (=> b!784592 (= e!436216 e!436214)))

(declare-fun res!530959 () Bool)

(assert (=> b!784592 (=> res!530959 e!436214)))

(declare-fun lt!349762 () (_ BitVec 64))

(declare-fun lt!349763 () (_ BitVec 64))

(assert (=> b!784592 (= res!530959 (= lt!349762 lt!349763))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!784592 (= lt!349762 (select (store (arr!20454 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!784593 () Bool)

(declare-fun e!436220 () Bool)

(declare-datatypes ((SeekEntryResult!8054 0))(
  ( (MissingZero!8054 (index!34584 (_ BitVec 32))) (Found!8054 (index!34585 (_ BitVec 32))) (Intermediate!8054 (undefined!8866 Bool) (index!34586 (_ BitVec 32)) (x!65538 (_ BitVec 32))) (Undefined!8054) (MissingVacant!8054 (index!34587 (_ BitVec 32))) )
))
(declare-fun lt!349769 () SeekEntryResult!8054)

(declare-fun lt!349767 () SeekEntryResult!8054)

(assert (=> b!784593 (= e!436220 (= lt!349769 lt!349767))))

(declare-fun b!784594 () Bool)

(declare-fun Unit!27107 () Unit!27104)

(assert (=> b!784594 (= e!436210 Unit!27107)))

(declare-fun b!784595 () Bool)

(declare-fun res!530957 () Bool)

(assert (=> b!784595 (=> (not res!530957) (not e!436212))))

(assert (=> b!784595 (= res!530957 (validKeyInArray!0 (select (arr!20454 a!3186) j!159)))))

(declare-fun b!784596 () Bool)

(declare-fun e!436215 () Bool)

(declare-fun e!436209 () Bool)

(assert (=> b!784596 (= e!436215 (not e!436209))))

(declare-fun res!530964 () Bool)

(assert (=> b!784596 (=> res!530964 e!436209)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!349766 () SeekEntryResult!8054)

(assert (=> b!784596 (= res!530964 (or (not (is-Intermediate!8054 lt!349766)) (bvslt x!1131 (x!65538 lt!349766)) (not (= x!1131 (x!65538 lt!349766))) (not (= index!1321 (index!34586 lt!349766)))))))

(declare-fun e!436218 () Bool)

(assert (=> b!784596 e!436218))

(declare-fun res!530960 () Bool)

(assert (=> b!784596 (=> (not res!530960) (not e!436218))))

(declare-fun lt!349768 () SeekEntryResult!8054)

(assert (=> b!784596 (= res!530960 (= lt!349769 lt!349768))))

(assert (=> b!784596 (= lt!349768 (Found!8054 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42732 (_ BitVec 32)) SeekEntryResult!8054)

(assert (=> b!784596 (= lt!349769 (seekEntryOrOpen!0 (select (arr!20454 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!784596 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349771 () Unit!27104)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42732 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27104)

(assert (=> b!784596 (= lt!349771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!784597 () Bool)

(assert (=> b!784597 (= e!436209 e!436216)))

(declare-fun res!530967 () Bool)

(assert (=> b!784597 (=> res!530967 e!436216)))

(assert (=> b!784597 (= res!530967 (not (= lt!349767 lt!349768)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42732 (_ BitVec 32)) SeekEntryResult!8054)

(assert (=> b!784597 (= lt!349767 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20454 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!784598 () Bool)

(assert (=> b!784598 (= e!436217 e!436213)))

(declare-fun res!530963 () Bool)

(assert (=> b!784598 (=> (not res!530963) (not e!436213))))

(declare-fun lt!349764 () SeekEntryResult!8054)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42732 (_ BitVec 32)) SeekEntryResult!8054)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!784598 (= res!530963 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20454 a!3186) j!159) mask!3328) (select (arr!20454 a!3186) j!159) a!3186 mask!3328) lt!349764))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!784598 (= lt!349764 (Intermediate!8054 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!436219 () Bool)

(declare-fun b!784599 () Bool)

(assert (=> b!784599 (= e!436219 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20454 a!3186) j!159) a!3186 mask!3328) (Found!8054 j!159)))))

(declare-fun b!784600 () Bool)

(declare-fun res!530973 () Bool)

(assert (=> b!784600 (=> (not res!530973) (not e!436213))))

(assert (=> b!784600 (= res!530973 e!436219)))

(declare-fun c!87222 () Bool)

(assert (=> b!784600 (= c!87222 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!784601 () Bool)

(assert (=> b!784601 (= e!436212 e!436217)))

(declare-fun res!530958 () Bool)

(assert (=> b!784601 (=> (not res!530958) (not e!436217))))

(declare-fun lt!349770 () SeekEntryResult!8054)

(assert (=> b!784601 (= res!530958 (or (= lt!349770 (MissingZero!8054 i!1173)) (= lt!349770 (MissingVacant!8054 i!1173))))))

(assert (=> b!784601 (= lt!349770 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!784602 () Bool)

(assert (=> b!784602 (= e!436218 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20454 a!3186) j!159) a!3186 mask!3328) lt!349768))))

(declare-fun b!784603 () Bool)

(declare-fun res!530975 () Bool)

(assert (=> b!784603 (=> (not res!530975) (not e!436220))))

(declare-fun lt!349765 () array!42732)

(assert (=> b!784603 (= res!530975 (= (seekEntryOrOpen!0 lt!349763 lt!349765 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349763 lt!349765 mask!3328)))))

(declare-fun b!784604 () Bool)

(declare-fun res!530972 () Bool)

(assert (=> b!784604 (=> (not res!530972) (not e!436217))))

(assert (=> b!784604 (= res!530972 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20875 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20875 a!3186))))))

(declare-fun b!784605 () Bool)

(declare-fun res!530974 () Bool)

(assert (=> b!784605 (=> (not res!530974) (not e!436212))))

(declare-fun arrayContainsKey!0 (array!42732 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!784605 (= res!530974 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!784606 () Bool)

(assert (=> b!784606 (= e!436213 e!436215)))

(declare-fun res!530962 () Bool)

(assert (=> b!784606 (=> (not res!530962) (not e!436215))))

(declare-fun lt!349772 () SeekEntryResult!8054)

(assert (=> b!784606 (= res!530962 (= lt!349772 lt!349766))))

(assert (=> b!784606 (= lt!349766 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349763 lt!349765 mask!3328))))

(assert (=> b!784606 (= lt!349772 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349763 mask!3328) lt!349763 lt!349765 mask!3328))))

(assert (=> b!784606 (= lt!349763 (select (store (arr!20454 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!784606 (= lt!349765 (array!42733 (store (arr!20454 a!3186) i!1173 k!2102) (size!20875 a!3186)))))

(declare-fun b!784607 () Bool)

(assert (=> b!784607 (= e!436214 true)))

(assert (=> b!784607 e!436220))

(declare-fun res!530965 () Bool)

(assert (=> b!784607 (=> (not res!530965) (not e!436220))))

(assert (=> b!784607 (= res!530965 (= lt!349762 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349761 () Unit!27104)

(assert (=> b!784607 (= lt!349761 e!436210)))

(declare-fun c!87223 () Bool)

(assert (=> b!784607 (= c!87223 (= lt!349762 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!784608 () Bool)

(assert (=> b!784608 (= e!436219 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20454 a!3186) j!159) a!3186 mask!3328) lt!349764))))

(assert (= (and start!67692 res!530969) b!784591))

(assert (= (and b!784591 res!530961) b!784595))

(assert (= (and b!784595 res!530957) b!784589))

(assert (= (and b!784589 res!530970) b!784605))

(assert (= (and b!784605 res!530974) b!784601))

(assert (= (and b!784601 res!530958) b!784587))

(assert (= (and b!784587 res!530966) b!784588))

(assert (= (and b!784588 res!530968) b!784604))

(assert (= (and b!784604 res!530972) b!784598))

(assert (= (and b!784598 res!530963) b!784586))

(assert (= (and b!784586 res!530971) b!784600))

(assert (= (and b!784600 c!87222) b!784608))

(assert (= (and b!784600 (not c!87222)) b!784599))

(assert (= (and b!784600 res!530973) b!784606))

(assert (= (and b!784606 res!530962) b!784596))

(assert (= (and b!784596 res!530960) b!784602))

(assert (= (and b!784596 (not res!530964)) b!784597))

(assert (= (and b!784597 (not res!530967)) b!784592))

(assert (= (and b!784592 (not res!530959)) b!784607))

(assert (= (and b!784607 c!87223) b!784590))

(assert (= (and b!784607 (not c!87223)) b!784594))

(assert (= (and b!784607 res!530965) b!784603))

(assert (= (and b!784603 res!530975) b!784593))

(declare-fun m!726869 () Bool)

(assert (=> b!784597 m!726869))

(assert (=> b!784597 m!726869))

(declare-fun m!726871 () Bool)

(assert (=> b!784597 m!726871))

(assert (=> b!784602 m!726869))

(assert (=> b!784602 m!726869))

(declare-fun m!726873 () Bool)

(assert (=> b!784602 m!726873))

(declare-fun m!726875 () Bool)

(assert (=> b!784601 m!726875))

(assert (=> b!784596 m!726869))

(assert (=> b!784596 m!726869))

(declare-fun m!726877 () Bool)

(assert (=> b!784596 m!726877))

(declare-fun m!726879 () Bool)

(assert (=> b!784596 m!726879))

(declare-fun m!726881 () Bool)

(assert (=> b!784596 m!726881))

(assert (=> b!784608 m!726869))

(assert (=> b!784608 m!726869))

(declare-fun m!726883 () Bool)

(assert (=> b!784608 m!726883))

(assert (=> b!784598 m!726869))

(assert (=> b!784598 m!726869))

(declare-fun m!726885 () Bool)

(assert (=> b!784598 m!726885))

(assert (=> b!784598 m!726885))

(assert (=> b!784598 m!726869))

(declare-fun m!726887 () Bool)

(assert (=> b!784598 m!726887))

(declare-fun m!726889 () Bool)

(assert (=> b!784592 m!726889))

(declare-fun m!726891 () Bool)

(assert (=> b!784592 m!726891))

(declare-fun m!726893 () Bool)

(assert (=> b!784588 m!726893))

(declare-fun m!726895 () Bool)

(assert (=> b!784587 m!726895))

(declare-fun m!726897 () Bool)

(assert (=> start!67692 m!726897))

(declare-fun m!726899 () Bool)

(assert (=> start!67692 m!726899))

(declare-fun m!726901 () Bool)

(assert (=> b!784589 m!726901))

(declare-fun m!726903 () Bool)

(assert (=> b!784605 m!726903))

(declare-fun m!726905 () Bool)

(assert (=> b!784603 m!726905))

(declare-fun m!726907 () Bool)

(assert (=> b!784603 m!726907))

(assert (=> b!784599 m!726869))

(assert (=> b!784599 m!726869))

(assert (=> b!784599 m!726871))

(assert (=> b!784595 m!726869))

(assert (=> b!784595 m!726869))

(declare-fun m!726909 () Bool)

(assert (=> b!784595 m!726909))

(declare-fun m!726911 () Bool)

(assert (=> b!784606 m!726911))

(declare-fun m!726913 () Bool)

(assert (=> b!784606 m!726913))

(declare-fun m!726915 () Bool)

(assert (=> b!784606 m!726915))

(declare-fun m!726917 () Bool)

(assert (=> b!784606 m!726917))

(assert (=> b!784606 m!726915))

(assert (=> b!784606 m!726889))

(declare-fun m!726919 () Bool)

(assert (=> b!784586 m!726919))

(push 1)

