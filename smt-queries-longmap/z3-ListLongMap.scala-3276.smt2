; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45590 () Bool)

(assert start!45590)

(declare-fun b!502167 () Bool)

(declare-fun res!303667 () Bool)

(declare-fun e!294145 () Bool)

(assert (=> b!502167 (=> (not res!303667) (not e!294145))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!502167 (= res!303667 (validKeyInArray!0 k0!2280))))

(declare-fun b!502168 () Bool)

(declare-fun res!303673 () Bool)

(declare-fun e!294148 () Bool)

(assert (=> b!502168 (=> (not res!303673) (not e!294148))))

(declare-datatypes ((array!32347 0))(
  ( (array!32348 (arr!15553 (Array (_ BitVec 32) (_ BitVec 64))) (size!15917 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32347)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32347 (_ BitVec 32)) Bool)

(assert (=> b!502168 (= res!303673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun res!303675 () Bool)

(assert (=> start!45590 (=> (not res!303675) (not e!294145))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45590 (= res!303675 (validMask!0 mask!3524))))

(assert (=> start!45590 e!294145))

(assert (=> start!45590 true))

(declare-fun array_inv!11412 (array!32347) Bool)

(assert (=> start!45590 (array_inv!11412 a!3235)))

(declare-fun b!502169 () Bool)

(declare-fun e!294142 () Bool)

(assert (=> b!502169 (= e!294148 (not e!294142))))

(declare-fun res!303669 () Bool)

(assert (=> b!502169 (=> res!303669 e!294142)))

(declare-datatypes ((SeekEntryResult!3976 0))(
  ( (MissingZero!3976 (index!18092 (_ BitVec 32))) (Found!3976 (index!18093 (_ BitVec 32))) (Intermediate!3976 (undefined!4788 Bool) (index!18094 (_ BitVec 32)) (x!47270 (_ BitVec 32))) (Undefined!3976) (MissingVacant!3976 (index!18095 (_ BitVec 32))) )
))
(declare-fun lt!228258 () SeekEntryResult!3976)

(declare-fun lt!228252 () array!32347)

(declare-fun lt!228253 () (_ BitVec 32))

(declare-fun lt!228254 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32347 (_ BitVec 32)) SeekEntryResult!3976)

(assert (=> b!502169 (= res!303669 (= lt!228258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228253 lt!228254 lt!228252 mask!3524)))))

(declare-fun lt!228256 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!502169 (= lt!228258 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228256 (select (arr!15553 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!502169 (= lt!228253 (toIndex!0 lt!228254 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!502169 (= lt!228254 (select (store (arr!15553 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!502169 (= lt!228256 (toIndex!0 (select (arr!15553 a!3235) j!176) mask!3524))))

(assert (=> b!502169 (= lt!228252 (array!32348 (store (arr!15553 a!3235) i!1204 k0!2280) (size!15917 a!3235)))))

(declare-fun e!294146 () Bool)

(assert (=> b!502169 e!294146))

(declare-fun res!303668 () Bool)

(assert (=> b!502169 (=> (not res!303668) (not e!294146))))

(assert (=> b!502169 (= res!303668 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15139 0))(
  ( (Unit!15140) )
))
(declare-fun lt!228262 () Unit!15139)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32347 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15139)

(assert (=> b!502169 (= lt!228262 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!502170 () Bool)

(declare-fun e!294147 () Bool)

(assert (=> b!502170 (= e!294147 true)))

(declare-fun lt!228255 () SeekEntryResult!3976)

(assert (=> b!502170 (= lt!228255 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228256 lt!228254 lt!228252 mask!3524))))

(declare-fun b!502171 () Bool)

(declare-fun e!294144 () Unit!15139)

(declare-fun Unit!15141 () Unit!15139)

(assert (=> b!502171 (= e!294144 Unit!15141)))

(declare-fun b!502172 () Bool)

(declare-fun res!303664 () Bool)

(assert (=> b!502172 (=> (not res!303664) (not e!294145))))

(declare-fun arrayContainsKey!0 (array!32347 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!502172 (= res!303664 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!502173 () Bool)

(declare-fun Unit!15142 () Unit!15139)

(assert (=> b!502173 (= e!294144 Unit!15142)))

(declare-fun lt!228257 () Unit!15139)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15139)

(assert (=> b!502173 (= lt!228257 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!228256 #b00000000000000000000000000000000 (index!18094 lt!228258) (x!47270 lt!228258) mask!3524))))

(declare-fun res!303676 () Bool)

(assert (=> b!502173 (= res!303676 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228256 lt!228254 lt!228252 mask!3524) (Intermediate!3976 false (index!18094 lt!228258) (x!47270 lt!228258))))))

(declare-fun e!294149 () Bool)

(assert (=> b!502173 (=> (not res!303676) (not e!294149))))

(assert (=> b!502173 e!294149))

(declare-fun b!502174 () Bool)

(declare-fun res!303670 () Bool)

(assert (=> b!502174 (=> (not res!303670) (not e!294145))))

(assert (=> b!502174 (= res!303670 (validKeyInArray!0 (select (arr!15553 a!3235) j!176)))))

(declare-fun b!502175 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32347 (_ BitVec 32)) SeekEntryResult!3976)

(assert (=> b!502175 (= e!294146 (= (seekEntryOrOpen!0 (select (arr!15553 a!3235) j!176) a!3235 mask!3524) (Found!3976 j!176)))))

(declare-fun b!502176 () Bool)

(assert (=> b!502176 (= e!294149 false)))

(declare-fun b!502177 () Bool)

(declare-fun res!303665 () Bool)

(assert (=> b!502177 (=> res!303665 e!294147)))

(declare-fun e!294143 () Bool)

(assert (=> b!502177 (= res!303665 e!294143)))

(declare-fun res!303672 () Bool)

(assert (=> b!502177 (=> (not res!303672) (not e!294143))))

(assert (=> b!502177 (= res!303672 (bvsgt #b00000000000000000000000000000000 (x!47270 lt!228258)))))

(declare-fun b!502178 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32347 (_ BitVec 32)) SeekEntryResult!3976)

(assert (=> b!502178 (= e!294143 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228256 (index!18094 lt!228258) (select (arr!15553 a!3235) j!176) a!3235 mask!3524) (Found!3976 j!176))))))

(declare-fun b!502179 () Bool)

(assert (=> b!502179 (= e!294145 e!294148)))

(declare-fun res!303666 () Bool)

(assert (=> b!502179 (=> (not res!303666) (not e!294148))))

(declare-fun lt!228260 () SeekEntryResult!3976)

(assert (=> b!502179 (= res!303666 (or (= lt!228260 (MissingZero!3976 i!1204)) (= lt!228260 (MissingVacant!3976 i!1204))))))

(assert (=> b!502179 (= lt!228260 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!502180 () Bool)

(declare-fun res!303662 () Bool)

(assert (=> b!502180 (=> (not res!303662) (not e!294145))))

(assert (=> b!502180 (= res!303662 (and (= (size!15917 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15917 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15917 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!502181 () Bool)

(declare-fun res!303671 () Bool)

(assert (=> b!502181 (=> res!303671 e!294142)))

(get-info :version)

(assert (=> b!502181 (= res!303671 (or (undefined!4788 lt!228258) (not ((_ is Intermediate!3976) lt!228258))))))

(declare-fun b!502182 () Bool)

(assert (=> b!502182 (= e!294142 e!294147)))

(declare-fun res!303663 () Bool)

(assert (=> b!502182 (=> res!303663 e!294147)))

(assert (=> b!502182 (= res!303663 (or (bvsgt (x!47270 lt!228258) #b01111111111111111111111111111110) (bvslt lt!228256 #b00000000000000000000000000000000) (bvsge lt!228256 (size!15917 a!3235)) (bvslt (index!18094 lt!228258) #b00000000000000000000000000000000) (bvsge (index!18094 lt!228258) (size!15917 a!3235)) (not (= lt!228258 (Intermediate!3976 false (index!18094 lt!228258) (x!47270 lt!228258))))))))

(assert (=> b!502182 (= (index!18094 lt!228258) i!1204)))

(declare-fun lt!228259 () Unit!15139)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32347 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15139)

(assert (=> b!502182 (= lt!228259 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!228256 #b00000000000000000000000000000000 (index!18094 lt!228258) (x!47270 lt!228258) mask!3524))))

(assert (=> b!502182 (and (or (= (select (arr!15553 a!3235) (index!18094 lt!228258)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15553 a!3235) (index!18094 lt!228258)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15553 a!3235) (index!18094 lt!228258)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15553 a!3235) (index!18094 lt!228258)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228261 () Unit!15139)

(assert (=> b!502182 (= lt!228261 e!294144)))

(declare-fun c!59531 () Bool)

(assert (=> b!502182 (= c!59531 (= (select (arr!15553 a!3235) (index!18094 lt!228258)) (select (arr!15553 a!3235) j!176)))))

(assert (=> b!502182 (and (bvslt (x!47270 lt!228258) #b01111111111111111111111111111110) (or (= (select (arr!15553 a!3235) (index!18094 lt!228258)) (select (arr!15553 a!3235) j!176)) (= (select (arr!15553 a!3235) (index!18094 lt!228258)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15553 a!3235) (index!18094 lt!228258)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!502183 () Bool)

(declare-fun res!303674 () Bool)

(assert (=> b!502183 (=> (not res!303674) (not e!294148))))

(declare-datatypes ((List!9618 0))(
  ( (Nil!9615) (Cons!9614 (h!10491 (_ BitVec 64)) (t!15838 List!9618)) )
))
(declare-fun arrayNoDuplicates!0 (array!32347 (_ BitVec 32) List!9618) Bool)

(assert (=> b!502183 (= res!303674 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9615))))

(assert (= (and start!45590 res!303675) b!502180))

(assert (= (and b!502180 res!303662) b!502174))

(assert (= (and b!502174 res!303670) b!502167))

(assert (= (and b!502167 res!303667) b!502172))

(assert (= (and b!502172 res!303664) b!502179))

(assert (= (and b!502179 res!303666) b!502168))

(assert (= (and b!502168 res!303673) b!502183))

(assert (= (and b!502183 res!303674) b!502169))

(assert (= (and b!502169 res!303668) b!502175))

(assert (= (and b!502169 (not res!303669)) b!502181))

(assert (= (and b!502181 (not res!303671)) b!502182))

(assert (= (and b!502182 c!59531) b!502173))

(assert (= (and b!502182 (not c!59531)) b!502171))

(assert (= (and b!502173 res!303676) b!502176))

(assert (= (and b!502182 (not res!303663)) b!502177))

(assert (= (and b!502177 res!303672) b!502178))

(assert (= (and b!502177 (not res!303665)) b!502170))

(declare-fun m!483367 () Bool)

(assert (=> b!502178 m!483367))

(assert (=> b!502178 m!483367))

(declare-fun m!483369 () Bool)

(assert (=> b!502178 m!483369))

(declare-fun m!483371 () Bool)

(assert (=> b!502179 m!483371))

(declare-fun m!483373 () Bool)

(assert (=> b!502182 m!483373))

(declare-fun m!483375 () Bool)

(assert (=> b!502182 m!483375))

(assert (=> b!502182 m!483367))

(assert (=> b!502174 m!483367))

(assert (=> b!502174 m!483367))

(declare-fun m!483377 () Bool)

(assert (=> b!502174 m!483377))

(declare-fun m!483379 () Bool)

(assert (=> b!502183 m!483379))

(declare-fun m!483381 () Bool)

(assert (=> b!502172 m!483381))

(declare-fun m!483383 () Bool)

(assert (=> start!45590 m!483383))

(declare-fun m!483385 () Bool)

(assert (=> start!45590 m!483385))

(declare-fun m!483387 () Bool)

(assert (=> b!502169 m!483387))

(declare-fun m!483389 () Bool)

(assert (=> b!502169 m!483389))

(assert (=> b!502169 m!483367))

(declare-fun m!483391 () Bool)

(assert (=> b!502169 m!483391))

(assert (=> b!502169 m!483367))

(declare-fun m!483393 () Bool)

(assert (=> b!502169 m!483393))

(declare-fun m!483395 () Bool)

(assert (=> b!502169 m!483395))

(declare-fun m!483397 () Bool)

(assert (=> b!502169 m!483397))

(assert (=> b!502169 m!483367))

(declare-fun m!483399 () Bool)

(assert (=> b!502169 m!483399))

(declare-fun m!483401 () Bool)

(assert (=> b!502169 m!483401))

(declare-fun m!483403 () Bool)

(assert (=> b!502173 m!483403))

(declare-fun m!483405 () Bool)

(assert (=> b!502173 m!483405))

(assert (=> b!502170 m!483405))

(declare-fun m!483407 () Bool)

(assert (=> b!502167 m!483407))

(declare-fun m!483409 () Bool)

(assert (=> b!502168 m!483409))

(assert (=> b!502175 m!483367))

(assert (=> b!502175 m!483367))

(declare-fun m!483411 () Bool)

(assert (=> b!502175 m!483411))

(check-sat (not b!502178) (not b!502167) (not b!502182) (not b!502168) (not b!502170) (not b!502179) (not b!502175) (not start!45590) (not b!502172) (not b!502183) (not b!502173) (not b!502174) (not b!502169))
(check-sat)
