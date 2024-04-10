; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65802 () Bool)

(assert start!65802)

(declare-fun b!757082 () Bool)

(declare-fun res!511982 () Bool)

(declare-fun e!422131 () Bool)

(assert (=> b!757082 (=> (not res!511982) (not e!422131))))

(declare-datatypes ((array!41975 0))(
  ( (array!41976 (arr!20101 (Array (_ BitVec 32) (_ BitVec 64))) (size!20522 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41975)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!757082 (= res!511982 (and (= (size!20522 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20522 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20522 a!3186)) (not (= i!1173 j!159))))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!422132 () Bool)

(declare-fun b!757083 () Bool)

(declare-datatypes ((SeekEntryResult!7701 0))(
  ( (MissingZero!7701 (index!33172 (_ BitVec 32))) (Found!7701 (index!33173 (_ BitVec 32))) (Intermediate!7701 (undefined!8513 Bool) (index!33174 (_ BitVec 32)) (x!64067 (_ BitVec 32))) (Undefined!7701) (MissingVacant!7701 (index!33175 (_ BitVec 32))) )
))
(declare-fun lt!337126 () SeekEntryResult!7701)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41975 (_ BitVec 32)) SeekEntryResult!7701)

(assert (=> b!757083 (= e!422132 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20101 a!3186) j!159) a!3186 mask!3328) lt!337126))))

(declare-fun res!511991 () Bool)

