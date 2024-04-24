; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104140 () Bool)

(assert start!104140)

(declare-fun b!1244978 () Bool)

(declare-fun res!829974 () Bool)

(declare-fun e!705857 () Bool)

(assert (=> b!1244978 (=> (not res!829974) (not e!705857))))

(declare-datatypes ((array!80031 0))(
  ( (array!80032 (arr!38603 (Array (_ BitVec 32) (_ BitVec 64))) (size!39140 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80031)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27419 0))(
  ( (Nil!27416) (Cons!27415 (h!28633 (_ BitVec 64)) (t!40880 List!27419)) )
))
(declare-fun arrayNoDuplicates!0 (array!80031 (_ BitVec 32) List!27419) Bool)

(assert (=> b!1244978 (= res!829974 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27416))))

(declare-fun b!1244979 () Bool)

(declare-fun res!829969 () Bool)

(declare-fun e!705856 () Bool)

(assert (=> b!1244979 (=> (not res!829969) (not e!705856))))

(declare-fun lt!562934 () List!27419)

(declare-fun noDuplicate!2011 (List!27419) Bool)

(assert (=> b!1244979 (= res!829969 (noDuplicate!2011 lt!562934))))

(declare-fun b!1244980 () Bool)

(declare-fun res!829970 () Bool)

(assert (=> b!1244980 (=> (not res!829970) (not e!705857))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> b!1244980 (= res!829970 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39140 a!3892)) (not (= newFrom!287 (size!39140 a!3892)))))))

(declare-fun res!829966 () Bool)

(assert (=> start!104140 (=> (not res!829966) (not e!705857))))

(assert (=> start!104140 (= res!829966 (and (bvslt (size!39140 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39140 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39140 a!3892))))))

(assert (=> start!104140 e!705857))

(declare-fun array_inv!29541 (array!80031) Bool)

(assert (=> start!104140 (array_inv!29541 a!3892)))

(assert (=> start!104140 true))

(declare-fun b!1244981 () Bool)

(declare-fun res!829965 () Bool)

(assert (=> b!1244981 (=> (not res!829965) (not e!705856))))

(declare-fun contains!7449 (List!27419 (_ BitVec 64)) Bool)

(assert (=> b!1244981 (= res!829965 (not (contains!7449 lt!562934 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244982 () Bool)

(declare-fun res!829971 () Bool)

(assert (=> b!1244982 (=> (not res!829971) (not e!705857))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1244982 (= res!829971 (validKeyInArray!0 (select (arr!38603 a!3892) from!3270)))))

(declare-fun b!1244983 () Bool)

(declare-fun res!829972 () Bool)

(assert (=> b!1244983 (=> (not res!829972) (not e!705856))))

(assert (=> b!1244983 (= res!829972 (not (contains!7449 Nil!27416 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244984 () Bool)

(declare-fun res!829967 () Bool)

(assert (=> b!1244984 (=> (not res!829967) (not e!705856))))

(assert (=> b!1244984 (= res!829967 (not (contains!7449 lt!562934 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244985 () Bool)

(assert (=> b!1244985 (= e!705857 e!705856)))

(declare-fun res!829973 () Bool)

(assert (=> b!1244985 (=> (not res!829973) (not e!705856))))

(assert (=> b!1244985 (= res!829973 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1244985 (= lt!562934 (Cons!27415 (select (arr!38603 a!3892) from!3270) Nil!27416))))

(declare-fun b!1244986 () Bool)

(declare-fun res!829964 () Bool)

(assert (=> b!1244986 (=> (not res!829964) (not e!705856))))

(assert (=> b!1244986 (= res!829964 (not (contains!7449 Nil!27416 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1244987 () Bool)

(declare-fun res!829968 () Bool)

(assert (=> b!1244987 (=> (not res!829968) (not e!705856))))

(declare-fun subseq!641 (List!27419 List!27419) Bool)

(assert (=> b!1244987 (= res!829968 (subseq!641 Nil!27416 lt!562934))))

(declare-fun b!1244988 () Bool)

(assert (=> b!1244988 (= e!705856 false)))

(declare-fun lt!562932 () Bool)

(assert (=> b!1244988 (= lt!562932 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562934))))

(declare-datatypes ((Unit!41264 0))(
  ( (Unit!41265) )
))
(declare-fun lt!562933 () Unit!41264)

(declare-fun noDuplicateSubseq!95 (List!27419 List!27419) Unit!41264)

(assert (=> b!1244988 (= lt!562933 (noDuplicateSubseq!95 Nil!27416 lt!562934))))

(assert (= (and start!104140 res!829966) b!1244978))

(assert (= (and b!1244978 res!829974) b!1244980))

(assert (= (and b!1244980 res!829970) b!1244982))

(assert (= (and b!1244982 res!829971) b!1244985))

(assert (= (and b!1244985 res!829973) b!1244979))

(assert (= (and b!1244979 res!829969) b!1244984))

(assert (= (and b!1244984 res!829967) b!1244981))

(assert (= (and b!1244981 res!829965) b!1244983))

(assert (= (and b!1244983 res!829972) b!1244986))

(assert (= (and b!1244986 res!829964) b!1244987))

(assert (= (and b!1244987 res!829968) b!1244988))

(declare-fun m!1147795 () Bool)

(assert (=> b!1244986 m!1147795))

(declare-fun m!1147797 () Bool)

(assert (=> b!1244983 m!1147797))

(declare-fun m!1147799 () Bool)

(assert (=> b!1244978 m!1147799))

(declare-fun m!1147801 () Bool)

(assert (=> b!1244982 m!1147801))

(assert (=> b!1244982 m!1147801))

(declare-fun m!1147803 () Bool)

(assert (=> b!1244982 m!1147803))

(declare-fun m!1147805 () Bool)

(assert (=> b!1244984 m!1147805))

(declare-fun m!1147807 () Bool)

(assert (=> b!1244987 m!1147807))

(assert (=> b!1244985 m!1147801))

(declare-fun m!1147809 () Bool)

(assert (=> start!104140 m!1147809))

(declare-fun m!1147811 () Bool)

(assert (=> b!1244988 m!1147811))

(declare-fun m!1147813 () Bool)

(assert (=> b!1244988 m!1147813))

(declare-fun m!1147815 () Bool)

(assert (=> b!1244981 m!1147815))

(declare-fun m!1147817 () Bool)

(assert (=> b!1244979 m!1147817))

(check-sat (not b!1244978) (not b!1244982) (not b!1244987) (not b!1244981) (not start!104140) (not b!1244983) (not b!1244979) (not b!1244988) (not b!1244984) (not b!1244986))
(check-sat)
