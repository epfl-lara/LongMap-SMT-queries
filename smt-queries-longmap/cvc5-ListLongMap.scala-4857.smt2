; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66912 () Bool)

(assert start!66912)

(declare-fun b!772059 () Bool)

(declare-fun res!522220 () Bool)

(declare-fun e!429809 () Bool)

(assert (=> b!772059 (=> (not res!522220) (not e!429809))))

(declare-datatypes ((array!42405 0))(
  ( (array!42406 (arr!20301 (Array (_ BitVec 32) (_ BitVec 64))) (size!20722 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42405)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42405 (_ BitVec 32)) Bool)

(assert (=> b!772059 (= res!522220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!772060 () Bool)

(declare-fun e!429807 () Bool)

(declare-fun e!429815 () Bool)

(assert (=> b!772060 (= e!429807 e!429815)))

(declare-fun res!522224 () Bool)

(assert (=> b!772060 (=> (not res!522224) (not e!429815))))

(declare-datatypes ((SeekEntryResult!7901 0))(
  ( (MissingZero!7901 (index!33972 (_ BitVec 32))) (Found!7901 (index!33973 (_ BitVec 32))) (Intermediate!7901 (undefined!8713 Bool) (index!33974 (_ BitVec 32)) (x!64908 (_ BitVec 32))) (Undefined!7901) (MissingVacant!7901 (index!33975 (_ BitVec 32))) )
))
(declare-fun lt!343721 () SeekEntryResult!7901)

(declare-fun lt!343725 () SeekEntryResult!7901)

(assert (=> b!772060 (= res!522224 (= lt!343721 lt!343725))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!343723 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343724 () array!42405)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42405 (_ BitVec 32)) SeekEntryResult!7901)

(assert (=> b!772060 (= lt!343725 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343723 lt!343724 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772060 (= lt!343721 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343723 mask!3328) lt!343723 lt!343724 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!772060 (= lt!343723 (select (store (arr!20301 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!772060 (= lt!343724 (array!42406 (store (arr!20301 a!3186) i!1173 k!2102) (size!20722 a!3186)))))

(declare-fun b!772061 () Bool)

(declare-fun res!522227 () Bool)

(assert (=> b!772061 (=> (not res!522227) (not e!429807))))

(declare-fun e!429808 () Bool)

(assert (=> b!772061 (= res!522227 e!429808)))

(declare-fun c!85320 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!772061 (= c!85320 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!772062 () Bool)

(declare-fun e!429806 () Bool)

(assert (=> b!772062 (= e!429806 e!429809)))

(declare-fun res!522215 () Bool)

(assert (=> b!772062 (=> (not res!522215) (not e!429809))))

(declare-fun lt!343726 () SeekEntryResult!7901)

(assert (=> b!772062 (= res!522215 (or (= lt!343726 (MissingZero!7901 i!1173)) (= lt!343726 (MissingVacant!7901 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42405 (_ BitVec 32)) SeekEntryResult!7901)

(assert (=> b!772062 (= lt!343726 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!772063 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42405 (_ BitVec 32)) SeekEntryResult!7901)

(assert (=> b!772063 (= e!429808 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20301 a!3186) j!159) a!3186 mask!3328) (Found!7901 j!159)))))

(declare-fun b!772064 () Bool)

(declare-fun lt!343722 () SeekEntryResult!7901)

(assert (=> b!772064 (= e!429808 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20301 a!3186) j!159) a!3186 mask!3328) lt!343722))))

(declare-fun b!772065 () Bool)

(declare-fun e!429811 () Bool)

(declare-fun e!429813 () Bool)

(assert (=> b!772065 (= e!429811 e!429813)))

(declare-fun res!522221 () Bool)

(assert (=> b!772065 (=> (not res!522221) (not e!429813))))

(declare-fun lt!343718 () SeekEntryResult!7901)

(assert (=> b!772065 (= res!522221 (= (seekEntryOrOpen!0 (select (arr!20301 a!3186) j!159) a!3186 mask!3328) lt!343718))))

(assert (=> b!772065 (= lt!343718 (Found!7901 j!159))))

(declare-fun b!772066 () Bool)

(assert (=> b!772066 (= e!429809 e!429807)))

(declare-fun res!522217 () Bool)

(assert (=> b!772066 (=> (not res!522217) (not e!429807))))

(assert (=> b!772066 (= res!522217 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20301 a!3186) j!159) mask!3328) (select (arr!20301 a!3186) j!159) a!3186 mask!3328) lt!343722))))

(assert (=> b!772066 (= lt!343722 (Intermediate!7901 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!772067 () Bool)

(declare-fun e!429810 () Bool)

(assert (=> b!772067 (= e!429810 true)))

(declare-datatypes ((Unit!26618 0))(
  ( (Unit!26619) )
))
(declare-fun lt!343727 () Unit!26618)

(declare-fun e!429814 () Unit!26618)

(assert (=> b!772067 (= lt!343727 e!429814)))

(declare-fun c!85321 () Bool)

(assert (=> b!772067 (= c!85321 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!343717 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!772067 (= lt!343717 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!772068 () Bool)

(declare-fun res!522212 () Bool)

(assert (=> b!772068 (=> (not res!522212) (not e!429806))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!772068 (= res!522212 (validKeyInArray!0 k!2102))))

(declare-fun res!522218 () Bool)

(assert (=> start!66912 (=> (not res!522218) (not e!429806))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66912 (= res!522218 (validMask!0 mask!3328))))

(assert (=> start!66912 e!429806))

(assert (=> start!66912 true))

(declare-fun array_inv!16097 (array!42405) Bool)

(assert (=> start!66912 (array_inv!16097 a!3186)))

(declare-fun b!772058 () Bool)

(declare-fun res!522222 () Bool)

(assert (=> b!772058 (=> (not res!522222) (not e!429809))))

(assert (=> b!772058 (= res!522222 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20722 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20722 a!3186))))))

(declare-fun b!772069 () Bool)

(assert (=> b!772069 (= e!429815 (not e!429810))))

(declare-fun res!522216 () Bool)

(assert (=> b!772069 (=> res!522216 e!429810)))

(assert (=> b!772069 (= res!522216 (or (not (is-Intermediate!7901 lt!343725)) (bvsge x!1131 (x!64908 lt!343725))))))

(assert (=> b!772069 e!429811))

(declare-fun res!522223 () Bool)

(assert (=> b!772069 (=> (not res!522223) (not e!429811))))

(assert (=> b!772069 (= res!522223 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343719 () Unit!26618)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26618)

(assert (=> b!772069 (= lt!343719 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!772070 () Bool)

(declare-fun Unit!26620 () Unit!26618)

(assert (=> b!772070 (= e!429814 Unit!26620)))

(declare-fun lt!343720 () SeekEntryResult!7901)

(assert (=> b!772070 (= lt!343720 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20301 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!772070 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343717 resIntermediateIndex!5 (select (arr!20301 a!3186) j!159) a!3186 mask!3328) (Found!7901 j!159))))

(declare-fun b!772071 () Bool)

(declare-fun res!522219 () Bool)

(assert (=> b!772071 (=> (not res!522219) (not e!429806))))

(assert (=> b!772071 (= res!522219 (and (= (size!20722 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20722 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20722 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!772072 () Bool)

(declare-fun res!522214 () Bool)

(assert (=> b!772072 (=> (not res!522214) (not e!429806))))

(assert (=> b!772072 (= res!522214 (validKeyInArray!0 (select (arr!20301 a!3186) j!159)))))

(declare-fun b!772073 () Bool)

(declare-fun res!522226 () Bool)

(assert (=> b!772073 (=> (not res!522226) (not e!429809))))

(declare-datatypes ((List!14303 0))(
  ( (Nil!14300) (Cons!14299 (h!15401 (_ BitVec 64)) (t!20618 List!14303)) )
))
(declare-fun arrayNoDuplicates!0 (array!42405 (_ BitVec 32) List!14303) Bool)

(assert (=> b!772073 (= res!522226 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14300))))

(declare-fun b!772074 () Bool)

(assert (=> b!772074 (= e!429813 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20301 a!3186) j!159) a!3186 mask!3328) lt!343718))))

(declare-fun b!772075 () Bool)

(declare-fun res!522213 () Bool)

(assert (=> b!772075 (=> (not res!522213) (not e!429806))))

(declare-fun arrayContainsKey!0 (array!42405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!772075 (= res!522213 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!772076 () Bool)

(declare-fun Unit!26621 () Unit!26618)

(assert (=> b!772076 (= e!429814 Unit!26621)))

(assert (=> b!772076 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343717 (select (arr!20301 a!3186) j!159) a!3186 mask!3328) lt!343722)))

(declare-fun b!772077 () Bool)

(declare-fun res!522225 () Bool)

(assert (=> b!772077 (=> (not res!522225) (not e!429807))))

(assert (=> b!772077 (= res!522225 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20301 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!66912 res!522218) b!772071))

(assert (= (and b!772071 res!522219) b!772072))

(assert (= (and b!772072 res!522214) b!772068))

(assert (= (and b!772068 res!522212) b!772075))

(assert (= (and b!772075 res!522213) b!772062))

(assert (= (and b!772062 res!522215) b!772059))

(assert (= (and b!772059 res!522220) b!772073))

(assert (= (and b!772073 res!522226) b!772058))

(assert (= (and b!772058 res!522222) b!772066))

(assert (= (and b!772066 res!522217) b!772077))

(assert (= (and b!772077 res!522225) b!772061))

(assert (= (and b!772061 c!85320) b!772064))

(assert (= (and b!772061 (not c!85320)) b!772063))

(assert (= (and b!772061 res!522227) b!772060))

(assert (= (and b!772060 res!522224) b!772069))

(assert (= (and b!772069 res!522223) b!772065))

(assert (= (and b!772065 res!522221) b!772074))

(assert (= (and b!772069 (not res!522216)) b!772067))

(assert (= (and b!772067 c!85321) b!772076))

(assert (= (and b!772067 (not c!85321)) b!772070))

(declare-fun m!717047 () Bool)

(assert (=> b!772066 m!717047))

(assert (=> b!772066 m!717047))

(declare-fun m!717049 () Bool)

(assert (=> b!772066 m!717049))

(assert (=> b!772066 m!717049))

(assert (=> b!772066 m!717047))

(declare-fun m!717051 () Bool)

(assert (=> b!772066 m!717051))

(assert (=> b!772063 m!717047))

(assert (=> b!772063 m!717047))

(declare-fun m!717053 () Bool)

(assert (=> b!772063 m!717053))

(assert (=> b!772074 m!717047))

(assert (=> b!772074 m!717047))

(declare-fun m!717055 () Bool)

(assert (=> b!772074 m!717055))

(assert (=> b!772065 m!717047))

(assert (=> b!772065 m!717047))

(declare-fun m!717057 () Bool)

(assert (=> b!772065 m!717057))

(declare-fun m!717059 () Bool)

(assert (=> b!772067 m!717059))

(declare-fun m!717061 () Bool)

(assert (=> b!772075 m!717061))

(declare-fun m!717063 () Bool)

(assert (=> b!772073 m!717063))

(declare-fun m!717065 () Bool)

(assert (=> b!772059 m!717065))

(declare-fun m!717067 () Bool)

(assert (=> b!772068 m!717067))

(declare-fun m!717069 () Bool)

(assert (=> b!772069 m!717069))

(declare-fun m!717071 () Bool)

(assert (=> b!772069 m!717071))

(declare-fun m!717073 () Bool)

(assert (=> b!772062 m!717073))

(declare-fun m!717075 () Bool)

(assert (=> start!66912 m!717075))

(declare-fun m!717077 () Bool)

(assert (=> start!66912 m!717077))

(declare-fun m!717079 () Bool)

(assert (=> b!772077 m!717079))

(assert (=> b!772070 m!717047))

(assert (=> b!772070 m!717047))

(assert (=> b!772070 m!717053))

(assert (=> b!772070 m!717047))

(declare-fun m!717081 () Bool)

(assert (=> b!772070 m!717081))

(declare-fun m!717083 () Bool)

(assert (=> b!772060 m!717083))

(declare-fun m!717085 () Bool)

(assert (=> b!772060 m!717085))

(declare-fun m!717087 () Bool)

(assert (=> b!772060 m!717087))

(declare-fun m!717089 () Bool)

(assert (=> b!772060 m!717089))

(assert (=> b!772060 m!717087))

(declare-fun m!717091 () Bool)

(assert (=> b!772060 m!717091))

(assert (=> b!772076 m!717047))

(assert (=> b!772076 m!717047))

(declare-fun m!717093 () Bool)

(assert (=> b!772076 m!717093))

(assert (=> b!772064 m!717047))

(assert (=> b!772064 m!717047))

(declare-fun m!717095 () Bool)

(assert (=> b!772064 m!717095))

(assert (=> b!772072 m!717047))

(assert (=> b!772072 m!717047))

(declare-fun m!717097 () Bool)

(assert (=> b!772072 m!717097))

(push 1)

