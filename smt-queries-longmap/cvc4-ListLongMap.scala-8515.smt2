; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103890 () Bool)

(assert start!103890)

(declare-fun b!1243423 () Bool)

(declare-fun res!829200 () Bool)

(declare-fun e!704929 () Bool)

(assert (=> b!1243423 (=> (not res!829200) (not e!704929))))

(declare-datatypes ((List!27387 0))(
  ( (Nil!27384) (Cons!27383 (h!28592 (_ BitVec 64)) (t!40856 List!27387)) )
))
(declare-fun contains!7408 (List!27387 (_ BitVec 64)) Bool)

(assert (=> b!1243423 (= res!829200 (not (contains!7408 Nil!27384 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243424 () Bool)

(declare-fun res!829210 () Bool)

(assert (=> b!1243424 (=> (not res!829210) (not e!704929))))

(declare-fun lt!562384 () List!27387)

(assert (=> b!1243424 (= res!829210 (not (contains!7408 lt!562384 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243425 () Bool)

(declare-fun res!829206 () Bool)

(assert (=> b!1243425 (=> (not res!829206) (not e!704929))))

(declare-fun noDuplicate!1986 (List!27387) Bool)

(assert (=> b!1243425 (= res!829206 (noDuplicate!1986 lt!562384))))

(declare-fun b!1243426 () Bool)

(declare-fun res!829207 () Bool)

(assert (=> b!1243426 (=> (not res!829207) (not e!704929))))

(declare-fun subseq!634 (List!27387 List!27387) Bool)

(assert (=> b!1243426 (= res!829207 (subseq!634 Nil!27384 lt!562384))))

(declare-fun b!1243428 () Bool)

(declare-fun res!829204 () Bool)

(assert (=> b!1243428 (=> (not res!829204) (not e!704929))))

(assert (=> b!1243428 (= res!829204 (not (contains!7408 lt!562384 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1243429 () Bool)

(declare-fun e!704930 () Bool)

(assert (=> b!1243429 (= e!704930 e!704929)))

(declare-fun res!829209 () Bool)

(assert (=> b!1243429 (=> (not res!829209) (not e!704929))))

(declare-fun from!3270 () (_ BitVec 32))

(assert (=> b!1243429 (= res!829209 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(declare-datatypes ((array!79982 0))(
  ( (array!79983 (arr!38584 (Array (_ BitVec 32) (_ BitVec 64))) (size!39120 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!79982)

(assert (=> b!1243429 (= lt!562384 (Cons!27383 (select (arr!38584 a!3892) from!3270) Nil!27384))))

(declare-fun b!1243430 () Bool)

(declare-fun res!829205 () Bool)

(assert (=> b!1243430 (=> (not res!829205) (not e!704930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1243430 (= res!829205 (validKeyInArray!0 (select (arr!38584 a!3892) from!3270)))))

(declare-fun b!1243431 () Bool)

(declare-fun res!829203 () Bool)

(assert (=> b!1243431 (=> (not res!829203) (not e!704930))))

(declare-fun arrayNoDuplicates!0 (array!79982 (_ BitVec 32) List!27387) Bool)

(assert (=> b!1243431 (= res!829203 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27384))))

(declare-fun b!1243432 () Bool)

(assert (=> b!1243432 (= e!704929 false)))

(declare-fun lt!562383 () Bool)

(assert (=> b!1243432 (= lt!562383 (arrayNoDuplicates!0 a!3892 (bvadd #b00000000000000000000000000000001 from!3270) lt!562384))))

(declare-datatypes ((Unit!41277 0))(
  ( (Unit!41278) )
))
(declare-fun lt!562385 () Unit!41277)

(declare-fun noDuplicateSubseq!88 (List!27387 List!27387) Unit!41277)

(assert (=> b!1243432 (= lt!562385 (noDuplicateSubseq!88 Nil!27384 lt!562384))))

(declare-fun b!1243433 () Bool)

(declare-fun res!829201 () Bool)

(assert (=> b!1243433 (=> (not res!829201) (not e!704929))))

(assert (=> b!1243433 (= res!829201 (not (contains!7408 Nil!27384 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!829208 () Bool)

(assert (=> start!103890 (=> (not res!829208) (not e!704930))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!103890 (= res!829208 (and (bvslt (size!39120 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39120 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39120 a!3892))))))

(assert (=> start!103890 e!704930))

(declare-fun array_inv!29432 (array!79982) Bool)

(assert (=> start!103890 (array_inv!29432 a!3892)))

(assert (=> start!103890 true))

(declare-fun b!1243427 () Bool)

(declare-fun res!829202 () Bool)

(assert (=> b!1243427 (=> (not res!829202) (not e!704930))))

(assert (=> b!1243427 (= res!829202 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39120 a!3892)) (not (= newFrom!287 (size!39120 a!3892)))))))

(assert (= (and start!103890 res!829208) b!1243431))

(assert (= (and b!1243431 res!829203) b!1243427))

(assert (= (and b!1243427 res!829202) b!1243430))

(assert (= (and b!1243430 res!829205) b!1243429))

(assert (= (and b!1243429 res!829209) b!1243425))

(assert (= (and b!1243425 res!829206) b!1243428))

(assert (= (and b!1243428 res!829204) b!1243424))

(assert (= (and b!1243424 res!829210) b!1243433))

(assert (= (and b!1243433 res!829201) b!1243423))

(assert (= (and b!1243423 res!829200) b!1243426))

(assert (= (and b!1243426 res!829207) b!1243432))

(declare-fun m!1145987 () Bool)

(assert (=> b!1243433 m!1145987))

(declare-fun m!1145989 () Bool)

(assert (=> b!1243431 m!1145989))

(declare-fun m!1145991 () Bool)

(assert (=> b!1243425 m!1145991))

(declare-fun m!1145993 () Bool)

(assert (=> b!1243423 m!1145993))

(declare-fun m!1145995 () Bool)

(assert (=> b!1243428 m!1145995))

(declare-fun m!1145997 () Bool)

(assert (=> b!1243424 m!1145997))

(declare-fun m!1145999 () Bool)

(assert (=> b!1243430 m!1145999))

(assert (=> b!1243430 m!1145999))

(declare-fun m!1146001 () Bool)

(assert (=> b!1243430 m!1146001))

(declare-fun m!1146003 () Bool)

(assert (=> start!103890 m!1146003))

(declare-fun m!1146005 () Bool)

(assert (=> b!1243426 m!1146005))

(assert (=> b!1243429 m!1145999))

(declare-fun m!1146007 () Bool)

(assert (=> b!1243432 m!1146007))

(declare-fun m!1146009 () Bool)

(assert (=> b!1243432 m!1146009))

(push 1)

