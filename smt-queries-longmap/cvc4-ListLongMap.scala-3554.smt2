; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48898 () Bool)

(assert start!48898)

(declare-fun b!538952 () Bool)

(declare-fun res!334161 () Bool)

(declare-fun e!312497 () Bool)

(assert (=> b!538952 (=> (not res!334161) (not e!312497))))

(declare-datatypes ((array!34110 0))(
  ( (array!34111 (arr!16394 (Array (_ BitVec 32) (_ BitVec 64))) (size!16758 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34110)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!538952 (= res!334161 (validKeyInArray!0 (select (arr!16394 a!3154) j!147)))))

(declare-fun res!334162 () Bool)

(assert (=> start!48898 (=> (not res!334162) (not e!312497))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48898 (= res!334162 (validMask!0 mask!3216))))

(assert (=> start!48898 e!312497))

(assert (=> start!48898 true))

(declare-fun array_inv!12190 (array!34110) Bool)

(assert (=> start!48898 (array_inv!12190 a!3154)))

(declare-fun b!538953 () Bool)

(declare-fun res!334163 () Bool)

(assert (=> b!538953 (=> (not res!334163) (not e!312497))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!538953 (= res!334163 (validKeyInArray!0 k!1998))))

(declare-fun b!538954 () Bool)

(declare-fun res!334158 () Bool)

(declare-fun e!312496 () Bool)

(assert (=> b!538954 (=> (not res!334158) (not e!312496))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34110 (_ BitVec 32)) Bool)

(assert (=> b!538954 (= res!334158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!538955 () Bool)

(declare-fun res!334160 () Bool)

(assert (=> b!538955 (=> (not res!334160) (not e!312497))))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!538955 (= res!334160 (and (= (size!16758 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16758 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16758 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!538956 () Bool)

(assert (=> b!538956 (= e!312497 e!312496)))

(declare-fun res!334157 () Bool)

(assert (=> b!538956 (=> (not res!334157) (not e!312496))))

(declare-datatypes ((SeekEntryResult!4852 0))(
  ( (MissingZero!4852 (index!21632 (_ BitVec 32))) (Found!4852 (index!21633 (_ BitVec 32))) (Intermediate!4852 (undefined!5664 Bool) (index!21634 (_ BitVec 32)) (x!50547 (_ BitVec 32))) (Undefined!4852) (MissingVacant!4852 (index!21635 (_ BitVec 32))) )
))
(declare-fun lt!247026 () SeekEntryResult!4852)

(assert (=> b!538956 (= res!334157 (or (= lt!247026 (MissingZero!4852 i!1153)) (= lt!247026 (MissingVacant!4852 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34110 (_ BitVec 32)) SeekEntryResult!4852)

(assert (=> b!538956 (= lt!247026 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!538957 () Bool)

(declare-fun res!334159 () Bool)

(assert (=> b!538957 (=> (not res!334159) (not e!312497))))

(declare-fun arrayContainsKey!0 (array!34110 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!538957 (= res!334159 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!538958 () Bool)

(assert (=> b!538958 (= e!312496 false)))

(declare-fun lt!247027 () Bool)

(declare-datatypes ((List!10513 0))(
  ( (Nil!10510) (Cons!10509 (h!11452 (_ BitVec 64)) (t!16741 List!10513)) )
))
(declare-fun arrayNoDuplicates!0 (array!34110 (_ BitVec 32) List!10513) Bool)

(assert (=> b!538958 (= lt!247027 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10510))))

(assert (= (and start!48898 res!334162) b!538955))

(assert (= (and b!538955 res!334160) b!538952))

(assert (= (and b!538952 res!334161) b!538953))

(assert (= (and b!538953 res!334163) b!538957))

(assert (= (and b!538957 res!334159) b!538956))

(assert (= (and b!538956 res!334157) b!538954))

(assert (= (and b!538954 res!334158) b!538958))

(declare-fun m!518067 () Bool)

(assert (=> b!538954 m!518067))

(declare-fun m!518069 () Bool)

(assert (=> b!538953 m!518069))

(declare-fun m!518071 () Bool)

(assert (=> b!538956 m!518071))

(declare-fun m!518073 () Bool)

(assert (=> b!538958 m!518073))

(declare-fun m!518075 () Bool)

(assert (=> start!48898 m!518075))

(declare-fun m!518077 () Bool)

(assert (=> start!48898 m!518077))

(declare-fun m!518079 () Bool)

(assert (=> b!538952 m!518079))

(assert (=> b!538952 m!518079))

(declare-fun m!518081 () Bool)

(assert (=> b!538952 m!518081))

(declare-fun m!518083 () Bool)

(assert (=> b!538957 m!518083))

(push 1)

(assert (not b!538954))

(assert (not b!538956))

(assert (not b!538952))

(assert (not start!48898))

(assert (not b!538957))

(assert (not b!538953))

