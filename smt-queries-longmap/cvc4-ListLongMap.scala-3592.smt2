; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49342 () Bool)

(assert start!49342)

(declare-fun b!543654 () Bool)

(declare-fun res!338214 () Bool)

(declare-fun e!314371 () Bool)

(assert (=> b!543654 (=> (not res!338214) (not e!314371))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543654 (= res!338214 (validKeyInArray!0 k!1998))))

(declare-fun b!543655 () Bool)

(declare-fun e!314372 () Bool)

(assert (=> b!543655 (= e!314372 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun lt!248225 () (_ BitVec 32))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543655 (= lt!248225 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!543656 () Bool)

(declare-fun res!338215 () Bool)

(assert (=> b!543656 (=> (not res!338215) (not e!314372))))

(declare-datatypes ((array!34350 0))(
  ( (array!34351 (arr!16508 (Array (_ BitVec 32) (_ BitVec 64))) (size!16872 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34350)

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4966 0))(
  ( (MissingZero!4966 (index!22088 (_ BitVec 32))) (Found!4966 (index!22089 (_ BitVec 32))) (Intermediate!4966 (undefined!5778 Bool) (index!22090 (_ BitVec 32)) (x!50989 (_ BitVec 32))) (Undefined!4966) (MissingVacant!4966 (index!22091 (_ BitVec 32))) )
))
(declare-fun lt!248227 () SeekEntryResult!4966)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34350 (_ BitVec 32)) SeekEntryResult!4966)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543656 (= res!338215 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16508 a!3154) j!147) mask!3216) (select (arr!16508 a!3154) j!147) a!3154 mask!3216) lt!248227))))

(declare-fun b!543657 () Bool)

(declare-fun res!338213 () Bool)

(assert (=> b!543657 (=> (not res!338213) (not e!314372))))

(assert (=> b!543657 (= res!338213 (and (not (= (select (arr!16508 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16508 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16508 a!3154) index!1177) (select (arr!16508 a!3154) j!147)))))))

(declare-fun b!543658 () Bool)

(declare-fun e!314373 () Bool)

(assert (=> b!543658 (= e!314373 e!314372)))

(declare-fun res!338209 () Bool)

(assert (=> b!543658 (=> (not res!338209) (not e!314372))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543658 (= res!338209 (= lt!248227 (Intermediate!4966 false resIndex!32 resX!32)))))

(assert (=> b!543658 (= lt!248227 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16508 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543659 () Bool)

(declare-fun res!338206 () Bool)

(assert (=> b!543659 (=> (not res!338206) (not e!314371))))

(declare-fun arrayContainsKey!0 (array!34350 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543659 (= res!338206 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543660 () Bool)

(declare-fun res!338216 () Bool)

(assert (=> b!543660 (=> (not res!338216) (not e!314373))))

(assert (=> b!543660 (= res!338216 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16872 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16872 a!3154)) (= (select (arr!16508 a!3154) resIndex!32) (select (arr!16508 a!3154) j!147))))))

(declare-fun b!543661 () Bool)

(declare-fun res!338205 () Bool)

(assert (=> b!543661 (=> (not res!338205) (not e!314373))))

(declare-datatypes ((List!10627 0))(
  ( (Nil!10624) (Cons!10623 (h!11578 (_ BitVec 64)) (t!16855 List!10627)) )
))
(declare-fun arrayNoDuplicates!0 (array!34350 (_ BitVec 32) List!10627) Bool)

(assert (=> b!543661 (= res!338205 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10624))))

(declare-fun b!543663 () Bool)

(declare-fun res!338210 () Bool)

(assert (=> b!543663 (=> (not res!338210) (not e!314373))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34350 (_ BitVec 32)) Bool)

(assert (=> b!543663 (= res!338210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543664 () Bool)

(declare-fun res!338207 () Bool)

(assert (=> b!543664 (=> (not res!338207) (not e!314371))))

(assert (=> b!543664 (= res!338207 (validKeyInArray!0 (select (arr!16508 a!3154) j!147)))))

(declare-fun b!543665 () Bool)

(declare-fun res!338212 () Bool)

(assert (=> b!543665 (=> (not res!338212) (not e!314371))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543665 (= res!338212 (and (= (size!16872 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16872 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16872 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543662 () Bool)

(assert (=> b!543662 (= e!314371 e!314373)))

(declare-fun res!338211 () Bool)

(assert (=> b!543662 (=> (not res!338211) (not e!314373))))

(declare-fun lt!248226 () SeekEntryResult!4966)

(assert (=> b!543662 (= res!338211 (or (= lt!248226 (MissingZero!4966 i!1153)) (= lt!248226 (MissingVacant!4966 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34350 (_ BitVec 32)) SeekEntryResult!4966)

(assert (=> b!543662 (= lt!248226 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun res!338208 () Bool)

(assert (=> start!49342 (=> (not res!338208) (not e!314371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49342 (= res!338208 (validMask!0 mask!3216))))

(assert (=> start!49342 e!314371))

(assert (=> start!49342 true))

(declare-fun array_inv!12304 (array!34350) Bool)

(assert (=> start!49342 (array_inv!12304 a!3154)))

(assert (= (and start!49342 res!338208) b!543665))

(assert (= (and b!543665 res!338212) b!543664))

(assert (= (and b!543664 res!338207) b!543654))

(assert (= (and b!543654 res!338214) b!543659))

(assert (= (and b!543659 res!338206) b!543662))

(assert (= (and b!543662 res!338211) b!543663))

(assert (= (and b!543663 res!338210) b!543661))

(assert (= (and b!543661 res!338205) b!543660))

(assert (= (and b!543660 res!338216) b!543658))

(assert (= (and b!543658 res!338209) b!543656))

(assert (= (and b!543656 res!338215) b!543657))

(assert (= (and b!543657 res!338213) b!543655))

(declare-fun m!521709 () Bool)

(assert (=> b!543664 m!521709))

(assert (=> b!543664 m!521709))

(declare-fun m!521711 () Bool)

(assert (=> b!543664 m!521711))

(declare-fun m!521713 () Bool)

(assert (=> start!49342 m!521713))

(declare-fun m!521715 () Bool)

(assert (=> start!49342 m!521715))

(declare-fun m!521717 () Bool)

(assert (=> b!543657 m!521717))

(assert (=> b!543657 m!521709))

(declare-fun m!521719 () Bool)

(assert (=> b!543662 m!521719))

(declare-fun m!521721 () Bool)

(assert (=> b!543654 m!521721))

(declare-fun m!521723 () Bool)

(assert (=> b!543661 m!521723))

(declare-fun m!521725 () Bool)

(assert (=> b!543655 m!521725))

(declare-fun m!521727 () Bool)

(assert (=> b!543660 m!521727))

(assert (=> b!543660 m!521709))

(declare-fun m!521729 () Bool)

(assert (=> b!543663 m!521729))

(assert (=> b!543656 m!521709))

(assert (=> b!543656 m!521709))

(declare-fun m!521731 () Bool)

(assert (=> b!543656 m!521731))

(assert (=> b!543656 m!521731))

(assert (=> b!543656 m!521709))

(declare-fun m!521733 () Bool)

(assert (=> b!543656 m!521733))

(declare-fun m!521735 () Bool)

(assert (=> b!543659 m!521735))

(assert (=> b!543658 m!521709))

(assert (=> b!543658 m!521709))

(declare-fun m!521737 () Bool)

(assert (=> b!543658 m!521737))

(push 1)

(assert (not b!543655))

(assert (not b!543663))

(assert (not b!543662))

