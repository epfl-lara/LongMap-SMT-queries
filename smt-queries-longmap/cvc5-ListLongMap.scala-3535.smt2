; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48780 () Bool)

(assert start!48780)

(declare-fun b!536690 () Bool)

(declare-fun res!331904 () Bool)

(declare-fun e!311511 () Bool)

(assert (=> b!536690 (=> (not res!331904) (not e!311511))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536690 (= res!331904 (validKeyInArray!0 k!1998))))

(declare-fun b!536691 () Bool)

(declare-fun e!311513 () Bool)

(declare-fun e!311510 () Bool)

(assert (=> b!536691 (= e!311513 e!311510)))

(declare-fun res!331897 () Bool)

(assert (=> b!536691 (=> (not res!331897) (not e!311510))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4793 0))(
  ( (MissingZero!4793 (index!21396 (_ BitVec 32))) (Found!4793 (index!21397 (_ BitVec 32))) (Intermediate!4793 (undefined!5605 Bool) (index!21398 (_ BitVec 32)) (x!50336 (_ BitVec 32))) (Undefined!4793) (MissingVacant!4793 (index!21399 (_ BitVec 32))) )
))
(declare-fun lt!246172 () SeekEntryResult!4793)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536691 (= res!331897 (= lt!246172 (Intermediate!4793 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33992 0))(
  ( (array!33993 (arr!16335 (Array (_ BitVec 32) (_ BitVec 64))) (size!16699 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33992)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33992 (_ BitVec 32)) SeekEntryResult!4793)

(assert (=> b!536691 (= lt!246172 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16335 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536692 () Bool)

(declare-fun res!331901 () Bool)

(assert (=> b!536692 (=> (not res!331901) (not e!311511))))

(assert (=> b!536692 (= res!331901 (validKeyInArray!0 (select (arr!16335 a!3154) j!147)))))

(declare-fun b!536693 () Bool)

(declare-fun res!331907 () Bool)

(assert (=> b!536693 (=> (not res!331907) (not e!311513))))

(assert (=> b!536693 (= res!331907 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16699 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16699 a!3154)) (= (select (arr!16335 a!3154) resIndex!32) (select (arr!16335 a!3154) j!147))))))

(declare-fun b!536694 () Bool)

(assert (=> b!536694 (= e!311511 e!311513)))

(declare-fun res!331905 () Bool)

(assert (=> b!536694 (=> (not res!331905) (not e!311513))))

(declare-fun lt!246174 () SeekEntryResult!4793)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536694 (= res!331905 (or (= lt!246174 (MissingZero!4793 i!1153)) (= lt!246174 (MissingVacant!4793 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33992 (_ BitVec 32)) SeekEntryResult!4793)

(assert (=> b!536694 (= lt!246174 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536696 () Bool)

(declare-fun e!311514 () Bool)

(assert (=> b!536696 (= e!311510 e!311514)))

(declare-fun res!331895 () Bool)

(assert (=> b!536696 (=> (not res!331895) (not e!311514))))

(declare-fun lt!246175 () (_ BitVec 32))

(assert (=> b!536696 (= res!331895 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246175 #b00000000000000000000000000000000) (bvslt lt!246175 (size!16699 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536696 (= lt!246175 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536697 () Bool)

(declare-fun res!331900 () Bool)

(assert (=> b!536697 (=> (not res!331900) (not e!311510))))

(assert (=> b!536697 (= res!331900 (and (not (= (select (arr!16335 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16335 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16335 a!3154) index!1177) (select (arr!16335 a!3154) j!147)))))))

(declare-fun b!536698 () Bool)

(declare-fun res!331899 () Bool)

(assert (=> b!536698 (=> (not res!331899) (not e!311513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33992 (_ BitVec 32)) Bool)

(assert (=> b!536698 (= res!331899 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536699 () Bool)

(declare-fun res!331896 () Bool)

(assert (=> b!536699 (=> (not res!331896) (not e!311513))))

(declare-datatypes ((List!10454 0))(
  ( (Nil!10451) (Cons!10450 (h!11393 (_ BitVec 64)) (t!16682 List!10454)) )
))
(declare-fun arrayNoDuplicates!0 (array!33992 (_ BitVec 32) List!10454) Bool)

(assert (=> b!536699 (= res!331896 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10451))))

(declare-fun b!536700 () Bool)

(assert (=> b!536700 (= e!311514 false)))

(declare-fun lt!246173 () SeekEntryResult!4793)

(assert (=> b!536700 (= lt!246173 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246175 (select (arr!16335 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536695 () Bool)

(declare-fun res!331902 () Bool)

(assert (=> b!536695 (=> (not res!331902) (not e!311511))))

(assert (=> b!536695 (= res!331902 (and (= (size!16699 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16699 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16699 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!331903 () Bool)

(assert (=> start!48780 (=> (not res!331903) (not e!311511))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48780 (= res!331903 (validMask!0 mask!3216))))

(assert (=> start!48780 e!311511))

(assert (=> start!48780 true))

(declare-fun array_inv!12131 (array!33992) Bool)

(assert (=> start!48780 (array_inv!12131 a!3154)))

(declare-fun b!536701 () Bool)

(declare-fun res!331906 () Bool)

(assert (=> b!536701 (=> (not res!331906) (not e!311510))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536701 (= res!331906 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16335 a!3154) j!147) mask!3216) (select (arr!16335 a!3154) j!147) a!3154 mask!3216) lt!246172))))

(declare-fun b!536702 () Bool)

(declare-fun res!331898 () Bool)

(assert (=> b!536702 (=> (not res!331898) (not e!311511))))

(declare-fun arrayContainsKey!0 (array!33992 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536702 (= res!331898 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48780 res!331903) b!536695))

(assert (= (and b!536695 res!331902) b!536692))

(assert (= (and b!536692 res!331901) b!536690))

(assert (= (and b!536690 res!331904) b!536702))

(assert (= (and b!536702 res!331898) b!536694))

(assert (= (and b!536694 res!331905) b!536698))

(assert (= (and b!536698 res!331899) b!536699))

(assert (= (and b!536699 res!331896) b!536693))

(assert (= (and b!536693 res!331907) b!536691))

(assert (= (and b!536691 res!331897) b!536701))

(assert (= (and b!536701 res!331906) b!536697))

(assert (= (and b!536697 res!331900) b!536696))

(assert (= (and b!536696 res!331895) b!536700))

(declare-fun m!516057 () Bool)

(assert (=> b!536700 m!516057))

(assert (=> b!536700 m!516057))

(declare-fun m!516059 () Bool)

(assert (=> b!536700 m!516059))

(declare-fun m!516061 () Bool)

(assert (=> b!536696 m!516061))

(declare-fun m!516063 () Bool)

(assert (=> b!536702 m!516063))

(declare-fun m!516065 () Bool)

(assert (=> b!536697 m!516065))

(assert (=> b!536697 m!516057))

(declare-fun m!516067 () Bool)

(assert (=> start!48780 m!516067))

(declare-fun m!516069 () Bool)

(assert (=> start!48780 m!516069))

(declare-fun m!516071 () Bool)

(assert (=> b!536690 m!516071))

(assert (=> b!536692 m!516057))

(assert (=> b!536692 m!516057))

(declare-fun m!516073 () Bool)

(assert (=> b!536692 m!516073))

(declare-fun m!516075 () Bool)

(assert (=> b!536699 m!516075))

(declare-fun m!516077 () Bool)

(assert (=> b!536693 m!516077))

(assert (=> b!536693 m!516057))

(declare-fun m!516079 () Bool)

(assert (=> b!536698 m!516079))

(declare-fun m!516081 () Bool)

(assert (=> b!536694 m!516081))

(assert (=> b!536691 m!516057))

(assert (=> b!536691 m!516057))

(declare-fun m!516083 () Bool)

(assert (=> b!536691 m!516083))

(assert (=> b!536701 m!516057))

(assert (=> b!536701 m!516057))

(declare-fun m!516085 () Bool)

(assert (=> b!536701 m!516085))

(assert (=> b!536701 m!516085))

(assert (=> b!536701 m!516057))

(declare-fun m!516087 () Bool)

(assert (=> b!536701 m!516087))

(push 1)

