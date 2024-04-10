; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32276 () Bool)

(assert start!32276)

(declare-fun b!321584 () Bool)

(declare-fun res!175706 () Bool)

(declare-fun e!199222 () Bool)

(assert (=> b!321584 (=> (not res!175706) (not e!199222))))

(declare-datatypes ((array!16466 0))(
  ( (array!16467 (arr!7792 (Array (_ BitVec 32) (_ BitVec 64))) (size!8144 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16466)

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2923 0))(
  ( (MissingZero!2923 (index!13868 (_ BitVec 32))) (Found!2923 (index!13869 (_ BitVec 32))) (Intermediate!2923 (undefined!3735 Bool) (index!13870 (_ BitVec 32)) (x!32126 (_ BitVec 32))) (Undefined!2923) (MissingVacant!2923 (index!13871 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16466 (_ BitVec 32)) SeekEntryResult!2923)

(assert (=> b!321584 (= res!175706 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2923 i!1250)))))

(declare-fun b!321585 () Bool)

(declare-fun e!199221 () Bool)

(assert (=> b!321585 (= e!199222 e!199221)))

(declare-fun res!175709 () Bool)

(assert (=> b!321585 (=> (not res!175709) (not e!199221))))

(declare-fun lt!156218 () SeekEntryResult!2923)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16466 (_ BitVec 32)) SeekEntryResult!2923)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321585 (= res!175709 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156218))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!321585 (= lt!156218 (Intermediate!2923 false resIndex!58 resX!58))))

(declare-fun b!321586 () Bool)

(declare-fun res!175711 () Bool)

(assert (=> b!321586 (=> (not res!175711) (not e!199221))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!321586 (= res!175711 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7792 a!3305) index!1840) k!2497)) (= x!1490 resX!58) (not (= resIndex!58 index!1840)) (not (= (select (arr!7792 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!7792 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!175710 () Bool)

(assert (=> start!32276 (=> (not res!175710) (not e!199222))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32276 (= res!175710 (validMask!0 mask!3777))))

(assert (=> start!32276 e!199222))

(declare-fun array_inv!5755 (array!16466) Bool)

(assert (=> start!32276 (array_inv!5755 a!3305)))

(assert (=> start!32276 true))

(declare-fun b!321587 () Bool)

(declare-fun res!175712 () Bool)

(assert (=> b!321587 (=> (not res!175712) (not e!199221))))

(assert (=> b!321587 (= res!175712 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156218))))

(declare-fun b!321588 () Bool)

(declare-fun res!175705 () Bool)

(assert (=> b!321588 (=> (not res!175705) (not e!199221))))

(assert (=> b!321588 (= res!175705 (and (= (select (arr!7792 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8144 a!3305))))))

(declare-fun b!321589 () Bool)

(declare-fun res!175704 () Bool)

(assert (=> b!321589 (=> (not res!175704) (not e!199222))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!321589 (= res!175704 (validKeyInArray!0 k!2497))))

(declare-fun b!321590 () Bool)

(declare-fun res!175713 () Bool)

(assert (=> b!321590 (=> (not res!175713) (not e!199222))))

(declare-fun arrayContainsKey!0 (array!16466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!321590 (= res!175713 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!321591 () Bool)

(declare-fun res!175708 () Bool)

(assert (=> b!321591 (=> (not res!175708) (not e!199222))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16466 (_ BitVec 32)) Bool)

(assert (=> b!321591 (= res!175708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!321592 () Bool)

(assert (=> b!321592 (= e!199221 false)))

(declare-fun lt!156219 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!321592 (= lt!156219 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!321593 () Bool)

(declare-fun res!175707 () Bool)

(assert (=> b!321593 (=> (not res!175707) (not e!199222))))

(assert (=> b!321593 (= res!175707 (and (= (size!8144 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8144 a!3305))))))

(assert (= (and start!32276 res!175710) b!321593))

(assert (= (and b!321593 res!175707) b!321589))

(assert (= (and b!321589 res!175704) b!321590))

(assert (= (and b!321590 res!175713) b!321584))

(assert (= (and b!321584 res!175706) b!321591))

(assert (= (and b!321591 res!175708) b!321585))

(assert (= (and b!321585 res!175709) b!321588))

(assert (= (and b!321588 res!175705) b!321587))

(assert (= (and b!321587 res!175712) b!321586))

(assert (= (and b!321586 res!175711) b!321592))

(declare-fun m!329699 () Bool)

(assert (=> b!321585 m!329699))

(assert (=> b!321585 m!329699))

(declare-fun m!329701 () Bool)

(assert (=> b!321585 m!329701))

(declare-fun m!329703 () Bool)

(assert (=> b!321586 m!329703))

(declare-fun m!329705 () Bool)

(assert (=> b!321591 m!329705))

(declare-fun m!329707 () Bool)

(assert (=> b!321589 m!329707))

(declare-fun m!329709 () Bool)

(assert (=> b!321588 m!329709))

(declare-fun m!329711 () Bool)

(assert (=> b!321592 m!329711))

(declare-fun m!329713 () Bool)

(assert (=> b!321587 m!329713))

(declare-fun m!329715 () Bool)

(assert (=> b!321590 m!329715))

(declare-fun m!329717 () Bool)

(assert (=> start!32276 m!329717))

(declare-fun m!329719 () Bool)

(assert (=> start!32276 m!329719))

(declare-fun m!329721 () Bool)

(assert (=> b!321584 m!329721))

(push 1)

(assert (not b!321592))

(assert (not start!32276))

(assert (not b!321585))

(assert (not b!321589))

(assert (not b!321587))

(assert (not b!321584))

(assert (not b!321591))

