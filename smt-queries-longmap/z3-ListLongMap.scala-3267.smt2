; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45476 () Bool)

(assert start!45476)

(declare-fun b!500673 () Bool)

(declare-fun res!302477 () Bool)

(declare-fun e!293331 () Bool)

(assert (=> b!500673 (=> (not res!302477) (not e!293331))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!500673 (= res!302477 (validKeyInArray!0 k0!2280))))

(declare-fun b!500674 () Bool)

(declare-fun res!302480 () Bool)

(assert (=> b!500674 (=> (not res!302480) (not e!293331))))

(declare-datatypes ((array!32301 0))(
  ( (array!32302 (arr!15532 (Array (_ BitVec 32) (_ BitVec 64))) (size!15896 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32301)

(declare-fun arrayContainsKey!0 (array!32301 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!500674 (= res!302480 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!302476 () Bool)

(assert (=> start!45476 (=> (not res!302476) (not e!293331))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45476 (= res!302476 (validMask!0 mask!3524))))

(assert (=> start!45476 e!293331))

(assert (=> start!45476 true))

(declare-fun array_inv!11328 (array!32301) Bool)

(assert (=> start!45476 (array_inv!11328 a!3235)))

(declare-fun e!293332 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!500675 () Bool)

(declare-datatypes ((SeekEntryResult!3999 0))(
  ( (MissingZero!3999 (index!18178 (_ BitVec 32))) (Found!3999 (index!18179 (_ BitVec 32))) (Intermediate!3999 (undefined!4811 Bool) (index!18180 (_ BitVec 32)) (x!47212 (_ BitVec 32))) (Undefined!3999) (MissingVacant!3999 (index!18181 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32301 (_ BitVec 32)) SeekEntryResult!3999)

(assert (=> b!500675 (= e!293332 (= (seekEntryOrOpen!0 (select (arr!15532 a!3235) j!176) a!3235 mask!3524) (Found!3999 j!176)))))

(declare-fun b!500676 () Bool)

(declare-fun res!302472 () Bool)

(assert (=> b!500676 (=> (not res!302472) (not e!293331))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!500676 (= res!302472 (and (= (size!15896 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15896 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15896 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!500677 () Bool)

(declare-fun e!293334 () Bool)

(declare-fun e!293329 () Bool)

(assert (=> b!500677 (= e!293334 e!293329)))

(declare-fun res!302478 () Bool)

(assert (=> b!500677 (=> res!302478 e!293329)))

(declare-fun lt!227276 () SeekEntryResult!3999)

(declare-fun lt!227277 () (_ BitVec 32))

(assert (=> b!500677 (= res!302478 (or (bvsgt #b00000000000000000000000000000000 (x!47212 lt!227276)) (bvsgt (x!47212 lt!227276) #b01111111111111111111111111111110) (bvslt lt!227277 #b00000000000000000000000000000000) (bvsge lt!227277 (size!15896 a!3235)) (bvslt (index!18180 lt!227276) #b00000000000000000000000000000000) (bvsge (index!18180 lt!227276) (size!15896 a!3235)) (not (= lt!227276 (Intermediate!3999 false (index!18180 lt!227276) (x!47212 lt!227276))))))))

(assert (=> b!500677 (and (or (= (select (arr!15532 a!3235) (index!18180 lt!227276)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15532 a!3235) (index!18180 lt!227276)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15532 a!3235) (index!18180 lt!227276)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15532 a!3235) (index!18180 lt!227276)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!15072 0))(
  ( (Unit!15073) )
))
(declare-fun lt!227269 () Unit!15072)

(declare-fun e!293333 () Unit!15072)

(assert (=> b!500677 (= lt!227269 e!293333)))

(declare-fun c!59378 () Bool)

(assert (=> b!500677 (= c!59378 (= (select (arr!15532 a!3235) (index!18180 lt!227276)) (select (arr!15532 a!3235) j!176)))))

(assert (=> b!500677 (and (bvslt (x!47212 lt!227276) #b01111111111111111111111111111110) (or (= (select (arr!15532 a!3235) (index!18180 lt!227276)) (select (arr!15532 a!3235) j!176)) (= (select (arr!15532 a!3235) (index!18180 lt!227276)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15532 a!3235) (index!18180 lt!227276)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!500678 () Bool)

(declare-fun e!293328 () Bool)

(assert (=> b!500678 (= e!293328 (not e!293334))))

(declare-fun res!302481 () Bool)

(assert (=> b!500678 (=> res!302481 e!293334)))

(declare-fun lt!227270 () (_ BitVec 32))

(declare-fun lt!227272 () array!32301)

(declare-fun lt!227274 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32301 (_ BitVec 32)) SeekEntryResult!3999)

(assert (=> b!500678 (= res!302481 (= lt!227276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227270 lt!227274 lt!227272 mask!3524)))))

(assert (=> b!500678 (= lt!227276 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227277 (select (arr!15532 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!500678 (= lt!227270 (toIndex!0 lt!227274 mask!3524))))

(assert (=> b!500678 (= lt!227274 (select (store (arr!15532 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!500678 (= lt!227277 (toIndex!0 (select (arr!15532 a!3235) j!176) mask!3524))))

(assert (=> b!500678 (= lt!227272 (array!32302 (store (arr!15532 a!3235) i!1204 k0!2280) (size!15896 a!3235)))))

(assert (=> b!500678 e!293332))

(declare-fun res!302473 () Bool)

(assert (=> b!500678 (=> (not res!302473) (not e!293332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32301 (_ BitVec 32)) Bool)

(assert (=> b!500678 (= res!302473 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!227271 () Unit!15072)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32301 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15072)

(assert (=> b!500678 (= lt!227271 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!500679 () Bool)

(declare-fun res!302471 () Bool)

(assert (=> b!500679 (=> (not res!302471) (not e!293328))))

(declare-datatypes ((List!9690 0))(
  ( (Nil!9687) (Cons!9686 (h!10560 (_ BitVec 64)) (t!15918 List!9690)) )
))
(declare-fun arrayNoDuplicates!0 (array!32301 (_ BitVec 32) List!9690) Bool)

(assert (=> b!500679 (= res!302471 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9687))))

(declare-fun b!500680 () Bool)

(declare-fun res!302479 () Bool)

(assert (=> b!500680 (=> res!302479 e!293334)))

(get-info :version)

(assert (=> b!500680 (= res!302479 (or (undefined!4811 lt!227276) (not ((_ is Intermediate!3999) lt!227276))))))

(declare-fun b!500681 () Bool)

(declare-fun res!302474 () Bool)

(assert (=> b!500681 (=> (not res!302474) (not e!293328))))

(assert (=> b!500681 (= res!302474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!500682 () Bool)

(assert (=> b!500682 (= e!293331 e!293328)))

(declare-fun res!302483 () Bool)

(assert (=> b!500682 (=> (not res!302483) (not e!293328))))

(declare-fun lt!227275 () SeekEntryResult!3999)

(assert (=> b!500682 (= res!302483 (or (= lt!227275 (MissingZero!3999 i!1204)) (= lt!227275 (MissingVacant!3999 i!1204))))))

(assert (=> b!500682 (= lt!227275 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!500683 () Bool)

(declare-fun Unit!15074 () Unit!15072)

(assert (=> b!500683 (= e!293333 Unit!15074)))

(declare-fun lt!227273 () Unit!15072)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32301 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15072)

(assert (=> b!500683 (= lt!227273 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!227277 #b00000000000000000000000000000000 (index!18180 lt!227276) (x!47212 lt!227276) mask!3524))))

(declare-fun res!302475 () Bool)

(assert (=> b!500683 (= res!302475 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227277 lt!227274 lt!227272 mask!3524) (Intermediate!3999 false (index!18180 lt!227276) (x!47212 lt!227276))))))

(declare-fun e!293330 () Bool)

(assert (=> b!500683 (=> (not res!302475) (not e!293330))))

(assert (=> b!500683 e!293330))

(declare-fun b!500684 () Bool)

(declare-fun res!302482 () Bool)

(assert (=> b!500684 (=> (not res!302482) (not e!293331))))

(assert (=> b!500684 (= res!302482 (validKeyInArray!0 (select (arr!15532 a!3235) j!176)))))

(declare-fun b!500685 () Bool)

(declare-fun Unit!15075 () Unit!15072)

(assert (=> b!500685 (= e!293333 Unit!15075)))

(declare-fun b!500686 () Bool)

(assert (=> b!500686 (= e!293329 true)))

(declare-fun lt!227278 () SeekEntryResult!3999)

(assert (=> b!500686 (= lt!227278 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!227277 lt!227274 lt!227272 mask!3524))))

(declare-fun b!500687 () Bool)

(assert (=> b!500687 (= e!293330 false)))

(assert (= (and start!45476 res!302476) b!500676))

(assert (= (and b!500676 res!302472) b!500684))

(assert (= (and b!500684 res!302482) b!500673))

(assert (= (and b!500673 res!302477) b!500674))

(assert (= (and b!500674 res!302480) b!500682))

(assert (= (and b!500682 res!302483) b!500681))

(assert (= (and b!500681 res!302474) b!500679))

(assert (= (and b!500679 res!302471) b!500678))

(assert (= (and b!500678 res!302473) b!500675))

(assert (= (and b!500678 (not res!302481)) b!500680))

(assert (= (and b!500680 (not res!302479)) b!500677))

(assert (= (and b!500677 c!59378) b!500683))

(assert (= (and b!500677 (not c!59378)) b!500685))

(assert (= (and b!500683 res!302475) b!500687))

(assert (= (and b!500677 (not res!302478)) b!500686))

(declare-fun m!481791 () Bool)

(assert (=> start!45476 m!481791))

(declare-fun m!481793 () Bool)

(assert (=> start!45476 m!481793))

(declare-fun m!481795 () Bool)

(assert (=> b!500686 m!481795))

(declare-fun m!481797 () Bool)

(assert (=> b!500673 m!481797))

(declare-fun m!481799 () Bool)

(assert (=> b!500683 m!481799))

(assert (=> b!500683 m!481795))

(declare-fun m!481801 () Bool)

(assert (=> b!500684 m!481801))

(assert (=> b!500684 m!481801))

(declare-fun m!481803 () Bool)

(assert (=> b!500684 m!481803))

(declare-fun m!481805 () Bool)

(assert (=> b!500682 m!481805))

(declare-fun m!481807 () Bool)

(assert (=> b!500681 m!481807))

(declare-fun m!481809 () Bool)

(assert (=> b!500679 m!481809))

(declare-fun m!481811 () Bool)

(assert (=> b!500678 m!481811))

(declare-fun m!481813 () Bool)

(assert (=> b!500678 m!481813))

(declare-fun m!481815 () Bool)

(assert (=> b!500678 m!481815))

(declare-fun m!481817 () Bool)

(assert (=> b!500678 m!481817))

(assert (=> b!500678 m!481801))

(declare-fun m!481819 () Bool)

(assert (=> b!500678 m!481819))

(declare-fun m!481821 () Bool)

(assert (=> b!500678 m!481821))

(assert (=> b!500678 m!481801))

(declare-fun m!481823 () Bool)

(assert (=> b!500678 m!481823))

(assert (=> b!500678 m!481801))

(declare-fun m!481825 () Bool)

(assert (=> b!500678 m!481825))

(assert (=> b!500675 m!481801))

(assert (=> b!500675 m!481801))

(declare-fun m!481827 () Bool)

(assert (=> b!500675 m!481827))

(declare-fun m!481829 () Bool)

(assert (=> b!500677 m!481829))

(assert (=> b!500677 m!481801))

(declare-fun m!481831 () Bool)

(assert (=> b!500674 m!481831))

(check-sat (not b!500683) (not b!500681) (not start!45476) (not b!500679) (not b!500675) (not b!500682) (not b!500674) (not b!500686) (not b!500684) (not b!500678) (not b!500673))
(check-sat)
