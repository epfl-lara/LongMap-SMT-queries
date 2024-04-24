; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25646 () Bool)

(assert start!25646)

(declare-fun res!130251 () Bool)

(declare-fun e!172191 () Bool)

(assert (=> start!25646 (=> (not res!130251) (not e!172191))))

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25646 (= res!130251 (validMask!0 mask!4002))))

(assert (=> start!25646 e!172191))

(assert (=> start!25646 true))

(declare-datatypes ((array!12820 0))(
  ( (array!12821 (arr!6064 (Array (_ BitVec 32) (_ BitVec 64))) (size!6416 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12820)

(declare-fun array_inv!4014 (array!12820) Bool)

(assert (=> start!25646 (array_inv!4014 a!3436)))

(declare-fun b!265979 () Bool)

(declare-fun res!130249 () Bool)

(assert (=> b!265979 (=> (not res!130249) (not e!172191))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265979 (= res!130249 (and (= (size!6416 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6416 a!3436))))))

(declare-fun b!265980 () Bool)

(declare-fun e!172193 () Bool)

(assert (=> b!265980 (= e!172193 false)))

(declare-fun lt!134330 () Bool)

(declare-datatypes ((List!3791 0))(
  ( (Nil!3788) (Cons!3787 (h!4454 (_ BitVec 64)) (t!8865 List!3791)) )
))
(declare-fun arrayNoDuplicates!0 (array!12820 (_ BitVec 32) List!3791) Bool)

(assert (=> b!265980 (= lt!134330 (arrayNoDuplicates!0 a!3436 #b00000000000000000000000000000000 Nil!3788))))

(declare-fun b!265981 () Bool)

(declare-fun res!130250 () Bool)

(assert (=> b!265981 (=> (not res!130250) (not e!172191))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12820 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265981 (= res!130250 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265982 () Bool)

(declare-fun res!130253 () Bool)

(assert (=> b!265982 (=> (not res!130253) (not e!172193))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12820 (_ BitVec 32)) Bool)

(assert (=> b!265982 (= res!130253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265983 () Bool)

(assert (=> b!265983 (= e!172191 e!172193)))

(declare-fun res!130254 () Bool)

(assert (=> b!265983 (=> (not res!130254) (not e!172193))))

(declare-datatypes ((SeekEntryResult!1220 0))(
  ( (MissingZero!1220 (index!7050 (_ BitVec 32))) (Found!1220 (index!7051 (_ BitVec 32))) (Intermediate!1220 (undefined!2032 Bool) (index!7052 (_ BitVec 32)) (x!25473 (_ BitVec 32))) (Undefined!1220) (MissingVacant!1220 (index!7053 (_ BitVec 32))) )
))
(declare-fun lt!134331 () SeekEntryResult!1220)

(assert (=> b!265983 (= res!130254 (or (= lt!134331 (MissingZero!1220 i!1355)) (= lt!134331 (MissingVacant!1220 i!1355))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12820 (_ BitVec 32)) SeekEntryResult!1220)

(assert (=> b!265983 (= lt!134331 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265984 () Bool)

(declare-fun res!130252 () Bool)

(assert (=> b!265984 (=> (not res!130252) (not e!172191))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265984 (= res!130252 (validKeyInArray!0 k0!2698))))

(assert (= (and start!25646 res!130251) b!265979))

(assert (= (and b!265979 res!130249) b!265984))

(assert (= (and b!265984 res!130252) b!265981))

(assert (= (and b!265981 res!130250) b!265983))

(assert (= (and b!265983 res!130254) b!265982))

(assert (= (and b!265982 res!130253) b!265980))

(declare-fun m!282833 () Bool)

(assert (=> b!265981 m!282833))

(declare-fun m!282835 () Bool)

(assert (=> b!265983 m!282835))

(declare-fun m!282837 () Bool)

(assert (=> b!265982 m!282837))

(declare-fun m!282839 () Bool)

(assert (=> b!265980 m!282839))

(declare-fun m!282841 () Bool)

(assert (=> b!265984 m!282841))

(declare-fun m!282843 () Bool)

(assert (=> start!25646 m!282843))

(declare-fun m!282845 () Bool)

(assert (=> start!25646 m!282845))

(check-sat (not b!265982) (not b!265981) (not start!25646) (not b!265983) (not b!265980) (not b!265984))
(check-sat)
