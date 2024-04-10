; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32482 () Bool)

(assert start!32482)

(declare-fun b!324683 () Bool)

(declare-fun res!178016 () Bool)

(declare-fun e!200352 () Bool)

(assert (=> b!324683 (=> (not res!178016) (not e!200352))))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324683 (= res!178016 (validKeyInArray!0 k!2497))))

(declare-fun b!324684 () Bool)

(declare-fun e!200353 () Bool)

(assert (=> b!324684 (= e!200352 e!200353)))

(declare-fun res!178018 () Bool)

(assert (=> b!324684 (=> (not res!178018) (not e!200353))))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-datatypes ((array!16621 0))(
  ( (array!16622 (arr!7868 (Array (_ BitVec 32) (_ BitVec 64))) (size!8220 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16621)

(declare-datatypes ((SeekEntryResult!2999 0))(
  ( (MissingZero!2999 (index!14172 (_ BitVec 32))) (Found!2999 (index!14173 (_ BitVec 32))) (Intermediate!2999 (undefined!3811 Bool) (index!14174 (_ BitVec 32)) (x!32419 (_ BitVec 32))) (Undefined!2999) (MissingVacant!2999 (index!14175 (_ BitVec 32))) )
))
(declare-fun lt!156852 () SeekEntryResult!2999)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16621 (_ BitVec 32)) SeekEntryResult!2999)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324684 (= res!178018 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156852))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!324684 (= lt!156852 (Intermediate!2999 false resIndex!58 resX!58))))

(declare-fun b!324686 () Bool)

(declare-fun res!178019 () Bool)

(assert (=> b!324686 (=> (not res!178019) (not e!200353))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!324686 (= res!178019 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156852))))

(declare-fun b!324687 () Bool)

(declare-fun res!178014 () Bool)

(assert (=> b!324687 (=> (not res!178014) (not e!200353))))

(assert (=> b!324687 (= res!178014 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7868 a!3305) index!1840) k!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324688 () Bool)

(declare-fun res!178020 () Bool)

(assert (=> b!324688 (=> (not res!178020) (not e!200352))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16621 (_ BitVec 32)) Bool)

(assert (=> b!324688 (= res!178020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324689 () Bool)

(declare-fun res!178017 () Bool)

(assert (=> b!324689 (=> (not res!178017) (not e!200353))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324689 (= res!178017 (and (= (select (arr!7868 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8220 a!3305))))))

(declare-fun b!324690 () Bool)

(declare-fun res!178021 () Bool)

(assert (=> b!324690 (=> (not res!178021) (not e!200352))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16621 (_ BitVec 32)) SeekEntryResult!2999)

(assert (=> b!324690 (= res!178021 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2999 i!1250)))))

(declare-fun b!324691 () Bool)

(declare-fun res!178015 () Bool)

(assert (=> b!324691 (=> (not res!178015) (not e!200352))))

(assert (=> b!324691 (= res!178015 (and (= (size!8220 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8220 a!3305))))))

(declare-fun b!324692 () Bool)

(assert (=> b!324692 (= e!200353 false)))

(declare-fun lt!156851 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324692 (= lt!156851 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324685 () Bool)

(declare-fun res!178023 () Bool)

(assert (=> b!324685 (=> (not res!178023) (not e!200352))))

(declare-fun arrayContainsKey!0 (array!16621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324685 (= res!178023 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun res!178022 () Bool)

(assert (=> start!32482 (=> (not res!178022) (not e!200352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32482 (= res!178022 (validMask!0 mask!3777))))

(assert (=> start!32482 e!200352))

(declare-fun array_inv!5831 (array!16621) Bool)

(assert (=> start!32482 (array_inv!5831 a!3305)))

(assert (=> start!32482 true))

(assert (= (and start!32482 res!178022) b!324691))

(assert (= (and b!324691 res!178015) b!324683))

(assert (= (and b!324683 res!178016) b!324685))

(assert (= (and b!324685 res!178023) b!324690))

(assert (= (and b!324690 res!178021) b!324688))

(assert (= (and b!324688 res!178020) b!324684))

(assert (= (and b!324684 res!178018) b!324689))

(assert (= (and b!324689 res!178017) b!324686))

(assert (= (and b!324686 res!178019) b!324687))

(assert (= (and b!324687 res!178014) b!324692))

(declare-fun m!331679 () Bool)

(assert (=> b!324689 m!331679))

(declare-fun m!331681 () Bool)

(assert (=> b!324687 m!331681))

(declare-fun m!331683 () Bool)

(assert (=> b!324683 m!331683))

(declare-fun m!331685 () Bool)

(assert (=> b!324685 m!331685))

(declare-fun m!331687 () Bool)

(assert (=> b!324690 m!331687))

(declare-fun m!331689 () Bool)

(assert (=> b!324684 m!331689))

(assert (=> b!324684 m!331689))

(declare-fun m!331691 () Bool)

(assert (=> b!324684 m!331691))

(declare-fun m!331693 () Bool)

(assert (=> b!324686 m!331693))

(declare-fun m!331695 () Bool)

(assert (=> b!324692 m!331695))

(declare-fun m!331697 () Bool)

(assert (=> b!324688 m!331697))

(declare-fun m!331699 () Bool)

(assert (=> start!32482 m!331699))

(declare-fun m!331701 () Bool)

(assert (=> start!32482 m!331701))

(push 1)

