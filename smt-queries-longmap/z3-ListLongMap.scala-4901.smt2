; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67768 () Bool)

(assert start!67768)

(declare-fun b!783807 () Bool)

(declare-fun e!435892 () Bool)

(declare-fun e!435890 () Bool)

(assert (=> b!783807 (= e!435892 (not e!435890))))

(declare-fun res!530068 () Bool)

(assert (=> b!783807 (=> res!530068 e!435890)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7984 0))(
  ( (MissingZero!7984 (index!34304 (_ BitVec 32))) (Found!7984 (index!34305 (_ BitVec 32))) (Intermediate!7984 (undefined!8796 Bool) (index!34306 (_ BitVec 32)) (x!65423 (_ BitVec 32))) (Undefined!7984) (MissingVacant!7984 (index!34307 (_ BitVec 32))) )
))
(declare-fun lt!349294 () SeekEntryResult!7984)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!783807 (= res!530068 (or (not ((_ is Intermediate!7984) lt!349294)) (bvslt x!1131 (x!65423 lt!349294)) (not (= x!1131 (x!65423 lt!349294))) (not (= index!1321 (index!34306 lt!349294)))))))

(declare-fun e!435889 () Bool)

(assert (=> b!783807 e!435889))

(declare-fun res!530072 () Bool)

(assert (=> b!783807 (=> (not res!530072) (not e!435889))))

(declare-fun lt!349302 () SeekEntryResult!7984)

(declare-fun lt!349297 () SeekEntryResult!7984)

(assert (=> b!783807 (= res!530072 (= lt!349302 lt!349297))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!783807 (= lt!349297 (Found!7984 j!159))))

(declare-datatypes ((array!42688 0))(
  ( (array!42689 (arr!20428 (Array (_ BitVec 32) (_ BitVec 64))) (size!20848 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42688)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42688 (_ BitVec 32)) SeekEntryResult!7984)

(assert (=> b!783807 (= lt!349302 (seekEntryOrOpen!0 (select (arr!20428 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42688 (_ BitVec 32)) Bool)

(assert (=> b!783807 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!27001 0))(
  ( (Unit!27002) )
))
(declare-fun lt!349296 () Unit!27001)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42688 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27001)

(assert (=> b!783807 (= lt!349296 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!530070 () Bool)

(declare-fun e!435891 () Bool)

(assert (=> start!67768 (=> (not res!530070) (not e!435891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67768 (= res!530070 (validMask!0 mask!3328))))

(assert (=> start!67768 e!435891))

(assert (=> start!67768 true))

(declare-fun array_inv!16287 (array!42688) Bool)

(assert (=> start!67768 (array_inv!16287 a!3186)))

(declare-fun b!783808 () Bool)

(declare-fun res!530056 () Bool)

(assert (=> b!783808 (=> (not res!530056) (not e!435891))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42688 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783808 (= res!530056 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783809 () Bool)

(declare-fun e!435894 () Unit!27001)

(declare-fun Unit!27003 () Unit!27001)

(assert (=> b!783809 (= e!435894 Unit!27003)))

(assert (=> b!783809 false))

(declare-fun b!783810 () Bool)

(declare-fun e!435895 () Bool)

(assert (=> b!783810 (= e!435895 e!435892)))

(declare-fun res!530065 () Bool)

(assert (=> b!783810 (=> (not res!530065) (not e!435892))))

(declare-fun lt!349295 () SeekEntryResult!7984)

(assert (=> b!783810 (= res!530065 (= lt!349295 lt!349294))))

(declare-fun lt!349298 () array!42688)

(declare-fun lt!349299 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42688 (_ BitVec 32)) SeekEntryResult!7984)

(assert (=> b!783810 (= lt!349294 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349299 lt!349298 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783810 (= lt!349295 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349299 mask!3328) lt!349299 lt!349298 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783810 (= lt!349299 (select (store (arr!20428 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783810 (= lt!349298 (array!42689 (store (arr!20428 a!3186) i!1173 k0!2102) (size!20848 a!3186)))))

(declare-fun b!783811 () Bool)

(declare-fun res!530066 () Bool)

(assert (=> b!783811 (=> (not res!530066) (not e!435891))))

(assert (=> b!783811 (= res!530066 (and (= (size!20848 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20848 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20848 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783812 () Bool)

(declare-fun res!530067 () Bool)

(assert (=> b!783812 (=> res!530067 e!435890)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42688 (_ BitVec 32)) SeekEntryResult!7984)

(assert (=> b!783812 (= res!530067 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20428 a!3186) j!159) a!3186 mask!3328) lt!349297)))))

(declare-fun b!783813 () Bool)

(declare-fun res!530060 () Bool)

(assert (=> b!783813 (=> (not res!530060) (not e!435895))))

(declare-fun e!435893 () Bool)

(assert (=> b!783813 (= res!530060 e!435893)))

(declare-fun c!87286 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!783813 (= c!87286 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783814 () Bool)

(assert (=> b!783814 (= e!435893 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20428 a!3186) j!159) a!3186 mask!3328) (Found!7984 j!159)))))

(declare-fun b!783815 () Bool)

(assert (=> b!783815 (= e!435889 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20428 a!3186) j!159) a!3186 mask!3328) lt!349297))))

(declare-fun b!783816 () Bool)

(declare-fun lt!349301 () SeekEntryResult!7984)

(assert (=> b!783816 (= e!435893 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20428 a!3186) j!159) a!3186 mask!3328) lt!349301))))

(declare-fun b!783817 () Bool)

(declare-fun e!435888 () Bool)

(assert (=> b!783817 (= e!435888 e!435895)))

(declare-fun res!530061 () Bool)

(assert (=> b!783817 (=> (not res!530061) (not e!435895))))

(assert (=> b!783817 (= res!530061 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20428 a!3186) j!159) mask!3328) (select (arr!20428 a!3186) j!159) a!3186 mask!3328) lt!349301))))

