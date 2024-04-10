; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36542 () Bool)

(assert start!36542)

(declare-fun res!204155 () Bool)

(declare-fun e!223474 () Bool)

(assert (=> start!36542 (=> (not res!204155) (not e!223474))))

(declare-fun i!1472 () (_ BitVec 32))

(declare-datatypes ((array!20801 0))(
  ( (array!20802 (arr!9878 (Array (_ BitVec 32) (_ BitVec 64))) (size!10230 (_ BitVec 32))) )
))
(declare-fun a!4289 () array!20801)

(assert (=> start!36542 (= res!204155 (and (bvsge i!1472 #b00000000000000000000000000000000) (bvslt i!1472 (size!10230 a!4289))))))

(assert (=> start!36542 e!223474))

(assert (=> start!36542 true))

(declare-fun array_inv!7320 (array!20801) Bool)

(assert (=> start!36542 (array_inv!7320 a!4289)))

(declare-fun e!223473 () Bool)

(declare-fun b!365090 () Bool)

(declare-fun lt!169144 () array!20801)

(declare-fun arrayCountValidKeys!0 (array!20801 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!365090 (= e!223473 (not (= (arrayCountValidKeys!0 lt!169144 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1472))))))))

(declare-fun b!365091 () Bool)

(declare-fun res!204157 () Bool)

(assert (=> b!365091 (=> (not res!204157) (not e!223474))))

(declare-fun k0!2974 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365091 (= res!204157 (validKeyInArray!0 k0!2974))))

(declare-fun b!365092 () Bool)

(declare-fun res!204156 () Bool)

(assert (=> b!365092 (=> (not res!204156) (not e!223473))))

(declare-fun from!3650 () (_ BitVec 32))

(assert (=> b!365092 (= res!204156 (bvsle from!3650 #b00000000000000000000000000000000))))

(declare-fun b!365093 () Bool)

(declare-fun res!204158 () Bool)

(assert (=> b!365093 (=> (not res!204158) (not e!223474))))

(assert (=> b!365093 (= res!204158 (and (bvslt (size!10230 a!4289) #b01111111111111111111111111111111) (bvsge from!3650 #b00000000000000000000000000000000) (bvsle from!3650 (size!10230 a!4289)) (bvsge i!1472 from!3650)))))

(declare-fun b!365094 () Bool)

(declare-fun res!204159 () Bool)

(assert (=> b!365094 (=> (not res!204159) (not e!223474))))

(assert (=> b!365094 (= res!204159 (not (validKeyInArray!0 (select (arr!9878 a!4289) i!1472))))))

(declare-fun b!365095 () Bool)

(assert (=> b!365095 (= e!223474 e!223473)))

(declare-fun res!204160 () Bool)

(assert (=> b!365095 (=> (not res!204160) (not e!223473))))

(assert (=> b!365095 (= res!204160 (= (arrayCountValidKeys!0 lt!169144 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4289 from!3650 (bvadd #b00000000000000000000000000000001 i!1472)))))))

(assert (=> b!365095 (= lt!169144 (array!20802 (store (arr!9878 a!4289) i!1472 k0!2974) (size!10230 a!4289)))))

(assert (= (and start!36542 res!204155) b!365094))

(assert (= (and b!365094 res!204159) b!365091))

(assert (= (and b!365091 res!204157) b!365093))

(assert (= (and b!365093 res!204158) b!365095))

(assert (= (and b!365095 res!204160) b!365092))

(assert (= (and b!365092 res!204156) b!365090))

(declare-fun m!362927 () Bool)

(assert (=> b!365091 m!362927))

(declare-fun m!362929 () Bool)

(assert (=> start!36542 m!362929))

(declare-fun m!362931 () Bool)

(assert (=> b!365090 m!362931))

(declare-fun m!362933 () Bool)

(assert (=> b!365090 m!362933))

(declare-fun m!362935 () Bool)

(assert (=> b!365094 m!362935))

(assert (=> b!365094 m!362935))

(declare-fun m!362937 () Bool)

(assert (=> b!365094 m!362937))

(declare-fun m!362939 () Bool)

(assert (=> b!365095 m!362939))

(declare-fun m!362941 () Bool)

(assert (=> b!365095 m!362941))

(declare-fun m!362943 () Bool)

(assert (=> b!365095 m!362943))

(check-sat (not b!365094) (not start!36542) (not b!365090) (not b!365095) (not b!365091))
(check-sat)
