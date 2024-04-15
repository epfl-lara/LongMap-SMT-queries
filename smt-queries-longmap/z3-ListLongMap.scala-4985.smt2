; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68400 () Bool)

(assert start!68400)

(declare-fun b!794945 () Bool)

(declare-fun res!539610 () Bool)

(declare-fun e!441251 () Bool)

(assert (=> b!794945 (=> (not res!539610) (not e!441251))))

(declare-datatypes ((array!43207 0))(
  ( (array!43208 (arr!20684 (Array (_ BitVec 32) (_ BitVec 64))) (size!21105 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43207)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794945 (= res!539610 (validKeyInArray!0 (select (arr!20684 a!3170) j!153)))))

(declare-fun b!794946 () Bool)

(declare-fun res!539608 () Bool)

(declare-fun e!441252 () Bool)

(assert (=> b!794946 (=> (not res!539608) (not e!441252))))

(declare-datatypes ((List!14686 0))(
  ( (Nil!14683) (Cons!14682 (h!15811 (_ BitVec 64)) (t!20992 List!14686)) )
))
(declare-fun arrayNoDuplicates!0 (array!43207 (_ BitVec 32) List!14686) Bool)

(assert (=> b!794946 (= res!539608 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14683))))

(declare-fun b!794947 () Bool)

(declare-fun res!539613 () Bool)

(assert (=> b!794947 (=> (not res!539613) (not e!441251))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!794947 (= res!539613 (and (= (size!21105 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21105 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21105 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794948 () Bool)

(declare-fun res!539612 () Bool)

(assert (=> b!794948 (=> (not res!539612) (not e!441251))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794948 (= res!539612 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794949 () Bool)

(assert (=> b!794949 (= e!441251 e!441252)))

(declare-fun res!539605 () Bool)

(assert (=> b!794949 (=> (not res!539605) (not e!441252))))

(declare-datatypes ((SeekEntryResult!8272 0))(
  ( (MissingZero!8272 (index!35456 (_ BitVec 32))) (Found!8272 (index!35457 (_ BitVec 32))) (Intermediate!8272 (undefined!9084 Bool) (index!35458 (_ BitVec 32)) (x!66385 (_ BitVec 32))) (Undefined!8272) (MissingVacant!8272 (index!35459 (_ BitVec 32))) )
))
(declare-fun lt!354214 () SeekEntryResult!8272)

(assert (=> b!794949 (= res!539605 (or (= lt!354214 (MissingZero!8272 i!1163)) (= lt!354214 (MissingVacant!8272 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43207 (_ BitVec 32)) SeekEntryResult!8272)

(assert (=> b!794949 (= lt!354214 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794950 () Bool)

(declare-fun res!539611 () Bool)

(assert (=> b!794950 (=> (not res!539611) (not e!441252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43207 (_ BitVec 32)) Bool)

(assert (=> b!794950 (= res!539611 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!539607 () Bool)

(assert (=> start!68400 (=> (not res!539607) (not e!441251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68400 (= res!539607 (validMask!0 mask!3266))))

(assert (=> start!68400 e!441251))

(assert (=> start!68400 true))

(declare-fun array_inv!16567 (array!43207) Bool)

(assert (=> start!68400 (array_inv!16567 a!3170)))

(declare-fun b!794951 () Bool)

(declare-fun res!539606 () Bool)

(assert (=> b!794951 (=> (not res!539606) (not e!441251))))

(assert (=> b!794951 (= res!539606 (validKeyInArray!0 k0!2044))))

(declare-fun b!794952 () Bool)

(declare-fun e!441250 () Bool)

(assert (=> b!794952 (= e!441250 false)))

(declare-fun lt!354215 () SeekEntryResult!8272)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43207 (_ BitVec 32)) SeekEntryResult!8272)

(assert (=> b!794952 (= lt!354215 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20684 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354211 () SeekEntryResult!8272)

(assert (=> b!794952 (= lt!354211 (seekEntryOrOpen!0 (select (arr!20684 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794953 () Bool)

(assert (=> b!794953 (= e!441252 e!441250)))

(declare-fun res!539604 () Bool)

(assert (=> b!794953 (=> (not res!539604) (not e!441250))))

(declare-fun lt!354212 () array!43207)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354213 () (_ BitVec 64))

(assert (=> b!794953 (= res!539604 (= (seekEntryOrOpen!0 lt!354213 lt!354212 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354213 lt!354212 mask!3266)))))

(assert (=> b!794953 (= lt!354213 (select (store (arr!20684 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794953 (= lt!354212 (array!43208 (store (arr!20684 a!3170) i!1163 k0!2044) (size!21105 a!3170)))))

(declare-fun b!794954 () Bool)

(declare-fun res!539609 () Bool)

(assert (=> b!794954 (=> (not res!539609) (not e!441252))))

(assert (=> b!794954 (= res!539609 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21105 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20684 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21105 a!3170)) (= (select (arr!20684 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68400 res!539607) b!794947))

(assert (= (and b!794947 res!539613) b!794945))

(assert (= (and b!794945 res!539610) b!794951))

(assert (= (and b!794951 res!539606) b!794948))

(assert (= (and b!794948 res!539612) b!794949))

(assert (= (and b!794949 res!539605) b!794950))

(assert (= (and b!794950 res!539611) b!794946))

(assert (= (and b!794946 res!539608) b!794954))

(assert (= (and b!794954 res!539609) b!794953))

(assert (= (and b!794953 res!539604) b!794952))

(declare-fun m!735055 () Bool)

(assert (=> b!794945 m!735055))

(assert (=> b!794945 m!735055))

(declare-fun m!735057 () Bool)

(assert (=> b!794945 m!735057))

(declare-fun m!735059 () Bool)

(assert (=> b!794953 m!735059))

(declare-fun m!735061 () Bool)

(assert (=> b!794953 m!735061))

(declare-fun m!735063 () Bool)

(assert (=> b!794953 m!735063))

(declare-fun m!735065 () Bool)

(assert (=> b!794953 m!735065))

(declare-fun m!735067 () Bool)

(assert (=> start!68400 m!735067))

(declare-fun m!735069 () Bool)

(assert (=> start!68400 m!735069))

(assert (=> b!794952 m!735055))

(assert (=> b!794952 m!735055))

(declare-fun m!735071 () Bool)

(assert (=> b!794952 m!735071))

(assert (=> b!794952 m!735055))

(declare-fun m!735073 () Bool)

(assert (=> b!794952 m!735073))

(declare-fun m!735075 () Bool)

(assert (=> b!794949 m!735075))

(declare-fun m!735077 () Bool)

(assert (=> b!794951 m!735077))

(declare-fun m!735079 () Bool)

(assert (=> b!794950 m!735079))

(declare-fun m!735081 () Bool)

(assert (=> b!794948 m!735081))

(declare-fun m!735083 () Bool)

(assert (=> b!794946 m!735083))

(declare-fun m!735085 () Bool)

(assert (=> b!794954 m!735085))

(declare-fun m!735087 () Bool)

(assert (=> b!794954 m!735087))

(check-sat (not b!794946) (not b!794949) (not b!794948) (not b!794951) (not b!794945) (not b!794952) (not b!794953) (not b!794950) (not start!68400))
(check-sat)
