; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67768 () Bool)

(assert start!67768)

(declare-fun b!787208 () Bool)

(declare-fun res!533131 () Bool)

(declare-fun e!437586 () Bool)

(assert (=> b!787208 (=> (not res!533131) (not e!437586))))

(declare-fun e!437578 () Bool)

(assert (=> b!787208 (= res!533131 e!437578)))

(declare-fun c!87450 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!787208 (= c!87450 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!787209 () Bool)

(declare-fun res!533132 () Bool)

(declare-fun e!437582 () Bool)

(assert (=> b!787209 (=> (not res!533132) (not e!437582))))

(declare-datatypes ((array!42808 0))(
  ( (array!42809 (arr!20492 (Array (_ BitVec 32) (_ BitVec 64))) (size!20913 (_ BitVec 32))) )
))
(declare-fun lt!351132 () array!42808)

(declare-fun lt!351129 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8092 0))(
  ( (MissingZero!8092 (index!34736 (_ BitVec 32))) (Found!8092 (index!34737 (_ BitVec 32))) (Intermediate!8092 (undefined!8904 Bool) (index!34738 (_ BitVec 32)) (x!65672 (_ BitVec 32))) (Undefined!8092) (MissingVacant!8092 (index!34739 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42808 (_ BitVec 32)) SeekEntryResult!8092)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42808 (_ BitVec 32)) SeekEntryResult!8092)

(assert (=> b!787209 (= res!533132 (= (seekEntryOrOpen!0 lt!351129 lt!351132 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!351129 lt!351132 mask!3328)))))

(declare-fun b!787210 () Bool)

(declare-fun lt!351135 () SeekEntryResult!8092)

(declare-fun lt!351133 () SeekEntryResult!8092)

(assert (=> b!787210 (= e!437582 (= lt!351135 lt!351133))))

(declare-fun b!787211 () Bool)

(declare-fun e!437581 () Bool)

(assert (=> b!787211 (= e!437581 true)))

(assert (=> b!787211 e!437582))

(declare-fun res!533125 () Bool)

(assert (=> b!787211 (=> (not res!533125) (not e!437582))))

(declare-fun lt!351134 () (_ BitVec 64))

