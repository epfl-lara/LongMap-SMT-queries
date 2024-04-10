; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48412 () Bool)

(assert start!48412)

(declare-fun b!531968 () Bool)

(declare-fun res!327463 () Bool)

(declare-fun e!309798 () Bool)

(assert (=> b!531968 (=> (not res!327463) (not e!309798))))

(declare-datatypes ((array!33720 0))(
  ( (array!33721 (arr!16202 (Array (_ BitVec 32) (_ BitVec 64))) (size!16566 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33720)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531968 (= res!327463 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531969 () Bool)

(declare-fun res!327458 () Bool)

(assert (=> b!531969 (=> (not res!327458) (not e!309798))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531969 (= res!327458 (and (= (size!16566 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16566 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16566 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531970 () Bool)

(declare-fun e!309796 () Bool)

(assert (=> b!531970 (= e!309796 false)))

(declare-fun lt!245109 () Bool)

(declare-datatypes ((List!10321 0))(
  ( (Nil!10318) (Cons!10317 (h!11257 (_ BitVec 64)) (t!16549 List!10321)) )
))
(declare-fun arrayNoDuplicates!0 (array!33720 (_ BitVec 32) List!10321) Bool)

(assert (=> b!531970 (= lt!245109 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10318))))

(declare-fun b!531971 () Bool)

(declare-fun res!327462 () Bool)

(assert (=> b!531971 (=> (not res!327462) (not e!309796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33720 (_ BitVec 32)) Bool)

(assert (=> b!531971 (= res!327462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun res!327459 () Bool)

(assert (=> start!48412 (=> (not res!327459) (not e!309798))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48412 (= res!327459 (validMask!0 mask!3216))))

(assert (=> start!48412 e!309798))

(assert (=> start!48412 true))

(declare-fun array_inv!11998 (array!33720) Bool)

(assert (=> start!48412 (array_inv!11998 a!3154)))

(declare-fun b!531972 () Bool)

(declare-fun res!327460 () Bool)

(assert (=> b!531972 (=> (not res!327460) (not e!309798))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531972 (= res!327460 (validKeyInArray!0 (select (arr!16202 a!3154) j!147)))))

(declare-fun b!531973 () Bool)

(declare-fun res!327464 () Bool)

(assert (=> b!531973 (=> (not res!327464) (not e!309798))))

(assert (=> b!531973 (= res!327464 (validKeyInArray!0 k!1998))))

(declare-fun b!531974 () Bool)

(assert (=> b!531974 (= e!309798 e!309796)))

(declare-fun res!327461 () Bool)

(assert (=> b!531974 (=> (not res!327461) (not e!309796))))

(declare-datatypes ((SeekEntryResult!4660 0))(
  ( (MissingZero!4660 (index!20864 (_ BitVec 32))) (Found!4660 (index!20865 (_ BitVec 32))) (Intermediate!4660 (undefined!5472 Bool) (index!20866 (_ BitVec 32)) (x!49834 (_ BitVec 32))) (Undefined!4660) (MissingVacant!4660 (index!20867 (_ BitVec 32))) )
))
(declare-fun lt!245110 () SeekEntryResult!4660)

(assert (=> b!531974 (= res!327461 (or (= lt!245110 (MissingZero!4660 i!1153)) (= lt!245110 (MissingVacant!4660 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33720 (_ BitVec 32)) SeekEntryResult!4660)

(assert (=> b!531974 (= lt!245110 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(assert (= (and start!48412 res!327459) b!531969))

(assert (= (and b!531969 res!327458) b!531972))

(assert (= (and b!531972 res!327460) b!531973))

(assert (= (and b!531973 res!327464) b!531968))

(assert (= (and b!531968 res!327463) b!531974))

(assert (= (and b!531974 res!327461) b!531971))

(assert (= (and b!531971 res!327462) b!531970))

(declare-fun m!512295 () Bool)

(assert (=> b!531973 m!512295))

(declare-fun m!512297 () Bool)

(assert (=> b!531968 m!512297))

(declare-fun m!512299 () Bool)

(assert (=> b!531972 m!512299))

(assert (=> b!531972 m!512299))

(declare-fun m!512301 () Bool)

(assert (=> b!531972 m!512301))

(declare-fun m!512303 () Bool)

(assert (=> b!531971 m!512303))

(declare-fun m!512305 () Bool)

(assert (=> b!531974 m!512305))

(declare-fun m!512307 () Bool)

(assert (=> b!531970 m!512307))

(declare-fun m!512309 () Bool)

(assert (=> start!48412 m!512309))

(declare-fun m!512311 () Bool)

(assert (=> start!48412 m!512311))

(push 1)

(assert (not b!531970))

