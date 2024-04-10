; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49514 () Bool)

(assert start!49514)

(declare-fun b!544890 () Bool)

(declare-fun res!339000 () Bool)

(declare-fun e!315008 () Bool)

(assert (=> b!544890 (=> (not res!339000) (not e!315008))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34384 0))(
  ( (array!34385 (arr!16522 (Array (_ BitVec 32) (_ BitVec 64))) (size!16886 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34384)

(assert (=> b!544890 (= res!339000 (and (not (= (select (arr!16522 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16522 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16522 a!3154) index!1177) (select (arr!16522 a!3154) j!147)))))))

(declare-fun b!544891 () Bool)

(declare-fun e!315009 () Bool)

(assert (=> b!544891 (= e!315009 e!315008)))

(declare-fun res!339002 () Bool)

(assert (=> b!544891 (=> (not res!339002) (not e!315008))))

(declare-datatypes ((SeekEntryResult!4980 0))(
  ( (MissingZero!4980 (index!22144 (_ BitVec 32))) (Found!4980 (index!22145 (_ BitVec 32))) (Intermediate!4980 (undefined!5792 Bool) (index!22146 (_ BitVec 32)) (x!51067 (_ BitVec 32))) (Undefined!4980) (MissingVacant!4980 (index!22147 (_ BitVec 32))) )
))
(declare-fun lt!248642 () SeekEntryResult!4980)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!544891 (= res!339002 (= lt!248642 (Intermediate!4980 false resIndex!32 resX!32)))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34384 (_ BitVec 32)) SeekEntryResult!4980)

(assert (=> b!544891 (= lt!248642 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16522 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!544892 () Bool)

(assert (=> b!544892 (= e!315008 false)))

(declare-fun lt!248644 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544892 (= lt!248644 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!338994 () Bool)

(declare-fun e!315007 () Bool)

(assert (=> start!49514 (=> (not res!338994) (not e!315007))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49514 (= res!338994 (validMask!0 mask!3216))))

(assert (=> start!49514 e!315007))

(assert (=> start!49514 true))

(declare-fun array_inv!12318 (array!34384) Bool)

(assert (=> start!49514 (array_inv!12318 a!3154)))

(declare-fun b!544893 () Bool)

(declare-fun res!339003 () Bool)

(assert (=> b!544893 (=> (not res!339003) (not e!315007))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34384 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!544893 (= res!339003 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!544894 () Bool)

(declare-fun res!338998 () Bool)

(assert (=> b!544894 (=> (not res!338998) (not e!315009))))

(declare-datatypes ((List!10641 0))(
  ( (Nil!10638) (Cons!10637 (h!11598 (_ BitVec 64)) (t!16869 List!10641)) )
))
(declare-fun arrayNoDuplicates!0 (array!34384 (_ BitVec 32) List!10641) Bool)

(assert (=> b!544894 (= res!338998 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10638))))

(declare-fun b!544895 () Bool)

(declare-fun res!339005 () Bool)

(assert (=> b!544895 (=> (not res!339005) (not e!315008))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!544895 (= res!339005 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16522 a!3154) j!147) mask!3216) (select (arr!16522 a!3154) j!147) a!3154 mask!3216) lt!248642))))

(declare-fun b!544896 () Bool)

(assert (=> b!544896 (= e!315007 e!315009)))

(declare-fun res!338995 () Bool)

(assert (=> b!544896 (=> (not res!338995) (not e!315009))))

(declare-fun lt!248643 () SeekEntryResult!4980)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!544896 (= res!338995 (or (= lt!248643 (MissingZero!4980 i!1153)) (= lt!248643 (MissingVacant!4980 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34384 (_ BitVec 32)) SeekEntryResult!4980)

(assert (=> b!544896 (= lt!248643 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!544897 () Bool)

(declare-fun res!338997 () Bool)

(assert (=> b!544897 (=> (not res!338997) (not e!315007))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!544897 (= res!338997 (validKeyInArray!0 (select (arr!16522 a!3154) j!147)))))

(declare-fun b!544898 () Bool)

(declare-fun res!338996 () Bool)

(assert (=> b!544898 (=> (not res!338996) (not e!315007))))

(assert (=> b!544898 (= res!338996 (validKeyInArray!0 k0!1998))))

(declare-fun b!544899 () Bool)

(declare-fun res!339001 () Bool)

(assert (=> b!544899 (=> (not res!339001) (not e!315009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34384 (_ BitVec 32)) Bool)

(assert (=> b!544899 (= res!339001 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!544900 () Bool)

(declare-fun res!338999 () Bool)

(assert (=> b!544900 (=> (not res!338999) (not e!315009))))

(assert (=> b!544900 (= res!338999 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16886 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16886 a!3154)) (= (select (arr!16522 a!3154) resIndex!32) (select (arr!16522 a!3154) j!147))))))

(declare-fun b!544901 () Bool)

(declare-fun res!339004 () Bool)

(assert (=> b!544901 (=> (not res!339004) (not e!315007))))

(assert (=> b!544901 (= res!339004 (and (= (size!16886 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16886 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16886 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!49514 res!338994) b!544901))

(assert (= (and b!544901 res!339004) b!544897))

(assert (= (and b!544897 res!338997) b!544898))

(assert (= (and b!544898 res!338996) b!544893))

(assert (= (and b!544893 res!339003) b!544896))

(assert (= (and b!544896 res!338995) b!544899))

(assert (= (and b!544899 res!339001) b!544894))

(assert (= (and b!544894 res!338998) b!544900))

(assert (= (and b!544900 res!338999) b!544891))

(assert (= (and b!544891 res!339002) b!544895))

(assert (= (and b!544895 res!339005) b!544890))

(assert (= (and b!544890 res!339000) b!544892))

(declare-fun m!522633 () Bool)

(assert (=> start!49514 m!522633))

(declare-fun m!522635 () Bool)

(assert (=> start!49514 m!522635))

(declare-fun m!522637 () Bool)

(assert (=> b!544896 m!522637))

(declare-fun m!522639 () Bool)

(assert (=> b!544900 m!522639))

(declare-fun m!522641 () Bool)

(assert (=> b!544900 m!522641))

(assert (=> b!544891 m!522641))

(assert (=> b!544891 m!522641))

(declare-fun m!522643 () Bool)

(assert (=> b!544891 m!522643))

(declare-fun m!522645 () Bool)

(assert (=> b!544892 m!522645))

(assert (=> b!544897 m!522641))

(assert (=> b!544897 m!522641))

(declare-fun m!522647 () Bool)

(assert (=> b!544897 m!522647))

(declare-fun m!522649 () Bool)

(assert (=> b!544898 m!522649))

(declare-fun m!522651 () Bool)

(assert (=> b!544893 m!522651))

(declare-fun m!522653 () Bool)

(assert (=> b!544894 m!522653))

(assert (=> b!544895 m!522641))

(assert (=> b!544895 m!522641))

(declare-fun m!522655 () Bool)

(assert (=> b!544895 m!522655))

(assert (=> b!544895 m!522655))

(assert (=> b!544895 m!522641))

(declare-fun m!522657 () Bool)

(assert (=> b!544895 m!522657))

(declare-fun m!522659 () Bool)

(assert (=> b!544899 m!522659))

(declare-fun m!522661 () Bool)

(assert (=> b!544890 m!522661))

(assert (=> b!544890 m!522641))

(check-sat (not b!544894) (not start!49514) (not b!544897) (not b!544898) (not b!544892) (not b!544891) (not b!544893) (not b!544896) (not b!544899) (not b!544895))
(check-sat)
