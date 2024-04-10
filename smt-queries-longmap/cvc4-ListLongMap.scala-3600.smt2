; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49594 () Bool)

(assert start!49594)

(declare-fun b!545548 () Bool)

(declare-fun res!339479 () Bool)

(declare-fun e!315337 () Bool)

(assert (=> b!545548 (=> (not res!339479) (not e!315337))))

(declare-datatypes ((array!34407 0))(
  ( (array!34408 (arr!16532 (Array (_ BitVec 32) (_ BitVec 64))) (size!16896 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34407)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!545548 (= res!339479 (validKeyInArray!0 (select (arr!16532 a!3154) j!147)))))

(declare-fun b!545549 () Bool)

(declare-fun res!339477 () Bool)

(assert (=> b!545549 (=> (not res!339477) (not e!315337))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!545549 (= res!339477 (validKeyInArray!0 k!1998))))

(declare-fun b!545550 () Bool)

(declare-fun res!339482 () Bool)

(assert (=> b!545550 (=> (not res!339482) (not e!315337))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!545550 (= res!339482 (and (= (size!16896 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16896 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16896 a!3154)) (not (= i!1153 j!147))))))

(declare-datatypes ((SeekEntryResult!4990 0))(
  ( (MissingZero!4990 (index!22184 (_ BitVec 32))) (Found!4990 (index!22185 (_ BitVec 32))) (Intermediate!4990 (undefined!5802 Bool) (index!22186 (_ BitVec 32)) (x!51110 (_ BitVec 32))) (Undefined!4990) (MissingVacant!4990 (index!22187 (_ BitVec 32))) )
))
(declare-fun lt!248876 () SeekEntryResult!4990)

(declare-fun e!315339 () Bool)

(declare-fun b!545551 () Bool)

(declare-fun lt!248880 () SeekEntryResult!4990)

(declare-fun lt!248881 () SeekEntryResult!4990)

(assert (=> b!545551 (= e!315339 (and (= lt!248876 lt!248880) (not (= lt!248881 lt!248876))))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248877 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34407 (_ BitVec 32)) SeekEntryResult!4990)

(assert (=> b!545551 (= lt!248876 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!248877 (select (arr!16532 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545552 () Bool)

(declare-fun res!339485 () Bool)

(declare-fun e!315334 () Bool)

(assert (=> b!545552 (=> (not res!339485) (not e!315334))))

(declare-datatypes ((List!10651 0))(
  ( (Nil!10648) (Cons!10647 (h!11611 (_ BitVec 64)) (t!16879 List!10651)) )
))
(declare-fun arrayNoDuplicates!0 (array!34407 (_ BitVec 32) List!10651) Bool)

(assert (=> b!545552 (= res!339485 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10648))))

(declare-fun b!545553 () Bool)

(assert (=> b!545553 (= e!315337 e!315334)))

(declare-fun res!339478 () Bool)

(assert (=> b!545553 (=> (not res!339478) (not e!315334))))

(declare-fun lt!248878 () SeekEntryResult!4990)

(assert (=> b!545553 (= res!339478 (or (= lt!248878 (MissingZero!4990 i!1153)) (= lt!248878 (MissingVacant!4990 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34407 (_ BitVec 32)) SeekEntryResult!4990)

(assert (=> b!545553 (= lt!248878 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!545554 () Bool)

(declare-fun e!315336 () Bool)

(declare-fun e!315338 () Bool)

(assert (=> b!545554 (= e!315336 e!315338)))

(declare-fun res!339484 () Bool)

(assert (=> b!545554 (=> (not res!339484) (not e!315338))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun lt!248879 () SeekEntryResult!4990)

(assert (=> b!545554 (= res!339484 (and (= lt!248881 lt!248879) (not (= (select (arr!16532 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16532 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16532 a!3154) index!1177) (select (arr!16532 a!3154) j!147)))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545554 (= lt!248881 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16532 a!3154) j!147) mask!3216) (select (arr!16532 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!545555 () Bool)

(declare-fun res!339475 () Bool)

(assert (=> b!545555 (=> (not res!339475) (not e!315337))))

(declare-fun arrayContainsKey!0 (array!34407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!545555 (= res!339475 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!545556 () Bool)

(assert (=> b!545556 (= e!315338 e!315339)))

(declare-fun res!339474 () Bool)

(assert (=> b!545556 (=> (not res!339474) (not e!315339))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!545556 (= res!339474 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!248877 #b00000000000000000000000000000000) (bvslt lt!248877 (size!16896 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!545556 (= lt!248877 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!545547 () Bool)

(assert (=> b!545547 (= e!315334 e!315336)))

(declare-fun res!339483 () Bool)

(assert (=> b!545547 (=> (not res!339483) (not e!315336))))

(assert (=> b!545547 (= res!339483 (= lt!248879 lt!248880))))

(declare-fun resIndex!32 () (_ BitVec 32))

(assert (=> b!545547 (= lt!248880 (Intermediate!4990 false resIndex!32 resX!32))))

(assert (=> b!545547 (= lt!248879 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16532 a!3154) j!147) a!3154 mask!3216))))

(declare-fun res!339480 () Bool)

(assert (=> start!49594 (=> (not res!339480) (not e!315337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49594 (= res!339480 (validMask!0 mask!3216))))

(assert (=> start!49594 e!315337))

(assert (=> start!49594 true))

(declare-fun array_inv!12328 (array!34407) Bool)

(assert (=> start!49594 (array_inv!12328 a!3154)))

(declare-fun b!545557 () Bool)

(declare-fun res!339476 () Bool)

(assert (=> b!545557 (=> (not res!339476) (not e!315334))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34407 (_ BitVec 32)) Bool)

(assert (=> b!545557 (= res!339476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!545558 () Bool)

(declare-fun res!339481 () Bool)

(assert (=> b!545558 (=> (not res!339481) (not e!315334))))

(assert (=> b!545558 (= res!339481 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16896 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16896 a!3154)) (= (select (arr!16532 a!3154) resIndex!32) (select (arr!16532 a!3154) j!147))))))

(assert (= (and start!49594 res!339480) b!545550))

(assert (= (and b!545550 res!339482) b!545548))

(assert (= (and b!545548 res!339479) b!545549))

(assert (= (and b!545549 res!339477) b!545555))

(assert (= (and b!545555 res!339475) b!545553))

(assert (= (and b!545553 res!339478) b!545557))

(assert (= (and b!545557 res!339476) b!545552))

(assert (= (and b!545552 res!339485) b!545558))

(assert (= (and b!545558 res!339481) b!545547))

(assert (= (and b!545547 res!339483) b!545554))

(assert (= (and b!545554 res!339484) b!545556))

(assert (= (and b!545556 res!339474) b!545551))

(declare-fun m!523105 () Bool)

(assert (=> b!545555 m!523105))

(declare-fun m!523107 () Bool)

(assert (=> b!545557 m!523107))

(declare-fun m!523109 () Bool)

(assert (=> b!545556 m!523109))

(declare-fun m!523111 () Bool)

(assert (=> b!545549 m!523111))

(declare-fun m!523113 () Bool)

(assert (=> b!545551 m!523113))

(assert (=> b!545551 m!523113))

(declare-fun m!523115 () Bool)

(assert (=> b!545551 m!523115))

(declare-fun m!523117 () Bool)

(assert (=> start!49594 m!523117))

(declare-fun m!523119 () Bool)

(assert (=> start!49594 m!523119))

(declare-fun m!523121 () Bool)

(assert (=> b!545553 m!523121))

(declare-fun m!523123 () Bool)

(assert (=> b!545552 m!523123))

(declare-fun m!523125 () Bool)

(assert (=> b!545558 m!523125))

(assert (=> b!545558 m!523113))

(assert (=> b!545547 m!523113))

(assert (=> b!545547 m!523113))

(declare-fun m!523127 () Bool)

(assert (=> b!545547 m!523127))

(assert (=> b!545548 m!523113))

(assert (=> b!545548 m!523113))

(declare-fun m!523129 () Bool)

(assert (=> b!545548 m!523129))

(declare-fun m!523131 () Bool)

(assert (=> b!545554 m!523131))

(assert (=> b!545554 m!523113))

(assert (=> b!545554 m!523113))

(declare-fun m!523133 () Bool)

(assert (=> b!545554 m!523133))

(assert (=> b!545554 m!523133))

(assert (=> b!545554 m!523113))

(declare-fun m!523135 () Bool)

(assert (=> b!545554 m!523135))

(push 1)

(assert (not b!545556))

(assert (not b!545555))

(assert (not b!545557))

(assert (not start!49594))

(assert (not b!545549))

(assert (not b!545554))

(assert (not b!545547))

