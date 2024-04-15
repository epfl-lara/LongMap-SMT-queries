; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44436 () Bool)

(assert start!44436)

(declare-fun b!487871 () Bool)

(declare-fun res!291174 () Bool)

(declare-fun e!287016 () Bool)

(assert (=> b!487871 (=> (not res!291174) (not e!287016))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487871 (= res!291174 (validKeyInArray!0 k0!2280))))

(declare-fun b!487872 () Bool)

(declare-fun res!291180 () Bool)

(declare-fun e!287018 () Bool)

(assert (=> b!487872 (=> (not res!291180) (not e!287018))))

(declare-datatypes ((array!31601 0))(
  ( (array!31602 (arr!15191 (Array (_ BitVec 32) (_ BitVec 64))) (size!15556 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31601)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31601 (_ BitVec 32)) Bool)

(assert (=> b!487872 (= res!291180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!287019 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!487873 () Bool)

(declare-datatypes ((SeekEntryResult!3655 0))(
  ( (MissingZero!3655 (index!16799 (_ BitVec 32))) (Found!3655 (index!16800 (_ BitVec 32))) (Intermediate!3655 (undefined!4467 Bool) (index!16801 (_ BitVec 32)) (x!45929 (_ BitVec 32))) (Undefined!3655) (MissingVacant!3655 (index!16802 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31601 (_ BitVec 32)) SeekEntryResult!3655)

(assert (=> b!487873 (= e!287019 (= (seekEntryOrOpen!0 (select (arr!15191 a!3235) j!176) a!3235 mask!3524) (Found!3655 j!176)))))

(declare-fun b!487875 () Bool)

(declare-fun res!291182 () Bool)

(assert (=> b!487875 (=> (not res!291182) (not e!287016))))

(declare-fun arrayContainsKey!0 (array!31601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487875 (= res!291182 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487876 () Bool)

(assert (=> b!487876 (= e!287018 (not true))))

(declare-fun lt!220080 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487876 (= lt!220080 (toIndex!0 (select (arr!15191 a!3235) j!176) mask!3524))))

(assert (=> b!487876 e!287019))

(declare-fun res!291179 () Bool)

(assert (=> b!487876 (=> (not res!291179) (not e!287019))))

(assert (=> b!487876 (= res!291179 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14242 0))(
  ( (Unit!14243) )
))
(declare-fun lt!220079 () Unit!14242)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14242)

(assert (=> b!487876 (= lt!220079 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487877 () Bool)

(assert (=> b!487877 (= e!287016 e!287018)))

(declare-fun res!291176 () Bool)

(assert (=> b!487877 (=> (not res!291176) (not e!287018))))

(declare-fun lt!220081 () SeekEntryResult!3655)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487877 (= res!291176 (or (= lt!220081 (MissingZero!3655 i!1204)) (= lt!220081 (MissingVacant!3655 i!1204))))))

(assert (=> b!487877 (= lt!220081 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!487878 () Bool)

(declare-fun res!291177 () Bool)

(assert (=> b!487878 (=> (not res!291177) (not e!287018))))

(declare-datatypes ((List!9388 0))(
  ( (Nil!9385) (Cons!9384 (h!10243 (_ BitVec 64)) (t!15607 List!9388)) )
))
(declare-fun arrayNoDuplicates!0 (array!31601 (_ BitVec 32) List!9388) Bool)

(assert (=> b!487878 (= res!291177 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9385))))

(declare-fun b!487879 () Bool)

(declare-fun res!291175 () Bool)

(assert (=> b!487879 (=> (not res!291175) (not e!287016))))

(assert (=> b!487879 (= res!291175 (validKeyInArray!0 (select (arr!15191 a!3235) j!176)))))

(declare-fun res!291178 () Bool)

(assert (=> start!44436 (=> (not res!291178) (not e!287016))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44436 (= res!291178 (validMask!0 mask!3524))))

(assert (=> start!44436 e!287016))

(assert (=> start!44436 true))

(declare-fun array_inv!11074 (array!31601) Bool)

(assert (=> start!44436 (array_inv!11074 a!3235)))

(declare-fun b!487874 () Bool)

(declare-fun res!291181 () Bool)

(assert (=> b!487874 (=> (not res!291181) (not e!287016))))

(assert (=> b!487874 (= res!291181 (and (= (size!15556 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15556 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15556 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44436 res!291178) b!487874))

(assert (= (and b!487874 res!291181) b!487879))

(assert (= (and b!487879 res!291175) b!487871))

(assert (= (and b!487871 res!291174) b!487875))

(assert (= (and b!487875 res!291182) b!487877))

(assert (= (and b!487877 res!291176) b!487872))

(assert (= (and b!487872 res!291180) b!487878))

(assert (= (and b!487878 res!291177) b!487876))

(assert (= (and b!487876 res!291179) b!487873))

(declare-fun m!467143 () Bool)

(assert (=> b!487872 m!467143))

(declare-fun m!467145 () Bool)

(assert (=> start!44436 m!467145))

(declare-fun m!467147 () Bool)

(assert (=> start!44436 m!467147))

(declare-fun m!467149 () Bool)

(assert (=> b!487879 m!467149))

(assert (=> b!487879 m!467149))

(declare-fun m!467151 () Bool)

(assert (=> b!487879 m!467151))

(declare-fun m!467153 () Bool)

(assert (=> b!487875 m!467153))

(assert (=> b!487876 m!467149))

(assert (=> b!487876 m!467149))

(declare-fun m!467155 () Bool)

(assert (=> b!487876 m!467155))

(declare-fun m!467157 () Bool)

(assert (=> b!487876 m!467157))

(declare-fun m!467159 () Bool)

(assert (=> b!487876 m!467159))

(declare-fun m!467161 () Bool)

(assert (=> b!487878 m!467161))

(assert (=> b!487873 m!467149))

(assert (=> b!487873 m!467149))

(declare-fun m!467163 () Bool)

(assert (=> b!487873 m!467163))

(declare-fun m!467165 () Bool)

(assert (=> b!487877 m!467165))

(declare-fun m!467167 () Bool)

(assert (=> b!487871 m!467167))

(check-sat (not start!44436) (not b!487879) (not b!487872) (not b!487876) (not b!487878) (not b!487873) (not b!487875) (not b!487877) (not b!487871))
(check-sat)
