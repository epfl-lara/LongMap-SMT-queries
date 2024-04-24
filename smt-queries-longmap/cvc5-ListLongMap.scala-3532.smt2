; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48812 () Bool)

(assert start!48812)

(declare-fun b!536617 () Bool)

(declare-fun res!331717 () Bool)

(declare-fun e!311538 () Bool)

(assert (=> b!536617 (=> (not res!331717) (not e!311538))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4737 0))(
  ( (MissingZero!4737 (index!21172 (_ BitVec 32))) (Found!4737 (index!21173 (_ BitVec 32))) (Intermediate!4737 (undefined!5549 Bool) (index!21174 (_ BitVec 32)) (x!50259 (_ BitVec 32))) (Undefined!4737) (MissingVacant!4737 (index!21175 (_ BitVec 32))) )
))
(declare-fun lt!246197 () SeekEntryResult!4737)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33972 0))(
  ( (array!33973 (arr!16323 (Array (_ BitVec 32) (_ BitVec 64))) (size!16687 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33972)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33972 (_ BitVec 32)) SeekEntryResult!4737)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536617 (= res!331717 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16323 a!3154) j!147) mask!3216) (select (arr!16323 a!3154) j!147) a!3154 mask!3216) lt!246197))))

(declare-fun b!536618 () Bool)

(declare-fun res!331723 () Bool)

(declare-fun e!311536 () Bool)

(assert (=> b!536618 (=> (not res!331723) (not e!311536))))

(declare-datatypes ((List!10349 0))(
  ( (Nil!10346) (Cons!10345 (h!11291 (_ BitVec 64)) (t!16569 List!10349)) )
))
(declare-fun arrayNoDuplicates!0 (array!33972 (_ BitVec 32) List!10349) Bool)

(assert (=> b!536618 (= res!331723 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10346))))

(declare-fun b!536619 () Bool)

(declare-fun e!311535 () Bool)

