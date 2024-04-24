; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103094 () Bool)

(assert start!103094)

(declare-fun b!1237622 () Bool)

(declare-fun res!824814 () Bool)

(declare-fun e!701642 () Bool)

(assert (=> b!1237622 (=> (not res!824814) (not e!701642))))

(declare-datatypes ((array!79737 0))(
  ( (array!79738 (arr!38470 (Array (_ BitVec 32) (_ BitVec 64))) (size!39007 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79737)

(declare-datatypes ((List!27256 0))(
  ( (Nil!27253) (Cons!27252 (h!28470 (_ BitVec 64)) (t!40711 List!27256)) )
))
(declare-fun acc!846 () List!27256)

(declare-fun from!3213 () (_ BitVec 32))

(declare-fun arrayNoDuplicates!0 (array!79737 (_ BitVec 32) List!27256) Bool)

(assert (=> b!1237622 (= res!824814 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1237623 () Bool)

(assert (=> b!1237623 (= e!701642 false)))

(declare-fun lt!561260 () Bool)

(declare-fun k!2925 () (_ BitVec 64))

(declare-fun contains!7327 (List!27256 (_ BitVec 64)) Bool)

(assert (=> b!1237623 (= lt!561260 (contains!7327 acc!846 k!2925))))

(declare-fun b!1237624 () Bool)

(declare-fun res!824813 () Bool)

(assert (=> b!1237624 (=> (not res!824813) (not e!701642))))

(assert (=> b!1237624 (= res!824813 (not (contains!7327 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1237625 () Bool)

(declare-fun res!824817 () Bool)

(assert (=> b!1237625 (=> (not res!824817) (not e!701642))))

(assert (=> b!1237625 (= res!824817 (not (contains!7327 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!824816 () Bool)

(assert (=> start!103094 (=> (not res!824816) (not e!701642))))

(assert (=> start!103094 (= res!824816 (and (bvslt (size!39007 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!39007 a!3835))))))

(assert (=> start!103094 e!701642))

(declare-fun array_inv!29408 (array!79737) Bool)

(assert (=> start!103094 (array_inv!29408 a!3835)))

(assert (=> start!103094 true))

(declare-fun b!1237626 () Bool)

(declare-fun res!824815 () Bool)

(assert (=> b!1237626 (=> (not res!824815) (not e!701642))))

(declare-fun noDuplicate!1908 (List!27256) Bool)

(assert (=> b!1237626 (= res!824815 (noDuplicate!1908 acc!846))))

(assert (= (and start!103094 res!824816) b!1237626))

(assert (= (and b!1237626 res!824815) b!1237624))

(assert (= (and b!1237624 res!824813) b!1237625))

(assert (= (and b!1237625 res!824817) b!1237622))

(assert (= (and b!1237622 res!824814) b!1237623))

(declare-fun m!1141787 () Bool)

(assert (=> b!1237625 m!1141787))

(declare-fun m!1141789 () Bool)

(assert (=> b!1237624 m!1141789))

(declare-fun m!1141791 () Bool)

(assert (=> b!1237623 m!1141791))

(declare-fun m!1141793 () Bool)

(assert (=> start!103094 m!1141793))

(declare-fun m!1141795 () Bool)

(assert (=> b!1237626 m!1141795))

(declare-fun m!1141797 () Bool)

(assert (=> b!1237622 m!1141797))

(push 1)

(assert (not b!1237625))

(assert (not b!1237626))

(assert (not b!1237623))

(assert (not start!103094))

(assert (not b!1237624))

(assert (not b!1237622))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

