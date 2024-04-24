; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47888 () Bool)

(assert start!47888)

(declare-fun b!527412 () Bool)

(declare-fun e!307383 () Bool)

(declare-fun e!307388 () Bool)

(assert (=> b!527412 (= e!307383 (not e!307388))))

(declare-fun res!323793 () Bool)

(assert (=> b!527412 (=> res!323793 e!307388)))

(declare-fun lt!242782 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4501 0))(
  ( (MissingZero!4501 (index!20222 (_ BitVec 32))) (Found!4501 (index!20223 (_ BitVec 32))) (Intermediate!4501 (undefined!5313 Bool) (index!20224 (_ BitVec 32)) (x!49339 (_ BitVec 32))) (Undefined!4501) (MissingVacant!4501 (index!20225 (_ BitVec 32))) )
))
(declare-fun lt!242787 () SeekEntryResult!4501)

(declare-datatypes ((array!33457 0))(
  ( (array!33458 (arr!16078 (Array (_ BitVec 32) (_ BitVec 64))) (size!16442 (_ BitVec 32))) )
))
(declare-fun lt!242788 () array!33457)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!242783 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33457 (_ BitVec 32)) SeekEntryResult!4501)

(assert (=> b!527412 (= res!323793 (= lt!242787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242782 lt!242783 lt!242788 mask!3524)))))

(declare-fun a!3235 () array!33457)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!242785 () (_ BitVec 32))

