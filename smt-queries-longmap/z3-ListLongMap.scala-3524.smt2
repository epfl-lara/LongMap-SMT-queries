; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48706 () Bool)

(assert start!48706)

(declare-fun b!535392 () Bool)

(declare-fun res!330657 () Bool)

(declare-fun e!311003 () Bool)

(assert (=> b!535392 (=> (not res!330657) (not e!311003))))

(declare-datatypes ((array!33917 0))(
  ( (array!33918 (arr!16297 (Array (_ BitVec 32) (_ BitVec 64))) (size!16661 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33917)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33917 (_ BitVec 32)) Bool)

(assert (=> b!535392 (= res!330657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535393 () Bool)

(declare-fun res!330654 () Bool)

(declare-fun e!311002 () Bool)

(assert (=> b!535393 (=> (not res!330654) (not e!311002))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535393 (= res!330654 (validKeyInArray!0 (select (arr!16297 a!3154) j!147)))))

(declare-fun b!535394 () Bool)

(declare-fun e!311001 () Bool)

(assert (=> b!535394 (= e!311003 e!311001)))

(declare-fun res!330655 () Bool)

(assert (=> b!535394 (=> (not res!330655) (not e!311001))))

(declare-datatypes ((SeekEntryResult!4711 0))(
  ( (MissingZero!4711 (index!21068 (_ BitVec 32))) (Found!4711 (index!21069 (_ BitVec 32))) (Intermediate!4711 (undefined!5523 Bool) (index!21070 (_ BitVec 32)) (x!50163 (_ BitVec 32))) (Undefined!4711) (MissingVacant!4711 (index!21071 (_ BitVec 32))) )
))
(declare-fun lt!245838 () SeekEntryResult!4711)

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535394 (= res!330655 (= lt!245838 (Intermediate!4711 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33917 (_ BitVec 32)) SeekEntryResult!4711)

(assert (=> b!535394 (= lt!245838 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16297 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!330660 () Bool)

(assert (=> start!48706 (=> (not res!330660) (not e!311002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48706 (= res!330660 (validMask!0 mask!3216))))

(assert (=> start!48706 e!311002))

(assert (=> start!48706 true))

(declare-fun array_inv!12156 (array!33917) Bool)

(assert (=> start!48706 (array_inv!12156 a!3154)))

(declare-fun b!535395 () Bool)

(declare-fun res!330661 () Bool)

(assert (=> b!535395 (=> (not res!330661) (not e!311003))))

(assert (=> b!535395 (= res!330661 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16661 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16661 a!3154)) (= (select (arr!16297 a!3154) resIndex!32) (select (arr!16297 a!3154) j!147))))))

(declare-fun b!535396 () Bool)

(declare-fun res!330651 () Bool)

(assert (=> b!535396 (=> (not res!330651) (not e!311001))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535396 (= res!330651 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16297 a!3154) j!147) mask!3216) (select (arr!16297 a!3154) j!147) a!3154 mask!3216) lt!245838))))

(declare-fun b!535397 () Bool)

(assert (=> b!535397 (= e!311001 (and (not (= (select (arr!16297 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16297 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16297 a!3154) index!1177) (select (arr!16297 a!3154) j!147))) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun b!535398 () Bool)

(declare-fun res!330656 () Bool)

(assert (=> b!535398 (=> (not res!330656) (not e!311003))))

(declare-datatypes ((List!10323 0))(
  ( (Nil!10320) (Cons!10319 (h!11262 (_ BitVec 64)) (t!16543 List!10323)) )
))
(declare-fun arrayNoDuplicates!0 (array!33917 (_ BitVec 32) List!10323) Bool)

(assert (=> b!535398 (= res!330656 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10320))))

(declare-fun b!535399 () Bool)

(declare-fun res!330658 () Bool)

(assert (=> b!535399 (=> (not res!330658) (not e!311002))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535399 (= res!330658 (and (= (size!16661 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16661 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16661 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535400 () Bool)

(declare-fun res!330653 () Bool)

(assert (=> b!535400 (=> (not res!330653) (not e!311002))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535400 (= res!330653 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535401 () Bool)

(declare-fun res!330659 () Bool)

(assert (=> b!535401 (=> (not res!330659) (not e!311002))))

(assert (=> b!535401 (= res!330659 (validKeyInArray!0 k0!1998))))

(declare-fun b!535402 () Bool)

(assert (=> b!535402 (= e!311002 e!311003)))

(declare-fun res!330652 () Bool)

(assert (=> b!535402 (=> (not res!330652) (not e!311003))))

(declare-fun lt!245839 () SeekEntryResult!4711)

(assert (=> b!535402 (= res!330652 (or (= lt!245839 (MissingZero!4711 i!1153)) (= lt!245839 (MissingVacant!4711 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33917 (_ BitVec 32)) SeekEntryResult!4711)

(assert (=> b!535402 (= lt!245839 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(assert (= (and start!48706 res!330660) b!535399))

(assert (= (and b!535399 res!330658) b!535393))

(assert (= (and b!535393 res!330654) b!535401))

(assert (= (and b!535401 res!330659) b!535400))

(assert (= (and b!535400 res!330653) b!535402))

(assert (= (and b!535402 res!330652) b!535392))

(assert (= (and b!535392 res!330657) b!535398))

(assert (= (and b!535398 res!330656) b!535395))

(assert (= (and b!535395 res!330661) b!535394))

(assert (= (and b!535394 res!330655) b!535396))

(assert (= (and b!535396 res!330651) b!535397))

(declare-fun m!515221 () Bool)

(assert (=> b!535397 m!515221))

(declare-fun m!515223 () Bool)

(assert (=> b!535397 m!515223))

(declare-fun m!515225 () Bool)

(assert (=> b!535400 m!515225))

(declare-fun m!515227 () Bool)

(assert (=> b!535402 m!515227))

(declare-fun m!515229 () Bool)

(assert (=> b!535392 m!515229))

(assert (=> b!535394 m!515223))

(assert (=> b!535394 m!515223))

(declare-fun m!515231 () Bool)

(assert (=> b!535394 m!515231))

(declare-fun m!515233 () Bool)

(assert (=> b!535395 m!515233))

(assert (=> b!535395 m!515223))

(declare-fun m!515235 () Bool)

(assert (=> b!535401 m!515235))

(assert (=> b!535396 m!515223))

(assert (=> b!535396 m!515223))

(declare-fun m!515237 () Bool)

(assert (=> b!535396 m!515237))

(assert (=> b!535396 m!515237))

(assert (=> b!535396 m!515223))

(declare-fun m!515239 () Bool)

(assert (=> b!535396 m!515239))

(declare-fun m!515241 () Bool)

(assert (=> start!48706 m!515241))

(declare-fun m!515243 () Bool)

(assert (=> start!48706 m!515243))

(declare-fun m!515245 () Bool)

(assert (=> b!535398 m!515245))

(assert (=> b!535393 m!515223))

(assert (=> b!535393 m!515223))

(declare-fun m!515247 () Bool)

(assert (=> b!535393 m!515247))

(check-sat (not b!535401) (not b!535392) (not b!535393) (not b!535394) (not b!535400) (not b!535396) (not start!48706) (not b!535398) (not b!535402))
(check-sat)