(assert (=> b!536619 (= e!311535 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246198 () SeekEntryResult!4737)

(declare-fun lt!246199 () (_ BitVec 32))

(assert (=> b!536619 (= lt!246198 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246199 (select (arr!16323 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!331724 () Bool)

(declare-fun e!311534 () Bool)

(assert (=> start!48812 (=> (not res!331724) (not e!311534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48812 (= res!331724 (validMask!0 mask!3216))))

(assert (=> start!48812 e!311534))

(assert (=> start!48812 true))

(declare-fun array_inv!12182 (array!33972) Bool)

(assert (=> start!48812 (array_inv!12182 a!3154)))

(declare-fun b!536620 () Bool)

(assert (=> b!536620 (= e!311534 e!311536)))

(declare-fun res!331728 () Bool)

(assert (=> b!536620 (=> (not res!331728) (not e!311536))))

(declare-fun lt!246196 () SeekEntryResult!4737)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536620 (= res!331728 (or (= lt!246196 (MissingZero!4737 i!1153)) (= lt!246196 (MissingVacant!4737 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33972 (_ BitVec 32)) SeekEntryResult!4737)

(assert (=> b!536620 (= lt!246196 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536621 () Bool)

(declare-fun res!331718 () Bool)

(assert (=> b!536621 (=> (not res!331718) (not e!311534))))

(declare-fun arrayContainsKey!0 (array!33972 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536621 (= res!331718 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536622 () Bool)

(declare-fun res!331727 () Bool)

(assert (=> b!536622 (=> (not res!331727) (not e!311534))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536622 (= res!331727 (validKeyInArray!0 (select (arr!16323 a!3154) j!147)))))

(declare-fun b!536623 () Bool)

(declare-fun res!331719 () Bool)

(assert (=> b!536623 (=> (not res!331719) (not e!311538))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536623 (= res!331719 (and (not (= (select (arr!16323 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16323 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16323 a!3154) index!1177) (select (arr!16323 a!3154) j!147)))))))

(declare-fun b!536624 () Bool)

(declare-fun res!331721 () Bool)

(assert (=> b!536624 (=> (not res!331721) (not e!311536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33972 (_ BitVec 32)) Bool)

(assert (=> b!536624 (= res!331721 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536625 () Bool)

(assert (=> b!536625 (= e!311536 e!311538)))

(declare-fun res!331729 () Bool)

(assert (=> b!536625 (=> (not res!331729) (not e!311538))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536625 (= res!331729 (= lt!246197 (Intermediate!4737 false resIndex!32 resX!32)))))

(assert (=> b!536625 (= lt!246197 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16323 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536626 () Bool)

(declare-fun res!331725 () Bool)

(assert (=> b!536626 (=> (not res!331725) (not e!311534))))

(assert (=> b!536626 (= res!331725 (and (= (size!16687 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16687 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16687 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536627 () Bool)

(declare-fun res!331720 () Bool)

(assert (=> b!536627 (=> (not res!331720) (not e!311534))))

(assert (=> b!536627 (= res!331720 (validKeyInArray!0 k!1998))))

(declare-fun b!536628 () Bool)

(assert (=> b!536628 (= e!311538 e!311535)))

(declare-fun res!331722 () Bool)

(assert (=> b!536628 (=> (not res!331722) (not e!311535))))

(assert (=> b!536628 (= res!331722 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246199 #b00000000000000000000000000000000) (bvslt lt!246199 (size!16687 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536628 (= lt!246199 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!536629 () Bool)

(declare-fun res!331726 () Bool)

(assert (=> b!536629 (=> (not res!331726) (not e!311536))))

(assert (=> b!536629 (= res!331726 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16687 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16687 a!3154)) (= (select (arr!16323 a!3154) resIndex!32) (select (arr!16323 a!3154) j!147))))))

(assert (= (and start!48812 res!331724) b!536626))

(assert (= (and b!536626 res!331725) b!536622))

(assert (= (and b!536622 res!331727) b!536627))

(assert (= (and b!536627 res!331720) b!536621))

(assert (= (and b!536621 res!331718) b!536620))

(assert (= (and b!536620 res!331728) b!536624))

(assert (= (and b!536624 res!331721) b!536618))

(assert (= (and b!536618 res!331723) b!536629))

(assert (= (and b!536629 res!331726) b!536625))

(assert (= (and b!536625 res!331729) b!536617))

(assert (= (and b!536617 res!331717) b!536623))

(assert (= (and b!536623 res!331719) b!536628))

(assert (= (and b!536628 res!331722) b!536619))

(declare-fun m!516155 () Bool)

(assert (=> b!536617 m!516155))

(assert (=> b!536617 m!516155))

(declare-fun m!516157 () Bool)

(assert (=> b!536617 m!516157))

(assert (=> b!536617 m!516157))

(assert (=> b!536617 m!516155))

(declare-fun m!516159 () Bool)

(assert (=> b!536617 m!516159))

(declare-fun m!516161 () Bool)

(assert (=> start!48812 m!516161))

(declare-fun m!516163 () Bool)

(assert (=> start!48812 m!516163))

(declare-fun m!516165 () Bool)

(assert (=> b!536628 m!516165))

(assert (=> b!536622 m!516155))

(assert (=> b!536622 m!516155))

(declare-fun m!516167 () Bool)

(assert (=> b!536622 m!516167))

(declare-fun m!516169 () Bool)

(assert (=> b!536624 m!516169))

(declare-fun m!516171 () Bool)

(assert (=> b!536627 m!516171))

(declare-fun m!516173 () Bool)

(assert (=> b!536623 m!516173))

(assert (=> b!536623 m!516155))

(declare-fun m!516175 () Bool)

(assert (=> b!536620 m!516175))

(declare-fun m!516177 () Bool)

(assert (=> b!536618 m!516177))

(assert (=> b!536625 m!516155))

(assert (=> b!536625 m!516155))

(declare-fun m!516179 () Bool)

(assert (=> b!536625 m!516179))

(declare-fun m!516181 () Bool)

(assert (=> b!536621 m!516181))

(assert (=> b!536619 m!516155))

(assert (=> b!536619 m!516155))

(declare-fun m!516183 () Bool)

(assert (=> b!536619 m!516183))

(declare-fun m!516185 () Bool)

(assert (=> b!536629 m!516185))

(assert (=> b!536629 m!516155))

(push 1)

(assert (not b!536618))

(assert (not b!536627))

(assert (not b!536619))

(assert (not b!536625))

(assert (not b!536617))

(assert (not b!536628))

(assert (not b!536621))

(assert (not b!536624))

(assert (not start!48812))

(assert (not b!536622))

(assert (not b!536620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

