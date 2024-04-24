; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68008 () Bool)

(assert start!68008)

(declare-fun res!535118 () Bool)

(declare-fun e!439281 () Bool)

(assert (=> start!68008 (=> (not res!535118) (not e!439281))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68008 (= res!535118 (validMask!0 mask!3328))))

(assert (=> start!68008 e!439281))

(assert (=> start!68008 true))

(declare-datatypes ((array!42865 0))(
  ( (array!42866 (arr!20515 (Array (_ BitVec 32) (_ BitVec 64))) (size!20935 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42865)

(declare-fun array_inv!16374 (array!42865) Bool)

(assert (=> start!68008 (array_inv!16374 a!3186)))

(declare-fun b!790236 () Bool)

(declare-fun res!535126 () Bool)

(declare-fun e!439273 () Bool)

(assert (=> b!790236 (=> (not res!535126) (not e!439273))))

(declare-fun e!439277 () Bool)

(assert (=> b!790236 (= res!535126 e!439277)))

(declare-fun c!87974 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!790236 (= c!87974 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!790237 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8071 0))(
  ( (MissingZero!8071 (index!34652 (_ BitVec 32))) (Found!8071 (index!34653 (_ BitVec 32))) (Intermediate!8071 (undefined!8883 Bool) (index!34654 (_ BitVec 32)) (x!65751 (_ BitVec 32))) (Undefined!8071) (MissingVacant!8071 (index!34655 (_ BitVec 32))) )
))
(declare-fun lt!352609 () SeekEntryResult!8071)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42865 (_ BitVec 32)) SeekEntryResult!8071)

(assert (=> b!790237 (= e!439277 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20515 a!3186) j!159) a!3186 mask!3328) lt!352609))))

(declare-fun lt!352599 () SeekEntryResult!8071)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!790238 () Bool)

(declare-fun e!439282 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42865 (_ BitVec 32)) SeekEntryResult!8071)

(assert (=> b!790238 (= e!439282 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20515 a!3186) j!159) a!3186 mask!3328) lt!352599))))

(declare-fun b!790239 () Bool)

(declare-fun e!439276 () Bool)

(declare-fun e!439280 () Bool)

(assert (=> b!790239 (= e!439276 e!439280)))

(declare-fun res!535125 () Bool)

(assert (=> b!790239 (=> res!535125 e!439280)))

(assert (=> b!790239 (= res!535125 (or (not (= (select (arr!20515 a!3186) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)) (= index!1321 resIntermediateIndex!5)))))

(declare-fun lt!352604 () SeekEntryResult!8071)

(declare-fun lt!352598 () SeekEntryResult!8071)

(declare-fun lt!352596 () SeekEntryResult!8071)

(declare-fun lt!352597 () SeekEntryResult!8071)

(assert (=> b!790239 (and (= lt!352597 lt!352596) (= lt!352604 lt!352598))))

(declare-fun lt!352600 () array!42865)

(declare-fun lt!352603 () (_ BitVec 64))

(assert (=> b!790239 (= lt!352596 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!352603 lt!352600 mask!3328))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42865 (_ BitVec 32)) SeekEntryResult!8071)

(assert (=> b!790239 (= lt!352597 (seekEntryOrOpen!0 lt!352603 lt!352600 mask!3328))))

(declare-fun lt!352606 () (_ BitVec 64))

