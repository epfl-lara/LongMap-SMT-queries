; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65626 () Bool)

(assert start!65626)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41799 0))(
  ( (array!41800 (arr!20013 (Array (_ BitVec 32) (_ BitVec 64))) (size!20434 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41799)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!751035 () Bool)

(declare-datatypes ((SeekEntryResult!7613 0))(
  ( (MissingZero!7613 (index!32820 (_ BitVec 32))) (Found!7613 (index!32821 (_ BitVec 32))) (Intermediate!7613 (undefined!8425 Bool) (index!32822 (_ BitVec 32)) (x!63747 (_ BitVec 32))) (Undefined!7613) (MissingVacant!7613 (index!32823 (_ BitVec 32))) )
))
(declare-fun lt!333987 () SeekEntryResult!7613)

(declare-fun e!418992 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41799 (_ BitVec 32)) SeekEntryResult!7613)

(assert (=> b!751035 (= e!418992 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20013 a!3186) j!159) a!3186 mask!3328) lt!333987))))

(declare-fun b!751036 () Bool)

(declare-fun e!418994 () Bool)

(declare-fun e!418988 () Bool)

(assert (=> b!751036 (= e!418994 (not e!418988))))

(declare-fun res!506992 () Bool)

(assert (=> b!751036 (=> res!506992 e!418988)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!333981 () SeekEntryResult!7613)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!751036 (= res!506992 (or (not (is-Intermediate!7613 lt!333981)) (bvslt x!1131 (x!63747 lt!333981)) (not (= x!1131 (x!63747 lt!333981))) (not (= index!1321 (index!32822 lt!333981)))))))

(assert (=> b!751036 e!418992))

(declare-fun res!506999 () Bool)

(assert (=> b!751036 (=> (not res!506999) (not e!418992))))

(declare-fun lt!333983 () SeekEntryResult!7613)

(assert (=> b!751036 (= res!506999 (= lt!333983 lt!333987))))

