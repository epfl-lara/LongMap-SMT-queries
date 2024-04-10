; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48794 () Bool)

(assert start!48794)

(declare-fun b!536963 () Bool)

(declare-fun res!332170 () Bool)

(declare-fun e!311617 () Bool)

(assert (=> b!536963 (=> (not res!332170) (not e!311617))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34006 0))(
  ( (array!34007 (arr!16342 (Array (_ BitVec 32) (_ BitVec 64))) (size!16706 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34006)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536963 (= res!332170 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16706 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16706 a!3154)) (= (select (arr!16342 a!3154) resIndex!32) (select (arr!16342 a!3154) j!147))))))

(declare-fun b!536964 () Bool)

(declare-fun res!332176 () Bool)

(declare-fun e!311619 () Bool)

(assert (=> b!536964 (=> (not res!332176) (not e!311619))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536964 (= res!332176 (and (= (size!16706 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16706 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16706 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536965 () Bool)

(declare-fun e!311615 () Bool)

(assert (=> b!536965 (= e!311617 e!311615)))

(declare-fun res!332173 () Bool)

(assert (=> b!536965 (=> (not res!332173) (not e!311615))))

(declare-datatypes ((SeekEntryResult!4800 0))(
  ( (MissingZero!4800 (index!21424 (_ BitVec 32))) (Found!4800 (index!21425 (_ BitVec 32))) (Intermediate!4800 (undefined!5612 Bool) (index!21426 (_ BitVec 32)) (x!50359 (_ BitVec 32))) (Undefined!4800) (MissingVacant!4800 (index!21427 (_ BitVec 32))) )
))
(declare-fun lt!246258 () SeekEntryResult!4800)

(assert (=> b!536965 (= res!332173 (= lt!246258 (Intermediate!4800 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34006 (_ BitVec 32)) SeekEntryResult!4800)

(assert (=> b!536965 (= lt!246258 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16342 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536966 () Bool)

(declare-fun e!311616 () Bool)

(assert (=> b!536966 (= e!311616 false)))

(declare-fun lt!246256 () (_ BitVec 32))

(declare-fun lt!246259 () SeekEntryResult!4800)

(assert (=> b!536966 (= lt!246259 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246256 (select (arr!16342 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536967 () Bool)

(declare-fun res!332178 () Bool)

(assert (=> b!536967 (=> (not res!332178) (not e!311619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536967 (= res!332178 (validKeyInArray!0 (select (arr!16342 a!3154) j!147)))))

(declare-fun b!536968 () Bool)

(declare-fun res!332179 () Bool)

(assert (=> b!536968 (=> (not res!332179) (not e!311619))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34006 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536968 (= res!332179 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536969 () Bool)

(assert (=> b!536969 (= e!311615 e!311616)))

(declare-fun res!332169 () Bool)

(assert (=> b!536969 (=> (not res!332169) (not e!311616))))

(assert (=> b!536969 (= res!332169 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246256 #b00000000000000000000000000000000) (bvslt lt!246256 (size!16706 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536969 (= lt!246256 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536970 () Bool)

(declare-fun res!332171 () Bool)

(assert (=> b!536970 (=> (not res!332171) (not e!311615))))

(assert (=> b!536970 (= res!332171 (and (not (= (select (arr!16342 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16342 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16342 a!3154) index!1177) (select (arr!16342 a!3154) j!147)))))))

(declare-fun b!536972 () Bool)

(declare-fun res!332174 () Bool)

(assert (=> b!536972 (=> (not res!332174) (not e!311617))))

(declare-datatypes ((List!10461 0))(
  ( (Nil!10458) (Cons!10457 (h!11400 (_ BitVec 64)) (t!16689 List!10461)) )
))
(declare-fun arrayNoDuplicates!0 (array!34006 (_ BitVec 32) List!10461) Bool)

(assert (=> b!536972 (= res!332174 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10458))))

(declare-fun b!536973 () Bool)

(declare-fun res!332168 () Bool)

(assert (=> b!536973 (=> (not res!332168) (not e!311615))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536973 (= res!332168 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16342 a!3154) j!147) mask!3216) (select (arr!16342 a!3154) j!147) a!3154 mask!3216) lt!246258))))

(declare-fun b!536974 () Bool)

(assert (=> b!536974 (= e!311619 e!311617)))

(declare-fun res!332175 () Bool)

(assert (=> b!536974 (=> (not res!332175) (not e!311617))))

(declare-fun lt!246257 () SeekEntryResult!4800)

(assert (=> b!536974 (= res!332175 (or (= lt!246257 (MissingZero!4800 i!1153)) (= lt!246257 (MissingVacant!4800 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34006 (_ BitVec 32)) SeekEntryResult!4800)

(assert (=> b!536974 (= lt!246257 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536975 () Bool)

(declare-fun res!332172 () Bool)

(assert (=> b!536975 (=> (not res!332172) (not e!311617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34006 (_ BitVec 32)) Bool)

(assert (=> b!536975 (= res!332172 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!332177 () Bool)

(assert (=> start!48794 (=> (not res!332177) (not e!311619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48794 (= res!332177 (validMask!0 mask!3216))))

(assert (=> start!48794 e!311619))

(assert (=> start!48794 true))

(declare-fun array_inv!12138 (array!34006) Bool)

(assert (=> start!48794 (array_inv!12138 a!3154)))

(declare-fun b!536971 () Bool)

(declare-fun res!332180 () Bool)

(assert (=> b!536971 (=> (not res!332180) (not e!311619))))

(assert (=> b!536971 (= res!332180 (validKeyInArray!0 k0!1998))))

(assert (= (and start!48794 res!332177) b!536964))

(assert (= (and b!536964 res!332176) b!536967))

(assert (= (and b!536967 res!332178) b!536971))

(assert (= (and b!536971 res!332180) b!536968))

(assert (= (and b!536968 res!332179) b!536974))

(assert (= (and b!536974 res!332175) b!536975))

(assert (= (and b!536975 res!332172) b!536972))

(assert (= (and b!536972 res!332174) b!536963))

(assert (= (and b!536963 res!332170) b!536965))

(assert (= (and b!536965 res!332173) b!536973))

(assert (= (and b!536973 res!332168) b!536970))

(assert (= (and b!536970 res!332171) b!536969))

(assert (= (and b!536969 res!332169) b!536966))

(declare-fun m!516281 () Bool)

(assert (=> b!536965 m!516281))

(assert (=> b!536965 m!516281))

(declare-fun m!516283 () Bool)

(assert (=> b!536965 m!516283))

(assert (=> b!536967 m!516281))

(assert (=> b!536967 m!516281))

(declare-fun m!516285 () Bool)

(assert (=> b!536967 m!516285))

(declare-fun m!516287 () Bool)

(assert (=> b!536971 m!516287))

(declare-fun m!516289 () Bool)

(assert (=> b!536970 m!516289))

(assert (=> b!536970 m!516281))

(declare-fun m!516291 () Bool)

(assert (=> b!536972 m!516291))

(declare-fun m!516293 () Bool)

(assert (=> b!536975 m!516293))

(declare-fun m!516295 () Bool)

(assert (=> b!536974 m!516295))

(assert (=> b!536966 m!516281))

(assert (=> b!536966 m!516281))

(declare-fun m!516297 () Bool)

(assert (=> b!536966 m!516297))

(declare-fun m!516299 () Bool)

(assert (=> b!536969 m!516299))

(assert (=> b!536973 m!516281))

(assert (=> b!536973 m!516281))

(declare-fun m!516301 () Bool)

(assert (=> b!536973 m!516301))

(assert (=> b!536973 m!516301))

(assert (=> b!536973 m!516281))

(declare-fun m!516303 () Bool)

(assert (=> b!536973 m!516303))

(declare-fun m!516305 () Bool)

(assert (=> b!536968 m!516305))

(declare-fun m!516307 () Bool)

(assert (=> b!536963 m!516307))

(assert (=> b!536963 m!516281))

(declare-fun m!516309 () Bool)

(assert (=> start!48794 m!516309))

(declare-fun m!516311 () Bool)

(assert (=> start!48794 m!516311))

(check-sat (not b!536975) (not start!48794) (not b!536966) (not b!536969) (not b!536968) (not b!536974) (not b!536967) (not b!536973) (not b!536972) (not b!536965) (not b!536971))
(check-sat)
