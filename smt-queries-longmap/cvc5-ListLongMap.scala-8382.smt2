; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101968 () Bool)

(assert start!101968)

(declare-fun b!1227559 () Bool)

(declare-fun res!816180 () Bool)

(declare-fun e!697012 () Bool)

(assert (=> b!1227559 (=> (not res!816180) (not e!697012))))

(declare-datatypes ((List!27016 0))(
  ( (Nil!27013) (Cons!27012 (h!28221 (_ BitVec 64)) (t!40479 List!27016)) )
))
(declare-fun acc!823 () List!27016)

(declare-fun contains!7078 (List!27016 (_ BitVec 64)) Bool)

(assert (=> b!1227559 (= res!816180 (not (contains!7078 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227560 () Bool)

(declare-fun res!816174 () Bool)

(assert (=> b!1227560 (=> (not res!816174) (not e!697012))))

(declare-datatypes ((array!79241 0))(
  ( (array!79242 (arr!38243 (Array (_ BitVec 32) (_ BitVec 64))) (size!38779 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79241)

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1227560 (= res!816174 (validKeyInArray!0 (select (arr!38243 a!3806) from!3184)))))

(declare-fun b!1227561 () Bool)

(declare-fun res!816171 () Bool)

(declare-fun e!697013 () Bool)

(assert (=> b!1227561 (=> res!816171 e!697013)))

(declare-fun subseq!482 (List!27016 List!27016) Bool)

(assert (=> b!1227561 (= res!816171 (not (subseq!482 Nil!27013 acc!823)))))

(declare-fun b!1227562 () Bool)

(assert (=> b!1227562 (= e!697013 true)))

(declare-datatypes ((Unit!40652 0))(
  ( (Unit!40653) )
))
(declare-fun lt!558924 () Unit!40652)

(declare-fun noDuplicateSubseq!35 (List!27016 List!27016) Unit!40652)

(assert (=> b!1227562 (= lt!558924 (noDuplicateSubseq!35 Nil!27013 acc!823))))

(declare-fun b!1227563 () Bool)

(declare-fun res!816175 () Bool)

(assert (=> b!1227563 (=> (not res!816175) (not e!697012))))

(declare-fun noDuplicate!1675 (List!27016) Bool)

(assert (=> b!1227563 (= res!816175 (noDuplicate!1675 acc!823))))

(declare-fun b!1227564 () Bool)

(declare-fun res!816179 () Bool)

(assert (=> b!1227564 (=> res!816179 e!697013)))

(assert (=> b!1227564 (= res!816179 (contains!7078 Nil!27013 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227566 () Bool)

(declare-fun res!816183 () Bool)

(assert (=> b!1227566 (=> res!816183 e!697013)))

(assert (=> b!1227566 (= res!816183 (contains!7078 Nil!27013 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227567 () Bool)

(declare-fun res!816176 () Bool)

(assert (=> b!1227567 (=> (not res!816176) (not e!697012))))

(declare-fun arrayNoDuplicates!0 (array!79241 (_ BitVec 32) List!27016) Bool)

(assert (=> b!1227567 (= res!816176 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1227568 () Bool)

(declare-fun res!816172 () Bool)

(assert (=> b!1227568 (=> (not res!816172) (not e!697012))))

(declare-fun k!2913 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!79241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1227568 (= res!816172 (arrayContainsKey!0 a!3806 k!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1227569 () Bool)

(declare-fun res!816173 () Bool)

(assert (=> b!1227569 (=> (not res!816173) (not e!697012))))

(assert (=> b!1227569 (= res!816173 (not (contains!7078 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1227570 () Bool)

(declare-fun res!816177 () Bool)

(assert (=> b!1227570 (=> (not res!816177) (not e!697012))))

(assert (=> b!1227570 (= res!816177 (validKeyInArray!0 k!2913))))

(declare-fun b!1227571 () Bool)

(declare-fun res!816182 () Bool)

(assert (=> b!1227571 (=> (not res!816182) (not e!697012))))

(assert (=> b!1227571 (= res!816182 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38779 a!3806)) (bvslt from!3184 (size!38779 a!3806))))))

(declare-fun b!1227565 () Bool)

(assert (=> b!1227565 (= e!697012 (not e!697013))))

(declare-fun res!816178 () Bool)

(assert (=> b!1227565 (=> res!816178 e!697013)))

(assert (=> b!1227565 (= res!816178 (bvsgt from!3184 (size!38779 a!3806)))))

(assert (=> b!1227565 (arrayNoDuplicates!0 a!3806 (bvadd #b00000000000000000000000000000001 from!3184) (Cons!27012 (select (arr!38243 a!3806) from!3184) acc!823))))

(declare-fun res!816181 () Bool)

(assert (=> start!101968 (=> (not res!816181) (not e!697012))))

(assert (=> start!101968 (= res!816181 (bvslt (size!38779 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101968 e!697012))

(declare-fun array_inv!29091 (array!79241) Bool)

(assert (=> start!101968 (array_inv!29091 a!3806)))

(assert (=> start!101968 true))

(assert (= (and start!101968 res!816181) b!1227570))

(assert (= (and b!1227570 res!816177) b!1227571))

(assert (= (and b!1227571 res!816182) b!1227563))

(assert (= (and b!1227563 res!816175) b!1227569))

(assert (= (and b!1227569 res!816173) b!1227559))

(assert (= (and b!1227559 res!816180) b!1227568))

(assert (= (and b!1227568 res!816172) b!1227567))

(assert (= (and b!1227567 res!816176) b!1227560))

(assert (= (and b!1227560 res!816174) b!1227565))

(assert (= (and b!1227565 (not res!816178)) b!1227566))

(assert (= (and b!1227566 (not res!816183)) b!1227564))

(assert (= (and b!1227564 (not res!816179)) b!1227561))

(assert (= (and b!1227561 (not res!816171)) b!1227562))

(declare-fun m!1132311 () Bool)

(assert (=> b!1227566 m!1132311))

(declare-fun m!1132313 () Bool)

(assert (=> b!1227565 m!1132313))

(declare-fun m!1132315 () Bool)

(assert (=> b!1227565 m!1132315))

(assert (=> b!1227560 m!1132313))

(assert (=> b!1227560 m!1132313))

(declare-fun m!1132317 () Bool)

(assert (=> b!1227560 m!1132317))

(declare-fun m!1132319 () Bool)

(assert (=> b!1227561 m!1132319))

(declare-fun m!1132321 () Bool)

(assert (=> start!101968 m!1132321))

(declare-fun m!1132323 () Bool)

(assert (=> b!1227562 m!1132323))

(declare-fun m!1132325 () Bool)

(assert (=> b!1227568 m!1132325))

(declare-fun m!1132327 () Bool)

(assert (=> b!1227569 m!1132327))

(declare-fun m!1132329 () Bool)

(assert (=> b!1227567 m!1132329))

(declare-fun m!1132331 () Bool)

(assert (=> b!1227563 m!1132331))

(declare-fun m!1132333 () Bool)

(assert (=> b!1227570 m!1132333))

(declare-fun m!1132335 () Bool)

(assert (=> b!1227559 m!1132335))

(declare-fun m!1132337 () Bool)

(assert (=> b!1227564 m!1132337))

(push 1)

(assert (not b!1227570))

(assert (not b!1227569))

(assert (not b!1227560))

(assert (not b!1227563))

(assert (not b!1227565))

(assert (not b!1227568))

(assert (not b!1227561))

(assert (not b!1227564))

(assert (not b!1227566))

(assert (not b!1227567))

(assert (not start!101968))

(assert (not b!1227559))

(assert (not b!1227562))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

