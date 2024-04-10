; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48408 () Bool)

(assert start!48408)

(declare-fun b!531926 () Bool)

(declare-fun res!327416 () Bool)

(declare-fun e!309779 () Bool)

(assert (=> b!531926 (=> (not res!327416) (not e!309779))))

(declare-datatypes ((array!33716 0))(
  ( (array!33717 (arr!16200 (Array (_ BitVec 32) (_ BitVec 64))) (size!16564 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33716)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33716 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531926 (= res!327416 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531927 () Bool)

(declare-fun res!327419 () Bool)

(assert (=> b!531927 (=> (not res!327419) (not e!309779))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531927 (= res!327419 (and (= (size!16564 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16564 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16564 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!327417 () Bool)

(assert (=> start!48408 (=> (not res!327417) (not e!309779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48408 (= res!327417 (validMask!0 mask!3216))))

(assert (=> start!48408 e!309779))

(assert (=> start!48408 true))

(declare-fun array_inv!11996 (array!33716) Bool)

(assert (=> start!48408 (array_inv!11996 a!3154)))

(declare-fun b!531928 () Bool)

(declare-fun e!309780 () Bool)

(assert (=> b!531928 (= e!309780 false)))

(declare-fun lt!245097 () Bool)

(declare-datatypes ((List!10319 0))(
  ( (Nil!10316) (Cons!10315 (h!11255 (_ BitVec 64)) (t!16547 List!10319)) )
))
(declare-fun arrayNoDuplicates!0 (array!33716 (_ BitVec 32) List!10319) Bool)

(assert (=> b!531928 (= lt!245097 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10316))))

(declare-fun b!531929 () Bool)

(declare-fun res!327421 () Bool)

(assert (=> b!531929 (=> (not res!327421) (not e!309779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531929 (= res!327421 (validKeyInArray!0 k!1998))))

(declare-fun b!531930 () Bool)

(assert (=> b!531930 (= e!309779 e!309780)))

(declare-fun res!327422 () Bool)

(assert (=> b!531930 (=> (not res!327422) (not e!309780))))

(declare-datatypes ((SeekEntryResult!4658 0))(
  ( (MissingZero!4658 (index!20856 (_ BitVec 32))) (Found!4658 (index!20857 (_ BitVec 32))) (Intermediate!4658 (undefined!5470 Bool) (index!20858 (_ BitVec 32)) (x!49832 (_ BitVec 32))) (Undefined!4658) (MissingVacant!4658 (index!20859 (_ BitVec 32))) )
))
(declare-fun lt!245098 () SeekEntryResult!4658)

(assert (=> b!531930 (= res!327422 (or (= lt!245098 (MissingZero!4658 i!1153)) (= lt!245098 (MissingVacant!4658 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33716 (_ BitVec 32)) SeekEntryResult!4658)

(assert (=> b!531930 (= lt!245098 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531931 () Bool)

(declare-fun res!327420 () Bool)

(assert (=> b!531931 (=> (not res!327420) (not e!309779))))

(assert (=> b!531931 (= res!327420 (validKeyInArray!0 (select (arr!16200 a!3154) j!147)))))

(declare-fun b!531932 () Bool)

(declare-fun res!327418 () Bool)

(assert (=> b!531932 (=> (not res!327418) (not e!309780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33716 (_ BitVec 32)) Bool)

(assert (=> b!531932 (= res!327418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!48408 res!327417) b!531927))

(assert (= (and b!531927 res!327419) b!531931))

(assert (= (and b!531931 res!327420) b!531929))

(assert (= (and b!531929 res!327421) b!531926))

(assert (= (and b!531926 res!327416) b!531930))

(assert (= (and b!531930 res!327422) b!531932))

(assert (= (and b!531932 res!327418) b!531928))

(declare-fun m!512259 () Bool)

(assert (=> b!531928 m!512259))

(declare-fun m!512261 () Bool)

(assert (=> start!48408 m!512261))

(declare-fun m!512263 () Bool)

(assert (=> start!48408 m!512263))

(declare-fun m!512265 () Bool)

(assert (=> b!531931 m!512265))

(assert (=> b!531931 m!512265))

(declare-fun m!512267 () Bool)

(assert (=> b!531931 m!512267))

(declare-fun m!512269 () Bool)

(assert (=> b!531930 m!512269))

(declare-fun m!512271 () Bool)

(assert (=> b!531932 m!512271))

(declare-fun m!512273 () Bool)

(assert (=> b!531929 m!512273))

(declare-fun m!512275 () Bool)

(assert (=> b!531926 m!512275))

(push 1)

