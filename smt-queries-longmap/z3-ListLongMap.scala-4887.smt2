; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67346 () Bool)

(assert start!67346)

(declare-fun b!779086 () Bool)

(declare-fun res!527202 () Bool)

(declare-fun e!433401 () Bool)

(assert (=> b!779086 (=> (not res!527202) (not e!433401))))

(declare-datatypes ((array!42594 0))(
  ( (array!42595 (arr!20390 (Array (_ BitVec 32) (_ BitVec 64))) (size!20811 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42594)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!779086 (= res!527202 (and (= (size!20811 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20811 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20811 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!433402 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!779087 () Bool)

(declare-datatypes ((SeekEntryResult!7987 0))(
  ( (MissingZero!7987 (index!34316 (_ BitVec 32))) (Found!7987 (index!34317 (_ BitVec 32))) (Intermediate!7987 (undefined!8799 Bool) (index!34318 (_ BitVec 32)) (x!65271 (_ BitVec 32))) (Undefined!7987) (MissingVacant!7987 (index!34319 (_ BitVec 32))) )
))
(declare-fun lt!347006 () SeekEntryResult!7987)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42594 (_ BitVec 32)) SeekEntryResult!7987)

(assert (=> b!779087 (= e!433402 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20390 a!3186) j!159) a!3186 mask!3328) lt!347006))))

(declare-fun b!779088 () Bool)

(declare-fun res!527197 () Bool)

(assert (=> b!779088 (=> (not res!527197) (not e!433401))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!779088 (= res!527197 (validKeyInArray!0 (select (arr!20390 a!3186) j!159)))))

(declare-fun b!779089 () Bool)

(declare-fun e!433407 () Bool)

(declare-fun e!433405 () Bool)

(assert (=> b!779089 (= e!433407 (not e!433405))))

(declare-fun res!527201 () Bool)

(assert (=> b!779089 (=> res!527201 e!433405)))

(declare-fun lt!347000 () SeekEntryResult!7987)

(get-info :version)

(assert (=> b!779089 (= res!527201 (or (not ((_ is Intermediate!7987) lt!347000)) (bvslt x!1131 (x!65271 lt!347000)) (not (= x!1131 (x!65271 lt!347000))) (not (= index!1321 (index!34318 lt!347000)))))))

(declare-fun e!433406 () Bool)

(assert (=> b!779089 e!433406))

(declare-fun res!527198 () Bool)

(assert (=> b!779089 (=> (not res!527198) (not e!433406))))

(declare-fun lt!347005 () SeekEntryResult!7987)

(declare-fun lt!347009 () SeekEntryResult!7987)

(assert (=> b!779089 (= res!527198 (= lt!347005 lt!347009))))

(assert (=> b!779089 (= lt!347009 (Found!7987 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42594 (_ BitVec 32)) SeekEntryResult!7987)

(assert (=> b!779089 (= lt!347005 (seekEntryOrOpen!0 (select (arr!20390 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42594 (_ BitVec 32)) Bool)

(assert (=> b!779089 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26840 0))(
  ( (Unit!26841) )
))
(declare-fun lt!347002 () Unit!26840)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42594 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26840)

(assert (=> b!779089 (= lt!347002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!779090 () Bool)

(declare-fun e!433403 () Bool)

(assert (=> b!779090 (= e!433401 e!433403)))

(declare-fun res!527204 () Bool)

(assert (=> b!779090 (=> (not res!527204) (not e!433403))))

(declare-fun lt!347008 () SeekEntryResult!7987)

(assert (=> b!779090 (= res!527204 (or (= lt!347008 (MissingZero!7987 i!1173)) (= lt!347008 (MissingVacant!7987 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!779090 (= lt!347008 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!779091 () Bool)

(declare-fun res!527196 () Bool)

(assert (=> b!779091 (=> (not res!527196) (not e!433403))))

(assert (=> b!779091 (= res!527196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!779092 () Bool)

(declare-fun res!527199 () Bool)

(declare-fun e!433404 () Bool)

(assert (=> b!779092 (=> (not res!527199) (not e!433404))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!779092 (= res!527199 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20390 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!779093 () Bool)

(declare-fun res!527207 () Bool)

(assert (=> b!779093 (=> (not res!527207) (not e!433404))))

(assert (=> b!779093 (= res!527207 e!433402)))

(declare-fun c!86349 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!779093 (= c!86349 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!779095 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42594 (_ BitVec 32)) SeekEntryResult!7987)

(assert (=> b!779095 (= e!433406 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20390 a!3186) j!159) a!3186 mask!3328) lt!347009))))

(declare-fun b!779096 () Bool)

(assert (=> b!779096 (= e!433402 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20390 a!3186) j!159) a!3186 mask!3328) (Found!7987 j!159)))))

(declare-fun b!779097 () Bool)

(declare-fun res!527200 () Bool)

(assert (=> b!779097 (=> (not res!527200) (not e!433401))))

(declare-fun arrayContainsKey!0 (array!42594 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!779097 (= res!527200 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!779098 () Bool)

(declare-fun res!527205 () Bool)

(assert (=> b!779098 (=> (not res!527205) (not e!433403))))

(assert (=> b!779098 (= res!527205 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20811 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20811 a!3186))))))

(declare-fun res!527194 () Bool)

(assert (=> start!67346 (=> (not res!527194) (not e!433401))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67346 (= res!527194 (validMask!0 mask!3328))))

(assert (=> start!67346 e!433401))

(assert (=> start!67346 true))

(declare-fun array_inv!16273 (array!42594) Bool)

(assert (=> start!67346 (array_inv!16273 a!3186)))

(declare-fun b!779094 () Bool)

(declare-fun res!527206 () Bool)

(assert (=> b!779094 (=> (not res!527206) (not e!433401))))

(assert (=> b!779094 (= res!527206 (validKeyInArray!0 k0!2102))))

(declare-fun b!779099 () Bool)

(declare-fun res!527203 () Bool)

(assert (=> b!779099 (=> (not res!527203) (not e!433403))))

(declare-datatypes ((List!14431 0))(
  ( (Nil!14428) (Cons!14427 (h!15541 (_ BitVec 64)) (t!20737 List!14431)) )
))
(declare-fun arrayNoDuplicates!0 (array!42594 (_ BitVec 32) List!14431) Bool)

(assert (=> b!779099 (= res!527203 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14428))))

(declare-fun lt!347003 () SeekEntryResult!7987)

(declare-fun lt!347007 () (_ BitVec 64))

(declare-fun b!779100 () Bool)

(assert (=> b!779100 (= e!433405 (or (not (= lt!347003 lt!347009)) (= (select (store (arr!20390 a!3186) i!1173 k0!2102) index!1321) lt!347007) (not (= (select (store (arr!20390 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!347005 lt!347003)))))

(assert (=> b!779100 (= lt!347003 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20390 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!779101 () Bool)

(assert (=> b!779101 (= e!433404 e!433407)))

(declare-fun res!527195 () Bool)

(assert (=> b!779101 (=> (not res!527195) (not e!433407))))

(declare-fun lt!347004 () SeekEntryResult!7987)

(assert (=> b!779101 (= res!527195 (= lt!347004 lt!347000))))

(declare-fun lt!347001 () array!42594)

(assert (=> b!779101 (= lt!347000 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!347007 lt!347001 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!779101 (= lt!347004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!347007 mask!3328) lt!347007 lt!347001 mask!3328))))

(assert (=> b!779101 (= lt!347007 (select (store (arr!20390 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!779101 (= lt!347001 (array!42595 (store (arr!20390 a!3186) i!1173 k0!2102) (size!20811 a!3186)))))

(declare-fun b!779102 () Bool)

(assert (=> b!779102 (= e!433403 e!433404)))

(declare-fun res!527208 () Bool)

(assert (=> b!779102 (=> (not res!527208) (not e!433404))))

(assert (=> b!779102 (= res!527208 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20390 a!3186) j!159) mask!3328) (select (arr!20390 a!3186) j!159) a!3186 mask!3328) lt!347006))))

(assert (=> b!779102 (= lt!347006 (Intermediate!7987 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67346 res!527194) b!779086))

(assert (= (and b!779086 res!527202) b!779088))

(assert (= (and b!779088 res!527197) b!779094))

(assert (= (and b!779094 res!527206) b!779097))

(assert (= (and b!779097 res!527200) b!779090))

(assert (= (and b!779090 res!527204) b!779091))

(assert (= (and b!779091 res!527196) b!779099))

(assert (= (and b!779099 res!527203) b!779098))

(assert (= (and b!779098 res!527205) b!779102))

(assert (= (and b!779102 res!527208) b!779092))

(assert (= (and b!779092 res!527199) b!779093))

(assert (= (and b!779093 c!86349) b!779087))

(assert (= (and b!779093 (not c!86349)) b!779096))

(assert (= (and b!779093 res!527207) b!779101))

(assert (= (and b!779101 res!527195) b!779089))

(assert (= (and b!779089 res!527198) b!779095))

(assert (= (and b!779089 (not res!527201)) b!779100))

(declare-fun m!722097 () Bool)

(assert (=> b!779087 m!722097))

(assert (=> b!779087 m!722097))

(declare-fun m!722099 () Bool)

(assert (=> b!779087 m!722099))

(assert (=> b!779095 m!722097))

(assert (=> b!779095 m!722097))

(declare-fun m!722101 () Bool)

(assert (=> b!779095 m!722101))

(declare-fun m!722103 () Bool)

(assert (=> b!779099 m!722103))

(assert (=> b!779088 m!722097))

(assert (=> b!779088 m!722097))

(declare-fun m!722105 () Bool)

(assert (=> b!779088 m!722105))

(declare-fun m!722107 () Bool)

(assert (=> b!779097 m!722107))

(declare-fun m!722109 () Bool)

(assert (=> b!779090 m!722109))

(assert (=> b!779096 m!722097))

(assert (=> b!779096 m!722097))

(declare-fun m!722111 () Bool)

(assert (=> b!779096 m!722111))

(declare-fun m!722113 () Bool)

(assert (=> b!779101 m!722113))

(declare-fun m!722115 () Bool)

(assert (=> b!779101 m!722115))

(assert (=> b!779101 m!722113))

(declare-fun m!722117 () Bool)

(assert (=> b!779101 m!722117))

(declare-fun m!722119 () Bool)

(assert (=> b!779101 m!722119))

(declare-fun m!722121 () Bool)

(assert (=> b!779101 m!722121))

(declare-fun m!722123 () Bool)

(assert (=> b!779092 m!722123))

(declare-fun m!722125 () Bool)

(assert (=> b!779091 m!722125))

(assert (=> b!779102 m!722097))

(assert (=> b!779102 m!722097))

(declare-fun m!722127 () Bool)

(assert (=> b!779102 m!722127))

(assert (=> b!779102 m!722127))

(assert (=> b!779102 m!722097))

(declare-fun m!722129 () Bool)

(assert (=> b!779102 m!722129))

(declare-fun m!722131 () Bool)

(assert (=> b!779094 m!722131))

(declare-fun m!722133 () Bool)

(assert (=> start!67346 m!722133))

(declare-fun m!722135 () Bool)

(assert (=> start!67346 m!722135))

(assert (=> b!779089 m!722097))

(assert (=> b!779089 m!722097))

(declare-fun m!722137 () Bool)

(assert (=> b!779089 m!722137))

(declare-fun m!722139 () Bool)

(assert (=> b!779089 m!722139))

(declare-fun m!722141 () Bool)

(assert (=> b!779089 m!722141))

(assert (=> b!779100 m!722115))

(declare-fun m!722143 () Bool)

(assert (=> b!779100 m!722143))

(assert (=> b!779100 m!722097))

(assert (=> b!779100 m!722097))

(assert (=> b!779100 m!722111))

(check-sat (not b!779088) (not b!779095) (not b!779094) (not b!779102) (not b!779089) (not b!779099) (not b!779096) (not b!779101) (not b!779087) (not start!67346) (not b!779091) (not b!779097) (not b!779100) (not b!779090))
(check-sat)
