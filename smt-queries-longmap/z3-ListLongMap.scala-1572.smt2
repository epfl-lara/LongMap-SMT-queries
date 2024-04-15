; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29950 () Bool)

(assert start!29950)

(declare-fun res!158620 () Bool)

(declare-fun e!189851 () Bool)

(assert (=> start!29950 (=> (not res!158620) (not e!189851))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29950 (= res!158620 (validMask!0 mask!3709))))

(assert (=> start!29950 e!189851))

(assert (=> start!29950 true))

(declare-datatypes ((array!15190 0))(
  ( (array!15191 (arr!7188 (Array (_ BitVec 32) (_ BitVec 64))) (size!7541 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15190)

(declare-fun array_inv!5160 (array!15190) Bool)

(assert (=> start!29950 (array_inv!5160 a!3293)))

(declare-fun b!300724 () Bool)

(declare-fun res!158622 () Bool)

(assert (=> b!300724 (=> (not res!158622) (not e!189851))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!300724 (= res!158622 (and (= (size!7541 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7541 a!3293))))))

(declare-fun b!300725 () Bool)

(declare-fun res!158621 () Bool)

(assert (=> b!300725 (=> (not res!158621) (not e!189851))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!300725 (= res!158621 (validKeyInArray!0 k0!2441))))

(declare-fun b!300726 () Bool)

(assert (=> b!300726 (= e!189851 (bvsge #b00000000000000000000000000000000 (size!7541 a!3293)))))

(assert (= (and start!29950 res!158620) b!300724))

(assert (= (and b!300724 res!158622) b!300725))

(assert (= (and b!300725 res!158621) b!300726))

(declare-fun m!312169 () Bool)

(assert (=> start!29950 m!312169))

(declare-fun m!312171 () Bool)

(assert (=> start!29950 m!312171))

(declare-fun m!312173 () Bool)

(assert (=> b!300725 m!312173))

(check-sat (not start!29950) (not b!300725))
(check-sat)
