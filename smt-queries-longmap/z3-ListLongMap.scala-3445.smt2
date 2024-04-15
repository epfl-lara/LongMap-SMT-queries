; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47778 () Bool)

(assert start!47778)

(declare-fun b!526119 () Bool)

(declare-fun e!306662 () Bool)

(declare-fun e!306666 () Bool)

(assert (=> b!526119 (= e!306662 (not e!306666))))

(declare-fun res!322897 () Bool)

(assert (=> b!526119 (=> res!322897 e!306666)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!241845 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4528 0))(
  ( (MissingZero!4528 (index!20324 (_ BitVec 32))) (Found!4528 (index!20325 (_ BitVec 32))) (Intermediate!4528 (undefined!5340 Bool) (index!20326 (_ BitVec 32)) (x!49304 (_ BitVec 32))) (Undefined!4528) (MissingVacant!4528 (index!20327 (_ BitVec 32))) )
))
(declare-fun lt!241846 () SeekEntryResult!4528)

(declare-datatypes ((array!33425 0))(
  ( (array!33426 (arr!16064 (Array (_ BitVec 32) (_ BitVec 64))) (size!16429 (_ BitVec 32))) )
))
(declare-fun lt!241848 () array!33425)

(declare-fun lt!241843 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33425 (_ BitVec 32)) SeekEntryResult!4528)

(assert (=> b!526119 (= res!322897 (= lt!241846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241843 lt!241845 lt!241848 mask!3524)))))

(declare-fun a!3235 () array!33425)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!241844 () (_ BitVec 32))

