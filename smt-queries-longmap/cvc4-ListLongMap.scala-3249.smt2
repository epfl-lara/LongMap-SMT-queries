; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45370 () Bool)

(assert start!45370)

(declare-fun b!498288 () Bool)

(declare-fun res!300409 () Bool)

(declare-fun e!292062 () Bool)

(assert (=> b!498288 (=> (not res!300409) (not e!292062))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32195 0))(
  ( (array!32196 (arr!15479 (Array (_ BitVec 32) (_ BitVec 64))) (size!15843 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32195)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!498288 (= res!300409 (and (= (size!15843 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15843 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15843 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!498289 () Bool)

(declare-fun e!292058 () Bool)

(declare-fun e!292059 () Bool)

(assert (=> b!498289 (= e!292058 e!292059)))

(declare-fun res!300415 () Bool)

(assert (=> b!498289 (=> res!300415 e!292059)))

(declare-datatypes ((SeekEntryResult!3946 0))(
  ( (MissingZero!3946 (index!17966 (_ BitVec 32))) (Found!3946 (index!17967 (_ BitVec 32))) (Intermediate!3946 (undefined!4758 Bool) (index!17968 (_ BitVec 32)) (x!47015 (_ BitVec 32))) (Undefined!3946) (MissingVacant!3946 (index!17969 (_ BitVec 32))) )
))
(declare-fun lt!225686 () SeekEntryResult!3946)

(declare-fun lt!225679 () (_ BitVec 32))

(assert (=> b!498289 (= res!300415 (or (bvsgt #b00000000000000000000000000000000 (x!47015 lt!225686)) (bvsgt (x!47015 lt!225686) #b01111111111111111111111111111110) (bvslt lt!225679 #b00000000000000000000000000000000) (bvsge lt!225679 (size!15843 a!3235)) (bvslt (index!17968 lt!225686) #b00000000000000000000000000000000) (bvsge (index!17968 lt!225686) (size!15843 a!3235)) (not (= lt!225686 (Intermediate!3946 false (index!17968 lt!225686) (x!47015 lt!225686))))))))

(assert (=> b!498289 (and (or (= (select (arr!15479 a!3235) (index!17968 lt!225686)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15479 a!3235) (index!17968 lt!225686)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15479 a!3235) (index!17968 lt!225686)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15479 a!3235) (index!17968 lt!225686)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!14860 0))(
  ( (Unit!14861) )
))
(declare-fun lt!225687 () Unit!14860)

(declare-fun e!292056 () Unit!14860)

(assert (=> b!498289 (= lt!225687 e!292056)))

(declare-fun c!59219 () Bool)

(assert (=> b!498289 (= c!59219 (= (select (arr!15479 a!3235) (index!17968 lt!225686)) (select (arr!15479 a!3235) j!176)))))

(assert (=> b!498289 (and (bvslt (x!47015 lt!225686) #b01111111111111111111111111111110) (or (= (select (arr!15479 a!3235) (index!17968 lt!225686)) (select (arr!15479 a!3235) j!176)) (= (select (arr!15479 a!3235) (index!17968 lt!225686)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15479 a!3235) (index!17968 lt!225686)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!498290 () Bool)

(declare-fun e!292057 () Bool)

(assert (=> b!498290 (= e!292062 e!292057)))

(declare-fun res!300410 () Bool)

(assert (=> b!498290 (=> (not res!300410) (not e!292057))))

(declare-fun lt!225683 () SeekEntryResult!3946)

(assert (=> b!498290 (= res!300410 (or (= lt!225683 (MissingZero!3946 i!1204)) (= lt!225683 (MissingVacant!3946 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32195 (_ BitVec 32)) SeekEntryResult!3946)

(assert (=> b!498290 (= lt!225683 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!498291 () Bool)

(assert (=> b!498291 (= e!292059 true)))

(declare-fun lt!225688 () SeekEntryResult!3946)

(declare-fun lt!225680 () (_ BitVec 64))

(declare-fun lt!225684 () array!32195)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32195 (_ BitVec 32)) SeekEntryResult!3946)

(assert (=> b!498291 (= lt!225688 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225679 lt!225680 lt!225684 mask!3524))))

(declare-fun b!498292 () Bool)

(declare-fun res!300408 () Bool)

(assert (=> b!498292 (=> (not res!300408) (not e!292062))))

(declare-fun arrayContainsKey!0 (array!32195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!498292 (= res!300408 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!498293 () Bool)

(declare-fun res!300416 () Bool)

(assert (=> b!498293 (=> (not res!300416) (not e!292062))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!498293 (= res!300416 (validKeyInArray!0 k!2280))))

(declare-fun b!498294 () Bool)

(declare-fun Unit!14862 () Unit!14860)

(assert (=> b!498294 (= e!292056 Unit!14862)))

(declare-fun b!498295 () Bool)

(declare-fun res!300413 () Bool)

(assert (=> b!498295 (=> (not res!300413) (not e!292062))))

(assert (=> b!498295 (= res!300413 (validKeyInArray!0 (select (arr!15479 a!3235) j!176)))))

(declare-fun b!498296 () Bool)

(declare-fun Unit!14863 () Unit!14860)

(assert (=> b!498296 (= e!292056 Unit!14863)))

(declare-fun lt!225685 () Unit!14860)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32195 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14860)

(assert (=> b!498296 (= lt!225685 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!225679 #b00000000000000000000000000000000 (index!17968 lt!225686) (x!47015 lt!225686) mask!3524))))

(declare-fun res!300405 () Bool)

(assert (=> b!498296 (= res!300405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225679 lt!225680 lt!225684 mask!3524) (Intermediate!3946 false (index!17968 lt!225686) (x!47015 lt!225686))))))

(declare-fun e!292061 () Bool)

(assert (=> b!498296 (=> (not res!300405) (not e!292061))))

(assert (=> b!498296 e!292061))

(declare-fun b!498297 () Bool)

(declare-fun res!300404 () Bool)

(assert (=> b!498297 (=> (not res!300404) (not e!292057))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32195 (_ BitVec 32)) Bool)

(assert (=> b!498297 (= res!300404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!498298 () Bool)

(declare-fun e!292060 () Bool)

(assert (=> b!498298 (= e!292060 (= (seekEntryOrOpen!0 (select (arr!15479 a!3235) j!176) a!3235 mask!3524) (Found!3946 j!176)))))

(declare-fun b!498299 () Bool)

(declare-fun res!300411 () Bool)

(assert (=> b!498299 (=> res!300411 e!292058)))

(assert (=> b!498299 (= res!300411 (or (undefined!4758 lt!225686) (not (is-Intermediate!3946 lt!225686))))))

(declare-fun res!300407 () Bool)

(assert (=> start!45370 (=> (not res!300407) (not e!292062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45370 (= res!300407 (validMask!0 mask!3524))))

(assert (=> start!45370 e!292062))

(assert (=> start!45370 true))

(declare-fun array_inv!11275 (array!32195) Bool)

(assert (=> start!45370 (array_inv!11275 a!3235)))

(declare-fun b!498300 () Bool)

(declare-fun res!300414 () Bool)

(assert (=> b!498300 (=> (not res!300414) (not e!292057))))

(declare-datatypes ((List!9637 0))(
  ( (Nil!9634) (Cons!9633 (h!10507 (_ BitVec 64)) (t!15865 List!9637)) )
))
(declare-fun arrayNoDuplicates!0 (array!32195 (_ BitVec 32) List!9637) Bool)

(assert (=> b!498300 (= res!300414 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9634))))

(declare-fun b!498301 () Bool)

(assert (=> b!498301 (= e!292061 false)))

(declare-fun b!498302 () Bool)

(assert (=> b!498302 (= e!292057 (not e!292058))))

(declare-fun res!300406 () Bool)

(assert (=> b!498302 (=> res!300406 e!292058)))

(declare-fun lt!225681 () (_ BitVec 32))

(assert (=> b!498302 (= res!300406 (= lt!225686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225681 lt!225680 lt!225684 mask!3524)))))

(assert (=> b!498302 (= lt!225686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225679 (select (arr!15479 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!498302 (= lt!225681 (toIndex!0 lt!225680 mask!3524))))

(assert (=> b!498302 (= lt!225680 (select (store (arr!15479 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!498302 (= lt!225679 (toIndex!0 (select (arr!15479 a!3235) j!176) mask!3524))))

(assert (=> b!498302 (= lt!225684 (array!32196 (store (arr!15479 a!3235) i!1204 k!2280) (size!15843 a!3235)))))

(assert (=> b!498302 e!292060))

(declare-fun res!300412 () Bool)

(assert (=> b!498302 (=> (not res!300412) (not e!292060))))

(assert (=> b!498302 (= res!300412 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!225682 () Unit!14860)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32195 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14860)

(assert (=> b!498302 (= lt!225682 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!45370 res!300407) b!498288))

(assert (= (and b!498288 res!300409) b!498295))

(assert (= (and b!498295 res!300413) b!498293))

(assert (= (and b!498293 res!300416) b!498292))

(assert (= (and b!498292 res!300408) b!498290))

(assert (= (and b!498290 res!300410) b!498297))

(assert (= (and b!498297 res!300404) b!498300))

(assert (= (and b!498300 res!300414) b!498302))

(assert (= (and b!498302 res!300412) b!498298))

(assert (= (and b!498302 (not res!300406)) b!498299))

(assert (= (and b!498299 (not res!300411)) b!498289))

(assert (= (and b!498289 c!59219) b!498296))

(assert (= (and b!498289 (not c!59219)) b!498294))

(assert (= (and b!498296 res!300405) b!498301))

(assert (= (and b!498289 (not res!300415)) b!498291))

(declare-fun m!479565 () Bool)

(assert (=> b!498290 m!479565))

(declare-fun m!479567 () Bool)

(assert (=> b!498302 m!479567))

(declare-fun m!479569 () Bool)

(assert (=> b!498302 m!479569))

(declare-fun m!479571 () Bool)

(assert (=> b!498302 m!479571))

(declare-fun m!479573 () Bool)

(assert (=> b!498302 m!479573))

(declare-fun m!479575 () Bool)

(assert (=> b!498302 m!479575))

(assert (=> b!498302 m!479573))

(declare-fun m!479577 () Bool)

(assert (=> b!498302 m!479577))

(declare-fun m!479579 () Bool)

(assert (=> b!498302 m!479579))

(assert (=> b!498302 m!479573))

(declare-fun m!479581 () Bool)

(assert (=> b!498302 m!479581))

(declare-fun m!479583 () Bool)

(assert (=> b!498302 m!479583))

(assert (=> b!498295 m!479573))

(assert (=> b!498295 m!479573))

(declare-fun m!479585 () Bool)

(assert (=> b!498295 m!479585))

(declare-fun m!479587 () Bool)

(assert (=> b!498297 m!479587))

(declare-fun m!479589 () Bool)

(assert (=> b!498292 m!479589))

(declare-fun m!479591 () Bool)

(assert (=> b!498291 m!479591))

(declare-fun m!479593 () Bool)

(assert (=> start!45370 m!479593))

(declare-fun m!479595 () Bool)

(assert (=> start!45370 m!479595))

(declare-fun m!479597 () Bool)

(assert (=> b!498289 m!479597))

(assert (=> b!498289 m!479573))

(declare-fun m!479599 () Bool)

(assert (=> b!498296 m!479599))

(assert (=> b!498296 m!479591))

(declare-fun m!479601 () Bool)

(assert (=> b!498300 m!479601))

(assert (=> b!498298 m!479573))

(assert (=> b!498298 m!479573))

(declare-fun m!479603 () Bool)

(assert (=> b!498298 m!479603))

(declare-fun m!479605 () Bool)

(assert (=> b!498293 m!479605))

(push 1)

