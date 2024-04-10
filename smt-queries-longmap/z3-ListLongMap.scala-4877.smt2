; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67178 () Bool)

(assert start!67178)

(declare-fun b!776812 () Bool)

(declare-fun res!525581 () Bool)

(declare-fun e!432252 () Bool)

(assert (=> b!776812 (=> (not res!525581) (not e!432252))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776812 (= res!525581 (validKeyInArray!0 k0!2102))))

(declare-fun b!776813 () Bool)

(declare-fun e!432254 () Bool)

(declare-fun e!432257 () Bool)

(assert (=> b!776813 (= e!432254 e!432257)))

(declare-fun res!525583 () Bool)

(assert (=> b!776813 (=> (not res!525583) (not e!432257))))

(declare-datatypes ((SeekEntryResult!7962 0))(
  ( (MissingZero!7962 (index!34216 (_ BitVec 32))) (Found!7962 (index!34217 (_ BitVec 32))) (Intermediate!7962 (undefined!8774 Bool) (index!34218 (_ BitVec 32)) (x!65153 (_ BitVec 32))) (Undefined!7962) (MissingVacant!7962 (index!34219 (_ BitVec 32))) )
))
(declare-fun lt!346113 () SeekEntryResult!7962)

(declare-fun lt!346110 () SeekEntryResult!7962)

(assert (=> b!776813 (= res!525583 (= lt!346113 lt!346110))))

(declare-fun lt!346115 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42533 0))(
  ( (array!42534 (arr!20362 (Array (_ BitVec 32) (_ BitVec 64))) (size!20783 (_ BitVec 32))) )
))
(declare-fun lt!346114 () array!42533)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42533 (_ BitVec 32)) SeekEntryResult!7962)

(assert (=> b!776813 (= lt!346110 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!346115 lt!346114 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776813 (= lt!346113 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!346115 mask!3328) lt!346115 lt!346114 mask!3328))))

(declare-fun a!3186 () array!42533)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776813 (= lt!346115 (select (store (arr!20362 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776813 (= lt!346114 (array!42534 (store (arr!20362 a!3186) i!1173 k0!2102) (size!20783 a!3186)))))

(declare-fun b!776814 () Bool)

(declare-fun e!432259 () Bool)

(declare-fun e!432253 () Bool)

(assert (=> b!776814 (= e!432259 e!432253)))

(declare-fun res!525580 () Bool)

(assert (=> b!776814 (=> (not res!525580) (not e!432253))))

(declare-fun lt!346107 () SeekEntryResult!7962)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42533 (_ BitVec 32)) SeekEntryResult!7962)

(assert (=> b!776814 (= res!525580 (= (seekEntryOrOpen!0 (select (arr!20362 a!3186) j!159) a!3186 mask!3328) lt!346107))))

(assert (=> b!776814 (= lt!346107 (Found!7962 j!159))))

(declare-fun b!776815 () Bool)

(declare-fun e!432260 () Bool)

(assert (=> b!776815 (= e!432260 true)))

(declare-fun lt!346111 () SeekEntryResult!7962)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42533 (_ BitVec 32)) SeekEntryResult!7962)

(assert (=> b!776815 (= lt!346111 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20362 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776817 () Bool)

(assert (=> b!776817 (= e!432257 (not e!432260))))

(declare-fun res!525573 () Bool)

(assert (=> b!776817 (=> res!525573 e!432260)))

(get-info :version)

(assert (=> b!776817 (= res!525573 (or (not ((_ is Intermediate!7962) lt!346110)) (bvslt x!1131 (x!65153 lt!346110)) (not (= x!1131 (x!65153 lt!346110))) (not (= index!1321 (index!34218 lt!346110)))))))

(assert (=> b!776817 e!432259))

(declare-fun res!525582 () Bool)

(assert (=> b!776817 (=> (not res!525582) (not e!432259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42533 (_ BitVec 32)) Bool)

(assert (=> b!776817 (= res!525582 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26818 0))(
  ( (Unit!26819) )
))
(declare-fun lt!346112 () Unit!26818)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42533 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26818)

(assert (=> b!776817 (= lt!346112 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776818 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!776818 (= e!432253 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20362 a!3186) j!159) a!3186 mask!3328) lt!346107))))

