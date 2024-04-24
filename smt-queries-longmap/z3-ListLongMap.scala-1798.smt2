; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32474 () Bool)

(assert start!32474)

(declare-fun b!324720 () Bool)

(declare-fun res!178101 () Bool)

(declare-fun e!200345 () Bool)

(assert (=> b!324720 (=> (not res!178101) (not e!200345))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324720 (= res!178101 (validKeyInArray!0 k0!2497))))

(declare-fun b!324721 () Bool)

(declare-fun res!178109 () Bool)

(assert (=> b!324721 (=> (not res!178109) (not e!200345))))

(declare-datatypes ((array!16626 0))(
  ( (array!16627 (arr!7870 (Array (_ BitVec 32) (_ BitVec 64))) (size!8222 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16626)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16626 (_ BitVec 32)) Bool)

(assert (=> b!324721 (= res!178109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324722 () Bool)

(declare-fun res!178105 () Bool)

(assert (=> b!324722 (=> (not res!178105) (not e!200345))))

(declare-fun arrayContainsKey!0 (array!16626 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324722 (= res!178105 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324723 () Bool)

(declare-fun res!178104 () Bool)

(assert (=> b!324723 (=> (not res!178104) (not e!200345))))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2966 0))(
  ( (MissingZero!2966 (index!14040 (_ BitVec 32))) (Found!2966 (index!14041 (_ BitVec 32))) (Intermediate!2966 (undefined!3778 Bool) (index!14042 (_ BitVec 32)) (x!32391 (_ BitVec 32))) (Undefined!2966) (MissingVacant!2966 (index!14043 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16626 (_ BitVec 32)) SeekEntryResult!2966)

(assert (=> b!324723 (= res!178104 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!2966 i!1250)))))

(declare-fun b!324724 () Bool)

(declare-fun res!178103 () Bool)

(declare-fun e!200346 () Bool)

(assert (=> b!324724 (=> (not res!178103) (not e!200346))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324724 (= res!178103 (and (= (select (arr!7870 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8222 a!3305))))))

(declare-fun b!324725 () Bool)

(declare-fun res!178106 () Bool)

(assert (=> b!324725 (=> (not res!178106) (not e!200346))))

(declare-fun lt!156888 () SeekEntryResult!2966)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16626 (_ BitVec 32)) SeekEntryResult!2966)

(assert (=> b!324725 (= res!178106 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156888))))

(declare-fun b!324726 () Bool)

(declare-fun res!178107 () Bool)

(assert (=> b!324726 (=> (not res!178107) (not e!200345))))

(assert (=> b!324726 (= res!178107 (and (= (size!8222 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8222 a!3305))))))

(declare-fun res!178108 () Bool)

(assert (=> start!32474 (=> (not res!178108) (not e!200345))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32474 (= res!178108 (validMask!0 mask!3777))))

(assert (=> start!32474 e!200345))

(declare-fun array_inv!5820 (array!16626) Bool)

(assert (=> start!32474 (array_inv!5820 a!3305)))

(assert (=> start!32474 true))

(declare-fun b!324727 () Bool)

(assert (=> b!324727 (= e!200345 e!200346)))

(declare-fun res!178110 () Bool)

(assert (=> b!324727 (=> (not res!178110) (not e!200346))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324727 (= res!178110 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156888))))

(assert (=> b!324727 (= lt!156888 (Intermediate!2966 false resIndex!58 resX!58))))

(declare-fun b!324728 () Bool)

(assert (=> b!324728 (= e!200346 false)))

(declare-fun lt!156887 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324728 (= lt!156887 (nextIndex!0 index!1840 (bvadd #b00000000000000000000000000000001 x!1490) mask!3777))))

(declare-fun b!324729 () Bool)

(declare-fun res!178102 () Bool)

(assert (=> b!324729 (=> (not res!178102) (not e!200346))))

(assert (=> b!324729 (= res!178102 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7870 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32474 res!178108) b!324726))

(assert (= (and b!324726 res!178107) b!324720))

(assert (= (and b!324720 res!178101) b!324722))

(assert (= (and b!324722 res!178105) b!324723))

(assert (= (and b!324723 res!178104) b!324721))

(assert (= (and b!324721 res!178109) b!324727))

(assert (= (and b!324727 res!178110) b!324724))

(assert (= (and b!324724 res!178103) b!324725))

(assert (= (and b!324725 res!178106) b!324729))

(assert (= (and b!324729 res!178102) b!324728))

(declare-fun m!331933 () Bool)

(assert (=> b!324725 m!331933))

(declare-fun m!331935 () Bool)

(assert (=> b!324721 m!331935))

(declare-fun m!331937 () Bool)

(assert (=> b!324722 m!331937))

(declare-fun m!331939 () Bool)

(assert (=> b!324723 m!331939))

(declare-fun m!331941 () Bool)

(assert (=> start!32474 m!331941))

(declare-fun m!331943 () Bool)

(assert (=> start!32474 m!331943))

(declare-fun m!331945 () Bool)

(assert (=> b!324727 m!331945))

(assert (=> b!324727 m!331945))

(declare-fun m!331947 () Bool)

(assert (=> b!324727 m!331947))

(declare-fun m!331949 () Bool)

(assert (=> b!324729 m!331949))

(declare-fun m!331951 () Bool)

(assert (=> b!324724 m!331951))

(declare-fun m!331953 () Bool)

(assert (=> b!324728 m!331953))

(declare-fun m!331955 () Bool)

(assert (=> b!324720 m!331955))

(check-sat (not b!324721) (not b!324728) (not b!324722) (not start!32474) (not b!324723) (not b!324727) (not b!324720) (not b!324725))
(check-sat)
