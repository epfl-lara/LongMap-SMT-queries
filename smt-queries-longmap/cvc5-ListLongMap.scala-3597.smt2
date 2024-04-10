; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49512 () Bool)

(assert start!49512)

(declare-fun res!338964 () Bool)

(declare-fun e!314996 () Bool)

(assert (=> start!49512 (=> (not res!338964) (not e!314996))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49512 (= res!338964 (validMask!0 mask!3216))))

(assert (=> start!49512 e!314996))

(assert (=> start!49512 true))

(declare-datatypes ((array!34382 0))(
  ( (array!34383 (arr!16521 (Array (_ BitVec 32) (_ BitVec 64))) (size!16885 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34382)

(declare-fun array_inv!12317 (array!34382) Bool)

(assert (=> start!49512 (array_inv!12317 a!3154)))

(declare-fun b!544854 () Bool)

(declare-fun res!338967 () Bool)

(assert (=> b!544854 (=> (not res!338967) (not e!314996))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34382 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544854 (= res!338967 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544855 () Bool)

(declare-fun res!338960 () Bool)

(declare-fun e!314995 () Bool)

(assert (=> b!544855 (=> (not res!338960) (not e!314995))))

(declare-datatypes ((List!10640 0))(
  ( (Nil!10637) (Cons!10636 (h!11597 (_ BitVec 64)) (t!16868 List!10640)) )
))
(declare-fun arrayNoDuplicates!0 (array!34382 (_ BitVec 32) List!10640) Bool)

(assert (=> b!544855 (= res!338960 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10637))))

(declare-fun b!544856 () Bool)

(declare-fun res!338962 () Bool)

(assert (=> b!544856 (=> (not res!338962) (not e!314995))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34382 (_ BitVec 32)) Bool)

(assert (=> b!544856 (= res!338962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544857 () Bool)

(declare-fun res!338969 () Bool)

(assert (=> b!544857 (=> (not res!338969) (not e!314995))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544857 (= res!338969 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16885 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16885 a!3154)) (= (select (arr!16521 a!3154) resIndex!32) (select (arr!16521 a!3154) j!147))))))

(declare-fun b!544858 () Bool)

(declare-fun res!338958 () Bool)

(assert (=> b!544858 (=> (not res!338958) (not e!314996))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544858 (= res!338958 (and (= (size!16885 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16885 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16885 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!544859 () Bool)

(declare-fun res!338959 () Bool)

(assert (=> b!544859 (=> (not res!338959) (not e!314996))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544859 (= res!338959 (validKeyInArray!0 k!1998))))

(declare-fun b!544860 () Bool)

(declare-fun res!338961 () Bool)

(declare-fun e!314994 () Bool)

(assert (=> b!544860 (=> (not res!338961) (not e!314994))))

(declare-datatypes ((SeekEntryResult!4979 0))(
  ( (MissingZero!4979 (index!22140 (_ BitVec 32))) (Found!4979 (index!22141 (_ BitVec 32))) (Intermediate!4979 (undefined!5791 Bool) (index!22142 (_ BitVec 32)) (x!51066 (_ BitVec 32))) (Undefined!4979) (MissingVacant!4979 (index!22143 (_ BitVec 32))) )
))
(declare-fun lt!248635 () SeekEntryResult!4979)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34382 (_ BitVec 32)) SeekEntryResult!4979)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544860 (= res!338961 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16521 a!3154) j!147) mask!3216) (select (arr!16521 a!3154) j!147) a!3154 mask!3216) lt!248635))))

(declare-fun b!544861 () Bool)

(declare-fun res!338965 () Bool)

(assert (=> b!544861 (=> (not res!338965) (not e!314994))))

(assert (=> b!544861 (= res!338965 (and (not (= (select (arr!16521 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16521 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16521 a!3154) index!1177) (select (arr!16521 a!3154) j!147)))))))

(declare-fun b!544862 () Bool)

(assert (=> b!544862 (= e!314994 false)))

(declare-fun lt!248633 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544862 (= lt!248633 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!544863 () Bool)

(declare-fun res!338963 () Bool)

(assert (=> b!544863 (=> (not res!338963) (not e!314996))))

(assert (=> b!544863 (= res!338963 (validKeyInArray!0 (select (arr!16521 a!3154) j!147)))))

(declare-fun b!544864 () Bool)

(assert (=> b!544864 (= e!314996 e!314995)))

(declare-fun res!338966 () Bool)

(assert (=> b!544864 (=> (not res!338966) (not e!314995))))

(declare-fun lt!248634 () SeekEntryResult!4979)

(assert (=> b!544864 (= res!338966 (or (= lt!248634 (MissingZero!4979 i!1153)) (= lt!248634 (MissingVacant!4979 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34382 (_ BitVec 32)) SeekEntryResult!4979)

(assert (=> b!544864 (= lt!248634 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!544865 () Bool)

(assert (=> b!544865 (= e!314995 e!314994)))

(declare-fun res!338968 () Bool)

(assert (=> b!544865 (=> (not res!338968) (not e!314994))))

(assert (=> b!544865 (= res!338968 (= lt!248635 (Intermediate!4979 false resIndex!32 resX!32)))))

(assert (=> b!544865 (= lt!248635 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16521 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49512 res!338964) b!544858))

(assert (= (and b!544858 res!338958) b!544863))

(assert (= (and b!544863 res!338963) b!544859))

(assert (= (and b!544859 res!338959) b!544854))

(assert (= (and b!544854 res!338967) b!544864))

(assert (= (and b!544864 res!338966) b!544856))

(assert (= (and b!544856 res!338962) b!544855))

(assert (= (and b!544855 res!338960) b!544857))

(assert (= (and b!544857 res!338969) b!544865))

(assert (= (and b!544865 res!338968) b!544860))

(assert (= (and b!544860 res!338961) b!544861))

(assert (= (and b!544861 res!338965) b!544862))

(declare-fun m!522603 () Bool)

(assert (=> b!544854 m!522603))

(declare-fun m!522605 () Bool)

(assert (=> start!49512 m!522605))

(declare-fun m!522607 () Bool)

(assert (=> start!49512 m!522607))

(declare-fun m!522609 () Bool)

(assert (=> b!544863 m!522609))

(assert (=> b!544863 m!522609))

(declare-fun m!522611 () Bool)

(assert (=> b!544863 m!522611))

(declare-fun m!522613 () Bool)

(assert (=> b!544861 m!522613))

(assert (=> b!544861 m!522609))

(declare-fun m!522615 () Bool)

(assert (=> b!544856 m!522615))

(declare-fun m!522617 () Bool)

(assert (=> b!544855 m!522617))

(declare-fun m!522619 () Bool)

(assert (=> b!544859 m!522619))

(declare-fun m!522621 () Bool)

(assert (=> b!544857 m!522621))

(assert (=> b!544857 m!522609))

(declare-fun m!522623 () Bool)

(assert (=> b!544864 m!522623))

(declare-fun m!522625 () Bool)

(assert (=> b!544862 m!522625))

(assert (=> b!544865 m!522609))

(assert (=> b!544865 m!522609))

(declare-fun m!522627 () Bool)

(assert (=> b!544865 m!522627))

(assert (=> b!544860 m!522609))

(assert (=> b!544860 m!522609))

(declare-fun m!522629 () Bool)

(assert (=> b!544860 m!522629))

(assert (=> b!544860 m!522629))

(assert (=> b!544860 m!522609))

(declare-fun m!522631 () Bool)

(assert (=> b!544860 m!522631))

(push 1)

