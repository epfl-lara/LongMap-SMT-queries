; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49598 () Bool)

(assert start!49598)

(declare-fun b!545619 () Bool)

(declare-fun res!339555 () Bool)

(declare-fun e!315372 () Bool)

(assert (=> b!545619 (=> (not res!339555) (not e!315372))))

(declare-datatypes ((array!34411 0))(
  ( (array!34412 (arr!16534 (Array (_ BitVec 32) (_ BitVec 64))) (size!16898 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34411)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34411 (_ BitVec 32)) Bool)

(assert (=> b!545619 (= res!339555 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545620 () Bool)

(declare-fun e!315371 () Bool)

(declare-fun e!315375 () Bool)

(assert (=> b!545620 (= e!315371 e!315375)))

(declare-fun res!339547 () Bool)

(assert (=> b!545620 (=> (not res!339547) (not e!315375))))

(declare-datatypes ((SeekEntryResult!4992 0))(
  ( (MissingZero!4992 (index!22192 (_ BitVec 32))) (Found!4992 (index!22193 (_ BitVec 32))) (Intermediate!4992 (undefined!5804 Bool) (index!22194 (_ BitVec 32)) (x!51120 (_ BitVec 32))) (Undefined!4992) (MissingVacant!4992 (index!22195 (_ BitVec 32))) )
))
(declare-fun lt!248914 () SeekEntryResult!4992)

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!248917 () SeekEntryResult!4992)

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!545620 (= res!339547 (and (= lt!248914 lt!248917) (not (= (select (arr!16534 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16534 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16534 a!3154) index!1177) (select (arr!16534 a!3154) j!147)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34411 (_ BitVec 32)) SeekEntryResult!4992)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545620 (= lt!248914 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16534 a!3154) j!147) mask!3216) (select (arr!16534 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545621 () Bool)

(declare-fun res!339550 () Bool)

(declare-fun e!315373 () Bool)

(assert (=> b!545621 (=> (not res!339550) (not e!315373))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545621 (= res!339550 (validKeyInArray!0 (select (arr!16534 a!3154) j!147)))))

(declare-fun b!545623 () Bool)

(declare-fun res!339557 () Bool)

(assert (=> b!545623 (=> (not res!339557) (not e!315373))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545623 (= res!339557 (and (= (size!16898 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16898 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16898 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!545624 () Bool)

(declare-fun res!339554 () Bool)

(assert (=> b!545624 (=> (not res!339554) (not e!315373))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!545624 (= res!339554 (validKeyInArray!0 k0!1998))))

(declare-fun b!545625 () Bool)

(declare-fun res!339548 () Bool)

(assert (=> b!545625 (=> (not res!339548) (not e!315372))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545625 (= res!339548 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16898 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16898 a!3154)) (= (select (arr!16534 a!3154) resIndex!32) (select (arr!16534 a!3154) j!147))))))

(declare-fun lt!248916 () SeekEntryResult!4992)

(declare-fun e!315370 () Bool)

(declare-fun b!545626 () Bool)

(declare-fun lt!248915 () SeekEntryResult!4992)

(assert (=> b!545626 (= e!315370 (and (= lt!248916 lt!248915) (= lt!248914 lt!248916) (bvsge (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1030)) (bvsub #b01111111111111111111111111111110 x!1030))))))

(declare-fun lt!248912 () (_ BitVec 32))

(assert (=> b!545626 (= lt!248916 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248912 (select (arr!16534 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545627 () Bool)

(assert (=> b!545627 (= e!315375 e!315370)))

(declare-fun res!339546 () Bool)

(assert (=> b!545627 (=> (not res!339546) (not e!315370))))

(assert (=> b!545627 (= res!339546 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248912 #b00000000000000000000000000000000) (bvslt lt!248912 (size!16898 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545627 (= lt!248912 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545628 () Bool)

(declare-fun res!339549 () Bool)

(assert (=> b!545628 (=> (not res!339549) (not e!315373))))

(declare-fun arrayContainsKey!0 (array!34411 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545628 (= res!339549 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545622 () Bool)

(assert (=> b!545622 (= e!315372 e!315371)))

(declare-fun res!339556 () Bool)

(assert (=> b!545622 (=> (not res!339556) (not e!315371))))

(assert (=> b!545622 (= res!339556 (= lt!248917 lt!248915))))

(assert (=> b!545622 (= lt!248915 (Intermediate!4992 false resIndex!32 resX!32))))

(assert (=> b!545622 (= lt!248917 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16534 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!339551 () Bool)

(assert (=> start!49598 (=> (not res!339551) (not e!315373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49598 (= res!339551 (validMask!0 mask!3216))))

(assert (=> start!49598 e!315373))

(assert (=> start!49598 true))

(declare-fun array_inv!12330 (array!34411) Bool)

(assert (=> start!49598 (array_inv!12330 a!3154)))

(declare-fun b!545629 () Bool)

(assert (=> b!545629 (= e!315373 e!315372)))

(declare-fun res!339552 () Bool)

(assert (=> b!545629 (=> (not res!339552) (not e!315372))))

(declare-fun lt!248913 () SeekEntryResult!4992)

(assert (=> b!545629 (= res!339552 (or (= lt!248913 (MissingZero!4992 i!1153)) (= lt!248913 (MissingVacant!4992 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34411 (_ BitVec 32)) SeekEntryResult!4992)

(assert (=> b!545629 (= lt!248913 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!545630 () Bool)

(declare-fun res!339553 () Bool)

(assert (=> b!545630 (=> (not res!339553) (not e!315372))))

(declare-datatypes ((List!10653 0))(
  ( (Nil!10650) (Cons!10649 (h!11613 (_ BitVec 64)) (t!16881 List!10653)) )
))
(declare-fun arrayNoDuplicates!0 (array!34411 (_ BitVec 32) List!10653) Bool)

(assert (=> b!545630 (= res!339553 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10650))))

(assert (= (and start!49598 res!339551) b!545623))

(assert (= (and b!545623 res!339557) b!545621))

(assert (= (and b!545621 res!339550) b!545624))

(assert (= (and b!545624 res!339554) b!545628))

(assert (= (and b!545628 res!339549) b!545629))

(assert (= (and b!545629 res!339552) b!545619))

(assert (= (and b!545619 res!339555) b!545630))

(assert (= (and b!545630 res!339553) b!545625))

(assert (= (and b!545625 res!339548) b!545622))

(assert (= (and b!545622 res!339556) b!545620))

(assert (= (and b!545620 res!339547) b!545627))

(assert (= (and b!545627 res!339546) b!545626))

(declare-fun m!523169 () Bool)

(assert (=> b!545619 m!523169))

(declare-fun m!523171 () Bool)

(assert (=> b!545629 m!523171))

(declare-fun m!523173 () Bool)

(assert (=> start!49598 m!523173))

(declare-fun m!523175 () Bool)

(assert (=> start!49598 m!523175))

(declare-fun m!523177 () Bool)

(assert (=> b!545628 m!523177))

(declare-fun m!523179 () Bool)

(assert (=> b!545626 m!523179))

(assert (=> b!545626 m!523179))

(declare-fun m!523181 () Bool)

(assert (=> b!545626 m!523181))

(declare-fun m!523183 () Bool)

(assert (=> b!545624 m!523183))

(declare-fun m!523185 () Bool)

(assert (=> b!545620 m!523185))

(assert (=> b!545620 m!523179))

(assert (=> b!545620 m!523179))

(declare-fun m!523187 () Bool)

(assert (=> b!545620 m!523187))

(assert (=> b!545620 m!523187))

(assert (=> b!545620 m!523179))

(declare-fun m!523189 () Bool)

(assert (=> b!545620 m!523189))

(assert (=> b!545622 m!523179))

(assert (=> b!545622 m!523179))

(declare-fun m!523191 () Bool)

(assert (=> b!545622 m!523191))

(declare-fun m!523193 () Bool)

(assert (=> b!545625 m!523193))

(assert (=> b!545625 m!523179))

(assert (=> b!545621 m!523179))

(assert (=> b!545621 m!523179))

(declare-fun m!523195 () Bool)

(assert (=> b!545621 m!523195))

(declare-fun m!523197 () Bool)

(assert (=> b!545627 m!523197))

(declare-fun m!523199 () Bool)

(assert (=> b!545630 m!523199))

(check-sat (not b!545619) (not b!545626) (not b!545630) (not b!545621) (not b!545628) (not b!545629) (not b!545622) (not b!545624) (not start!49598) (not b!545620) (not b!545627))
(check-sat)
