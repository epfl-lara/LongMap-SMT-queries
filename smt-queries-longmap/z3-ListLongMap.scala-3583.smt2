; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49330 () Bool)

(assert start!49330)

(declare-fun b!542810 () Bool)

(declare-fun res!337266 () Bool)

(declare-fun e!314153 () Bool)

(assert (=> b!542810 (=> (not res!337266) (not e!314153))))

(declare-datatypes ((array!34286 0))(
  ( (array!34287 (arr!16474 (Array (_ BitVec 32) (_ BitVec 64))) (size!16838 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34286)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34286 (_ BitVec 32)) Bool)

(assert (=> b!542810 (= res!337266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542811 () Bool)

(declare-fun res!337262 () Bool)

(declare-fun e!314151 () Bool)

(assert (=> b!542811 (=> (not res!337262) (not e!314151))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542811 (= res!337262 (validKeyInArray!0 (select (arr!16474 a!3154) j!147)))))

(declare-fun b!542812 () Bool)

(declare-fun res!337267 () Bool)

(assert (=> b!542812 (=> (not res!337267) (not e!314151))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!542812 (= res!337267 (validKeyInArray!0 k0!1998))))

(declare-fun b!542814 () Bool)

(declare-fun res!337256 () Bool)

(assert (=> b!542814 (=> (not res!337256) (not e!314153))))

(declare-datatypes ((List!10500 0))(
  ( (Nil!10497) (Cons!10496 (h!11454 (_ BitVec 64)) (t!16720 List!10500)) )
))
(declare-fun arrayNoDuplicates!0 (array!34286 (_ BitVec 32) List!10500) Bool)

(assert (=> b!542814 (= res!337256 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10497))))

(declare-fun b!542815 () Bool)

(declare-fun res!337263 () Bool)

(assert (=> b!542815 (=> (not res!337263) (not e!314151))))

(declare-fun arrayContainsKey!0 (array!34286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542815 (= res!337263 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542816 () Bool)

(declare-fun res!337257 () Bool)

(declare-fun e!314152 () Bool)

(assert (=> b!542816 (=> (not res!337257) (not e!314152))))

(declare-datatypes ((SeekEntryResult!4888 0))(
  ( (MissingZero!4888 (index!21776 (_ BitVec 32))) (Found!4888 (index!21777 (_ BitVec 32))) (Intermediate!4888 (undefined!5700 Bool) (index!21778 (_ BitVec 32)) (x!50842 (_ BitVec 32))) (Undefined!4888) (MissingVacant!4888 (index!21779 (_ BitVec 32))) )
))
(declare-fun lt!248073 () SeekEntryResult!4888)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34286 (_ BitVec 32)) SeekEntryResult!4888)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542816 (= res!337257 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16474 a!3154) j!147) mask!3216) (select (arr!16474 a!3154) j!147) a!3154 mask!3216) lt!248073))))

(declare-fun b!542817 () Bool)

(assert (=> b!542817 (= e!314151 e!314153)))

(declare-fun res!337265 () Bool)

(assert (=> b!542817 (=> (not res!337265) (not e!314153))))

