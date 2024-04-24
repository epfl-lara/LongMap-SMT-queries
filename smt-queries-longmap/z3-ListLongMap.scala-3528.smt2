; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48784 () Bool)

(assert start!48784)

(declare-fun b!536071 () Bool)

(declare-fun res!331182 () Bool)

(declare-fun e!311325 () Bool)

(assert (=> b!536071 (=> (not res!331182) (not e!311325))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33944 0))(
  ( (array!33945 (arr!16309 (Array (_ BitVec 32) (_ BitVec 64))) (size!16673 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33944)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536071 (= res!331182 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16673 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16673 a!3154)) (= (select (arr!16309 a!3154) resIndex!32) (select (arr!16309 a!3154) j!147))))))

(declare-fun b!536072 () Bool)

(declare-fun res!331183 () Bool)

(declare-fun e!311328 () Bool)

(assert (=> b!536072 (=> (not res!331183) (not e!311328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536072 (= res!331183 (validKeyInArray!0 (select (arr!16309 a!3154) j!147)))))

(declare-fun b!536073 () Bool)

(declare-fun res!331176 () Bool)

(assert (=> b!536073 (=> (not res!331176) (not e!311325))))

(declare-datatypes ((List!10335 0))(
  ( (Nil!10332) (Cons!10331 (h!11277 (_ BitVec 64)) (t!16555 List!10335)) )
))
(declare-fun arrayNoDuplicates!0 (array!33944 (_ BitVec 32) List!10335) Bool)

(assert (=> b!536073 (= res!331176 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10332))))

(declare-fun res!331173 () Bool)

(assert (=> start!48784 (=> (not res!331173) (not e!311328))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48784 (= res!331173 (validMask!0 mask!3216))))

(assert (=> start!48784 e!311328))

(assert (=> start!48784 true))

(declare-fun array_inv!12168 (array!33944) Bool)

(assert (=> start!48784 (array_inv!12168 a!3154)))

(declare-fun b!536074 () Bool)

(declare-fun res!331171 () Bool)

(declare-fun e!311327 () Bool)

(assert (=> b!536074 (=> (not res!331171) (not e!311327))))

(declare-datatypes ((SeekEntryResult!4723 0))(
  ( (MissingZero!4723 (index!21116 (_ BitVec 32))) (Found!4723 (index!21117 (_ BitVec 32))) (Intermediate!4723 (undefined!5535 Bool) (index!21118 (_ BitVec 32)) (x!50213 (_ BitVec 32))) (Undefined!4723) (MissingVacant!4723 (index!21119 (_ BitVec 32))) )
))
(declare-fun lt!246028 () SeekEntryResult!4723)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33944 (_ BitVec 32)) SeekEntryResult!4723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536074 (= res!331171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16309 a!3154) j!147) mask!3216) (select (arr!16309 a!3154) j!147) a!3154 mask!3216) lt!246028))))

(declare-fun b!536075 () Bool)

(declare-fun res!331178 () Bool)

(assert (=> b!536075 (=> (not res!331178) (not e!311328))))

(declare-fun k0!1998 () (_ BitVec 64))

(assert (=> b!536075 (= res!331178 (validKeyInArray!0 k0!1998))))

(declare-fun b!536076 () Bool)

(declare-fun e!311326 () Bool)

(assert (=> b!536076 (= e!311327 e!311326)))

(declare-fun res!331172 () Bool)

(assert (=> b!536076 (=> (not res!331172) (not e!311326))))

(declare-fun lt!246029 () (_ BitVec 32))

