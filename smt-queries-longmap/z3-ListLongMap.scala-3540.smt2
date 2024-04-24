; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48856 () Bool)

(assert start!48856)

(declare-fun b!537475 () Bool)

(declare-fun e!311867 () Bool)

(declare-fun e!311866 () Bool)

(assert (=> b!537475 (= e!311867 e!311866)))

(declare-fun res!332581 () Bool)

(assert (=> b!537475 (=> (not res!332581) (not e!311866))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4759 0))(
  ( (MissingZero!4759 (index!21260 (_ BitVec 32))) (Found!4759 (index!21261 (_ BitVec 32))) (Intermediate!4759 (undefined!5571 Bool) (index!21262 (_ BitVec 32)) (x!50345 (_ BitVec 32))) (Undefined!4759) (MissingVacant!4759 (index!21263 (_ BitVec 32))) )
))
(declare-fun lt!246462 () SeekEntryResult!4759)

(assert (=> b!537475 (= res!332581 (= lt!246462 (Intermediate!4759 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34016 0))(
  ( (array!34017 (arr!16345 (Array (_ BitVec 32) (_ BitVec 64))) (size!16709 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34016)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34016 (_ BitVec 32)) SeekEntryResult!4759)

(assert (=> b!537475 (= lt!246462 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16345 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537476 () Bool)

(declare-fun e!311865 () Bool)

(assert (=> b!537476 (= e!311865 e!311867)))

(declare-fun res!332578 () Bool)

(assert (=> b!537476 (=> (not res!332578) (not e!311867))))

(declare-fun lt!246463 () SeekEntryResult!4759)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!537476 (= res!332578 (or (= lt!246463 (MissingZero!4759 i!1153)) (= lt!246463 (MissingVacant!4759 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34016 (_ BitVec 32)) SeekEntryResult!4759)

(assert (=> b!537476 (= lt!246463 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537477 () Bool)

(declare-fun e!311868 () Bool)

(assert (=> b!537477 (= e!311868 false)))

(declare-fun lt!246460 () SeekEntryResult!4759)

(declare-fun lt!246461 () (_ BitVec 32))

(assert (=> b!537477 (= lt!246460 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246461 (select (arr!16345 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537478 () Bool)

(declare-fun res!332577 () Bool)

(assert (=> b!537478 (=> (not res!332577) (not e!311867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34016 (_ BitVec 32)) Bool)

(assert (=> b!537478 (= res!332577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537479 () Bool)

(declare-fun res!332575 () Bool)

(assert (=> b!537479 (=> (not res!332575) (not e!311865))))

(declare-fun arrayContainsKey!0 (array!34016 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537479 (= res!332575 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537480 () Bool)

(assert (=> b!537480 (= e!311866 e!311868)))

(declare-fun res!332584 () Bool)

(assert (=> b!537480 (=> (not res!332584) (not e!311868))))

(assert (=> b!537480 (= res!332584 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246461 #b00000000000000000000000000000000) (bvslt lt!246461 (size!16709 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537480 (= lt!246461 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!537481 () Bool)

(declare-fun res!332582 () Bool)

(assert (=> b!537481 (=> (not res!332582) (not e!311867))))

(declare-datatypes ((List!10371 0))(
  ( (Nil!10368) (Cons!10367 (h!11313 (_ BitVec 64)) (t!16591 List!10371)) )
))
(declare-fun arrayNoDuplicates!0 (array!34016 (_ BitVec 32) List!10371) Bool)

(assert (=> b!537481 (= res!332582 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10368))))

(declare-fun b!537482 () Bool)

(declare-fun res!332583 () Bool)

(assert (=> b!537482 (=> (not res!332583) (not e!311867))))

(assert (=> b!537482 (= res!332583 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16709 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16709 a!3154)) (= (select (arr!16345 a!3154) resIndex!32) (select (arr!16345 a!3154) j!147))))))

(declare-fun b!537483 () Bool)

(declare-fun res!332585 () Bool)

(assert (=> b!537483 (=> (not res!332585) (not e!311865))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537483 (= res!332585 (validKeyInArray!0 (select (arr!16345 a!3154) j!147)))))

(declare-fun b!537484 () Bool)

(declare-fun res!332587 () Bool)

(assert (=> b!537484 (=> (not res!332587) (not e!311866))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537484 (= res!332587 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16345 a!3154) j!147) mask!3216) (select (arr!16345 a!3154) j!147) a!3154 mask!3216) lt!246462))))

(declare-fun b!537485 () Bool)

(declare-fun res!332580 () Bool)

(assert (=> b!537485 (=> (not res!332580) (not e!311865))))

(assert (=> b!537485 (= res!332580 (validKeyInArray!0 k0!1998))))

(declare-fun b!537486 () Bool)

(declare-fun res!332579 () Bool)

(assert (=> b!537486 (=> (not res!332579) (not e!311865))))

(assert (=> b!537486 (= res!332579 (and (= (size!16709 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16709 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16709 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537487 () Bool)

(declare-fun res!332576 () Bool)

(assert (=> b!537487 (=> (not res!332576) (not e!311866))))

(assert (=> b!537487 (= res!332576 (and (not (= (select (arr!16345 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16345 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16345 a!3154) index!1177) (select (arr!16345 a!3154) j!147)))))))

(declare-fun res!332586 () Bool)

(assert (=> start!48856 (=> (not res!332586) (not e!311865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48856 (= res!332586 (validMask!0 mask!3216))))

(assert (=> start!48856 e!311865))

(assert (=> start!48856 true))

(declare-fun array_inv!12204 (array!34016) Bool)

(assert (=> start!48856 (array_inv!12204 a!3154)))

(assert (= (and start!48856 res!332586) b!537486))

(assert (= (and b!537486 res!332579) b!537483))

(assert (= (and b!537483 res!332585) b!537485))

(assert (= (and b!537485 res!332580) b!537479))

(assert (= (and b!537479 res!332575) b!537476))

(assert (= (and b!537476 res!332578) b!537478))

(assert (= (and b!537478 res!332577) b!537481))

(assert (= (and b!537481 res!332582) b!537482))

(assert (= (and b!537482 res!332583) b!537475))

(assert (= (and b!537475 res!332581) b!537484))

(assert (= (and b!537484 res!332587) b!537487))

(assert (= (and b!537487 res!332576) b!537480))

(assert (= (and b!537480 res!332584) b!537477))

(declare-fun m!516859 () Bool)

(assert (=> b!537476 m!516859))

(declare-fun m!516861 () Bool)

(assert (=> start!48856 m!516861))

(declare-fun m!516863 () Bool)

(assert (=> start!48856 m!516863))

(declare-fun m!516865 () Bool)

(assert (=> b!537483 m!516865))

(assert (=> b!537483 m!516865))

(declare-fun m!516867 () Bool)

(assert (=> b!537483 m!516867))

(assert (=> b!537475 m!516865))

(assert (=> b!537475 m!516865))

(declare-fun m!516869 () Bool)

(assert (=> b!537475 m!516869))

(declare-fun m!516871 () Bool)

(assert (=> b!537481 m!516871))

(declare-fun m!516873 () Bool)

(assert (=> b!537487 m!516873))

(assert (=> b!537487 m!516865))

(declare-fun m!516875 () Bool)

(assert (=> b!537482 m!516875))

(assert (=> b!537482 m!516865))

(assert (=> b!537484 m!516865))

(assert (=> b!537484 m!516865))

(declare-fun m!516877 () Bool)

(assert (=> b!537484 m!516877))

(assert (=> b!537484 m!516877))

(assert (=> b!537484 m!516865))

(declare-fun m!516879 () Bool)

(assert (=> b!537484 m!516879))

(declare-fun m!516881 () Bool)

(assert (=> b!537480 m!516881))

(declare-fun m!516883 () Bool)

(assert (=> b!537478 m!516883))

(assert (=> b!537477 m!516865))

(assert (=> b!537477 m!516865))

(declare-fun m!516885 () Bool)

(assert (=> b!537477 m!516885))

(declare-fun m!516887 () Bool)

(assert (=> b!537485 m!516887))

(declare-fun m!516889 () Bool)

(assert (=> b!537479 m!516889))

(check-sat (not b!537478) (not b!537485) (not b!537475) (not b!537481) (not b!537479) (not b!537477) (not b!537483) (not start!48856) (not b!537480) (not b!537484) (not b!537476))
(check-sat)
