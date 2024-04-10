; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68572 () Bool)

(assert start!68572)

(declare-fun b!797696 () Bool)

(declare-fun e!442541 () Bool)

(declare-fun e!442539 () Bool)

(assert (=> b!797696 (= e!442541 e!442539)))

(declare-fun res!542222 () Bool)

(assert (=> b!797696 (=> (not res!542222) (not e!442539))))

(declare-datatypes ((SeekEntryResult!8352 0))(
  ( (MissingZero!8352 (index!35776 (_ BitVec 32))) (Found!8352 (index!35777 (_ BitVec 32))) (Intermediate!8352 (undefined!9164 Bool) (index!35778 (_ BitVec 32)) (x!66670 (_ BitVec 32))) (Undefined!8352) (MissingVacant!8352 (index!35779 (_ BitVec 32))) )
))
(declare-fun lt!355937 () SeekEntryResult!8352)

(declare-fun lt!355936 () SeekEntryResult!8352)

(assert (=> b!797696 (= res!542222 (= lt!355937 lt!355936))))

(declare-fun lt!355940 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43362 0))(
  ( (array!43363 (arr!20761 (Array (_ BitVec 32) (_ BitVec 64))) (size!21182 (_ BitVec 32))) )
))
(declare-fun lt!355934 () array!43362)

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43362 (_ BitVec 32)) SeekEntryResult!8352)

