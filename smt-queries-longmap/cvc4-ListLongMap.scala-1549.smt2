; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29324 () Bool)

(assert start!29324)

(declare-fun b!297118 () Bool)

(declare-fun e!187780 () Bool)

(declare-fun e!187776 () Bool)

(assert (=> b!297118 (= e!187780 e!187776)))

(declare-fun res!156646 () Bool)

(assert (=> b!297118 (=> (not res!156646) (not e!187776))))

(declare-datatypes ((SeekEntryResult!2275 0))(
  ( (MissingZero!2275 (index!11270 (_ BitVec 32))) (Found!2275 (index!11271 (_ BitVec 32))) (Intermediate!2275 (undefined!3087 Bool) (index!11272 (_ BitVec 32)) (x!29483 (_ BitVec 32))) (Undefined!2275) (MissingVacant!2275 (index!11273 (_ BitVec 32))) )
))
(declare-fun lt!147615 () SeekEntryResult!2275)

(declare-fun lt!147613 () Bool)

(declare-datatypes ((array!15037 0))(
  ( (array!15038 (arr!7126 (Array (_ BitVec 32) (_ BitVec 64))) (size!7478 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15037)

(declare-fun k!2524 () (_ BitVec 64))

(assert (=> b!297118 (= res!156646 (and (or lt!147613 (not (undefined!3087 lt!147615))) (or lt!147613 (not (= (select (arr!7126 a!3312) (index!11272 lt!147615)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147613 (not (= (select (arr!7126 a!3312) (index!11272 lt!147615)) k!2524))) (not lt!147613)))))

(assert (=> b!297118 (= lt!147613 (not (is-Intermediate!2275 lt!147615)))))

(declare-fun b!297119 () Bool)

(declare-fun e!187778 () Bool)

(assert (=> b!297119 (= e!187778 e!187780)))

(declare-fun res!156649 () Bool)

(assert (=> b!297119 (=> (not res!156649) (not e!187780))))

(declare-fun lt!147610 () Bool)

(assert (=> b!297119 (= res!156649 lt!147610)))

(declare-fun lt!147612 () (_ BitVec 32))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!147609 () SeekEntryResult!2275)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15037 (_ BitVec 32)) SeekEntryResult!2275)

(assert (=> b!297119 (= lt!147609 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147612 k!2524 (array!15038 (store (arr!7126 a!3312) i!1256 k!2524) (size!7478 a!3312)) mask!3809))))

(assert (=> b!297119 (= lt!147615 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147612 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297119 (= lt!147612 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!297120 () Bool)

(assert (=> b!297120 (= e!187776 (not (and (bvsge (index!11272 lt!147615) #b00000000000000000000000000000000) (bvslt (index!11272 lt!147615) (size!7478 a!3312)))))))

(assert (=> b!297120 (= lt!147609 lt!147615)))

(declare-datatypes ((Unit!9248 0))(
  ( (Unit!9249) )
))
(declare-fun lt!147611 () Unit!9248)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15037 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9248)

(assert (=> b!297120 (= lt!147611 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!147612 (index!11272 lt!147615) (x!29483 lt!147615) mask!3809))))

(assert (=> b!297120 (and (= (select (arr!7126 a!3312) (index!11272 lt!147615)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11272 lt!147615) i!1256))))

(declare-fun b!297121 () Bool)

(declare-fun res!156645 () Bool)

(declare-fun e!187777 () Bool)

(assert (=> b!297121 (=> (not res!156645) (not e!187777))))

(assert (=> b!297121 (= res!156645 (and (= (size!7478 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7478 a!3312))))))

(declare-fun b!297122 () Bool)

(declare-fun res!156651 () Bool)

(assert (=> b!297122 (=> (not res!156651) (not e!187778))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15037 (_ BitVec 32)) Bool)

(assert (=> b!297122 (= res!156651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297123 () Bool)

(assert (=> b!297123 (= e!187777 e!187778)))

(declare-fun res!156647 () Bool)

(assert (=> b!297123 (=> (not res!156647) (not e!187778))))

(declare-fun lt!147614 () SeekEntryResult!2275)

(assert (=> b!297123 (= res!156647 (or lt!147610 (= lt!147614 (MissingVacant!2275 i!1256))))))

(assert (=> b!297123 (= lt!147610 (= lt!147614 (MissingZero!2275 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15037 (_ BitVec 32)) SeekEntryResult!2275)

(assert (=> b!297123 (= lt!147614 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!156648 () Bool)

(assert (=> start!29324 (=> (not res!156648) (not e!187777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29324 (= res!156648 (validMask!0 mask!3809))))

(assert (=> start!29324 e!187777))

(assert (=> start!29324 true))

(declare-fun array_inv!5089 (array!15037) Bool)

(assert (=> start!29324 (array_inv!5089 a!3312)))

(declare-fun b!297124 () Bool)

(declare-fun res!156650 () Bool)

(assert (=> b!297124 (=> (not res!156650) (not e!187777))))

(declare-fun arrayContainsKey!0 (array!15037 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297124 (= res!156650 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297125 () Bool)

(declare-fun res!156644 () Bool)

(assert (=> b!297125 (=> (not res!156644) (not e!187777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297125 (= res!156644 (validKeyInArray!0 k!2524))))

(assert (= (and start!29324 res!156648) b!297121))

(assert (= (and b!297121 res!156645) b!297125))

(assert (= (and b!297125 res!156644) b!297124))

(assert (= (and b!297124 res!156650) b!297123))

(assert (= (and b!297123 res!156647) b!297122))

(assert (= (and b!297122 res!156651) b!297119))

(assert (= (and b!297119 res!156649) b!297118))

(assert (= (and b!297118 res!156646) b!297120))

(declare-fun m!309939 () Bool)

(assert (=> b!297125 m!309939))

(declare-fun m!309941 () Bool)

(assert (=> b!297119 m!309941))

(declare-fun m!309943 () Bool)

(assert (=> b!297119 m!309943))

(declare-fun m!309945 () Bool)

(assert (=> b!297119 m!309945))

(declare-fun m!309947 () Bool)

(assert (=> b!297119 m!309947))

(declare-fun m!309949 () Bool)

(assert (=> b!297122 m!309949))

(declare-fun m!309951 () Bool)

(assert (=> start!29324 m!309951))

(declare-fun m!309953 () Bool)

(assert (=> start!29324 m!309953))

(declare-fun m!309955 () Bool)

(assert (=> b!297120 m!309955))

(declare-fun m!309957 () Bool)

(assert (=> b!297120 m!309957))

(declare-fun m!309959 () Bool)

(assert (=> b!297123 m!309959))

(declare-fun m!309961 () Bool)

(assert (=> b!297124 m!309961))

(assert (=> b!297118 m!309957))

(push 1)

(assert (not b!297125))

(assert (not b!297123))

(assert (not b!297122))

(assert (not b!297119))

(assert (not b!297120))

(assert (not start!29324))

(assert (not b!297124))

(check-sat)

(pop 1)

(push 1)

(check-sat)

