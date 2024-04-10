; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64504 () Bool)

(assert start!64504)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41022 0))(
  ( (array!41023 (arr!19632 (Array (_ BitVec 32) (_ BitVec 64))) (size!20053 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41022)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!725929 () Bool)

(declare-fun e!406490 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7232 0))(
  ( (MissingZero!7232 (index!31296 (_ BitVec 32))) (Found!7232 (index!31297 (_ BitVec 32))) (Intermediate!7232 (undefined!8044 Bool) (index!31298 (_ BitVec 32)) (x!62290 (_ BitVec 32))) (Undefined!7232) (MissingVacant!7232 (index!31299 (_ BitVec 32))) )
))
(declare-fun lt!321520 () SeekEntryResult!7232)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41022 (_ BitVec 32)) SeekEntryResult!7232)

(assert (=> b!725929 (= e!406490 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19632 a!3186) j!159) a!3186 mask!3328) lt!321520))))

(declare-fun lt!321516 () SeekEntryResult!7232)

(declare-fun e!406485 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun b!725930 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41022 (_ BitVec 32)) SeekEntryResult!7232)

(assert (=> b!725930 (= e!406485 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19632 a!3186) j!159) a!3186 mask!3328) lt!321516))))

(declare-fun b!725931 () Bool)

(declare-fun res!486974 () Bool)

(declare-fun e!406483 () Bool)

