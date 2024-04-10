; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66782 () Bool)

(assert start!66782)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42344 0))(
  ( (array!42345 (arr!20272 (Array (_ BitVec 32) (_ BitVec 64))) (size!20693 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42344)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!428666 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!769856 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7872 0))(
  ( (MissingZero!7872 (index!33856 (_ BitVec 32))) (Found!7872 (index!33857 (_ BitVec 32))) (Intermediate!7872 (undefined!8684 Bool) (index!33858 (_ BitVec 32)) (x!64787 (_ BitVec 32))) (Undefined!7872) (MissingVacant!7872 (index!33859 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42344 (_ BitVec 32)) SeekEntryResult!7872)

(assert (=> b!769856 (= e!428666 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) (Found!7872 j!159)))))

(declare-fun b!769857 () Bool)

(declare-fun lt!342583 () SeekEntryResult!7872)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42344 (_ BitVec 32)) SeekEntryResult!7872)

(assert (=> b!769857 (= e!428666 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!342583))))

(declare-fun res!520692 () Bool)

(declare-fun e!428662 () Bool)

(assert (=> start!66782 (=> (not res!520692) (not e!428662))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66782 (= res!520692 (validMask!0 mask!3328))))

(assert (=> start!66782 e!428662))

(assert (=> start!66782 true))

(declare-fun array_inv!16068 (array!42344) Bool)

(assert (=> start!66782 (array_inv!16068 a!3186)))

(declare-fun b!769858 () Bool)

(declare-fun e!428663 () Bool)

(declare-fun e!428661 () Bool)

(assert (=> b!769858 (= e!428663 e!428661)))

(declare-fun res!520696 () Bool)

(assert (=> b!769858 (=> (not res!520696) (not e!428661))))

(declare-fun lt!342574 () SeekEntryResult!7872)

(declare-fun lt!342579 () SeekEntryResult!7872)

(assert (=> b!769858 (= res!520696 (= lt!342574 lt!342579))))

(declare-fun lt!342578 () array!42344)

(declare-fun lt!342575 () (_ BitVec 64))

