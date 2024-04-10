; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48390 () Bool)

(assert start!48390)

(declare-fun res!327211 () Bool)

(declare-fun e!309699 () Bool)

(assert (=> start!48390 (=> (not res!327211) (not e!309699))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48390 (= res!327211 (validMask!0 mask!3216))))

(assert (=> start!48390 e!309699))

(assert (=> start!48390 true))

(declare-datatypes ((array!33698 0))(
  ( (array!33699 (arr!16191 (Array (_ BitVec 32) (_ BitVec 64))) (size!16555 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33698)

(declare-fun array_inv!11987 (array!33698) Bool)

(assert (=> start!48390 (array_inv!11987 a!3154)))

(declare-fun b!531719 () Bool)

(declare-fun res!327210 () Bool)

(assert (=> b!531719 (=> (not res!327210) (not e!309699))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33698 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531719 (= res!327210 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531720 () Bool)

(declare-fun res!327212 () Bool)

(assert (=> b!531720 (=> (not res!327212) (not e!309699))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531720 (= res!327212 (validKeyInArray!0 k!1998))))

(declare-fun b!531721 () Bool)

(declare-fun e!309698 () Bool)

(assert (=> b!531721 (= e!309699 e!309698)))

(declare-fun res!327214 () Bool)

(assert (=> b!531721 (=> (not res!327214) (not e!309698))))

(declare-datatypes ((SeekEntryResult!4649 0))(
  ( (MissingZero!4649 (index!20820 (_ BitVec 32))) (Found!4649 (index!20821 (_ BitVec 32))) (Intermediate!4649 (undefined!5461 Bool) (index!20822 (_ BitVec 32)) (x!49799 (_ BitVec 32))) (Undefined!4649) (MissingVacant!4649 (index!20823 (_ BitVec 32))) )
))
(declare-fun lt!245062 () SeekEntryResult!4649)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531721 (= res!327214 (or (= lt!245062 (MissingZero!4649 i!1153)) (= lt!245062 (MissingVacant!4649 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33698 (_ BitVec 32)) SeekEntryResult!4649)

(assert (=> b!531721 (= lt!245062 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531722 () Bool)

(assert (=> b!531722 (= e!309698 false)))

(declare-fun lt!245061 () Bool)

(declare-datatypes ((List!10310 0))(
  ( (Nil!10307) (Cons!10306 (h!11246 (_ BitVec 64)) (t!16538 List!10310)) )
))
(declare-fun arrayNoDuplicates!0 (array!33698 (_ BitVec 32) List!10310) Bool)

(assert (=> b!531722 (= lt!245061 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10307))))

(declare-fun b!531723 () Bool)

(declare-fun res!327209 () Bool)

(assert (=> b!531723 (=> (not res!327209) (not e!309699))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531723 (= res!327209 (and (= (size!16555 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16555 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16555 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531724 () Bool)

(declare-fun res!327213 () Bool)

(assert (=> b!531724 (=> (not res!327213) (not e!309698))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33698 (_ BitVec 32)) Bool)

(assert (=> b!531724 (= res!327213 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531725 () Bool)

(declare-fun res!327215 () Bool)

(assert (=> b!531725 (=> (not res!327215) (not e!309699))))

(assert (=> b!531725 (= res!327215 (validKeyInArray!0 (select (arr!16191 a!3154) j!147)))))

(assert (= (and start!48390 res!327211) b!531723))

(assert (= (and b!531723 res!327209) b!531725))

(assert (= (and b!531725 res!327215) b!531720))

(assert (= (and b!531720 res!327212) b!531719))

(assert (= (and b!531719 res!327210) b!531721))

(assert (= (and b!531721 res!327214) b!531724))

(assert (= (and b!531724 res!327213) b!531722))

(declare-fun m!512085 () Bool)

(assert (=> b!531725 m!512085))

(assert (=> b!531725 m!512085))

(declare-fun m!512087 () Bool)

(assert (=> b!531725 m!512087))

(declare-fun m!512089 () Bool)

(assert (=> b!531719 m!512089))

(declare-fun m!512091 () Bool)

(assert (=> b!531722 m!512091))

(declare-fun m!512093 () Bool)

(assert (=> start!48390 m!512093))

(declare-fun m!512095 () Bool)

(assert (=> start!48390 m!512095))

(declare-fun m!512097 () Bool)

(assert (=> b!531720 m!512097))

(declare-fun m!512099 () Bool)

(assert (=> b!531724 m!512099))

(declare-fun m!512101 () Bool)

(assert (=> b!531721 m!512101))

(push 1)

