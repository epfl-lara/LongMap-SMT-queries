; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69566 () Bool)

(assert start!69566)

(declare-fun res!553224 () Bool)

(declare-fun e!448485 () Bool)

(assert (=> start!69566 (=> (not res!553224) (not e!448485))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69566 (= res!553224 (validMask!0 mask!3266))))

(assert (=> start!69566 e!448485))

(assert (=> start!69566 true))

(declare-datatypes ((array!43996 0))(
  ( (array!43997 (arr!21067 (Array (_ BitVec 32) (_ BitVec 64))) (size!21487 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43996)

(declare-fun array_inv!16926 (array!43996) Bool)

(assert (=> start!69566 (array_inv!16926 a!3170)))

(declare-fun b!810035 () Bool)

(declare-fun res!553217 () Bool)

(assert (=> b!810035 (=> (not res!553217) (not e!448485))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!810035 (= res!553217 (and (= (size!21487 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21487 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21487 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810036 () Bool)

(declare-fun res!553219 () Bool)

(assert (=> b!810036 (=> (not res!553219) (not e!448485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810036 (= res!553219 (validKeyInArray!0 (select (arr!21067 a!3170) j!153)))))

(declare-fun b!810037 () Bool)

(declare-fun e!448489 () Bool)

(declare-fun e!448487 () Bool)

(assert (=> b!810037 (= e!448489 e!448487)))

(declare-fun res!553221 () Bool)

(assert (=> b!810037 (=> (not res!553221) (not e!448487))))

(declare-datatypes ((SeekEntryResult!8614 0))(
  ( (MissingZero!8614 (index!36824 (_ BitVec 32))) (Found!8614 (index!36825 (_ BitVec 32))) (Intermediate!8614 (undefined!9426 Bool) (index!36826 (_ BitVec 32)) (x!67796 (_ BitVec 32))) (Undefined!8614) (MissingVacant!8614 (index!36827 (_ BitVec 32))) )
))
(declare-fun lt!362944 () SeekEntryResult!8614)

(declare-fun lt!362945 () SeekEntryResult!8614)

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!810037 (= res!553221 (and (= lt!362945 lt!362944) (= lt!362944 (Found!8614 j!153)) (not (= (select (arr!21067 a!3170) index!1236) (select (arr!21067 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43996 (_ BitVec 32)) SeekEntryResult!8614)

(assert (=> b!810037 (= lt!362944 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21067 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43996 (_ BitVec 32)) SeekEntryResult!8614)

(assert (=> b!810037 (= lt!362945 (seekEntryOrOpen!0 (select (arr!21067 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810038 () Bool)

(declare-fun e!448486 () Bool)

(assert (=> b!810038 (= e!448485 e!448486)))

(declare-fun res!553215 () Bool)

(assert (=> b!810038 (=> (not res!553215) (not e!448486))))

(declare-fun lt!362948 () SeekEntryResult!8614)

(assert (=> b!810038 (= res!553215 (or (= lt!362948 (MissingZero!8614 i!1163)) (= lt!362948 (MissingVacant!8614 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!810038 (= lt!362948 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810039 () Bool)

(declare-fun res!553214 () Bool)

(assert (=> b!810039 (=> (not res!553214) (not e!448486))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!810039 (= res!553214 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21487 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21067 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21487 a!3170)) (= (select (arr!21067 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!810040 () Bool)

(declare-fun res!553220 () Bool)

(assert (=> b!810040 (=> (not res!553220) (not e!448485))))

(declare-fun arrayContainsKey!0 (array!43996 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810040 (= res!553220 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810041 () Bool)

(declare-fun res!553222 () Bool)

(assert (=> b!810041 (=> (not res!553222) (not e!448485))))

(assert (=> b!810041 (= res!553222 (validKeyInArray!0 k0!2044))))

(declare-fun b!810042 () Bool)

(assert (=> b!810042 (= e!448487 false)))

(declare-fun lt!362943 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810042 (= lt!362943 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!810043 () Bool)

(declare-fun res!553223 () Bool)

(assert (=> b!810043 (=> (not res!553223) (not e!448486))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43996 (_ BitVec 32)) Bool)

(assert (=> b!810043 (= res!553223 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810044 () Bool)

(declare-fun res!553218 () Bool)

(assert (=> b!810044 (=> (not res!553218) (not e!448486))))

(declare-datatypes ((List!14937 0))(
  ( (Nil!14934) (Cons!14933 (h!16068 (_ BitVec 64)) (t!21244 List!14937)) )
))
(declare-fun arrayNoDuplicates!0 (array!43996 (_ BitVec 32) List!14937) Bool)

(assert (=> b!810044 (= res!553218 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14934))))

(declare-fun b!810045 () Bool)

(assert (=> b!810045 (= e!448486 e!448489)))

(declare-fun res!553216 () Bool)

(assert (=> b!810045 (=> (not res!553216) (not e!448489))))

(declare-fun lt!362946 () array!43996)

(declare-fun lt!362947 () (_ BitVec 64))

(assert (=> b!810045 (= res!553216 (= (seekEntryOrOpen!0 lt!362947 lt!362946 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362947 lt!362946 mask!3266)))))

(assert (=> b!810045 (= lt!362947 (select (store (arr!21067 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810045 (= lt!362946 (array!43997 (store (arr!21067 a!3170) i!1163 k0!2044) (size!21487 a!3170)))))

(assert (= (and start!69566 res!553224) b!810035))

(assert (= (and b!810035 res!553217) b!810036))

(assert (= (and b!810036 res!553219) b!810041))

(assert (= (and b!810041 res!553222) b!810040))

(assert (= (and b!810040 res!553220) b!810038))

(assert (= (and b!810038 res!553215) b!810043))

(assert (= (and b!810043 res!553223) b!810044))

(assert (= (and b!810044 res!553218) b!810039))

(assert (= (and b!810039 res!553214) b!810045))

(assert (= (and b!810045 res!553216) b!810037))

(assert (= (and b!810037 res!553221) b!810042))

(declare-fun m!752563 () Bool)

(assert (=> b!810044 m!752563))

(declare-fun m!752565 () Bool)

(assert (=> b!810039 m!752565))

(declare-fun m!752567 () Bool)

(assert (=> b!810039 m!752567))

(declare-fun m!752569 () Bool)

(assert (=> b!810045 m!752569))

(declare-fun m!752571 () Bool)

(assert (=> b!810045 m!752571))

(declare-fun m!752573 () Bool)

(assert (=> b!810045 m!752573))

(declare-fun m!752575 () Bool)

(assert (=> b!810045 m!752575))

(declare-fun m!752577 () Bool)

(assert (=> b!810043 m!752577))

(declare-fun m!752579 () Bool)

(assert (=> b!810036 m!752579))

(assert (=> b!810036 m!752579))

(declare-fun m!752581 () Bool)

(assert (=> b!810036 m!752581))

(declare-fun m!752583 () Bool)

(assert (=> start!69566 m!752583))

(declare-fun m!752585 () Bool)

(assert (=> start!69566 m!752585))

(declare-fun m!752587 () Bool)

(assert (=> b!810037 m!752587))

(assert (=> b!810037 m!752579))

(assert (=> b!810037 m!752579))

(declare-fun m!752589 () Bool)

(assert (=> b!810037 m!752589))

(assert (=> b!810037 m!752579))

(declare-fun m!752591 () Bool)

(assert (=> b!810037 m!752591))

(declare-fun m!752593 () Bool)

(assert (=> b!810038 m!752593))

(declare-fun m!752595 () Bool)

(assert (=> b!810041 m!752595))

(declare-fun m!752597 () Bool)

(assert (=> b!810042 m!752597))

(declare-fun m!752599 () Bool)

(assert (=> b!810040 m!752599))

(check-sat (not b!810045) (not start!69566) (not b!810040) (not b!810038) (not b!810044) (not b!810041) (not b!810037) (not b!810042) (not b!810043) (not b!810036))
(check-sat)
