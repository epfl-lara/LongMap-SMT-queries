; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49278 () Bool)

(assert start!49278)

(declare-fun b!542502 () Bool)

(declare-fun res!337061 () Bool)

(declare-fun e!313987 () Bool)

(assert (=> b!542502 (=> (not res!337061) (not e!313987))))

(declare-datatypes ((array!34286 0))(
  ( (array!34287 (arr!16476 (Array (_ BitVec 32) (_ BitVec 64))) (size!16840 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34286)

(declare-datatypes ((List!10595 0))(
  ( (Nil!10592) (Cons!10591 (h!11546 (_ BitVec 64)) (t!16823 List!10595)) )
))
(declare-fun arrayNoDuplicates!0 (array!34286 (_ BitVec 32) List!10595) Bool)

(assert (=> b!542502 (= res!337061 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10592))))

(declare-fun b!542503 () Bool)

(declare-fun res!337064 () Bool)

(declare-fun e!313988 () Bool)

(assert (=> b!542503 (=> (not res!337064) (not e!313988))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4934 0))(
  ( (MissingZero!4934 (index!21960 (_ BitVec 32))) (Found!4934 (index!21961 (_ BitVec 32))) (Intermediate!4934 (undefined!5746 Bool) (index!21962 (_ BitVec 32)) (x!50877 (_ BitVec 32))) (Undefined!4934) (MissingVacant!4934 (index!21963 (_ BitVec 32))) )
))
(declare-fun lt!247938 () SeekEntryResult!4934)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34286 (_ BitVec 32)) SeekEntryResult!4934)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542503 (= res!337064 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16476 a!3154) j!147) mask!3216) (select (arr!16476 a!3154) j!147) a!3154 mask!3216) lt!247938))))

(declare-fun res!337058 () Bool)

(declare-fun e!313989 () Bool)

(assert (=> start!49278 (=> (not res!337058) (not e!313989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49278 (= res!337058 (validMask!0 mask!3216))))

(assert (=> start!49278 e!313989))

(assert (=> start!49278 true))

(declare-fun array_inv!12272 (array!34286) Bool)

(assert (=> start!49278 (array_inv!12272 a!3154)))

(declare-fun b!542504 () Bool)

(declare-fun res!337062 () Bool)

(assert (=> b!542504 (=> (not res!337062) (not e!313989))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542504 (= res!337062 (validKeyInArray!0 k!1998))))

(declare-fun b!542505 () Bool)

(declare-fun res!337059 () Bool)

(assert (=> b!542505 (=> (not res!337059) (not e!313989))))

(declare-fun arrayContainsKey!0 (array!34286 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542505 (= res!337059 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542506 () Bool)

(assert (=> b!542506 (= e!313988 false)))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!247939 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542506 (= lt!247939 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542507 () Bool)

(declare-fun res!337060 () Bool)

(assert (=> b!542507 (=> (not res!337060) (not e!313987))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542507 (= res!337060 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16840 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16840 a!3154)) (= (select (arr!16476 a!3154) resIndex!32) (select (arr!16476 a!3154) j!147))))))

(declare-fun b!542508 () Bool)

(declare-fun res!337054 () Bool)

(assert (=> b!542508 (=> (not res!337054) (not e!313988))))

(assert (=> b!542508 (= res!337054 (and (not (= (select (arr!16476 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16476 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16476 a!3154) index!1177) (select (arr!16476 a!3154) j!147)))))))

(declare-fun b!542509 () Bool)

(declare-fun res!337056 () Bool)

(assert (=> b!542509 (=> (not res!337056) (not e!313989))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542509 (= res!337056 (and (= (size!16840 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16840 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16840 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!542510 () Bool)

(assert (=> b!542510 (= e!313989 e!313987)))

(declare-fun res!337055 () Bool)

(assert (=> b!542510 (=> (not res!337055) (not e!313987))))

(declare-fun lt!247937 () SeekEntryResult!4934)

(assert (=> b!542510 (= res!337055 (or (= lt!247937 (MissingZero!4934 i!1153)) (= lt!247937 (MissingVacant!4934 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34286 (_ BitVec 32)) SeekEntryResult!4934)

(assert (=> b!542510 (= lt!247937 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542511 () Bool)

(declare-fun res!337063 () Bool)

(assert (=> b!542511 (=> (not res!337063) (not e!313989))))

(assert (=> b!542511 (= res!337063 (validKeyInArray!0 (select (arr!16476 a!3154) j!147)))))

(declare-fun b!542512 () Bool)

(assert (=> b!542512 (= e!313987 e!313988)))

(declare-fun res!337053 () Bool)

(assert (=> b!542512 (=> (not res!337053) (not e!313988))))

(assert (=> b!542512 (= res!337053 (= lt!247938 (Intermediate!4934 false resIndex!32 resX!32)))))

(assert (=> b!542512 (= lt!247938 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16476 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542513 () Bool)

(declare-fun res!337057 () Bool)

(assert (=> b!542513 (=> (not res!337057) (not e!313987))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34286 (_ BitVec 32)) Bool)

(assert (=> b!542513 (= res!337057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49278 res!337058) b!542509))

(assert (= (and b!542509 res!337056) b!542511))

(assert (= (and b!542511 res!337063) b!542504))

(assert (= (and b!542504 res!337062) b!542505))

(assert (= (and b!542505 res!337059) b!542510))

(assert (= (and b!542510 res!337055) b!542513))

(assert (= (and b!542513 res!337057) b!542502))

(assert (= (and b!542502 res!337061) b!542507))

(assert (= (and b!542507 res!337060) b!542512))

(assert (= (and b!542512 res!337053) b!542503))

(assert (= (and b!542503 res!337064) b!542508))

(assert (= (and b!542508 res!337054) b!542506))

(declare-fun m!520749 () Bool)

(assert (=> b!542513 m!520749))

(declare-fun m!520751 () Bool)

(assert (=> b!542511 m!520751))

(assert (=> b!542511 m!520751))

(declare-fun m!520753 () Bool)

(assert (=> b!542511 m!520753))

(declare-fun m!520755 () Bool)

(assert (=> start!49278 m!520755))

(declare-fun m!520757 () Bool)

(assert (=> start!49278 m!520757))

(declare-fun m!520759 () Bool)

(assert (=> b!542508 m!520759))

(assert (=> b!542508 m!520751))

(declare-fun m!520761 () Bool)

(assert (=> b!542504 m!520761))

(declare-fun m!520763 () Bool)

(assert (=> b!542507 m!520763))

(assert (=> b!542507 m!520751))

(assert (=> b!542512 m!520751))

(assert (=> b!542512 m!520751))

(declare-fun m!520765 () Bool)

(assert (=> b!542512 m!520765))

(declare-fun m!520767 () Bool)

(assert (=> b!542502 m!520767))

(declare-fun m!520769 () Bool)

(assert (=> b!542510 m!520769))

(declare-fun m!520771 () Bool)

(assert (=> b!542505 m!520771))

(assert (=> b!542503 m!520751))

(assert (=> b!542503 m!520751))

(declare-fun m!520773 () Bool)

(assert (=> b!542503 m!520773))

(assert (=> b!542503 m!520773))

(assert (=> b!542503 m!520751))

(declare-fun m!520775 () Bool)

(assert (=> b!542503 m!520775))

(declare-fun m!520777 () Bool)

(assert (=> b!542506 m!520777))

(push 1)

