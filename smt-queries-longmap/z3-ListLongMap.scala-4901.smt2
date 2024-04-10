; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67652 () Bool)

(assert start!67652)

(declare-fun res!529846 () Bool)

(declare-fun e!435507 () Bool)

(assert (=> start!67652 (=> (not res!529846) (not e!435507))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67652 (= res!529846 (validMask!0 mask!3328))))

(assert (=> start!67652 e!435507))

(assert (=> start!67652 true))

(declare-datatypes ((array!42692 0))(
  ( (array!42693 (arr!20434 (Array (_ BitVec 32) (_ BitVec 64))) (size!20855 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42692)

(declare-fun array_inv!16230 (array!42692) Bool)

(assert (=> start!67652 (array_inv!16230 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!435506 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!783228 () Bool)

(declare-datatypes ((SeekEntryResult!8034 0))(
  ( (MissingZero!8034 (index!34504 (_ BitVec 32))) (Found!8034 (index!34505 (_ BitVec 32))) (Intermediate!8034 (undefined!8846 Bool) (index!34506 (_ BitVec 32)) (x!65462 (_ BitVec 32))) (Undefined!8034) (MissingVacant!8034 (index!34507 (_ BitVec 32))) )
))
(declare-fun lt!349059 () SeekEntryResult!8034)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42692 (_ BitVec 32)) SeekEntryResult!8034)

(assert (=> b!783228 (= e!435506 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20434 a!3186) j!159) a!3186 mask!3328) lt!349059))))

(declare-fun b!783229 () Bool)

(declare-fun e!435509 () Bool)

(declare-fun e!435503 () Bool)

(assert (=> b!783229 (= e!435509 e!435503)))

(declare-fun res!529847 () Bool)

(assert (=> b!783229 (=> (not res!529847) (not e!435503))))

(declare-fun lt!349055 () SeekEntryResult!8034)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42692 (_ BitVec 32)) SeekEntryResult!8034)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!783229 (= res!529847 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20434 a!3186) j!159) mask!3328) (select (arr!20434 a!3186) j!159) a!3186 mask!3328) lt!349055))))

