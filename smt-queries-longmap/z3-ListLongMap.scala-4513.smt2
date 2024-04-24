; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62602 () Bool)

(assert start!62602)

(declare-fun b!705137 () Bool)

(declare-fun res!468848 () Bool)

(declare-fun e!397892 () Bool)

(assert (=> b!705137 (=> (not res!468848) (not e!397892))))

(declare-fun from!2969 () (_ BitVec 32))

(assert (=> b!705137 (= res!468848 (bvsge (bvadd #b00000000000000000000000000000001 from!2969) #b00000000000000000000000000000000))))

(declare-fun b!705138 () Bool)

(declare-fun res!468860 () Bool)

(assert (=> b!705138 (=> (not res!468860) (not e!397892))))

(declare-datatypes ((List!13212 0))(
  ( (Nil!13209) (Cons!13208 (h!14256 (_ BitVec 64)) (t!19486 List!13212)) )
))
(declare-fun acc!652 () List!13212)

(declare-fun newAcc!49 () List!13212)

(declare-fun subseq!332 (List!13212 List!13212) Bool)

(assert (=> b!705138 (= res!468860 (subseq!332 acc!652 newAcc!49))))

(declare-fun b!705139 () Bool)

(assert (=> b!705139 (= e!397892 false)))

(declare-fun lt!317970 () Bool)

(declare-datatypes ((array!40221 0))(
  ( (array!40222 (arr!19264 (Array (_ BitVec 32) (_ BitVec 64))) (size!19647 (_ BitVec 32))) )
))
(declare-fun a!3591 () array!40221)

(declare-fun arrayNoDuplicates!0 (array!40221 (_ BitVec 32) List!13212) Bool)

(assert (=> b!705139 (= lt!317970 (arrayNoDuplicates!0 a!3591 (bvadd #b00000000000000000000000000000001 from!2969) acc!652))))

(declare-fun b!705140 () Bool)

(declare-fun res!468855 () Bool)

(assert (=> b!705140 (=> (not res!468855) (not e!397892))))

(declare-fun noDuplicate!1138 (List!13212) Bool)

(assert (=> b!705140 (= res!468855 (noDuplicate!1138 acc!652))))

(declare-fun b!705142 () Bool)

(declare-fun res!468854 () Bool)

(assert (=> b!705142 (=> (not res!468854) (not e!397892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!705142 (= res!468854 (not (validKeyInArray!0 (select (arr!19264 a!3591) from!2969))))))

(declare-fun b!705143 () Bool)

(declare-fun res!468851 () Bool)

(assert (=> b!705143 (=> (not res!468851) (not e!397892))))

(declare-fun k0!2824 () (_ BitVec 64))

(declare-fun contains!3864 (List!13212 (_ BitVec 64)) Bool)

(assert (=> b!705143 (= res!468851 (not (contains!3864 acc!652 k0!2824)))))

(declare-fun b!705144 () Bool)

(declare-fun res!468865 () Bool)

(assert (=> b!705144 (=> (not res!468865) (not e!397892))))

(assert (=> b!705144 (= res!468865 (not (contains!3864 acc!652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705145 () Bool)

(declare-fun res!468862 () Bool)

(assert (=> b!705145 (=> (not res!468862) (not e!397892))))

(declare-fun -!296 (List!13212 (_ BitVec 64)) List!13212)

(assert (=> b!705145 (= res!468862 (= (-!296 newAcc!49 k0!2824) acc!652))))

(declare-fun b!705146 () Bool)

(declare-fun res!468850 () Bool)

(assert (=> b!705146 (=> (not res!468850) (not e!397892))))

(assert (=> b!705146 (= res!468850 (bvslt (bvadd #b00000000000000000000000000000001 from!2969) (size!19647 a!3591)))))

(declare-fun b!705147 () Bool)

(declare-fun res!468861 () Bool)

(assert (=> b!705147 (=> (not res!468861) (not e!397892))))

(assert (=> b!705147 (= res!468861 (validKeyInArray!0 k0!2824))))

(declare-fun b!705148 () Bool)

(declare-fun res!468857 () Bool)

(assert (=> b!705148 (=> (not res!468857) (not e!397892))))

(assert (=> b!705148 (= res!468857 (not (contains!3864 acc!652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705141 () Bool)

(declare-fun res!468852 () Bool)

(assert (=> b!705141 (=> (not res!468852) (not e!397892))))

(assert (=> b!705141 (= res!468852 (not (contains!3864 newAcc!49 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!468853 () Bool)

(assert (=> start!62602 (=> (not res!468853) (not e!397892))))

(assert (=> start!62602 (= res!468853 (and (bvslt (size!19647 a!3591) #b01111111111111111111111111111111) (bvsge from!2969 #b00000000000000000000000000000000) (bvslt from!2969 (size!19647 a!3591))))))

(assert (=> start!62602 e!397892))

(assert (=> start!62602 true))

(declare-fun array_inv!15123 (array!40221) Bool)

(assert (=> start!62602 (array_inv!15123 a!3591)))

(declare-fun b!705149 () Bool)

(declare-fun res!468856 () Bool)

(assert (=> b!705149 (=> (not res!468856) (not e!397892))))

(declare-fun arrayContainsKey!0 (array!40221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!705149 (= res!468856 (not (arrayContainsKey!0 a!3591 k0!2824 from!2969)))))

(declare-fun b!705150 () Bool)

(declare-fun res!468863 () Bool)

(assert (=> b!705150 (=> (not res!468863) (not e!397892))))

(assert (=> b!705150 (= res!468863 (noDuplicate!1138 newAcc!49))))

(declare-fun b!705151 () Bool)

(declare-fun res!468849 () Bool)

(assert (=> b!705151 (=> (not res!468849) (not e!397892))))

(assert (=> b!705151 (= res!468849 (not (arrayContainsKey!0 a!3591 k0!2824 (bvadd #b00000000000000000000000000000001 from!2969))))))

(declare-fun b!705152 () Bool)

(declare-fun res!468864 () Bool)

(assert (=> b!705152 (=> (not res!468864) (not e!397892))))

(assert (=> b!705152 (= res!468864 (not (contains!3864 newAcc!49 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!705153 () Bool)

(declare-fun res!468858 () Bool)

(assert (=> b!705153 (=> (not res!468858) (not e!397892))))

(assert (=> b!705153 (= res!468858 (contains!3864 newAcc!49 k0!2824))))

(declare-fun b!705154 () Bool)

(declare-fun res!468859 () Bool)

(assert (=> b!705154 (=> (not res!468859) (not e!397892))))

(assert (=> b!705154 (= res!468859 (arrayNoDuplicates!0 a!3591 from!2969 acc!652))))

(assert (= (and start!62602 res!468853) b!705140))

(assert (= (and b!705140 res!468855) b!705150))

(assert (= (and b!705150 res!468863) b!705148))

(assert (= (and b!705148 res!468857) b!705144))

(assert (= (and b!705144 res!468865) b!705149))

(assert (= (and b!705149 res!468856) b!705143))

(assert (= (and b!705143 res!468851) b!705147))

(assert (= (and b!705147 res!468861) b!705154))

(assert (= (and b!705154 res!468859) b!705138))

(assert (= (and b!705138 res!468860) b!705153))

(assert (= (and b!705153 res!468858) b!705145))

(assert (= (and b!705145 res!468862) b!705141))

(assert (= (and b!705141 res!468852) b!705152))

(assert (= (and b!705152 res!468864) b!705146))

(assert (= (and b!705146 res!468850) b!705142))

(assert (= (and b!705142 res!468854) b!705137))

(assert (= (and b!705137 res!468848) b!705151))

(assert (= (and b!705151 res!468849) b!705139))

(declare-fun m!663927 () Bool)

(assert (=> b!705154 m!663927))

(declare-fun m!663929 () Bool)

(assert (=> b!705148 m!663929))

(declare-fun m!663931 () Bool)

(assert (=> b!705139 m!663931))

(declare-fun m!663933 () Bool)

(assert (=> b!705153 m!663933))

(declare-fun m!663935 () Bool)

(assert (=> b!705144 m!663935))

(declare-fun m!663937 () Bool)

(assert (=> b!705150 m!663937))

(declare-fun m!663939 () Bool)

(assert (=> b!705140 m!663939))

(declare-fun m!663941 () Bool)

(assert (=> b!705142 m!663941))

(assert (=> b!705142 m!663941))

(declare-fun m!663943 () Bool)

(assert (=> b!705142 m!663943))

(declare-fun m!663945 () Bool)

(assert (=> b!705149 m!663945))

(declare-fun m!663947 () Bool)

(assert (=> b!705147 m!663947))

(declare-fun m!663949 () Bool)

(assert (=> b!705145 m!663949))

(declare-fun m!663951 () Bool)

(assert (=> b!705151 m!663951))

(declare-fun m!663953 () Bool)

(assert (=> b!705138 m!663953))

(declare-fun m!663955 () Bool)

(assert (=> b!705141 m!663955))

(declare-fun m!663957 () Bool)

(assert (=> b!705143 m!663957))

(declare-fun m!663959 () Bool)

(assert (=> b!705152 m!663959))

(declare-fun m!663961 () Bool)

(assert (=> start!62602 m!663961))

(check-sat (not b!705145) (not b!705149) (not b!705138) (not b!705140) (not b!705151) (not b!705150) (not b!705154) (not b!705152) (not b!705141) (not b!705153) (not start!62602) (not b!705148) (not b!705139) (not b!705144) (not b!705142) (not b!705147) (not b!705143))
(check-sat)
