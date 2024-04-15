; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45624 () Bool)

(assert start!45624)

(declare-fun b!502875 () Bool)

(declare-fun res!304361 () Bool)

(declare-fun e!294500 () Bool)

(assert (=> b!502875 (=> (not res!304361) (not e!294500))))

(declare-datatypes ((array!32390 0))(
  ( (array!32391 (arr!15575 (Array (_ BitVec 32) (_ BitVec 64))) (size!15940 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32390)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32390 (_ BitVec 32)) Bool)

(assert (=> b!502875 (= res!304361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-datatypes ((SeekEntryResult!4039 0))(
  ( (MissingZero!4039 (index!18344 (_ BitVec 32))) (Found!4039 (index!18345 (_ BitVec 32))) (Intermediate!4039 (undefined!4851 Bool) (index!18346 (_ BitVec 32)) (x!47379 (_ BitVec 32))) (Undefined!4039) (MissingVacant!4039 (index!18347 (_ BitVec 32))) )
))
(declare-fun lt!228610 () SeekEntryResult!4039)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!294495 () Bool)

(declare-fun b!502876 () Bool)

(declare-fun lt!228606 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32390 (_ BitVec 32)) SeekEntryResult!4039)

(assert (=> b!502876 (= e!294495 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228606 (index!18346 lt!228610) (select (arr!15575 a!3235) j!176) a!3235 mask!3524) (Found!4039 j!176))))))

(declare-fun b!502877 () Bool)

(declare-fun e!294494 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32390 (_ BitVec 32)) SeekEntryResult!4039)

(assert (=> b!502877 (= e!294494 (= (seekEntryOrOpen!0 (select (arr!15575 a!3235) j!176) a!3235 mask!3524) (Found!4039 j!176)))))

(declare-fun b!502878 () Bool)

(declare-fun e!294497 () Bool)

(assert (=> b!502878 (= e!294500 (not e!294497))))

(declare-fun res!304360 () Bool)

(assert (=> b!502878 (=> res!304360 e!294497)))

(declare-fun lt!228605 () array!32390)

(declare-fun lt!228602 () (_ BitVec 32))

(declare-fun lt!228607 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32390 (_ BitVec 32)) SeekEntryResult!4039)

(assert (=> b!502878 (= res!304360 (= lt!228610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228602 lt!228607 lt!228605 mask!3524)))))

