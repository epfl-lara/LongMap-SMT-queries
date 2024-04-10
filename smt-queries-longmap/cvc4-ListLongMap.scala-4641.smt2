; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64550 () Bool)

(assert start!64550)

(declare-fun b!727135 () Bool)

(declare-fun e!407069 () Bool)

(declare-fun e!407075 () Bool)

(assert (=> b!727135 (= e!407069 e!407075)))

(declare-fun res!488050 () Bool)

(assert (=> b!727135 (=> (not res!488050) (not e!407075))))

(declare-datatypes ((array!41068 0))(
  ( (array!41069 (arr!19655 (Array (_ BitVec 32) (_ BitVec 64))) (size!20076 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41068)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7255 0))(
  ( (MissingZero!7255 (index!31388 (_ BitVec 32))) (Found!7255 (index!31389 (_ BitVec 32))) (Intermediate!7255 (undefined!8067 Bool) (index!31390 (_ BitVec 32)) (x!62369 (_ BitVec 32))) (Undefined!7255) (MissingVacant!7255 (index!31391 (_ BitVec 32))) )
))
(declare-fun lt!322050 () SeekEntryResult!7255)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41068 (_ BitVec 32)) SeekEntryResult!7255)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727135 (= res!488050 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19655 a!3186) j!159) mask!3328) (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!322050))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!727135 (= lt!322050 (Intermediate!7255 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun e!407071 () Bool)

(declare-fun b!727136 () Bool)

(declare-fun lt!322045 () SeekEntryResult!7255)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41068 (_ BitVec 32)) SeekEntryResult!7255)

(assert (=> b!727136 (= e!407071 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!322045))))

(declare-fun b!727137 () Bool)

(declare-fun res!488043 () Bool)

(declare-fun e!407068 () Bool)