(declare-fun b!776819 () Bool)

(declare-fun res!525584 () Bool)

(assert (=> b!776819 (=> (not res!525584) (not e!432252))))

(declare-fun arrayContainsKey!0 (array!42533 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776819 (= res!525584 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776820 () Bool)

(declare-fun res!525586 () Bool)

(assert (=> b!776820 (=> (not res!525586) (not e!432254))))

(declare-fun e!432256 () Bool)

(assert (=> b!776820 (= res!525586 e!432256)))

(declare-fun c!86020 () Bool)

(assert (=> b!776820 (= c!86020 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776821 () Bool)

(assert (=> b!776821 (= e!432256 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20362 a!3186) j!159) a!3186 mask!3328) (Found!7962 j!159)))))

(declare-fun b!776822 () Bool)

(declare-fun res!525579 () Bool)

(assert (=> b!776822 (=> (not res!525579) (not e!432252))))

(assert (=> b!776822 (= res!525579 (and (= (size!20783 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20783 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20783 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776823 () Bool)

(declare-fun res!525574 () Bool)

(declare-fun e!432255 () Bool)

(assert (=> b!776823 (=> (not res!525574) (not e!432255))))

(assert (=> b!776823 (= res!525574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776824 () Bool)

(declare-fun res!525577 () Bool)

(assert (=> b!776824 (=> (not res!525577) (not e!432255))))

(declare-datatypes ((List!14364 0))(
  ( (Nil!14361) (Cons!14360 (h!15468 (_ BitVec 64)) (t!20679 List!14364)) )
))
(declare-fun arrayNoDuplicates!0 (array!42533 (_ BitVec 32) List!14364) Bool)

(assert (=> b!776824 (= res!525577 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14361))))

(declare-fun res!525576 () Bool)

(assert (=> start!67178 (=> (not res!525576) (not e!432252))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67178 (= res!525576 (validMask!0 mask!3328))))

(assert (=> start!67178 e!432252))

(assert (=> start!67178 true))

(declare-fun array_inv!16158 (array!42533) Bool)

(assert (=> start!67178 (array_inv!16158 a!3186)))

(declare-fun b!776816 () Bool)

(declare-fun lt!346109 () SeekEntryResult!7962)

(assert (=> b!776816 (= e!432256 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20362 a!3186) j!159) a!3186 mask!3328) lt!346109))))

(declare-fun b!776825 () Bool)

(declare-fun res!525572 () Bool)

(assert (=> b!776825 (=> (not res!525572) (not e!432255))))

(assert (=> b!776825 (= res!525572 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20783 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20783 a!3186))))))

(declare-fun b!776826 () Bool)

(declare-fun res!525585 () Bool)

(assert (=> b!776826 (=> (not res!525585) (not e!432252))))

(assert (=> b!776826 (= res!525585 (validKeyInArray!0 (select (arr!20362 a!3186) j!159)))))

(declare-fun b!776827 () Bool)

(declare-fun res!525587 () Bool)

(assert (=> b!776827 (=> (not res!525587) (not e!432254))))

(assert (=> b!776827 (= res!525587 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20362 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776828 () Bool)

(assert (=> b!776828 (= e!432252 e!432255)))

(declare-fun res!525575 () Bool)

(assert (=> b!776828 (=> (not res!525575) (not e!432255))))

(declare-fun lt!346108 () SeekEntryResult!7962)

(assert (=> b!776828 (= res!525575 (or (= lt!346108 (MissingZero!7962 i!1173)) (= lt!346108 (MissingVacant!7962 i!1173))))))

(assert (=> b!776828 (= lt!346108 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776829 () Bool)

(assert (=> b!776829 (= e!432255 e!432254)))

(declare-fun res!525578 () Bool)

(assert (=> b!776829 (=> (not res!525578) (not e!432254))))

(assert (=> b!776829 (= res!525578 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20362 a!3186) j!159) mask!3328) (select (arr!20362 a!3186) j!159) a!3186 mask!3328) lt!346109))))

