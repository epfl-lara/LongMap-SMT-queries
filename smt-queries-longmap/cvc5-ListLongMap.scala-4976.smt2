; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68366 () Bool)

(assert start!68366)

(declare-fun b!794374 () Bool)

(declare-fun res!538901 () Bool)

(declare-fun e!441096 () Bool)

(assert (=> b!794374 (=> (not res!538901) (not e!441096))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794374 (= res!538901 (validKeyInArray!0 k!2044))))

(declare-fun b!794375 () Bool)

(declare-fun res!538898 () Bool)

(declare-fun e!441097 () Bool)

(assert (=> b!794375 (=> (not res!538898) (not e!441097))))

(declare-datatypes ((array!43156 0))(
  ( (array!43157 (arr!20658 (Array (_ BitVec 32) (_ BitVec 64))) (size!21079 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43156)

(declare-datatypes ((List!14621 0))(
  ( (Nil!14618) (Cons!14617 (h!15746 (_ BitVec 64)) (t!20936 List!14621)) )
))
(declare-fun arrayNoDuplicates!0 (array!43156 (_ BitVec 32) List!14621) Bool)

(assert (=> b!794375 (= res!538898 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14618))))

(declare-fun res!538894 () Bool)

(assert (=> start!68366 (=> (not res!538894) (not e!441096))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68366 (= res!538894 (validMask!0 mask!3266))))

(assert (=> start!68366 e!441096))

(assert (=> start!68366 true))

(declare-fun array_inv!16454 (array!43156) Bool)

(assert (=> start!68366 (array_inv!16454 a!3170)))

(declare-fun b!794376 () Bool)

(assert (=> b!794376 (= e!441097 false)))

(declare-datatypes ((SeekEntryResult!8249 0))(
  ( (MissingZero!8249 (index!35364 (_ BitVec 32))) (Found!8249 (index!35365 (_ BitVec 32))) (Intermediate!8249 (undefined!9061 Bool) (index!35366 (_ BitVec 32)) (x!66295 (_ BitVec 32))) (Undefined!8249) (MissingVacant!8249 (index!35367 (_ BitVec 32))) )
))
(declare-fun lt!354103 () SeekEntryResult!8249)

(declare-fun lt!354100 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354102 () array!43156)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43156 (_ BitVec 32)) SeekEntryResult!8249)

(assert (=> b!794376 (= lt!354103 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354100 lt!354102 mask!3266))))

(declare-fun lt!354104 () SeekEntryResult!8249)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43156 (_ BitVec 32)) SeekEntryResult!8249)

(assert (=> b!794376 (= lt!354104 (seekEntryOrOpen!0 lt!354100 lt!354102 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!794376 (= lt!354100 (select (store (arr!20658 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!794376 (= lt!354102 (array!43157 (store (arr!20658 a!3170) i!1163 k!2044) (size!21079 a!3170)))))

(declare-fun b!794377 () Bool)

(declare-fun res!538896 () Bool)

(assert (=> b!794377 (=> (not res!538896) (not e!441097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43156 (_ BitVec 32)) Bool)

(assert (=> b!794377 (= res!538896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794378 () Bool)

(declare-fun res!538899 () Bool)

(assert (=> b!794378 (=> (not res!538899) (not e!441097))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!794378 (= res!538899 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21079 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20658 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21079 a!3170)) (= (select (arr!20658 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!794379 () Bool)

(declare-fun res!538893 () Bool)

(assert (=> b!794379 (=> (not res!538893) (not e!441096))))

(assert (=> b!794379 (= res!538893 (validKeyInArray!0 (select (arr!20658 a!3170) j!153)))))

(declare-fun b!794380 () Bool)

(declare-fun res!538895 () Bool)

(assert (=> b!794380 (=> (not res!538895) (not e!441096))))

(assert (=> b!794380 (= res!538895 (and (= (size!21079 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21079 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21079 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794381 () Bool)

(declare-fun res!538897 () Bool)

(assert (=> b!794381 (=> (not res!538897) (not e!441096))))

(declare-fun arrayContainsKey!0 (array!43156 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794381 (= res!538897 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794382 () Bool)

(assert (=> b!794382 (= e!441096 e!441097)))

(declare-fun res!538900 () Bool)

(assert (=> b!794382 (=> (not res!538900) (not e!441097))))

(declare-fun lt!354101 () SeekEntryResult!8249)

(assert (=> b!794382 (= res!538900 (or (= lt!354101 (MissingZero!8249 i!1163)) (= lt!354101 (MissingVacant!8249 i!1163))))))

(assert (=> b!794382 (= lt!354101 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!68366 res!538894) b!794380))

(assert (= (and b!794380 res!538895) b!794379))

(assert (= (and b!794379 res!538893) b!794374))

(assert (= (and b!794374 res!538901) b!794381))

(assert (= (and b!794381 res!538897) b!794382))

(assert (= (and b!794382 res!538900) b!794377))

(assert (= (and b!794377 res!538896) b!794375))

(assert (= (and b!794375 res!538898) b!794378))

(assert (= (and b!794378 res!538899) b!794376))

(declare-fun m!734903 () Bool)

(assert (=> b!794378 m!734903))

(declare-fun m!734905 () Bool)

(assert (=> b!794378 m!734905))

(declare-fun m!734907 () Bool)

(assert (=> b!794375 m!734907))

(declare-fun m!734909 () Bool)

(assert (=> b!794374 m!734909))

(declare-fun m!734911 () Bool)

(assert (=> start!68366 m!734911))

(declare-fun m!734913 () Bool)

(assert (=> start!68366 m!734913))

(declare-fun m!734915 () Bool)

(assert (=> b!794381 m!734915))

(declare-fun m!734917 () Bool)

(assert (=> b!794382 m!734917))

(declare-fun m!734919 () Bool)

(assert (=> b!794379 m!734919))

(assert (=> b!794379 m!734919))

(declare-fun m!734921 () Bool)

(assert (=> b!794379 m!734921))

(declare-fun m!734923 () Bool)

(assert (=> b!794376 m!734923))

(declare-fun m!734925 () Bool)

(assert (=> b!794376 m!734925))

(declare-fun m!734927 () Bool)

(assert (=> b!794376 m!734927))

(declare-fun m!734929 () Bool)

(assert (=> b!794376 m!734929))

(declare-fun m!734931 () Bool)

(assert (=> b!794377 m!734931))

(push 1)

