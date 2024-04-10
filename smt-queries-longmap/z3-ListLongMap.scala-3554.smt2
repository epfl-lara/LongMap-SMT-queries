; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48896 () Bool)

(assert start!48896)

(declare-fun b!538931 () Bool)

(declare-fun res!334141 () Bool)

(declare-fun e!312487 () Bool)

(assert (=> b!538931 (=> (not res!334141) (not e!312487))))

(declare-datatypes ((array!34108 0))(
  ( (array!34109 (arr!16393 (Array (_ BitVec 32) (_ BitVec 64))) (size!16757 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34108)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34108 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538931 (= res!334141 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!334137 () Bool)

(assert (=> start!48896 (=> (not res!334137) (not e!312487))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48896 (= res!334137 (validMask!0 mask!3216))))

(assert (=> start!48896 e!312487))

(assert (=> start!48896 true))

(declare-fun array_inv!12189 (array!34108) Bool)

(assert (=> start!48896 (array_inv!12189 a!3154)))

(declare-fun b!538932 () Bool)

(declare-fun res!334140 () Bool)

(declare-fun e!312488 () Bool)

(assert (=> b!538932 (=> (not res!334140) (not e!312488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34108 (_ BitVec 32)) Bool)

(assert (=> b!538932 (= res!334140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538933 () Bool)

(declare-fun res!334136 () Bool)

(assert (=> b!538933 (=> (not res!334136) (not e!312487))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538933 (= res!334136 (validKeyInArray!0 (select (arr!16393 a!3154) j!147)))))

(declare-fun b!538934 () Bool)

(declare-fun res!334139 () Bool)

(assert (=> b!538934 (=> (not res!334139) (not e!312487))))

(assert (=> b!538934 (= res!334139 (validKeyInArray!0 k0!1998))))

(declare-fun b!538935 () Bool)

(declare-fun res!334142 () Bool)

(assert (=> b!538935 (=> (not res!334142) (not e!312487))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538935 (= res!334142 (and (= (size!16757 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16757 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16757 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538936 () Bool)

(assert (=> b!538936 (= e!312488 false)))

(declare-fun lt!247021 () Bool)

(declare-datatypes ((List!10512 0))(
  ( (Nil!10509) (Cons!10508 (h!11451 (_ BitVec 64)) (t!16740 List!10512)) )
))
(declare-fun arrayNoDuplicates!0 (array!34108 (_ BitVec 32) List!10512) Bool)

(assert (=> b!538936 (= lt!247021 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10509))))

(declare-fun b!538937 () Bool)

(assert (=> b!538937 (= e!312487 e!312488)))

(declare-fun res!334138 () Bool)

(assert (=> b!538937 (=> (not res!334138) (not e!312488))))

(declare-datatypes ((SeekEntryResult!4851 0))(
  ( (MissingZero!4851 (index!21628 (_ BitVec 32))) (Found!4851 (index!21629 (_ BitVec 32))) (Intermediate!4851 (undefined!5663 Bool) (index!21630 (_ BitVec 32)) (x!50546 (_ BitVec 32))) (Undefined!4851) (MissingVacant!4851 (index!21631 (_ BitVec 32))) )
))
(declare-fun lt!247020 () SeekEntryResult!4851)

(assert (=> b!538937 (= res!334138 (or (= lt!247020 (MissingZero!4851 i!1153)) (= lt!247020 (MissingVacant!4851 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34108 (_ BitVec 32)) SeekEntryResult!4851)

(assert (=> b!538937 (= lt!247020 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48896 res!334137) b!538935))

(assert (= (and b!538935 res!334142) b!538933))

(assert (= (and b!538933 res!334136) b!538934))

(assert (= (and b!538934 res!334139) b!538931))

(assert (= (and b!538931 res!334141) b!538937))

(assert (= (and b!538937 res!334138) b!538932))

(assert (= (and b!538932 res!334140) b!538936))

(declare-fun m!518049 () Bool)

(assert (=> b!538933 m!518049))

(assert (=> b!538933 m!518049))

(declare-fun m!518051 () Bool)

(assert (=> b!538933 m!518051))

(declare-fun m!518053 () Bool)

(assert (=> b!538931 m!518053))

(declare-fun m!518055 () Bool)

(assert (=> b!538932 m!518055))

(declare-fun m!518057 () Bool)

(assert (=> start!48896 m!518057))

(declare-fun m!518059 () Bool)

(assert (=> start!48896 m!518059))

(declare-fun m!518061 () Bool)

(assert (=> b!538934 m!518061))

(declare-fun m!518063 () Bool)

(assert (=> b!538937 m!518063))

(declare-fun m!518065 () Bool)

(assert (=> b!538936 m!518065))

(check-sat (not b!538937) (not b!538936) (not b!538934) (not start!48896) (not b!538931) (not b!538933) (not b!538932))
(check-sat)
