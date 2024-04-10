; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68766 () Bool)

(assert start!68766)

(declare-fun b!801264 () Bool)

(declare-fun e!444173 () Bool)

(declare-fun e!444176 () Bool)

(assert (=> b!801264 (= e!444173 e!444176)))

(declare-fun res!545790 () Bool)

(assert (=> b!801264 (=> (not res!545790) (not e!444176))))

(declare-datatypes ((array!43556 0))(
  ( (array!43557 (arr!20858 (Array (_ BitVec 32) (_ BitVec 64))) (size!21279 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43556)

(declare-datatypes ((SeekEntryResult!8449 0))(
  ( (MissingZero!8449 (index!36164 (_ BitVec 32))) (Found!8449 (index!36165 (_ BitVec 32))) (Intermediate!8449 (undefined!9261 Bool) (index!36166 (_ BitVec 32)) (x!67023 (_ BitVec 32))) (Undefined!8449) (MissingVacant!8449 (index!36167 (_ BitVec 32))) )
))
(declare-fun lt!358120 () SeekEntryResult!8449)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!358118 () SeekEntryResult!8449)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801264 (= res!545790 (and (= lt!358118 lt!358120) (= lt!358120 (Found!8449 j!153)) (not (= (select (arr!20858 a!3170) index!1236) (select (arr!20858 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43556 (_ BitVec 32)) SeekEntryResult!8449)

(assert (=> b!801264 (= lt!358120 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20858 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43556 (_ BitVec 32)) SeekEntryResult!8449)

(assert (=> b!801264 (= lt!358118 (seekEntryOrOpen!0 (select (arr!20858 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801265 () Bool)

(declare-fun e!444175 () Bool)

(assert (=> b!801265 (= e!444175 e!444173)))

(declare-fun res!545783 () Bool)

(assert (=> b!801265 (=> (not res!545783) (not e!444173))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!358119 () array!43556)

(declare-fun lt!358114 () (_ BitVec 64))

(declare-fun lt!358121 () SeekEntryResult!8449)

(assert (=> b!801265 (= res!545783 (= lt!358121 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358114 lt!358119 mask!3266)))))

(assert (=> b!801265 (= lt!358121 (seekEntryOrOpen!0 lt!358114 lt!358119 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!801265 (= lt!358114 (select (store (arr!20858 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!801265 (= lt!358119 (array!43557 (store (arr!20858 a!3170) i!1163 k!2044) (size!21279 a!3170)))))

(declare-fun b!801266 () Bool)

(declare-fun res!545795 () Bool)

(declare-fun e!444171 () Bool)

(assert (=> b!801266 (=> (not res!545795) (not e!444171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801266 (= res!545795 (validKeyInArray!0 k!2044))))

(declare-fun b!801267 () Bool)

(declare-fun res!545788 () Bool)

(assert (=> b!801267 (=> (not res!545788) (not e!444175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43556 (_ BitVec 32)) Bool)

(assert (=> b!801267 (= res!545788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801268 () Bool)

(declare-fun res!545787 () Bool)

(assert (=> b!801268 (=> (not res!545787) (not e!444171))))

(declare-fun arrayContainsKey!0 (array!43556 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801268 (= res!545787 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801269 () Bool)

(declare-fun res!545794 () Bool)

(declare-fun e!444174 () Bool)

(assert (=> b!801269 (=> (not res!545794) (not e!444174))))

(declare-fun lt!358117 () (_ BitVec 32))

(assert (=> b!801269 (= res!545794 (= lt!358121 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358117 vacantAfter!23 lt!358114 lt!358119 mask!3266)))))

(declare-fun b!801270 () Bool)

(declare-fun res!545785 () Bool)

(assert (=> b!801270 (=> (not res!545785) (not e!444175))))

(declare-datatypes ((List!14821 0))(
  ( (Nil!14818) (Cons!14817 (h!15946 (_ BitVec 64)) (t!21136 List!14821)) )
))
(declare-fun arrayNoDuplicates!0 (array!43556 (_ BitVec 32) List!14821) Bool)

(assert (=> b!801270 (= res!545785 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14818))))

(declare-fun b!801271 () Bool)

(assert (=> b!801271 (= e!444171 e!444175)))

(declare-fun res!545791 () Bool)

(assert (=> b!801271 (=> (not res!545791) (not e!444175))))

(declare-fun lt!358116 () SeekEntryResult!8449)

(assert (=> b!801271 (= res!545791 (or (= lt!358116 (MissingZero!8449 i!1163)) (= lt!358116 (MissingVacant!8449 i!1163))))))

(assert (=> b!801271 (= lt!358116 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!801272 () Bool)

(declare-fun res!545792 () Bool)

(assert (=> b!801272 (=> (not res!545792) (not e!444171))))

(assert (=> b!801272 (= res!545792 (validKeyInArray!0 (select (arr!20858 a!3170) j!153)))))

(declare-fun res!545784 () Bool)

(assert (=> start!68766 (=> (not res!545784) (not e!444171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68766 (= res!545784 (validMask!0 mask!3266))))

(assert (=> start!68766 e!444171))

(assert (=> start!68766 true))

(declare-fun array_inv!16654 (array!43556) Bool)

(assert (=> start!68766 (array_inv!16654 a!3170)))

(declare-fun b!801273 () Bool)

(assert (=> b!801273 (= e!444174 false)))

(declare-fun lt!358115 () SeekEntryResult!8449)

(assert (=> b!801273 (= lt!358115 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358117 vacantBefore!23 (select (arr!20858 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801274 () Bool)

(declare-fun res!545789 () Bool)

(assert (=> b!801274 (=> (not res!545789) (not e!444175))))

(assert (=> b!801274 (= res!545789 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21279 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20858 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21279 a!3170)) (= (select (arr!20858 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801275 () Bool)

(declare-fun res!545786 () Bool)

(assert (=> b!801275 (=> (not res!545786) (not e!444171))))

(assert (=> b!801275 (= res!545786 (and (= (size!21279 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21279 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21279 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801276 () Bool)

(assert (=> b!801276 (= e!444176 e!444174)))

(declare-fun res!545793 () Bool)

(assert (=> b!801276 (=> (not res!545793) (not e!444174))))

(assert (=> b!801276 (= res!545793 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358117 #b00000000000000000000000000000000) (bvslt lt!358117 (size!21279 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801276 (= lt!358117 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68766 res!545784) b!801275))

(assert (= (and b!801275 res!545786) b!801272))

(assert (= (and b!801272 res!545792) b!801266))

(assert (= (and b!801266 res!545795) b!801268))

(assert (= (and b!801268 res!545787) b!801271))

(assert (= (and b!801271 res!545791) b!801267))

(assert (= (and b!801267 res!545788) b!801270))

(assert (= (and b!801270 res!545785) b!801274))

(assert (= (and b!801274 res!545789) b!801265))

(assert (= (and b!801265 res!545783) b!801264))

(assert (= (and b!801264 res!545790) b!801276))

(assert (= (and b!801276 res!545793) b!801269))

(assert (= (and b!801269 res!545794) b!801273))

(declare-fun m!742415 () Bool)

(assert (=> b!801269 m!742415))

(declare-fun m!742417 () Bool)

(assert (=> b!801264 m!742417))

(declare-fun m!742419 () Bool)

(assert (=> b!801264 m!742419))

(assert (=> b!801264 m!742419))

(declare-fun m!742421 () Bool)

(assert (=> b!801264 m!742421))

(assert (=> b!801264 m!742419))

(declare-fun m!742423 () Bool)

(assert (=> b!801264 m!742423))

(assert (=> b!801272 m!742419))

(assert (=> b!801272 m!742419))

(declare-fun m!742425 () Bool)

(assert (=> b!801272 m!742425))

(assert (=> b!801273 m!742419))

(assert (=> b!801273 m!742419))

(declare-fun m!742427 () Bool)

(assert (=> b!801273 m!742427))

(declare-fun m!742429 () Bool)

(assert (=> b!801268 m!742429))

(declare-fun m!742431 () Bool)

(assert (=> b!801270 m!742431))

(declare-fun m!742433 () Bool)

(assert (=> b!801265 m!742433))

(declare-fun m!742435 () Bool)

(assert (=> b!801265 m!742435))

(declare-fun m!742437 () Bool)

(assert (=> b!801265 m!742437))

(declare-fun m!742439 () Bool)

(assert (=> b!801265 m!742439))

(declare-fun m!742441 () Bool)

(assert (=> b!801271 m!742441))

(declare-fun m!742443 () Bool)

(assert (=> b!801266 m!742443))

(declare-fun m!742445 () Bool)

(assert (=> start!68766 m!742445))

(declare-fun m!742447 () Bool)

(assert (=> start!68766 m!742447))

(declare-fun m!742449 () Bool)

(assert (=> b!801267 m!742449))

(declare-fun m!742451 () Bool)

(assert (=> b!801276 m!742451))

(declare-fun m!742453 () Bool)

(assert (=> b!801274 m!742453))

(declare-fun m!742455 () Bool)

(assert (=> b!801274 m!742455))

(push 1)

