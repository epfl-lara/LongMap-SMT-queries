; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49390 () Bool)

(assert start!49390)

(declare-fun res!338338 () Bool)

(declare-fun e!314514 () Bool)

(assert (=> start!49390 (=> (not res!338338) (not e!314514))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49390 (= res!338338 (validMask!0 mask!3216))))

(assert (=> start!49390 e!314514))

(assert (=> start!49390 true))

(declare-datatypes ((array!34346 0))(
  ( (array!34347 (arr!16504 (Array (_ BitVec 32) (_ BitVec 64))) (size!16868 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34346)

(declare-fun array_inv!12363 (array!34346) Bool)

(assert (=> start!49390 (array_inv!12363 a!3154)))

(declare-fun b!543890 () Bool)

(declare-fun res!338346 () Bool)

(declare-fun e!314513 () Bool)

(assert (=> b!543890 (=> (not res!338346) (not e!314513))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!543890 (= res!338346 (and (not (= (select (arr!16504 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16504 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16504 a!3154) index!1177) (select (arr!16504 a!3154) j!147)))))))

(declare-fun b!543891 () Bool)

(declare-fun res!338337 () Bool)

(declare-fun e!314511 () Bool)

(assert (=> b!543891 (=> (not res!338337) (not e!314511))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34346 (_ BitVec 32)) Bool)

(assert (=> b!543891 (= res!338337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!543892 () Bool)

(assert (=> b!543892 (= e!314513 false)))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun lt!248344 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543892 (= lt!248344 (nextIndex!0 index!1177 (bvadd #b00000000000000000000000000000001 x!1030) mask!3216))))

(declare-fun b!543893 () Bool)

(declare-fun res!338344 () Bool)

(assert (=> b!543893 (=> (not res!338344) (not e!314511))))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!543893 (= res!338344 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16868 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16868 a!3154)) (= (select (arr!16504 a!3154) resIndex!32) (select (arr!16504 a!3154) j!147))))))

(declare-fun b!543894 () Bool)

(declare-fun res!338341 () Bool)

(assert (=> b!543894 (=> (not res!338341) (not e!314513))))

(declare-datatypes ((SeekEntryResult!4918 0))(
  ( (MissingZero!4918 (index!21896 (_ BitVec 32))) (Found!4918 (index!21897 (_ BitVec 32))) (Intermediate!4918 (undefined!5730 Bool) (index!21898 (_ BitVec 32)) (x!50952 (_ BitVec 32))) (Undefined!4918) (MissingVacant!4918 (index!21899 (_ BitVec 32))) )
))
(declare-fun lt!248342 () SeekEntryResult!4918)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34346 (_ BitVec 32)) SeekEntryResult!4918)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!543894 (= res!338341 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16504 a!3154) j!147) mask!3216) (select (arr!16504 a!3154) j!147) a!3154 mask!3216) lt!248342))))

(declare-fun b!543895 () Bool)

(declare-fun res!338339 () Bool)

(assert (=> b!543895 (=> (not res!338339) (not e!314514))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!543895 (= res!338339 (validKeyInArray!0 k0!1998))))

(declare-fun b!543896 () Bool)

(assert (=> b!543896 (= e!314511 e!314513)))

(declare-fun res!338336 () Bool)

(assert (=> b!543896 (=> (not res!338336) (not e!314513))))

(assert (=> b!543896 (= res!338336 (= lt!248342 (Intermediate!4918 false resIndex!32 resX!32)))))

