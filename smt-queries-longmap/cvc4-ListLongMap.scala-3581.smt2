; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49276 () Bool)

(assert start!49276)

(declare-fun b!542466 () Bool)

(declare-fun e!313975 () Bool)

(declare-fun e!313976 () Bool)

(assert (=> b!542466 (= e!313975 e!313976)))

(declare-fun res!337024 () Bool)

(assert (=> b!542466 (=> (not res!337024) (not e!313976))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4933 0))(
  ( (MissingZero!4933 (index!21956 (_ BitVec 32))) (Found!4933 (index!21957 (_ BitVec 32))) (Intermediate!4933 (undefined!5745 Bool) (index!21958 (_ BitVec 32)) (x!50868 (_ BitVec 32))) (Undefined!4933) (MissingVacant!4933 (index!21959 (_ BitVec 32))) )
))
(declare-fun lt!247929 () SeekEntryResult!4933)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!542466 (= res!337024 (= lt!247929 (Intermediate!4933 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34284 0))(
  ( (array!34285 (arr!16475 (Array (_ BitVec 32) (_ BitVec 64))) (size!16839 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34284)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34284 (_ BitVec 32)) SeekEntryResult!4933)

(assert (=> b!542466 (= lt!247929 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16475 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542467 () Bool)

(declare-fun res!337020 () Bool)

(assert (=> b!542467 (=> (not res!337020) (not e!313976))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542467 (= res!337020 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16475 a!3154) j!147) mask!3216) (select (arr!16475 a!3154) j!147) a!3154 mask!3216) lt!247929))))

(declare-fun b!542468 () Bool)

(declare-fun res!337018 () Bool)

(declare-fun e!313977 () Bool)

(assert (=> b!542468 (=> (not res!337018) (not e!313977))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34284 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!542468 (= res!337018 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!542469 () Bool)

(assert (=> b!542469 (= e!313977 e!313975)))

(declare-fun res!337025 () Bool)

(assert (=> b!542469 (=> (not res!337025) (not e!313975))))

(declare-fun lt!247930 () SeekEntryResult!4933)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!542469 (= res!337025 (or (= lt!247930 (MissingZero!4933 i!1153)) (= lt!247930 (MissingVacant!4933 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34284 (_ BitVec 32)) SeekEntryResult!4933)

(assert (=> b!542469 (= lt!247930 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!542470 () Bool)

(declare-fun res!337028 () Bool)

(assert (=> b!542470 (=> (not res!337028) (not e!313976))))

(assert (=> b!542470 (= res!337028 (and (not (= (select (arr!16475 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16475 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16475 a!3154) index!1177) (select (arr!16475 a!3154) j!147)))))))

(declare-fun b!542471 () Bool)

(declare-fun res!337022 () Bool)

(assert (=> b!542471 (=> (not res!337022) (not e!313975))))

(declare-datatypes ((List!10594 0))(
  ( (Nil!10591) (Cons!10590 (h!11545 (_ BitVec 64)) (t!16822 List!10594)) )
))
(declare-fun arrayNoDuplicates!0 (array!34284 (_ BitVec 32) List!10594) Bool)

(assert (=> b!542471 (= res!337022 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10591))))

(declare-fun b!542472 () Bool)

(declare-fun res!337027 () Bool)

(assert (=> b!542472 (=> (not res!337027) (not e!313977))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!542472 (= res!337027 (validKeyInArray!0 (select (arr!16475 a!3154) j!147)))))

(declare-fun b!542473 () Bool)

(assert (=> b!542473 (= e!313976 false)))

(declare-fun lt!247928 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542473 (= lt!247928 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!542474 () Bool)

(declare-fun res!337021 () Bool)

(assert (=> b!542474 (=> (not res!337021) (not e!313975))))

(assert (=> b!542474 (= res!337021 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16839 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16839 a!3154)) (= (select (arr!16475 a!3154) resIndex!32) (select (arr!16475 a!3154) j!147))))))

(declare-fun b!542475 () Bool)

(declare-fun res!337019 () Bool)

(assert (=> b!542475 (=> (not res!337019) (not e!313977))))

(assert (=> b!542475 (= res!337019 (and (= (size!16839 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16839 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16839 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!337023 () Bool)

(assert (=> start!49276 (=> (not res!337023) (not e!313977))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49276 (= res!337023 (validMask!0 mask!3216))))

(assert (=> start!49276 e!313977))

(assert (=> start!49276 true))

(declare-fun array_inv!12271 (array!34284) Bool)

(assert (=> start!49276 (array_inv!12271 a!3154)))

(declare-fun b!542476 () Bool)

(declare-fun res!337017 () Bool)

(assert (=> b!542476 (=> (not res!337017) (not e!313977))))

(assert (=> b!542476 (= res!337017 (validKeyInArray!0 k!1998))))

(declare-fun b!542477 () Bool)

(declare-fun res!337026 () Bool)

(assert (=> b!542477 (=> (not res!337026) (not e!313975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34284 (_ BitVec 32)) Bool)

(assert (=> b!542477 (= res!337026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(assert (= (and start!49276 res!337023) b!542475))

(assert (= (and b!542475 res!337019) b!542472))

(assert (= (and b!542472 res!337027) b!542476))

(assert (= (and b!542476 res!337017) b!542468))

(assert (= (and b!542468 res!337018) b!542469))

(assert (= (and b!542469 res!337025) b!542477))

(assert (= (and b!542477 res!337026) b!542471))

(assert (= (and b!542471 res!337022) b!542474))

(assert (= (and b!542474 res!337021) b!542466))

(assert (= (and b!542466 res!337024) b!542467))

(assert (= (and b!542467 res!337020) b!542470))

(assert (= (and b!542470 res!337028) b!542473))

(declare-fun m!520719 () Bool)

(assert (=> b!542471 m!520719))

(declare-fun m!520721 () Bool)

(assert (=> b!542466 m!520721))

(assert (=> b!542466 m!520721))

(declare-fun m!520723 () Bool)

(assert (=> b!542466 m!520723))

(declare-fun m!520725 () Bool)

(assert (=> b!542474 m!520725))

(assert (=> b!542474 m!520721))

(declare-fun m!520727 () Bool)

(assert (=> b!542469 m!520727))

(declare-fun m!520729 () Bool)

(assert (=> start!49276 m!520729))

(declare-fun m!520731 () Bool)

(assert (=> start!49276 m!520731))

(assert (=> b!542467 m!520721))

(assert (=> b!542467 m!520721))

(declare-fun m!520733 () Bool)

(assert (=> b!542467 m!520733))

(assert (=> b!542467 m!520733))

(assert (=> b!542467 m!520721))

(declare-fun m!520735 () Bool)

(assert (=> b!542467 m!520735))

(declare-fun m!520737 () Bool)

(assert (=> b!542476 m!520737))

(declare-fun m!520739 () Bool)

(assert (=> b!542473 m!520739))

(declare-fun m!520741 () Bool)

(assert (=> b!542477 m!520741))

(declare-fun m!520743 () Bool)

(assert (=> b!542468 m!520743))

(assert (=> b!542472 m!520721))

(assert (=> b!542472 m!520721))

(declare-fun m!520745 () Bool)

(assert (=> b!542472 m!520745))

(declare-fun m!520747 () Bool)

(assert (=> b!542470 m!520747))

(assert (=> b!542470 m!520721))

(push 1)

(assert (not b!542476))

(assert (not start!49276))

(assert (not b!542477))

(assert (not b!542472))

(assert (not b!542473))

