; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117406 () Bool)

(assert start!117406)

(declare-fun res!922228 () Bool)

(declare-fun e!781836 () Bool)

(assert (=> start!117406 (=> (not res!922228) (not e!781836))))

(declare-fun knownPivot!5 () (_ BitVec 32))

(declare-fun pivot!40 () (_ BitVec 32))

(declare-datatypes ((array!93911 0))(
  ( (array!93912 (arr!45350 (Array (_ BitVec 32) (_ BitVec 64))) (size!45902 (_ BitVec 32))) )
))
(declare-fun a!3985 () array!93911)

(declare-fun to!159 () (_ BitVec 32))

(declare-fun from!3363 () (_ BitVec 32))

(assert (=> start!117406 (= res!922228 (and (bvslt (size!45902 a!3985) #b01111111111111111111111111111111) (bvsge from!3363 #b00000000000000000000000000000000) (bvsge to!159 from!3363) (bvsle to!159 (size!45902 a!3985)) (bvsge pivot!40 from!3363) (bvslt pivot!40 to!159) (bvsle knownPivot!5 pivot!40) (bvsge knownPivot!5 from!3363)))))

(assert (=> start!117406 e!781836))

(assert (=> start!117406 true))

(declare-fun array_inv!34583 (array!93911) Bool)

(assert (=> start!117406 (array_inv!34583 a!3985)))

(declare-fun b!1379914 () Bool)

(declare-fun res!922229 () Bool)

(assert (=> b!1379914 (=> (not res!922229) (not e!781836))))

(declare-fun isPivot!0 (array!93911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!1379914 (= res!922229 (isPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(declare-fun b!1379915 () Bool)

(declare-fun res!922227 () Bool)

(assert (=> b!1379915 (=> (not res!922227) (not e!781836))))

(assert (=> b!1379915 (= res!922227 (not (= knownPivot!5 pivot!40)))))

(declare-fun b!1379916 () Bool)

(assert (=> b!1379916 (= e!781836 (not true))))

(assert (=> b!1379916 (isPivot!0 a!3985 from!3363 to!159 (bvadd #b00000000000000000000000000000001 knownPivot!5))))

(declare-datatypes ((Unit!45764 0))(
  ( (Unit!45765) )
))
(declare-fun lt!607634 () Unit!45764)

(declare-fun lemmaKnownPivotPlusOneIsPivot!0 (array!93911 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!45764)

(assert (=> b!1379916 (= lt!607634 (lemmaKnownPivotPlusOneIsPivot!0 a!3985 from!3363 to!159 knownPivot!5))))

(assert (= (and start!117406 res!922228) b!1379914))

(assert (= (and b!1379914 res!922229) b!1379915))

(assert (= (and b!1379915 res!922227) b!1379916))

(declare-fun m!1264697 () Bool)

(assert (=> start!117406 m!1264697))

(declare-fun m!1264699 () Bool)

(assert (=> b!1379914 m!1264699))

(declare-fun m!1264701 () Bool)

(assert (=> b!1379916 m!1264701))

(declare-fun m!1264703 () Bool)

(assert (=> b!1379916 m!1264703))

(push 1)

(assert (not b!1379916))

(assert (not start!117406))

(assert (not b!1379914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

