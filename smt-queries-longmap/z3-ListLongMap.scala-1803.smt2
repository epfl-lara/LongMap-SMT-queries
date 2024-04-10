; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32520 () Bool)

(assert start!32520)

(declare-fun b!325253 () Bool)

(declare-fun res!178591 () Bool)

(declare-fun e!200522 () Bool)

(assert (=> b!325253 (=> (not res!178591) (not e!200522))))

(declare-datatypes ((array!16659 0))(
  ( (array!16660 (arr!7887 (Array (_ BitVec 32) (_ BitVec 64))) (size!8239 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16659)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3018 0))(
  ( (MissingZero!3018 (index!14248 (_ BitVec 32))) (Found!3018 (index!14249 (_ BitVec 32))) (Intermediate!3018 (undefined!3830 Bool) (index!14250 (_ BitVec 32)) (x!32486 (_ BitVec 32))) (Undefined!3018) (MissingVacant!3018 (index!14251 (_ BitVec 32))) )
))
(declare-fun lt!156965 () SeekEntryResult!3018)

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16659 (_ BitVec 32)) SeekEntryResult!3018)

(assert (=> b!325253 (= res!178591 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156965))))

(declare-fun b!325254 () Bool)

(declare-fun res!178589 () Bool)

(assert (=> b!325254 (=> (not res!178589) (not e!200522))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325254 (= res!178589 (and (= (select (arr!7887 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8239 a!3305))))))

(declare-fun b!325255 () Bool)

(assert (=> b!325255 (= e!200522 false)))

(declare-fun lt!156966 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325255 (= lt!156966 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325256 () Bool)

(declare-fun res!178585 () Bool)

(declare-fun e!200523 () Bool)

(assert (=> b!325256 (=> (not res!178585) (not e!200523))))

(assert (=> b!325256 (= res!178585 (and (= (size!8239 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8239 a!3305))))))

(declare-fun b!325257 () Bool)

(declare-fun res!178586 () Bool)

(assert (=> b!325257 (=> (not res!178586) (not e!200523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16659 (_ BitVec 32)) Bool)

(assert (=> b!325257 (= res!178586 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun res!178588 () Bool)

(assert (=> start!32520 (=> (not res!178588) (not e!200523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32520 (= res!178588 (validMask!0 mask!3777))))

(assert (=> start!32520 e!200523))

(declare-fun array_inv!5850 (array!16659) Bool)

(assert (=> start!32520 (array_inv!5850 a!3305)))

(assert (=> start!32520 true))

(declare-fun b!325258 () Bool)

(assert (=> b!325258 (= e!200523 e!200522)))

(declare-fun res!178592 () Bool)

(assert (=> b!325258 (=> (not res!178592) (not e!200522))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325258 (= res!178592 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156965))))

(assert (=> b!325258 (= lt!156965 (Intermediate!3018 false resIndex!58 resX!58))))

(declare-fun b!325259 () Bool)

(declare-fun res!178593 () Bool)

(assert (=> b!325259 (=> (not res!178593) (not e!200523))))

(declare-fun arrayContainsKey!0 (array!16659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325259 (= res!178593 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325260 () Bool)

(declare-fun res!178587 () Bool)

(assert (=> b!325260 (=> (not res!178587) (not e!200523))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16659 (_ BitVec 32)) SeekEntryResult!3018)

(assert (=> b!325260 (= res!178587 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3018 i!1250)))))

(declare-fun b!325261 () Bool)

(declare-fun res!178584 () Bool)

(assert (=> b!325261 (=> (not res!178584) (not e!200523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325261 (= res!178584 (validKeyInArray!0 k0!2497))))

(declare-fun b!325262 () Bool)

(declare-fun res!178590 () Bool)

(assert (=> b!325262 (=> (not res!178590) (not e!200522))))

(assert (=> b!325262 (= res!178590 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7887 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(assert (= (and start!32520 res!178588) b!325256))

(assert (= (and b!325256 res!178585) b!325261))

(assert (= (and b!325261 res!178584) b!325259))

(assert (= (and b!325259 res!178593) b!325260))

(assert (= (and b!325260 res!178587) b!325257))

(assert (= (and b!325257 res!178586) b!325258))

(assert (= (and b!325258 res!178592) b!325254))

(assert (= (and b!325254 res!178589) b!325253))

(assert (= (and b!325253 res!178591) b!325262))

(assert (= (and b!325262 res!178590) b!325255))

(declare-fun m!332135 () Bool)

(assert (=> b!325261 m!332135))

(declare-fun m!332137 () Bool)

(assert (=> b!325259 m!332137))

(declare-fun m!332139 () Bool)

(assert (=> b!325257 m!332139))

(declare-fun m!332141 () Bool)

(assert (=> b!325262 m!332141))

(declare-fun m!332143 () Bool)

(assert (=> b!325255 m!332143))

(declare-fun m!332145 () Bool)

(assert (=> b!325260 m!332145))

(declare-fun m!332147 () Bool)

(assert (=> start!32520 m!332147))

(declare-fun m!332149 () Bool)

(assert (=> start!32520 m!332149))

(declare-fun m!332151 () Bool)

(assert (=> b!325254 m!332151))

(declare-fun m!332153 () Bool)

(assert (=> b!325258 m!332153))

(assert (=> b!325258 m!332153))

(declare-fun m!332155 () Bool)

(assert (=> b!325258 m!332155))

(declare-fun m!332157 () Bool)

(assert (=> b!325253 m!332157))

(check-sat (not b!325260) (not b!325261) (not b!325253) (not b!325257) (not b!325259) (not b!325255) (not b!325258) (not start!32520))
(check-sat)