(assert (=> b!776829 (= lt!346109 (Intermediate!7962 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!67178 res!525576) b!776822))

(assert (= (and b!776822 res!525579) b!776826))

(assert (= (and b!776826 res!525585) b!776812))

(assert (= (and b!776812 res!525581) b!776819))

(assert (= (and b!776819 res!525584) b!776828))

(assert (= (and b!776828 res!525575) b!776823))

(assert (= (and b!776823 res!525574) b!776824))

(assert (= (and b!776824 res!525577) b!776825))

(assert (= (and b!776825 res!525572) b!776829))

(assert (= (and b!776829 res!525578) b!776827))

(assert (= (and b!776827 res!525587) b!776820))

(assert (= (and b!776820 c!86020) b!776816))

(assert (= (and b!776820 (not c!86020)) b!776821))

(assert (= (and b!776820 res!525586) b!776813))

(assert (= (and b!776813 res!525583) b!776817))

(assert (= (and b!776817 res!525582) b!776814))

(assert (= (and b!776814 res!525580) b!776818))

(assert (= (and b!776817 (not res!525573)) b!776815))

(declare-fun m!720837 () Bool)

(assert (=> b!776826 m!720837))

(assert (=> b!776826 m!720837))

(declare-fun m!720839 () Bool)

(assert (=> b!776826 m!720839))

(declare-fun m!720841 () Bool)

(assert (=> b!776817 m!720841))

(declare-fun m!720843 () Bool)

(assert (=> b!776817 m!720843))

(declare-fun m!720845 () Bool)

(assert (=> b!776823 m!720845))

(declare-fun m!720847 () Bool)

(assert (=> b!776812 m!720847))

(assert (=> b!776818 m!720837))

(assert (=> b!776818 m!720837))

(declare-fun m!720849 () Bool)

(assert (=> b!776818 m!720849))

(declare-fun m!720851 () Bool)

(assert (=> b!776824 m!720851))

(declare-fun m!720853 () Bool)

(assert (=> start!67178 m!720853))

(declare-fun m!720855 () Bool)

(assert (=> start!67178 m!720855))

(assert (=> b!776816 m!720837))

(assert (=> b!776816 m!720837))

(declare-fun m!720857 () Bool)

(assert (=> b!776816 m!720857))

(assert (=> b!776814 m!720837))

(assert (=> b!776814 m!720837))

(declare-fun m!720859 () Bool)

(assert (=> b!776814 m!720859))

(declare-fun m!720861 () Bool)

(assert (=> b!776828 m!720861))

(declare-fun m!720863 () Bool)

(assert (=> b!776819 m!720863))

(declare-fun m!720865 () Bool)

(assert (=> b!776827 m!720865))

(assert (=> b!776821 m!720837))

(assert (=> b!776821 m!720837))

(declare-fun m!720867 () Bool)

(assert (=> b!776821 m!720867))

(assert (=> b!776815 m!720837))

(assert (=> b!776815 m!720837))

(assert (=> b!776815 m!720867))

(declare-fun m!720869 () Bool)

(assert (=> b!776813 m!720869))

(declare-fun m!720871 () Bool)

(assert (=> b!776813 m!720871))

(declare-fun m!720873 () Bool)

(assert (=> b!776813 m!720873))

(declare-fun m!720875 () Bool)

(assert (=> b!776813 m!720875))

(assert (=> b!776813 m!720871))

(declare-fun m!720877 () Bool)

(assert (=> b!776813 m!720877))

(assert (=> b!776829 m!720837))

(assert (=> b!776829 m!720837))

(declare-fun m!720879 () Bool)

(assert (=> b!776829 m!720879))

(assert (=> b!776829 m!720879))

(assert (=> b!776829 m!720837))

(declare-fun m!720881 () Bool)

(assert (=> b!776829 m!720881))

(check-sat (not b!776821) (not b!776829) (not b!776817) (not b!776814) (not b!776824) (not b!776818) (not b!776813) (not b!776815) (not b!776823) (not b!776819) (not b!776828) (not b!776816) (not b!776812) (not start!67178) (not b!776826))
(check-sat)
