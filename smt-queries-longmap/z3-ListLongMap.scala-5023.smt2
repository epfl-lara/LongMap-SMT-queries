; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68650 () Bool)

(assert start!68650)

(declare-fun b!799002 () Bool)

(declare-fun res!543527 () Bool)

(declare-fun e!443128 () Bool)

(assert (=> b!799002 (=> (not res!543527) (not e!443128))))

(declare-fun lt!356723 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8391 0))(
  ( (MissingZero!8391 (index!35932 (_ BitVec 32))) (Found!8391 (index!35933 (_ BitVec 32))) (Intermediate!8391 (undefined!9203 Bool) (index!35934 (_ BitVec 32)) (x!66813 (_ BitVec 32))) (Undefined!8391) (MissingVacant!8391 (index!35935 (_ BitVec 32))) )
))
(declare-fun lt!356725 () SeekEntryResult!8391)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!356722 () (_ BitVec 64))

(declare-datatypes ((array!43440 0))(
  ( (array!43441 (arr!20800 (Array (_ BitVec 32) (_ BitVec 64))) (size!21221 (_ BitVec 32))) )
))
(declare-fun lt!356726 () array!43440)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43440 (_ BitVec 32)) SeekEntryResult!8391)

(assert (=> b!799002 (= res!543527 (= lt!356725 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356723 vacantAfter!23 lt!356722 lt!356726 mask!3266)))))

(declare-fun b!799003 () Bool)

(declare-fun res!543521 () Bool)

(declare-fun e!443132 () Bool)

(assert (=> b!799003 (=> (not res!543521) (not e!443132))))

(declare-fun a!3170 () array!43440)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!799003 (= res!543521 (validKeyInArray!0 (select (arr!20800 a!3170) j!153)))))

(declare-fun b!799004 () Bool)

(declare-fun res!543525 () Bool)

