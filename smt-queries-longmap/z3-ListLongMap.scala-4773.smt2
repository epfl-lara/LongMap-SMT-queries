; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65700 () Bool)

(assert start!65700)

(declare-fun b!753563 () Bool)

(declare-fun e!420302 () Bool)

(declare-datatypes ((SeekEntryResult!7650 0))(
  ( (MissingZero!7650 (index!32968 (_ BitVec 32))) (Found!7650 (index!32969 (_ BitVec 32))) (Intermediate!7650 (undefined!8462 Bool) (index!32970 (_ BitVec 32)) (x!63880 (_ BitVec 32))) (Undefined!7650) (MissingVacant!7650 (index!32971 (_ BitVec 32))) )
))
(declare-fun lt!335288 () SeekEntryResult!7650)

(declare-fun lt!335297 () SeekEntryResult!7650)

(assert (=> b!753563 (= e!420302 (= lt!335288 lt!335297))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41873 0))(
  ( (array!41874 (arr!20050 (Array (_ BitVec 32) (_ BitVec 64))) (size!20471 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41873)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!420299 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!753564 () Bool)

(declare-fun lt!335293 () SeekEntryResult!7650)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41873 (_ BitVec 32)) SeekEntryResult!7650)

(assert (=> b!753564 (= e!420299 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20050 a!3186) j!159) a!3186 mask!3328) lt!335293))))

(declare-fun b!753565 () Bool)

(declare-datatypes ((Unit!25980 0))(
  ( (Unit!25981) )
))
(declare-fun e!420305 () Unit!25980)

(declare-fun Unit!25982 () Unit!25980)

(assert (=> b!753565 (= e!420305 Unit!25982)))

(assert (=> b!753565 false))

(declare-fun b!753566 () Bool)

(declare-fun res!509076 () Bool)

(declare-fun e!420300 () Bool)

(assert (=> b!753566 (=> (not res!509076) (not e!420300))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41873 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!753566 (= res!509076 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!753567 () Bool)

(declare-fun res!509080 () Bool)

(declare-fun e!420295 () Bool)

(assert (=> b!753567 (=> (not res!509080) (not e!420295))))

(declare-datatypes ((List!14052 0))(
  ( (Nil!14049) (Cons!14048 (h!15120 (_ BitVec 64)) (t!20367 List!14052)) )
))
(declare-fun arrayNoDuplicates!0 (array!41873 (_ BitVec 32) List!14052) Bool)

(assert (=> b!753567 (= res!509080 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14049))))

(declare-fun b!753568 () Bool)

(declare-fun e!420304 () Bool)

(assert (=> b!753568 (= e!420304 true)))

(assert (=> b!753568 e!420302))

(declare-fun res!509073 () Bool)

(assert (=> b!753568 (=> (not res!509073) (not e!420302))))

(declare-fun lt!335294 () (_ BitVec 64))

(assert (=> b!753568 (= res!509073 (= lt!335294 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335296 () Unit!25980)

(assert (=> b!753568 (= lt!335296 e!420305)))

(declare-fun c!82630 () Bool)

(assert (=> b!753568 (= c!82630 (= lt!335294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!753569 () Bool)

(declare-fun res!509071 () Bool)

(assert (=> b!753569 (=> (not res!509071) (not e!420295))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!753569 (= res!509071 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20471 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20471 a!3186))))))

(declare-fun b!753570 () Bool)

(declare-fun res!509075 () Bool)

(assert (=> b!753570 (=> (not res!509075) (not e!420300))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!753570 (= res!509075 (validKeyInArray!0 k0!2102))))

(declare-fun b!753571 () Bool)

(declare-fun res!509066 () Bool)

(assert (=> b!753571 (=> (not res!509066) (not e!420302))))

(declare-fun lt!335289 () (_ BitVec 64))

(declare-fun lt!335290 () array!41873)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41873 (_ BitVec 32)) SeekEntryResult!7650)

(assert (=> b!753571 (= res!509066 (= (seekEntryOrOpen!0 lt!335289 lt!335290 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335289 lt!335290 mask!3328)))))

(declare-fun b!753572 () Bool)

(declare-fun lt!335286 () SeekEntryResult!7650)

(declare-fun e!420296 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41873 (_ BitVec 32)) SeekEntryResult!7650)

(assert (=> b!753572 (= e!420296 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20050 a!3186) j!159) a!3186 mask!3328) lt!335286))))

(declare-fun b!753573 () Bool)

(declare-fun e!420301 () Bool)

(declare-fun e!420294 () Bool)

(assert (=> b!753573 (= e!420301 e!420294)))

(declare-fun res!509067 () Bool)

(assert (=> b!753573 (=> res!509067 e!420294)))

(assert (=> b!753573 (= res!509067 (not (= lt!335297 lt!335293)))))

