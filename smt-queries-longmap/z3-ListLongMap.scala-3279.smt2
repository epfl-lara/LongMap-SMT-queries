; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45606 () Bool)

(assert start!45606)

(declare-fun b!502416 () Bool)

(declare-fun res!303955 () Bool)

(declare-fun e!294253 () Bool)

(assert (=> b!502416 (=> res!303955 e!294253)))

(declare-datatypes ((SeekEntryResult!4030 0))(
  ( (MissingZero!4030 (index!18308 (_ BitVec 32))) (Found!4030 (index!18309 (_ BitVec 32))) (Intermediate!4030 (undefined!4842 Bool) (index!18310 (_ BitVec 32)) (x!47346 (_ BitVec 32))) (Undefined!4030) (MissingVacant!4030 (index!18311 (_ BitVec 32))) )
))
(declare-fun lt!228310 () SeekEntryResult!4030)

(get-info :version)

(assert (=> b!502416 (= res!303955 (or (undefined!4842 lt!228310) (not ((_ is Intermediate!4030) lt!228310))))))

(declare-fun b!502417 () Bool)

(declare-fun res!303950 () Bool)

(declare-fun e!294257 () Bool)

(assert (=> b!502417 (=> (not res!303950) (not e!294257))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502417 (= res!303950 (validKeyInArray!0 k0!2280))))

(declare-fun b!502418 () Bool)

(declare-fun e!294256 () Bool)

(assert (=> b!502418 (= e!294256 true)))

(declare-fun lt!228309 () SeekEntryResult!4030)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!228304 () (_ BitVec 32))

(declare-fun lt!228312 () (_ BitVec 64))

(declare-datatypes ((array!32372 0))(
  ( (array!32373 (arr!15566 (Array (_ BitVec 32) (_ BitVec 64))) (size!15931 (_ BitVec 32))) )
))
(declare-fun lt!228306 () array!32372)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32372 (_ BitVec 32)) SeekEntryResult!4030)

(assert (=> b!502418 (= lt!228309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228304 lt!228312 lt!228306 mask!3524))))

(declare-fun b!502419 () Bool)

(declare-fun res!303948 () Bool)

(declare-fun e!294250 () Bool)

(assert (=> b!502419 (=> (not res!303948) (not e!294250))))

(declare-fun a!3235 () array!32372)

(declare-datatypes ((List!9763 0))(
  ( (Nil!9760) (Cons!9759 (h!10636 (_ BitVec 64)) (t!15982 List!9763)) )
))
(declare-fun arrayNoDuplicates!0 (array!32372 (_ BitVec 32) List!9763) Bool)

(assert (=> b!502419 (= res!303948 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9760))))

(declare-fun b!502420 () Bool)

(declare-fun e!294258 () Bool)

(assert (=> b!502420 (= e!294258 false)))

(declare-fun b!502421 () Bool)

(declare-datatypes ((Unit!15190 0))(
  ( (Unit!15191) )
))
(declare-fun e!294254 () Unit!15190)

(declare-fun Unit!15192 () Unit!15190)

(assert (=> b!502421 (= e!294254 Unit!15192)))

(declare-fun b!502422 () Bool)

(declare-fun Unit!15193 () Unit!15190)

(assert (=> b!502422 (= e!294254 Unit!15193)))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!228305 () Unit!15190)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32372 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15190)

