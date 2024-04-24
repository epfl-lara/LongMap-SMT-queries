; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49324 () Bool)

(assert start!49324)

(declare-fun b!542702 () Bool)

(declare-fun res!337155 () Bool)

(declare-fun e!314116 () Bool)

(assert (=> b!542702 (=> (not res!337155) (not e!314116))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34280 0))(
  ( (array!34281 (arr!16471 (Array (_ BitVec 32) (_ BitVec 64))) (size!16835 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34280)

(assert (=> b!542702 (= res!337155 (and (not (= (select (arr!16471 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16471 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16471 a!3154) index!1177) (select (arr!16471 a!3154) j!147)))))))

(declare-fun b!542703 () Bool)

(declare-fun res!337157 () Bool)

(declare-fun e!314115 () Bool)

(assert (=> b!542703 (=> (not res!337157) (not e!314115))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542703 (= res!337157 (validKeyInArray!0 k0!1998))))

(declare-fun b!542704 () Bool)

(declare-fun res!337150 () Bool)

(declare-fun e!314117 () Bool)

(assert (=> b!542704 (=> (not res!337150) (not e!314117))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34280 (_ BitVec 32)) Bool)

(assert (=> b!542704 (= res!337150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542705 () Bool)

(declare-fun res!337159 () Bool)

(assert (=> b!542705 (=> (not res!337159) (not e!314117))))

(declare-datatypes ((List!10497 0))(
  ( (Nil!10494) (Cons!10493 (h!11451 (_ BitVec 64)) (t!16717 List!10497)) )
))
(declare-fun arrayNoDuplicates!0 (array!34280 (_ BitVec 32) List!10497) Bool)

(assert (=> b!542705 (= res!337159 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10494))))

(declare-fun b!542706 () Bool)

(declare-fun res!337149 () Bool)

(assert (=> b!542706 (=> (not res!337149) (not e!314115))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542706 (= res!337149 (and (= (size!16835 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16835 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16835 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542707 () Bool)

(assert (=> b!542707 (= e!314115 e!314117)))

(declare-fun res!337148 () Bool)

(assert (=> b!542707 (=> (not res!337148) (not e!314117))))

(declare-datatypes ((SeekEntryResult!4885 0))(
  ( (MissingZero!4885 (index!21764 (_ BitVec 32))) (Found!4885 (index!21765 (_ BitVec 32))) (Intermediate!4885 (undefined!5697 Bool) (index!21766 (_ BitVec 32)) (x!50831 (_ BitVec 32))) (Undefined!4885) (MissingVacant!4885 (index!21767 (_ BitVec 32))) )
))
(declare-fun lt!248047 () SeekEntryResult!4885)

(assert (=> b!542707 (= res!337148 (or (= lt!248047 (MissingZero!4885 i!1153)) (= lt!248047 (MissingVacant!4885 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34280 (_ BitVec 32)) SeekEntryResult!4885)

(assert (=> b!542707 (= lt!248047 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542708 () Bool)

(declare-fun res!337158 () Bool)

(assert (=> b!542708 (=> (not res!337158) (not e!314117))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542708 (= res!337158 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16835 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16835 a!3154)) (= (select (arr!16471 a!3154) resIndex!32) (select (arr!16471 a!3154) j!147))))))

(declare-fun b!542709 () Bool)

(declare-fun res!337153 () Bool)

(assert (=> b!542709 (=> (not res!337153) (not e!314116))))

(declare-fun lt!248045 () SeekEntryResult!4885)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34280 (_ BitVec 32)) SeekEntryResult!4885)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542709 (= res!337153 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16471 a!3154) j!147) mask!3216) (select (arr!16471 a!3154) j!147) a!3154 mask!3216) lt!248045))))

(declare-fun b!542710 () Bool)

(declare-fun res!337151 () Bool)

(assert (=> b!542710 (=> (not res!337151) (not e!314115))))

(declare-fun arrayContainsKey!0 (array!34280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542710 (= res!337151 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542711 () Bool)

(declare-fun res!337154 () Bool)

(assert (=> b!542711 (=> (not res!337154) (not e!314115))))

(assert (=> b!542711 (= res!337154 (validKeyInArray!0 (select (arr!16471 a!3154) j!147)))))

(declare-fun res!337152 () Bool)

(assert (=> start!49324 (=> (not res!337152) (not e!314115))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49324 (= res!337152 (validMask!0 mask!3216))))

(assert (=> start!49324 e!314115))

(assert (=> start!49324 true))

(declare-fun array_inv!12330 (array!34280) Bool)

(assert (=> start!49324 (array_inv!12330 a!3154)))

(declare-fun b!542712 () Bool)

(assert (=> b!542712 (= e!314117 e!314116)))

(declare-fun res!337156 () Bool)

(assert (=> b!542712 (=> (not res!337156) (not e!314116))))

(assert (=> b!542712 (= res!337156 (= lt!248045 (Intermediate!4885 false resIndex!32 resX!32)))))

(assert (=> b!542712 (= lt!248045 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16471 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542713 () Bool)

(assert (=> b!542713 (= e!314116 false)))

(declare-fun lt!248046 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542713 (= lt!248046 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(assert (= (and start!49324 res!337152) b!542706))

(assert (= (and b!542706 res!337149) b!542711))

(assert (= (and b!542711 res!337154) b!542703))

(assert (= (and b!542703 res!337157) b!542710))

(assert (= (and b!542710 res!337151) b!542707))

(assert (= (and b!542707 res!337148) b!542704))

(assert (= (and b!542704 res!337150) b!542705))

(assert (= (and b!542705 res!337159) b!542708))

(assert (= (and b!542708 res!337158) b!542712))

(assert (= (and b!542712 res!337156) b!542709))

(assert (= (and b!542709 res!337153) b!542702))

(assert (= (and b!542702 res!337155) b!542713))

(declare-fun m!521071 () Bool)

(assert (=> b!542705 m!521071))

(declare-fun m!521073 () Bool)

(assert (=> b!542702 m!521073))

(declare-fun m!521075 () Bool)

(assert (=> b!542702 m!521075))

(assert (=> b!542709 m!521075))

(assert (=> b!542709 m!521075))

(declare-fun m!521077 () Bool)

(assert (=> b!542709 m!521077))

(assert (=> b!542709 m!521077))

(assert (=> b!542709 m!521075))

(declare-fun m!521079 () Bool)

(assert (=> b!542709 m!521079))

(declare-fun m!521081 () Bool)

(assert (=> b!542703 m!521081))

(assert (=> b!542711 m!521075))

(assert (=> b!542711 m!521075))

(declare-fun m!521083 () Bool)

(assert (=> b!542711 m!521083))

(declare-fun m!521085 () Bool)

(assert (=> b!542710 m!521085))

(declare-fun m!521087 () Bool)

(assert (=> b!542704 m!521087))

(declare-fun m!521089 () Bool)

(assert (=> b!542708 m!521089))

(assert (=> b!542708 m!521075))

(assert (=> b!542712 m!521075))

(assert (=> b!542712 m!521075))

(declare-fun m!521091 () Bool)

(assert (=> b!542712 m!521091))

(declare-fun m!521093 () Bool)

(assert (=> start!49324 m!521093))

(declare-fun m!521095 () Bool)

(assert (=> start!49324 m!521095))

(declare-fun m!521097 () Bool)

(assert (=> b!542707 m!521097))

(declare-fun m!521099 () Bool)

(assert (=> b!542713 m!521099))

(check-sat (not b!542707) (not b!542709) (not b!542704) (not b!542711) (not b!542710) (not b!542703) (not b!542712) (not start!49324) (not b!542705) (not b!542713))
(check-sat)
