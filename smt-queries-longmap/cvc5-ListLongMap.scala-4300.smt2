; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!59890 () Bool)

(assert start!59890)

(declare-fun b!661440 () Bool)

(declare-fun res!429405 () Bool)

(declare-fun e!380006 () Bool)

(assert (=> b!661440 (=> (not res!429405) (not e!380006))))

(declare-fun e!380005 () Bool)

(assert (=> b!661440 (= res!429405 e!380005)))

(declare-fun res!429394 () Bool)

(assert (=> b!661440 (=> res!429394 e!380005)))

(declare-fun e!380004 () Bool)

(assert (=> b!661440 (= res!429394 e!380004)))

(declare-fun res!429393 () Bool)

(assert (=> b!661440 (=> (not res!429393) (not e!380004))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!661440 (= res!429393 (bvsgt from!3004 i!1382))))

(declare-fun b!661441 () Bool)

(declare-fun res!429397 () Bool)

(assert (=> b!661441 (=> (not res!429397) (not e!380006))))

(declare-datatypes ((array!38875 0))(
  ( (array!38876 (arr!18627 (Array (_ BitVec 32) (_ BitVec 64))) (size!18991 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!38875)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!38875 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!661441 (= res!429397 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!661442 () Bool)

(declare-fun res!429403 () Bool)

(assert (=> b!661442 (=> (not res!429403) (not e!380006))))

(declare-datatypes ((List!12575 0))(
  ( (Nil!12572) (Cons!12571 (h!13619 (_ BitVec 64)) (t!18795 List!12575)) )
))
(declare-fun acc!681 () List!12575)

(declare-fun contains!3227 (List!12575 (_ BitVec 64)) Bool)

(assert (=> b!661442 (= res!429403 (not (contains!3227 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661443 () Bool)

(assert (=> b!661443 (= e!380006 (not true))))

(assert (=> b!661443 (arrayContainsKey!0 (array!38876 (store (arr!18627 a!3626) i!1382 k!2843) (size!18991 a!3626)) k!2843 from!3004)))

(declare-fun b!661444 () Bool)

(declare-fun res!429398 () Bool)

(assert (=> b!661444 (=> (not res!429398) (not e!380006))))

(declare-fun noDuplicate!501 (List!12575) Bool)

(assert (=> b!661444 (= res!429398 (noDuplicate!501 acc!681))))

(declare-fun b!661445 () Bool)

(declare-fun res!429404 () Bool)

(assert (=> b!661445 (=> (not res!429404) (not e!380006))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!661445 (= res!429404 (validKeyInArray!0 k!2843))))

(declare-fun b!661446 () Bool)

(declare-fun res!429396 () Bool)

(assert (=> b!661446 (=> (not res!429396) (not e!380006))))

(assert (=> b!661446 (= res!429396 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!18991 a!3626))))))

(declare-fun b!661447 () Bool)

(declare-fun res!429399 () Bool)

(assert (=> b!661447 (=> (not res!429399) (not e!380006))))

(declare-fun arrayNoDuplicates!0 (array!38875 (_ BitVec 32) List!12575) Bool)

(assert (=> b!661447 (= res!429399 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!661448 () Bool)

(declare-fun e!380007 () Bool)

(assert (=> b!661448 (= e!380007 (not (contains!3227 acc!681 k!2843)))))

(declare-fun b!661449 () Bool)

(assert (=> b!661449 (= e!380004 (contains!3227 acc!681 k!2843))))

(declare-fun b!661450 () Bool)

(declare-fun res!429400 () Bool)

(assert (=> b!661450 (=> (not res!429400) (not e!380006))))

(assert (=> b!661450 (= res!429400 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!18991 a!3626)) (= from!3004 i!1382)))))

(declare-fun b!661451 () Bool)

(assert (=> b!661451 (= e!380005 e!380007)))

(declare-fun res!429401 () Bool)

(assert (=> b!661451 (=> (not res!429401) (not e!380007))))

(assert (=> b!661451 (= res!429401 (bvsle from!3004 i!1382))))

(declare-fun res!429406 () Bool)

(assert (=> start!59890 (=> (not res!429406) (not e!380006))))

(assert (=> start!59890 (= res!429406 (and (bvslt (size!18991 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!18991 a!3626))))))

(assert (=> start!59890 e!380006))

(assert (=> start!59890 true))

(declare-fun array_inv!14486 (array!38875) Bool)

(assert (=> start!59890 (array_inv!14486 a!3626)))

(declare-fun b!661452 () Bool)

(declare-fun res!429395 () Bool)

(assert (=> b!661452 (=> (not res!429395) (not e!380006))))

(assert (=> b!661452 (= res!429395 (not (contains!3227 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!661453 () Bool)

(declare-fun res!429402 () Bool)

(assert (=> b!661453 (=> (not res!429402) (not e!380006))))

(assert (=> b!661453 (= res!429402 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12572))))

(assert (= (and start!59890 res!429406) b!661444))

(assert (= (and b!661444 res!429398) b!661442))

(assert (= (and b!661442 res!429403) b!661452))

(assert (= (and b!661452 res!429395) b!661440))

(assert (= (and b!661440 res!429393) b!661449))

(assert (= (and b!661440 (not res!429394)) b!661451))

(assert (= (and b!661451 res!429401) b!661448))

(assert (= (and b!661440 res!429405) b!661453))

(assert (= (and b!661453 res!429402) b!661447))

(assert (= (and b!661447 res!429399) b!661446))

(assert (= (and b!661446 res!429396) b!661445))

(assert (= (and b!661445 res!429404) b!661441))

(assert (= (and b!661441 res!429397) b!661450))

(assert (= (and b!661450 res!429400) b!661443))

(declare-fun m!634209 () Bool)

(assert (=> b!661445 m!634209))

(declare-fun m!634211 () Bool)

(assert (=> b!661441 m!634211))

(declare-fun m!634213 () Bool)

(assert (=> b!661448 m!634213))

(declare-fun m!634215 () Bool)

(assert (=> start!59890 m!634215))

(declare-fun m!634217 () Bool)

(assert (=> b!661452 m!634217))

(declare-fun m!634219 () Bool)

(assert (=> b!661453 m!634219))

(declare-fun m!634221 () Bool)

(assert (=> b!661443 m!634221))

(declare-fun m!634223 () Bool)

(assert (=> b!661443 m!634223))

(declare-fun m!634225 () Bool)

(assert (=> b!661442 m!634225))

(declare-fun m!634227 () Bool)

(assert (=> b!661444 m!634227))

(assert (=> b!661449 m!634213))

(declare-fun m!634229 () Bool)

(assert (=> b!661447 m!634229))

(push 1)

(assert (not b!661453))

(assert (not start!59890))

(assert (not b!661444))

(assert (not b!661442))

(assert (not b!661449))

(assert (not b!661452))

(assert (not b!661443))

(assert (not b!661441))

(assert (not b!661448))

(assert (not b!661445))

(assert (not b!661447))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

