; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117430 () Bool)

(assert start!117430)

(declare-fun res!922327 () Bool)

(declare-fun e!781936 () Bool)

(assert (=> start!117430 (=> (not res!922327) (not e!781936))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93981 0))(
  ( (array!93982 (arr!45385 (Array (_ BitVec 32) (_ BitVec 64))) (size!45935 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93981)

(declare-fun from!3363 () (_ BitVec 32))

(declare-fun to!159 () (_ BitVec 32))

(assert (=> start!117430 (= res!922327 (and (bvslt (size!45935 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45935 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117430 e!781936))

(assert (=> start!117430 true))

(declare-fun array_inv!34413 (array!93981) Bool)

(assert (=> start!117430 (array_inv!34413 a!3985)))

(declare-fun b!1380057 () Bool)

(assert (=> b!1380057 (= e!781936 false)))

(declare-fun lt!607848 () Bool)

(declare-fun isPivot!0 (array!93981 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1380057 (= lt!607848 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117430 res!922327) b!1380057))

(declare-fun m!1265273 () Bool)

(assert (=> start!117430 m!1265273))

(declare-fun m!1265275 () Bool)

(assert (=> b!1380057 m!1265275))

(push 1)

(assert (not start!117430))

(assert (not b!1380057))

(check-sat)

(pop 1)

(push 1)

(check-sat)

