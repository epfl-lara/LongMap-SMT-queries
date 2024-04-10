; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65808 () Bool)

(assert start!65808)

(declare-fun b!757289 () Bool)

(declare-fun res!512153 () Bool)

(declare-fun e!422245 () Bool)

(assert (=> b!757289 (=> (not res!512153) (not e!422245))))

(declare-fun e!422248 () Bool)

(assert (=> b!757289 (= res!512153 e!422248)))

(declare-fun c!82953 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757289 (= c!82953 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757290 () Bool)

(declare-fun res!512145 () Bool)

(declare-fun e!422244 () Bool)

(assert (=> b!757290 (=> (not res!512145) (not e!422244))))

(declare-fun lt!337241 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!41981 0))(
  ( (array!41982 (arr!20104 (Array (_ BitVec 32) (_ BitVec 64))) (size!20525 (_ BitVec 32))) )
))
(declare-fun lt!337236 () array!41981)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7704 0))(
  ( (MissingZero!7704 (index!33184 (_ BitVec 32))) (Found!7704 (index!33185 (_ BitVec 32))) (Intermediate!7704 (undefined!8516 Bool) (index!33186 (_ BitVec 32)) (x!64078 (_ BitVec 32))) (Undefined!7704) (MissingVacant!7704 (index!33187 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41981 (_ BitVec 32)) SeekEntryResult!7704)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41981 (_ BitVec 32)) SeekEntryResult!7704)

(assert (=> b!757290 (= res!512145 (= (seekEntryOrOpen!0 lt!337241 lt!337236 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337241 lt!337236 mask!3328)))))

(declare-fun b!757291 () Bool)

(declare-fun e!422241 () Bool)

(assert (=> b!757291 (= e!422241 e!422245)))

(declare-fun res!512159 () Bool)

(assert (=> b!757291 (=> (not res!512159) (not e!422245))))

(declare-fun a!3186 () array!41981)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun lt!337237 () SeekEntryResult!7704)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41981 (_ BitVec 32)) SeekEntryResult!7704)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757291 (= res!512159 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20104 a!3186) j!159) mask!3328) (select (arr!20104 a!3186) j!159) a!3186 mask!3328) lt!337237))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!757291 (= lt!337237 (Intermediate!7704 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757292 () Bool)

(declare-fun res!512155 () Bool)

(assert (=> b!757292 (=> (not res!512155) (not e!422241))))

(assert (=> b!757292 (= res!512155 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20525 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20525 a!3186))))))

(declare-fun b!757293 () Bool)

(declare-fun res!512144 () Bool)

(declare-fun e!422247 () Bool)

(assert (=> b!757293 (=> (not res!512144) (not e!422247))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41981 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757293 (= res!512144 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757294 () Bool)

(assert (=> b!757294 (= e!422248 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20104 a!3186) j!159) a!3186 mask!3328) (Found!7704 j!159)))))

(declare-fun b!757295 () Bool)

(declare-fun e!422239 () Bool)

(assert (=> b!757295 (= e!422245 e!422239)))

(declare-fun res!512146 () Bool)

(assert (=> b!757295 (=> (not res!512146) (not e!422239))))

(declare-fun lt!337233 () SeekEntryResult!7704)

(declare-fun lt!337232 () SeekEntryResult!7704)

(assert (=> b!757295 (= res!512146 (= lt!337233 lt!337232))))

(assert (=> b!757295 (= lt!337232 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337241 lt!337236 mask!3328))))

