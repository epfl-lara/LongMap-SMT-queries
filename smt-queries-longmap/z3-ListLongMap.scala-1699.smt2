; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31068 () Bool)

(assert start!31068)

(declare-fun b!312714 () Bool)

(declare-fun res!169225 () Bool)

(declare-fun e!194950 () Bool)

(assert (=> b!312714 (=> (not res!169225) (not e!194950))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312714 (= res!169225 (validKeyInArray!0 k0!2441))))

(declare-fun b!312716 () Bool)

(declare-fun res!169224 () Bool)

(assert (=> b!312716 (=> (not res!169224) (not e!194950))))

(declare-datatypes ((array!15983 0))(
  ( (array!15984 (arr!7573 (Array (_ BitVec 32) (_ BitVec 64))) (size!7925 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15983)

(declare-fun arrayContainsKey!0 (array!15983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312716 (= res!169224 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312717 () Bool)

(declare-fun e!194949 () Bool)

(declare-fun e!194948 () Bool)

(assert (=> b!312717 (= e!194949 e!194948)))

(declare-fun res!169226 () Bool)

(assert (=> b!312717 (=> (not res!169226) (not e!194948))))

(declare-datatypes ((SeekEntryResult!2678 0))(
  ( (MissingZero!2678 (index!12888 (_ BitVec 32))) (Found!2678 (index!12889 (_ BitVec 32))) (Intermediate!2678 (undefined!3490 Bool) (index!12890 (_ BitVec 32)) (x!31200 (_ BitVec 32))) (Undefined!2678) (MissingVacant!2678 (index!12891 (_ BitVec 32))) )
))
(declare-fun lt!153312 () SeekEntryResult!2678)

(declare-fun lt!153313 () SeekEntryResult!2678)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!312717 (= res!169226 (and (= lt!153313 lt!153312) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7573 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15983 (_ BitVec 32)) SeekEntryResult!2678)

(assert (=> b!312717 (= lt!153313 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312718 () Bool)

(declare-fun res!169223 () Bool)

(assert (=> b!312718 (=> (not res!169223) (not e!194950))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312718 (= res!169223 (and (= (size!7925 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7925 a!3293))))))

(declare-fun b!312719 () Bool)

(declare-fun res!169221 () Bool)

(assert (=> b!312719 (=> (not res!169221) (not e!194949))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312719 (= res!169221 (and (= (select (arr!7573 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7925 a!3293))))))

(declare-fun b!312720 () Bool)

(declare-fun e!194952 () Bool)

(assert (=> b!312720 (= e!194948 (not e!194952))))

(declare-fun res!169222 () Bool)

(assert (=> b!312720 (=> res!169222 e!194952)))

(declare-fun lt!153315 () (_ BitVec 32))

(declare-fun lt!153314 () SeekEntryResult!2678)

(assert (=> b!312720 (= res!169222 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153315 #b00000000000000000000000000000000) (bvsge lt!153315 (size!7925 a!3293)) (not (= lt!153314 lt!153312))))))

(declare-fun lt!153309 () SeekEntryResult!2678)

(declare-fun lt!153310 () SeekEntryResult!2678)

(assert (=> b!312720 (= lt!153309 lt!153310)))

(declare-fun lt!153308 () array!15983)

(assert (=> b!312720 (= lt!153310 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153315 k0!2441 lt!153308 mask!3709))))

(assert (=> b!312720 (= lt!153309 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!153308 mask!3709))))

(assert (=> b!312720 (= lt!153308 (array!15984 (store (arr!7573 a!3293) i!1240 k0!2441) (size!7925 a!3293)))))

(assert (=> b!312720 (= lt!153313 lt!153314)))

(assert (=> b!312720 (= lt!153314 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153315 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312720 (= lt!153315 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun b!312721 () Bool)

(declare-fun res!169219 () Bool)

(assert (=> b!312721 (=> (not res!169219) (not e!194950))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15983 (_ BitVec 32)) Bool)

(assert (=> b!312721 (= res!169219 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312722 () Bool)

(assert (=> b!312722 (= e!194950 e!194949)))

(declare-fun res!169227 () Bool)

(assert (=> b!312722 (=> (not res!169227) (not e!194949))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312722 (= res!169227 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153312))))

(assert (=> b!312722 (= lt!153312 (Intermediate!2678 false resIndex!52 resX!52))))

(declare-fun b!312723 () Bool)

(assert (=> b!312723 (= e!194952 true)))

(assert (=> b!312723 (= lt!153310 lt!153314)))

(declare-datatypes ((Unit!9617 0))(
  ( (Unit!9618) )
))
(declare-fun lt!153311 () Unit!9617)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15983 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9617)

(assert (=> b!312723 (= lt!153311 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153315 resIndex!52 resX!52 mask!3709))))

(declare-fun res!169218 () Bool)

(assert (=> start!31068 (=> (not res!169218) (not e!194950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31068 (= res!169218 (validMask!0 mask!3709))))

(assert (=> start!31068 e!194950))

(declare-fun array_inv!5523 (array!15983) Bool)

(assert (=> start!31068 (array_inv!5523 a!3293)))

(assert (=> start!31068 true))

(declare-fun b!312715 () Bool)

(declare-fun res!169220 () Bool)

(assert (=> b!312715 (=> (not res!169220) (not e!194950))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15983 (_ BitVec 32)) SeekEntryResult!2678)

(assert (=> b!312715 (= res!169220 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2678 i!1240)))))

(assert (= (and start!31068 res!169218) b!312718))

(assert (= (and b!312718 res!169223) b!312714))

(assert (= (and b!312714 res!169225) b!312716))

(assert (= (and b!312716 res!169224) b!312715))

(assert (= (and b!312715 res!169220) b!312721))

(assert (= (and b!312721 res!169219) b!312722))

(assert (= (and b!312722 res!169227) b!312719))

(assert (= (and b!312719 res!169221) b!312717))

(assert (= (and b!312717 res!169226) b!312720))

(assert (= (and b!312720 (not res!169222)) b!312723))

(declare-fun m!323029 () Bool)

(assert (=> b!312715 m!323029))

(declare-fun m!323031 () Bool)

(assert (=> b!312719 m!323031))

(declare-fun m!323033 () Bool)

(assert (=> b!312720 m!323033))

(declare-fun m!323035 () Bool)

(assert (=> b!312720 m!323035))

(declare-fun m!323037 () Bool)

(assert (=> b!312720 m!323037))

(declare-fun m!323039 () Bool)

(assert (=> b!312720 m!323039))

(declare-fun m!323041 () Bool)

(assert (=> b!312720 m!323041))

(declare-fun m!323043 () Bool)

(assert (=> b!312717 m!323043))

(declare-fun m!323045 () Bool)

(assert (=> b!312717 m!323045))

(declare-fun m!323047 () Bool)

(assert (=> b!312722 m!323047))

(assert (=> b!312722 m!323047))

(declare-fun m!323049 () Bool)

(assert (=> b!312722 m!323049))

(declare-fun m!323051 () Bool)

(assert (=> b!312723 m!323051))

(declare-fun m!323053 () Bool)

(assert (=> start!31068 m!323053))

(declare-fun m!323055 () Bool)

(assert (=> start!31068 m!323055))

(declare-fun m!323057 () Bool)

(assert (=> b!312714 m!323057))

(declare-fun m!323059 () Bool)

(assert (=> b!312721 m!323059))

(declare-fun m!323061 () Bool)

(assert (=> b!312716 m!323061))

(check-sat (not b!312722) (not b!312721) (not b!312723) (not b!312714) (not b!312717) (not start!31068) (not b!312720) (not b!312716) (not b!312715))
(check-sat)