(assert (=> b!769858 (= lt!342579 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342575 lt!342578 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769858 (= lt!342574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342575 mask!3328) lt!342575 lt!342578 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!769858 (= lt!342575 (select (store (arr!20272 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!769858 (= lt!342578 (array!42345 (store (arr!20272 a!3186) i!1173 k0!2102) (size!20693 a!3186)))))

(declare-fun b!769859 () Bool)

(declare-fun e!428665 () Bool)

(declare-fun e!428664 () Bool)

(assert (=> b!769859 (= e!428665 e!428664)))

(declare-fun res!520691 () Bool)

(assert (=> b!769859 (=> (not res!520691) (not e!428664))))

(declare-fun lt!342576 () SeekEntryResult!7872)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42344 (_ BitVec 32)) SeekEntryResult!7872)

(assert (=> b!769859 (= res!520691 (= (seekEntryOrOpen!0 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!342576))))

(assert (=> b!769859 (= lt!342576 (Found!7872 j!159))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!769860 () Bool)

(assert (=> b!769860 (= e!428664 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!342576))))

(declare-fun b!769861 () Bool)

(declare-fun res!520695 () Bool)

(assert (=> b!769861 (=> (not res!520695) (not e!428663))))

(assert (=> b!769861 (= res!520695 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20272 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769862 () Bool)

(declare-fun e!428669 () Bool)

(assert (=> b!769862 (= e!428669 e!428663)))

(declare-fun res!520694 () Bool)

(assert (=> b!769862 (=> (not res!520694) (not e!428663))))

(assert (=> b!769862 (= res!520694 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20272 a!3186) j!159) mask!3328) (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!342583))))

(assert (=> b!769862 (= lt!342583 (Intermediate!7872 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769863 () Bool)

(declare-fun res!520690 () Bool)

(assert (=> b!769863 (=> (not res!520690) (not e!428663))))

(assert (=> b!769863 (= res!520690 e!428666)))

(declare-fun c!84982 () Bool)

(assert (=> b!769863 (= c!84982 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769864 () Bool)

(declare-fun e!428667 () Bool)

(assert (=> b!769864 (= e!428667 true)))

(declare-datatypes ((Unit!26502 0))(
  ( (Unit!26503) )
))
(declare-fun lt!342584 () Unit!26502)

(declare-fun e!428660 () Unit!26502)

(assert (=> b!769864 (= lt!342584 e!428660)))

(declare-fun c!84981 () Bool)

(assert (=> b!769864 (= c!84981 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!342581 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769864 (= lt!342581 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769865 () Bool)

(declare-fun Unit!26504 () Unit!26502)

(assert (=> b!769865 (= e!428660 Unit!26504)))

(assert (=> b!769865 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342581 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) lt!342583)))

(declare-fun b!769866 () Bool)

(declare-fun Unit!26505 () Unit!26502)

(assert (=> b!769866 (= e!428660 Unit!26505)))

(declare-fun lt!342577 () SeekEntryResult!7872)

(assert (=> b!769866 (= lt!342577 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20272 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!769866 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342581 resIntermediateIndex!5 (select (arr!20272 a!3186) j!159) a!3186 mask!3328) (Found!7872 j!159))))

(declare-fun b!769867 () Bool)

(assert (=> b!769867 (= e!428661 (not e!428667))))

(declare-fun res!520698 () Bool)

(assert (=> b!769867 (=> res!520698 e!428667)))

(get-info :version)

(assert (=> b!769867 (= res!520698 (or (not ((_ is Intermediate!7872) lt!342579)) (bvsge x!1131 (x!64787 lt!342579))))))

(assert (=> b!769867 e!428665))

(declare-fun res!520699 () Bool)

(assert (=> b!769867 (=> (not res!520699) (not e!428665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42344 (_ BitVec 32)) Bool)

(assert (=> b!769867 (= res!520699 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342580 () Unit!26502)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26502)

(assert (=> b!769867 (= lt!342580 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769868 () Bool)

(declare-fun res!520700 () Bool)

(assert (=> b!769868 (=> (not res!520700) (not e!428669))))

(assert (=> b!769868 (= res!520700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769869 () Bool)

(declare-fun res!520686 () Bool)

(assert (=> b!769869 (=> (not res!520686) (not e!428669))))

(assert (=> b!769869 (= res!520686 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20693 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20693 a!3186))))))

(declare-fun b!769870 () Bool)

(declare-fun res!520687 () Bool)

(assert (=> b!769870 (=> (not res!520687) (not e!428662))))

(declare-fun arrayContainsKey!0 (array!42344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769870 (= res!520687 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769871 () Bool)

(declare-fun res!520689 () Bool)

(assert (=> b!769871 (=> (not res!520689) (not e!428662))))

(assert (=> b!769871 (= res!520689 (and (= (size!20693 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20693 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20693 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769872 () Bool)

(assert (=> b!769872 (= e!428662 e!428669)))

(declare-fun res!520685 () Bool)

(assert (=> b!769872 (=> (not res!520685) (not e!428669))))

(declare-fun lt!342582 () SeekEntryResult!7872)

(assert (=> b!769872 (= res!520685 (or (= lt!342582 (MissingZero!7872 i!1173)) (= lt!342582 (MissingVacant!7872 i!1173))))))

(assert (=> b!769872 (= lt!342582 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!769873 () Bool)

(declare-fun res!520697 () Bool)

(assert (=> b!769873 (=> (not res!520697) (not e!428669))))

(declare-datatypes ((List!14274 0))(
  ( (Nil!14271) (Cons!14270 (h!15369 (_ BitVec 64)) (t!20589 List!14274)) )
))
(declare-fun arrayNoDuplicates!0 (array!42344 (_ BitVec 32) List!14274) Bool)

(assert (=> b!769873 (= res!520697 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14271))))

(declare-fun b!769874 () Bool)

(declare-fun res!520688 () Bool)

(assert (=> b!769874 (=> (not res!520688) (not e!428662))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769874 (= res!520688 (validKeyInArray!0 (select (arr!20272 a!3186) j!159)))))

(declare-fun b!769875 () Bool)

(declare-fun res!520693 () Bool)

(assert (=> b!769875 (=> (not res!520693) (not e!428662))))

(assert (=> b!769875 (= res!520693 (validKeyInArray!0 k0!2102))))

(assert (= (and start!66782 res!520692) b!769871))

(assert (= (and b!769871 res!520689) b!769874))

(assert (= (and b!769874 res!520688) b!769875))

(assert (= (and b!769875 res!520693) b!769870))

(assert (= (and b!769870 res!520687) b!769872))

(assert (= (and b!769872 res!520685) b!769868))

(assert (= (and b!769868 res!520700) b!769873))

(assert (= (and b!769873 res!520697) b!769869))

(assert (= (and b!769869 res!520686) b!769862))

(assert (= (and b!769862 res!520694) b!769861))

(assert (= (and b!769861 res!520695) b!769863))

(assert (= (and b!769863 c!84982) b!769857))

(assert (= (and b!769863 (not c!84982)) b!769856))

(assert (= (and b!769863 res!520690) b!769858))

(assert (= (and b!769858 res!520696) b!769867))

(assert (= (and b!769867 res!520699) b!769859))

(assert (= (and b!769859 res!520691) b!769860))

(assert (= (and b!769867 (not res!520698)) b!769864))

(assert (= (and b!769864 c!84981) b!769865))

(assert (= (and b!769864 (not c!84981)) b!769866))

(declare-fun m!715215 () Bool)

(assert (=> b!769868 m!715215))

(declare-fun m!715217 () Bool)

(assert (=> b!769870 m!715217))

(declare-fun m!715219 () Bool)

(assert (=> b!769860 m!715219))

(assert (=> b!769860 m!715219))

(declare-fun m!715221 () Bool)

(assert (=> b!769860 m!715221))

(assert (=> b!769862 m!715219))

(assert (=> b!769862 m!715219))

(declare-fun m!715223 () Bool)

(assert (=> b!769862 m!715223))

(assert (=> b!769862 m!715223))

(assert (=> b!769862 m!715219))

(declare-fun m!715225 () Bool)

(assert (=> b!769862 m!715225))

(declare-fun m!715227 () Bool)

(assert (=> b!769867 m!715227))

(declare-fun m!715229 () Bool)

(assert (=> b!769867 m!715229))

(declare-fun m!715231 () Bool)

(assert (=> b!769858 m!715231))

(declare-fun m!715233 () Bool)

(assert (=> b!769858 m!715233))

(declare-fun m!715235 () Bool)

(assert (=> b!769858 m!715235))

(declare-fun m!715237 () Bool)

(assert (=> b!769858 m!715237))

(assert (=> b!769858 m!715231))

(declare-fun m!715239 () Bool)

(assert (=> b!769858 m!715239))

(assert (=> b!769865 m!715219))

(assert (=> b!769865 m!715219))

(declare-fun m!715241 () Bool)

(assert (=> b!769865 m!715241))

(assert (=> b!769859 m!715219))

(assert (=> b!769859 m!715219))

(declare-fun m!715243 () Bool)

(assert (=> b!769859 m!715243))

(declare-fun m!715245 () Bool)

(assert (=> start!66782 m!715245))

(declare-fun m!715247 () Bool)

(assert (=> start!66782 m!715247))

(declare-fun m!715249 () Bool)

(assert (=> b!769864 m!715249))

(assert (=> b!769866 m!715219))

(assert (=> b!769866 m!715219))

(declare-fun m!715251 () Bool)

(assert (=> b!769866 m!715251))

(assert (=> b!769866 m!715219))

(declare-fun m!715253 () Bool)

(assert (=> b!769866 m!715253))

(assert (=> b!769856 m!715219))

(assert (=> b!769856 m!715219))

(assert (=> b!769856 m!715251))

(declare-fun m!715255 () Bool)

(assert (=> b!769875 m!715255))

(assert (=> b!769857 m!715219))

(assert (=> b!769857 m!715219))

(declare-fun m!715257 () Bool)

(assert (=> b!769857 m!715257))

(declare-fun m!715259 () Bool)

(assert (=> b!769873 m!715259))

(assert (=> b!769874 m!715219))

(assert (=> b!769874 m!715219))

(declare-fun m!715261 () Bool)

(assert (=> b!769874 m!715261))

(declare-fun m!715263 () Bool)

(assert (=> b!769861 m!715263))

(declare-fun m!715265 () Bool)

(assert (=> b!769872 m!715265))

(check-sat (not b!769874) (not b!769860) (not b!769862) (not b!769857) (not b!769866) (not b!769856) (not b!769873) (not b!769858) (not b!769864) (not b!769867) (not b!769875) (not b!769865) (not start!66782) (not b!769868) (not b!769859) (not b!769870) (not b!769872))
(check-sat)
