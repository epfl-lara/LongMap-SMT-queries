; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66222 () Bool)

(assert start!66222)

(declare-datatypes ((array!42144 0))(
  ( (array!42145 (arr!20180 (Array (_ BitVec 32) (_ BitVec 64))) (size!20601 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42144)

(declare-fun e!425057 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7777 0))(
  ( (MissingZero!7777 (index!33476 (_ BitVec 32))) (Found!7777 (index!33477 (_ BitVec 32))) (Intermediate!7777 (undefined!8589 Bool) (index!33478 (_ BitVec 32)) (x!64392 (_ BitVec 32))) (Undefined!7777) (MissingVacant!7777 (index!33479 (_ BitVec 32))) )
))
(declare-fun lt!339464 () SeekEntryResult!7777)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun b!762762 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42144 (_ BitVec 32)) SeekEntryResult!7777)

(assert (=> b!762762 (= e!425057 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20180 a!3186) j!159) a!3186 mask!3328) lt!339464))))

(declare-fun b!762763 () Bool)

(declare-fun res!515942 () Bool)

(declare-fun e!425058 () Bool)

(assert (=> b!762763 (=> (not res!515942) (not e!425058))))

(declare-datatypes ((List!14221 0))(
  ( (Nil!14218) (Cons!14217 (h!15301 (_ BitVec 64)) (t!20527 List!14221)) )
))
(declare-fun arrayNoDuplicates!0 (array!42144 (_ BitVec 32) List!14221) Bool)

(assert (=> b!762763 (= res!515942 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14218))))

(declare-fun b!762764 () Bool)

(declare-fun res!515939 () Bool)

(declare-fun e!425059 () Bool)

(assert (=> b!762764 (=> (not res!515939) (not e!425059))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762764 (= res!515939 (validKeyInArray!0 (select (arr!20180 a!3186) j!159)))))

(declare-fun b!762765 () Bool)

(declare-fun res!515947 () Bool)

(assert (=> b!762765 (=> (not res!515947) (not e!425059))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42144 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762765 (= res!515947 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun res!515941 () Bool)

(assert (=> start!66222 (=> (not res!515941) (not e!425059))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66222 (= res!515941 (validMask!0 mask!3328))))

(assert (=> start!66222 e!425059))

(assert (=> start!66222 true))

(declare-fun array_inv!16063 (array!42144) Bool)

(assert (=> start!66222 (array_inv!16063 a!3186)))

(declare-fun b!762766 () Bool)

(declare-fun e!425060 () Bool)

(assert (=> b!762766 (= e!425058 e!425060)))

(declare-fun res!515940 () Bool)

(assert (=> b!762766 (=> (not res!515940) (not e!425060))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762766 (= res!515940 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20180 a!3186) j!159) mask!3328) (select (arr!20180 a!3186) j!159) a!3186 mask!3328) lt!339464))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762766 (= lt!339464 (Intermediate!7777 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762767 () Bool)

(assert (=> b!762767 (= e!425060 false)))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun lt!339463 () (_ BitVec 32))

(assert (=> b!762767 (= lt!339463 (toIndex!0 (select (store (arr!20180 a!3186) i!1173 k0!2102) j!159) mask!3328))))

(declare-fun b!762768 () Bool)

(assert (=> b!762768 (= e!425059 e!425058)))

(declare-fun res!515944 () Bool)

(assert (=> b!762768 (=> (not res!515944) (not e!425058))))

(declare-fun lt!339462 () SeekEntryResult!7777)

