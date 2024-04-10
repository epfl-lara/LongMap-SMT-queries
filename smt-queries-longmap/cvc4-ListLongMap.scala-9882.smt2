; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!117012 () Bool)

(assert start!117012)

(declare-fun res!920544 () Bool)

(declare-fun e!780570 () Bool)

(assert (=> start!117012 (=> (not res!920544) (not e!780570))))

(declare-datatypes ((array!93654 0))(
  ( (array!93655 (arr!45229 (Array (_ BitVec 32) (_ BitVec 64))) (size!45779 (_ BitVec 32))) )
))
(declare-fun a!4197 () array!93654)

(declare-fun from!3564 () (_ BitVec 32))

(declare-fun to!360 () (_ BitVec 32))

(assert (=> start!117012 (= res!920544 (and (bvslt (size!45779 a!4197) #b01111111111111111111111111111111) (bvsge from!3564 #b00000000000000000000000000000000) (bvsge to!360 from!3564) (bvslt to!360 (size!45779 a!4197))))))

(assert (=> start!117012 e!780570))

(declare-fun array_inv!34257 (array!93654) Bool)

(assert (=> start!117012 (array_inv!34257 a!4197)))

(assert (=> start!117012 true))

(declare-fun b!1377918 () Bool)

(declare-fun res!920545 () Bool)

(assert (=> b!1377918 (=> (not res!920545) (not e!780570))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1377918 (= res!920545 (validKeyInArray!0 (select (arr!45229 a!4197) to!360)))))

(declare-fun b!1377919 () Bool)

(assert (=> b!1377919 (= e!780570 (or (bvslt (bvadd #b00000000000000000000000000000001 to!360) from!3564) (bvsgt to!360 (bvadd #b00000000000000000000000000000001 to!360))))))

(assert (= (and start!117012 res!920544) b!1377918))

(assert (= (and b!1377918 res!920545) b!1377919))

(declare-fun m!1262375 () Bool)

(assert (=> start!117012 m!1262375))

(declare-fun m!1262377 () Bool)

(assert (=> b!1377918 m!1262377))

(assert (=> b!1377918 m!1262377))

(declare-fun m!1262379 () Bool)

(assert (=> b!1377918 m!1262379))

(push 1)

(assert (not b!1377918))

(assert (not start!117012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