(assert (=> b!543896 (= lt!248342 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16504 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!543897 () Bool)

(assert (=> b!543897 (= e!314514 e!314511)))

(declare-fun res!338347 () Bool)

(assert (=> b!543897 (=> (not res!338347) (not e!314511))))

(declare-fun lt!248343 () SeekEntryResult!4918)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!543897 (= res!338347 (or (= lt!248343 (MissingZero!4918 i!1153)) (= lt!248343 (MissingVacant!4918 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34346 (_ BitVec 32)) SeekEntryResult!4918)

(assert (=> b!543897 (= lt!248343 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!543898 () Bool)

(declare-fun res!338345 () Bool)

(assert (=> b!543898 (=> (not res!338345) (not e!314514))))

(declare-fun arrayContainsKey!0 (array!34346 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!543898 (= res!338345 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!543899 () Bool)

(declare-fun res!338340 () Bool)

(assert (=> b!543899 (=> (not res!338340) (not e!314514))))

(assert (=> b!543899 (= res!338340 (and (= (size!16868 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16868 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16868 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!543900 () Bool)

(declare-fun res!338342 () Bool)

(assert (=> b!543900 (=> (not res!338342) (not e!314511))))

(declare-datatypes ((List!10530 0))(
  ( (Nil!10527) (Cons!10526 (h!11484 (_ BitVec 64)) (t!16750 List!10530)) )
))
(declare-fun arrayNoDuplicates!0 (array!34346 (_ BitVec 32) List!10530) Bool)

(assert (=> b!543900 (= res!338342 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10527))))

(declare-fun b!543901 () Bool)

(declare-fun res!338343 () Bool)

(assert (=> b!543901 (=> (not res!338343) (not e!314514))))

(assert (=> b!543901 (= res!338343 (validKeyInArray!0 (select (arr!16504 a!3154) j!147)))))

(assert (= (and start!49390 res!338338) b!543899))

(assert (= (and b!543899 res!338340) b!543901))

(assert (= (and b!543901 res!338343) b!543895))

(assert (= (and b!543895 res!338339) b!543898))

(assert (= (and b!543898 res!338345) b!543897))

(assert (= (and b!543897 res!338347) b!543891))

(assert (= (and b!543891 res!338337) b!543900))

(assert (= (and b!543900 res!338342) b!543893))

(assert (= (and b!543893 res!338344) b!543896))

(assert (= (and b!543896 res!338336) b!543894))

(assert (= (and b!543894 res!338341) b!543890))

(assert (= (and b!543890 res!338346) b!543892))

(declare-fun m!522061 () Bool)

(assert (=> b!543892 m!522061))

(declare-fun m!522063 () Bool)

(assert (=> b!543898 m!522063))

(declare-fun m!522065 () Bool)

(assert (=> b!543890 m!522065))

(declare-fun m!522067 () Bool)

(assert (=> b!543890 m!522067))

(declare-fun m!522069 () Bool)

(assert (=> b!543897 m!522069))

(declare-fun m!522071 () Bool)

(assert (=> b!543895 m!522071))

(assert (=> b!543896 m!522067))

(assert (=> b!543896 m!522067))

(declare-fun m!522073 () Bool)

(assert (=> b!543896 m!522073))

(assert (=> b!543894 m!522067))

(assert (=> b!543894 m!522067))

(declare-fun m!522075 () Bool)

(assert (=> b!543894 m!522075))

(assert (=> b!543894 m!522075))

(assert (=> b!543894 m!522067))

(declare-fun m!522077 () Bool)

(assert (=> b!543894 m!522077))

(declare-fun m!522079 () Bool)

(assert (=> start!49390 m!522079))

(declare-fun m!522081 () Bool)

(assert (=> start!49390 m!522081))

(declare-fun m!522083 () Bool)

(assert (=> b!543900 m!522083))

(assert (=> b!543901 m!522067))

(assert (=> b!543901 m!522067))

(declare-fun m!522085 () Bool)

(assert (=> b!543901 m!522085))

(declare-fun m!522087 () Bool)

(assert (=> b!543893 m!522087))

(assert (=> b!543893 m!522067))

(declare-fun m!522089 () Bool)

(assert (=> b!543891 m!522089))

(check-sat (not b!543895) (not b!543896) (not b!543892) (not start!49390) (not b!543901) (not b!543898) (not b!543891) (not b!543900) (not b!543897) (not b!543894))
(check-sat)
