; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!60216 () Bool)

(assert start!60216)

(declare-fun b!674056 () Bool)

(declare-fun res!440568 () Bool)

(declare-fun e!384828 () Bool)

(assert (=> b!674056 (=> (not res!440568) (not e!384828))))

(declare-datatypes ((List!12865 0))(
  ( (Nil!12862) (Cons!12861 (h!13906 (_ BitVec 64)) (t!19093 List!12865)) )
))
(declare-fun lt!312559 () List!12865)

(declare-fun noDuplicate!689 (List!12865) Bool)

(assert (=> b!674056 (= res!440568 (noDuplicate!689 lt!312559))))

(declare-fun b!674057 () Bool)

(declare-fun res!440578 () Bool)

(assert (=> b!674057 (=> (not res!440578) (not e!384828))))

(declare-fun e!384833 () Bool)

(assert (=> b!674057 (= res!440578 e!384833)))

(declare-fun res!440565 () Bool)

(assert (=> b!674057 (=> res!440565 e!384833)))

(declare-fun e!384832 () Bool)

(assert (=> b!674057 (= res!440565 e!384832)))

(declare-fun res!440566 () Bool)

(assert (=> b!674057 (=> (not res!440566) (not e!384832))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!674057 (= res!440566 (bvsgt (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674058 () Bool)

(declare-fun e!384826 () Bool)

(declare-fun e!384825 () Bool)

(assert (=> b!674058 (= e!384826 e!384825)))

(declare-fun res!440574 () Bool)

(assert (=> b!674058 (=> (not res!440574) (not e!384825))))

(assert (=> b!674058 (= res!440574 (bvsle from!3004 i!1382))))

(declare-fun b!674059 () Bool)

(declare-fun e!384830 () Bool)

(assert (=> b!674059 (= e!384830 e!384828)))

(declare-fun res!440579 () Bool)

(assert (=> b!674059 (=> (not res!440579) (not e!384828))))

(assert (=> b!674059 (= res!440579 (bvsge (bvadd #b00000000000000000000000000000001 from!3004) #b00000000000000000000000000000000))))

(declare-fun acc!681 () List!12865)

(declare-datatypes ((array!39263 0))(
  ( (array!39264 (arr!18824 (Array (_ BitVec 32) (_ BitVec 64))) (size!19188 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39263)

(declare-fun $colon$colon!292 (List!12865 (_ BitVec 64)) List!12865)

(assert (=> b!674059 (= lt!312559 ($colon$colon!292 acc!681 (select (arr!18824 a!3626) from!3004)))))

(declare-fun b!674060 () Bool)

(declare-fun e!384829 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(declare-fun contains!3442 (List!12865 (_ BitVec 64)) Bool)

(assert (=> b!674060 (= e!384829 (contains!3442 acc!681 k!2843))))

(declare-fun b!674061 () Bool)

(declare-fun res!440562 () Bool)

(declare-fun e!384834 () Bool)

(assert (=> b!674061 (=> (not res!440562) (not e!384834))))

(declare-fun arrayNoDuplicates!0 (array!39263 (_ BitVec 32) List!12865) Bool)

(assert (=> b!674061 (= res!440562 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!674062 () Bool)

(declare-datatypes ((Unit!23708 0))(
  ( (Unit!23709) )
))
(declare-fun e!384831 () Unit!23708)

(declare-fun Unit!23710 () Unit!23708)

(assert (=> b!674062 (= e!384831 Unit!23710)))

(declare-fun b!674063 () Bool)

(assert (=> b!674063 (= e!384828 false)))

(declare-fun lt!312561 () Bool)

(assert (=> b!674063 (= lt!312561 (arrayNoDuplicates!0 a!3626 (bvadd #b00000000000000000000000000000001 from!3004) lt!312559))))

(declare-fun b!674064 () Bool)

(declare-fun res!440567 () Bool)

(assert (=> b!674064 (=> (not res!440567) (not e!384834))))

(assert (=> b!674064 (= res!440567 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19188 a!3626))))))

(declare-fun b!674065 () Bool)

(assert (=> b!674065 (= e!384832 (contains!3442 lt!312559 k!2843))))

(declare-fun b!674067 () Bool)

(declare-fun res!440570 () Bool)

(assert (=> b!674067 (=> (not res!440570) (not e!384834))))

(assert (=> b!674067 (= res!440570 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12862))))

(declare-fun b!674068 () Bool)

(declare-fun e!384827 () Bool)

(assert (=> b!674068 (= e!384833 e!384827)))

(declare-fun res!440559 () Bool)

(assert (=> b!674068 (=> (not res!440559) (not e!384827))))

(assert (=> b!674068 (= res!440559 (bvsle (bvadd #b00000000000000000000000000000001 from!3004) i!1382))))

(declare-fun b!674069 () Bool)

(declare-fun res!440560 () Bool)

(assert (=> b!674069 (=> (not res!440560) (not e!384834))))

(assert (=> b!674069 (= res!440560 e!384826)))

(declare-fun res!440571 () Bool)

(assert (=> b!674069 (=> res!440571 e!384826)))

(assert (=> b!674069 (= res!440571 e!384829)))

(declare-fun res!440575 () Bool)

(assert (=> b!674069 (=> (not res!440575) (not e!384829))))

(assert (=> b!674069 (= res!440575 (bvsgt from!3004 i!1382))))

(declare-fun b!674070 () Bool)

(declare-fun res!440557 () Bool)

(assert (=> b!674070 (=> (not res!440557) (not e!384834))))

(declare-fun arrayContainsKey!0 (array!39263 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!674070 (= res!440557 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!674071 () Bool)

(declare-fun res!440564 () Bool)

(assert (=> b!674071 (=> (not res!440564) (not e!384828))))

(assert (=> b!674071 (= res!440564 (not (contains!3442 lt!312559 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674072 () Bool)

(declare-fun res!440572 () Bool)

(assert (=> b!674072 (=> (not res!440572) (not e!384834))))

(assert (=> b!674072 (= res!440572 (not (contains!3442 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674073 () Bool)

(declare-fun res!440569 () Bool)

(assert (=> b!674073 (=> (not res!440569) (not e!384834))))

(assert (=> b!674073 (= res!440569 (noDuplicate!689 acc!681))))

(declare-fun b!674074 () Bool)

(declare-fun res!440573 () Bool)

(assert (=> b!674074 (=> (not res!440573) (not e!384834))))

(assert (=> b!674074 (= res!440573 (not (contains!3442 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674075 () Bool)

(assert (=> b!674075 (= e!384825 (not (contains!3442 acc!681 k!2843)))))

(declare-fun b!674076 () Bool)

(assert (=> b!674076 (= e!384834 e!384830)))

(declare-fun res!440558 () Bool)

(assert (=> b!674076 (=> (not res!440558) (not e!384830))))

(assert (=> b!674076 (= res!440558 (not (= (select (arr!18824 a!3626) from!3004) k!2843)))))

(declare-fun lt!312560 () Unit!23708)

(assert (=> b!674076 (= lt!312560 e!384831)))

(declare-fun c!77117 () Bool)

(assert (=> b!674076 (= c!77117 (= (select (arr!18824 a!3626) from!3004) k!2843))))

(declare-fun b!674077 () Bool)

(assert (=> b!674077 (= e!384827 (not (contains!3442 lt!312559 k!2843)))))

(declare-fun b!674078 () Bool)

(declare-fun res!440577 () Bool)

(assert (=> b!674078 (=> (not res!440577) (not e!384834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!674078 (= res!440577 (validKeyInArray!0 k!2843))))

(declare-fun b!674079 () Bool)

(declare-fun res!440561 () Bool)

(assert (=> b!674079 (=> (not res!440561) (not e!384834))))

(assert (=> b!674079 (= res!440561 (validKeyInArray!0 (select (arr!18824 a!3626) from!3004)))))

(declare-fun res!440556 () Bool)

(assert (=> start!60216 (=> (not res!440556) (not e!384834))))

(assert (=> start!60216 (= res!440556 (and (bvslt (size!19188 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19188 a!3626))))))

(assert (=> start!60216 e!384834))

(assert (=> start!60216 true))

(declare-fun array_inv!14620 (array!39263) Bool)

(assert (=> start!60216 (array_inv!14620 a!3626)))

(declare-fun b!674066 () Bool)

(declare-fun res!440576 () Bool)

(assert (=> b!674066 (=> (not res!440576) (not e!384828))))

(assert (=> b!674066 (= res!440576 (not (contains!3442 lt!312559 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!674080 () Bool)

(declare-fun res!440563 () Bool)

(assert (=> b!674080 (=> (not res!440563) (not e!384834))))

(assert (=> b!674080 (= res!440563 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19188 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!674081 () Bool)

(declare-fun Unit!23711 () Unit!23708)

(assert (=> b!674081 (= e!384831 Unit!23711)))

(assert (=> b!674081 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!312562 () Unit!23708)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39263 (_ BitVec 64) (_ BitVec 32)) Unit!23708)

(assert (=> b!674081 (= lt!312562 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!674081 false))

(assert (= (and start!60216 res!440556) b!674073))

(assert (= (and b!674073 res!440569) b!674072))

(assert (= (and b!674072 res!440572) b!674074))

(assert (= (and b!674074 res!440573) b!674069))

(assert (= (and b!674069 res!440575) b!674060))

(assert (= (and b!674069 (not res!440571)) b!674058))

(assert (= (and b!674058 res!440574) b!674075))

(assert (= (and b!674069 res!440560) b!674067))

(assert (= (and b!674067 res!440570) b!674061))

(assert (= (and b!674061 res!440562) b!674064))

(assert (= (and b!674064 res!440567) b!674078))

(assert (= (and b!674078 res!440577) b!674070))

(assert (= (and b!674070 res!440557) b!674080))

(assert (= (and b!674080 res!440563) b!674079))

(assert (= (and b!674079 res!440561) b!674076))

(assert (= (and b!674076 c!77117) b!674081))

(assert (= (and b!674076 (not c!77117)) b!674062))

(assert (= (and b!674076 res!440558) b!674059))

(assert (= (and b!674059 res!440579) b!674056))

(assert (= (and b!674056 res!440568) b!674071))

(assert (= (and b!674071 res!440564) b!674066))

(assert (= (and b!674066 res!440576) b!674057))

(assert (= (and b!674057 res!440566) b!674065))

(assert (= (and b!674057 (not res!440565)) b!674068))

(assert (= (and b!674068 res!440559) b!674077))

(assert (= (and b!674057 res!440578) b!674063))

(declare-fun m!642189 () Bool)

(assert (=> b!674078 m!642189))

(declare-fun m!642191 () Bool)

(assert (=> b!674067 m!642191))

(declare-fun m!642193 () Bool)

(assert (=> b!674056 m!642193))

(declare-fun m!642195 () Bool)

(assert (=> b!674071 m!642195))

(declare-fun m!642197 () Bool)

(assert (=> b!674075 m!642197))

(declare-fun m!642199 () Bool)

(assert (=> b!674072 m!642199))

(declare-fun m!642201 () Bool)

(assert (=> b!674070 m!642201))

(declare-fun m!642203 () Bool)

(assert (=> b!674074 m!642203))

(declare-fun m!642205 () Bool)

(assert (=> b!674066 m!642205))

(declare-fun m!642207 () Bool)

(assert (=> b!674065 m!642207))

(declare-fun m!642209 () Bool)

(assert (=> b!674059 m!642209))

(assert (=> b!674059 m!642209))

(declare-fun m!642211 () Bool)

(assert (=> b!674059 m!642211))

(declare-fun m!642213 () Bool)

(assert (=> b!674061 m!642213))

(declare-fun m!642215 () Bool)

(assert (=> b!674073 m!642215))

(declare-fun m!642217 () Bool)

(assert (=> b!674063 m!642217))

(declare-fun m!642219 () Bool)

(assert (=> start!60216 m!642219))

(assert (=> b!674079 m!642209))

(assert (=> b!674079 m!642209))

(declare-fun m!642221 () Bool)

(assert (=> b!674079 m!642221))

(declare-fun m!642223 () Bool)

(assert (=> b!674081 m!642223))

(declare-fun m!642225 () Bool)

(assert (=> b!674081 m!642225))

(assert (=> b!674060 m!642197))

(assert (=> b!674077 m!642207))

(assert (=> b!674076 m!642209))

(push 1)

