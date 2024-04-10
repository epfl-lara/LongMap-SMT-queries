; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32432 () Bool)

(assert start!32432)

(declare-fun b!323972 () Bool)

(declare-fun res!177317 () Bool)

(declare-fun e!200136 () Bool)

(assert (=> b!323972 (=> (not res!177317) (not e!200136))))

(declare-datatypes ((array!16571 0))(
  ( (array!16572 (arr!7843 (Array (_ BitVec 32) (_ BitVec 64))) (size!8195 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16571)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16571 (_ BitVec 32)) Bool)

(assert (=> b!323972 (= res!177317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!177318 () Bool)

(assert (=> start!32432 (=> (not res!177318) (not e!200136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32432 (= res!177318 (validMask!0 mask!3777))))

(assert (=> start!32432 e!200136))

(declare-fun array_inv!5806 (array!16571) Bool)

(assert (=> start!32432 (array_inv!5806 a!3305)))

(assert (=> start!32432 true))

(declare-fun b!323973 () Bool)

(declare-datatypes ((Unit!10081 0))(
  ( (Unit!10082) )
))
(declare-fun e!200134 () Unit!10081)

(declare-fun Unit!10083 () Unit!10081)

(assert (=> b!323973 (= e!200134 Unit!10083)))

(assert (=> b!323973 false))

(declare-fun b!323974 () Bool)

(declare-fun e!200133 () Unit!10081)

(declare-fun e!200132 () Unit!10081)

(assert (=> b!323974 (= e!200133 e!200132)))

(declare-fun c!50959 () Bool)

(declare-fun index!1840 () (_ BitVec 32))

(assert (=> b!323974 (= c!50959 (or (= (select (arr!7843 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7843 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323975 () Bool)

(assert (=> b!323975 false))

(declare-fun lt!156738 () Unit!10081)

(assert (=> b!323975 (= lt!156738 e!200134)))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun c!50961 () Bool)

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2974 0))(
  ( (MissingZero!2974 (index!14072 (_ BitVec 32))) (Found!2974 (index!14073 (_ BitVec 32))) (Intermediate!2974 (undefined!3786 Bool) (index!14074 (_ BitVec 32)) (x!32322 (_ BitVec 32))) (Undefined!2974) (MissingVacant!2974 (index!14075 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16571 (_ BitVec 32)) SeekEntryResult!2974)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323975 (= c!50961 (is-Intermediate!2974 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun Unit!10084 () Unit!10081)

(assert (=> b!323975 (= e!200132 Unit!10084)))

(declare-fun b!323976 () Bool)

(assert (=> b!323976 false))

(declare-fun Unit!10085 () Unit!10081)

(assert (=> b!323976 (= e!200132 Unit!10085)))

(declare-fun b!323977 () Bool)

(declare-fun e!200137 () Bool)

(assert (=> b!323977 (= e!200137 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323977 (= index!1840 resIndex!58)))

(declare-fun lt!156736 () Unit!10081)

(assert (=> b!323977 (= lt!156736 e!200133)))

(declare-fun c!50960 () Bool)

(assert (=> b!323977 (= c!50960 (not (= resIndex!58 index!1840)))))

(declare-fun b!323978 () Bool)

(declare-fun res!177314 () Bool)

(assert (=> b!323978 (=> (not res!177314) (not e!200137))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323978 (= res!177314 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7843 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323979 () Bool)

(declare-fun res!177312 () Bool)

(assert (=> b!323979 (=> (not res!177312) (not e!200136))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16571 (_ BitVec 32)) SeekEntryResult!2974)

(assert (=> b!323979 (= res!177312 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2974 i!1250)))))

(declare-fun b!323980 () Bool)

(declare-fun Unit!10086 () Unit!10081)

(assert (=> b!323980 (= e!200134 Unit!10086)))

(declare-fun b!323981 () Bool)

(declare-fun res!177313 () Bool)

(assert (=> b!323981 (=> (not res!177313) (not e!200137))))

(declare-fun lt!156737 () SeekEntryResult!2974)

(assert (=> b!323981 (= res!177313 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156737))))

(declare-fun b!323982 () Bool)

(declare-fun res!177316 () Bool)

(assert (=> b!323982 (=> (not res!177316) (not e!200136))))

(declare-fun arrayContainsKey!0 (array!16571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323982 (= res!177316 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323983 () Bool)

(declare-fun Unit!10087 () Unit!10081)

(assert (=> b!323983 (= e!200133 Unit!10087)))

(declare-fun b!323984 () Bool)

(assert (=> b!323984 (= e!200136 e!200137)))

(declare-fun res!177310 () Bool)

(assert (=> b!323984 (=> (not res!177310) (not e!200137))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323984 (= res!177310 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156737))))

(assert (=> b!323984 (= lt!156737 (Intermediate!2974 false resIndex!58 resX!58))))

(declare-fun b!323985 () Bool)

(declare-fun res!177309 () Bool)

(assert (=> b!323985 (=> (not res!177309) (not e!200137))))

(assert (=> b!323985 (= res!177309 (and (= (select (arr!7843 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8195 a!3305))))))

(declare-fun b!323986 () Bool)

(declare-fun res!177315 () Bool)

(assert (=> b!323986 (=> (not res!177315) (not e!200136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323986 (= res!177315 (validKeyInArray!0 k!2497))))

(declare-fun b!323987 () Bool)

(declare-fun res!177311 () Bool)

(assert (=> b!323987 (=> (not res!177311) (not e!200136))))

(assert (=> b!323987 (= res!177311 (and (= (size!8195 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8195 a!3305))))))

(assert (= (and start!32432 res!177318) b!323987))

(assert (= (and b!323987 res!177311) b!323986))

(assert (= (and b!323986 res!177315) b!323982))

(assert (= (and b!323982 res!177316) b!323979))

(assert (= (and b!323979 res!177312) b!323972))

(assert (= (and b!323972 res!177317) b!323984))

(assert (= (and b!323984 res!177310) b!323985))

(assert (= (and b!323985 res!177309) b!323981))

(assert (= (and b!323981 res!177313) b!323978))

(assert (= (and b!323978 res!177314) b!323977))

(assert (= (and b!323977 c!50960) b!323974))

(assert (= (and b!323977 (not c!50960)) b!323983))

(assert (= (and b!323974 c!50959) b!323976))

(assert (= (and b!323974 (not c!50959)) b!323975))

(assert (= (and b!323975 c!50961) b!323980))

(assert (= (and b!323975 (not c!50961)) b!323973))

(declare-fun m!331107 () Bool)

(assert (=> b!323975 m!331107))

(assert (=> b!323975 m!331107))

(declare-fun m!331109 () Bool)

(assert (=> b!323975 m!331109))

(declare-fun m!331111 () Bool)

(assert (=> start!32432 m!331111))

(declare-fun m!331113 () Bool)

(assert (=> start!32432 m!331113))

(declare-fun m!331115 () Bool)

(assert (=> b!323974 m!331115))

(declare-fun m!331117 () Bool)

(assert (=> b!323982 m!331117))

(declare-fun m!331119 () Bool)

(assert (=> b!323985 m!331119))

(declare-fun m!331121 () Bool)

(assert (=> b!323986 m!331121))

(declare-fun m!331123 () Bool)

(assert (=> b!323981 m!331123))

(declare-fun m!331125 () Bool)

(assert (=> b!323984 m!331125))

(assert (=> b!323984 m!331125))

(declare-fun m!331127 () Bool)

(assert (=> b!323984 m!331127))

(declare-fun m!331129 () Bool)

(assert (=> b!323972 m!331129))

(assert (=> b!323978 m!331115))

(declare-fun m!331131 () Bool)

(assert (=> b!323979 m!331131))

(push 1)

