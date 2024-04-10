; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45718 () Bool)

(assert start!45718)

(declare-fun b!505237 () Bool)

(declare-fun res!306333 () Bool)

(declare-fun e!295779 () Bool)

(assert (=> b!505237 (=> (not res!306333) (not e!295779))))

(declare-datatypes ((array!32474 0))(
  ( (array!32475 (arr!15617 (Array (_ BitVec 32) (_ BitVec 64))) (size!15981 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32474)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!505237 (= res!306333 (validKeyInArray!0 (select (arr!15617 a!3235) j!176)))))

(declare-fun b!505238 () Bool)

(declare-fun res!306335 () Bool)

(declare-fun e!295778 () Bool)

(assert (=> b!505238 (=> res!306335 e!295778)))

(declare-fun e!295781 () Bool)

(assert (=> b!505238 (= res!306335 e!295781)))

(declare-fun res!306338 () Bool)

(assert (=> b!505238 (=> (not res!306338) (not e!295781))))

(declare-datatypes ((SeekEntryResult!4084 0))(
  ( (MissingZero!4084 (index!18524 (_ BitVec 32))) (Found!4084 (index!18525 (_ BitVec 32))) (Intermediate!4084 (undefined!4896 Bool) (index!18526 (_ BitVec 32)) (x!47533 (_ BitVec 32))) (Undefined!4084) (MissingVacant!4084 (index!18527 (_ BitVec 32))) )
))
(declare-fun lt!230212 () SeekEntryResult!4084)

(assert (=> b!505238 (= res!306338 (bvsgt #b00000000000000000000000000000000 (x!47533 lt!230212)))))

(declare-fun b!505239 () Bool)

(declare-fun e!295782 () Bool)

(assert (=> b!505239 (= e!295782 e!295778)))

(declare-fun res!306327 () Bool)

(assert (=> b!505239 (=> res!306327 e!295778)))

(declare-fun lt!230211 () (_ BitVec 32))

(assert (=> b!505239 (= res!306327 (or (bvsgt (x!47533 lt!230212) #b01111111111111111111111111111110) (bvslt lt!230211 #b00000000000000000000000000000000) (bvsge lt!230211 (size!15981 a!3235)) (bvslt (index!18526 lt!230212) #b00000000000000000000000000000000) (bvsge (index!18526 lt!230212) (size!15981 a!3235)) (not (= lt!230212 (Intermediate!4084 false (index!18526 lt!230212) (x!47533 lt!230212))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!505239 (= (index!18526 lt!230212) i!1204)))

(declare-datatypes ((Unit!15412 0))(
  ( (Unit!15413) )
))
(declare-fun lt!230213 () Unit!15412)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15412)

(assert (=> b!505239 (= lt!230213 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!230211 #b00000000000000000000000000000000 (index!18526 lt!230212) (x!47533 lt!230212) mask!3524))))

(assert (=> b!505239 (and (or (= (select (arr!15617 a!3235) (index!18526 lt!230212)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15617 a!3235) (index!18526 lt!230212)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15617 a!3235) (index!18526 lt!230212)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15617 a!3235) (index!18526 lt!230212)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!230214 () Unit!15412)

(declare-fun e!295780 () Unit!15412)

(assert (=> b!505239 (= lt!230214 e!295780)))

(declare-fun c!59735 () Bool)

(assert (=> b!505239 (= c!59735 (= (select (arr!15617 a!3235) (index!18526 lt!230212)) (select (arr!15617 a!3235) j!176)))))

(assert (=> b!505239 (and (bvslt (x!47533 lt!230212) #b01111111111111111111111111111110) (or (= (select (arr!15617 a!3235) (index!18526 lt!230212)) (select (arr!15617 a!3235) j!176)) (= (select (arr!15617 a!3235) (index!18526 lt!230212)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15617 a!3235) (index!18526 lt!230212)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!505240 () Bool)

(declare-fun e!295776 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32474 (_ BitVec 32)) SeekEntryResult!4084)

(assert (=> b!505240 (= e!295776 (= (seekEntryOrOpen!0 (select (arr!15617 a!3235) j!176) a!3235 mask!3524) (Found!4084 j!176)))))

(declare-fun b!505241 () Bool)

(declare-fun e!295775 () Bool)

(assert (=> b!505241 (= e!295779 e!295775)))

(declare-fun res!306331 () Bool)

(assert (=> b!505241 (=> (not res!306331) (not e!295775))))

(declare-fun lt!230215 () SeekEntryResult!4084)

(assert (=> b!505241 (= res!306331 (or (= lt!230215 (MissingZero!4084 i!1204)) (= lt!230215 (MissingVacant!4084 i!1204))))))

(assert (=> b!505241 (= lt!230215 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!306329 () Bool)

(assert (=> start!45718 (=> (not res!306329) (not e!295779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45718 (= res!306329 (validMask!0 mask!3524))))

(assert (=> start!45718 e!295779))

(assert (=> start!45718 true))

(declare-fun array_inv!11413 (array!32474) Bool)

(assert (=> start!45718 (array_inv!11413 a!3235)))

(declare-fun b!505242 () Bool)

(declare-fun res!306326 () Bool)

(assert (=> b!505242 (=> (not res!306326) (not e!295775))))

(declare-datatypes ((List!9775 0))(
  ( (Nil!9772) (Cons!9771 (h!10648 (_ BitVec 64)) (t!16003 List!9775)) )
))
(declare-fun arrayNoDuplicates!0 (array!32474 (_ BitVec 32) List!9775) Bool)

(assert (=> b!505242 (= res!306326 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9772))))

(declare-fun b!505243 () Bool)

(declare-fun res!306334 () Bool)

(assert (=> b!505243 (=> res!306334 e!295778)))

(declare-fun lt!230207 () (_ BitVec 64))

(declare-fun lt!230210 () SeekEntryResult!4084)

(declare-fun lt!230208 () array!32474)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32474 (_ BitVec 32)) SeekEntryResult!4084)

(assert (=> b!505243 (= res!306334 (not (= lt!230210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230211 lt!230207 lt!230208 mask!3524))))))

(declare-fun b!505244 () Bool)

(declare-fun lt!230209 () SeekEntryResult!4084)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32474 (_ BitVec 32)) SeekEntryResult!4084)

(assert (=> b!505244 (= e!295781 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!230211 (index!18526 lt!230212) (select (arr!15617 a!3235) j!176) a!3235 mask!3524) lt!230209)))))

(declare-fun b!505245 () Bool)

(declare-fun res!306336 () Bool)

(assert (=> b!505245 (=> (not res!306336) (not e!295775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32474 (_ BitVec 32)) Bool)

(assert (=> b!505245 (= res!306336 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!505246 () Bool)

(assert (=> b!505246 (= e!295775 (not e!295782))))

(declare-fun res!306332 () Bool)

(assert (=> b!505246 (=> res!306332 e!295782)))

(assert (=> b!505246 (= res!306332 (or (= lt!230212 lt!230210) (undefined!4896 lt!230212) (not (is-Intermediate!4084 lt!230212))))))

(declare-fun lt!230203 () (_ BitVec 32))

(assert (=> b!505246 (= lt!230210 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230203 lt!230207 lt!230208 mask!3524))))

(assert (=> b!505246 (= lt!230212 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230211 (select (arr!15617 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!505246 (= lt!230203 (toIndex!0 lt!230207 mask!3524))))

(assert (=> b!505246 (= lt!230207 (select (store (arr!15617 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!505246 (= lt!230211 (toIndex!0 (select (arr!15617 a!3235) j!176) mask!3524))))

(assert (=> b!505246 (= lt!230208 (array!32475 (store (arr!15617 a!3235) i!1204 k!2280) (size!15981 a!3235)))))

(assert (=> b!505246 (= lt!230209 (Found!4084 j!176))))

(assert (=> b!505246 e!295776))

(declare-fun res!306328 () Bool)

(assert (=> b!505246 (=> (not res!306328) (not e!295776))))

(assert (=> b!505246 (= res!306328 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!230206 () Unit!15412)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32474 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15412)

(assert (=> b!505246 (= lt!230206 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!505247 () Bool)

(declare-fun e!295774 () Bool)

(assert (=> b!505247 (= e!295774 false)))

(declare-fun b!505248 () Bool)

(declare-fun Unit!15414 () Unit!15412)

(assert (=> b!505248 (= e!295780 Unit!15414)))

(declare-fun b!505249 () Bool)

(declare-fun res!306325 () Bool)

(assert (=> b!505249 (=> (not res!306325) (not e!295779))))

(assert (=> b!505249 (= res!306325 (validKeyInArray!0 k!2280))))

(declare-fun b!505250 () Bool)

(assert (=> b!505250 (= e!295778 true)))

(assert (=> b!505250 (= (seekEntryOrOpen!0 lt!230207 lt!230208 mask!3524) lt!230209)))

(declare-fun lt!230205 () Unit!15412)

(declare-fun lemmaPutValidKeyPreservesVacantIsAtI!0 (array!32474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15412)

(assert (=> b!505250 (= lt!230205 (lemmaPutValidKeyPreservesVacantIsAtI!0 a!3235 i!1204 k!2280 j!176 lt!230211 #b00000000000000000000000000000000 (index!18526 lt!230212) (x!47533 lt!230212) mask!3524))))

(declare-fun b!505251 () Bool)

(declare-fun res!306330 () Bool)

(assert (=> b!505251 (=> (not res!306330) (not e!295779))))

(assert (=> b!505251 (= res!306330 (and (= (size!15981 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15981 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15981 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!505252 () Bool)

(declare-fun res!306337 () Bool)

(assert (=> b!505252 (=> (not res!306337) (not e!295779))))

(declare-fun arrayContainsKey!0 (array!32474 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!505252 (= res!306337 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!505253 () Bool)

(declare-fun Unit!15415 () Unit!15412)

(assert (=> b!505253 (= e!295780 Unit!15415)))

(declare-fun lt!230204 () Unit!15412)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32474 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15412)

(assert (=> b!505253 (= lt!230204 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!230211 #b00000000000000000000000000000000 (index!18526 lt!230212) (x!47533 lt!230212) mask!3524))))

(declare-fun res!306324 () Bool)

(assert (=> b!505253 (= res!306324 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!230211 lt!230207 lt!230208 mask!3524) (Intermediate!4084 false (index!18526 lt!230212) (x!47533 lt!230212))))))

(assert (=> b!505253 (=> (not res!306324) (not e!295774))))

(assert (=> b!505253 e!295774))

(assert (= (and start!45718 res!306329) b!505251))

(assert (= (and b!505251 res!306330) b!505237))

(assert (= (and b!505237 res!306333) b!505249))

(assert (= (and b!505249 res!306325) b!505252))

(assert (= (and b!505252 res!306337) b!505241))

(assert (= (and b!505241 res!306331) b!505245))

(assert (= (and b!505245 res!306336) b!505242))

(assert (= (and b!505242 res!306326) b!505246))

(assert (= (and b!505246 res!306328) b!505240))

(assert (= (and b!505246 (not res!306332)) b!505239))

(assert (= (and b!505239 c!59735) b!505253))

(assert (= (and b!505239 (not c!59735)) b!505248))

(assert (= (and b!505253 res!306324) b!505247))

(assert (= (and b!505239 (not res!306327)) b!505238))

(assert (= (and b!505238 res!306338) b!505244))

(assert (= (and b!505238 (not res!306335)) b!505243))

(assert (= (and b!505243 (not res!306334)) b!505250))

(declare-fun m!485905 () Bool)

(assert (=> b!505244 m!485905))

(assert (=> b!505244 m!485905))

(declare-fun m!485907 () Bool)

(assert (=> b!505244 m!485907))

(declare-fun m!485909 () Bool)

(assert (=> start!45718 m!485909))

(declare-fun m!485911 () Bool)

(assert (=> start!45718 m!485911))

(declare-fun m!485913 () Bool)

(assert (=> b!505245 m!485913))

(declare-fun m!485915 () Bool)

(assert (=> b!505249 m!485915))

(assert (=> b!505237 m!485905))

(assert (=> b!505237 m!485905))

(declare-fun m!485917 () Bool)

(assert (=> b!505237 m!485917))

(declare-fun m!485919 () Bool)

(assert (=> b!505250 m!485919))

(declare-fun m!485921 () Bool)

(assert (=> b!505250 m!485921))

(declare-fun m!485923 () Bool)

(assert (=> b!505241 m!485923))

(declare-fun m!485925 () Bool)

(assert (=> b!505252 m!485925))

(declare-fun m!485927 () Bool)

(assert (=> b!505242 m!485927))

(declare-fun m!485929 () Bool)

(assert (=> b!505246 m!485929))

(declare-fun m!485931 () Bool)

(assert (=> b!505246 m!485931))

(declare-fun m!485933 () Bool)

(assert (=> b!505246 m!485933))

(declare-fun m!485935 () Bool)

(assert (=> b!505246 m!485935))

(assert (=> b!505246 m!485905))

(declare-fun m!485937 () Bool)

(assert (=> b!505246 m!485937))

(assert (=> b!505246 m!485905))

(assert (=> b!505246 m!485905))

(declare-fun m!485939 () Bool)

(assert (=> b!505246 m!485939))

(declare-fun m!485941 () Bool)

(assert (=> b!505246 m!485941))

(declare-fun m!485943 () Bool)

(assert (=> b!505246 m!485943))

(declare-fun m!485945 () Bool)

(assert (=> b!505243 m!485945))

(declare-fun m!485947 () Bool)

(assert (=> b!505239 m!485947))

(declare-fun m!485949 () Bool)

(assert (=> b!505239 m!485949))

(assert (=> b!505239 m!485905))

(assert (=> b!505240 m!485905))

(assert (=> b!505240 m!485905))

(declare-fun m!485951 () Bool)

(assert (=> b!505240 m!485951))

(declare-fun m!485953 () Bool)

(assert (=> b!505253 m!485953))

(assert (=> b!505253 m!485945))

(push 1)

