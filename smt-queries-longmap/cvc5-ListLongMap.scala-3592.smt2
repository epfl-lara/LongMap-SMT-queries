; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49338 () Bool)

(assert start!49338)

(declare-fun b!543582 () Bool)

(declare-fun res!338139 () Bool)

(declare-fun e!314346 () Bool)

(assert (=> b!543582 (=> (not res!338139) (not e!314346))))

(declare-datatypes ((array!34346 0))(
  ( (array!34347 (arr!16506 (Array (_ BitVec 32) (_ BitVec 64))) (size!16870 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34346)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34346 (_ BitVec 32)) Bool)

(assert (=> b!543582 (= res!338139 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543583 () Bool)

(declare-fun res!338137 () Bool)

(assert (=> b!543583 (=> (not res!338137) (not e!314346))))

(declare-datatypes ((List!10625 0))(
  ( (Nil!10622) (Cons!10621 (h!11576 (_ BitVec 64)) (t!16853 List!10625)) )
))
(declare-fun arrayNoDuplicates!0 (array!34346 (_ BitVec 32) List!10625) Bool)

(assert (=> b!543583 (= res!338137 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10622))))

(declare-fun b!543584 () Bool)

(declare-fun e!314348 () Bool)

(assert (=> b!543584 (= e!314348 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248209 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543584 (= lt!248209 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543585 () Bool)

(declare-fun res!338143 () Bool)

(declare-fun e!314347 () Bool)

(assert (=> b!543585 (=> (not res!338143) (not e!314347))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543585 (= res!338143 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543586 () Bool)

(declare-fun res!338140 () Bool)

(assert (=> b!543586 (=> (not res!338140) (not e!314347))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543586 (= res!338140 (validKeyInArray!0 (select (arr!16506 a!3154) j!147)))))

(declare-fun b!543588 () Bool)

(declare-fun res!338133 () Bool)

(assert (=> b!543588 (=> (not res!338133) (not e!314348))))

(assert (=> b!543588 (= res!338133 (and (not (= (select (arr!16506 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16506 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16506 a!3154) index!1177) (select (arr!16506 a!3154) j!147)))))))

(declare-fun b!543589 () Bool)

(assert (=> b!543589 (= e!314346 e!314348)))

(declare-fun res!338142 () Bool)

(assert (=> b!543589 (=> (not res!338142) (not e!314348))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4964 0))(
  ( (MissingZero!4964 (index!22080 (_ BitVec 32))) (Found!4964 (index!22081 (_ BitVec 32))) (Intermediate!4964 (undefined!5776 Bool) (index!22082 (_ BitVec 32)) (x!50987 (_ BitVec 32))) (Undefined!4964) (MissingVacant!4964 (index!22083 (_ BitVec 32))) )
))
(declare-fun lt!248207 () SeekEntryResult!4964)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543589 (= res!338142 (= lt!248207 (Intermediate!4964 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34346 (_ BitVec 32)) SeekEntryResult!4964)

(assert (=> b!543589 (= lt!248207 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16506 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543590 () Bool)

(declare-fun res!338138 () Bool)

(assert (=> b!543590 (=> (not res!338138) (not e!314347))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543590 (= res!338138 (and (= (size!16870 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16870 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16870 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543591 () Bool)

(declare-fun res!338135 () Bool)

(assert (=> b!543591 (=> (not res!338135) (not e!314346))))

(assert (=> b!543591 (= res!338135 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16870 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16870 a!3154)) (= (select (arr!16506 a!3154) resIndex!32) (select (arr!16506 a!3154) j!147))))))

(declare-fun b!543587 () Bool)

(assert (=> b!543587 (= e!314347 e!314346)))

(declare-fun res!338141 () Bool)

(assert (=> b!543587 (=> (not res!338141) (not e!314346))))

(declare-fun lt!248208 () SeekEntryResult!4964)

(assert (=> b!543587 (= res!338141 (or (= lt!248208 (MissingZero!4964 i!1153)) (= lt!248208 (MissingVacant!4964 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34346 (_ BitVec 32)) SeekEntryResult!4964)

(assert (=> b!543587 (= lt!248208 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!338136 () Bool)

(assert (=> start!49338 (=> (not res!338136) (not e!314347))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49338 (= res!338136 (validMask!0 mask!3216))))

(assert (=> start!49338 e!314347))

(assert (=> start!49338 true))

(declare-fun array_inv!12302 (array!34346) Bool)

(assert (=> start!49338 (array_inv!12302 a!3154)))

(declare-fun b!543592 () Bool)

(declare-fun res!338134 () Bool)

(assert (=> b!543592 (=> (not res!338134) (not e!314347))))

(assert (=> b!543592 (= res!338134 (validKeyInArray!0 k!1998))))

(declare-fun b!543593 () Bool)

(declare-fun res!338144 () Bool)

(assert (=> b!543593 (=> (not res!338144) (not e!314348))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543593 (= res!338144 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16506 a!3154) j!147) mask!3216) (select (arr!16506 a!3154) j!147) a!3154 mask!3216) lt!248207))))

(assert (= (and start!49338 res!338136) b!543590))

(assert (= (and b!543590 res!338138) b!543586))

(assert (= (and b!543586 res!338140) b!543592))

(assert (= (and b!543592 res!338134) b!543585))

(assert (= (and b!543585 res!338143) b!543587))

(assert (= (and b!543587 res!338141) b!543582))

(assert (= (and b!543582 res!338139) b!543583))

(assert (= (and b!543583 res!338137) b!543591))

(assert (= (and b!543591 res!338135) b!543589))

(assert (= (and b!543589 res!338142) b!543593))

(assert (= (and b!543593 res!338144) b!543588))

(assert (= (and b!543588 res!338133) b!543584))

(declare-fun m!521649 () Bool)

(assert (=> b!543585 m!521649))

(declare-fun m!521651 () Bool)

(assert (=> b!543587 m!521651))

(declare-fun m!521653 () Bool)

(assert (=> b!543588 m!521653))

(declare-fun m!521655 () Bool)

(assert (=> b!543588 m!521655))

(declare-fun m!521657 () Bool)

(assert (=> b!543591 m!521657))

(assert (=> b!543591 m!521655))

(declare-fun m!521659 () Bool)

(assert (=> b!543584 m!521659))

(assert (=> b!543586 m!521655))

(assert (=> b!543586 m!521655))

(declare-fun m!521661 () Bool)

(assert (=> b!543586 m!521661))

(assert (=> b!543593 m!521655))

(assert (=> b!543593 m!521655))

(declare-fun m!521663 () Bool)

(assert (=> b!543593 m!521663))

(assert (=> b!543593 m!521663))

(assert (=> b!543593 m!521655))

(declare-fun m!521665 () Bool)

(assert (=> b!543593 m!521665))

(declare-fun m!521667 () Bool)

(assert (=> b!543592 m!521667))

(assert (=> b!543589 m!521655))

(assert (=> b!543589 m!521655))

(declare-fun m!521669 () Bool)

(assert (=> b!543589 m!521669))

(declare-fun m!521671 () Bool)

(assert (=> b!543583 m!521671))

(declare-fun m!521673 () Bool)

(assert (=> b!543582 m!521673))

(declare-fun m!521675 () Bool)

(assert (=> start!49338 m!521675))

(declare-fun m!521677 () Bool)

(assert (=> start!49338 m!521677))

(push 1)

