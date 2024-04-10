; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66756 () Bool)

(assert start!66756)

(declare-fun b!769076 () Bool)

(declare-fun res!520066 () Bool)

(declare-fun e!428276 () Bool)

(assert (=> b!769076 (=> (not res!520066) (not e!428276))))

(declare-datatypes ((array!42318 0))(
  ( (array!42319 (arr!20259 (Array (_ BitVec 32) (_ BitVec 64))) (size!20680 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42318)

(declare-datatypes ((List!14261 0))(
  ( (Nil!14258) (Cons!14257 (h!15356 (_ BitVec 64)) (t!20576 List!14261)) )
))
(declare-fun arrayNoDuplicates!0 (array!42318 (_ BitVec 32) List!14261) Bool)

(assert (=> b!769076 (= res!520066 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14258))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun e!428273 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!769077 () Bool)

(declare-datatypes ((SeekEntryResult!7859 0))(
  ( (MissingZero!7859 (index!33804 (_ BitVec 32))) (Found!7859 (index!33805 (_ BitVec 32))) (Intermediate!7859 (undefined!8671 Bool) (index!33806 (_ BitVec 32)) (x!64742 (_ BitVec 32))) (Undefined!7859) (MissingVacant!7859 (index!33807 (_ BitVec 32))) )
))
(declare-fun lt!342155 () SeekEntryResult!7859)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42318 (_ BitVec 32)) SeekEntryResult!7859)

(assert (=> b!769077 (= e!428273 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20259 a!3186) j!159) a!3186 mask!3328) lt!342155))))

(declare-fun res!520072 () Bool)

(declare-fun e!428270 () Bool)

