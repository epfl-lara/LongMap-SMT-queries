; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50798 () Bool)

(assert start!50798)

(declare-fun b!555658 () Bool)

(declare-fun res!348220 () Bool)

(declare-fun e!320179 () Bool)

(assert (=> b!555658 (=> (not res!348220) (not e!320179))))

(declare-datatypes ((array!35032 0))(
  ( (array!35033 (arr!16826 (Array (_ BitVec 32) (_ BitVec 64))) (size!17191 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35032)

(declare-datatypes ((List!10945 0))(
  ( (Nil!10942) (Cons!10941 (h!11926 (_ BitVec 64)) (t!17164 List!10945)) )
))
(declare-fun arrayNoDuplicates!0 (array!35032 (_ BitVec 32) List!10945) Bool)

(assert (=> b!555658 (= res!348220 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10942))))

(declare-fun b!555659 () Bool)

(declare-fun res!348218 () Bool)

(declare-fun e!320181 () Bool)

(assert (=> b!555659 (=> (not res!348218) (not e!320181))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!555659 (= res!348218 (validKeyInArray!0 (select (arr!16826 a!3118) j!142)))))

(declare-fun b!555660 () Bool)

(declare-fun res!348217 () Bool)

(assert (=> b!555660 (=> (not res!348217) (not e!320181))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!555660 (= res!348217 (and (= (size!17191 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17191 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17191 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!555661 () Bool)

(declare-fun res!348214 () Bool)

(assert (=> b!555661 (=> (not res!348214) (not e!320179))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!5272 0))(
  ( (MissingZero!5272 (index!23315 (_ BitVec 32))) (Found!5272 (index!23316 (_ BitVec 32))) (Intermediate!5272 (undefined!6084 Bool) (index!23317 (_ BitVec 32)) (x!52221 (_ BitVec 32))) (Undefined!5272) (MissingVacant!5272 (index!23318 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35032 (_ BitVec 32)) SeekEntryResult!5272)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!555661 (= res!348214 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16826 a!3118) j!142) mask!3119) (select (arr!16826 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16826 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16826 a!3118) i!1132 k0!1914) j!142) (array!35033 (store (arr!16826 a!3118) i!1132 k0!1914) (size!17191 a!3118)) mask!3119)))))

(declare-fun res!348215 () Bool)

(assert (=> start!50798 (=> (not res!348215) (not e!320181))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50798 (= res!348215 (validMask!0 mask!3119))))

(assert (=> start!50798 e!320181))

(assert (=> start!50798 true))

(declare-fun array_inv!12709 (array!35032) Bool)

(assert (=> start!50798 (array_inv!12709 a!3118)))

(declare-fun b!555662 () Bool)

(declare-fun res!348213 () Bool)

(assert (=> b!555662 (=> (not res!348213) (not e!320181))))

(assert (=> b!555662 (= res!348213 (validKeyInArray!0 k0!1914))))

(declare-fun b!555663 () Bool)

(declare-fun res!348221 () Bool)

(assert (=> b!555663 (=> (not res!348221) (not e!320179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35032 (_ BitVec 32)) Bool)

(assert (=> b!555663 (= res!348221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!555664 () Bool)

(declare-fun res!348216 () Bool)

(assert (=> b!555664 (=> (not res!348216) (not e!320181))))

(declare-fun arrayContainsKey!0 (array!35032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!555664 (= res!348216 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!555665 () Bool)

(assert (=> b!555665 (= e!320179 (not true))))

(declare-fun e!320180 () Bool)

(assert (=> b!555665 e!320180))

(declare-fun res!348212 () Bool)

(assert (=> b!555665 (=> (not res!348212) (not e!320180))))

(assert (=> b!555665 (= res!348212 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17304 0))(
  ( (Unit!17305) )
))
(declare-fun lt!252498 () Unit!17304)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35032 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17304)

(assert (=> b!555665 (= lt!252498 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!555666 () Bool)

(assert (=> b!555666 (= e!320181 e!320179)))

(declare-fun res!348219 () Bool)

(assert (=> b!555666 (=> (not res!348219) (not e!320179))))

(declare-fun lt!252499 () SeekEntryResult!5272)

(assert (=> b!555666 (= res!348219 (or (= lt!252499 (MissingZero!5272 i!1132)) (= lt!252499 (MissingVacant!5272 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35032 (_ BitVec 32)) SeekEntryResult!5272)

(assert (=> b!555666 (= lt!252499 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!555667 () Bool)

(assert (=> b!555667 (= e!320180 (= (seekEntryOrOpen!0 (select (arr!16826 a!3118) j!142) a!3118 mask!3119) (Found!5272 j!142)))))

(assert (= (and start!50798 res!348215) b!555660))

(assert (= (and b!555660 res!348217) b!555659))

(assert (= (and b!555659 res!348218) b!555662))

(assert (= (and b!555662 res!348213) b!555664))

(assert (= (and b!555664 res!348216) b!555666))

(assert (= (and b!555666 res!348219) b!555663))

(assert (= (and b!555663 res!348221) b!555658))

(assert (= (and b!555658 res!348220) b!555661))

(assert (= (and b!555661 res!348214) b!555665))

(assert (= (and b!555665 res!348212) b!555667))

(declare-fun m!533039 () Bool)

(assert (=> start!50798 m!533039))

(declare-fun m!533041 () Bool)

(assert (=> start!50798 m!533041))

(declare-fun m!533043 () Bool)

(assert (=> b!555667 m!533043))

(assert (=> b!555667 m!533043))

(declare-fun m!533045 () Bool)

(assert (=> b!555667 m!533045))

(assert (=> b!555659 m!533043))

(assert (=> b!555659 m!533043))

(declare-fun m!533047 () Bool)

(assert (=> b!555659 m!533047))

(declare-fun m!533049 () Bool)

(assert (=> b!555665 m!533049))

(declare-fun m!533051 () Bool)

(assert (=> b!555665 m!533051))

(declare-fun m!533053 () Bool)

(assert (=> b!555662 m!533053))

(assert (=> b!555661 m!533043))

(declare-fun m!533055 () Bool)

(assert (=> b!555661 m!533055))

(assert (=> b!555661 m!533043))

(declare-fun m!533057 () Bool)

(assert (=> b!555661 m!533057))

(declare-fun m!533059 () Bool)

(assert (=> b!555661 m!533059))

(assert (=> b!555661 m!533057))

(declare-fun m!533061 () Bool)

(assert (=> b!555661 m!533061))

(assert (=> b!555661 m!533055))

(assert (=> b!555661 m!533043))

(declare-fun m!533063 () Bool)

(assert (=> b!555661 m!533063))

(declare-fun m!533065 () Bool)

(assert (=> b!555661 m!533065))

(assert (=> b!555661 m!533057))

(assert (=> b!555661 m!533059))

(declare-fun m!533067 () Bool)

(assert (=> b!555664 m!533067))

(declare-fun m!533069 () Bool)

(assert (=> b!555663 m!533069))

(declare-fun m!533071 () Bool)

(assert (=> b!555658 m!533071))

(declare-fun m!533073 () Bool)

(assert (=> b!555666 m!533073))

(check-sat (not b!555667) (not start!50798) (not b!555665) (not b!555664) (not b!555659) (not b!555658) (not b!555661) (not b!555663) (not b!555666) (not b!555662))
(check-sat)
