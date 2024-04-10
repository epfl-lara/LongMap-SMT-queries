; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50614 () Bool)

(assert start!50614)

(declare-fun b!553124 () Bool)

(declare-fun res!345538 () Bool)

(declare-fun e!319107 () Bool)

(assert (=> b!553124 (=> (not res!345538) (not e!319107))))

(declare-datatypes ((array!34839 0))(
  ( (array!34840 (arr!16729 (Array (_ BitVec 32) (_ BitVec 64))) (size!17093 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34839)

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!553124 (= res!345538 (validKeyInArray!0 (select (arr!16729 a!3118) j!142)))))

(declare-fun b!553125 () Bool)

(declare-fun res!345540 () Bool)

(assert (=> b!553125 (=> (not res!345540) (not e!319107))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!553125 (= res!345540 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!553126 () Bool)

(declare-fun res!345544 () Bool)

(declare-fun e!319104 () Bool)

(assert (=> b!553126 (=> (not res!345544) (not e!319104))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34839 (_ BitVec 32)) Bool)

(assert (=> b!553126 (= res!345544 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!553127 () Bool)

(declare-fun res!345541 () Bool)

(assert (=> b!553127 (=> (not res!345541) (not e!319104))))

(declare-datatypes ((List!10809 0))(
  ( (Nil!10806) (Cons!10805 (h!11790 (_ BitVec 64)) (t!17037 List!10809)) )
))
(declare-fun arrayNoDuplicates!0 (array!34839 (_ BitVec 32) List!10809) Bool)

(assert (=> b!553127 (= res!345541 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10806))))

(declare-fun b!553128 () Bool)

(assert (=> b!553128 (= e!319107 e!319104)))

(declare-fun res!345543 () Bool)

(assert (=> b!553128 (=> (not res!345543) (not e!319104))))

(declare-datatypes ((SeekEntryResult!5178 0))(
  ( (MissingZero!5178 (index!22939 (_ BitVec 32))) (Found!5178 (index!22940 (_ BitVec 32))) (Intermediate!5178 (undefined!5990 Bool) (index!22941 (_ BitVec 32)) (x!51868 (_ BitVec 32))) (Undefined!5178) (MissingVacant!5178 (index!22942 (_ BitVec 32))) )
))
(declare-fun lt!251370 () SeekEntryResult!5178)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!553128 (= res!345543 (or (= lt!251370 (MissingZero!5178 i!1132)) (= lt!251370 (MissingVacant!5178 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34839 (_ BitVec 32)) SeekEntryResult!5178)

(assert (=> b!553128 (= lt!251370 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!553129 () Bool)

(declare-fun res!345542 () Bool)

(assert (=> b!553129 (=> (not res!345542) (not e!319107))))

(assert (=> b!553129 (= res!345542 (validKeyInArray!0 k0!1914))))

(declare-fun e!319106 () Bool)

(declare-fun b!553130 () Bool)

(assert (=> b!553130 (= e!319106 (= (seekEntryOrOpen!0 (select (arr!16729 a!3118) j!142) a!3118 mask!3119) (Found!5178 j!142)))))

(declare-fun b!553131 () Bool)

(declare-fun res!345539 () Bool)

(assert (=> b!553131 (=> (not res!345539) (not e!319107))))

(assert (=> b!553131 (= res!345539 (and (= (size!17093 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17093 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17093 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!553132 () Bool)

(assert (=> b!553132 (= e!319104 (not true))))

(assert (=> b!553132 e!319106))

(declare-fun res!345545 () Bool)

(assert (=> b!553132 (=> (not res!345545) (not e!319106))))

(assert (=> b!553132 (= res!345545 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17130 0))(
  ( (Unit!17131) )
))
(declare-fun lt!251371 () Unit!17130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34839 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17130)

(assert (=> b!553132 (= lt!251371 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun res!345536 () Bool)

(assert (=> start!50614 (=> (not res!345536) (not e!319107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50614 (= res!345536 (validMask!0 mask!3119))))

(assert (=> start!50614 e!319107))

(assert (=> start!50614 true))

(declare-fun array_inv!12525 (array!34839) Bool)

(assert (=> start!50614 (array_inv!12525 a!3118)))

(declare-fun b!553133 () Bool)

(declare-fun res!345537 () Bool)

(assert (=> b!553133 (=> (not res!345537) (not e!319104))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34839 (_ BitVec 32)) SeekEntryResult!5178)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!553133 (= res!345537 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16729 a!3118) j!142) mask!3119) (select (arr!16729 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!16729 a!3118) i!1132 k0!1914) j!142) mask!3119) (select (store (arr!16729 a!3118) i!1132 k0!1914) j!142) (array!34840 (store (arr!16729 a!3118) i!1132 k0!1914) (size!17093 a!3118)) mask!3119)))))

(assert (= (and start!50614 res!345536) b!553131))

(assert (= (and b!553131 res!345539) b!553124))

(assert (= (and b!553124 res!345538) b!553129))

(assert (= (and b!553129 res!345542) b!553125))

(assert (= (and b!553125 res!345540) b!553128))

(assert (= (and b!553128 res!345543) b!553126))

(assert (= (and b!553126 res!345544) b!553127))

(assert (= (and b!553127 res!345541) b!553133))

(assert (= (and b!553133 res!345537) b!553132))

(assert (= (and b!553132 res!345545) b!553130))

(declare-fun m!530145 () Bool)

(assert (=> b!553132 m!530145))

(declare-fun m!530147 () Bool)

(assert (=> b!553132 m!530147))

(declare-fun m!530149 () Bool)

(assert (=> b!553125 m!530149))

(declare-fun m!530151 () Bool)

(assert (=> b!553128 m!530151))

(declare-fun m!530153 () Bool)

(assert (=> b!553124 m!530153))

(assert (=> b!553124 m!530153))

(declare-fun m!530155 () Bool)

(assert (=> b!553124 m!530155))

(declare-fun m!530157 () Bool)

(assert (=> b!553127 m!530157))

(declare-fun m!530159 () Bool)

(assert (=> b!553129 m!530159))

(declare-fun m!530161 () Bool)

(assert (=> start!50614 m!530161))

(declare-fun m!530163 () Bool)

(assert (=> start!50614 m!530163))

(assert (=> b!553133 m!530153))

(declare-fun m!530165 () Bool)

(assert (=> b!553133 m!530165))

(assert (=> b!553133 m!530153))

(declare-fun m!530167 () Bool)

(assert (=> b!553133 m!530167))

(declare-fun m!530169 () Bool)

(assert (=> b!553133 m!530169))

(assert (=> b!553133 m!530167))

(declare-fun m!530171 () Bool)

(assert (=> b!553133 m!530171))

(assert (=> b!553133 m!530165))

(assert (=> b!553133 m!530153))

(declare-fun m!530173 () Bool)

(assert (=> b!553133 m!530173))

(declare-fun m!530175 () Bool)

(assert (=> b!553133 m!530175))

(assert (=> b!553133 m!530167))

(assert (=> b!553133 m!530169))

(declare-fun m!530177 () Bool)

(assert (=> b!553126 m!530177))

(assert (=> b!553130 m!530153))

(assert (=> b!553130 m!530153))

(declare-fun m!530179 () Bool)

(assert (=> b!553130 m!530179))

(check-sat (not b!553130) (not b!553127) (not b!553133) (not b!553126) (not b!553124) (not b!553128) (not b!553129) (not b!553125) (not start!50614) (not b!553132))
(check-sat)
