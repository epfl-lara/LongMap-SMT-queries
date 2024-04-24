; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65574 () Bool)

(assert start!65574)

(declare-fun b!746246 () Bool)

(declare-fun res!502690 () Bool)

(declare-fun e!416859 () Bool)

(assert (=> b!746246 (=> (not res!502690) (not e!416859))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41617 0))(
  ( (array!41618 (arr!19918 (Array (_ BitVec 32) (_ BitVec 64))) (size!20338 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41617)

(assert (=> b!746246 (= res!502690 (and (= (size!20338 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20338 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20338 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!746247 () Bool)

(declare-fun e!416857 () Bool)

(assert (=> b!746247 (= e!416857 true)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7474 0))(
  ( (MissingZero!7474 (index!32264 (_ BitVec 32))) (Found!7474 (index!32265 (_ BitVec 32))) (Intermediate!7474 (undefined!8286 Bool) (index!32266 (_ BitVec 32)) (x!63380 (_ BitVec 32))) (Undefined!7474) (MissingVacant!7474 (index!32267 (_ BitVec 32))) )
))
(declare-fun lt!331522 () SeekEntryResult!7474)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41617 (_ BitVec 32)) SeekEntryResult!7474)

(assert (=> b!746247 (= lt!331522 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19918 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!746248 () Bool)

(declare-fun e!416856 () Bool)

(declare-fun e!416858 () Bool)

(assert (=> b!746248 (= e!416856 e!416858)))

(declare-fun res!502678 () Bool)

(assert (=> b!746248 (=> (not res!502678) (not e!416858))))

(declare-fun lt!331521 () SeekEntryResult!7474)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41617 (_ BitVec 32)) SeekEntryResult!7474)

(assert (=> b!746248 (= res!502678 (= (seekEntryOrOpen!0 (select (arr!19918 a!3186) j!159) a!3186 mask!3328) lt!331521))))

(assert (=> b!746248 (= lt!331521 (Found!7474 j!159))))

(declare-fun b!746249 () Bool)

(declare-fun e!416855 () Bool)

(assert (=> b!746249 (= e!416855 (not e!416857))))

(declare-fun res!502684 () Bool)

(assert (=> b!746249 (=> res!502684 e!416857)))

(declare-fun lt!331523 () SeekEntryResult!7474)

(get-info :version)

(assert (=> b!746249 (= res!502684 (or (not ((_ is Intermediate!7474) lt!331523)) (bvslt x!1131 (x!63380 lt!331523)) (not (= x!1131 (x!63380 lt!331523))) (not (= index!1321 (index!32266 lt!331523)))))))

(assert (=> b!746249 e!416856))

(declare-fun res!502687 () Bool)

(assert (=> b!746249 (=> (not res!502687) (not e!416856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41617 (_ BitVec 32)) Bool)

(assert (=> b!746249 (= res!502687 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25507 0))(
  ( (Unit!25508) )
))
(declare-fun lt!331516 () Unit!25507)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25507)

(assert (=> b!746249 (= lt!331516 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!746250 () Bool)

(declare-fun e!416851 () Bool)

(declare-fun e!416853 () Bool)

(assert (=> b!746250 (= e!416851 e!416853)))

(declare-fun res!502679 () Bool)

(assert (=> b!746250 (=> (not res!502679) (not e!416853))))

(declare-fun lt!331519 () SeekEntryResult!7474)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41617 (_ BitVec 32)) SeekEntryResult!7474)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!746250 (= res!502679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19918 a!3186) j!159) mask!3328) (select (arr!19918 a!3186) j!159) a!3186 mask!3328) lt!331519))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!746250 (= lt!331519 (Intermediate!7474 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!746251 () Bool)

(declare-fun res!502682 () Bool)

(assert (=> b!746251 (=> (not res!502682) (not e!416859))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41617 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!746251 (= res!502682 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!746252 () Bool)

(declare-fun res!502683 () Bool)

(assert (=> b!746252 (=> (not res!502683) (not e!416851))))

(assert (=> b!746252 (= res!502683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!746253 () Bool)

(declare-fun e!416854 () Bool)

(assert (=> b!746253 (= e!416854 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19918 a!3186) j!159) a!3186 mask!3328) (Found!7474 j!159)))))

(declare-fun b!746254 () Bool)

(declare-fun res!502685 () Bool)

(assert (=> b!746254 (=> (not res!502685) (not e!416859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!746254 (= res!502685 (validKeyInArray!0 k0!2102))))

(declare-fun b!746255 () Bool)

(declare-fun res!502680 () Bool)

(assert (=> b!746255 (=> (not res!502680) (not e!416853))))

(assert (=> b!746255 (= res!502680 e!416854)))

(declare-fun c!82169 () Bool)

(assert (=> b!746255 (= c!82169 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!746256 () Bool)

(assert (=> b!746256 (= e!416853 e!416855)))

(declare-fun res!502681 () Bool)

(assert (=> b!746256 (=> (not res!502681) (not e!416855))))

(declare-fun lt!331520 () SeekEntryResult!7474)

(assert (=> b!746256 (= res!502681 (= lt!331520 lt!331523))))

(declare-fun lt!331518 () array!41617)

(declare-fun lt!331517 () (_ BitVec 64))

(assert (=> b!746256 (= lt!331523 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331517 lt!331518 mask!3328))))

(assert (=> b!746256 (= lt!331520 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331517 mask!3328) lt!331517 lt!331518 mask!3328))))

(assert (=> b!746256 (= lt!331517 (select (store (arr!19918 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!746256 (= lt!331518 (array!41618 (store (arr!19918 a!3186) i!1173 k0!2102) (size!20338 a!3186)))))

(declare-fun b!746257 () Bool)

(declare-fun res!502677 () Bool)

(assert (=> b!746257 (=> (not res!502677) (not e!416851))))

(declare-datatypes ((List!13827 0))(
  ( (Nil!13824) (Cons!13823 (h!14901 (_ BitVec 64)) (t!20134 List!13827)) )
))
(declare-fun arrayNoDuplicates!0 (array!41617 (_ BitVec 32) List!13827) Bool)

(assert (=> b!746257 (= res!502677 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13824))))

(declare-fun b!746258 () Bool)

(assert (=> b!746258 (= e!416859 e!416851)))

(declare-fun res!502676 () Bool)

(assert (=> b!746258 (=> (not res!502676) (not e!416851))))

(declare-fun lt!331524 () SeekEntryResult!7474)

(assert (=> b!746258 (= res!502676 (or (= lt!331524 (MissingZero!7474 i!1173)) (= lt!331524 (MissingVacant!7474 i!1173))))))

(assert (=> b!746258 (= lt!331524 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!746259 () Bool)

(assert (=> b!746259 (= e!416854 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19918 a!3186) j!159) a!3186 mask!3328) lt!331519))))

(declare-fun b!746260 () Bool)

(assert (=> b!746260 (= e!416858 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19918 a!3186) j!159) a!3186 mask!3328) lt!331521))))

