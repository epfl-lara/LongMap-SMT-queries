; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65130 () Bool)

(assert start!65130)

(declare-fun b!735460 () Bool)

(declare-fun res!494201 () Bool)

(declare-fun e!411484 () Bool)

(assert (=> b!735460 (=> (not res!494201) (not e!411484))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41303 0))(
  ( (array!41304 (arr!19765 (Array (_ BitVec 32) (_ BitVec 64))) (size!20186 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41303)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!735460 (= res!494201 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19765 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!735461 () Bool)

(declare-fun e!411489 () Bool)

(declare-fun e!411488 () Bool)

(assert (=> b!735461 (= e!411489 e!411488)))

(declare-fun res!494203 () Bool)

(assert (=> b!735461 (=> (not res!494203) (not e!411488))))

(declare-datatypes ((SeekEntryResult!7365 0))(
  ( (MissingZero!7365 (index!31828 (_ BitVec 32))) (Found!7365 (index!31829 (_ BitVec 32))) (Intermediate!7365 (undefined!8177 Bool) (index!31830 (_ BitVec 32)) (x!62835 (_ BitVec 32))) (Undefined!7365) (MissingVacant!7365 (index!31831 (_ BitVec 32))) )
))
(declare-fun lt!326036 () SeekEntryResult!7365)

(assert (=> b!735461 (= res!494203 (or (= lt!326036 (MissingZero!7365 i!1173)) (= lt!326036 (MissingVacant!7365 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41303 (_ BitVec 32)) SeekEntryResult!7365)

(assert (=> b!735461 (= lt!326036 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!735462 () Bool)

(declare-fun res!494199 () Bool)

(assert (=> b!735462 (=> (not res!494199) (not e!411488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41303 (_ BitVec 32)) Bool)

(assert (=> b!735462 (= res!494199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!735463 () Bool)

(declare-fun e!411491 () Bool)

(assert (=> b!735463 (= e!411491 true)))

(declare-fun lt!326033 () (_ BitVec 32))

(declare-fun lt!326028 () array!41303)

(declare-fun lt!326034 () (_ BitVec 64))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!326035 () SeekEntryResult!7365)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41303 (_ BitVec 32)) SeekEntryResult!7365)

(assert (=> b!735463 (= lt!326035 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326033 lt!326034 lt!326028 mask!3328))))

(declare-fun b!735464 () Bool)

(declare-fun res!494194 () Bool)

(assert (=> b!735464 (=> (not res!494194) (not e!411488))))

(declare-datatypes ((List!13767 0))(
  ( (Nil!13764) (Cons!13763 (h!14835 (_ BitVec 64)) (t!20082 List!13767)) )
))
(declare-fun arrayNoDuplicates!0 (array!41303 (_ BitVec 32) List!13767) Bool)

(assert (=> b!735464 (= res!494194 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13764))))

(declare-fun b!735465 () Bool)

(declare-fun e!411493 () Bool)

(assert (=> b!735465 (= e!411493 e!411491)))

(declare-fun res!494205 () Bool)

(assert (=> b!735465 (=> res!494205 e!411491)))

(assert (=> b!735465 (= res!494205 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326033 #b00000000000000000000000000000000) (bvsge lt!326033 (size!20186 a!3186))))))

(declare-datatypes ((Unit!25056 0))(
  ( (Unit!25057) )
))
(declare-fun lt!326026 () Unit!25056)

(declare-fun e!411485 () Unit!25056)

(assert (=> b!735465 (= lt!326026 e!411485)))

(declare-fun c!81015 () Bool)

(declare-fun lt!326029 () Bool)

(assert (=> b!735465 (= c!81015 lt!326029)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!735465 (= lt!326029 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735465 (= lt!326033 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun lt!326032 () SeekEntryResult!7365)

(declare-fun e!411483 () Bool)

(declare-fun b!735466 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!735466 (= e!411483 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326033 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326032)))))

(declare-fun lt!326039 () SeekEntryResult!7365)

(declare-fun e!411490 () Bool)

(declare-fun b!735467 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41303 (_ BitVec 32)) SeekEntryResult!7365)

(assert (=> b!735467 (= e!411490 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326039))))

(declare-fun b!735468 () Bool)

(declare-fun e!411492 () Bool)

(assert (=> b!735468 (= e!411492 (not e!411493))))

(declare-fun res!494207 () Bool)

(assert (=> b!735468 (=> res!494207 e!411493)))

(declare-fun lt!326030 () SeekEntryResult!7365)

(get-info :version)

(assert (=> b!735468 (= res!494207 (or (not ((_ is Intermediate!7365) lt!326030)) (bvsge x!1131 (x!62835 lt!326030))))))

(declare-fun lt!326038 () SeekEntryResult!7365)

(assert (=> b!735468 (= lt!326038 (Found!7365 j!159))))

(declare-fun e!411487 () Bool)

(assert (=> b!735468 e!411487))

(declare-fun res!494210 () Bool)

(assert (=> b!735468 (=> (not res!494210) (not e!411487))))

(assert (=> b!735468 (= res!494210 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326027 () Unit!25056)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41303 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25056)

(assert (=> b!735468 (= lt!326027 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!735469 () Bool)

(declare-fun Unit!25058 () Unit!25056)

(assert (=> b!735469 (= e!411485 Unit!25058)))

(declare-fun lt!326031 () SeekEntryResult!7365)

(assert (=> b!735469 (= lt!326031 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!735469 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326033 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326038)))

(declare-fun b!735470 () Bool)

(declare-fun res!494196 () Bool)

(assert (=> b!735470 (=> (not res!494196) (not e!411489))))

(assert (=> b!735470 (= res!494196 (and (= (size!20186 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20186 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20186 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!494204 () Bool)

(assert (=> start!65130 (=> (not res!494204) (not e!411489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65130 (= res!494204 (validMask!0 mask!3328))))

(assert (=> start!65130 e!411489))

(assert (=> start!65130 true))

(declare-fun array_inv!15561 (array!41303) Bool)

(assert (=> start!65130 (array_inv!15561 a!3186)))

(declare-fun e!411486 () Bool)

(declare-fun b!735471 () Bool)

(assert (=> b!735471 (= e!411486 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326032))))

(declare-fun b!735472 () Bool)

(declare-fun res!494208 () Bool)

(assert (=> b!735472 (=> (not res!494208) (not e!411484))))

(assert (=> b!735472 (= res!494208 e!411486)))

(declare-fun c!81014 () Bool)

(assert (=> b!735472 (= c!81014 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!735473 () Bool)

(assert (=> b!735473 (= e!411484 e!411492)))

(declare-fun res!494197 () Bool)

(assert (=> b!735473 (=> (not res!494197) (not e!411492))))

(declare-fun lt!326037 () SeekEntryResult!7365)

(assert (=> b!735473 (= res!494197 (= lt!326037 lt!326030))))

(assert (=> b!735473 (= lt!326030 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326034 lt!326028 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!735473 (= lt!326037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326034 mask!3328) lt!326034 lt!326028 mask!3328))))

(assert (=> b!735473 (= lt!326034 (select (store (arr!19765 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!735473 (= lt!326028 (array!41304 (store (arr!19765 a!3186) i!1173 k0!2102) (size!20186 a!3186)))))

(declare-fun b!735474 () Bool)

(declare-fun Unit!25059 () Unit!25056)

(assert (=> b!735474 (= e!411485 Unit!25059)))

(assert (=> b!735474 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326033 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326032)))

(declare-fun b!735475 () Bool)

(assert (=> b!735475 (= e!411483 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326033 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326038)))))

(declare-fun b!735476 () Bool)

(assert (=> b!735476 (= e!411488 e!411484)))

(declare-fun res!494209 () Bool)

(assert (=> b!735476 (=> (not res!494209) (not e!411484))))

(assert (=> b!735476 (= res!494209 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19765 a!3186) j!159) mask!3328) (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326032))))

(assert (=> b!735476 (= lt!326032 (Intermediate!7365 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!735477 () Bool)

(declare-fun res!494193 () Bool)

(assert (=> b!735477 (=> (not res!494193) (not e!411489))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!735477 (= res!494193 (validKeyInArray!0 k0!2102))))

(declare-fun b!735478 () Bool)

(declare-fun res!494198 () Bool)

(assert (=> b!735478 (=> (not res!494198) (not e!411489))))

(declare-fun arrayContainsKey!0 (array!41303 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!735478 (= res!494198 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!735479 () Bool)

(declare-fun res!494206 () Bool)

(assert (=> b!735479 (=> (not res!494206) (not e!411488))))

(assert (=> b!735479 (= res!494206 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20186 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20186 a!3186))))))

(declare-fun b!735480 () Bool)

(declare-fun res!494202 () Bool)

(assert (=> b!735480 (=> res!494202 e!411491)))

(assert (=> b!735480 (= res!494202 e!411483)))

(declare-fun c!81016 () Bool)

(assert (=> b!735480 (= c!81016 lt!326029)))

(declare-fun b!735481 () Bool)

(assert (=> b!735481 (= e!411486 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) (Found!7365 j!159)))))

(declare-fun b!735482 () Bool)

(assert (=> b!735482 (= e!411487 e!411490)))

(declare-fun res!494200 () Bool)

(assert (=> b!735482 (=> (not res!494200) (not e!411490))))

(assert (=> b!735482 (= res!494200 (= (seekEntryOrOpen!0 (select (arr!19765 a!3186) j!159) a!3186 mask!3328) lt!326039))))

(assert (=> b!735482 (= lt!326039 (Found!7365 j!159))))

(declare-fun b!735483 () Bool)

(declare-fun res!494195 () Bool)

(assert (=> b!735483 (=> (not res!494195) (not e!411489))))

(assert (=> b!735483 (= res!494195 (validKeyInArray!0 (select (arr!19765 a!3186) j!159)))))

(assert (= (and start!65130 res!494204) b!735470))

(assert (= (and b!735470 res!494196) b!735483))

(assert (= (and b!735483 res!494195) b!735477))

(assert (= (and b!735477 res!494193) b!735478))

(assert (= (and b!735478 res!494198) b!735461))

(assert (= (and b!735461 res!494203) b!735462))

(assert (= (and b!735462 res!494199) b!735464))

(assert (= (and b!735464 res!494194) b!735479))

(assert (= (and b!735479 res!494206) b!735476))

(assert (= (and b!735476 res!494209) b!735460))

(assert (= (and b!735460 res!494201) b!735472))

(assert (= (and b!735472 c!81014) b!735471))

(assert (= (and b!735472 (not c!81014)) b!735481))

(assert (= (and b!735472 res!494208) b!735473))

(assert (= (and b!735473 res!494197) b!735468))

(assert (= (and b!735468 res!494210) b!735482))

(assert (= (and b!735482 res!494200) b!735467))

(assert (= (and b!735468 (not res!494207)) b!735465))

(assert (= (and b!735465 c!81015) b!735474))

(assert (= (and b!735465 (not c!81015)) b!735469))

(assert (= (and b!735465 (not res!494205)) b!735480))

(assert (= (and b!735480 c!81016) b!735466))

(assert (= (and b!735480 (not c!81016)) b!735475))

(assert (= (and b!735480 (not res!494202)) b!735463))

(declare-fun m!687835 () Bool)

(assert (=> b!735477 m!687835))

(declare-fun m!687837 () Bool)

(assert (=> b!735473 m!687837))

(declare-fun m!687839 () Bool)

(assert (=> b!735473 m!687839))

(declare-fun m!687841 () Bool)

(assert (=> b!735473 m!687841))

(declare-fun m!687843 () Bool)

(assert (=> b!735473 m!687843))

(declare-fun m!687845 () Bool)

(assert (=> b!735473 m!687845))

(assert (=> b!735473 m!687837))

(declare-fun m!687847 () Bool)

(assert (=> b!735482 m!687847))

(assert (=> b!735482 m!687847))

(declare-fun m!687849 () Bool)

(assert (=> b!735482 m!687849))

(assert (=> b!735466 m!687847))

(assert (=> b!735466 m!687847))

(declare-fun m!687851 () Bool)

(assert (=> b!735466 m!687851))

(declare-fun m!687853 () Bool)

(assert (=> start!65130 m!687853))

(declare-fun m!687855 () Bool)

(assert (=> start!65130 m!687855))

(assert (=> b!735469 m!687847))

(assert (=> b!735469 m!687847))

(declare-fun m!687857 () Bool)

(assert (=> b!735469 m!687857))

(assert (=> b!735469 m!687847))

(declare-fun m!687859 () Bool)

(assert (=> b!735469 m!687859))

(declare-fun m!687861 () Bool)

(assert (=> b!735468 m!687861))

(declare-fun m!687863 () Bool)

(assert (=> b!735468 m!687863))

(declare-fun m!687865 () Bool)

(assert (=> b!735463 m!687865))

(assert (=> b!735476 m!687847))

(assert (=> b!735476 m!687847))

(declare-fun m!687867 () Bool)

(assert (=> b!735476 m!687867))

(assert (=> b!735476 m!687867))

(assert (=> b!735476 m!687847))

(declare-fun m!687869 () Bool)

(assert (=> b!735476 m!687869))

(declare-fun m!687871 () Bool)

(assert (=> b!735478 m!687871))

(declare-fun m!687873 () Bool)

(assert (=> b!735461 m!687873))

(declare-fun m!687875 () Bool)

(assert (=> b!735460 m!687875))

(assert (=> b!735475 m!687847))

(assert (=> b!735475 m!687847))

(assert (=> b!735475 m!687859))

(declare-fun m!687877 () Bool)

(assert (=> b!735462 m!687877))

(assert (=> b!735471 m!687847))

(assert (=> b!735471 m!687847))

(declare-fun m!687879 () Bool)

(assert (=> b!735471 m!687879))

(declare-fun m!687881 () Bool)

(assert (=> b!735465 m!687881))

(assert (=> b!735481 m!687847))

(assert (=> b!735481 m!687847))

(assert (=> b!735481 m!687857))

(assert (=> b!735474 m!687847))

(assert (=> b!735474 m!687847))

(assert (=> b!735474 m!687851))

(assert (=> b!735467 m!687847))

(assert (=> b!735467 m!687847))

(declare-fun m!687883 () Bool)

(assert (=> b!735467 m!687883))

(assert (=> b!735483 m!687847))

(assert (=> b!735483 m!687847))

(declare-fun m!687885 () Bool)

(assert (=> b!735483 m!687885))

(declare-fun m!687887 () Bool)

(assert (=> b!735464 m!687887))

(check-sat (not b!735482) (not b!735468) (not b!735464) (not b!735463) (not b!735474) (not b!735473) (not b!735475) (not b!735478) (not b!735461) (not b!735481) (not b!735462) (not b!735467) (not b!735469) (not b!735466) (not b!735471) (not start!65130) (not b!735483) (not b!735465) (not b!735477) (not b!735476))
(check-sat)
