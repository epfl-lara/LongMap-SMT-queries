; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64460 () Bool)

(assert start!64460)

(declare-fun b!724824 () Bool)

(declare-fun res!486007 () Bool)

(declare-fun e!405976 () Bool)

(assert (=> b!724824 (=> (not res!486007) (not e!405976))))

(declare-datatypes ((array!40978 0))(
  ( (array!40979 (arr!19610 (Array (_ BitVec 32) (_ BitVec 64))) (size!20031 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40978)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!724824 (= res!486007 (and (= (size!20031 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20031 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20031 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!724825 () Bool)

(declare-fun res!486000 () Bool)

(assert (=> b!724825 (=> (not res!486000) (not e!405976))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!724825 (= res!486000 (validKeyInArray!0 k!2102))))

(declare-fun b!724826 () Bool)

(declare-fun res!486006 () Bool)

(declare-fun e!405972 () Bool)

(assert (=> b!724826 (=> (not res!486006) (not e!405972))))

(declare-datatypes ((List!13612 0))(
  ( (Nil!13609) (Cons!13608 (h!14665 (_ BitVec 64)) (t!19927 List!13612)) )
))
(declare-fun arrayNoDuplicates!0 (array!40978 (_ BitVec 32) List!13612) Bool)

(assert (=> b!724826 (= res!486006 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13609))))

(declare-fun b!724827 () Bool)

(declare-fun e!405977 () Bool)

(assert (=> b!724827 (= e!405972 e!405977)))

(declare-fun res!485999 () Bool)

(assert (=> b!724827 (=> (not res!485999) (not e!405977))))

(declare-datatypes ((SeekEntryResult!7210 0))(
  ( (MissingZero!7210 (index!31208 (_ BitVec 32))) (Found!7210 (index!31209 (_ BitVec 32))) (Intermediate!7210 (undefined!8022 Bool) (index!31210 (_ BitVec 32)) (x!62204 (_ BitVec 32))) (Undefined!7210) (MissingVacant!7210 (index!31211 (_ BitVec 32))) )
))
(declare-fun lt!321143 () SeekEntryResult!7210)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40978 (_ BitVec 32)) SeekEntryResult!7210)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!724827 (= res!485999 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19610 a!3186) j!159) mask!3328) (select (arr!19610 a!3186) j!159) a!3186 mask!3328) lt!321143))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!724827 (= lt!321143 (Intermediate!7210 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun res!486009 () Bool)

(assert (=> start!64460 (=> (not res!486009) (not e!405976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64460 (= res!486009 (validMask!0 mask!3328))))

(assert (=> start!64460 e!405976))

(assert (=> start!64460 true))

(declare-fun array_inv!15406 (array!40978) Bool)

(assert (=> start!64460 (array_inv!15406 a!3186)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!724828 () Bool)

(declare-fun e!405975 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!724828 (= e!405975 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19610 a!3186) j!159) a!3186 mask!3328) lt!321143))))

(declare-fun b!724829 () Bool)

(declare-fun res!486011 () Bool)

(assert (=> b!724829 (=> (not res!486011) (not e!405977))))

(assert (=> b!724829 (= res!486011 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19610 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!724830 () Bool)

(declare-fun e!405971 () Bool)

(assert (=> b!724830 (= e!405977 e!405971)))

(declare-fun res!486004 () Bool)

(assert (=> b!724830 (=> (not res!486004) (not e!405971))))

(declare-fun lt!321139 () (_ BitVec 64))

(declare-fun lt!321142 () array!40978)

(assert (=> b!724830 (= res!486004 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321139 mask!3328) lt!321139 lt!321142 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321139 lt!321142 mask!3328)))))