(assert (=> b!762768 (= res!515944 (or (= lt!339462 (MissingZero!7777 i!1173)) (= lt!339462 (MissingVacant!7777 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42144 (_ BitVec 32)) SeekEntryResult!7777)

(assert (=> b!762768 (= lt!339462 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!762769 () Bool)

(declare-fun res!515943 () Bool)

(assert (=> b!762769 (=> (not res!515943) (not e!425060))))

(assert (=> b!762769 (= res!515943 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20180 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762770 () Bool)

(declare-fun res!515938 () Bool)

(assert (=> b!762770 (=> (not res!515938) (not e!425060))))

(assert (=> b!762770 (= res!515938 e!425057)))

(declare-fun c!83799 () Bool)

(assert (=> b!762770 (= c!83799 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762771 () Bool)

(declare-fun res!515937 () Bool)

(assert (=> b!762771 (=> (not res!515937) (not e!425058))))

(assert (=> b!762771 (= res!515937 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20601 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20601 a!3186))))))

(declare-fun b!762772 () Bool)

(declare-fun res!515946 () Bool)

(assert (=> b!762772 (=> (not res!515946) (not e!425059))))

(assert (=> b!762772 (= res!515946 (validKeyInArray!0 k0!2102))))

(declare-fun b!762773 () Bool)

(declare-fun res!515945 () Bool)

(assert (=> b!762773 (=> (not res!515945) (not e!425059))))

(assert (=> b!762773 (= res!515945 (and (= (size!20601 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20601 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20601 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762774 () Bool)

(declare-fun res!515948 () Bool)

(assert (=> b!762774 (=> (not res!515948) (not e!425058))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42144 (_ BitVec 32)) Bool)

(assert (=> b!762774 (= res!515948 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762775 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42144 (_ BitVec 32)) SeekEntryResult!7777)

(assert (=> b!762775 (= e!425057 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20180 a!3186) j!159) a!3186 mask!3328) (Found!7777 j!159)))))

(assert (= (and start!66222 res!515941) b!762773))

(assert (= (and b!762773 res!515945) b!762764))

(assert (= (and b!762764 res!515939) b!762772))

(assert (= (and b!762772 res!515946) b!762765))

(assert (= (and b!762765 res!515947) b!762768))

(assert (= (and b!762768 res!515944) b!762774))

(assert (= (and b!762774 res!515948) b!762763))

(assert (= (and b!762763 res!515942) b!762771))

(assert (= (and b!762771 res!515937) b!762766))

(assert (= (and b!762766 res!515940) b!762769))

(assert (= (and b!762769 res!515943) b!762770))

(assert (= (and b!762770 c!83799) b!762762))

(assert (= (and b!762770 (not c!83799)) b!762775))

(assert (= (and b!762770 res!515938) b!762767))

(declare-fun m!708841 () Bool)

(assert (=> b!762767 m!708841))

(declare-fun m!708843 () Bool)

(assert (=> b!762767 m!708843))

(assert (=> b!762767 m!708843))

(declare-fun m!708845 () Bool)

(assert (=> b!762767 m!708845))

(declare-fun m!708847 () Bool)

(assert (=> b!762772 m!708847))

(declare-fun m!708849 () Bool)

(assert (=> b!762764 m!708849))

(assert (=> b!762764 m!708849))

(declare-fun m!708851 () Bool)

(assert (=> b!762764 m!708851))

(declare-fun m!708853 () Bool)

(assert (=> b!762763 m!708853))

(assert (=> b!762775 m!708849))

(assert (=> b!762775 m!708849))

(declare-fun m!708855 () Bool)

(assert (=> b!762775 m!708855))

(assert (=> b!762762 m!708849))

(assert (=> b!762762 m!708849))

(declare-fun m!708857 () Bool)

(assert (=> b!762762 m!708857))

(declare-fun m!708859 () Bool)

(assert (=> b!762765 m!708859))

(declare-fun m!708861 () Bool)

(assert (=> start!66222 m!708861))

(declare-fun m!708863 () Bool)

(assert (=> start!66222 m!708863))

(declare-fun m!708865 () Bool)

(assert (=> b!762769 m!708865))

(declare-fun m!708867 () Bool)

(assert (=> b!762774 m!708867))

(assert (=> b!762766 m!708849))

(assert (=> b!762766 m!708849))

(declare-fun m!708869 () Bool)

(assert (=> b!762766 m!708869))

(assert (=> b!762766 m!708869))

(assert (=> b!762766 m!708849))

(declare-fun m!708871 () Bool)

(assert (=> b!762766 m!708871))

(declare-fun m!708873 () Bool)

(assert (=> b!762768 m!708873))

(check-sat (not b!762774) (not b!762762) (not b!762764) (not b!762768) (not b!762763) (not b!762766) (not b!762765) (not b!762775) (not start!66222) (not b!762767) (not b!762772))
(check-sat)
