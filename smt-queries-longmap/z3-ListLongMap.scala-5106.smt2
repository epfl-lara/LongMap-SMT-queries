; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69244 () Bool)

(assert start!69244)

(declare-fun b!807866 () Bool)

(declare-fun e!447245 () Bool)

(assert (=> b!807866 (= e!447245 false)))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!361964 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!807866 (= lt!361964 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!807867 () Bool)

(declare-fun res!551998 () Bool)

(declare-fun e!447244 () Bool)

(assert (=> b!807867 (=> (not res!551998) (not e!447244))))

(declare-datatypes ((array!43944 0))(
  ( (array!43945 (arr!21049 (Array (_ BitVec 32) (_ BitVec 64))) (size!21470 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43944)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!807867 (= res!551998 (validKeyInArray!0 (select (arr!21049 a!3170) j!153)))))

(declare-fun b!807868 () Bool)

(declare-fun e!447248 () Bool)

(declare-fun e!447246 () Bool)

(assert (=> b!807868 (= e!447248 e!447246)))

(declare-fun res!551991 () Bool)

(assert (=> b!807868 (=> (not res!551991) (not e!447246))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!361962 () (_ BitVec 64))

(declare-fun lt!361966 () array!43944)

(declare-datatypes ((SeekEntryResult!8640 0))(
  ( (MissingZero!8640 (index!36928 (_ BitVec 32))) (Found!8640 (index!36929 (_ BitVec 32))) (Intermediate!8640 (undefined!9452 Bool) (index!36930 (_ BitVec 32)) (x!67732 (_ BitVec 32))) (Undefined!8640) (MissingVacant!8640 (index!36931 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43944 (_ BitVec 32)) SeekEntryResult!8640)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43944 (_ BitVec 32)) SeekEntryResult!8640)

(assert (=> b!807868 (= res!551991 (= (seekEntryOrOpen!0 lt!361962 lt!361966 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!361962 lt!361966 mask!3266)))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!807868 (= lt!361962 (select (store (arr!21049 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!807868 (= lt!361966 (array!43945 (store (arr!21049 a!3170) i!1163 k0!2044) (size!21470 a!3170)))))

(declare-fun b!807869 () Bool)

(declare-fun res!551990 () Bool)

(assert (=> b!807869 (=> (not res!551990) (not e!447248))))

(declare-datatypes ((List!15012 0))(
  ( (Nil!15009) (Cons!15008 (h!16137 (_ BitVec 64)) (t!21327 List!15012)) )
))
(declare-fun arrayNoDuplicates!0 (array!43944 (_ BitVec 32) List!15012) Bool)

(assert (=> b!807869 (= res!551990 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15009))))

(declare-fun b!807870 () Bool)

(declare-fun res!551995 () Bool)

(assert (=> b!807870 (=> (not res!551995) (not e!447248))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43944 (_ BitVec 32)) Bool)

(assert (=> b!807870 (= res!551995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!807872 () Bool)

(assert (=> b!807872 (= e!447246 e!447245)))

(declare-fun res!551993 () Bool)

(assert (=> b!807872 (=> (not res!551993) (not e!447245))))

(declare-fun lt!361965 () SeekEntryResult!8640)

(declare-fun lt!361963 () SeekEntryResult!8640)

(assert (=> b!807872 (= res!551993 (and (= lt!361965 lt!361963) (= lt!361963 (Found!8640 j!153)) (not (= (select (arr!21049 a!3170) index!1236) (select (arr!21049 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!807872 (= lt!361963 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21049 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!807872 (= lt!361965 (seekEntryOrOpen!0 (select (arr!21049 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!807873 () Bool)

(declare-fun res!551989 () Bool)

(assert (=> b!807873 (=> (not res!551989) (not e!447244))))

(declare-fun arrayContainsKey!0 (array!43944 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!807873 (= res!551989 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!807874 () Bool)

(declare-fun res!551992 () Bool)

(assert (=> b!807874 (=> (not res!551992) (not e!447244))))

(assert (=> b!807874 (= res!551992 (and (= (size!21470 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21470 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21470 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!807875 () Bool)

(declare-fun res!551994 () Bool)

(assert (=> b!807875 (=> (not res!551994) (not e!447248))))

(assert (=> b!807875 (= res!551994 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21470 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21049 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21470 a!3170)) (= (select (arr!21049 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!807876 () Bool)

(assert (=> b!807876 (= e!447244 e!447248)))

(declare-fun res!551999 () Bool)

(assert (=> b!807876 (=> (not res!551999) (not e!447248))))

(declare-fun lt!361967 () SeekEntryResult!8640)

(assert (=> b!807876 (= res!551999 (or (= lt!361967 (MissingZero!8640 i!1163)) (= lt!361967 (MissingVacant!8640 i!1163))))))

(assert (=> b!807876 (= lt!361967 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun res!551997 () Bool)

(assert (=> start!69244 (=> (not res!551997) (not e!447244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69244 (= res!551997 (validMask!0 mask!3266))))

(assert (=> start!69244 e!447244))

(assert (=> start!69244 true))

(declare-fun array_inv!16845 (array!43944) Bool)

(assert (=> start!69244 (array_inv!16845 a!3170)))

(declare-fun b!807871 () Bool)

(declare-fun res!551996 () Bool)

(assert (=> b!807871 (=> (not res!551996) (not e!447244))))

(assert (=> b!807871 (= res!551996 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69244 res!551997) b!807874))

(assert (= (and b!807874 res!551992) b!807867))

(assert (= (and b!807867 res!551998) b!807871))

(assert (= (and b!807871 res!551996) b!807873))

(assert (= (and b!807873 res!551989) b!807876))

(assert (= (and b!807876 res!551999) b!807870))

(assert (= (and b!807870 res!551995) b!807869))

(assert (= (and b!807869 res!551990) b!807875))

(assert (= (and b!807875 res!551994) b!807868))

(assert (= (and b!807868 res!551991) b!807872))

(assert (= (and b!807872 res!551993) b!807866))

(declare-fun m!749965 () Bool)

(assert (=> b!807870 m!749965))

(declare-fun m!749967 () Bool)

(assert (=> b!807876 m!749967))

(declare-fun m!749969 () Bool)

(assert (=> b!807869 m!749969))

(declare-fun m!749971 () Bool)

(assert (=> b!807872 m!749971))

(declare-fun m!749973 () Bool)

(assert (=> b!807872 m!749973))

(assert (=> b!807872 m!749973))

(declare-fun m!749975 () Bool)

(assert (=> b!807872 m!749975))

(assert (=> b!807872 m!749973))

(declare-fun m!749977 () Bool)

(assert (=> b!807872 m!749977))

(declare-fun m!749979 () Bool)

(assert (=> start!69244 m!749979))

(declare-fun m!749981 () Bool)

(assert (=> start!69244 m!749981))

(declare-fun m!749983 () Bool)

(assert (=> b!807871 m!749983))

(declare-fun m!749985 () Bool)

(assert (=> b!807868 m!749985))

(declare-fun m!749987 () Bool)

(assert (=> b!807868 m!749987))

(declare-fun m!749989 () Bool)

(assert (=> b!807868 m!749989))

(declare-fun m!749991 () Bool)

(assert (=> b!807868 m!749991))

(declare-fun m!749993 () Bool)

(assert (=> b!807873 m!749993))

(declare-fun m!749995 () Bool)

(assert (=> b!807875 m!749995))

(declare-fun m!749997 () Bool)

(assert (=> b!807875 m!749997))

(assert (=> b!807867 m!749973))

(assert (=> b!807867 m!749973))

(declare-fun m!749999 () Bool)

(assert (=> b!807867 m!749999))

(declare-fun m!750001 () Bool)

(assert (=> b!807866 m!750001))

(check-sat (not b!807868) (not b!807872) (not b!807870) (not b!807876) (not b!807871) (not start!69244) (not b!807867) (not b!807869) (not b!807866) (not b!807873))
(check-sat)