(assert (=> b!724830 (= lt!321139 (select (store (arr!19610 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!724830 (= lt!321142 (array!40979 (store (arr!19610 a!3186) i!1173 k!2102) (size!20031 a!3186)))))

(declare-fun b!724831 () Bool)

(declare-fun res!486008 () Bool)

(assert (=> b!724831 (=> (not res!486008) (not e!405977))))

(assert (=> b!724831 (= res!486008 e!405975)))

(declare-fun c!79786 () Bool)

(assert (=> b!724831 (= c!79786 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!724832 () Bool)

(declare-fun res!486010 () Bool)

(assert (=> b!724832 (=> (not res!486010) (not e!405976))))

(assert (=> b!724832 (= res!486010 (validKeyInArray!0 (select (arr!19610 a!3186) j!159)))))

(declare-fun b!724833 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40978 (_ BitVec 32)) SeekEntryResult!7210)

(assert (=> b!724833 (= e!405975 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19610 a!3186) j!159) a!3186 mask!3328) (Found!7210 j!159)))))

(declare-fun b!724834 () Bool)

(assert (=> b!724834 (= e!405971 (not true))))

(declare-fun e!405973 () Bool)

(assert (=> b!724834 e!405973))

(declare-fun res!486002 () Bool)

(assert (=> b!724834 (=> (not res!486002) (not e!405973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40978 (_ BitVec 32)) Bool)

(assert (=> b!724834 (= res!486002 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24738 0))(
  ( (Unit!24739) )
))
(declare-fun lt!321141 () Unit!24738)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!40978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24738)

(assert (=> b!724834 (= lt!321141 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!724835 () Bool)

(declare-fun res!485998 () Bool)

(assert (=> b!724835 (=> (not res!485998) (not e!405976))))

(declare-fun arrayContainsKey!0 (array!40978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!724835 (= res!485998 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!724836 () Bool)

(assert (=> b!724836 (= e!405976 e!405972)))

(declare-fun res!486001 () Bool)

(assert (=> b!724836 (=> (not res!486001) (not e!405972))))

(declare-fun lt!321140 () SeekEntryResult!7210)

(assert (=> b!724836 (= res!486001 (or (= lt!321140 (MissingZero!7210 i!1173)) (= lt!321140 (MissingVacant!7210 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40978 (_ BitVec 32)) SeekEntryResult!7210)

(assert (=> b!724836 (= lt!321140 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!724837 () Bool)

(declare-fun res!486003 () Bool)

(assert (=> b!724837 (=> (not res!486003) (not e!405972))))

(assert (=> b!724837 (= res!486003 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20031 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20031 a!3186))))))

(declare-fun b!724838 () Bool)

(declare-fun res!486005 () Bool)

(assert (=> b!724838 (=> (not res!486005) (not e!405972))))

(assert (=> b!724838 (= res!486005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!724839 () Bool)

(assert (=> b!724839 (= e!405973 (= (seekEntryOrOpen!0 (select (arr!19610 a!3186) j!159) a!3186 mask!3328) (Found!7210 j!159)))))

(assert (= (and start!64460 res!486009) b!724824))

(assert (= (and b!724824 res!486007) b!724832))

(assert (= (and b!724832 res!486010) b!724825))

(assert (= (and b!724825 res!486000) b!724835))

(assert (= (and b!724835 res!485998) b!724836))

(assert (= (and b!724836 res!486001) b!724838))

(assert (= (and b!724838 res!486005) b!724826))

(assert (= (and b!724826 res!486006) b!724837))

(assert (= (and b!724837 res!486003) b!724827))

(assert (= (and b!724827 res!485999) b!724829))

(assert (= (and b!724829 res!486011) b!724831))

(assert (= (and b!724831 c!79786) b!724828))

(assert (= (and b!724831 (not c!79786)) b!724833))

(assert (= (and b!724831 res!486008) b!724830))

(assert (= (and b!724830 res!486004) b!724834))

(assert (= (and b!724834 res!486002) b!724839))

(declare-fun m!679043 () Bool)

(assert (=> b!724838 m!679043))

(declare-fun m!679045 () Bool)

(assert (=> b!724827 m!679045))

(assert (=> b!724827 m!679045))

(declare-fun m!679047 () Bool)

(assert (=> b!724827 m!679047))

(assert (=> b!724827 m!679047))

(assert (=> b!724827 m!679045))

(declare-fun m!679049 () Bool)

(assert (=> b!724827 m!679049))

(declare-fun m!679051 () Bool)

(assert (=> start!64460 m!679051))

(declare-fun m!679053 () Bool)

(assert (=> start!64460 m!679053))

(declare-fun m!679055 () Bool)

(assert (=> b!724835 m!679055))

(declare-fun m!679057 () Bool)

(assert (=> b!724830 m!679057))

(declare-fun m!679059 () Bool)

(assert (=> b!724830 m!679059))

(declare-fun m!679061 () Bool)

(assert (=> b!724830 m!679061))

(assert (=> b!724830 m!679057))

(declare-fun m!679063 () Bool)

(assert (=> b!724830 m!679063))

(declare-fun m!679065 () Bool)

(assert (=> b!724830 m!679065))

(declare-fun m!679067 () Bool)

(assert (=> b!724836 m!679067))

(assert (=> b!724832 m!679045))

(assert (=> b!724832 m!679045))

(declare-fun m!679069 () Bool)

(assert (=> b!724832 m!679069))

(declare-fun m!679071 () Bool)

(assert (=> b!724825 m!679071))

(declare-fun m!679073 () Bool)

(assert (=> b!724826 m!679073))

(declare-fun m!679075 () Bool)

(assert (=> b!724829 m!679075))

(assert (=> b!724839 m!679045))

(assert (=> b!724839 m!679045))

(declare-fun m!679077 () Bool)

(assert (=> b!724839 m!679077))

(declare-fun m!679079 () Bool)

(assert (=> b!724834 m!679079))

(declare-fun m!679081 () Bool)

(assert (=> b!724834 m!679081))

(assert (=> b!724828 m!679045))

(assert (=> b!724828 m!679045))

(declare-fun m!679083 () Bool)

(assert (=> b!724828 m!679083))

(assert (=> b!724833 m!679045))

(assert (=> b!724833 m!679045))

(declare-fun m!679085 () Bool)

(assert (=> b!724833 m!679085))

(push 1)

