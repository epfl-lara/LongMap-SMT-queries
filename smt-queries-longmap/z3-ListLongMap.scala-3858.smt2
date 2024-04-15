; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53016 () Bool)

(assert start!53016)

(declare-fun b!577150 () Bool)

(declare-fun res!365330 () Bool)

(declare-fun e!331943 () Bool)

(assert (=> b!577150 (=> (not res!365330) (not e!331943))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(declare-datatypes ((array!36048 0))(
  ( (array!36049 (arr!17303 (Array (_ BitVec 32) (_ BitVec 64))) (size!17668 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36048)

(assert (=> b!577150 (= res!365330 (and (= (size!17668 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17668 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17668 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577151 () Bool)

(declare-fun e!331944 () Bool)

(assert (=> b!577151 (= e!331944 (bvsgt #b00000000000000000000000000000000 (size!17668 a!2986)))))

(declare-fun b!577152 () Bool)

(declare-fun res!365326 () Bool)

(assert (=> b!577152 (=> (not res!365326) (not e!331944))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36048 (_ BitVec 32)) Bool)

(assert (=> b!577152 (= res!365326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(declare-fun b!577153 () Bool)

(declare-fun res!365327 () Bool)

(assert (=> b!577153 (=> (not res!365327) (not e!331943))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577153 (= res!365327 (validKeyInArray!0 (select (arr!17303 a!2986) j!136)))))

(declare-fun b!577154 () Bool)

(declare-fun res!365325 () Bool)

(assert (=> b!577154 (=> (not res!365325) (not e!331943))))

(declare-fun k0!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36048 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577154 (= res!365325 (not (arrayContainsKey!0 a!2986 k0!1786 #b00000000000000000000000000000000)))))

(declare-fun res!365328 () Bool)

(assert (=> start!53016 (=> (not res!365328) (not e!331943))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53016 (= res!365328 (validMask!0 mask!3053))))

(assert (=> start!53016 e!331943))

(assert (=> start!53016 true))

(declare-fun array_inv!13186 (array!36048) Bool)

(assert (=> start!53016 (array_inv!13186 a!2986)))

(declare-fun b!577155 () Bool)

(declare-fun res!365329 () Bool)

(assert (=> b!577155 (=> (not res!365329) (not e!331943))))

(assert (=> b!577155 (= res!365329 (validKeyInArray!0 k0!1786))))

(declare-fun b!577156 () Bool)

(assert (=> b!577156 (= e!331943 e!331944)))

(declare-fun res!365324 () Bool)

(assert (=> b!577156 (=> (not res!365324) (not e!331944))))

(declare-datatypes ((SeekEntryResult!5740 0))(
  ( (MissingZero!5740 (index!25187 (_ BitVec 32))) (Found!5740 (index!25188 (_ BitVec 32))) (Intermediate!5740 (undefined!6552 Bool) (index!25189 (_ BitVec 32)) (x!54108 (_ BitVec 32))) (Undefined!5740) (MissingVacant!5740 (index!25190 (_ BitVec 32))) )
))
(declare-fun lt!263728 () SeekEntryResult!5740)

(assert (=> b!577156 (= res!365324 (or (= lt!263728 (MissingZero!5740 i!1108)) (= lt!263728 (MissingVacant!5740 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36048 (_ BitVec 32)) SeekEntryResult!5740)

(assert (=> b!577156 (= lt!263728 (seekEntryOrOpen!0 k0!1786 a!2986 mask!3053))))

(assert (= (and start!53016 res!365328) b!577150))

(assert (= (and b!577150 res!365330) b!577153))

(assert (= (and b!577153 res!365327) b!577155))

(assert (= (and b!577155 res!365329) b!577154))

(assert (= (and b!577154 res!365325) b!577156))

(assert (= (and b!577156 res!365324) b!577152))

(assert (= (and b!577152 res!365326) b!577151))

(declare-fun m!555539 () Bool)

(assert (=> start!53016 m!555539))

(declare-fun m!555541 () Bool)

(assert (=> start!53016 m!555541))

(declare-fun m!555543 () Bool)

(assert (=> b!577154 m!555543))

(declare-fun m!555545 () Bool)

(assert (=> b!577156 m!555545))

(declare-fun m!555547 () Bool)

(assert (=> b!577155 m!555547))

(declare-fun m!555549 () Bool)

(assert (=> b!577152 m!555549))

(declare-fun m!555551 () Bool)

(assert (=> b!577153 m!555551))

(assert (=> b!577153 m!555551))

(declare-fun m!555553 () Bool)

(assert (=> b!577153 m!555553))

(check-sat (not b!577154) (not start!53016) (not b!577153) (not b!577155) (not b!577152) (not b!577156))
(check-sat)
