; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48786 () Bool)

(assert start!48786)

(declare-fun b!536807 () Bool)

(declare-fun res!332016 () Bool)

(declare-fun e!311559 () Bool)

(assert (=> b!536807 (=> (not res!332016) (not e!311559))))

(declare-datatypes ((array!33998 0))(
  ( (array!33999 (arr!16338 (Array (_ BitVec 32) (_ BitVec 64))) (size!16702 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33998)

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33998 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!536807 (= res!332016 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!536808 () Bool)

(declare-fun res!332017 () Bool)

(assert (=> b!536808 (=> (not res!332017) (not e!311559))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!536808 (= res!332017 (validKeyInArray!0 (select (arr!16338 a!3154) j!147)))))

(declare-fun res!332021 () Bool)

(assert (=> start!48786 (=> (not res!332021) (not e!311559))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48786 (= res!332021 (validMask!0 mask!3216))))

(assert (=> start!48786 e!311559))

(assert (=> start!48786 true))

(declare-fun array_inv!12134 (array!33998) Bool)

(assert (=> start!48786 (array_inv!12134 a!3154)))

(declare-fun b!536809 () Bool)

(declare-fun e!311556 () Bool)

(declare-fun e!311555 () Bool)

(assert (=> b!536809 (= e!311556 e!311555)))

(declare-fun res!332018 () Bool)

(assert (=> b!536809 (=> (not res!332018) (not e!311555))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4796 0))(
  ( (MissingZero!4796 (index!21408 (_ BitVec 32))) (Found!4796 (index!21409 (_ BitVec 32))) (Intermediate!4796 (undefined!5608 Bool) (index!21410 (_ BitVec 32)) (x!50347 (_ BitVec 32))) (Undefined!4796) (MissingVacant!4796 (index!21411 (_ BitVec 32))) )
))
(declare-fun lt!246211 () SeekEntryResult!4796)

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!536809 (= res!332018 (= lt!246211 (Intermediate!4796 false resIndex!32 resX!32)))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33998 (_ BitVec 32)) SeekEntryResult!4796)

(assert (=> b!536809 (= lt!246211 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16338 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536810 () Bool)

(declare-fun e!311557 () Bool)

(assert (=> b!536810 (= e!311555 e!311557)))

(declare-fun res!332022 () Bool)

(assert (=> b!536810 (=> (not res!332022) (not e!311557))))

(declare-fun lt!246210 () (_ BitVec 32))

(assert (=> b!536810 (= res!332022 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1030) resX!32) (bvsge (bvadd #b00000000000000000000000000000001 x!1030) #b00000000000000000000000000000000) (bvsge lt!246210 #b00000000000000000000000000000000) (bvslt lt!246210 (size!16702 a!3154))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536810 (= lt!246210 (nextIndex!0 index!1177 x!1030 mask!3216))))

(declare-fun b!536811 () Bool)

(declare-fun res!332020 () Bool)

(assert (=> b!536811 (=> (not res!332020) (not e!311556))))

(assert (=> b!536811 (= res!332020 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16702 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16702 a!3154)) (= (select (arr!16338 a!3154) resIndex!32) (select (arr!16338 a!3154) j!147))))))

(declare-fun b!536812 () Bool)

(assert (=> b!536812 (= e!311559 e!311556)))

(declare-fun res!332013 () Bool)

(assert (=> b!536812 (=> (not res!332013) (not e!311556))))

(declare-fun lt!246208 () SeekEntryResult!4796)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!536812 (= res!332013 (or (= lt!246208 (MissingZero!4796 i!1153)) (= lt!246208 (MissingVacant!4796 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33998 (_ BitVec 32)) SeekEntryResult!4796)

(assert (=> b!536812 (= lt!246208 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!536813 () Bool)

(declare-fun res!332014 () Bool)

(assert (=> b!536813 (=> (not res!332014) (not e!311555))))

(assert (=> b!536813 (= res!332014 (and (not (= (select (arr!16338 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16338 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16338 a!3154) index!1177) (select (arr!16338 a!3154) j!147)))))))

(declare-fun b!536814 () Bool)

(declare-fun res!332024 () Bool)

(assert (=> b!536814 (=> (not res!332024) (not e!311556))))

(declare-datatypes ((List!10457 0))(
  ( (Nil!10454) (Cons!10453 (h!11396 (_ BitVec 64)) (t!16685 List!10457)) )
))
(declare-fun arrayNoDuplicates!0 (array!33998 (_ BitVec 32) List!10457) Bool)

(assert (=> b!536814 (= res!332024 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10454))))

(declare-fun b!536815 () Bool)

(declare-fun res!332015 () Bool)

(assert (=> b!536815 (=> (not res!332015) (not e!311556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33998 (_ BitVec 32)) Bool)

(assert (=> b!536815 (= res!332015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!536816 () Bool)

(declare-fun res!332012 () Bool)

(assert (=> b!536816 (=> (not res!332012) (not e!311555))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!536816 (= res!332012 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16338 a!3154) j!147) mask!3216) (select (arr!16338 a!3154) j!147) a!3154 mask!3216) lt!246211))))

(declare-fun b!536817 () Bool)

(assert (=> b!536817 (= e!311557 false)))

(declare-fun lt!246209 () SeekEntryResult!4796)

(assert (=> b!536817 (= lt!246209 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1030) lt!246210 (select (arr!16338 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!536818 () Bool)

(declare-fun res!332023 () Bool)

(assert (=> b!536818 (=> (not res!332023) (not e!311559))))

(assert (=> b!536818 (= res!332023 (validKeyInArray!0 k!1998))))

(declare-fun b!536819 () Bool)

(declare-fun res!332019 () Bool)

(assert (=> b!536819 (=> (not res!332019) (not e!311559))))

(assert (=> b!536819 (= res!332019 (and (= (size!16702 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16702 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16702 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48786 res!332021) b!536819))

(assert (= (and b!536819 res!332019) b!536808))

(assert (= (and b!536808 res!332017) b!536818))

(assert (= (and b!536818 res!332023) b!536807))

(assert (= (and b!536807 res!332016) b!536812))

(assert (= (and b!536812 res!332013) b!536815))

(assert (= (and b!536815 res!332015) b!536814))

(assert (= (and b!536814 res!332024) b!536811))

(assert (= (and b!536811 res!332020) b!536809))

(assert (= (and b!536809 res!332018) b!536816))

(assert (= (and b!536816 res!332012) b!536813))

(assert (= (and b!536813 res!332014) b!536810))

(assert (= (and b!536810 res!332022) b!536817))

(declare-fun m!516153 () Bool)

(assert (=> b!536817 m!516153))

(assert (=> b!536817 m!516153))

(declare-fun m!516155 () Bool)

(assert (=> b!536817 m!516155))

(assert (=> b!536809 m!516153))

(assert (=> b!536809 m!516153))

(declare-fun m!516157 () Bool)

(assert (=> b!536809 m!516157))

(declare-fun m!516159 () Bool)

(assert (=> b!536813 m!516159))

(assert (=> b!536813 m!516153))

(declare-fun m!516161 () Bool)

(assert (=> b!536810 m!516161))

(declare-fun m!516163 () Bool)

(assert (=> b!536811 m!516163))

(assert (=> b!536811 m!516153))

(declare-fun m!516165 () Bool)

(assert (=> b!536807 m!516165))

(declare-fun m!516167 () Bool)

(assert (=> b!536812 m!516167))

(declare-fun m!516169 () Bool)

(assert (=> b!536818 m!516169))

(assert (=> b!536808 m!516153))

(assert (=> b!536808 m!516153))

(declare-fun m!516171 () Bool)

(assert (=> b!536808 m!516171))

(declare-fun m!516173 () Bool)

(assert (=> b!536814 m!516173))

(assert (=> b!536816 m!516153))

(assert (=> b!536816 m!516153))

(declare-fun m!516175 () Bool)

(assert (=> b!536816 m!516175))

(assert (=> b!536816 m!516175))

(assert (=> b!536816 m!516153))

(declare-fun m!516177 () Bool)

(assert (=> b!536816 m!516177))

(declare-fun m!516179 () Bool)

(assert (=> b!536815 m!516179))

(declare-fun m!516181 () Bool)

(assert (=> start!48786 m!516181))

(declare-fun m!516183 () Bool)

(assert (=> start!48786 m!516183))

(push 1)

