; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68098 () Bool)

(assert start!68098)

(declare-fun res!536862 () Bool)

(declare-fun e!440126 () Bool)

(assert (=> start!68098 (=> (not res!536862) (not e!440126))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68098 (= res!536862 (validMask!0 mask!3266))))

(assert (=> start!68098 e!440126))

(assert (=> start!68098 true))

(declare-datatypes ((array!43001 0))(
  ( (array!43002 (arr!20585 (Array (_ BitVec 32) (_ BitVec 64))) (size!21006 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43001)

(declare-fun array_inv!16381 (array!43001) Bool)

(assert (=> start!68098 (array_inv!16381 a!3170)))

(declare-fun b!792126 () Bool)

(declare-fun res!536867 () Bool)

(declare-fun e!440125 () Bool)

(assert (=> b!792126 (=> (not res!536867) (not e!440125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43001 (_ BitVec 32)) Bool)

(assert (=> b!792126 (= res!536867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!792127 () Bool)

(declare-fun res!536863 () Bool)

(assert (=> b!792127 (=> (not res!536863) (not e!440126))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!792127 (= res!536863 (and (= (size!21006 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21006 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21006 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!792128 () Bool)

(declare-fun res!536861 () Bool)

(assert (=> b!792128 (=> (not res!536861) (not e!440126))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!792128 (= res!536861 (validKeyInArray!0 k!2044))))

(declare-fun b!792129 () Bool)

(declare-fun res!536865 () Bool)

(assert (=> b!792129 (=> (not res!536865) (not e!440126))))

(declare-fun arrayContainsKey!0 (array!43001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!792129 (= res!536865 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!792130 () Bool)

(assert (=> b!792130 (= e!440126 e!440125)))

(declare-fun res!536864 () Bool)

(assert (=> b!792130 (=> (not res!536864) (not e!440125))))

(declare-datatypes ((SeekEntryResult!8176 0))(
  ( (MissingZero!8176 (index!35072 (_ BitVec 32))) (Found!8176 (index!35073 (_ BitVec 32))) (Intermediate!8176 (undefined!8988 Bool) (index!35074 (_ BitVec 32)) (x!66022 (_ BitVec 32))) (Undefined!8176) (MissingVacant!8176 (index!35075 (_ BitVec 32))) )
))
(declare-fun lt!353366 () SeekEntryResult!8176)

(assert (=> b!792130 (= res!536864 (or (= lt!353366 (MissingZero!8176 i!1163)) (= lt!353366 (MissingVacant!8176 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43001 (_ BitVec 32)) SeekEntryResult!8176)

(assert (=> b!792130 (= lt!353366 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!792131 () Bool)

(assert (=> b!792131 (= e!440125 (and (bvsle #b00000000000000000000000000000000 (size!21006 a!3170)) (bvsge (size!21006 a!3170) #b01111111111111111111111111111111)))))

(declare-fun b!792132 () Bool)

(declare-fun res!536866 () Bool)

(assert (=> b!792132 (=> (not res!536866) (not e!440126))))

(assert (=> b!792132 (= res!536866 (validKeyInArray!0 (select (arr!20585 a!3170) j!153)))))

(assert (= (and start!68098 res!536862) b!792127))

(assert (= (and b!792127 res!536863) b!792132))

(assert (= (and b!792132 res!536866) b!792128))

(assert (= (and b!792128 res!536861) b!792129))

(assert (= (and b!792129 res!536865) b!792130))

(assert (= (and b!792130 res!536864) b!792126))

(assert (= (and b!792126 res!536867) b!792131))

(declare-fun m!732793 () Bool)

(assert (=> b!792130 m!732793))

(declare-fun m!732795 () Bool)

(assert (=> start!68098 m!732795))

(declare-fun m!732797 () Bool)

(assert (=> start!68098 m!732797))

(declare-fun m!732799 () Bool)

(assert (=> b!792132 m!732799))

(assert (=> b!792132 m!732799))

(declare-fun m!732801 () Bool)

(assert (=> b!792132 m!732801))

(declare-fun m!732803 () Bool)

(assert (=> b!792126 m!732803))

(declare-fun m!732805 () Bool)

(assert (=> b!792129 m!732805))

(declare-fun m!732807 () Bool)

(assert (=> b!792128 m!732807))

(push 1)

(assert (not b!792130))

(assert (not start!68098))

(assert (not b!792126))

(assert (not b!792128))

(assert (not b!792132))

(assert (not b!792129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103145 () Bool)

(declare-fun lt!353391 () SeekEntryResult!8176)

(assert (=> d!103145 (and (or (is-Undefined!8176 lt!353391) (not (is-Found!8176 lt!353391)) (and (bvsge (index!35073 lt!353391) #b00000000000000000000000000000000) (bvslt (index!35073 lt!353391) (size!21006 a!3170)))) (or (is-Undefined!8176 lt!353391) (is-Found!8176 lt!353391) (not (is-MissingZero!8176 lt!353391)) (and (bvsge (index!35072 lt!353391) #b00000000000000000000000000000000) (bvslt (index!35072 lt!353391) (size!21006 a!3170)))) (or (is-Undefined!8176 lt!353391) (is-Found!8176 lt!353391) (is-MissingZero!8176 lt!353391) (not (is-MissingVacant!8176 lt!353391)) (and (bvsge (index!35075 lt!353391) #b00000000000000000000000000000000) (bvslt (index!35075 lt!353391) (size!21006 a!3170)))) (or (is-Undefined!8176 lt!353391) (ite (is-Found!8176 lt!353391) (= (select (arr!20585 a!3170) (index!35073 lt!353391)) k!2044) (ite (is-MissingZero!8176 lt!353391) (= (select (arr!20585 a!3170) (index!35072 lt!353391)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!8176 lt!353391) (= (select (arr!20585 a!3170) (index!35075 lt!353391)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!440157 () SeekEntryResult!8176)

(assert (=> d!103145 (= lt!353391 e!440157)))

(declare-fun c!88055 () Bool)

(declare-fun lt!353392 () SeekEntryResult!8176)

(assert (=> d!103145 (= c!88055 (and (is-Intermediate!8176 lt!353392) (undefined!8988 lt!353392)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43001 (_ BitVec 32)) SeekEntryResult!8176)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!103145 (= lt!353392 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2044 mask!3266) k!2044 a!3170 mask!3266))))

(assert (=> d!103145 (validMask!0 mask!3266)))

(assert (=> d!103145 (= (seekEntryOrOpen!0 k!2044 a!3170 mask!3266) lt!353391)))

(declare-fun b!792175 () Bool)

(assert (=> b!792175 (= e!440157 Undefined!8176)))

(declare-fun e!440158 () SeekEntryResult!8176)

(declare-fun b!792176 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43001 (_ BitVec 32)) SeekEntryResult!8176)

(assert (=> b!792176 (= e!440158 (seekKeyOrZeroReturnVacant!0 (x!66022 lt!353392) (index!35074 lt!353392) (index!35074 lt!353392) k!2044 a!3170 mask!3266))))

(declare-fun b!792177 () Bool)

(declare-fun c!88056 () Bool)

(declare-fun lt!353393 () (_ BitVec 64))

(assert (=> b!792177 (= c!88056 (= lt!353393 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!440159 () SeekEntryResult!8176)

(assert (=> b!792177 (= e!440159 e!440158)))

(declare-fun b!792178 () Bool)

(assert (=> b!792178 (= e!440159 (Found!8176 (index!35074 lt!353392)))))

(declare-fun b!792179 () Bool)

(assert (=> b!792179 (= e!440157 e!440159)))

(assert (=> b!792179 (= lt!353393 (select (arr!20585 a!3170) (index!35074 lt!353392)))))

(declare-fun c!88057 () Bool)

(assert (=> b!792179 (= c!88057 (= lt!353393 k!2044))))

(declare-fun b!792180 () Bool)

(assert (=> b!792180 (= e!440158 (MissingZero!8176 (index!35074 lt!353392)))))

(assert (= (and d!103145 c!88055) b!792175))

(assert (= (and d!103145 (not c!88055)) b!792179))

(assert (= (and b!792179 c!88057) b!792178))

(assert (= (and b!792179 (not c!88057)) b!792177))

(assert (= (and b!792177 c!88056) b!792180))

(assert (= (and b!792177 (not c!88056)) b!792176))

(declare-fun m!732835 () Bool)

(assert (=> d!103145 m!732835))

(assert (=> d!103145 m!732835))

(declare-fun m!732837 () Bool)

(assert (=> d!103145 m!732837))

(declare-fun m!732839 () Bool)

(assert (=> d!103145 m!732839))

(assert (=> d!103145 m!732795))

(declare-fun m!732841 () Bool)

(assert (=> d!103145 m!732841))

(declare-fun m!732843 () Bool)

(assert (=> d!103145 m!732843))

(declare-fun m!732845 () Bool)

(assert (=> b!792176 m!732845))

(declare-fun m!732847 () Bool)

(assert (=> b!792179 m!732847))

(assert (=> b!792130 d!103145))

(declare-fun d!103155 () Bool)

(declare-fun res!536890 () Bool)

(declare-fun e!440170 () Bool)

(assert (=> d!103155 (=> res!536890 e!440170)))

(assert (=> d!103155 (= res!536890 (= (select (arr!20585 a!3170) #b00000000000000000000000000000000) k!2044))))

(assert (=> d!103155 (= (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000) e!440170)))

(declare-fun b!792197 () Bool)

(declare-fun e!440171 () Bool)

(assert (=> b!792197 (= e!440170 e!440171)))

(declare-fun res!536891 () Bool)

(assert (=> b!792197 (=> (not res!536891) (not e!440171))))

(assert (=> b!792197 (= res!536891 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!21006 a!3170)))))

(declare-fun b!792198 () Bool)

(assert (=> b!792198 (= e!440171 (arrayContainsKey!0 a!3170 k!2044 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!103155 (not res!536890)) b!792197))

(assert (= (and b!792197 res!536891) b!792198))

(declare-fun m!732849 () Bool)

(assert (=> d!103155 m!732849))

(declare-fun m!732851 () Bool)

(assert (=> b!792198 m!732851))

(assert (=> b!792129 d!103155))

(declare-fun d!103157 () Bool)

(assert (=> d!103157 (= (validKeyInArray!0 k!2044) (and (not (= k!2044 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2044 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792128 d!103157))

(declare-fun d!103159 () Bool)

(assert (=> d!103159 (= (validKeyInArray!0 (select (arr!20585 a!3170) j!153)) (and (not (= (select (arr!20585 a!3170) j!153) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20585 a!3170) j!153) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!792132 d!103159))

(declare-fun b!792213 () Bool)

(declare-fun e!440181 () Bool)

(declare-fun call!35328 () Bool)

(assert (=> b!792213 (= e!440181 call!35328)))

(declare-fun bm!35325 () Bool)

(assert (=> bm!35325 (= call!35328 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3170 mask!3266))))