(assert (=> b!799004 (=> (not res!543525) (not e!443132))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!799004 (= res!543525 (and (= (size!21221 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21221 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21221 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!799005 () Bool)

(declare-fun e!443131 () Bool)

(assert (=> b!799005 (= e!443132 e!443131)))

(declare-fun res!543524 () Bool)

(assert (=> b!799005 (=> (not res!543524) (not e!443131))))

(declare-fun lt!356727 () SeekEntryResult!8391)

(assert (=> b!799005 (= res!543524 (or (= lt!356727 (MissingZero!8391 i!1163)) (= lt!356727 (MissingVacant!8391 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43440 (_ BitVec 32)) SeekEntryResult!8391)

(assert (=> b!799005 (= lt!356727 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!799006 () Bool)

(declare-fun res!543526 () Bool)

(assert (=> b!799006 (=> (not res!543526) (not e!443131))))

(declare-datatypes ((List!14763 0))(
  ( (Nil!14760) (Cons!14759 (h!15888 (_ BitVec 64)) (t!21078 List!14763)) )
))
(declare-fun arrayNoDuplicates!0 (array!43440 (_ BitVec 32) List!14763) Bool)

(assert (=> b!799006 (= res!543526 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14760))))

(declare-fun b!799007 () Bool)

(declare-fun e!443129 () Bool)

(assert (=> b!799007 (= e!443131 e!443129)))

(declare-fun res!543528 () Bool)

(assert (=> b!799007 (=> (not res!543528) (not e!443129))))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!799007 (= res!543528 (= lt!356725 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!356722 lt!356726 mask!3266)))))

(assert (=> b!799007 (= lt!356725 (seekEntryOrOpen!0 lt!356722 lt!356726 mask!3266))))

(assert (=> b!799007 (= lt!356722 (select (store (arr!20800 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!799007 (= lt!356726 (array!43441 (store (arr!20800 a!3170) i!1163 k0!2044) (size!21221 a!3170)))))

(declare-fun b!799008 () Bool)

(declare-fun res!543522 () Bool)

(assert (=> b!799008 (=> (not res!543522) (not e!443131))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!799008 (= res!543522 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21221 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20800 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21221 a!3170)) (= (select (arr!20800 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!799009 () Bool)

(declare-fun res!543529 () Bool)

(assert (=> b!799009 (=> (not res!543529) (not e!443132))))

(declare-fun arrayContainsKey!0 (array!43440 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!799009 (= res!543529 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!799010 () Bool)

(assert (=> b!799010 (= e!443128 false)))

(declare-fun lt!356728 () SeekEntryResult!8391)

(assert (=> b!799010 (= lt!356728 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!356723 vacantBefore!23 (select (arr!20800 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799011 () Bool)

(declare-fun e!443127 () Bool)

(assert (=> b!799011 (= e!443129 e!443127)))

(declare-fun res!543532 () Bool)

(assert (=> b!799011 (=> (not res!543532) (not e!443127))))

(declare-fun lt!356724 () SeekEntryResult!8391)

(declare-fun lt!356729 () SeekEntryResult!8391)

(assert (=> b!799011 (= res!543532 (and (= lt!356729 lt!356724) (= lt!356724 (Found!8391 j!153)) (not (= (select (arr!20800 a!3170) index!1236) (select (arr!20800 a!3170) j!153)))))))

(assert (=> b!799011 (= lt!356724 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20800 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!799011 (= lt!356729 (seekEntryOrOpen!0 (select (arr!20800 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!799012 () Bool)

(declare-fun res!543533 () Bool)

(assert (=> b!799012 (=> (not res!543533) (not e!443132))))

(assert (=> b!799012 (= res!543533 (validKeyInArray!0 k0!2044))))

(declare-fun res!543530 () Bool)

(assert (=> start!68650 (=> (not res!543530) (not e!443132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68650 (= res!543530 (validMask!0 mask!3266))))

(assert (=> start!68650 e!443132))

(assert (=> start!68650 true))

(declare-fun array_inv!16596 (array!43440) Bool)

(assert (=> start!68650 (array_inv!16596 a!3170)))

(declare-fun b!799013 () Bool)

(declare-fun res!543531 () Bool)

(assert (=> b!799013 (=> (not res!543531) (not e!443131))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43440 (_ BitVec 32)) Bool)

(assert (=> b!799013 (= res!543531 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!799014 () Bool)

(assert (=> b!799014 (= e!443127 e!443128)))

(declare-fun res!543523 () Bool)

(assert (=> b!799014 (=> (not res!543523) (not e!443128))))

(assert (=> b!799014 (= res!543523 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!356723 #b00000000000000000000000000000000) (bvslt lt!356723 (size!21221 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!799014 (= lt!356723 (nextIndex!0 index!1236 x!1077 mask!3266))))

(assert (= (and start!68650 res!543530) b!799004))

(assert (= (and b!799004 res!543525) b!799003))

(assert (= (and b!799003 res!543521) b!799012))

(assert (= (and b!799012 res!543533) b!799009))

(assert (= (and b!799009 res!543529) b!799005))

(assert (= (and b!799005 res!543524) b!799013))

(assert (= (and b!799013 res!543531) b!799006))

(assert (= (and b!799006 res!543526) b!799008))

(assert (= (and b!799008 res!543522) b!799007))

(assert (= (and b!799007 res!543528) b!799011))

(assert (= (and b!799011 res!543532) b!799014))

(assert (= (and b!799014 res!543523) b!799002))

(assert (= (and b!799002 res!543527) b!799010))

(declare-fun m!739979 () Bool)

(assert (=> b!799009 m!739979))

(declare-fun m!739981 () Bool)

(assert (=> start!68650 m!739981))

(declare-fun m!739983 () Bool)

(assert (=> start!68650 m!739983))

(declare-fun m!739985 () Bool)

(assert (=> b!799005 m!739985))

(declare-fun m!739987 () Bool)

(assert (=> b!799011 m!739987))

(declare-fun m!739989 () Bool)

(assert (=> b!799011 m!739989))

(assert (=> b!799011 m!739989))

(declare-fun m!739991 () Bool)

(assert (=> b!799011 m!739991))

(assert (=> b!799011 m!739989))

(declare-fun m!739993 () Bool)

(assert (=> b!799011 m!739993))

(declare-fun m!739995 () Bool)

(assert (=> b!799006 m!739995))

(declare-fun m!739997 () Bool)

(assert (=> b!799002 m!739997))

(declare-fun m!739999 () Bool)

(assert (=> b!799007 m!739999))

(declare-fun m!740001 () Bool)

(assert (=> b!799007 m!740001))

(declare-fun m!740003 () Bool)

(assert (=> b!799007 m!740003))

(declare-fun m!740005 () Bool)

(assert (=> b!799007 m!740005))

(declare-fun m!740007 () Bool)

(assert (=> b!799014 m!740007))

(assert (=> b!799003 m!739989))

(assert (=> b!799003 m!739989))

(declare-fun m!740009 () Bool)

(assert (=> b!799003 m!740009))

(declare-fun m!740011 () Bool)

(assert (=> b!799012 m!740011))

(declare-fun m!740013 () Bool)

(assert (=> b!799013 m!740013))

(declare-fun m!740015 () Bool)

(assert (=> b!799008 m!740015))

(declare-fun m!740017 () Bool)

(assert (=> b!799008 m!740017))

(assert (=> b!799010 m!739989))

(assert (=> b!799010 m!739989))

(declare-fun m!740019 () Bool)

(assert (=> b!799010 m!740019))

(check-sat (not b!799011) (not b!799006) (not b!799010) (not b!799014) (not b!799005) (not b!799013) (not b!799012) (not start!68650) (not b!799002) (not b!799009) (not b!799003) (not b!799007))
(check-sat)
