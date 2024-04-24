; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48592 () Bool)

(assert start!48592)

(declare-fun b!533635 () Bool)

(declare-fun e!310451 () Bool)

(assert (=> b!533635 (= e!310451 false)))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4654 0))(
  ( (MissingZero!4654 (index!20840 (_ BitVec 32))) (Found!4654 (index!20841 (_ BitVec 32))) (Intermediate!4654 (undefined!5466 Bool) (index!20842 (_ BitVec 32)) (x!49954 (_ BitVec 32))) (Undefined!4654) (MissingVacant!4654 (index!20843 (_ BitVec 32))) )
))
(declare-fun lt!245496 () SeekEntryResult!4654)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33803 0))(
  ( (array!33804 (arr!16240 (Array (_ BitVec 32) (_ BitVec 64))) (size!16604 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33803)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33803 (_ BitVec 32)) SeekEntryResult!4654)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533635 (= lt!245496 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16240 a!3154) j!147) mask!3216) (select (arr!16240 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533636 () Bool)

(declare-fun res!328897 () Bool)

(assert (=> b!533636 (=> (not res!328897) (not e!310451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33803 (_ BitVec 32)) Bool)

(assert (=> b!533636 (= res!328897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!328901 () Bool)

(declare-fun e!310450 () Bool)

(assert (=> start!48592 (=> (not res!328901) (not e!310450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48592 (= res!328901 (validMask!0 mask!3216))))

(assert (=> start!48592 e!310450))

(assert (=> start!48592 true))

(declare-fun array_inv!12099 (array!33803) Bool)

(assert (=> start!48592 (array_inv!12099 a!3154)))

(declare-fun b!533637 () Bool)

(declare-fun res!328898 () Bool)

(assert (=> b!533637 (=> (not res!328898) (not e!310450))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533637 (= res!328898 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533638 () Bool)

(declare-fun res!328899 () Bool)

(assert (=> b!533638 (=> (not res!328899) (not e!310451))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!533638 (= res!328899 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16240 a!3154) j!147) a!3154 mask!3216) (Intermediate!4654 false resIndex!32 resX!32)))))

(declare-fun b!533639 () Bool)

(declare-fun res!328895 () Bool)

(assert (=> b!533639 (=> (not res!328895) (not e!310451))))

(declare-datatypes ((List!10266 0))(
  ( (Nil!10263) (Cons!10262 (h!11205 (_ BitVec 64)) (t!16486 List!10266)) )
))
(declare-fun arrayNoDuplicates!0 (array!33803 (_ BitVec 32) List!10266) Bool)

(assert (=> b!533639 (= res!328895 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10263))))

(declare-fun b!533640 () Bool)

(declare-fun res!328894 () Bool)

(assert (=> b!533640 (=> (not res!328894) (not e!310450))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533640 (= res!328894 (and (= (size!16604 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16604 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16604 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!533641 () Bool)

(declare-fun res!328902 () Bool)

(assert (=> b!533641 (=> (not res!328902) (not e!310451))))

(assert (=> b!533641 (= res!328902 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16604 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16604 a!3154)) (= (select (arr!16240 a!3154) resIndex!32) (select (arr!16240 a!3154) j!147))))))

(declare-fun b!533642 () Bool)

(declare-fun res!328896 () Bool)

(assert (=> b!533642 (=> (not res!328896) (not e!310450))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533642 (= res!328896 (validKeyInArray!0 (select (arr!16240 a!3154) j!147)))))

(declare-fun b!533643 () Bool)

(assert (=> b!533643 (= e!310450 e!310451)))

(declare-fun res!328900 () Bool)

(assert (=> b!533643 (=> (not res!328900) (not e!310451))))

(declare-fun lt!245497 () SeekEntryResult!4654)

(assert (=> b!533643 (= res!328900 (or (= lt!245497 (MissingZero!4654 i!1153)) (= lt!245497 (MissingVacant!4654 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33803 (_ BitVec 32)) SeekEntryResult!4654)

(assert (=> b!533643 (= lt!245497 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533644 () Bool)

(declare-fun res!328903 () Bool)

(assert (=> b!533644 (=> (not res!328903) (not e!310450))))

(assert (=> b!533644 (= res!328903 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48592 res!328901) b!533640))

(assert (= (and b!533640 res!328894) b!533642))

(assert (= (and b!533642 res!328896) b!533644))

(assert (= (and b!533644 res!328903) b!533637))

(assert (= (and b!533637 res!328898) b!533643))

(assert (= (and b!533643 res!328900) b!533636))

(assert (= (and b!533636 res!328897) b!533639))

(assert (= (and b!533639 res!328895) b!533641))

(assert (= (and b!533641 res!328902) b!533638))

(assert (= (and b!533638 res!328899) b!533635))

(declare-fun m!513697 () Bool)

(assert (=> b!533644 m!513697))

(declare-fun m!513699 () Bool)

(assert (=> b!533639 m!513699))

(declare-fun m!513701 () Bool)

(assert (=> start!48592 m!513701))

(declare-fun m!513703 () Bool)

(assert (=> start!48592 m!513703))

(declare-fun m!513705 () Bool)

(assert (=> b!533635 m!513705))

(assert (=> b!533635 m!513705))

(declare-fun m!513707 () Bool)

(assert (=> b!533635 m!513707))

(assert (=> b!533635 m!513707))

(assert (=> b!533635 m!513705))

(declare-fun m!513709 () Bool)

(assert (=> b!533635 m!513709))

(declare-fun m!513711 () Bool)

(assert (=> b!533637 m!513711))

(declare-fun m!513713 () Bool)

(assert (=> b!533641 m!513713))

(assert (=> b!533641 m!513705))

(assert (=> b!533642 m!513705))

(assert (=> b!533642 m!513705))

(declare-fun m!513715 () Bool)

(assert (=> b!533642 m!513715))

(assert (=> b!533638 m!513705))

(assert (=> b!533638 m!513705))

(declare-fun m!513717 () Bool)

(assert (=> b!533638 m!513717))

(declare-fun m!513719 () Bool)

(assert (=> b!533636 m!513719))

(declare-fun m!513721 () Bool)

(assert (=> b!533643 m!513721))

(check-sat (not start!48592) (not b!533638) (not b!533639) (not b!533636) (not b!533635) (not b!533642) (not b!533644) (not b!533637) (not b!533643))
(check-sat)
