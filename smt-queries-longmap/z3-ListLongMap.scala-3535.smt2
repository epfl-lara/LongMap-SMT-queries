; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48782 () Bool)

(assert start!48782)

(declare-fun b!536729 () Bool)

(declare-fun e!311528 () Bool)

(declare-fun e!311525 () Bool)

(assert (=> b!536729 (= e!311528 e!311525)))

(declare-fun res!331939 () Bool)

(assert (=> b!536729 (=> (not res!331939) (not e!311525))))

(declare-datatypes ((SeekEntryResult!4794 0))(
  ( (MissingZero!4794 (index!21400 (_ BitVec 32))) (Found!4794 (index!21401 (_ BitVec 32))) (Intermediate!4794 (undefined!5606 Bool) (index!21402 (_ BitVec 32)) (x!50337 (_ BitVec 32))) (Undefined!4794) (MissingVacant!4794 (index!21403 (_ BitVec 32))) )
))
(declare-fun lt!246186 () SeekEntryResult!4794)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536729 (= res!331939 (= lt!246186 (Intermediate!4794 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33994 0))(
  ( (array!33995 (arr!16336 (Array (_ BitVec 32) (_ BitVec 64))) (size!16700 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33994)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33994 (_ BitVec 32)) SeekEntryResult!4794)

(assert (=> b!536729 (= lt!246186 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16336 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536730 () Bool)

(declare-fun res!331941 () Bool)

(declare-fun e!311529 () Bool)

(assert (=> b!536730 (=> (not res!331941) (not e!311529))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536730 (= res!331941 (validKeyInArray!0 k0!1998))))

(declare-fun b!536731 () Bool)

(declare-fun res!331934 () Bool)

(assert (=> b!536731 (=> (not res!331934) (not e!311528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33994 (_ BitVec 32)) Bool)

(assert (=> b!536731 (= res!331934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536732 () Bool)

(declare-fun res!331943 () Bool)

(assert (=> b!536732 (=> (not res!331943) (not e!311525))))

(assert (=> b!536732 (= res!331943 (and (not (= (select (arr!16336 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16336 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16336 a!3154) index!1177) (select (arr!16336 a!3154) j!147)))))))

(declare-fun b!536733 () Bool)

(declare-fun res!331946 () Bool)

(assert (=> b!536733 (=> (not res!331946) (not e!311529))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536733 (= res!331946 (and (= (size!16700 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16700 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16700 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536734 () Bool)

(declare-fun res!331945 () Bool)

(assert (=> b!536734 (=> (not res!331945) (not e!311528))))

(assert (=> b!536734 (= res!331945 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16700 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16700 a!3154)) (= (select (arr!16336 a!3154) resIndex!32) (select (arr!16336 a!3154) j!147))))))

(declare-fun b!536735 () Bool)

(assert (=> b!536735 (= e!311529 e!311528)))

(declare-fun res!331935 () Bool)

(assert (=> b!536735 (=> (not res!331935) (not e!311528))))

(declare-fun lt!246184 () SeekEntryResult!4794)

(assert (=> b!536735 (= res!331935 (or (= lt!246184 (MissingZero!4794 i!1153)) (= lt!246184 (MissingVacant!4794 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33994 (_ BitVec 32)) SeekEntryResult!4794)

(assert (=> b!536735 (= lt!246184 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!536737 () Bool)

(declare-fun e!311526 () Bool)

(assert (=> b!536737 (= e!311526 false)))

(declare-fun lt!246187 () SeekEntryResult!4794)

(declare-fun lt!246185 () (_ BitVec 32))

(assert (=> b!536737 (= lt!246187 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246185 (select (arr!16336 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536738 () Bool)

(assert (=> b!536738 (= e!311525 e!311526)))

(declare-fun res!331940 () Bool)

(assert (=> b!536738 (=> (not res!331940) (not e!311526))))

(assert (=> b!536738 (= res!331940 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246185 #b00000000000000000000000000000000) (bvslt lt!246185 (size!16700 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536738 (= lt!246185 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536739 () Bool)

(declare-fun res!331937 () Bool)

(assert (=> b!536739 (=> (not res!331937) (not e!311525))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536739 (= res!331937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16336 a!3154) j!147) mask!3216) (select (arr!16336 a!3154) j!147) a!3154 mask!3216) lt!246186))))

(declare-fun res!331942 () Bool)

(assert (=> start!48782 (=> (not res!331942) (not e!311529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48782 (= res!331942 (validMask!0 mask!3216))))

(assert (=> start!48782 e!311529))

(assert (=> start!48782 true))

(declare-fun array_inv!12132 (array!33994) Bool)

(assert (=> start!48782 (array_inv!12132 a!3154)))

(declare-fun b!536736 () Bool)

(declare-fun res!331938 () Bool)

(assert (=> b!536736 (=> (not res!331938) (not e!311529))))

(assert (=> b!536736 (= res!331938 (validKeyInArray!0 (select (arr!16336 a!3154) j!147)))))

(declare-fun b!536740 () Bool)

(declare-fun res!331936 () Bool)

(assert (=> b!536740 (=> (not res!331936) (not e!311528))))

(declare-datatypes ((List!10455 0))(
  ( (Nil!10452) (Cons!10451 (h!11394 (_ BitVec 64)) (t!16683 List!10455)) )
))
(declare-fun arrayNoDuplicates!0 (array!33994 (_ BitVec 32) List!10455) Bool)

(assert (=> b!536740 (= res!331936 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10452))))

(declare-fun b!536741 () Bool)

(declare-fun res!331944 () Bool)

(assert (=> b!536741 (=> (not res!331944) (not e!311529))))

(declare-fun arrayContainsKey!0 (array!33994 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536741 (= res!331944 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48782 res!331942) b!536733))

(assert (= (and b!536733 res!331946) b!536736))

(assert (= (and b!536736 res!331938) b!536730))

(assert (= (and b!536730 res!331941) b!536741))

(assert (= (and b!536741 res!331944) b!536735))

(assert (= (and b!536735 res!331935) b!536731))

(assert (= (and b!536731 res!331934) b!536740))

(assert (= (and b!536740 res!331936) b!536734))

(assert (= (and b!536734 res!331945) b!536729))

(assert (= (and b!536729 res!331939) b!536739))

(assert (= (and b!536739 res!331937) b!536732))

(assert (= (and b!536732 res!331943) b!536738))

(assert (= (and b!536738 res!331940) b!536737))

(declare-fun m!516089 () Bool)

(assert (=> b!536730 m!516089))

(declare-fun m!516091 () Bool)

(assert (=> start!48782 m!516091))

(declare-fun m!516093 () Bool)

(assert (=> start!48782 m!516093))

(declare-fun m!516095 () Bool)

(assert (=> b!536731 m!516095))

(declare-fun m!516097 () Bool)

(assert (=> b!536729 m!516097))

(assert (=> b!536729 m!516097))

(declare-fun m!516099 () Bool)

(assert (=> b!536729 m!516099))

(declare-fun m!516101 () Bool)

(assert (=> b!536741 m!516101))

(declare-fun m!516103 () Bool)

(assert (=> b!536734 m!516103))

(assert (=> b!536734 m!516097))

(declare-fun m!516105 () Bool)

(assert (=> b!536732 m!516105))

(assert (=> b!536732 m!516097))

(assert (=> b!536736 m!516097))

(assert (=> b!536736 m!516097))

(declare-fun m!516107 () Bool)

(assert (=> b!536736 m!516107))

(assert (=> b!536739 m!516097))

(assert (=> b!536739 m!516097))

(declare-fun m!516109 () Bool)

(assert (=> b!536739 m!516109))

(assert (=> b!536739 m!516109))

(assert (=> b!536739 m!516097))

(declare-fun m!516111 () Bool)

(assert (=> b!536739 m!516111))

(assert (=> b!536737 m!516097))

(assert (=> b!536737 m!516097))

(declare-fun m!516113 () Bool)

(assert (=> b!536737 m!516113))

(declare-fun m!516115 () Bool)

(assert (=> b!536738 m!516115))

(declare-fun m!516117 () Bool)

(assert (=> b!536740 m!516117))

(declare-fun m!516119 () Bool)

(assert (=> b!536735 m!516119))

(check-sat (not b!536741) (not start!48782) (not b!536739) (not b!536738) (not b!536736) (not b!536737) (not b!536730) (not b!536731) (not b!536729) (not b!536735) (not b!536740))
(check-sat)
