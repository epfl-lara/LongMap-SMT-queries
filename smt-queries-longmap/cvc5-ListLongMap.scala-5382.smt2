; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71874 () Bool)

(assert start!71874)

(declare-fun b!835191 () Bool)

(declare-fun res!568198 () Bool)

(declare-fun e!465904 () Bool)

(assert (=> b!835191 (=> (not res!568198) (not e!465904))))

(declare-datatypes ((array!46773 0))(
  ( (array!46774 (arr!22421 (Array (_ BitVec 32) (_ BitVec 64))) (size!22842 (_ BitVec 32))) )
))
(declare-fun a!4227 () array!46773)

(declare-fun i!1466 () (_ BitVec 32))

(declare-fun to!390 () (_ BitVec 32))

(assert (=> b!835191 (= res!568198 (and (bvslt (size!22842 a!4227) #b01111111111111111111111111111111) (bvsge to!390 #b00000000000000000000000000000000) (bvsle to!390 (size!22842 a!4227)) (bvsgt to!390 i!1466)))))

(declare-fun b!835192 () Bool)

(declare-fun res!568200 () Bool)

(assert (=> b!835192 (=> (not res!568200) (not e!465904))))

(declare-fun k!2968 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!46773 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!835192 (= res!568200 (= (arrayCountValidKeys!0 (array!46774 (store (arr!22421 a!4227) i!1466 k!2968) (size!22842 a!4227)) (bvadd #b00000000000000000000000000000001 i!1466) to!390) (arrayCountValidKeys!0 a!4227 (bvadd #b00000000000000000000000000000001 i!1466) to!390)))))

(declare-fun res!568199 () Bool)

(assert (=> start!71874 (=> (not res!568199) (not e!465904))))

(assert (=> start!71874 (= res!568199 (and (bvsge i!1466 #b00000000000000000000000000000000) (bvslt i!1466 (size!22842 a!4227))))))

(assert (=> start!71874 e!465904))

(assert (=> start!71874 true))

(declare-fun array_inv!17933 (array!46773) Bool)

(assert (=> start!71874 (array_inv!17933 a!4227)))

(declare-fun b!835193 () Bool)

(declare-fun res!568204 () Bool)

(assert (=> b!835193 (=> (not res!568204) (not e!465904))))

(assert (=> b!835193 (= res!568204 (not (= to!390 (size!22842 a!4227))))))

(declare-fun b!835194 () Bool)

(assert (=> b!835194 (= e!465904 (or (bvslt (bvadd #b00000000000000000000000000000001 i!1466) #b00000000000000000000000000000000) (bvsge to!390 (size!22842 a!4227))))))

(declare-fun b!835195 () Bool)

(declare-fun res!568202 () Bool)

(assert (=> b!835195 (=> (not res!568202) (not e!465904))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!835195 (= res!568202 (validKeyInArray!0 k!2968))))

(declare-fun b!835196 () Bool)

(declare-fun res!568201 () Bool)

(assert (=> b!835196 (=> (not res!568201) (not e!465904))))

(assert (=> b!835196 (= res!568201 (not (validKeyInArray!0 (select (arr!22421 a!4227) to!390))))))

(declare-fun b!835197 () Bool)

(declare-fun res!568203 () Bool)

(assert (=> b!835197 (=> (not res!568203) (not e!465904))))

(assert (=> b!835197 (= res!568203 (not (validKeyInArray!0 (select (arr!22421 a!4227) i!1466))))))

(assert (= (and start!71874 res!568199) b!835197))

(assert (= (and b!835197 res!568203) b!835195))

(assert (= (and b!835195 res!568202) b!835191))

(assert (= (and b!835191 res!568198) b!835192))

(assert (= (and b!835192 res!568200) b!835193))

(assert (= (and b!835193 res!568204) b!835196))

(assert (= (and b!835196 res!568201) b!835194))

(declare-fun m!779851 () Bool)

(assert (=> start!71874 m!779851))

(declare-fun m!779853 () Bool)

(assert (=> b!835195 m!779853))

(declare-fun m!779855 () Bool)

(assert (=> b!835192 m!779855))

(declare-fun m!779857 () Bool)

(assert (=> b!835192 m!779857))

(declare-fun m!779859 () Bool)

(assert (=> b!835192 m!779859))

(declare-fun m!779861 () Bool)

(assert (=> b!835196 m!779861))

(assert (=> b!835196 m!779861))

(declare-fun m!779863 () Bool)

(assert (=> b!835196 m!779863))

(declare-fun m!779865 () Bool)

(assert (=> b!835197 m!779865))

(assert (=> b!835197 m!779865))

(declare-fun m!779867 () Bool)

(assert (=> b!835197 m!779867))

(push 1)

(assert (not b!835192))

(assert (not b!835196))

(assert (not start!71874))

(assert (not b!835197))

(assert (not b!835195))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

