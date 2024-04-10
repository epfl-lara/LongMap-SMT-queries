; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48382 () Bool)

(assert start!48382)

(declare-fun b!531626 () Bool)

(declare-fun e!309662 () Bool)

(assert (=> b!531626 (= e!309662 false)))

(declare-fun lt!245046 () Bool)

(declare-datatypes ((array!33690 0))(
  ( (array!33691 (arr!16187 (Array (_ BitVec 32) (_ BitVec 64))) (size!16551 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33690)

(declare-datatypes ((List!10306 0))(
  ( (Nil!10303) (Cons!10302 (h!11242 (_ BitVec 64)) (t!16534 List!10306)) )
))
(declare-fun arrayNoDuplicates!0 (array!33690 (_ BitVec 32) List!10306) Bool)

(assert (=> b!531626 (= lt!245046 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10303))))

(declare-fun b!531627 () Bool)

(declare-fun e!309663 () Bool)

(assert (=> b!531627 (= e!309663 e!309662)))

(declare-fun res!327116 () Bool)

(assert (=> b!531627 (=> (not res!327116) (not e!309662))))

(declare-datatypes ((SeekEntryResult!4645 0))(
  ( (MissingZero!4645 (index!20804 (_ BitVec 32))) (Found!4645 (index!20805 (_ BitVec 32))) (Intermediate!4645 (undefined!5457 Bool) (index!20806 (_ BitVec 32)) (x!49779 (_ BitVec 32))) (Undefined!4645) (MissingVacant!4645 (index!20807 (_ BitVec 32))) )
))
(declare-fun lt!245047 () SeekEntryResult!4645)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531627 (= res!327116 (or (= lt!245047 (MissingZero!4645 i!1153)) (= lt!245047 (MissingVacant!4645 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33690 (_ BitVec 32)) SeekEntryResult!4645)

(assert (=> b!531627 (= lt!245047 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531628 () Bool)

(declare-fun res!327119 () Bool)

(assert (=> b!531628 (=> (not res!327119) (not e!309663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531628 (= res!327119 (validKeyInArray!0 k!1998))))

(declare-fun res!327121 () Bool)

(assert (=> start!48382 (=> (not res!327121) (not e!309663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48382 (= res!327121 (validMask!0 mask!3216))))

(assert (=> start!48382 e!309663))

(assert (=> start!48382 true))

(declare-fun array_inv!11983 (array!33690) Bool)

(assert (=> start!48382 (array_inv!11983 a!3154)))

(declare-fun b!531629 () Bool)

(declare-fun res!327117 () Bool)

(assert (=> b!531629 (=> (not res!327117) (not e!309662))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33690 (_ BitVec 32)) Bool)

(assert (=> b!531629 (= res!327117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531630 () Bool)

(declare-fun res!327122 () Bool)

(assert (=> b!531630 (=> (not res!327122) (not e!309663))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531630 (= res!327122 (validKeyInArray!0 (select (arr!16187 a!3154) j!147)))))

(declare-fun b!531631 () Bool)

(declare-fun res!327120 () Bool)

(assert (=> b!531631 (=> (not res!327120) (not e!309663))))

(assert (=> b!531631 (= res!327120 (and (= (size!16551 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16551 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16551 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531632 () Bool)

(declare-fun res!327118 () Bool)

(assert (=> b!531632 (=> (not res!327118) (not e!309663))))

(declare-fun arrayContainsKey!0 (array!33690 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531632 (= res!327118 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48382 res!327121) b!531631))

(assert (= (and b!531631 res!327120) b!531630))

(assert (= (and b!531630 res!327122) b!531628))

(assert (= (and b!531628 res!327119) b!531632))

(assert (= (and b!531632 res!327118) b!531627))

(assert (= (and b!531627 res!327116) b!531629))

(assert (= (and b!531629 res!327117) b!531626))

(declare-fun m!512007 () Bool)

(assert (=> b!531629 m!512007))

(declare-fun m!512009 () Bool)

(assert (=> b!531628 m!512009))

(declare-fun m!512011 () Bool)

(assert (=> b!531626 m!512011))

(declare-fun m!512013 () Bool)

(assert (=> b!531630 m!512013))

(assert (=> b!531630 m!512013))

(declare-fun m!512015 () Bool)

(assert (=> b!531630 m!512015))

(declare-fun m!512017 () Bool)

(assert (=> b!531627 m!512017))

(declare-fun m!512019 () Bool)

(assert (=> start!48382 m!512019))

(declare-fun m!512021 () Bool)

(assert (=> start!48382 m!512021))

(declare-fun m!512023 () Bool)

(assert (=> b!531632 m!512023))

(push 1)

(assert (not b!531627))

(assert (not start!48382))

(assert (not b!531628))

(assert (not b!531629))

(assert (not b!531632))

(assert (not b!531630))

(assert (not b!531626))

