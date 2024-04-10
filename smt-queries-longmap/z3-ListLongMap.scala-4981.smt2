; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68398 () Bool)

(assert start!68398)

(declare-fun b!794852 () Bool)

(declare-fun e!441275 () Bool)

(declare-fun e!441274 () Bool)

(assert (=> b!794852 (= e!441275 e!441274)))

(declare-fun res!539374 () Bool)

(assert (=> b!794852 (=> (not res!539374) (not e!441274))))

(declare-datatypes ((SeekEntryResult!8265 0))(
  ( (MissingZero!8265 (index!35428 (_ BitVec 32))) (Found!8265 (index!35429 (_ BitVec 32))) (Intermediate!8265 (undefined!9077 Bool) (index!35430 (_ BitVec 32)) (x!66351 (_ BitVec 32))) (Undefined!8265) (MissingVacant!8265 (index!35431 (_ BitVec 32))) )
))
(declare-fun lt!354312 () SeekEntryResult!8265)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!794852 (= res!539374 (or (= lt!354312 (MissingZero!8265 i!1163)) (= lt!354312 (MissingVacant!8265 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-datatypes ((array!43188 0))(
  ( (array!43189 (arr!20674 (Array (_ BitVec 32) (_ BitVec 64))) (size!21095 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43188)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43188 (_ BitVec 32)) SeekEntryResult!8265)

(assert (=> b!794852 (= lt!354312 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!539378 () Bool)

(assert (=> start!68398 (=> (not res!539378) (not e!441275))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68398 (= res!539378 (validMask!0 mask!3266))))

(assert (=> start!68398 e!441275))

(assert (=> start!68398 true))

(declare-fun array_inv!16470 (array!43188) Bool)

(assert (=> start!68398 (array_inv!16470 a!3170)))

(declare-fun b!794853 () Bool)

(declare-fun res!539381 () Bool)

(assert (=> b!794853 (=> (not res!539381) (not e!441274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43188 (_ BitVec 32)) Bool)

(assert (=> b!794853 (= res!539381 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!794854 () Bool)

(declare-fun res!539380 () Bool)

(assert (=> b!794854 (=> (not res!539380) (not e!441275))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!794854 (= res!539380 (validKeyInArray!0 k0!2044))))

(declare-fun b!794855 () Bool)

(declare-fun res!539371 () Bool)

(declare-fun e!441273 () Bool)

(assert (=> b!794855 (=> (not res!539371) (not e!441273))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43188 (_ BitVec 32)) SeekEntryResult!8265)

(assert (=> b!794855 (= res!539371 (= (seekEntryOrOpen!0 (select (arr!20674 a!3170) j!153) a!3170 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20674 a!3170) j!153) a!3170 mask!3266)))))

(declare-fun b!794856 () Bool)

(declare-fun res!539375 () Bool)

(assert (=> b!794856 (=> (not res!539375) (not e!441275))))

(assert (=> b!794856 (= res!539375 (validKeyInArray!0 (select (arr!20674 a!3170) j!153)))))

(declare-fun b!794857 () Bool)

(assert (=> b!794857 (= e!441274 e!441273)))

(declare-fun res!539377 () Bool)

(assert (=> b!794857 (=> (not res!539377) (not e!441273))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!354313 () (_ BitVec 64))

(declare-fun lt!354314 () array!43188)

(assert (=> b!794857 (= res!539377 (= (seekEntryOrOpen!0 lt!354313 lt!354314 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354313 lt!354314 mask!3266)))))

(assert (=> b!794857 (= lt!354313 (select (store (arr!20674 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!794857 (= lt!354314 (array!43189 (store (arr!20674 a!3170) i!1163 k0!2044) (size!21095 a!3170)))))

(declare-fun b!794858 () Bool)

(assert (=> b!794858 (= e!441273 (and (bvsge mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266))))))

(declare-fun b!794859 () Bool)

(declare-fun res!539376 () Bool)

(assert (=> b!794859 (=> (not res!539376) (not e!441275))))

(declare-fun arrayContainsKey!0 (array!43188 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!794859 (= res!539376 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!794860 () Bool)

(declare-fun res!539372 () Bool)

(assert (=> b!794860 (=> (not res!539372) (not e!441274))))

(declare-datatypes ((List!14637 0))(
  ( (Nil!14634) (Cons!14633 (h!15762 (_ BitVec 64)) (t!20952 List!14637)) )
))
(declare-fun arrayNoDuplicates!0 (array!43188 (_ BitVec 32) List!14637) Bool)

(assert (=> b!794860 (= res!539372 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14634))))

(declare-fun b!794861 () Bool)

(declare-fun res!539373 () Bool)

(assert (=> b!794861 (=> (not res!539373) (not e!441275))))

(assert (=> b!794861 (= res!539373 (and (= (size!21095 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21095 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21095 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!794862 () Bool)

(declare-fun res!539379 () Bool)

(assert (=> b!794862 (=> (not res!539379) (not e!441274))))

(assert (=> b!794862 (= res!539379 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21095 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20674 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21095 a!3170)) (= (select (arr!20674 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68398 res!539378) b!794861))

(assert (= (and b!794861 res!539373) b!794856))

(assert (= (and b!794856 res!539375) b!794854))

(assert (= (and b!794854 res!539380) b!794859))

(assert (= (and b!794859 res!539376) b!794852))

(assert (= (and b!794852 res!539374) b!794853))

(assert (= (and b!794853 res!539381) b!794860))

(assert (= (and b!794860 res!539372) b!794862))

(assert (= (and b!794862 res!539379) b!794857))

(assert (= (and b!794857 res!539377) b!794855))

(assert (= (and b!794855 res!539371) b!794858))

(declare-fun m!735423 () Bool)

(assert (=> b!794862 m!735423))

(declare-fun m!735425 () Bool)

(assert (=> b!794862 m!735425))

(declare-fun m!735427 () Bool)

(assert (=> b!794855 m!735427))

(assert (=> b!794855 m!735427))

(declare-fun m!735429 () Bool)

(assert (=> b!794855 m!735429))

(assert (=> b!794855 m!735427))

(declare-fun m!735431 () Bool)

(assert (=> b!794855 m!735431))

(declare-fun m!735433 () Bool)

(assert (=> b!794860 m!735433))

(declare-fun m!735435 () Bool)

(assert (=> b!794852 m!735435))

(declare-fun m!735437 () Bool)

(assert (=> b!794857 m!735437))

(declare-fun m!735439 () Bool)

(assert (=> b!794857 m!735439))

(declare-fun m!735441 () Bool)

(assert (=> b!794857 m!735441))

(declare-fun m!735443 () Bool)

(assert (=> b!794857 m!735443))

(assert (=> b!794856 m!735427))

(assert (=> b!794856 m!735427))

(declare-fun m!735445 () Bool)

(assert (=> b!794856 m!735445))

(declare-fun m!735447 () Bool)

(assert (=> start!68398 m!735447))

(declare-fun m!735449 () Bool)

(assert (=> start!68398 m!735449))

(declare-fun m!735451 () Bool)

(assert (=> b!794853 m!735451))

(declare-fun m!735453 () Bool)

(assert (=> b!794854 m!735453))

(declare-fun m!735455 () Bool)

(assert (=> b!794859 m!735455))

(check-sat (not b!794857) (not b!794853) (not b!794856) (not b!794859) (not start!68398) (not b!794855) (not b!794852) (not b!794860) (not b!794854))
(check-sat)
