; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62150 () Bool)

(assert start!62150)

(declare-fun b!696014 () Bool)

(declare-fun res!459971 () Bool)

(declare-fun e!395814 () Bool)

(assert (=> b!696014 (=> (not res!459971) (not e!395814))))

(declare-datatypes ((List!13172 0))(
  ( (Nil!13169) (Cons!13168 (h!14213 (_ BitVec 64)) (t!19454 List!13172)) )
))
(declare-fun acc!681 () List!13172)

(declare-fun contains!3749 (List!13172 (_ BitVec 64)) Bool)

(assert (=> b!696014 (= res!459971 (not (contains!3749 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696015 () Bool)

(declare-fun res!459967 () Bool)

(assert (=> b!696015 (=> (not res!459967) (not e!395814))))

(declare-fun from!3004 () (_ BitVec 32))

(assert (=> b!696015 (= res!459967 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun b!696016 () Bool)

(declare-fun res!459968 () Bool)

(assert (=> b!696016 (=> (not res!459968) (not e!395814))))

(assert (=> b!696016 (= res!459968 (not (contains!3749 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!696017 () Bool)

(declare-fun res!459969 () Bool)

(assert (=> b!696017 (=> (not res!459969) (not e!395814))))

(declare-datatypes ((array!39940 0))(
  ( (array!39941 (arr!19131 (Array (_ BitVec 32) (_ BitVec 64))) (size!19516 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39940)

(declare-fun arrayNoDuplicates!0 (array!39940 (_ BitVec 32) List!13172) Bool)

(assert (=> b!696017 (= res!459969 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!696018 () Bool)

(declare-fun res!459973 () Bool)

(assert (=> b!696018 (=> (not res!459973) (not e!395814))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!696018 (= res!459973 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19516 a!3626))))))

(declare-fun b!696019 () Bool)

(declare-fun res!459970 () Bool)

(assert (=> b!696019 (=> (not res!459970) (not e!395814))))

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!696019 (= res!459970 (validKeyInArray!0 k!2843))))

(declare-fun b!696020 () Bool)

(declare-fun e!395813 () Bool)

(assert (=> b!696020 (= e!395813 (not (contains!3749 acc!681 k!2843)))))

(declare-fun b!696021 () Bool)

(declare-fun e!395812 () Bool)

(assert (=> b!696021 (= e!395812 (not (contains!3749 acc!681 k!2843)))))

(declare-fun b!696022 () Bool)

(declare-fun res!459974 () Bool)

(assert (=> b!696022 (=> (not res!459974) (not e!395814))))

(assert (=> b!696022 (= res!459974 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19516 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!696023 () Bool)

(declare-fun e!395817 () Bool)

(assert (=> b!696023 (= e!395817 e!395813)))

(declare-fun res!459975 () Bool)

(assert (=> b!696023 (=> (not res!459975) (not e!395813))))

(assert (=> b!696023 (= res!459975 (bvsle from!3004 i!1382))))

(declare-fun b!696024 () Bool)

(declare-fun res!459963 () Bool)

(assert (=> b!696024 (=> (not res!459963) (not e!395814))))

(assert (=> b!696024 (= res!459963 e!395817)))

(declare-fun res!459962 () Bool)

(assert (=> b!696024 (=> res!459962 e!395817)))

(declare-fun e!395816 () Bool)

(assert (=> b!696024 (= res!459962 e!395816)))

(declare-fun res!459980 () Bool)

(assert (=> b!696024 (=> (not res!459980) (not e!395816))))

(assert (=> b!696024 (= res!459980 (bvsgt from!3004 i!1382))))

(declare-fun b!696025 () Bool)

(assert (=> b!696025 (= e!395816 (contains!3749 acc!681 k!2843))))

(declare-fun b!696026 () Bool)

(declare-fun e!395811 () Bool)

(assert (=> b!696026 (= e!395811 (contains!3749 acc!681 k!2843))))

(declare-fun b!696027 () Bool)

(assert (=> b!696027 (= e!395814 false)))

(declare-fun lt!317089 () Bool)

(declare-fun e!395815 () Bool)

(assert (=> b!696027 (= lt!317089 e!395815)))

(declare-fun res!459972 () Bool)

(assert (=> b!696027 (=> res!459972 e!395815)))

(assert (=> b!696027 (= res!459972 e!395811)))

(declare-fun res!459964 () Bool)

(assert (=> b!696027 (=> (not res!459964) (not e!395811))))

(assert (=> b!696027 (= res!459964 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!696028 () Bool)

(declare-fun res!459979 () Bool)

(assert (=> b!696028 (=> (not res!459979) (not e!395814))))

(assert (=> b!696028 (= res!459979 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13169))))

(declare-fun res!459978 () Bool)

(assert (=> start!62150 (=> (not res!459978) (not e!395814))))

(assert (=> start!62150 (= res!459978 (and (bvslt (size!19516 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19516 a!3626))))))

(assert (=> start!62150 e!395814))

(assert (=> start!62150 true))

(declare-fun array_inv!14927 (array!39940) Bool)

(assert (=> start!62150 (array_inv!14927 a!3626)))

(declare-fun b!696029 () Bool)

(declare-fun res!459976 () Bool)

(assert (=> b!696029 (=> (not res!459976) (not e!395814))))

(declare-fun noDuplicate!996 (List!13172) Bool)

(assert (=> b!696029 (= res!459976 (noDuplicate!996 acc!681))))

(declare-fun b!696030 () Bool)

(declare-fun res!459965 () Bool)

(assert (=> b!696030 (=> (not res!459965) (not e!395814))))

(assert (=> b!696030 (= res!459965 (not (validKeyInArray!0 (select (arr!19131 a!3626) from!3004))))))

(declare-fun b!696031 () Bool)

(declare-fun res!459966 () Bool)

(assert (=> b!696031 (=> (not res!459966) (not e!395814))))

(declare-fun arrayContainsKey!0 (array!39940 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!696031 (= res!459966 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!696032 () Bool)

(assert (=> b!696032 (= e!395815 e!395812)))

(declare-fun res!459977 () Bool)

(assert (=> b!696032 (=> (not res!459977) (not e!395812))))

(assert (=> b!696032 (= res!459977 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(assert (= (and start!62150 res!459978) b!696029))

(assert (= (and b!696029 res!459976) b!696016))

(assert (= (and b!696016 res!459968) b!696014))

(assert (= (and b!696014 res!459971) b!696024))

(assert (= (and b!696024 res!459980) b!696025))

(assert (= (and b!696024 (not res!459962)) b!696023))

(assert (= (and b!696023 res!459975) b!696020))

(assert (= (and b!696024 res!459963) b!696028))

(assert (= (and b!696028 res!459979) b!696017))

(assert (= (and b!696017 res!459969) b!696018))

(assert (= (and b!696018 res!459973) b!696019))

(assert (= (and b!696019 res!459970) b!696031))

(assert (= (and b!696031 res!459966) b!696022))

(assert (= (and b!696022 res!459974) b!696030))

(assert (= (and b!696030 res!459965) b!696015))

(assert (= (and b!696015 res!459967) b!696027))

(assert (= (and b!696027 res!459964) b!696026))

(assert (= (and b!696027 (not res!459972)) b!696032))

(assert (= (and b!696032 res!459977) b!696021))

(declare-fun m!657209 () Bool)

(assert (=> b!696020 m!657209))

(declare-fun m!657211 () Bool)

(assert (=> b!696028 m!657211))

(assert (=> b!696026 m!657209))

(declare-fun m!657213 () Bool)

(assert (=> b!696029 m!657213))

(declare-fun m!657215 () Bool)

(assert (=> b!696016 m!657215))

(assert (=> b!696021 m!657209))

(declare-fun m!657217 () Bool)

(assert (=> start!62150 m!657217))

(declare-fun m!657219 () Bool)

(assert (=> b!696017 m!657219))

(assert (=> b!696025 m!657209))

(declare-fun m!657221 () Bool)

(assert (=> b!696019 m!657221))

(declare-fun m!657223 () Bool)

(assert (=> b!696030 m!657223))

(assert (=> b!696030 m!657223))

(declare-fun m!657225 () Bool)

(assert (=> b!696030 m!657225))

(declare-fun m!657227 () Bool)

(assert (=> b!696014 m!657227))

(declare-fun m!657229 () Bool)

(assert (=> b!696031 m!657229))

(push 1)

(assert (not b!696026))

(assert (not start!62150))

(assert (not b!696016))

(assert (not b!696028))

(assert (not b!696014))

(assert (not b!696021))

(assert (not b!696030))

(assert (not b!696031))

(assert (not b!696029))

(assert (not b!696020))

(assert (not b!696019))

(assert (not b!696025))

(assert (not b!696017))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

