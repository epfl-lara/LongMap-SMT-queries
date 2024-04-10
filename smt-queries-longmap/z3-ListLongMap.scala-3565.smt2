; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49016 () Bool)

(assert start!49016)

(declare-fun b!540116 () Bool)

(declare-fun res!335170 () Bool)

(declare-fun e!312971 () Bool)

(assert (=> b!540116 (=> (not res!335170) (not e!312971))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!540116 (= res!335170 (validKeyInArray!0 k0!1998))))

(declare-fun b!540117 () Bool)

(declare-fun e!312972 () Bool)

(assert (=> b!540117 (= e!312972 false)))

(declare-datatypes ((SeekEntryResult!4884 0))(
  ( (MissingZero!4884 (index!21760 (_ BitVec 32))) (Found!4884 (index!21761 (_ BitVec 32))) (Intermediate!4884 (undefined!5696 Bool) (index!21762 (_ BitVec 32)) (x!50673 (_ BitVec 32))) (Undefined!4884) (MissingVacant!4884 (index!21763 (_ BitVec 32))) )
))
(declare-fun lt!247314 () SeekEntryResult!4884)

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34177 0))(
  ( (array!34178 (arr!16426 (Array (_ BitVec 32) (_ BitVec 64))) (size!16790 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34177)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34177 (_ BitVec 32)) SeekEntryResult!4884)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!540117 (= lt!247314 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16426 a!3154) j!147) mask!3216) (select (arr!16426 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!540118 () Bool)

(assert (=> b!540118 (= e!312971 e!312972)))

(declare-fun res!335163 () Bool)

(assert (=> b!540118 (=> (not res!335163) (not e!312972))))

(declare-fun lt!247315 () SeekEntryResult!4884)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!540118 (= res!335163 (or (= lt!247315 (MissingZero!4884 i!1153)) (= lt!247315 (MissingVacant!4884 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34177 (_ BitVec 32)) SeekEntryResult!4884)

(assert (=> b!540118 (= lt!247315 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!540119 () Bool)

(declare-fun res!335166 () Bool)

(assert (=> b!540119 (=> (not res!335166) (not e!312971))))

(assert (=> b!540119 (= res!335166 (and (= (size!16790 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16790 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16790 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!540120 () Bool)

(declare-fun res!335169 () Bool)

(assert (=> b!540120 (=> (not res!335169) (not e!312972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34177 (_ BitVec 32)) Bool)

(assert (=> b!540120 (= res!335169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!540121 () Bool)

(declare-fun res!335162 () Bool)

(assert (=> b!540121 (=> (not res!335162) (not e!312972))))

(declare-datatypes ((List!10545 0))(
  ( (Nil!10542) (Cons!10541 (h!11487 (_ BitVec 64)) (t!16773 List!10545)) )
))
(declare-fun arrayNoDuplicates!0 (array!34177 (_ BitVec 32) List!10545) Bool)

(assert (=> b!540121 (= res!335162 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10542))))

(declare-fun b!540122 () Bool)

(declare-fun res!335167 () Bool)

(assert (=> b!540122 (=> (not res!335167) (not e!312972))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(assert (=> b!540122 (= res!335167 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16790 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16790 a!3154)) (= (select (arr!16426 a!3154) resIndex!32) (select (arr!16426 a!3154) j!147))))))

(declare-fun res!335168 () Bool)

(assert (=> start!49016 (=> (not res!335168) (not e!312971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49016 (= res!335168 (validMask!0 mask!3216))))

(assert (=> start!49016 e!312971))

(assert (=> start!49016 true))

(declare-fun array_inv!12222 (array!34177) Bool)

(assert (=> start!49016 (array_inv!12222 a!3154)))

(declare-fun b!540123 () Bool)

(declare-fun res!335164 () Bool)

(assert (=> b!540123 (=> (not res!335164) (not e!312971))))

(assert (=> b!540123 (= res!335164 (validKeyInArray!0 (select (arr!16426 a!3154) j!147)))))

(declare-fun b!540124 () Bool)

(declare-fun res!335165 () Bool)

(assert (=> b!540124 (=> (not res!335165) (not e!312971))))

(declare-fun arrayContainsKey!0 (array!34177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!540124 (= res!335165 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!540125 () Bool)

(declare-fun res!335171 () Bool)

(assert (=> b!540125 (=> (not res!335171) (not e!312972))))

(assert (=> b!540125 (= res!335171 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16426 a!3154) j!147) a!3154 mask!3216) (Intermediate!4884 false resIndex!32 resX!32)))))

(assert (= (and start!49016 res!335168) b!540119))

(assert (= (and b!540119 res!335166) b!540123))

(assert (= (and b!540123 res!335164) b!540116))

(assert (= (and b!540116 res!335170) b!540124))

(assert (= (and b!540124 res!335165) b!540118))

(assert (= (and b!540118 res!335163) b!540120))

(assert (= (and b!540120 res!335169) b!540121))

(assert (= (and b!540121 res!335162) b!540122))

(assert (= (and b!540122 res!335167) b!540125))

(assert (= (and b!540125 res!335171) b!540117))

(declare-fun m!518957 () Bool)

(assert (=> start!49016 m!518957))

(declare-fun m!518959 () Bool)

(assert (=> start!49016 m!518959))

(declare-fun m!518961 () Bool)

(assert (=> b!540121 m!518961))

(declare-fun m!518963 () Bool)

(assert (=> b!540116 m!518963))

(declare-fun m!518965 () Bool)

(assert (=> b!540118 m!518965))

(declare-fun m!518967 () Bool)

(assert (=> b!540120 m!518967))

(declare-fun m!518969 () Bool)

(assert (=> b!540125 m!518969))

(assert (=> b!540125 m!518969))

(declare-fun m!518971 () Bool)

(assert (=> b!540125 m!518971))

(assert (=> b!540117 m!518969))

(assert (=> b!540117 m!518969))

(declare-fun m!518973 () Bool)

(assert (=> b!540117 m!518973))

(assert (=> b!540117 m!518973))

(assert (=> b!540117 m!518969))

(declare-fun m!518975 () Bool)

(assert (=> b!540117 m!518975))

(declare-fun m!518977 () Bool)

(assert (=> b!540122 m!518977))

(assert (=> b!540122 m!518969))

(assert (=> b!540123 m!518969))

(assert (=> b!540123 m!518969))

(declare-fun m!518979 () Bool)

(assert (=> b!540123 m!518979))

(declare-fun m!518981 () Bool)

(assert (=> b!540124 m!518981))

(check-sat (not b!540117) (not b!540123) (not b!540125) (not b!540124) (not b!540118) (not start!49016) (not b!540120) (not b!540116) (not b!540121))
(check-sat)
