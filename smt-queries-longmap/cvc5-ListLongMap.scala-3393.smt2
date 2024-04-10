; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46770 () Bool)

(assert start!46770)

(declare-fun b!516568 () Bool)

(declare-fun e!301462 () Bool)

(declare-fun e!301464 () Bool)

(assert (=> b!516568 (= e!301462 (not e!301464))))

(declare-fun res!316137 () Bool)

(assert (=> b!516568 (=> res!316137 e!301464)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236478 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4376 0))(
  ( (MissingZero!4376 (index!19692 (_ BitVec 32))) (Found!4376 (index!19693 (_ BitVec 32))) (Intermediate!4376 (undefined!5188 Bool) (index!19694 (_ BitVec 32)) (x!48651 (_ BitVec 32))) (Undefined!4376) (MissingVacant!4376 (index!19695 (_ BitVec 32))) )
))
(declare-fun lt!236477 () SeekEntryResult!4376)

(declare-datatypes ((array!33082 0))(
  ( (array!33083 (arr!15909 (Array (_ BitVec 32) (_ BitVec 64))) (size!16273 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33082)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33082 (_ BitVec 32)) SeekEntryResult!4376)

(assert (=> b!516568 (= res!316137 (= lt!236477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236478 (select (store (arr!15909 a!3235) i!1204 k!2280) j!176) (array!33083 (store (arr!15909 a!3235) i!1204 k!2280) (size!16273 a!3235)) mask!3524)))))

(declare-fun lt!236479 () (_ BitVec 32))

(assert (=> b!516568 (= lt!236477 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236479 (select (arr!15909 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516568 (= lt!236478 (toIndex!0 (select (store (arr!15909 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516568 (= lt!236479 (toIndex!0 (select (arr!15909 a!3235) j!176) mask!3524))))

(declare-fun e!301463 () Bool)

(assert (=> b!516568 e!301463))

(declare-fun res!316135 () Bool)

(assert (=> b!516568 (=> (not res!316135) (not e!301463))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33082 (_ BitVec 32)) Bool)

(assert (=> b!516568 (= res!316135 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!16010 0))(
  ( (Unit!16011) )
))
(declare-fun lt!236475 () Unit!16010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33082 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16010)

(assert (=> b!516568 (= lt!236475 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516569 () Bool)

(declare-fun res!316136 () Bool)

(declare-fun e!301460 () Bool)

(assert (=> b!516569 (=> (not res!316136) (not e!301460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516569 (= res!316136 (validKeyInArray!0 (select (arr!15909 a!3235) j!176)))))

(declare-fun b!516570 () Bool)

(assert (=> b!516570 (= e!301460 e!301462)))

(declare-fun res!316140 () Bool)

(assert (=> b!516570 (=> (not res!316140) (not e!301462))))

(declare-fun lt!236476 () SeekEntryResult!4376)

(assert (=> b!516570 (= res!316140 (or (= lt!236476 (MissingZero!4376 i!1204)) (= lt!236476 (MissingVacant!4376 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33082 (_ BitVec 32)) SeekEntryResult!4376)

(assert (=> b!516570 (= lt!236476 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516571 () Bool)

(declare-fun res!316134 () Bool)

(assert (=> b!516571 (=> (not res!316134) (not e!301462))))

(assert (=> b!516571 (= res!316134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516572 () Bool)

(declare-fun res!316141 () Bool)

(assert (=> b!516572 (=> (not res!316141) (not e!301462))))

(declare-datatypes ((List!10067 0))(
  ( (Nil!10064) (Cons!10063 (h!10961 (_ BitVec 64)) (t!16295 List!10067)) )
))
(declare-fun arrayNoDuplicates!0 (array!33082 (_ BitVec 32) List!10067) Bool)

(assert (=> b!516572 (= res!316141 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10064))))

(declare-fun b!516573 () Bool)

(declare-fun res!316142 () Bool)

(assert (=> b!516573 (=> (not res!316142) (not e!301460))))

(assert (=> b!516573 (= res!316142 (validKeyInArray!0 k!2280))))

(declare-fun b!516574 () Bool)

(declare-fun res!316139 () Bool)

(assert (=> b!516574 (=> (not res!316139) (not e!301460))))

(declare-fun arrayContainsKey!0 (array!33082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516574 (= res!316139 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!316133 () Bool)

(assert (=> start!46770 (=> (not res!316133) (not e!301460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46770 (= res!316133 (validMask!0 mask!3524))))

(assert (=> start!46770 e!301460))

(assert (=> start!46770 true))

(declare-fun array_inv!11705 (array!33082) Bool)

(assert (=> start!46770 (array_inv!11705 a!3235)))

(declare-fun b!516575 () Bool)

(declare-fun res!316132 () Bool)

(assert (=> b!516575 (=> (not res!316132) (not e!301460))))

(assert (=> b!516575 (= res!316132 (and (= (size!16273 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16273 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16273 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!516576 () Bool)

(assert (=> b!516576 (= e!301463 (= (seekEntryOrOpen!0 (select (arr!15909 a!3235) j!176) a!3235 mask!3524) (Found!4376 j!176)))))

(declare-fun b!516577 () Bool)

(assert (=> b!516577 (= e!301464 (or (not (= (select (arr!15909 a!3235) (index!19694 lt!236477)) (select (arr!15909 a!3235) j!176))) (bvsle (x!48651 lt!236477) #b01111111111111111111111111111110)))))

(assert (=> b!516577 (and (bvslt (x!48651 lt!236477) #b01111111111111111111111111111110) (or (= (select (arr!15909 a!3235) (index!19694 lt!236477)) (select (arr!15909 a!3235) j!176)) (= (select (arr!15909 a!3235) (index!19694 lt!236477)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15909 a!3235) (index!19694 lt!236477)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516578 () Bool)

(declare-fun res!316138 () Bool)

(assert (=> b!516578 (=> res!316138 e!301464)))

(assert (=> b!516578 (= res!316138 (or (undefined!5188 lt!236477) (not (is-Intermediate!4376 lt!236477))))))

(assert (= (and start!46770 res!316133) b!516575))

(assert (= (and b!516575 res!316132) b!516569))

(assert (= (and b!516569 res!316136) b!516573))

(assert (= (and b!516573 res!316142) b!516574))

(assert (= (and b!516574 res!316139) b!516570))

(assert (= (and b!516570 res!316140) b!516571))

(assert (= (and b!516571 res!316134) b!516572))

(assert (= (and b!516572 res!316141) b!516568))

(assert (= (and b!516568 res!316135) b!516576))

(assert (= (and b!516568 (not res!316137)) b!516578))

(assert (= (and b!516578 (not res!316138)) b!516577))

(declare-fun m!498075 () Bool)

(assert (=> b!516570 m!498075))

(declare-fun m!498077 () Bool)

(assert (=> b!516576 m!498077))

(assert (=> b!516576 m!498077))

(declare-fun m!498079 () Bool)

(assert (=> b!516576 m!498079))

(declare-fun m!498081 () Bool)

(assert (=> start!46770 m!498081))

(declare-fun m!498083 () Bool)

(assert (=> start!46770 m!498083))

(assert (=> b!516569 m!498077))

(assert (=> b!516569 m!498077))

(declare-fun m!498085 () Bool)

(assert (=> b!516569 m!498085))

(declare-fun m!498087 () Bool)

(assert (=> b!516572 m!498087))

(declare-fun m!498089 () Bool)

(assert (=> b!516568 m!498089))

(declare-fun m!498091 () Bool)

(assert (=> b!516568 m!498091))

(declare-fun m!498093 () Bool)

(assert (=> b!516568 m!498093))

(declare-fun m!498095 () Bool)

(assert (=> b!516568 m!498095))

(assert (=> b!516568 m!498089))

(assert (=> b!516568 m!498077))

(declare-fun m!498097 () Bool)

(assert (=> b!516568 m!498097))

(assert (=> b!516568 m!498077))

(declare-fun m!498099 () Bool)

(assert (=> b!516568 m!498099))

(assert (=> b!516568 m!498077))

(declare-fun m!498101 () Bool)

(assert (=> b!516568 m!498101))

(assert (=> b!516568 m!498089))

(declare-fun m!498103 () Bool)

(assert (=> b!516568 m!498103))

(declare-fun m!498105 () Bool)

(assert (=> b!516573 m!498105))

(declare-fun m!498107 () Bool)

(assert (=> b!516577 m!498107))

(assert (=> b!516577 m!498077))

(declare-fun m!498109 () Bool)

(assert (=> b!516574 m!498109))

(declare-fun m!498111 () Bool)

(assert (=> b!516571 m!498111))

(push 1)

