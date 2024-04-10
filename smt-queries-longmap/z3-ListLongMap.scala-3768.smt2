; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51604 () Bool)

(assert start!51604)

(declare-fun res!355868 () Bool)

(declare-fun e!325221 () Bool)

(assert (=> start!51604 (=> (not res!355868) (not e!325221))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51604 (= res!355868 (validMask!0 mask!3119))))

(assert (=> start!51604 e!325221))

(assert (=> start!51604 true))

(declare-datatypes ((array!35469 0))(
  ( (array!35470 (arr!17035 (Array (_ BitVec 32) (_ BitVec 64))) (size!17399 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35469)

(declare-fun array_inv!12831 (array!35469) Bool)

(assert (=> start!51604 (array_inv!12831 a!3118)))

(declare-fun b!564711 () Bool)

(declare-fun e!325219 () Bool)

(assert (=> b!564711 (= e!325219 (bvsgt #b00000000000000000000000000000000 (size!17399 a!3118)))))

(declare-fun b!564712 () Bool)

(declare-fun res!355863 () Bool)

(assert (=> b!564712 (=> (not res!355863) (not e!325221))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564712 (= res!355863 (validKeyInArray!0 k0!1914))))

(declare-fun b!564713 () Bool)

(assert (=> b!564713 (= e!325221 e!325219)))

(declare-fun res!355864 () Bool)

(assert (=> b!564713 (=> (not res!355864) (not e!325219))))

(declare-datatypes ((SeekEntryResult!5484 0))(
  ( (MissingZero!5484 (index!24163 (_ BitVec 32))) (Found!5484 (index!24164 (_ BitVec 32))) (Intermediate!5484 (undefined!6296 Bool) (index!24165 (_ BitVec 32)) (x!53035 (_ BitVec 32))) (Undefined!5484) (MissingVacant!5484 (index!24166 (_ BitVec 32))) )
))
(declare-fun lt!257647 () SeekEntryResult!5484)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!564713 (= res!355864 (or (= lt!257647 (MissingZero!5484 i!1132)) (= lt!257647 (MissingVacant!5484 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35469 (_ BitVec 32)) SeekEntryResult!5484)

(assert (=> b!564713 (= lt!257647 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564714 () Bool)

(declare-fun res!355871 () Bool)

(assert (=> b!564714 (=> (not res!355871) (not e!325221))))

(declare-fun j!142 () (_ BitVec 32))

(assert (=> b!564714 (= res!355871 (and (= (size!17399 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17399 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17399 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564715 () Bool)

(declare-fun res!355869 () Bool)

(assert (=> b!564715 (=> (not res!355869) (not e!325219))))

(declare-datatypes ((List!11115 0))(
  ( (Nil!11112) (Cons!11111 (h!12114 (_ BitVec 64)) (t!17343 List!11115)) )
))
(declare-fun arrayNoDuplicates!0 (array!35469 (_ BitVec 32) List!11115) Bool)

(assert (=> b!564715 (= res!355869 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11112))))

(declare-fun b!564716 () Bool)

(declare-fun res!355867 () Bool)

(assert (=> b!564716 (=> (not res!355867) (not e!325221))))

(declare-fun arrayContainsKey!0 (array!35469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564716 (= res!355867 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564717 () Bool)

(declare-fun res!355865 () Bool)

(assert (=> b!564717 (=> (not res!355865) (not e!325219))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35469 (_ BitVec 32)) SeekEntryResult!5484)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564717 (= res!355865 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17035 a!3118) j!142) mask!3119) (select (arr!17035 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17035 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17035 a!3118) i!1132 k0!1914) j!142) (array!35470 (store (arr!17035 a!3118) i!1132 k0!1914) (size!17399 a!3118)) mask!3119)))))

(declare-fun b!564718 () Bool)

(declare-fun res!355870 () Bool)

(assert (=> b!564718 (=> (not res!355870) (not e!325219))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35469 (_ BitVec 32)) Bool)

(assert (=> b!564718 (= res!355870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564719 () Bool)

(declare-fun res!355866 () Bool)

(assert (=> b!564719 (=> (not res!355866) (not e!325221))))

(assert (=> b!564719 (= res!355866 (validKeyInArray!0 (select (arr!17035 a!3118) j!142)))))

(assert (= (and start!51604 res!355868) b!564714))

(assert (= (and b!564714 res!355871) b!564719))

(assert (= (and b!564719 res!355866) b!564712))

(assert (= (and b!564712 res!355863) b!564716))

(assert (= (and b!564716 res!355867) b!564713))

(assert (= (and b!564713 res!355864) b!564718))

(assert (= (and b!564718 res!355870) b!564715))

(assert (= (and b!564715 res!355869) b!564717))

(assert (= (and b!564717 res!355865) b!564711))

(declare-fun m!543171 () Bool)

(assert (=> b!564713 m!543171))

(declare-fun m!543173 () Bool)

(assert (=> b!564716 m!543173))

(declare-fun m!543175 () Bool)

(assert (=> b!564717 m!543175))

(declare-fun m!543177 () Bool)

(assert (=> b!564717 m!543177))

(assert (=> b!564717 m!543175))

(declare-fun m!543179 () Bool)

(assert (=> b!564717 m!543179))

(declare-fun m!543181 () Bool)

(assert (=> b!564717 m!543181))

(assert (=> b!564717 m!543179))

(declare-fun m!543183 () Bool)

(assert (=> b!564717 m!543183))

(assert (=> b!564717 m!543177))

(assert (=> b!564717 m!543175))

(declare-fun m!543185 () Bool)

(assert (=> b!564717 m!543185))

(declare-fun m!543187 () Bool)

(assert (=> b!564717 m!543187))

(assert (=> b!564717 m!543179))

(assert (=> b!564717 m!543181))

(assert (=> b!564719 m!543175))

(assert (=> b!564719 m!543175))

(declare-fun m!543189 () Bool)

(assert (=> b!564719 m!543189))

(declare-fun m!543191 () Bool)

(assert (=> b!564712 m!543191))

(declare-fun m!543193 () Bool)

(assert (=> b!564718 m!543193))

(declare-fun m!543195 () Bool)

(assert (=> b!564715 m!543195))

(declare-fun m!543197 () Bool)

(assert (=> start!51604 m!543197))

(declare-fun m!543199 () Bool)

(assert (=> start!51604 m!543199))

(check-sat (not b!564713) (not b!564712) (not b!564719) (not start!51604) (not b!564718) (not b!564716) (not b!564717) (not b!564715))
(check-sat)
