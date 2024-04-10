; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68934 () Bool)

(assert start!68934)

(declare-fun b!804158 () Bool)

(declare-fun e!445534 () Bool)

(declare-fun e!445533 () Bool)

(assert (=> b!804158 (= e!445534 e!445533)))

(declare-fun res!548684 () Bool)

(assert (=> b!804158 (=> (not res!548684) (not e!445533))))

(declare-datatypes ((SeekEntryResult!8533 0))(
  ( (MissingZero!8533 (index!36500 (_ BitVec 32))) (Found!8533 (index!36501 (_ BitVec 32))) (Intermediate!8533 (undefined!9345 Bool) (index!36502 (_ BitVec 32)) (x!67331 (_ BitVec 32))) (Undefined!8533) (MissingVacant!8533 (index!36503 (_ BitVec 32))) )
))
(declare-fun lt!360074 () SeekEntryResult!8533)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!804158 (= res!548684 (or (= lt!360074 (MissingZero!8533 i!1163)) (= lt!360074 (MissingVacant!8533 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43724 0))(
  ( (array!43725 (arr!20942 (Array (_ BitVec 32) (_ BitVec 64))) (size!21363 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43724)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43724 (_ BitVec 32)) SeekEntryResult!8533)

(assert (=> b!804158 (= lt!360074 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804159 () Bool)

(declare-fun res!548680 () Bool)

(assert (=> b!804159 (=> (not res!548680) (not e!445533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43724 (_ BitVec 32)) Bool)

(assert (=> b!804159 (= res!548680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!548678 () Bool)

(assert (=> start!68934 (=> (not res!548678) (not e!445534))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68934 (= res!548678 (validMask!0 mask!3266))))

(assert (=> start!68934 e!445534))

(assert (=> start!68934 true))

(declare-fun array_inv!16738 (array!43724) Bool)

(assert (=> start!68934 (array_inv!16738 a!3170)))

(declare-fun b!804160 () Bool)

(declare-fun res!548677 () Bool)

(assert (=> b!804160 (=> (not res!548677) (not e!445534))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804160 (= res!548677 (validKeyInArray!0 (select (arr!20942 a!3170) j!153)))))

(declare-fun b!804161 () Bool)

(declare-fun res!548679 () Bool)

(assert (=> b!804161 (=> (not res!548679) (not e!445533))))

(declare-datatypes ((List!14905 0))(
  ( (Nil!14902) (Cons!14901 (h!16030 (_ BitVec 64)) (t!21220 List!14905)) )
))
(declare-fun arrayNoDuplicates!0 (array!43724 (_ BitVec 32) List!14905) Bool)

(assert (=> b!804161 (= res!548679 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14902))))

(declare-fun b!804162 () Bool)

(declare-fun res!548682 () Bool)

(assert (=> b!804162 (=> (not res!548682) (not e!445534))))

(declare-fun arrayContainsKey!0 (array!43724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804162 (= res!548682 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun b!804163 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804163 (= e!445533 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21363 a!3170)) (= vacantBefore!23 i!1163) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (size!21363 a!3170)))))))

(declare-fun b!804164 () Bool)

(declare-fun res!548681 () Bool)

(assert (=> b!804164 (=> (not res!548681) (not e!445534))))

(assert (=> b!804164 (= res!548681 (and (= (size!21363 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21363 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21363 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804165 () Bool)

(declare-fun res!548683 () Bool)

(assert (=> b!804165 (=> (not res!548683) (not e!445534))))

(assert (=> b!804165 (= res!548683 (validKeyInArray!0 k!2044))))

(assert (= (and start!68934 res!548678) b!804164))

(assert (= (and b!804164 res!548681) b!804160))

(assert (= (and b!804160 res!548677) b!804165))

(assert (= (and b!804165 res!548683) b!804162))

(assert (= (and b!804162 res!548682) b!804158))

(assert (= (and b!804158 res!548684) b!804159))

(assert (= (and b!804159 res!548680) b!804161))

(assert (= (and b!804161 res!548679) b!804163))

(declare-fun m!746075 () Bool)

(assert (=> b!804158 m!746075))

(declare-fun m!746077 () Bool)

(assert (=> b!804165 m!746077))

(declare-fun m!746079 () Bool)

(assert (=> b!804161 m!746079))

(declare-fun m!746081 () Bool)

(assert (=> start!68934 m!746081))

(declare-fun m!746083 () Bool)

(assert (=> start!68934 m!746083))

(declare-fun m!746085 () Bool)

(assert (=> b!804159 m!746085))

(declare-fun m!746087 () Bool)

(assert (=> b!804160 m!746087))

(assert (=> b!804160 m!746087))

(declare-fun m!746089 () Bool)

(assert (=> b!804160 m!746089))

(declare-fun m!746091 () Bool)

(assert (=> b!804162 m!746091))

(push 1)

(assert (not start!68934))

(assert (not b!804158))

(assert (not b!804165))

(assert (not b!804160))

(assert (not b!804162))

(assert (not b!804159))

(assert (not b!804161))

(check-sat)

(pop 1)

(push 1)

(check-sat)