(assert (=> start!65802 (=> (not res!511991) (not e!422131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65802 (= res!511991 (validMask!0 mask!3328))))

(assert (=> start!65802 e!422131))

(assert (=> start!65802 true))

(declare-fun array_inv!15897 (array!41975) Bool)

(assert (=> start!65802 (array_inv!15897 a!3186)))

(declare-fun b!757084 () Bool)

(declare-datatypes ((Unit!26184 0))(
  ( (Unit!26185) )
))
(declare-fun e!422139 () Unit!26184)

(declare-fun Unit!26186 () Unit!26184)

(assert (=> b!757084 (= e!422139 Unit!26186)))

(declare-fun b!757085 () Bool)

(declare-fun res!511976 () Bool)

(declare-fun e!422137 () Bool)

(assert (=> b!757085 (=> (not res!511976) (not e!422137))))

(declare-datatypes ((List!14103 0))(
  ( (Nil!14100) (Cons!14099 (h!15171 (_ BitVec 64)) (t!20418 List!14103)) )
))
(declare-fun arrayNoDuplicates!0 (array!41975 (_ BitVec 32) List!14103) Bool)

(assert (=> b!757085 (= res!511976 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14100))))

(declare-fun b!757086 () Bool)

(declare-fun e!422141 () Bool)

(declare-fun e!422130 () Bool)

(assert (=> b!757086 (= e!422141 e!422130)))

(declare-fun res!511981 () Bool)

(assert (=> b!757086 (=> (not res!511981) (not e!422130))))

(declare-fun lt!337132 () SeekEntryResult!7701)

(declare-fun lt!337131 () SeekEntryResult!7701)

(assert (=> b!757086 (= res!511981 (= lt!337132 lt!337131))))

(declare-fun lt!337133 () array!41975)

(declare-fun lt!337124 () (_ BitVec 64))

(assert (=> b!757086 (= lt!337131 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337124 lt!337133 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!757086 (= lt!337132 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337124 mask!3328) lt!337124 lt!337133 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!757086 (= lt!337124 (select (store (arr!20101 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!757086 (= lt!337133 (array!41976 (store (arr!20101 a!3186) i!1173 k0!2102) (size!20522 a!3186)))))

(declare-fun b!757087 () Bool)

(declare-fun e!422138 () Bool)

(declare-fun e!422134 () Bool)

(assert (=> b!757087 (= e!422138 e!422134)))

(declare-fun res!511979 () Bool)

(assert (=> b!757087 (=> res!511979 e!422134)))

(declare-fun lt!337128 () SeekEntryResult!7701)

(declare-fun lt!337130 () SeekEntryResult!7701)

(assert (=> b!757087 (= res!511979 (not (= lt!337128 lt!337130)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41975 (_ BitVec 32)) SeekEntryResult!7701)

(assert (=> b!757087 (= lt!337128 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20101 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!757088 () Bool)

(declare-fun res!511983 () Bool)

(assert (=> b!757088 (=> (not res!511983) (not e!422141))))

(assert (=> b!757088 (= res!511983 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20101 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!757089 () Bool)

(declare-fun res!511989 () Bool)

(assert (=> b!757089 (=> (not res!511989) (not e!422137))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!757089 (= res!511989 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20522 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20522 a!3186))))))

(declare-fun b!757090 () Bool)

(declare-fun res!511988 () Bool)

(assert (=> b!757090 (=> (not res!511988) (not e!422131))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!757090 (= res!511988 (validKeyInArray!0 k0!2102))))

(declare-fun b!757091 () Bool)

(declare-fun e!422136 () Bool)

(assert (=> b!757091 (= e!422134 e!422136)))

(declare-fun res!511984 () Bool)

(assert (=> b!757091 (=> res!511984 e!422136)))

(declare-fun lt!337127 () (_ BitVec 64))

(assert (=> b!757091 (= res!511984 (= lt!337127 lt!337124))))

(assert (=> b!757091 (= lt!337127 (select (store (arr!20101 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!757092 () Bool)

(assert (=> b!757092 (= e!422131 e!422137)))

(declare-fun res!511986 () Bool)

(assert (=> b!757092 (=> (not res!511986) (not e!422137))))

(declare-fun lt!337125 () SeekEntryResult!7701)

(assert (=> b!757092 (= res!511986 (or (= lt!337125 (MissingZero!7701 i!1173)) (= lt!337125 (MissingVacant!7701 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41975 (_ BitVec 32)) SeekEntryResult!7701)

(assert (=> b!757092 (= lt!337125 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!757093 () Bool)

(declare-fun Unit!26187 () Unit!26184)

(assert (=> b!757093 (= e!422139 Unit!26187)))

(assert (=> b!757093 false))

(declare-fun b!757094 () Bool)

(declare-fun e!422140 () Bool)

(declare-fun lt!337123 () SeekEntryResult!7701)

(assert (=> b!757094 (= e!422140 (= lt!337123 lt!337128))))

(declare-fun b!757095 () Bool)

(declare-fun e!422133 () Bool)

(assert (=> b!757095 (= e!422133 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20101 a!3186) j!159) a!3186 mask!3328) lt!337130))))

(declare-fun b!757096 () Bool)

(declare-fun res!511990 () Bool)

(assert (=> b!757096 (=> (not res!511990) (not e!422131))))

(declare-fun arrayContainsKey!0 (array!41975 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!757096 (= res!511990 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!757097 () Bool)

(declare-fun res!511975 () Bool)

(assert (=> b!757097 (=> (not res!511975) (not e!422137))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41975 (_ BitVec 32)) Bool)

(assert (=> b!757097 (= res!511975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!757098 () Bool)

(declare-fun res!511978 () Bool)

(assert (=> b!757098 (=> (not res!511978) (not e!422141))))

(assert (=> b!757098 (= res!511978 e!422132)))

(declare-fun c!82935 () Bool)

(assert (=> b!757098 (= c!82935 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!757099 () Bool)

(assert (=> b!757099 (= e!422136 true)))

(assert (=> b!757099 e!422140))

(declare-fun res!511980 () Bool)

(assert (=> b!757099 (=> (not res!511980) (not e!422140))))

(assert (=> b!757099 (= res!511980 (= lt!337127 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337129 () Unit!26184)

(assert (=> b!757099 (= lt!337129 e!422139)))

(declare-fun c!82936 () Bool)

(assert (=> b!757099 (= c!82936 (= lt!337127 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!757100 () Bool)

(assert (=> b!757100 (= e!422137 e!422141)))

(declare-fun res!511985 () Bool)

(assert (=> b!757100 (=> (not res!511985) (not e!422141))))

(assert (=> b!757100 (= res!511985 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20101 a!3186) j!159) mask!3328) (select (arr!20101 a!3186) j!159) a!3186 mask!3328) lt!337126))))

(assert (=> b!757100 (= lt!337126 (Intermediate!7701 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!757101 () Bool)

(declare-fun res!511977 () Bool)

(assert (=> b!757101 (=> (not res!511977) (not e!422140))))

(assert (=> b!757101 (= res!511977 (= (seekEntryOrOpen!0 lt!337124 lt!337133 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337124 lt!337133 mask!3328)))))

(declare-fun b!757102 () Bool)

(declare-fun res!511974 () Bool)

(assert (=> b!757102 (=> (not res!511974) (not e!422131))))

(assert (=> b!757102 (= res!511974 (validKeyInArray!0 (select (arr!20101 a!3186) j!159)))))

(declare-fun b!757103 () Bool)

(assert (=> b!757103 (= e!422130 (not e!422138))))

(declare-fun res!511973 () Bool)

(assert (=> b!757103 (=> res!511973 e!422138)))

(get-info :version)

(assert (=> b!757103 (= res!511973 (or (not ((_ is Intermediate!7701) lt!337131)) (bvslt x!1131 (x!64067 lt!337131)) (not (= x!1131 (x!64067 lt!337131))) (not (= index!1321 (index!33174 lt!337131)))))))

(assert (=> b!757103 e!422133))

(declare-fun res!511987 () Bool)

(assert (=> b!757103 (=> (not res!511987) (not e!422133))))

(assert (=> b!757103 (= res!511987 (= lt!337123 lt!337130))))

(assert (=> b!757103 (= lt!337130 (Found!7701 j!159))))

(assert (=> b!757103 (= lt!337123 (seekEntryOrOpen!0 (select (arr!20101 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!757103 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337122 () Unit!26184)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26184)

(assert (=> b!757103 (= lt!337122 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!757104 () Bool)

(assert (=> b!757104 (= e!422132 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20101 a!3186) j!159) a!3186 mask!3328) (Found!7701 j!159)))))

(assert (= (and start!65802 res!511991) b!757082))

(assert (= (and b!757082 res!511982) b!757102))

(assert (= (and b!757102 res!511974) b!757090))

(assert (= (and b!757090 res!511988) b!757096))

(assert (= (and b!757096 res!511990) b!757092))

(assert (= (and b!757092 res!511986) b!757097))

(assert (= (and b!757097 res!511975) b!757085))

(assert (= (and b!757085 res!511976) b!757089))

(assert (= (and b!757089 res!511989) b!757100))

(assert (= (and b!757100 res!511985) b!757088))

(assert (= (and b!757088 res!511983) b!757098))

(assert (= (and b!757098 c!82935) b!757083))

(assert (= (and b!757098 (not c!82935)) b!757104))

(assert (= (and b!757098 res!511978) b!757086))

(assert (= (and b!757086 res!511981) b!757103))

(assert (= (and b!757103 res!511987) b!757095))

(assert (= (and b!757103 (not res!511973)) b!757087))

(assert (= (and b!757087 (not res!511979)) b!757091))

(assert (= (and b!757091 (not res!511984)) b!757099))

(assert (= (and b!757099 c!82936) b!757093))

(assert (= (and b!757099 (not c!82936)) b!757084))

(assert (= (and b!757099 res!511980) b!757101))

(assert (= (and b!757101 res!511977) b!757094))

(declare-fun m!704879 () Bool)

(assert (=> b!757092 m!704879))

(declare-fun m!704881 () Bool)

(assert (=> b!757103 m!704881))

(assert (=> b!757103 m!704881))

(declare-fun m!704883 () Bool)

(assert (=> b!757103 m!704883))

(declare-fun m!704885 () Bool)

(assert (=> b!757103 m!704885))

(declare-fun m!704887 () Bool)

(assert (=> b!757103 m!704887))

(declare-fun m!704889 () Bool)

(assert (=> b!757101 m!704889))

(declare-fun m!704891 () Bool)

(assert (=> b!757101 m!704891))

(declare-fun m!704893 () Bool)

(assert (=> b!757088 m!704893))

(declare-fun m!704895 () Bool)

(assert (=> b!757097 m!704895))

(declare-fun m!704897 () Bool)

(assert (=> b!757085 m!704897))

(assert (=> b!757104 m!704881))

(assert (=> b!757104 m!704881))

(declare-fun m!704899 () Bool)

(assert (=> b!757104 m!704899))

(assert (=> b!757087 m!704881))

(assert (=> b!757087 m!704881))

(assert (=> b!757087 m!704899))

(declare-fun m!704901 () Bool)

(assert (=> b!757096 m!704901))

(declare-fun m!704903 () Bool)

(assert (=> start!65802 m!704903))

(declare-fun m!704905 () Bool)

(assert (=> start!65802 m!704905))

(assert (=> b!757095 m!704881))

(assert (=> b!757095 m!704881))

(declare-fun m!704907 () Bool)

(assert (=> b!757095 m!704907))

(declare-fun m!704909 () Bool)

(assert (=> b!757091 m!704909))

(declare-fun m!704911 () Bool)

(assert (=> b!757091 m!704911))

(assert (=> b!757083 m!704881))

(assert (=> b!757083 m!704881))

(declare-fun m!704913 () Bool)

(assert (=> b!757083 m!704913))

(declare-fun m!704915 () Bool)

(assert (=> b!757086 m!704915))

(declare-fun m!704917 () Bool)

(assert (=> b!757086 m!704917))

(assert (=> b!757086 m!704917))

(declare-fun m!704919 () Bool)

(assert (=> b!757086 m!704919))

(assert (=> b!757086 m!704909))

(declare-fun m!704921 () Bool)

(assert (=> b!757086 m!704921))

(assert (=> b!757100 m!704881))

(assert (=> b!757100 m!704881))

(declare-fun m!704923 () Bool)

(assert (=> b!757100 m!704923))

(assert (=> b!757100 m!704923))

(assert (=> b!757100 m!704881))

(declare-fun m!704925 () Bool)

(assert (=> b!757100 m!704925))

(declare-fun m!704927 () Bool)

(assert (=> b!757090 m!704927))

(assert (=> b!757102 m!704881))

(assert (=> b!757102 m!704881))

(declare-fun m!704929 () Bool)

(assert (=> b!757102 m!704929))

(check-sat (not b!757096) (not start!65802) (not b!757085) (not b!757103) (not b!757090) (not b!757101) (not b!757087) (not b!757092) (not b!757100) (not b!757104) (not b!757083) (not b!757097) (not b!757086) (not b!757102) (not b!757095))
(check-sat)
