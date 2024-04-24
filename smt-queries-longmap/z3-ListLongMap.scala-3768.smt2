; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51648 () Bool)

(assert start!51648)

(declare-fun b!564884 () Bool)

(declare-fun res!355937 () Bool)

(declare-fun e!325341 () Bool)

(assert (=> b!564884 (=> (not res!355937) (not e!325341))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-datatypes ((array!35460 0))(
  ( (array!35461 (arr!17029 (Array (_ BitVec 32) (_ BitVec 64))) (size!17393 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35460)

(declare-datatypes ((SeekEntryResult!5434 0))(
  ( (MissingZero!5434 (index!23963 (_ BitVec 32))) (Found!5434 (index!23964 (_ BitVec 32))) (Intermediate!5434 (undefined!6246 Bool) (index!23965 (_ BitVec 32)) (x!52988 (_ BitVec 32))) (Undefined!5434) (MissingVacant!5434 (index!23966 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35460 (_ BitVec 32)) SeekEntryResult!5434)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!564884 (= res!355937 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17029 a!3118) j!142) mask!3119) (select (arr!17029 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17029 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!17029 a!3118) i!1132 k0!1914) j!142) (array!35461 (store (arr!17029 a!3118) i!1132 k0!1914) (size!17393 a!3118)) mask!3119)))))

(declare-fun b!564885 () Bool)

(declare-fun res!355936 () Bool)

(declare-fun e!325340 () Bool)

(assert (=> b!564885 (=> (not res!355936) (not e!325340))))

(assert (=> b!564885 (= res!355936 (and (= (size!17393 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17393 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17393 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!564886 () Bool)

(declare-fun res!355938 () Bool)

(assert (=> b!564886 (=> (not res!355938) (not e!325341))))

(declare-datatypes ((List!11016 0))(
  ( (Nil!11013) (Cons!11012 (h!12018 (_ BitVec 64)) (t!17236 List!11016)) )
))
(declare-fun arrayNoDuplicates!0 (array!35460 (_ BitVec 32) List!11016) Bool)

(assert (=> b!564886 (= res!355938 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11013))))

(declare-fun res!355935 () Bool)

(assert (=> start!51648 (=> (not res!355935) (not e!325340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51648 (= res!355935 (validMask!0 mask!3119))))

(assert (=> start!51648 e!325340))

(assert (=> start!51648 true))

(declare-fun array_inv!12888 (array!35460) Bool)

(assert (=> start!51648 (array_inv!12888 a!3118)))

(declare-fun b!564887 () Bool)

(assert (=> b!564887 (= e!325340 e!325341)))

(declare-fun res!355933 () Bool)

(assert (=> b!564887 (=> (not res!355933) (not e!325341))))

(declare-fun lt!257755 () SeekEntryResult!5434)

(assert (=> b!564887 (= res!355933 (or (= lt!257755 (MissingZero!5434 i!1132)) (= lt!257755 (MissingVacant!5434 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35460 (_ BitVec 32)) SeekEntryResult!5434)

(assert (=> b!564887 (= lt!257755 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!564888 () Bool)

(declare-fun res!355931 () Bool)

(assert (=> b!564888 (=> (not res!355931) (not e!325341))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35460 (_ BitVec 32)) Bool)

(assert (=> b!564888 (= res!355931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!564889 () Bool)

(assert (=> b!564889 (= e!325341 (bvsgt #b00000000000000000000000000000000 (size!17393 a!3118)))))

(declare-fun b!564890 () Bool)

(declare-fun res!355932 () Bool)

(assert (=> b!564890 (=> (not res!355932) (not e!325340))))

(declare-fun arrayContainsKey!0 (array!35460 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!564890 (= res!355932 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!564891 () Bool)

(declare-fun res!355934 () Bool)

(assert (=> b!564891 (=> (not res!355934) (not e!325340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!564891 (= res!355934 (validKeyInArray!0 (select (arr!17029 a!3118) j!142)))))

(declare-fun b!564892 () Bool)

(declare-fun res!355939 () Bool)

(assert (=> b!564892 (=> (not res!355939) (not e!325340))))

(assert (=> b!564892 (= res!355939 (validKeyInArray!0 k0!1914))))

(assert (= (and start!51648 res!355935) b!564885))

(assert (= (and b!564885 res!355936) b!564891))

(assert (= (and b!564891 res!355934) b!564892))

(assert (= (and b!564892 res!355939) b!564890))

(assert (= (and b!564890 res!355932) b!564887))

(assert (= (and b!564887 res!355933) b!564888))

(assert (= (and b!564888 res!355931) b!564886))

(assert (= (and b!564886 res!355938) b!564884))

(assert (= (and b!564884 res!355937) b!564889))

(declare-fun m!543479 () Bool)

(assert (=> start!51648 m!543479))

(declare-fun m!543481 () Bool)

(assert (=> start!51648 m!543481))

(declare-fun m!543483 () Bool)

(assert (=> b!564887 m!543483))

(declare-fun m!543485 () Bool)

(assert (=> b!564886 m!543485))

(declare-fun m!543487 () Bool)

(assert (=> b!564891 m!543487))

(assert (=> b!564891 m!543487))

(declare-fun m!543489 () Bool)

(assert (=> b!564891 m!543489))

(declare-fun m!543491 () Bool)

(assert (=> b!564888 m!543491))

(declare-fun m!543493 () Bool)

(assert (=> b!564892 m!543493))

(declare-fun m!543495 () Bool)

(assert (=> b!564890 m!543495))

(assert (=> b!564884 m!543487))

(declare-fun m!543497 () Bool)

(assert (=> b!564884 m!543497))

(assert (=> b!564884 m!543487))

(declare-fun m!543499 () Bool)

(assert (=> b!564884 m!543499))

(declare-fun m!543501 () Bool)

(assert (=> b!564884 m!543501))

(assert (=> b!564884 m!543499))

(declare-fun m!543503 () Bool)

(assert (=> b!564884 m!543503))

(assert (=> b!564884 m!543497))

(assert (=> b!564884 m!543487))

(declare-fun m!543505 () Bool)

(assert (=> b!564884 m!543505))

(declare-fun m!543507 () Bool)

(assert (=> b!564884 m!543507))

(assert (=> b!564884 m!543499))

(assert (=> b!564884 m!543501))

(check-sat (not b!564887) (not b!564884) (not b!564886) (not b!564890) (not b!564888) (not b!564892) (not b!564891) (not start!51648))
(check-sat)
