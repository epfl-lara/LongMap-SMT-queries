; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!32484 () Bool)

(assert start!32484)

(declare-fun b!324713 () Bool)

(declare-fun res!178044 () Bool)

(declare-fun e!200360 () Bool)

(assert (=> b!324713 (=> (not res!178044) (not e!200360))))

(declare-datatypes ((array!16623 0))(
  ( (array!16624 (arr!7869 (Array (_ BitVec 32) (_ BitVec 64))) (size!8221 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16623)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun resX!58 () (_ BitVec 32))

(declare-fun resIndex!58 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!324713 (= res!178044 (and (= (select (arr!7869 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8221 a!3305))))))

(declare-fun b!324714 () Bool)

(declare-fun res!178053 () Bool)

(declare-fun e!200361 () Bool)

(assert (=> b!324714 (=> (not res!178053) (not e!200361))))

(declare-fun k0!2497 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16623 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!324714 (= res!178053 (not (arrayContainsKey!0 a!3305 k0!2497 #b00000000000000000000000000000000)))))

(declare-fun b!324715 () Bool)

(declare-fun res!178045 () Bool)

(assert (=> b!324715 (=> (not res!178045) (not e!200361))))

(declare-fun mask!3777 () (_ BitVec 32))

(assert (=> b!324715 (= res!178045 (and (= (size!8221 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8221 a!3305))))))

(declare-fun b!324716 () Bool)

(declare-fun res!178052 () Bool)

(assert (=> b!324716 (=> (not res!178052) (not e!200361))))

(declare-datatypes ((SeekEntryResult!3000 0))(
  ( (MissingZero!3000 (index!14176 (_ BitVec 32))) (Found!3000 (index!14177 (_ BitVec 32))) (Intermediate!3000 (undefined!3812 Bool) (index!14178 (_ BitVec 32)) (x!32420 (_ BitVec 32))) (Undefined!3000) (MissingVacant!3000 (index!14179 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16623 (_ BitVec 32)) SeekEntryResult!3000)

(assert (=> b!324716 (= res!178052 (= (seekEntryOrOpen!0 k0!2497 a!3305 mask!3777) (MissingVacant!3000 i!1250)))))

(declare-fun res!178048 () Bool)

(assert (=> start!32484 (=> (not res!178048) (not e!200361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32484 (= res!178048 (validMask!0 mask!3777))))

(assert (=> start!32484 e!200361))

(declare-fun array_inv!5832 (array!16623) Bool)

(assert (=> start!32484 (array_inv!5832 a!3305)))

(assert (=> start!32484 true))

(declare-fun b!324717 () Bool)

(declare-fun res!178050 () Bool)

(assert (=> b!324717 (=> (not res!178050) (not e!200361))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16623 (_ BitVec 32)) Bool)

(assert (=> b!324717 (= res!178050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!324718 () Bool)

(declare-fun res!178049 () Bool)

(assert (=> b!324718 (=> (not res!178049) (not e!200361))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!324718 (= res!178049 (validKeyInArray!0 k0!2497))))

(declare-fun b!324719 () Bool)

(declare-fun res!178047 () Bool)

(assert (=> b!324719 (=> (not res!178047) (not e!200360))))

(assert (=> b!324719 (= res!178047 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7869 a!3305) index!1840) k0!2497)) (not (= x!1490 resX!58))))))

(declare-fun b!324720 () Bool)

(assert (=> b!324720 (= e!200360 false)))

(declare-fun lt!156858 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324720 (= lt!156858 (nextIndex!0 index!1840 x!1490 mask!3777))))

(declare-fun b!324721 () Bool)

(assert (=> b!324721 (= e!200361 e!200360)))

(declare-fun res!178046 () Bool)

(assert (=> b!324721 (=> (not res!178046) (not e!200360))))

(declare-fun lt!156857 () SeekEntryResult!3000)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16623 (_ BitVec 32)) SeekEntryResult!3000)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!324721 (= res!178046 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2497 mask!3777) k0!2497 a!3305 mask!3777) lt!156857))))

(assert (=> b!324721 (= lt!156857 (Intermediate!3000 false resIndex!58 resX!58))))

(declare-fun b!324722 () Bool)

(declare-fun res!178051 () Bool)

(assert (=> b!324722 (=> (not res!178051) (not e!200360))))

(assert (=> b!324722 (= res!178051 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k0!2497 a!3305 mask!3777) lt!156857))))

(assert (= (and start!32484 res!178048) b!324715))

(assert (= (and b!324715 res!178045) b!324718))

(assert (= (and b!324718 res!178049) b!324714))

(assert (= (and b!324714 res!178053) b!324716))

(assert (= (and b!324716 res!178052) b!324717))

(assert (= (and b!324717 res!178050) b!324721))

(assert (= (and b!324721 res!178046) b!324713))

(assert (= (and b!324713 res!178044) b!324722))

(assert (= (and b!324722 res!178051) b!324719))

(assert (= (and b!324719 res!178047) b!324720))

(declare-fun m!331703 () Bool)

(assert (=> b!324718 m!331703))

(declare-fun m!331705 () Bool)

(assert (=> b!324716 m!331705))

(declare-fun m!331707 () Bool)

(assert (=> b!324720 m!331707))

(declare-fun m!331709 () Bool)

(assert (=> start!32484 m!331709))

(declare-fun m!331711 () Bool)

(assert (=> start!32484 m!331711))

(declare-fun m!331713 () Bool)

(assert (=> b!324721 m!331713))

(assert (=> b!324721 m!331713))

(declare-fun m!331715 () Bool)

(assert (=> b!324721 m!331715))

(declare-fun m!331717 () Bool)

(assert (=> b!324714 m!331717))

(declare-fun m!331719 () Bool)

(assert (=> b!324713 m!331719))

(declare-fun m!331721 () Bool)

(assert (=> b!324717 m!331721))

(declare-fun m!331723 () Bool)

(assert (=> b!324722 m!331723))

(declare-fun m!331725 () Bool)

(assert (=> b!324719 m!331725))

(check-sat (not b!324721) (not b!324720) (not b!324722) (not b!324714) (not start!32484) (not b!324717) (not b!324718) (not b!324716))
(check-sat)