(assert (=> b!783229 (= lt!349055 (Intermediate!8034 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!783230 () Bool)

(declare-fun res!529854 () Bool)

(assert (=> b!783230 (=> (not res!529854) (not e!435509))))

(declare-datatypes ((List!14436 0))(
  ( (Nil!14433) (Cons!14432 (h!15555 (_ BitVec 64)) (t!20751 List!14436)) )
))
(declare-fun arrayNoDuplicates!0 (array!42692 (_ BitVec 32) List!14436) Bool)

(assert (=> b!783230 (= res!529854 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14433))))

(declare-fun b!783231 () Bool)

(declare-fun e!435504 () Bool)

(assert (=> b!783231 (= e!435504 true)))

(declare-fun e!435505 () Bool)

(assert (=> b!783231 e!435505))

(declare-fun res!529843 () Bool)

(assert (=> b!783231 (=> (not res!529843) (not e!435505))))

(declare-fun lt!349061 () (_ BitVec 64))

(assert (=> b!783231 (= res!529843 (= lt!349061 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27024 0))(
  ( (Unit!27025) )
))
(declare-fun lt!349056 () Unit!27024)

(declare-fun e!435512 () Unit!27024)

(assert (=> b!783231 (= lt!349056 e!435512)))

(declare-fun c!87103 () Bool)

(assert (=> b!783231 (= c!87103 (= lt!349061 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!783232 () Bool)

(declare-fun res!529839 () Bool)

(declare-fun e!435502 () Bool)

(assert (=> b!783232 (=> res!529839 e!435502)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!783232 (= res!529839 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20434 a!3186) j!159) a!3186 mask!3328) lt!349059)))))

(declare-fun b!783233 () Bool)

(declare-fun res!529851 () Bool)

(assert (=> b!783233 (=> (not res!529851) (not e!435503))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!783233 (= res!529851 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20434 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!783234 () Bool)

(assert (=> b!783234 (= e!435502 e!435504)))

(declare-fun res!529848 () Bool)

(assert (=> b!783234 (=> res!529848 e!435504)))

(declare-fun lt!349064 () (_ BitVec 64))

(assert (=> b!783234 (= res!529848 (= lt!349061 lt!349064))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!783234 (= lt!349061 (select (store (arr!20434 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!783235 () Bool)

(declare-fun res!529845 () Bool)

(assert (=> b!783235 (=> (not res!529845) (not e!435503))))

(declare-fun e!435508 () Bool)

(assert (=> b!783235 (= res!529845 e!435508)))

(declare-fun c!87102 () Bool)

(assert (=> b!783235 (= c!87102 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!783236 () Bool)

(declare-fun res!529844 () Bool)

(assert (=> b!783236 (=> (not res!529844) (not e!435509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42692 (_ BitVec 32)) Bool)

(assert (=> b!783236 (= res!529844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!783237 () Bool)

(assert (=> b!783237 (= e!435508 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20434 a!3186) j!159) a!3186 mask!3328) (Found!8034 j!159)))))

(declare-fun b!783238 () Bool)

(assert (=> b!783238 (= e!435507 e!435509)))

(declare-fun res!529853 () Bool)

(assert (=> b!783238 (=> (not res!529853) (not e!435509))))

(declare-fun lt!349057 () SeekEntryResult!8034)

(assert (=> b!783238 (= res!529853 (or (= lt!349057 (MissingZero!8034 i!1173)) (= lt!349057 (MissingVacant!8034 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42692 (_ BitVec 32)) SeekEntryResult!8034)

(assert (=> b!783238 (= lt!349057 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!783239 () Bool)

(declare-fun res!529852 () Bool)

(assert (=> b!783239 (=> (not res!529852) (not e!435507))))

(declare-fun arrayContainsKey!0 (array!42692 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!783239 (= res!529852 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!783240 () Bool)

(declare-fun e!435511 () Bool)

(assert (=> b!783240 (= e!435511 (not e!435502))))

(declare-fun res!529842 () Bool)

(assert (=> b!783240 (=> res!529842 e!435502)))

(declare-fun lt!349063 () SeekEntryResult!8034)

(get-info :version)

(assert (=> b!783240 (= res!529842 (or (not ((_ is Intermediate!8034) lt!349063)) (bvslt x!1131 (x!65462 lt!349063)) (not (= x!1131 (x!65462 lt!349063))) (not (= index!1321 (index!34506 lt!349063)))))))

(assert (=> b!783240 e!435506))

(declare-fun res!529856 () Bool)

(assert (=> b!783240 (=> (not res!529856) (not e!435506))))

(declare-fun lt!349062 () SeekEntryResult!8034)

(assert (=> b!783240 (= res!529856 (= lt!349062 lt!349059))))

(assert (=> b!783240 (= lt!349059 (Found!8034 j!159))))

(assert (=> b!783240 (= lt!349062 (seekEntryOrOpen!0 (select (arr!20434 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!783240 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!349058 () Unit!27024)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42692 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27024)

(assert (=> b!783240 (= lt!349058 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!783241 () Bool)

(declare-fun res!529840 () Bool)

(assert (=> b!783241 (=> (not res!529840) (not e!435507))))

(assert (=> b!783241 (= res!529840 (and (= (size!20855 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20855 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20855 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!783242 () Bool)

(assert (=> b!783242 (= e!435503 e!435511)))

(declare-fun res!529841 () Bool)

(assert (=> b!783242 (=> (not res!529841) (not e!435511))))

(declare-fun lt!349054 () SeekEntryResult!8034)

(assert (=> b!783242 (= res!529841 (= lt!349054 lt!349063))))

(declare-fun lt!349060 () array!42692)

(assert (=> b!783242 (= lt!349063 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!349064 lt!349060 mask!3328))))

(assert (=> b!783242 (= lt!349054 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!349064 mask!3328) lt!349064 lt!349060 mask!3328))))

(assert (=> b!783242 (= lt!349064 (select (store (arr!20434 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!783242 (= lt!349060 (array!42693 (store (arr!20434 a!3186) i!1173 k0!2102) (size!20855 a!3186)))))

(declare-fun b!783243 () Bool)

(declare-fun Unit!27026 () Unit!27024)

(assert (=> b!783243 (= e!435512 Unit!27026)))

(declare-fun b!783244 () Bool)

(declare-fun res!529855 () Bool)

(assert (=> b!783244 (=> (not res!529855) (not e!435507))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!783244 (= res!529855 (validKeyInArray!0 (select (arr!20434 a!3186) j!159)))))

(declare-fun b!783245 () Bool)

(assert (=> b!783245 (= e!435505 (= (seekEntryOrOpen!0 lt!349064 lt!349060 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!349064 lt!349060 mask!3328)))))

(declare-fun b!783246 () Bool)

(declare-fun Unit!27027 () Unit!27024)

(assert (=> b!783246 (= e!435512 Unit!27027)))

(assert (=> b!783246 false))

(declare-fun b!783247 () Bool)

(declare-fun res!529850 () Bool)

(assert (=> b!783247 (=> (not res!529850) (not e!435509))))

(assert (=> b!783247 (= res!529850 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20855 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20855 a!3186))))))

(declare-fun b!783248 () Bool)

(assert (=> b!783248 (= e!435508 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20434 a!3186) j!159) a!3186 mask!3328) lt!349055))))

(declare-fun b!783249 () Bool)

(declare-fun res!529849 () Bool)

(assert (=> b!783249 (=> (not res!529849) (not e!435507))))

(assert (=> b!783249 (= res!529849 (validKeyInArray!0 k0!2102))))

(assert (= (and start!67652 res!529846) b!783241))

(assert (= (and b!783241 res!529840) b!783244))

(assert (= (and b!783244 res!529855) b!783249))

(assert (= (and b!783249 res!529849) b!783239))

(assert (= (and b!783239 res!529852) b!783238))

(assert (= (and b!783238 res!529853) b!783236))

(assert (= (and b!783236 res!529844) b!783230))

(assert (= (and b!783230 res!529854) b!783247))

(assert (= (and b!783247 res!529850) b!783229))

(assert (= (and b!783229 res!529847) b!783233))

(assert (= (and b!783233 res!529851) b!783235))

(assert (= (and b!783235 c!87102) b!783248))

(assert (= (and b!783235 (not c!87102)) b!783237))

(assert (= (and b!783235 res!529845) b!783242))

(assert (= (and b!783242 res!529841) b!783240))

(assert (= (and b!783240 res!529856) b!783228))

(assert (= (and b!783240 (not res!529842)) b!783232))

(assert (= (and b!783232 (not res!529839)) b!783234))

(assert (= (and b!783234 (not res!529848)) b!783231))

(assert (= (and b!783231 c!87103) b!783246))

(assert (= (and b!783231 (not c!87103)) b!783243))

(assert (= (and b!783231 res!529843) b!783245))

(declare-fun m!725829 () Bool)

(assert (=> start!67652 m!725829))

(declare-fun m!725831 () Bool)

(assert (=> start!67652 m!725831))

(declare-fun m!725833 () Bool)

(assert (=> b!783249 m!725833))

(declare-fun m!725835 () Bool)

(assert (=> b!783238 m!725835))

(declare-fun m!725837 () Bool)

(assert (=> b!783234 m!725837))

(declare-fun m!725839 () Bool)

(assert (=> b!783234 m!725839))

(declare-fun m!725841 () Bool)

(assert (=> b!783240 m!725841))

(assert (=> b!783240 m!725841))

(declare-fun m!725843 () Bool)

(assert (=> b!783240 m!725843))

(declare-fun m!725845 () Bool)

(assert (=> b!783240 m!725845))

(declare-fun m!725847 () Bool)

(assert (=> b!783240 m!725847))

(declare-fun m!725849 () Bool)

(assert (=> b!783236 m!725849))

(assert (=> b!783248 m!725841))

(assert (=> b!783248 m!725841))

(declare-fun m!725851 () Bool)

(assert (=> b!783248 m!725851))

(assert (=> b!783232 m!725841))

(assert (=> b!783232 m!725841))

(declare-fun m!725853 () Bool)

(assert (=> b!783232 m!725853))

(assert (=> b!783244 m!725841))

(assert (=> b!783244 m!725841))

(declare-fun m!725855 () Bool)

(assert (=> b!783244 m!725855))

(declare-fun m!725857 () Bool)

(assert (=> b!783233 m!725857))

(declare-fun m!725859 () Bool)

(assert (=> b!783245 m!725859))

(declare-fun m!725861 () Bool)

(assert (=> b!783245 m!725861))

(assert (=> b!783229 m!725841))

(assert (=> b!783229 m!725841))

(declare-fun m!725863 () Bool)

(assert (=> b!783229 m!725863))

(assert (=> b!783229 m!725863))

(assert (=> b!783229 m!725841))

(declare-fun m!725865 () Bool)

(assert (=> b!783229 m!725865))

(declare-fun m!725867 () Bool)

(assert (=> b!783230 m!725867))

(declare-fun m!725869 () Bool)

(assert (=> b!783239 m!725869))

(assert (=> b!783237 m!725841))

(assert (=> b!783237 m!725841))

(assert (=> b!783237 m!725853))

(declare-fun m!725871 () Bool)

(assert (=> b!783242 m!725871))

(declare-fun m!725873 () Bool)

(assert (=> b!783242 m!725873))

(assert (=> b!783242 m!725837))

(declare-fun m!725875 () Bool)

(assert (=> b!783242 m!725875))

(assert (=> b!783242 m!725871))

(declare-fun m!725877 () Bool)

(assert (=> b!783242 m!725877))

(assert (=> b!783228 m!725841))

(assert (=> b!783228 m!725841))

(declare-fun m!725879 () Bool)

(assert (=> b!783228 m!725879))

(check-sat (not b!783249) (not b!783240) (not b!783228) (not b!783244) (not b!783242) (not b!783229) (not b!783248) (not b!783237) (not start!67652) (not b!783232) (not b!783239) (not b!783245) (not b!783238) (not b!783236) (not b!783230))
(check-sat)
