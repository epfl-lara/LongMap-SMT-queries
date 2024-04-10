; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65660 () Bool)

(assert start!65660)

(declare-fun e!419582 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41833 0))(
  ( (array!41834 (arr!20030 (Array (_ BitVec 32) (_ BitVec 64))) (size!20451 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41833)

(declare-fun b!752183 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7630 0))(
  ( (MissingZero!7630 (index!32888 (_ BitVec 32))) (Found!7630 (index!32889 (_ BitVec 32))) (Intermediate!7630 (undefined!8442 Bool) (index!32890 (_ BitVec 32)) (x!63804 (_ BitVec 32))) (Undefined!7630) (MissingVacant!7630 (index!32891 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41833 (_ BitVec 32)) SeekEntryResult!7630)

(assert (=> b!752183 (= e!419582 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20030 a!3186) j!159) a!3186 mask!3328) (Found!7630 j!159)))))

(declare-fun b!752184 () Bool)

(declare-fun res!507938 () Bool)

(declare-fun e!419584 () Bool)

(assert (=> b!752184 (=> (not res!507938) (not e!419584))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!752184 (= res!507938 (validKeyInArray!0 k!2102))))

(declare-fun b!752185 () Bool)

(declare-fun res!507934 () Bool)

(assert (=> b!752185 (=> (not res!507934) (not e!419584))))

(declare-fun arrayContainsKey!0 (array!41833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!752185 (= res!507934 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!752186 () Bool)

(declare-fun e!419576 () Bool)

(assert (=> b!752186 (= e!419584 e!419576)))

(declare-fun res!507942 () Bool)

(assert (=> b!752186 (=> (not res!507942) (not e!419576))))

(declare-fun lt!334573 () SeekEntryResult!7630)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!752186 (= res!507942 (or (= lt!334573 (MissingZero!7630 i!1173)) (= lt!334573 (MissingVacant!7630 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41833 (_ BitVec 32)) SeekEntryResult!7630)

(assert (=> b!752186 (= lt!334573 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!752187 () Bool)

(declare-datatypes ((Unit!25900 0))(
  ( (Unit!25901) )
))
(declare-fun e!419580 () Unit!25900)

(declare-fun Unit!25902 () Unit!25900)

(assert (=> b!752187 (= e!419580 Unit!25902)))

(declare-fun b!752188 () Bool)

(declare-fun e!419585 () Bool)

(declare-fun e!419574 () Bool)

(assert (=> b!752188 (= e!419585 e!419574)))

(declare-fun res!507935 () Bool)

(assert (=> b!752188 (=> res!507935 e!419574)))

(declare-fun lt!334566 () (_ BitVec 64))

(declare-fun lt!334567 () (_ BitVec 64))

(assert (=> b!752188 (= res!507935 (= lt!334566 lt!334567))))

(assert (=> b!752188 (= lt!334566 (select (store (arr!20030 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!752189 () Bool)

(declare-fun e!419578 () Bool)

(assert (=> b!752189 (= e!419576 e!419578)))

(declare-fun res!507937 () Bool)

(assert (=> b!752189 (=> (not res!507937) (not e!419578))))

(declare-fun lt!334574 () SeekEntryResult!7630)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41833 (_ BitVec 32)) SeekEntryResult!7630)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!752189 (= res!507937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20030 a!3186) j!159) mask!3328) (select (arr!20030 a!3186) j!159) a!3186 mask!3328) lt!334574))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!752189 (= lt!334574 (Intermediate!7630 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!752190 () Bool)

(declare-fun res!507931 () Bool)

(assert (=> b!752190 (=> (not res!507931) (not e!419576))))

(assert (=> b!752190 (= res!507931 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20451 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20451 a!3186))))))

(declare-fun b!752191 () Bool)

(declare-fun res!507927 () Bool)

(assert (=> b!752191 (=> (not res!507927) (not e!419578))))

(assert (=> b!752191 (= res!507927 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20030 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!752192 () Bool)

(declare-fun res!507936 () Bool)

(declare-fun e!419579 () Bool)

(assert (=> b!752192 (=> (not res!507936) (not e!419579))))

(declare-fun lt!334577 () array!41833)

(assert (=> b!752192 (= res!507936 (= (seekEntryOrOpen!0 lt!334567 lt!334577 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334567 lt!334577 mask!3328)))))

(declare-fun b!752194 () Bool)

(declare-fun e!419577 () Bool)

(assert (=> b!752194 (= e!419577 e!419585)))

(declare-fun res!507930 () Bool)

(assert (=> b!752194 (=> res!507930 e!419585)))

(declare-fun lt!334571 () SeekEntryResult!7630)

(declare-fun lt!334568 () SeekEntryResult!7630)

(assert (=> b!752194 (= res!507930 (not (= lt!334571 lt!334568)))))

(assert (=> b!752194 (= lt!334571 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20030 a!3186) j!159) a!3186 mask!3328))))

(declare-fun e!419583 () Bool)

(declare-fun b!752195 () Bool)

(assert (=> b!752195 (= e!419583 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20030 a!3186) j!159) a!3186 mask!3328) lt!334568))))

