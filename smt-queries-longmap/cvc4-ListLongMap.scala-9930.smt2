; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117406 () Bool)

(assert start!117406)

(declare-fun res!922237 () Bool)

(declare-fun e!781855 () Bool)

(assert (=> start!117406 (=> (not res!922237) (not e!781855))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93957 0))(
  ( (array!93958 (arr!45373 (Array (_ BitVec 32) (_ BitVec 64))) (size!45923 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93957)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117406 (= res!922237 (and (bvslt (size!45923 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45923 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117406 e!781855))

(assert (=> start!117406 true))

(declare-fun array_inv!34401 (array!93957) Bool)

(assert (=> start!117406 (array_inv!34401 a!3985)))

(declare-fun b!1379967 () Bool)

(assert (=> b!1379967 (= e!781855 false)))

(declare-fun lt!607812 () Bool)

(declare-fun isPivot!0 (array!93957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379967 (= lt!607812 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117406 res!922237) b!1379967))

(declare-fun m!1265189 () Bool)

(assert (=> start!117406 m!1265189))

(declare-fun m!1265191 () Bool)

(assert (=> b!1379967 m!1265191))

(push 1)

(assert (not start!117406))

(assert (not b!1379967))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

