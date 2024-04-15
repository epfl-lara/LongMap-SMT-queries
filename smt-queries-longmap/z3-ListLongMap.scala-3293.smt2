; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45690 () Bool)

(assert start!45690)

(declare-fun lt!229694 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4072 0))(
  ( (MissingZero!4072 (index!18476 (_ BitVec 32))) (Found!4072 (index!18477 (_ BitVec 32))) (Intermediate!4072 (undefined!4884 Bool) (index!18478 (_ BitVec 32)) (x!47500 (_ BitVec 32))) (Undefined!4072) (MissingVacant!4072 (index!18479 (_ BitVec 32))) )
))
(declare-fun lt!229690 () SeekEntryResult!4072)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!504558 () Bool)

(declare-datatypes ((array!32456 0))(
  ( (array!32457 (arr!15608 (Array (_ BitVec 32) (_ BitVec 64))) (size!15973 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32456)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!295388 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32456 (_ BitVec 32)) SeekEntryResult!4072)

(assert (=> b!504558 (= e!295388 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229694 (index!18478 lt!229690) (select (arr!15608 a!3235) j!176) a!3235 mask!3524) (Found!4072 j!176))))))

(declare-fun b!504559 () Bool)

(declare-fun e!295392 () Bool)

(declare-fun e!295384 () Bool)

(assert (=> b!504559 (= e!295392 e!295384)))

(declare-fun res!305840 () Bool)

(assert (=> b!504559 (=> res!305840 e!295384)))

