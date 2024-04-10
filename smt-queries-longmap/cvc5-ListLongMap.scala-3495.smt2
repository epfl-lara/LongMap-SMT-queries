; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48486 () Bool)

(assert start!48486)

(declare-fun b!532589 () Bool)

(declare-fun res!327935 () Bool)

(declare-fun e!310067 () Bool)

(assert (=> b!532589 (=> (not res!327935) (not e!310067))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!33749 0))(
  ( (array!33750 (arr!16215 (Array (_ BitVec 32) (_ BitVec 64))) (size!16579 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33749)

(declare-fun resX!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4673 0))(
  ( (MissingZero!4673 (index!20916 (_ BitVec 32))) (Found!4673 (index!20917 (_ BitVec 32))) (Intermediate!4673 (undefined!5485 Bool) (index!20918 (_ BitVec 32)) (x!49890 (_ BitVec 32))) (Undefined!4673) (MissingVacant!4673 (index!20919 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33749 (_ BitVec 32)) SeekEntryResult!4673)

(assert (=> b!532589 (= res!327935 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16215 a!3154) j!147) a!3154 mask!3216) (Intermediate!4673 false resIndex!32 resX!32)))))

(declare-fun b!532590 () Bool)

(declare-fun res!327937 () Bool)

(declare-fun e!310068 () Bool)

(assert (=> b!532590 (=> (not res!327937) (not e!310068))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33749 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!532590 (= res!327937 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!532591 () Bool)

(declare-fun res!327940 () Bool)

(assert (=> b!532591 (=> (not res!327940) (not e!310067))))

(declare-datatypes ((List!10334 0))(
  ( (Nil!10331) (Cons!10330 (h!11270 (_ BitVec 64)) (t!16562 List!10334)) )
))
(declare-fun arrayNoDuplicates!0 (array!33749 (_ BitVec 32) List!10334) Bool)

(assert (=> b!532591 (= res!327940 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10331))))

(declare-fun b!532592 () Bool)

(declare-fun res!327943 () Bool)

(assert (=> b!532592 (=> (not res!327943) (not e!310068))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!532592 (= res!327943 (validKeyInArray!0 k!1998))))

(declare-fun res!327936 () Bool)

(assert (=> start!48486 (=> (not res!327936) (not e!310068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48486 (= res!327936 (validMask!0 mask!3216))))

(assert (=> start!48486 e!310068))

(assert (=> start!48486 true))

(declare-fun array_inv!12011 (array!33749) Bool)

(assert (=> start!48486 (array_inv!12011 a!3154)))

(declare-fun b!532593 () Bool)

(assert (=> b!532593 (= e!310068 e!310067)))

(declare-fun res!327939 () Bool)

(assert (=> b!532593 (=> (not res!327939) (not e!310067))))

(declare-fun lt!245241 () SeekEntryResult!4673)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!532593 (= res!327939 (or (= lt!245241 (MissingZero!4673 i!1153)) (= lt!245241 (MissingVacant!4673 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33749 (_ BitVec 32)) SeekEntryResult!4673)

(assert (=> b!532593 (= lt!245241 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!532594 () Bool)

(declare-fun res!327944 () Bool)

(assert (=> b!532594 (=> (not res!327944) (not e!310067))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33749 (_ BitVec 32)) Bool)

(assert (=> b!532594 (= res!327944 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!532595 () Bool)

(declare-fun res!327942 () Bool)

(assert (=> b!532595 (=> (not res!327942) (not e!310067))))

(assert (=> b!532595 (= res!327942 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16579 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16579 a!3154)) (= (select (arr!16215 a!3154) resIndex!32) (select (arr!16215 a!3154) j!147))))))

(declare-fun b!532596 () Bool)

(declare-fun res!327941 () Bool)

(assert (=> b!532596 (=> (not res!327941) (not e!310068))))

(assert (=> b!532596 (= res!327941 (and (= (size!16579 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16579 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16579 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!532597 () Bool)

(declare-fun res!327938 () Bool)

(assert (=> b!532597 (=> (not res!327938) (not e!310068))))

(assert (=> b!532597 (= res!327938 (validKeyInArray!0 (select (arr!16215 a!3154) j!147)))))

(declare-fun b!532598 () Bool)

(assert (=> b!532598 (= e!310067 false)))

(declare-fun lt!245242 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!532598 (= lt!245242 (toIndex!0 (select (arr!16215 a!3154) j!147) mask!3216))))

(assert (= (and start!48486 res!327936) b!532596))

(assert (= (and b!532596 res!327941) b!532597))

(assert (= (and b!532597 res!327938) b!532592))

(assert (= (and b!532592 res!327943) b!532590))

(assert (= (and b!532590 res!327937) b!532593))

(assert (= (and b!532593 res!327939) b!532594))

(assert (= (and b!532594 res!327944) b!532591))

(assert (= (and b!532591 res!327940) b!532595))

(assert (= (and b!532595 res!327942) b!532589))

(assert (= (and b!532589 res!327935) b!532598))

(declare-fun m!512709 () Bool)

(assert (=> start!48486 m!512709))

(declare-fun m!512711 () Bool)

(assert (=> start!48486 m!512711))

(declare-fun m!512713 () Bool)

(assert (=> b!532597 m!512713))

(assert (=> b!532597 m!512713))

(declare-fun m!512715 () Bool)

(assert (=> b!532597 m!512715))

(assert (=> b!532598 m!512713))

(assert (=> b!532598 m!512713))

(declare-fun m!512717 () Bool)

(assert (=> b!532598 m!512717))

(declare-fun m!512719 () Bool)

(assert (=> b!532592 m!512719))

(declare-fun m!512721 () Bool)

(assert (=> b!532590 m!512721))

(assert (=> b!532589 m!512713))

(assert (=> b!532589 m!512713))

(declare-fun m!512723 () Bool)

(assert (=> b!532589 m!512723))

(declare-fun m!512725 () Bool)

(assert (=> b!532591 m!512725))

(declare-fun m!512727 () Bool)

(assert (=> b!532594 m!512727))

(declare-fun m!512729 () Bool)

(assert (=> b!532595 m!512729))

(assert (=> b!532595 m!512713))

(declare-fun m!512731 () Bool)

(assert (=> b!532593 m!512731))

(push 1)

(assert (not b!532594))

