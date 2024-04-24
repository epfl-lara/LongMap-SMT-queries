; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48838 () Bool)

(assert start!48838)

(declare-fun b!537124 () Bool)

(declare-fun res!332235 () Bool)

(declare-fun e!311730 () Bool)

(assert (=> b!537124 (=> (not res!332235) (not e!311730))))

(declare-datatypes ((array!33998 0))(
  ( (array!33999 (arr!16336 (Array (_ BitVec 32) (_ BitVec 64))) (size!16700 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33998)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!537124 (= res!332235 (and (= (size!16700 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16700 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16700 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!537125 () Bool)

(declare-fun e!311733 () Bool)

(assert (=> b!537125 (= e!311733 false)))

(declare-fun lt!246354 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4750 0))(
  ( (MissingZero!4750 (index!21224 (_ BitVec 32))) (Found!4750 (index!21225 (_ BitVec 32))) (Intermediate!4750 (undefined!5562 Bool) (index!21226 (_ BitVec 32)) (x!50312 (_ BitVec 32))) (Undefined!4750) (MissingVacant!4750 (index!21227 (_ BitVec 32))) )
))
(declare-fun lt!246353 () SeekEntryResult!4750)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33998 (_ BitVec 32)) SeekEntryResult!4750)

(assert (=> b!537125 (= lt!246353 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246354 (select (arr!16336 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537126 () Bool)

(declare-fun res!332226 () Bool)

(assert (=> b!537126 (=> (not res!332226) (not e!311730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!537126 (= res!332226 (validKeyInArray!0 (select (arr!16336 a!3154) j!147)))))

(declare-fun b!537127 () Bool)

(declare-fun e!311729 () Bool)

(assert (=> b!537127 (= e!311730 e!311729)))

(declare-fun res!332230 () Bool)

(assert (=> b!537127 (=> (not res!332230) (not e!311729))))

(declare-fun lt!246355 () SeekEntryResult!4750)

(assert (=> b!537127 (= res!332230 (or (= lt!246355 (MissingZero!4750 i!1153)) (= lt!246355 (MissingVacant!4750 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33998 (_ BitVec 32)) SeekEntryResult!4750)

(assert (=> b!537127 (= lt!246355 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!537128 () Bool)

(declare-fun e!311731 () Bool)

(assert (=> b!537128 (= e!311729 e!311731)))

(declare-fun res!332224 () Bool)

(assert (=> b!537128 (=> (not res!332224) (not e!311731))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!246352 () SeekEntryResult!4750)

(assert (=> b!537128 (= res!332224 (= lt!246352 (Intermediate!4750 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!537128 (= lt!246352 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16336 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!537130 () Bool)

(declare-fun res!332227 () Bool)

(assert (=> b!537130 (=> (not res!332227) (not e!311729))))

(declare-datatypes ((List!10362 0))(
  ( (Nil!10359) (Cons!10358 (h!11304 (_ BitVec 64)) (t!16582 List!10362)) )
))
(declare-fun arrayNoDuplicates!0 (array!33998 (_ BitVec 32) List!10362) Bool)

(assert (=> b!537130 (= res!332227 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10359))))

(declare-fun b!537131 () Bool)

(assert (=> b!537131 (= e!311731 e!311733)))

(declare-fun res!332229 () Bool)

(assert (=> b!537131 (=> (not res!332229) (not e!311733))))

(assert (=> b!537131 (= res!332229 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246354 #b00000000000000000000000000000000) (bvslt lt!246354 (size!16700 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537131 (= lt!246354 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!537132 () Bool)

(declare-fun res!332236 () Bool)

(assert (=> b!537132 (=> (not res!332236) (not e!311731))))

(assert (=> b!537132 (= res!332236 (and (not (= (select (arr!16336 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16336 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16336 a!3154) index!1177) (select (arr!16336 a!3154) j!147)))))))

(declare-fun b!537133 () Bool)

(declare-fun res!332233 () Bool)

(assert (=> b!537133 (=> (not res!332233) (not e!311729))))

(assert (=> b!537133 (= res!332233 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16700 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16700 a!3154)) (= (select (arr!16336 a!3154) resIndex!32) (select (arr!16336 a!3154) j!147))))))

(declare-fun b!537134 () Bool)

(declare-fun res!332228 () Bool)

(assert (=> b!537134 (=> (not res!332228) (not e!311730))))

(assert (=> b!537134 (= res!332228 (validKeyInArray!0 k0!1998))))

(declare-fun b!537135 () Bool)

(declare-fun res!332234 () Bool)

(assert (=> b!537135 (=> (not res!332234) (not e!311730))))

(declare-fun arrayContainsKey!0 (array!33998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!537135 (= res!332234 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!537136 () Bool)

(declare-fun res!332232 () Bool)

(assert (=> b!537136 (=> (not res!332232) (not e!311729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33998 (_ BitVec 32)) Bool)

(assert (=> b!537136 (= res!332232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!537129 () Bool)

(declare-fun res!332231 () Bool)

(assert (=> b!537129 (=> (not res!332231) (not e!311731))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!537129 (= res!332231 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16336 a!3154) j!147) mask!3216) (select (arr!16336 a!3154) j!147) a!3154 mask!3216) lt!246352))))

(declare-fun res!332225 () Bool)

(assert (=> start!48838 (=> (not res!332225) (not e!311730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48838 (= res!332225 (validMask!0 mask!3216))))

(assert (=> start!48838 e!311730))

(assert (=> start!48838 true))

(declare-fun array_inv!12195 (array!33998) Bool)

(assert (=> start!48838 (array_inv!12195 a!3154)))

(assert (= (and start!48838 res!332225) b!537124))

(assert (= (and b!537124 res!332235) b!537126))

(assert (= (and b!537126 res!332226) b!537134))

(assert (= (and b!537134 res!332228) b!537135))

(assert (= (and b!537135 res!332234) b!537127))

(assert (= (and b!537127 res!332230) b!537136))

(assert (= (and b!537136 res!332232) b!537130))

(assert (= (and b!537130 res!332227) b!537133))

(assert (= (and b!537133 res!332233) b!537128))

(assert (= (and b!537128 res!332224) b!537129))

(assert (= (and b!537129 res!332231) b!537132))

(assert (= (and b!537132 res!332236) b!537131))

(assert (= (and b!537131 res!332229) b!537125))

(declare-fun m!516571 () Bool)

(assert (=> b!537131 m!516571))

(declare-fun m!516573 () Bool)

(assert (=> start!48838 m!516573))

(declare-fun m!516575 () Bool)

(assert (=> start!48838 m!516575))

(declare-fun m!516577 () Bool)

(assert (=> b!537136 m!516577))

(declare-fun m!516579 () Bool)

(assert (=> b!537132 m!516579))

(declare-fun m!516581 () Bool)

(assert (=> b!537132 m!516581))

(assert (=> b!537126 m!516581))

(assert (=> b!537126 m!516581))

(declare-fun m!516583 () Bool)

(assert (=> b!537126 m!516583))

(declare-fun m!516585 () Bool)

(assert (=> b!537130 m!516585))

(declare-fun m!516587 () Bool)

(assert (=> b!537127 m!516587))

(declare-fun m!516589 () Bool)

(assert (=> b!537135 m!516589))

(declare-fun m!516591 () Bool)

(assert (=> b!537134 m!516591))

(assert (=> b!537129 m!516581))

(assert (=> b!537129 m!516581))

(declare-fun m!516593 () Bool)

(assert (=> b!537129 m!516593))

(assert (=> b!537129 m!516593))

(assert (=> b!537129 m!516581))

(declare-fun m!516595 () Bool)

(assert (=> b!537129 m!516595))

(assert (=> b!537128 m!516581))

(assert (=> b!537128 m!516581))

(declare-fun m!516597 () Bool)

(assert (=> b!537128 m!516597))

(declare-fun m!516599 () Bool)

(assert (=> b!537133 m!516599))

(assert (=> b!537133 m!516581))

(assert (=> b!537125 m!516581))

(assert (=> b!537125 m!516581))

(declare-fun m!516601 () Bool)

(assert (=> b!537125 m!516601))

(check-sat (not b!537134) (not b!537129) (not b!537127) (not b!537136) (not b!537125) (not b!537131) (not b!537128) (not start!48838) (not b!537130) (not b!537135) (not b!537126))
(check-sat)
