; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!60358 () Bool)

(assert start!60358)

(declare-fun b!678235 () Bool)

(declare-fun res!444654 () Bool)

(declare-fun e!386524 () Bool)

(assert (=> b!678235 (=> (not res!444654) (not e!386524))))

(declare-datatypes ((array!39405 0))(
  ( (array!39406 (arr!18895 (Array (_ BitVec 32) (_ BitVec 64))) (size!19259 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39405)

(declare-fun k0!2843 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!39405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!678235 (= res!444654 (not (arrayContainsKey!0 a!3626 k0!2843 #b00000000000000000000000000000000)))))

(declare-fun res!444661 () Bool)

(assert (=> start!60358 (=> (not res!444661) (not e!386524))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> start!60358 (= res!444661 (and (bvslt (size!19259 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19259 a!3626))))))

(assert (=> start!60358 e!386524))

(assert (=> start!60358 true))

(declare-fun array_inv!14691 (array!39405) Bool)

(assert (=> start!60358 (array_inv!14691 a!3626)))

(declare-fun b!678236 () Bool)

(declare-fun res!444659 () Bool)

(assert (=> b!678236 (=> (not res!444659) (not e!386524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!678236 (= res!444659 (validKeyInArray!0 k0!2843))))

(declare-fun b!678237 () Bool)

(declare-fun res!444663 () Bool)

(assert (=> b!678237 (=> (not res!444663) (not e!386524))))

(assert (=> b!678237 (= res!444663 (validKeyInArray!0 (select (arr!18895 a!3626) from!3004)))))

(declare-fun b!678238 () Bool)

(declare-fun res!444658 () Bool)

(assert (=> b!678238 (=> (not res!444658) (not e!386524))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!678238 (= res!444658 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19259 a!3626))))))

(declare-fun b!678239 () Bool)

(declare-datatypes ((Unit!23788 0))(
  ( (Unit!23789) )
))
(declare-fun e!386522 () Unit!23788)

(declare-fun Unit!23790 () Unit!23788)

(assert (=> b!678239 (= e!386522 Unit!23790)))

(assert (=> b!678239 (arrayContainsKey!0 a!3626 k0!2843 from!3004)))

(declare-fun lt!312880 () Unit!23788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39405 (_ BitVec 64) (_ BitVec 32)) Unit!23788)

(assert (=> b!678239 (= lt!312880 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k0!2843 from!3004))))

(assert (=> b!678239 false))

(declare-fun b!678240 () Bool)

(declare-fun e!386523 () Bool)

(declare-datatypes ((List!12936 0))(
  ( (Nil!12933) (Cons!12932 (h!13977 (_ BitVec 64)) (t!19164 List!12936)) )
))
(declare-fun acc!681 () List!12936)

(declare-fun contains!3513 (List!12936 (_ BitVec 64)) Bool)

(assert (=> b!678240 (= e!386523 (not (contains!3513 acc!681 k0!2843)))))

(declare-fun b!678241 () Bool)

(declare-fun res!444656 () Bool)

(assert (=> b!678241 (=> (not res!444656) (not e!386524))))

(assert (=> b!678241 (= res!444656 (not (contains!3513 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678242 () Bool)

(assert (=> b!678242 (= e!386524 (= (select (arr!18895 a!3626) from!3004) k0!2843))))

(declare-fun lt!312879 () Unit!23788)

(assert (=> b!678242 (= lt!312879 e!386522)))

(declare-fun c!77159 () Bool)

(assert (=> b!678242 (= c!77159 (= (select (arr!18895 a!3626) from!3004) k0!2843))))

(declare-fun b!678243 () Bool)

(declare-fun res!444662 () Bool)

(assert (=> b!678243 (=> (not res!444662) (not e!386524))))

(assert (=> b!678243 (= res!444662 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19259 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!678244 () Bool)

(declare-fun e!386525 () Bool)

(assert (=> b!678244 (= e!386525 (contains!3513 acc!681 k0!2843))))

(declare-fun b!678245 () Bool)

(declare-fun e!386526 () Bool)

(assert (=> b!678245 (= e!386526 e!386523)))

(declare-fun res!444664 () Bool)

(assert (=> b!678245 (=> (not res!444664) (not e!386523))))

(assert (=> b!678245 (= res!444664 (bvsle from!3004 i!1382))))

(declare-fun b!678246 () Bool)

(declare-fun Unit!23791 () Unit!23788)

(assert (=> b!678246 (= e!386522 Unit!23791)))

(declare-fun b!678247 () Bool)

(declare-fun res!444665 () Bool)

(assert (=> b!678247 (=> (not res!444665) (not e!386524))))

(declare-fun arrayNoDuplicates!0 (array!39405 (_ BitVec 32) List!12936) Bool)

(assert (=> b!678247 (= res!444665 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!678248 () Bool)

(declare-fun res!444651 () Bool)

(assert (=> b!678248 (=> (not res!444651) (not e!386524))))

(assert (=> b!678248 (= res!444651 (not (contains!3513 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!678249 () Bool)

(declare-fun res!444657 () Bool)

(assert (=> b!678249 (=> (not res!444657) (not e!386524))))

(assert (=> b!678249 (= res!444657 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12933))))

(declare-fun b!678250 () Bool)

(declare-fun res!444660 () Bool)

(assert (=> b!678250 (=> (not res!444660) (not e!386524))))

(assert (=> b!678250 (= res!444660 e!386526)))

(declare-fun res!444655 () Bool)

(assert (=> b!678250 (=> res!444655 e!386526)))

(assert (=> b!678250 (= res!444655 e!386525)))

(declare-fun res!444652 () Bool)

(assert (=> b!678250 (=> (not res!444652) (not e!386525))))

(assert (=> b!678250 (= res!444652 (bvsgt from!3004 i!1382))))

(declare-fun b!678251 () Bool)

(declare-fun res!444653 () Bool)

(assert (=> b!678251 (=> (not res!444653) (not e!386524))))

(declare-fun noDuplicate!760 (List!12936) Bool)

(assert (=> b!678251 (= res!444653 (noDuplicate!760 acc!681))))

(assert (= (and start!60358 res!444661) b!678251))

(assert (= (and b!678251 res!444653) b!678248))

(assert (= (and b!678248 res!444651) b!678241))

(assert (= (and b!678241 res!444656) b!678250))

(assert (= (and b!678250 res!444652) b!678244))

(assert (= (and b!678250 (not res!444655)) b!678245))

(assert (= (and b!678245 res!444664) b!678240))

(assert (= (and b!678250 res!444660) b!678249))

(assert (= (and b!678249 res!444657) b!678247))

(assert (= (and b!678247 res!444665) b!678238))

(assert (= (and b!678238 res!444658) b!678236))

(assert (= (and b!678236 res!444659) b!678235))

(assert (= (and b!678235 res!444654) b!678243))

(assert (= (and b!678243 res!444662) b!678237))

(assert (= (and b!678237 res!444663) b!678242))

(assert (= (and b!678242 c!77159) b!678239))

(assert (= (and b!678242 (not c!77159)) b!678246))

(declare-fun m!644113 () Bool)

(assert (=> b!678249 m!644113))

(declare-fun m!644115 () Bool)

(assert (=> b!678241 m!644115))

(declare-fun m!644117 () Bool)

(assert (=> b!678251 m!644117))

(declare-fun m!644119 () Bool)

(assert (=> start!60358 m!644119))

(declare-fun m!644121 () Bool)

(assert (=> b!678244 m!644121))

(declare-fun m!644123 () Bool)

(assert (=> b!678236 m!644123))

(assert (=> b!678240 m!644121))

(declare-fun m!644125 () Bool)

(assert (=> b!678242 m!644125))

(declare-fun m!644127 () Bool)

(assert (=> b!678239 m!644127))

(declare-fun m!644129 () Bool)

(assert (=> b!678239 m!644129))

(declare-fun m!644131 () Bool)

(assert (=> b!678248 m!644131))

(declare-fun m!644133 () Bool)

(assert (=> b!678247 m!644133))

(declare-fun m!644135 () Bool)

(assert (=> b!678235 m!644135))

(assert (=> b!678237 m!644125))

(assert (=> b!678237 m!644125))

(declare-fun m!644137 () Bool)

(assert (=> b!678237 m!644137))

(check-sat (not b!678247) (not b!678251) (not b!678239) (not b!678237) (not b!678244) (not b!678249) (not b!678240) (not b!678241) (not b!678248) (not b!678236) (not start!60358) (not b!678235))
(check-sat)
