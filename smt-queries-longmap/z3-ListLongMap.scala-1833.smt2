; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33194 () Bool)

(assert start!33194)

(declare-fun b!330069 () Bool)

(declare-datatypes ((Unit!10207 0))(
  ( (Unit!10208) )
))
(declare-fun e!202680 () Unit!10207)

(declare-fun Unit!10209 () Unit!10207)

(assert (=> b!330069 (= e!202680 Unit!10209)))

(declare-fun b!330070 () Bool)

(declare-fun res!181906 () Bool)

(declare-fun e!202683 () Bool)

(assert (=> b!330070 (=> (not res!181906) (not e!202683))))

(declare-datatypes ((array!16866 0))(
  ( (array!16867 (arr!7975 (Array (_ BitVec 32) (_ BitVec 64))) (size!8327 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16866)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!330070 (= res!181906 (and (= (select (arr!7975 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8327 a!3305))))))

(declare-fun b!330071 () Bool)

(declare-fun res!181904 () Bool)

(declare-fun e!202678 () Bool)

(assert (=> b!330071 (=> (not res!181904) (not e!202678))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16866 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!330071 (= res!181904 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!330072 () Bool)

(declare-fun res!181903 () Bool)

(assert (=> b!330072 (=> (not res!181903) (not e!202678))))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!330072 (= res!181903 (and (= (size!8327 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8327 a!3305))))))

(declare-fun b!330073 () Bool)

(assert (=> b!330073 false))

(declare-fun e!202681 () Unit!10207)

(declare-fun Unit!10210 () Unit!10207)

(assert (=> b!330073 (= e!202681 Unit!10210)))

(declare-fun b!330074 () Bool)

(declare-fun res!181910 () Bool)

(assert (=> b!330074 (=> (not res!181910) (not e!202683))))

(assert (=> b!330074 (= res!181910 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7975 a!3305) index!1840) k0!2497)) (= x!1490 resX!58)))))

(declare-fun res!181908 () Bool)

(assert (=> start!33194 (=> (not res!181908) (not e!202678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33194 (= res!181908 (validMask!0 mask!3777))))

(assert (=> start!33194 e!202678))

(declare-fun array_inv!5925 (array!16866) Bool)

(assert (=> start!33194 (array_inv!5925 a!3305)))

(assert (=> start!33194 true))

(declare-fun b!330075 () Bool)

(declare-fun res!181911 () Bool)

(assert (=> b!330075 (=> (not res!181911) (not e!202683))))

(declare-datatypes ((SeekEntryResult!3071 0))(
  ( (MissingZero!3071 (index!14460 (_ BitVec 32))) (Found!3071 (index!14461 (_ BitVec 32))) (Intermediate!3071 (undefined!3883 Bool) (index!14462 (_ BitVec 32)) (x!32851 (_ BitVec 32))) (Undefined!3071) (MissingVacant!3071 (index!14463 (_ BitVec 32))) )
))
(declare-fun lt!158470 () SeekEntryResult!3071)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16866 (_ BitVec 32)) SeekEntryResult!3071)

(assert (=> b!330075 (= res!181911 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!158470))))

(declare-fun b!330076 () Bool)

(declare-fun e!202679 () Unit!10207)

(declare-fun Unit!10211 () Unit!10207)

(assert (=> b!330076 (= e!202679 Unit!10211)))

(declare-fun b!330077 () Bool)

(declare-fun Unit!10212 () Unit!10207)

(assert (=> b!330077 (= e!202680 Unit!10212)))

(assert (=> b!330077 false))

(declare-fun b!330078 () Bool)

(assert (=> b!330078 (= e!202679 e!202681)))

(declare-fun c!51728 () Bool)

