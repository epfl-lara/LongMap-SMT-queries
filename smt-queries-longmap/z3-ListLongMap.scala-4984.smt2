; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68394 () Bool)

(assert start!68394)

(declare-fun b!794855 () Bool)

(declare-fun res!539518 () Bool)

(declare-fun e!441214 () Bool)

(assert (=> b!794855 (=> (not res!539518) (not e!441214))))

(declare-datatypes ((array!43201 0))(
  ( (array!43202 (arr!20681 (Array (_ BitVec 32) (_ BitVec 64))) (size!21102 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43201)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794855 (= res!539518 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794856 () Bool)

(declare-fun e!441215 () Bool)

(assert (=> b!794856 (= e!441214 e!441215)))

(declare-fun res!539516 () Bool)

(assert (=> b!794856 (=> (not res!539516) (not e!441215))))

(declare-datatypes ((SeekEntryResult!8269 0))(
  ( (MissingZero!8269 (index!35444 (_ BitVec 32))) (Found!8269 (index!35445 (_ BitVec 32))) (Intermediate!8269 (undefined!9081 Bool) (index!35446 (_ BitVec 32)) (x!66374 (_ BitVec 32))) (Undefined!8269) (MissingVacant!8269 (index!35447 (_ BitVec 32))) )
))
(declare-fun lt!354166 () SeekEntryResult!8269)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794856 (= res!539516 (or (= lt!354166 (MissingZero!8269 i!1163)) (= lt!354166 (MissingVacant!8269 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43201 (_ BitVec 32)) SeekEntryResult!8269)

(assert (=> b!794856 (= lt!354166 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!794857 () Bool)

(declare-fun res!539520 () Bool)

(assert (=> b!794857 (=> (not res!539520) (not e!441215))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!794857 (= res!539520 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21102 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20681 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21102 a!3170)) (= (select (arr!20681 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794858 () Bool)

(declare-fun res!539519 () Bool)

(assert (=> b!794858 (=> (not res!539519) (not e!441214))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794858 (= res!539519 (and (= (size!21102 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21102 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21102 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794859 () Bool)

(declare-fun res!539522 () Bool)

(assert (=> b!794859 (=> (not res!539522) (not e!441214))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794859 (= res!539522 (validKeyInArray!0 k0!2044))))

(declare-fun b!794860 () Bool)

(declare-fun e!441217 () Bool)

(assert (=> b!794860 (= e!441217 false)))

(declare-fun lt!354167 () SeekEntryResult!8269)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43201 (_ BitVec 32)) SeekEntryResult!8269)

(assert (=> b!794860 (= lt!354167 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20681 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!354168 () SeekEntryResult!8269)

(assert (=> b!794860 (= lt!354168 (seekEntryOrOpen!0 (select (arr!20681 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!794861 () Bool)

(declare-fun res!539521 () Bool)

(assert (=> b!794861 (=> (not res!539521) (not e!441214))))

(assert (=> b!794861 (= res!539521 (validKeyInArray!0 (select (arr!20681 a!3170) j!153)))))

(declare-fun res!539517 () Bool)

(assert (=> start!68394 (=> (not res!539517) (not e!441214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68394 (= res!539517 (validMask!0 mask!3266))))

(assert (=> start!68394 e!441214))

(assert (=> start!68394 true))

(declare-fun array_inv!16564 (array!43201) Bool)

(assert (=> start!68394 (array_inv!16564 a!3170)))

(declare-fun b!794862 () Bool)

(declare-fun res!539515 () Bool)

(assert (=> b!794862 (=> (not res!539515) (not e!441215))))

(declare-datatypes ((List!14683 0))(
  ( (Nil!14680) (Cons!14679 (h!15808 (_ BitVec 64)) (t!20989 List!14683)) )
))
(declare-fun arrayNoDuplicates!0 (array!43201 (_ BitVec 32) List!14683) Bool)

(assert (=> b!794862 (= res!539515 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14680))))

(declare-fun b!794863 () Bool)

(declare-fun res!539514 () Bool)

(assert (=> b!794863 (=> (not res!539514) (not e!441215))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43201 (_ BitVec 32)) Bool)

(assert (=> b!794863 (= res!539514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794864 () Bool)

(assert (=> b!794864 (= e!441215 e!441217)))

(declare-fun res!539523 () Bool)

(assert (=> b!794864 (=> (not res!539523) (not e!441217))))

(declare-fun lt!354170 () (_ BitVec 64))

(declare-fun lt!354169 () array!43201)

(assert (=> b!794864 (= res!539523 (= (seekEntryOrOpen!0 lt!354170 lt!354169 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354170 lt!354169 mask!3266)))))

(assert (=> b!794864 (= lt!354170 (select (store (arr!20681 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794864 (= lt!354169 (array!43202 (store (arr!20681 a!3170) i!1163 k0!2044) (size!21102 a!3170)))))

(assert (= (and start!68394 res!539517) b!794858))

(assert (= (and b!794858 res!539519) b!794861))

(assert (= (and b!794861 res!539521) b!794859))

(assert (= (and b!794859 res!539522) b!794855))

(assert (= (and b!794855 res!539518) b!794856))

(assert (= (and b!794856 res!539516) b!794863))

(assert (= (and b!794863 res!539514) b!794862))

(assert (= (and b!794862 res!539515) b!794857))

(assert (= (and b!794857 res!539520) b!794864))

(assert (= (and b!794864 res!539523) b!794860))

(declare-fun m!734953 () Bool)

(assert (=> b!794863 m!734953))

(declare-fun m!734955 () Bool)

(assert (=> b!794856 m!734955))

(declare-fun m!734957 () Bool)

(assert (=> b!794859 m!734957))

(declare-fun m!734959 () Bool)

(assert (=> start!68394 m!734959))

(declare-fun m!734961 () Bool)

(assert (=> start!68394 m!734961))

(declare-fun m!734963 () Bool)

(assert (=> b!794855 m!734963))

(declare-fun m!734965 () Bool)

(assert (=> b!794860 m!734965))

(assert (=> b!794860 m!734965))

(declare-fun m!734967 () Bool)

(assert (=> b!794860 m!734967))

(assert (=> b!794860 m!734965))

(declare-fun m!734969 () Bool)

(assert (=> b!794860 m!734969))

(declare-fun m!734971 () Bool)

(assert (=> b!794864 m!734971))

(declare-fun m!734973 () Bool)

(assert (=> b!794864 m!734973))

(declare-fun m!734975 () Bool)

(assert (=> b!794864 m!734975))

(declare-fun m!734977 () Bool)

(assert (=> b!794864 m!734977))

(assert (=> b!794861 m!734965))

(assert (=> b!794861 m!734965))

(declare-fun m!734979 () Bool)

(assert (=> b!794861 m!734979))

(declare-fun m!734981 () Bool)

(assert (=> b!794862 m!734981))

(declare-fun m!734983 () Bool)

(assert (=> b!794857 m!734983))

(declare-fun m!734985 () Bool)

(assert (=> b!794857 m!734985))

(check-sat (not b!794859) (not b!794860) (not start!68394) (not b!794861) (not b!794864) (not b!794855) (not b!794856) (not b!794863) (not b!794862))
(check-sat)
