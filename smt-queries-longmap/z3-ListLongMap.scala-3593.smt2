; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49332 () Bool)

(assert start!49332)

(declare-fun b!543419 () Bool)

(declare-fun res!338114 () Bool)

(declare-fun e!314211 () Bool)

(assert (=> b!543419 (=> (not res!338114) (not e!314211))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34350 0))(
  ( (array!34351 (arr!16508 (Array (_ BitVec 32) (_ BitVec 64))) (size!16873 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34350)

(assert (=> b!543419 (= res!338114 (and (not (= (select (arr!16508 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16508 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16508 a!3154) index!1177) (select (arr!16508 a!3154) j!147)))))))

(declare-fun b!543420 () Bool)

(declare-fun res!338117 () Bool)

(declare-fun e!314209 () Bool)

(assert (=> b!543420 (=> (not res!338117) (not e!314209))))

(declare-datatypes ((List!10666 0))(
  ( (Nil!10663) (Cons!10662 (h!11617 (_ BitVec 64)) (t!16885 List!10666)) )
))
(declare-fun arrayNoDuplicates!0 (array!34350 (_ BitVec 32) List!10666) Bool)

(assert (=> b!543420 (= res!338117 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10663))))

(declare-fun b!543421 () Bool)

(declare-fun res!338112 () Bool)

(assert (=> b!543421 (=> (not res!338112) (not e!314209))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!543421 (= res!338112 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16873 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16873 a!3154)) (= (select (arr!16508 a!3154) resIndex!32) (select (arr!16508 a!3154) j!147))))))

(declare-fun res!338116 () Bool)

(declare-fun e!314210 () Bool)

(assert (=> start!49332 (=> (not res!338116) (not e!314210))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49332 (= res!338116 (validMask!0 mask!3216))))

(assert (=> start!49332 e!314210))

(assert (=> start!49332 true))

(declare-fun array_inv!12391 (array!34350) Bool)

(assert (=> start!49332 (array_inv!12391 a!3154)))

(declare-fun b!543422 () Bool)

(assert (=> b!543422 (= e!314209 e!314211)))

(declare-fun res!338121 () Bool)

(assert (=> b!543422 (=> (not res!338121) (not e!314211))))

(declare-datatypes ((SeekEntryResult!4963 0))(
  ( (MissingZero!4963 (index!22076 (_ BitVec 32))) (Found!4963 (index!22077 (_ BitVec 32))) (Intermediate!4963 (undefined!5775 Bool) (index!22078 (_ BitVec 32)) (x!50989 (_ BitVec 32))) (Undefined!4963) (MissingVacant!4963 (index!22079 (_ BitVec 32))) )
))
(declare-fun lt!248001 () SeekEntryResult!4963)

(assert (=> b!543422 (= res!338121 (= lt!248001 (Intermediate!4963 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34350 (_ BitVec 32)) SeekEntryResult!4963)

(assert (=> b!543422 (= lt!248001 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16508 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543423 () Bool)

(declare-fun res!338120 () Bool)

(assert (=> b!543423 (=> (not res!338120) (not e!314210))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543423 (= res!338120 (validKeyInArray!0 k0!1998))))

(declare-fun b!543424 () Bool)

(declare-fun res!338113 () Bool)

(assert (=> b!543424 (=> (not res!338113) (not e!314210))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543424 (= res!338113 (and (= (size!16873 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16873 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16873 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543425 () Bool)

(declare-fun res!338123 () Bool)

(assert (=> b!543425 (=> (not res!338123) (not e!314209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34350 (_ BitVec 32)) Bool)

(assert (=> b!543425 (= res!338123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543426 () Bool)

(assert (=> b!543426 (= e!314211 false)))

(declare-fun lt!248002 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543426 (= lt!248002 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543427 () Bool)

(assert (=> b!543427 (= e!314210 e!314209)))

(declare-fun res!338119 () Bool)

(assert (=> b!543427 (=> (not res!338119) (not e!314209))))

(declare-fun lt!248000 () SeekEntryResult!4963)

(assert (=> b!543427 (= res!338119 (or (= lt!248000 (MissingZero!4963 i!1153)) (= lt!248000 (MissingVacant!4963 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34350 (_ BitVec 32)) SeekEntryResult!4963)

(assert (=> b!543427 (= lt!248000 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543428 () Bool)

(declare-fun res!338115 () Bool)

(assert (=> b!543428 (=> (not res!338115) (not e!314211))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543428 (= res!338115 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16508 a!3154) j!147) mask!3216) (select (arr!16508 a!3154) j!147) a!3154 mask!3216) lt!248001))))

(declare-fun b!543429 () Bool)

(declare-fun res!338122 () Bool)

(assert (=> b!543429 (=> (not res!338122) (not e!314210))))

(declare-fun arrayContainsKey!0 (array!34350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543429 (= res!338122 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543430 () Bool)

(declare-fun res!338118 () Bool)

(assert (=> b!543430 (=> (not res!338118) (not e!314210))))

(assert (=> b!543430 (= res!338118 (validKeyInArray!0 (select (arr!16508 a!3154) j!147)))))

(assert (= (and start!49332 res!338116) b!543424))

(assert (= (and b!543424 res!338113) b!543430))

(assert (= (and b!543430 res!338118) b!543423))

(assert (= (and b!543423 res!338120) b!543429))

(assert (= (and b!543429 res!338122) b!543427))

(assert (= (and b!543427 res!338119) b!543425))

(assert (= (and b!543425 res!338123) b!543420))

(assert (= (and b!543420 res!338117) b!543421))

(assert (= (and b!543421 res!338112) b!543422))

(assert (= (and b!543422 res!338121) b!543428))

(assert (= (and b!543428 res!338115) b!543419))

(assert (= (and b!543419 res!338114) b!543426))

(declare-fun m!520987 () Bool)

(assert (=> b!543419 m!520987))

(declare-fun m!520989 () Bool)

(assert (=> b!543419 m!520989))

(declare-fun m!520991 () Bool)

(assert (=> b!543425 m!520991))

(assert (=> b!543422 m!520989))

(assert (=> b!543422 m!520989))

(declare-fun m!520993 () Bool)

(assert (=> b!543422 m!520993))

(declare-fun m!520995 () Bool)

(assert (=> b!543421 m!520995))

(assert (=> b!543421 m!520989))

(declare-fun m!520997 () Bool)

(assert (=> start!49332 m!520997))

(declare-fun m!520999 () Bool)

(assert (=> start!49332 m!520999))

(declare-fun m!521001 () Bool)

(assert (=> b!543429 m!521001))

(assert (=> b!543430 m!520989))

(assert (=> b!543430 m!520989))

(declare-fun m!521003 () Bool)

(assert (=> b!543430 m!521003))

(declare-fun m!521005 () Bool)

(assert (=> b!543423 m!521005))

(declare-fun m!521007 () Bool)

(assert (=> b!543420 m!521007))

(declare-fun m!521009 () Bool)

(assert (=> b!543426 m!521009))

(assert (=> b!543428 m!520989))

(assert (=> b!543428 m!520989))

(declare-fun m!521011 () Bool)

(assert (=> b!543428 m!521011))

(assert (=> b!543428 m!521011))

(assert (=> b!543428 m!520989))

(declare-fun m!521013 () Bool)

(assert (=> b!543428 m!521013))

(declare-fun m!521015 () Bool)

(assert (=> b!543427 m!521015))

(check-sat (not b!543430) (not b!543426) (not b!543429) (not b!543427) (not start!49332) (not b!543428) (not b!543420) (not b!543422) (not b!543425) (not b!543423))
(check-sat)
