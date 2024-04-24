; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36528 () Bool)

(assert start!36528)

(declare-fun b!365041 () Bool)

(declare-fun res!204154 () Bool)

(declare-fun e!223440 () Bool)

(assert (=> b!365041 (=> (not res!204154) (not e!223440))))

(declare-fun from!3650 () (_ BitVec 32))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20782 0))(
  ( (array!20783 (arr!9868 (Array (_ BitVec 32) (_ BitVec 64))) (size!10220 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20782)

(assert (=> b!365041 (= res!204154 (and (bvslt (size!10220 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10220 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun e!223442 () Bool)

(declare-fun lt!169163 () array!20782)

(declare-fun b!365042 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20782 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365042 (= e!223442 (not (= (arrayCountValidKeys!0 lt!169163 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))))

(declare-fun b!365043 () Bool)

(assert (=> b!365043 (= e!223440 e!223442)))

(declare-fun res!204156 () Bool)

(assert (=> b!365043 (=> (not res!204156) (not e!223442))))

(assert (=> b!365043 (= res!204156 (= (arrayCountValidKeys!0 lt!169163 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(declare-fun k!2974 () (_ BitVec 64))

(assert (=> b!365043 (= lt!169163 (array!20783 (store (arr!9868 a!4289) i!1472 k!2974) (size!10220 a!4289)))))

(declare-fun b!365044 () Bool)

(declare-fun res!204155 () Bool)

(assert (=> b!365044 (=> (not res!204155) (not e!223440))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365044 (= res!204155 (validKeyInArray!0 k!2974))))

(declare-fun b!365045 () Bool)

(declare-fun res!204153 () Bool)

(assert (=> b!365045 (=> (not res!204153) (not e!223440))))

(assert (=> b!365045 (= res!204153 (not (validKeyInArray!0 (select (arr!9868 a!4289) i!1472))))))

(declare-fun res!204152 () Bool)

(assert (=> start!36528 (=> (not res!204152) (not e!223440))))

(assert (=> start!36528 (= res!204152 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10220 a!4289))))))

(assert (=> start!36528 e!223440))

(assert (=> start!36528 true))

(declare-fun array_inv!7340 (array!20782) Bool)

(assert (=> start!36528 (array_inv!7340 a!4289)))

(declare-fun b!365046 () Bool)

(declare-fun res!204157 () Bool)

(assert (=> b!365046 (=> (not res!204157) (not e!223442))))

(assert (=> b!365046 (= res!204157 (bvsle from!3650 #b00000000000000000000000000000000))))

(assert (= (and start!36528 res!204152) b!365045))

(assert (= (and b!365045 res!204153) b!365044))

(assert (= (and b!365044 res!204155) b!365041))

(assert (= (and b!365041 res!204154) b!365043))

(assert (= (and b!365043 res!204156) b!365046))

(assert (= (and b!365046 res!204157) b!365042))

(declare-fun m!363157 () Bool)

(assert (=> start!36528 m!363157))

(declare-fun m!363159 () Bool)

(assert (=> b!365044 m!363159))

(declare-fun m!363161 () Bool)

(assert (=> b!365042 m!363161))

(declare-fun m!363163 () Bool)

(assert (=> b!365042 m!363163))

(declare-fun m!363165 () Bool)

(assert (=> b!365043 m!363165))

(declare-fun m!363167 () Bool)

(assert (=> b!365043 m!363167))

(declare-fun m!363169 () Bool)

(assert (=> b!365043 m!363169))

(declare-fun m!363171 () Bool)

(assert (=> b!365045 m!363171))

(assert (=> b!365045 m!363171))

(declare-fun m!363173 () Bool)

(assert (=> b!365045 m!363173))

(push 1)

(assert (not b!365045))

(assert (not b!365043))

(assert (not b!365044))

(assert (not start!36528))

(assert (not b!365042))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

