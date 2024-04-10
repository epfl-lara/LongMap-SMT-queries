; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103946 () Bool)

(assert start!103946)

(declare-fun res!829923 () Bool)

(declare-fun e!705211 () Bool)

(assert (=> start!103946 (=> (not res!829923) (not e!705211))))

(declare-datatypes ((array!80038 0))(
  ( (array!80039 (arr!38612 (Array (_ BitVec 32) (_ BitVec 64))) (size!39148 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80038)

(declare-fun newFrom!287 () (_ BitVec 32))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> start!103946 (= res!829923 (and (bvslt (size!39148 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39148 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39148 a!3892))))))

(assert (=> start!103946 e!705211))

(declare-fun array_inv!29460 (array!80038) Bool)

(assert (=> start!103946 (array_inv!29460 a!3892)))

(assert (=> start!103946 true))

(declare-fun b!1244202 () Bool)

(declare-fun res!829924 () Bool)

(assert (=> b!1244202 (=> (not res!829924) (not e!705211))))

(declare-datatypes ((List!27415 0))(
  ( (Nil!27412) (Cons!27411 (h!28620 (_ BitVec 64)) (t!40884 List!27415)) )
))
(declare-fun arrayNoDuplicates!0 (array!80038 (_ BitVec 32) List!27415) Bool)

(assert (=> b!1244202 (= res!829924 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27412))))

(declare-fun b!1244203 () Bool)

(declare-fun e!705212 () Bool)

(assert (=> b!1244203 (= e!705212 false)))

(declare-fun lt!562637 () Bool)

(assert (=> b!1244203 (= lt!562637 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27412))))

(declare-fun b!1244204 () Bool)

(declare-fun res!829922 () Bool)

(assert (=> b!1244204 (=> (not res!829922) (not e!705211))))

(assert (=> b!1244204 (= res!829922 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39148 a!3892)) (not (= newFrom!287 (size!39148 a!3892)))))))

(declare-fun b!1244205 () Bool)

(declare-datatypes ((Unit!41342 0))(
  ( (Unit!41343) )
))
(declare-fun e!705213 () Unit!41342)

(declare-fun lt!562635 () Unit!41342)

(assert (=> b!1244205 (= e!705213 lt!562635)))

(declare-fun lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 (array!80038 List!27415 List!27415 (_ BitVec 32)) Unit!41342)

(assert (=> b!1244205 (= lt!562635 (lemmaArrayNoDuplicateWithAnAccThenWithSubSeqAcc!0 a!3892 (Cons!27411 (select (arr!38612 a!3892) from!3270) Nil!27412) Nil!27412 (bvadd #b00000000000000000000000000000001 from!3270)))))

(assert (=> b!1244205 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) Nil!27412)))

(declare-fun b!1244206 () Bool)

(declare-fun Unit!41344 () Unit!41342)

(assert (=> b!1244206 (= e!705213 Unit!41344)))

(declare-fun b!1244207 () Bool)

(assert (=> b!1244207 (= e!705211 e!705212)))

(declare-fun res!829921 () Bool)

(assert (=> b!1244207 (=> (not res!829921) (not e!705212))))

(assert (=> b!1244207 (= res!829921 (and (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000) (bvsge newFrom!287 (bvadd #b00000000000000000000000000000001 from!3270))))))

(declare-fun lt!562636 () Unit!41342)

(assert (=> b!1244207 (= lt!562636 e!705213)))

(declare-fun c!121825 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244207 (= c!121825 (validKeyInArray!0 (select (arr!38612 a!3892) from!3270)))))

(assert (= (and start!103946 res!829923) b!1244202))

(assert (= (and b!1244202 res!829924) b!1244204))

(assert (= (and b!1244204 res!829922) b!1244207))

(assert (= (and b!1244207 c!121825) b!1244205))

(assert (= (and b!1244207 (not c!121825)) b!1244206))

(assert (= (and b!1244207 res!829921) b!1244203))

(declare-fun m!1146551 () Bool)

(assert (=> start!103946 m!1146551))

(declare-fun m!1146553 () Bool)

(assert (=> b!1244207 m!1146553))

(assert (=> b!1244207 m!1146553))

(declare-fun m!1146555 () Bool)

(assert (=> b!1244207 m!1146555))

(declare-fun m!1146557 () Bool)

(assert (=> b!1244202 m!1146557))

(declare-fun m!1146559 () Bool)

(assert (=> b!1244203 m!1146559))

(assert (=> b!1244205 m!1146553))

(declare-fun m!1146561 () Bool)

(assert (=> b!1244205 m!1146561))

(assert (=> b!1244205 m!1146559))

(push 1)

(assert (not start!103946))

(assert (not b!1244207))

