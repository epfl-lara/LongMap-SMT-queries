; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71842 () Bool)

(assert start!71842)

(declare-fun b!835000 () Bool)

(declare-fun res!567870 () Bool)

(declare-fun e!465869 () Bool)

(assert (=> b!835000 (=> (not res!567870) (not e!465869))))

(declare-datatypes ((array!46752 0))(
  ( (array!46753 (arr!22410 (Array (_ BitVec 32) (_ BitVec 64))) (size!22831 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46752)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835000 (= res!567870 (and (bvslt (size!22831 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22831 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835001 () Bool)

(assert (=> b!835001 (= e!465869 false)))

(declare-fun lt!379630 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!46752 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835001 (= lt!379630 (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun lt!379629 () (_ BitVec 32))

(assert (=> b!835001 (= lt!379629 (arrayCountValidKeys!0 (array!46753 (store (arr!22410 a!4227) i!1466 k!2968) (size!22831 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390))))

(declare-fun b!834998 () Bool)

(declare-fun res!567871 () Bool)

(assert (=> b!834998 (=> (not res!567871) (not e!465869))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!834998 (= res!567871 (not (validKeyInArray!0 (select (arr!22410 a!4227) i!1466))))))

(declare-fun b!834999 () Bool)

(declare-fun res!567869 () Bool)

(assert (=> b!834999 (=> (not res!567869) (not e!465869))))

(assert (=> b!834999 (= res!567869 (validKeyInArray!0 k!2968))))

(declare-fun res!567872 () Bool)

(assert (=> start!71842 (=> (not res!567872) (not e!465869))))

(assert (=> start!71842 (= res!567872 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22831 a!4227))))))

(assert (=> start!71842 e!465869))

(assert (=> start!71842 true))

(declare-fun array_inv!17857 (array!46752) Bool)

(assert (=> start!71842 (array_inv!17857 a!4227)))

(assert (= (and start!71842 res!567872) b!834998))

(assert (= (and b!834998 res!567871) b!834999))

(assert (= (and b!834999 res!567869) b!835000))

(assert (= (and b!835000 res!567870) b!835001))

(declare-fun m!780159 () Bool)

(assert (=> b!835001 m!780159))

(declare-fun m!780161 () Bool)

(assert (=> b!835001 m!780161))

(declare-fun m!780163 () Bool)

(assert (=> b!835001 m!780163))

(declare-fun m!780165 () Bool)

(assert (=> b!834998 m!780165))

(assert (=> b!834998 m!780165))

(declare-fun m!780167 () Bool)

(assert (=> b!834998 m!780167))

(declare-fun m!780169 () Bool)

(assert (=> b!834999 m!780169))

(declare-fun m!780171 () Bool)

(assert (=> start!71842 m!780171))

(push 1)

(assert (not b!834999))

(assert (not b!834998))

(assert (not start!71842))

(assert (not b!835001))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

