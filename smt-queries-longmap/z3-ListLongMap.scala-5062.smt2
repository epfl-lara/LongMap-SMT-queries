; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69050 () Bool)

(assert start!69050)

(declare-fun b!804185 () Bool)

(declare-fun e!445707 () Bool)

(declare-fun e!445708 () Bool)

(assert (=> b!804185 (= e!445707 e!445708)))

(declare-fun res!548164 () Bool)

(assert (=> b!804185 (=> (not res!548164) (not e!445708))))

(declare-datatypes ((SeekEntryResult!8458 0))(
  ( (MissingZero!8458 (index!36200 (_ BitVec 32))) (Found!8458 (index!36201 (_ BitVec 32))) (Intermediate!8458 (undefined!9270 Bool) (index!36202 (_ BitVec 32)) (x!67206 (_ BitVec 32))) (Undefined!8458) (MissingVacant!8458 (index!36203 (_ BitVec 32))) )
))
(declare-fun lt!359857 () SeekEntryResult!8458)

(declare-datatypes ((array!43672 0))(
  ( (array!43673 (arr!20911 (Array (_ BitVec 32) (_ BitVec 64))) (size!21331 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43672)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!359853 () SeekEntryResult!8458)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804185 (= res!548164 (and (= lt!359853 lt!359857) (= lt!359857 (Found!8458 j!153)) (not (= (select (arr!20911 a!3170) index!1236) (select (arr!20911 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43672 (_ BitVec 32)) SeekEntryResult!8458)

(assert (=> b!804185 (= lt!359857 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20911 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43672 (_ BitVec 32)) SeekEntryResult!8458)

(assert (=> b!804185 (= lt!359853 (seekEntryOrOpen!0 (select (arr!20911 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804186 () Bool)

(declare-fun res!548159 () Bool)

(declare-fun e!445704 () Bool)

(assert (=> b!804186 (=> (not res!548159) (not e!445704))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43672 (_ BitVec 32)) Bool)

(assert (=> b!804186 (= res!548159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804187 () Bool)

(assert (=> b!804187 (= e!445708 (not true))))

(declare-fun lt!359854 () (_ BitVec 32))

(declare-fun lt!359855 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!359858 () array!43672)

(assert (=> b!804187 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359854 vacantAfter!23 lt!359855 lt!359858 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359854 vacantBefore!23 (select (arr!20911 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27541 0))(
  ( (Unit!27542) )
))
(declare-fun lt!359856 () Unit!27541)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43672 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27541)

(assert (=> b!804187 (= lt!359856 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359854 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804187 (= lt!359854 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!804188 () Bool)

(declare-fun res!548158 () Bool)

(declare-fun e!445705 () Bool)

(assert (=> b!804188 (=> (not res!548158) (not e!445705))))

(assert (=> b!804188 (= res!548158 (and (= (size!21331 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21331 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21331 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804189 () Bool)

(declare-fun res!548163 () Bool)

(assert (=> b!804189 (=> (not res!548163) (not e!445704))))

(declare-datatypes ((List!14781 0))(
  ( (Nil!14778) (Cons!14777 (h!15912 (_ BitVec 64)) (t!21088 List!14781)) )
))
(declare-fun arrayNoDuplicates!0 (array!43672 (_ BitVec 32) List!14781) Bool)

(assert (=> b!804189 (= res!548163 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14778))))

(declare-fun b!804190 () Bool)

(declare-fun res!548157 () Bool)

(assert (=> b!804190 (=> (not res!548157) (not e!445705))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804190 (= res!548157 (validKeyInArray!0 (select (arr!20911 a!3170) j!153)))))

(declare-fun res!548161 () Bool)

(assert (=> start!69050 (=> (not res!548161) (not e!445705))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69050 (= res!548161 (validMask!0 mask!3266))))

(assert (=> start!69050 e!445705))

(assert (=> start!69050 true))

(declare-fun array_inv!16770 (array!43672) Bool)

(assert (=> start!69050 (array_inv!16770 a!3170)))

(declare-fun b!804191 () Bool)

(declare-fun res!548160 () Bool)

(assert (=> b!804191 (=> (not res!548160) (not e!445704))))

(assert (=> b!804191 (= res!548160 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21331 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20911 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21331 a!3170)) (= (select (arr!20911 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804192 () Bool)

(declare-fun res!548156 () Bool)

(assert (=> b!804192 (=> (not res!548156) (not e!445705))))

(assert (=> b!804192 (= res!548156 (validKeyInArray!0 k0!2044))))

(declare-fun b!804193 () Bool)

(declare-fun res!548166 () Bool)

(assert (=> b!804193 (=> (not res!548166) (not e!445705))))

(declare-fun arrayContainsKey!0 (array!43672 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804193 (= res!548166 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804194 () Bool)

(assert (=> b!804194 (= e!445704 e!445707)))

(declare-fun res!548162 () Bool)

(assert (=> b!804194 (=> (not res!548162) (not e!445707))))

(assert (=> b!804194 (= res!548162 (= (seekEntryOrOpen!0 lt!359855 lt!359858 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359855 lt!359858 mask!3266)))))

(assert (=> b!804194 (= lt!359855 (select (store (arr!20911 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804194 (= lt!359858 (array!43673 (store (arr!20911 a!3170) i!1163 k0!2044) (size!21331 a!3170)))))

(declare-fun b!804195 () Bool)

(assert (=> b!804195 (= e!445705 e!445704)))

(declare-fun res!548165 () Bool)

(assert (=> b!804195 (=> (not res!548165) (not e!445704))))

(declare-fun lt!359852 () SeekEntryResult!8458)

(assert (=> b!804195 (= res!548165 (or (= lt!359852 (MissingZero!8458 i!1163)) (= lt!359852 (MissingVacant!8458 i!1163))))))

(assert (=> b!804195 (= lt!359852 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(assert (= (and start!69050 res!548161) b!804188))

(assert (= (and b!804188 res!548158) b!804190))

(assert (= (and b!804190 res!548157) b!804192))

(assert (= (and b!804192 res!548156) b!804193))

(assert (= (and b!804193 res!548166) b!804195))

(assert (= (and b!804195 res!548165) b!804186))

(assert (= (and b!804186 res!548159) b!804189))

(assert (= (and b!804189 res!548163) b!804191))

(assert (= (and b!804191 res!548160) b!804194))

(assert (= (and b!804194 res!548162) b!804185))

(assert (= (and b!804185 res!548164) b!804187))

(declare-fun m!746239 () Bool)

(assert (=> b!804194 m!746239))

(declare-fun m!746241 () Bool)

(assert (=> b!804194 m!746241))

(declare-fun m!746243 () Bool)

(assert (=> b!804194 m!746243))

(declare-fun m!746245 () Bool)

(assert (=> b!804194 m!746245))

(declare-fun m!746247 () Bool)

(assert (=> b!804191 m!746247))

(declare-fun m!746249 () Bool)

(assert (=> b!804191 m!746249))

(declare-fun m!746251 () Bool)

(assert (=> b!804186 m!746251))

(declare-fun m!746253 () Bool)

(assert (=> b!804192 m!746253))

(declare-fun m!746255 () Bool)

(assert (=> start!69050 m!746255))

(declare-fun m!746257 () Bool)

(assert (=> start!69050 m!746257))

(declare-fun m!746259 () Bool)

(assert (=> b!804189 m!746259))

(declare-fun m!746261 () Bool)

(assert (=> b!804185 m!746261))

(declare-fun m!746263 () Bool)

(assert (=> b!804185 m!746263))

(assert (=> b!804185 m!746263))

(declare-fun m!746265 () Bool)

(assert (=> b!804185 m!746265))

(assert (=> b!804185 m!746263))

(declare-fun m!746267 () Bool)

(assert (=> b!804185 m!746267))

(assert (=> b!804190 m!746263))

(assert (=> b!804190 m!746263))

(declare-fun m!746269 () Bool)

(assert (=> b!804190 m!746269))

(declare-fun m!746271 () Bool)

(assert (=> b!804193 m!746271))

(assert (=> b!804187 m!746263))

(declare-fun m!746273 () Bool)

(assert (=> b!804187 m!746273))

(assert (=> b!804187 m!746263))

(declare-fun m!746275 () Bool)

(assert (=> b!804187 m!746275))

(declare-fun m!746277 () Bool)

(assert (=> b!804187 m!746277))

(declare-fun m!746279 () Bool)

(assert (=> b!804187 m!746279))

(declare-fun m!746281 () Bool)

(assert (=> b!804195 m!746281))

(check-sat (not b!804192) (not b!804187) (not b!804195) (not b!804193) (not b!804185) (not b!804190) (not b!804186) (not b!804194) (not start!69050) (not b!804189))
(check-sat)
