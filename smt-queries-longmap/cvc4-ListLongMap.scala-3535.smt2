; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48784 () Bool)

(assert start!48784)

(declare-fun b!536768 () Bool)

(declare-fun res!331982 () Bool)

(declare-fun e!311543 () Bool)

(assert (=> b!536768 (=> (not res!331982) (not e!311543))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536768 (= res!331982 (validKeyInArray!0 k!1998))))

(declare-fun b!536769 () Bool)

(declare-fun res!331978 () Bool)

(declare-fun e!311544 () Bool)

(assert (=> b!536769 (=> (not res!331978) (not e!311544))))

(declare-datatypes ((array!33996 0))(
  ( (array!33997 (arr!16337 (Array (_ BitVec 32) (_ BitVec 64))) (size!16701 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33996)

(declare-datatypes ((List!10456 0))(
  ( (Nil!10453) (Cons!10452 (h!11395 (_ BitVec 64)) (t!16684 List!10456)) )
))
(declare-fun arrayNoDuplicates!0 (array!33996 (_ BitVec 32) List!10456) Bool)

(assert (=> b!536769 (= res!331978 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10453))))

(declare-fun b!536770 () Bool)

(declare-fun res!331973 () Bool)

(assert (=> b!536770 (=> (not res!331973) (not e!311543))))

(declare-fun arrayContainsKey!0 (array!33996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536770 (= res!331973 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536771 () Bool)

(declare-fun res!331980 () Bool)

(declare-fun e!311540 () Bool)

(assert (=> b!536771 (=> (not res!331980) (not e!311540))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!536771 (= res!331980 (and (not (= (select (arr!16337 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16337 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16337 a!3154) index!1177) (select (arr!16337 a!3154) j!147)))))))

(declare-fun b!536772 () Bool)

(declare-fun res!331975 () Bool)

(assert (=> b!536772 (=> (not res!331975) (not e!311540))))

(declare-datatypes ((SeekEntryResult!4795 0))(
  ( (MissingZero!4795 (index!21404 (_ BitVec 32))) (Found!4795 (index!21405 (_ BitVec 32))) (Intermediate!4795 (undefined!5607 Bool) (index!21406 (_ BitVec 32)) (x!50338 (_ BitVec 32))) (Undefined!4795) (MissingVacant!4795 (index!21407 (_ BitVec 32))) )
))
(declare-fun lt!246199 () SeekEntryResult!4795)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33996 (_ BitVec 32)) SeekEntryResult!4795)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536772 (= res!331975 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16337 a!3154) j!147) mask!3216) (select (arr!16337 a!3154) j!147) a!3154 mask!3216) lt!246199))))

(declare-fun b!536773 () Bool)

(declare-fun res!331985 () Bool)

(assert (=> b!536773 (=> (not res!331985) (not e!311543))))

(assert (=> b!536773 (= res!331985 (validKeyInArray!0 (select (arr!16337 a!3154) j!147)))))

(declare-fun b!536774 () Bool)

(assert (=> b!536774 (= e!311543 e!311544)))

(declare-fun res!331974 () Bool)

(assert (=> b!536774 (=> (not res!331974) (not e!311544))))