(assert (=> b!790239 (= lt!352606 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-datatypes ((Unit!27349 0))(
  ( (Unit!27350) )
))
(declare-fun lt!352602 () Unit!27349)

(declare-fun e!439271 () Unit!27349)

(assert (=> b!790239 (= lt!352602 e!439271)))

(declare-fun c!87973 () Bool)

(assert (=> b!790239 (= c!87973 (= lt!352606 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!790240 () Bool)

(declare-fun res!535119 () Bool)

(assert (=> b!790240 (=> (not res!535119) (not e!439281))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42865 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!790240 (= res!535119 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!790241 () Bool)

(declare-fun e!439279 () Bool)

(declare-fun e!439275 () Bool)

(assert (=> b!790241 (= e!439279 e!439275)))

(declare-fun res!535124 () Bool)

(assert (=> b!790241 (=> res!535124 e!439275)))

(assert (=> b!790241 (= res!535124 (not (= lt!352598 lt!352599)))))

(assert (=> b!790241 (= lt!352598 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20515 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!790242 () Bool)

(declare-fun res!535116 () Bool)

(declare-fun e!439278 () Bool)

(assert (=> b!790242 (=> (not res!535116) (not e!439278))))

(declare-datatypes ((List!14424 0))(
  ( (Nil!14421) (Cons!14420 (h!15552 (_ BitVec 64)) (t!20731 List!14424)) )
))
(declare-fun arrayNoDuplicates!0 (array!42865 (_ BitVec 32) List!14424) Bool)

(assert (=> b!790242 (= res!535116 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14421))))

(declare-fun b!790243 () Bool)

(declare-fun res!535128 () Bool)

(assert (=> b!790243 (=> (not res!535128) (not e!439281))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!790243 (= res!535128 (validKeyInArray!0 k0!2102))))

(declare-fun b!790244 () Bool)

(declare-fun res!535117 () Bool)

(assert (=> b!790244 (=> (not res!535117) (not e!439273))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!790244 (= res!535117 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20515 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!790245 () Bool)

(declare-fun e!439272 () Bool)

(assert (=> b!790245 (= e!439272 (not e!439279))))

(declare-fun res!535130 () Bool)

(assert (=> b!790245 (=> res!535130 e!439279)))

(declare-fun lt!352607 () SeekEntryResult!8071)

(get-info :version)

(assert (=> b!790245 (= res!535130 (or (not ((_ is Intermediate!8071) lt!352607)) (bvslt x!1131 (x!65751 lt!352607)) (not (= x!1131 (x!65751 lt!352607))) (not (= index!1321 (index!34654 lt!352607)))))))

(assert (=> b!790245 e!439282))

(declare-fun res!535114 () Bool)

(assert (=> b!790245 (=> (not res!535114) (not e!439282))))

(assert (=> b!790245 (= res!535114 (= lt!352604 lt!352599))))

(assert (=> b!790245 (= lt!352599 (Found!8071 j!159))))

(assert (=> b!790245 (= lt!352604 (seekEntryOrOpen!0 (select (arr!20515 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42865 (_ BitVec 32)) Bool)

(assert (=> b!790245 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!352601 () Unit!27349)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42865 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27349)

(assert (=> b!790245 (= lt!352601 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!790246 () Bool)

(declare-fun res!535115 () Bool)

(assert (=> b!790246 (=> (not res!535115) (not e!439281))))

(assert (=> b!790246 (= res!535115 (and (= (size!20935 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20935 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20935 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!790247 () Bool)

(declare-fun res!535120 () Bool)

(assert (=> b!790247 (=> (not res!535120) (not e!439278))))

(assert (=> b!790247 (= res!535120 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20935 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20935 a!3186))))))

(declare-fun b!790248 () Bool)

(assert (=> b!790248 (= e!439273 e!439272)))

(declare-fun res!535122 () Bool)

(assert (=> b!790248 (=> (not res!535122) (not e!439272))))

(declare-fun lt!352595 () SeekEntryResult!8071)

(assert (=> b!790248 (= res!535122 (= lt!352595 lt!352607))))

(assert (=> b!790248 (= lt!352607 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!352603 lt!352600 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!790248 (= lt!352595 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!352603 mask!3328) lt!352603 lt!352600 mask!3328))))

(assert (=> b!790248 (= lt!352603 (select (store (arr!20515 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!790248 (= lt!352600 (array!42866 (store (arr!20515 a!3186) i!1173 k0!2102) (size!20935 a!3186)))))

(declare-fun b!790249 () Bool)

(declare-fun Unit!27351 () Unit!27349)

(assert (=> b!790249 (= e!439271 Unit!27351)))

(declare-fun b!790250 () Bool)

(assert (=> b!790250 (= e!439281 e!439278)))

(declare-fun res!535127 () Bool)

(assert (=> b!790250 (=> (not res!535127) (not e!439278))))

(declare-fun lt!352608 () SeekEntryResult!8071)

(assert (=> b!790250 (= res!535127 (or (= lt!352608 (MissingZero!8071 i!1173)) (= lt!352608 (MissingVacant!8071 i!1173))))))

(assert (=> b!790250 (= lt!352608 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!790251 () Bool)

(declare-fun res!535129 () Bool)

(assert (=> b!790251 (=> (not res!535129) (not e!439281))))

(assert (=> b!790251 (= res!535129 (validKeyInArray!0 (select (arr!20515 a!3186) j!159)))))

(declare-fun b!790252 () Bool)

(declare-fun Unit!27352 () Unit!27349)

(assert (=> b!790252 (= e!439271 Unit!27352)))

(assert (=> b!790252 false))

(declare-fun b!790253 () Bool)

(assert (=> b!790253 (= e!439280 true)))

(assert (=> b!790253 (= lt!352596 lt!352598)))

(declare-fun lt!352605 () Unit!27349)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!42865 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27349)

(assert (=> b!790253 (= lt!352605 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3186 i!1173 k0!2102 j!159 index!1321 x!1131 resIntermediateIndex!5 index!1321 mask!3328))))

(declare-fun b!790254 () Bool)

(assert (=> b!790254 (= e!439275 e!439276)))

(declare-fun res!535123 () Bool)

(assert (=> b!790254 (=> res!535123 e!439276)))

(assert (=> b!790254 (= res!535123 (= lt!352606 lt!352603))))

(assert (=> b!790254 (= lt!352606 (select (store (arr!20515 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!790255 () Bool)

(declare-fun res!535131 () Bool)

(assert (=> b!790255 (=> (not res!535131) (not e!439278))))

(assert (=> b!790255 (= res!535131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!790256 () Bool)

(assert (=> b!790256 (= e!439278 e!439273)))

(declare-fun res!535121 () Bool)

(assert (=> b!790256 (=> (not res!535121) (not e!439273))))

(assert (=> b!790256 (= res!535121 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20515 a!3186) j!159) mask!3328) (select (arr!20515 a!3186) j!159) a!3186 mask!3328) lt!352609))))

(assert (=> b!790256 (= lt!352609 (Intermediate!8071 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!790257 () Bool)

(assert (=> b!790257 (= e!439277 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20515 a!3186) j!159) a!3186 mask!3328) (Found!8071 j!159)))))

(assert (= (and start!68008 res!535118) b!790246))

(assert (= (and b!790246 res!535115) b!790251))

(assert (= (and b!790251 res!535129) b!790243))

(assert (= (and b!790243 res!535128) b!790240))

(assert (= (and b!790240 res!535119) b!790250))

(assert (= (and b!790250 res!535127) b!790255))

(assert (= (and b!790255 res!535131) b!790242))

(assert (= (and b!790242 res!535116) b!790247))

(assert (= (and b!790247 res!535120) b!790256))

(assert (= (and b!790256 res!535121) b!790244))

(assert (= (and b!790244 res!535117) b!790236))

(assert (= (and b!790236 c!87974) b!790237))

(assert (= (and b!790236 (not c!87974)) b!790257))

(assert (= (and b!790236 res!535126) b!790248))

(assert (= (and b!790248 res!535122) b!790245))

(assert (= (and b!790245 res!535114) b!790238))

(assert (= (and b!790245 (not res!535130)) b!790241))

(assert (= (and b!790241 (not res!535124)) b!790254))

(assert (= (and b!790254 (not res!535123)) b!790239))

(assert (= (and b!790239 c!87973) b!790252))

(assert (= (and b!790239 (not c!87973)) b!790249))

(assert (= (and b!790239 (not res!535125)) b!790253))

(declare-fun m!731699 () Bool)

(assert (=> b!790250 m!731699))

(declare-fun m!731701 () Bool)

(assert (=> b!790256 m!731701))

(assert (=> b!790256 m!731701))

(declare-fun m!731703 () Bool)

(assert (=> b!790256 m!731703))

(assert (=> b!790256 m!731703))

(assert (=> b!790256 m!731701))

(declare-fun m!731705 () Bool)

(assert (=> b!790256 m!731705))

(declare-fun m!731707 () Bool)

(assert (=> b!790244 m!731707))

(assert (=> b!790237 m!731701))

(assert (=> b!790237 m!731701))

(declare-fun m!731709 () Bool)

(assert (=> b!790237 m!731709))

(assert (=> b!790245 m!731701))

(assert (=> b!790245 m!731701))

(declare-fun m!731711 () Bool)

(assert (=> b!790245 m!731711))

(declare-fun m!731713 () Bool)

(assert (=> b!790245 m!731713))

(declare-fun m!731715 () Bool)

(assert (=> b!790245 m!731715))

(declare-fun m!731717 () Bool)

(assert (=> b!790248 m!731717))

(declare-fun m!731719 () Bool)

(assert (=> b!790248 m!731719))

(declare-fun m!731721 () Bool)

(assert (=> b!790248 m!731721))

(declare-fun m!731723 () Bool)

(assert (=> b!790248 m!731723))

(assert (=> b!790248 m!731723))

(declare-fun m!731725 () Bool)

(assert (=> b!790248 m!731725))

(declare-fun m!731727 () Bool)

(assert (=> b!790239 m!731727))

(declare-fun m!731729 () Bool)

(assert (=> b!790239 m!731729))

(declare-fun m!731731 () Bool)

(assert (=> b!790239 m!731731))

(assert (=> b!790254 m!731717))

(declare-fun m!731733 () Bool)

(assert (=> b!790254 m!731733))

(assert (=> b!790257 m!731701))

(assert (=> b!790257 m!731701))

(declare-fun m!731735 () Bool)

(assert (=> b!790257 m!731735))

(assert (=> b!790238 m!731701))

(assert (=> b!790238 m!731701))

(declare-fun m!731737 () Bool)

(assert (=> b!790238 m!731737))

(assert (=> b!790241 m!731701))

(assert (=> b!790241 m!731701))

(assert (=> b!790241 m!731735))

(assert (=> b!790251 m!731701))

(assert (=> b!790251 m!731701))

(declare-fun m!731739 () Bool)

(assert (=> b!790251 m!731739))

(declare-fun m!731741 () Bool)

(assert (=> b!790243 m!731741))

(declare-fun m!731743 () Bool)

(assert (=> b!790242 m!731743))

(declare-fun m!731745 () Bool)

(assert (=> b!790255 m!731745))

(declare-fun m!731747 () Bool)

(assert (=> b!790253 m!731747))

(declare-fun m!731749 () Bool)

(assert (=> start!68008 m!731749))

(declare-fun m!731751 () Bool)

(assert (=> start!68008 m!731751))

(declare-fun m!731753 () Bool)

(assert (=> b!790240 m!731753))

(check-sat (not b!790257) (not b!790237) (not b!790253) (not b!790243) (not b!790255) (not b!790245) (not b!790241) (not b!790251) (not b!790250) (not b!790240) (not b!790242) (not b!790239) (not b!790256) (not b!790248) (not start!68008) (not b!790238))
(check-sat)
