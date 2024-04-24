; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48610 () Bool)

(assert start!48610)

(declare-fun b!533906 () Bool)

(declare-fun e!310533 () Bool)

(declare-fun e!310531 () Bool)

(assert (=> b!533906 (= e!310533 e!310531)))

(declare-fun res!329172 () Bool)

(assert (=> b!533906 (=> (not res!329172) (not e!310531))))

(declare-datatypes ((SeekEntryResult!4663 0))(
  ( (MissingZero!4663 (index!20876 (_ BitVec 32))) (Found!4663 (index!20877 (_ BitVec 32))) (Intermediate!4663 (undefined!5475 Bool) (index!20878 (_ BitVec 32)) (x!49987 (_ BitVec 32))) (Undefined!4663) (MissingVacant!4663 (index!20879 (_ BitVec 32))) )
))
(declare-fun lt!245550 () SeekEntryResult!4663)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!533906 (= res!329172 (or (= lt!245550 (MissingZero!4663 i!1153)) (= lt!245550 (MissingVacant!4663 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-datatypes ((array!33821 0))(
  ( (array!33822 (arr!16249 (Array (_ BitVec 32) (_ BitVec 64))) (size!16613 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33821)

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33821 (_ BitVec 32)) SeekEntryResult!4663)

(assert (=> b!533906 (= lt!245550 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!533907 () Bool)

(declare-fun res!329164 () Bool)

(assert (=> b!533907 (=> (not res!329164) (not e!310531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33821 (_ BitVec 32)) Bool)

(assert (=> b!533907 (= res!329164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!533908 () Bool)

(declare-fun res!329165 () Bool)

(assert (=> b!533908 (=> (not res!329165) (not e!310533))))

(declare-fun arrayContainsKey!0 (array!33821 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!533908 (= res!329165 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!533909 () Bool)

(declare-fun res!329167 () Bool)

(assert (=> b!533909 (=> (not res!329167) (not e!310533))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!533909 (= res!329167 (validKeyInArray!0 k0!1998))))

(declare-fun b!533910 () Bool)

(declare-fun res!329171 () Bool)

(assert (=> b!533910 (=> (not res!329171) (not e!310531))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33821 (_ BitVec 32)) SeekEntryResult!4663)

(assert (=> b!533910 (= res!329171 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16249 a!3154) j!147) a!3154 mask!3216) (Intermediate!4663 false resIndex!32 resX!32)))))

(declare-fun b!533911 () Bool)

(assert (=> b!533911 (= e!310531 false)))

(declare-fun lt!245551 () SeekEntryResult!4663)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!533911 (= lt!245551 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16249 a!3154) j!147) mask!3216) (select (arr!16249 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!533912 () Bool)

(declare-fun res!329168 () Bool)

(assert (=> b!533912 (=> (not res!329168) (not e!310531))))

(declare-datatypes ((List!10275 0))(
  ( (Nil!10272) (Cons!10271 (h!11214 (_ BitVec 64)) (t!16495 List!10275)) )
))
(declare-fun arrayNoDuplicates!0 (array!33821 (_ BitVec 32) List!10275) Bool)

(assert (=> b!533912 (= res!329168 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10272))))

(declare-fun b!533913 () Bool)

(declare-fun res!329169 () Bool)

(assert (=> b!533913 (=> (not res!329169) (not e!310533))))

(assert (=> b!533913 (= res!329169 (validKeyInArray!0 (select (arr!16249 a!3154) j!147)))))

(declare-fun b!533914 () Bool)

(declare-fun res!329170 () Bool)

(assert (=> b!533914 (=> (not res!329170) (not e!310531))))

(assert (=> b!533914 (= res!329170 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16613 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16613 a!3154)) (= (select (arr!16249 a!3154) resIndex!32) (select (arr!16249 a!3154) j!147))))))

(declare-fun res!329173 () Bool)

(assert (=> start!48610 (=> (not res!329173) (not e!310533))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48610 (= res!329173 (validMask!0 mask!3216))))

(assert (=> start!48610 e!310533))

(assert (=> start!48610 true))

(declare-fun array_inv!12108 (array!33821) Bool)

(assert (=> start!48610 (array_inv!12108 a!3154)))

(declare-fun b!533905 () Bool)

(declare-fun res!329166 () Bool)

(assert (=> b!533905 (=> (not res!329166) (not e!310533))))

(assert (=> b!533905 (= res!329166 (and (= (size!16613 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16613 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16613 a!3154)) (not (= i!1153 j!147))))))

(assert (= (and start!48610 res!329173) b!533905))

(assert (= (and b!533905 res!329166) b!533913))

(assert (= (and b!533913 res!329169) b!533909))

(assert (= (and b!533909 res!329167) b!533908))

(assert (= (and b!533908 res!329165) b!533906))

(assert (= (and b!533906 res!329172) b!533907))

(assert (= (and b!533907 res!329164) b!533912))

(assert (= (and b!533912 res!329168) b!533914))

(assert (= (and b!533914 res!329170) b!533910))

(assert (= (and b!533910 res!329171) b!533911))

(declare-fun m!513931 () Bool)

(assert (=> b!533912 m!513931))

(declare-fun m!513933 () Bool)

(assert (=> b!533908 m!513933))

(declare-fun m!513935 () Bool)

(assert (=> b!533911 m!513935))

(assert (=> b!533911 m!513935))

(declare-fun m!513937 () Bool)

(assert (=> b!533911 m!513937))

(assert (=> b!533911 m!513937))

(assert (=> b!533911 m!513935))

(declare-fun m!513939 () Bool)

(assert (=> b!533911 m!513939))

(declare-fun m!513941 () Bool)

(assert (=> b!533914 m!513941))

(assert (=> b!533914 m!513935))

(declare-fun m!513943 () Bool)

(assert (=> start!48610 m!513943))

(declare-fun m!513945 () Bool)

(assert (=> start!48610 m!513945))

(declare-fun m!513947 () Bool)

(assert (=> b!533906 m!513947))

(assert (=> b!533913 m!513935))

(assert (=> b!533913 m!513935))

(declare-fun m!513949 () Bool)

(assert (=> b!533913 m!513949))

(declare-fun m!513951 () Bool)

(assert (=> b!533909 m!513951))

(declare-fun m!513953 () Bool)

(assert (=> b!533907 m!513953))

(assert (=> b!533910 m!513935))

(assert (=> b!533910 m!513935))

(declare-fun m!513955 () Bool)

(assert (=> b!533910 m!513955))

(check-sat (not b!533913) (not b!533908) (not b!533909) (not start!48610) (not b!533912) (not b!533907) (not b!533911) (not b!533906) (not b!533910))
(check-sat)