(declare-fun lt!248072 () SeekEntryResult!4888)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542817 (= res!337265 (or (= lt!248072 (MissingZero!4888 i!1153)) (= lt!248072 (MissingVacant!4888 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34286 (_ BitVec 32)) SeekEntryResult!4888)

(assert (=> b!542817 (= lt!248072 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!542818 () Bool)

(declare-fun res!337260 () Bool)

(assert (=> b!542818 (=> (not res!337260) (not e!314152))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!542818 (= res!337260 (and (not (= (select (arr!16474 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16474 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16474 a!3154) index!1177) (select (arr!16474 a!3154) j!147)))))))

(declare-fun b!542819 () Bool)

(declare-fun res!337258 () Bool)

(assert (=> b!542819 (=> (not res!337258) (not e!314153))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542819 (= res!337258 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16838 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16838 a!3154)) (= (select (arr!16474 a!3154) resIndex!32) (select (arr!16474 a!3154) j!147))))))

(declare-fun b!542820 () Bool)

(assert (=> b!542820 (= e!314153 e!314152)))

(declare-fun res!337259 () Bool)

(assert (=> b!542820 (=> (not res!337259) (not e!314152))))

(assert (=> b!542820 (= res!337259 (= lt!248073 (Intermediate!4888 false resIndex!32 resX!32)))))

(assert (=> b!542820 (= lt!248073 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16474 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542821 () Bool)

(declare-fun res!337264 () Bool)

(assert (=> b!542821 (=> (not res!337264) (not e!314151))))

(assert (=> b!542821 (= res!337264 (and (= (size!16838 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16838 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16838 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542813 () Bool)

(assert (=> b!542813 (= e!314152 false)))

(declare-fun lt!248074 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542813 (= lt!248074 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun res!337261 () Bool)

(assert (=> start!49330 (=> (not res!337261) (not e!314151))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49330 (= res!337261 (validMask!0 mask!3216))))

(assert (=> start!49330 e!314151))

(assert (=> start!49330 true))

(declare-fun array_inv!12333 (array!34286) Bool)

(assert (=> start!49330 (array_inv!12333 a!3154)))

(assert (= (and start!49330 res!337261) b!542821))

(assert (= (and b!542821 res!337264) b!542811))

(assert (= (and b!542811 res!337262) b!542812))

(assert (= (and b!542812 res!337267) b!542815))

(assert (= (and b!542815 res!337263) b!542817))

(assert (= (and b!542817 res!337265) b!542810))

(assert (= (and b!542810 res!337266) b!542814))

(assert (= (and b!542814 res!337256) b!542819))

(assert (= (and b!542819 res!337258) b!542820))

(assert (= (and b!542820 res!337259) b!542816))

(assert (= (and b!542816 res!337257) b!542818))

(assert (= (and b!542818 res!337260) b!542813))

(declare-fun m!521161 () Bool)

(assert (=> b!542819 m!521161))

(declare-fun m!521163 () Bool)

(assert (=> b!542819 m!521163))

(declare-fun m!521165 () Bool)

(assert (=> b!542814 m!521165))

(declare-fun m!521167 () Bool)

(assert (=> start!49330 m!521167))

(declare-fun m!521169 () Bool)

(assert (=> start!49330 m!521169))

(assert (=> b!542820 m!521163))

(assert (=> b!542820 m!521163))

(declare-fun m!521171 () Bool)

(assert (=> b!542820 m!521171))

(declare-fun m!521173 () Bool)

(assert (=> b!542817 m!521173))

(declare-fun m!521175 () Bool)

(assert (=> b!542810 m!521175))

(declare-fun m!521177 () Bool)

(assert (=> b!542815 m!521177))

(declare-fun m!521179 () Bool)

(assert (=> b!542818 m!521179))

(assert (=> b!542818 m!521163))

(declare-fun m!521181 () Bool)

(assert (=> b!542812 m!521181))

(declare-fun m!521183 () Bool)

(assert (=> b!542813 m!521183))

(assert (=> b!542811 m!521163))

(assert (=> b!542811 m!521163))

(declare-fun m!521185 () Bool)

(assert (=> b!542811 m!521185))

(assert (=> b!542816 m!521163))

(assert (=> b!542816 m!521163))

(declare-fun m!521187 () Bool)

(assert (=> b!542816 m!521187))

(assert (=> b!542816 m!521187))

(assert (=> b!542816 m!521163))

(declare-fun m!521189 () Bool)

(assert (=> b!542816 m!521189))

(check-sat (not b!542810) (not b!542815) (not b!542811) (not b!542812) (not b!542816) (not b!542813) (not start!49330) (not b!542820) (not b!542817) (not b!542814))
(check-sat)
