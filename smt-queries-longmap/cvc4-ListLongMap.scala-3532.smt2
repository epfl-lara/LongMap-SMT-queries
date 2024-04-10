; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48766 () Bool)

(assert start!48766)

(declare-fun b!536417 () Bool)

(declare-fun res!331631 () Bool)

(declare-fun e!311409 () Bool)

(assert (=> b!536417 (=> (not res!331631) (not e!311409))))

(declare-datatypes ((array!33978 0))(
  ( (array!33979 (arr!16328 (Array (_ BitVec 32) (_ BitVec 64))) (size!16692 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33978)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33978 (_ BitVec 32)) Bool)

(assert (=> b!536417 (= res!331631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536418 () Bool)

(declare-fun res!331624 () Bool)

(assert (=> b!536418 (=> (not res!331624) (not e!311409))))

(declare-datatypes ((List!10447 0))(
  ( (Nil!10444) (Cons!10443 (h!11386 (_ BitVec 64)) (t!16675 List!10447)) )
))
(declare-fun arrayNoDuplicates!0 (array!33978 (_ BitVec 32) List!10447) Bool)

(assert (=> b!536418 (= res!331624 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10444))))

(declare-fun b!536419 () Bool)

(declare-fun res!331634 () Bool)

(declare-fun e!311408 () Bool)

(assert (=> b!536419 (=> (not res!331634) (not e!311408))))

(declare-datatypes ((SeekEntryResult!4786 0))(
  ( (MissingZero!4786 (index!21368 (_ BitVec 32))) (Found!4786 (index!21369 (_ BitVec 32))) (Intermediate!4786 (undefined!5598 Bool) (index!21370 (_ BitVec 32)) (x!50305 (_ BitVec 32))) (Undefined!4786) (MissingVacant!4786 (index!21371 (_ BitVec 32))) )
))
(declare-fun lt!246090 () SeekEntryResult!4786)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33978 (_ BitVec 32)) SeekEntryResult!4786)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536419 (= res!331634 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16328 a!3154) j!147) mask!3216) (select (arr!16328 a!3154) j!147) a!3154 mask!3216) lt!246090))))

(declare-fun res!331628 () Bool)

(declare-fun e!311407 () Bool)

(assert (=> start!48766 (=> (not res!331628) (not e!311407))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48766 (= res!331628 (validMask!0 mask!3216))))

(assert (=> start!48766 e!311407))

(assert (=> start!48766 true))

(declare-fun array_inv!12124 (array!33978) Bool)

(assert (=> start!48766 (array_inv!12124 a!3154)))

(declare-fun b!536420 () Bool)

(declare-fun res!331632 () Bool)

(assert (=> b!536420 (=> (not res!331632) (not e!311409))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536420 (= res!331632 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16692 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16692 a!3154)) (= (select (arr!16328 a!3154) resIndex!32) (select (arr!16328 a!3154) j!147))))))

(declare-fun b!536421 () Bool)

(declare-fun res!331633 () Bool)

(assert (=> b!536421 (=> (not res!331633) (not e!311407))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536421 (= res!331633 (validKeyInArray!0 (select (arr!16328 a!3154) j!147)))))

(declare-fun b!536422 () Bool)

(declare-fun e!311406 () Bool)

(assert (=> b!536422 (= e!311408 e!311406)))

(declare-fun res!331625 () Bool)

(assert (=> b!536422 (=> (not res!331625) (not e!311406))))

(declare-fun lt!246088 () (_ BitVec 32))

