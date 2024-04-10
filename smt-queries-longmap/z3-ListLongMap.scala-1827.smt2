; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33018 () Bool)

(assert start!33018)

(declare-fun b!328861 () Bool)

(declare-fun res!181194 () Bool)

(declare-fun e!202086 () Bool)

(assert (=> b!328861 (=> (not res!181194) (not e!202086))))

(declare-datatypes ((array!16824 0))(
  ( (array!16825 (arr!7959 (Array (_ BitVec 32) (_ BitVec 64))) (size!8311 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16824)

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!328861 (= res!181194 (and (= (size!8311 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8311 a!3305))))))

(declare-fun b!328862 () Bool)

(declare-fun res!181191 () Bool)

(assert (=> b!328862 (=> (not res!181191) (not e!202086))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3090 0))(
  ( (MissingZero!3090 (index!14536 (_ BitVec 32))) (Found!3090 (index!14537 (_ BitVec 32))) (Intermediate!3090 (undefined!3902 Bool) (index!14538 (_ BitVec 32)) (x!32801 (_ BitVec 32))) (Undefined!3090) (MissingVacant!3090 (index!14539 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16824 (_ BitVec 32)) SeekEntryResult!3090)

(assert (=> b!328862 (= res!181191 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3090 i!1250)))))

(declare-fun b!328863 () Bool)

(declare-fun res!181189 () Bool)

(assert (=> b!328863 (=> (not res!181189) (not e!202086))))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16824 (_ BitVec 32)) SeekEntryResult!3090)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!328863 (= res!181189 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) (Intermediate!3090 false resIndex!58 resX!58)))))

(declare-fun b!328864 () Bool)

(declare-fun res!181192 () Bool)

(assert (=> b!328864 (=> (not res!181192) (not e!202086))))

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(assert (=> b!328864 (= res!181192 (and (= (select (arr!7959 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8311 a!3305))))))

(declare-fun res!181187 () Bool)

(assert (=> start!33018 (=> (not res!181187) (not e!202086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33018 (= res!181187 (validMask!0 mask!3777))))

(assert (=> start!33018 e!202086))

(declare-fun array_inv!5922 (array!16824) Bool)

(assert (=> start!33018 (array_inv!5922 a!3305)))

(assert (=> start!33018 true))

(declare-fun b!328865 () Bool)

(declare-fun res!181190 () Bool)

(assert (=> b!328865 (=> (not res!181190) (not e!202086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16824 (_ BitVec 32)) Bool)

(assert (=> b!328865 (= res!181190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!328866 () Bool)

(declare-fun res!181193 () Bool)

(assert (=> b!328866 (=> (not res!181193) (not e!202086))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!328866 (= res!181193 (validKeyInArray!0 k0!2497))))

(declare-fun b!328867 () Bool)

(declare-fun res!181188 () Bool)

(assert (=> b!328867 (=> (not res!181188) (not e!202086))))

(declare-fun arrayContainsKey!0 (array!16824 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!328867 (= res!181188 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!328868 () Bool)

(assert (=> b!328868 (= e!202086 false)))

(declare-fun lt!158034 () SeekEntryResult!3090)

(assert (=> b!328868 (= lt!158034 (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777))))

(assert (= (and start!33018 res!181187) b!328861))

(assert (= (and b!328861 res!181194) b!328866))

(assert (= (and b!328866 res!181193) b!328867))

(assert (= (and b!328867 res!181188) b!328862))

(assert (= (and b!328862 res!181191) b!328865))

(assert (= (and b!328865 res!181190) b!328863))

(assert (= (and b!328863 res!181189) b!328864))

(assert (= (and b!328864 res!181192) b!328868))

(declare-fun m!334705 () Bool)

(assert (=> b!328864 m!334705))

(declare-fun m!334707 () Bool)

(assert (=> b!328868 m!334707))

(declare-fun m!334709 () Bool)

(assert (=> b!328866 m!334709))

(declare-fun m!334711 () Bool)

(assert (=> start!33018 m!334711))

(declare-fun m!334713 () Bool)

(assert (=> start!33018 m!334713))

(declare-fun m!334715 () Bool)

(assert (=> b!328867 m!334715))

(declare-fun m!334717 () Bool)

(assert (=> b!328862 m!334717))

(declare-fun m!334719 () Bool)

(assert (=> b!328863 m!334719))

(assert (=> b!328863 m!334719))

(declare-fun m!334721 () Bool)

(assert (=> b!328863 m!334721))

(declare-fun m!334723 () Bool)

(assert (=> b!328865 m!334723))

(check-sat (not b!328862) (not b!328868) (not b!328867) (not b!328866) (not b!328863) (not start!33018) (not b!328865))