(declare-fun lt!246198 () SeekEntryResult!4795)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536774 (= res!331974 (or (= lt!246198 (MissingZero!4795 i!1153)) (= lt!246198 (MissingVacant!4795 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33996 (_ BitVec 32)) SeekEntryResult!4795)

(assert (=> b!536774 (= lt!246198 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!331976 () Bool)

(assert (=> start!48784 (=> (not res!331976) (not e!311543))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48784 (= res!331976 (validMask!0 mask!3216))))

(assert (=> start!48784 e!311543))

(assert (=> start!48784 true))

(declare-fun array_inv!12133 (array!33996) Bool)

(assert (=> start!48784 (array_inv!12133 a!3154)))

(declare-fun b!536775 () Bool)

(declare-fun e!311541 () Bool)

(assert (=> b!536775 (= e!311540 e!311541)))

(declare-fun res!331983 () Bool)

(assert (=> b!536775 (=> (not res!331983) (not e!311541))))

(declare-fun lt!246197 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!536775 (= res!331983 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246197 #b00000000000000000000000000000000) (bvslt lt!246197 (size!16701 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536775 (= lt!246197 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536776 () Bool)

(assert (=> b!536776 (= e!311541 false)))

(declare-fun lt!246196 () SeekEntryResult!4795)

(assert (=> b!536776 (= lt!246196 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246197 (select (arr!16337 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536777 () Bool)

(declare-fun res!331979 () Bool)

(assert (=> b!536777 (=> (not res!331979) (not e!311543))))

(assert (=> b!536777 (= res!331979 (and (= (size!16701 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16701 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16701 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536778 () Bool)

(declare-fun res!331981 () Bool)

(assert (=> b!536778 (=> (not res!331981) (not e!311544))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536778 (= res!331981 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16701 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16701 a!3154)) (= (select (arr!16337 a!3154) resIndex!32) (select (arr!16337 a!3154) j!147))))))

(declare-fun b!536779 () Bool)

(assert (=> b!536779 (= e!311544 e!311540)))

(declare-fun res!331984 () Bool)

(assert (=> b!536779 (=> (not res!331984) (not e!311540))))

(assert (=> b!536779 (= res!331984 (= lt!246199 (Intermediate!4795 false resIndex!32 resX!32)))))

(assert (=> b!536779 (= lt!246199 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16337 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536780 () Bool)

(declare-fun res!331977 () Bool)

(assert (=> b!536780 (=> (not res!331977) (not e!311544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33996 (_ BitVec 32)) Bool)

(assert (=> b!536780 (= res!331977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48784 res!331976) b!536777))

(assert (= (and b!536777 res!331979) b!536773))

(assert (= (and b!536773 res!331985) b!536768))

(assert (= (and b!536768 res!331982) b!536770))

(assert (= (and b!536770 res!331973) b!536774))

(assert (= (and b!536774 res!331974) b!536780))

(assert (= (and b!536780 res!331977) b!536769))

(assert (= (and b!536769 res!331978) b!536778))

(assert (= (and b!536778 res!331981) b!536779))

(assert (= (and b!536779 res!331984) b!536772))

(assert (= (and b!536772 res!331975) b!536771))

(assert (= (and b!536771 res!331980) b!536775))

(assert (= (and b!536775 res!331983) b!536776))

(declare-fun m!516121 () Bool)

(assert (=> b!536780 m!516121))

(declare-fun m!516123 () Bool)

(assert (=> b!536770 m!516123))

(declare-fun m!516125 () Bool)

(assert (=> b!536779 m!516125))

(assert (=> b!536779 m!516125))

(declare-fun m!516127 () Bool)

(assert (=> b!536779 m!516127))

(assert (=> b!536776 m!516125))

(assert (=> b!536776 m!516125))

(declare-fun m!516129 () Bool)

(assert (=> b!536776 m!516129))

(assert (=> b!536772 m!516125))

(assert (=> b!536772 m!516125))

(declare-fun m!516131 () Bool)

(assert (=> b!536772 m!516131))

(assert (=> b!536772 m!516131))

(assert (=> b!536772 m!516125))

(declare-fun m!516133 () Bool)

(assert (=> b!536772 m!516133))

(declare-fun m!516135 () Bool)

(assert (=> b!536778 m!516135))

(assert (=> b!536778 m!516125))

(declare-fun m!516137 () Bool)

(assert (=> b!536774 m!516137))

(declare-fun m!516139 () Bool)

(assert (=> b!536769 m!516139))

(assert (=> b!536773 m!516125))

(assert (=> b!536773 m!516125))

(declare-fun m!516141 () Bool)

(assert (=> b!536773 m!516141))

(declare-fun m!516143 () Bool)

(assert (=> b!536771 m!516143))

(assert (=> b!536771 m!516125))

(declare-fun m!516145 () Bool)

(assert (=> b!536768 m!516145))

(declare-fun m!516147 () Bool)

(assert (=> start!48784 m!516147))

(declare-fun m!516149 () Bool)

(assert (=> start!48784 m!516149))

(declare-fun m!516151 () Bool)

(assert (=> b!536775 m!516151))

(push 1)

(assert (not b!536776))

(assert (not b!536775))

(assert (not b!536769))

(assert (not b!536770))

(assert (not start!48784))

(assert (not b!536768))

(assert (not b!536780))

