; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65264 () Bool)

(assert start!65264)

(declare-fun b!740292 () Bool)

(declare-fun e!413906 () Bool)

(declare-fun e!413901 () Bool)

(assert (=> b!740292 (= e!413906 e!413901)))

(declare-fun res!497837 () Bool)

(assert (=> b!740292 (=> (not res!497837) (not e!413901))))

(declare-datatypes ((array!41437 0))(
  ( (array!41438 (arr!19832 (Array (_ BitVec 32) (_ BitVec 64))) (size!20253 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41437)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7432 0))(
  ( (MissingZero!7432 (index!32096 (_ BitVec 32))) (Found!7432 (index!32097 (_ BitVec 32))) (Intermediate!7432 (undefined!8244 Bool) (index!32098 (_ BitVec 32)) (x!63078 (_ BitVec 32))) (Undefined!7432) (MissingVacant!7432 (index!32099 (_ BitVec 32))) )
))
(declare-fun lt!328845 () SeekEntryResult!7432)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41437 (_ BitVec 32)) SeekEntryResult!7432)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740292 (= res!497837 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19832 a!3186) j!159) mask!3328) (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328845))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!740292 (= lt!328845 (Intermediate!7432 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!740293 () Bool)

(declare-fun e!413899 () Bool)

(assert (=> b!740293 (= e!413899 e!413906)))

(declare-fun res!497828 () Bool)

(assert (=> b!740293 (=> (not res!497828) (not e!413906))))

(declare-fun lt!328848 () SeekEntryResult!7432)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!740293 (= res!497828 (or (= lt!328848 (MissingZero!7432 i!1173)) (= lt!328848 (MissingVacant!7432 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41437 (_ BitVec 32)) SeekEntryResult!7432)

(assert (=> b!740293 (= lt!328848 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!740294 () Bool)

(declare-fun res!497824 () Bool)

(assert (=> b!740294 (=> (not res!497824) (not e!413906))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!740294 (= res!497824 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20253 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20253 a!3186))))))

(declare-fun res!497835 () Bool)

(assert (=> start!65264 (=> (not res!497835) (not e!413899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65264 (= res!497835 (validMask!0 mask!3328))))

(assert (=> start!65264 e!413899))

(assert (=> start!65264 true))

(declare-fun array_inv!15628 (array!41437) Bool)

(assert (=> start!65264 (array_inv!15628 a!3186)))

(declare-fun b!740295 () Bool)

(declare-fun e!413896 () Bool)

(declare-fun e!413904 () Bool)

(assert (=> b!740295 (= e!413896 e!413904)))

(declare-fun res!497826 () Bool)

(assert (=> b!740295 (=> res!497826 e!413904)))

(declare-fun lt!328840 () (_ BitVec 32))

(assert (=> b!740295 (= res!497826 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!328840 #b00000000000000000000000000000000) (bvsge lt!328840 (size!20253 a!3186))))))

(declare-datatypes ((Unit!25324 0))(
  ( (Unit!25325) )
))
(declare-fun lt!328851 () Unit!25324)

(declare-fun e!413897 () Unit!25324)

(assert (=> b!740295 (= lt!328851 e!413897)))

(declare-fun c!81619 () Bool)

(declare-fun lt!328850 () Bool)

(assert (=> b!740295 (= c!81619 lt!328850)))

(assert (=> b!740295 (= lt!328850 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!740295 (= lt!328840 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!740296 () Bool)

(declare-fun res!497832 () Bool)

(assert (=> b!740296 (=> (not res!497832) (not e!413899))))

(declare-fun arrayContainsKey!0 (array!41437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!740296 (= res!497832 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!740297 () Bool)

(assert (=> b!740297 (= e!413904 true)))

(declare-fun lt!328844 () SeekEntryResult!7432)

(declare-fun lt!328841 () (_ BitVec 64))

(declare-fun lt!328847 () array!41437)

(assert (=> b!740297 (= (seekEntryOrOpen!0 lt!328841 lt!328847 mask!3328) lt!328844)))

(declare-fun lt!328843 () Unit!25324)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!41437 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25324)

(assert (=> b!740297 (= lt!328843 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3186 i!1173 k!2102 j!159 lt!328840 (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateIndex!5 resIntermediateX!5 mask!3328))))

(declare-fun lt!328846 () SeekEntryResult!7432)

(declare-fun b!740298 () Bool)

(declare-fun e!413905 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41437 (_ BitVec 32)) SeekEntryResult!7432)

(assert (=> b!740298 (= e!413905 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328846))))

(declare-fun b!740299 () Bool)

(declare-fun e!413900 () Bool)

(assert (=> b!740299 (= e!413901 e!413900)))

(declare-fun res!497823 () Bool)

(assert (=> b!740299 (=> (not res!497823) (not e!413900))))

(declare-fun lt!328849 () SeekEntryResult!7432)

(declare-fun lt!328842 () SeekEntryResult!7432)

(assert (=> b!740299 (= res!497823 (= lt!328849 lt!328842))))

(assert (=> b!740299 (= lt!328842 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!328841 lt!328847 mask!3328))))

(assert (=> b!740299 (= lt!328849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!328841 mask!3328) lt!328841 lt!328847 mask!3328))))

(assert (=> b!740299 (= lt!328841 (select (store (arr!19832 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!740299 (= lt!328847 (array!41438 (store (arr!19832 a!3186) i!1173 k!2102) (size!20253 a!3186)))))

(declare-fun b!740300 () Bool)

(declare-fun res!497820 () Bool)

(assert (=> b!740300 (=> (not res!497820) (not e!413899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!740300 (= res!497820 (validKeyInArray!0 (select (arr!19832 a!3186) j!159)))))

(declare-fun b!740301 () Bool)

(declare-fun Unit!25326 () Unit!25324)

(assert (=> b!740301 (= e!413897 Unit!25326)))

(assert (=> b!740301 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328840 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328845)))

(declare-fun b!740302 () Bool)

(declare-fun res!497829 () Bool)

(assert (=> b!740302 (=> (not res!497829) (not e!413901))))

(declare-fun e!413903 () Bool)

(assert (=> b!740302 (= res!497829 e!413903)))

(declare-fun c!81618 () Bool)

(assert (=> b!740302 (= c!81618 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!740303 () Bool)

(declare-fun e!413898 () Bool)

(assert (=> b!740303 (= e!413898 e!413905)))

(declare-fun res!497822 () Bool)

(assert (=> b!740303 (=> (not res!497822) (not e!413905))))

(assert (=> b!740303 (= res!497822 (= (seekEntryOrOpen!0 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328846))))

(assert (=> b!740303 (= lt!328846 (Found!7432 j!159))))

(declare-fun b!740304 () Bool)

(declare-fun res!497833 () Bool)

(assert (=> b!740304 (=> (not res!497833) (not e!413901))))

(assert (=> b!740304 (= res!497833 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19832 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!740305 () Bool)

(declare-fun res!497831 () Bool)

(assert (=> b!740305 (=> res!497831 e!413904)))

(declare-fun e!413895 () Bool)

(assert (=> b!740305 (= res!497831 e!413895)))

(declare-fun c!81617 () Bool)

(assert (=> b!740305 (= c!81617 lt!328850)))

(declare-fun b!740306 () Bool)

(declare-fun res!497834 () Bool)

(assert (=> b!740306 (=> (not res!497834) (not e!413906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41437 (_ BitVec 32)) Bool)

(assert (=> b!740306 (= res!497834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!740307 () Bool)

(assert (=> b!740307 (= e!413895 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328840 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328845)))))

(declare-fun b!740308 () Bool)

(declare-fun res!497825 () Bool)

(assert (=> b!740308 (=> (not res!497825) (not e!413899))))

(assert (=> b!740308 (= res!497825 (and (= (size!20253 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20253 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20253 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!740309 () Bool)

(assert (=> b!740309 (= e!413895 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328840 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328844)))))

(declare-fun b!740310 () Bool)

(declare-fun Unit!25327 () Unit!25324)

(assert (=> b!740310 (= e!413897 Unit!25327)))

(declare-fun lt!328852 () SeekEntryResult!7432)

(assert (=> b!740310 (= lt!328852 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!740310 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328840 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328844)))

(declare-fun b!740311 () Bool)

(assert (=> b!740311 (= e!413900 (not e!413896))))

(declare-fun res!497827 () Bool)

(assert (=> b!740311 (=> res!497827 e!413896)))

(assert (=> b!740311 (= res!497827 (or (not (is-Intermediate!7432 lt!328842)) (bvsge x!1131 (x!63078 lt!328842))))))

(assert (=> b!740311 (= lt!328844 (Found!7432 j!159))))

(assert (=> b!740311 e!413898))

(declare-fun res!497821 () Bool)

(assert (=> b!740311 (=> (not res!497821) (not e!413898))))

(assert (=> b!740311 (= res!497821 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!328853 () Unit!25324)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41437 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25324)

(assert (=> b!740311 (= lt!328853 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!740312 () Bool)

(declare-fun res!497830 () Bool)

(assert (=> b!740312 (=> res!497830 e!413904)))

(assert (=> b!740312 (= res!497830 (not (= lt!328849 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!328840 lt!328841 lt!328847 mask!3328))))))

(declare-fun b!740313 () Bool)

(declare-fun res!497819 () Bool)

(assert (=> b!740313 (=> (not res!497819) (not e!413899))))

(assert (=> b!740313 (= res!497819 (validKeyInArray!0 k!2102))))

(declare-fun b!740314 () Bool)

(assert (=> b!740314 (= e!413903 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) (Found!7432 j!159)))))

(declare-fun b!740315 () Bool)

(declare-fun res!497836 () Bool)

(assert (=> b!740315 (=> (not res!497836) (not e!413906))))

(declare-datatypes ((List!13834 0))(
  ( (Nil!13831) (Cons!13830 (h!14902 (_ BitVec 64)) (t!20149 List!13834)) )
))
(declare-fun arrayNoDuplicates!0 (array!41437 (_ BitVec 32) List!13834) Bool)

(assert (=> b!740315 (= res!497836 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13831))))

(declare-fun b!740316 () Bool)

(assert (=> b!740316 (= e!413903 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19832 a!3186) j!159) a!3186 mask!3328) lt!328845))))

(assert (= (and start!65264 res!497835) b!740308))

(assert (= (and b!740308 res!497825) b!740300))

(assert (= (and b!740300 res!497820) b!740313))

(assert (= (and b!740313 res!497819) b!740296))

(assert (= (and b!740296 res!497832) b!740293))

(assert (= (and b!740293 res!497828) b!740306))

(assert (= (and b!740306 res!497834) b!740315))

(assert (= (and b!740315 res!497836) b!740294))

(assert (= (and b!740294 res!497824) b!740292))

(assert (= (and b!740292 res!497837) b!740304))

(assert (= (and b!740304 res!497833) b!740302))

(assert (= (and b!740302 c!81618) b!740316))

(assert (= (and b!740302 (not c!81618)) b!740314))

(assert (= (and b!740302 res!497829) b!740299))

(assert (= (and b!740299 res!497823) b!740311))

(assert (= (and b!740311 res!497821) b!740303))

(assert (= (and b!740303 res!497822) b!740298))

(assert (= (and b!740311 (not res!497827)) b!740295))

(assert (= (and b!740295 c!81619) b!740301))

(assert (= (and b!740295 (not c!81619)) b!740310))

(assert (= (and b!740295 (not res!497826)) b!740305))

(assert (= (and b!740305 c!81617) b!740307))

(assert (= (and b!740305 (not c!81617)) b!740309))

(assert (= (and b!740305 (not res!497831)) b!740312))

(assert (= (and b!740312 (not res!497830)) b!740297))

(declare-fun m!691461 () Bool)

(assert (=> b!740310 m!691461))

(assert (=> b!740310 m!691461))

(declare-fun m!691463 () Bool)

(assert (=> b!740310 m!691463))

(assert (=> b!740310 m!691461))

(declare-fun m!691465 () Bool)

(assert (=> b!740310 m!691465))

(assert (=> b!740301 m!691461))

(assert (=> b!740301 m!691461))

(declare-fun m!691467 () Bool)

(assert (=> b!740301 m!691467))

(declare-fun m!691469 () Bool)

(assert (=> b!740312 m!691469))

(assert (=> b!740309 m!691461))

(assert (=> b!740309 m!691461))

(assert (=> b!740309 m!691465))

(declare-fun m!691471 () Bool)

(assert (=> b!740313 m!691471))

(declare-fun m!691473 () Bool)

(assert (=> b!740296 m!691473))

(assert (=> b!740314 m!691461))

(assert (=> b!740314 m!691461))

(assert (=> b!740314 m!691463))

(declare-fun m!691475 () Bool)

(assert (=> b!740311 m!691475))

(declare-fun m!691477 () Bool)

(assert (=> b!740311 m!691477))

(assert (=> b!740316 m!691461))

(assert (=> b!740316 m!691461))

(declare-fun m!691479 () Bool)

(assert (=> b!740316 m!691479))

(declare-fun m!691481 () Bool)

(assert (=> b!740306 m!691481))

(declare-fun m!691483 () Bool)

(assert (=> b!740295 m!691483))

(assert (=> b!740298 m!691461))

(assert (=> b!740298 m!691461))

(declare-fun m!691485 () Bool)

(assert (=> b!740298 m!691485))

(declare-fun m!691487 () Bool)

(assert (=> b!740297 m!691487))

(declare-fun m!691489 () Bool)

(assert (=> b!740297 m!691489))

(declare-fun m!691491 () Bool)

(assert (=> b!740315 m!691491))

(assert (=> b!740292 m!691461))

(assert (=> b!740292 m!691461))

(declare-fun m!691493 () Bool)

(assert (=> b!740292 m!691493))

(assert (=> b!740292 m!691493))

(assert (=> b!740292 m!691461))

(declare-fun m!691495 () Bool)

(assert (=> b!740292 m!691495))

(assert (=> b!740303 m!691461))

(assert (=> b!740303 m!691461))

(declare-fun m!691497 () Bool)

(assert (=> b!740303 m!691497))

(declare-fun m!691499 () Bool)

(assert (=> b!740293 m!691499))

(declare-fun m!691501 () Bool)

(assert (=> b!740299 m!691501))

(declare-fun m!691503 () Bool)

(assert (=> b!740299 m!691503))

(declare-fun m!691505 () Bool)

(assert (=> b!740299 m!691505))

(declare-fun m!691507 () Bool)

(assert (=> b!740299 m!691507))

(declare-fun m!691509 () Bool)

(assert (=> b!740299 m!691509))

(assert (=> b!740299 m!691505))

(declare-fun m!691511 () Bool)

(assert (=> start!65264 m!691511))

(declare-fun m!691513 () Bool)

(assert (=> start!65264 m!691513))

(assert (=> b!740300 m!691461))

(assert (=> b!740300 m!691461))

(declare-fun m!691515 () Bool)

(assert (=> b!740300 m!691515))

(declare-fun m!691517 () Bool)

(assert (=> b!740304 m!691517))

(assert (=> b!740307 m!691461))

(assert (=> b!740307 m!691461))

(assert (=> b!740307 m!691467))

(push 1)

(assert (not b!740301))

(assert (not b!740314))

(assert (not b!740312))

(assert (not b!740293))

(assert (not b!740315))

(assert (not b!740311))

(assert (not b!740303))

(assert (not b!740295))

(assert (not b!740316))

(assert (not b!740307))

(assert (not b!740309))

(assert (not b!740306))

(assert (not b!740298))

(assert (not b!740310))

(assert (not b!740300))

(assert (not b!740299))

(assert (not b!740297))

(assert (not start!65264))

(assert (not b!740296))

(assert (not b!740313))

(assert (not b!740292))

(check-sat)

(pop 1)

(push 1)

(check-sat)

