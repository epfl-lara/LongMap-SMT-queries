; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48718 () Bool)

(assert start!48718)

(declare-fun b!535519 () Bool)

(declare-fun res!330724 () Bool)

(declare-fun e!311064 () Bool)

(assert (=> b!535519 (=> (not res!330724) (not e!311064))))

(declare-datatypes ((array!33930 0))(
  ( (array!33931 (arr!16304 (Array (_ BitVec 32) (_ BitVec 64))) (size!16668 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33930)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!535519 (= res!330724 (validKeyInArray!0 (select (arr!16304 a!3154) j!147)))))

(declare-fun b!535520 () Bool)

(declare-fun res!330731 () Bool)

(declare-fun e!311065 () Bool)

(assert (=> b!535520 (=> (not res!330731) (not e!311065))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!535520 (= res!330731 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16668 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16668 a!3154)) (= (select (arr!16304 a!3154) resIndex!32) (select (arr!16304 a!3154) j!147))))))

(declare-fun b!535521 () Bool)

(declare-fun res!330727 () Bool)

(assert (=> b!535521 (=> (not res!330727) (not e!311064))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!535521 (= res!330727 (validKeyInArray!0 k!1998))))

(declare-fun b!535522 () Bool)

(declare-fun e!311066 () Bool)

(assert (=> b!535522 (= e!311065 e!311066)))

(declare-fun res!330728 () Bool)

(assert (=> b!535522 (=> (not res!330728) (not e!311066))))

(declare-datatypes ((SeekEntryResult!4762 0))(
  ( (MissingZero!4762 (index!21272 (_ BitVec 32))) (Found!4762 (index!21273 (_ BitVec 32))) (Intermediate!4762 (undefined!5574 Bool) (index!21274 (_ BitVec 32)) (x!50217 (_ BitVec 32))) (Undefined!4762) (MissingVacant!4762 (index!21275 (_ BitVec 32))) )
))
(declare-fun lt!245838 () SeekEntryResult!4762)

(assert (=> b!535522 (= res!330728 (= lt!245838 (Intermediate!4762 false resIndex!32 resX!32)))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33930 (_ BitVec 32)) SeekEntryResult!4762)

(assert (=> b!535522 (= lt!245838 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16304 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!535523 () Bool)

(assert (=> b!535523 (= e!311064 e!311065)))

(declare-fun res!330730 () Bool)

(assert (=> b!535523 (=> (not res!330730) (not e!311065))))

(declare-fun lt!245839 () SeekEntryResult!4762)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!535523 (= res!330730 (or (= lt!245839 (MissingZero!4762 i!1153)) (= lt!245839 (MissingVacant!4762 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33930 (_ BitVec 32)) SeekEntryResult!4762)

(assert (=> b!535523 (= lt!245839 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!535524 () Bool)

(declare-fun res!330734 () Bool)

(assert (=> b!535524 (=> (not res!330734) (not e!311065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33930 (_ BitVec 32)) Bool)

(assert (=> b!535524 (= res!330734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!535525 () Bool)

(declare-fun res!330729 () Bool)

(assert (=> b!535525 (=> (not res!330729) (not e!311066))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!535525 (= res!330729 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16304 a!3154) j!147) mask!3216) (select (arr!16304 a!3154) j!147) a!3154 mask!3216) lt!245838))))

(declare-fun b!535526 () Bool)

(declare-fun res!330725 () Bool)

(assert (=> b!535526 (=> (not res!330725) (not e!311064))))

(declare-fun arrayContainsKey!0 (array!33930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!535526 (= res!330725 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!535527 () Bool)

(assert (=> b!535527 (= e!311066 (and (not (= (select (arr!16304 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16304 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16304 a!3154) index!1177) (select (arr!16304 a!3154) j!147))) (bvslt mask!3216 #b00000000000000000000000000000000)))))

(declare-fun res!330733 () Bool)

(assert (=> start!48718 (=> (not res!330733) (not e!311064))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48718 (= res!330733 (validMask!0 mask!3216))))

(assert (=> start!48718 e!311064))

(assert (=> start!48718 true))

(declare-fun array_inv!12100 (array!33930) Bool)

(assert (=> start!48718 (array_inv!12100 a!3154)))

(declare-fun b!535528 () Bool)

(declare-fun res!330732 () Bool)

(assert (=> b!535528 (=> (not res!330732) (not e!311064))))

(assert (=> b!535528 (= res!330732 (and (= (size!16668 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16668 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16668 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!535529 () Bool)

(declare-fun res!330726 () Bool)

(assert (=> b!535529 (=> (not res!330726) (not e!311065))))

(declare-datatypes ((List!10423 0))(
  ( (Nil!10420) (Cons!10419 (h!11362 (_ BitVec 64)) (t!16651 List!10423)) )
))
(declare-fun arrayNoDuplicates!0 (array!33930 (_ BitVec 32) List!10423) Bool)

(assert (=> b!535529 (= res!330726 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10420))))

(assert (= (and start!48718 res!330733) b!535528))

(assert (= (and b!535528 res!330732) b!535519))

(assert (= (and b!535519 res!330724) b!535521))

(assert (= (and b!535521 res!330727) b!535526))

(assert (= (and b!535526 res!330725) b!535523))

(assert (= (and b!535523 res!330730) b!535524))

(assert (= (and b!535524 res!330734) b!535529))

(assert (= (and b!535529 res!330726) b!535520))

(assert (= (and b!535520 res!330731) b!535522))

(assert (= (and b!535522 res!330728) b!535525))

(assert (= (and b!535525 res!330729) b!535527))

(declare-fun m!515093 () Bool)

(assert (=> b!535525 m!515093))

(assert (=> b!535525 m!515093))

(declare-fun m!515095 () Bool)

(assert (=> b!535525 m!515095))

(assert (=> b!535525 m!515095))

(assert (=> b!535525 m!515093))

(declare-fun m!515097 () Bool)

(assert (=> b!535525 m!515097))

(declare-fun m!515099 () Bool)

(assert (=> b!535521 m!515099))

(declare-fun m!515101 () Bool)

(assert (=> start!48718 m!515101))

(declare-fun m!515103 () Bool)

(assert (=> start!48718 m!515103))

(declare-fun m!515105 () Bool)

(assert (=> b!535523 m!515105))

(assert (=> b!535522 m!515093))

(assert (=> b!535522 m!515093))

(declare-fun m!515107 () Bool)

(assert (=> b!535522 m!515107))

(declare-fun m!515109 () Bool)

(assert (=> b!535527 m!515109))

(assert (=> b!535527 m!515093))

(declare-fun m!515111 () Bool)

(assert (=> b!535526 m!515111))

(declare-fun m!515113 () Bool)

(assert (=> b!535520 m!515113))

(assert (=> b!535520 m!515093))

(declare-fun m!515115 () Bool)

(assert (=> b!535529 m!515115))

(assert (=> b!535519 m!515093))

(assert (=> b!535519 m!515093))

(declare-fun m!515117 () Bool)

(assert (=> b!535519 m!515117))

(declare-fun m!515119 () Bool)

(assert (=> b!535524 m!515119))

(push 1)

(assert (not start!48718))

(assert (not b!535526))

(assert (not b!535524))

(assert (not b!535525))

(assert (not b!535522))

(assert (not b!535521))

(assert (not b!535519))

(assert (not b!535523))

(assert (not b!535529))

(check-sat)

