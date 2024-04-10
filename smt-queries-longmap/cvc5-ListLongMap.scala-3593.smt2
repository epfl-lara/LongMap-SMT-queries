; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49344 () Bool)

(assert start!49344)

(declare-fun b!543690 () Bool)

(declare-fun e!314383 () Bool)

(declare-fun e!314382 () Bool)

(assert (=> b!543690 (= e!314383 e!314382)))

(declare-fun res!338247 () Bool)

(assert (=> b!543690 (=> (not res!338247) (not e!314382))))

(declare-datatypes ((SeekEntryResult!4967 0))(
  ( (MissingZero!4967 (index!22092 (_ BitVec 32))) (Found!4967 (index!22093 (_ BitVec 32))) (Intermediate!4967 (undefined!5779 Bool) (index!22094 (_ BitVec 32)) (x!50998 (_ BitVec 32))) (Undefined!4967) (MissingVacant!4967 (index!22095 (_ BitVec 32))) )
))
(declare-fun lt!248234 () SeekEntryResult!4967)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543690 (= res!338247 (or (= lt!248234 (MissingZero!4967 i!1153)) (= lt!248234 (MissingVacant!4967 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!34352 0))(
  ( (array!34353 (arr!16509 (Array (_ BitVec 32) (_ BitVec 64))) (size!16873 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34352)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34352 (_ BitVec 32)) SeekEntryResult!4967)

(assert (=> b!543690 (= lt!248234 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!543691 () Bool)

(declare-fun res!338241 () Bool)

(assert (=> b!543691 (=> (not res!338241) (not e!314383))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!543691 (= res!338241 (and (= (size!16873 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16873 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16873 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543692 () Bool)

(declare-fun res!338243 () Bool)

(assert (=> b!543692 (=> (not res!338243) (not e!314383))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543692 (= res!338243 (validKeyInArray!0 (select (arr!16509 a!3154) j!147)))))

(declare-fun b!543693 () Bool)

(declare-fun res!338250 () Bool)

(assert (=> b!543693 (=> (not res!338250) (not e!314382))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543693 (= res!338250 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16873 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16873 a!3154)) (= (select (arr!16509 a!3154) resIndex!32) (select (arr!16509 a!3154) j!147))))))

(declare-fun b!543694 () Bool)

(declare-fun res!338245 () Bool)

(declare-fun e!314384 () Bool)

(assert (=> b!543694 (=> (not res!338245) (not e!314384))))

(declare-fun lt!248236 () SeekEntryResult!4967)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34352 (_ BitVec 32)) SeekEntryResult!4967)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543694 (= res!338245 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16509 a!3154) j!147) mask!3216) (select (arr!16509 a!3154) j!147) a!3154 mask!3216) lt!248236))))

(declare-fun b!543695 () Bool)

(declare-fun res!338246 () Bool)

(assert (=> b!543695 (=> (not res!338246) (not e!314383))))

(assert (=> b!543695 (= res!338246 (validKeyInArray!0 k!1998))))

(declare-fun b!543696 () Bool)

(assert (=> b!543696 (= e!314384 false)))

(declare-fun lt!248235 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543696 (= lt!248235 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun res!338244 () Bool)

(assert (=> start!49344 (=> (not res!338244) (not e!314383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49344 (= res!338244 (validMask!0 mask!3216))))

(assert (=> start!49344 e!314383))

(assert (=> start!49344 true))

(declare-fun array_inv!12305 (array!34352) Bool)

(assert (=> start!49344 (array_inv!12305 a!3154)))

(declare-fun b!543697 () Bool)

(declare-fun res!338252 () Bool)

(assert (=> b!543697 (=> (not res!338252) (not e!314383))))

(declare-fun arrayContainsKey!0 (array!34352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543697 (= res!338252 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543698 () Bool)

(declare-fun res!338248 () Bool)

(assert (=> b!543698 (=> (not res!338248) (not e!314382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34352 (_ BitVec 32)) Bool)

(assert (=> b!543698 (= res!338248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543699 () Bool)

(assert (=> b!543699 (= e!314382 e!314384)))

(declare-fun res!338251 () Bool)

(assert (=> b!543699 (=> (not res!338251) (not e!314384))))

(assert (=> b!543699 (= res!338251 (= lt!248236 (Intermediate!4967 false resIndex!32 resX!32)))))

(assert (=> b!543699 (= lt!248236 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16509 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543700 () Bool)

(declare-fun res!338249 () Bool)

(assert (=> b!543700 (=> (not res!338249) (not e!314382))))

(declare-datatypes ((List!10628 0))(
  ( (Nil!10625) (Cons!10624 (h!11579 (_ BitVec 64)) (t!16856 List!10628)) )
))
(declare-fun arrayNoDuplicates!0 (array!34352 (_ BitVec 32) List!10628) Bool)

(assert (=> b!543700 (= res!338249 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10625))))

(declare-fun b!543701 () Bool)

(declare-fun res!338242 () Bool)

(assert (=> b!543701 (=> (not res!338242) (not e!314384))))

(assert (=> b!543701 (= res!338242 (and (not (= (select (arr!16509 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16509 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16509 a!3154) index!1177) (select (arr!16509 a!3154) j!147)))))))

(assert (= (and start!49344 res!338244) b!543691))

(assert (= (and b!543691 res!338241) b!543692))

(assert (= (and b!543692 res!338243) b!543695))

(assert (= (and b!543695 res!338246) b!543697))

(assert (= (and b!543697 res!338252) b!543690))

(assert (= (and b!543690 res!338247) b!543698))

(assert (= (and b!543698 res!338248) b!543700))

(assert (= (and b!543700 res!338249) b!543693))

(assert (= (and b!543693 res!338250) b!543699))

(assert (= (and b!543699 res!338251) b!543694))

(assert (= (and b!543694 res!338245) b!543701))

(assert (= (and b!543701 res!338242) b!543696))

(declare-fun m!521739 () Bool)

(assert (=> start!49344 m!521739))

(declare-fun m!521741 () Bool)

(assert (=> start!49344 m!521741))

(declare-fun m!521743 () Bool)

(assert (=> b!543693 m!521743))

(declare-fun m!521745 () Bool)

(assert (=> b!543693 m!521745))

(declare-fun m!521747 () Bool)

(assert (=> b!543696 m!521747))

(declare-fun m!521749 () Bool)

(assert (=> b!543700 m!521749))

(declare-fun m!521751 () Bool)

(assert (=> b!543698 m!521751))

(assert (=> b!543694 m!521745))

(assert (=> b!543694 m!521745))

(declare-fun m!521753 () Bool)

(assert (=> b!543694 m!521753))

(assert (=> b!543694 m!521753))

(assert (=> b!543694 m!521745))

(declare-fun m!521755 () Bool)

(assert (=> b!543694 m!521755))

(assert (=> b!543692 m!521745))

(assert (=> b!543692 m!521745))

(declare-fun m!521757 () Bool)

(assert (=> b!543692 m!521757))

(declare-fun m!521759 () Bool)

(assert (=> b!543701 m!521759))

(assert (=> b!543701 m!521745))

(assert (=> b!543699 m!521745))

(assert (=> b!543699 m!521745))

(declare-fun m!521761 () Bool)

(assert (=> b!543699 m!521761))

(declare-fun m!521763 () Bool)

(assert (=> b!543690 m!521763))

(declare-fun m!521765 () Bool)

(assert (=> b!543697 m!521765))

(declare-fun m!521767 () Bool)

(assert (=> b!543695 m!521767))

(push 1)

