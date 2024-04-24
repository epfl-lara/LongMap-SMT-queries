; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49240 () Bool)

(assert start!49240)

(declare-fun b!541906 () Bool)

(declare-fun res!336532 () Bool)

(declare-fun e!313770 () Bool)

(assert (=> b!541906 (=> (not res!336532) (not e!313770))))

(declare-datatypes ((array!34247 0))(
  ( (array!34248 (arr!16456 (Array (_ BitVec 32) (_ BitVec 64))) (size!16820 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34247)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34247 (_ BitVec 32)) Bool)

(assert (=> b!541906 (= res!336532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541907 () Bool)

(assert (=> b!541907 (= e!313770 false)))

(declare-datatypes ((SeekEntryResult!4870 0))(
  ( (MissingZero!4870 (index!21704 (_ BitVec 32))) (Found!4870 (index!21705 (_ BitVec 32))) (Intermediate!4870 (undefined!5682 Bool) (index!21706 (_ BitVec 32)) (x!50770 (_ BitVec 32))) (Undefined!4870) (MissingVacant!4870 (index!21707 (_ BitVec 32))) )
))
(declare-fun lt!247825 () SeekEntryResult!4870)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34247 (_ BitVec 32)) SeekEntryResult!4870)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541907 (= lt!247825 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16456 a!3154) j!147) mask!3216) (select (arr!16456 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541908 () Bool)

(declare-fun res!336538 () Bool)

(assert (=> b!541908 (=> (not res!336538) (not e!313770))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541908 (= res!336538 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16456 a!3154) j!147) a!3154 mask!3216) (Intermediate!4870 false resIndex!32 resX!32)))))

(declare-fun b!541909 () Bool)

(declare-fun res!336535 () Bool)

(declare-fun e!313769 () Bool)

(assert (=> b!541909 (=> (not res!336535) (not e!313769))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541909 (= res!336535 (validKeyInArray!0 k0!1998))))

(declare-fun b!541910 () Bool)

(assert (=> b!541910 (= e!313769 e!313770)))

(declare-fun res!336533 () Bool)

(assert (=> b!541910 (=> (not res!336533) (not e!313770))))

(declare-fun lt!247824 () SeekEntryResult!4870)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541910 (= res!336533 (or (= lt!247824 (MissingZero!4870 i!1153)) (= lt!247824 (MissingVacant!4870 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34247 (_ BitVec 32)) SeekEntryResult!4870)

(assert (=> b!541910 (= lt!247824 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!541911 () Bool)

(declare-fun res!336534 () Bool)

(assert (=> b!541911 (=> (not res!336534) (not e!313769))))

(declare-fun arrayContainsKey!0 (array!34247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541911 (= res!336534 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336529 () Bool)

(assert (=> start!49240 (=> (not res!336529) (not e!313769))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49240 (= res!336529 (validMask!0 mask!3216))))

(assert (=> start!49240 e!313769))

(assert (=> start!49240 true))

(declare-fun array_inv!12315 (array!34247) Bool)

(assert (=> start!49240 (array_inv!12315 a!3154)))

(declare-fun b!541912 () Bool)

(declare-fun res!336537 () Bool)

(assert (=> b!541912 (=> (not res!336537) (not e!313770))))

(declare-datatypes ((List!10482 0))(
  ( (Nil!10479) (Cons!10478 (h!11433 (_ BitVec 64)) (t!16702 List!10482)) )
))
(declare-fun arrayNoDuplicates!0 (array!34247 (_ BitVec 32) List!10482) Bool)

(assert (=> b!541912 (= res!336537 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10479))))

(declare-fun b!541913 () Bool)

(declare-fun res!336530 () Bool)

(assert (=> b!541913 (=> (not res!336530) (not e!313770))))

(assert (=> b!541913 (= res!336530 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16820 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16820 a!3154)) (= (select (arr!16456 a!3154) resIndex!32) (select (arr!16456 a!3154) j!147))))))

(declare-fun b!541914 () Bool)

(declare-fun res!336531 () Bool)

(assert (=> b!541914 (=> (not res!336531) (not e!313769))))

(assert (=> b!541914 (= res!336531 (and (= (size!16820 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16820 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16820 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541915 () Bool)

(declare-fun res!336536 () Bool)

(assert (=> b!541915 (=> (not res!336536) (not e!313769))))

(assert (=> b!541915 (= res!336536 (validKeyInArray!0 (select (arr!16456 a!3154) j!147)))))

(assert (= (and start!49240 res!336529) b!541914))

(assert (= (and b!541914 res!336531) b!541915))

(assert (= (and b!541915 res!336536) b!541909))

(assert (= (and b!541909 res!336535) b!541911))

(assert (= (and b!541911 res!336534) b!541910))

(assert (= (and b!541910 res!336533) b!541906))

(assert (= (and b!541906 res!336532) b!541912))

(assert (= (and b!541912 res!336537) b!541913))

(assert (= (and b!541913 res!336530) b!541908))

(assert (= (and b!541908 res!336538) b!541907))

(declare-fun m!520477 () Bool)

(assert (=> b!541913 m!520477))

(declare-fun m!520479 () Bool)

(assert (=> b!541913 m!520479))

(assert (=> b!541907 m!520479))

(assert (=> b!541907 m!520479))

(declare-fun m!520481 () Bool)

(assert (=> b!541907 m!520481))

(assert (=> b!541907 m!520481))

(assert (=> b!541907 m!520479))

(declare-fun m!520483 () Bool)

(assert (=> b!541907 m!520483))

(declare-fun m!520485 () Bool)

(assert (=> b!541906 m!520485))

(declare-fun m!520487 () Bool)

(assert (=> b!541912 m!520487))

(declare-fun m!520489 () Bool)

(assert (=> b!541911 m!520489))

(assert (=> b!541908 m!520479))

(assert (=> b!541908 m!520479))

(declare-fun m!520491 () Bool)

(assert (=> b!541908 m!520491))

(declare-fun m!520493 () Bool)

(assert (=> b!541909 m!520493))

(assert (=> b!541915 m!520479))

(assert (=> b!541915 m!520479))

(declare-fun m!520495 () Bool)

(assert (=> b!541915 m!520495))

(declare-fun m!520497 () Bool)

(assert (=> b!541910 m!520497))

(declare-fun m!520499 () Bool)

(assert (=> start!49240 m!520499))

(declare-fun m!520501 () Bool)

(assert (=> start!49240 m!520501))

(check-sat (not b!541910) (not b!541915) (not b!541907) (not b!541908) (not b!541911) (not b!541912) (not b!541906) (not b!541909) (not start!49240))
(check-sat)
