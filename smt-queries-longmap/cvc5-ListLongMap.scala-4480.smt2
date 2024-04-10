; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62348 () Bool)

(assert start!62348)

(declare-fun b!698336 () Bool)

(declare-fun res!462149 () Bool)

(declare-fun e!397020 () Bool)

(assert (=> b!698336 (=> (not res!462149) (not e!397020))))

(declare-datatypes ((List!13211 0))(
  ( (Nil!13208) (Cons!13207 (h!14252 (_ BitVec 64)) (t!19493 List!13211)) )
))
(declare-fun acc!652 () List!13211)

(declare-fun contains!3788 (List!13211 (_ BitVec 64)) Bool)

(assert (=> b!698336 (= res!462149 (not (contains!3788 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698337 () Bool)

(declare-fun res!462153 () Bool)

(assert (=> b!698337 (=> (not res!462153) (not e!397020))))

(declare-fun k!2824 () (_ BitVec 64))

(assert (=> b!698337 (= res!462153 (not (contains!3788 acc!652 k!2824)))))

(declare-fun b!698338 () Bool)

(declare-fun from!2969 () (_ BitVec 32))

(declare-datatypes ((array!40027 0))(
  ( (array!40028 (arr!19170 (Array (_ BitVec 32) (_ BitVec 64))) (size!19555 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40027)

(assert (=> b!698338 (= e!397020 (bvsgt from!2969 (size!19555 a!3591)))))

(declare-fun b!698339 () Bool)

(declare-fun res!462146 () Bool)

(assert (=> b!698339 (=> (not res!462146) (not e!397020))))

(declare-fun arrayContainsKey!0 (array!40027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!698339 (= res!462146 (not (arrayContainsKey!0 a!3591 k!2824 from!2969)))))

(declare-fun res!462147 () Bool)

(assert (=> start!62348 (=> (not res!462147) (not e!397020))))

(assert (=> start!62348 (= res!462147 (and (bvslt (size!19555 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19555 a!3591))))))

(assert (=> start!62348 e!397020))

(assert (=> start!62348 true))

(declare-fun array_inv!14966 (array!40027) Bool)

(assert (=> start!62348 (array_inv!14966 a!3591)))

(declare-fun b!698340 () Bool)

(declare-fun res!462151 () Bool)

(assert (=> b!698340 (=> (not res!462151) (not e!397020))))

(assert (=> b!698340 (= res!462151 (not (contains!3788 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!698341 () Bool)

(declare-fun res!462148 () Bool)

(assert (=> b!698341 (=> (not res!462148) (not e!397020))))

(declare-fun newAcc!49 () List!13211)

(declare-fun noDuplicate!1035 (List!13211) Bool)

(assert (=> b!698341 (= res!462148 (noDuplicate!1035 newAcc!49))))

(declare-fun b!698342 () Bool)

(declare-fun res!462152 () Bool)

(assert (=> b!698342 (=> (not res!462152) (not e!397020))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!698342 (= res!462152 (validKeyInArray!0 k!2824))))

(declare-fun b!698343 () Bool)

(declare-fun res!462150 () Bool)

(assert (=> b!698343 (=> (not res!462150) (not e!397020))))

(assert (=> b!698343 (= res!462150 (noDuplicate!1035 acc!652))))

(assert (= (and start!62348 res!462147) b!698343))

(assert (= (and b!698343 res!462150) b!698341))

(assert (= (and b!698341 res!462148) b!698340))

(assert (= (and b!698340 res!462151) b!698336))

(assert (= (and b!698336 res!462149) b!698339))

(assert (= (and b!698339 res!462146) b!698337))

(assert (= (and b!698337 res!462153) b!698342))

(assert (= (and b!698342 res!462152) b!698338))

(declare-fun m!658621 () Bool)

(assert (=> b!698337 m!658621))

(declare-fun m!658623 () Bool)

(assert (=> b!698343 m!658623))

(declare-fun m!658625 () Bool)

(assert (=> start!62348 m!658625))

(declare-fun m!658627 () Bool)

(assert (=> b!698342 m!658627))

(declare-fun m!658629 () Bool)

(assert (=> b!698340 m!658629))

(declare-fun m!658631 () Bool)

(assert (=> b!698336 m!658631))

(declare-fun m!658633 () Bool)

(assert (=> b!698339 m!658633))

(declare-fun m!658635 () Bool)

(assert (=> b!698341 m!658635))

(push 1)

(assert (not b!698336))

(assert (not start!62348))

(assert (not b!698341))

(assert (not b!698343))

(assert (not b!698337))

(assert (not b!698342))

(assert (not b!698340))

(assert (not b!698339))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