(assert (=> b!757295 (= lt!337233 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337241 mask!3328) lt!337241 lt!337236 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!757295 (= lt!337241 (select (store (arr!20104 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757295 (= lt!337236 (array!41982 (store (arr!20104 a!3186) i!1173 k0!2102) (size!20525 a!3186)))))

(declare-fun b!757296 () Bool)

(declare-fun e!422243 () Bool)

(declare-fun e!422249 () Bool)

(assert (=> b!757296 (= e!422243 e!422249)))

(declare-fun res!512158 () Bool)

(assert (=> b!757296 (=> res!512158 e!422249)))

(declare-fun lt!337230 () (_ BitVec 64))

(assert (=> b!757296 (= res!512158 (= lt!337230 lt!337241))))

(assert (=> b!757296 (= lt!337230 (select (store (arr!20104 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757298 () Bool)

(declare-fun res!512157 () Bool)

(assert (=> b!757298 (=> (not res!512157) (not e!422241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41981 (_ BitVec 32)) Bool)

(assert (=> b!757298 (= res!512157 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757299 () Bool)

(declare-fun res!512156 () Bool)

(assert (=> b!757299 (=> (not res!512156) (not e!422245))))

(assert (=> b!757299 (= res!512156 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20104 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757300 () Bool)

(declare-datatypes ((Unit!26196 0))(
  ( (Unit!26197) )
))
(declare-fun e!422240 () Unit!26196)

(declare-fun Unit!26198 () Unit!26196)

(assert (=> b!757300 (= e!422240 Unit!26198)))

(declare-fun b!757301 () Bool)

(declare-fun res!512160 () Bool)

(assert (=> b!757301 (=> (not res!512160) (not e!422241))))

(declare-datatypes ((List!14106 0))(
  ( (Nil!14103) (Cons!14102 (h!15174 (_ BitVec 64)) (t!20421 List!14106)) )
))
(declare-fun arrayNoDuplicates!0 (array!41981 (_ BitVec 32) List!14106) Bool)

(assert (=> b!757301 (= res!512160 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14103))))

(declare-fun b!757302 () Bool)

(assert (=> b!757302 (= e!422248 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20104 a!3186) j!159) a!3186 mask!3328) lt!337237))))

(declare-fun b!757303 () Bool)

(declare-fun lt!337235 () SeekEntryResult!7704)

(declare-fun lt!337239 () SeekEntryResult!7704)

(assert (=> b!757303 (= e!422244 (= lt!337235 lt!337239))))

(declare-fun b!757304 () Bool)

(assert (=> b!757304 (= e!422247 e!422241)))

(declare-fun res!512150 () Bool)

(assert (=> b!757304 (=> (not res!512150) (not e!422241))))

(declare-fun lt!337238 () SeekEntryResult!7704)

(assert (=> b!757304 (= res!512150 (or (= lt!337238 (MissingZero!7704 i!1173)) (= lt!337238 (MissingVacant!7704 i!1173))))))

(assert (=> b!757304 (= lt!337238 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757305 () Bool)

(declare-fun e!422246 () Bool)

(assert (=> b!757305 (= e!422246 e!422243)))

(declare-fun res!512154 () Bool)

(assert (=> b!757305 (=> res!512154 e!422243)))

(declare-fun lt!337234 () SeekEntryResult!7704)

(assert (=> b!757305 (= res!512154 (not (= lt!337239 lt!337234)))))

(assert (=> b!757305 (= lt!337239 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20104 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757306 () Bool)

(declare-fun res!512152 () Bool)

(assert (=> b!757306 (=> (not res!512152) (not e!422247))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757306 (= res!512152 (validKeyInArray!0 k0!2102))))

(declare-fun b!757307 () Bool)

(declare-fun res!512148 () Bool)

(assert (=> b!757307 (=> (not res!512148) (not e!422247))))

(assert (=> b!757307 (= res!512148 (and (= (size!20525 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20525 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20525 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!757308 () Bool)

(assert (=> b!757308 (= e!422239 (not e!422246))))

(declare-fun res!512151 () Bool)

(assert (=> b!757308 (=> res!512151 e!422246)))

(get-info :version)

(assert (=> b!757308 (= res!512151 (or (not ((_ is Intermediate!7704) lt!337232)) (bvslt x!1131 (x!64078 lt!337232)) (not (= x!1131 (x!64078 lt!337232))) (not (= index!1321 (index!33186 lt!337232)))))))

(declare-fun e!422242 () Bool)

(assert (=> b!757308 e!422242))

(declare-fun res!512161 () Bool)

(assert (=> b!757308 (=> (not res!512161) (not e!422242))))

(assert (=> b!757308 (= res!512161 (= lt!337235 lt!337234))))

(assert (=> b!757308 (= lt!337234 (Found!7704 j!159))))

(assert (=> b!757308 (= lt!337235 (seekEntryOrOpen!0 (select (arr!20104 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757308 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337231 () Unit!26196)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26196)

(assert (=> b!757308 (= lt!337231 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757309 () Bool)

(declare-fun res!512162 () Bool)

(assert (=> b!757309 (=> (not res!512162) (not e!422247))))

(assert (=> b!757309 (= res!512162 (validKeyInArray!0 (select (arr!20104 a!3186) j!159)))))

(declare-fun b!757297 () Bool)

(assert (=> b!757297 (= e!422249 true)))

(assert (=> b!757297 e!422244))

(declare-fun res!512149 () Bool)

(assert (=> b!757297 (=> (not res!512149) (not e!422244))))

(assert (=> b!757297 (= res!512149 (= lt!337230 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337240 () Unit!26196)

(assert (=> b!757297 (= lt!337240 e!422240)))

(declare-fun c!82954 () Bool)

(assert (=> b!757297 (= c!82954 (= lt!337230 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!512147 () Bool)

(assert (=> start!65808 (=> (not res!512147) (not e!422247))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65808 (= res!512147 (validMask!0 mask!3328))))

(assert (=> start!65808 e!422247))

(assert (=> start!65808 true))

(declare-fun array_inv!15900 (array!41981) Bool)

(assert (=> start!65808 (array_inv!15900 a!3186)))

(declare-fun b!757310 () Bool)

(declare-fun Unit!26199 () Unit!26196)

(assert (=> b!757310 (= e!422240 Unit!26199)))

(assert (=> b!757310 false))

(declare-fun b!757311 () Bool)

(assert (=> b!757311 (= e!422242 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20104 a!3186) j!159) a!3186 mask!3328) lt!337234))))

(assert (= (and start!65808 res!512147) b!757307))

(assert (= (and b!757307 res!512148) b!757309))

(assert (= (and b!757309 res!512162) b!757306))

(assert (= (and b!757306 res!512152) b!757293))

(assert (= (and b!757293 res!512144) b!757304))

(assert (= (and b!757304 res!512150) b!757298))

(assert (= (and b!757298 res!512157) b!757301))

(assert (= (and b!757301 res!512160) b!757292))

(assert (= (and b!757292 res!512155) b!757291))

(assert (= (and b!757291 res!512159) b!757299))

(assert (= (and b!757299 res!512156) b!757289))

(assert (= (and b!757289 c!82953) b!757302))

(assert (= (and b!757289 (not c!82953)) b!757294))

(assert (= (and b!757289 res!512153) b!757295))

(assert (= (and b!757295 res!512146) b!757308))

(assert (= (and b!757308 res!512161) b!757311))

(assert (= (and b!757308 (not res!512151)) b!757305))

(assert (= (and b!757305 (not res!512154)) b!757296))

(assert (= (and b!757296 (not res!512158)) b!757297))

(assert (= (and b!757297 c!82954) b!757310))

(assert (= (and b!757297 (not c!82954)) b!757300))

(assert (= (and b!757297 res!512149) b!757290))

(assert (= (and b!757290 res!512145) b!757303))

(declare-fun m!705035 () Bool)

(assert (=> b!757291 m!705035))

(assert (=> b!757291 m!705035))

(declare-fun m!705037 () Bool)

(assert (=> b!757291 m!705037))

(assert (=> b!757291 m!705037))

(assert (=> b!757291 m!705035))

(declare-fun m!705039 () Bool)

(assert (=> b!757291 m!705039))

(declare-fun m!705041 () Bool)

(assert (=> b!757298 m!705041))

(assert (=> b!757294 m!705035))

(assert (=> b!757294 m!705035))

(declare-fun m!705043 () Bool)

(assert (=> b!757294 m!705043))

(declare-fun m!705045 () Bool)

(assert (=> b!757295 m!705045))

(declare-fun m!705047 () Bool)

(assert (=> b!757295 m!705047))

(assert (=> b!757295 m!705045))

(declare-fun m!705049 () Bool)

(assert (=> b!757295 m!705049))

(declare-fun m!705051 () Bool)

(assert (=> b!757295 m!705051))

(declare-fun m!705053 () Bool)

(assert (=> b!757295 m!705053))

(declare-fun m!705055 () Bool)

(assert (=> b!757293 m!705055))

(assert (=> b!757309 m!705035))

(assert (=> b!757309 m!705035))

(declare-fun m!705057 () Bool)

(assert (=> b!757309 m!705057))

(declare-fun m!705059 () Bool)

(assert (=> b!757299 m!705059))

(assert (=> b!757308 m!705035))

(assert (=> b!757308 m!705035))

(declare-fun m!705061 () Bool)

(assert (=> b!757308 m!705061))

(declare-fun m!705063 () Bool)

(assert (=> b!757308 m!705063))

(declare-fun m!705065 () Bool)

(assert (=> b!757308 m!705065))

(assert (=> b!757305 m!705035))

(assert (=> b!757305 m!705035))

(assert (=> b!757305 m!705043))

(assert (=> b!757302 m!705035))

(assert (=> b!757302 m!705035))

(declare-fun m!705067 () Bool)

(assert (=> b!757302 m!705067))

(assert (=> b!757311 m!705035))

(assert (=> b!757311 m!705035))

(declare-fun m!705069 () Bool)

(assert (=> b!757311 m!705069))

(assert (=> b!757296 m!705051))

(declare-fun m!705071 () Bool)

(assert (=> b!757296 m!705071))

(declare-fun m!705073 () Bool)

(assert (=> b!757290 m!705073))

(declare-fun m!705075 () Bool)

(assert (=> b!757290 m!705075))

(declare-fun m!705077 () Bool)

(assert (=> b!757306 m!705077))

(declare-fun m!705079 () Bool)

(assert (=> b!757301 m!705079))

(declare-fun m!705081 () Bool)

(assert (=> start!65808 m!705081))

(declare-fun m!705083 () Bool)

(assert (=> start!65808 m!705083))

(declare-fun m!705085 () Bool)

(assert (=> b!757304 m!705085))

(check-sat (not b!757311) (not b!757305) (not b!757306) (not b!757293) (not b!757294) (not b!757308) (not start!65808) (not b!757302) (not b!757304) (not b!757309) (not b!757291) (not b!757290) (not b!757298) (not b!757295) (not b!757301))
(check-sat)
