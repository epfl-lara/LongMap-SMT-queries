; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48410 () Bool)

(assert start!48410)

(declare-fun b!531947 () Bool)

(declare-fun res!327438 () Bool)

(declare-fun e!309788 () Bool)

(assert (=> b!531947 (=> (not res!327438) (not e!309788))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33718 0))(
  ( (array!33719 (arr!16201 (Array (_ BitVec 32) (_ BitVec 64))) (size!16565 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33718)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531947 (= res!327438 (and (= (size!16565 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16565 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16565 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531949 () Bool)

(declare-fun res!327439 () Bool)

(assert (=> b!531949 (=> (not res!327439) (not e!309788))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531949 (= res!327439 (validKeyInArray!0 (select (arr!16201 a!3154) j!147)))))

(declare-fun b!531950 () Bool)

(declare-fun res!327442 () Bool)

(assert (=> b!531950 (=> (not res!327442) (not e!309788))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33718 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531950 (= res!327442 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531951 () Bool)

(declare-fun e!309789 () Bool)

(assert (=> b!531951 (= e!309789 false)))

(declare-fun lt!245103 () Bool)

(declare-datatypes ((List!10320 0))(
  ( (Nil!10317) (Cons!10316 (h!11256 (_ BitVec 64)) (t!16548 List!10320)) )
))
(declare-fun arrayNoDuplicates!0 (array!33718 (_ BitVec 32) List!10320) Bool)

(assert (=> b!531951 (= lt!245103 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10317))))

(declare-fun b!531952 () Bool)

(declare-fun res!327440 () Bool)

(assert (=> b!531952 (=> (not res!327440) (not e!309788))))

(assert (=> b!531952 (= res!327440 (validKeyInArray!0 k0!1998))))

(declare-fun b!531953 () Bool)

(declare-fun res!327441 () Bool)

(assert (=> b!531953 (=> (not res!327441) (not e!309789))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33718 (_ BitVec 32)) Bool)

(assert (=> b!531953 (= res!327441 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!327443 () Bool)

(assert (=> start!48410 (=> (not res!327443) (not e!309788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48410 (= res!327443 (validMask!0 mask!3216))))

(assert (=> start!48410 e!309788))

(assert (=> start!48410 true))

(declare-fun array_inv!11997 (array!33718) Bool)

(assert (=> start!48410 (array_inv!11997 a!3154)))

(declare-fun b!531948 () Bool)

(assert (=> b!531948 (= e!309788 e!309789)))

(declare-fun res!327437 () Bool)

(assert (=> b!531948 (=> (not res!327437) (not e!309789))))

(declare-datatypes ((SeekEntryResult!4659 0))(
  ( (MissingZero!4659 (index!20860 (_ BitVec 32))) (Found!4659 (index!20861 (_ BitVec 32))) (Intermediate!4659 (undefined!5471 Bool) (index!20862 (_ BitVec 32)) (x!49833 (_ BitVec 32))) (Undefined!4659) (MissingVacant!4659 (index!20863 (_ BitVec 32))) )
))
(declare-fun lt!245104 () SeekEntryResult!4659)

(assert (=> b!531948 (= res!327437 (or (= lt!245104 (MissingZero!4659 i!1153)) (= lt!245104 (MissingVacant!4659 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33718 (_ BitVec 32)) SeekEntryResult!4659)

(assert (=> b!531948 (= lt!245104 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48410 res!327443) b!531947))

(assert (= (and b!531947 res!327438) b!531949))

(assert (= (and b!531949 res!327439) b!531952))

(assert (= (and b!531952 res!327440) b!531950))

(assert (= (and b!531950 res!327442) b!531948))

(assert (= (and b!531948 res!327437) b!531953))

(assert (= (and b!531953 res!327441) b!531951))

(declare-fun m!512277 () Bool)

(assert (=> b!531952 m!512277))

(declare-fun m!512279 () Bool)

(assert (=> b!531953 m!512279))

(declare-fun m!512281 () Bool)

(assert (=> start!48410 m!512281))

(declare-fun m!512283 () Bool)

(assert (=> start!48410 m!512283))

(declare-fun m!512285 () Bool)

(assert (=> b!531948 m!512285))

(declare-fun m!512287 () Bool)

(assert (=> b!531949 m!512287))

(assert (=> b!531949 m!512287))

(declare-fun m!512289 () Bool)

(assert (=> b!531949 m!512289))

(declare-fun m!512291 () Bool)

(assert (=> b!531951 m!512291))

(declare-fun m!512293 () Bool)

(assert (=> b!531950 m!512293))

(check-sat (not b!531948) (not start!48410) (not b!531949) (not b!531950) (not b!531951) (not b!531953) (not b!531952))
(check-sat)
