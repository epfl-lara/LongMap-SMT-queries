; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!58194 () Bool)

(assert start!58194)

(declare-fun b!642832 () Bool)

(declare-fun res!416424 () Bool)

(declare-fun e!368171 () Bool)

(assert (=> b!642832 (=> (not res!416424) (not e!368171))))

(declare-datatypes ((array!38391 0))(
  ( (array!38392 (arr!18409 (Array (_ BitVec 32) (_ BitVec 64))) (size!18773 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!38391)

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!38391 (_ BitVec 32)) Bool)

(assert (=> b!642832 (= res!416424 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!642833 () Bool)

(declare-datatypes ((Unit!21729 0))(
  ( (Unit!21730) )
))
(declare-fun e!368167 () Unit!21729)

(declare-fun Unit!21731 () Unit!21729)

(assert (=> b!642833 (= e!368167 Unit!21731)))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun lt!297750 () array!38391)

(declare-fun lt!297741 () Unit!21729)

(declare-fun index!984 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!38391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21729)

(assert (=> b!642833 (= lt!297741 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297750 (select (arr!18409 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(declare-fun arrayContainsKey!0 (array!38391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!642833 (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun lt!297742 () Unit!21729)

(declare-datatypes ((List!12357 0))(
  ( (Nil!12354) (Cons!12353 (h!13401 (_ BitVec 64)) (t!18577 List!12357)) )
))
(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!38391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12357) Unit!21729)

(assert (=> b!642833 (= lt!297742 (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12354))))

(declare-fun arrayNoDuplicates!0 (array!38391 (_ BitVec 32) List!12357) Bool)

(assert (=> b!642833 (arrayNoDuplicates!0 lt!297750 #b00000000000000000000000000000000 Nil!12354)))

(declare-fun lt!297744 () Unit!21729)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!38391 (_ BitVec 32) (_ BitVec 32)) Unit!21729)

(assert (=> b!642833 (= lt!297744 (lemmaNoDuplicateFromThenFromBigger!0 lt!297750 #b00000000000000000000000000000000 j!136))))

(assert (=> b!642833 (arrayNoDuplicates!0 lt!297750 j!136 Nil!12354)))

(declare-fun lt!297747 () Unit!21729)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!38391 (_ BitVec 64) (_ BitVec 32) List!12357) Unit!21729)

(assert (=> b!642833 (= lt!297747 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297750 (select (arr!18409 a!2986) j!136) j!136 Nil!12354))))

(assert (=> b!642833 false))

(declare-fun b!642834 () Bool)

(declare-fun e!368162 () Bool)

(declare-fun e!368170 () Bool)

(assert (=> b!642834 (= e!368162 e!368170)))

(declare-fun res!416425 () Bool)

(assert (=> b!642834 (=> res!416425 e!368170)))

(declare-fun lt!297746 () (_ BitVec 64))

(declare-fun lt!297745 () (_ BitVec 64))

(assert (=> b!642834 (= res!416425 (or (not (= (select (arr!18409 a!2986) j!136) lt!297745)) (not (= (select (arr!18409 a!2986) j!136) lt!297746))))))

(declare-fun e!368160 () Bool)

(assert (=> b!642834 e!368160))

(declare-fun res!416431 () Bool)

(assert (=> b!642834 (=> (not res!416431) (not e!368160))))

(assert (=> b!642834 (= res!416431 (= lt!297746 (select (arr!18409 a!2986) j!136)))))

(assert (=> b!642834 (= lt!297746 (select (store (arr!18409 a!2986) i!1108 k0!1786) index!984))))

(declare-fun b!642835 () Bool)

(declare-fun e!368159 () Bool)

(assert (=> b!642835 (= e!368160 e!368159)))

(declare-fun res!416419 () Bool)

(assert (=> b!642835 (=> res!416419 e!368159)))

(assert (=> b!642835 (= res!416419 (or (not (= (select (arr!18409 a!2986) j!136) lt!297745)) (not (= (select (arr!18409 a!2986) j!136) lt!297746)) (bvsge j!136 index!984)))))

(declare-fun b!642836 () Bool)

(declare-fun res!416433 () Bool)

(declare-fun e!368166 () Bool)

(assert (=> b!642836 (=> (not res!416433) (not e!368166))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!642836 (= res!416433 (validKeyInArray!0 k0!1786))))

(declare-fun b!642837 () Bool)

(declare-fun res!416434 () Bool)

(assert (=> b!642837 (=> (not res!416434) (not e!368171))))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(assert (=> b!642837 (= res!416434 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd mask!3053 #b00000000000000000000000000000001)) (= (select (arr!18409 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!642838 () Bool)

(declare-fun e!368164 () Bool)

(assert (=> b!642838 (= e!368171 e!368164)))

(declare-fun res!416421 () Bool)

(assert (=> b!642838 (=> (not res!416421) (not e!368164))))

(assert (=> b!642838 (= res!416421 (= (select (store (arr!18409 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!642838 (= lt!297750 (array!38392 (store (arr!18409 a!2986) i!1108 k0!1786) (size!18773 a!2986)))))

(declare-fun b!642840 () Bool)

(declare-fun e!368168 () Unit!21729)

(declare-fun Unit!21732 () Unit!21729)

(assert (=> b!642840 (= e!368168 Unit!21732)))

(assert (=> b!642840 false))

(declare-fun b!642841 () Bool)

(declare-fun res!416432 () Bool)

(assert (=> b!642841 (=> (not res!416432) (not e!368166))))

(assert (=> b!642841 (= res!416432 (validKeyInArray!0 (select (arr!18409 a!2986) j!136)))))

(declare-fun b!642842 () Bool)

(declare-fun e!368161 () Bool)

(assert (=> b!642842 (= e!368170 e!368161)))

(declare-fun res!416423 () Bool)

(assert (=> b!642842 (=> res!416423 e!368161)))

(assert (=> b!642842 (= res!416423 (bvsge index!984 j!136))))

(declare-fun lt!297740 () Unit!21729)

(assert (=> b!642842 (= lt!297740 e!368167)))

(declare-fun c!73577 () Bool)

(assert (=> b!642842 (= c!73577 (bvslt j!136 index!984))))

(declare-fun b!642843 () Bool)

(assert (=> b!642843 (= e!368166 e!368171)))

(declare-fun res!416427 () Bool)

(assert (=> b!642843 (=> (not res!416427) (not e!368171))))

(declare-datatypes ((SeekEntryResult!6805 0))(
  ( (MissingZero!6805 (index!29546 (_ BitVec 32))) (Found!6805 (index!29547 (_ BitVec 32))) (Intermediate!6805 (undefined!7617 Bool) (index!29548 (_ BitVec 32)) (x!58462 (_ BitVec 32))) (Undefined!6805) (MissingVacant!6805 (index!29549 (_ BitVec 32))) )
))
(declare-fun lt!297751 () SeekEntryResult!6805)

(assert (=> b!642843 (= res!416427 (or (= lt!297751 (MissingZero!6805 i!1108)) (= lt!297751 (MissingVacant!6805 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!38391 (_ BitVec 32)) SeekEntryResult!6805)

(assert (=> b!642843 (= lt!297751 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!642844 () Bool)

(assert (=> b!642844 (= e!368161 (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) j!136))))

(declare-fun b!642845 () Bool)

(declare-fun Unit!21733 () Unit!21729)

(assert (=> b!642845 (= e!368168 Unit!21733)))

(declare-fun b!642846 () Bool)

(declare-fun Unit!21734 () Unit!21729)

(assert (=> b!642846 (= e!368167 Unit!21734)))

(declare-fun b!642847 () Bool)

(declare-fun res!416430 () Bool)

(assert (=> b!642847 (=> (not res!416430) (not e!368171))))

(assert (=> b!642847 (= res!416430 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12354))))

(declare-fun b!642848 () Bool)

(declare-fun e!368165 () Bool)

(assert (=> b!642848 (= e!368164 e!368165)))

(declare-fun res!416420 () Bool)

(assert (=> b!642848 (=> (not res!416420) (not e!368165))))

(declare-fun lt!297737 () SeekEntryResult!6805)

(assert (=> b!642848 (= res!416420 (and (= lt!297737 (Found!6805 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!18409 a!2986) index!984) (select (arr!18409 a!2986) j!136))) (not (= (select (arr!18409 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38391 (_ BitVec 32)) SeekEntryResult!6805)

(assert (=> b!642848 (= lt!297737 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18409 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!642849 () Bool)

(declare-fun e!368163 () Bool)

(assert (=> b!642849 (= e!368159 e!368163)))

(declare-fun res!416417 () Bool)

(assert (=> b!642849 (=> (not res!416417) (not e!368163))))

(assert (=> b!642849 (= res!416417 (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) j!136))))

(declare-fun b!642850 () Bool)

(declare-fun res!416418 () Bool)

(assert (=> b!642850 (=> (not res!416418) (not e!368166))))

(assert (=> b!642850 (= res!416418 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!642851 () Bool)

(declare-fun res!416429 () Bool)

(assert (=> b!642851 (=> (not res!416429) (not e!368166))))

(assert (=> b!642851 (= res!416429 (and (= (size!18773 a!2986) (bvadd mask!3053 #b00000000000000000000000000000001)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18773 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18773 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!642852 () Bool)

(assert (=> b!642852 (= e!368165 (not e!368162))))

(declare-fun res!416422 () Bool)

(assert (=> b!642852 (=> res!416422 e!368162)))

(declare-fun lt!297748 () SeekEntryResult!6805)

(assert (=> b!642852 (= res!416422 (not (= lt!297748 (Found!6805 index!984))))))

(declare-fun lt!297738 () Unit!21729)

(assert (=> b!642852 (= lt!297738 e!368168)))

(declare-fun c!73576 () Bool)

(assert (=> b!642852 (= c!73576 (= lt!297748 Undefined!6805))))

(assert (=> b!642852 (= lt!297748 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297745 lt!297750 mask!3053))))

(declare-fun e!368172 () Bool)

(assert (=> b!642852 e!368172))

(declare-fun res!416426 () Bool)

(assert (=> b!642852 (=> (not res!416426) (not e!368172))))

(declare-fun lt!297743 () (_ BitVec 32))

(declare-fun lt!297739 () SeekEntryResult!6805)

(assert (=> b!642852 (= res!416426 (= lt!297739 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297743 vacantSpotIndex!68 lt!297745 lt!297750 mask!3053)))))

(assert (=> b!642852 (= lt!297739 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297743 vacantSpotIndex!68 (select (arr!18409 a!2986) j!136) a!2986 mask!3053))))

(assert (=> b!642852 (= lt!297745 (select (store (arr!18409 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!297749 () Unit!21729)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!38391 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21729)

(assert (=> b!642852 (= lt!297749 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297743 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!642852 (= lt!297743 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!642853 () Bool)

(assert (=> b!642853 (= e!368172 (= lt!297737 lt!297739))))

(declare-fun res!416428 () Bool)

(assert (=> start!58194 (=> (not res!416428) (not e!368166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!58194 (= res!416428 (validMask!0 mask!3053))))

(assert (=> start!58194 e!368166))

(assert (=> start!58194 true))

(declare-fun array_inv!14268 (array!38391) Bool)

(assert (=> start!58194 (array_inv!14268 a!2986)))

(declare-fun b!642839 () Bool)

(assert (=> b!642839 (= e!368163 (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) index!984))))

(assert (= (and start!58194 res!416428) b!642851))

(assert (= (and b!642851 res!416429) b!642841))

(assert (= (and b!642841 res!416432) b!642836))

(assert (= (and b!642836 res!416433) b!642850))

(assert (= (and b!642850 res!416418) b!642843))

(assert (= (and b!642843 res!416427) b!642832))

(assert (= (and b!642832 res!416424) b!642847))

(assert (= (and b!642847 res!416430) b!642837))

(assert (= (and b!642837 res!416434) b!642838))

(assert (= (and b!642838 res!416421) b!642848))

(assert (= (and b!642848 res!416420) b!642852))

(assert (= (and b!642852 res!416426) b!642853))

(assert (= (and b!642852 c!73576) b!642840))

(assert (= (and b!642852 (not c!73576)) b!642845))

(assert (= (and b!642852 (not res!416422)) b!642834))

(assert (= (and b!642834 res!416431) b!642835))

(assert (= (and b!642835 (not res!416419)) b!642849))

(assert (= (and b!642849 res!416417) b!642839))

(assert (= (and b!642834 (not res!416425)) b!642842))

(assert (= (and b!642842 c!73577) b!642833))

(assert (= (and b!642842 (not c!73577)) b!642846))

(assert (= (and b!642842 (not res!416423)) b!642844))

(declare-fun m!616999 () Bool)

(assert (=> b!642834 m!616999))

(declare-fun m!617001 () Bool)

(assert (=> b!642834 m!617001))

(declare-fun m!617003 () Bool)

(assert (=> b!642834 m!617003))

(assert (=> b!642841 m!616999))

(assert (=> b!642841 m!616999))

(declare-fun m!617005 () Bool)

(assert (=> b!642841 m!617005))

(declare-fun m!617007 () Bool)

(assert (=> b!642850 m!617007))

(assert (=> b!642844 m!616999))

(assert (=> b!642844 m!616999))

(declare-fun m!617009 () Bool)

(assert (=> b!642844 m!617009))

(assert (=> b!642835 m!616999))

(assert (=> b!642839 m!616999))

(assert (=> b!642839 m!616999))

(declare-fun m!617011 () Bool)

(assert (=> b!642839 m!617011))

(declare-fun m!617013 () Bool)

(assert (=> start!58194 m!617013))

(declare-fun m!617015 () Bool)

(assert (=> start!58194 m!617015))

(assert (=> b!642849 m!616999))

(assert (=> b!642849 m!616999))

(assert (=> b!642849 m!617009))

(declare-fun m!617017 () Bool)

(assert (=> b!642832 m!617017))

(declare-fun m!617019 () Bool)

(assert (=> b!642837 m!617019))

(declare-fun m!617021 () Bool)

(assert (=> b!642848 m!617021))

(assert (=> b!642848 m!616999))

(assert (=> b!642848 m!616999))

(declare-fun m!617023 () Bool)

(assert (=> b!642848 m!617023))

(declare-fun m!617025 () Bool)

(assert (=> b!642836 m!617025))

(assert (=> b!642838 m!617001))

(declare-fun m!617027 () Bool)

(assert (=> b!642838 m!617027))

(declare-fun m!617029 () Bool)

(assert (=> b!642843 m!617029))

(assert (=> b!642833 m!616999))

(declare-fun m!617031 () Bool)

(assert (=> b!642833 m!617031))

(assert (=> b!642833 m!616999))

(declare-fun m!617033 () Bool)

(assert (=> b!642833 m!617033))

(assert (=> b!642833 m!616999))

(declare-fun m!617035 () Bool)

(assert (=> b!642833 m!617035))

(declare-fun m!617037 () Bool)

(assert (=> b!642833 m!617037))

(declare-fun m!617039 () Bool)

(assert (=> b!642833 m!617039))

(assert (=> b!642833 m!616999))

(declare-fun m!617041 () Bool)

(assert (=> b!642833 m!617041))

(declare-fun m!617043 () Bool)

(assert (=> b!642833 m!617043))

(declare-fun m!617045 () Bool)

(assert (=> b!642847 m!617045))

(declare-fun m!617047 () Bool)

(assert (=> b!642852 m!617047))

(declare-fun m!617049 () Bool)

(assert (=> b!642852 m!617049))

(declare-fun m!617051 () Bool)

(assert (=> b!642852 m!617051))

(assert (=> b!642852 m!616999))

(declare-fun m!617053 () Bool)

(assert (=> b!642852 m!617053))

(declare-fun m!617055 () Bool)

(assert (=> b!642852 m!617055))

(assert (=> b!642852 m!617001))

(assert (=> b!642852 m!616999))

(declare-fun m!617057 () Bool)

(assert (=> b!642852 m!617057))

(check-sat (not b!642832) (not start!58194) (not b!642836) (not b!642852) (not b!642833) (not b!642844) (not b!642841) (not b!642850) (not b!642843) (not b!642849) (not b!642839) (not b!642847) (not b!642848))
(check-sat)
(get-model)

(declare-fun b!642998 () Bool)

(declare-fun c!73598 () Bool)

(declare-fun lt!297846 () (_ BitVec 64))

(assert (=> b!642998 (= c!73598 (= lt!297846 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368265 () SeekEntryResult!6805)

(declare-fun e!368264 () SeekEntryResult!6805)

(assert (=> b!642998 (= e!368265 e!368264)))

(declare-fun b!642999 () Bool)

(assert (=> b!642999 (= e!368265 (Found!6805 index!984))))

(declare-fun b!643000 () Bool)

(assert (=> b!643000 (= e!368264 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18409 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643001 () Bool)

(assert (=> b!643001 (= e!368264 (MissingVacant!6805 vacantSpotIndex!68))))

(declare-fun b!643003 () Bool)

(declare-fun e!368263 () SeekEntryResult!6805)

(assert (=> b!643003 (= e!368263 Undefined!6805)))

(declare-fun b!643002 () Bool)

(assert (=> b!643002 (= e!368263 e!368265)))

(declare-fun c!73597 () Bool)

(assert (=> b!643002 (= c!73597 (= lt!297846 (select (arr!18409 a!2986) j!136)))))

(declare-fun d!90905 () Bool)

(declare-fun lt!297847 () SeekEntryResult!6805)

(get-info :version)

(assert (=> d!90905 (and (or ((_ is Undefined!6805) lt!297847) (not ((_ is Found!6805) lt!297847)) (and (bvsge (index!29547 lt!297847) #b00000000000000000000000000000000) (bvslt (index!29547 lt!297847) (size!18773 a!2986)))) (or ((_ is Undefined!6805) lt!297847) ((_ is Found!6805) lt!297847) (not ((_ is MissingVacant!6805) lt!297847)) (not (= (index!29549 lt!297847) vacantSpotIndex!68)) (and (bvsge (index!29549 lt!297847) #b00000000000000000000000000000000) (bvslt (index!29549 lt!297847) (size!18773 a!2986)))) (or ((_ is Undefined!6805) lt!297847) (ite ((_ is Found!6805) lt!297847) (= (select (arr!18409 a!2986) (index!29547 lt!297847)) (select (arr!18409 a!2986) j!136)) (and ((_ is MissingVacant!6805) lt!297847) (= (index!29549 lt!297847) vacantSpotIndex!68) (= (select (arr!18409 a!2986) (index!29549 lt!297847)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90905 (= lt!297847 e!368263)))

(declare-fun c!73596 () Bool)

(assert (=> d!90905 (= c!73596 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90905 (= lt!297846 (select (arr!18409 a!2986) index!984))))

(assert (=> d!90905 (validMask!0 mask!3053)))

(assert (=> d!90905 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!18409 a!2986) j!136) a!2986 mask!3053) lt!297847)))

(assert (= (and d!90905 c!73596) b!643003))

(assert (= (and d!90905 (not c!73596)) b!643002))

(assert (= (and b!643002 c!73597) b!642999))

(assert (= (and b!643002 (not c!73597)) b!642998))

(assert (= (and b!642998 c!73598) b!643001))

(assert (= (and b!642998 (not c!73598)) b!643000))

(declare-fun m!617179 () Bool)

(assert (=> b!643000 m!617179))

(assert (=> b!643000 m!617179))

(assert (=> b!643000 m!616999))

(declare-fun m!617181 () Bool)

(assert (=> b!643000 m!617181))

(declare-fun m!617183 () Bool)

(assert (=> d!90905 m!617183))

(declare-fun m!617185 () Bool)

(assert (=> d!90905 m!617185))

(assert (=> d!90905 m!617021))

(assert (=> d!90905 m!617013))

(assert (=> b!642848 d!90905))

(declare-fun d!90907 () Bool)

(assert (=> d!90907 (= (validKeyInArray!0 k0!1786) (and (not (= k0!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!642836 d!90907))

(declare-fun b!643014 () Bool)

(declare-fun e!368277 () Bool)

(declare-fun contains!3119 (List!12357 (_ BitVec 64)) Bool)

(assert (=> b!643014 (= e!368277 (contains!3119 Nil!12354 (select (arr!18409 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643015 () Bool)

(declare-fun e!368275 () Bool)

(declare-fun e!368274 () Bool)

(assert (=> b!643015 (= e!368275 e!368274)))

(declare-fun res!416550 () Bool)

(assert (=> b!643015 (=> (not res!416550) (not e!368274))))

(assert (=> b!643015 (= res!416550 (not e!368277))))

(declare-fun res!416551 () Bool)

(assert (=> b!643015 (=> (not res!416551) (not e!368277))))

(assert (=> b!643015 (= res!416551 (validKeyInArray!0 (select (arr!18409 a!2986) #b00000000000000000000000000000000)))))

(declare-fun b!643016 () Bool)

(declare-fun e!368276 () Bool)

(assert (=> b!643016 (= e!368274 e!368276)))

(declare-fun c!73601 () Bool)

(assert (=> b!643016 (= c!73601 (validKeyInArray!0 (select (arr!18409 a!2986) #b00000000000000000000000000000000)))))

(declare-fun bm!33567 () Bool)

(declare-fun call!33570 () Bool)

(assert (=> bm!33567 (= call!33570 (arrayNoDuplicates!0 a!2986 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73601 (Cons!12353 (select (arr!18409 a!2986) #b00000000000000000000000000000000) Nil!12354) Nil!12354)))))

(declare-fun b!643017 () Bool)

(assert (=> b!643017 (= e!368276 call!33570)))

(declare-fun d!90909 () Bool)

(declare-fun res!416549 () Bool)

(assert (=> d!90909 (=> res!416549 e!368275)))

(assert (=> d!90909 (= res!416549 (bvsge #b00000000000000000000000000000000 (size!18773 a!2986)))))

(assert (=> d!90909 (= (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!12354) e!368275)))

(declare-fun b!643018 () Bool)

(assert (=> b!643018 (= e!368276 call!33570)))

(assert (= (and d!90909 (not res!416549)) b!643015))

(assert (= (and b!643015 res!416551) b!643014))

(assert (= (and b!643015 res!416550) b!643016))

(assert (= (and b!643016 c!73601) b!643017))

(assert (= (and b!643016 (not c!73601)) b!643018))

(assert (= (or b!643017 b!643018) bm!33567))

(declare-fun m!617187 () Bool)

(assert (=> b!643014 m!617187))

(assert (=> b!643014 m!617187))

(declare-fun m!617189 () Bool)

(assert (=> b!643014 m!617189))

(assert (=> b!643015 m!617187))

(assert (=> b!643015 m!617187))

(declare-fun m!617191 () Bool)

(assert (=> b!643015 m!617191))

(assert (=> b!643016 m!617187))

(assert (=> b!643016 m!617187))

(assert (=> b!643016 m!617191))

(assert (=> bm!33567 m!617187))

(declare-fun m!617193 () Bool)

(assert (=> bm!33567 m!617193))

(assert (=> b!642847 d!90909))

(declare-fun d!90911 () Bool)

(declare-fun res!416556 () Bool)

(declare-fun e!368282 () Bool)

(assert (=> d!90911 (=> res!416556 e!368282)))

(assert (=> d!90911 (= res!416556 (= (select (arr!18409 lt!297750) j!136) (select (arr!18409 a!2986) j!136)))))

(assert (=> d!90911 (= (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) j!136) e!368282)))

(declare-fun b!643023 () Bool)

(declare-fun e!368283 () Bool)

(assert (=> b!643023 (= e!368282 e!368283)))

(declare-fun res!416557 () Bool)

(assert (=> b!643023 (=> (not res!416557) (not e!368283))))

(assert (=> b!643023 (= res!416557 (bvslt (bvadd j!136 #b00000000000000000000000000000001) (size!18773 lt!297750)))))

(declare-fun b!643024 () Bool)

(assert (=> b!643024 (= e!368283 (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) (bvadd j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90911 (not res!416556)) b!643023))

(assert (= (and b!643023 res!416557) b!643024))

(declare-fun m!617195 () Bool)

(assert (=> d!90911 m!617195))

(assert (=> b!643024 m!616999))

(declare-fun m!617197 () Bool)

(assert (=> b!643024 m!617197))

(assert (=> b!642844 d!90911))

(declare-fun d!90913 () Bool)

(assert (=> d!90913 (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18773 lt!297750)) (not (= (select (arr!18409 lt!297750) j!136) (select (arr!18409 a!2986) j!136))))))

(declare-fun lt!297850 () Unit!21729)

(declare-fun choose!21 (array!38391 (_ BitVec 64) (_ BitVec 32) List!12357) Unit!21729)

(assert (=> d!90913 (= lt!297850 (choose!21 lt!297750 (select (arr!18409 a!2986) j!136) j!136 Nil!12354))))

(assert (=> d!90913 (bvslt (size!18773 lt!297750) #b01111111111111111111111111111111)))

(assert (=> d!90913 (= (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 lt!297750 (select (arr!18409 a!2986) j!136) j!136 Nil!12354) lt!297850)))

(declare-fun bs!19247 () Bool)

(assert (= bs!19247 d!90913))

(assert (=> bs!19247 m!617195))

(assert (=> bs!19247 m!616999))

(declare-fun m!617199 () Bool)

(assert (=> bs!19247 m!617199))

(assert (=> b!642833 d!90913))

(declare-fun b!643029 () Bool)

(declare-fun e!368291 () Bool)

(assert (=> b!643029 (= e!368291 (contains!3119 Nil!12354 (select (arr!18409 lt!297750) j!136)))))

(declare-fun b!643030 () Bool)

(declare-fun e!368289 () Bool)

(declare-fun e!368288 () Bool)

(assert (=> b!643030 (= e!368289 e!368288)))

(declare-fun res!416563 () Bool)

(assert (=> b!643030 (=> (not res!416563) (not e!368288))))

(assert (=> b!643030 (= res!416563 (not e!368291))))

(declare-fun res!416564 () Bool)

(assert (=> b!643030 (=> (not res!416564) (not e!368291))))

(assert (=> b!643030 (= res!416564 (validKeyInArray!0 (select (arr!18409 lt!297750) j!136)))))

(declare-fun b!643031 () Bool)

(declare-fun e!368290 () Bool)

(assert (=> b!643031 (= e!368288 e!368290)))

(declare-fun c!73602 () Bool)

(assert (=> b!643031 (= c!73602 (validKeyInArray!0 (select (arr!18409 lt!297750) j!136)))))

(declare-fun call!33571 () Bool)

(declare-fun bm!33568 () Bool)

(assert (=> bm!33568 (= call!33571 (arrayNoDuplicates!0 lt!297750 (bvadd j!136 #b00000000000000000000000000000001) (ite c!73602 (Cons!12353 (select (arr!18409 lt!297750) j!136) Nil!12354) Nil!12354)))))

(declare-fun b!643032 () Bool)

(assert (=> b!643032 (= e!368290 call!33571)))

(declare-fun d!90917 () Bool)

(declare-fun res!416562 () Bool)

(assert (=> d!90917 (=> res!416562 e!368289)))

(assert (=> d!90917 (= res!416562 (bvsge j!136 (size!18773 lt!297750)))))

(assert (=> d!90917 (= (arrayNoDuplicates!0 lt!297750 j!136 Nil!12354) e!368289)))

(declare-fun b!643033 () Bool)

(assert (=> b!643033 (= e!368290 call!33571)))

(assert (= (and d!90917 (not res!416562)) b!643030))

(assert (= (and b!643030 res!416564) b!643029))

(assert (= (and b!643030 res!416563) b!643031))

(assert (= (and b!643031 c!73602) b!643032))

(assert (= (and b!643031 (not c!73602)) b!643033))

(assert (= (or b!643032 b!643033) bm!33568))

(assert (=> b!643029 m!617195))

(assert (=> b!643029 m!617195))

(declare-fun m!617201 () Bool)

(assert (=> b!643029 m!617201))

(assert (=> b!643030 m!617195))

(assert (=> b!643030 m!617195))

(declare-fun m!617205 () Bool)

(assert (=> b!643030 m!617205))

(assert (=> b!643031 m!617195))

(assert (=> b!643031 m!617195))

(assert (=> b!643031 m!617205))

(assert (=> bm!33568 m!617195))

(declare-fun m!617209 () Bool)

(assert (=> bm!33568 m!617209))

(assert (=> b!642833 d!90917))

(declare-fun d!90921 () Bool)

(assert (=> d!90921 (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136))))

(declare-fun lt!297853 () Unit!21729)

(declare-fun choose!114 (array!38391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!21729)

(assert (=> d!90921 (= lt!297853 (choose!114 lt!297750 (select (arr!18409 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)))))

(assert (=> d!90921 (bvsge index!984 #b00000000000000000000000000000000)))

(assert (=> d!90921 (= (lemmaArrayContainsFromImpliesContainsFromSmaller!0 lt!297750 (select (arr!18409 a!2986) j!136) index!984 (bvadd #b00000000000000000000000000000001 j!136)) lt!297853)))

(declare-fun bs!19248 () Bool)

(assert (= bs!19248 d!90921))

(assert (=> bs!19248 m!616999))

(assert (=> bs!19248 m!617035))

(assert (=> bs!19248 m!616999))

(declare-fun m!617211 () Bool)

(assert (=> bs!19248 m!617211))

(assert (=> b!642833 d!90921))

(declare-fun d!90925 () Bool)

(assert (=> d!90925 (arrayNoDuplicates!0 lt!297750 j!136 Nil!12354)))

(declare-fun lt!297856 () Unit!21729)

(declare-fun choose!39 (array!38391 (_ BitVec 32) (_ BitVec 32)) Unit!21729)

(assert (=> d!90925 (= lt!297856 (choose!39 lt!297750 #b00000000000000000000000000000000 j!136))))

(assert (=> d!90925 (bvslt (size!18773 lt!297750) #b01111111111111111111111111111111)))

(assert (=> d!90925 (= (lemmaNoDuplicateFromThenFromBigger!0 lt!297750 #b00000000000000000000000000000000 j!136) lt!297856)))

(declare-fun bs!19249 () Bool)

(assert (= bs!19249 d!90925))

(assert (=> bs!19249 m!617033))

(declare-fun m!617221 () Bool)

(assert (=> bs!19249 m!617221))

(assert (=> b!642833 d!90925))

(declare-fun b!643051 () Bool)

(declare-fun e!368309 () Bool)

(assert (=> b!643051 (= e!368309 (contains!3119 Nil!12354 (select (arr!18409 lt!297750) #b00000000000000000000000000000000)))))

(declare-fun b!643052 () Bool)

(declare-fun e!368307 () Bool)

(declare-fun e!368306 () Bool)

(assert (=> b!643052 (= e!368307 e!368306)))

(declare-fun res!416577 () Bool)

(assert (=> b!643052 (=> (not res!416577) (not e!368306))))

(assert (=> b!643052 (= res!416577 (not e!368309))))

(declare-fun res!416578 () Bool)

(assert (=> b!643052 (=> (not res!416578) (not e!368309))))

(assert (=> b!643052 (= res!416578 (validKeyInArray!0 (select (arr!18409 lt!297750) #b00000000000000000000000000000000)))))

(declare-fun b!643053 () Bool)

(declare-fun e!368308 () Bool)

(assert (=> b!643053 (= e!368306 e!368308)))

(declare-fun c!73606 () Bool)

(assert (=> b!643053 (= c!73606 (validKeyInArray!0 (select (arr!18409 lt!297750) #b00000000000000000000000000000000)))))

(declare-fun bm!33572 () Bool)

(declare-fun call!33575 () Bool)

(assert (=> bm!33572 (= call!33575 (arrayNoDuplicates!0 lt!297750 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!73606 (Cons!12353 (select (arr!18409 lt!297750) #b00000000000000000000000000000000) Nil!12354) Nil!12354)))))

(declare-fun b!643054 () Bool)

(assert (=> b!643054 (= e!368308 call!33575)))

(declare-fun d!90929 () Bool)

(declare-fun res!416576 () Bool)

(assert (=> d!90929 (=> res!416576 e!368307)))

(assert (=> d!90929 (= res!416576 (bvsge #b00000000000000000000000000000000 (size!18773 lt!297750)))))

(assert (=> d!90929 (= (arrayNoDuplicates!0 lt!297750 #b00000000000000000000000000000000 Nil!12354) e!368307)))

(declare-fun b!643055 () Bool)

(assert (=> b!643055 (= e!368308 call!33575)))

(assert (= (and d!90929 (not res!416576)) b!643052))

(assert (= (and b!643052 res!416578) b!643051))

(assert (= (and b!643052 res!416577) b!643053))

(assert (= (and b!643053 c!73606) b!643054))

(assert (= (and b!643053 (not c!73606)) b!643055))

(assert (= (or b!643054 b!643055) bm!33572))

(declare-fun m!617223 () Bool)

(assert (=> b!643051 m!617223))

(assert (=> b!643051 m!617223))

(declare-fun m!617225 () Bool)

(assert (=> b!643051 m!617225))

(assert (=> b!643052 m!617223))

(assert (=> b!643052 m!617223))

(declare-fun m!617227 () Bool)

(assert (=> b!643052 m!617227))

(assert (=> b!643053 m!617223))

(assert (=> b!643053 m!617223))

(assert (=> b!643053 m!617227))

(assert (=> bm!33572 m!617223))

(declare-fun m!617229 () Bool)

(assert (=> bm!33572 m!617229))

(assert (=> b!642833 d!90929))

(declare-fun d!90931 () Bool)

(declare-fun e!368312 () Bool)

(assert (=> d!90931 e!368312))

(declare-fun res!416581 () Bool)

(assert (=> d!90931 (=> (not res!416581) (not e!368312))))

(assert (=> d!90931 (= res!416581 (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18773 a!2986))))))

(declare-fun lt!297859 () Unit!21729)

(declare-fun choose!41 (array!38391 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!12357) Unit!21729)

(assert (=> d!90931 (= lt!297859 (choose!41 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12354))))

(assert (=> d!90931 (bvslt (size!18773 a!2986) #b01111111111111111111111111111111)))

(assert (=> d!90931 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 a!2986 k0!1786 i!1108 #b00000000000000000000000000000000 Nil!12354) lt!297859)))

(declare-fun b!643058 () Bool)

(assert (=> b!643058 (= e!368312 (arrayNoDuplicates!0 (array!38392 (store (arr!18409 a!2986) i!1108 k0!1786) (size!18773 a!2986)) #b00000000000000000000000000000000 Nil!12354))))

(assert (= (and d!90931 res!416581) b!643058))

(declare-fun m!617231 () Bool)

(assert (=> d!90931 m!617231))

(assert (=> b!643058 m!617001))

(declare-fun m!617233 () Bool)

(assert (=> b!643058 m!617233))

(assert (=> b!642833 d!90931))

(declare-fun d!90933 () Bool)

(declare-fun res!416582 () Bool)

(declare-fun e!368313 () Bool)

(assert (=> d!90933 (=> res!416582 e!368313)))

(assert (=> d!90933 (= res!416582 (= (select (arr!18409 lt!297750) (bvadd #b00000000000000000000000000000001 j!136)) (select (arr!18409 a!2986) j!136)))))

(assert (=> d!90933 (= (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136)) e!368313)))

(declare-fun b!643059 () Bool)

(declare-fun e!368314 () Bool)

(assert (=> b!643059 (= e!368313 e!368314)))

(declare-fun res!416583 () Bool)

(assert (=> b!643059 (=> (not res!416583) (not e!368314))))

(assert (=> b!643059 (= res!416583 (bvslt (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001) (size!18773 lt!297750)))))

(declare-fun b!643060 () Bool)

(assert (=> b!643060 (= e!368314 (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) (bvadd #b00000000000000000000000000000001 j!136 #b00000000000000000000000000000001)))))

(assert (= (and d!90933 (not res!416582)) b!643059))

(assert (= (and b!643059 res!416583) b!643060))

(declare-fun m!617235 () Bool)

(assert (=> d!90933 m!617235))

(assert (=> b!643060 m!616999))

(declare-fun m!617237 () Bool)

(assert (=> b!643060 m!617237))

(assert (=> b!642833 d!90933))

(declare-fun b!643091 () Bool)

(declare-fun e!368335 () Bool)

(declare-fun call!33578 () Bool)

(assert (=> b!643091 (= e!368335 call!33578)))

(declare-fun bm!33575 () Bool)

(assert (=> bm!33575 (= call!33578 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!643092 () Bool)

(declare-fun e!368334 () Bool)

(assert (=> b!643092 (= e!368334 call!33578)))

(declare-fun b!643093 () Bool)

(assert (=> b!643093 (= e!368335 e!368334)))

(declare-fun lt!297875 () (_ BitVec 64))

(assert (=> b!643093 (= lt!297875 (select (arr!18409 a!2986) #b00000000000000000000000000000000))))

(declare-fun lt!297877 () Unit!21729)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!38391 (_ BitVec 64) (_ BitVec 32)) Unit!21729)

(assert (=> b!643093 (= lt!297877 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!297875 #b00000000000000000000000000000000))))

(assert (=> b!643093 (arrayContainsKey!0 a!2986 lt!297875 #b00000000000000000000000000000000)))

(declare-fun lt!297876 () Unit!21729)

(assert (=> b!643093 (= lt!297876 lt!297877)))

(declare-fun res!416592 () Bool)

(assert (=> b!643093 (= res!416592 (= (seekEntryOrOpen!0 (select (arr!18409 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!6805 #b00000000000000000000000000000000)))))

(assert (=> b!643093 (=> (not res!416592) (not e!368334))))

(declare-fun b!643094 () Bool)

(declare-fun e!368336 () Bool)

(assert (=> b!643094 (= e!368336 e!368335)))

(declare-fun c!73618 () Bool)

(assert (=> b!643094 (= c!73618 (validKeyInArray!0 (select (arr!18409 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!90935 () Bool)

(declare-fun res!416593 () Bool)

(assert (=> d!90935 (=> res!416593 e!368336)))

(assert (=> d!90935 (= res!416593 (bvsge #b00000000000000000000000000000000 (size!18773 a!2986)))))

(assert (=> d!90935 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!368336)))

(assert (= (and d!90935 (not res!416593)) b!643094))

(assert (= (and b!643094 c!73618) b!643093))

(assert (= (and b!643094 (not c!73618)) b!643091))

(assert (= (and b!643093 res!416592) b!643092))

(assert (= (or b!643092 b!643091) bm!33575))

(declare-fun m!617259 () Bool)

(assert (=> bm!33575 m!617259))

(assert (=> b!643093 m!617187))

(declare-fun m!617261 () Bool)

(assert (=> b!643093 m!617261))

(declare-fun m!617263 () Bool)

(assert (=> b!643093 m!617263))

(assert (=> b!643093 m!617187))

(declare-fun m!617265 () Bool)

(assert (=> b!643093 m!617265))

(assert (=> b!643094 m!617187))

(assert (=> b!643094 m!617187))

(assert (=> b!643094 m!617191))

(assert (=> b!642832 d!90935))

(declare-fun d!90943 () Bool)

(assert (=> d!90943 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!58194 d!90943))

(declare-fun d!90947 () Bool)

(assert (=> d!90947 (= (array_inv!14268 a!2986) (bvsge (size!18773 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!58194 d!90947))

(declare-fun d!90949 () Bool)

(declare-fun lt!297910 () SeekEntryResult!6805)

(assert (=> d!90949 (and (or ((_ is Undefined!6805) lt!297910) (not ((_ is Found!6805) lt!297910)) (and (bvsge (index!29547 lt!297910) #b00000000000000000000000000000000) (bvslt (index!29547 lt!297910) (size!18773 a!2986)))) (or ((_ is Undefined!6805) lt!297910) ((_ is Found!6805) lt!297910) (not ((_ is MissingZero!6805) lt!297910)) (and (bvsge (index!29546 lt!297910) #b00000000000000000000000000000000) (bvslt (index!29546 lt!297910) (size!18773 a!2986)))) (or ((_ is Undefined!6805) lt!297910) ((_ is Found!6805) lt!297910) ((_ is MissingZero!6805) lt!297910) (not ((_ is MissingVacant!6805) lt!297910)) (and (bvsge (index!29549 lt!297910) #b00000000000000000000000000000000) (bvslt (index!29549 lt!297910) (size!18773 a!2986)))) (or ((_ is Undefined!6805) lt!297910) (ite ((_ is Found!6805) lt!297910) (= (select (arr!18409 a!2986) (index!29547 lt!297910)) k0!1786) (ite ((_ is MissingZero!6805) lt!297910) (= (select (arr!18409 a!2986) (index!29546 lt!297910)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!6805) lt!297910) (= (select (arr!18409 a!2986) (index!29549 lt!297910)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!368378 () SeekEntryResult!6805)

(assert (=> d!90949 (= lt!297910 e!368378)))

(declare-fun c!73652 () Bool)

(declare-fun lt!297911 () SeekEntryResult!6805)

(assert (=> d!90949 (= c!73652 (and ((_ is Intermediate!6805) lt!297911) (undefined!7617 lt!297911)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!38391 (_ BitVec 32)) SeekEntryResult!6805)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90949 (= lt!297911 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1786 mask!3053) k0!1786 a!2986 mask!3053))))

(assert (=> d!90949 (validMask!0 mask!3053)))

(assert (=> d!90949 (= (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053) lt!297910)))

(declare-fun b!643167 () Bool)

(declare-fun c!73653 () Bool)

(declare-fun lt!297909 () (_ BitVec 64))

(assert (=> b!643167 (= c!73653 (= lt!297909 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368377 () SeekEntryResult!6805)

(declare-fun e!368376 () SeekEntryResult!6805)

(assert (=> b!643167 (= e!368377 e!368376)))

(declare-fun b!643168 () Bool)

(assert (=> b!643168 (= e!368376 (seekKeyOrZeroReturnVacant!0 (x!58462 lt!297911) (index!29548 lt!297911) (index!29548 lt!297911) k0!1786 a!2986 mask!3053))))

(declare-fun b!643169 () Bool)

(assert (=> b!643169 (= e!368378 e!368377)))

(assert (=> b!643169 (= lt!297909 (select (arr!18409 a!2986) (index!29548 lt!297911)))))

(declare-fun c!73654 () Bool)

(assert (=> b!643169 (= c!73654 (= lt!297909 k0!1786))))

(declare-fun b!643170 () Bool)

(assert (=> b!643170 (= e!368376 (MissingZero!6805 (index!29548 lt!297911)))))

(declare-fun b!643171 () Bool)

(assert (=> b!643171 (= e!368378 Undefined!6805)))

(declare-fun b!643172 () Bool)

(assert (=> b!643172 (= e!368377 (Found!6805 (index!29548 lt!297911)))))

(assert (= (and d!90949 c!73652) b!643171))

(assert (= (and d!90949 (not c!73652)) b!643169))

(assert (= (and b!643169 c!73654) b!643172))

(assert (= (and b!643169 (not c!73654)) b!643167))

(assert (= (and b!643167 c!73653) b!643170))

(assert (= (and b!643167 (not c!73653)) b!643168))

(declare-fun m!617311 () Bool)

(assert (=> d!90949 m!617311))

(declare-fun m!617313 () Bool)

(assert (=> d!90949 m!617313))

(declare-fun m!617315 () Bool)

(assert (=> d!90949 m!617315))

(assert (=> d!90949 m!617313))

(declare-fun m!617317 () Bool)

(assert (=> d!90949 m!617317))

(assert (=> d!90949 m!617013))

(declare-fun m!617319 () Bool)

(assert (=> d!90949 m!617319))

(declare-fun m!617321 () Bool)

(assert (=> b!643168 m!617321))

(declare-fun m!617323 () Bool)

(assert (=> b!643169 m!617323))

(assert (=> b!642843 d!90949))

(declare-fun d!90965 () Bool)

(declare-fun e!368405 () Bool)

(assert (=> d!90965 e!368405))

(declare-fun res!416624 () Bool)

(assert (=> d!90965 (=> (not res!416624) (not e!368405))))

(assert (=> d!90965 (= res!416624 (and (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18773 a!2986)) (and (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18773 a!2986)))) (or (bvslt i!1108 #b00000000000000000000000000000000) (bvsge i!1108 (size!18773 a!2986)) (and (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18773 a!2986)))) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18773 a!2986))))))

(declare-fun lt!297929 () Unit!21729)

(declare-fun choose!9 (array!38391 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21729)

(assert (=> d!90965 (= lt!297929 (choose!9 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297743 vacantSpotIndex!68 mask!3053))))

(assert (=> d!90965 (validMask!0 mask!3053)))

(assert (=> d!90965 (= (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!297743 vacantSpotIndex!68 mask!3053) lt!297929)))

(declare-fun b!643201 () Bool)

(assert (=> b!643201 (= e!368405 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297743 vacantSpotIndex!68 (select (arr!18409 a!2986) j!136) a!2986 mask!3053) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297743 vacantSpotIndex!68 (select (store (arr!18409 a!2986) i!1108 k0!1786) j!136) (array!38392 (store (arr!18409 a!2986) i!1108 k0!1786) (size!18773 a!2986)) mask!3053)))))

(assert (= (and d!90965 res!416624) b!643201))

(declare-fun m!617363 () Bool)

(assert (=> d!90965 m!617363))

(assert (=> d!90965 m!617013))

(assert (=> b!643201 m!617001))

(assert (=> b!643201 m!617051))

(assert (=> b!643201 m!616999))

(assert (=> b!643201 m!617053))

(assert (=> b!643201 m!616999))

(assert (=> b!643201 m!617051))

(declare-fun m!617365 () Bool)

(assert (=> b!643201 m!617365))

(assert (=> b!642852 d!90965))

(declare-fun b!643202 () Bool)

(declare-fun c!73659 () Bool)

(declare-fun lt!297930 () (_ BitVec 64))

(assert (=> b!643202 (= c!73659 (= lt!297930 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368408 () SeekEntryResult!6805)

(declare-fun e!368407 () SeekEntryResult!6805)

(assert (=> b!643202 (= e!368408 e!368407)))

(declare-fun b!643203 () Bool)

(assert (=> b!643203 (= e!368408 (Found!6805 lt!297743))))

(declare-fun b!643204 () Bool)

(assert (=> b!643204 (= e!368407 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297743 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!297745 lt!297750 mask!3053))))

(declare-fun b!643205 () Bool)

(assert (=> b!643205 (= e!368407 (MissingVacant!6805 vacantSpotIndex!68))))

(declare-fun b!643207 () Bool)

(declare-fun e!368406 () SeekEntryResult!6805)

(assert (=> b!643207 (= e!368406 Undefined!6805)))

(declare-fun b!643206 () Bool)

(assert (=> b!643206 (= e!368406 e!368408)))

(declare-fun c!73658 () Bool)

(assert (=> b!643206 (= c!73658 (= lt!297930 lt!297745))))

(declare-fun lt!297931 () SeekEntryResult!6805)

(declare-fun d!90987 () Bool)

(assert (=> d!90987 (and (or ((_ is Undefined!6805) lt!297931) (not ((_ is Found!6805) lt!297931)) (and (bvsge (index!29547 lt!297931) #b00000000000000000000000000000000) (bvslt (index!29547 lt!297931) (size!18773 lt!297750)))) (or ((_ is Undefined!6805) lt!297931) ((_ is Found!6805) lt!297931) (not ((_ is MissingVacant!6805) lt!297931)) (not (= (index!29549 lt!297931) vacantSpotIndex!68)) (and (bvsge (index!29549 lt!297931) #b00000000000000000000000000000000) (bvslt (index!29549 lt!297931) (size!18773 lt!297750)))) (or ((_ is Undefined!6805) lt!297931) (ite ((_ is Found!6805) lt!297931) (= (select (arr!18409 lt!297750) (index!29547 lt!297931)) lt!297745) (and ((_ is MissingVacant!6805) lt!297931) (= (index!29549 lt!297931) vacantSpotIndex!68) (= (select (arr!18409 lt!297750) (index!29549 lt!297931)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90987 (= lt!297931 e!368406)))

(declare-fun c!73657 () Bool)

(assert (=> d!90987 (= c!73657 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90987 (= lt!297930 (select (arr!18409 lt!297750) lt!297743))))

(assert (=> d!90987 (validMask!0 mask!3053)))

(assert (=> d!90987 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297743 vacantSpotIndex!68 lt!297745 lt!297750 mask!3053) lt!297931)))

(assert (= (and d!90987 c!73657) b!643207))

(assert (= (and d!90987 (not c!73657)) b!643206))

(assert (= (and b!643206 c!73658) b!643203))

(assert (= (and b!643206 (not c!73658)) b!643202))

(assert (= (and b!643202 c!73659) b!643205))

(assert (= (and b!643202 (not c!73659)) b!643204))

(declare-fun m!617367 () Bool)

(assert (=> b!643204 m!617367))

(assert (=> b!643204 m!617367))

(declare-fun m!617369 () Bool)

(assert (=> b!643204 m!617369))

(declare-fun m!617371 () Bool)

(assert (=> d!90987 m!617371))

(declare-fun m!617373 () Bool)

(assert (=> d!90987 m!617373))

(declare-fun m!617375 () Bool)

(assert (=> d!90987 m!617375))

(assert (=> d!90987 m!617013))

(assert (=> b!642852 d!90987))

(declare-fun d!90989 () Bool)

(declare-fun lt!297937 () (_ BitVec 32))

(assert (=> d!90989 (and (bvsge lt!297937 #b00000000000000000000000000000000) (bvslt lt!297937 (bvadd mask!3053 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!90989 (= lt!297937 (choose!52 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(assert (=> d!90989 (validMask!0 mask!3053)))

(assert (=> d!90989 (= (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053) lt!297937)))

(declare-fun bs!19254 () Bool)

(assert (= bs!19254 d!90989))

(declare-fun m!617379 () Bool)

(assert (=> bs!19254 m!617379))

(assert (=> bs!19254 m!617013))

(assert (=> b!642852 d!90989))

(declare-fun b!643208 () Bool)

(declare-fun c!73662 () Bool)

(declare-fun lt!297938 () (_ BitVec 64))

(assert (=> b!643208 (= c!73662 (= lt!297938 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368411 () SeekEntryResult!6805)

(declare-fun e!368410 () SeekEntryResult!6805)

(assert (=> b!643208 (= e!368411 e!368410)))

(declare-fun b!643209 () Bool)

(assert (=> b!643209 (= e!368411 (Found!6805 lt!297743))))

(declare-fun b!643210 () Bool)

(assert (=> b!643210 (= e!368410 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) (nextIndex!0 lt!297743 (bvadd #b00000000000000000000000000000001 x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 (select (arr!18409 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!643211 () Bool)

(assert (=> b!643211 (= e!368410 (MissingVacant!6805 vacantSpotIndex!68))))

(declare-fun b!643213 () Bool)

(declare-fun e!368409 () SeekEntryResult!6805)

(assert (=> b!643213 (= e!368409 Undefined!6805)))

(declare-fun b!643212 () Bool)

(assert (=> b!643212 (= e!368409 e!368411)))

(declare-fun c!73661 () Bool)

(assert (=> b!643212 (= c!73661 (= lt!297938 (select (arr!18409 a!2986) j!136)))))

(declare-fun d!90993 () Bool)

(declare-fun lt!297939 () SeekEntryResult!6805)

(assert (=> d!90993 (and (or ((_ is Undefined!6805) lt!297939) (not ((_ is Found!6805) lt!297939)) (and (bvsge (index!29547 lt!297939) #b00000000000000000000000000000000) (bvslt (index!29547 lt!297939) (size!18773 a!2986)))) (or ((_ is Undefined!6805) lt!297939) ((_ is Found!6805) lt!297939) (not ((_ is MissingVacant!6805) lt!297939)) (not (= (index!29549 lt!297939) vacantSpotIndex!68)) (and (bvsge (index!29549 lt!297939) #b00000000000000000000000000000000) (bvslt (index!29549 lt!297939) (size!18773 a!2986)))) (or ((_ is Undefined!6805) lt!297939) (ite ((_ is Found!6805) lt!297939) (= (select (arr!18409 a!2986) (index!29547 lt!297939)) (select (arr!18409 a!2986) j!136)) (and ((_ is MissingVacant!6805) lt!297939) (= (index!29549 lt!297939) vacantSpotIndex!68) (= (select (arr!18409 a!2986) (index!29549 lt!297939)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90993 (= lt!297939 e!368409)))

(declare-fun c!73660 () Bool)

(assert (=> d!90993 (= c!73660 (bvsge (bvadd #b00000000000000000000000000000001 x!910) #b01111111111111111111111111111110))))

(assert (=> d!90993 (= lt!297938 (select (arr!18409 a!2986) lt!297743))))

(assert (=> d!90993 (validMask!0 mask!3053)))

(assert (=> d!90993 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!297743 vacantSpotIndex!68 (select (arr!18409 a!2986) j!136) a!2986 mask!3053) lt!297939)))

(assert (= (and d!90993 c!73660) b!643213))

(assert (= (and d!90993 (not c!73660)) b!643212))

(assert (= (and b!643212 c!73661) b!643209))

(assert (= (and b!643212 (not c!73661)) b!643208))

(assert (= (and b!643208 c!73662) b!643211))

(assert (= (and b!643208 (not c!73662)) b!643210))

(assert (=> b!643210 m!617367))

(assert (=> b!643210 m!617367))

(assert (=> b!643210 m!616999))

(declare-fun m!617381 () Bool)

(assert (=> b!643210 m!617381))

(declare-fun m!617383 () Bool)

(assert (=> d!90993 m!617383))

(declare-fun m!617385 () Bool)

(assert (=> d!90993 m!617385))

(declare-fun m!617387 () Bool)

(assert (=> d!90993 m!617387))

(assert (=> d!90993 m!617013))

(assert (=> b!642852 d!90993))

(declare-fun b!643214 () Bool)

(declare-fun c!73665 () Bool)

(declare-fun lt!297940 () (_ BitVec 64))

(assert (=> b!643214 (= c!73665 (= lt!297940 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!368414 () SeekEntryResult!6805)

(declare-fun e!368413 () SeekEntryResult!6805)

(assert (=> b!643214 (= e!368414 e!368413)))

(declare-fun b!643215 () Bool)

(assert (=> b!643215 (= e!368414 (Found!6805 index!984))))

(declare-fun b!643216 () Bool)

(assert (=> b!643216 (= e!368413 (seekKeyOrZeroReturnVacant!0 (bvadd x!910 #b00000000000000000000000000000001) (nextIndex!0 index!984 (bvadd x!910 #b00000000000000000000000000000001) mask!3053) vacantSpotIndex!68 lt!297745 lt!297750 mask!3053))))

(declare-fun b!643217 () Bool)

(assert (=> b!643217 (= e!368413 (MissingVacant!6805 vacantSpotIndex!68))))

(declare-fun b!643219 () Bool)

(declare-fun e!368412 () SeekEntryResult!6805)

(assert (=> b!643219 (= e!368412 Undefined!6805)))

(declare-fun b!643218 () Bool)

(assert (=> b!643218 (= e!368412 e!368414)))

(declare-fun c!73664 () Bool)

(assert (=> b!643218 (= c!73664 (= lt!297940 lt!297745))))

(declare-fun d!90995 () Bool)

(declare-fun lt!297941 () SeekEntryResult!6805)

(assert (=> d!90995 (and (or ((_ is Undefined!6805) lt!297941) (not ((_ is Found!6805) lt!297941)) (and (bvsge (index!29547 lt!297941) #b00000000000000000000000000000000) (bvslt (index!29547 lt!297941) (size!18773 lt!297750)))) (or ((_ is Undefined!6805) lt!297941) ((_ is Found!6805) lt!297941) (not ((_ is MissingVacant!6805) lt!297941)) (not (= (index!29549 lt!297941) vacantSpotIndex!68)) (and (bvsge (index!29549 lt!297941) #b00000000000000000000000000000000) (bvslt (index!29549 lt!297941) (size!18773 lt!297750)))) (or ((_ is Undefined!6805) lt!297941) (ite ((_ is Found!6805) lt!297941) (= (select (arr!18409 lt!297750) (index!29547 lt!297941)) lt!297745) (and ((_ is MissingVacant!6805) lt!297941) (= (index!29549 lt!297941) vacantSpotIndex!68) (= (select (arr!18409 lt!297750) (index!29549 lt!297941)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!90995 (= lt!297941 e!368412)))

(declare-fun c!73663 () Bool)

(assert (=> d!90995 (= c!73663 (bvsge x!910 #b01111111111111111111111111111110))))

(assert (=> d!90995 (= lt!297940 (select (arr!18409 lt!297750) index!984))))

(assert (=> d!90995 (validMask!0 mask!3053)))

(assert (=> d!90995 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!297745 lt!297750 mask!3053) lt!297941)))

(assert (= (and d!90995 c!73663) b!643219))

(assert (= (and d!90995 (not c!73663)) b!643218))

(assert (= (and b!643218 c!73664) b!643215))

(assert (= (and b!643218 (not c!73664)) b!643214))

(assert (= (and b!643214 c!73665) b!643217))

(assert (= (and b!643214 (not c!73665)) b!643216))

(assert (=> b!643216 m!617179))

(assert (=> b!643216 m!617179))

(declare-fun m!617389 () Bool)

(assert (=> b!643216 m!617389))

(declare-fun m!617391 () Bool)

(assert (=> d!90995 m!617391))

(declare-fun m!617393 () Bool)

(assert (=> d!90995 m!617393))

(declare-fun m!617395 () Bool)

(assert (=> d!90995 m!617395))

(assert (=> d!90995 m!617013))

(assert (=> b!642852 d!90995))

(declare-fun d!90999 () Bool)

(assert (=> d!90999 (= (validKeyInArray!0 (select (arr!18409 a!2986) j!136)) (and (not (= (select (arr!18409 a!2986) j!136) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!18409 a!2986) j!136) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!642841 d!90999))

(declare-fun d!91001 () Bool)

(declare-fun res!416625 () Bool)

(declare-fun e!368415 () Bool)

(assert (=> d!91001 (=> res!416625 e!368415)))

(assert (=> d!91001 (= res!416625 (= (select (arr!18409 a!2986) #b00000000000000000000000000000000) k0!1786))))

(assert (=> d!91001 (= (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000) e!368415)))

(declare-fun b!643220 () Bool)

(declare-fun e!368416 () Bool)

(assert (=> b!643220 (= e!368415 e!368416)))

(declare-fun res!416626 () Bool)

(assert (=> b!643220 (=> (not res!416626) (not e!368416))))

(assert (=> b!643220 (= res!416626 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!18773 a!2986)))))

(declare-fun b!643221 () Bool)

(assert (=> b!643221 (= e!368416 (arrayContainsKey!0 a!2986 k0!1786 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!91001 (not res!416625)) b!643220))

(assert (= (and b!643220 res!416626) b!643221))

(assert (=> d!91001 m!617187))

(declare-fun m!617397 () Bool)

(assert (=> b!643221 m!617397))

(assert (=> b!642850 d!91001))

(declare-fun d!91005 () Bool)

(declare-fun res!416627 () Bool)

(declare-fun e!368420 () Bool)

(assert (=> d!91005 (=> res!416627 e!368420)))

(assert (=> d!91005 (= res!416627 (= (select (arr!18409 lt!297750) index!984) (select (arr!18409 a!2986) j!136)))))

(assert (=> d!91005 (= (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) index!984) e!368420)))

(declare-fun b!643228 () Bool)

(declare-fun e!368421 () Bool)

(assert (=> b!643228 (= e!368420 e!368421)))

(declare-fun res!416628 () Bool)

(assert (=> b!643228 (=> (not res!416628) (not e!368421))))

(assert (=> b!643228 (= res!416628 (bvslt (bvadd index!984 #b00000000000000000000000000000001) (size!18773 lt!297750)))))

(declare-fun b!643229 () Bool)

(assert (=> b!643229 (= e!368421 (arrayContainsKey!0 lt!297750 (select (arr!18409 a!2986) j!136) (bvadd index!984 #b00000000000000000000000000000001)))))

(assert (= (and d!91005 (not res!416627)) b!643228))

(assert (= (and b!643228 res!416628) b!643229))

(assert (=> d!91005 m!617395))

(assert (=> b!643229 m!616999))

(declare-fun m!617399 () Bool)

(assert (=> b!643229 m!617399))

(assert (=> b!642839 d!91005))

(assert (=> b!642849 d!90911))

(check-sat (not bm!33575) (not b!643014) (not d!90965) (not d!90989) (not b!643052) (not d!90987) (not bm!33568) (not b!643060) (not d!90913) (not b!643093) (not d!90949) (not b!643221) (not b!643058) (not d!90921) (not d!90905) (not b!643031) (not d!90995) (not bm!33572) (not d!90931) (not b!643030) (not b!643015) (not b!643051) (not b!643201) (not b!643204) (not b!643053) (not b!643229) (not b!643168) (not b!643016) (not b!643024) (not bm!33567) (not b!643210) (not d!90993) (not b!643000) (not d!90925) (not b!643094) (not b!643216) (not b!643029))
(check-sat)