(assert (=> b!725931 (=> (not res!486974) (not e!406483))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!725931 (= res!486974 (and (= (size!20053 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20053 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20053 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!725932 () Bool)

(declare-fun res!486978 () Bool)

(assert (=> b!725932 (=> (not res!486978) (not e!406483))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!725932 (= res!486978 (validKeyInArray!0 k!2102))))

(declare-fun b!725933 () Bool)

(declare-fun e!406482 () Bool)

(assert (=> b!725933 (= e!406483 e!406482)))

(declare-fun res!486971 () Bool)

(assert (=> b!725933 (=> (not res!486971) (not e!406482))))

(declare-fun lt!321519 () SeekEntryResult!7232)

(assert (=> b!725933 (= res!486971 (or (= lt!321519 (MissingZero!7232 i!1173)) (= lt!321519 (MissingVacant!7232 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41022 (_ BitVec 32)) SeekEntryResult!7232)

(assert (=> b!725933 (= lt!321519 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!725934 () Bool)

(declare-fun res!486976 () Bool)

(assert (=> b!725934 (=> (not res!486976) (not e!406482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41022 (_ BitVec 32)) Bool)

(assert (=> b!725934 (= res!486976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!725935 () Bool)

(declare-fun res!486982 () Bool)

(assert (=> b!725935 (=> (not res!486982) (not e!406482))))

(assert (=> b!725935 (= res!486982 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20053 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20053 a!3186))))))

(declare-fun b!725936 () Bool)

(declare-fun res!486979 () Bool)

(assert (=> b!725936 (=> (not res!486979) (not e!406482))))

(declare-datatypes ((List!13634 0))(
  ( (Nil!13631) (Cons!13630 (h!14687 (_ BitVec 64)) (t!19949 List!13634)) )
))
(declare-fun arrayNoDuplicates!0 (array!41022 (_ BitVec 32) List!13634) Bool)

(assert (=> b!725936 (= res!486979 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13631))))

(declare-fun res!486977 () Bool)

(assert (=> start!64504 (=> (not res!486977) (not e!406483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64504 (= res!486977 (validMask!0 mask!3328))))

(assert (=> start!64504 e!406483))

(assert (=> start!64504 true))

(declare-fun array_inv!15428 (array!41022) Bool)

(assert (=> start!64504 (array_inv!15428 a!3186)))

(declare-fun b!725937 () Bool)

(declare-fun res!486975 () Bool)

(assert (=> b!725937 (=> (not res!486975) (not e!406483))))

(declare-fun arrayContainsKey!0 (array!41022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!725937 (= res!486975 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!725938 () Bool)

(declare-fun e!406488 () Bool)

(assert (=> b!725938 (= e!406482 e!406488)))

(declare-fun res!486983 () Bool)

(assert (=> b!725938 (=> (not res!486983) (not e!406488))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!725938 (= res!486983 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19632 a!3186) j!159) mask!3328) (select (arr!19632 a!3186) j!159) a!3186 mask!3328) lt!321516))))

(assert (=> b!725938 (= lt!321516 (Intermediate!7232 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!725939 () Bool)

(declare-fun res!486986 () Bool)

(assert (=> b!725939 (=> (not res!486986) (not e!406488))))

(assert (=> b!725939 (= res!486986 e!406485)))

(declare-fun c!79852 () Bool)

(assert (=> b!725939 (= c!79852 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!725940 () Bool)

(declare-fun e!406489 () Bool)

(assert (=> b!725940 (= e!406489 e!406490)))

(declare-fun res!486972 () Bool)

(assert (=> b!725940 (=> (not res!486972) (not e!406490))))

(assert (=> b!725940 (= res!486972 (= (seekEntryOrOpen!0 (select (arr!19632 a!3186) j!159) a!3186 mask!3328) lt!321520))))

(assert (=> b!725940 (= lt!321520 (Found!7232 j!159))))

(declare-fun b!725941 () Bool)

(declare-fun e!406487 () Bool)

(declare-fun e!406484 () Bool)

(assert (=> b!725941 (= e!406487 (not e!406484))))

(declare-fun res!486973 () Bool)

(assert (=> b!725941 (=> res!486973 e!406484)))

(assert (=> b!725941 (= res!486973 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!725941 e!406489))

(declare-fun res!486981 () Bool)

(assert (=> b!725941 (=> (not res!486981) (not e!406489))))

(assert (=> b!725941 (= res!486981 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24782 0))(
  ( (Unit!24783) )
))
(declare-fun lt!321517 () Unit!24782)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41022 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24782)

(assert (=> b!725941 (= lt!321517 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!725942 () Bool)

(assert (=> b!725942 (= e!406485 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19632 a!3186) j!159) a!3186 mask!3328) (Found!7232 j!159)))))

(declare-fun b!725943 () Bool)

(declare-fun res!486984 () Bool)

(assert (=> b!725943 (=> (not res!486984) (not e!406483))))

(assert (=> b!725943 (= res!486984 (validKeyInArray!0 (select (arr!19632 a!3186) j!159)))))

(declare-fun b!725944 () Bool)

(declare-fun res!486980 () Bool)

(assert (=> b!725944 (=> (not res!486980) (not e!406488))))

(assert (=> b!725944 (= res!486980 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19632 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!725945 () Bool)

(assert (=> b!725945 (= e!406488 e!406487)))

(declare-fun res!486985 () Bool)

(assert (=> b!725945 (=> (not res!486985) (not e!406487))))

(declare-fun lt!321521 () array!41022)

(declare-fun lt!321518 () (_ BitVec 64))

(assert (=> b!725945 (= res!486985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!321518 mask!3328) lt!321518 lt!321521 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!321518 lt!321521 mask!3328)))))

(assert (=> b!725945 (= lt!321518 (select (store (arr!19632 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!725945 (= lt!321521 (array!41023 (store (arr!19632 a!3186) i!1173 k!2102) (size!20053 a!3186)))))

(declare-fun b!725946 () Bool)

(assert (=> b!725946 (= e!406484 (validKeyInArray!0 lt!321518))))

(assert (= (and start!64504 res!486977) b!725931))

(assert (= (and b!725931 res!486974) b!725943))

(assert (= (and b!725943 res!486984) b!725932))

(assert (= (and b!725932 res!486978) b!725937))

(assert (= (and b!725937 res!486975) b!725933))

(assert (= (and b!725933 res!486971) b!725934))

(assert (= (and b!725934 res!486976) b!725936))

(assert (= (and b!725936 res!486979) b!725935))

(assert (= (and b!725935 res!486982) b!725938))

(assert (= (and b!725938 res!486983) b!725944))

(assert (= (and b!725944 res!486980) b!725939))

(assert (= (and b!725939 c!79852) b!725930))

(assert (= (and b!725939 (not c!79852)) b!725942))

(assert (= (and b!725939 res!486986) b!725945))

(assert (= (and b!725945 res!486985) b!725941))

(assert (= (and b!725941 res!486981) b!725940))

(assert (= (and b!725940 res!486972) b!725929))

(assert (= (and b!725941 (not res!486973)) b!725946))

(declare-fun m!680041 () Bool)

(assert (=> b!725930 m!680041))

(assert (=> b!725930 m!680041))

(declare-fun m!680043 () Bool)

(assert (=> b!725930 m!680043))

(declare-fun m!680045 () Bool)

(assert (=> b!725941 m!680045))

(declare-fun m!680047 () Bool)

(assert (=> b!725941 m!680047))

(assert (=> b!725940 m!680041))

(assert (=> b!725940 m!680041))

(declare-fun m!680049 () Bool)

(assert (=> b!725940 m!680049))

(assert (=> b!725943 m!680041))

(assert (=> b!725943 m!680041))

(declare-fun m!680051 () Bool)

(assert (=> b!725943 m!680051))

(declare-fun m!680053 () Bool)

(assert (=> b!725944 m!680053))

(assert (=> b!725929 m!680041))

(assert (=> b!725929 m!680041))

(declare-fun m!680055 () Bool)

(assert (=> b!725929 m!680055))

(declare-fun m!680057 () Bool)

(assert (=> b!725936 m!680057))

(declare-fun m!680059 () Bool)

(assert (=> b!725934 m!680059))

(declare-fun m!680061 () Bool)

(assert (=> b!725946 m!680061))

(declare-fun m!680063 () Bool)

(assert (=> b!725937 m!680063))

(declare-fun m!680065 () Bool)

(assert (=> b!725933 m!680065))

(declare-fun m!680067 () Bool)

(assert (=> b!725932 m!680067))

(declare-fun m!680069 () Bool)

(assert (=> b!725945 m!680069))

(declare-fun m!680071 () Bool)

(assert (=> b!725945 m!680071))

(assert (=> b!725945 m!680069))

(declare-fun m!680073 () Bool)

(assert (=> b!725945 m!680073))

(declare-fun m!680075 () Bool)

(assert (=> b!725945 m!680075))

(declare-fun m!680077 () Bool)

(assert (=> b!725945 m!680077))

(assert (=> b!725938 m!680041))

(assert (=> b!725938 m!680041))

(declare-fun m!680079 () Bool)

(assert (=> b!725938 m!680079))

(assert (=> b!725938 m!680079))

(assert (=> b!725938 m!680041))

(declare-fun m!680081 () Bool)

(assert (=> b!725938 m!680081))

(declare-fun m!680083 () Bool)

(assert (=> start!64504 m!680083))

(declare-fun m!680085 () Bool)

(assert (=> start!64504 m!680085))

(assert (=> b!725942 m!680041))

(assert (=> b!725942 m!680041))

(declare-fun m!680087 () Bool)

(assert (=> b!725942 m!680087))

(push 1)

