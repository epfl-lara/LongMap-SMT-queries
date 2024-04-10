; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69008 () Bool)

(assert start!69008)

(declare-fun b!805059 () Bool)

(declare-fun res!549579 () Bool)

(declare-fun e!445897 () Bool)

(assert (=> b!805059 (=> (not res!549579) (not e!445897))))

(declare-datatypes ((array!43798 0))(
  ( (array!43799 (arr!20979 (Array (_ BitVec 32) (_ BitVec 64))) (size!21400 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43798)

(declare-datatypes ((List!14942 0))(
  ( (Nil!14939) (Cons!14938 (h!16067 (_ BitVec 64)) (t!21257 List!14942)) )
))
(declare-fun arrayNoDuplicates!0 (array!43798 (_ BitVec 32) List!14942) Bool)

(assert (=> b!805059 (= res!549579 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14939))))

(declare-fun b!805061 () Bool)

(declare-fun res!549585 () Bool)

(assert (=> b!805061 (=> (not res!549585) (not e!445897))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43798 (_ BitVec 32)) Bool)

(assert (=> b!805061 (= res!549585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805062 () Bool)

(declare-fun e!445895 () Bool)

(assert (=> b!805062 (= e!445897 e!445895)))

(declare-fun res!549586 () Bool)

(assert (=> b!805062 (=> (not res!549586) (not e!445895))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360436 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!360438 () array!43798)

(declare-fun index!1236 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8570 0))(
  ( (MissingZero!8570 (index!36648 (_ BitVec 32))) (Found!8570 (index!36649 (_ BitVec 32))) (Intermediate!8570 (undefined!9382 Bool) (index!36650 (_ BitVec 32)) (x!67472 (_ BitVec 32))) (Undefined!8570) (MissingVacant!8570 (index!36651 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43798 (_ BitVec 32)) SeekEntryResult!8570)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43798 (_ BitVec 32)) SeekEntryResult!8570)

(assert (=> b!805062 (= res!549586 (= (seekEntryOrOpen!0 lt!360436 lt!360438 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360436 lt!360438 mask!3266)))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!805062 (= lt!360436 (select (store (arr!20979 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805062 (= lt!360438 (array!43799 (store (arr!20979 a!3170) i!1163 k!2044) (size!21400 a!3170)))))

(declare-fun b!805063 () Bool)

(assert (=> b!805063 (= e!445895 false)))

(declare-fun lt!360440 () SeekEntryResult!8570)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805063 (= lt!360440 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20979 a!3170) j!153) a!3170 mask!3266))))

(declare-fun lt!360439 () SeekEntryResult!8570)

(assert (=> b!805063 (= lt!360439 (seekEntryOrOpen!0 (select (arr!20979 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805064 () Bool)

(declare-fun res!549580 () Bool)

(assert (=> b!805064 (=> (not res!549580) (not e!445897))))

(assert (=> b!805064 (= res!549580 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21400 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20979 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21400 a!3170)) (= (select (arr!20979 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805065 () Bool)

(declare-fun res!549584 () Bool)

(declare-fun e!445898 () Bool)

(assert (=> b!805065 (=> (not res!549584) (not e!445898))))

(assert (=> b!805065 (= res!549584 (and (= (size!21400 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21400 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21400 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805066 () Bool)

(declare-fun res!549587 () Bool)

(assert (=> b!805066 (=> (not res!549587) (not e!445898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805066 (= res!549587 (validKeyInArray!0 (select (arr!20979 a!3170) j!153)))))

(declare-fun b!805067 () Bool)

(declare-fun res!549581 () Bool)

(assert (=> b!805067 (=> (not res!549581) (not e!445898))))

(declare-fun arrayContainsKey!0 (array!43798 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805067 (= res!549581 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805068 () Bool)

(declare-fun res!549582 () Bool)

(assert (=> b!805068 (=> (not res!549582) (not e!445898))))

(assert (=> b!805068 (= res!549582 (validKeyInArray!0 k!2044))))

(declare-fun res!549583 () Bool)

(assert (=> start!69008 (=> (not res!549583) (not e!445898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69008 (= res!549583 (validMask!0 mask!3266))))

(assert (=> start!69008 e!445898))

(assert (=> start!69008 true))

(declare-fun array_inv!16775 (array!43798) Bool)

(assert (=> start!69008 (array_inv!16775 a!3170)))

(declare-fun b!805060 () Bool)

(assert (=> b!805060 (= e!445898 e!445897)))

(declare-fun res!549578 () Bool)

(assert (=> b!805060 (=> (not res!549578) (not e!445897))))

(declare-fun lt!360437 () SeekEntryResult!8570)

(assert (=> b!805060 (= res!549578 (or (= lt!360437 (MissingZero!8570 i!1163)) (= lt!360437 (MissingVacant!8570 i!1163))))))

(assert (=> b!805060 (= lt!360437 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(assert (= (and start!69008 res!549583) b!805065))

(assert (= (and b!805065 res!549584) b!805066))

(assert (= (and b!805066 res!549587) b!805068))

(assert (= (and b!805068 res!549582) b!805067))

(assert (= (and b!805067 res!549581) b!805060))

(assert (= (and b!805060 res!549578) b!805061))

(assert (= (and b!805061 res!549585) b!805059))

(assert (= (and b!805059 res!549579) b!805064))

(assert (= (and b!805064 res!549580) b!805062))

(assert (= (and b!805062 res!549586) b!805063))

(declare-fun m!746957 () Bool)

(assert (=> b!805060 m!746957))

(declare-fun m!746959 () Bool)

(assert (=> b!805064 m!746959))

(declare-fun m!746961 () Bool)

(assert (=> b!805064 m!746961))

(declare-fun m!746963 () Bool)

(assert (=> b!805066 m!746963))

(assert (=> b!805066 m!746963))

(declare-fun m!746965 () Bool)

(assert (=> b!805066 m!746965))

(declare-fun m!746967 () Bool)

(assert (=> start!69008 m!746967))

(declare-fun m!746969 () Bool)

(assert (=> start!69008 m!746969))

(declare-fun m!746971 () Bool)

(assert (=> b!805061 m!746971))

(declare-fun m!746973 () Bool)

(assert (=> b!805068 m!746973))

(declare-fun m!746975 () Bool)

(assert (=> b!805059 m!746975))

(assert (=> b!805063 m!746963))

(assert (=> b!805063 m!746963))

(declare-fun m!746977 () Bool)

(assert (=> b!805063 m!746977))

(assert (=> b!805063 m!746963))

(declare-fun m!746979 () Bool)

(assert (=> b!805063 m!746979))

(declare-fun m!746981 () Bool)

(assert (=> b!805067 m!746981))

(declare-fun m!746983 () Bool)

(assert (=> b!805062 m!746983))

(declare-fun m!746985 () Bool)

(assert (=> b!805062 m!746985))

(declare-fun m!746987 () Bool)

(assert (=> b!805062 m!746987))

(declare-fun m!746989 () Bool)

(assert (=> b!805062 m!746989))

(push 1)