(declare-fun b!746261 () Bool)

(declare-fun res!502675 () Bool)

(assert (=> b!746261 (=> (not res!502675) (not e!416853))))

(assert (=> b!746261 (= res!502675 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19918 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!746262 () Bool)

(declare-fun res!502686 () Bool)

(assert (=> b!746262 (=> (not res!502686) (not e!416859))))

(assert (=> b!746262 (= res!502686 (validKeyInArray!0 (select (arr!19918 a!3186) j!159)))))

(declare-fun res!502689 () Bool)

(assert (=> start!65574 (=> (not res!502689) (not e!416859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65574 (= res!502689 (validMask!0 mask!3328))))

(assert (=> start!65574 e!416859))

(assert (=> start!65574 true))

(declare-fun array_inv!15777 (array!41617) Bool)

(assert (=> start!65574 (array_inv!15777 a!3186)))

(declare-fun b!746263 () Bool)

(declare-fun res!502688 () Bool)

(assert (=> b!746263 (=> (not res!502688) (not e!416851))))

(assert (=> b!746263 (= res!502688 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20338 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20338 a!3186))))))

(assert (= (and start!65574 res!502689) b!746246))

(assert (= (and b!746246 res!502690) b!746262))

(assert (= (and b!746262 res!502686) b!746254))

(assert (= (and b!746254 res!502685) b!746251))

(assert (= (and b!746251 res!502682) b!746258))

(assert (= (and b!746258 res!502676) b!746252))

(assert (= (and b!746252 res!502683) b!746257))

(assert (= (and b!746257 res!502677) b!746263))

(assert (= (and b!746263 res!502688) b!746250))

(assert (= (and b!746250 res!502679) b!746261))

(assert (= (and b!746261 res!502675) b!746255))

(assert (= (and b!746255 c!82169) b!746259))

(assert (= (and b!746255 (not c!82169)) b!746253))

(assert (= (and b!746255 res!502680) b!746256))

(assert (= (and b!746256 res!502681) b!746249))

(assert (= (and b!746249 res!502687) b!746248))

(assert (= (and b!746248 res!502678) b!746260))

(assert (= (and b!746249 (not res!502684)) b!746247))

(declare-fun m!697029 () Bool)

(assert (=> b!746247 m!697029))

(assert (=> b!746247 m!697029))

(declare-fun m!697031 () Bool)

(assert (=> b!746247 m!697031))

(declare-fun m!697033 () Bool)

(assert (=> b!746257 m!697033))

(declare-fun m!697035 () Bool)

(assert (=> b!746254 m!697035))

(declare-fun m!697037 () Bool)

(assert (=> b!746261 m!697037))

(declare-fun m!697039 () Bool)

(assert (=> b!746249 m!697039))

(declare-fun m!697041 () Bool)

(assert (=> b!746249 m!697041))

(declare-fun m!697043 () Bool)

(assert (=> b!746258 m!697043))

(assert (=> b!746260 m!697029))

(assert (=> b!746260 m!697029))

(declare-fun m!697045 () Bool)

(assert (=> b!746260 m!697045))

(declare-fun m!697047 () Bool)

(assert (=> start!65574 m!697047))

(declare-fun m!697049 () Bool)

(assert (=> start!65574 m!697049))

(declare-fun m!697051 () Bool)

(assert (=> b!746251 m!697051))

(assert (=> b!746253 m!697029))

(assert (=> b!746253 m!697029))

(assert (=> b!746253 m!697031))

(declare-fun m!697053 () Bool)

(assert (=> b!746256 m!697053))

(declare-fun m!697055 () Bool)

(assert (=> b!746256 m!697055))

(declare-fun m!697057 () Bool)

(assert (=> b!746256 m!697057))

(declare-fun m!697059 () Bool)

(assert (=> b!746256 m!697059))

(assert (=> b!746256 m!697059))

(declare-fun m!697061 () Bool)

(assert (=> b!746256 m!697061))

(assert (=> b!746262 m!697029))

(assert (=> b!746262 m!697029))

(declare-fun m!697063 () Bool)

(assert (=> b!746262 m!697063))

(assert (=> b!746259 m!697029))

(assert (=> b!746259 m!697029))

(declare-fun m!697065 () Bool)

(assert (=> b!746259 m!697065))

(assert (=> b!746250 m!697029))

(assert (=> b!746250 m!697029))

(declare-fun m!697067 () Bool)

(assert (=> b!746250 m!697067))

(assert (=> b!746250 m!697067))

(assert (=> b!746250 m!697029))

(declare-fun m!697069 () Bool)

(assert (=> b!746250 m!697069))

(declare-fun m!697071 () Bool)

(assert (=> b!746252 m!697071))

(assert (=> b!746248 m!697029))

(assert (=> b!746248 m!697029))

(declare-fun m!697073 () Bool)

(assert (=> b!746248 m!697073))

(check-sat (not b!746252) (not b!746262) (not b!746258) (not b!746253) (not b!746249) (not b!746254) (not b!746251) (not b!746248) (not b!746256) (not b!746259) (not b!746247) (not b!746260) (not start!65574) (not b!746250) (not b!746257))
(check-sat)
