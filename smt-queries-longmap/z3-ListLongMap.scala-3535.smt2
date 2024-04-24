; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48826 () Bool)

(assert start!48826)

(declare-fun b!536890 () Bool)

(declare-fun e!311641 () Bool)

(declare-fun e!311643 () Bool)

(assert (=> b!536890 (= e!311641 e!311643)))

(declare-fun res!331991 () Bool)

(assert (=> b!536890 (=> (not res!331991) (not e!311643))))

(declare-datatypes ((SeekEntryResult!4744 0))(
  ( (MissingZero!4744 (index!21200 (_ BitVec 32))) (Found!4744 (index!21201 (_ BitVec 32))) (Intermediate!4744 (undefined!5556 Bool) (index!21202 (_ BitVec 32)) (x!50290 (_ BitVec 32))) (Undefined!4744) (MissingVacant!4744 (index!21203 (_ BitVec 32))) )
))
(declare-fun lt!246282 () SeekEntryResult!4744)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536890 (= res!331991 (or (= lt!246282 (MissingZero!4744 i!1153)) (= lt!246282 (MissingVacant!4744 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33986 0))(
  ( (array!33987 (arr!16330 (Array (_ BitVec 32) (_ BitVec 64))) (size!16694 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33986)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33986 (_ BitVec 32)) SeekEntryResult!4744)

(assert (=> b!536890 (= lt!246282 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536891 () Bool)

(declare-fun res!331992 () Bool)

(assert (=> b!536891 (=> (not res!331992) (not e!311643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33986 (_ BitVec 32)) Bool)

(assert (=> b!536891 (= res!331992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536892 () Bool)

(declare-fun res!331994 () Bool)

(declare-fun e!311642 () Bool)

(assert (=> b!536892 (=> (not res!331994) (not e!311642))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!536892 (= res!331994 (and (not (= (select (arr!16330 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16330 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16330 a!3154) index!1177) (select (arr!16330 a!3154) j!147)))))))

(declare-fun b!536893 () Bool)

(declare-fun res!332001 () Bool)

(assert (=> b!536893 (=> (not res!332001) (not e!311641))))

(assert (=> b!536893 (= res!332001 (and (= (size!16694 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16694 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16694 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536894 () Bool)

(declare-fun res!331998 () Bool)

(assert (=> b!536894 (=> (not res!331998) (not e!311641))))

(declare-fun arrayContainsKey!0 (array!33986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536894 (= res!331998 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536896 () Bool)

(declare-fun res!331993 () Bool)

(assert (=> b!536896 (=> (not res!331993) (not e!311641))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536896 (= res!331993 (validKeyInArray!0 k0!1998))))

(declare-fun b!536897 () Bool)

(declare-fun res!332002 () Bool)

(assert (=> b!536897 (=> (not res!332002) (not e!311642))))

(declare-fun lt!246280 () SeekEntryResult!4744)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33986 (_ BitVec 32)) SeekEntryResult!4744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536897 (= res!332002 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16330 a!3154) j!147) mask!3216) (select (arr!16330 a!3154) j!147) a!3154 mask!3216) lt!246280))))

(declare-fun b!536898 () Bool)

(declare-fun e!311640 () Bool)

(assert (=> b!536898 (= e!311642 e!311640)))

(declare-fun res!331995 () Bool)

(assert (=> b!536898 (=> (not res!331995) (not e!311640))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!246283 () (_ BitVec 32))

(assert (=> b!536898 (= res!331995 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246283 #b00000000000000000000000000000000) (bvslt lt!246283 (size!16694 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536898 (= lt!246283 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!536899 () Bool)

(declare-fun res!331990 () Bool)

(assert (=> b!536899 (=> (not res!331990) (not e!311643))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536899 (= res!331990 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16694 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16694 a!3154)) (= (select (arr!16330 a!3154) resIndex!32) (select (arr!16330 a!3154) j!147))))))

(declare-fun b!536900 () Bool)

(assert (=> b!536900 (= e!311643 e!311642)))

(declare-fun res!331996 () Bool)

(assert (=> b!536900 (=> (not res!331996) (not e!311642))))

(assert (=> b!536900 (= res!331996 (= lt!246280 (Intermediate!4744 false resIndex!32 resX!32)))))

(assert (=> b!536900 (= lt!246280 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16330 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536901 () Bool)

(declare-fun res!331997 () Bool)

(assert (=> b!536901 (=> (not res!331997) (not e!311643))))

(declare-datatypes ((List!10356 0))(
  ( (Nil!10353) (Cons!10352 (h!11298 (_ BitVec 64)) (t!16576 List!10356)) )
))
(declare-fun arrayNoDuplicates!0 (array!33986 (_ BitVec 32) List!10356) Bool)

(assert (=> b!536901 (= res!331997 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10353))))

(declare-fun b!536902 () Bool)

(assert (=> b!536902 (= e!311640 false)))

(declare-fun lt!246281 () SeekEntryResult!4744)

(assert (=> b!536902 (= lt!246281 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246283 (select (arr!16330 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536895 () Bool)

(declare-fun res!331999 () Bool)

(assert (=> b!536895 (=> (not res!331999) (not e!311641))))

(assert (=> b!536895 (= res!331999 (validKeyInArray!0 (select (arr!16330 a!3154) j!147)))))

(declare-fun res!332000 () Bool)

(assert (=> start!48826 (=> (not res!332000) (not e!311641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48826 (= res!332000 (validMask!0 mask!3216))))

(assert (=> start!48826 e!311641))

(assert (=> start!48826 true))

(declare-fun array_inv!12189 (array!33986) Bool)

(assert (=> start!48826 (array_inv!12189 a!3154)))

(assert (= (and start!48826 res!332000) b!536893))

(assert (= (and b!536893 res!332001) b!536895))

(assert (= (and b!536895 res!331999) b!536896))

(assert (= (and b!536896 res!331993) b!536894))

(assert (= (and b!536894 res!331998) b!536890))

(assert (= (and b!536890 res!331991) b!536891))

(assert (= (and b!536891 res!331992) b!536901))

(assert (= (and b!536901 res!331997) b!536899))

(assert (= (and b!536899 res!331990) b!536900))

(assert (= (and b!536900 res!331996) b!536897))

(assert (= (and b!536897 res!332002) b!536892))

(assert (= (and b!536892 res!331994) b!536898))

(assert (= (and b!536898 res!331995) b!536902))

(declare-fun m!516379 () Bool)

(assert (=> b!536899 m!516379))

(declare-fun m!516381 () Bool)

(assert (=> b!536899 m!516381))

(declare-fun m!516383 () Bool)

(assert (=> b!536890 m!516383))

(declare-fun m!516385 () Bool)

(assert (=> b!536898 m!516385))

(declare-fun m!516387 () Bool)

(assert (=> b!536896 m!516387))

(declare-fun m!516389 () Bool)

(assert (=> b!536892 m!516389))

(assert (=> b!536892 m!516381))

(assert (=> b!536897 m!516381))

(assert (=> b!536897 m!516381))

(declare-fun m!516391 () Bool)

(assert (=> b!536897 m!516391))

(assert (=> b!536897 m!516391))

(assert (=> b!536897 m!516381))

(declare-fun m!516393 () Bool)

(assert (=> b!536897 m!516393))

(declare-fun m!516395 () Bool)

(assert (=> b!536901 m!516395))

(assert (=> b!536902 m!516381))

(assert (=> b!536902 m!516381))

(declare-fun m!516397 () Bool)

(assert (=> b!536902 m!516397))

(assert (=> b!536895 m!516381))

(assert (=> b!536895 m!516381))

(declare-fun m!516399 () Bool)

(assert (=> b!536895 m!516399))

(declare-fun m!516401 () Bool)

(assert (=> start!48826 m!516401))

(declare-fun m!516403 () Bool)

(assert (=> start!48826 m!516403))

(declare-fun m!516405 () Bool)

(assert (=> b!536894 m!516405))

(declare-fun m!516407 () Bool)

(assert (=> b!536891 m!516407))

(assert (=> b!536900 m!516381))

(assert (=> b!536900 m!516381))

(declare-fun m!516409 () Bool)

(assert (=> b!536900 m!516409))

(check-sat (not b!536894) (not b!536891) (not b!536890) (not b!536901) (not start!48826) (not b!536898) (not b!536895) (not b!536902) (not b!536897) (not b!536896) (not b!536900))
(check-sat)