(assert (=> b!502422 (= lt!228305 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228304 #b00000000000000000000000000000000 (index!18310 lt!228310) (x!47346 lt!228310) mask!3524))))

(declare-fun res!303951 () Bool)

(assert (=> b!502422 (= res!303951 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228304 lt!228312 lt!228306 mask!3524) (Intermediate!4030 false (index!18310 lt!228310) (x!47346 lt!228310))))))

(assert (=> b!502422 (=> (not res!303951) (not e!294258))))

(assert (=> b!502422 e!294258))

(declare-fun b!502423 () Bool)

(declare-fun res!303949 () Bool)

(assert (=> b!502423 (=> (not res!303949) (not e!294257))))

(assert (=> b!502423 (= res!303949 (and (= (size!15931 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15931 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15931 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502424 () Bool)

(declare-fun res!303947 () Bool)

(assert (=> b!502424 (=> (not res!303947) (not e!294257))))

(declare-fun arrayContainsKey!0 (array!32372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502424 (= res!303947 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502425 () Bool)

(assert (=> b!502425 (= e!294257 e!294250)))

(declare-fun res!303956 () Bool)

(assert (=> b!502425 (=> (not res!303956) (not e!294250))))

(declare-fun lt!228303 () SeekEntryResult!4030)

(assert (=> b!502425 (= res!303956 (or (= lt!228303 (MissingZero!4030 i!1204)) (= lt!228303 (MissingVacant!4030 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32372 (_ BitVec 32)) SeekEntryResult!4030)

(assert (=> b!502425 (= lt!228303 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502426 () Bool)

(assert (=> b!502426 (= e!294253 e!294256)))

(declare-fun res!303952 () Bool)

(assert (=> b!502426 (=> res!303952 e!294256)))

(assert (=> b!502426 (= res!303952 (or (bvsgt (x!47346 lt!228310) #b01111111111111111111111111111110) (bvslt lt!228304 #b00000000000000000000000000000000) (bvsge lt!228304 (size!15931 a!3235)) (bvslt (index!18310 lt!228310) #b00000000000000000000000000000000) (bvsge (index!18310 lt!228310) (size!15931 a!3235)) (not (= lt!228310 (Intermediate!4030 false (index!18310 lt!228310) (x!47346 lt!228310))))))))

(assert (=> b!502426 (= (index!18310 lt!228310) i!1204)))

(declare-fun lt!228311 () Unit!15190)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32372 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15190)

(assert (=> b!502426 (= lt!228311 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228304 #b00000000000000000000000000000000 (index!18310 lt!228310) (x!47346 lt!228310) mask!3524))))

(assert (=> b!502426 (and (or (= (select (arr!15566 a!3235) (index!18310 lt!228310)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15566 a!3235) (index!18310 lt!228310)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15566 a!3235) (index!18310 lt!228310)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15566 a!3235) (index!18310 lt!228310)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228308 () Unit!15190)

(assert (=> b!502426 (= lt!228308 e!294254)))

(declare-fun c!59514 () Bool)

(assert (=> b!502426 (= c!59514 (= (select (arr!15566 a!3235) (index!18310 lt!228310)) (select (arr!15566 a!3235) j!176)))))

(assert (=> b!502426 (and (bvslt (x!47346 lt!228310) #b01111111111111111111111111111110) (or (= (select (arr!15566 a!3235) (index!18310 lt!228310)) (select (arr!15566 a!3235) j!176)) (= (select (arr!15566 a!3235) (index!18310 lt!228310)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15566 a!3235) (index!18310 lt!228310)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!303945 () Bool)

(assert (=> start!45606 (=> (not res!303945) (not e!294257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45606 (= res!303945 (validMask!0 mask!3524))))

(assert (=> start!45606 e!294257))

(assert (=> start!45606 true))

(declare-fun array_inv!11449 (array!32372) Bool)

(assert (=> start!45606 (array_inv!11449 a!3235)))

(declare-fun e!294251 () Bool)

(declare-fun b!502427 () Bool)

(assert (=> b!502427 (= e!294251 (= (seekEntryOrOpen!0 (select (arr!15566 a!3235) j!176) a!3235 mask!3524) (Found!4030 j!176)))))

(declare-fun b!502428 () Bool)

(declare-fun res!303954 () Bool)

(assert (=> b!502428 (=> (not res!303954) (not e!294250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32372 (_ BitVec 32)) Bool)

(assert (=> b!502428 (= res!303954 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!294252 () Bool)

(declare-fun b!502429 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32372 (_ BitVec 32)) SeekEntryResult!4030)

(assert (=> b!502429 (= e!294252 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228304 (index!18310 lt!228310) (select (arr!15566 a!3235) j!176) a!3235 mask!3524) (Found!4030 j!176))))))

(declare-fun b!502430 () Bool)

(declare-fun res!303953 () Bool)

(assert (=> b!502430 (=> (not res!303953) (not e!294257))))

(assert (=> b!502430 (= res!303953 (validKeyInArray!0 (select (arr!15566 a!3235) j!176)))))

(declare-fun b!502431 () Bool)

(assert (=> b!502431 (= e!294250 (not e!294253))))

(declare-fun res!303957 () Bool)

(assert (=> b!502431 (=> res!303957 e!294253)))

(declare-fun lt!228307 () (_ BitVec 32))

(assert (=> b!502431 (= res!303957 (= lt!228310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228307 lt!228312 lt!228306 mask!3524)))))

(assert (=> b!502431 (= lt!228310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228304 (select (arr!15566 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502431 (= lt!228307 (toIndex!0 lt!228312 mask!3524))))

(assert (=> b!502431 (= lt!228312 (select (store (arr!15566 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502431 (= lt!228304 (toIndex!0 (select (arr!15566 a!3235) j!176) mask!3524))))

(assert (=> b!502431 (= lt!228306 (array!32373 (store (arr!15566 a!3235) i!1204 k0!2280) (size!15931 a!3235)))))

(assert (=> b!502431 e!294251))

(declare-fun res!303958 () Bool)

(assert (=> b!502431 (=> (not res!303958) (not e!294251))))

(assert (=> b!502431 (= res!303958 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!228313 () Unit!15190)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32372 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15190)

(assert (=> b!502431 (= lt!228313 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502432 () Bool)

(declare-fun res!303946 () Bool)

(assert (=> b!502432 (=> res!303946 e!294256)))

(assert (=> b!502432 (= res!303946 e!294252)))

(declare-fun res!303959 () Bool)

(assert (=> b!502432 (=> (not res!303959) (not e!294252))))

(assert (=> b!502432 (= res!303959 (bvsgt #b00000000000000000000000000000000 (x!47346 lt!228310)))))

(assert (= (and start!45606 res!303945) b!502423))

(assert (= (and b!502423 res!303949) b!502430))

(assert (= (and b!502430 res!303953) b!502417))

(assert (= (and b!502417 res!303950) b!502424))

(assert (= (and b!502424 res!303947) b!502425))

(assert (= (and b!502425 res!303956) b!502428))

(assert (= (and b!502428 res!303954) b!502419))

(assert (= (and b!502419 res!303948) b!502431))

(assert (= (and b!502431 res!303958) b!502427))

(assert (= (and b!502431 (not res!303957)) b!502416))

(assert (= (and b!502416 (not res!303955)) b!502426))

(assert (= (and b!502426 c!59514) b!502422))

(assert (= (and b!502426 (not c!59514)) b!502421))

(assert (= (and b!502422 res!303951) b!502420))

(assert (= (and b!502426 (not res!303952)) b!502432))

(assert (= (and b!502432 res!303959) b!502429))

(assert (= (and b!502432 (not res!303946)) b!502418))

(declare-fun m!482845 () Bool)

(assert (=> b!502418 m!482845))

(declare-fun m!482847 () Bool)

(assert (=> b!502422 m!482847))

(assert (=> b!502422 m!482845))

(declare-fun m!482849 () Bool)

(assert (=> b!502427 m!482849))

(assert (=> b!502427 m!482849))

(declare-fun m!482851 () Bool)

(assert (=> b!502427 m!482851))

(declare-fun m!482853 () Bool)

(assert (=> b!502419 m!482853))

(assert (=> b!502430 m!482849))

(assert (=> b!502430 m!482849))

(declare-fun m!482855 () Bool)

(assert (=> b!502430 m!482855))

(declare-fun m!482857 () Bool)

(assert (=> b!502424 m!482857))

(declare-fun m!482859 () Bool)

(assert (=> b!502417 m!482859))

(assert (=> b!502431 m!482849))

(declare-fun m!482861 () Bool)

(assert (=> b!502431 m!482861))

(declare-fun m!482863 () Bool)

(assert (=> b!502431 m!482863))

(declare-fun m!482865 () Bool)

(assert (=> b!502431 m!482865))

(declare-fun m!482867 () Bool)

(assert (=> b!502431 m!482867))

(declare-fun m!482869 () Bool)

(assert (=> b!502431 m!482869))

(assert (=> b!502431 m!482849))

(declare-fun m!482871 () Bool)

(assert (=> b!502431 m!482871))

(assert (=> b!502431 m!482849))

(declare-fun m!482873 () Bool)

(assert (=> b!502431 m!482873))

(declare-fun m!482875 () Bool)

(assert (=> b!502431 m!482875))

(assert (=> b!502429 m!482849))

(assert (=> b!502429 m!482849))

(declare-fun m!482877 () Bool)

(assert (=> b!502429 m!482877))

(declare-fun m!482879 () Bool)

(assert (=> b!502428 m!482879))

(declare-fun m!482881 () Bool)

(assert (=> b!502425 m!482881))

(declare-fun m!482883 () Bool)

(assert (=> start!45606 m!482883))

(declare-fun m!482885 () Bool)

(assert (=> start!45606 m!482885))

(declare-fun m!482887 () Bool)

(assert (=> b!502426 m!482887))

(declare-fun m!482889 () Bool)

(assert (=> b!502426 m!482889))

(assert (=> b!502426 m!482849))

(check-sat (not b!502427) (not b!502428) (not b!502417) (not b!502426) (not b!502419) (not b!502431) (not b!502418) (not b!502430) (not b!502424) (not b!502425) (not b!502422) (not start!45606) (not b!502429))
(check-sat)