(assert (=> start!66756 (=> (not res!520072) (not e!428270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66756 (= res!520072 (validMask!0 mask!3328))))

(assert (=> start!66756 e!428270))

(assert (=> start!66756 true))

(declare-fun array_inv!16055 (array!42318) Bool)

(assert (=> start!66756 (array_inv!16055 a!3186)))

(declare-fun b!769078 () Bool)

(declare-fun res!520061 () Bool)

(declare-fun e!428278 () Bool)

(assert (=> b!769078 (=> (not res!520061) (not e!428278))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!769078 (= res!520061 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20259 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!769079 () Bool)

(declare-fun res!520069 () Bool)

(assert (=> b!769079 (=> (not res!520069) (not e!428276))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!769079 (= res!520069 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20680 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20680 a!3186))))))

(declare-fun b!769080 () Bool)

(declare-fun res!520064 () Bool)

(assert (=> b!769080 (=> (not res!520064) (not e!428270))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!769080 (= res!520064 (validKeyInArray!0 k!2102))))

(declare-fun b!769081 () Bool)

(assert (=> b!769081 (= e!428270 e!428276)))

(declare-fun res!520067 () Bool)

(assert (=> b!769081 (=> (not res!520067) (not e!428276))))

(declare-fun lt!342148 () SeekEntryResult!7859)

(assert (=> b!769081 (= res!520067 (or (= lt!342148 (MissingZero!7859 i!1173)) (= lt!342148 (MissingVacant!7859 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42318 (_ BitVec 32)) SeekEntryResult!7859)

(assert (=> b!769081 (= lt!342148 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!769082 () Bool)

(declare-fun res!520062 () Bool)

(assert (=> b!769082 (=> (not res!520062) (not e!428270))))

(declare-fun arrayContainsKey!0 (array!42318 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!769082 (= res!520062 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!769083 () Bool)

(declare-fun e!428279 () Bool)

(assert (=> b!769083 (= e!428278 e!428279)))

(declare-fun res!520073 () Bool)

(assert (=> b!769083 (=> (not res!520073) (not e!428279))))

(declare-fun lt!342151 () SeekEntryResult!7859)

(declare-fun lt!342146 () SeekEntryResult!7859)

(assert (=> b!769083 (= res!520073 (= lt!342151 lt!342146))))

(declare-fun lt!342149 () array!42318)

(declare-fun lt!342150 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42318 (_ BitVec 32)) SeekEntryResult!7859)

(assert (=> b!769083 (= lt!342146 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!342150 lt!342149 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769083 (= lt!342151 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!342150 mask!3328) lt!342150 lt!342149 mask!3328))))

(assert (=> b!769083 (= lt!342150 (select (store (arr!20259 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!769083 (= lt!342149 (array!42319 (store (arr!20259 a!3186) i!1173 k!2102) (size!20680 a!3186)))))

(declare-fun b!769084 () Bool)

(declare-fun e!428271 () Bool)

(assert (=> b!769084 (= e!428271 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20259 a!3186) j!159) a!3186 mask!3328) (Found!7859 j!159)))))

(declare-fun b!769085 () Bool)

(declare-datatypes ((Unit!26450 0))(
  ( (Unit!26451) )
))
(declare-fun e!428275 () Unit!26450)

(declare-fun Unit!26452 () Unit!26450)

(assert (=> b!769085 (= e!428275 Unit!26452)))

(declare-fun lt!342153 () SeekEntryResult!7859)

(assert (=> b!769085 (= lt!342153 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20259 a!3186) j!159) a!3186 mask!3328))))

(declare-fun lt!342152 () (_ BitVec 32))

(assert (=> b!769085 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342152 resIntermediateIndex!5 (select (arr!20259 a!3186) j!159) a!3186 mask!3328) (Found!7859 j!159))))

(declare-fun b!769086 () Bool)

(declare-fun res!520068 () Bool)

(assert (=> b!769086 (=> (not res!520068) (not e!428278))))

(assert (=> b!769086 (= res!520068 e!428271)))

(declare-fun c!84904 () Bool)

(assert (=> b!769086 (= c!84904 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!769087 () Bool)

(declare-fun e!428272 () Bool)

(assert (=> b!769087 (= e!428272 true)))

(declare-fun lt!342154 () Unit!26450)

(assert (=> b!769087 (= lt!342154 e!428275)))

(declare-fun c!84903 () Bool)

(assert (=> b!769087 (= c!84903 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!769087 (= lt!342152 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!769088 () Bool)

(declare-fun res!520076 () Bool)

(assert (=> b!769088 (=> (not res!520076) (not e!428270))))

(assert (=> b!769088 (= res!520076 (validKeyInArray!0 (select (arr!20259 a!3186) j!159)))))

(declare-fun b!769089 () Bool)

(declare-fun Unit!26453 () Unit!26450)

(assert (=> b!769089 (= e!428275 Unit!26453)))

(declare-fun lt!342147 () SeekEntryResult!7859)

(assert (=> b!769089 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!342152 (select (arr!20259 a!3186) j!159) a!3186 mask!3328) lt!342147)))

(declare-fun b!769090 () Bool)

(declare-fun res!520065 () Bool)

(assert (=> b!769090 (=> (not res!520065) (not e!428270))))

(assert (=> b!769090 (= res!520065 (and (= (size!20680 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20680 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20680 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!769091 () Bool)

(assert (=> b!769091 (= e!428276 e!428278)))

(declare-fun res!520070 () Bool)

(assert (=> b!769091 (=> (not res!520070) (not e!428278))))

(assert (=> b!769091 (= res!520070 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20259 a!3186) j!159) mask!3328) (select (arr!20259 a!3186) j!159) a!3186 mask!3328) lt!342147))))

(assert (=> b!769091 (= lt!342147 (Intermediate!7859 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!769092 () Bool)

(assert (=> b!769092 (= e!428279 (not e!428272))))

(declare-fun res!520063 () Bool)

(assert (=> b!769092 (=> res!520063 e!428272)))

(assert (=> b!769092 (= res!520063 (or (not (is-Intermediate!7859 lt!342146)) (bvsge x!1131 (x!64742 lt!342146))))))

(declare-fun e!428274 () Bool)

(assert (=> b!769092 e!428274))

(declare-fun res!520074 () Bool)

(assert (=> b!769092 (=> (not res!520074) (not e!428274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42318 (_ BitVec 32)) Bool)

(assert (=> b!769092 (= res!520074 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!342145 () Unit!26450)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26450)

(assert (=> b!769092 (= lt!342145 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!769093 () Bool)

(declare-fun res!520075 () Bool)

(assert (=> b!769093 (=> (not res!520075) (not e!428276))))

(assert (=> b!769093 (= res!520075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!769094 () Bool)

(assert (=> b!769094 (= e!428274 e!428273)))

(declare-fun res!520071 () Bool)

(assert (=> b!769094 (=> (not res!520071) (not e!428273))))

(assert (=> b!769094 (= res!520071 (= (seekEntryOrOpen!0 (select (arr!20259 a!3186) j!159) a!3186 mask!3328) lt!342155))))

(assert (=> b!769094 (= lt!342155 (Found!7859 j!159))))

(declare-fun b!769095 () Bool)

(assert (=> b!769095 (= e!428271 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20259 a!3186) j!159) a!3186 mask!3328) lt!342147))))

(assert (= (and start!66756 res!520072) b!769090))

(assert (= (and b!769090 res!520065) b!769088))

(assert (= (and b!769088 res!520076) b!769080))

(assert (= (and b!769080 res!520064) b!769082))

(assert (= (and b!769082 res!520062) b!769081))

(assert (= (and b!769081 res!520067) b!769093))

(assert (= (and b!769093 res!520075) b!769076))

(assert (= (and b!769076 res!520066) b!769079))

(assert (= (and b!769079 res!520069) b!769091))

(assert (= (and b!769091 res!520070) b!769078))

(assert (= (and b!769078 res!520061) b!769086))

(assert (= (and b!769086 c!84904) b!769095))

(assert (= (and b!769086 (not c!84904)) b!769084))

(assert (= (and b!769086 res!520068) b!769083))

(assert (= (and b!769083 res!520073) b!769092))

(assert (= (and b!769092 res!520074) b!769094))

(assert (= (and b!769094 res!520071) b!769077))

(assert (= (and b!769092 (not res!520063)) b!769087))

(assert (= (and b!769087 c!84903) b!769089))

(assert (= (and b!769087 (not c!84903)) b!769085))

(declare-fun m!714539 () Bool)

(assert (=> b!769083 m!714539))

(declare-fun m!714541 () Bool)

(assert (=> b!769083 m!714541))

(assert (=> b!769083 m!714539))

(declare-fun m!714543 () Bool)

(assert (=> b!769083 m!714543))

(declare-fun m!714545 () Bool)

(assert (=> b!769083 m!714545))

(declare-fun m!714547 () Bool)

(assert (=> b!769083 m!714547))

(declare-fun m!714549 () Bool)

(assert (=> start!66756 m!714549))

(declare-fun m!714551 () Bool)

(assert (=> start!66756 m!714551))

(declare-fun m!714553 () Bool)

(assert (=> b!769084 m!714553))

(assert (=> b!769084 m!714553))

(declare-fun m!714555 () Bool)

(assert (=> b!769084 m!714555))

(assert (=> b!769077 m!714553))

(assert (=> b!769077 m!714553))

(declare-fun m!714557 () Bool)

(assert (=> b!769077 m!714557))

(assert (=> b!769085 m!714553))

(assert (=> b!769085 m!714553))

(assert (=> b!769085 m!714555))

(assert (=> b!769085 m!714553))

(declare-fun m!714559 () Bool)

(assert (=> b!769085 m!714559))

(declare-fun m!714561 () Bool)

(assert (=> b!769087 m!714561))

(declare-fun m!714563 () Bool)

(assert (=> b!769081 m!714563))

(assert (=> b!769095 m!714553))

(assert (=> b!769095 m!714553))

(declare-fun m!714565 () Bool)

(assert (=> b!769095 m!714565))

(assert (=> b!769089 m!714553))

(assert (=> b!769089 m!714553))

(declare-fun m!714567 () Bool)

(assert (=> b!769089 m!714567))

(declare-fun m!714569 () Bool)

(assert (=> b!769078 m!714569))

(assert (=> b!769088 m!714553))

(assert (=> b!769088 m!714553))

(declare-fun m!714571 () Bool)

(assert (=> b!769088 m!714571))

(declare-fun m!714573 () Bool)

(assert (=> b!769082 m!714573))

(declare-fun m!714575 () Bool)

(assert (=> b!769093 m!714575))

(assert (=> b!769091 m!714553))

(assert (=> b!769091 m!714553))

(declare-fun m!714577 () Bool)

(assert (=> b!769091 m!714577))

(assert (=> b!769091 m!714577))

(assert (=> b!769091 m!714553))

(declare-fun m!714579 () Bool)

(assert (=> b!769091 m!714579))

(declare-fun m!714581 () Bool)

(assert (=> b!769080 m!714581))

(assert (=> b!769094 m!714553))

(assert (=> b!769094 m!714553))

(declare-fun m!714583 () Bool)

(assert (=> b!769094 m!714583))

(declare-fun m!714585 () Bool)

(assert (=> b!769076 m!714585))

(declare-fun m!714587 () Bool)

(assert (=> b!769092 m!714587))

(declare-fun m!714589 () Bool)

(assert (=> b!769092 m!714589))

(push 1)

