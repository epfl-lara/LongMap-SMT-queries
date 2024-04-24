; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67834 () Bool)

(assert start!67834)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!42754 0))(
  ( (array!42755 (arr!20461 (Array (_ BitVec 32) (_ BitVec 64))) (size!20881 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42754)

(declare-fun b!786059 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8017 0))(
  ( (MissingZero!8017 (index!34436 (_ BitVec 32))) (Found!8017 (index!34437 (_ BitVec 32))) (Intermediate!8017 (undefined!8829 Bool) (index!34438 (_ BitVec 32)) (x!65544 (_ BitVec 32))) (Undefined!8017) (MissingVacant!8017 (index!34439 (_ BitVec 32))) )
))
(declare-fun lt!350472 () SeekEntryResult!8017)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun e!437066 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42754 (_ BitVec 32)) SeekEntryResult!8017)

(assert (=> b!786059 (= e!437066 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20461 a!3186) j!159) a!3186 mask!3328) lt!350472))))

(declare-fun b!786060 () Bool)

(declare-fun e!437065 () Bool)

(declare-fun lt!350475 () SeekEntryResult!8017)

(declare-fun lt!350466 () SeekEntryResult!8017)

(assert (=> b!786060 (= e!437065 (= lt!350475 lt!350466))))

(declare-fun b!786061 () Bool)

(declare-fun res!531918 () Bool)

(declare-fun e!437058 () Bool)

(assert (=> b!786061 (=> (not res!531918) (not e!437058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42754 (_ BitVec 32)) Bool)

(assert (=> b!786061 (= res!531918 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786062 () Bool)

(declare-fun res!531928 () Bool)

(declare-fun e!437064 () Bool)

(assert (=> b!786062 (=> (not res!531928) (not e!437064))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786062 (= res!531928 (validKeyInArray!0 k0!2102))))

(declare-fun b!786064 () Bool)

(declare-fun e!437057 () Bool)

(assert (=> b!786064 (= e!437058 e!437057)))

(declare-fun res!531915 () Bool)

(assert (=> b!786064 (=> (not res!531915) (not e!437057))))

(declare-fun lt!350473 () SeekEntryResult!8017)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42754 (_ BitVec 32)) SeekEntryResult!8017)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786064 (= res!531915 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20461 a!3186) j!159) mask!3328) (select (arr!20461 a!3186) j!159) a!3186 mask!3328) lt!350473))))

