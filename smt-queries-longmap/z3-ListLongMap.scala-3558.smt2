; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48920 () Bool)

(assert start!48920)

(declare-fun res!334427 () Bool)

(declare-fun e!312596 () Bool)

(assert (=> start!48920 (=> (not res!334427) (not e!312596))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48920 (= res!334427 (validMask!0 mask!3216))))

(assert (=> start!48920 e!312596))

(assert (=> start!48920 true))

(declare-datatypes ((array!34132 0))(
  ( (array!34133 (arr!16405 (Array (_ BitVec 32) (_ BitVec 64))) (size!16769 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34132)

(declare-fun array_inv!12201 (array!34132) Bool)

(assert (=> start!48920 (array_inv!12201 a!3154)))

(declare-fun b!539216 () Bool)

(declare-fun res!334424 () Bool)

(assert (=> b!539216 (=> (not res!334424) (not e!312596))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!539216 (= res!334424 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!539217 () Bool)

(declare-fun res!334422 () Bool)

(declare-fun e!312595 () Bool)

(assert (=> b!539217 (=> (not res!334422) (not e!312595))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4863 0))(
  ( (MissingZero!4863 (index!21676 (_ BitVec 32))) (Found!4863 (index!21677 (_ BitVec 32))) (Intermediate!4863 (undefined!5675 Bool) (index!21678 (_ BitVec 32)) (x!50590 (_ BitVec 32))) (Undefined!4863) (MissingVacant!4863 (index!21679 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34132 (_ BitVec 32)) SeekEntryResult!4863)

(assert (=> b!539217 (= res!334422 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16405 a!3154) j!147) a!3154 mask!3216) (Intermediate!4863 false resIndex!32 resX!32)))))

(declare-fun b!539218 () Bool)

(assert (=> b!539218 (= e!312595 false)))

(declare-fun lt!247093 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!539218 (= lt!247093 (toIndex!0 (select (arr!16405 a!3154) j!147) mask!3216))))

(declare-fun b!539219 () Bool)

(declare-fun res!334428 () Bool)

(assert (=> b!539219 (=> (not res!334428) (not e!312595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34132 (_ BitVec 32)) Bool)

(assert (=> b!539219 (= res!334428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!539220 () Bool)

(declare-fun res!334423 () Bool)

(assert (=> b!539220 (=> (not res!334423) (not e!312595))))

(declare-datatypes ((List!10524 0))(
  ( (Nil!10521) (Cons!10520 (h!11463 (_ BitVec 64)) (t!16752 List!10524)) )
))
(declare-fun arrayNoDuplicates!0 (array!34132 (_ BitVec 32) List!10524) Bool)

(assert (=> b!539220 (= res!334423 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10521))))

(declare-fun b!539221 () Bool)

(declare-fun res!334421 () Bool)

(assert (=> b!539221 (=> (not res!334421) (not e!312596))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!539221 (= res!334421 (validKeyInArray!0 k0!1998))))

(declare-fun b!539222 () Bool)

(assert (=> b!539222 (= e!312596 e!312595)))

(declare-fun res!334430 () Bool)

(assert (=> b!539222 (=> (not res!334430) (not e!312595))))

(declare-fun lt!247092 () SeekEntryResult!4863)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!539222 (= res!334430 (or (= lt!247092 (MissingZero!4863 i!1153)) (= lt!247092 (MissingVacant!4863 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34132 (_ BitVec 32)) SeekEntryResult!4863)

(assert (=> b!539222 (= lt!247092 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!539223 () Bool)

(declare-fun res!334429 () Bool)

(assert (=> b!539223 (=> (not res!334429) (not e!312596))))

(assert (=> b!539223 (= res!334429 (and (= (size!16769 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16769 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16769 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!539224 () Bool)

(declare-fun res!334425 () Bool)

(assert (=> b!539224 (=> (not res!334425) (not e!312595))))

(assert (=> b!539224 (= res!334425 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16769 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16769 a!3154)) (= (select (arr!16405 a!3154) resIndex!32) (select (arr!16405 a!3154) j!147))))))

(declare-fun b!539225 () Bool)

(declare-fun res!334426 () Bool)

(assert (=> b!539225 (=> (not res!334426) (not e!312596))))

(assert (=> b!539225 (= res!334426 (validKeyInArray!0 (select (arr!16405 a!3154) j!147)))))

(assert (= (and start!48920 res!334427) b!539223))

(assert (= (and b!539223 res!334429) b!539225))

(assert (= (and b!539225 res!334426) b!539221))

(assert (= (and b!539221 res!334421) b!539216))

(assert (= (and b!539216 res!334424) b!539222))

(assert (= (and b!539222 res!334430) b!539219))

(assert (= (and b!539219 res!334428) b!539220))

(assert (= (and b!539220 res!334423) b!539224))

(assert (= (and b!539224 res!334425) b!539217))

(assert (= (and b!539217 res!334422) b!539218))

(declare-fun m!518283 () Bool)

(assert (=> b!539217 m!518283))

(assert (=> b!539217 m!518283))

(declare-fun m!518285 () Bool)

(assert (=> b!539217 m!518285))

(declare-fun m!518287 () Bool)

(assert (=> start!48920 m!518287))

(declare-fun m!518289 () Bool)

(assert (=> start!48920 m!518289))

(declare-fun m!518291 () Bool)

(assert (=> b!539219 m!518291))

(declare-fun m!518293 () Bool)

(assert (=> b!539222 m!518293))

(assert (=> b!539225 m!518283))

(assert (=> b!539225 m!518283))

(declare-fun m!518295 () Bool)

(assert (=> b!539225 m!518295))

(declare-fun m!518297 () Bool)

(assert (=> b!539216 m!518297))

(declare-fun m!518299 () Bool)

(assert (=> b!539224 m!518299))

(assert (=> b!539224 m!518283))

(declare-fun m!518301 () Bool)

(assert (=> b!539221 m!518301))

(declare-fun m!518303 () Bool)

(assert (=> b!539220 m!518303))

(assert (=> b!539218 m!518283))

(assert (=> b!539218 m!518283))

(declare-fun m!518305 () Bool)

(assert (=> b!539218 m!518305))

(check-sat (not b!539218) (not b!539216) (not b!539217) (not b!539220) (not b!539221) (not b!539219) (not start!48920) (not b!539222) (not b!539225))
(check-sat)
