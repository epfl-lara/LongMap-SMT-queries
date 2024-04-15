; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46752 () Bool)

(assert start!46752)

(declare-fun b!516198 () Bool)

(declare-fun e!301244 () Bool)

(declare-fun e!301245 () Bool)

(assert (=> b!516198 (= e!301244 (not e!301245))))

(declare-fun res!315911 () Bool)

(assert (=> b!516198 (=> res!315911 e!301245)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33074 0))(
  ( (array!33075 (arr!15905 (Array (_ BitVec 32) (_ BitVec 64))) (size!16270 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33074)

(declare-datatypes ((SeekEntryResult!4369 0))(
  ( (MissingZero!4369 (index!19664 (_ BitVec 32))) (Found!4369 (index!19665 (_ BitVec 32))) (Intermediate!4369 (undefined!5181 Bool) (index!19666 (_ BitVec 32)) (x!48631 (_ BitVec 32))) (Undefined!4369) (MissingVacant!4369 (index!19667 (_ BitVec 32))) )
))
(declare-fun lt!236199 () SeekEntryResult!4369)

(declare-fun lt!236196 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33074 (_ BitVec 32)) SeekEntryResult!4369)

(assert (=> b!516198 (= res!315911 (= lt!236199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236196 (select (store (arr!15905 a!3235) i!1204 k0!2280) j!176) (array!33075 (store (arr!15905 a!3235) i!1204 k0!2280) (size!16270 a!3235)) mask!3524)))))

(declare-fun lt!236197 () (_ BitVec 32))

(assert (=> b!516198 (= lt!236199 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236197 (select (arr!15905 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516198 (= lt!236196 (toIndex!0 (select (store (arr!15905 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!516198 (= lt!236197 (toIndex!0 (select (arr!15905 a!3235) j!176) mask!3524))))

(declare-fun e!301241 () Bool)

(assert (=> b!516198 e!301241))

(declare-fun res!315907 () Bool)

(assert (=> b!516198 (=> (not res!315907) (not e!301241))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33074 (_ BitVec 32)) Bool)

(assert (=> b!516198 (= res!315907 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15982 0))(
  ( (Unit!15983) )
))
(declare-fun lt!236200 () Unit!15982)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33074 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15982)

(assert (=> b!516198 (= lt!236200 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516199 () Bool)

(assert (=> b!516199 (= e!301245 true)))

(assert (=> b!516199 (and (bvslt (x!48631 lt!236199) #b01111111111111111111111111111110) (or (= (select (arr!15905 a!3235) (index!19666 lt!236199)) (select (arr!15905 a!3235) j!176)) (= (select (arr!15905 a!3235) (index!19666 lt!236199)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15905 a!3235) (index!19666 lt!236199)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516200 () Bool)

(declare-fun res!315914 () Bool)

(declare-fun e!301243 () Bool)

(assert (=> b!516200 (=> (not res!315914) (not e!301243))))

(declare-fun arrayContainsKey!0 (array!33074 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516200 (= res!315914 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516201 () Bool)

(declare-fun res!315909 () Bool)

(assert (=> b!516201 (=> (not res!315909) (not e!301243))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516201 (= res!315909 (validKeyInArray!0 (select (arr!15905 a!3235) j!176)))))

(declare-fun b!516202 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33074 (_ BitVec 32)) SeekEntryResult!4369)

(assert (=> b!516202 (= e!301241 (= (seekEntryOrOpen!0 (select (arr!15905 a!3235) j!176) a!3235 mask!3524) (Found!4369 j!176)))))

(declare-fun b!516203 () Bool)

(assert (=> b!516203 (= e!301243 e!301244)))

(declare-fun res!315905 () Bool)

(assert (=> b!516203 (=> (not res!315905) (not e!301244))))

(declare-fun lt!236198 () SeekEntryResult!4369)

(assert (=> b!516203 (= res!315905 (or (= lt!236198 (MissingZero!4369 i!1204)) (= lt!236198 (MissingVacant!4369 i!1204))))))

(assert (=> b!516203 (= lt!236198 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!516204 () Bool)

(declare-fun res!315912 () Bool)

(assert (=> b!516204 (=> (not res!315912) (not e!301244))))

(declare-datatypes ((List!10102 0))(
  ( (Nil!10099) (Cons!10098 (h!10996 (_ BitVec 64)) (t!16321 List!10102)) )
))
(declare-fun arrayNoDuplicates!0 (array!33074 (_ BitVec 32) List!10102) Bool)

(assert (=> b!516204 (= res!315912 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10099))))

(declare-fun res!315906 () Bool)

(assert (=> start!46752 (=> (not res!315906) (not e!301243))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46752 (= res!315906 (validMask!0 mask!3524))))

(assert (=> start!46752 e!301243))

(assert (=> start!46752 true))

(declare-fun array_inv!11788 (array!33074) Bool)

(assert (=> start!46752 (array_inv!11788 a!3235)))

(declare-fun b!516205 () Bool)

(declare-fun res!315913 () Bool)

(assert (=> b!516205 (=> res!315913 e!301245)))

(get-info :version)

(assert (=> b!516205 (= res!315913 (or (undefined!5181 lt!236199) (not ((_ is Intermediate!4369) lt!236199))))))

(declare-fun b!516206 () Bool)

(declare-fun res!315910 () Bool)

(assert (=> b!516206 (=> (not res!315910) (not e!301243))))

(assert (=> b!516206 (= res!315910 (validKeyInArray!0 k0!2280))))

(declare-fun b!516207 () Bool)

(declare-fun res!315904 () Bool)

(assert (=> b!516207 (=> (not res!315904) (not e!301243))))

(assert (=> b!516207 (= res!315904 (and (= (size!16270 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16270 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16270 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516208 () Bool)

(declare-fun res!315908 () Bool)

(assert (=> b!516208 (=> (not res!315908) (not e!301244))))

(assert (=> b!516208 (= res!315908 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(assert (= (and start!46752 res!315906) b!516207))

(assert (= (and b!516207 res!315904) b!516201))

(assert (= (and b!516201 res!315909) b!516206))

(assert (= (and b!516206 res!315910) b!516200))

(assert (= (and b!516200 res!315914) b!516203))

(assert (= (and b!516203 res!315905) b!516208))

(assert (= (and b!516208 res!315908) b!516204))

(assert (= (and b!516204 res!315912) b!516198))

(assert (= (and b!516198 res!315907) b!516202))

(assert (= (and b!516198 (not res!315911)) b!516205))

(assert (= (and b!516205 (not res!315913)) b!516199))

(declare-fun m!497209 () Bool)

(assert (=> b!516206 m!497209))

(declare-fun m!497211 () Bool)

(assert (=> b!516203 m!497211))

(declare-fun m!497213 () Bool)

(assert (=> b!516200 m!497213))

(declare-fun m!497215 () Bool)

(assert (=> start!46752 m!497215))

(declare-fun m!497217 () Bool)

(assert (=> start!46752 m!497217))

(declare-fun m!497219 () Bool)

(assert (=> b!516202 m!497219))

(assert (=> b!516202 m!497219))

(declare-fun m!497221 () Bool)

(assert (=> b!516202 m!497221))

(declare-fun m!497223 () Bool)

(assert (=> b!516199 m!497223))

(assert (=> b!516199 m!497219))

(assert (=> b!516198 m!497219))

(declare-fun m!497225 () Bool)

(assert (=> b!516198 m!497225))

(declare-fun m!497227 () Bool)

(assert (=> b!516198 m!497227))

(declare-fun m!497229 () Bool)

(assert (=> b!516198 m!497229))

(assert (=> b!516198 m!497219))

(declare-fun m!497231 () Bool)

(assert (=> b!516198 m!497231))

(assert (=> b!516198 m!497219))

(declare-fun m!497233 () Bool)

(assert (=> b!516198 m!497233))

(assert (=> b!516198 m!497229))

(declare-fun m!497235 () Bool)

(assert (=> b!516198 m!497235))

(assert (=> b!516198 m!497229))

(declare-fun m!497237 () Bool)

(assert (=> b!516198 m!497237))

(declare-fun m!497239 () Bool)

(assert (=> b!516198 m!497239))

(declare-fun m!497241 () Bool)

(assert (=> b!516208 m!497241))

(declare-fun m!497243 () Bool)

(assert (=> b!516204 m!497243))

(assert (=> b!516201 m!497219))

(assert (=> b!516201 m!497219))

(declare-fun m!497245 () Bool)

(assert (=> b!516201 m!497245))

(check-sat (not b!516198) (not b!516203) (not b!516204) (not b!516208) (not b!516201) (not b!516200) (not b!516202) (not b!516206) (not start!46752))
(check-sat)
