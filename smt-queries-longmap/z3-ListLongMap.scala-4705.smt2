; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65292 () Bool)

(assert start!65292)

(declare-fun b!741239 () Bool)

(declare-fun res!498580 () Bool)

(declare-fun e!414359 () Bool)

(assert (=> b!741239 (=> (not res!498580) (not e!414359))))

(declare-datatypes ((array!41465 0))(
  ( (array!41466 (arr!19846 (Array (_ BitVec 32) (_ BitVec 64))) (size!20267 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41465)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41465 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741239 (= res!498580 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!498571 () Bool)

(assert (=> start!65292 (=> (not res!498571) (not e!414359))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65292 (= res!498571 (validMask!0 mask!3328))))

(assert (=> start!65292 e!414359))

(assert (=> start!65292 true))

(declare-fun array_inv!15642 (array!41465) Bool)

(assert (=> start!65292 (array_inv!15642 a!3186)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!741240 () Bool)

(declare-fun e!414354 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7446 0))(
  ( (MissingZero!7446 (index!32152 (_ BitVec 32))) (Found!7446 (index!32153 (_ BitVec 32))) (Intermediate!7446 (undefined!8258 Bool) (index!32154 (_ BitVec 32)) (x!63132 (_ BitVec 32))) (Undefined!7446) (MissingVacant!7446 (index!32155 (_ BitVec 32))) )
))
(declare-fun lt!329328 () SeekEntryResult!7446)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41465 (_ BitVec 32)) SeekEntryResult!7446)

(assert (=> b!741240 (= e!414354 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19846 a!3186) j!159) a!3186 mask!3328) lt!329328))))

(declare-fun b!741241 () Bool)

(declare-fun e!414357 () Bool)

(assert (=> b!741241 (= e!414359 e!414357)))

(declare-fun res!498573 () Bool)

(assert (=> b!741241 (=> (not res!498573) (not e!414357))))

(declare-fun lt!329329 () SeekEntryResult!7446)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!741241 (= res!498573 (or (= lt!329329 (MissingZero!7446 i!1173)) (= lt!329329 (MissingVacant!7446 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41465 (_ BitVec 32)) SeekEntryResult!7446)

(assert (=> b!741241 (= lt!329329 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741242 () Bool)

(declare-fun res!498570 () Bool)

(assert (=> b!741242 (=> (not res!498570) (not e!414357))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!741242 (= res!498570 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20267 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20267 a!3186))))))

(declare-fun b!741243 () Bool)

(declare-fun lt!329333 () SeekEntryResult!7446)

(declare-fun e!414352 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41465 (_ BitVec 32)) SeekEntryResult!7446)

(assert (=> b!741243 (= e!414352 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19846 a!3186) j!159) a!3186 mask!3328) lt!329333))))

(declare-fun b!741244 () Bool)

(declare-fun res!498576 () Bool)

(assert (=> b!741244 (=> (not res!498576) (not e!414357))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41465 (_ BitVec 32)) Bool)

