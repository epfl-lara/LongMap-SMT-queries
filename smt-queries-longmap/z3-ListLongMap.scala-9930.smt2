; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117404 () Bool)

(assert start!117404)

(declare-fun res!922234 () Bool)

(declare-fun e!781849 () Bool)

(assert (=> start!117404 (=> (not res!922234) (not e!781849))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93955 0))(
  ( (array!93956 (arr!45372 (Array (_ BitVec 32) (_ BitVec 64))) (size!45922 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93955)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117404 (= res!922234 (and (bvslt (size!45922 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45922 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117404 e!781849))

(assert (=> start!117404 true))

(declare-fun array_inv!34400 (array!93955) Bool)

(assert (=> start!117404 (array_inv!34400 a!3985)))

(declare-fun b!1379964 () Bool)

(assert (=> b!1379964 (= e!781849 false)))

(declare-fun lt!607809 () Bool)

(declare-fun isPivot!0 (array!93955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379964 (= lt!607809 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117404 res!922234) b!1379964))

(declare-fun m!1265185 () Bool)

(assert (=> start!117404 m!1265185))

(declare-fun m!1265187 () Bool)

(assert (=> b!1379964 m!1265187))

(check-sat (not b!1379964) (not start!117404))
