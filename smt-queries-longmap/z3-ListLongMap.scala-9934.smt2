; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117428 () Bool)

(assert start!117428)

(declare-fun res!922324 () Bool)

(declare-fun e!781930 () Bool)

(assert (=> start!117428 (=> (not res!922324) (not e!781930))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93979 0))(
  ( (array!93980 (arr!45384 (Array (_ BitVec 32) (_ BitVec 64))) (size!45934 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93979)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117428 (= res!922324 (and (bvslt (size!45934 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45934 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117428 e!781930))

(assert (=> start!117428 true))

(declare-fun array_inv!34412 (array!93979) Bool)

(assert (=> start!117428 (array_inv!34412 a!3985)))

(declare-fun b!1380054 () Bool)

(assert (=> b!1380054 (= e!781930 false)))

(declare-fun lt!607845 () Bool)

(declare-fun isPivot!0 (array!93979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380054 (= lt!607845 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117428 res!922324) b!1380054))

(declare-fun m!1265269 () Bool)

(assert (=> start!117428 m!1265269))

(declare-fun m!1265271 () Bool)

(assert (=> b!1380054 m!1265271))

(check-sat (not b!1380054) (not start!117428))
