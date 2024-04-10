; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48762 () Bool)

(assert start!48762)

(declare-fun res!331547 () Bool)

(declare-fun e!311378 () Bool)

(assert (=> start!48762 (=> (not res!331547) (not e!311378))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48762 (= res!331547 (validMask!0 mask!3216))))

(assert (=> start!48762 e!311378))

(assert (=> start!48762 true))

(declare-datatypes ((array!33974 0))(
  ( (array!33975 (arr!16326 (Array (_ BitVec 32) (_ BitVec 64))) (size!16690 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33974)

(declare-fun array_inv!12122 (array!33974) Bool)

(assert (=> start!48762 (array_inv!12122 a!3154)))

(declare-fun b!536339 () Bool)

(declare-fun res!331546 () Bool)

(assert (=> b!536339 (=> (not res!331546) (not e!311378))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536339 (= res!331546 (and (= (size!16690 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16690 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16690 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!536340 () Bool)

(declare-fun res!331545 () Bool)

(declare-fun e!311376 () Bool)

(assert (=> b!536340 (=> (not res!331545) (not e!311376))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536340 (= res!331545 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16690 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16690 a!3154)) (= (select (arr!16326 a!3154) resIndex!32) (select (arr!16326 a!3154) j!147))))))

(declare-fun b!536341 () Bool)

(declare-fun res!331555 () Bool)

(declare-fun e!311379 () Bool)

(assert (=> b!536341 (=> (not res!331555) (not e!311379))))

(assert (=> b!536341 (= res!331555 (and (not (= (select (arr!16326 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16326 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16326 a!3154) index!1177) (select (arr!16326 a!3154) j!147)))))))

(declare-fun b!536342 () Bool)

(declare-fun res!331548 () Bool)

(assert (=> b!536342 (=> (not res!331548) (not e!311376))))

(declare-datatypes ((List!10445 0))(
  ( (Nil!10442) (Cons!10441 (h!11384 (_ BitVec 64)) (t!16673 List!10445)) )
))
(declare-fun arrayNoDuplicates!0 (array!33974 (_ BitVec 32) List!10445) Bool)

(assert (=> b!536342 (= res!331548 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10442))))

(declare-fun b!536343 () Bool)

(assert (=> b!536343 (= e!311378 e!311376)))

(declare-fun res!331553 () Bool)

(assert (=> b!536343 (=> (not res!331553) (not e!311376))))

(declare-datatypes ((SeekEntryResult!4784 0))(
  ( (MissingZero!4784 (index!21360 (_ BitVec 32))) (Found!4784 (index!21361 (_ BitVec 32))) (Intermediate!4784 (undefined!5596 Bool) (index!21362 (_ BitVec 32)) (x!50303 (_ BitVec 32))) (Undefined!4784) (MissingVacant!4784 (index!21363 (_ BitVec 32))) )
))
(declare-fun lt!246067 () SeekEntryResult!4784)

(assert (=> b!536343 (= res!331553 (or (= lt!246067 (MissingZero!4784 i!1153)) (= lt!246067 (MissingVacant!4784 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33974 (_ BitVec 32)) SeekEntryResult!4784)

(assert (=> b!536343 (= lt!246067 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536344 () Bool)

(declare-fun res!331544 () Bool)

(assert (=> b!536344 (=> (not res!331544) (not e!311378))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536344 (= res!331544 (validKeyInArray!0 (select (arr!16326 a!3154) j!147)))))

(declare-fun b!536345 () Bool)

(assert (=> b!536345 (= e!311376 e!311379)))

(declare-fun res!331550 () Bool)

(assert (=> b!536345 (=> (not res!331550) (not e!311379))))

(declare-fun lt!246065 () SeekEntryResult!4784)

(assert (=> b!536345 (= res!331550 (= lt!246065 (Intermediate!4784 false resIndex!32 resX!32)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33974 (_ BitVec 32)) SeekEntryResult!4784)

(assert (=> b!536345 (= lt!246065 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16326 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536346 () Bool)

(declare-fun res!331556 () Bool)

(assert (=> b!536346 (=> (not res!331556) (not e!311379))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536346 (= res!331556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16326 a!3154) j!147) mask!3216) (select (arr!16326 a!3154) j!147) a!3154 mask!3216) lt!246065))))

(declare-fun b!536347 () Bool)

(declare-fun res!331552 () Bool)

(assert (=> b!536347 (=> (not res!331552) (not e!311378))))

(declare-fun arrayContainsKey!0 (array!33974 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536347 (= res!331552 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536348 () Bool)

(declare-fun e!311375 () Bool)

(assert (=> b!536348 (= e!311375 false)))

(declare-fun lt!246066 () (_ BitVec 32))

(declare-fun lt!246064 () SeekEntryResult!4784)

(assert (=> b!536348 (= lt!246064 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246066 (select (arr!16326 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536349 () Bool)

(assert (=> b!536349 (= e!311379 e!311375)))

(declare-fun res!331551 () Bool)

(assert (=> b!536349 (=> (not res!331551) (not e!311375))))

(assert (=> b!536349 (= res!331551 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246066 #b00000000000000000000000000000000) (bvslt lt!246066 (size!16690 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536349 (= lt!246066 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536350 () Bool)

(declare-fun res!331554 () Bool)

(assert (=> b!536350 (=> (not res!331554) (not e!311376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33974 (_ BitVec 32)) Bool)

(assert (=> b!536350 (= res!331554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536351 () Bool)

(declare-fun res!331549 () Bool)

(assert (=> b!536351 (=> (not res!331549) (not e!311378))))

(assert (=> b!536351 (= res!331549 (validKeyInArray!0 k!1998))))

(assert (= (and start!48762 res!331547) b!536339))

(assert (= (and b!536339 res!331546) b!536344))

(assert (= (and b!536344 res!331544) b!536351))

(assert (= (and b!536351 res!331549) b!536347))

(assert (= (and b!536347 res!331552) b!536343))

(assert (= (and b!536343 res!331553) b!536350))

(assert (= (and b!536350 res!331554) b!536342))

(assert (= (and b!536342 res!331548) b!536340))

(assert (= (and b!536340 res!331545) b!536345))

(assert (= (and b!536345 res!331550) b!536346))

(assert (= (and b!536346 res!331556) b!536341))

(assert (= (and b!536341 res!331555) b!536349))

(assert (= (and b!536349 res!331551) b!536348))

(declare-fun m!515769 () Bool)

(assert (=> b!536340 m!515769))

(declare-fun m!515771 () Bool)

(assert (=> b!536340 m!515771))

(declare-fun m!515773 () Bool)

(assert (=> start!48762 m!515773))

(declare-fun m!515775 () Bool)

(assert (=> start!48762 m!515775))

(assert (=> b!536344 m!515771))

(assert (=> b!536344 m!515771))

(declare-fun m!515777 () Bool)

(assert (=> b!536344 m!515777))

(assert (=> b!536346 m!515771))

(assert (=> b!536346 m!515771))

(declare-fun m!515779 () Bool)

(assert (=> b!536346 m!515779))

(assert (=> b!536346 m!515779))

(assert (=> b!536346 m!515771))

(declare-fun m!515781 () Bool)

(assert (=> b!536346 m!515781))

(declare-fun m!515783 () Bool)

(assert (=> b!536342 m!515783))

(assert (=> b!536348 m!515771))

(assert (=> b!536348 m!515771))

(declare-fun m!515785 () Bool)

(assert (=> b!536348 m!515785))

(declare-fun m!515787 () Bool)

(assert (=> b!536343 m!515787))

(declare-fun m!515789 () Bool)

(assert (=> b!536341 m!515789))

(assert (=> b!536341 m!515771))

(declare-fun m!515791 () Bool)

(assert (=> b!536351 m!515791))

(assert (=> b!536345 m!515771))

(assert (=> b!536345 m!515771))

(declare-fun m!515793 () Bool)

(assert (=> b!536345 m!515793))

(declare-fun m!515795 () Bool)

(assert (=> b!536350 m!515795))

(declare-fun m!515797 () Bool)

(assert (=> b!536349 m!515797))

(declare-fun m!515799 () Bool)

(assert (=> b!536347 m!515799))

(push 1)