(assert (=> b!787211 (= res!533125 (= lt!351134 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27256 0))(
  ( (Unit!27257) )
))
(declare-fun lt!351131 () Unit!27256)

(declare-fun e!437584 () Unit!27256)

(assert (=> b!787211 (= lt!351131 e!437584)))

(declare-fun c!87451 () Bool)

(assert (=> b!787211 (= c!87451 (= lt!351134 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!787212 () Bool)

(declare-fun e!437577 () Bool)

(assert (=> b!787212 (= e!437577 e!437581)))

(declare-fun res!533138 () Bool)

(assert (=> b!787212 (=> res!533138 e!437581)))

(assert (=> b!787212 (= res!533138 (= lt!351134 lt!351129))))

(declare-fun a!3186 () array!42808)

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!787212 (= lt!351134 (select (store (arr!20492 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!787213 () Bool)

(declare-fun Unit!27258 () Unit!27256)

(assert (=> b!787213 (= e!437584 Unit!27258)))

(declare-fun b!787214 () Bool)

(declare-fun res!533133 () Bool)

(declare-fun e!437588 () Bool)

(assert (=> b!787214 (=> (not res!533133) (not e!437588))))

(declare-datatypes ((List!14494 0))(
  ( (Nil!14491) (Cons!14490 (h!15613 (_ BitVec 64)) (t!20809 List!14494)) )
))
(declare-fun arrayNoDuplicates!0 (array!42808 (_ BitVec 32) List!14494) Bool)

(assert (=> b!787214 (= res!533133 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14491))))

(declare-fun res!533137 () Bool)

(declare-fun e!437579 () Bool)

(assert (=> start!67768 (=> (not res!533137) (not e!437579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67768 (= res!533137 (validMask!0 mask!3328))))

(assert (=> start!67768 e!437579))

(assert (=> start!67768 true))

(declare-fun array_inv!16288 (array!42808) Bool)

(assert (=> start!67768 (array_inv!16288 a!3186)))

(declare-fun b!787215 () Bool)

(declare-fun e!437585 () Bool)

(assert (=> b!787215 (= e!437586 e!437585)))

(declare-fun res!533127 () Bool)

(assert (=> b!787215 (=> (not res!533127) (not e!437585))))

(declare-fun lt!351140 () SeekEntryResult!8092)

(declare-fun lt!351139 () SeekEntryResult!8092)

(assert (=> b!787215 (= res!533127 (= lt!351140 lt!351139))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42808 (_ BitVec 32)) SeekEntryResult!8092)

(assert (=> b!787215 (= lt!351139 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!351129 lt!351132 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!787215 (= lt!351140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!351129 mask!3328) lt!351129 lt!351132 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!787215 (= lt!351129 (select (store (arr!20492 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!787215 (= lt!351132 (array!42809 (store (arr!20492 a!3186) i!1173 k!2102) (size!20913 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!351130 () SeekEntryResult!8092)

(declare-fun b!787216 () Bool)

(declare-fun e!437587 () Bool)

(assert (=> b!787216 (= e!437587 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20492 a!3186) j!159) a!3186 mask!3328) lt!351130))))

(declare-fun b!787217 () Bool)

(assert (=> b!787217 (= e!437578 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20492 a!3186) j!159) a!3186 mask!3328) (Found!8092 j!159)))))

(declare-fun b!787218 () Bool)

(declare-fun e!437580 () Bool)

(assert (=> b!787218 (= e!437585 (not e!437580))))

(declare-fun res!533123 () Bool)

(assert (=> b!787218 (=> res!533123 e!437580)))

(assert (=> b!787218 (= res!533123 (or (not (is-Intermediate!8092 lt!351139)) (bvslt x!1131 (x!65672 lt!351139)) (not (= x!1131 (x!65672 lt!351139))) (not (= index!1321 (index!34738 lt!351139)))))))

(assert (=> b!787218 e!437587))

(declare-fun res!533128 () Bool)

(assert (=> b!787218 (=> (not res!533128) (not e!437587))))

(assert (=> b!787218 (= res!533128 (= lt!351135 lt!351130))))

(assert (=> b!787218 (= lt!351130 (Found!8092 j!159))))

(assert (=> b!787218 (= lt!351135 (seekEntryOrOpen!0 (select (arr!20492 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42808 (_ BitVec 32)) Bool)

(assert (=> b!787218 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!351137 () Unit!27256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42808 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27256)

(assert (=> b!787218 (= lt!351137 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!787219 () Bool)

(declare-fun Unit!27259 () Unit!27256)

(assert (=> b!787219 (= e!437584 Unit!27259)))

(assert (=> b!787219 false))

(declare-fun b!787220 () Bool)

(assert (=> b!787220 (= e!437579 e!437588)))

(declare-fun res!533136 () Bool)

(assert (=> b!787220 (=> (not res!533136) (not e!437588))))

(declare-fun lt!351138 () SeekEntryResult!8092)

(assert (=> b!787220 (= res!533136 (or (= lt!351138 (MissingZero!8092 i!1173)) (= lt!351138 (MissingVacant!8092 i!1173))))))

(assert (=> b!787220 (= lt!351138 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!787221 () Bool)

(assert (=> b!787221 (= e!437588 e!437586)))

(declare-fun res!533135 () Bool)

(assert (=> b!787221 (=> (not res!533135) (not e!437586))))

(declare-fun lt!351136 () SeekEntryResult!8092)

(assert (=> b!787221 (= res!533135 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20492 a!3186) j!159) mask!3328) (select (arr!20492 a!3186) j!159) a!3186 mask!3328) lt!351136))))

(assert (=> b!787221 (= lt!351136 (Intermediate!8092 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!787222 () Bool)

(assert (=> b!787222 (= e!437580 e!437577)))

(declare-fun res!533141 () Bool)

(assert (=> b!787222 (=> res!533141 e!437577)))

(assert (=> b!787222 (= res!533141 (not (= lt!351133 lt!351130)))))

(assert (=> b!787222 (= lt!351133 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20492 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!787223 () Bool)

(declare-fun res!533130 () Bool)

(assert (=> b!787223 (=> (not res!533130) (not e!437579))))

(declare-fun arrayContainsKey!0 (array!42808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!787223 (= res!533130 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!787224 () Bool)

(declare-fun res!533134 () Bool)

(assert (=> b!787224 (=> (not res!533134) (not e!437588))))

(assert (=> b!787224 (= res!533134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!787225 () Bool)

(declare-fun res!533139 () Bool)

(assert (=> b!787225 (=> (not res!533139) (not e!437586))))

(assert (=> b!787225 (= res!533139 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20492 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!787226 () Bool)

(declare-fun res!533140 () Bool)

(assert (=> b!787226 (=> (not res!533140) (not e!437579))))

(assert (=> b!787226 (= res!533140 (and (= (size!20913 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20913 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20913 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!787227 () Bool)

(assert (=> b!787227 (= e!437578 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20492 a!3186) j!159) a!3186 mask!3328) lt!351136))))

(declare-fun b!787228 () Bool)

(declare-fun res!533126 () Bool)

(assert (=> b!787228 (=> (not res!533126) (not e!437579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!787228 (= res!533126 (validKeyInArray!0 k!2102))))

(declare-fun b!787229 () Bool)

(declare-fun res!533124 () Bool)

(assert (=> b!787229 (=> (not res!533124) (not e!437588))))

(assert (=> b!787229 (= res!533124 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20913 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20913 a!3186))))))

(declare-fun b!787230 () Bool)

(declare-fun res!533129 () Bool)

(assert (=> b!787230 (=> (not res!533129) (not e!437579))))

(assert (=> b!787230 (= res!533129 (validKeyInArray!0 (select (arr!20492 a!3186) j!159)))))

(assert (= (and start!67768 res!533137) b!787226))

(assert (= (and b!787226 res!533140) b!787230))

(assert (= (and b!787230 res!533129) b!787228))

(assert (= (and b!787228 res!533126) b!787223))

(assert (= (and b!787223 res!533130) b!787220))

(assert (= (and b!787220 res!533136) b!787224))

(assert (= (and b!787224 res!533134) b!787214))

(assert (= (and b!787214 res!533133) b!787229))

(assert (= (and b!787229 res!533124) b!787221))

(assert (= (and b!787221 res!533135) b!787225))

(assert (= (and b!787225 res!533139) b!787208))

(assert (= (and b!787208 c!87450) b!787227))

(assert (= (and b!787208 (not c!87450)) b!787217))

(assert (= (and b!787208 res!533131) b!787215))

(assert (= (and b!787215 res!533127) b!787218))

(assert (= (and b!787218 res!533128) b!787216))

(assert (= (and b!787218 (not res!533123)) b!787222))

(assert (= (and b!787222 (not res!533141)) b!787212))

(assert (= (and b!787212 (not res!533138)) b!787211))

(assert (= (and b!787211 c!87451) b!787219))

(assert (= (and b!787211 (not c!87451)) b!787213))

(assert (= (and b!787211 res!533125) b!787209))

(assert (= (and b!787209 res!533132) b!787210))

(declare-fun m!728845 () Bool)

(assert (=> b!787212 m!728845))

(declare-fun m!728847 () Bool)

(assert (=> b!787212 m!728847))

(declare-fun m!728849 () Bool)

(assert (=> b!787220 m!728849))

(declare-fun m!728851 () Bool)

(assert (=> b!787216 m!728851))

(assert (=> b!787216 m!728851))

(declare-fun m!728853 () Bool)

(assert (=> b!787216 m!728853))

(declare-fun m!728855 () Bool)

(assert (=> b!787209 m!728855))

(declare-fun m!728857 () Bool)

(assert (=> b!787209 m!728857))

(assert (=> b!787222 m!728851))

(assert (=> b!787222 m!728851))

(declare-fun m!728859 () Bool)

(assert (=> b!787222 m!728859))

(assert (=> b!787221 m!728851))

(assert (=> b!787221 m!728851))

(declare-fun m!728861 () Bool)

(assert (=> b!787221 m!728861))

(assert (=> b!787221 m!728861))

(assert (=> b!787221 m!728851))

(declare-fun m!728863 () Bool)

(assert (=> b!787221 m!728863))

(declare-fun m!728865 () Bool)

(assert (=> b!787228 m!728865))

(assert (=> b!787227 m!728851))

(assert (=> b!787227 m!728851))

(declare-fun m!728867 () Bool)

(assert (=> b!787227 m!728867))

(assert (=> b!787215 m!728845))

(declare-fun m!728869 () Bool)

(assert (=> b!787215 m!728869))

(declare-fun m!728871 () Bool)

(assert (=> b!787215 m!728871))

(declare-fun m!728873 () Bool)

(assert (=> b!787215 m!728873))

(declare-fun m!728875 () Bool)

(assert (=> b!787215 m!728875))

(assert (=> b!787215 m!728873))

(declare-fun m!728877 () Bool)

(assert (=> b!787214 m!728877))

(assert (=> b!787217 m!728851))

(assert (=> b!787217 m!728851))

(assert (=> b!787217 m!728859))

(declare-fun m!728879 () Bool)

(assert (=> b!787225 m!728879))

(declare-fun m!728881 () Bool)

(assert (=> start!67768 m!728881))

(declare-fun m!728883 () Bool)

(assert (=> start!67768 m!728883))

(assert (=> b!787230 m!728851))

(assert (=> b!787230 m!728851))

(declare-fun m!728885 () Bool)

(assert (=> b!787230 m!728885))

(declare-fun m!728887 () Bool)

(assert (=> b!787223 m!728887))

(assert (=> b!787218 m!728851))

(assert (=> b!787218 m!728851))

(declare-fun m!728889 () Bool)

(assert (=> b!787218 m!728889))

(declare-fun m!728891 () Bool)

(assert (=> b!787218 m!728891))

(declare-fun m!728893 () Bool)

(assert (=> b!787218 m!728893))

(declare-fun m!728895 () Bool)

(assert (=> b!787224 m!728895))

(push 1)

