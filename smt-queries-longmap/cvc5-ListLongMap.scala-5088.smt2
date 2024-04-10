; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69086 () Bool)

(assert start!69086)

(declare-fun b!805772 () Bool)

(declare-fun res!550103 () Bool)

(declare-fun e!446242 () Bool)

(assert (=> b!805772 (=> (not res!550103) (not e!446242))))

(declare-datatypes ((array!43831 0))(
  ( (array!43832 (arr!20994 (Array (_ BitVec 32) (_ BitVec 64))) (size!21415 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43831)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43831 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805772 (= res!550103 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805773 () Bool)

(declare-fun res!550098 () Bool)

(assert (=> b!805773 (=> (not res!550098) (not e!446242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805773 (= res!550098 (validKeyInArray!0 k!2044))))

(declare-fun b!805774 () Bool)

(declare-fun res!550094 () Bool)

(assert (=> b!805774 (=> (not res!550094) (not e!446242))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!805774 (= res!550094 (and (= (size!21415 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21415 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21415 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805775 () Bool)

(declare-fun res!550100 () Bool)

(declare-fun e!446243 () Bool)

(assert (=> b!805775 (=> (not res!550100) (not e!446243))))

(declare-datatypes ((List!14957 0))(
  ( (Nil!14954) (Cons!14953 (h!16082 (_ BitVec 64)) (t!21272 List!14957)) )
))
(declare-fun arrayNoDuplicates!0 (array!43831 (_ BitVec 32) List!14957) Bool)

(assert (=> b!805775 (= res!550100 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14954))))

(declare-fun res!550099 () Bool)

(assert (=> start!69086 (=> (not res!550099) (not e!446242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69086 (= res!550099 (validMask!0 mask!3266))))

(assert (=> start!69086 e!446242))

(assert (=> start!69086 true))

(declare-fun array_inv!16790 (array!43831) Bool)

(assert (=> start!69086 (array_inv!16790 a!3170)))

(declare-fun b!805776 () Bool)

(declare-fun res!550097 () Bool)

(assert (=> b!805776 (=> (not res!550097) (not e!446243))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805776 (= res!550097 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21415 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20994 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21415 a!3170)) (= (select (arr!20994 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805777 () Bool)

(declare-fun res!550095 () Bool)

(assert (=> b!805777 (=> (not res!550095) (not e!446243))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43831 (_ BitVec 32)) Bool)

(assert (=> b!805777 (= res!550095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805778 () Bool)

(declare-fun e!446239 () Bool)

(assert (=> b!805778 (= e!446243 e!446239)))

(declare-fun res!550093 () Bool)

(assert (=> b!805778 (=> (not res!550093) (not e!446239))))

(declare-datatypes ((SeekEntryResult!8585 0))(
  ( (MissingZero!8585 (index!36708 (_ BitVec 32))) (Found!8585 (index!36709 (_ BitVec 32))) (Intermediate!8585 (undefined!9397 Bool) (index!36710 (_ BitVec 32)) (x!67530 (_ BitVec 32))) (Undefined!8585) (MissingVacant!8585 (index!36711 (_ BitVec 32))) )
))
(declare-fun lt!360784 () SeekEntryResult!8585)

(declare-fun lt!360785 () SeekEntryResult!8585)

(assert (=> b!805778 (= res!550093 (= lt!360784 lt!360785))))

(declare-fun lt!360780 () (_ BitVec 64))

(declare-fun lt!360781 () array!43831)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43831 (_ BitVec 32)) SeekEntryResult!8585)

(assert (=> b!805778 (= lt!360785 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360780 lt!360781 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43831 (_ BitVec 32)) SeekEntryResult!8585)

(assert (=> b!805778 (= lt!360784 (seekEntryOrOpen!0 lt!360780 lt!360781 mask!3266))))

(assert (=> b!805778 (= lt!360780 (select (store (arr!20994 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805778 (= lt!360781 (array!43832 (store (arr!20994 a!3170) i!1163 k!2044) (size!21415 a!3170)))))

(declare-fun b!805779 () Bool)

(declare-fun e!446240 () Bool)

(assert (=> b!805779 (= e!446240 (not true))))

(assert (=> b!805779 (= lt!360785 (Found!8585 index!1236))))

(declare-fun b!805780 () Bool)

(declare-fun res!550101 () Bool)

(assert (=> b!805780 (=> (not res!550101) (not e!446242))))

(assert (=> b!805780 (= res!550101 (validKeyInArray!0 (select (arr!20994 a!3170) j!153)))))

(declare-fun b!805781 () Bool)

(assert (=> b!805781 (= e!446242 e!446243)))

(declare-fun res!550096 () Bool)

(assert (=> b!805781 (=> (not res!550096) (not e!446243))))

(declare-fun lt!360783 () SeekEntryResult!8585)

(assert (=> b!805781 (= res!550096 (or (= lt!360783 (MissingZero!8585 i!1163)) (= lt!360783 (MissingVacant!8585 i!1163))))))

(assert (=> b!805781 (= lt!360783 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805782 () Bool)

(assert (=> b!805782 (= e!446239 e!446240)))

(declare-fun res!550102 () Bool)

(assert (=> b!805782 (=> (not res!550102) (not e!446240))))

(declare-fun lt!360782 () SeekEntryResult!8585)

(declare-fun lt!360779 () SeekEntryResult!8585)

(assert (=> b!805782 (= res!550102 (and (= lt!360779 lt!360782) (= lt!360782 (Found!8585 j!153)) (= (select (arr!20994 a!3170) index!1236) (select (arr!20994 a!3170) j!153))))))

(assert (=> b!805782 (= lt!360782 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20994 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!805782 (= lt!360779 (seekEntryOrOpen!0 (select (arr!20994 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69086 res!550099) b!805774))

(assert (= (and b!805774 res!550094) b!805780))

(assert (= (and b!805780 res!550101) b!805773))

(assert (= (and b!805773 res!550098) b!805772))

(assert (= (and b!805772 res!550103) b!805781))

(assert (= (and b!805781 res!550096) b!805777))

(assert (= (and b!805777 res!550095) b!805775))

(assert (= (and b!805775 res!550100) b!805776))

(assert (= (and b!805776 res!550097) b!805778))

(assert (= (and b!805778 res!550093) b!805782))

(assert (= (and b!805782 res!550102) b!805779))

(declare-fun m!747701 () Bool)

(assert (=> b!805778 m!747701))

(declare-fun m!747703 () Bool)

(assert (=> b!805778 m!747703))

(declare-fun m!747705 () Bool)

(assert (=> b!805778 m!747705))

(declare-fun m!747707 () Bool)

(assert (=> b!805778 m!747707))

(declare-fun m!747709 () Bool)

(assert (=> start!69086 m!747709))

(declare-fun m!747711 () Bool)

(assert (=> start!69086 m!747711))

(declare-fun m!747713 () Bool)

(assert (=> b!805781 m!747713))

(declare-fun m!747715 () Bool)

(assert (=> b!805782 m!747715))

(declare-fun m!747717 () Bool)

(assert (=> b!805782 m!747717))

(assert (=> b!805782 m!747717))

(declare-fun m!747719 () Bool)

(assert (=> b!805782 m!747719))

(assert (=> b!805782 m!747717))

(declare-fun m!747721 () Bool)

(assert (=> b!805782 m!747721))

(declare-fun m!747723 () Bool)

(assert (=> b!805775 m!747723))

(declare-fun m!747725 () Bool)

(assert (=> b!805772 m!747725))

(declare-fun m!747727 () Bool)

(assert (=> b!805776 m!747727))

(declare-fun m!747729 () Bool)

(assert (=> b!805776 m!747729))

(declare-fun m!747731 () Bool)

(assert (=> b!805773 m!747731))

(declare-fun m!747733 () Bool)

(assert (=> b!805777 m!747733))

(assert (=> b!805780 m!747717))

(assert (=> b!805780 m!747717))

(declare-fun m!747735 () Bool)

(assert (=> b!805780 m!747735))

(push 1)

(assert (not b!805775))

(assert (not b!805781))

(assert (not b!805778))

(assert (not start!69086))

(assert (not b!805777))

(assert (not b!805782))

(assert (not b!805772))