(assert (=> b!536422 (= res!331625 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246088 #b00000000000000000000000000000000) (bvslt lt!246088 (size!16692 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536422 (= lt!246088 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536423 () Bool)

(assert (=> b!536423 (= e!311409 e!311408)))

(declare-fun res!331626 () Bool)

(assert (=> b!536423 (=> (not res!331626) (not e!311408))))

(assert (=> b!536423 (= res!331626 (= lt!246090 (Intermediate!4786 false resIndex!32 resX!32)))))

(assert (=> b!536423 (= lt!246090 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16328 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536424 () Bool)

(declare-fun res!331623 () Bool)

(assert (=> b!536424 (=> (not res!331623) (not e!311407))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!536424 (= res!331623 (validKeyInArray!0 k!1998))))

(declare-fun b!536425 () Bool)

(assert (=> b!536425 (= e!311406 false)))

(declare-fun lt!246089 () SeekEntryResult!4786)

(assert (=> b!536425 (= lt!246089 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246088 (select (arr!16328 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536426 () Bool)

(assert (=> b!536426 (= e!311407 e!311409)))

(declare-fun res!331630 () Bool)

(assert (=> b!536426 (=> (not res!331630) (not e!311409))))

(declare-fun lt!246091 () SeekEntryResult!4786)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536426 (= res!331630 (or (= lt!246091 (MissingZero!4786 i!1153)) (= lt!246091 (MissingVacant!4786 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33978 (_ BitVec 32)) SeekEntryResult!4786)

(assert (=> b!536426 (= lt!246091 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536427 () Bool)

(declare-fun res!331629 () Bool)

(assert (=> b!536427 (=> (not res!331629) (not e!311407))))

(assert (=> b!536427 (= res!331629 (and (= (size!16692 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16692 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16692 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536428 () Bool)

(declare-fun res!331627 () Bool)

(assert (=> b!536428 (=> (not res!331627) (not e!311408))))

(assert (=> b!536428 (= res!331627 (and (not (= (select (arr!16328 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16328 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16328 a!3154) index!1177) (select (arr!16328 a!3154) j!147)))))))

(declare-fun b!536429 () Bool)

(declare-fun res!331622 () Bool)

(assert (=> b!536429 (=> (not res!331622) (not e!311407))))

(declare-fun arrayContainsKey!0 (array!33978 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536429 (= res!331622 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48766 res!331628) b!536427))

(assert (= (and b!536427 res!331629) b!536421))

(assert (= (and b!536421 res!331633) b!536424))

(assert (= (and b!536424 res!331623) b!536429))

(assert (= (and b!536429 res!331622) b!536426))

(assert (= (and b!536426 res!331630) b!536417))

(assert (= (and b!536417 res!331631) b!536418))

(assert (= (and b!536418 res!331624) b!536420))

(assert (= (and b!536420 res!331632) b!536423))

(assert (= (and b!536423 res!331626) b!536419))

(assert (= (and b!536419 res!331634) b!536428))

(assert (= (and b!536428 res!331627) b!536422))

(assert (= (and b!536422 res!331625) b!536425))

(declare-fun m!515833 () Bool)

(assert (=> b!536425 m!515833))

(assert (=> b!536425 m!515833))

(declare-fun m!515835 () Bool)

(assert (=> b!536425 m!515835))

(declare-fun m!515837 () Bool)

(assert (=> b!536428 m!515837))

(assert (=> b!536428 m!515833))

(declare-fun m!515839 () Bool)

(assert (=> b!536418 m!515839))

(assert (=> b!536421 m!515833))

(assert (=> b!536421 m!515833))

(declare-fun m!515841 () Bool)

(assert (=> b!536421 m!515841))

(declare-fun m!515843 () Bool)

(assert (=> b!536422 m!515843))

(declare-fun m!515845 () Bool)

(assert (=> b!536429 m!515845))

(assert (=> b!536419 m!515833))

(assert (=> b!536419 m!515833))

(declare-fun m!515847 () Bool)

(assert (=> b!536419 m!515847))

(assert (=> b!536419 m!515847))

(assert (=> b!536419 m!515833))

(declare-fun m!515849 () Bool)

(assert (=> b!536419 m!515849))

(declare-fun m!515851 () Bool)

(assert (=> b!536426 m!515851))

(declare-fun m!515853 () Bool)

(assert (=> b!536424 m!515853))

(declare-fun m!515855 () Bool)

(assert (=> b!536420 m!515855))

(assert (=> b!536420 m!515833))

(declare-fun m!515857 () Bool)

(assert (=> start!48766 m!515857))

(declare-fun m!515859 () Bool)

(assert (=> start!48766 m!515859))

(assert (=> b!536423 m!515833))

(assert (=> b!536423 m!515833))

(declare-fun m!515861 () Bool)

(assert (=> b!536423 m!515861))

(declare-fun m!515863 () Bool)

(assert (=> b!536417 m!515863))

(push 1)

(assert (not start!48766))

(assert (not b!536421))

(assert (not b!536426))

(assert (not b!536418))

(assert (not b!536424))

(assert (not b!536419))

(assert (not b!536425))

(assert (not b!536422))