(assert (=> b!797696 (= lt!355936 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355940 lt!355934 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43362 (_ BitVec 32)) SeekEntryResult!8352)

(assert (=> b!797696 (= lt!355937 (seekEntryOrOpen!0 lt!355940 lt!355934 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43362)

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!797696 (= lt!355940 (select (store (arr!20761 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!797696 (= lt!355934 (array!43363 (store (arr!20761 a!3170) i!1163 k0!2044) (size!21182 a!3170)))))

(declare-fun res!542215 () Bool)

(declare-fun e!442538 () Bool)

(assert (=> start!68572 (=> (not res!542215) (not e!442538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68572 (= res!542215 (validMask!0 mask!3266))))

(assert (=> start!68572 e!442538))

(assert (=> start!68572 true))

(declare-fun array_inv!16557 (array!43362) Bool)

(assert (=> start!68572 (array_inv!16557 a!3170)))

(declare-fun b!797697 () Bool)

(declare-fun res!542225 () Bool)

(assert (=> b!797697 (=> (not res!542225) (not e!442538))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!797697 (= res!542225 (validKeyInArray!0 (select (arr!20761 a!3170) j!153)))))

(declare-fun b!797698 () Bool)

(declare-fun res!542216 () Bool)

(assert (=> b!797698 (=> (not res!542216) (not e!442538))))

(declare-fun arrayContainsKey!0 (array!43362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!797698 (= res!542216 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!797699 () Bool)

(declare-fun res!542218 () Bool)

(assert (=> b!797699 (=> (not res!542218) (not e!442538))))

(assert (=> b!797699 (= res!542218 (validKeyInArray!0 k0!2044))))

(declare-fun b!797700 () Bool)

(assert (=> b!797700 (= e!442538 e!442541)))

(declare-fun res!542219 () Bool)

(assert (=> b!797700 (=> (not res!542219) (not e!442541))))

(declare-fun lt!355935 () SeekEntryResult!8352)

(assert (=> b!797700 (= res!542219 (or (= lt!355935 (MissingZero!8352 i!1163)) (= lt!355935 (MissingVacant!8352 i!1163))))))

(assert (=> b!797700 (= lt!355935 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!797701 () Bool)

(declare-fun res!542217 () Bool)

(assert (=> b!797701 (=> (not res!542217) (not e!442538))))

(assert (=> b!797701 (= res!542217 (and (= (size!21182 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21182 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21182 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!797702 () Bool)

(declare-fun e!442537 () Bool)

(assert (=> b!797702 (= e!442539 e!442537)))

(declare-fun res!542220 () Bool)

(assert (=> b!797702 (=> (not res!542220) (not e!442537))))

(declare-fun lt!355938 () SeekEntryResult!8352)

(declare-fun lt!355939 () SeekEntryResult!8352)

(assert (=> b!797702 (= res!542220 (and (= lt!355938 lt!355939) (= lt!355939 (Found!8352 j!153)) (= (select (arr!20761 a!3170) index!1236) (select (arr!20761 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!797702 (= lt!355939 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20761 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!797702 (= lt!355938 (seekEntryOrOpen!0 (select (arr!20761 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!797703 () Bool)

(declare-fun res!542224 () Bool)

(assert (=> b!797703 (=> (not res!542224) (not e!442541))))

(assert (=> b!797703 (= res!542224 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21182 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20761 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21182 a!3170)) (= (select (arr!20761 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!797704 () Bool)

(declare-fun res!542223 () Bool)

(assert (=> b!797704 (=> (not res!542223) (not e!442541))))

(declare-datatypes ((List!14724 0))(
  ( (Nil!14721) (Cons!14720 (h!15849 (_ BitVec 64)) (t!21039 List!14724)) )
))
(declare-fun arrayNoDuplicates!0 (array!43362 (_ BitVec 32) List!14724) Bool)

(assert (=> b!797704 (= res!542223 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14721))))

(declare-fun b!797705 () Bool)

(assert (=> b!797705 (= e!442537 (not true))))

(assert (=> b!797705 (= lt!355936 (Found!8352 index!1236))))

(declare-fun b!797706 () Bool)

(declare-fun res!542221 () Bool)

(assert (=> b!797706 (=> (not res!542221) (not e!442541))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43362 (_ BitVec 32)) Bool)

(assert (=> b!797706 (= res!542221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68572 res!542215) b!797701))

(assert (= (and b!797701 res!542217) b!797697))

(assert (= (and b!797697 res!542225) b!797699))

(assert (= (and b!797699 res!542218) b!797698))

(assert (= (and b!797698 res!542216) b!797700))

(assert (= (and b!797700 res!542219) b!797706))

(assert (= (and b!797706 res!542221) b!797704))

(assert (= (and b!797704 res!542223) b!797703))

(assert (= (and b!797703 res!542224) b!797696))

(assert (= (and b!797696 res!542222) b!797702))

(assert (= (and b!797702 res!542220) b!797705))

(declare-fun m!738563 () Bool)

(assert (=> b!797700 m!738563))

(declare-fun m!738565 () Bool)

(assert (=> b!797699 m!738565))

(declare-fun m!738567 () Bool)

(assert (=> b!797696 m!738567))

(declare-fun m!738569 () Bool)

(assert (=> b!797696 m!738569))

(declare-fun m!738571 () Bool)

(assert (=> b!797696 m!738571))

(declare-fun m!738573 () Bool)

(assert (=> b!797696 m!738573))

(declare-fun m!738575 () Bool)

(assert (=> b!797703 m!738575))

(declare-fun m!738577 () Bool)

(assert (=> b!797703 m!738577))

(declare-fun m!738579 () Bool)

(assert (=> start!68572 m!738579))

(declare-fun m!738581 () Bool)

(assert (=> start!68572 m!738581))

(declare-fun m!738583 () Bool)

(assert (=> b!797706 m!738583))

(declare-fun m!738585 () Bool)

(assert (=> b!797698 m!738585))

(declare-fun m!738587 () Bool)

(assert (=> b!797697 m!738587))

(assert (=> b!797697 m!738587))

(declare-fun m!738589 () Bool)

(assert (=> b!797697 m!738589))

(declare-fun m!738591 () Bool)

(assert (=> b!797702 m!738591))

(assert (=> b!797702 m!738587))

(assert (=> b!797702 m!738587))

(declare-fun m!738593 () Bool)

(assert (=> b!797702 m!738593))

(assert (=> b!797702 m!738587))

(declare-fun m!738595 () Bool)

(assert (=> b!797702 m!738595))

(declare-fun m!738597 () Bool)

(assert (=> b!797704 m!738597))

(check-sat (not b!797699) (not b!797700) (not b!797698) (not b!797702) (not start!68572) (not b!797696) (not b!797704) (not b!797706) (not b!797697))
(check-sat)
