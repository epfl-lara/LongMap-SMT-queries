; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68930 () Bool)

(assert start!68930)

(declare-fun b!804110 () Bool)

(declare-fun res!548630 () Bool)

(declare-fun e!445516 () Bool)

(assert (=> b!804110 (=> (not res!548630) (not e!445516))))

(declare-datatypes ((array!43720 0))(
  ( (array!43721 (arr!20940 (Array (_ BitVec 32) (_ BitVec 64))) (size!21361 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43720)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804110 (= res!548630 (validKeyInArray!0 (select (arr!20940 a!3170) j!153)))))

(declare-fun res!548629 () Bool)

(assert (=> start!68930 (=> (not res!548629) (not e!445516))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68930 (= res!548629 (validMask!0 mask!3266))))

(assert (=> start!68930 e!445516))

(assert (=> start!68930 true))

(declare-fun array_inv!16736 (array!43720) Bool)

(assert (=> start!68930 (array_inv!16736 a!3170)))

(declare-fun b!804111 () Bool)

(declare-fun res!548631 () Bool)

(assert (=> b!804111 (=> (not res!548631) (not e!445516))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43720 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804111 (= res!548631 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804112 () Bool)

(declare-fun res!548636 () Bool)

(assert (=> b!804112 (=> (not res!548636) (not e!445516))))

(assert (=> b!804112 (= res!548636 (validKeyInArray!0 k!2044))))

(declare-fun b!804113 () Bool)

(declare-fun res!548633 () Bool)

(assert (=> b!804113 (=> (not res!548633) (not e!445516))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804113 (= res!548633 (and (= (size!21361 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21361 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21361 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804114 () Bool)

(declare-fun res!548634 () Bool)

(declare-fun e!445515 () Bool)

(assert (=> b!804114 (=> (not res!548634) (not e!445515))))

(declare-datatypes ((List!14903 0))(
  ( (Nil!14900) (Cons!14899 (h!16028 (_ BitVec 64)) (t!21218 List!14903)) )
))
(declare-fun arrayNoDuplicates!0 (array!43720 (_ BitVec 32) List!14903) Bool)

(assert (=> b!804114 (= res!548634 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14900))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!804115 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804115 (= e!445515 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21361 a!3170)) (= vacantBefore!23 i!1163) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (size!21361 a!3170)))))))

(declare-fun b!804116 () Bool)

(declare-fun res!548632 () Bool)

(assert (=> b!804116 (=> (not res!548632) (not e!445515))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43720 (_ BitVec 32)) Bool)

(assert (=> b!804116 (= res!548632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804117 () Bool)

(assert (=> b!804117 (= e!445516 e!445515)))

(declare-fun res!548635 () Bool)

(assert (=> b!804117 (=> (not res!548635) (not e!445515))))

(declare-datatypes ((SeekEntryResult!8531 0))(
  ( (MissingZero!8531 (index!36492 (_ BitVec 32))) (Found!8531 (index!36493 (_ BitVec 32))) (Intermediate!8531 (undefined!9343 Bool) (index!36494 (_ BitVec 32)) (x!67329 (_ BitVec 32))) (Undefined!8531) (MissingVacant!8531 (index!36495 (_ BitVec 32))) )
))
(declare-fun lt!360068 () SeekEntryResult!8531)

(assert (=> b!804117 (= res!548635 (or (= lt!360068 (MissingZero!8531 i!1163)) (= lt!360068 (MissingVacant!8531 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43720 (_ BitVec 32)) SeekEntryResult!8531)

(assert (=> b!804117 (= lt!360068 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68930 res!548629) b!804113))

(assert (= (and b!804113 res!548633) b!804110))

(assert (= (and b!804110 res!548630) b!804112))

(assert (= (and b!804112 res!548636) b!804111))

(assert (= (and b!804111 res!548631) b!804117))

(assert (= (and b!804117 res!548635) b!804116))

(assert (= (and b!804116 res!548632) b!804114))

(assert (= (and b!804114 res!548634) b!804115))

(declare-fun m!746039 () Bool)

(assert (=> b!804111 m!746039))

(declare-fun m!746041 () Bool)

(assert (=> b!804114 m!746041))

(declare-fun m!746043 () Bool)

(assert (=> b!804117 m!746043))

(declare-fun m!746045 () Bool)

(assert (=> b!804112 m!746045))

(declare-fun m!746047 () Bool)

(assert (=> b!804116 m!746047))

(declare-fun m!746049 () Bool)

(assert (=> b!804110 m!746049))

(assert (=> b!804110 m!746049))

(declare-fun m!746051 () Bool)

(assert (=> b!804110 m!746051))

(declare-fun m!746053 () Bool)

(assert (=> start!68930 m!746053))

(declare-fun m!746055 () Bool)

(assert (=> start!68930 m!746055))

(push 1)

(assert (not b!804117))

(assert (not b!804111))

(assert (not start!68930))

(assert (not b!804112))

(assert (not b!804110))

(assert (not b!804114))

(assert (not b!804116))

(check-sat)

(pop 1)

(push 1)

(check-sat)