(assert (=> b!741244 (= res!498576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741245 () Bool)

(declare-fun res!498579 () Bool)

(declare-fun e!414356 () Bool)

(assert (=> b!741245 (=> (not res!498579) (not e!414356))))

(assert (=> b!741245 (= res!498579 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19846 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!741246 () Bool)

(declare-fun res!498583 () Bool)

(assert (=> b!741246 (=> (not res!498583) (not e!414359))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741246 (= res!498583 (validKeyInArray!0 (select (arr!19846 a!3186) j!159)))))

(declare-fun b!741247 () Bool)

(declare-fun e!414355 () Bool)

(assert (=> b!741247 (= e!414356 e!414355)))

(declare-fun res!498574 () Bool)

(assert (=> b!741247 (=> (not res!498574) (not e!414355))))

(declare-fun lt!329331 () SeekEntryResult!7446)

(declare-fun lt!329327 () SeekEntryResult!7446)

(assert (=> b!741247 (= res!498574 (= lt!329331 lt!329327))))

(declare-fun lt!329330 () array!41465)

(declare-fun lt!329332 () (_ BitVec 64))

(assert (=> b!741247 (= lt!329327 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329332 lt!329330 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741247 (= lt!329331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329332 mask!3328) lt!329332 lt!329330 mask!3328))))

(assert (=> b!741247 (= lt!329332 (select (store (arr!19846 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741247 (= lt!329330 (array!41466 (store (arr!19846 a!3186) i!1173 k0!2102) (size!20267 a!3186)))))

(declare-fun b!741248 () Bool)

(assert (=> b!741248 (= e!414352 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19846 a!3186) j!159) a!3186 mask!3328) (Found!7446 j!159)))))

(declare-fun b!741249 () Bool)

(declare-fun e!414353 () Bool)

(assert (=> b!741249 (= e!414353 e!414354)))

(declare-fun res!498575 () Bool)

(assert (=> b!741249 (=> (not res!498575) (not e!414354))))

(assert (=> b!741249 (= res!498575 (= (seekEntryOrOpen!0 (select (arr!19846 a!3186) j!159) a!3186 mask!3328) lt!329328))))

(assert (=> b!741249 (= lt!329328 (Found!7446 j!159))))

(declare-fun b!741250 () Bool)

(get-info :version)

(assert (=> b!741250 (= e!414355 (not (or (not ((_ is Intermediate!7446) lt!329327)) (not (= x!1131 (x!63132 lt!329327))) (not (= index!1321 (index!32154 lt!329327))) (bvsge mask!3328 #b00000000000000000000000000000000))))))

(assert (=> b!741250 e!414353))

(declare-fun res!498581 () Bool)

(assert (=> b!741250 (=> (not res!498581) (not e!414353))))

(assert (=> b!741250 (= res!498581 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25372 0))(
  ( (Unit!25373) )
))
(declare-fun lt!329326 () Unit!25372)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41465 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25372)

(assert (=> b!741250 (= lt!329326 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741251 () Bool)

(declare-fun res!498577 () Bool)

(assert (=> b!741251 (=> (not res!498577) (not e!414356))))

(assert (=> b!741251 (= res!498577 e!414352)))

(declare-fun c!81715 () Bool)

(assert (=> b!741251 (= c!81715 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!741252 () Bool)

(declare-fun res!498578 () Bool)

(assert (=> b!741252 (=> (not res!498578) (not e!414359))))

(assert (=> b!741252 (= res!498578 (and (= (size!20267 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20267 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20267 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741253 () Bool)

(assert (=> b!741253 (= e!414357 e!414356)))

(declare-fun res!498572 () Bool)

(assert (=> b!741253 (=> (not res!498572) (not e!414356))))

(assert (=> b!741253 (= res!498572 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19846 a!3186) j!159) mask!3328) (select (arr!19846 a!3186) j!159) a!3186 mask!3328) lt!329333))))

(assert (=> b!741253 (= lt!329333 (Intermediate!7446 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741254 () Bool)

(declare-fun res!498584 () Bool)

(assert (=> b!741254 (=> (not res!498584) (not e!414359))))

(assert (=> b!741254 (= res!498584 (validKeyInArray!0 k0!2102))))

(declare-fun b!741255 () Bool)

(declare-fun res!498582 () Bool)

(assert (=> b!741255 (=> (not res!498582) (not e!414357))))

(declare-datatypes ((List!13848 0))(
  ( (Nil!13845) (Cons!13844 (h!14916 (_ BitVec 64)) (t!20163 List!13848)) )
))
(declare-fun arrayNoDuplicates!0 (array!41465 (_ BitVec 32) List!13848) Bool)

(assert (=> b!741255 (= res!498582 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13845))))

(assert (= (and start!65292 res!498571) b!741252))

(assert (= (and b!741252 res!498578) b!741246))

(assert (= (and b!741246 res!498583) b!741254))

(assert (= (and b!741254 res!498584) b!741239))

(assert (= (and b!741239 res!498580) b!741241))

(assert (= (and b!741241 res!498573) b!741244))

(assert (= (and b!741244 res!498576) b!741255))

(assert (= (and b!741255 res!498582) b!741242))

(assert (= (and b!741242 res!498570) b!741253))

(assert (= (and b!741253 res!498572) b!741245))

(assert (= (and b!741245 res!498579) b!741251))

(assert (= (and b!741251 c!81715) b!741243))

(assert (= (and b!741251 (not c!81715)) b!741248))

(assert (= (and b!741251 res!498577) b!741247))

(assert (= (and b!741247 res!498574) b!741250))

(assert (= (and b!741250 res!498581) b!741249))

(assert (= (and b!741249 res!498575) b!741240))

(declare-fun m!692231 () Bool)

(assert (=> b!741240 m!692231))

(assert (=> b!741240 m!692231))

(declare-fun m!692233 () Bool)

(assert (=> b!741240 m!692233))

(declare-fun m!692235 () Bool)

(assert (=> b!741255 m!692235))

(declare-fun m!692237 () Bool)

(assert (=> b!741244 m!692237))

(assert (=> b!741253 m!692231))

(assert (=> b!741253 m!692231))

(declare-fun m!692239 () Bool)

(assert (=> b!741253 m!692239))

(assert (=> b!741253 m!692239))

(assert (=> b!741253 m!692231))

(declare-fun m!692241 () Bool)

(assert (=> b!741253 m!692241))

(declare-fun m!692243 () Bool)

(assert (=> b!741241 m!692243))

(declare-fun m!692245 () Bool)

(assert (=> b!741254 m!692245))

(assert (=> b!741243 m!692231))

(assert (=> b!741243 m!692231))

(declare-fun m!692247 () Bool)

(assert (=> b!741243 m!692247))

(assert (=> b!741246 m!692231))

(assert (=> b!741246 m!692231))

(declare-fun m!692249 () Bool)

(assert (=> b!741246 m!692249))

(declare-fun m!692251 () Bool)

(assert (=> b!741239 m!692251))

(declare-fun m!692253 () Bool)

(assert (=> b!741247 m!692253))

(declare-fun m!692255 () Bool)

(assert (=> b!741247 m!692255))

(assert (=> b!741247 m!692253))

(declare-fun m!692257 () Bool)

(assert (=> b!741247 m!692257))

(declare-fun m!692259 () Bool)

(assert (=> b!741247 m!692259))

(declare-fun m!692261 () Bool)

(assert (=> b!741247 m!692261))

(declare-fun m!692263 () Bool)

(assert (=> b!741250 m!692263))

(declare-fun m!692265 () Bool)

(assert (=> b!741250 m!692265))

(declare-fun m!692267 () Bool)

(assert (=> start!65292 m!692267))

(declare-fun m!692269 () Bool)

(assert (=> start!65292 m!692269))

(declare-fun m!692271 () Bool)

(assert (=> b!741245 m!692271))

(assert (=> b!741248 m!692231))

(assert (=> b!741248 m!692231))

(declare-fun m!692273 () Bool)

(assert (=> b!741248 m!692273))

(assert (=> b!741249 m!692231))

(assert (=> b!741249 m!692231))

(declare-fun m!692275 () Bool)

(assert (=> b!741249 m!692275))

(check-sat (not b!741244) (not b!741241) (not b!741250) (not start!65292) (not b!741239) (not b!741255) (not b!741253) (not b!741240) (not b!741247) (not b!741248) (not b!741249) (not b!741246) (not b!741254) (not b!741243))
(check-sat)
