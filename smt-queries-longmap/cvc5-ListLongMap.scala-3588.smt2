; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49314 () Bool)

(assert start!49314)

(declare-fun b!543150 () Bool)

(declare-fun res!337705 () Bool)

(declare-fun e!314205 () Bool)

(assert (=> b!543150 (=> (not res!337705) (not e!314205))))

(declare-datatypes ((array!34322 0))(
  ( (array!34323 (arr!16494 (Array (_ BitVec 32) (_ BitVec 64))) (size!16858 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34322)

(declare-datatypes ((List!10613 0))(
  ( (Nil!10610) (Cons!10609 (h!11564 (_ BitVec 64)) (t!16841 List!10613)) )
))
(declare-fun arrayNoDuplicates!0 (array!34322 (_ BitVec 32) List!10613) Bool)

(assert (=> b!543150 (= res!337705 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10610))))

(declare-fun b!543151 () Bool)

(declare-fun res!337704 () Bool)

(assert (=> b!543151 (=> (not res!337704) (not e!314205))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34322 (_ BitVec 32)) Bool)

(assert (=> b!543151 (= res!337704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543152 () Bool)

(declare-fun res!337709 () Bool)

(assert (=> b!543152 (=> (not res!337709) (not e!314205))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543152 (= res!337709 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16858 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16858 a!3154)) (= (select (arr!16494 a!3154) resIndex!32) (select (arr!16494 a!3154) j!147))))))

(declare-fun b!543153 () Bool)

(declare-fun res!337710 () Bool)

(declare-fun e!314204 () Bool)

(assert (=> b!543153 (=> (not res!337710) (not e!314204))))

(declare-datatypes ((SeekEntryResult!4952 0))(
  ( (MissingZero!4952 (index!22032 (_ BitVec 32))) (Found!4952 (index!22033 (_ BitVec 32))) (Intermediate!4952 (undefined!5764 Bool) (index!22034 (_ BitVec 32)) (x!50943 (_ BitVec 32))) (Undefined!4952) (MissingVacant!4952 (index!22035 (_ BitVec 32))) )
))
(declare-fun lt!248100 () SeekEntryResult!4952)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34322 (_ BitVec 32)) SeekEntryResult!4952)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543153 (= res!337710 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16494 a!3154) j!147) mask!3216) (select (arr!16494 a!3154) j!147) a!3154 mask!3216) lt!248100))))

(declare-fun b!543154 () Bool)

(declare-fun res!337712 () Bool)

(declare-fun e!314202 () Bool)

(assert (=> b!543154 (=> (not res!337712) (not e!314202))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543154 (= res!337712 (validKeyInArray!0 k!1998))))

(declare-fun res!337711 () Bool)

(assert (=> start!49314 (=> (not res!337711) (not e!314202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49314 (= res!337711 (validMask!0 mask!3216))))

(assert (=> start!49314 e!314202))

(assert (=> start!49314 true))

(declare-fun array_inv!12290 (array!34322) Bool)

(assert (=> start!49314 (array_inv!12290 a!3154)))

(declare-fun b!543155 () Bool)

(assert (=> b!543155 (= e!314202 e!314205)))

(declare-fun res!337706 () Bool)

(assert (=> b!543155 (=> (not res!337706) (not e!314205))))

(declare-fun lt!248099 () SeekEntryResult!4952)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543155 (= res!337706 (or (= lt!248099 (MissingZero!4952 i!1153)) (= lt!248099 (MissingVacant!4952 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34322 (_ BitVec 32)) SeekEntryResult!4952)

(assert (=> b!543155 (= lt!248099 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543156 () Bool)

(declare-fun res!337708 () Bool)

(assert (=> b!543156 (=> (not res!337708) (not e!314202))))

(declare-fun arrayContainsKey!0 (array!34322 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543156 (= res!337708 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543157 () Bool)

(assert (=> b!543157 (= e!314204 false)))

(declare-fun lt!248101 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543157 (= lt!248101 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543158 () Bool)

(assert (=> b!543158 (= e!314205 e!314204)))

(declare-fun res!337703 () Bool)

(assert (=> b!543158 (=> (not res!337703) (not e!314204))))

(assert (=> b!543158 (= res!337703 (= lt!248100 (Intermediate!4952 false resIndex!32 resX!32)))))

(assert (=> b!543158 (= lt!248100 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16494 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543159 () Bool)

(declare-fun res!337701 () Bool)

(assert (=> b!543159 (=> (not res!337701) (not e!314202))))

(assert (=> b!543159 (= res!337701 (and (= (size!16858 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16858 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16858 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543160 () Bool)

(declare-fun res!337702 () Bool)

(assert (=> b!543160 (=> (not res!337702) (not e!314204))))

(assert (=> b!543160 (= res!337702 (and (not (= (select (arr!16494 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16494 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16494 a!3154) index!1177) (select (arr!16494 a!3154) j!147)))))))

(declare-fun b!543161 () Bool)

(declare-fun res!337707 () Bool)

(assert (=> b!543161 (=> (not res!337707) (not e!314202))))

(assert (=> b!543161 (= res!337707 (validKeyInArray!0 (select (arr!16494 a!3154) j!147)))))

(assert (= (and start!49314 res!337711) b!543159))

(assert (= (and b!543159 res!337701) b!543161))

(assert (= (and b!543161 res!337707) b!543154))

(assert (= (and b!543154 res!337712) b!543156))

(assert (= (and b!543156 res!337708) b!543155))

(assert (= (and b!543155 res!337706) b!543151))

(assert (= (and b!543151 res!337704) b!543150))

(assert (= (and b!543150 res!337705) b!543152))

(assert (= (and b!543152 res!337709) b!543158))

(assert (= (and b!543158 res!337703) b!543153))

(assert (= (and b!543153 res!337710) b!543160))

(assert (= (and b!543160 res!337702) b!543157))

(declare-fun m!521289 () Bool)

(assert (=> start!49314 m!521289))

(declare-fun m!521291 () Bool)

(assert (=> start!49314 m!521291))

(declare-fun m!521293 () Bool)

(assert (=> b!543157 m!521293))

(declare-fun m!521295 () Bool)

(assert (=> b!543160 m!521295))

(declare-fun m!521297 () Bool)

(assert (=> b!543160 m!521297))

(assert (=> b!543153 m!521297))

(assert (=> b!543153 m!521297))

(declare-fun m!521299 () Bool)

(assert (=> b!543153 m!521299))

(assert (=> b!543153 m!521299))

(assert (=> b!543153 m!521297))

(declare-fun m!521301 () Bool)

(assert (=> b!543153 m!521301))

(declare-fun m!521303 () Bool)

(assert (=> b!543152 m!521303))

(assert (=> b!543152 m!521297))

(declare-fun m!521305 () Bool)

(assert (=> b!543155 m!521305))

(declare-fun m!521307 () Bool)

(assert (=> b!543154 m!521307))

(declare-fun m!521309 () Bool)

(assert (=> b!543150 m!521309))

(declare-fun m!521311 () Bool)

(assert (=> b!543156 m!521311))

(assert (=> b!543158 m!521297))

(assert (=> b!543158 m!521297))

(declare-fun m!521313 () Bool)

(assert (=> b!543158 m!521313))

(declare-fun m!521315 () Bool)

(assert (=> b!543151 m!521315))

(assert (=> b!543161 m!521297))

(assert (=> b!543161 m!521297))

(declare-fun m!521317 () Bool)

(assert (=> b!543161 m!521317))

(push 1)

