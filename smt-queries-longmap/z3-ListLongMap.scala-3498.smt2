; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48546 () Bool)

(assert start!48546)

(declare-fun b!532822 () Bool)

(declare-fun res!328175 () Bool)

(declare-fun e!310126 () Bool)

(assert (=> b!532822 (=> (not res!328175) (not e!310126))))

(declare-datatypes ((array!33768 0))(
  ( (array!33769 (arr!16223 (Array (_ BitVec 32) (_ BitVec 64))) (size!16588 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33768)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33768 (_ BitVec 32)) Bool)

(assert (=> b!532822 (= res!328175 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532823 () Bool)

(declare-fun res!328173 () Bool)

(assert (=> b!532823 (=> (not res!328173) (not e!310126))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4678 0))(
  ( (MissingZero!4678 (index!20936 (_ BitVec 32))) (Found!4678 (index!20937 (_ BitVec 32))) (Intermediate!4678 (undefined!5490 Bool) (index!20938 (_ BitVec 32)) (x!49920 (_ BitVec 32))) (Undefined!4678) (MissingVacant!4678 (index!20939 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33768 (_ BitVec 32)) SeekEntryResult!4678)

(assert (=> b!532823 (= res!328173 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16223 a!3154) j!147) a!3154 mask!3216) (Intermediate!4678 false resIndex!32 resX!32)))))

(declare-fun b!532824 () Bool)

(declare-fun res!328174 () Bool)

(assert (=> b!532824 (=> (not res!328174) (not e!310126))))

(declare-datatypes ((List!10381 0))(
  ( (Nil!10378) (Cons!10377 (h!11320 (_ BitVec 64)) (t!16600 List!10381)) )
))
(declare-fun arrayNoDuplicates!0 (array!33768 (_ BitVec 32) List!10381) Bool)

(assert (=> b!532824 (= res!328174 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10378))))

(declare-fun res!328169 () Bool)

(declare-fun e!310128 () Bool)

(assert (=> start!48546 (=> (not res!328169) (not e!310128))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48546 (= res!328169 (validMask!0 mask!3216))))

(assert (=> start!48546 e!310128))

(assert (=> start!48546 true))

(declare-fun array_inv!12106 (array!33768) Bool)

(assert (=> start!48546 (array_inv!12106 a!3154)))

(declare-fun b!532825 () Bool)

(assert (=> b!532825 (= e!310126 false)))

(declare-fun lt!245152 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532825 (= lt!245152 (toIndex!0 (select (arr!16223 a!3154) j!147) mask!3216))))

(declare-fun b!532826 () Bool)

(declare-fun res!328171 () Bool)

(assert (=> b!532826 (=> (not res!328171) (not e!310128))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33768 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532826 (= res!328171 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532827 () Bool)

(declare-fun res!328176 () Bool)

(assert (=> b!532827 (=> (not res!328176) (not e!310128))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532827 (= res!328176 (validKeyInArray!0 k0!1998))))

(declare-fun b!532828 () Bool)

(assert (=> b!532828 (= e!310128 e!310126)))

(declare-fun res!328172 () Bool)

(assert (=> b!532828 (=> (not res!328172) (not e!310126))))

(declare-fun lt!245151 () SeekEntryResult!4678)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532828 (= res!328172 (or (= lt!245151 (MissingZero!4678 i!1153)) (= lt!245151 (MissingVacant!4678 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33768 (_ BitVec 32)) SeekEntryResult!4678)

(assert (=> b!532828 (= lt!245151 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!532829 () Bool)

(declare-fun res!328178 () Bool)

(assert (=> b!532829 (=> (not res!328178) (not e!310128))))

(assert (=> b!532829 (= res!328178 (and (= (size!16588 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16588 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16588 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532830 () Bool)

(declare-fun res!328177 () Bool)

(assert (=> b!532830 (=> (not res!328177) (not e!310126))))

(assert (=> b!532830 (= res!328177 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16588 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16588 a!3154)) (= (select (arr!16223 a!3154) resIndex!32) (select (arr!16223 a!3154) j!147))))))

(declare-fun b!532831 () Bool)

(declare-fun res!328170 () Bool)

(assert (=> b!532831 (=> (not res!328170) (not e!310128))))

(assert (=> b!532831 (= res!328170 (validKeyInArray!0 (select (arr!16223 a!3154) j!147)))))

(assert (= (and start!48546 res!328169) b!532829))

(assert (= (and b!532829 res!328178) b!532831))

(assert (= (and b!532831 res!328170) b!532827))

(assert (= (and b!532827 res!328176) b!532826))

(assert (= (and b!532826 res!328171) b!532828))

(assert (= (and b!532828 res!328172) b!532822))

(assert (= (and b!532822 res!328175) b!532824))

(assert (= (and b!532824 res!328174) b!532830))

(assert (= (and b!532830 res!328177) b!532823))

(assert (= (and b!532823 res!328173) b!532825))

(declare-fun m!512293 () Bool)

(assert (=> b!532830 m!512293))

(declare-fun m!512295 () Bool)

(assert (=> b!532830 m!512295))

(declare-fun m!512297 () Bool)

(assert (=> start!48546 m!512297))

(declare-fun m!512299 () Bool)

(assert (=> start!48546 m!512299))

(declare-fun m!512301 () Bool)

(assert (=> b!532828 m!512301))

(declare-fun m!512303 () Bool)

(assert (=> b!532824 m!512303))

(declare-fun m!512305 () Bool)

(assert (=> b!532826 m!512305))

(assert (=> b!532823 m!512295))

(assert (=> b!532823 m!512295))

(declare-fun m!512307 () Bool)

(assert (=> b!532823 m!512307))

(assert (=> b!532831 m!512295))

(assert (=> b!532831 m!512295))

(declare-fun m!512309 () Bool)

(assert (=> b!532831 m!512309))

(declare-fun m!512311 () Bool)

(assert (=> b!532822 m!512311))

(assert (=> b!532825 m!512295))

(assert (=> b!532825 m!512295))

(declare-fun m!512313 () Bool)

(assert (=> b!532825 m!512313))

(declare-fun m!512315 () Bool)

(assert (=> b!532827 m!512315))

(check-sat (not b!532822) (not b!532826) (not b!532824) (not b!532828) (not b!532831) (not start!48546) (not b!532825) (not b!532827) (not b!532823))
(check-sat)
