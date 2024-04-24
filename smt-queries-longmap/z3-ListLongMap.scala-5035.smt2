; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68888 () Bool)

(assert start!68888)

(declare-fun b!801255 () Bool)

(declare-fun res!545231 () Bool)

(declare-fun e!444329 () Bool)

(assert (=> b!801255 (=> (not res!545231) (not e!444329))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8377 0))(
  ( (MissingZero!8377 (index!35876 (_ BitVec 32))) (Found!8377 (index!35877 (_ BitVec 32))) (Intermediate!8377 (undefined!9189 Bool) (index!35878 (_ BitVec 32)) (x!66909 (_ BitVec 32))) (Undefined!8377) (MissingVacant!8377 (index!35879 (_ BitVec 32))) )
))
(declare-fun lt!357920 () SeekEntryResult!8377)

(declare-fun lt!357921 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-datatypes ((array!43510 0))(
  ( (array!43511 (arr!20830 (Array (_ BitVec 32) (_ BitVec 64))) (size!21250 (_ BitVec 32))) )
))
(declare-fun lt!357922 () array!43510)

(declare-fun lt!357926 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43510 (_ BitVec 32)) SeekEntryResult!8377)

(assert (=> b!801255 (= res!545231 (= lt!357920 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357921 vacantAfter!23 lt!357926 lt!357922 mask!3266)))))

(declare-fun b!801256 () Bool)

(declare-fun res!545238 () Bool)

(declare-fun e!444332 () Bool)

