; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104064 () Bool)

(assert start!104064)

(declare-fun res!830367 () Bool)

(declare-fun e!705641 () Bool)

(assert (=> start!104064 (=> (not res!830367) (not e!705641))))

(declare-datatypes ((array!80084 0))(
  ( (array!80085 (arr!38632 (Array (_ BitVec 32) (_ BitVec 64))) (size!39168 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80084)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!104064 (= res!830367 (and (bvslt (size!39168 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39168 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39168 a!3892))))))

(assert (=> start!104064 e!705641))

(declare-fun array_inv!29480 (array!80084) Bool)

(assert (=> start!104064 (array_inv!29480 a!3892)))

(assert (=> start!104064 true))

(declare-fun b!1244812 () Bool)

(declare-fun res!830368 () Bool)

(assert (=> b!1244812 (=> (not res!830368) (not e!705641))))

(declare-datatypes ((List!27435 0))(
  ( (Nil!27432) (Cons!27431 (h!28640 (_ BitVec 64)) (t!40904 List!27435)) )
))
(declare-fun arrayNoDuplicates!0 (array!80084 (_ BitVec 32) List!27435) Bool)

(assert (=> b!1244812 (= res!830368 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27432))))

(declare-fun b!1244813 () Bool)

(assert (=> b!1244813 (= e!705641 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39168 a!3892)) (= newFrom!287 (size!39168 a!3892)) (bvslt newFrom!287 #b00000000000000000000000000000000)))))

(assert (= (and start!104064 res!830367) b!1244812))

(assert (= (and b!1244812 res!830368) b!1244813))

(declare-fun m!1147045 () Bool)

(assert (=> start!104064 m!1147045))

(declare-fun m!1147047 () Bool)

(assert (=> b!1244812 m!1147047))

(push 1)

(assert (not b!1244812))

(assert (not start!104064))

(check-sat)

(pop 1)

(push 1)

(check-sat)

