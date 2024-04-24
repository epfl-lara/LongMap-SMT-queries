; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69560 () Bool)

(assert start!69560)

(declare-fun res!553122 () Bool)

(declare-fun e!448444 () Bool)

(assert (=> start!69560 (=> (not res!553122) (not e!448444))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69560 (= res!553122 (validMask!0 mask!3266))))

(assert (=> start!69560 e!448444))

(assert (=> start!69560 true))

(declare-datatypes ((array!43990 0))(
  ( (array!43991 (arr!21064 (Array (_ BitVec 32) (_ BitVec 64))) (size!21484 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43990)

(declare-fun array_inv!16923 (array!43990) Bool)

(assert (=> start!69560 (array_inv!16923 a!3170)))

(declare-fun b!809936 () Bool)

(declare-fun e!448442 () Bool)

(assert (=> b!809936 (= e!448442 false)))

(declare-fun lt!362891 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!809936 (= lt!362891 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!809937 () Bool)

(declare-fun res!553121 () Bool)

(declare-fun e!448441 () Bool)

(assert (=> b!809937 (=> (not res!553121) (not e!448441))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43990 (_ BitVec 32)) Bool)

(assert (=> b!809937 (= res!553121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!809938 () Bool)

(declare-fun res!553124 () Bool)

(assert (=> b!809938 (=> (not res!553124) (not e!448444))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!809938 (= res!553124 (validKeyInArray!0 (select (arr!21064 a!3170) j!153)))))

(declare-fun b!809939 () Bool)

(declare-fun res!553118 () Bool)

(assert (=> b!809939 (=> (not res!553118) (not e!448444))))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!809939 (= res!553118 (and (= (size!21484 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21484 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21484 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!809940 () Bool)

(declare-fun res!553116 () Bool)

(assert (=> b!809940 (=> (not res!553116) (not e!448444))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!809940 (= res!553116 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!809941 () Bool)

(assert (=> b!809941 (= e!448444 e!448441)))

(declare-fun res!553123 () Bool)

(assert (=> b!809941 (=> (not res!553123) (not e!448441))))

(declare-datatypes ((SeekEntryResult!8611 0))(
  ( (MissingZero!8611 (index!36812 (_ BitVec 32))) (Found!8611 (index!36813 (_ BitVec 32))) (Intermediate!8611 (undefined!9423 Bool) (index!36814 (_ BitVec 32)) (x!67785 (_ BitVec 32))) (Undefined!8611) (MissingVacant!8611 (index!36815 (_ BitVec 32))) )
))
(declare-fun lt!362889 () SeekEntryResult!8611)

(assert (=> b!809941 (= res!553123 (or (= lt!362889 (MissingZero!8611 i!1163)) (= lt!362889 (MissingVacant!8611 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43990 (_ BitVec 32)) SeekEntryResult!8611)

(assert (=> b!809941 (= lt!362889 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!809942 () Bool)

(declare-fun res!553117 () Bool)

(assert (=> b!809942 (=> (not res!553117) (not e!448441))))

(declare-datatypes ((List!14934 0))(
  ( (Nil!14931) (Cons!14930 (h!16065 (_ BitVec 64)) (t!21241 List!14934)) )
))
(declare-fun arrayNoDuplicates!0 (array!43990 (_ BitVec 32) List!14934) Bool)

(assert (=> b!809942 (= res!553117 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14931))))

(declare-fun b!809943 () Bool)

(declare-fun e!448440 () Bool)

(assert (=> b!809943 (= e!448440 e!448442)))

(declare-fun res!553125 () Bool)

(assert (=> b!809943 (=> (not res!553125) (not e!448442))))

(declare-fun lt!362892 () SeekEntryResult!8611)

(declare-fun lt!362890 () SeekEntryResult!8611)

(assert (=> b!809943 (= res!553125 (and (= lt!362892 lt!362890) (= lt!362890 (Found!8611 j!153)) (not (= (select (arr!21064 a!3170) index!1236) (select (arr!21064 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43990 (_ BitVec 32)) SeekEntryResult!8611)

(assert (=> b!809943 (= lt!362890 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21064 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!809943 (= lt!362892 (seekEntryOrOpen!0 (select (arr!21064 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!809944 () Bool)

(assert (=> b!809944 (= e!448441 e!448440)))

(declare-fun res!553120 () Bool)

(assert (=> b!809944 (=> (not res!553120) (not e!448440))))

(declare-fun lt!362894 () (_ BitVec 64))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362893 () array!43990)

(assert (=> b!809944 (= res!553120 (= (seekEntryOrOpen!0 lt!362894 lt!362893 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362894 lt!362893 mask!3266)))))

(assert (=> b!809944 (= lt!362894 (select (store (arr!21064 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!809944 (= lt!362893 (array!43991 (store (arr!21064 a!3170) i!1163 k0!2044) (size!21484 a!3170)))))

(declare-fun b!809945 () Bool)

(declare-fun res!553119 () Bool)

(assert (=> b!809945 (=> (not res!553119) (not e!448441))))

(assert (=> b!809945 (= res!553119 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21484 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21064 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21484 a!3170)) (= (select (arr!21064 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!809946 () Bool)

(declare-fun res!553115 () Bool)

(assert (=> b!809946 (=> (not res!553115) (not e!448444))))

(assert (=> b!809946 (= res!553115 (validKeyInArray!0 k0!2044))))

(assert (= (and start!69560 res!553122) b!809939))

(assert (= (and b!809939 res!553118) b!809938))

(assert (= (and b!809938 res!553124) b!809946))

(assert (= (and b!809946 res!553115) b!809940))

(assert (= (and b!809940 res!553116) b!809941))

(assert (= (and b!809941 res!553123) b!809937))

(assert (= (and b!809937 res!553121) b!809942))

(assert (= (and b!809942 res!553117) b!809945))

(assert (= (and b!809945 res!553119) b!809944))

(assert (= (and b!809944 res!553120) b!809943))

(assert (= (and b!809943 res!553125) b!809936))

(declare-fun m!752449 () Bool)

(assert (=> b!809941 m!752449))

(declare-fun m!752451 () Bool)

(assert (=> b!809944 m!752451))

(declare-fun m!752453 () Bool)

(assert (=> b!809944 m!752453))

(declare-fun m!752455 () Bool)

(assert (=> b!809944 m!752455))

(declare-fun m!752457 () Bool)

(assert (=> b!809944 m!752457))

(declare-fun m!752459 () Bool)

(assert (=> b!809945 m!752459))

(declare-fun m!752461 () Bool)

(assert (=> b!809945 m!752461))

(declare-fun m!752463 () Bool)

(assert (=> b!809938 m!752463))

(assert (=> b!809938 m!752463))

(declare-fun m!752465 () Bool)

(assert (=> b!809938 m!752465))

(declare-fun m!752467 () Bool)

(assert (=> b!809936 m!752467))

(declare-fun m!752469 () Bool)

(assert (=> b!809943 m!752469))

(assert (=> b!809943 m!752463))

(assert (=> b!809943 m!752463))

(declare-fun m!752471 () Bool)

(assert (=> b!809943 m!752471))

(assert (=> b!809943 m!752463))

(declare-fun m!752473 () Bool)

(assert (=> b!809943 m!752473))

(declare-fun m!752475 () Bool)

(assert (=> start!69560 m!752475))

(declare-fun m!752477 () Bool)

(assert (=> start!69560 m!752477))

(declare-fun m!752479 () Bool)

(assert (=> b!809942 m!752479))

(declare-fun m!752481 () Bool)

(assert (=> b!809940 m!752481))

(declare-fun m!752483 () Bool)

(assert (=> b!809937 m!752483))

(declare-fun m!752485 () Bool)

(assert (=> b!809946 m!752485))

(check-sat (not b!809936) (not start!69560) (not b!809944) (not b!809946) (not b!809940) (not b!809941) (not b!809942) (not b!809943) (not b!809937) (not b!809938))
(check-sat)
