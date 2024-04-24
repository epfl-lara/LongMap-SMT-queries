; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68724 () Bool)

(assert start!68724)

(declare-datatypes ((SeekEntryResult!8317 0))(
  ( (MissingZero!8317 (index!35636 (_ BitVec 32))) (Found!8317 (index!35637 (_ BitVec 32))) (Intermediate!8317 (undefined!9129 Bool) (index!35638 (_ BitVec 32)) (x!66686 (_ BitVec 32))) (Undefined!8317) (MissingVacant!8317 (index!35639 (_ BitVec 32))) )
))
(declare-fun lt!356521 () SeekEntryResult!8317)

(declare-fun lt!356524 () SeekEntryResult!8317)

(declare-fun e!443193 () Bool)

(declare-fun b!798829 () Bool)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!798829 (= e!443193 (not (or (not (= lt!356521 lt!356524)) (bvslt mask!3266 #b00000000000000000000000000000000) (bvsge index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (and (bvsge vacantBefore!23 #b00000000000000000000000000000000) (bvslt vacantBefore!23 (bvadd #b00000000000000000000000000000001 mask!3266))))))))

(assert (=> b!798829 (= lt!356521 (Found!8317 index!1236))))

(declare-fun b!798830 () Bool)

(declare-fun e!443190 () Bool)

(assert (=> b!798830 (= e!443190 e!443193)))

(declare-fun res!542974 () Bool)

(assert (=> b!798830 (=> (not res!542974) (not e!443193))))

(declare-datatypes ((array!43388 0))(
  ( (array!43389 (arr!20770 (Array (_ BitVec 32) (_ BitVec 64))) (size!21190 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43388)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!356527 () SeekEntryResult!8317)

(assert (=> b!798830 (= res!542974 (and (= lt!356527 lt!356524) (= (select (arr!20770 a!3170) index!1236) (select (arr!20770 a!3170) j!153))))))

(assert (=> b!798830 (= lt!356524 (Found!8317 j!153))))

(declare-fun b!798831 () Bool)

(declare-fun res!542981 () Bool)

(declare-fun e!443192 () Bool)

(assert (=> b!798831 (=> (not res!542981) (not e!443192))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!798831 (= res!542981 (validKeyInArray!0 (select (arr!20770 a!3170) j!153)))))

(declare-fun res!542978 () Bool)

(assert (=> start!68724 (=> (not res!542978) (not e!443192))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68724 (= res!542978 (validMask!0 mask!3266))))

(assert (=> start!68724 e!443192))

(assert (=> start!68724 true))

(declare-fun array_inv!16629 (array!43388) Bool)

(assert (=> start!68724 (array_inv!16629 a!3170)))

(declare-fun b!798832 () Bool)

(declare-fun res!542984 () Bool)

(assert (=> b!798832 (=> (not res!542984) (not e!443192))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!798832 (= res!542984 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!798833 () Bool)

(declare-fun e!443194 () Bool)

(assert (=> b!798833 (= e!443194 e!443190)))

(declare-fun res!542977 () Bool)

(assert (=> b!798833 (=> (not res!542977) (not e!443190))))

(declare-fun lt!356522 () SeekEntryResult!8317)

(assert (=> b!798833 (= res!542977 (= lt!356522 lt!356527))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43388 (_ BitVec 32)) SeekEntryResult!8317)

(assert (=> b!798833 (= lt!356527 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20770 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43388 (_ BitVec 32)) SeekEntryResult!8317)

(assert (=> b!798833 (= lt!356522 (seekEntryOrOpen!0 (select (arr!20770 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!798834 () Bool)

(declare-fun res!542976 () Bool)

(declare-fun e!443189 () Bool)

(assert (=> b!798834 (=> (not res!542976) (not e!443189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43388 (_ BitVec 32)) Bool)

(assert (=> b!798834 (= res!542976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!798835 () Bool)

(declare-fun res!542979 () Bool)

(assert (=> b!798835 (=> (not res!542979) (not e!443192))))

(assert (=> b!798835 (= res!542979 (validKeyInArray!0 k0!2044))))

(declare-fun b!798836 () Bool)

(assert (=> b!798836 (= e!443192 e!443189)))

(declare-fun res!542980 () Bool)

(assert (=> b!798836 (=> (not res!542980) (not e!443189))))

(declare-fun lt!356526 () SeekEntryResult!8317)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!798836 (= res!542980 (or (= lt!356526 (MissingZero!8317 i!1163)) (= lt!356526 (MissingVacant!8317 i!1163))))))

(assert (=> b!798836 (= lt!356526 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!798837 () Bool)

(assert (=> b!798837 (= e!443189 e!443194)))

(declare-fun res!542983 () Bool)

(assert (=> b!798837 (=> (not res!542983) (not e!443194))))

(declare-fun lt!356520 () SeekEntryResult!8317)

(assert (=> b!798837 (= res!542983 (= lt!356520 lt!356521))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!356523 () array!43388)

(declare-fun lt!356525 () (_ BitVec 64))

(assert (=> b!798837 (= lt!356521 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356525 lt!356523 mask!3266))))

(assert (=> b!798837 (= lt!356520 (seekEntryOrOpen!0 lt!356525 lt!356523 mask!3266))))

(assert (=> b!798837 (= lt!356525 (select (store (arr!20770 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!798837 (= lt!356523 (array!43389 (store (arr!20770 a!3170) i!1163 k0!2044) (size!21190 a!3170)))))

(declare-fun b!798838 () Bool)

(declare-fun res!542985 () Bool)

(assert (=> b!798838 (=> (not res!542985) (not e!443189))))

(declare-datatypes ((List!14640 0))(
  ( (Nil!14637) (Cons!14636 (h!15771 (_ BitVec 64)) (t!20947 List!14640)) )
))
(declare-fun arrayNoDuplicates!0 (array!43388 (_ BitVec 32) List!14640) Bool)

(assert (=> b!798838 (= res!542985 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14637))))

(declare-fun b!798839 () Bool)

(declare-fun res!542982 () Bool)

(assert (=> b!798839 (=> (not res!542982) (not e!443189))))

(assert (=> b!798839 (= res!542982 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21190 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20770 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21190 a!3170)) (= (select (arr!20770 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!798840 () Bool)

(declare-fun res!542975 () Bool)

(assert (=> b!798840 (=> (not res!542975) (not e!443192))))

(assert (=> b!798840 (= res!542975 (and (= (size!21190 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21190 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21190 a!3170)) (not (= i!1163 j!153))))))

(assert (= (and start!68724 res!542978) b!798840))

(assert (= (and b!798840 res!542975) b!798831))

(assert (= (and b!798831 res!542981) b!798835))

(assert (= (and b!798835 res!542979) b!798832))

(assert (= (and b!798832 res!542984) b!798836))

(assert (= (and b!798836 res!542980) b!798834))

(assert (= (and b!798834 res!542976) b!798838))

(assert (= (and b!798838 res!542985) b!798839))

(assert (= (and b!798839 res!542982) b!798837))

(assert (= (and b!798837 res!542983) b!798833))

(assert (= (and b!798833 res!542977) b!798830))

(assert (= (and b!798830 res!542974) b!798829))

(declare-fun m!740147 () Bool)

(assert (=> b!798835 m!740147))

(declare-fun m!740149 () Bool)

(assert (=> start!68724 m!740149))

(declare-fun m!740151 () Bool)

(assert (=> start!68724 m!740151))

(declare-fun m!740153 () Bool)

(assert (=> b!798834 m!740153))

(declare-fun m!740155 () Bool)

(assert (=> b!798838 m!740155))

(declare-fun m!740157 () Bool)

(assert (=> b!798832 m!740157))

(declare-fun m!740159 () Bool)

(assert (=> b!798830 m!740159))

(declare-fun m!740161 () Bool)

(assert (=> b!798830 m!740161))

(declare-fun m!740163 () Bool)

(assert (=> b!798837 m!740163))

(declare-fun m!740165 () Bool)

(assert (=> b!798837 m!740165))

(declare-fun m!740167 () Bool)

(assert (=> b!798837 m!740167))

(declare-fun m!740169 () Bool)

(assert (=> b!798837 m!740169))

(assert (=> b!798833 m!740161))

(assert (=> b!798833 m!740161))

(declare-fun m!740171 () Bool)

(assert (=> b!798833 m!740171))

(assert (=> b!798833 m!740161))

(declare-fun m!740173 () Bool)

(assert (=> b!798833 m!740173))

(declare-fun m!740175 () Bool)

(assert (=> b!798836 m!740175))

(declare-fun m!740177 () Bool)

(assert (=> b!798839 m!740177))

(declare-fun m!740179 () Bool)

(assert (=> b!798839 m!740179))

(assert (=> b!798831 m!740161))

(assert (=> b!798831 m!740161))

(declare-fun m!740181 () Bool)

(assert (=> b!798831 m!740181))

(check-sat (not b!798831) (not b!798834) (not b!798835) (not b!798838) (not start!68724) (not b!798832) (not b!798837) (not b!798833) (not b!798836))
(check-sat)
