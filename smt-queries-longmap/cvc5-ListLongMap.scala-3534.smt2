; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48774 () Bool)

(assert start!48774)

(declare-fun b!536573 () Bool)

(declare-fun e!311467 () Bool)

(declare-fun e!311465 () Bool)

(assert (=> b!536573 (= e!311467 e!311465)))

(declare-fun res!331779 () Bool)

(assert (=> b!536573 (=> (not res!331779) (not e!311465))))

(declare-datatypes ((SeekEntryResult!4790 0))(
  ( (MissingZero!4790 (index!21384 (_ BitVec 32))) (Found!4790 (index!21385 (_ BitVec 32))) (Intermediate!4790 (undefined!5602 Bool) (index!21386 (_ BitVec 32)) (x!50325 (_ BitVec 32))) (Undefined!4790) (MissingVacant!4790 (index!21387 (_ BitVec 32))) )
))
(declare-fun lt!246138 () SeekEntryResult!4790)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536573 (= res!331779 (or (= lt!246138 (MissingZero!4790 i!1153)) (= lt!246138 (MissingVacant!4790 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33986 0))(
  ( (array!33987 (arr!16332 (Array (_ BitVec 32) (_ BitVec 64))) (size!16696 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33986)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33986 (_ BitVec 32)) SeekEntryResult!4790)

(assert (=> b!536573 (= lt!246138 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536574 () Bool)

(declare-fun res!331780 () Bool)

(assert (=> b!536574 (=> (not res!331780) (not e!311467))))

(declare-fun arrayContainsKey!0 (array!33986 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536574 (= res!331780 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536575 () Bool)

(declare-fun res!331786 () Bool)

(assert (=> b!536575 (=> (not res!331786) (not e!311467))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!536575 (= res!331786 (and (= (size!16696 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16696 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16696 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!331790 () Bool)

(assert (=> start!48774 (=> (not res!331790) (not e!311467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48774 (= res!331790 (validMask!0 mask!3216))))

(assert (=> start!48774 e!311467))

(assert (=> start!48774 true))

(declare-fun array_inv!12128 (array!33986) Bool)

(assert (=> start!48774 (array_inv!12128 a!3154)))

(declare-fun b!536576 () Bool)

(declare-fun e!311468 () Bool)

(assert (=> b!536576 (= e!311468 false)))

(declare-fun lt!246137 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!246136 () SeekEntryResult!4790)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33986 (_ BitVec 32)) SeekEntryResult!4790)

(assert (=> b!536576 (= lt!246136 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246137 (select (arr!16332 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536577 () Bool)

(declare-fun res!331787 () Bool)

(assert (=> b!536577 (=> (not res!331787) (not e!311467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536577 (= res!331787 (validKeyInArray!0 k!1998))))

(declare-fun b!536578 () Bool)

(declare-fun res!331783 () Bool)

(declare-fun e!311469 () Bool)

(assert (=> b!536578 (=> (not res!331783) (not e!311469))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536578 (= res!331783 (and (not (= (select (arr!16332 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16332 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16332 a!3154) index!1177) (select (arr!16332 a!3154) j!147)))))))

(declare-fun b!536579 () Bool)

(declare-fun res!331778 () Bool)

(assert (=> b!536579 (=> (not res!331778) (not e!311465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33986 (_ BitVec 32)) Bool)

(assert (=> b!536579 (= res!331778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536580 () Bool)

(assert (=> b!536580 (= e!311465 e!311469)))

(declare-fun res!331785 () Bool)

(assert (=> b!536580 (=> (not res!331785) (not e!311469))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun lt!246139 () SeekEntryResult!4790)

(assert (=> b!536580 (= res!331785 (= lt!246139 (Intermediate!4790 false resIndex!32 resX!32)))))

(assert (=> b!536580 (= lt!246139 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16332 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536581 () Bool)

(declare-fun res!331789 () Bool)

(assert (=> b!536581 (=> (not res!331789) (not e!311465))))

(declare-datatypes ((List!10451 0))(
  ( (Nil!10448) (Cons!10447 (h!11390 (_ BitVec 64)) (t!16679 List!10451)) )
))
(declare-fun arrayNoDuplicates!0 (array!33986 (_ BitVec 32) List!10451) Bool)

(assert (=> b!536581 (= res!331789 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10448))))

(declare-fun b!536582 () Bool)

(declare-fun res!331781 () Bool)

(assert (=> b!536582 (=> (not res!331781) (not e!311465))))

(assert (=> b!536582 (= res!331781 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16696 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16696 a!3154)) (= (select (arr!16332 a!3154) resIndex!32) (select (arr!16332 a!3154) j!147))))))

(declare-fun b!536583 () Bool)

(declare-fun res!331784 () Bool)

(assert (=> b!536583 (=> (not res!331784) (not e!311467))))

(assert (=> b!536583 (= res!331784 (validKeyInArray!0 (select (arr!16332 a!3154) j!147)))))

(declare-fun b!536584 () Bool)

(assert (=> b!536584 (= e!311469 e!311468)))

(declare-fun res!331782 () Bool)

(assert (=> b!536584 (=> (not res!331782) (not e!311468))))

(assert (=> b!536584 (= res!331782 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246137 #b00000000000000000000000000000000) (bvslt lt!246137 (size!16696 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536584 (= lt!246137 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536585 () Bool)

(declare-fun res!331788 () Bool)

(assert (=> b!536585 (=> (not res!331788) (not e!311469))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536585 (= res!331788 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16332 a!3154) j!147) mask!3216) (select (arr!16332 a!3154) j!147) a!3154 mask!3216) lt!246139))))

(assert (= (and start!48774 res!331790) b!536575))

(assert (= (and b!536575 res!331786) b!536583))

(assert (= (and b!536583 res!331784) b!536577))

(assert (= (and b!536577 res!331787) b!536574))

(assert (= (and b!536574 res!331780) b!536573))

(assert (= (and b!536573 res!331779) b!536579))

(assert (= (and b!536579 res!331778) b!536581))

(assert (= (and b!536581 res!331789) b!536582))

(assert (= (and b!536582 res!331781) b!536580))

(assert (= (and b!536580 res!331785) b!536585))

(assert (= (and b!536585 res!331788) b!536578))

(assert (= (and b!536578 res!331783) b!536584))

(assert (= (and b!536584 res!331782) b!536576))

(declare-fun m!515961 () Bool)

(assert (=> b!536585 m!515961))

(assert (=> b!536585 m!515961))

(declare-fun m!515963 () Bool)

(assert (=> b!536585 m!515963))

(assert (=> b!536585 m!515963))

(assert (=> b!536585 m!515961))

(declare-fun m!515965 () Bool)

(assert (=> b!536585 m!515965))

(assert (=> b!536580 m!515961))

(assert (=> b!536580 m!515961))

(declare-fun m!515967 () Bool)

(assert (=> b!536580 m!515967))

(declare-fun m!515969 () Bool)

(assert (=> b!536573 m!515969))

(declare-fun m!515971 () Bool)

(assert (=> b!536577 m!515971))

(declare-fun m!515973 () Bool)

(assert (=> b!536574 m!515973))

(declare-fun m!515975 () Bool)

(assert (=> start!48774 m!515975))

(declare-fun m!515977 () Bool)

(assert (=> start!48774 m!515977))

(declare-fun m!515979 () Bool)

(assert (=> b!536579 m!515979))

(declare-fun m!515981 () Bool)

(assert (=> b!536584 m!515981))

(declare-fun m!515983 () Bool)

(assert (=> b!536581 m!515983))

(assert (=> b!536576 m!515961))

(assert (=> b!536576 m!515961))

(declare-fun m!515985 () Bool)

(assert (=> b!536576 m!515985))

(declare-fun m!515987 () Bool)

(assert (=> b!536578 m!515987))

(assert (=> b!536578 m!515961))

(assert (=> b!536583 m!515961))

(assert (=> b!536583 m!515961))

(declare-fun m!515989 () Bool)

(assert (=> b!536583 m!515989))

(declare-fun m!515991 () Bool)

(assert (=> b!536582 m!515991))

(assert (=> b!536582 m!515961))

(push 1)

