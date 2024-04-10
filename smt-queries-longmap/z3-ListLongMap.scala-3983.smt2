; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53970 () Bool)

(assert start!53970)

(declare-fun b!589417 () Bool)

(declare-fun e!336511 () Bool)

(declare-fun e!336510 () Bool)

(assert (=> b!589417 (= e!336511 e!336510)))

(declare-fun res!376936 () Bool)

(assert (=> b!589417 (=> (not res!376936) (not e!336510))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!6120 0))(
  ( (MissingZero!6120 (index!26710 (_ BitVec 32))) (Found!6120 (index!26711 (_ BitVec 32))) (Intermediate!6120 (undefined!6932 Bool) (index!26712 (_ BitVec 32)) (x!55502 (_ BitVec 32))) (Undefined!6120) (MissingVacant!6120 (index!26713 (_ BitVec 32))) )
))
(declare-fun lt!267328 () SeekEntryResult!6120)

(declare-fun index!984 () (_ BitVec 32))

(declare-datatypes ((array!36814 0))(
  ( (array!36815 (arr!17680 (Array (_ BitVec 32) (_ BitVec 64))) (size!18044 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36814)

(assert (=> b!589417 (= res!376936 (and (= lt!267328 (Found!6120 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17680 a!2986) index!984) (select (arr!17680 a!2986) j!136))) (not (= (select (arr!17680 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36814 (_ BitVec 32)) SeekEntryResult!6120)

(assert (=> b!589417 (= lt!267328 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17680 a!2986) j!136) a!2986 mask!3053))))

(declare-fun res!376938 () Bool)

(declare-fun e!336509 () Bool)

(assert (=> start!53970 (=> (not res!376938) (not e!336509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53970 (= res!376938 (validMask!0 mask!3053))))

(assert (=> start!53970 e!336509))

(assert (=> start!53970 true))

(declare-fun array_inv!13476 (array!36814) Bool)

(assert (=> start!53970 (array_inv!13476 a!2986)))

(declare-fun b!589418 () Bool)

(declare-datatypes ((Unit!18398 0))(
  ( (Unit!18399) )
))
(declare-fun e!336508 () Unit!18398)

(declare-fun Unit!18400 () Unit!18398)

(assert (=> b!589418 (= e!336508 Unit!18400)))

(assert (=> b!589418 false))

(declare-fun b!589419 () Bool)

(assert (=> b!589419 (= e!336510 (not true))))

(declare-fun lt!267330 () Unit!18398)

(assert (=> b!589419 (= lt!267330 e!336508)))

(declare-fun lt!267331 () array!36814)

(declare-fun lt!267333 () (_ BitVec 64))

(declare-fun c!66608 () Bool)

(assert (=> b!589419 (= c!66608 (= (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 lt!267333 lt!267331 mask!3053) Undefined!6120))))

(declare-fun e!336507 () Bool)

(assert (=> b!589419 e!336507))

(declare-fun res!376945 () Bool)

(assert (=> b!589419 (=> (not res!376945) (not e!336507))))

(declare-fun lt!267334 () SeekEntryResult!6120)

(declare-fun lt!267329 () (_ BitVec 32))

(assert (=> b!589419 (= res!376945 (= lt!267334 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267329 vacantSpotIndex!68 lt!267333 lt!267331 mask!3053)))))

(assert (=> b!589419 (= lt!267334 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!267329 vacantSpotIndex!68 (select (arr!17680 a!2986) j!136) a!2986 mask!3053))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun k0!1786 () (_ BitVec 64))

(assert (=> b!589419 (= lt!267333 (select (store (arr!17680 a!2986) i!1108 k0!1786) j!136))))

(declare-fun lt!267327 () Unit!18398)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36814 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18398)

(assert (=> b!589419 (= lt!267327 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!267329 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!589419 (= lt!267329 (nextIndex!0 index!984 x!910 mask!3053))))

(declare-fun b!589420 () Bool)

(declare-fun res!376939 () Bool)

(declare-fun e!336512 () Bool)

(assert (=> b!589420 (=> (not res!376939) (not e!336512))))

(declare-datatypes ((List!11721 0))(
  ( (Nil!11718) (Cons!11717 (h!12762 (_ BitVec 64)) (t!17949 List!11721)) )
))
(declare-fun arrayNoDuplicates!0 (array!36814 (_ BitVec 32) List!11721) Bool)

(assert (=> b!589420 (= res!376939 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11718))))

(declare-fun b!589421 () Bool)

(assert (=> b!589421 (= e!336507 (= lt!267328 lt!267334))))

(declare-fun b!589422 () Bool)

(declare-fun res!376937 () Bool)

(assert (=> b!589422 (=> (not res!376937) (not e!336509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!589422 (= res!376937 (validKeyInArray!0 k0!1786))))

(declare-fun b!589423 () Bool)

(declare-fun res!376940 () Bool)

(assert (=> b!589423 (=> (not res!376940) (not e!336509))))

(assert (=> b!589423 (= res!376940 (and (= (size!18044 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18044 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18044 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!589424 () Bool)

(declare-fun res!376942 () Bool)

(assert (=> b!589424 (=> (not res!376942) (not e!336512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36814 (_ BitVec 32)) Bool)

(assert (=> b!589424 (= res!376942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!589425 () Bool)

(declare-fun res!376941 () Bool)

(assert (=> b!589425 (=> (not res!376941) (not e!336509))))

(declare-fun arrayContainsKey!0 (array!36814 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!589425 (= res!376941 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!589426 () Bool)

(declare-fun res!376946 () Bool)

(assert (=> b!589426 (=> (not res!376946) (not e!336512))))

(assert (=> b!589426 (= res!376946 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17680 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!589427 () Bool)

(declare-fun res!376944 () Bool)

(assert (=> b!589427 (=> (not res!376944) (not e!336509))))

(assert (=> b!589427 (= res!376944 (validKeyInArray!0 (select (arr!17680 a!2986) j!136)))))

(declare-fun b!589428 () Bool)

(assert (=> b!589428 (= e!336512 e!336511)))

(declare-fun res!376935 () Bool)

(assert (=> b!589428 (=> (not res!376935) (not e!336511))))

(assert (=> b!589428 (= res!376935 (= (select (store (arr!17680 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!589428 (= lt!267331 (array!36815 (store (arr!17680 a!2986) i!1108 k0!1786) (size!18044 a!2986)))))

(declare-fun b!589429 () Bool)

(declare-fun Unit!18401 () Unit!18398)

(assert (=> b!589429 (= e!336508 Unit!18401)))

(declare-fun b!589430 () Bool)

(assert (=> b!589430 (= e!336509 e!336512)))

(declare-fun res!376943 () Bool)

(assert (=> b!589430 (=> (not res!376943) (not e!336512))))

(declare-fun lt!267332 () SeekEntryResult!6120)

(assert (=> b!589430 (= res!376943 (or (= lt!267332 (MissingZero!6120 i!1108)) (= lt!267332 (MissingVacant!6120 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36814 (_ BitVec 32)) SeekEntryResult!6120)

(assert (=> b!589430 (= lt!267332 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53970 res!376938) b!589423))

(assert (= (and b!589423 res!376940) b!589427))

(assert (= (and b!589427 res!376944) b!589422))

(assert (= (and b!589422 res!376937) b!589425))

(assert (= (and b!589425 res!376941) b!589430))

(assert (= (and b!589430 res!376943) b!589424))

(assert (= (and b!589424 res!376942) b!589420))

(assert (= (and b!589420 res!376939) b!589426))

(assert (= (and b!589426 res!376946) b!589428))

(assert (= (and b!589428 res!376935) b!589417))

(assert (= (and b!589417 res!376936) b!589419))

(assert (= (and b!589419 res!376945) b!589421))

(assert (= (and b!589419 c!66608) b!589418))

(assert (= (and b!589419 (not c!66608)) b!589429))

(declare-fun m!567947 () Bool)

(assert (=> b!589427 m!567947))

(assert (=> b!589427 m!567947))

(declare-fun m!567949 () Bool)

(assert (=> b!589427 m!567949))

(declare-fun m!567951 () Bool)

(assert (=> b!589428 m!567951))

(declare-fun m!567953 () Bool)

(assert (=> b!589428 m!567953))

(declare-fun m!567955 () Bool)

(assert (=> b!589424 m!567955))

(declare-fun m!567957 () Bool)

(assert (=> b!589419 m!567957))

(assert (=> b!589419 m!567947))

(declare-fun m!567959 () Bool)

(assert (=> b!589419 m!567959))

(declare-fun m!567961 () Bool)

(assert (=> b!589419 m!567961))

(assert (=> b!589419 m!567947))

(assert (=> b!589419 m!567951))

(declare-fun m!567963 () Bool)

(assert (=> b!589419 m!567963))

(declare-fun m!567965 () Bool)

(assert (=> b!589419 m!567965))

(declare-fun m!567967 () Bool)

(assert (=> b!589419 m!567967))

(declare-fun m!567969 () Bool)

(assert (=> b!589426 m!567969))

(declare-fun m!567971 () Bool)

(assert (=> b!589425 m!567971))

(declare-fun m!567973 () Bool)

(assert (=> b!589420 m!567973))

(declare-fun m!567975 () Bool)

(assert (=> b!589430 m!567975))

(declare-fun m!567977 () Bool)

(assert (=> b!589417 m!567977))

(assert (=> b!589417 m!567947))

(assert (=> b!589417 m!567947))

(declare-fun m!567979 () Bool)

(assert (=> b!589417 m!567979))

(declare-fun m!567981 () Bool)

(assert (=> start!53970 m!567981))

(declare-fun m!567983 () Bool)

(assert (=> start!53970 m!567983))

(declare-fun m!567985 () Bool)

(assert (=> b!589422 m!567985))

(check-sat (not b!589425) (not b!589430) (not start!53970) (not b!589427) (not b!589419) (not b!589424) (not b!589422) (not b!589417) (not b!589420))
(check-sat)