(assert (=> b!786064 (= lt!350473 (Intermediate!8017 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786065 () Bool)

(declare-fun res!531920 () Bool)

(assert (=> b!786065 (=> (not res!531920) (not e!437064))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786065 (= res!531920 (and (= (size!20881 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20881 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20881 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786066 () Bool)

(declare-fun e!437060 () Bool)

(declare-fun e!437067 () Bool)

(assert (=> b!786066 (= e!437060 e!437067)))

(declare-fun res!531913 () Bool)

(assert (=> b!786066 (=> res!531913 e!437067)))

(declare-fun lt!350465 () (_ BitVec 64))

(declare-fun lt!350476 () (_ BitVec 64))

(assert (=> b!786066 (= res!531913 (= lt!350465 lt!350476))))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!786066 (= lt!350465 (select (store (arr!20461 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!786067 () Bool)

(declare-datatypes ((Unit!27133 0))(
  ( (Unit!27134) )
))
(declare-fun e!437062 () Unit!27133)

(declare-fun Unit!27135 () Unit!27133)

(assert (=> b!786067 (= e!437062 Unit!27135)))

(declare-fun b!786068 () Bool)

(declare-fun e!437061 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!786068 (= e!437061 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20461 a!3186) j!159) a!3186 mask!3328) (Found!8017 j!159)))))

(declare-fun b!786069 () Bool)

(declare-fun res!531922 () Bool)

(assert (=> b!786069 (=> (not res!531922) (not e!437057))))

(assert (=> b!786069 (= res!531922 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20461 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786070 () Bool)

(assert (=> b!786070 (= e!437067 true)))

(assert (=> b!786070 e!437065))

(declare-fun res!531927 () Bool)

(assert (=> b!786070 (=> (not res!531927) (not e!437065))))

(assert (=> b!786070 (= res!531927 (= lt!350465 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350469 () Unit!27133)

(assert (=> b!786070 (= lt!350469 e!437062)))

(declare-fun c!87484 () Bool)

(assert (=> b!786070 (= c!87484 (= lt!350465 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786071 () Bool)

(declare-fun res!531925 () Bool)

(assert (=> b!786071 (=> (not res!531925) (not e!437064))))

(assert (=> b!786071 (= res!531925 (validKeyInArray!0 (select (arr!20461 a!3186) j!159)))))

(declare-fun b!786063 () Bool)

(assert (=> b!786063 (= e!437061 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20461 a!3186) j!159) a!3186 mask!3328) lt!350473))))

(declare-fun res!531921 () Bool)

(assert (=> start!67834 (=> (not res!531921) (not e!437064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67834 (= res!531921 (validMask!0 mask!3328))))

(assert (=> start!67834 e!437064))

(assert (=> start!67834 true))

(declare-fun array_inv!16320 (array!42754) Bool)

(assert (=> start!67834 (array_inv!16320 a!3186)))

(declare-fun b!786072 () Bool)

(declare-fun e!437068 () Bool)

(assert (=> b!786072 (= e!437057 e!437068)))

(declare-fun res!531916 () Bool)

(assert (=> b!786072 (=> (not res!531916) (not e!437068))))

(declare-fun lt!350474 () SeekEntryResult!8017)

(declare-fun lt!350471 () SeekEntryResult!8017)

(assert (=> b!786072 (= res!531916 (= lt!350474 lt!350471))))

(declare-fun lt!350470 () array!42754)

(assert (=> b!786072 (= lt!350471 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350476 lt!350470 mask!3328))))

(assert (=> b!786072 (= lt!350474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350476 mask!3328) lt!350476 lt!350470 mask!3328))))

(assert (=> b!786072 (= lt!350476 (select (store (arr!20461 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786072 (= lt!350470 (array!42755 (store (arr!20461 a!3186) i!1173 k0!2102) (size!20881 a!3186)))))

(declare-fun b!786073 () Bool)

(declare-fun e!437063 () Bool)

(assert (=> b!786073 (= e!437068 (not e!437063))))

(declare-fun res!531926 () Bool)

(assert (=> b!786073 (=> res!531926 e!437063)))

(get-info :version)

(assert (=> b!786073 (= res!531926 (or (not ((_ is Intermediate!8017) lt!350471)) (bvslt x!1131 (x!65544 lt!350471)) (not (= x!1131 (x!65544 lt!350471))) (not (= index!1321 (index!34438 lt!350471)))))))

(assert (=> b!786073 e!437066))

(declare-fun res!531919 () Bool)

(assert (=> b!786073 (=> (not res!531919) (not e!437066))))

(assert (=> b!786073 (= res!531919 (= lt!350475 lt!350472))))

(assert (=> b!786073 (= lt!350472 (Found!8017 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42754 (_ BitVec 32)) SeekEntryResult!8017)

(assert (=> b!786073 (= lt!350475 (seekEntryOrOpen!0 (select (arr!20461 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!786073 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350468 () Unit!27133)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42754 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27133)

(assert (=> b!786073 (= lt!350468 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786074 () Bool)

(declare-fun res!531914 () Bool)

(assert (=> b!786074 (=> (not res!531914) (not e!437058))))

(declare-datatypes ((List!14370 0))(
  ( (Nil!14367) (Cons!14366 (h!15495 (_ BitVec 64)) (t!20677 List!14370)) )
))
(declare-fun arrayNoDuplicates!0 (array!42754 (_ BitVec 32) List!14370) Bool)

(assert (=> b!786074 (= res!531914 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14367))))

(declare-fun b!786075 () Bool)

(assert (=> b!786075 (= e!437063 e!437060)))

(declare-fun res!531923 () Bool)

(assert (=> b!786075 (=> res!531923 e!437060)))

(assert (=> b!786075 (= res!531923 (not (= lt!350466 lt!350472)))))

(assert (=> b!786075 (= lt!350466 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20461 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786076 () Bool)

(declare-fun res!531912 () Bool)

(assert (=> b!786076 (=> (not res!531912) (not e!437058))))

(assert (=> b!786076 (= res!531912 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20881 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20881 a!3186))))))

(declare-fun b!786077 () Bool)

(declare-fun res!531917 () Bool)

(assert (=> b!786077 (=> (not res!531917) (not e!437057))))

(assert (=> b!786077 (= res!531917 e!437061)))

(declare-fun c!87485 () Bool)

(assert (=> b!786077 (= c!87485 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786078 () Bool)

(assert (=> b!786078 (= e!437064 e!437058)))

(declare-fun res!531930 () Bool)

(assert (=> b!786078 (=> (not res!531930) (not e!437058))))

(declare-fun lt!350467 () SeekEntryResult!8017)

(assert (=> b!786078 (= res!531930 (or (= lt!350467 (MissingZero!8017 i!1173)) (= lt!350467 (MissingVacant!8017 i!1173))))))

(assert (=> b!786078 (= lt!350467 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!786079 () Bool)

(declare-fun res!531929 () Bool)

(assert (=> b!786079 (=> (not res!531929) (not e!437064))))

(declare-fun arrayContainsKey!0 (array!42754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786079 (= res!531929 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786080 () Bool)

(declare-fun Unit!27136 () Unit!27133)

(assert (=> b!786080 (= e!437062 Unit!27136)))

(assert (=> b!786080 false))

(declare-fun b!786081 () Bool)

(declare-fun res!531924 () Bool)

(assert (=> b!786081 (=> (not res!531924) (not e!437065))))

(assert (=> b!786081 (= res!531924 (= (seekEntryOrOpen!0 lt!350476 lt!350470 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350476 lt!350470 mask!3328)))))

(assert (= (and start!67834 res!531921) b!786065))

(assert (= (and b!786065 res!531920) b!786071))

(assert (= (and b!786071 res!531925) b!786062))

(assert (= (and b!786062 res!531928) b!786079))

(assert (= (and b!786079 res!531929) b!786078))

(assert (= (and b!786078 res!531930) b!786061))

(assert (= (and b!786061 res!531918) b!786074))

(assert (= (and b!786074 res!531914) b!786076))

(assert (= (and b!786076 res!531912) b!786064))

(assert (= (and b!786064 res!531915) b!786069))

(assert (= (and b!786069 res!531922) b!786077))

(assert (= (and b!786077 c!87485) b!786063))

(assert (= (and b!786077 (not c!87485)) b!786068))

(assert (= (and b!786077 res!531917) b!786072))

(assert (= (and b!786072 res!531916) b!786073))

(assert (= (and b!786073 res!531919) b!786059))

(assert (= (and b!786073 (not res!531926)) b!786075))

(assert (= (and b!786075 (not res!531923)) b!786066))

(assert (= (and b!786066 (not res!531913)) b!786070))

(assert (= (and b!786070 c!87484) b!786080))

(assert (= (and b!786070 (not c!87484)) b!786067))

(assert (= (and b!786070 res!531927) b!786081))

(assert (= (and b!786081 res!531924) b!786060))

(declare-fun m!728555 () Bool)

(assert (=> b!786064 m!728555))

(assert (=> b!786064 m!728555))

(declare-fun m!728557 () Bool)

(assert (=> b!786064 m!728557))

(assert (=> b!786064 m!728557))

(assert (=> b!786064 m!728555))

(declare-fun m!728559 () Bool)

(assert (=> b!786064 m!728559))

(declare-fun m!728561 () Bool)

(assert (=> b!786072 m!728561))

(declare-fun m!728563 () Bool)

(assert (=> b!786072 m!728563))

(declare-fun m!728565 () Bool)

(assert (=> b!786072 m!728565))

(assert (=> b!786072 m!728563))

(declare-fun m!728567 () Bool)

(assert (=> b!786072 m!728567))

(declare-fun m!728569 () Bool)

(assert (=> b!786072 m!728569))

(declare-fun m!728571 () Bool)

(assert (=> b!786062 m!728571))

(declare-fun m!728573 () Bool)

(assert (=> start!67834 m!728573))

(declare-fun m!728575 () Bool)

(assert (=> start!67834 m!728575))

(declare-fun m!728577 () Bool)

(assert (=> b!786069 m!728577))

(assert (=> b!786066 m!728565))

(declare-fun m!728579 () Bool)

(assert (=> b!786066 m!728579))

(assert (=> b!786073 m!728555))

(assert (=> b!786073 m!728555))

(declare-fun m!728581 () Bool)

(assert (=> b!786073 m!728581))

(declare-fun m!728583 () Bool)

(assert (=> b!786073 m!728583))

(declare-fun m!728585 () Bool)

(assert (=> b!786073 m!728585))

(declare-fun m!728587 () Bool)

(assert (=> b!786078 m!728587))

(assert (=> b!786063 m!728555))

(assert (=> b!786063 m!728555))

(declare-fun m!728589 () Bool)

(assert (=> b!786063 m!728589))

(declare-fun m!728591 () Bool)

(assert (=> b!786074 m!728591))

(assert (=> b!786071 m!728555))

(assert (=> b!786071 m!728555))

(declare-fun m!728593 () Bool)

(assert (=> b!786071 m!728593))

(declare-fun m!728595 () Bool)

(assert (=> b!786079 m!728595))

(declare-fun m!728597 () Bool)

(assert (=> b!786081 m!728597))

(declare-fun m!728599 () Bool)

(assert (=> b!786081 m!728599))

(declare-fun m!728601 () Bool)

(assert (=> b!786061 m!728601))

(assert (=> b!786059 m!728555))

(assert (=> b!786059 m!728555))

(declare-fun m!728603 () Bool)

(assert (=> b!786059 m!728603))

(assert (=> b!786068 m!728555))

(assert (=> b!786068 m!728555))

(declare-fun m!728605 () Bool)

(assert (=> b!786068 m!728605))

(assert (=> b!786075 m!728555))

(assert (=> b!786075 m!728555))

(assert (=> b!786075 m!728605))

(check-sat (not b!786064) (not b!786059) (not start!67834) (not b!786079) (not b!786081) (not b!786075) (not b!786078) (not b!786062) (not b!786063) (not b!786074) (not b!786072) (not b!786071) (not b!786061) (not b!786068) (not b!786073))
(check-sat)
