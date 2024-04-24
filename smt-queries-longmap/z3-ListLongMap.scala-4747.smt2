; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65670 () Bool)

(assert start!65670)

(declare-fun b!749042 () Bool)

(declare-fun res!505069 () Bool)

(declare-fun e!418160 () Bool)

(assert (=> b!749042 (=> res!505069 e!418160)))

(declare-datatypes ((array!41713 0))(
  ( (array!41714 (arr!19966 (Array (_ BitVec 32) (_ BitVec 64))) (size!20386 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41713)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7522 0))(
  ( (MissingZero!7522 (index!32456 (_ BitVec 32))) (Found!7522 (index!32457 (_ BitVec 32))) (Intermediate!7522 (undefined!8334 Bool) (index!32458 (_ BitVec 32)) (x!63556 (_ BitVec 32))) (Undefined!7522) (MissingVacant!7522 (index!32459 (_ BitVec 32))) )
))
(declare-fun lt!332950 () SeekEntryResult!7522)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41713 (_ BitVec 32)) SeekEntryResult!7522)

(assert (=> b!749042 (= res!505069 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19966 a!3186) j!159) a!3186 mask!3328) lt!332950)))))

(declare-fun b!749043 () Bool)

(declare-fun lt!332954 () SeekEntryResult!7522)

(declare-fun e!418158 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41713 (_ BitVec 32)) SeekEntryResult!7522)

(assert (=> b!749043 (= e!418158 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19966 a!3186) j!159) a!3186 mask!3328) lt!332954))))

(declare-fun b!749044 () Bool)

(declare-fun res!505064 () Bool)

(declare-fun e!418156 () Bool)

(assert (=> b!749044 (=> (not res!505064) (not e!418156))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!749044 (= res!505064 (validKeyInArray!0 k0!2102))))

(declare-fun b!749045 () Bool)

(declare-fun res!505053 () Bool)

(assert (=> b!749045 (=> (not res!505053) (not e!418156))))

(assert (=> b!749045 (= res!505053 (validKeyInArray!0 (select (arr!19966 a!3186) j!159)))))

(declare-fun b!749046 () Bool)

(declare-fun e!418159 () Bool)

(assert (=> b!749046 (= e!418156 e!418159)))

(declare-fun res!505066 () Bool)

(assert (=> b!749046 (=> (not res!505066) (not e!418159))))