(assert (=> b!526119 (= lt!241846 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241844 (select (arr!16064 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!526119 (= lt!241843 (toIndex!0 lt!241845 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!526119 (= lt!241845 (select (store (arr!16064 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!526119 (= lt!241844 (toIndex!0 (select (arr!16064 a!3235) j!176) mask!3524))))

(assert (=> b!526119 (= lt!241848 (array!33426 (store (arr!16064 a!3235) i!1204 k0!2280) (size!16429 a!3235)))))

(declare-fun e!306665 () Bool)

(assert (=> b!526119 e!306665))

(declare-fun res!322895 () Bool)

(assert (=> b!526119 (=> (not res!322895) (not e!306665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33425 (_ BitVec 32)) Bool)

(assert (=> b!526119 (= res!322895 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16558 0))(
  ( (Unit!16559) )
))
(declare-fun lt!241840 () Unit!16558)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16558)

(assert (=> b!526119 (= lt!241840 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!526120 () Bool)

(declare-fun e!306663 () Unit!16558)

(declare-fun Unit!16560 () Unit!16558)

(assert (=> b!526120 (= e!306663 Unit!16560)))

(declare-fun lt!241842 () Unit!16558)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16558)

(assert (=> b!526120 (= lt!241842 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241844 #b00000000000000000000000000000000 (index!20326 lt!241846) (x!49304 lt!241846) mask!3524))))

(declare-fun res!322890 () Bool)

(assert (=> b!526120 (= res!322890 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241844 lt!241845 lt!241848 mask!3524) (Intermediate!4528 false (index!20326 lt!241846) (x!49304 lt!241846))))))

(declare-fun e!306661 () Bool)

(assert (=> b!526120 (=> (not res!322890) (not e!306661))))

(assert (=> b!526120 e!306661))

(declare-fun b!526121 () Bool)

(declare-fun res!322901 () Bool)

(declare-fun e!306660 () Bool)

(assert (=> b!526121 (=> (not res!322901) (not e!306660))))

(assert (=> b!526121 (= res!322901 (and (= (size!16429 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16429 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16429 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!526122 () Bool)

(assert (=> b!526122 (= e!306660 e!306662)))

(declare-fun res!322894 () Bool)

(assert (=> b!526122 (=> (not res!322894) (not e!306662))))

(declare-fun lt!241841 () SeekEntryResult!4528)

(assert (=> b!526122 (= res!322894 (or (= lt!241841 (MissingZero!4528 i!1204)) (= lt!241841 (MissingVacant!4528 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33425 (_ BitVec 32)) SeekEntryResult!4528)

(assert (=> b!526122 (= lt!241841 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!526123 () Bool)

(declare-fun res!322896 () Bool)

(assert (=> b!526123 (=> (not res!322896) (not e!306660))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!526123 (= res!322896 (validKeyInArray!0 (select (arr!16064 a!3235) j!176)))))

(declare-fun res!322893 () Bool)

(assert (=> start!47778 (=> (not res!322893) (not e!306660))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47778 (= res!322893 (validMask!0 mask!3524))))

(assert (=> start!47778 e!306660))

(assert (=> start!47778 true))

(declare-fun array_inv!11947 (array!33425) Bool)

(assert (=> start!47778 (array_inv!11947 a!3235)))

(declare-fun b!526124 () Bool)

(declare-fun res!322900 () Bool)

(assert (=> b!526124 (=> res!322900 e!306666)))

(get-info :version)

(assert (=> b!526124 (= res!322900 (or (undefined!5340 lt!241846) (not ((_ is Intermediate!4528) lt!241846))))))

(declare-fun b!526125 () Bool)

(assert (=> b!526125 (= e!306661 false)))

(declare-fun b!526126 () Bool)

(declare-fun res!322898 () Bool)

(assert (=> b!526126 (=> (not res!322898) (not e!306662))))

(assert (=> b!526126 (= res!322898 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!526127 () Bool)

(declare-fun Unit!16561 () Unit!16558)

(assert (=> b!526127 (= e!306663 Unit!16561)))

(declare-fun b!526128 () Bool)

(declare-fun res!322899 () Bool)

(assert (=> b!526128 (=> (not res!322899) (not e!306660))))

(assert (=> b!526128 (= res!322899 (validKeyInArray!0 k0!2280))))

(declare-fun b!526129 () Bool)

(declare-fun res!322891 () Bool)

(assert (=> b!526129 (=> (not res!322891) (not e!306660))))

(declare-fun arrayContainsKey!0 (array!33425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!526129 (= res!322891 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!526130 () Bool)

(assert (=> b!526130 (= e!306665 (= (seekEntryOrOpen!0 (select (arr!16064 a!3235) j!176) a!3235 mask!3524) (Found!4528 j!176)))))

(declare-fun b!526131 () Bool)

(assert (=> b!526131 (= e!306666 true)))

(assert (=> b!526131 (= (index!20326 lt!241846) i!1204)))

(declare-fun lt!241849 () Unit!16558)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33425 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16558)

(assert (=> b!526131 (= lt!241849 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241844 #b00000000000000000000000000000000 (index!20326 lt!241846) (x!49304 lt!241846) mask!3524))))

(assert (=> b!526131 (and (or (= (select (arr!16064 a!3235) (index!20326 lt!241846)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16064 a!3235) (index!20326 lt!241846)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16064 a!3235) (index!20326 lt!241846)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16064 a!3235) (index!20326 lt!241846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241847 () Unit!16558)

(assert (=> b!526131 (= lt!241847 e!306663)))

(declare-fun c!61920 () Bool)

(assert (=> b!526131 (= c!61920 (= (select (arr!16064 a!3235) (index!20326 lt!241846)) (select (arr!16064 a!3235) j!176)))))

(assert (=> b!526131 (and (bvslt (x!49304 lt!241846) #b01111111111111111111111111111110) (or (= (select (arr!16064 a!3235) (index!20326 lt!241846)) (select (arr!16064 a!3235) j!176)) (= (select (arr!16064 a!3235) (index!20326 lt!241846)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16064 a!3235) (index!20326 lt!241846)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!526132 () Bool)

(declare-fun res!322892 () Bool)

(assert (=> b!526132 (=> (not res!322892) (not e!306662))))

(declare-datatypes ((List!10261 0))(
  ( (Nil!10258) (Cons!10257 (h!11188 (_ BitVec 64)) (t!16480 List!10261)) )
))
(declare-fun arrayNoDuplicates!0 (array!33425 (_ BitVec 32) List!10261) Bool)

(assert (=> b!526132 (= res!322892 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10258))))

(assert (= (and start!47778 res!322893) b!526121))

(assert (= (and b!526121 res!322901) b!526123))

(assert (= (and b!526123 res!322896) b!526128))

(assert (= (and b!526128 res!322899) b!526129))

(assert (= (and b!526129 res!322891) b!526122))

(assert (= (and b!526122 res!322894) b!526126))

(assert (= (and b!526126 res!322898) b!526132))

(assert (= (and b!526132 res!322892) b!526119))

(assert (= (and b!526119 res!322895) b!526130))

(assert (= (and b!526119 (not res!322897)) b!526124))

(assert (= (and b!526124 (not res!322900)) b!526131))

(assert (= (and b!526131 c!61920) b!526120))

(assert (= (and b!526131 (not c!61920)) b!526127))

(assert (= (and b!526120 res!322890) b!526125))

(declare-fun m!506341 () Bool)

(assert (=> b!526128 m!506341))

(declare-fun m!506343 () Bool)

(assert (=> b!526131 m!506343))

(declare-fun m!506345 () Bool)

(assert (=> b!526131 m!506345))

(declare-fun m!506347 () Bool)

(assert (=> b!526131 m!506347))

(declare-fun m!506349 () Bool)

(assert (=> b!526122 m!506349))

(declare-fun m!506351 () Bool)

(assert (=> b!526120 m!506351))

(declare-fun m!506353 () Bool)

(assert (=> b!526120 m!506353))

(assert (=> b!526130 m!506347))

(assert (=> b!526130 m!506347))

(declare-fun m!506355 () Bool)

(assert (=> b!526130 m!506355))

(declare-fun m!506357 () Bool)

(assert (=> b!526126 m!506357))

(declare-fun m!506359 () Bool)

(assert (=> b!526132 m!506359))

(declare-fun m!506361 () Bool)

(assert (=> start!47778 m!506361))

(declare-fun m!506363 () Bool)

(assert (=> start!47778 m!506363))

(assert (=> b!526123 m!506347))

(assert (=> b!526123 m!506347))

(declare-fun m!506365 () Bool)

(assert (=> b!526123 m!506365))

(declare-fun m!506367 () Bool)

(assert (=> b!526129 m!506367))

(declare-fun m!506369 () Bool)

(assert (=> b!526119 m!506369))

(declare-fun m!506371 () Bool)

(assert (=> b!526119 m!506371))

(declare-fun m!506373 () Bool)

(assert (=> b!526119 m!506373))

(assert (=> b!526119 m!506347))

(declare-fun m!506375 () Bool)

(assert (=> b!526119 m!506375))

(assert (=> b!526119 m!506347))

(declare-fun m!506377 () Bool)

(assert (=> b!526119 m!506377))

(assert (=> b!526119 m!506347))

(declare-fun m!506379 () Bool)

(assert (=> b!526119 m!506379))

(declare-fun m!506381 () Bool)

(assert (=> b!526119 m!506381))

(declare-fun m!506383 () Bool)

(assert (=> b!526119 m!506383))

(check-sat (not b!526130) (not b!526120) (not b!526123) (not b!526132) (not b!526131) (not b!526119) (not b!526128) (not b!526129) (not b!526126) (not b!526122) (not start!47778))
(check-sat)
