; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53946 () Bool)

(assert start!53946)

(declare-fun res!375757 () Bool)

(declare-fun e!335958 () Bool)

(assert (=> start!53946 (=> (not res!375757) (not e!335958))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53946 (= res!375757 (validMask!0 mask!3053))))

(assert (=> start!53946 e!335958))

(assert (=> start!53946 true))

(declare-datatypes ((array!36735 0))(
  ( (array!36736 (arr!17638 (Array (_ BitVec 32) (_ BitVec 64))) (size!18002 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36735)

(declare-fun array_inv!13497 (array!36735) Bool)

(assert (=> start!53946 (array_inv!13497 a!2986)))

(declare-fun b!588219 () Bool)

(declare-fun res!375753 () Bool)

(assert (=> b!588219 (=> (not res!375753) (not e!335958))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!588219 (= res!375753 (validKeyInArray!0 k0!1786))))

(declare-fun b!588220 () Bool)

(declare-fun res!375754 () Bool)

(declare-fun e!335955 () Bool)

(assert (=> b!588220 (=> (not res!375754) (not e!335955))))

(declare-fun i!1108 () (_ BitVec 32))

(declare-fun vacantSpotIndex!68 () (_ BitVec 32))

(declare-fun x!910 () (_ BitVec 32))

(declare-fun index!984 () (_ BitVec 32))

(assert (=> b!588220 (= res!375754 (and (bvsge index!984 #b00000000000000000000000000000000) (bvslt index!984 (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsle x!910 #b01111111111111111111111111111110) (bvsge x!910 #b00000000000000000000000000000000) (bvsge vacantSpotIndex!68 #b00000000000000000000000000000000) (bvslt vacantSpotIndex!68 (bvadd #b00000000000000000000000000000001 mask!3053)) (= (select (arr!17638 a!2986) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!17638 a!2986) i!1108 k0!1786) vacantSpotIndex!68) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!588221 () Bool)

(assert (=> b!588221 (= e!335958 e!335955)))

(declare-fun res!375752 () Bool)

(assert (=> b!588221 (=> (not res!375752) (not e!335955))))

(declare-datatypes ((SeekEntryResult!6034 0))(
  ( (MissingZero!6034 (index!26366 (_ BitVec 32))) (Found!6034 (index!26367 (_ BitVec 32))) (Intermediate!6034 (undefined!6846 Bool) (index!26368 (_ BitVec 32)) (x!55323 (_ BitVec 32))) (Undefined!6034) (MissingVacant!6034 (index!26369 (_ BitVec 32))) )
))
(declare-fun lt!266698 () SeekEntryResult!6034)

(assert (=> b!588221 (= res!375752 (or (= lt!266698 (MissingZero!6034 i!1108)) (= lt!266698 (MissingVacant!6034 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36735 (_ BitVec 32)) SeekEntryResult!6034)

(assert (=> b!588221 (= lt!266698 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(declare-fun b!588222 () Bool)

(declare-fun res!375760 () Bool)

(assert (=> b!588222 (=> (not res!375760) (not e!335958))))

(declare-fun j!136 () (_ BitVec 32))

(assert (=> b!588222 (= res!375760 (validKeyInArray!0 (select (arr!17638 a!2986) j!136)))))

(declare-fun b!588223 () Bool)

(declare-fun e!335956 () Bool)

(declare-fun lt!266701 () SeekEntryResult!6034)

(declare-fun lt!266700 () SeekEntryResult!6034)

(assert (=> b!588223 (= e!335956 (= lt!266701 lt!266700))))

(declare-fun b!588224 () Bool)

(declare-fun res!375751 () Bool)

(assert (=> b!588224 (=> (not res!375751) (not e!335958))))

(declare-fun arrayContainsKey!0 (array!36735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!588224 (= res!375751 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun b!588225 () Bool)

(declare-fun res!375758 () Bool)

(assert (=> b!588225 (=> (not res!375758) (not e!335958))))

(assert (=> b!588225 (= res!375758 (and (= (size!18002 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!18002 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!18002 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!588226 () Bool)

(declare-fun e!335957 () Bool)

(assert (=> b!588226 (= e!335957 (not true))))

(assert (=> b!588226 e!335956))

(declare-fun res!375756 () Bool)

(assert (=> b!588226 (=> (not res!375756) (not e!335956))))

(declare-fun lt!266699 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36735 (_ BitVec 32)) SeekEntryResult!6034)

(assert (=> b!588226 (= res!375756 (= lt!266700 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266699 vacantSpotIndex!68 (select (store (arr!17638 a!2986) i!1108 k0!1786) j!136) (array!36736 (store (arr!17638 a!2986) i!1108 k0!1786) (size!18002 a!2986)) mask!3053)))))

(assert (=> b!588226 (= lt!266700 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!910) lt!266699 vacantSpotIndex!68 (select (arr!17638 a!2986) j!136) a!2986 mask!3053))))

(declare-datatypes ((Unit!18265 0))(
  ( (Unit!18266) )
))
(declare-fun lt!266697 () Unit!18265)

(declare-fun lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 (array!36735 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18265)

(assert (=> b!588226 (= lt!266697 (lemmaPutValidKeyPreservesseekKeyOrZeroReturnVacant!0 a!2986 i!1108 k0!1786 j!136 (bvadd #b00000000000000000000000000000001 x!910) lt!266699 vacantSpotIndex!68 mask!3053))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!588226 (= lt!266699 (nextIndex!0 index!984 (bvadd #b00000000000000000000000000000001 x!910) mask!3053))))

(declare-fun b!588227 () Bool)

(assert (=> b!588227 (= e!335955 e!335957)))

(declare-fun res!375759 () Bool)

(assert (=> b!588227 (=> (not res!375759) (not e!335957))))

(assert (=> b!588227 (= res!375759 (and (= lt!266701 (Found!6034 j!136)) (bvslt x!910 #b01111111111111111111111111111110) (not (= (select (arr!17638 a!2986) index!984) (select (arr!17638 a!2986) j!136))) (not (= (select (arr!17638 a!2986) index!984) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= index!984 j!136))))))

(assert (=> b!588227 (= lt!266701 (seekKeyOrZeroReturnVacant!0 x!910 index!984 vacantSpotIndex!68 (select (arr!17638 a!2986) j!136) a!2986 mask!3053))))

(declare-fun b!588228 () Bool)

(declare-fun res!375750 () Bool)

(assert (=> b!588228 (=> (not res!375750) (not e!335955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36735 (_ BitVec 32)) Bool)

(assert (=> b!588228 (= res!375750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!588229 () Bool)

(declare-fun res!375755 () Bool)

(assert (=> b!588229 (=> (not res!375755) (not e!335955))))

(declare-datatypes ((List!11586 0))(
  ( (Nil!11583) (Cons!11582 (h!12630 (_ BitVec 64)) (t!17806 List!11586)) )
))
(declare-fun arrayNoDuplicates!0 (array!36735 (_ BitVec 32) List!11586) Bool)

(assert (=> b!588229 (= res!375755 (arrayNoDuplicates!0 a!2986 #b00000000000000000000000000000000 Nil!11583))))

(assert (= (and start!53946 res!375757) b!588225))

(assert (= (and b!588225 res!375758) b!588222))

(assert (= (and b!588222 res!375760) b!588219))

(assert (= (and b!588219 res!375753) b!588224))

(assert (= (and b!588224 res!375751) b!588221))

(assert (= (and b!588221 res!375752) b!588228))

(assert (= (and b!588228 res!375750) b!588229))

(assert (= (and b!588229 res!375755) b!588220))

(assert (= (and b!588220 res!375754) b!588227))

(assert (= (and b!588227 res!375759) b!588226))

(assert (= (and b!588226 res!375756) b!588223))

(declare-fun m!566861 () Bool)

(assert (=> b!588229 m!566861))

(declare-fun m!566863 () Bool)

(assert (=> b!588226 m!566863))

(declare-fun m!566865 () Bool)

(assert (=> b!588226 m!566865))

(declare-fun m!566867 () Bool)

(assert (=> b!588226 m!566867))

(declare-fun m!566869 () Bool)

(assert (=> b!588226 m!566869))

(declare-fun m!566871 () Bool)

(assert (=> b!588226 m!566871))

(assert (=> b!588226 m!566869))

(declare-fun m!566873 () Bool)

(assert (=> b!588226 m!566873))

(declare-fun m!566875 () Bool)

(assert (=> b!588226 m!566875))

(assert (=> b!588226 m!566863))

(declare-fun m!566877 () Bool)

(assert (=> b!588219 m!566877))

(declare-fun m!566879 () Bool)

(assert (=> b!588228 m!566879))

(assert (=> b!588222 m!566869))

(assert (=> b!588222 m!566869))

(declare-fun m!566881 () Bool)

(assert (=> b!588222 m!566881))

(declare-fun m!566883 () Bool)

(assert (=> b!588221 m!566883))

(declare-fun m!566885 () Bool)

(assert (=> b!588220 m!566885))

(assert (=> b!588220 m!566871))

(declare-fun m!566887 () Bool)

(assert (=> b!588220 m!566887))

(declare-fun m!566889 () Bool)

(assert (=> b!588227 m!566889))

(assert (=> b!588227 m!566869))

(assert (=> b!588227 m!566869))

(declare-fun m!566891 () Bool)

(assert (=> b!588227 m!566891))

(declare-fun m!566893 () Bool)

(assert (=> start!53946 m!566893))

(declare-fun m!566895 () Bool)

(assert (=> start!53946 m!566895))

(declare-fun m!566897 () Bool)

(assert (=> b!588224 m!566897))

(check-sat (not b!588228) (not start!53946) (not b!588221) (not b!588222) (not b!588227) (not b!588229) (not b!588224) (not b!588219) (not b!588226))
(check-sat)
