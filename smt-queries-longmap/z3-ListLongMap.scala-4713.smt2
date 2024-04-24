; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65466 () Bool)

(assert start!65466)

(declare-fun b!743170 () Bool)

(declare-fun res!499931 () Bool)

(declare-fun e!415399 () Bool)

(assert (=> b!743170 (=> (not res!499931) (not e!415399))))

(declare-datatypes ((array!41509 0))(
  ( (array!41510 (arr!19864 (Array (_ BitVec 32) (_ BitVec 64))) (size!20284 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41509)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!743170 (= res!499931 (and (= (size!20284 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20284 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20284 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!743171 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7420 0))(
  ( (MissingZero!7420 (index!32048 (_ BitVec 32))) (Found!7420 (index!32049 (_ BitVec 32))) (Intermediate!7420 (undefined!8232 Bool) (index!32050 (_ BitVec 32)) (x!63182 (_ BitVec 32))) (Undefined!7420) (MissingVacant!7420 (index!32051 (_ BitVec 32))) )
))
(declare-fun lt!330128 () SeekEntryResult!7420)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!415400 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41509 (_ BitVec 32)) SeekEntryResult!7420)

(assert (=> b!743171 (= e!415400 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19864 a!3186) j!159) a!3186 mask!3328) lt!330128))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!743172 () Bool)

(declare-fun lt!330133 () SeekEntryResult!7420)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!415398 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41509 (_ BitVec 32)) SeekEntryResult!7420)

(assert (=> b!743172 (= e!415398 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19864 a!3186) j!159) a!3186 mask!3328) lt!330133))))

(declare-fun b!743173 () Bool)

(assert (=> b!743173 (= e!415400 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19864 a!3186) j!159) a!3186 mask!3328) (Found!7420 j!159)))))

(declare-fun b!743174 () Bool)

(declare-fun res!499935 () Bool)

(declare-fun e!415393 () Bool)

(assert (=> b!743174 (=> (not res!499935) (not e!415393))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41509 (_ BitVec 32)) Bool)

(assert (=> b!743174 (= res!499935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!743175 () Bool)

(declare-fun e!415395 () Bool)

(declare-fun e!415397 () Bool)

(assert (=> b!743175 (= e!415395 (not e!415397))))

(declare-fun res!499932 () Bool)

(assert (=> b!743175 (=> res!499932 e!415397)))

(declare-fun lt!330135 () SeekEntryResult!7420)

(get-info :version)

(assert (=> b!743175 (= res!499932 (or (not ((_ is Intermediate!7420) lt!330135)) (bvslt x!1131 (x!63182 lt!330135)) (not (= x!1131 (x!63182 lt!330135))) (not (= index!1321 (index!32050 lt!330135)))))))

(declare-fun e!415401 () Bool)

(assert (=> b!743175 e!415401))

(declare-fun res!499925 () Bool)

(assert (=> b!743175 (=> (not res!499925) (not e!415401))))

(assert (=> b!743175 (= res!499925 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25399 0))(
  ( (Unit!25400) )
))
(declare-fun lt!330130 () Unit!25399)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25399)

(assert (=> b!743175 (= lt!330130 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!743176 () Bool)

(declare-fun res!499929 () Bool)

(declare-fun e!415394 () Bool)

(assert (=> b!743176 (=> (not res!499929) (not e!415394))))

(assert (=> b!743176 (= res!499929 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19864 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!743177 () Bool)

(assert (=> b!743177 (= e!415393 e!415394)))

(declare-fun res!499938 () Bool)

(assert (=> b!743177 (=> (not res!499938) (not e!415394))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!743177 (= res!499938 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19864 a!3186) j!159) mask!3328) (select (arr!19864 a!3186) j!159) a!3186 mask!3328) lt!330128))))

