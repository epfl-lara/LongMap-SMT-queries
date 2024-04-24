; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51426 () Bool)

(assert start!51426)

(declare-fun b!561301 () Bool)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5323 0))(
  ( (MissingZero!5323 (index!23519 (_ BitVec 32))) (Found!5323 (index!23520 (_ BitVec 32))) (Intermediate!5323 (undefined!6135 Bool) (index!23521 (_ BitVec 32)) (x!52581 (_ BitVec 32))) (Undefined!5323) (MissingVacant!5323 (index!23522 (_ BitVec 32))) )
))
(declare-fun lt!255394 () SeekEntryResult!5323)

(declare-datatypes ((array!35238 0))(
  ( (array!35239 (arr!16918 (Array (_ BitVec 32) (_ BitVec 64))) (size!17282 (_ BitVec 32))) )
))
(declare-fun lt!255389 () array!35238)

(declare-fun e!323444 () Bool)

(declare-fun lt!255387 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35238 (_ BitVec 32)) SeekEntryResult!5323)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35238 (_ BitVec 32)) SeekEntryResult!5323)

(assert (=> b!561301 (= e!323444 (= (seekEntryOrOpen!0 lt!255387 lt!255389 mask!3119) (seekKeyOrZeroReturnVacant!0 (x!52581 lt!255394) (index!23521 lt!255394) (index!23521 lt!255394) lt!255387 lt!255389 mask!3119)))))

(declare-fun b!561302 () Bool)

(declare-fun res!352358 () Bool)

(declare-fun e!323445 () Bool)

(assert (=> b!561302 (=> (not res!352358) (not e!323445))))

(declare-fun a!3118 () array!35238)

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!35238 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!561302 (= res!352358 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!561303 () Bool)

(declare-fun e!323442 () Bool)

(assert (=> b!561303 (= e!323445 e!323442)))

(declare-fun res!352349 () Bool)

(assert (=> b!561303 (=> (not res!352349) (not e!323442))))

(declare-fun lt!255392 () SeekEntryResult!5323)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!561303 (= res!352349 (or (= lt!255392 (MissingZero!5323 i!1132)) (= lt!255392 (MissingVacant!5323 i!1132))))))

