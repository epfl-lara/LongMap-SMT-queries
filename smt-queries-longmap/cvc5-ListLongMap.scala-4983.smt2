; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68408 () Bool)

(assert start!68408)

(declare-fun b!795008 () Bool)

(declare-fun e!441335 () Bool)

(declare-fun e!441334 () Bool)

(assert (=> b!795008 (= e!441335 e!441334)))

(declare-fun res!539534 () Bool)

(assert (=> b!795008 (=> (not res!539534) (not e!441334))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43198 0))(
  ( (array!43199 (arr!20679 (Array (_ BitVec 32) (_ BitVec 64))) (size!21100 (_ BitVec 32))) )
))
(declare-fun lt!354375 () array!43198)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!354377 () (_ BitVec 64))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8270 0))(
  ( (MissingZero!8270 (index!35448 (_ BitVec 32))) (Found!8270 (index!35449 (_ BitVec 32))) (Intermediate!8270 (undefined!9082 Bool) (index!35450 (_ BitVec 32)) (x!66372 (_ BitVec 32))) (Undefined!8270) (MissingVacant!8270 (index!35451 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43198 (_ BitVec 32)) SeekEntryResult!8270)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43198 (_ BitVec 32)) SeekEntryResult!8270)

(assert (=> b!795008 (= res!539534 (= (seekEntryOrOpen!0 lt!354377 lt!354375 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354377 lt!354375 mask!3266)))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43198)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!795008 (= lt!354377 (select (store (arr!20679 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!795008 (= lt!354375 (array!43199 (store (arr!20679 a!3170) i!1163 k!2044) (size!21100 a!3170)))))

(declare-fun b!795009 () Bool)

(declare-fun res!539536 () Bool)

(declare-fun e!441332 () Bool)

(assert (=> b!795009 (=> (not res!539536) (not e!441332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!795009 (= res!539536 (validKeyInArray!0 (select (arr!20679 a!3170) j!153)))))

(declare-fun b!795010 () Bool)

(assert (=> b!795010 (= e!441332 e!441335)))

(declare-fun res!539530 () Bool)

(assert (=> b!795010 (=> (not res!539530) (not e!441335))))

(declare-fun lt!354376 () SeekEntryResult!8270)

(assert (=> b!795010 (= res!539530 (or (= lt!354376 (MissingZero!8270 i!1163)) (= lt!354376 (MissingVacant!8270 i!1163))))))

(assert (=> b!795010 (= lt!354376 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!795011 () Bool)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!795011 (= e!441334 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (or (bvslt vacantBefore!23 #b00000000000000000000000000000000) (bvsge vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266)))))))

(declare-fun b!795012 () Bool)

(declare-fun res!539532 () Bool)

(assert (=> b!795012 (=> (not res!539532) (not e!441335))))

(declare-datatypes ((List!14642 0))(
  ( (Nil!14639) (Cons!14638 (h!15767 (_ BitVec 64)) (t!20957 List!14642)) )
))
(declare-fun arrayNoDuplicates!0 (array!43198 (_ BitVec 32) List!14642) Bool)

(assert (=> b!795012 (= res!539532 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14639))))

(declare-fun res!539533 () Bool)

(assert (=> start!68408 (=> (not res!539533) (not e!441332))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68408 (= res!539533 (validMask!0 mask!3266))))

(assert (=> start!68408 e!441332))

(assert (=> start!68408 true))

(declare-fun array_inv!16475 (array!43198) Bool)

(assert (=> start!68408 (array_inv!16475 a!3170)))

(declare-fun b!795013 () Bool)

(declare-fun res!539527 () Bool)

(assert (=> b!795013 (=> (not res!539527) (not e!441335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43198 (_ BitVec 32)) Bool)

(assert (=> b!795013 (= res!539527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!795014 () Bool)

(declare-fun res!539528 () Bool)

(assert (=> b!795014 (=> (not res!539528) (not e!441332))))

(assert (=> b!795014 (= res!539528 (validKeyInArray!0 k!2044))))

(declare-fun b!795015 () Bool)

(declare-fun res!539535 () Bool)

(assert (=> b!795015 (=> (not res!539535) (not e!441335))))

(assert (=> b!795015 (= res!539535 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21100 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20679 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21100 a!3170)) (= (select (arr!20679 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!795016 () Bool)

(declare-fun res!539537 () Bool)

(assert (=> b!795016 (=> (not res!539537) (not e!441332))))

(declare-fun arrayContainsKey!0 (array!43198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!795016 (= res!539537 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!795017 () Bool)

(declare-fun res!539529 () Bool)

(assert (=> b!795017 (=> (not res!539529) (not e!441332))))

(assert (=> b!795017 (= res!539529 (and (= (size!21100 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21100 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21100 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!795018 () Bool)

(declare-fun res!539531 () Bool)

(assert (=> b!795018 (=> (not res!539531) (not e!441334))))

(assert (=> b!795018 (= res!539531 (= (seekEntryOrOpen!0 (select (arr!20679 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20679 a!3170) j!153) a!3170 mask!3266)))))

(assert (= (and start!68408 res!539533) b!795017))

(assert (= (and b!795017 res!539529) b!795009))

(assert (= (and b!795009 res!539536) b!795014))

(assert (= (and b!795014 res!539528) b!795016))

(assert (= (and b!795016 res!539537) b!795010))

(assert (= (and b!795010 res!539530) b!795013))

(assert (= (and b!795013 res!539527) b!795012))

(assert (= (and b!795012 res!539532) b!795015))

(assert (= (and b!795015 res!539535) b!795008))

(assert (= (and b!795008 res!539534) b!795018))

(assert (= (and b!795018 res!539531) b!795011))

(declare-fun m!735593 () Bool)

(assert (=> b!795010 m!735593))

(declare-fun m!735595 () Bool)

(assert (=> start!68408 m!735595))

(declare-fun m!735597 () Bool)

(assert (=> start!68408 m!735597))

(declare-fun m!735599 () Bool)

(assert (=> b!795016 m!735599))

(declare-fun m!735601 () Bool)

(assert (=> b!795009 m!735601))

(assert (=> b!795009 m!735601))

(declare-fun m!735603 () Bool)

(assert (=> b!795009 m!735603))

(assert (=> b!795018 m!735601))

(assert (=> b!795018 m!735601))

(declare-fun m!735605 () Bool)

(assert (=> b!795018 m!735605))

(assert (=> b!795018 m!735601))

(declare-fun m!735607 () Bool)

(assert (=> b!795018 m!735607))

(declare-fun m!735609 () Bool)

(assert (=> b!795008 m!735609))

(declare-fun m!735611 () Bool)

(assert (=> b!795008 m!735611))

(declare-fun m!735613 () Bool)

(assert (=> b!795008 m!735613))

(declare-fun m!735615 () Bool)

(assert (=> b!795008 m!735615))

(declare-fun m!735617 () Bool)

(assert (=> b!795015 m!735617))

(declare-fun m!735619 () Bool)

(assert (=> b!795015 m!735619))

(declare-fun m!735621 () Bool)

(assert (=> b!795014 m!735621))

(declare-fun m!735623 () Bool)

(assert (=> b!795013 m!735623))

(declare-fun m!735625 () Bool)

(assert (=> b!795012 m!735625))

(push 1)

(assert (not b!795010))

(assert (not b!795012))

(assert (not b!795014))

(assert (not b!795018))

(assert (not b!795008))

(assert (not b!795016))

(assert (not start!68408))

(assert (not b!795013))

(assert (not b!795009))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