(assert (=> b!527412 (= lt!242787 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242785 (select (arr!16078 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!527412 (= lt!242782 (toIndex!0 lt!242783 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!527412 (= lt!242783 (select (store (arr!16078 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!527412 (= lt!242785 (toIndex!0 (select (arr!16078 a!3235) j!176) mask!3524))))

(assert (=> b!527412 (= lt!242788 (array!33458 (store (arr!16078 a!3235) i!1204 k0!2280) (size!16442 a!3235)))))

(declare-fun e!307385 () Bool)

(assert (=> b!527412 e!307385))

(declare-fun res!323788 () Bool)

(assert (=> b!527412 (=> (not res!323788) (not e!307385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33457 (_ BitVec 32)) Bool)

(assert (=> b!527412 (= res!323788 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16615 0))(
  ( (Unit!16616) )
))
(declare-fun lt!242780 () Unit!16615)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33457 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16615)

(assert (=> b!527412 (= lt!242780 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!323787 () Bool)

(declare-fun e!307389 () Bool)

(assert (=> start!47888 (=> (not res!323787) (not e!307389))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47888 (= res!323787 (validMask!0 mask!3524))))

(assert (=> start!47888 e!307389))

(assert (=> start!47888 true))

(declare-fun array_inv!11937 (array!33457) Bool)

(assert (=> start!47888 (array_inv!11937 a!3235)))

(declare-fun b!527413 () Bool)

(declare-fun res!323792 () Bool)

(assert (=> b!527413 (=> (not res!323792) (not e!307389))))

(declare-fun arrayContainsKey!0 (array!33457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!527413 (= res!323792 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!527414 () Bool)

(declare-fun res!323790 () Bool)

(assert (=> b!527414 (=> (not res!323790) (not e!307389))))

(assert (=> b!527414 (= res!323790 (and (= (size!16442 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16442 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16442 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!527415 () Bool)

(declare-fun res!323791 () Bool)

(assert (=> b!527415 (=> (not res!323791) (not e!307383))))

(assert (=> b!527415 (= res!323791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!527416 () Bool)

(declare-fun res!323789 () Bool)

(assert (=> b!527416 (=> (not res!323789) (not e!307383))))

(declare-datatypes ((List!10143 0))(
  ( (Nil!10140) (Cons!10139 (h!11073 (_ BitVec 64)) (t!16363 List!10143)) )
))
(declare-fun arrayNoDuplicates!0 (array!33457 (_ BitVec 32) List!10143) Bool)

(assert (=> b!527416 (= res!323789 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10140))))

(declare-fun b!527417 () Bool)

(declare-fun e!307387 () Bool)

(assert (=> b!527417 (= e!307387 false)))

(declare-fun b!527418 () Bool)

(assert (=> b!527418 (= e!307388 (or (bvsgt (x!49339 lt!242787) #b01111111111111111111111111111110) (bvslt lt!242785 #b00000000000000000000000000000000) (bvsge lt!242785 (size!16442 a!3235)) (bvslt (index!20224 lt!242787) #b00000000000000000000000000000000) (bvsge (index!20224 lt!242787) (size!16442 a!3235)) (= lt!242787 (Intermediate!4501 false (index!20224 lt!242787) (x!49339 lt!242787)))))))

(assert (=> b!527418 (= (index!20224 lt!242787) i!1204)))

(declare-fun lt!242779 () Unit!16615)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16615)

(assert (=> b!527418 (= lt!242779 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!242785 #b00000000000000000000000000000000 (index!20224 lt!242787) (x!49339 lt!242787) mask!3524))))

(assert (=> b!527418 (and (or (= (select (arr!16078 a!3235) (index!20224 lt!242787)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16078 a!3235) (index!20224 lt!242787)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16078 a!3235) (index!20224 lt!242787)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16078 a!3235) (index!20224 lt!242787)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!242784 () Unit!16615)

(declare-fun e!307386 () Unit!16615)

(assert (=> b!527418 (= lt!242784 e!307386)))

(declare-fun c!62120 () Bool)

(assert (=> b!527418 (= c!62120 (= (select (arr!16078 a!3235) (index!20224 lt!242787)) (select (arr!16078 a!3235) j!176)))))

(assert (=> b!527418 (and (bvslt (x!49339 lt!242787) #b01111111111111111111111111111110) (or (= (select (arr!16078 a!3235) (index!20224 lt!242787)) (select (arr!16078 a!3235) j!176)) (= (select (arr!16078 a!3235) (index!20224 lt!242787)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16078 a!3235) (index!20224 lt!242787)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!527419 () Bool)

(assert (=> b!527419 (= e!307389 e!307383)))

(declare-fun res!323795 () Bool)

(assert (=> b!527419 (=> (not res!323795) (not e!307383))))

(declare-fun lt!242781 () SeekEntryResult!4501)

(assert (=> b!527419 (= res!323795 (or (= lt!242781 (MissingZero!4501 i!1204)) (= lt!242781 (MissingVacant!4501 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33457 (_ BitVec 32)) SeekEntryResult!4501)

(assert (=> b!527419 (= lt!242781 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!527420 () Bool)

(declare-fun res!323786 () Bool)

(assert (=> b!527420 (=> (not res!323786) (not e!307389))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!527420 (= res!323786 (validKeyInArray!0 (select (arr!16078 a!3235) j!176)))))

(declare-fun b!527421 () Bool)

(assert (=> b!527421 (= e!307385 (= (seekEntryOrOpen!0 (select (arr!16078 a!3235) j!176) a!3235 mask!3524) (Found!4501 j!176)))))

(declare-fun b!527422 () Bool)

(declare-fun res!323797 () Bool)

(assert (=> b!527422 (=> res!323797 e!307388)))

(get-info :version)

(assert (=> b!527422 (= res!323797 (or (undefined!5313 lt!242787) (not ((_ is Intermediate!4501) lt!242787))))))

(declare-fun b!527423 () Bool)

(declare-fun res!323794 () Bool)

(assert (=> b!527423 (=> (not res!323794) (not e!307389))))

(assert (=> b!527423 (= res!323794 (validKeyInArray!0 k0!2280))))

(declare-fun b!527424 () Bool)

(declare-fun Unit!16617 () Unit!16615)

(assert (=> b!527424 (= e!307386 Unit!16617)))

(declare-fun b!527425 () Bool)

(declare-fun Unit!16618 () Unit!16615)

(assert (=> b!527425 (= e!307386 Unit!16618)))

(declare-fun lt!242786 () Unit!16615)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33457 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16615)

(assert (=> b!527425 (= lt!242786 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!242785 #b00000000000000000000000000000000 (index!20224 lt!242787) (x!49339 lt!242787) mask!3524))))

(declare-fun res!323796 () Bool)

(assert (=> b!527425 (= res!323796 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!242785 lt!242783 lt!242788 mask!3524) (Intermediate!4501 false (index!20224 lt!242787) (x!49339 lt!242787))))))

(assert (=> b!527425 (=> (not res!323796) (not e!307387))))

(assert (=> b!527425 e!307387))

(assert (= (and start!47888 res!323787) b!527414))

(assert (= (and b!527414 res!323790) b!527420))

(assert (= (and b!527420 res!323786) b!527423))

(assert (= (and b!527423 res!323794) b!527413))

(assert (= (and b!527413 res!323792) b!527419))

(assert (= (and b!527419 res!323795) b!527415))

(assert (= (and b!527415 res!323791) b!527416))

(assert (= (and b!527416 res!323789) b!527412))

(assert (= (and b!527412 res!323788) b!527421))

(assert (= (and b!527412 (not res!323793)) b!527422))

(assert (= (and b!527422 (not res!323797)) b!527418))

(assert (= (and b!527418 c!62120) b!527425))

(assert (= (and b!527418 (not c!62120)) b!527424))

(assert (= (and b!527425 res!323796) b!527417))

(declare-fun m!508309 () Bool)

(assert (=> start!47888 m!508309))

(declare-fun m!508311 () Bool)

(assert (=> start!47888 m!508311))

(declare-fun m!508313 () Bool)

(assert (=> b!527425 m!508313))

(declare-fun m!508315 () Bool)

(assert (=> b!527425 m!508315))

(declare-fun m!508317 () Bool)

(assert (=> b!527412 m!508317))

(declare-fun m!508319 () Bool)

(assert (=> b!527412 m!508319))

(declare-fun m!508321 () Bool)

(assert (=> b!527412 m!508321))

(declare-fun m!508323 () Bool)

(assert (=> b!527412 m!508323))

(assert (=> b!527412 m!508321))

(declare-fun m!508325 () Bool)

(assert (=> b!527412 m!508325))

(assert (=> b!527412 m!508321))

(declare-fun m!508327 () Bool)

(assert (=> b!527412 m!508327))

(declare-fun m!508329 () Bool)

(assert (=> b!527412 m!508329))

(declare-fun m!508331 () Bool)

(assert (=> b!527412 m!508331))

(declare-fun m!508333 () Bool)

(assert (=> b!527412 m!508333))

(declare-fun m!508335 () Bool)

(assert (=> b!527418 m!508335))

(declare-fun m!508337 () Bool)

(assert (=> b!527418 m!508337))

(assert (=> b!527418 m!508321))

(declare-fun m!508339 () Bool)

(assert (=> b!527416 m!508339))

(assert (=> b!527421 m!508321))

(assert (=> b!527421 m!508321))

(declare-fun m!508341 () Bool)

(assert (=> b!527421 m!508341))

(assert (=> b!527420 m!508321))

(assert (=> b!527420 m!508321))

(declare-fun m!508343 () Bool)

(assert (=> b!527420 m!508343))

(declare-fun m!508345 () Bool)

(assert (=> b!527419 m!508345))

(declare-fun m!508347 () Bool)

(assert (=> b!527415 m!508347))

(declare-fun m!508349 () Bool)

(assert (=> b!527423 m!508349))

(declare-fun m!508351 () Bool)

(assert (=> b!527413 m!508351))

(check-sat (not b!527416) (not b!527425) (not b!527420) (not b!527421) (not b!527412) (not b!527415) (not b!527419) (not b!527423) (not b!527413) (not start!47888) (not b!527418))
(check-sat)
