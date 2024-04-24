; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48820 () Bool)

(assert start!48820)

(declare-fun b!536773 () Bool)

(declare-fun e!311597 () Bool)

(assert (=> b!536773 (= e!311597 false)))

(declare-datatypes ((SeekEntryResult!4741 0))(
  ( (MissingZero!4741 (index!21188 (_ BitVec 32))) (Found!4741 (index!21189 (_ BitVec 32))) (Intermediate!4741 (undefined!5553 Bool) (index!21190 (_ BitVec 32)) (x!50279 (_ BitVec 32))) (Undefined!4741) (MissingVacant!4741 (index!21191 (_ BitVec 32))) )
))
(declare-fun lt!246244 () SeekEntryResult!4741)

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33980 0))(
  ( (array!33981 (arr!16327 (Array (_ BitVec 32) (_ BitVec 64))) (size!16691 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33980)

(declare-fun lt!246247 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33980 (_ BitVec 32)) SeekEntryResult!4741)

(assert (=> b!536773 (= lt!246244 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246247 (select (arr!16327 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536774 () Bool)

(declare-fun res!331878 () Bool)

(declare-fun e!311594 () Bool)

(assert (=> b!536774 (=> (not res!331878) (not e!311594))))

(declare-datatypes ((List!10353 0))(
  ( (Nil!10350) (Cons!10349 (h!11295 (_ BitVec 64)) (t!16573 List!10353)) )
))
(declare-fun arrayNoDuplicates!0 (array!33980 (_ BitVec 32) List!10353) Bool)

(assert (=> b!536774 (= res!331878 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10350))))

(declare-fun b!536775 () Bool)

(declare-fun e!311598 () Bool)

(assert (=> b!536775 (= e!311598 e!311597)))

(declare-fun res!331885 () Bool)

(assert (=> b!536775 (=> (not res!331885) (not e!311597))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536775 (= res!331885 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246247 #b00000000000000000000000000000000) (bvslt lt!246247 (size!16691 a!3154))))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536775 (= lt!246247 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!536776 () Bool)

(declare-fun res!331875 () Bool)

(assert (=> b!536776 (=> (not res!331875) (not e!311594))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536776 (= res!331875 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16691 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16691 a!3154)) (= (select (arr!16327 a!3154) resIndex!32) (select (arr!16327 a!3154) j!147))))))

(declare-fun b!536777 () Bool)

(assert (=> b!536777 (= e!311594 e!311598)))

(declare-fun res!331880 () Bool)

(assert (=> b!536777 (=> (not res!331880) (not e!311598))))

(declare-fun lt!246246 () SeekEntryResult!4741)

(assert (=> b!536777 (= res!331880 (= lt!246246 (Intermediate!4741 false resIndex!32 resX!32)))))

(assert (=> b!536777 (= lt!246246 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16327 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536779 () Bool)

(declare-fun res!331876 () Bool)

(declare-fun e!311595 () Bool)

(assert (=> b!536779 (=> (not res!331876) (not e!311595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536779 (= res!331876 (validKeyInArray!0 (select (arr!16327 a!3154) j!147)))))

(declare-fun b!536780 () Bool)

(assert (=> b!536780 (= e!311595 e!311594)))

(declare-fun res!331882 () Bool)

(assert (=> b!536780 (=> (not res!331882) (not e!311594))))

(declare-fun lt!246245 () SeekEntryResult!4741)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536780 (= res!331882 (or (= lt!246245 (MissingZero!4741 i!1153)) (= lt!246245 (MissingVacant!4741 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33980 (_ BitVec 32)) SeekEntryResult!4741)

(assert (=> b!536780 (= lt!246245 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536781 () Bool)

(declare-fun res!331884 () Bool)

(assert (=> b!536781 (=> (not res!331884) (not e!311595))))

(assert (=> b!536781 (= res!331884 (and (= (size!16691 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16691 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16691 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536782 () Bool)

(declare-fun res!331874 () Bool)

(assert (=> b!536782 (=> (not res!331874) (not e!311595))))

(assert (=> b!536782 (= res!331874 (validKeyInArray!0 k0!1998))))

(declare-fun b!536783 () Bool)

(declare-fun res!331883 () Bool)

(assert (=> b!536783 (=> (not res!331883) (not e!311594))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33980 (_ BitVec 32)) Bool)

(assert (=> b!536783 (= res!331883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536784 () Bool)

(declare-fun res!331873 () Bool)

(assert (=> b!536784 (=> (not res!331873) (not e!311598))))

(assert (=> b!536784 (= res!331873 (and (not (= (select (arr!16327 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16327 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16327 a!3154) index!1177) (select (arr!16327 a!3154) j!147)))))))

(declare-fun b!536785 () Bool)

(declare-fun res!331881 () Bool)

(assert (=> b!536785 (=> (not res!331881) (not e!311598))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536785 (= res!331881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16327 a!3154) j!147) mask!3216) (select (arr!16327 a!3154) j!147) a!3154 mask!3216) lt!246246))))

(declare-fun res!331879 () Bool)

(assert (=> start!48820 (=> (not res!331879) (not e!311595))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48820 (= res!331879 (validMask!0 mask!3216))))

(assert (=> start!48820 e!311595))

(assert (=> start!48820 true))

(declare-fun array_inv!12186 (array!33980) Bool)

(assert (=> start!48820 (array_inv!12186 a!3154)))

(declare-fun b!536778 () Bool)

(declare-fun res!331877 () Bool)

(assert (=> b!536778 (=> (not res!331877) (not e!311595))))

(declare-fun arrayContainsKey!0 (array!33980 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536778 (= res!331877 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48820 res!331879) b!536781))

(assert (= (and b!536781 res!331884) b!536779))

(assert (= (and b!536779 res!331876) b!536782))

(assert (= (and b!536782 res!331874) b!536778))

(assert (= (and b!536778 res!331877) b!536780))

(assert (= (and b!536780 res!331882) b!536783))

(assert (= (and b!536783 res!331883) b!536774))

(assert (= (and b!536774 res!331878) b!536776))

(assert (= (and b!536776 res!331875) b!536777))

(assert (= (and b!536777 res!331880) b!536785))

(assert (= (and b!536785 res!331881) b!536784))

(assert (= (and b!536784 res!331873) b!536775))

(assert (= (and b!536775 res!331885) b!536773))

(declare-fun m!516283 () Bool)

(assert (=> b!536777 m!516283))

(assert (=> b!536777 m!516283))

(declare-fun m!516285 () Bool)

(assert (=> b!536777 m!516285))

(declare-fun m!516287 () Bool)

(assert (=> b!536784 m!516287))

(assert (=> b!536784 m!516283))

(assert (=> b!536779 m!516283))

(assert (=> b!536779 m!516283))

(declare-fun m!516289 () Bool)

(assert (=> b!536779 m!516289))

(assert (=> b!536785 m!516283))

(assert (=> b!536785 m!516283))

(declare-fun m!516291 () Bool)

(assert (=> b!536785 m!516291))

(assert (=> b!536785 m!516291))

(assert (=> b!536785 m!516283))

(declare-fun m!516293 () Bool)

(assert (=> b!536785 m!516293))

(declare-fun m!516295 () Bool)

(assert (=> b!536776 m!516295))

(assert (=> b!536776 m!516283))

(declare-fun m!516297 () Bool)

(assert (=> b!536783 m!516297))

(declare-fun m!516299 () Bool)

(assert (=> start!48820 m!516299))

(declare-fun m!516301 () Bool)

(assert (=> start!48820 m!516301))

(declare-fun m!516303 () Bool)

(assert (=> b!536782 m!516303))

(declare-fun m!516305 () Bool)

(assert (=> b!536780 m!516305))

(declare-fun m!516307 () Bool)

(assert (=> b!536778 m!516307))

(assert (=> b!536773 m!516283))

(assert (=> b!536773 m!516283))

(declare-fun m!516309 () Bool)

(assert (=> b!536773 m!516309))

(declare-fun m!516311 () Bool)

(assert (=> b!536774 m!516311))

(declare-fun m!516313 () Bool)

(assert (=> b!536775 m!516313))

(check-sat (not b!536785) (not b!536782) (not start!48820) (not b!536774) (not b!536773) (not b!536779) (not b!536783) (not b!536777) (not b!536778) (not b!536775) (not b!536780))
(check-sat)
