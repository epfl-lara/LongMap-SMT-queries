; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29996 () Bool)

(assert start!29996)

(declare-fun b!301067 () Bool)

(declare-fun res!158820 () Bool)

(declare-fun e!190068 () Bool)

(assert (=> b!301067 (=> (not res!158820) (not e!190068))))

(declare-datatypes ((array!15216 0))(
  ( (array!15217 (arr!7200 (Array (_ BitVec 32) (_ BitVec 64))) (size!7552 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15216)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!301067 (= res!158820 (and (= (size!7552 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7552 a!3293))))))

(declare-fun b!301068 () Bool)

(declare-fun res!158818 () Bool)

(assert (=> b!301068 (=> (not res!158818) (not e!190068))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!301068 (= res!158818 (validKeyInArray!0 k0!2441))))

(declare-fun b!301069 () Bool)

(declare-fun res!158819 () Bool)

(assert (=> b!301069 (=> (not res!158819) (not e!190068))))

(declare-fun arrayContainsKey!0 (array!15216 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!301069 (= res!158819 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!158817 () Bool)

(assert (=> start!29996 (=> (not res!158817) (not e!190068))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29996 (= res!158817 (validMask!0 mask!3709))))

(assert (=> start!29996 e!190068))

(assert (=> start!29996 true))

(declare-fun array_inv!5163 (array!15216) Bool)

(assert (=> start!29996 (array_inv!5163 a!3293)))

(declare-fun b!301070 () Bool)

(assert (=> b!301070 (= e!190068 (bvslt mask!3709 #b00000000000000000000000000000000))))

(assert (= (and start!29996 res!158817) b!301067))

(assert (= (and b!301067 res!158820) b!301068))

(assert (= (and b!301068 res!158818) b!301069))

(assert (= (and b!301069 res!158819) b!301070))

(declare-fun m!312953 () Bool)

(assert (=> b!301068 m!312953))

(declare-fun m!312955 () Bool)

(assert (=> b!301069 m!312955))

(declare-fun m!312957 () Bool)

(assert (=> start!29996 m!312957))

(declare-fun m!312959 () Bool)

(assert (=> start!29996 m!312959))

(check-sat (not b!301069) (not b!301068) (not start!29996))
(check-sat)