(assert (=> b!801256 (=> (not res!545238) (not e!444332))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun a!3170 () array!43510)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!801256 (= res!545238 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21250 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20830 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21250 a!3170)) (= (select (arr!20830 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801257 () Bool)

(assert (=> b!801257 (= e!444329 false)))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun lt!357923 () SeekEntryResult!8377)

(assert (=> b!801257 (= lt!357923 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!357921 vacantBefore!23 (select (arr!20830 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801258 () Bool)

(declare-fun e!444331 () Bool)

(declare-fun e!444330 () Bool)

(assert (=> b!801258 (= e!444331 e!444330)))

(declare-fun res!545233 () Bool)

(assert (=> b!801258 (=> (not res!545233) (not e!444330))))

(declare-fun lt!357925 () SeekEntryResult!8377)

(declare-fun lt!357919 () SeekEntryResult!8377)

(assert (=> b!801258 (= res!545233 (and (= lt!357919 lt!357925) (= lt!357925 (Found!8377 j!153)) (not (= (select (arr!20830 a!3170) index!1236) (select (arr!20830 a!3170) j!153)))))))

(assert (=> b!801258 (= lt!357925 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20830 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43510 (_ BitVec 32)) SeekEntryResult!8377)

(assert (=> b!801258 (= lt!357919 (seekEntryOrOpen!0 (select (arr!20830 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801259 () Bool)

(assert (=> b!801259 (= e!444332 e!444331)))

(declare-fun res!545234 () Bool)

(assert (=> b!801259 (=> (not res!545234) (not e!444331))))

(assert (=> b!801259 (= res!545234 (= lt!357920 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!357926 lt!357922 mask!3266)))))

(assert (=> b!801259 (= lt!357920 (seekEntryOrOpen!0 lt!357926 lt!357922 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!801259 (= lt!357926 (select (store (arr!20830 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801259 (= lt!357922 (array!43511 (store (arr!20830 a!3170) i!1163 k0!2044) (size!21250 a!3170)))))

(declare-fun b!801261 () Bool)

(assert (=> b!801261 (= e!444330 e!444329)))

(declare-fun res!545227 () Bool)

(assert (=> b!801261 (=> (not res!545227) (not e!444329))))

(assert (=> b!801261 (= res!545227 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!357921 #b00000000000000000000000000000000) (bvslt lt!357921 (size!21250 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801261 (= lt!357921 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!801262 () Bool)

(declare-fun res!545237 () Bool)

(declare-fun e!444334 () Bool)

(assert (=> b!801262 (=> (not res!545237) (not e!444334))))

(assert (=> b!801262 (= res!545237 (and (= (size!21250 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21250 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21250 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801263 () Bool)

(declare-fun res!545232 () Bool)

(assert (=> b!801263 (=> (not res!545232) (not e!444334))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801263 (= res!545232 (validKeyInArray!0 (select (arr!20830 a!3170) j!153)))))

(declare-fun b!801260 () Bool)

(declare-fun res!545236 () Bool)

(assert (=> b!801260 (=> (not res!545236) (not e!444334))))

(declare-fun arrayContainsKey!0 (array!43510 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801260 (= res!545236 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun res!545228 () Bool)

(assert (=> start!68888 (=> (not res!545228) (not e!444334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68888 (= res!545228 (validMask!0 mask!3266))))

(assert (=> start!68888 e!444334))

(assert (=> start!68888 true))

(declare-fun array_inv!16689 (array!43510) Bool)

(assert (=> start!68888 (array_inv!16689 a!3170)))

(declare-fun b!801264 () Bool)

(declare-fun res!545226 () Bool)

(assert (=> b!801264 (=> (not res!545226) (not e!444332))))

(declare-datatypes ((List!14700 0))(
  ( (Nil!14697) (Cons!14696 (h!15831 (_ BitVec 64)) (t!21007 List!14700)) )
))
(declare-fun arrayNoDuplicates!0 (array!43510 (_ BitVec 32) List!14700) Bool)

(assert (=> b!801264 (= res!545226 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14697))))

(declare-fun b!801265 () Bool)

(declare-fun res!545229 () Bool)

(assert (=> b!801265 (=> (not res!545229) (not e!444332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43510 (_ BitVec 32)) Bool)

(assert (=> b!801265 (= res!545229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!801266 () Bool)

(assert (=> b!801266 (= e!444334 e!444332)))

(declare-fun res!545235 () Bool)

(assert (=> b!801266 (=> (not res!545235) (not e!444332))))

(declare-fun lt!357924 () SeekEntryResult!8377)

(assert (=> b!801266 (= res!545235 (or (= lt!357924 (MissingZero!8377 i!1163)) (= lt!357924 (MissingVacant!8377 i!1163))))))

(assert (=> b!801266 (= lt!357924 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801267 () Bool)

(declare-fun res!545230 () Bool)

(assert (=> b!801267 (=> (not res!545230) (not e!444334))))

(assert (=> b!801267 (= res!545230 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68888 res!545228) b!801262))

(assert (= (and b!801262 res!545237) b!801263))

(assert (= (and b!801263 res!545232) b!801267))

(assert (= (and b!801267 res!545230) b!801260))

(assert (= (and b!801260 res!545236) b!801266))

(assert (= (and b!801266 res!545235) b!801265))

(assert (= (and b!801265 res!545229) b!801264))

(assert (= (and b!801264 res!545226) b!801256))

(assert (= (and b!801256 res!545238) b!801259))

(assert (= (and b!801259 res!545234) b!801258))

(assert (= (and b!801258 res!545233) b!801261))

(assert (= (and b!801261 res!545227) b!801255))

(assert (= (and b!801255 res!545231) b!801257))

(declare-fun m!742705 () Bool)

(assert (=> b!801260 m!742705))

(declare-fun m!742707 () Bool)

(assert (=> b!801255 m!742707))

(declare-fun m!742709 () Bool)

(assert (=> b!801265 m!742709))

(declare-fun m!742711 () Bool)

(assert (=> b!801258 m!742711))

(declare-fun m!742713 () Bool)

(assert (=> b!801258 m!742713))

(assert (=> b!801258 m!742713))

(declare-fun m!742715 () Bool)

(assert (=> b!801258 m!742715))

(assert (=> b!801258 m!742713))

(declare-fun m!742717 () Bool)

(assert (=> b!801258 m!742717))

(declare-fun m!742719 () Bool)

(assert (=> b!801261 m!742719))

(declare-fun m!742721 () Bool)

(assert (=> start!68888 m!742721))

(declare-fun m!742723 () Bool)

(assert (=> start!68888 m!742723))

(assert (=> b!801263 m!742713))

(assert (=> b!801263 m!742713))

(declare-fun m!742725 () Bool)

(assert (=> b!801263 m!742725))

(declare-fun m!742727 () Bool)

(assert (=> b!801256 m!742727))

(declare-fun m!742729 () Bool)

(assert (=> b!801256 m!742729))

(declare-fun m!742731 () Bool)

(assert (=> b!801266 m!742731))

(declare-fun m!742733 () Bool)

(assert (=> b!801267 m!742733))

(assert (=> b!801257 m!742713))

(assert (=> b!801257 m!742713))

(declare-fun m!742735 () Bool)

(assert (=> b!801257 m!742735))

(declare-fun m!742737 () Bool)

(assert (=> b!801264 m!742737))

(declare-fun m!742739 () Bool)

(assert (=> b!801259 m!742739))

(declare-fun m!742741 () Bool)

(assert (=> b!801259 m!742741))

(declare-fun m!742743 () Bool)

(assert (=> b!801259 m!742743))

(declare-fun m!742745 () Bool)

(assert (=> b!801259 m!742745))

(check-sat (not b!801257) (not b!801258) (not b!801261) (not b!801264) (not b!801265) (not start!68888) (not b!801266) (not b!801259) (not b!801263) (not b!801260) (not b!801267) (not b!801255))
(check-sat)