(assert (=> b!743177 (= lt!330128 (Intermediate!7420 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!743178 () Bool)

(assert (=> b!743178 (= e!415399 e!415393)))

(declare-fun res!499937 () Bool)

(assert (=> b!743178 (=> (not res!499937) (not e!415393))))

(declare-fun lt!330131 () SeekEntryResult!7420)

(assert (=> b!743178 (= res!499937 (or (= lt!330131 (MissingZero!7420 i!1173)) (= lt!330131 (MissingVacant!7420 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41509 (_ BitVec 32)) SeekEntryResult!7420)

(assert (=> b!743178 (= lt!330131 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!743179 () Bool)

(declare-fun res!499928 () Bool)

(assert (=> b!743179 (=> (not res!499928) (not e!415399))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!743179 (= res!499928 (validKeyInArray!0 (select (arr!19864 a!3186) j!159)))))

(declare-fun res!499930 () Bool)

(assert (=> start!65466 (=> (not res!499930) (not e!415399))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65466 (= res!499930 (validMask!0 mask!3328))))

(assert (=> start!65466 e!415399))

(assert (=> start!65466 true))

(declare-fun array_inv!15723 (array!41509) Bool)

(assert (=> start!65466 (array_inv!15723 a!3186)))

(declare-fun b!743180 () Bool)

(declare-fun res!499923 () Bool)

(assert (=> b!743180 (=> (not res!499923) (not e!415393))))

(declare-datatypes ((List!13773 0))(
  ( (Nil!13770) (Cons!13769 (h!14847 (_ BitVec 64)) (t!20080 List!13773)) )
))
(declare-fun arrayNoDuplicates!0 (array!41509 (_ BitVec 32) List!13773) Bool)

(assert (=> b!743180 (= res!499923 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13770))))

(declare-fun b!743181 () Bool)

(declare-fun res!499927 () Bool)

(assert (=> b!743181 (=> (not res!499927) (not e!415394))))

(assert (=> b!743181 (= res!499927 e!415400)))

(declare-fun c!82007 () Bool)

(assert (=> b!743181 (= c!82007 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!743182 () Bool)

(assert (=> b!743182 (= e!415394 e!415395)))

(declare-fun res!499924 () Bool)

(assert (=> b!743182 (=> (not res!499924) (not e!415395))))

(declare-fun lt!330132 () SeekEntryResult!7420)

(assert (=> b!743182 (= res!499924 (= lt!330132 lt!330135))))

(declare-fun lt!330134 () array!41509)

(declare-fun lt!330129 () (_ BitVec 64))

(assert (=> b!743182 (= lt!330135 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!330129 lt!330134 mask!3328))))

(assert (=> b!743182 (= lt!330132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!330129 mask!3328) lt!330129 lt!330134 mask!3328))))

(assert (=> b!743182 (= lt!330129 (select (store (arr!19864 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!743182 (= lt!330134 (array!41510 (store (arr!19864 a!3186) i!1173 k0!2102) (size!20284 a!3186)))))

(declare-fun b!743183 () Bool)

(declare-fun res!499934 () Bool)

(assert (=> b!743183 (=> (not res!499934) (not e!415393))))

(assert (=> b!743183 (= res!499934 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20284 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20284 a!3186))))))

(declare-fun b!743184 () Bool)

(assert (=> b!743184 (= e!415397 (or (not (= (select (store (arr!19864 a!3186) i!1173 k0!2102) index!1321) lt!330129)) (undefined!8232 lt!330135) (bvsge mask!3328 #b00000000000000000000000000000000)))))

(declare-fun b!743185 () Bool)

(declare-fun res!499936 () Bool)

(assert (=> b!743185 (=> (not res!499936) (not e!415399))))

(assert (=> b!743185 (= res!499936 (validKeyInArray!0 k0!2102))))

(declare-fun b!743186 () Bool)

(declare-fun res!499926 () Bool)

(assert (=> b!743186 (=> (not res!499926) (not e!415399))))

(declare-fun arrayContainsKey!0 (array!41509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!743186 (= res!499926 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!743187 () Bool)

(declare-fun res!499933 () Bool)

(assert (=> b!743187 (=> res!499933 e!415397)))

(assert (=> b!743187 (= res!499933 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19864 a!3186) j!159) a!3186 mask!3328) (Found!7420 j!159))))))

(declare-fun b!743188 () Bool)

(assert (=> b!743188 (= e!415401 e!415398)))

(declare-fun res!499939 () Bool)

(assert (=> b!743188 (=> (not res!499939) (not e!415398))))

(assert (=> b!743188 (= res!499939 (= (seekEntryOrOpen!0 (select (arr!19864 a!3186) j!159) a!3186 mask!3328) lt!330133))))

(assert (=> b!743188 (= lt!330133 (Found!7420 j!159))))

(assert (= (and start!65466 res!499930) b!743170))

(assert (= (and b!743170 res!499931) b!743179))

(assert (= (and b!743179 res!499928) b!743185))

(assert (= (and b!743185 res!499936) b!743186))

(assert (= (and b!743186 res!499926) b!743178))

(assert (= (and b!743178 res!499937) b!743174))

(assert (= (and b!743174 res!499935) b!743180))

(assert (= (and b!743180 res!499923) b!743183))

(assert (= (and b!743183 res!499934) b!743177))

(assert (= (and b!743177 res!499938) b!743176))

(assert (= (and b!743176 res!499929) b!743181))

(assert (= (and b!743181 c!82007) b!743171))

(assert (= (and b!743181 (not c!82007)) b!743173))

(assert (= (and b!743181 res!499927) b!743182))

(assert (= (and b!743182 res!499924) b!743175))

(assert (= (and b!743175 res!499925) b!743188))

(assert (= (and b!743188 res!499939) b!743172))

(assert (= (and b!743175 (not res!499932)) b!743187))

(assert (= (and b!743187 (not res!499933)) b!743184))

(declare-fun m!694449 () Bool)

(assert (=> b!743187 m!694449))

(assert (=> b!743187 m!694449))

(declare-fun m!694451 () Bool)

(assert (=> b!743187 m!694451))

(assert (=> b!743172 m!694449))

(assert (=> b!743172 m!694449))

(declare-fun m!694453 () Bool)

(assert (=> b!743172 m!694453))

(declare-fun m!694455 () Bool)

(assert (=> b!743180 m!694455))

(declare-fun m!694457 () Bool)

(assert (=> b!743178 m!694457))

(assert (=> b!743173 m!694449))

(assert (=> b!743173 m!694449))

(assert (=> b!743173 m!694451))

(assert (=> b!743177 m!694449))

(assert (=> b!743177 m!694449))

(declare-fun m!694459 () Bool)

(assert (=> b!743177 m!694459))

(assert (=> b!743177 m!694459))

(assert (=> b!743177 m!694449))

(declare-fun m!694461 () Bool)

(assert (=> b!743177 m!694461))

(declare-fun m!694463 () Bool)

(assert (=> b!743182 m!694463))

(declare-fun m!694465 () Bool)

(assert (=> b!743182 m!694465))

(declare-fun m!694467 () Bool)

(assert (=> b!743182 m!694467))

(assert (=> b!743182 m!694463))

(declare-fun m!694469 () Bool)

(assert (=> b!743182 m!694469))

(declare-fun m!694471 () Bool)

(assert (=> b!743182 m!694471))

(declare-fun m!694473 () Bool)

(assert (=> b!743176 m!694473))

(assert (=> b!743171 m!694449))

(assert (=> b!743171 m!694449))

(declare-fun m!694475 () Bool)

(assert (=> b!743171 m!694475))

(assert (=> b!743188 m!694449))

(assert (=> b!743188 m!694449))

(declare-fun m!694477 () Bool)

(assert (=> b!743188 m!694477))

(declare-fun m!694479 () Bool)

(assert (=> b!743175 m!694479))

(declare-fun m!694481 () Bool)

(assert (=> b!743175 m!694481))

(assert (=> b!743184 m!694467))

(declare-fun m!694483 () Bool)

(assert (=> b!743184 m!694483))

(declare-fun m!694485 () Bool)

(assert (=> b!743174 m!694485))

(declare-fun m!694487 () Bool)

(assert (=> start!65466 m!694487))

(declare-fun m!694489 () Bool)

(assert (=> start!65466 m!694489))

(declare-fun m!694491 () Bool)

(assert (=> b!743185 m!694491))

(declare-fun m!694493 () Bool)

(assert (=> b!743186 m!694493))

(assert (=> b!743179 m!694449))

(assert (=> b!743179 m!694449))

(declare-fun m!694495 () Bool)

(assert (=> b!743179 m!694495))

(check-sat (not b!743174) (not b!743172) (not b!743188) (not b!743177) (not b!743175) (not b!743187) (not b!743178) (not b!743180) (not start!65466) (not b!743185) (not b!743173) (not b!743186) (not b!743179) (not b!743171) (not b!743182))
(check-sat)
