; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44586 () Bool)

(assert start!44586)

(declare-fun b!488885 () Bool)

(declare-fun e!287557 () Bool)

(assert (=> b!488885 (= e!287557 (not true))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((array!31655 0))(
  ( (array!31656 (arr!15215 (Array (_ BitVec 32) (_ BitVec 64))) (size!15580 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31655)

(declare-fun lt!220458 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!488885 (= lt!220458 (toIndex!0 (select (store (arr!15215 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(declare-fun e!287556 () Bool)

(assert (=> b!488885 e!287556))

(declare-fun res!291971 () Bool)

(assert (=> b!488885 (=> (not res!291971) (not e!287556))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31655 (_ BitVec 32)) Bool)

(assert (=> b!488885 (= res!291971 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14290 0))(
  ( (Unit!14291) )
))
(declare-fun lt!220457 () Unit!14290)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31655 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14290)

(assert (=> b!488885 (= lt!220457 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!488886 () Bool)

(declare-fun res!291966 () Bool)

(assert (=> b!488886 (=> (not res!291966) (not e!287557))))

(declare-datatypes ((List!9412 0))(
  ( (Nil!9409) (Cons!9408 (h!10270 (_ BitVec 64)) (t!15631 List!9412)) )
))
(declare-fun arrayNoDuplicates!0 (array!31655 (_ BitVec 32) List!9412) Bool)

(assert (=> b!488886 (= res!291966 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9409))))

(declare-fun res!291967 () Bool)

(declare-fun e!287559 () Bool)

(assert (=> start!44586 (=> (not res!291967) (not e!287559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44586 (= res!291967 (validMask!0 mask!3524))))

(assert (=> start!44586 e!287559))

(assert (=> start!44586 true))

(declare-fun array_inv!11098 (array!31655) Bool)

(assert (=> start!44586 (array_inv!11098 a!3235)))

(declare-fun b!488887 () Bool)

(declare-fun res!291970 () Bool)

(assert (=> b!488887 (=> (not res!291970) (not e!287557))))

(assert (=> b!488887 (= res!291970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!488888 () Bool)

(declare-fun res!291963 () Bool)

(assert (=> b!488888 (=> (not res!291963) (not e!287559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!488888 (= res!291963 (validKeyInArray!0 k0!2280))))

(declare-fun b!488889 () Bool)

(assert (=> b!488889 (= e!287559 e!287557)))

(declare-fun res!291965 () Bool)

(assert (=> b!488889 (=> (not res!291965) (not e!287557))))

(declare-datatypes ((SeekEntryResult!3679 0))(
  ( (MissingZero!3679 (index!16895 (_ BitVec 32))) (Found!3679 (index!16896 (_ BitVec 32))) (Intermediate!3679 (undefined!4491 Bool) (index!16897 (_ BitVec 32)) (x!46020 (_ BitVec 32))) (Undefined!3679) (MissingVacant!3679 (index!16898 (_ BitVec 32))) )
))
(declare-fun lt!220459 () SeekEntryResult!3679)

(assert (=> b!488889 (= res!291965 (or (= lt!220459 (MissingZero!3679 i!1204)) (= lt!220459 (MissingVacant!3679 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31655 (_ BitVec 32)) SeekEntryResult!3679)

(assert (=> b!488889 (= lt!220459 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!488890 () Bool)

(declare-fun res!291968 () Bool)

(assert (=> b!488890 (=> (not res!291968) (not e!287559))))

(assert (=> b!488890 (= res!291968 (and (= (size!15580 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15580 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15580 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!488891 () Bool)

(assert (=> b!488891 (= e!287556 (= (seekEntryOrOpen!0 (select (arr!15215 a!3235) j!176) a!3235 mask!3524) (Found!3679 j!176)))))

(declare-fun b!488892 () Bool)

(declare-fun res!291969 () Bool)

(assert (=> b!488892 (=> (not res!291969) (not e!287559))))

(assert (=> b!488892 (= res!291969 (validKeyInArray!0 (select (arr!15215 a!3235) j!176)))))

(declare-fun b!488893 () Bool)

(declare-fun res!291964 () Bool)

(assert (=> b!488893 (=> (not res!291964) (not e!287559))))

(declare-fun arrayContainsKey!0 (array!31655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!488893 (= res!291964 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!44586 res!291967) b!488890))

(assert (= (and b!488890 res!291968) b!488892))

(assert (= (and b!488892 res!291969) b!488888))

(assert (= (and b!488888 res!291963) b!488893))

(assert (= (and b!488893 res!291964) b!488889))

(assert (= (and b!488889 res!291965) b!488887))

(assert (= (and b!488887 res!291970) b!488886))

(assert (= (and b!488886 res!291966) b!488885))

(assert (= (and b!488885 res!291971) b!488891))

(declare-fun m!468127 () Bool)

(assert (=> b!488892 m!468127))

(assert (=> b!488892 m!468127))

(declare-fun m!468129 () Bool)

(assert (=> b!488892 m!468129))

(declare-fun m!468131 () Bool)

(assert (=> start!44586 m!468131))

(declare-fun m!468133 () Bool)

(assert (=> start!44586 m!468133))

(declare-fun m!468135 () Bool)

(assert (=> b!488886 m!468135))

(declare-fun m!468137 () Bool)

(assert (=> b!488893 m!468137))

(assert (=> b!488891 m!468127))

(assert (=> b!488891 m!468127))

(declare-fun m!468139 () Bool)

(assert (=> b!488891 m!468139))

(declare-fun m!468141 () Bool)

(assert (=> b!488889 m!468141))

(declare-fun m!468143 () Bool)

(assert (=> b!488888 m!468143))

(declare-fun m!468145 () Bool)

(assert (=> b!488887 m!468145))

(declare-fun m!468147 () Bool)

(assert (=> b!488885 m!468147))

(declare-fun m!468149 () Bool)

(assert (=> b!488885 m!468149))

(declare-fun m!468151 () Bool)

(assert (=> b!488885 m!468151))

(declare-fun m!468153 () Bool)

(assert (=> b!488885 m!468153))

(assert (=> b!488885 m!468151))

(declare-fun m!468155 () Bool)

(assert (=> b!488885 m!468155))

(check-sat (not b!488892) (not b!488891) (not start!44586) (not b!488887) (not b!488886) (not b!488888) (not b!488885) (not b!488893) (not b!488889))
(check-sat)
