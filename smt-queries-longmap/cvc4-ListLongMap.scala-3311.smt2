; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45814 () Bool)

(assert start!45814)

(declare-fun res!308175 () Bool)

(declare-fun e!296840 () Bool)

(assert (=> start!45814 (=> (not res!308175) (not e!296840))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45814 (= res!308175 (validMask!0 mask!3524))))

(assert (=> start!45814 e!296840))

(assert (=> start!45814 true))

(declare-datatypes ((array!32570 0))(
  ( (array!32571 (arr!15665 (Array (_ BitVec 32) (_ BitVec 64))) (size!16029 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32570)

(declare-fun array_inv!11461 (array!32570) Bool)

(assert (=> start!45814 (array_inv!11461 a!3235)))

(declare-fun b!507214 () Bool)

(declare-fun e!296841 () Bool)

(assert (=> b!507214 (= e!296840 e!296841)))

(declare-fun res!308176 () Bool)

(assert (=> b!507214 (=> (not res!308176) (not e!296841))))

(declare-datatypes ((SeekEntryResult!4132 0))(
  ( (MissingZero!4132 (index!18716 (_ BitVec 32))) (Found!4132 (index!18717 (_ BitVec 32))) (Intermediate!4132 (undefined!4944 Bool) (index!18718 (_ BitVec 32)) (x!47709 (_ BitVec 32))) (Undefined!4132) (MissingVacant!4132 (index!18719 (_ BitVec 32))) )
))
(declare-fun lt!231542 () SeekEntryResult!4132)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!507214 (= res!308176 (or (= lt!231542 (MissingZero!4132 i!1204)) (= lt!231542 (MissingVacant!4132 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32570 (_ BitVec 32)) SeekEntryResult!4132)

(assert (=> b!507214 (= lt!231542 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!507215 () Bool)

(declare-fun res!308183 () Bool)

(assert (=> b!507215 (=> (not res!308183) (not e!296840))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!507215 (= res!308183 (and (= (size!16029 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16029 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16029 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!507216 () Bool)

(declare-fun e!296843 () Bool)

(declare-fun e!296842 () Bool)

(assert (=> b!507216 (= e!296843 e!296842)))

(declare-fun res!308180 () Bool)

(assert (=> b!507216 (=> res!308180 e!296842)))

(declare-fun lt!231544 () Bool)

(declare-fun lt!231546 () SeekEntryResult!4132)

(assert (=> b!507216 (= res!308180 (or (and (not lt!231544) (undefined!4944 lt!231546)) (and (not lt!231544) (not (undefined!4944 lt!231546)))))))

(assert (=> b!507216 (= lt!231544 (not (is-Intermediate!4132 lt!231546)))))

(declare-fun b!507217 () Bool)

(declare-fun res!308178 () Bool)

(assert (=> b!507217 (=> (not res!308178) (not e!296841))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32570 (_ BitVec 32)) Bool)

(assert (=> b!507217 (= res!308178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!507218 () Bool)

(assert (=> b!507218 (= e!296842 true)))

(declare-fun lt!231540 () array!32570)

(declare-fun lt!231547 () SeekEntryResult!4132)

(declare-fun lt!231543 () (_ BitVec 64))

(assert (=> b!507218 (= lt!231547 (seekEntryOrOpen!0 lt!231543 lt!231540 mask!3524))))

(assert (=> b!507218 false))

(declare-fun b!507219 () Bool)

(declare-fun res!308173 () Bool)

(assert (=> b!507219 (=> (not res!308173) (not e!296840))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!507219 (= res!308173 (validKeyInArray!0 (select (arr!15665 a!3235) j!176)))))

(declare-fun b!507220 () Bool)

(declare-fun res!308177 () Bool)

(assert (=> b!507220 (=> (not res!308177) (not e!296841))))

(declare-datatypes ((List!9823 0))(
  ( (Nil!9820) (Cons!9819 (h!10696 (_ BitVec 64)) (t!16051 List!9823)) )
))
(declare-fun arrayNoDuplicates!0 (array!32570 (_ BitVec 32) List!9823) Bool)

(assert (=> b!507220 (= res!308177 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9820))))

(declare-fun b!507221 () Bool)

(declare-fun res!308179 () Bool)

(assert (=> b!507221 (=> (not res!308179) (not e!296840))))

(assert (=> b!507221 (= res!308179 (validKeyInArray!0 k!2280))))

(declare-fun b!507222 () Bool)

(assert (=> b!507222 (= e!296841 (not e!296843))))

(declare-fun res!308182 () Bool)

(assert (=> b!507222 (=> res!308182 e!296843)))

(declare-fun lt!231541 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32570 (_ BitVec 32)) SeekEntryResult!4132)

(assert (=> b!507222 (= res!308182 (= lt!231546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231541 lt!231543 lt!231540 mask!3524)))))

(declare-fun lt!231539 () (_ BitVec 32))

(assert (=> b!507222 (= lt!231546 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231539 (select (arr!15665 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!507222 (= lt!231541 (toIndex!0 lt!231543 mask!3524))))

(assert (=> b!507222 (= lt!231543 (select (store (arr!15665 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!507222 (= lt!231539 (toIndex!0 (select (arr!15665 a!3235) j!176) mask!3524))))

(assert (=> b!507222 (= lt!231540 (array!32571 (store (arr!15665 a!3235) i!1204 k!2280) (size!16029 a!3235)))))

(declare-fun e!296844 () Bool)

(assert (=> b!507222 e!296844))

(declare-fun res!308174 () Bool)

(assert (=> b!507222 (=> (not res!308174) (not e!296844))))

(assert (=> b!507222 (= res!308174 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15552 0))(
  ( (Unit!15553) )
))
(declare-fun lt!231545 () Unit!15552)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32570 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15552)

(assert (=> b!507222 (= lt!231545 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!507223 () Bool)

(assert (=> b!507223 (= e!296844 (= (seekEntryOrOpen!0 (select (arr!15665 a!3235) j!176) a!3235 mask!3524) (Found!4132 j!176)))))

(declare-fun b!507224 () Bool)

(declare-fun res!308181 () Bool)

(assert (=> b!507224 (=> (not res!308181) (not e!296840))))

(declare-fun arrayContainsKey!0 (array!32570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!507224 (= res!308181 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(assert (= (and start!45814 res!308175) b!507215))

(assert (= (and b!507215 res!308183) b!507219))

(assert (= (and b!507219 res!308173) b!507221))

(assert (= (and b!507221 res!308179) b!507224))

(assert (= (and b!507224 res!308181) b!507214))

(assert (= (and b!507214 res!308176) b!507217))

(assert (= (and b!507217 res!308178) b!507220))

(assert (= (and b!507220 res!308177) b!507222))

(assert (= (and b!507222 res!308174) b!507223))

(assert (= (and b!507222 (not res!308182)) b!507216))

(assert (= (and b!507216 (not res!308180)) b!507218))

(declare-fun m!487951 () Bool)

(assert (=> b!507223 m!487951))

(assert (=> b!507223 m!487951))

(declare-fun m!487953 () Bool)

(assert (=> b!507223 m!487953))

(declare-fun m!487955 () Bool)

(assert (=> b!507217 m!487955))

(declare-fun m!487957 () Bool)

(assert (=> start!45814 m!487957))

(declare-fun m!487959 () Bool)

(assert (=> start!45814 m!487959))

(declare-fun m!487961 () Bool)

(assert (=> b!507220 m!487961))

(declare-fun m!487963 () Bool)

(assert (=> b!507218 m!487963))

(declare-fun m!487965 () Bool)

(assert (=> b!507224 m!487965))

(declare-fun m!487967 () Bool)

(assert (=> b!507214 m!487967))

(declare-fun m!487969 () Bool)

(assert (=> b!507221 m!487969))

(assert (=> b!507219 m!487951))

(assert (=> b!507219 m!487951))

(declare-fun m!487971 () Bool)

(assert (=> b!507219 m!487971))

(declare-fun m!487973 () Bool)

(assert (=> b!507222 m!487973))

(declare-fun m!487975 () Bool)

(assert (=> b!507222 m!487975))

(declare-fun m!487977 () Bool)

(assert (=> b!507222 m!487977))

(declare-fun m!487979 () Bool)

(assert (=> b!507222 m!487979))

(assert (=> b!507222 m!487951))

(declare-fun m!487981 () Bool)

(assert (=> b!507222 m!487981))

(assert (=> b!507222 m!487951))

(declare-fun m!487983 () Bool)

(assert (=> b!507222 m!487983))

(assert (=> b!507222 m!487951))

(declare-fun m!487985 () Bool)

(assert (=> b!507222 m!487985))

(declare-fun m!487987 () Bool)

(assert (=> b!507222 m!487987))

(push 1)