(declare-fun b!752196 () Bool)

(assert (=> b!752196 (= e!419582 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20030 a!3186) j!159) a!3186 mask!3328) lt!334574))))

(declare-fun b!752197 () Bool)

(declare-fun Unit!25903 () Unit!25900)

(assert (=> b!752197 (= e!419580 Unit!25903)))

(assert (=> b!752197 false))

(declare-fun b!752198 () Bool)

(declare-fun res!507929 () Bool)

(assert (=> b!752198 (=> (not res!507929) (not e!419578))))

(assert (=> b!752198 (= res!507929 e!419582)))

(declare-fun c!82510 () Bool)

(assert (=> b!752198 (= c!82510 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!752199 () Bool)

(declare-fun res!507944 () Bool)

(assert (=> b!752199 (=> (not res!507944) (not e!419576))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41833 (_ BitVec 32)) Bool)

(assert (=> b!752199 (= res!507944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!752200 () Bool)

(declare-fun e!419575 () Bool)

(assert (=> b!752200 (= e!419575 (not e!419577))))

(declare-fun res!507933 () Bool)

(assert (=> b!752200 (=> res!507933 e!419577)))

(declare-fun lt!334569 () SeekEntryResult!7630)

(assert (=> b!752200 (= res!507933 (or (not (is-Intermediate!7630 lt!334569)) (bvslt x!1131 (x!63804 lt!334569)) (not (= x!1131 (x!63804 lt!334569))) (not (= index!1321 (index!32890 lt!334569)))))))

(assert (=> b!752200 e!419583))

(declare-fun res!507941 () Bool)

(assert (=> b!752200 (=> (not res!507941) (not e!419583))))

(declare-fun lt!334576 () SeekEntryResult!7630)

(assert (=> b!752200 (= res!507941 (= lt!334576 lt!334568))))

(assert (=> b!752200 (= lt!334568 (Found!7630 j!159))))

(assert (=> b!752200 (= lt!334576 (seekEntryOrOpen!0 (select (arr!20030 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!752200 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334570 () Unit!25900)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41833 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25900)

(assert (=> b!752200 (= lt!334570 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!752201 () Bool)

(assert (=> b!752201 (= e!419578 e!419575)))

(declare-fun res!507926 () Bool)

(assert (=> b!752201 (=> (not res!507926) (not e!419575))))

(declare-fun lt!334575 () SeekEntryResult!7630)

(assert (=> b!752201 (= res!507926 (= lt!334575 lt!334569))))

(assert (=> b!752201 (= lt!334569 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334567 lt!334577 mask!3328))))

(assert (=> b!752201 (= lt!334575 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334567 mask!3328) lt!334567 lt!334577 mask!3328))))

(assert (=> b!752201 (= lt!334567 (select (store (arr!20030 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!752201 (= lt!334577 (array!41834 (store (arr!20030 a!3186) i!1173 k!2102) (size!20451 a!3186)))))

(declare-fun b!752202 () Bool)

(declare-fun res!507940 () Bool)

(assert (=> b!752202 (=> (not res!507940) (not e!419576))))

(declare-datatypes ((List!14032 0))(
  ( (Nil!14029) (Cons!14028 (h!15100 (_ BitVec 64)) (t!20347 List!14032)) )
))
(declare-fun arrayNoDuplicates!0 (array!41833 (_ BitVec 32) List!14032) Bool)

(assert (=> b!752202 (= res!507940 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14029))))

(declare-fun b!752203 () Bool)

(declare-fun res!507928 () Bool)

(assert (=> b!752203 (=> (not res!507928) (not e!419584))))

(assert (=> b!752203 (= res!507928 (and (= (size!20451 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20451 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20451 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!752204 () Bool)

(assert (=> b!752204 (= e!419574 true)))

(assert (=> b!752204 e!419579))

(declare-fun res!507932 () Bool)

(assert (=> b!752204 (=> (not res!507932) (not e!419579))))

(assert (=> b!752204 (= res!507932 (= lt!334566 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334572 () Unit!25900)

(assert (=> b!752204 (= lt!334572 e!419580)))

(declare-fun c!82509 () Bool)

(assert (=> b!752204 (= c!82509 (= lt!334566 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!752205 () Bool)

(declare-fun res!507939 () Bool)

(assert (=> b!752205 (=> (not res!507939) (not e!419584))))

(assert (=> b!752205 (= res!507939 (validKeyInArray!0 (select (arr!20030 a!3186) j!159)))))

(declare-fun b!752193 () Bool)

(assert (=> b!752193 (= e!419579 (= lt!334576 lt!334571))))

(declare-fun res!507943 () Bool)

(assert (=> start!65660 (=> (not res!507943) (not e!419584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65660 (= res!507943 (validMask!0 mask!3328))))

(assert (=> start!65660 e!419584))

(assert (=> start!65660 true))

(declare-fun array_inv!15826 (array!41833) Bool)

(assert (=> start!65660 (array_inv!15826 a!3186)))

(assert (= (and start!65660 res!507943) b!752203))

(assert (= (and b!752203 res!507928) b!752205))

(assert (= (and b!752205 res!507939) b!752184))

(assert (= (and b!752184 res!507938) b!752185))

(assert (= (and b!752185 res!507934) b!752186))

(assert (= (and b!752186 res!507942) b!752199))

(assert (= (and b!752199 res!507944) b!752202))

(assert (= (and b!752202 res!507940) b!752190))

(assert (= (and b!752190 res!507931) b!752189))

(assert (= (and b!752189 res!507937) b!752191))

(assert (= (and b!752191 res!507927) b!752198))

(assert (= (and b!752198 c!82510) b!752196))

(assert (= (and b!752198 (not c!82510)) b!752183))

(assert (= (and b!752198 res!507929) b!752201))

(assert (= (and b!752201 res!507926) b!752200))

(assert (= (and b!752200 res!507941) b!752195))

(assert (= (and b!752200 (not res!507933)) b!752194))

(assert (= (and b!752194 (not res!507930)) b!752188))

(assert (= (and b!752188 (not res!507935)) b!752204))

(assert (= (and b!752204 c!82509) b!752197))

(assert (= (and b!752204 (not c!82509)) b!752187))

(assert (= (and b!752204 res!507932) b!752192))

(assert (= (and b!752192 res!507936) b!752193))

(declare-fun m!701187 () Bool)

(assert (=> start!65660 m!701187))

(declare-fun m!701189 () Bool)

(assert (=> start!65660 m!701189))

(declare-fun m!701191 () Bool)

(assert (=> b!752202 m!701191))

(declare-fun m!701193 () Bool)

(assert (=> b!752184 m!701193))

(declare-fun m!701195 () Bool)

(assert (=> b!752205 m!701195))

(assert (=> b!752205 m!701195))

(declare-fun m!701197 () Bool)

(assert (=> b!752205 m!701197))

(declare-fun m!701199 () Bool)

(assert (=> b!752186 m!701199))

(assert (=> b!752200 m!701195))

(assert (=> b!752200 m!701195))

(declare-fun m!701201 () Bool)

(assert (=> b!752200 m!701201))

(declare-fun m!701203 () Bool)

(assert (=> b!752200 m!701203))

(declare-fun m!701205 () Bool)

(assert (=> b!752200 m!701205))

(assert (=> b!752194 m!701195))

(assert (=> b!752194 m!701195))

(declare-fun m!701207 () Bool)

(assert (=> b!752194 m!701207))

(declare-fun m!701209 () Bool)

(assert (=> b!752185 m!701209))

(declare-fun m!701211 () Bool)

(assert (=> b!752191 m!701211))

(assert (=> b!752189 m!701195))

(assert (=> b!752189 m!701195))

(declare-fun m!701213 () Bool)

(assert (=> b!752189 m!701213))

(assert (=> b!752189 m!701213))

(assert (=> b!752189 m!701195))

(declare-fun m!701215 () Bool)

(assert (=> b!752189 m!701215))

(assert (=> b!752196 m!701195))

(assert (=> b!752196 m!701195))

(declare-fun m!701217 () Bool)

(assert (=> b!752196 m!701217))

(declare-fun m!701219 () Bool)

(assert (=> b!752201 m!701219))

(declare-fun m!701221 () Bool)

(assert (=> b!752201 m!701221))

(declare-fun m!701223 () Bool)

(assert (=> b!752201 m!701223))

(declare-fun m!701225 () Bool)

(assert (=> b!752201 m!701225))

(assert (=> b!752201 m!701223))

(declare-fun m!701227 () Bool)

(assert (=> b!752201 m!701227))

(declare-fun m!701229 () Bool)

(assert (=> b!752192 m!701229))

(declare-fun m!701231 () Bool)

(assert (=> b!752192 m!701231))

(assert (=> b!752188 m!701219))

(declare-fun m!701233 () Bool)

(assert (=> b!752188 m!701233))

(assert (=> b!752183 m!701195))

(assert (=> b!752183 m!701195))

(assert (=> b!752183 m!701207))

(declare-fun m!701235 () Bool)

(assert (=> b!752199 m!701235))

(assert (=> b!752195 m!701195))

(assert (=> b!752195 m!701195))

(declare-fun m!701237 () Bool)

(assert (=> b!752195 m!701237))

(push 1)