(assert (=> b!536076 (= res!331172 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246029 #b00000000000000000000000000000000) (bvslt lt!246029 (size!16673 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536076 (= lt!246029 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!536077 () Bool)

(assert (=> b!536077 (= e!311328 e!311325)))

(declare-fun res!331177 () Bool)

(assert (=> b!536077 (=> (not res!331177) (not e!311325))))

(declare-fun lt!246031 () SeekEntryResult!4723)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536077 (= res!331177 (or (= lt!246031 (MissingZero!4723 i!1153)) (= lt!246031 (MissingVacant!4723 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33944 (_ BitVec 32)) SeekEntryResult!4723)

(assert (=> b!536077 (= lt!246031 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536078 () Bool)

(declare-fun res!331174 () Bool)

(assert (=> b!536078 (=> (not res!331174) (not e!311328))))

(assert (=> b!536078 (= res!331174 (and (= (size!16673 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16673 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16673 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536079 () Bool)

(declare-fun res!331175 () Bool)

(assert (=> b!536079 (=> (not res!331175) (not e!311325))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33944 (_ BitVec 32)) Bool)

(assert (=> b!536079 (= res!331175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536080 () Bool)

(assert (=> b!536080 (= e!311325 e!311327)))

(declare-fun res!331180 () Bool)

(assert (=> b!536080 (=> (not res!331180) (not e!311327))))

(assert (=> b!536080 (= res!331180 (= lt!246028 (Intermediate!4723 false resIndex!32 resX!32)))))

(assert (=> b!536080 (= lt!246028 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16309 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536081 () Bool)

(assert (=> b!536081 (= e!311326 false)))

(declare-fun lt!246030 () SeekEntryResult!4723)

(assert (=> b!536081 (= lt!246030 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246029 (select (arr!16309 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536082 () Bool)

(declare-fun res!331179 () Bool)

(assert (=> b!536082 (=> (not res!331179) (not e!311327))))

(assert (=> b!536082 (= res!331179 (and (not (= (select (arr!16309 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16309 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16309 a!3154) index!1177) (select (arr!16309 a!3154) j!147)))))))

(declare-fun b!536083 () Bool)

(declare-fun res!331181 () Bool)

(assert (=> b!536083 (=> (not res!331181) (not e!311328))))

(declare-fun arrayContainsKey!0 (array!33944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536083 (= res!331181 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48784 res!331173) b!536078))

(assert (= (and b!536078 res!331174) b!536072))

(assert (= (and b!536072 res!331183) b!536075))

(assert (= (and b!536075 res!331178) b!536083))

(assert (= (and b!536083 res!331181) b!536077))

(assert (= (and b!536077 res!331177) b!536079))

(assert (= (and b!536079 res!331175) b!536073))

(assert (= (and b!536073 res!331176) b!536071))

(assert (= (and b!536071 res!331182) b!536080))

(assert (= (and b!536080 res!331180) b!536074))

(assert (= (and b!536074 res!331171) b!536082))

(assert (= (and b!536082 res!331179) b!536076))

(assert (= (and b!536076 res!331172) b!536081))

(declare-fun m!515707 () Bool)

(assert (=> b!536071 m!515707))

(declare-fun m!515709 () Bool)

(assert (=> b!536071 m!515709))

(declare-fun m!515711 () Bool)

(assert (=> b!536083 m!515711))

(declare-fun m!515713 () Bool)

(assert (=> b!536073 m!515713))

(assert (=> b!536081 m!515709))

(assert (=> b!536081 m!515709))

(declare-fun m!515715 () Bool)

(assert (=> b!536081 m!515715))

(declare-fun m!515717 () Bool)

(assert (=> start!48784 m!515717))

(declare-fun m!515719 () Bool)

(assert (=> start!48784 m!515719))

(assert (=> b!536074 m!515709))

(assert (=> b!536074 m!515709))

(declare-fun m!515721 () Bool)

(assert (=> b!536074 m!515721))

(assert (=> b!536074 m!515721))

(assert (=> b!536074 m!515709))

(declare-fun m!515723 () Bool)

(assert (=> b!536074 m!515723))

(declare-fun m!515725 () Bool)

(assert (=> b!536075 m!515725))

(assert (=> b!536080 m!515709))

(assert (=> b!536080 m!515709))

(declare-fun m!515727 () Bool)

(assert (=> b!536080 m!515727))

(declare-fun m!515729 () Bool)

(assert (=> b!536082 m!515729))

(assert (=> b!536082 m!515709))

(declare-fun m!515731 () Bool)

(assert (=> b!536077 m!515731))

(declare-fun m!515733 () Bool)

(assert (=> b!536079 m!515733))

(declare-fun m!515735 () Bool)

(assert (=> b!536076 m!515735))

(assert (=> b!536072 m!515709))

(assert (=> b!536072 m!515709))

(declare-fun m!515737 () Bool)

(assert (=> b!536072 m!515737))

(check-sat (not b!536077) (not b!536076) (not b!536081) (not b!536075) (not b!536083) (not b!536072) (not start!48784) (not b!536074) (not b!536080) (not b!536079) (not b!536073))
(check-sat)
