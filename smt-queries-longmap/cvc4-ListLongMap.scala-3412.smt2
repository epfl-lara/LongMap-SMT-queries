; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!47398 () Bool)

(assert start!47398)

(declare-fun b!521326 () Bool)

(declare-fun res!319150 () Bool)

(declare-fun e!304160 () Bool)

(assert (=> b!521326 (=> (not res!319150) (not e!304160))))

(declare-datatypes ((array!33224 0))(
  ( (array!33225 (arr!15968 (Array (_ BitVec 32) (_ BitVec 64))) (size!16332 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33224)

(declare-datatypes ((List!10126 0))(
  ( (Nil!10123) (Cons!10122 (h!11044 (_ BitVec 64)) (t!16354 List!10126)) )
))
(declare-fun arrayNoDuplicates!0 (array!33224 (_ BitVec 32) List!10126) Bool)

(assert (=> b!521326 (= res!319150 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10123))))

(declare-fun b!521327 () Bool)

(declare-fun res!319144 () Bool)

(declare-fun e!304159 () Bool)

(assert (=> b!521327 (=> res!319144 e!304159)))

(declare-datatypes ((SeekEntryResult!4435 0))(
  ( (MissingZero!4435 (index!19943 (_ BitVec 32))) (Found!4435 (index!19944 (_ BitVec 32))) (Intermediate!4435 (undefined!5247 Bool) (index!19945 (_ BitVec 32)) (x!48925 (_ BitVec 32))) (Undefined!4435) (MissingVacant!4435 (index!19946 (_ BitVec 32))) )
))
(declare-fun lt!238886 () SeekEntryResult!4435)

(assert (=> b!521327 (= res!319144 (or (undefined!5247 lt!238886) (not (is-Intermediate!4435 lt!238886))))))

(declare-fun b!521328 () Bool)

(declare-fun res!319148 () Bool)

(declare-fun e!304158 () Bool)

(assert (=> b!521328 (=> (not res!319148) (not e!304158))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33224 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!521328 (= res!319148 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!521329 () Bool)

(declare-fun e!304161 () Bool)

(assert (=> b!521329 (= e!304161 false)))

(declare-fun b!521330 () Bool)

(declare-datatypes ((Unit!16192 0))(
  ( (Unit!16193) )
))
(declare-fun e!304162 () Unit!16192)

(declare-fun Unit!16194 () Unit!16192)

(assert (=> b!521330 (= e!304162 Unit!16194)))

(declare-fun b!521331 () Bool)

(assert (=> b!521331 (= e!304158 e!304160)))

(declare-fun res!319145 () Bool)

(assert (=> b!521331 (=> (not res!319145) (not e!304160))))

(declare-fun lt!238888 () SeekEntryResult!4435)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!521331 (= res!319145 (or (= lt!238888 (MissingZero!4435 i!1204)) (= lt!238888 (MissingVacant!4435 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33224 (_ BitVec 32)) SeekEntryResult!4435)

(assert (=> b!521331 (= lt!238888 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!521332 () Bool)

(declare-fun res!319151 () Bool)

(assert (=> b!521332 (=> (not res!319151) (not e!304160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33224 (_ BitVec 32)) Bool)

(assert (=> b!521332 (= res!319151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!319140 () Bool)

(assert (=> start!47398 (=> (not res!319140) (not e!304158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47398 (= res!319140 (validMask!0 mask!3524))))

(assert (=> start!47398 e!304158))

(assert (=> start!47398 true))

(declare-fun array_inv!11764 (array!33224) Bool)

(assert (=> start!47398 (array_inv!11764 a!3235)))

(declare-fun b!521333 () Bool)

(declare-fun Unit!16195 () Unit!16192)

(assert (=> b!521333 (= e!304162 Unit!16195)))

(declare-fun lt!238887 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lt!238889 () Unit!16192)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33224 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16192)

(assert (=> b!521333 (= lt!238889 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!238887 #b00000000000000000000000000000000 (index!19945 lt!238886) (x!48925 lt!238886) mask!3524))))

(declare-fun lt!238891 () (_ BitVec 64))

(declare-fun res!319147 () Bool)

(declare-fun lt!238890 () array!33224)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33224 (_ BitVec 32)) SeekEntryResult!4435)

(assert (=> b!521333 (= res!319147 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238887 lt!238891 lt!238890 mask!3524) (Intermediate!4435 false (index!19945 lt!238886) (x!48925 lt!238886))))))

(assert (=> b!521333 (=> (not res!319147) (not e!304161))))

(assert (=> b!521333 e!304161))

(declare-fun b!521334 () Bool)

(declare-fun res!319142 () Bool)

(assert (=> b!521334 (=> (not res!319142) (not e!304158))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!521334 (= res!319142 (validKeyInArray!0 k!2280))))

(declare-fun b!521335 () Bool)

(assert (=> b!521335 (= e!304159 true)))

(assert (=> b!521335 (and (or (= (select (arr!15968 a!3235) (index!19945 lt!238886)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15968 a!3235) (index!19945 lt!238886)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15968 a!3235) (index!19945 lt!238886)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15968 a!3235) (index!19945 lt!238886)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!238892 () Unit!16192)

(assert (=> b!521335 (= lt!238892 e!304162)))

(declare-fun c!61394 () Bool)

(assert (=> b!521335 (= c!61394 (= (select (arr!15968 a!3235) (index!19945 lt!238886)) (select (arr!15968 a!3235) j!176)))))

(assert (=> b!521335 (and (bvslt (x!48925 lt!238886) #b01111111111111111111111111111110) (or (= (select (arr!15968 a!3235) (index!19945 lt!238886)) (select (arr!15968 a!3235) j!176)) (= (select (arr!15968 a!3235) (index!19945 lt!238886)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15968 a!3235) (index!19945 lt!238886)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!521336 () Bool)

(assert (=> b!521336 (= e!304160 (not e!304159))))

(declare-fun res!319141 () Bool)

(assert (=> b!521336 (=> res!319141 e!304159)))

(declare-fun lt!238893 () (_ BitVec 32))

(assert (=> b!521336 (= res!319141 (= lt!238886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238893 lt!238891 lt!238890 mask!3524)))))

(assert (=> b!521336 (= lt!238886 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!238887 (select (arr!15968 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!521336 (= lt!238893 (toIndex!0 lt!238891 mask!3524))))

(assert (=> b!521336 (= lt!238891 (select (store (arr!15968 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!521336 (= lt!238887 (toIndex!0 (select (arr!15968 a!3235) j!176) mask!3524))))

(assert (=> b!521336 (= lt!238890 (array!33225 (store (arr!15968 a!3235) i!1204 k!2280) (size!16332 a!3235)))))

(declare-fun e!304163 () Bool)

(assert (=> b!521336 e!304163))

(declare-fun res!319143 () Bool)

(assert (=> b!521336 (=> (not res!319143) (not e!304163))))

(assert (=> b!521336 (= res!319143 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!238894 () Unit!16192)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33224 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16192)

(assert (=> b!521336 (= lt!238894 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!521337 () Bool)

(assert (=> b!521337 (= e!304163 (= (seekEntryOrOpen!0 (select (arr!15968 a!3235) j!176) a!3235 mask!3524) (Found!4435 j!176)))))

(declare-fun b!521338 () Bool)

(declare-fun res!319149 () Bool)

(assert (=> b!521338 (=> (not res!319149) (not e!304158))))

(assert (=> b!521338 (= res!319149 (validKeyInArray!0 (select (arr!15968 a!3235) j!176)))))

(declare-fun b!521339 () Bool)

(declare-fun res!319146 () Bool)

(assert (=> b!521339 (=> (not res!319146) (not e!304158))))

(assert (=> b!521339 (= res!319146 (and (= (size!16332 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16332 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16332 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!47398 res!319140) b!521339))

(assert (= (and b!521339 res!319146) b!521338))

(assert (= (and b!521338 res!319149) b!521334))

(assert (= (and b!521334 res!319142) b!521328))

(assert (= (and b!521328 res!319148) b!521331))

(assert (= (and b!521331 res!319145) b!521332))

(assert (= (and b!521332 res!319151) b!521326))

(assert (= (and b!521326 res!319150) b!521336))

(assert (= (and b!521336 res!319143) b!521337))

(assert (= (and b!521336 (not res!319141)) b!521327))

(assert (= (and b!521327 (not res!319144)) b!521335))

(assert (= (and b!521335 c!61394) b!521333))

(assert (= (and b!521335 (not c!61394)) b!521330))

(assert (= (and b!521333 res!319147) b!521329))

(declare-fun m!502239 () Bool)

(assert (=> b!521338 m!502239))

(assert (=> b!521338 m!502239))

(declare-fun m!502241 () Bool)

(assert (=> b!521338 m!502241))

(declare-fun m!502243 () Bool)

(assert (=> b!521331 m!502243))

(assert (=> b!521337 m!502239))

(assert (=> b!521337 m!502239))

(declare-fun m!502245 () Bool)

(assert (=> b!521337 m!502245))

(declare-fun m!502247 () Bool)

(assert (=> b!521335 m!502247))

(assert (=> b!521335 m!502239))

(declare-fun m!502249 () Bool)

(assert (=> b!521336 m!502249))

(declare-fun m!502251 () Bool)

(assert (=> b!521336 m!502251))

(declare-fun m!502253 () Bool)

(assert (=> b!521336 m!502253))

(assert (=> b!521336 m!502239))

(declare-fun m!502255 () Bool)

(assert (=> b!521336 m!502255))

(declare-fun m!502257 () Bool)

(assert (=> b!521336 m!502257))

(assert (=> b!521336 m!502239))

(declare-fun m!502259 () Bool)

(assert (=> b!521336 m!502259))

(declare-fun m!502261 () Bool)

(assert (=> b!521336 m!502261))

(assert (=> b!521336 m!502239))

(declare-fun m!502263 () Bool)

(assert (=> b!521336 m!502263))

(declare-fun m!502265 () Bool)

(assert (=> b!521326 m!502265))

(declare-fun m!502267 () Bool)

(assert (=> b!521332 m!502267))

(declare-fun m!502269 () Bool)

(assert (=> b!521328 m!502269))

(declare-fun m!502271 () Bool)

(assert (=> start!47398 m!502271))

(declare-fun m!502273 () Bool)

(assert (=> start!47398 m!502273))

(declare-fun m!502275 () Bool)

(assert (=> b!521333 m!502275))

(declare-fun m!502277 () Bool)

(assert (=> b!521333 m!502277))

(declare-fun m!502279 () Bool)

(assert (=> b!521334 m!502279))

(push 1)