(assert (=> b!504559 (= res!305840 (or (bvsgt (x!47500 lt!229690) #b01111111111111111111111111111110) (bvslt lt!229694 #b00000000000000000000000000000000) (bvsge lt!229694 (size!15973 a!3235)) (bvslt (index!18478 lt!229690) #b00000000000000000000000000000000) (bvsge (index!18478 lt!229690) (size!15973 a!3235)) (not (= lt!229690 (Intermediate!4072 false (index!18478 lt!229690) (x!47500 lt!229690))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!504559 (= (index!18478 lt!229690) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-datatypes ((Unit!15358 0))(
  ( (Unit!15359) )
))
(declare-fun lt!229695 () Unit!15358)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32456 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15358)

(assert (=> b!504559 (= lt!229695 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229694 #b00000000000000000000000000000000 (index!18478 lt!229690) (x!47500 lt!229690) mask!3524))))

(assert (=> b!504559 (and (or (= (select (arr!15608 a!3235) (index!18478 lt!229690)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15608 a!3235) (index!18478 lt!229690)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15608 a!3235) (index!18478 lt!229690)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15608 a!3235) (index!18478 lt!229690)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229692 () Unit!15358)

(declare-fun e!295389 () Unit!15358)

(assert (=> b!504559 (= lt!229692 e!295389)))

(declare-fun c!59640 () Bool)

(assert (=> b!504559 (= c!59640 (= (select (arr!15608 a!3235) (index!18478 lt!229690)) (select (arr!15608 a!3235) j!176)))))

(assert (=> b!504559 (and (bvslt (x!47500 lt!229690) #b01111111111111111111111111111110) (or (= (select (arr!15608 a!3235) (index!18478 lt!229690)) (select (arr!15608 a!3235) j!176)) (= (select (arr!15608 a!3235) (index!18478 lt!229690)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15608 a!3235) (index!18478 lt!229690)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!504560 () Bool)

(declare-fun e!295387 () Bool)

(declare-fun e!295391 () Bool)

(assert (=> b!504560 (= e!295387 e!295391)))

(declare-fun res!305845 () Bool)

(assert (=> b!504560 (=> (not res!305845) (not e!295391))))

(declare-fun lt!229689 () SeekEntryResult!4072)

(assert (=> b!504560 (= res!305845 (or (= lt!229689 (MissingZero!4072 i!1204)) (= lt!229689 (MissingVacant!4072 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32456 (_ BitVec 32)) SeekEntryResult!4072)

(assert (=> b!504560 (= lt!229689 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!504561 () Bool)

(declare-fun res!305847 () Bool)

(assert (=> b!504561 (=> (not res!305847) (not e!295387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!504561 (= res!305847 (validKeyInArray!0 k0!2280))))

(declare-fun b!504562 () Bool)

(declare-fun e!295386 () Bool)

(assert (=> b!504562 (= e!295386 (= (seekEntryOrOpen!0 (select (arr!15608 a!3235) j!176) a!3235 mask!3524) (Found!4072 j!176)))))

(declare-fun res!305838 () Bool)

(assert (=> start!45690 (=> (not res!305838) (not e!295387))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45690 (= res!305838 (validMask!0 mask!3524))))

(assert (=> start!45690 e!295387))

(assert (=> start!45690 true))

(declare-fun array_inv!11491 (array!32456) Bool)

(assert (=> start!45690 (array_inv!11491 a!3235)))

(declare-fun b!504563 () Bool)

(declare-fun res!305836 () Bool)

(assert (=> b!504563 (=> (not res!305836) (not e!295387))))

(declare-fun arrayContainsKey!0 (array!32456 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!504563 (= res!305836 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!504564 () Bool)

(declare-fun Unit!15360 () Unit!15358)

(assert (=> b!504564 (= e!295389 Unit!15360)))

(declare-fun lt!229696 () Unit!15358)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32456 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15358)

(assert (=> b!504564 (= lt!229696 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229694 #b00000000000000000000000000000000 (index!18478 lt!229690) (x!47500 lt!229690) mask!3524))))

(declare-fun res!305841 () Bool)

(declare-fun lt!229698 () (_ BitVec 64))

(declare-fun lt!229697 () array!32456)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32456 (_ BitVec 32)) SeekEntryResult!4072)

(assert (=> b!504564 (= res!305841 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229694 lt!229698 lt!229697 mask!3524) (Intermediate!4072 false (index!18478 lt!229690) (x!47500 lt!229690))))))

(declare-fun e!295385 () Bool)

(assert (=> b!504564 (=> (not res!305841) (not e!295385))))

(assert (=> b!504564 e!295385))

(declare-fun b!504565 () Bool)

(declare-fun res!305837 () Bool)

(assert (=> b!504565 (=> (not res!305837) (not e!295387))))

(assert (=> b!504565 (= res!305837 (and (= (size!15973 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15973 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15973 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!504566 () Bool)

(declare-fun res!305842 () Bool)

(assert (=> b!504566 (=> res!305842 e!295384)))

(assert (=> b!504566 (= res!305842 e!295388)))

(declare-fun res!305835 () Bool)

(assert (=> b!504566 (=> (not res!305835) (not e!295388))))

(assert (=> b!504566 (= res!305835 (bvsgt #b00000000000000000000000000000000 (x!47500 lt!229690)))))

(declare-fun b!504567 () Bool)

(declare-fun res!305849 () Bool)

(assert (=> b!504567 (=> (not res!305849) (not e!295391))))

(declare-datatypes ((List!9805 0))(
  ( (Nil!9802) (Cons!9801 (h!10678 (_ BitVec 64)) (t!16024 List!9805)) )
))
(declare-fun arrayNoDuplicates!0 (array!32456 (_ BitVec 32) List!9805) Bool)

(assert (=> b!504567 (= res!305849 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9802))))

(declare-fun b!504568 () Bool)

(declare-fun res!305846 () Bool)

(assert (=> b!504568 (=> res!305846 e!295392)))

(get-info :version)

(assert (=> b!504568 (= res!305846 (or (undefined!4884 lt!229690) (not ((_ is Intermediate!4072) lt!229690))))))

(declare-fun b!504569 () Bool)

(declare-fun Unit!15361 () Unit!15358)

(assert (=> b!504569 (= e!295389 Unit!15361)))

(declare-fun b!504570 () Bool)

(declare-fun res!305843 () Bool)

(assert (=> b!504570 (=> (not res!305843) (not e!295387))))

(assert (=> b!504570 (= res!305843 (validKeyInArray!0 (select (arr!15608 a!3235) j!176)))))

(declare-fun b!504571 () Bool)

(assert (=> b!504571 (= e!295385 false)))

(declare-fun b!504572 () Bool)

(assert (=> b!504572 (= e!295391 (not e!295392))))

(declare-fun res!305848 () Bool)

(assert (=> b!504572 (=> res!305848 e!295392)))

(declare-fun lt!229699 () (_ BitVec 32))

(assert (=> b!504572 (= res!305848 (= lt!229690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229699 lt!229698 lt!229697 mask!3524)))))

(assert (=> b!504572 (= lt!229690 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229694 (select (arr!15608 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!504572 (= lt!229699 (toIndex!0 lt!229698 mask!3524))))

(assert (=> b!504572 (= lt!229698 (select (store (arr!15608 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!504572 (= lt!229694 (toIndex!0 (select (arr!15608 a!3235) j!176) mask!3524))))

(assert (=> b!504572 (= lt!229697 (array!32457 (store (arr!15608 a!3235) i!1204 k0!2280) (size!15973 a!3235)))))

(assert (=> b!504572 e!295386))

(declare-fun res!305839 () Bool)

(assert (=> b!504572 (=> (not res!305839) (not e!295386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32456 (_ BitVec 32)) Bool)

(assert (=> b!504572 (= res!305839 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229691 () Unit!15358)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32456 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15358)

(assert (=> b!504572 (= lt!229691 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!504573 () Bool)

(declare-fun res!305844 () Bool)

(assert (=> b!504573 (=> (not res!305844) (not e!295391))))

(assert (=> b!504573 (= res!305844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!504574 () Bool)

(assert (=> b!504574 (= e!295384 true)))

(declare-fun lt!229693 () SeekEntryResult!4072)

(assert (=> b!504574 (= lt!229693 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229694 lt!229698 lt!229697 mask!3524))))

(assert (= (and start!45690 res!305838) b!504565))

(assert (= (and b!504565 res!305837) b!504570))

(assert (= (and b!504570 res!305843) b!504561))

(assert (= (and b!504561 res!305847) b!504563))

(assert (= (and b!504563 res!305836) b!504560))

(assert (= (and b!504560 res!305845) b!504573))

(assert (= (and b!504573 res!305844) b!504567))

(assert (= (and b!504567 res!305849) b!504572))

(assert (= (and b!504572 res!305839) b!504562))

(assert (= (and b!504572 (not res!305848)) b!504568))

(assert (= (and b!504568 (not res!305846)) b!504559))

(assert (= (and b!504559 c!59640) b!504564))

(assert (= (and b!504559 (not c!59640)) b!504569))

(assert (= (and b!504564 res!305841) b!504571))

(assert (= (and b!504559 (not res!305840)) b!504566))

(assert (= (and b!504566 res!305835) b!504558))

(assert (= (and b!504566 (not res!305842)) b!504574))

(declare-fun m!484777 () Bool)

(assert (=> b!504561 m!484777))

(declare-fun m!484779 () Bool)

(assert (=> start!45690 m!484779))

(declare-fun m!484781 () Bool)

(assert (=> start!45690 m!484781))

(declare-fun m!484783 () Bool)

(assert (=> b!504570 m!484783))

(assert (=> b!504570 m!484783))

(declare-fun m!484785 () Bool)

(assert (=> b!504570 m!484785))

(declare-fun m!484787 () Bool)

(assert (=> b!504563 m!484787))

(declare-fun m!484789 () Bool)

(assert (=> b!504559 m!484789))

(declare-fun m!484791 () Bool)

(assert (=> b!504559 m!484791))

(assert (=> b!504559 m!484783))

(declare-fun m!484793 () Bool)

(assert (=> b!504574 m!484793))

(declare-fun m!484795 () Bool)

(assert (=> b!504572 m!484795))

(declare-fun m!484797 () Bool)

(assert (=> b!504572 m!484797))

(declare-fun m!484799 () Bool)

(assert (=> b!504572 m!484799))

(declare-fun m!484801 () Bool)

(assert (=> b!504572 m!484801))

(assert (=> b!504572 m!484783))

(declare-fun m!484803 () Bool)

(assert (=> b!504572 m!484803))

(assert (=> b!504572 m!484783))

(declare-fun m!484805 () Bool)

(assert (=> b!504572 m!484805))

(declare-fun m!484807 () Bool)

(assert (=> b!504572 m!484807))

(declare-fun m!484809 () Bool)

(assert (=> b!504572 m!484809))

(assert (=> b!504572 m!484783))

(declare-fun m!484811 () Bool)

(assert (=> b!504567 m!484811))

(declare-fun m!484813 () Bool)

(assert (=> b!504564 m!484813))

(assert (=> b!504564 m!484793))

(assert (=> b!504562 m!484783))

(assert (=> b!504562 m!484783))

(declare-fun m!484815 () Bool)

(assert (=> b!504562 m!484815))

(declare-fun m!484817 () Bool)

(assert (=> b!504573 m!484817))

(assert (=> b!504558 m!484783))

(assert (=> b!504558 m!484783))

(declare-fun m!484819 () Bool)

(assert (=> b!504558 m!484819))

(declare-fun m!484821 () Bool)

(assert (=> b!504560 m!484821))

(check-sat (not b!504573) (not b!504558) (not b!504562) (not b!504570) (not b!504572) (not b!504563) (not b!504564) (not b!504559) (not b!504560) (not b!504567) (not b!504561) (not start!45690) (not b!504574))
(check-sat)