(assert (=> b!727137 (=> (not res!488043) (not e!407068))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!727137 (= res!488043 (and (= (size!20076 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20076 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20076 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!727138 () Bool)

(declare-fun res!488042 () Bool)

(assert (=> b!727138 (=> (not res!488042) (not e!407069))))

(declare-datatypes ((List!13657 0))(
  ( (Nil!13654) (Cons!13653 (h!14710 (_ BitVec 64)) (t!19972 List!13657)) )
))
(declare-fun arrayNoDuplicates!0 (array!41068 (_ BitVec 32) List!13657) Bool)

(assert (=> b!727138 (= res!488042 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13654))))

(declare-fun b!727139 () Bool)

(declare-fun e!407074 () Bool)

(assert (=> b!727139 (= e!407074 e!407071)))

(declare-fun res!488041 () Bool)

(assert (=> b!727139 (=> (not res!488041) (not e!407071))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41068 (_ BitVec 32)) SeekEntryResult!7255)

(assert (=> b!727139 (= res!488041 (= (seekEntryOrOpen!0 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!322045))))

(assert (=> b!727139 (= lt!322045 (Found!7255 j!159))))

(declare-fun b!727140 () Bool)

(declare-fun res!488044 () Bool)

(assert (=> b!727140 (=> (not res!488044) (not e!407068))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!727140 (= res!488044 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!727141 () Bool)

(assert (=> b!727141 (= e!407068 e!407069)))

(declare-fun res!488045 () Bool)

(assert (=> b!727141 (=> (not res!488045) (not e!407069))))

(declare-fun lt!322046 () SeekEntryResult!7255)

(assert (=> b!727141 (= res!488045 (or (= lt!322046 (MissingZero!7255 i!1173)) (= lt!322046 (MissingVacant!7255 i!1173))))))

(assert (=> b!727141 (= lt!322046 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!727142 () Bool)

(declare-fun res!488051 () Bool)

(assert (=> b!727142 (=> (not res!488051) (not e!407068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!727142 (= res!488051 (validKeyInArray!0 k!2102))))

(declare-fun e!407070 () Bool)

(declare-fun b!727144 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!727144 (= e!407070 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) lt!322050))))

(declare-fun b!727145 () Bool)

(declare-fun res!488049 () Bool)

(assert (=> b!727145 (=> (not res!488049) (not e!407068))))

(assert (=> b!727145 (= res!488049 (validKeyInArray!0 (select (arr!19655 a!3186) j!159)))))

(declare-fun b!727146 () Bool)

(declare-fun e!407072 () Bool)

(assert (=> b!727146 (= e!407075 e!407072)))

(declare-fun res!488052 () Bool)

(assert (=> b!727146 (=> (not res!488052) (not e!407072))))

(declare-fun lt!322052 () SeekEntryResult!7255)

(declare-fun lt!322047 () SeekEntryResult!7255)

(assert (=> b!727146 (= res!488052 (= lt!322052 lt!322047))))

(declare-fun lt!322044 () array!41068)

(declare-fun lt!322049 () (_ BitVec 64))

(assert (=> b!727146 (= lt!322047 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322049 lt!322044 mask!3328))))

(assert (=> b!727146 (= lt!322052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322049 mask!3328) lt!322049 lt!322044 mask!3328))))

(assert (=> b!727146 (= lt!322049 (select (store (arr!19655 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!727146 (= lt!322044 (array!41069 (store (arr!19655 a!3186) i!1173 k!2102) (size!20076 a!3186)))))

(declare-fun b!727147 () Bool)

(declare-fun res!488046 () Bool)

(assert (=> b!727147 (=> (not res!488046) (not e!407075))))

(assert (=> b!727147 (= res!488046 e!407070)))

(declare-fun c!79921 () Bool)

(assert (=> b!727147 (= c!79921 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!727148 () Bool)

(declare-fun e!407073 () Bool)

(assert (=> b!727148 (= e!407073 true)))

(declare-fun lt!322048 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!727148 (= lt!322048 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!727149 () Bool)

(declare-fun res!488040 () Bool)

(assert (=> b!727149 (=> (not res!488040) (not e!407075))))

(assert (=> b!727149 (= res!488040 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19655 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!727150 () Bool)

(assert (=> b!727150 (= e!407072 (not e!407073))))

(declare-fun res!488054 () Bool)

(assert (=> b!727150 (=> res!488054 e!407073)))

(assert (=> b!727150 (= res!488054 (or (not (is-Intermediate!7255 lt!322047)) (bvsge x!1131 (x!62369 lt!322047))))))

(assert (=> b!727150 e!407074))

(declare-fun res!488047 () Bool)

(assert (=> b!727150 (=> (not res!488047) (not e!407074))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41068 (_ BitVec 32)) Bool)

(assert (=> b!727150 (= res!488047 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24828 0))(
  ( (Unit!24829) )
))
(declare-fun lt!322051 () Unit!24828)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41068 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24828)

(assert (=> b!727150 (= lt!322051 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!727143 () Bool)

(declare-fun res!488053 () Bool)

(assert (=> b!727143 (=> (not res!488053) (not e!407069))))

(assert (=> b!727143 (= res!488053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!488039 () Bool)

(assert (=> start!64550 (=> (not res!488039) (not e!407068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64550 (= res!488039 (validMask!0 mask!3328))))

(assert (=> start!64550 e!407068))

(assert (=> start!64550 true))

(declare-fun array_inv!15451 (array!41068) Bool)

(assert (=> start!64550 (array_inv!15451 a!3186)))

(declare-fun b!727151 () Bool)

(declare-fun res!488048 () Bool)

(assert (=> b!727151 (=> (not res!488048) (not e!407069))))

(assert (=> b!727151 (= res!488048 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20076 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20076 a!3186))))))

(declare-fun b!727152 () Bool)

(assert (=> b!727152 (= e!407070 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19655 a!3186) j!159) a!3186 mask!3328) (Found!7255 j!159)))))

(assert (= (and start!64550 res!488039) b!727137))

(assert (= (and b!727137 res!488043) b!727145))

(assert (= (and b!727145 res!488049) b!727142))

(assert (= (and b!727142 res!488051) b!727140))

(assert (= (and b!727140 res!488044) b!727141))

(assert (= (and b!727141 res!488045) b!727143))

(assert (= (and b!727143 res!488053) b!727138))

(assert (= (and b!727138 res!488042) b!727151))

(assert (= (and b!727151 res!488048) b!727135))

(assert (= (and b!727135 res!488050) b!727149))

(assert (= (and b!727149 res!488040) b!727147))

(assert (= (and b!727147 c!79921) b!727144))

(assert (= (and b!727147 (not c!79921)) b!727152))

(assert (= (and b!727147 res!488046) b!727146))

(assert (= (and b!727146 res!488052) b!727150))

(assert (= (and b!727150 res!488047) b!727139))

(assert (= (and b!727139 res!488041) b!727136))

(assert (= (and b!727150 (not res!488054)) b!727148))

(declare-fun m!681121 () Bool)

(assert (=> b!727148 m!681121))

(declare-fun m!681123 () Bool)

(assert (=> start!64550 m!681123))

(declare-fun m!681125 () Bool)

(assert (=> start!64550 m!681125))

(declare-fun m!681127 () Bool)

(assert (=> b!727140 m!681127))

(declare-fun m!681129 () Bool)

(assert (=> b!727152 m!681129))

(assert (=> b!727152 m!681129))

(declare-fun m!681131 () Bool)

(assert (=> b!727152 m!681131))

(declare-fun m!681133 () Bool)

(assert (=> b!727146 m!681133))

(declare-fun m!681135 () Bool)

(assert (=> b!727146 m!681135))

(declare-fun m!681137 () Bool)

(assert (=> b!727146 m!681137))

(declare-fun m!681139 () Bool)

(assert (=> b!727146 m!681139))

(declare-fun m!681141 () Bool)

(assert (=> b!727146 m!681141))

(assert (=> b!727146 m!681133))

(declare-fun m!681143 () Bool)

(assert (=> b!727141 m!681143))

(declare-fun m!681145 () Bool)

(assert (=> b!727150 m!681145))

(declare-fun m!681147 () Bool)

(assert (=> b!727150 m!681147))

(declare-fun m!681149 () Bool)

(assert (=> b!727142 m!681149))

(assert (=> b!727144 m!681129))

(assert (=> b!727144 m!681129))

(declare-fun m!681151 () Bool)

(assert (=> b!727144 m!681151))

(declare-fun m!681153 () Bool)

(assert (=> b!727138 m!681153))

(declare-fun m!681155 () Bool)

(assert (=> b!727143 m!681155))

(assert (=> b!727135 m!681129))

(assert (=> b!727135 m!681129))

(declare-fun m!681157 () Bool)

(assert (=> b!727135 m!681157))

(assert (=> b!727135 m!681157))

(assert (=> b!727135 m!681129))

(declare-fun m!681159 () Bool)

(assert (=> b!727135 m!681159))

(declare-fun m!681161 () Bool)

(assert (=> b!727149 m!681161))

(assert (=> b!727145 m!681129))

(assert (=> b!727145 m!681129))

(declare-fun m!681163 () Bool)

(assert (=> b!727145 m!681163))

(assert (=> b!727139 m!681129))

(assert (=> b!727139 m!681129))

(declare-fun m!681165 () Bool)

(assert (=> b!727139 m!681165))

(assert (=> b!727136 m!681129))

(assert (=> b!727136 m!681129))

(declare-fun m!681167 () Bool)

(assert (=> b!727136 m!681167))

(push 1)