(assert (=> b!753573 (= lt!335297 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20050 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!753574 () Bool)

(declare-fun e!420297 () Bool)

(assert (=> b!753574 (= e!420295 e!420297)))

(declare-fun res!509072 () Bool)

(assert (=> b!753574 (=> (not res!509072) (not e!420297))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!753574 (= res!509072 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20050 a!3186) j!159) mask!3328) (select (arr!20050 a!3186) j!159) a!3186 mask!3328) lt!335286))))

(assert (=> b!753574 (= lt!335286 (Intermediate!7650 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!753575 () Bool)

(assert (=> b!753575 (= e!420294 e!420304)))

(declare-fun res!509069 () Bool)

(assert (=> b!753575 (=> res!509069 e!420304)))

(assert (=> b!753575 (= res!509069 (= lt!335294 lt!335289))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!753575 (= lt!335294 (select (store (arr!20050 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!753576 () Bool)

(declare-fun e!420298 () Bool)

(assert (=> b!753576 (= e!420298 (not e!420301))))

(declare-fun res!509084 () Bool)

(assert (=> b!753576 (=> res!509084 e!420301)))

(declare-fun lt!335295 () SeekEntryResult!7650)

(get-info :version)

(assert (=> b!753576 (= res!509084 (or (not ((_ is Intermediate!7650) lt!335295)) (bvslt x!1131 (x!63880 lt!335295)) (not (= x!1131 (x!63880 lt!335295))) (not (= index!1321 (index!32970 lt!335295)))))))

(assert (=> b!753576 e!420299))

(declare-fun res!509074 () Bool)

(assert (=> b!753576 (=> (not res!509074) (not e!420299))))

(assert (=> b!753576 (= res!509074 (= lt!335288 lt!335293))))

(assert (=> b!753576 (= lt!335293 (Found!7650 j!159))))

(assert (=> b!753576 (= lt!335288 (seekEntryOrOpen!0 (select (arr!20050 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41873 (_ BitVec 32)) Bool)

(assert (=> b!753576 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!335292 () Unit!25980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41873 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25980)

(assert (=> b!753576 (= lt!335292 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!753577 () Bool)

(declare-fun res!509082 () Bool)

(assert (=> b!753577 (=> (not res!509082) (not e!420297))))

(assert (=> b!753577 (= res!509082 e!420296)))

(declare-fun c!82629 () Bool)

(assert (=> b!753577 (= c!82629 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!753579 () Bool)

(assert (=> b!753579 (= e!420300 e!420295)))

(declare-fun res!509077 () Bool)

(assert (=> b!753579 (=> (not res!509077) (not e!420295))))

(declare-fun lt!335291 () SeekEntryResult!7650)

(assert (=> b!753579 (= res!509077 (or (= lt!335291 (MissingZero!7650 i!1173)) (= lt!335291 (MissingVacant!7650 i!1173))))))

(assert (=> b!753579 (= lt!335291 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!753580 () Bool)

(assert (=> b!753580 (= e!420297 e!420298)))

(declare-fun res!509079 () Bool)

(assert (=> b!753580 (=> (not res!509079) (not e!420298))))

(declare-fun lt!335287 () SeekEntryResult!7650)

(assert (=> b!753580 (= res!509079 (= lt!335287 lt!335295))))

(assert (=> b!753580 (= lt!335295 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335289 lt!335290 mask!3328))))

(assert (=> b!753580 (= lt!335287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335289 mask!3328) lt!335289 lt!335290 mask!3328))))

(assert (=> b!753580 (= lt!335289 (select (store (arr!20050 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!753580 (= lt!335290 (array!41874 (store (arr!20050 a!3186) i!1173 k0!2102) (size!20471 a!3186)))))

(declare-fun b!753581 () Bool)

(declare-fun res!509068 () Bool)

(assert (=> b!753581 (=> (not res!509068) (not e!420295))))

(assert (=> b!753581 (= res!509068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!753582 () Bool)

(assert (=> b!753582 (= e!420296 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20050 a!3186) j!159) a!3186 mask!3328) (Found!7650 j!159)))))

(declare-fun b!753583 () Bool)

(declare-fun res!509083 () Bool)

(assert (=> b!753583 (=> (not res!509083) (not e!420300))))

(assert (=> b!753583 (= res!509083 (and (= (size!20471 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20471 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20471 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!753584 () Bool)

(declare-fun res!509078 () Bool)

(assert (=> b!753584 (=> (not res!509078) (not e!420297))))

(assert (=> b!753584 (= res!509078 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20050 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!753585 () Bool)

(declare-fun res!509081 () Bool)

(assert (=> b!753585 (=> (not res!509081) (not e!420300))))

(assert (=> b!753585 (= res!509081 (validKeyInArray!0 (select (arr!20050 a!3186) j!159)))))

(declare-fun res!509070 () Bool)

(assert (=> start!65700 (=> (not res!509070) (not e!420300))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65700 (= res!509070 (validMask!0 mask!3328))))

(assert (=> start!65700 e!420300))

(assert (=> start!65700 true))

(declare-fun array_inv!15846 (array!41873) Bool)

(assert (=> start!65700 (array_inv!15846 a!3186)))

(declare-fun b!753578 () Bool)

(declare-fun Unit!25983 () Unit!25980)

(assert (=> b!753578 (= e!420305 Unit!25983)))

(assert (= (and start!65700 res!509070) b!753583))

(assert (= (and b!753583 res!509083) b!753585))

(assert (= (and b!753585 res!509081) b!753570))

(assert (= (and b!753570 res!509075) b!753566))

(assert (= (and b!753566 res!509076) b!753579))

(assert (= (and b!753579 res!509077) b!753581))

(assert (= (and b!753581 res!509068) b!753567))

(assert (= (and b!753567 res!509080) b!753569))

(assert (= (and b!753569 res!509071) b!753574))

(assert (= (and b!753574 res!509072) b!753584))

(assert (= (and b!753584 res!509078) b!753577))

(assert (= (and b!753577 c!82629) b!753572))

(assert (= (and b!753577 (not c!82629)) b!753582))

(assert (= (and b!753577 res!509082) b!753580))

(assert (= (and b!753580 res!509079) b!753576))

(assert (= (and b!753576 res!509074) b!753564))

(assert (= (and b!753576 (not res!509084)) b!753573))

(assert (= (and b!753573 (not res!509067)) b!753575))

(assert (= (and b!753575 (not res!509069)) b!753568))

(assert (= (and b!753568 c!82630) b!753565))

(assert (= (and b!753568 (not c!82630)) b!753578))

(assert (= (and b!753568 res!509073) b!753571))

(assert (= (and b!753571 res!509066) b!753563))

(declare-fun m!702227 () Bool)

(assert (=> b!753573 m!702227))

(assert (=> b!753573 m!702227))

(declare-fun m!702229 () Bool)

(assert (=> b!753573 m!702229))

(assert (=> b!753582 m!702227))

(assert (=> b!753582 m!702227))

(assert (=> b!753582 m!702229))

(assert (=> b!753564 m!702227))

(assert (=> b!753564 m!702227))

(declare-fun m!702231 () Bool)

(assert (=> b!753564 m!702231))

(declare-fun m!702233 () Bool)

(assert (=> b!753579 m!702233))

(declare-fun m!702235 () Bool)

(assert (=> b!753566 m!702235))

(assert (=> b!753572 m!702227))

(assert (=> b!753572 m!702227))

(declare-fun m!702237 () Bool)

(assert (=> b!753572 m!702237))

(declare-fun m!702239 () Bool)

(assert (=> b!753570 m!702239))

(declare-fun m!702241 () Bool)

(assert (=> start!65700 m!702241))

(declare-fun m!702243 () Bool)

(assert (=> start!65700 m!702243))

(assert (=> b!753574 m!702227))

(assert (=> b!753574 m!702227))

(declare-fun m!702245 () Bool)

(assert (=> b!753574 m!702245))

(assert (=> b!753574 m!702245))

(assert (=> b!753574 m!702227))

(declare-fun m!702247 () Bool)

(assert (=> b!753574 m!702247))

(assert (=> b!753585 m!702227))

(assert (=> b!753585 m!702227))

(declare-fun m!702249 () Bool)

(assert (=> b!753585 m!702249))

(assert (=> b!753576 m!702227))

(assert (=> b!753576 m!702227))

(declare-fun m!702251 () Bool)

(assert (=> b!753576 m!702251))

(declare-fun m!702253 () Bool)

(assert (=> b!753576 m!702253))

(declare-fun m!702255 () Bool)

(assert (=> b!753576 m!702255))

(declare-fun m!702257 () Bool)

(assert (=> b!753567 m!702257))

(declare-fun m!702259 () Bool)

(assert (=> b!753571 m!702259))

(declare-fun m!702261 () Bool)

(assert (=> b!753571 m!702261))

(declare-fun m!702263 () Bool)

(assert (=> b!753580 m!702263))

(declare-fun m!702265 () Bool)

(assert (=> b!753580 m!702265))

(declare-fun m!702267 () Bool)

(assert (=> b!753580 m!702267))

(declare-fun m!702269 () Bool)

(assert (=> b!753580 m!702269))

(declare-fun m!702271 () Bool)

(assert (=> b!753580 m!702271))

(assert (=> b!753580 m!702265))

(assert (=> b!753575 m!702263))

(declare-fun m!702273 () Bool)

(assert (=> b!753575 m!702273))

(declare-fun m!702275 () Bool)

(assert (=> b!753581 m!702275))

(declare-fun m!702277 () Bool)

(assert (=> b!753584 m!702277))

(check-sat (not b!753579) (not b!753580) (not b!753581) (not b!753574) (not b!753566) (not start!65700) (not b!753571) (not b!753576) (not b!753564) (not b!753567) (not b!753573) (not b!753572) (not b!753570) (not b!753582) (not b!753585))
(check-sat)
