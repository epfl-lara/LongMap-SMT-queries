; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104164 () Bool)

(assert start!104164)

(declare-fun b!1245202 () Bool)

(declare-fun res!830706 () Bool)

(declare-fun e!705970 () Bool)

(assert (=> b!1245202 (=> (not res!830706) (not e!705970))))

(declare-datatypes ((array!80134 0))(
  ( (array!80135 (arr!38653 (Array (_ BitVec 32) (_ BitVec 64))) (size!39189 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80134)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27456 0))(
  ( (Nil!27453) (Cons!27452 (h!28661 (_ BitVec 64)) (t!40925 List!27456)) )
))
(declare-fun arrayNoDuplicates!0 (array!80134 (_ BitVec 32) List!27456) Bool)

(assert (=> b!1245202 (= res!830706 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27453))))

(declare-fun res!830705 () Bool)

(assert (=> start!104164 (=> (not res!830705) (not e!705970))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104164 (= res!830705 (and (bvslt (size!39189 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39189 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39189 a!3892))))))

(assert (=> start!104164 e!705970))

(declare-fun array_inv!29501 (array!80134) Bool)

(assert (=> start!104164 (array_inv!29501 a!3892)))

(assert (=> start!104164 true))

(declare-fun b!1245203 () Bool)

(declare-fun res!830704 () Bool)

(assert (=> b!1245203 (=> (not res!830704) (not e!705970))))

(assert (=> b!1245203 (= res!830704 (and (= from!3270 newFrom!287) (bvsge newFrom!287 #b00000000000000000000000000000000)))))

(declare-fun b!1245204 () Bool)

(declare-fun e!705972 () Bool)

(assert (=> b!1245204 (= e!705970 e!705972)))

(declare-fun res!830703 () Bool)

(assert (=> b!1245204 (=> res!830703 e!705972)))

(declare-fun contains!7443 (List!27456 (_ BitVec 64)) Bool)

(assert (=> b!1245204 (= res!830703 (contains!7443 Nil!27453 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245205 () Bool)

(assert (=> b!1245205 (= e!705972 (contains!7443 Nil!27453 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245206 () Bool)

(declare-fun res!830707 () Bool)

(assert (=> b!1245206 (=> (not res!830707) (not e!705970))))

(declare-fun noDuplicate!2022 (List!27456) Bool)

(assert (=> b!1245206 (= res!830707 (noDuplicate!2022 Nil!27453))))

(assert (= (and start!104164 res!830705) b!1245202))

(assert (= (and b!1245202 res!830706) b!1245203))

(assert (= (and b!1245203 res!830704) b!1245206))

(assert (= (and b!1245206 res!830707) b!1245204))

(assert (= (and b!1245204 (not res!830703)) b!1245205))

(declare-fun m!1147301 () Bool)

(assert (=> b!1245204 m!1147301))

(declare-fun m!1147303 () Bool)

(assert (=> start!104164 m!1147303))

(declare-fun m!1147305 () Bool)

(assert (=> b!1245202 m!1147305))

(declare-fun m!1147307 () Bool)

(assert (=> b!1245205 m!1147307))

(declare-fun m!1147309 () Bool)

(assert (=> b!1245206 m!1147309))

(push 1)

(assert (not b!1245205))

(assert (not start!104164))

(assert (not b!1245202))

(assert (not b!1245206))

(assert (not b!1245204))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1245275 () Bool)

(declare-fun e!706036 () Bool)

(declare-fun e!706034 () Bool)

(assert (=> b!1245275 (= e!706036 e!706034)))

(declare-fun c!121942 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245275 (= c!121942 (validKeyInArray!0 (select (arr!38653 a!3892) from!3270)))))

(declare-fun b!1245276 () Bool)

(declare-fun call!61474 () Bool)

(assert (=> b!1245276 (= e!706034 call!61474)))

(declare-fun b!1245277 () Bool)

(declare-fun e!706033 () Bool)

(assert (=> b!1245277 (= e!706033 e!706036)))

(declare-fun res!830761 () Bool)

(assert (=> b!1245277 (=> (not res!830761) (not e!706036))))