(assert (=> b!330078 (= c!51728 (or (= (select (arr!7975 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7975 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!330079 () Bool)

(declare-fun res!181902 () Bool)

(assert (=> b!330079 (=> (not res!181902) (not e!202678))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!330079 (= res!181902 (validKeyInArray!0 k0!2497))))

(declare-fun b!330080 () Bool)

(declare-fun res!181905 () Bool)

(assert (=> b!330080 (=> (not res!181905) (not e!202678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16866 (_ BitVec 32)) Bool)

(assert (=> b!330080 (= res!181905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!330081 () Bool)

(assert (=> b!330081 false))

(declare-fun lt!158472 () Unit!10207)

(assert (=> b!330081 (= lt!158472 e!202680)))

(declare-fun c!51727 () Bool)

(get-info :version)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330081 (= c!51727 ((_ is Intermediate!3071) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777) k0!2497 a!3305 mask!3777)))))

(declare-fun Unit!10213 () Unit!10207)

(assert (=> b!330081 (= e!202681 Unit!10213)))

(declare-fun b!330082 () Bool)

(declare-fun res!181909 () Bool)

(assert (=> b!330082 (=> (not res!181909) (not e!202678))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16866 (_ BitVec 32)) SeekEntryResult!3071)

(assert (=> b!330082 (= res!181909 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3071 i!1250)))))

(declare-fun b!330083 () Bool)

(assert (=> b!330083 (= e!202683 (not true))))

(assert (=> b!330083 (= index!1840 resIndex!58)))

(declare-fun lt!158471 () Unit!10207)

(assert (=> b!330083 (= lt!158471 e!202679)))

(declare-fun c!51726 () Bool)

(assert (=> b!330083 (= c!51726 (not (= resIndex!58 index!1840)))))

(declare-fun b!330084 () Bool)

(assert (=> b!330084 (= e!202678 e!202683)))

(declare-fun res!181907 () Bool)

(assert (=> b!330084 (=> (not res!181907) (not e!202683))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!330084 (= res!181907 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!158470))))

(assert (=> b!330084 (= lt!158470 (Intermediate!3071 false resIndex!58 resX!58))))

(assert (= (and start!33194 res!181908) b!330072))

(assert (= (and b!330072 res!181903) b!330079))

(assert (= (and b!330079 res!181902) b!330071))

(assert (= (and b!330071 res!181904) b!330082))

(assert (= (and b!330082 res!181909) b!330080))

(assert (= (and b!330080 res!181905) b!330084))

(assert (= (and b!330084 res!181907) b!330070))

(assert (= (and b!330070 res!181906) b!330075))

(assert (= (and b!330075 res!181911) b!330074))

(assert (= (and b!330074 res!181910) b!330083))

(assert (= (and b!330083 c!51726) b!330078))

(assert (= (and b!330083 (not c!51726)) b!330076))

(assert (= (and b!330078 c!51728) b!330073))

(assert (= (and b!330078 (not c!51728)) b!330081))

(assert (= (and b!330081 c!51727) b!330069))

(assert (= (and b!330081 (not c!51727)) b!330077))

(declare-fun m!335713 () Bool)

(assert (=> b!330070 m!335713))

(declare-fun m!335715 () Bool)

(assert (=> b!330078 m!335715))

(assert (=> b!330074 m!335715))

(declare-fun m!335717 () Bool)

(assert (=> b!330075 m!335717))

(declare-fun m!335719 () Bool)

(assert (=> start!33194 m!335719))

(declare-fun m!335721 () Bool)

(assert (=> start!33194 m!335721))

(declare-fun m!335723 () Bool)

(assert (=> b!330079 m!335723))

(declare-fun m!335725 () Bool)

(assert (=> b!330081 m!335725))

(assert (=> b!330081 m!335725))

(declare-fun m!335727 () Bool)

(assert (=> b!330081 m!335727))

(declare-fun m!335729 () Bool)

(assert (=> b!330082 m!335729))

(declare-fun m!335731 () Bool)

(assert (=> b!330084 m!335731))

(assert (=> b!330084 m!335731))

(declare-fun m!335733 () Bool)

(assert (=> b!330084 m!335733))

(declare-fun m!335735 () Bool)

(assert (=> b!330071 m!335735))

(declare-fun m!335737 () Bool)

(assert (=> b!330080 m!335737))

(check-sat (not b!330079) (not b!330071) (not b!330084) (not b!330082) (not b!330075) (not b!330081) (not start!33194) (not b!330080))
(check-sat)