(assert (=> b!751036 (= lt!333987 (Found!7613 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41799 (_ BitVec 32)) SeekEntryResult!7613)

(assert (=> b!751036 (= lt!333983 (seekEntryOrOpen!0 (select (arr!20013 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41799 (_ BitVec 32)) Bool)

(assert (=> b!751036 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!25832 0))(
  ( (Unit!25833) )
))
(declare-fun lt!333989 () Unit!25832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25832)

(assert (=> b!751036 (= lt!333989 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751037 () Bool)

(declare-fun res!506984 () Bool)

(declare-fun e!418987 () Bool)

(assert (=> b!751037 (=> (not res!506984) (not e!418987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751037 (= res!506984 (validKeyInArray!0 (select (arr!20013 a!3186) j!159)))))

(declare-fun b!751038 () Bool)

(declare-fun res!506990 () Bool)

(assert (=> b!751038 (=> (not res!506990) (not e!418987))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!751038 (= res!506990 (validKeyInArray!0 k!2102))))

(declare-fun b!751039 () Bool)

(declare-fun e!418991 () Bool)

(assert (=> b!751039 (= e!418991 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328)) (bvslt resIntermediateIndex!5 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(declare-fun e!418995 () Bool)

(assert (=> b!751039 e!418995))

(declare-fun res!506988 () Bool)

(assert (=> b!751039 (=> (not res!506988) (not e!418995))))

(declare-fun lt!333982 () (_ BitVec 64))

(assert (=> b!751039 (= res!506988 (= lt!333982 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!333986 () Unit!25832)

(declare-fun e!418989 () Unit!25832)

(assert (=> b!751039 (= lt!333986 e!418989)))

(declare-fun c!82407 () Bool)

(assert (=> b!751039 (= c!82407 (= lt!333982 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751040 () Bool)

(declare-fun Unit!25834 () Unit!25832)

(assert (=> b!751040 (= e!418989 Unit!25834)))

(declare-fun b!751041 () Bool)

(declare-fun Unit!25835 () Unit!25832)

(assert (=> b!751041 (= e!418989 Unit!25835)))

(assert (=> b!751041 false))

(declare-fun b!751042 () Bool)

(declare-fun res!506994 () Bool)

(declare-fun e!418996 () Bool)

(assert (=> b!751042 (=> (not res!506994) (not e!418996))))

(assert (=> b!751042 (= res!506994 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20434 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20434 a!3186))))))

(declare-fun b!751043 () Bool)

(assert (=> b!751043 (= e!418988 e!418991)))

(declare-fun res!506982 () Bool)

(assert (=> b!751043 (=> res!506982 e!418991)))

(declare-fun lt!333988 () (_ BitVec 64))

(assert (=> b!751043 (= res!506982 (= lt!333982 lt!333988))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751043 (= lt!333982 (select (store (arr!20013 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!751044 () Bool)

(declare-fun res!506985 () Bool)

(assert (=> b!751044 (=> res!506985 e!418988)))

(assert (=> b!751044 (= res!506985 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20013 a!3186) j!159) a!3186 mask!3328) lt!333987)))))

(declare-fun b!751045 () Bool)

(declare-fun res!506983 () Bool)

(declare-fun e!418990 () Bool)

(assert (=> b!751045 (=> (not res!506983) (not e!418990))))

(assert (=> b!751045 (= res!506983 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20013 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!751046 () Bool)

(declare-fun res!506991 () Bool)

(assert (=> b!751046 (=> (not res!506991) (not e!418987))))

(assert (=> b!751046 (= res!506991 (and (= (size!20434 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20434 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20434 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751047 () Bool)

(declare-fun res!506987 () Bool)

(assert (=> b!751047 (=> (not res!506987) (not e!418996))))

(assert (=> b!751047 (= res!506987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!506997 () Bool)

(assert (=> start!65626 (=> (not res!506997) (not e!418987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65626 (= res!506997 (validMask!0 mask!3328))))

(assert (=> start!65626 e!418987))

(assert (=> start!65626 true))

(declare-fun array_inv!15809 (array!41799) Bool)

(assert (=> start!65626 (array_inv!15809 a!3186)))

(declare-fun b!751048 () Bool)

(declare-fun res!506996 () Bool)

(assert (=> b!751048 (=> (not res!506996) (not e!418996))))

(declare-datatypes ((List!14015 0))(
  ( (Nil!14012) (Cons!14011 (h!15083 (_ BitVec 64)) (t!20330 List!14015)) )
))
(declare-fun arrayNoDuplicates!0 (array!41799 (_ BitVec 32) List!14015) Bool)

(assert (=> b!751048 (= res!506996 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14012))))

(declare-fun b!751049 () Bool)

(assert (=> b!751049 (= e!418990 e!418994)))

(declare-fun res!506993 () Bool)

(assert (=> b!751049 (=> (not res!506993) (not e!418994))))

(declare-fun lt!333984 () SeekEntryResult!7613)

(assert (=> b!751049 (= res!506993 (= lt!333984 lt!333981))))

(declare-fun lt!333980 () array!41799)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41799 (_ BitVec 32)) SeekEntryResult!7613)

(assert (=> b!751049 (= lt!333981 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333988 lt!333980 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751049 (= lt!333984 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333988 mask!3328) lt!333988 lt!333980 mask!3328))))

(assert (=> b!751049 (= lt!333988 (select (store (arr!20013 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751049 (= lt!333980 (array!41800 (store (arr!20013 a!3186) i!1173 k!2102) (size!20434 a!3186)))))

(declare-fun b!751050 () Bool)

(assert (=> b!751050 (= e!418987 e!418996)))

(declare-fun res!506998 () Bool)

(assert (=> b!751050 (=> (not res!506998) (not e!418996))))

(declare-fun lt!333985 () SeekEntryResult!7613)

(assert (=> b!751050 (= res!506998 (or (= lt!333985 (MissingZero!7613 i!1173)) (= lt!333985 (MissingVacant!7613 i!1173))))))

(assert (=> b!751050 (= lt!333985 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!333979 () SeekEntryResult!7613)

(declare-fun b!751051 () Bool)

(declare-fun e!418997 () Bool)

(assert (=> b!751051 (= e!418997 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20013 a!3186) j!159) a!3186 mask!3328) lt!333979))))

(declare-fun b!751052 () Bool)

(assert (=> b!751052 (= e!418995 (= (seekEntryOrOpen!0 lt!333988 lt!333980 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333988 lt!333980 mask!3328)))))

(declare-fun b!751053 () Bool)

(declare-fun res!506986 () Bool)

(assert (=> b!751053 (=> (not res!506986) (not e!418990))))

(assert (=> b!751053 (= res!506986 e!418997)))

(declare-fun c!82408 () Bool)

(assert (=> b!751053 (= c!82408 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751054 () Bool)

(declare-fun res!506995 () Bool)

(assert (=> b!751054 (=> (not res!506995) (not e!418987))))

(declare-fun arrayContainsKey!0 (array!41799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751054 (= res!506995 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751055 () Bool)

(assert (=> b!751055 (= e!418996 e!418990)))

(declare-fun res!506989 () Bool)

(assert (=> b!751055 (=> (not res!506989) (not e!418990))))

(assert (=> b!751055 (= res!506989 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20013 a!3186) j!159) mask!3328) (select (arr!20013 a!3186) j!159) a!3186 mask!3328) lt!333979))))

(assert (=> b!751055 (= lt!333979 (Intermediate!7613 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!751056 () Bool)

(assert (=> b!751056 (= e!418997 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20013 a!3186) j!159) a!3186 mask!3328) (Found!7613 j!159)))))

(assert (= (and start!65626 res!506997) b!751046))

(assert (= (and b!751046 res!506991) b!751037))

(assert (= (and b!751037 res!506984) b!751038))

(assert (= (and b!751038 res!506990) b!751054))

(assert (= (and b!751054 res!506995) b!751050))

(assert (= (and b!751050 res!506998) b!751047))

(assert (= (and b!751047 res!506987) b!751048))

(assert (= (and b!751048 res!506996) b!751042))

(assert (= (and b!751042 res!506994) b!751055))

(assert (= (and b!751055 res!506989) b!751045))

(assert (= (and b!751045 res!506983) b!751053))

(assert (= (and b!751053 c!82408) b!751051))

(assert (= (and b!751053 (not c!82408)) b!751056))

(assert (= (and b!751053 res!506986) b!751049))

(assert (= (and b!751049 res!506993) b!751036))

(assert (= (and b!751036 res!506999) b!751035))

(assert (= (and b!751036 (not res!506992)) b!751044))

(assert (= (and b!751044 (not res!506985)) b!751043))

(assert (= (and b!751043 (not res!506982)) b!751039))

(assert (= (and b!751039 c!82407) b!751041))

(assert (= (and b!751039 (not c!82407)) b!751040))

(assert (= (and b!751039 res!506988) b!751052))

(declare-fun m!700303 () Bool)

(assert (=> b!751043 m!700303))

(declare-fun m!700305 () Bool)

(assert (=> b!751043 m!700305))

(declare-fun m!700307 () Bool)

(assert (=> b!751050 m!700307))

(declare-fun m!700309 () Bool)

(assert (=> start!65626 m!700309))

(declare-fun m!700311 () Bool)

(assert (=> start!65626 m!700311))

(declare-fun m!700313 () Bool)

(assert (=> b!751051 m!700313))

(assert (=> b!751051 m!700313))

(declare-fun m!700315 () Bool)

(assert (=> b!751051 m!700315))

(declare-fun m!700317 () Bool)

(assert (=> b!751048 m!700317))

(assert (=> b!751049 m!700303))

(declare-fun m!700319 () Bool)

(assert (=> b!751049 m!700319))

(declare-fun m!700321 () Bool)

(assert (=> b!751049 m!700321))

(declare-fun m!700323 () Bool)

(assert (=> b!751049 m!700323))

(assert (=> b!751049 m!700321))

(declare-fun m!700325 () Bool)

(assert (=> b!751049 m!700325))

(declare-fun m!700327 () Bool)

(assert (=> b!751047 m!700327))

(assert (=> b!751044 m!700313))

(assert (=> b!751044 m!700313))

(declare-fun m!700329 () Bool)

(assert (=> b!751044 m!700329))

(declare-fun m!700331 () Bool)

(assert (=> b!751054 m!700331))

(declare-fun m!700333 () Bool)

(assert (=> b!751052 m!700333))

(declare-fun m!700335 () Bool)

(assert (=> b!751052 m!700335))

(assert (=> b!751055 m!700313))

(assert (=> b!751055 m!700313))

(declare-fun m!700337 () Bool)

(assert (=> b!751055 m!700337))

(assert (=> b!751055 m!700337))

(assert (=> b!751055 m!700313))

(declare-fun m!700339 () Bool)

(assert (=> b!751055 m!700339))

(assert (=> b!751036 m!700313))

(assert (=> b!751036 m!700313))

(declare-fun m!700341 () Bool)

(assert (=> b!751036 m!700341))

(declare-fun m!700343 () Bool)

(assert (=> b!751036 m!700343))

(declare-fun m!700345 () Bool)

(assert (=> b!751036 m!700345))

(assert (=> b!751037 m!700313))

(assert (=> b!751037 m!700313))

(declare-fun m!700347 () Bool)

(assert (=> b!751037 m!700347))

(assert (=> b!751035 m!700313))

(assert (=> b!751035 m!700313))

(declare-fun m!700349 () Bool)

(assert (=> b!751035 m!700349))

(assert (=> b!751056 m!700313))

(assert (=> b!751056 m!700313))

(assert (=> b!751056 m!700329))

(declare-fun m!700351 () Bool)

(assert (=> b!751038 m!700351))

(declare-fun m!700353 () Bool)

(assert (=> b!751045 m!700353))

(push 1)

(assert (not b!751036))

(assert (not b!751049))

(assert (not b!751048))

(assert (not b!751035))

(assert (not start!65626))

(assert (not b!751052))

(assert (not b!751038))

(assert (not b!751047))

(assert (not b!751055))

(assert (not b!751050))

(assert (not b!751037))

(assert (not b!751056))

(assert (not b!751054))

(assert (not b!751051))

(assert (not b!751044))

(check-sat)

(pop 1)

(push 1)

(check-sat)

