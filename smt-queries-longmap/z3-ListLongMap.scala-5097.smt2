; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69168 () Bool)

(assert start!69168)

(declare-fun b!806692 () Bool)

(declare-fun res!550964 () Bool)

(declare-fun e!446674 () Bool)

(assert (=> b!806692 (=> (not res!550964) (not e!446674))))

(declare-datatypes ((array!43885 0))(
  ( (array!43886 (arr!21020 (Array (_ BitVec 32) (_ BitVec 64))) (size!21441 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43885)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806692 (= res!550964 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!550956 () Bool)

(assert (=> start!69168 (=> (not res!550956) (not e!446674))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69168 (= res!550956 (validMask!0 mask!3266))))

(assert (=> start!69168 e!446674))

(assert (=> start!69168 true))

(declare-fun array_inv!16903 (array!43885) Bool)

(assert (=> start!69168 (array_inv!16903 a!3170)))

(declare-fun b!806693 () Bool)

(declare-fun res!550963 () Bool)

(declare-fun e!446672 () Bool)

(assert (=> b!806693 (=> (not res!550963) (not e!446672))))

(declare-datatypes ((List!15022 0))(
  ( (Nil!15019) (Cons!15018 (h!16147 (_ BitVec 64)) (t!21328 List!15022)) )
))
(declare-fun arrayNoDuplicates!0 (array!43885 (_ BitVec 32) List!15022) Bool)

(assert (=> b!806693 (= res!550963 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15019))))

(declare-fun b!806694 () Bool)

(declare-fun e!446673 () Bool)

(assert (=> b!806694 (= e!446673 false)))

(declare-fun lt!361219 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806694 (= lt!361219 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!806695 () Bool)

(declare-fun res!550957 () Bool)

(assert (=> b!806695 (=> (not res!550957) (not e!446672))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!806695 (= res!550957 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21441 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21020 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21441 a!3170)) (= (select (arr!21020 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806696 () Bool)

(declare-fun res!550960 () Bool)

(assert (=> b!806696 (=> (not res!550960) (not e!446672))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43885 (_ BitVec 32)) Bool)

(assert (=> b!806696 (= res!550960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806697 () Bool)

(declare-fun e!446670 () Bool)

(assert (=> b!806697 (= e!446672 e!446670)))

(declare-fun res!550958 () Bool)

(assert (=> b!806697 (=> (not res!550958) (not e!446670))))

(declare-fun lt!361218 () (_ BitVec 64))

(declare-fun lt!361223 () array!43885)

(declare-datatypes ((SeekEntryResult!8608 0))(
  ( (MissingZero!8608 (index!36800 (_ BitVec 32))) (Found!8608 (index!36801 (_ BitVec 32))) (Intermediate!8608 (undefined!9420 Bool) (index!36802 (_ BitVec 32)) (x!67623 (_ BitVec 32))) (Undefined!8608) (MissingVacant!8608 (index!36803 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43885 (_ BitVec 32)) SeekEntryResult!8608)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43885 (_ BitVec 32)) SeekEntryResult!8608)

(assert (=> b!806697 (= res!550958 (= (seekEntryOrOpen!0 lt!361218 lt!361223 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361218 lt!361223 mask!3266)))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!806697 (= lt!361218 (select (store (arr!21020 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806697 (= lt!361223 (array!43886 (store (arr!21020 a!3170) i!1163 k0!2044) (size!21441 a!3170)))))

(declare-fun b!806698 () Bool)

(assert (=> b!806698 (= e!446674 e!446672)))

(declare-fun res!550961 () Bool)

(assert (=> b!806698 (=> (not res!550961) (not e!446672))))

(declare-fun lt!361220 () SeekEntryResult!8608)

(assert (=> b!806698 (= res!550961 (or (= lt!361220 (MissingZero!8608 i!1163)) (= lt!361220 (MissingVacant!8608 i!1163))))))

(assert (=> b!806698 (= lt!361220 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806699 () Bool)

(declare-fun res!550959 () Bool)

(assert (=> b!806699 (=> (not res!550959) (not e!446674))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806699 (= res!550959 (validKeyInArray!0 k0!2044))))

(declare-fun b!806700 () Bool)

(assert (=> b!806700 (= e!446670 e!446673)))

(declare-fun res!550962 () Bool)

(assert (=> b!806700 (=> (not res!550962) (not e!446673))))

(declare-fun lt!361221 () SeekEntryResult!8608)

(declare-fun lt!361222 () SeekEntryResult!8608)

(assert (=> b!806700 (= res!550962 (and (= lt!361221 lt!361222) (= lt!361222 (Found!8608 j!153)) (not (= (select (arr!21020 a!3170) index!1236) (select (arr!21020 a!3170) j!153)))))))

(assert (=> b!806700 (= lt!361222 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21020 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!806700 (= lt!361221 (seekEntryOrOpen!0 (select (arr!21020 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806701 () Bool)

(declare-fun res!550965 () Bool)

(assert (=> b!806701 (=> (not res!550965) (not e!446674))))

(assert (=> b!806701 (= res!550965 (validKeyInArray!0 (select (arr!21020 a!3170) j!153)))))

(declare-fun b!806702 () Bool)

(declare-fun res!550955 () Bool)

(assert (=> b!806702 (=> (not res!550955) (not e!446674))))

(assert (=> b!806702 (= res!550955 (and (= (size!21441 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21441 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21441 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!69168 res!550956) b!806702))

(assert (= (and b!806702 res!550955) b!806701))

(assert (= (and b!806701 res!550965) b!806699))

(assert (= (and b!806699 res!550959) b!806692))

(assert (= (and b!806692 res!550964) b!806698))

(assert (= (and b!806698 res!550961) b!806696))

(assert (= (and b!806696 res!550960) b!806693))

(assert (= (and b!806693 res!550963) b!806695))

(assert (= (and b!806695 res!550957) b!806697))

(assert (= (and b!806697 res!550958) b!806700))

(assert (= (and b!806700 res!550962) b!806694))

(declare-fun m!748159 () Bool)

(assert (=> b!806698 m!748159))

(declare-fun m!748161 () Bool)

(assert (=> b!806700 m!748161))

(declare-fun m!748163 () Bool)

(assert (=> b!806700 m!748163))

(assert (=> b!806700 m!748163))

(declare-fun m!748165 () Bool)

(assert (=> b!806700 m!748165))

(assert (=> b!806700 m!748163))

(declare-fun m!748167 () Bool)

(assert (=> b!806700 m!748167))

(assert (=> b!806701 m!748163))

(assert (=> b!806701 m!748163))

(declare-fun m!748169 () Bool)

(assert (=> b!806701 m!748169))

(declare-fun m!748171 () Bool)

(assert (=> b!806694 m!748171))

(declare-fun m!748173 () Bool)

(assert (=> start!69168 m!748173))

(declare-fun m!748175 () Bool)

(assert (=> start!69168 m!748175))

(declare-fun m!748177 () Bool)

(assert (=> b!806693 m!748177))

(declare-fun m!748179 () Bool)

(assert (=> b!806692 m!748179))

(declare-fun m!748181 () Bool)

(assert (=> b!806696 m!748181))

(declare-fun m!748183 () Bool)

(assert (=> b!806699 m!748183))

(declare-fun m!748185 () Bool)

(assert (=> b!806695 m!748185))

(declare-fun m!748187 () Bool)

(assert (=> b!806695 m!748187))

(declare-fun m!748189 () Bool)

(assert (=> b!806697 m!748189))

(declare-fun m!748191 () Bool)

(assert (=> b!806697 m!748191))

(declare-fun m!748193 () Bool)

(assert (=> b!806697 m!748193))

(declare-fun m!748195 () Bool)

(assert (=> b!806697 m!748195))

(check-sat (not start!69168) (not b!806693) (not b!806701) (not b!806698) (not b!806700) (not b!806694) (not b!806696) (not b!806699) (not b!806697) (not b!806692))
(check-sat)
