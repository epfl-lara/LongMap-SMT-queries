; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49610 () Bool)

(assert start!49610)

(declare-fun b!545849 () Bool)

(declare-fun e!315492 () Bool)

(declare-fun e!315497 () Bool)

(assert (=> b!545849 (= e!315492 e!315497)))

(declare-fun res!339785 () Bool)

(assert (=> b!545849 (=> (not res!339785) (not e!315497))))

(declare-datatypes ((SeekEntryResult!4998 0))(
  ( (MissingZero!4998 (index!22216 (_ BitVec 32))) (Found!4998 (index!22217 (_ BitVec 32))) (Intermediate!4998 (undefined!5810 Bool) (index!22218 (_ BitVec 32)) (x!51142 (_ BitVec 32))) (Undefined!4998) (MissingVacant!4998 (index!22219 (_ BitVec 32))) )
))
(declare-fun lt!249036 () SeekEntryResult!4998)

(declare-fun lt!249037 () SeekEntryResult!4998)

(declare-fun lt!249040 () SeekEntryResult!4998)

(assert (=> b!545849 (= res!339785 (and (= lt!249040 lt!249036) (= lt!249037 lt!249040)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34423 0))(
  ( (array!34424 (arr!16540 (Array (_ BitVec 32) (_ BitVec 64))) (size!16904 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34423)

(declare-fun lt!249034 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34423 (_ BitVec 32)) SeekEntryResult!4998)

(assert (=> b!545849 (= lt!249040 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249034 (select (arr!16540 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545850 () Bool)

(declare-fun res!339788 () Bool)

(declare-fun e!315495 () Bool)

(assert (=> b!545850 (=> (not res!339788) (not e!315495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545850 (= res!339788 (validKeyInArray!0 (select (arr!16540 a!3154) j!147)))))

(declare-fun b!545851 () Bool)

(declare-fun e!315494 () Bool)

(declare-fun e!315493 () Bool)

(assert (=> b!545851 (= e!315494 e!315493)))

(declare-fun res!339779 () Bool)

(assert (=> b!545851 (=> (not res!339779) (not e!315493))))

(declare-fun lt!249035 () SeekEntryResult!4998)

(assert (=> b!545851 (= res!339779 (= lt!249035 lt!249036))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545851 (= lt!249036 (Intermediate!4998 false resIndex!32 resX!32))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!545851 (= lt!249035 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16540 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545852 () Bool)

(assert (=> b!545852 (= e!315495 e!315494)))

(declare-fun res!339778 () Bool)

(assert (=> b!545852 (=> (not res!339778) (not e!315494))))

(declare-fun lt!249038 () SeekEntryResult!4998)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545852 (= res!339778 (or (= lt!249038 (MissingZero!4998 i!1153)) (= lt!249038 (MissingVacant!4998 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34423 (_ BitVec 32)) SeekEntryResult!4998)

(assert (=> b!545852 (= lt!249038 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545853 () Bool)

(declare-fun res!339780 () Bool)

(assert (=> b!545853 (=> (not res!339780) (not e!315495))))

(assert (=> b!545853 (= res!339780 (and (= (size!16904 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16904 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16904 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545854 () Bool)

(declare-fun res!339782 () Bool)

(assert (=> b!545854 (=> (not res!339782) (not e!315494))))

(declare-datatypes ((List!10659 0))(
  ( (Nil!10656) (Cons!10655 (h!11619 (_ BitVec 64)) (t!16887 List!10659)) )
))
(declare-fun arrayNoDuplicates!0 (array!34423 (_ BitVec 32) List!10659) Bool)

(assert (=> b!545854 (= res!339782 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10656))))

(declare-fun res!339784 () Bool)

(assert (=> start!49610 (=> (not res!339784) (not e!315495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49610 (= res!339784 (validMask!0 mask!3216))))

(assert (=> start!49610 e!315495))

(assert (=> start!49610 true))

(declare-fun array_inv!12336 (array!34423) Bool)

(assert (=> start!49610 (array_inv!12336 a!3154)))

(declare-fun b!545855 () Bool)

(declare-fun e!315498 () Bool)

(assert (=> b!545855 (= e!315498 e!315492)))

(declare-fun res!339777 () Bool)

(assert (=> b!545855 (=> (not res!339777) (not e!315492))))

(assert (=> b!545855 (= res!339777 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!249034 #b00000000000000000000000000000000) (bvslt lt!249034 (size!16904 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545855 (= lt!249034 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545856 () Bool)

(assert (=> b!545856 (= e!315497 (not true))))

(assert (=> b!545856 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!249034 (select (store (arr!16540 a!3154) i!1153 k0!1998) j!147) (array!34424 (store (arr!16540 a!3154) i!1153 k0!1998) (size!16904 a!3154)) mask!3216) lt!249036)))

(declare-datatypes ((Unit!16930 0))(
  ( (Unit!16931) )
))
(declare-fun lt!249039 () Unit!16930)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!34423 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16930)

(assert (=> b!545856 (= lt!249039 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3154 i!1153 k0!1998 j!147 lt!249034 (bvadd #b00000000000000000000000000000001 x!1030) resIndex!32 resX!32 mask!3216))))

(declare-fun b!545857 () Bool)

(declare-fun res!339781 () Bool)

(assert (=> b!545857 (=> (not res!339781) (not e!315494))))

(assert (=> b!545857 (= res!339781 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16904 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16904 a!3154)) (= (select (arr!16540 a!3154) resIndex!32) (select (arr!16540 a!3154) j!147))))))

(declare-fun b!545858 () Bool)

(assert (=> b!545858 (= e!315493 e!315498)))

(declare-fun res!339787 () Bool)

(assert (=> b!545858 (=> (not res!339787) (not e!315498))))

(assert (=> b!545858 (= res!339787 (and (= lt!249037 lt!249035) (not (= (select (arr!16540 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16540 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16540 a!3154) index!1177) (select (arr!16540 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545858 (= lt!249037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16540 a!3154) j!147) mask!3216) (select (arr!16540 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545859 () Bool)

(declare-fun res!339786 () Bool)

(assert (=> b!545859 (=> (not res!339786) (not e!315494))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34423 (_ BitVec 32)) Bool)

(assert (=> b!545859 (= res!339786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545860 () Bool)

(declare-fun res!339776 () Bool)

(assert (=> b!545860 (=> (not res!339776) (not e!315495))))

(assert (=> b!545860 (= res!339776 (validKeyInArray!0 k0!1998))))

(declare-fun b!545861 () Bool)

(declare-fun res!339783 () Bool)

(assert (=> b!545861 (=> (not res!339783) (not e!315495))))

(declare-fun arrayContainsKey!0 (array!34423 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545861 (= res!339783 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!49610 res!339784) b!545853))

(assert (= (and b!545853 res!339780) b!545850))

(assert (= (and b!545850 res!339788) b!545860))

(assert (= (and b!545860 res!339776) b!545861))

(assert (= (and b!545861 res!339783) b!545852))

(assert (= (and b!545852 res!339778) b!545859))

(assert (= (and b!545859 res!339786) b!545854))

(assert (= (and b!545854 res!339782) b!545857))

(assert (= (and b!545857 res!339781) b!545851))

(assert (= (and b!545851 res!339779) b!545858))

(assert (= (and b!545858 res!339787) b!545855))

(assert (= (and b!545855 res!339777) b!545849))

(assert (= (and b!545849 res!339785) b!545856))

(declare-fun m!523393 () Bool)

(assert (=> b!545849 m!523393))

(assert (=> b!545849 m!523393))

(declare-fun m!523395 () Bool)

(assert (=> b!545849 m!523395))

(declare-fun m!523397 () Bool)

(assert (=> b!545856 m!523397))

(declare-fun m!523399 () Bool)

(assert (=> b!545856 m!523399))

(assert (=> b!545856 m!523399))

(declare-fun m!523401 () Bool)

(assert (=> b!545856 m!523401))

(declare-fun m!523403 () Bool)

(assert (=> b!545856 m!523403))

(declare-fun m!523405 () Bool)

(assert (=> b!545855 m!523405))

(declare-fun m!523407 () Bool)

(assert (=> b!545860 m!523407))

(assert (=> b!545850 m!523393))

(assert (=> b!545850 m!523393))

(declare-fun m!523409 () Bool)

(assert (=> b!545850 m!523409))

(declare-fun m!523411 () Bool)

(assert (=> b!545854 m!523411))

(assert (=> b!545851 m!523393))

(assert (=> b!545851 m!523393))

(declare-fun m!523413 () Bool)

(assert (=> b!545851 m!523413))

(declare-fun m!523415 () Bool)

(assert (=> b!545858 m!523415))

(assert (=> b!545858 m!523393))

(assert (=> b!545858 m!523393))

(declare-fun m!523417 () Bool)

(assert (=> b!545858 m!523417))

(assert (=> b!545858 m!523417))

(assert (=> b!545858 m!523393))

(declare-fun m!523419 () Bool)

(assert (=> b!545858 m!523419))

(declare-fun m!523421 () Bool)

(assert (=> b!545859 m!523421))

(declare-fun m!523423 () Bool)

(assert (=> b!545857 m!523423))

(assert (=> b!545857 m!523393))

(declare-fun m!523425 () Bool)

(assert (=> start!49610 m!523425))

(declare-fun m!523427 () Bool)

(assert (=> start!49610 m!523427))

(declare-fun m!523429 () Bool)

(assert (=> b!545861 m!523429))

(declare-fun m!523431 () Bool)

(assert (=> b!545852 m!523431))

(check-sat (not b!545858) (not b!545854) (not b!545856) (not start!49610) (not b!545850) (not b!545849) (not b!545859) (not b!545861) (not b!545851) (not b!545860) (not b!545855) (not b!545852))