(assert (=> b!502878 (= lt!228610 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228606 (select (arr!15575 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502878 (= lt!228602 (toIndex!0 lt!228607 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502878 (= lt!228607 (select (store (arr!15575 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502878 (= lt!228606 (toIndex!0 (select (arr!15575 a!3235) j!176) mask!3524))))

(assert (=> b!502878 (= lt!228605 (array!32391 (store (arr!15575 a!3235) i!1204 k0!2280) (size!15940 a!3235)))))

(assert (=> b!502878 e!294494))

(declare-fun res!304362 () Bool)

(assert (=> b!502878 (=> (not res!304362) (not e!294494))))

(assert (=> b!502878 (= res!304362 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15226 0))(
  ( (Unit!15227) )
))
(declare-fun lt!228609 () Unit!15226)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32390 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15226)

(assert (=> b!502878 (= lt!228609 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502879 () Bool)

(declare-fun res!304356 () Bool)

(declare-fun e!294498 () Bool)

(assert (=> b!502879 (=> res!304356 e!294498)))

(assert (=> b!502879 (= res!304356 e!294495)))

(declare-fun res!304354 () Bool)

(assert (=> b!502879 (=> (not res!304354) (not e!294495))))

(assert (=> b!502879 (= res!304354 (bvsgt #b00000000000000000000000000000000 (x!47379 lt!228610)))))

(declare-fun b!502880 () Bool)

(declare-fun res!304353 () Bool)

(declare-fun e!294501 () Bool)

(assert (=> b!502880 (=> (not res!304353) (not e!294501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502880 (= res!304353 (validKeyInArray!0 k0!2280))))

(declare-fun b!502881 () Bool)

(declare-fun res!304358 () Bool)

(assert (=> b!502881 (=> (not res!304358) (not e!294501))))

(declare-fun arrayContainsKey!0 (array!32390 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502881 (= res!304358 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!304350 () Bool)

(assert (=> start!45624 (=> (not res!304350) (not e!294501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45624 (= res!304350 (validMask!0 mask!3524))))

(assert (=> start!45624 e!294501))

(assert (=> start!45624 true))

(declare-fun array_inv!11458 (array!32390) Bool)

(assert (=> start!45624 (array_inv!11458 a!3235)))

(declare-fun b!502882 () Bool)

(declare-fun res!304364 () Bool)

(assert (=> b!502882 (=> (not res!304364) (not e!294500))))

(declare-datatypes ((List!9772 0))(
  ( (Nil!9769) (Cons!9768 (h!10645 (_ BitVec 64)) (t!15991 List!9772)) )
))
(declare-fun arrayNoDuplicates!0 (array!32390 (_ BitVec 32) List!9772) Bool)

(assert (=> b!502882 (= res!304364 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9769))))

(declare-fun b!502883 () Bool)

(assert (=> b!502883 (= e!294497 e!294498)))

(declare-fun res!304355 () Bool)

(assert (=> b!502883 (=> res!304355 e!294498)))

(assert (=> b!502883 (= res!304355 (or (bvsgt (x!47379 lt!228610) #b01111111111111111111111111111110) (bvslt lt!228606 #b00000000000000000000000000000000) (bvsge lt!228606 (size!15940 a!3235)) (bvslt (index!18346 lt!228610) #b00000000000000000000000000000000) (bvsge (index!18346 lt!228610) (size!15940 a!3235)) (not (= lt!228610 (Intermediate!4039 false (index!18346 lt!228610) (x!47379 lt!228610))))))))

(assert (=> b!502883 (= (index!18346 lt!228610) i!1204)))

(declare-fun lt!228608 () Unit!15226)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32390 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15226)

(assert (=> b!502883 (= lt!228608 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228606 #b00000000000000000000000000000000 (index!18346 lt!228610) (x!47379 lt!228610) mask!3524))))

(assert (=> b!502883 (and (or (= (select (arr!15575 a!3235) (index!18346 lt!228610)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15575 a!3235) (index!18346 lt!228610)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15575 a!3235) (index!18346 lt!228610)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15575 a!3235) (index!18346 lt!228610)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228600 () Unit!15226)

(declare-fun e!294493 () Unit!15226)

(assert (=> b!502883 (= lt!228600 e!294493)))

(declare-fun c!59541 () Bool)

(assert (=> b!502883 (= c!59541 (= (select (arr!15575 a!3235) (index!18346 lt!228610)) (select (arr!15575 a!3235) j!176)))))

(assert (=> b!502883 (and (bvslt (x!47379 lt!228610) #b01111111111111111111111111111110) (or (= (select (arr!15575 a!3235) (index!18346 lt!228610)) (select (arr!15575 a!3235) j!176)) (= (select (arr!15575 a!3235) (index!18346 lt!228610)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15575 a!3235) (index!18346 lt!228610)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502884 () Bool)

(declare-fun res!304357 () Bool)

(assert (=> b!502884 (=> (not res!304357) (not e!294501))))

(assert (=> b!502884 (= res!304357 (and (= (size!15940 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15940 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15940 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502885 () Bool)

(declare-fun e!294499 () Bool)

(assert (=> b!502885 (= e!294499 false)))

(declare-fun b!502886 () Bool)

(declare-fun res!304363 () Bool)

(assert (=> b!502886 (=> (not res!304363) (not e!294501))))

(assert (=> b!502886 (= res!304363 (validKeyInArray!0 (select (arr!15575 a!3235) j!176)))))

(declare-fun b!502887 () Bool)

(declare-fun res!304359 () Bool)

(assert (=> b!502887 (=> res!304359 e!294497)))

(get-info :version)

(assert (=> b!502887 (= res!304359 (or (undefined!4851 lt!228610) (not ((_ is Intermediate!4039) lt!228610))))))

(declare-fun b!502888 () Bool)

(assert (=> b!502888 (= e!294498 true)))

(declare-fun lt!228604 () SeekEntryResult!4039)

(assert (=> b!502888 (= lt!228604 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228606 lt!228607 lt!228605 mask!3524))))

(declare-fun b!502889 () Bool)

(assert (=> b!502889 (= e!294501 e!294500)))

(declare-fun res!304351 () Bool)

(assert (=> b!502889 (=> (not res!304351) (not e!294500))))

(declare-fun lt!228603 () SeekEntryResult!4039)

(assert (=> b!502889 (= res!304351 (or (= lt!228603 (MissingZero!4039 i!1204)) (= lt!228603 (MissingVacant!4039 i!1204))))))

(assert (=> b!502889 (= lt!228603 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502890 () Bool)

(declare-fun Unit!15228 () Unit!15226)

(assert (=> b!502890 (= e!294493 Unit!15228)))

(declare-fun lt!228601 () Unit!15226)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32390 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15226)

(assert (=> b!502890 (= lt!228601 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228606 #b00000000000000000000000000000000 (index!18346 lt!228610) (x!47379 lt!228610) mask!3524))))

(declare-fun res!304352 () Bool)

(assert (=> b!502890 (= res!304352 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228606 lt!228607 lt!228605 mask!3524) (Intermediate!4039 false (index!18346 lt!228610) (x!47379 lt!228610))))))

(assert (=> b!502890 (=> (not res!304352) (not e!294499))))

(assert (=> b!502890 e!294499))

(declare-fun b!502891 () Bool)

(declare-fun Unit!15229 () Unit!15226)

(assert (=> b!502891 (= e!294493 Unit!15229)))

(assert (= (and start!45624 res!304350) b!502884))

(assert (= (and b!502884 res!304357) b!502886))

(assert (= (and b!502886 res!304363) b!502880))

(assert (= (and b!502880 res!304353) b!502881))

(assert (= (and b!502881 res!304358) b!502889))

(assert (= (and b!502889 res!304351) b!502875))

(assert (= (and b!502875 res!304361) b!502882))

(assert (= (and b!502882 res!304364) b!502878))

(assert (= (and b!502878 res!304362) b!502877))

(assert (= (and b!502878 (not res!304360)) b!502887))

(assert (= (and b!502887 (not res!304359)) b!502883))

(assert (= (and b!502883 c!59541) b!502890))

(assert (= (and b!502883 (not c!59541)) b!502891))

(assert (= (and b!502890 res!304352) b!502885))

(assert (= (and b!502883 (not res!304355)) b!502879))

(assert (= (and b!502879 res!304354) b!502876))

(assert (= (and b!502879 (not res!304356)) b!502888))

(declare-fun m!483259 () Bool)

(assert (=> b!502889 m!483259))

(declare-fun m!483261 () Bool)

(assert (=> b!502882 m!483261))

(declare-fun m!483263 () Bool)

(assert (=> b!502876 m!483263))

(assert (=> b!502876 m!483263))

(declare-fun m!483265 () Bool)

(assert (=> b!502876 m!483265))

(declare-fun m!483267 () Bool)

(assert (=> start!45624 m!483267))

(declare-fun m!483269 () Bool)

(assert (=> start!45624 m!483269))

(declare-fun m!483271 () Bool)

(assert (=> b!502875 m!483271))

(declare-fun m!483273 () Bool)

(assert (=> b!502881 m!483273))

(declare-fun m!483275 () Bool)

(assert (=> b!502888 m!483275))

(assert (=> b!502877 m!483263))

(assert (=> b!502877 m!483263))

(declare-fun m!483277 () Bool)

(assert (=> b!502877 m!483277))

(declare-fun m!483279 () Bool)

(assert (=> b!502890 m!483279))

(assert (=> b!502890 m!483275))

(declare-fun m!483281 () Bool)

(assert (=> b!502883 m!483281))

(declare-fun m!483283 () Bool)

(assert (=> b!502883 m!483283))

(assert (=> b!502883 m!483263))

(declare-fun m!483285 () Bool)

(assert (=> b!502880 m!483285))

(assert (=> b!502886 m!483263))

(assert (=> b!502886 m!483263))

(declare-fun m!483287 () Bool)

(assert (=> b!502886 m!483287))

(assert (=> b!502878 m!483263))

(declare-fun m!483289 () Bool)

(assert (=> b!502878 m!483289))

(declare-fun m!483291 () Bool)

(assert (=> b!502878 m!483291))

(declare-fun m!483293 () Bool)

(assert (=> b!502878 m!483293))

(declare-fun m!483295 () Bool)

(assert (=> b!502878 m!483295))

(declare-fun m!483297 () Bool)

(assert (=> b!502878 m!483297))

(assert (=> b!502878 m!483263))

(declare-fun m!483299 () Bool)

(assert (=> b!502878 m!483299))

(assert (=> b!502878 m!483263))

(declare-fun m!483301 () Bool)

(assert (=> b!502878 m!483301))

(declare-fun m!483303 () Bool)

(assert (=> b!502878 m!483303))

(check-sat (not b!502878) (not b!502876) (not b!502875) (not b!502888) (not b!502880) (not b!502883) (not b!502881) (not b!502882) (not b!502877) (not b!502889) (not b!502890) (not start!45624) (not b!502886))
(check-sat)
