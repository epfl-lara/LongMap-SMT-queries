; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48894 () Bool)

(assert start!48894)

(declare-fun b!538910 () Bool)

(declare-fun e!312480 () Bool)

(assert (=> b!538910 (= e!312480 false)))

(declare-fun lt!247015 () Bool)

(declare-datatypes ((array!34106 0))(
  ( (array!34107 (arr!16392 (Array (_ BitVec 32) (_ BitVec 64))) (size!16756 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34106)

(declare-datatypes ((List!10511 0))(
  ( (Nil!10508) (Cons!10507 (h!11450 (_ BitVec 64)) (t!16739 List!10511)) )
))
(declare-fun arrayNoDuplicates!0 (array!34106 (_ BitVec 32) List!10511) Bool)

(assert (=> b!538910 (= lt!247015 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10508))))

(declare-fun b!538911 () Bool)

(declare-fun res!334115 () Bool)

(declare-fun e!312478 () Bool)

(assert (=> b!538911 (=> (not res!334115) (not e!312478))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538911 (= res!334115 (and (= (size!16756 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16756 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16756 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538912 () Bool)

(declare-fun res!334117 () Bool)

(assert (=> b!538912 (=> (not res!334117) (not e!312478))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538912 (= res!334117 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538913 () Bool)

(assert (=> b!538913 (= e!312478 e!312480)))

(declare-fun res!334120 () Bool)

(assert (=> b!538913 (=> (not res!334120) (not e!312480))))

(declare-datatypes ((SeekEntryResult!4850 0))(
  ( (MissingZero!4850 (index!21624 (_ BitVec 32))) (Found!4850 (index!21625 (_ BitVec 32))) (Intermediate!4850 (undefined!5662 Bool) (index!21626 (_ BitVec 32)) (x!50545 (_ BitVec 32))) (Undefined!4850) (MissingVacant!4850 (index!21627 (_ BitVec 32))) )
))
(declare-fun lt!247014 () SeekEntryResult!4850)

(assert (=> b!538913 (= res!334120 (or (= lt!247014 (MissingZero!4850 i!1153)) (= lt!247014 (MissingVacant!4850 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34106 (_ BitVec 32)) SeekEntryResult!4850)

(assert (=> b!538913 (= lt!247014 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538914 () Bool)

(declare-fun res!334119 () Bool)

(assert (=> b!538914 (=> (not res!334119) (not e!312478))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538914 (= res!334119 (validKeyInArray!0 k!1998))))

(declare-fun res!334121 () Bool)

(assert (=> start!48894 (=> (not res!334121) (not e!312478))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48894 (= res!334121 (validMask!0 mask!3216))))

(assert (=> start!48894 e!312478))

(assert (=> start!48894 true))

(declare-fun array_inv!12188 (array!34106) Bool)

(assert (=> start!48894 (array_inv!12188 a!3154)))

(declare-fun b!538915 () Bool)

(declare-fun res!334118 () Bool)

(assert (=> b!538915 (=> (not res!334118) (not e!312478))))

(assert (=> b!538915 (= res!334118 (validKeyInArray!0 (select (arr!16392 a!3154) j!147)))))

(declare-fun b!538916 () Bool)

(declare-fun res!334116 () Bool)

(assert (=> b!538916 (=> (not res!334116) (not e!312480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34106 (_ BitVec 32)) Bool)

(assert (=> b!538916 (= res!334116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48894 res!334121) b!538911))

(assert (= (and b!538911 res!334115) b!538915))

(assert (= (and b!538915 res!334118) b!538914))

(assert (= (and b!538914 res!334119) b!538912))

(assert (= (and b!538912 res!334117) b!538913))

(assert (= (and b!538913 res!334120) b!538916))

(assert (= (and b!538916 res!334116) b!538910))

(declare-fun m!518031 () Bool)

(assert (=> b!538916 m!518031))

(declare-fun m!518033 () Bool)

(assert (=> b!538910 m!518033))

(declare-fun m!518035 () Bool)

(assert (=> start!48894 m!518035))

(declare-fun m!518037 () Bool)

(assert (=> start!48894 m!518037))

(declare-fun m!518039 () Bool)

(assert (=> b!538914 m!518039))

(declare-fun m!518041 () Bool)

(assert (=> b!538912 m!518041))

(declare-fun m!518043 () Bool)

(assert (=> b!538913 m!518043))

(declare-fun m!518045 () Bool)

(assert (=> b!538915 m!518045))

(assert (=> b!538915 m!518045))

(declare-fun m!518047 () Bool)

(assert (=> b!538915 m!518047))

(push 1)

