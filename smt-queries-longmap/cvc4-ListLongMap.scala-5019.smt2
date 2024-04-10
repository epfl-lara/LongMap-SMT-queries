; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68628 () Bool)

(assert start!68628)

(declare-fun b!798630 () Bool)

(declare-fun res!543152 () Bool)

(declare-fun e!442967 () Bool)

(assert (=> b!798630 (=> (not res!543152) (not e!442967))))

(declare-datatypes ((array!43418 0))(
  ( (array!43419 (arr!20789 (Array (_ BitVec 32) (_ BitVec 64))) (size!21210 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43418)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43418 (_ BitVec 32)) Bool)

(assert (=> b!798630 (= res!543152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798631 () Bool)

(declare-fun res!543153 () Bool)

(assert (=> b!798631 (=> (not res!543153) (not e!442967))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798631 (= res!543153 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21210 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20789 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21210 a!3170)) (= (select (arr!20789 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798632 () Bool)

(declare-fun res!543155 () Bool)

(assert (=> b!798632 (=> (not res!543155) (not e!442967))))

(declare-datatypes ((List!14752 0))(
  ( (Nil!14749) (Cons!14748 (h!15877 (_ BitVec 64)) (t!21067 List!14752)) )
))
(declare-fun arrayNoDuplicates!0 (array!43418 (_ BitVec 32) List!14752) Bool)

(assert (=> b!798632 (= res!543155 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14749))))

(declare-fun b!798633 () Bool)

(declare-fun res!543156 () Bool)

(declare-fun e!442968 () Bool)

(assert (=> b!798633 (=> (not res!543156) (not e!442968))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798633 (= res!543156 (validKeyInArray!0 (select (arr!20789 a!3170) j!153)))))

(declare-fun res!543151 () Bool)

(assert (=> start!68628 (=> (not res!543151) (not e!442968))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68628 (= res!543151 (validMask!0 mask!3266))))

(assert (=> start!68628 e!442968))

(assert (=> start!68628 true))

(declare-fun array_inv!16585 (array!43418) Bool)

(assert (=> start!68628 (array_inv!16585 a!3170)))

(declare-fun b!798634 () Bool)

(declare-fun res!543157 () Bool)

(assert (=> b!798634 (=> (not res!543157) (not e!442968))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!798634 (= res!543157 (validKeyInArray!0 k!2044))))

(declare-fun b!798635 () Bool)

(assert (=> b!798635 (= e!442968 e!442967)))

(declare-fun res!543158 () Bool)

(assert (=> b!798635 (=> (not res!543158) (not e!442967))))

(declare-datatypes ((SeekEntryResult!8380 0))(
  ( (MissingZero!8380 (index!35888 (_ BitVec 32))) (Found!8380 (index!35889 (_ BitVec 32))) (Intermediate!8380 (undefined!9192 Bool) (index!35890 (_ BitVec 32)) (x!66770 (_ BitVec 32))) (Undefined!8380) (MissingVacant!8380 (index!35891 (_ BitVec 32))) )
))
(declare-fun lt!356516 () SeekEntryResult!8380)

(assert (=> b!798635 (= res!543158 (or (= lt!356516 (MissingZero!8380 i!1163)) (= lt!356516 (MissingVacant!8380 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43418 (_ BitVec 32)) SeekEntryResult!8380)

(assert (=> b!798635 (= lt!356516 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!798636 () Bool)

(declare-fun res!543154 () Bool)

(assert (=> b!798636 (=> (not res!543154) (not e!442968))))

(declare-fun arrayContainsKey!0 (array!43418 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798636 (= res!543154 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798637 () Bool)

(declare-fun res!543149 () Bool)

(assert (=> b!798637 (=> (not res!543149) (not e!442968))))

(assert (=> b!798637 (= res!543149 (and (= (size!21210 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21210 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21210 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!798638 () Bool)

(declare-fun e!442970 () Bool)

(assert (=> b!798638 (= e!442967 e!442970)))

(declare-fun res!543150 () Bool)

(assert (=> b!798638 (=> (not res!543150) (not e!442970))))

(declare-fun lt!356517 () array!43418)

(declare-fun lt!356518 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43418 (_ BitVec 32)) SeekEntryResult!8380)

(assert (=> b!798638 (= res!543150 (= (seekEntryOrOpen!0 lt!356518 lt!356517 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356518 lt!356517 mask!3266)))))

(assert (=> b!798638 (= lt!356518 (select (store (arr!20789 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!798638 (= lt!356517 (array!43419 (store (arr!20789 a!3170) i!1163 k!2044) (size!21210 a!3170)))))

(declare-fun lt!356515 () SeekEntryResult!8380)

(declare-fun lt!356519 () SeekEntryResult!8380)

(declare-fun b!798639 () Bool)

(assert (=> b!798639 (= e!442970 (and (= lt!356519 lt!356515) (= lt!356515 (Found!8380 j!153)) (not (= (select (arr!20789 a!3170) index!1236) (select (arr!20789 a!3170) j!153))) (bvslt mask!3266 #b00000000000000000000000000000000)))))

(assert (=> b!798639 (= lt!356515 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20789 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!798639 (= lt!356519 (seekEntryOrOpen!0 (select (arr!20789 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!68628 res!543151) b!798637))

(assert (= (and b!798637 res!543149) b!798633))

(assert (= (and b!798633 res!543156) b!798634))

(assert (= (and b!798634 res!543157) b!798636))

(assert (= (and b!798636 res!543154) b!798635))

(assert (= (and b!798635 res!543158) b!798630))

(assert (= (and b!798630 res!543152) b!798632))

(assert (= (and b!798632 res!543155) b!798631))

(assert (= (and b!798631 res!543153) b!798638))

(assert (= (and b!798638 res!543150) b!798639))

(declare-fun m!739565 () Bool)

(assert (=> b!798639 m!739565))

(declare-fun m!739567 () Bool)

(assert (=> b!798639 m!739567))

(assert (=> b!798639 m!739567))

(declare-fun m!739569 () Bool)

(assert (=> b!798639 m!739569))

(assert (=> b!798639 m!739567))

(declare-fun m!739571 () Bool)

(assert (=> b!798639 m!739571))

(assert (=> b!798633 m!739567))

(assert (=> b!798633 m!739567))

(declare-fun m!739573 () Bool)

(assert (=> b!798633 m!739573))

(declare-fun m!739575 () Bool)

(assert (=> b!798636 m!739575))

(declare-fun m!739577 () Bool)

(assert (=> b!798638 m!739577))

(declare-fun m!739579 () Bool)

(assert (=> b!798638 m!739579))

(declare-fun m!739581 () Bool)

(assert (=> b!798638 m!739581))

(declare-fun m!739583 () Bool)

(assert (=> b!798638 m!739583))

(declare-fun m!739585 () Bool)

(assert (=> start!68628 m!739585))

(declare-fun m!739587 () Bool)

(assert (=> start!68628 m!739587))

(declare-fun m!739589 () Bool)

(assert (=> b!798631 m!739589))

(declare-fun m!739591 () Bool)

(assert (=> b!798631 m!739591))

(declare-fun m!739593 () Bool)

(assert (=> b!798634 m!739593))

(declare-fun m!739595 () Bool)

(assert (=> b!798632 m!739595))

(declare-fun m!739597 () Bool)

(assert (=> b!798630 m!739597))

(declare-fun m!739599 () Bool)

(assert (=> b!798635 m!739599))

(push 1)

(assert (not b!798638))

(assert (not b!798639))

(assert (not b!798636))

(assert (not b!798635))

(assert (not b!798634))

(assert (not b!798632))

(assert (not b!798633))

(assert (not start!68628))

(assert (not b!798630))

(check-sat)

(pop 1)

(push 1)

(check-sat)

