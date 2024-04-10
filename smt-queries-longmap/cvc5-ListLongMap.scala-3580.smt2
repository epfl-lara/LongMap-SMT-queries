; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49266 () Bool)

(assert start!49266)

(declare-fun b!542286 () Bool)

(declare-fun res!336843 () Bool)

(declare-fun e!313915 () Bool)

(assert (=> b!542286 (=> (not res!336843) (not e!313915))))

(declare-datatypes ((array!34274 0))(
  ( (array!34275 (arr!16470 (Array (_ BitVec 32) (_ BitVec 64))) (size!16834 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34274)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34274 (_ BitVec 32)) Bool)

(assert (=> b!542286 (= res!336843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!542287 () Bool)

(declare-fun e!313917 () Bool)

(assert (=> b!542287 (= e!313915 e!313917)))

(declare-fun res!336845 () Bool)

(assert (=> b!542287 (=> (not res!336845) (not e!313917))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4928 0))(
  ( (MissingZero!4928 (index!21936 (_ BitVec 32))) (Found!4928 (index!21937 (_ BitVec 32))) (Intermediate!4928 (undefined!5740 Bool) (index!21938 (_ BitVec 32)) (x!50855 (_ BitVec 32))) (Undefined!4928) (MissingVacant!4928 (index!21939 (_ BitVec 32))) )
))
(declare-fun lt!247885 () SeekEntryResult!4928)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542287 (= res!336845 (= lt!247885 (Intermediate!4928 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34274 (_ BitVec 32)) SeekEntryResult!4928)

(assert (=> b!542287 (= lt!247885 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16470 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542288 () Bool)

(declare-fun res!336847 () Bool)

(assert (=> b!542288 (=> (not res!336847) (not e!313915))))

(declare-datatypes ((List!10589 0))(
  ( (Nil!10586) (Cons!10585 (h!11540 (_ BitVec 64)) (t!16817 List!10589)) )
))
(declare-fun arrayNoDuplicates!0 (array!34274 (_ BitVec 32) List!10589) Bool)

(assert (=> b!542288 (= res!336847 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10586))))

(declare-fun b!542289 () Bool)

(declare-fun res!336846 () Bool)

(declare-fun e!313914 () Bool)

(assert (=> b!542289 (=> (not res!336846) (not e!313914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542289 (= res!336846 (validKeyInArray!0 (select (arr!16470 a!3154) j!147)))))

(declare-fun b!542290 () Bool)

(declare-fun res!336838 () Bool)

(assert (=> b!542290 (=> (not res!336838) (not e!313914))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34274 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542290 (= res!336838 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun res!336837 () Bool)

(assert (=> start!49266 (=> (not res!336837) (not e!313914))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49266 (= res!336837 (validMask!0 mask!3216))))

(assert (=> start!49266 e!313914))

(assert (=> start!49266 true))

(declare-fun array_inv!12266 (array!34274) Bool)

(assert (=> start!49266 (array_inv!12266 a!3154)))

(declare-fun b!542291 () Bool)

(assert (=> b!542291 (= e!313917 false)))

(declare-fun lt!247884 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542291 (= lt!247884 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542292 () Bool)

(assert (=> b!542292 (= e!313914 e!313915)))

(declare-fun res!336839 () Bool)

(assert (=> b!542292 (=> (not res!336839) (not e!313915))))

(declare-fun lt!247883 () SeekEntryResult!4928)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542292 (= res!336839 (or (= lt!247883 (MissingZero!4928 i!1153)) (= lt!247883 (MissingVacant!4928 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34274 (_ BitVec 32)) SeekEntryResult!4928)

(assert (=> b!542292 (= lt!247883 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542293 () Bool)

(declare-fun res!336848 () Bool)

(assert (=> b!542293 (=> (not res!336848) (not e!313914))))

(assert (=> b!542293 (= res!336848 (and (= (size!16834 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16834 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16834 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542294 () Bool)

(declare-fun res!336840 () Bool)

(assert (=> b!542294 (=> (not res!336840) (not e!313915))))

(assert (=> b!542294 (= res!336840 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16834 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16834 a!3154)) (= (select (arr!16470 a!3154) resIndex!32) (select (arr!16470 a!3154) j!147))))))

(declare-fun b!542295 () Bool)

(declare-fun res!336841 () Bool)

(assert (=> b!542295 (=> (not res!336841) (not e!313917))))

(assert (=> b!542295 (= res!336841 (and (not (= (select (arr!16470 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16470 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16470 a!3154) index!1177) (select (arr!16470 a!3154) j!147)))))))

(declare-fun b!542296 () Bool)

(declare-fun res!336844 () Bool)

(assert (=> b!542296 (=> (not res!336844) (not e!313914))))

(assert (=> b!542296 (= res!336844 (validKeyInArray!0 k!1998))))

(declare-fun b!542297 () Bool)

(declare-fun res!336842 () Bool)

(assert (=> b!542297 (=> (not res!336842) (not e!313917))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542297 (= res!336842 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16470 a!3154) j!147) mask!3216) (select (arr!16470 a!3154) j!147) a!3154 mask!3216) lt!247885))))

(assert (= (and start!49266 res!336837) b!542293))

(assert (= (and b!542293 res!336848) b!542289))

(assert (= (and b!542289 res!336846) b!542296))

(assert (= (and b!542296 res!336844) b!542290))

(assert (= (and b!542290 res!336838) b!542292))

(assert (= (and b!542292 res!336839) b!542286))

(assert (= (and b!542286 res!336843) b!542288))

(assert (= (and b!542288 res!336847) b!542294))

(assert (= (and b!542294 res!336840) b!542287))

(assert (= (and b!542287 res!336845) b!542297))

(assert (= (and b!542297 res!336842) b!542295))

(assert (= (and b!542295 res!336841) b!542291))

(declare-fun m!520569 () Bool)

(assert (=> b!542291 m!520569))

(declare-fun m!520571 () Bool)

(assert (=> b!542290 m!520571))

(declare-fun m!520573 () Bool)

(assert (=> b!542297 m!520573))

(assert (=> b!542297 m!520573))

(declare-fun m!520575 () Bool)

(assert (=> b!542297 m!520575))

(assert (=> b!542297 m!520575))

(assert (=> b!542297 m!520573))

(declare-fun m!520577 () Bool)

(assert (=> b!542297 m!520577))

(declare-fun m!520579 () Bool)

(assert (=> b!542296 m!520579))

(declare-fun m!520581 () Bool)

(assert (=> b!542294 m!520581))

(assert (=> b!542294 m!520573))

(declare-fun m!520583 () Bool)

(assert (=> b!542286 m!520583))

(declare-fun m!520585 () Bool)

(assert (=> b!542288 m!520585))

(assert (=> b!542289 m!520573))

(assert (=> b!542289 m!520573))

(declare-fun m!520587 () Bool)

(assert (=> b!542289 m!520587))

(declare-fun m!520589 () Bool)

(assert (=> b!542292 m!520589))

(assert (=> b!542287 m!520573))

(assert (=> b!542287 m!520573))

(declare-fun m!520591 () Bool)

(assert (=> b!542287 m!520591))

(declare-fun m!520593 () Bool)

(assert (=> start!49266 m!520593))

(declare-fun m!520595 () Bool)

(assert (=> start!49266 m!520595))

(declare-fun m!520597 () Bool)

(assert (=> b!542295 m!520597))

(assert (=> b!542295 m!520573))

(push 1)

