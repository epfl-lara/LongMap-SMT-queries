; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68880 () Bool)

(assert start!68880)

(declare-fun b!803262 () Bool)

(declare-fun e!445117 () Bool)

(declare-fun lt!359480 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803262 (= e!445117 (validKeyInArray!0 lt!359480))))

(declare-fun b!803264 () Bool)

(declare-fun res!547781 () Bool)

(declare-fun e!445121 () Bool)

(assert (=> b!803264 (=> (not res!547781) (not e!445121))))

(declare-datatypes ((array!43670 0))(
  ( (array!43671 (arr!20915 (Array (_ BitVec 32) (_ BitVec 64))) (size!21336 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43670)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803264 (= res!547781 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803265 () Bool)

(declare-fun res!547792 () Bool)

(assert (=> b!803265 (=> (not res!547792) (not e!445121))))

(assert (=> b!803265 (= res!547792 (validKeyInArray!0 k!2044))))

(declare-fun b!803266 () Bool)

(declare-fun e!445116 () Bool)

(assert (=> b!803266 (= e!445121 e!445116)))

(declare-fun res!547791 () Bool)

(assert (=> b!803266 (=> (not res!547791) (not e!445116))))

(declare-datatypes ((SeekEntryResult!8506 0))(
  ( (MissingZero!8506 (index!36392 (_ BitVec 32))) (Found!8506 (index!36393 (_ BitVec 32))) (Intermediate!8506 (undefined!9318 Bool) (index!36394 (_ BitVec 32)) (x!67232 (_ BitVec 32))) (Undefined!8506) (MissingVacant!8506 (index!36395 (_ BitVec 32))) )
))
(declare-fun lt!359478 () SeekEntryResult!8506)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!803266 (= res!547791 (or (= lt!359478 (MissingZero!8506 i!1163)) (= lt!359478 (MissingVacant!8506 i!1163))))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43670 (_ BitVec 32)) SeekEntryResult!8506)

(assert (=> b!803266 (= lt!359478 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!803267 () Bool)

(declare-fun res!547783 () Bool)

(assert (=> b!803267 (=> (not res!547783) (not e!445121))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803267 (= res!547783 (and (= (size!21336 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21336 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21336 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803268 () Bool)

(declare-fun res!547789 () Bool)

(assert (=> b!803268 (=> (not res!547789) (not e!445121))))

(assert (=> b!803268 (= res!547789 (validKeyInArray!0 (select (arr!20915 a!3170) j!153)))))

(declare-fun b!803269 () Bool)

(declare-fun res!547784 () Bool)

(assert (=> b!803269 (=> (not res!547784) (not e!445116))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803269 (= res!547784 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21336 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20915 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21336 a!3170)) (= (select (arr!20915 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803270 () Bool)

(declare-fun e!445115 () Bool)

(assert (=> b!803270 (= e!445116 e!445115)))

(declare-fun res!547786 () Bool)

(assert (=> b!803270 (=> (not res!547786) (not e!445115))))

(declare-fun lt!359472 () SeekEntryResult!8506)

(declare-fun lt!359475 () SeekEntryResult!8506)

(assert (=> b!803270 (= res!547786 (= lt!359472 lt!359475))))

(declare-fun lt!359473 () array!43670)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43670 (_ BitVec 32)) SeekEntryResult!8506)

(assert (=> b!803270 (= lt!359475 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359480 lt!359473 mask!3266))))

(assert (=> b!803270 (= lt!359472 (seekEntryOrOpen!0 lt!359480 lt!359473 mask!3266))))

(assert (=> b!803270 (= lt!359480 (select (store (arr!20915 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!803270 (= lt!359473 (array!43671 (store (arr!20915 a!3170) i!1163 k!2044) (size!21336 a!3170)))))

(declare-fun b!803271 () Bool)

(declare-fun e!445118 () Bool)

(declare-fun e!445119 () Bool)

(assert (=> b!803271 (= e!445118 e!445119)))

(declare-fun res!547788 () Bool)

(assert (=> b!803271 (=> (not res!547788) (not e!445119))))

(declare-fun lt!359479 () SeekEntryResult!8506)

(declare-fun lt!359476 () SeekEntryResult!8506)

(assert (=> b!803271 (= res!547788 (and (= lt!359476 lt!359479) (not (= (select (arr!20915 a!3170) index!1236) (select (arr!20915 a!3170) j!153)))))))

(assert (=> b!803271 (= lt!359479 (Found!8506 j!153))))

(declare-fun b!803272 () Bool)

(declare-fun res!547793 () Bool)

(assert (=> b!803272 (=> (not res!547793) (not e!445116))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43670 (_ BitVec 32)) Bool)

(assert (=> b!803272 (= res!547793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!803273 () Bool)

(declare-fun res!547782 () Bool)

(assert (=> b!803273 (=> (not res!547782) (not e!445116))))

(declare-datatypes ((List!14878 0))(
  ( (Nil!14875) (Cons!14874 (h!16003 (_ BitVec 64)) (t!21193 List!14878)) )
))
(declare-fun arrayNoDuplicates!0 (array!43670 (_ BitVec 32) List!14878) Bool)

(assert (=> b!803273 (= res!547782 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14875))))

(declare-fun b!803274 () Bool)

(assert (=> b!803274 (= e!445115 e!445118)))

(declare-fun res!547787 () Bool)

(assert (=> b!803274 (=> (not res!547787) (not e!445118))))

(declare-fun lt!359477 () SeekEntryResult!8506)

(assert (=> b!803274 (= res!547787 (= lt!359477 lt!359476))))

(assert (=> b!803274 (= lt!359476 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20915 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803274 (= lt!359477 (seekEntryOrOpen!0 (select (arr!20915 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!547790 () Bool)

(assert (=> start!68880 (=> (not res!547790) (not e!445121))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68880 (= res!547790 (validMask!0 mask!3266))))

(assert (=> start!68880 e!445121))

(assert (=> start!68880 true))

(declare-fun array_inv!16711 (array!43670) Bool)

(assert (=> start!68880 (array_inv!16711 a!3170)))

(declare-fun b!803263 () Bool)

(assert (=> b!803263 (= e!445119 (not e!445117))))

(declare-fun res!547785 () Bool)

(assert (=> b!803263 (=> res!547785 e!445117)))

(assert (=> b!803263 (= res!547785 (or (not (= lt!359475 lt!359479)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20915 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!359474 () (_ BitVec 32))

(assert (=> b!803263 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359474 vacantAfter!23 lt!359480 lt!359473 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359474 vacantBefore!23 (select (arr!20915 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27552 0))(
  ( (Unit!27553) )
))
(declare-fun lt!359471 () Unit!27552)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43670 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27552)

(assert (=> b!803263 (= lt!359471 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k!2044 j!153 lt!359474 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803263 (= lt!359474 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68880 res!547790) b!803267))

(assert (= (and b!803267 res!547783) b!803268))

(assert (= (and b!803268 res!547789) b!803265))

(assert (= (and b!803265 res!547792) b!803264))

(assert (= (and b!803264 res!547781) b!803266))

(assert (= (and b!803266 res!547791) b!803272))

(assert (= (and b!803272 res!547793) b!803273))

(assert (= (and b!803273 res!547782) b!803269))

(assert (= (and b!803269 res!547784) b!803270))

(assert (= (and b!803270 res!547786) b!803274))

(assert (= (and b!803274 res!547787) b!803271))

(assert (= (and b!803271 res!547788) b!803263))

(assert (= (and b!803263 (not res!547785)) b!803262))

(declare-fun m!744935 () Bool)

(assert (=> b!803269 m!744935))

(declare-fun m!744937 () Bool)

(assert (=> b!803269 m!744937))

(declare-fun m!744939 () Bool)

(assert (=> b!803262 m!744939))

(declare-fun m!744941 () Bool)

(assert (=> b!803273 m!744941))

(declare-fun m!744943 () Bool)

(assert (=> b!803265 m!744943))

(declare-fun m!744945 () Bool)

(assert (=> b!803264 m!744945))

(declare-fun m!744947 () Bool)

(assert (=> b!803271 m!744947))

(declare-fun m!744949 () Bool)

(assert (=> b!803271 m!744949))

(assert (=> b!803274 m!744949))

(assert (=> b!803274 m!744949))

(declare-fun m!744951 () Bool)

(assert (=> b!803274 m!744951))

(assert (=> b!803274 m!744949))

(declare-fun m!744953 () Bool)

(assert (=> b!803274 m!744953))

(declare-fun m!744955 () Bool)

(assert (=> b!803270 m!744955))

(declare-fun m!744957 () Bool)

(assert (=> b!803270 m!744957))

(declare-fun m!744959 () Bool)

(assert (=> b!803270 m!744959))

(declare-fun m!744961 () Bool)

(assert (=> b!803270 m!744961))

(assert (=> b!803268 m!744949))

(assert (=> b!803268 m!744949))

(declare-fun m!744963 () Bool)

(assert (=> b!803268 m!744963))

(declare-fun m!744965 () Bool)

(assert (=> start!68880 m!744965))

(declare-fun m!744967 () Bool)

(assert (=> start!68880 m!744967))

(assert (=> b!803263 m!744949))

(declare-fun m!744969 () Bool)

(assert (=> b!803263 m!744969))

(assert (=> b!803263 m!744949))

(declare-fun m!744971 () Bool)

(assert (=> b!803263 m!744971))

(declare-fun m!744973 () Bool)

(assert (=> b!803263 m!744973))

(declare-fun m!744975 () Bool)

(assert (=> b!803263 m!744975))

(declare-fun m!744977 () Bool)

(assert (=> b!803263 m!744977))

(assert (=> b!803263 m!744959))

(declare-fun m!744979 () Bool)

(assert (=> b!803272 m!744979))

(declare-fun m!744981 () Bool)

(assert (=> b!803266 m!744981))

(push 1)

(assert (not b!803264))

(assert (not b!803265))

(assert (not b!803268))

(assert (not b!803263))

(assert (not b!803266))

(assert (not b!803274))

(assert (not b!803270))

(assert (not b!803273))

