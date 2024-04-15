; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!92296 () Bool)

(assert start!92296)

(declare-fun e!594996 () Bool)

(declare-fun lt!463151 () (_ BitVec 32))

(declare-datatypes ((array!66038 0))(
  ( (array!66039 (arr!31758 (Array (_ BitVec 32) (_ BitVec 64))) (size!32296 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66038)

(declare-fun b!1048841 () Bool)

(declare-fun k0!2747 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66038 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1048841 (= e!594996 (arrayContainsKey!0 a!3488 k0!2747 lt!463151))))

(declare-fun res!698057 () Bool)

(declare-fun e!594990 () Bool)

(assert (=> start!92296 (=> (not res!698057) (not e!594990))))

(declare-fun i!1381 () (_ BitVec 32))

(assert (=> start!92296 (= res!698057 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32296 a!3488)) (bvslt (size!32296 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!92296 e!594990))

(assert (=> start!92296 true))

(declare-fun array_inv!24541 (array!66038) Bool)

(assert (=> start!92296 (array_inv!24541 a!3488)))

(declare-fun b!1048842 () Bool)

(declare-fun res!698055 () Bool)

(assert (=> b!1048842 (=> (not res!698055) (not e!594990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1048842 (= res!698055 (validKeyInArray!0 k0!2747))))

(declare-fun b!1048843 () Bool)

(declare-fun e!594995 () Bool)

(declare-fun e!594993 () Bool)

(assert (=> b!1048843 (= e!594995 (not e!594993))))

(declare-fun res!698051 () Bool)

(assert (=> b!1048843 (=> res!698051 e!594993)))

(assert (=> b!1048843 (= res!698051 (bvsle lt!463151 i!1381))))

(declare-fun e!594994 () Bool)

(assert (=> b!1048843 e!594994))

(declare-fun res!698059 () Bool)

(assert (=> b!1048843 (=> (not res!698059) (not e!594994))))

(assert (=> b!1048843 (= res!698059 (= (select (store (arr!31758 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!463151) k0!2747))))

(declare-fun b!1048844 () Bool)

(declare-fun res!698056 () Bool)

(assert (=> b!1048844 (=> (not res!698056) (not e!594990))))

(declare-datatypes ((List!22129 0))(
  ( (Nil!22126) (Cons!22125 (h!23334 (_ BitVec 64)) (t!31427 List!22129)) )
))
(declare-fun arrayNoDuplicates!0 (array!66038 (_ BitVec 32) List!22129) Bool)

(assert (=> b!1048844 (= res!698056 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22126))))

(declare-fun b!1048845 () Bool)

(declare-fun e!594992 () Bool)

(assert (=> b!1048845 (= e!594992 e!594995)))

(declare-fun res!698054 () Bool)

(assert (=> b!1048845 (=> (not res!698054) (not e!594995))))

(assert (=> b!1048845 (= res!698054 (not (= lt!463151 i!1381)))))

(declare-fun lt!463153 () array!66038)

(declare-fun arrayScanForKey!0 (array!66038 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1048845 (= lt!463151 (arrayScanForKey!0 lt!463153 k0!2747 #b00000000000000000000000000000000))))

(declare-fun b!1048846 () Bool)

(declare-fun res!698053 () Bool)

(assert (=> b!1048846 (=> (not res!698053) (not e!594990))))

(assert (=> b!1048846 (= res!698053 (= (select (arr!31758 a!3488) i!1381) k0!2747))))

(declare-fun b!1048847 () Bool)

(assert (=> b!1048847 (= e!594990 e!594992)))

(declare-fun res!698058 () Bool)

(assert (=> b!1048847 (=> (not res!698058) (not e!594992))))

(assert (=> b!1048847 (= res!698058 (arrayContainsKey!0 lt!463153 k0!2747 #b00000000000000000000000000000000))))

(assert (=> b!1048847 (= lt!463153 (array!66039 (store (arr!31758 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32296 a!3488)))))

(declare-fun b!1048848 () Bool)

(assert (=> b!1048848 (= e!594994 e!594996)))

(declare-fun res!698052 () Bool)

(assert (=> b!1048848 (=> res!698052 e!594996)))

(assert (=> b!1048848 (= res!698052 (bvsle lt!463151 i!1381))))

(declare-fun b!1048849 () Bool)

(assert (=> b!1048849 (= e!594993 true)))

(assert (=> b!1048849 (arrayNoDuplicates!0 a!3488 i!1381 Nil!22126)))

(declare-datatypes ((Unit!34169 0))(
  ( (Unit!34170) )
))
(declare-fun lt!463152 () Unit!34169)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!66038 (_ BitVec 32) (_ BitVec 32)) Unit!34169)

(assert (=> b!1048849 (= lt!463152 (lemmaNoDuplicateFromThenFromBigger!0 a!3488 #b00000000000000000000000000000000 i!1381))))

(assert (= (and start!92296 res!698057) b!1048844))

(assert (= (and b!1048844 res!698056) b!1048842))

(assert (= (and b!1048842 res!698055) b!1048846))

(assert (= (and b!1048846 res!698053) b!1048847))

(assert (= (and b!1048847 res!698058) b!1048845))

(assert (= (and b!1048845 res!698054) b!1048843))

(assert (= (and b!1048843 res!698059) b!1048848))

(assert (= (and b!1048848 (not res!698052)) b!1048841))

(assert (= (and b!1048843 (not res!698051)) b!1048849))

(declare-fun m!969217 () Bool)

(assert (=> b!1048846 m!969217))

(declare-fun m!969219 () Bool)

(assert (=> b!1048842 m!969219))

(declare-fun m!969221 () Bool)

(assert (=> b!1048849 m!969221))

(declare-fun m!969223 () Bool)

(assert (=> b!1048849 m!969223))

(declare-fun m!969225 () Bool)

(assert (=> b!1048844 m!969225))

(declare-fun m!969227 () Bool)

(assert (=> start!92296 m!969227))

(declare-fun m!969229 () Bool)

(assert (=> b!1048841 m!969229))

(declare-fun m!969231 () Bool)

(assert (=> b!1048845 m!969231))

(declare-fun m!969233 () Bool)

(assert (=> b!1048843 m!969233))

(declare-fun m!969235 () Bool)

(assert (=> b!1048843 m!969235))

(declare-fun m!969237 () Bool)

(assert (=> b!1048847 m!969237))

(assert (=> b!1048847 m!969233))

(check-sat (not start!92296) (not b!1048847) (not b!1048844) (not b!1048841) (not b!1048849) (not b!1048845) (not b!1048842))
(check-sat)
