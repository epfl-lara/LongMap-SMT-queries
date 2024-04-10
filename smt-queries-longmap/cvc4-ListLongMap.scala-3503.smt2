; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48592 () Bool)

(assert start!48592)

(declare-fun res!328793 () Bool)

(declare-fun e!310454 () Bool)

(assert (=> start!48592 (=> (not res!328793) (not e!310454))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48592 (= res!328793 (validMask!0 mask!3216))))

(assert (=> start!48592 e!310454))

(assert (=> start!48592 true))

(declare-datatypes ((array!33804 0))(
  ( (array!33805 (arr!16241 (Array (_ BitVec 32) (_ BitVec 64))) (size!16605 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33804)

(declare-fun array_inv!12037 (array!33804) Bool)

(assert (=> start!48592 (array_inv!12037 a!3154)))

(declare-fun b!533585 () Bool)

(declare-fun e!310455 () Bool)

(assert (=> b!533585 (= e!310454 e!310455)))

(declare-fun res!328792 () Bool)

(assert (=> b!533585 (=> (not res!328792) (not e!310455))))

(declare-datatypes ((SeekEntryResult!4699 0))(
  ( (MissingZero!4699 (index!21020 (_ BitVec 32))) (Found!4699 (index!21021 (_ BitVec 32))) (Intermediate!4699 (undefined!5511 Bool) (index!21022 (_ BitVec 32)) (x!49986 (_ BitVec 32))) (Undefined!4699) (MissingVacant!4699 (index!21023 (_ BitVec 32))) )
))
(declare-fun lt!245461 () SeekEntryResult!4699)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533585 (= res!328792 (or (= lt!245461 (MissingZero!4699 i!1153)) (= lt!245461 (MissingVacant!4699 i!1153))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33804 (_ BitVec 32)) SeekEntryResult!4699)

(assert (=> b!533585 (= lt!245461 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!533586 () Bool)

(declare-fun res!328794 () Bool)

(assert (=> b!533586 (=> (not res!328794) (not e!310454))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533586 (= res!328794 (validKeyInArray!0 k!1998))))

(declare-fun b!533587 () Bool)

(declare-fun res!328798 () Bool)

(assert (=> b!533587 (=> (not res!328798) (not e!310455))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33804 (_ BitVec 32)) SeekEntryResult!4699)

(assert (=> b!533587 (= res!328798 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16241 a!3154) j!147) a!3154 mask!3216) (Intermediate!4699 false resIndex!32 resX!32)))))

(declare-fun b!533588 () Bool)

(declare-fun res!328790 () Bool)

(assert (=> b!533588 (=> (not res!328790) (not e!310455))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33804 (_ BitVec 32)) Bool)

(assert (=> b!533588 (= res!328790 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533589 () Bool)

(declare-fun res!328791 () Bool)

(assert (=> b!533589 (=> (not res!328791) (not e!310455))))

(declare-datatypes ((List!10360 0))(
  ( (Nil!10357) (Cons!10356 (h!11299 (_ BitVec 64)) (t!16588 List!10360)) )
))
(declare-fun arrayNoDuplicates!0 (array!33804 (_ BitVec 32) List!10360) Bool)

(assert (=> b!533589 (= res!328791 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10357))))

(declare-fun b!533590 () Bool)

(declare-fun res!328795 () Bool)

(assert (=> b!533590 (=> (not res!328795) (not e!310455))))

(assert (=> b!533590 (= res!328795 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16605 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16605 a!3154)) (= (select (arr!16241 a!3154) resIndex!32) (select (arr!16241 a!3154) j!147))))))

(declare-fun b!533591 () Bool)

(declare-fun res!328799 () Bool)

(assert (=> b!533591 (=> (not res!328799) (not e!310454))))

(declare-fun arrayContainsKey!0 (array!33804 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533591 (= res!328799 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533592 () Bool)

(declare-fun res!328797 () Bool)

(assert (=> b!533592 (=> (not res!328797) (not e!310454))))

(assert (=> b!533592 (= res!328797 (validKeyInArray!0 (select (arr!16241 a!3154) j!147)))))

(declare-fun b!533593 () Bool)

(assert (=> b!533593 (= e!310455 (and (bvsge mask!3216 #b00000000000000000000000000000000) (bvslt index!1177 (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsgt x!1030 #b01111111111111111111111111111110)))))

(declare-fun b!533594 () Bool)

(declare-fun res!328796 () Bool)

(assert (=> b!533594 (=> (not res!328796) (not e!310454))))

(assert (=> b!533594 (= res!328796 (and (= (size!16605 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16605 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16605 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48592 res!328793) b!533594))

(assert (= (and b!533594 res!328796) b!533592))

(assert (= (and b!533592 res!328797) b!533586))

(assert (= (and b!533586 res!328794) b!533591))

(assert (= (and b!533591 res!328799) b!533585))

(assert (= (and b!533585 res!328792) b!533588))

(assert (= (and b!533588 res!328790) b!533589))

(assert (= (and b!533589 res!328791) b!533590))

(assert (= (and b!533590 res!328795) b!533587))

(assert (= (and b!533587 res!328798) b!533593))

(declare-fun m!513425 () Bool)

(assert (=> start!48592 m!513425))

(declare-fun m!513427 () Bool)

(assert (=> start!48592 m!513427))

(declare-fun m!513429 () Bool)

(assert (=> b!533592 m!513429))

(assert (=> b!533592 m!513429))

(declare-fun m!513431 () Bool)

(assert (=> b!533592 m!513431))

(declare-fun m!513433 () Bool)

(assert (=> b!533589 m!513433))

(declare-fun m!513435 () Bool)

(assert (=> b!533586 m!513435))

(assert (=> b!533587 m!513429))

(assert (=> b!533587 m!513429))

(declare-fun m!513437 () Bool)

(assert (=> b!533587 m!513437))

(declare-fun m!513439 () Bool)

(assert (=> b!533588 m!513439))

(declare-fun m!513441 () Bool)

(assert (=> b!533590 m!513441))

(assert (=> b!533590 m!513429))

(declare-fun m!513443 () Bool)

(assert (=> b!533591 m!513443))

(declare-fun m!513445 () Bool)

(assert (=> b!533585 m!513445))

(push 1)

(assert (not b!533592))

(assert (not b!533587))

(assert (not b!533586))

(assert (not b!533588))

(assert (not start!48592))

(assert (not b!533589))

(assert (not b!533585))

(assert (not b!533591))

(check-sat)

