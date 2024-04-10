; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68516 () Bool)

(assert start!68516)

(declare-fun b!796711 () Bool)

(declare-fun res!541231 () Bool)

(declare-fun e!442056 () Bool)

(assert (=> b!796711 (=> (not res!541231) (not e!442056))))

(declare-datatypes ((array!43306 0))(
  ( (array!43307 (arr!20733 (Array (_ BitVec 32) (_ BitVec 64))) (size!21154 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43306)

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43306 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796711 (= res!541231 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796712 () Bool)

(declare-fun e!442060 () Bool)

(declare-fun e!442059 () Bool)

(assert (=> b!796712 (= e!442060 e!442059)))

(declare-fun res!541230 () Bool)

(assert (=> b!796712 (=> (not res!541230) (not e!442059))))

(declare-datatypes ((SeekEntryResult!8324 0))(
  ( (MissingZero!8324 (index!35664 (_ BitVec 32))) (Found!8324 (index!35665 (_ BitVec 32))) (Intermediate!8324 (undefined!9136 Bool) (index!35666 (_ BitVec 32)) (x!66570 (_ BitVec 32))) (Undefined!8324) (MissingVacant!8324 (index!35667 (_ BitVec 32))) )
))
(declare-fun lt!355306 () SeekEntryResult!8324)

(declare-fun lt!355302 () SeekEntryResult!8324)

(assert (=> b!796712 (= res!541230 (= lt!355306 lt!355302))))

(declare-fun lt!355307 () array!43306)

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!355301 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43306 (_ BitVec 32)) SeekEntryResult!8324)

(assert (=> b!796712 (= lt!355302 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355301 lt!355307 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43306 (_ BitVec 32)) SeekEntryResult!8324)

(assert (=> b!796712 (= lt!355306 (seekEntryOrOpen!0 lt!355301 lt!355307 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!796712 (= lt!355301 (select (store (arr!20733 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796712 (= lt!355307 (array!43307 (store (arr!20733 a!3170) i!1163 k!2044) (size!21154 a!3170)))))

(declare-fun b!796713 () Bool)

(assert (=> b!796713 (= e!442056 e!442060)))

(declare-fun res!541232 () Bool)

(assert (=> b!796713 (=> (not res!541232) (not e!442060))))

(declare-fun lt!355305 () SeekEntryResult!8324)

(assert (=> b!796713 (= res!541232 (or (= lt!355305 (MissingZero!8324 i!1163)) (= lt!355305 (MissingVacant!8324 i!1163))))))

(assert (=> b!796713 (= lt!355305 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796714 () Bool)

(declare-fun e!442058 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796714 (= e!442058 (validKeyInArray!0 lt!355301))))

(declare-fun b!796715 () Bool)

(declare-fun res!541235 () Bool)

(assert (=> b!796715 (=> (not res!541235) (not e!442056))))

(assert (=> b!796715 (= res!541235 (validKeyInArray!0 k!2044))))

(declare-fun b!796716 () Bool)

(declare-fun e!442061 () Bool)

(assert (=> b!796716 (= e!442059 e!442061)))

(declare-fun res!541238 () Bool)

(assert (=> b!796716 (=> (not res!541238) (not e!442061))))

(declare-fun lt!355304 () SeekEntryResult!8324)

(declare-fun lt!355303 () SeekEntryResult!8324)

(assert (=> b!796716 (= res!541238 (and (= lt!355303 lt!355304) (= lt!355304 (Found!8324 j!153)) (= (select (arr!20733 a!3170) index!1236) (select (arr!20733 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796716 (= lt!355304 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20733 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796716 (= lt!355303 (seekEntryOrOpen!0 (select (arr!20733 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796717 () Bool)

(declare-fun res!541241 () Bool)

(assert (=> b!796717 (=> (not res!541241) (not e!442060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43306 (_ BitVec 32)) Bool)

(assert (=> b!796717 (= res!541241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796718 () Bool)

(declare-fun res!541233 () Bool)

(assert (=> b!796718 (=> (not res!541233) (not e!442060))))

(assert (=> b!796718 (= res!541233 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21154 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20733 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21154 a!3170)) (= (select (arr!20733 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796719 () Bool)

(declare-fun res!541240 () Bool)

(assert (=> b!796719 (=> (not res!541240) (not e!442060))))

(declare-datatypes ((List!14696 0))(
  ( (Nil!14693) (Cons!14692 (h!15821 (_ BitVec 64)) (t!21011 List!14696)) )
))
(declare-fun arrayNoDuplicates!0 (array!43306 (_ BitVec 32) List!14696) Bool)

(assert (=> b!796719 (= res!541240 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14693))))

(declare-fun b!796720 () Bool)

(declare-fun res!541236 () Bool)

(assert (=> b!796720 (=> (not res!541236) (not e!442056))))

(assert (=> b!796720 (= res!541236 (validKeyInArray!0 (select (arr!20733 a!3170) j!153)))))

(declare-fun res!541237 () Bool)

(assert (=> start!68516 (=> (not res!541237) (not e!442056))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68516 (= res!541237 (validMask!0 mask!3266))))

(assert (=> start!68516 e!442056))

(assert (=> start!68516 true))

(declare-fun array_inv!16529 (array!43306) Bool)

(assert (=> start!68516 (array_inv!16529 a!3170)))

(declare-fun b!796721 () Bool)

(assert (=> b!796721 (= e!442061 (not e!442058))))

(declare-fun res!541239 () Bool)

(assert (=> b!796721 (=> res!541239 e!442058)))

(assert (=> b!796721 (= res!541239 (or (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (not (= (select (store (arr!20733 a!3170) i!1163 k!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!796721 (= lt!355302 (Found!8324 index!1236))))

(declare-fun b!796722 () Bool)

(declare-fun res!541234 () Bool)

(assert (=> b!796722 (=> (not res!541234) (not e!442056))))

(assert (=> b!796722 (= res!541234 (and (= (size!21154 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21154 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21154 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68516 res!541237) b!796722))

(assert (= (and b!796722 res!541234) b!796720))

(assert (= (and b!796720 res!541236) b!796715))

(assert (= (and b!796715 res!541235) b!796711))

(assert (= (and b!796711 res!541231) b!796713))

(assert (= (and b!796713 res!541232) b!796717))

(assert (= (and b!796717 res!541241) b!796719))

(assert (= (and b!796719 res!541240) b!796718))

(assert (= (and b!796718 res!541233) b!796712))

(assert (= (and b!796712 res!541230) b!796716))

(assert (= (and b!796716 res!541238) b!796721))

(assert (= (and b!796721 (not res!541239)) b!796714))

(declare-fun m!737525 () Bool)

(assert (=> b!796717 m!737525))

(declare-fun m!737527 () Bool)

(assert (=> b!796719 m!737527))

(declare-fun m!737529 () Bool)

(assert (=> b!796721 m!737529))

(declare-fun m!737531 () Bool)

(assert (=> b!796721 m!737531))

(declare-fun m!737533 () Bool)

(assert (=> b!796715 m!737533))

(declare-fun m!737535 () Bool)

(assert (=> b!796713 m!737535))

(declare-fun m!737537 () Bool)

(assert (=> b!796718 m!737537))

(declare-fun m!737539 () Bool)

(assert (=> b!796718 m!737539))

(declare-fun m!737541 () Bool)

(assert (=> b!796714 m!737541))

(declare-fun m!737543 () Bool)

(assert (=> start!68516 m!737543))

(declare-fun m!737545 () Bool)

(assert (=> start!68516 m!737545))

(declare-fun m!737547 () Bool)

(assert (=> b!796711 m!737547))

(declare-fun m!737549 () Bool)

(assert (=> b!796716 m!737549))

(declare-fun m!737551 () Bool)

(assert (=> b!796716 m!737551))

(assert (=> b!796716 m!737551))

(declare-fun m!737553 () Bool)

(assert (=> b!796716 m!737553))

(assert (=> b!796716 m!737551))

(declare-fun m!737555 () Bool)

(assert (=> b!796716 m!737555))

(assert (=> b!796720 m!737551))

(assert (=> b!796720 m!737551))

(declare-fun m!737557 () Bool)

(assert (=> b!796720 m!737557))

(declare-fun m!737559 () Bool)

(assert (=> b!796712 m!737559))

(declare-fun m!737561 () Bool)

(assert (=> b!796712 m!737561))

(assert (=> b!796712 m!737529))

(declare-fun m!737563 () Bool)

(assert (=> b!796712 m!737563))

(push 1)

(assert (not b!796714))

(assert (not b!796711))

(assert (not b!796713))

(assert (not b!796715))

(assert (not start!68516))

(assert (not b!796716))

(assert (not b!796717))

(assert (not b!796720))

(assert (not b!796712))

(assert (not b!796719))

(check-sat)

(pop 1)

