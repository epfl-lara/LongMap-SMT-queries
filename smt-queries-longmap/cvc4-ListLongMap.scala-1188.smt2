; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25508 () Bool)

(assert start!25508)

(declare-fun b!265232 () Bool)

(declare-fun e!171758 () Bool)

(declare-fun e!171756 () Bool)

(assert (=> b!265232 (= e!171758 e!171756)))

(declare-fun res!129676 () Bool)

(assert (=> b!265232 (=> (not res!129676) (not e!171756))))

(declare-datatypes ((SeekEntryResult!1234 0))(
  ( (MissingZero!1234 (index!7106 (_ BitVec 32))) (Found!1234 (index!7107 (_ BitVec 32))) (Intermediate!1234 (undefined!2046 Bool) (index!7108 (_ BitVec 32)) (x!25423 (_ BitVec 32))) (Undefined!1234) (MissingVacant!1234 (index!7109 (_ BitVec 32))) )
))
(declare-fun lt!134029 () SeekEntryResult!1234)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265232 (= res!129676 (or (= lt!134029 (MissingZero!1234 i!1355)) (= lt!134029 (MissingVacant!1234 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-datatypes ((array!12771 0))(
  ( (array!12772 (arr!6043 (Array (_ BitVec 32) (_ BitVec 64))) (size!6395 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12771)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12771 (_ BitVec 32)) SeekEntryResult!1234)

(assert (=> b!265232 (= lt!134029 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun b!265233 () Bool)

(declare-datatypes ((List!3857 0))(
  ( (Nil!3854) (Cons!3853 (h!4520 (_ BitVec 64)) (t!8939 List!3857)) )
))
(declare-fun noDuplicate!106 (List!3857) Bool)

(assert (=> b!265233 (= e!171756 (not (noDuplicate!106 Nil!3854)))))

(declare-fun b!265234 () Bool)

(declare-fun res!129674 () Bool)

(assert (=> b!265234 (=> (not res!129674) (not e!171758))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265234 (= res!129674 (validKeyInArray!0 k!2698))))

(declare-fun b!265235 () Bool)

(declare-fun res!129673 () Bool)

(assert (=> b!265235 (=> (not res!129673) (not e!171758))))

(declare-fun arrayContainsKey!0 (array!12771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265235 (= res!129673 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265236 () Bool)

(declare-fun res!129672 () Bool)

(assert (=> b!265236 (=> (not res!129672) (not e!171758))))

(assert (=> b!265236 (= res!129672 (and (= (size!6395 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6395 a!3436))))))

(declare-fun b!265237 () Bool)

(declare-fun res!129675 () Bool)

(assert (=> b!265237 (=> (not res!129675) (not e!171756))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12771 (_ BitVec 32)) Bool)

(assert (=> b!265237 (= res!129675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun res!129677 () Bool)

(assert (=> start!25508 (=> (not res!129677) (not e!171758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25508 (= res!129677 (validMask!0 mask!4002))))

(assert (=> start!25508 e!171758))

(assert (=> start!25508 true))

(declare-fun array_inv!4006 (array!12771) Bool)

(assert (=> start!25508 (array_inv!4006 a!3436)))

(declare-fun b!265238 () Bool)

(declare-fun res!129678 () Bool)

(assert (=> b!265238 (=> (not res!129678) (not e!171756))))

(assert (=> b!265238 (= res!129678 (and (bvsle #b00000000000000000000000000000000 (size!6395 a!3436)) (bvslt (size!6395 a!3436) #b01111111111111111111111111111111)))))

(assert (= (and start!25508 res!129677) b!265236))

(assert (= (and b!265236 res!129672) b!265234))

(assert (= (and b!265234 res!129674) b!265235))

(assert (= (and b!265235 res!129673) b!265232))

(assert (= (and b!265232 res!129676) b!265237))

(assert (= (and b!265237 res!129675) b!265238))

(assert (= (and b!265238 res!129678) b!265233))

(declare-fun m!282085 () Bool)

(assert (=> b!265232 m!282085))

(declare-fun m!282087 () Bool)

(assert (=> b!265234 m!282087))

(declare-fun m!282089 () Bool)

(assert (=> b!265237 m!282089))

(declare-fun m!282091 () Bool)

(assert (=> b!265233 m!282091))

(declare-fun m!282093 () Bool)

(assert (=> start!25508 m!282093))

(declare-fun m!282095 () Bool)

(assert (=> start!25508 m!282095))

(declare-fun m!282097 () Bool)

(assert (=> b!265235 m!282097))

(push 1)

(assert (not start!25508))

(assert (not b!265237))

(assert (not b!265235))

(assert (not b!265232))

(assert (not b!265233))

(assert (not b!265234))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64149 () Bool)

(declare-fun res!129689 () Bool)

(declare-fun e!171769 () Bool)

(assert (=> d!64149 (=> res!129689 e!171769)))

(assert (=> d!64149 (= res!129689 (is-Nil!3854 Nil!3854))))

(assert (=> d!64149 (= (noDuplicate!106 Nil!3854) e!171769)))

(declare-fun b!265249 () Bool)

(declare-fun e!171770 () Bool)

(assert (=> b!265249 (= e!171769 e!171770)))

(declare-fun res!129690 () Bool)

(assert (=> b!265249 (=> (not res!129690) (not e!171770))))

(declare-fun contains!1918 (List!3857 (_ BitVec 64)) Bool)

(assert (=> b!265249 (= res!129690 (not (contains!1918 (t!8939 Nil!3854) (h!4520 Nil!3854))))))

(declare-fun b!265250 () Bool)

(assert (=> b!265250 (= e!171770 (noDuplicate!106 (t!8939 Nil!3854)))))

(assert (= (and d!64149 (not res!129689)) b!265249))

(assert (= (and b!265249 res!129690) b!265250))

(declare-fun m!282103 () Bool)

(assert (=> b!265249 m!282103))

(declare-fun m!282105 () Bool)

(assert (=> b!265250 m!282105))

(assert (=> b!265233 d!64149))

(declare-fun b!265265 () Bool)

(declare-fun e!171785 () Bool)

(declare-fun call!25324 () Bool)

(assert (=> b!265265 (= e!171785 call!25324)))

(declare-fun b!265266 () Bool)

(declare-fun e!171784 () Bool)

(assert (=> b!265266 (= e!171784 e!171785)))

(declare-fun c!45333 () Bool)

(assert (=> b!265266 (= c!45333 (validKeyInArray!0 (select (arr!6043 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265267 () Bool)

(declare-fun e!171783 () Bool)

(assert (=> b!265267 (= e!171785 e!171783)))

(declare-fun lt!134038 () (_ BitVec 64))

(assert (=> b!265267 (= lt!134038 (select (arr!6043 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8261 0))(
  ( (Unit!8262) )
))
(declare-fun lt!134036 () Unit!8261)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12771 (_ BitVec 64) (_ BitVec 32)) Unit!8261)

(assert (=> b!265267 (= lt!134036 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!134038 #b00000000000000000000000000000000))))

(assert (=> b!265267 (arrayContainsKey!0 a!3436 lt!134038 #b00000000000000000000000000000000)))

(declare-fun lt!134037 () Unit!8261)

(assert (=> b!265267 (= lt!134037 lt!134036)))

(declare-fun res!129701 () Bool)

(assert (=> b!265267 (= res!129701 (= (seekEntryOrOpen!0 (select (arr!6043 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1234 #b00000000000000000000000000000000)))))

(assert (=> b!265267 (=> (not res!129701) (not e!171783))))