(declare-fun lt!332949 () SeekEntryResult!7522)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749046 (= res!505066 (or (= lt!332949 (MissingZero!7522 i!1173)) (= lt!332949 (MissingVacant!7522 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41713 (_ BitVec 32)) SeekEntryResult!7522)

(assert (=> b!749046 (= lt!332949 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!749047 () Bool)

(declare-datatypes ((Unit!25645 0))(
  ( (Unit!25646) )
))
(declare-fun e!418157 () Unit!25645)

(declare-fun Unit!25647 () Unit!25645)

(assert (=> b!749047 (= e!418157 Unit!25647)))

(declare-fun b!749048 () Bool)

(declare-fun res!505067 () Bool)

(assert (=> b!749048 (=> (not res!505067) (not e!418156))))

(assert (=> b!749048 (= res!505067 (and (= (size!20386 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20386 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20386 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!505065 () Bool)

(assert (=> start!65670 (=> (not res!505065) (not e!418156))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65670 (= res!505065 (validMask!0 mask!3328))))

(assert (=> start!65670 e!418156))

(assert (=> start!65670 true))

(declare-fun array_inv!15825 (array!41713) Bool)

(assert (=> start!65670 (array_inv!15825 a!3186)))

(declare-fun b!749049 () Bool)

(declare-fun res!505060 () Bool)

(assert (=> b!749049 (=> (not res!505060) (not e!418159))))

(declare-datatypes ((List!13875 0))(
  ( (Nil!13872) (Cons!13871 (h!14949 (_ BitVec 64)) (t!20182 List!13875)) )
))
(declare-fun arrayNoDuplicates!0 (array!41713 (_ BitVec 32) List!13875) Bool)

(assert (=> b!749049 (= res!505060 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13872))))

(declare-fun b!749050 () Bool)

(declare-fun Unit!25648 () Unit!25645)

(assert (=> b!749050 (= e!418157 Unit!25648)))

(assert (=> b!749050 false))

(declare-fun b!749051 () Bool)

(assert (=> b!749051 (= e!418160 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvslt index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!749051 (= (select (store (arr!19966 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332956 () Unit!25645)

(assert (=> b!749051 (= lt!332956 e!418157)))

(declare-fun c!82379 () Bool)

(assert (=> b!749051 (= c!82379 (= (select (store (arr!19966 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749052 () Bool)

(declare-fun e!418164 () Bool)

(assert (=> b!749052 (= e!418159 e!418164)))

(declare-fun res!505057 () Bool)

(assert (=> b!749052 (=> (not res!505057) (not e!418164))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749052 (= res!505057 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19966 a!3186) j!159) mask!3328) (select (arr!19966 a!3186) j!159) a!3186 mask!3328) lt!332954))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749052 (= lt!332954 (Intermediate!7522 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749053 () Bool)

(declare-fun res!505068 () Bool)

(assert (=> b!749053 (=> (not res!505068) (not e!418159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41713 (_ BitVec 32)) Bool)

(assert (=> b!749053 (= res!505068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!749054 () Bool)

(declare-fun res!505061 () Bool)

(assert (=> b!749054 (=> (not res!505061) (not e!418164))))

(assert (=> b!749054 (= res!505061 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19966 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!749055 () Bool)

(declare-fun res!505054 () Bool)

(assert (=> b!749055 (=> res!505054 e!418160)))

(declare-fun lt!332951 () (_ BitVec 64))

(assert (=> b!749055 (= res!505054 (= (select (store (arr!19966 a!3186) i!1173 k0!2102) index!1321) lt!332951))))

(declare-fun b!749056 () Bool)

(declare-fun res!505056 () Bool)

(assert (=> b!749056 (=> (not res!505056) (not e!418156))))

(declare-fun arrayContainsKey!0 (array!41713 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!749056 (= res!505056 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun e!418162 () Bool)

(declare-fun b!749057 () Bool)

(assert (=> b!749057 (= e!418162 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19966 a!3186) j!159) a!3186 mask!3328) lt!332950))))

(declare-fun b!749058 () Bool)

(assert (=> b!749058 (= e!418158 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19966 a!3186) j!159) a!3186 mask!3328) (Found!7522 j!159)))))

(declare-fun b!749059 () Bool)

(declare-fun e!418161 () Bool)

(assert (=> b!749059 (= e!418164 e!418161)))

(declare-fun res!505055 () Bool)

(assert (=> b!749059 (=> (not res!505055) (not e!418161))))

(declare-fun lt!332958 () SeekEntryResult!7522)

(declare-fun lt!332952 () SeekEntryResult!7522)

(assert (=> b!749059 (= res!505055 (= lt!332958 lt!332952))))

(declare-fun lt!332953 () array!41713)

(assert (=> b!749059 (= lt!332952 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332951 lt!332953 mask!3328))))

(assert (=> b!749059 (= lt!332958 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332951 mask!3328) lt!332951 lt!332953 mask!3328))))

(assert (=> b!749059 (= lt!332951 (select (store (arr!19966 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!749059 (= lt!332953 (array!41714 (store (arr!19966 a!3186) i!1173 k0!2102) (size!20386 a!3186)))))

(declare-fun b!749060 () Bool)

(declare-fun res!505062 () Bool)

(assert (=> b!749060 (=> (not res!505062) (not e!418164))))

(assert (=> b!749060 (= res!505062 e!418158)))

(declare-fun c!82378 () Bool)

(assert (=> b!749060 (= c!82378 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749061 () Bool)

(declare-fun res!505058 () Bool)

(assert (=> b!749061 (=> (not res!505058) (not e!418159))))

(assert (=> b!749061 (= res!505058 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20386 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20386 a!3186))))))

(declare-fun b!749062 () Bool)

(assert (=> b!749062 (= e!418161 (not e!418160))))

(declare-fun res!505059 () Bool)

(assert (=> b!749062 (=> res!505059 e!418160)))

(get-info :version)

(assert (=> b!749062 (= res!505059 (or (not ((_ is Intermediate!7522) lt!332952)) (bvslt x!1131 (x!63556 lt!332952)) (not (= x!1131 (x!63556 lt!332952))) (not (= index!1321 (index!32458 lt!332952)))))))

(assert (=> b!749062 e!418162))

(declare-fun res!505063 () Bool)

(assert (=> b!749062 (=> (not res!505063) (not e!418162))))

(declare-fun lt!332955 () SeekEntryResult!7522)

(assert (=> b!749062 (= res!505063 (= lt!332955 lt!332950))))

(assert (=> b!749062 (= lt!332950 (Found!7522 j!159))))

(assert (=> b!749062 (= lt!332955 (seekEntryOrOpen!0 (select (arr!19966 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!749062 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332957 () Unit!25645)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25645)

(assert (=> b!749062 (= lt!332957 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (= (and start!65670 res!505065) b!749048))

(assert (= (and b!749048 res!505067) b!749045))

(assert (= (and b!749045 res!505053) b!749044))

(assert (= (and b!749044 res!505064) b!749056))

(assert (= (and b!749056 res!505056) b!749046))

(assert (= (and b!749046 res!505066) b!749053))

(assert (= (and b!749053 res!505068) b!749049))

(assert (= (and b!749049 res!505060) b!749061))

(assert (= (and b!749061 res!505058) b!749052))

(assert (= (and b!749052 res!505057) b!749054))

(assert (= (and b!749054 res!505061) b!749060))

(assert (= (and b!749060 c!82378) b!749043))

(assert (= (and b!749060 (not c!82378)) b!749058))

(assert (= (and b!749060 res!505062) b!749059))

(assert (= (and b!749059 res!505055) b!749062))

(assert (= (and b!749062 res!505063) b!749057))

(assert (= (and b!749062 (not res!505059)) b!749042))

(assert (= (and b!749042 (not res!505069)) b!749055))

(assert (= (and b!749055 (not res!505054)) b!749051))

(assert (= (and b!749051 c!82379) b!749050))

(assert (= (and b!749051 (not c!82379)) b!749047))

(declare-fun m!699333 () Bool)

(assert (=> b!749052 m!699333))

(assert (=> b!749052 m!699333))

(declare-fun m!699335 () Bool)

(assert (=> b!749052 m!699335))

(assert (=> b!749052 m!699335))

(assert (=> b!749052 m!699333))

(declare-fun m!699337 () Bool)

(assert (=> b!749052 m!699337))

(declare-fun m!699339 () Bool)

(assert (=> b!749053 m!699339))

(declare-fun m!699341 () Bool)

(assert (=> start!65670 m!699341))

(declare-fun m!699343 () Bool)

(assert (=> start!65670 m!699343))

(declare-fun m!699345 () Bool)

(assert (=> b!749055 m!699345))

(declare-fun m!699347 () Bool)

(assert (=> b!749055 m!699347))

(assert (=> b!749057 m!699333))

(assert (=> b!749057 m!699333))

(declare-fun m!699349 () Bool)

(assert (=> b!749057 m!699349))

(declare-fun m!699351 () Bool)

(assert (=> b!749054 m!699351))

(assert (=> b!749051 m!699345))

(assert (=> b!749051 m!699347))

(assert (=> b!749045 m!699333))

(assert (=> b!749045 m!699333))

(declare-fun m!699353 () Bool)

(assert (=> b!749045 m!699353))

(declare-fun m!699355 () Bool)

(assert (=> b!749049 m!699355))

(declare-fun m!699357 () Bool)

(assert (=> b!749044 m!699357))

(declare-fun m!699359 () Bool)

(assert (=> b!749046 m!699359))

(assert (=> b!749042 m!699333))

(assert (=> b!749042 m!699333))

(declare-fun m!699361 () Bool)

(assert (=> b!749042 m!699361))

(declare-fun m!699363 () Bool)

(assert (=> b!749059 m!699363))

(assert (=> b!749059 m!699345))

(declare-fun m!699365 () Bool)

(assert (=> b!749059 m!699365))

(declare-fun m!699367 () Bool)

(assert (=> b!749059 m!699367))

(declare-fun m!699369 () Bool)

(assert (=> b!749059 m!699369))

(assert (=> b!749059 m!699365))

(declare-fun m!699371 () Bool)

(assert (=> b!749056 m!699371))

(assert (=> b!749043 m!699333))

(assert (=> b!749043 m!699333))

(declare-fun m!699373 () Bool)

(assert (=> b!749043 m!699373))

(assert (=> b!749058 m!699333))

(assert (=> b!749058 m!699333))

(assert (=> b!749058 m!699361))

(assert (=> b!749062 m!699333))

(assert (=> b!749062 m!699333))

(declare-fun m!699375 () Bool)

(assert (=> b!749062 m!699375))

(declare-fun m!699377 () Bool)

(assert (=> b!749062 m!699377))

(declare-fun m!699379 () Bool)

(assert (=> b!749062 m!699379))

(check-sat (not start!65670) (not b!749059) (not b!749049) (not b!749043) (not b!749044) (not b!749045) (not b!749042) (not b!749056) (not b!749052) (not b!749046) (not b!749057) (not b!749062) (not b!749053) (not b!749058))
(check-sat)