(assert (=> b!783817 (= lt!349301 (Intermediate!7984 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783818 () Bool)

(declare-fun e!435886 () Bool)

(assert (=> b!783818 (= e!435886 (= (seekEntryOrOpen!0 lt!349299 lt!349298 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349299 lt!349298 mask!3328)))))

(declare-fun b!783819 () Bool)

(declare-fun e!435885 () Bool)

(assert (=> b!783819 (= e!435890 e!435885)))

(declare-fun res!530069 () Bool)

(assert (=> b!783819 (=> res!530069 e!435885)))

(declare-fun lt!349293 () (_ BitVec 64))

(assert (=> b!783819 (= res!530069 (= lt!349293 lt!349299))))

(assert (=> b!783819 (= lt!349293 (select (store (arr!20428 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!783820 () Bool)

(assert (=> b!783820 (= e!435891 e!435888)))

(declare-fun res!530058 () Bool)

(assert (=> b!783820 (=> (not res!530058) (not e!435888))))

(declare-fun lt!349303 () SeekEntryResult!7984)

(assert (=> b!783820 (= res!530058 (or (= lt!349303 (MissingZero!7984 i!1173)) (= lt!349303 (MissingVacant!7984 i!1173))))))

(assert (=> b!783820 (= lt!349303 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783821 () Bool)

(assert (=> b!783821 (= e!435885 true)))

(assert (=> b!783821 e!435886))

(declare-fun res!530071 () Bool)

(assert (=> b!783821 (=> (not res!530071) (not e!435886))))

(assert (=> b!783821 (= res!530071 (= lt!349293 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!349300 () Unit!27001)

(assert (=> b!783821 (= lt!349300 e!435894)))

(declare-fun c!87287 () Bool)

(assert (=> b!783821 (= c!87287 (= lt!349293 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783822 () Bool)

(declare-fun res!530064 () Bool)

(assert (=> b!783822 (=> (not res!530064) (not e!435888))))

(assert (=> b!783822 (= res!530064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783823 () Bool)

(declare-fun res!530073 () Bool)

(assert (=> b!783823 (=> (not res!530073) (not e!435888))))

(declare-datatypes ((List!14337 0))(
  ( (Nil!14334) (Cons!14333 (h!15462 (_ BitVec 64)) (t!20644 List!14337)) )
))
(declare-fun arrayNoDuplicates!0 (array!42688 (_ BitVec 32) List!14337) Bool)

(assert (=> b!783823 (= res!530073 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14334))))

(declare-fun b!783824 () Bool)

(declare-fun res!530062 () Bool)

(assert (=> b!783824 (=> (not res!530062) (not e!435888))))

(assert (=> b!783824 (= res!530062 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20848 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20848 a!3186))))))

(declare-fun b!783825 () Bool)

(declare-fun res!530057 () Bool)

(assert (=> b!783825 (=> (not res!530057) (not e!435891))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783825 (= res!530057 (validKeyInArray!0 k0!2102))))

(declare-fun b!783826 () Bool)

(declare-fun Unit!27004 () Unit!27001)

(assert (=> b!783826 (= e!435894 Unit!27004)))

(declare-fun b!783827 () Bool)

(declare-fun res!530059 () Bool)

(assert (=> b!783827 (=> (not res!530059) (not e!435895))))

(assert (=> b!783827 (= res!530059 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20428 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783828 () Bool)

(declare-fun res!530063 () Bool)

(assert (=> b!783828 (=> (not res!530063) (not e!435891))))

(assert (=> b!783828 (= res!530063 (validKeyInArray!0 (select (arr!20428 a!3186) j!159)))))

(assert (= (and start!67768 res!530070) b!783811))

(assert (= (and b!783811 res!530066) b!783828))

(assert (= (and b!783828 res!530063) b!783825))

(assert (= (and b!783825 res!530057) b!783808))

(assert (= (and b!783808 res!530056) b!783820))

(assert (= (and b!783820 res!530058) b!783822))

(assert (= (and b!783822 res!530064) b!783823))

(assert (= (and b!783823 res!530073) b!783824))

(assert (= (and b!783824 res!530062) b!783817))

(assert (= (and b!783817 res!530061) b!783827))

(assert (= (and b!783827 res!530059) b!783813))

(assert (= (and b!783813 c!87286) b!783816))

(assert (= (and b!783813 (not c!87286)) b!783814))

(assert (= (and b!783813 res!530060) b!783810))

(assert (= (and b!783810 res!530065) b!783807))

(assert (= (and b!783807 res!530072) b!783815))

(assert (= (and b!783807 (not res!530068)) b!783812))

(assert (= (and b!783812 (not res!530067)) b!783819))

(assert (= (and b!783819 (not res!530069)) b!783821))

(assert (= (and b!783821 c!87287) b!783809))

(assert (= (and b!783821 (not c!87287)) b!783826))

(assert (= (and b!783821 res!530071) b!783818))

(declare-fun m!726839 () Bool)

(assert (=> b!783807 m!726839))

(assert (=> b!783807 m!726839))

(declare-fun m!726841 () Bool)

(assert (=> b!783807 m!726841))

(declare-fun m!726843 () Bool)

(assert (=> b!783807 m!726843))

(declare-fun m!726845 () Bool)

(assert (=> b!783807 m!726845))

(declare-fun m!726847 () Bool)

(assert (=> b!783822 m!726847))

(declare-fun m!726849 () Bool)

(assert (=> b!783810 m!726849))

(declare-fun m!726851 () Bool)

(assert (=> b!783810 m!726851))

(declare-fun m!726853 () Bool)

(assert (=> b!783810 m!726853))

(declare-fun m!726855 () Bool)

(assert (=> b!783810 m!726855))

(assert (=> b!783810 m!726851))

(declare-fun m!726857 () Bool)

(assert (=> b!783810 m!726857))

(declare-fun m!726859 () Bool)

(assert (=> b!783808 m!726859))

(assert (=> b!783815 m!726839))

(assert (=> b!783815 m!726839))

(declare-fun m!726861 () Bool)

(assert (=> b!783815 m!726861))

(declare-fun m!726863 () Bool)

(assert (=> b!783827 m!726863))

(declare-fun m!726865 () Bool)

(assert (=> start!67768 m!726865))

(declare-fun m!726867 () Bool)

(assert (=> start!67768 m!726867))

(assert (=> b!783828 m!726839))

(assert (=> b!783828 m!726839))

(declare-fun m!726869 () Bool)

(assert (=> b!783828 m!726869))

(assert (=> b!783814 m!726839))

(assert (=> b!783814 m!726839))

(declare-fun m!726871 () Bool)

(assert (=> b!783814 m!726871))

(assert (=> b!783812 m!726839))

(assert (=> b!783812 m!726839))

(assert (=> b!783812 m!726871))

(assert (=> b!783816 m!726839))

(assert (=> b!783816 m!726839))

(declare-fun m!726873 () Bool)

(assert (=> b!783816 m!726873))

(declare-fun m!726875 () Bool)

(assert (=> b!783820 m!726875))

(declare-fun m!726877 () Bool)

(assert (=> b!783825 m!726877))

(assert (=> b!783817 m!726839))

(assert (=> b!783817 m!726839))

(declare-fun m!726879 () Bool)

(assert (=> b!783817 m!726879))

(assert (=> b!783817 m!726879))

(assert (=> b!783817 m!726839))

(declare-fun m!726881 () Bool)

(assert (=> b!783817 m!726881))

(declare-fun m!726883 () Bool)

(assert (=> b!783818 m!726883))

(declare-fun m!726885 () Bool)

(assert (=> b!783818 m!726885))

(declare-fun m!726887 () Bool)

(assert (=> b!783823 m!726887))

(assert (=> b!783819 m!726849))

(declare-fun m!726889 () Bool)

(assert (=> b!783819 m!726889))

(check-sat (not b!783814) (not b!783808) (not b!783818) (not b!783822) (not b!783820) (not b!783807) (not b!783812) (not b!783825) (not b!783815) (not b!783817) (not b!783828) (not b!783823) (not start!67768) (not b!783810) (not b!783816))
(check-sat)
