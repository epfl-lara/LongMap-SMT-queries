; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68890 () Bool)

(assert start!68890)

(declare-fun res!547958 () Bool)

(declare-fun e!445202 () Bool)

(assert (=> start!68890 (=> (not res!547958) (not e!445202))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68890 (= res!547958 (validMask!0 mask!3266))))

(assert (=> start!68890 e!445202))

(assert (=> start!68890 true))

(declare-datatypes ((array!43680 0))(
  ( (array!43681 (arr!20920 (Array (_ BitVec 32) (_ BitVec 64))) (size!21341 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43680)

(declare-fun array_inv!16716 (array!43680) Bool)

(assert (=> start!68890 (array_inv!16716 a!3170)))

(declare-fun b!803434 () Bool)

(declare-fun res!547959 () Bool)

(declare-fun e!445199 () Bool)

(assert (=> b!803434 (=> (not res!547959) (not e!445199))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!803434 (= res!547959 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21341 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20920 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21341 a!3170)) (= (select (arr!20920 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!803435 () Bool)

(declare-fun res!547956 () Bool)

(assert (=> b!803435 (=> (not res!547956) (not e!445202))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43680 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!803435 (= res!547956 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!803436 () Bool)

(assert (=> b!803436 (= e!445202 e!445199)))

(declare-fun res!547963 () Bool)

(assert (=> b!803436 (=> (not res!547963) (not e!445199))))

(declare-datatypes ((SeekEntryResult!8511 0))(
  ( (MissingZero!8511 (index!36412 (_ BitVec 32))) (Found!8511 (index!36413 (_ BitVec 32))) (Intermediate!8511 (undefined!9323 Bool) (index!36414 (_ BitVec 32)) (x!67253 (_ BitVec 32))) (Undefined!8511) (MissingVacant!8511 (index!36415 (_ BitVec 32))) )
))
(declare-fun lt!359598 () SeekEntryResult!8511)

(assert (=> b!803436 (= res!547963 (or (= lt!359598 (MissingZero!8511 i!1163)) (= lt!359598 (MissingVacant!8511 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43680 (_ BitVec 32)) SeekEntryResult!8511)

(assert (=> b!803436 (= lt!359598 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!803437 () Bool)

(declare-fun e!445197 () Bool)

(assert (=> b!803437 (= e!445199 e!445197)))

(declare-fun res!547954 () Bool)

(assert (=> b!803437 (=> (not res!547954) (not e!445197))))

(declare-fun lt!359594 () SeekEntryResult!8511)

(declare-fun lt!359601 () SeekEntryResult!8511)

(assert (=> b!803437 (= res!547954 (= lt!359594 lt!359601))))

(declare-fun lt!359595 () (_ BitVec 64))

(declare-fun lt!359603 () array!43680)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43680 (_ BitVec 32)) SeekEntryResult!8511)

(assert (=> b!803437 (= lt!359601 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!359595 lt!359603 mask!3266))))

(assert (=> b!803437 (= lt!359594 (seekEntryOrOpen!0 lt!359595 lt!359603 mask!3266))))

(declare-fun j!153 () (_ BitVec 32))

(assert (=> b!803437 (= lt!359595 (select (store (arr!20920 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!803437 (= lt!359603 (array!43681 (store (arr!20920 a!3170) i!1163 k0!2044) (size!21341 a!3170)))))

(declare-fun b!803438 () Bool)

(declare-fun e!445201 () Bool)

(declare-fun lt!359597 () SeekEntryResult!8511)

(assert (=> b!803438 (= e!445201 (not (or (not (= lt!359601 lt!359597)) (bvsge mask!3266 #b00000000000000000000000000000000))))))

(declare-fun lt!359602 () (_ BitVec 32))

(assert (=> b!803438 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359602 vacantAfter!23 lt!359595 lt!359603 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!359602 vacantBefore!23 (select (arr!20920 a!3170) j!153) a!3170 mask!3266))))

(declare-datatypes ((Unit!27562 0))(
  ( (Unit!27563) )
))
(declare-fun lt!359596 () Unit!27562)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43680 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27562)

(assert (=> b!803438 (= lt!359596 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!359602 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!803438 (= lt!359602 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!803439 () Bool)

(declare-fun res!547957 () Bool)

(assert (=> b!803439 (=> (not res!547957) (not e!445199))))

(declare-datatypes ((List!14883 0))(
  ( (Nil!14880) (Cons!14879 (h!16008 (_ BitVec 64)) (t!21198 List!14883)) )
))
(declare-fun arrayNoDuplicates!0 (array!43680 (_ BitVec 32) List!14883) Bool)

(assert (=> b!803439 (= res!547957 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14880))))

(declare-fun b!803440 () Bool)

(declare-fun res!547961 () Bool)

(assert (=> b!803440 (=> (not res!547961) (not e!445202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!803440 (= res!547961 (validKeyInArray!0 k0!2044))))

(declare-fun b!803441 () Bool)

(declare-fun e!445198 () Bool)

(assert (=> b!803441 (= e!445198 e!445201)))

(declare-fun res!547962 () Bool)

(assert (=> b!803441 (=> (not res!547962) (not e!445201))))

(declare-fun lt!359599 () SeekEntryResult!8511)

(assert (=> b!803441 (= res!547962 (and (= lt!359599 lt!359597) (not (= (select (arr!20920 a!3170) index!1236) (select (arr!20920 a!3170) j!153)))))))

(assert (=> b!803441 (= lt!359597 (Found!8511 j!153))))

(declare-fun b!803442 () Bool)

(declare-fun res!547953 () Bool)

(assert (=> b!803442 (=> (not res!547953) (not e!445202))))

(assert (=> b!803442 (= res!547953 (and (= (size!21341 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21341 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21341 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!803443 () Bool)

(declare-fun res!547955 () Bool)

(assert (=> b!803443 (=> (not res!547955) (not e!445202))))

(assert (=> b!803443 (= res!547955 (validKeyInArray!0 (select (arr!20920 a!3170) j!153)))))

(declare-fun b!803444 () Bool)

(assert (=> b!803444 (= e!445197 e!445198)))

(declare-fun res!547960 () Bool)

(assert (=> b!803444 (=> (not res!547960) (not e!445198))))

(declare-fun lt!359600 () SeekEntryResult!8511)

(assert (=> b!803444 (= res!547960 (= lt!359600 lt!359599))))

(assert (=> b!803444 (= lt!359599 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20920 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!803444 (= lt!359600 (seekEntryOrOpen!0 (select (arr!20920 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!803445 () Bool)

(declare-fun res!547964 () Bool)

(assert (=> b!803445 (=> (not res!547964) (not e!445199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43680 (_ BitVec 32)) Bool)

(assert (=> b!803445 (= res!547964 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68890 res!547958) b!803442))

(assert (= (and b!803442 res!547953) b!803443))

(assert (= (and b!803443 res!547955) b!803440))

(assert (= (and b!803440 res!547961) b!803435))

(assert (= (and b!803435 res!547956) b!803436))

(assert (= (and b!803436 res!547963) b!803445))

(assert (= (and b!803445 res!547964) b!803439))

(assert (= (and b!803439 res!547957) b!803434))

(assert (= (and b!803434 res!547959) b!803437))

(assert (= (and b!803437 res!547954) b!803444))

(assert (= (and b!803444 res!547960) b!803441))

(assert (= (and b!803441 res!547962) b!803438))

(declare-fun m!745159 () Bool)

(assert (=> b!803441 m!745159))

(declare-fun m!745161 () Bool)

(assert (=> b!803441 m!745161))

(assert (=> b!803444 m!745161))

(assert (=> b!803444 m!745161))

(declare-fun m!745163 () Bool)

(assert (=> b!803444 m!745163))

(assert (=> b!803444 m!745161))

(declare-fun m!745165 () Bool)

(assert (=> b!803444 m!745165))

(assert (=> b!803438 m!745161))

(declare-fun m!745167 () Bool)

(assert (=> b!803438 m!745167))

(assert (=> b!803438 m!745161))

(declare-fun m!745169 () Bool)

(assert (=> b!803438 m!745169))

(declare-fun m!745171 () Bool)

(assert (=> b!803438 m!745171))

(declare-fun m!745173 () Bool)

(assert (=> b!803438 m!745173))

(declare-fun m!745175 () Bool)

(assert (=> b!803439 m!745175))

(declare-fun m!745177 () Bool)

(assert (=> b!803440 m!745177))

(declare-fun m!745179 () Bool)

(assert (=> b!803437 m!745179))

(declare-fun m!745181 () Bool)

(assert (=> b!803437 m!745181))

(declare-fun m!745183 () Bool)

(assert (=> b!803437 m!745183))

(declare-fun m!745185 () Bool)

(assert (=> b!803437 m!745185))

(declare-fun m!745187 () Bool)

(assert (=> b!803445 m!745187))

(declare-fun m!745189 () Bool)

(assert (=> b!803436 m!745189))

(assert (=> b!803443 m!745161))

(assert (=> b!803443 m!745161))

(declare-fun m!745191 () Bool)

(assert (=> b!803443 m!745191))

(declare-fun m!745193 () Bool)

(assert (=> b!803434 m!745193))

(declare-fun m!745195 () Bool)

(assert (=> b!803434 m!745195))

(declare-fun m!745197 () Bool)

(assert (=> start!68890 m!745197))

(declare-fun m!745199 () Bool)

(assert (=> start!68890 m!745199))

(declare-fun m!745201 () Bool)

(assert (=> b!803435 m!745201))

(check-sat (not b!803444) (not start!68890) (not b!803437) (not b!803443) (not b!803435) (not b!803445) (not b!803440) (not b!803439) (not b!803438) (not b!803436))
(check-sat)