(assert (=> b!561303 (= lt!255392 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!561305 () Bool)

(declare-fun e!323446 () Bool)

(assert (=> b!561305 (= e!323442 e!323446)))

(declare-fun res!352351 () Bool)

(assert (=> b!561305 (=> (not res!352351) (not e!323446))))

(declare-fun lt!255391 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35238 (_ BitVec 32)) SeekEntryResult!5323)

(assert (=> b!561305 (= res!352351 (= lt!255394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255391 lt!255387 lt!255389 mask!3119)))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!255393 () (_ BitVec 32))

(assert (=> b!561305 (= lt!255394 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!255393 (select (arr!16918 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!561305 (= lt!255391 (toIndex!0 lt!255387 mask!3119))))

(assert (=> b!561305 (= lt!255387 (select (store (arr!16918 a!3118) i!1132 k0!1914) j!142))))

(assert (=> b!561305 (= lt!255393 (toIndex!0 (select (arr!16918 a!3118) j!142) mask!3119))))

(assert (=> b!561305 (= lt!255389 (array!35239 (store (arr!16918 a!3118) i!1132 k0!1914) (size!17282 a!3118)))))

(declare-fun b!561306 () Bool)

(declare-fun res!352348 () Bool)

(assert (=> b!561306 (=> (not res!352348) (not e!323445))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!561306 (= res!352348 (validKeyInArray!0 (select (arr!16918 a!3118) j!142)))))

(declare-fun b!561307 () Bool)

(declare-fun res!352354 () Bool)

(assert (=> b!561307 (=> (not res!352354) (not e!323442))))

(declare-datatypes ((List!10905 0))(
  ( (Nil!10902) (Cons!10901 (h!11907 (_ BitVec 64)) (t!17125 List!10905)) )
))
(declare-fun arrayNoDuplicates!0 (array!35238 (_ BitVec 32) List!10905) Bool)

(assert (=> b!561307 (= res!352354 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10902))))

(declare-fun b!561308 () Bool)

(assert (=> b!561308 (= e!323446 (not true))))

(declare-fun e!323441 () Bool)

(assert (=> b!561308 e!323441))

(declare-fun res!352355 () Bool)

(assert (=> b!561308 (=> (not res!352355) (not e!323441))))

(declare-fun lt!255388 () SeekEntryResult!5323)

(assert (=> b!561308 (= res!352355 (= lt!255388 (Found!5323 j!142)))))

(assert (=> b!561308 (= lt!255388 (seekEntryOrOpen!0 (select (arr!16918 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35238 (_ BitVec 32)) Bool)

(assert (=> b!561308 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17491 0))(
  ( (Unit!17492) )
))
(declare-fun lt!255390 () Unit!17491)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35238 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17491)

(assert (=> b!561308 (= lt!255390 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!561309 () Bool)

(declare-fun e!323443 () Bool)

(declare-fun e!323447 () Bool)

(assert (=> b!561309 (= e!323443 e!323447)))

(declare-fun res!352350 () Bool)

(assert (=> b!561309 (=> res!352350 e!323447)))

(declare-fun lt!255386 () (_ BitVec 64))

(assert (=> b!561309 (= res!352350 (or (= lt!255386 (select (arr!16918 a!3118) j!142)) (= lt!255386 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!561309 (= lt!255386 (select (arr!16918 a!3118) (index!23521 lt!255394)))))

(declare-fun b!561304 () Bool)

(declare-fun res!352356 () Bool)

(assert (=> b!561304 (=> (not res!352356) (not e!323445))))

(assert (=> b!561304 (= res!352356 (validKeyInArray!0 k0!1914))))

(declare-fun res!352359 () Bool)

(assert (=> start!51426 (=> (not res!352359) (not e!323445))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51426 (= res!352359 (validMask!0 mask!3119))))

(assert (=> start!51426 e!323445))

(assert (=> start!51426 true))

(declare-fun array_inv!12777 (array!35238) Bool)

(assert (=> start!51426 (array_inv!12777 a!3118)))

(declare-fun b!561310 () Bool)

(declare-fun res!352353 () Bool)

(assert (=> b!561310 (=> (not res!352353) (not e!323442))))

(assert (=> b!561310 (= res!352353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!561311 () Bool)

(assert (=> b!561311 (= e!323441 e!323443)))

(declare-fun res!352360 () Bool)

(assert (=> b!561311 (=> res!352360 e!323443)))

(get-info :version)

(assert (=> b!561311 (= res!352360 (or (undefined!6135 lt!255394) (not ((_ is Intermediate!5323) lt!255394))))))

(declare-fun b!561312 () Bool)

(assert (=> b!561312 (= e!323447 e!323444)))

(declare-fun res!352357 () Bool)

(assert (=> b!561312 (=> (not res!352357) (not e!323444))))

(assert (=> b!561312 (= res!352357 (= lt!255388 (seekKeyOrZeroReturnVacant!0 (x!52581 lt!255394) (index!23521 lt!255394) (index!23521 lt!255394) (select (arr!16918 a!3118) j!142) a!3118 mask!3119)))))

(declare-fun b!561313 () Bool)

(declare-fun res!352352 () Bool)

(assert (=> b!561313 (=> (not res!352352) (not e!323445))))

(assert (=> b!561313 (= res!352352 (and (= (size!17282 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17282 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17282 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51426 res!352359) b!561313))

(assert (= (and b!561313 res!352352) b!561306))

(assert (= (and b!561306 res!352348) b!561304))

(assert (= (and b!561304 res!352356) b!561302))

(assert (= (and b!561302 res!352358) b!561303))

(assert (= (and b!561303 res!352349) b!561310))

(assert (= (and b!561310 res!352353) b!561307))

(assert (= (and b!561307 res!352354) b!561305))

(assert (= (and b!561305 res!352351) b!561308))

(assert (= (and b!561308 res!352355) b!561311))

(assert (= (and b!561311 (not res!352360)) b!561309))

(assert (= (and b!561309 (not res!352350)) b!561312))

(assert (= (and b!561312 res!352357) b!561301))

(declare-fun m!539291 () Bool)

(assert (=> b!561303 m!539291))

(declare-fun m!539293 () Bool)

(assert (=> b!561308 m!539293))

(assert (=> b!561308 m!539293))

(declare-fun m!539295 () Bool)

(assert (=> b!561308 m!539295))

(declare-fun m!539297 () Bool)

(assert (=> b!561308 m!539297))

(declare-fun m!539299 () Bool)

(assert (=> b!561308 m!539299))

(assert (=> b!561306 m!539293))

(assert (=> b!561306 m!539293))

(declare-fun m!539301 () Bool)

(assert (=> b!561306 m!539301))

(declare-fun m!539303 () Bool)

(assert (=> start!51426 m!539303))

(declare-fun m!539305 () Bool)

(assert (=> start!51426 m!539305))

(declare-fun m!539307 () Bool)

(assert (=> b!561302 m!539307))

(declare-fun m!539309 () Bool)

(assert (=> b!561310 m!539309))

(assert (=> b!561312 m!539293))

(assert (=> b!561312 m!539293))

(declare-fun m!539311 () Bool)

(assert (=> b!561312 m!539311))

(declare-fun m!539313 () Bool)

(assert (=> b!561301 m!539313))

(declare-fun m!539315 () Bool)

(assert (=> b!561301 m!539315))

(declare-fun m!539317 () Bool)

(assert (=> b!561304 m!539317))

(assert (=> b!561305 m!539293))

(declare-fun m!539319 () Bool)

(assert (=> b!561305 m!539319))

(assert (=> b!561305 m!539293))

(declare-fun m!539321 () Bool)

(assert (=> b!561305 m!539321))

(assert (=> b!561305 m!539293))

(declare-fun m!539323 () Bool)

(assert (=> b!561305 m!539323))

(declare-fun m!539325 () Bool)

(assert (=> b!561305 m!539325))

(declare-fun m!539327 () Bool)

(assert (=> b!561305 m!539327))

(declare-fun m!539329 () Bool)

(assert (=> b!561305 m!539329))

(declare-fun m!539331 () Bool)

(assert (=> b!561307 m!539331))

(assert (=> b!561309 m!539293))

(declare-fun m!539333 () Bool)

(assert (=> b!561309 m!539333))

(check-sat (not start!51426) (not b!561306) (not b!561307) (not b!561303) (not b!561312) (not b!561301) (not b!561302) (not b!561304) (not b!561308) (not b!561310) (not b!561305))
(check-sat)
