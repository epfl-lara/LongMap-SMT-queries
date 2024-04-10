; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32514 () Bool)

(assert start!32514)

(declare-fun b!325163 () Bool)

(declare-fun res!178494 () Bool)

(declare-fun e!200496 () Bool)

(assert (=> b!325163 (=> (not res!178494) (not e!200496))))

(declare-datatypes ((array!16653 0))(
  ( (array!16654 (arr!7884 (Array (_ BitVec 32) (_ BitVec 64))) (size!8236 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16653)

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!325163 (= res!178494 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!325164 () Bool)

(declare-fun res!178499 () Bool)

(declare-fun e!200497 () Bool)

(assert (=> b!325164 (=> (not res!178499) (not e!200497))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3015 0))(
  ( (MissingZero!3015 (index!14236 (_ BitVec 32))) (Found!3015 (index!14237 (_ BitVec 32))) (Intermediate!3015 (undefined!3827 Bool) (index!14238 (_ BitVec 32)) (x!32475 (_ BitVec 32))) (Undefined!3015) (MissingVacant!3015 (index!14239 (_ BitVec 32))) )
))
(declare-fun lt!156948 () SeekEntryResult!3015)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16653 (_ BitVec 32)) SeekEntryResult!3015)

(assert (=> b!325164 (= res!178499 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156948))))

(declare-fun b!325165 () Bool)

(assert (=> b!325165 (= e!200497 false)))

(declare-fun lt!156947 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325165 (= lt!156947 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!325166 () Bool)

(declare-fun res!178503 () Bool)

(assert (=> b!325166 (=> (not res!178503) (not e!200496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16653 (_ BitVec 32)) Bool)

(assert (=> b!325166 (= res!178503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!325167 () Bool)

(declare-fun res!178501 () Bool)

(assert (=> b!325167 (=> (not res!178501) (not e!200496))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!325167 (= res!178501 (validKeyInArray!0 k0!2497))))

(declare-fun b!325168 () Bool)

(declare-fun res!178500 () Bool)

(assert (=> b!325168 (=> (not res!178500) (not e!200497))))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!325168 (= res!178500 (and (= (select (arr!7884 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8236 a!3305))))))

(declare-fun b!325169 () Bool)

(declare-fun res!178502 () Bool)

(assert (=> b!325169 (=> (not res!178502) (not e!200497))))

(assert (=> b!325169 (= res!178502 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7884 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!325171 () Bool)

(declare-fun res!178498 () Bool)

(assert (=> b!325171 (=> (not res!178498) (not e!200496))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16653 (_ BitVec 32)) SeekEntryResult!3015)

(assert (=> b!325171 (= res!178498 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3015 i!1250)))))

(declare-fun b!325172 () Bool)

(declare-fun res!178497 () Bool)

(assert (=> b!325172 (=> (not res!178497) (not e!200496))))

(assert (=> b!325172 (= res!178497 (and (= (size!8236 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8236 a!3305))))))

(declare-fun b!325170 () Bool)

(assert (=> b!325170 (= e!200496 e!200497)))

(declare-fun res!178495 () Bool)

(assert (=> b!325170 (=> (not res!178495) (not e!200497))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!325170 (= res!178495 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156948))))

(assert (=> b!325170 (= lt!156948 (Intermediate!3015 false resIndex!58 resX!58))))

(declare-fun res!178496 () Bool)

(assert (=> start!32514 (=> (not res!178496) (not e!200496))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32514 (= res!178496 (validMask!0 mask!3777))))

(assert (=> start!32514 e!200496))

(declare-fun array_inv!5847 (array!16653) Bool)

(assert (=> start!32514 (array_inv!5847 a!3305)))

(assert (=> start!32514 true))

(assert (= (and start!32514 res!178496) b!325172))

(assert (= (and b!325172 res!178497) b!325167))

(assert (= (and b!325167 res!178501) b!325163))

(assert (= (and b!325163 res!178494) b!325171))

(assert (= (and b!325171 res!178498) b!325166))

(assert (= (and b!325166 res!178503) b!325170))

(assert (= (and b!325170 res!178495) b!325168))

(assert (= (and b!325168 res!178500) b!325164))

(assert (= (and b!325164 res!178499) b!325169))

(assert (= (and b!325169 res!178502) b!325165))

(declare-fun m!332063 () Bool)

(assert (=> b!325167 m!332063))

(declare-fun m!332065 () Bool)

(assert (=> b!325166 m!332065))

(declare-fun m!332067 () Bool)

(assert (=> b!325163 m!332067))

(declare-fun m!332069 () Bool)

(assert (=> start!32514 m!332069))

(declare-fun m!332071 () Bool)

(assert (=> start!32514 m!332071))

(declare-fun m!332073 () Bool)

(assert (=> b!325168 m!332073))

(declare-fun m!332075 () Bool)

(assert (=> b!325164 m!332075))

(declare-fun m!332077 () Bool)

(assert (=> b!325170 m!332077))

(assert (=> b!325170 m!332077))

(declare-fun m!332079 () Bool)

(assert (=> b!325170 m!332079))

(declare-fun m!332081 () Bool)

(assert (=> b!325169 m!332081))

(declare-fun m!332083 () Bool)

(assert (=> b!325165 m!332083))

(declare-fun m!332085 () Bool)

(assert (=> b!325171 m!332085))

(check-sat (not b!325167) (not b!325164) (not start!32514) (not b!325170) (not b!325165) (not b!325171) (not b!325163) (not b!325166))
(check-sat)
