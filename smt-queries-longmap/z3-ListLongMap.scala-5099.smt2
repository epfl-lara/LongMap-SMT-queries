; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69180 () Bool)

(assert start!69180)

(declare-fun b!806890 () Bool)

(declare-fun res!551161 () Bool)

(declare-fun e!446762 () Bool)

(assert (=> b!806890 (=> (not res!551161) (not e!446762))))

(declare-datatypes ((array!43897 0))(
  ( (array!43898 (arr!21026 (Array (_ BitVec 32) (_ BitVec 64))) (size!21447 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43897)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!806890 (= res!551161 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!551157 () Bool)

(assert (=> start!69180 (=> (not res!551157) (not e!446762))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69180 (= res!551157 (validMask!0 mask!3266))))

(assert (=> start!69180 e!446762))

(assert (=> start!69180 true))

(declare-fun array_inv!16909 (array!43897) Bool)

(assert (=> start!69180 (array_inv!16909 a!3170)))

(declare-fun b!806891 () Bool)

(declare-fun res!551163 () Bool)

(declare-fun e!446760 () Bool)

(assert (=> b!806891 (=> (not res!551163) (not e!446760))))

(declare-datatypes ((List!15028 0))(
  ( (Nil!15025) (Cons!15024 (h!16153 (_ BitVec 64)) (t!21334 List!15028)) )
))
(declare-fun arrayNoDuplicates!0 (array!43897 (_ BitVec 32) List!15028) Bool)

(assert (=> b!806891 (= res!551163 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15025))))

(declare-fun b!806892 () Bool)

(declare-fun e!446763 () Bool)

(declare-fun e!446761 () Bool)

(assert (=> b!806892 (= e!446763 e!446761)))

(declare-fun res!551153 () Bool)

(assert (=> b!806892 (=> (not res!551153) (not e!446761))))

(declare-datatypes ((SeekEntryResult!8614 0))(
  ( (MissingZero!8614 (index!36824 (_ BitVec 32))) (Found!8614 (index!36825 (_ BitVec 32))) (Intermediate!8614 (undefined!9426 Bool) (index!36826 (_ BitVec 32)) (x!67645 (_ BitVec 32))) (Undefined!8614) (MissingVacant!8614 (index!36827 (_ BitVec 32))) )
))
(declare-fun lt!361330 () SeekEntryResult!8614)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!361329 () SeekEntryResult!8614)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!806892 (= res!551153 (and (= lt!361329 lt!361330) (= lt!361330 (Found!8614 j!153)) (not (= (select (arr!21026 a!3170) index!1236) (select (arr!21026 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43897 (_ BitVec 32)) SeekEntryResult!8614)

(assert (=> b!806892 (= lt!361330 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21026 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43897 (_ BitVec 32)) SeekEntryResult!8614)

(assert (=> b!806892 (= lt!361329 (seekEntryOrOpen!0 (select (arr!21026 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!806893 () Bool)

(declare-fun res!551162 () Bool)

(assert (=> b!806893 (=> (not res!551162) (not e!446762))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!806893 (= res!551162 (and (= (size!21447 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21447 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21447 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!806894 () Bool)

(declare-fun res!551155 () Bool)

(assert (=> b!806894 (=> (not res!551155) (not e!446760))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!806894 (= res!551155 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21447 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21026 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21447 a!3170)) (= (select (arr!21026 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!806895 () Bool)

(assert (=> b!806895 (= e!446761 false)))

(declare-fun lt!361328 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!806895 (= lt!361328 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!806896 () Bool)

(assert (=> b!806896 (= e!446762 e!446760)))

(declare-fun res!551160 () Bool)

(assert (=> b!806896 (=> (not res!551160) (not e!446760))))

(declare-fun lt!361331 () SeekEntryResult!8614)

(assert (=> b!806896 (= res!551160 (or (= lt!361331 (MissingZero!8614 i!1163)) (= lt!361331 (MissingVacant!8614 i!1163))))))

(assert (=> b!806896 (= lt!361331 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!806897 () Bool)

(declare-fun res!551158 () Bool)

(assert (=> b!806897 (=> (not res!551158) (not e!446760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43897 (_ BitVec 32)) Bool)

(assert (=> b!806897 (= res!551158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!806898 () Bool)

(assert (=> b!806898 (= e!446760 e!446763)))

(declare-fun res!551156 () Bool)

(assert (=> b!806898 (=> (not res!551156) (not e!446763))))

(declare-fun lt!361326 () (_ BitVec 64))

(declare-fun lt!361327 () array!43897)

(assert (=> b!806898 (= res!551156 (= (seekEntryOrOpen!0 lt!361326 lt!361327 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361326 lt!361327 mask!3266)))))

(assert (=> b!806898 (= lt!361326 (select (store (arr!21026 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!806898 (= lt!361327 (array!43898 (store (arr!21026 a!3170) i!1163 k0!2044) (size!21447 a!3170)))))

(declare-fun b!806899 () Bool)

(declare-fun res!551154 () Bool)

(assert (=> b!806899 (=> (not res!551154) (not e!446762))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!806899 (= res!551154 (validKeyInArray!0 (select (arr!21026 a!3170) j!153)))))

(declare-fun b!806900 () Bool)

(declare-fun res!551159 () Bool)

(assert (=> b!806900 (=> (not res!551159) (not e!446762))))

(assert (=> b!806900 (= res!551159 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69180 res!551157) b!806893))

(assert (= (and b!806893 res!551162) b!806899))

(assert (= (and b!806899 res!551154) b!806900))

(assert (= (and b!806900 res!551159) b!806890))

(assert (= (and b!806890 res!551161) b!806896))

(assert (= (and b!806896 res!551160) b!806897))

(assert (= (and b!806897 res!551158) b!806891))

(assert (= (and b!806891 res!551163) b!806894))

(assert (= (and b!806894 res!551155) b!806898))

(assert (= (and b!806898 res!551156) b!806892))

(assert (= (and b!806892 res!551153) b!806895))

(declare-fun m!748387 () Bool)

(assert (=> b!806897 m!748387))

(declare-fun m!748389 () Bool)

(assert (=> b!806898 m!748389))

(declare-fun m!748391 () Bool)

(assert (=> b!806898 m!748391))

(declare-fun m!748393 () Bool)

(assert (=> b!806898 m!748393))

(declare-fun m!748395 () Bool)

(assert (=> b!806898 m!748395))

(declare-fun m!748397 () Bool)

(assert (=> b!806890 m!748397))

(declare-fun m!748399 () Bool)

(assert (=> b!806896 m!748399))

(declare-fun m!748401 () Bool)

(assert (=> start!69180 m!748401))

(declare-fun m!748403 () Bool)

(assert (=> start!69180 m!748403))

(declare-fun m!748405 () Bool)

(assert (=> b!806895 m!748405))

(declare-fun m!748407 () Bool)

(assert (=> b!806891 m!748407))

(declare-fun m!748409 () Bool)

(assert (=> b!806892 m!748409))

(declare-fun m!748411 () Bool)

(assert (=> b!806892 m!748411))

(assert (=> b!806892 m!748411))

(declare-fun m!748413 () Bool)

(assert (=> b!806892 m!748413))

(assert (=> b!806892 m!748411))

(declare-fun m!748415 () Bool)

(assert (=> b!806892 m!748415))

(assert (=> b!806899 m!748411))

(assert (=> b!806899 m!748411))

(declare-fun m!748417 () Bool)

(assert (=> b!806899 m!748417))

(declare-fun m!748419 () Bool)

(assert (=> b!806894 m!748419))

(declare-fun m!748421 () Bool)

(assert (=> b!806894 m!748421))

(declare-fun m!748423 () Bool)

(assert (=> b!806900 m!748423))

(check-sat (not b!806895) (not b!806890) (not b!806898) (not b!806892) (not b!806899) (not b!806896) (not b!806900) (not b!806891) (not b!806897) (not start!69180))
(check-sat)
