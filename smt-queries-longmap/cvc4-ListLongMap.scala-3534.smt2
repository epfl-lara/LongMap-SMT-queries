; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48778 () Bool)

(assert start!48778)

(declare-fun b!536651 () Bool)

(declare-fun e!311497 () Bool)

(declare-fun e!311495 () Bool)

(assert (=> b!536651 (= e!311497 e!311495)))

(declare-fun res!331856 () Bool)

(assert (=> b!536651 (=> (not res!331856) (not e!311495))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4792 0))(
  ( (MissingZero!4792 (index!21392 (_ BitVec 32))) (Found!4792 (index!21393 (_ BitVec 32))) (Intermediate!4792 (undefined!5604 Bool) (index!21394 (_ BitVec 32)) (x!50327 (_ BitVec 32))) (Undefined!4792) (MissingVacant!4792 (index!21395 (_ BitVec 32))) )
))
(declare-fun lt!246160 () SeekEntryResult!4792)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536651 (= res!331856 (= lt!246160 (Intermediate!4792 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33990 0))(
  ( (array!33991 (arr!16334 (Array (_ BitVec 32) (_ BitVec 64))) (size!16698 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33990)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33990 (_ BitVec 32)) SeekEntryResult!4792)

(assert (=> b!536651 (= lt!246160 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16334 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536652 () Bool)

(declare-fun e!311498 () Bool)

(assert (=> b!536652 (= e!311498 e!311497)))

(declare-fun res!331859 () Bool)

(assert (=> b!536652 (=> (not res!331859) (not e!311497))))

(declare-fun lt!246162 () SeekEntryResult!4792)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536652 (= res!331859 (or (= lt!246162 (MissingZero!4792 i!1153)) (= lt!246162 (MissingVacant!4792 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33990 (_ BitVec 32)) SeekEntryResult!4792)

(assert (=> b!536652 (= lt!246162 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536653 () Bool)

(declare-fun res!331857 () Bool)

(assert (=> b!536653 (=> (not res!331857) (not e!311497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33990 (_ BitVec 32)) Bool)

(assert (=> b!536653 (= res!331857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536655 () Bool)

(declare-fun res!331861 () Bool)

(assert (=> b!536655 (=> (not res!331861) (not e!311498))))

(declare-fun arrayContainsKey!0 (array!33990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536655 (= res!331861 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536656 () Bool)

(declare-fun e!311496 () Bool)

(assert (=> b!536656 (= e!311495 e!311496)))

(declare-fun res!331865 () Bool)

(assert (=> b!536656 (=> (not res!331865) (not e!311496))))

(declare-fun lt!246161 () (_ BitVec 32))

(assert (=> b!536656 (= res!331865 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246161 #b00000000000000000000000000000000) (bvslt lt!246161 (size!16698 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536656 (= lt!246161 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536657 () Bool)

(declare-fun res!331862 () Bool)

(assert (=> b!536657 (=> (not res!331862) (not e!311498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536657 (= res!331862 (validKeyInArray!0 k!1998))))

(declare-fun b!536658 () Bool)

(assert (=> b!536658 (= e!311496 false)))

(declare-fun lt!246163 () SeekEntryResult!4792)

(assert (=> b!536658 (= lt!246163 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246161 (select (arr!16334 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536659 () Bool)

(declare-fun res!331863 () Bool)

(assert (=> b!536659 (=> (not res!331863) (not e!311495))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536659 (= res!331863 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16334 a!3154) j!147) mask!3216) (select (arr!16334 a!3154) j!147) a!3154 mask!3216) lt!246160))))

(declare-fun b!536660 () Bool)

(declare-fun res!331866 () Bool)

(assert (=> b!536660 (=> (not res!331866) (not e!311498))))

(assert (=> b!536660 (= res!331866 (and (= (size!16698 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16698 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16698 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536661 () Bool)

(declare-fun res!331868 () Bool)

(assert (=> b!536661 (=> (not res!331868) (not e!311497))))

(assert (=> b!536661 (= res!331868 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16698 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16698 a!3154)) (= (select (arr!16334 a!3154) resIndex!32) (select (arr!16334 a!3154) j!147))))))

(declare-fun b!536654 () Bool)

(declare-fun res!331864 () Bool)

(assert (=> b!536654 (=> (not res!331864) (not e!311497))))

(declare-datatypes ((List!10453 0))(
  ( (Nil!10450) (Cons!10449 (h!11392 (_ BitVec 64)) (t!16681 List!10453)) )
))
(declare-fun arrayNoDuplicates!0 (array!33990 (_ BitVec 32) List!10453) Bool)

(assert (=> b!536654 (= res!331864 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10450))))

(declare-fun res!331860 () Bool)

(assert (=> start!48778 (=> (not res!331860) (not e!311498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48778 (= res!331860 (validMask!0 mask!3216))))

(assert (=> start!48778 e!311498))

(assert (=> start!48778 true))

(declare-fun array_inv!12130 (array!33990) Bool)

(assert (=> start!48778 (array_inv!12130 a!3154)))

(declare-fun b!536662 () Bool)

(declare-fun res!331867 () Bool)

(assert (=> b!536662 (=> (not res!331867) (not e!311498))))

(assert (=> b!536662 (= res!331867 (validKeyInArray!0 (select (arr!16334 a!3154) j!147)))))

(declare-fun b!536663 () Bool)

(declare-fun res!331858 () Bool)

(assert (=> b!536663 (=> (not res!331858) (not e!311495))))

(assert (=> b!536663 (= res!331858 (and (not (= (select (arr!16334 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16334 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16334 a!3154) index!1177) (select (arr!16334 a!3154) j!147)))))))

(assert (= (and start!48778 res!331860) b!536660))

(assert (= (and b!536660 res!331866) b!536662))

(assert (= (and b!536662 res!331867) b!536657))

(assert (= (and b!536657 res!331862) b!536655))

(assert (= (and b!536655 res!331861) b!536652))

(assert (= (and b!536652 res!331859) b!536653))

(assert (= (and b!536653 res!331857) b!536654))

(assert (= (and b!536654 res!331864) b!536661))

(assert (= (and b!536661 res!331868) b!536651))

(assert (= (and b!536651 res!331856) b!536659))

(assert (= (and b!536659 res!331863) b!536663))

(assert (= (and b!536663 res!331858) b!536656))

(assert (= (and b!536656 res!331865) b!536658))

(declare-fun m!516025 () Bool)

(assert (=> b!536656 m!516025))

(declare-fun m!516027 () Bool)

(assert (=> b!536657 m!516027))

(declare-fun m!516029 () Bool)

(assert (=> b!536653 m!516029))

(declare-fun m!516031 () Bool)

(assert (=> b!536652 m!516031))

(declare-fun m!516033 () Bool)

(assert (=> b!536658 m!516033))

(assert (=> b!536658 m!516033))

(declare-fun m!516035 () Bool)

(assert (=> b!536658 m!516035))

(declare-fun m!516037 () Bool)

(assert (=> b!536655 m!516037))

(declare-fun m!516039 () Bool)

(assert (=> b!536654 m!516039))

(declare-fun m!516041 () Bool)

(assert (=> b!536663 m!516041))

(assert (=> b!536663 m!516033))

(assert (=> b!536651 m!516033))

(assert (=> b!536651 m!516033))

(declare-fun m!516043 () Bool)

(assert (=> b!536651 m!516043))

(assert (=> b!536662 m!516033))

(assert (=> b!536662 m!516033))

(declare-fun m!516045 () Bool)

(assert (=> b!536662 m!516045))

(declare-fun m!516047 () Bool)

(assert (=> start!48778 m!516047))

(declare-fun m!516049 () Bool)

(assert (=> start!48778 m!516049))

(assert (=> b!536659 m!516033))

(assert (=> b!536659 m!516033))

(declare-fun m!516051 () Bool)

(assert (=> b!536659 m!516051))

(assert (=> b!536659 m!516051))

(assert (=> b!536659 m!516033))

(declare-fun m!516053 () Bool)

(assert (=> b!536659 m!516053))

(declare-fun m!516055 () Bool)

(assert (=> b!536661 m!516055))

(assert (=> b!536661 m!516033))

(push 1)

(assert (not b!536657))

(assert (not b!536653))

(assert (not b!536652))

(assert (not b!536655))

(assert (not b!536651))

(assert (not start!48778))

