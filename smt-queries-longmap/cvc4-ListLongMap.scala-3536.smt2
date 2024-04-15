; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48776 () Bool)

(assert start!48776)

(declare-fun b!536575 () Bool)

(declare-fun res!331923 () Bool)

(declare-fun e!311397 () Bool)

(assert (=> b!536575 (=> (not res!331923) (not e!311397))))

(declare-datatypes ((array!33998 0))(
  ( (array!33999 (arr!16338 (Array (_ BitVec 32) (_ BitVec 64))) (size!16703 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33998)

(declare-datatypes ((List!10496 0))(
  ( (Nil!10493) (Cons!10492 (h!11435 (_ BitVec 64)) (t!16715 List!10496)) )
))
(declare-fun arrayNoDuplicates!0 (array!33998 (_ BitVec 32) List!10496) Bool)

(assert (=> b!536575 (= res!331923 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10493))))

(declare-fun b!536576 () Bool)

(declare-fun res!331930 () Bool)

(declare-fun e!311398 () Bool)

(assert (=> b!536576 (=> (not res!331930) (not e!311398))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536576 (= res!331930 (validKeyInArray!0 (select (arr!16338 a!3154) j!147)))))

(declare-fun b!536577 () Bool)

(declare-fun res!331925 () Bool)

(assert (=> b!536577 (=> (not res!331925) (not e!311398))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!536577 (= res!331925 (validKeyInArray!0 k!1998))))

(declare-fun res!331927 () Bool)

(assert (=> start!48776 (=> (not res!331927) (not e!311398))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48776 (= res!331927 (validMask!0 mask!3216))))

(assert (=> start!48776 e!311398))

(assert (=> start!48776 true))

(declare-fun array_inv!12221 (array!33998) Bool)

(assert (=> start!48776 (array_inv!12221 a!3154)))

(declare-fun b!536578 () Bool)

(declare-fun e!311396 () Bool)

(assert (=> b!536578 (= e!311396 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4793 0))(
  ( (MissingZero!4793 (index!21396 (_ BitVec 32))) (Found!4793 (index!21397 (_ BitVec 32))) (Intermediate!4793 (undefined!5605 Bool) (index!21398 (_ BitVec 32)) (x!50339 (_ BitVec 32))) (Undefined!4793) (MissingVacant!4793 (index!21399 (_ BitVec 32))) )
))
(declare-fun lt!245987 () SeekEntryResult!4793)

(declare-fun lt!245989 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33998 (_ BitVec 32)) SeekEntryResult!4793)

(assert (=> b!536578 (= lt!245987 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!245989 (select (arr!16338 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536579 () Bool)

(assert (=> b!536579 (= e!311398 e!311397)))

(declare-fun res!331924 () Bool)

(assert (=> b!536579 (=> (not res!331924) (not e!311397))))

(declare-fun lt!245988 () SeekEntryResult!4793)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536579 (= res!331924 (or (= lt!245988 (MissingZero!4793 i!1153)) (= lt!245988 (MissingVacant!4793 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33998 (_ BitVec 32)) SeekEntryResult!4793)

(assert (=> b!536579 (= lt!245988 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536580 () Bool)

(declare-fun res!331928 () Bool)

(declare-fun e!311400 () Bool)

(assert (=> b!536580 (=> (not res!331928) (not e!311400))))

(declare-fun index!1177 () (_ BitVec 32))

(assert (=> b!536580 (= res!331928 (and (not (= (select (arr!16338 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16338 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16338 a!3154) index!1177) (select (arr!16338 a!3154) j!147)))))))

(declare-fun b!536581 () Bool)

(declare-fun res!331933 () Bool)

(assert (=> b!536581 (=> (not res!331933) (not e!311398))))

(assert (=> b!536581 (= res!331933 (and (= (size!16703 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16703 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16703 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536582 () Bool)

(declare-fun res!331929 () Bool)

(assert (=> b!536582 (=> (not res!331929) (not e!311397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33998 (_ BitVec 32)) Bool)

(assert (=> b!536582 (= res!331929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536583 () Bool)

(assert (=> b!536583 (= e!311400 e!311396)))

(declare-fun res!331922 () Bool)

(assert (=> b!536583 (=> (not res!331922) (not e!311396))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536583 (= res!331922 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!245989 #b00000000000000000000000000000000) (bvslt lt!245989 (size!16703 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536583 (= lt!245989 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536584 () Bool)

(assert (=> b!536584 (= e!311397 e!311400)))

(declare-fun res!331926 () Bool)

(assert (=> b!536584 (=> (not res!331926) (not e!311400))))

(declare-fun lt!245986 () SeekEntryResult!4793)

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!536584 (= res!331926 (= lt!245986 (Intermediate!4793 false resIndex!32 resX!32)))))

(assert (=> b!536584 (= lt!245986 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16338 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536585 () Bool)

(declare-fun res!331932 () Bool)

(assert (=> b!536585 (=> (not res!331932) (not e!311398))))

(declare-fun arrayContainsKey!0 (array!33998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536585 (= res!331932 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536586 () Bool)

(declare-fun res!331931 () Bool)

(assert (=> b!536586 (=> (not res!331931) (not e!311400))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536586 (= res!331931 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16338 a!3154) j!147) mask!3216) (select (arr!16338 a!3154) j!147) a!3154 mask!3216) lt!245986))))

(declare-fun b!536587 () Bool)

(declare-fun res!331934 () Bool)

(assert (=> b!536587 (=> (not res!331934) (not e!311397))))

(assert (=> b!536587 (= res!331934 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16703 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16703 a!3154)) (= (select (arr!16338 a!3154) resIndex!32) (select (arr!16338 a!3154) j!147))))))

(assert (= (and start!48776 res!331927) b!536581))

(assert (= (and b!536581 res!331933) b!536576))

(assert (= (and b!536576 res!331930) b!536577))

(assert (= (and b!536577 res!331925) b!536585))

(assert (= (and b!536585 res!331932) b!536579))

(assert (= (and b!536579 res!331924) b!536582))

(assert (= (and b!536582 res!331929) b!536575))

(assert (= (and b!536575 res!331923) b!536587))

(assert (= (and b!536587 res!331934) b!536584))

(assert (= (and b!536584 res!331926) b!536586))

(assert (= (and b!536586 res!331931) b!536580))

(assert (= (and b!536580 res!331928) b!536583))

(assert (= (and b!536583 res!331922) b!536578))

(declare-fun m!515433 () Bool)

(assert (=> b!536580 m!515433))

(declare-fun m!515435 () Bool)

(assert (=> b!536580 m!515435))

(declare-fun m!515437 () Bool)

(assert (=> b!536583 m!515437))

(declare-fun m!515439 () Bool)

(assert (=> b!536579 m!515439))

(declare-fun m!515441 () Bool)

(assert (=> b!536585 m!515441))

(declare-fun m!515443 () Bool)

(assert (=> b!536582 m!515443))

(assert (=> b!536576 m!515435))

(assert (=> b!536576 m!515435))

(declare-fun m!515445 () Bool)

(assert (=> b!536576 m!515445))

(declare-fun m!515447 () Bool)

(assert (=> b!536577 m!515447))

(assert (=> b!536578 m!515435))

(assert (=> b!536578 m!515435))

(declare-fun m!515449 () Bool)

(assert (=> b!536578 m!515449))

(assert (=> b!536586 m!515435))

(assert (=> b!536586 m!515435))

(declare-fun m!515451 () Bool)

(assert (=> b!536586 m!515451))

(assert (=> b!536586 m!515451))

(assert (=> b!536586 m!515435))

(declare-fun m!515453 () Bool)

(assert (=> b!536586 m!515453))

(declare-fun m!515455 () Bool)

(assert (=> start!48776 m!515455))

(declare-fun m!515457 () Bool)

(assert (=> start!48776 m!515457))

(declare-fun m!515459 () Bool)

(assert (=> b!536575 m!515459))

(declare-fun m!515461 () Bool)

(assert (=> b!536587 m!515461))

(assert (=> b!536587 m!515435))

(assert (=> b!536584 m!515435))

(assert (=> b!536584 m!515435))

(declare-fun m!515463 () Bool)

(assert (=> b!536584 m!515463))

(push 1)

(assert (not b!536586))

(assert (not b!536578))

(assert (not b!536584))

(assert (not b!536585))

(assert (not b!536582))

(assert (not b!536575))

(assert (not b!536583))

(assert (not b!536577))

(assert (not start!48776))

(assert (not b!536576))

(assert (not b!536579))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

