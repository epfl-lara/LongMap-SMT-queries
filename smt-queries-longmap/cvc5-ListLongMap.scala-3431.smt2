; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47706 () Bool)

(assert start!47706)

(declare-fun b!524619 () Bool)

(declare-fun e!305945 () Bool)

(declare-fun e!305948 () Bool)

(assert (=> b!524619 (= e!305945 e!305948)))

(declare-fun res!321507 () Bool)

(assert (=> b!524619 (=> res!321507 e!305948)))

(declare-fun lt!240807 () (_ BitVec 32))

(declare-datatypes ((array!33343 0))(
  ( (array!33344 (arr!16023 (Array (_ BitVec 32) (_ BitVec 64))) (size!16387 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33343)

(declare-datatypes ((SeekEntryResult!4490 0))(
  ( (MissingZero!4490 (index!20172 (_ BitVec 32))) (Found!4490 (index!20173 (_ BitVec 32))) (Intermediate!4490 (undefined!5302 Bool) (index!20174 (_ BitVec 32)) (x!49159 (_ BitVec 32))) (Undefined!4490) (MissingVacant!4490 (index!20175 (_ BitVec 32))) )
))
(declare-fun lt!240814 () SeekEntryResult!4490)

(assert (=> b!524619 (= res!321507 (or (bvsgt #b00000000000000000000000000000000 (x!49159 lt!240814)) (bvsgt (x!49159 lt!240814) #b01111111111111111111111111111110) (bvslt lt!240807 #b00000000000000000000000000000000) (bvsge lt!240807 (size!16387 a!3235)) (bvslt (index!20174 lt!240814) #b00000000000000000000000000000000) (bvsge (index!20174 lt!240814) (size!16387 a!3235)) (not (= lt!240814 (Intermediate!4490 false (index!20174 lt!240814) (x!49159 lt!240814))))))))

(declare-fun lt!240810 () Bool)

(declare-fun lt!240809 () (_ BitVec 64))

(assert (=> b!524619 (and (or lt!240810 (= lt!240809 #b1000000000000000000000000000000000000000000000000000000000000000)) (not lt!240810) (= lt!240809 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!524619 (= lt!240810 (= lt!240809 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!16412 0))(
  ( (Unit!16413) )
))
(declare-fun lt!240816 () Unit!16412)

(declare-fun e!305949 () Unit!16412)

(assert (=> b!524619 (= lt!240816 e!305949)))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun c!61865 () Bool)

(assert (=> b!524619 (= c!61865 (= lt!240809 (select (arr!16023 a!3235) j!176)))))

(assert (=> b!524619 (= lt!240809 (select (arr!16023 a!3235) (index!20174 lt!240814)))))

(assert (=> b!524619 (and (bvslt (x!49159 lt!240814) #b01111111111111111111111111111110) (let ((bdg!15564 (select (arr!16023 a!3235) (index!20174 lt!240814)))) (or (= bdg!15564 (select (arr!16023 a!3235) j!176)) (= bdg!15564 #b0000000000000000000000000000000000000000000000000000000000000000) (= bdg!15564 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!321500 () Bool)

(declare-fun e!305946 () Bool)

(assert (=> start!47706 (=> (not res!321500) (not e!305946))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47706 (= res!321500 (validMask!0 mask!3524))))

(assert (=> start!47706 e!305946))

(assert (=> start!47706 true))

(declare-fun array_inv!11819 (array!33343) Bool)

(assert (=> start!47706 (array_inv!11819 a!3235)))

(declare-fun lt!240811 () (_ BitVec 64))

(declare-fun b!524620 () Bool)

(declare-fun lt!240812 () array!33343)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33343 (_ BitVec 32)) SeekEntryResult!4490)

(assert (=> b!524620 (= e!305948 (not (= lt!240814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240807 lt!240811 lt!240812 mask!3524))))))

(declare-fun b!524621 () Bool)

(declare-fun res!321505 () Bool)

(assert (=> b!524621 (=> (not res!321505) (not e!305946))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!524621 (= res!321505 (validKeyInArray!0 k!2280))))

(declare-fun b!524622 () Bool)

(declare-fun Unit!16414 () Unit!16412)

(assert (=> b!524622 (= e!305949 Unit!16414)))

(declare-fun b!524623 () Bool)

(declare-fun res!321504 () Bool)

(assert (=> b!524623 (=> res!321504 e!305945)))

(assert (=> b!524623 (= res!321504 (or (undefined!5302 lt!240814) (not (is-Intermediate!4490 lt!240814))))))

(declare-fun b!524624 () Bool)

(declare-fun e!305951 () Bool)

(assert (=> b!524624 (= e!305951 (not e!305945))))

(declare-fun res!321509 () Bool)

(assert (=> b!524624 (=> res!321509 e!305945)))

(declare-fun lt!240815 () (_ BitVec 32))

(assert (=> b!524624 (= res!321509 (= lt!240814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240815 lt!240811 lt!240812 mask!3524)))))

(assert (=> b!524624 (= lt!240814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240807 (select (arr!16023 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!524624 (= lt!240815 (toIndex!0 lt!240811 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!524624 (= lt!240811 (select (store (arr!16023 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!524624 (= lt!240807 (toIndex!0 (select (arr!16023 a!3235) j!176) mask!3524))))

(assert (=> b!524624 (= lt!240812 (array!33344 (store (arr!16023 a!3235) i!1204 k!2280) (size!16387 a!3235)))))

(declare-fun e!305952 () Bool)

(assert (=> b!524624 e!305952))

(declare-fun res!321502 () Bool)

(assert (=> b!524624 (=> (not res!321502) (not e!305952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33343 (_ BitVec 32)) Bool)

(assert (=> b!524624 (= res!321502 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!240817 () Unit!16412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33343 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16412)

(assert (=> b!524624 (= lt!240817 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!524625 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33343 (_ BitVec 32)) SeekEntryResult!4490)

(assert (=> b!524625 (= e!305952 (= (seekEntryOrOpen!0 (select (arr!16023 a!3235) j!176) a!3235 mask!3524) (Found!4490 j!176)))))

(declare-fun b!524626 () Bool)

(assert (=> b!524626 (= e!305946 e!305951)))

(declare-fun res!321510 () Bool)

(assert (=> b!524626 (=> (not res!321510) (not e!305951))))

(declare-fun lt!240813 () SeekEntryResult!4490)

(assert (=> b!524626 (= res!321510 (or (= lt!240813 (MissingZero!4490 i!1204)) (= lt!240813 (MissingVacant!4490 i!1204))))))

(assert (=> b!524626 (= lt!240813 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!524627 () Bool)

(declare-fun res!321512 () Bool)

(assert (=> b!524627 (=> (not res!321512) (not e!305946))))

(declare-fun arrayContainsKey!0 (array!33343 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!524627 (= res!321512 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!524628 () Bool)

(declare-fun res!321511 () Bool)

(assert (=> b!524628 (=> (not res!321511) (not e!305946))))

(assert (=> b!524628 (= res!321511 (validKeyInArray!0 (select (arr!16023 a!3235) j!176)))))

(declare-fun b!524629 () Bool)

(declare-fun res!321506 () Bool)

(assert (=> b!524629 (=> (not res!321506) (not e!305946))))

(assert (=> b!524629 (= res!321506 (and (= (size!16387 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16387 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16387 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!524630 () Bool)

(declare-fun Unit!16415 () Unit!16412)

(assert (=> b!524630 (= e!305949 Unit!16415)))

(declare-fun lt!240808 () Unit!16412)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33343 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16412)

(assert (=> b!524630 (= lt!240808 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!240807 #b00000000000000000000000000000000 (index!20174 lt!240814) (x!49159 lt!240814) mask!3524))))

(declare-fun res!321508 () Bool)

(assert (=> b!524630 (= res!321508 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!240807 lt!240811 lt!240812 mask!3524) (Intermediate!4490 false (index!20174 lt!240814) (x!49159 lt!240814))))))

(declare-fun e!305947 () Bool)

(assert (=> b!524630 (=> (not res!321508) (not e!305947))))

(assert (=> b!524630 e!305947))

(declare-fun b!524631 () Bool)

(declare-fun res!321503 () Bool)

(assert (=> b!524631 (=> (not res!321503) (not e!305951))))

(assert (=> b!524631 (= res!321503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!524632 () Bool)

(assert (=> b!524632 (= e!305947 false)))

(declare-fun b!524633 () Bool)

(declare-fun res!321501 () Bool)

(assert (=> b!524633 (=> (not res!321501) (not e!305951))))

(declare-datatypes ((List!10181 0))(
  ( (Nil!10178) (Cons!10177 (h!11108 (_ BitVec 64)) (t!16409 List!10181)) )
))
(declare-fun arrayNoDuplicates!0 (array!33343 (_ BitVec 32) List!10181) Bool)

(assert (=> b!524633 (= res!321501 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10178))))

(assert (= (and start!47706 res!321500) b!524629))

(assert (= (and b!524629 res!321506) b!524628))

(assert (= (and b!524628 res!321511) b!524621))

(assert (= (and b!524621 res!321505) b!524627))

(assert (= (and b!524627 res!321512) b!524626))

(assert (= (and b!524626 res!321510) b!524631))

(assert (= (and b!524631 res!321503) b!524633))

(assert (= (and b!524633 res!321501) b!524624))

(assert (= (and b!524624 res!321502) b!524625))

(assert (= (and b!524624 (not res!321509)) b!524623))

(assert (= (and b!524623 (not res!321504)) b!524619))

(assert (= (and b!524619 c!61865) b!524630))

(assert (= (and b!524619 (not c!61865)) b!524622))

(assert (= (and b!524630 res!321508) b!524632))

(assert (= (and b!524619 (not res!321507)) b!524620))

(declare-fun m!505251 () Bool)

(assert (=> b!524621 m!505251))

(declare-fun m!505253 () Bool)

(assert (=> b!524627 m!505253))

(declare-fun m!505255 () Bool)

(assert (=> b!524625 m!505255))

(assert (=> b!524625 m!505255))

(declare-fun m!505257 () Bool)

(assert (=> b!524625 m!505257))

(declare-fun m!505259 () Bool)

(assert (=> b!524633 m!505259))

(declare-fun m!505261 () Bool)

(assert (=> b!524631 m!505261))

(declare-fun m!505263 () Bool)

(assert (=> b!524624 m!505263))

(declare-fun m!505265 () Bool)

(assert (=> b!524624 m!505265))

(declare-fun m!505267 () Bool)

(assert (=> b!524624 m!505267))

(declare-fun m!505269 () Bool)

(assert (=> b!524624 m!505269))

(assert (=> b!524624 m!505255))

(declare-fun m!505271 () Bool)

(assert (=> b!524624 m!505271))

(assert (=> b!524624 m!505255))

(declare-fun m!505273 () Bool)

(assert (=> b!524624 m!505273))

(declare-fun m!505275 () Bool)

(assert (=> b!524624 m!505275))

(assert (=> b!524624 m!505255))

(declare-fun m!505277 () Bool)

(assert (=> b!524624 m!505277))

(declare-fun m!505279 () Bool)

(assert (=> b!524620 m!505279))

(declare-fun m!505281 () Bool)

(assert (=> b!524626 m!505281))

(assert (=> b!524619 m!505255))

(declare-fun m!505283 () Bool)

(assert (=> b!524619 m!505283))

(declare-fun m!505285 () Bool)

(assert (=> b!524630 m!505285))

(assert (=> b!524630 m!505279))

(declare-fun m!505287 () Bool)

(assert (=> start!47706 m!505287))

(declare-fun m!505289 () Bool)

(assert (=> start!47706 m!505289))

(assert (=> b!524628 m!505255))

(assert (=> b!524628 m!505255))

(declare-fun m!505291 () Bool)

(assert (=> b!524628 m!505291))

(push 1)

