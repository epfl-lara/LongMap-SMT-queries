; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68982 () Bool)

(assert start!68982)

(declare-fun b!804679 () Bool)

(declare-fun res!549205 () Bool)

(declare-fun e!445750 () Bool)

(assert (=> b!804679 (=> (not res!549205) (not e!445750))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43772 0))(
  ( (array!43773 (arr!20966 (Array (_ BitVec 32) (_ BitVec 64))) (size!21387 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43772)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804679 (= res!549205 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21387 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20966 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21387 a!3170)) (= (select (arr!20966 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!804680 () Bool)

(declare-fun res!549201 () Bool)

(assert (=> b!804680 (=> (not res!549201) (not e!445750))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43772 (_ BitVec 32)) Bool)

(assert (=> b!804680 (= res!549201 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804681 () Bool)

(declare-fun e!445751 () Bool)

(assert (=> b!804681 (= e!445751 e!445750)))

(declare-fun res!549203 () Bool)

(assert (=> b!804681 (=> (not res!549203) (not e!445750))))

(declare-datatypes ((SeekEntryResult!8557 0))(
  ( (MissingZero!8557 (index!36596 (_ BitVec 32))) (Found!8557 (index!36597 (_ BitVec 32))) (Intermediate!8557 (undefined!9369 Bool) (index!36598 (_ BitVec 32)) (x!67419 (_ BitVec 32))) (Undefined!8557) (MissingVacant!8557 (index!36599 (_ BitVec 32))) )
))
(declare-fun lt!360245 () SeekEntryResult!8557)

(assert (=> b!804681 (= res!549203 (or (= lt!360245 (MissingZero!8557 i!1163)) (= lt!360245 (MissingVacant!8557 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43772 (_ BitVec 32)) SeekEntryResult!8557)

(assert (=> b!804681 (= lt!360245 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!804682 () Bool)

(declare-fun res!549198 () Bool)

(assert (=> b!804682 (=> (not res!549198) (not e!445751))))

(declare-fun arrayContainsKey!0 (array!43772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804682 (= res!549198 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804683 () Bool)

(declare-fun res!549199 () Bool)

(assert (=> b!804683 (=> (not res!549199) (not e!445751))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804683 (= res!549199 (validKeyInArray!0 k!2044))))

(declare-fun res!549206 () Bool)

(assert (=> start!68982 (=> (not res!549206) (not e!445751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68982 (= res!549206 (validMask!0 mask!3266))))

(assert (=> start!68982 e!445751))

(assert (=> start!68982 true))

(declare-fun array_inv!16762 (array!43772) Bool)

(assert (=> start!68982 (array_inv!16762 a!3170)))

(declare-fun b!804684 () Bool)

(assert (=> b!804684 (= e!445750 false)))

(declare-fun lt!360241 () SeekEntryResult!8557)

(declare-fun lt!360244 () array!43772)

(declare-fun lt!360243 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43772 (_ BitVec 32)) SeekEntryResult!8557)

(assert (=> b!804684 (= lt!360241 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360243 lt!360244 mask!3266))))

(declare-fun lt!360242 () SeekEntryResult!8557)

(assert (=> b!804684 (= lt!360242 (seekEntryOrOpen!0 lt!360243 lt!360244 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!804684 (= lt!360243 (select (store (arr!20966 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!804684 (= lt!360244 (array!43773 (store (arr!20966 a!3170) i!1163 k!2044) (size!21387 a!3170)))))

(declare-fun b!804685 () Bool)

(declare-fun res!549204 () Bool)

(assert (=> b!804685 (=> (not res!549204) (not e!445750))))

(declare-datatypes ((List!14929 0))(
  ( (Nil!14926) (Cons!14925 (h!16054 (_ BitVec 64)) (t!21244 List!14929)) )
))
(declare-fun arrayNoDuplicates!0 (array!43772 (_ BitVec 32) List!14929) Bool)

(assert (=> b!804685 (= res!549204 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14926))))

(declare-fun b!804686 () Bool)

(declare-fun res!549202 () Bool)

(assert (=> b!804686 (=> (not res!549202) (not e!445751))))

(assert (=> b!804686 (= res!549202 (and (= (size!21387 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21387 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21387 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804687 () Bool)

(declare-fun res!549200 () Bool)

(assert (=> b!804687 (=> (not res!549200) (not e!445751))))

(assert (=> b!804687 (= res!549200 (validKeyInArray!0 (select (arr!20966 a!3170) j!153)))))

(assert (= (and start!68982 res!549206) b!804686))

(assert (= (and b!804686 res!549202) b!804687))

(assert (= (and b!804687 res!549200) b!804683))

(assert (= (and b!804683 res!549199) b!804682))

(assert (= (and b!804682 res!549198) b!804681))

(assert (= (and b!804681 res!549203) b!804680))

(assert (= (and b!804680 res!549201) b!804685))

(assert (= (and b!804685 res!549204) b!804679))

(assert (= (and b!804679 res!549205) b!804684))

(declare-fun m!746531 () Bool)

(assert (=> b!804687 m!746531))

(assert (=> b!804687 m!746531))

(declare-fun m!746533 () Bool)

(assert (=> b!804687 m!746533))

(declare-fun m!746535 () Bool)

(assert (=> b!804680 m!746535))

(declare-fun m!746537 () Bool)

(assert (=> b!804682 m!746537))

(declare-fun m!746539 () Bool)

(assert (=> b!804679 m!746539))

(declare-fun m!746541 () Bool)

(assert (=> b!804679 m!746541))

(declare-fun m!746543 () Bool)

(assert (=> b!804683 m!746543))

(declare-fun m!746545 () Bool)

(assert (=> start!68982 m!746545))

(declare-fun m!746547 () Bool)

(assert (=> start!68982 m!746547))

(declare-fun m!746549 () Bool)

(assert (=> b!804681 m!746549))

(declare-fun m!746551 () Bool)

(assert (=> b!804684 m!746551))

(declare-fun m!746553 () Bool)

(assert (=> b!804684 m!746553))

(declare-fun m!746555 () Bool)

(assert (=> b!804684 m!746555))

(declare-fun m!746557 () Bool)

(assert (=> b!804684 m!746557))

(declare-fun m!746559 () Bool)

(assert (=> b!804685 m!746559))

(push 1)

(assert (not b!804685))

(assert (not b!804680))

(assert (not b!804681))

(assert (not b!804682))

(assert (not b!804683))

(assert (not start!68982))

(assert (not b!804684))

(assert (not b!804687))

