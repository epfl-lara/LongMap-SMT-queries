; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49014 () Bool)

(assert start!49014)

(declare-fun b!540086 () Bool)

(declare-fun res!335136 () Bool)

(declare-fun e!312961 () Bool)

(assert (=> b!540086 (=> (not res!335136) (not e!312961))))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34175 0))(
  ( (array!34176 (arr!16425 (Array (_ BitVec 32) (_ BitVec 64))) (size!16789 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34175)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540086 (= res!335136 (and (= (size!16789 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16789 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16789 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540087 () Bool)

(declare-fun res!335133 () Bool)

(declare-fun e!312962 () Bool)

(assert (=> b!540087 (=> (not res!335133) (not e!312962))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!540087 (= res!335133 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16789 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16789 a!3154)) (= (select (arr!16425 a!3154) resIndex!32) (select (arr!16425 a!3154) j!147))))))

(declare-fun res!335141 () Bool)

(assert (=> start!49014 (=> (not res!335141) (not e!312961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49014 (= res!335141 (validMask!0 mask!3216))))

(assert (=> start!49014 e!312961))

(assert (=> start!49014 true))

(declare-fun array_inv!12221 (array!34175) Bool)

(assert (=> start!49014 (array_inv!12221 a!3154)))

(declare-fun b!540088 () Bool)

(declare-fun res!335135 () Bool)

(assert (=> b!540088 (=> (not res!335135) (not e!312962))))

(declare-datatypes ((SeekEntryResult!4883 0))(
  ( (MissingZero!4883 (index!21756 (_ BitVec 32))) (Found!4883 (index!21757 (_ BitVec 32))) (Intermediate!4883 (undefined!5695 Bool) (index!21758 (_ BitVec 32)) (x!50672 (_ BitVec 32))) (Undefined!4883) (MissingVacant!4883 (index!21759 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34175 (_ BitVec 32)) SeekEntryResult!4883)

(assert (=> b!540088 (= res!335135 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16425 a!3154) j!147) a!3154 mask!3216) (Intermediate!4883 false resIndex!32 resX!32)))))

(declare-fun b!540089 () Bool)

(declare-fun res!335140 () Bool)

(assert (=> b!540089 (=> (not res!335140) (not e!312961))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540089 (= res!335140 (validKeyInArray!0 (select (arr!16425 a!3154) j!147)))))

(declare-fun b!540090 () Bool)

(declare-fun res!335137 () Bool)

(assert (=> b!540090 (=> (not res!335137) (not e!312961))))

(declare-fun k!1998 () (_ BitVec 64))

(assert (=> b!540090 (= res!335137 (validKeyInArray!0 k!1998))))

(declare-fun b!540091 () Bool)

(declare-fun res!335138 () Bool)

(assert (=> b!540091 (=> (not res!335138) (not e!312962))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34175 (_ BitVec 32)) Bool)

(assert (=> b!540091 (= res!335138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540092 () Bool)

(assert (=> b!540092 (= e!312961 e!312962)))

(declare-fun res!335132 () Bool)

(assert (=> b!540092 (=> (not res!335132) (not e!312962))))

(declare-fun lt!247308 () SeekEntryResult!4883)

(assert (=> b!540092 (= res!335132 (or (= lt!247308 (MissingZero!4883 i!1153)) (= lt!247308 (MissingVacant!4883 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34175 (_ BitVec 32)) SeekEntryResult!4883)

(assert (=> b!540092 (= lt!247308 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!540093 () Bool)

(declare-fun res!335134 () Bool)

(assert (=> b!540093 (=> (not res!335134) (not e!312961))))

(declare-fun arrayContainsKey!0 (array!34175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540093 (= res!335134 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540094 () Bool)

(declare-fun res!335139 () Bool)

(assert (=> b!540094 (=> (not res!335139) (not e!312962))))

(declare-datatypes ((List!10544 0))(
  ( (Nil!10541) (Cons!10540 (h!11486 (_ BitVec 64)) (t!16772 List!10544)) )
))
(declare-fun arrayNoDuplicates!0 (array!34175 (_ BitVec 32) List!10544) Bool)

(assert (=> b!540094 (= res!335139 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10541))))

(declare-fun b!540095 () Bool)

(assert (=> b!540095 (= e!312962 false)))

(declare-fun lt!247309 () SeekEntryResult!4883)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540095 (= lt!247309 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16425 a!3154) j!147) mask!3216) (select (arr!16425 a!3154) j!147) a!3154 mask!3216))))

(assert (= (and start!49014 res!335141) b!540086))

(assert (= (and b!540086 res!335136) b!540089))

(assert (= (and b!540089 res!335140) b!540090))

(assert (= (and b!540090 res!335137) b!540093))

(assert (= (and b!540093 res!335134) b!540092))

(assert (= (and b!540092 res!335132) b!540091))

(assert (= (and b!540091 res!335138) b!540094))

(assert (= (and b!540094 res!335139) b!540087))

(assert (= (and b!540087 res!335133) b!540088))

(assert (= (and b!540088 res!335135) b!540095))

(declare-fun m!518931 () Bool)

(assert (=> b!540091 m!518931))

(declare-fun m!518933 () Bool)

(assert (=> b!540090 m!518933))

(declare-fun m!518935 () Bool)

(assert (=> b!540094 m!518935))

(declare-fun m!518937 () Bool)

(assert (=> b!540095 m!518937))

(assert (=> b!540095 m!518937))

(declare-fun m!518939 () Bool)

(assert (=> b!540095 m!518939))

(assert (=> b!540095 m!518939))

(assert (=> b!540095 m!518937))

(declare-fun m!518941 () Bool)

(assert (=> b!540095 m!518941))

(declare-fun m!518943 () Bool)

(assert (=> start!49014 m!518943))

(declare-fun m!518945 () Bool)

(assert (=> start!49014 m!518945))

(assert (=> b!540089 m!518937))

(assert (=> b!540089 m!518937))

(declare-fun m!518947 () Bool)

(assert (=> b!540089 m!518947))

(declare-fun m!518949 () Bool)

(assert (=> b!540092 m!518949))

(declare-fun m!518951 () Bool)

(assert (=> b!540093 m!518951))

(declare-fun m!518953 () Bool)

(assert (=> b!540087 m!518953))

(assert (=> b!540087 m!518937))

(assert (=> b!540088 m!518937))

(assert (=> b!540088 m!518937))

(declare-fun m!518955 () Bool)

(assert (=> b!540088 m!518955))

(push 1)

