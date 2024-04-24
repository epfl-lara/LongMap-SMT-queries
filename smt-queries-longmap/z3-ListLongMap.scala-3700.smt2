; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50862 () Bool)

(assert start!50862)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun b!556219 () Bool)

(declare-datatypes ((array!35034 0))(
  ( (array!35035 (arr!16825 (Array (_ BitVec 32) (_ BitVec 64))) (size!17189 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35034)

(declare-fun e!320521 () Bool)

(declare-fun j!142 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5230 0))(
  ( (MissingZero!5230 (index!23147 (_ BitVec 32))) (Found!5230 (index!23148 (_ BitVec 32))) (Intermediate!5230 (undefined!6042 Bool) (index!23149 (_ BitVec 32)) (x!52195 (_ BitVec 32))) (Undefined!5230) (MissingVacant!5230 (index!23150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35034 (_ BitVec 32)) SeekEntryResult!5230)

(assert (=> b!556219 (= e!320521 (= (seekEntryOrOpen!0 (select (arr!16825 a!3118) j!142) a!3118 mask!3119) (Found!5230 j!142)))))

(declare-fun b!556220 () Bool)

(declare-fun res!348530 () Bool)

(declare-fun e!320519 () Bool)

(assert (=> b!556220 (=> (not res!348530) (not e!320519))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!556220 (= res!348530 (validKeyInArray!0 k0!1914))))

(declare-fun b!556221 () Bool)

(declare-fun res!348529 () Bool)

(declare-fun e!320523 () Bool)

(assert (=> b!556221 (=> (not res!348529) (not e!320523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35034 (_ BitVec 32)) Bool)

(assert (=> b!556221 (= res!348529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!556222 () Bool)

(declare-fun res!348527 () Bool)

(assert (=> b!556222 (=> (not res!348527) (not e!320519))))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!556222 (= res!348527 (and (= (size!17189 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17189 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17189 a!3118)) (not (= i!1132 j!142))))))

(declare-fun res!348526 () Bool)

(assert (=> start!50862 (=> (not res!348526) (not e!320519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50862 (= res!348526 (validMask!0 mask!3119))))

(assert (=> start!50862 e!320519))

(assert (=> start!50862 true))

(declare-fun array_inv!12684 (array!35034) Bool)

(assert (=> start!50862 (array_inv!12684 a!3118)))

(declare-fun b!556223 () Bool)

(declare-fun res!348532 () Bool)

(assert (=> b!556223 (=> (not res!348532) (not e!320519))))

(declare-fun arrayContainsKey!0 (array!35034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!556223 (= res!348532 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!556224 () Bool)

(declare-fun res!348534 () Bool)

(assert (=> b!556224 (=> (not res!348534) (not e!320519))))

(assert (=> b!556224 (= res!348534 (validKeyInArray!0 (select (arr!16825 a!3118) j!142)))))

(declare-fun b!556225 () Bool)

(declare-fun lt!252871 () SeekEntryResult!5230)

(declare-fun e!320522 () Bool)

(get-info :version)

(assert (=> b!556225 (= e!320522 (not (or (not ((_ is Intermediate!5230) lt!252871)) (undefined!6042 lt!252871) (= (select (arr!16825 a!3118) (index!23149 lt!252871)) (select (arr!16825 a!3118) j!142)) (= (select (arr!16825 a!3118) (index!23149 lt!252871)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge mask!3119 #b00000000000000000000000000000000))))))

(assert (=> b!556225 e!320521))

(declare-fun res!348531 () Bool)

(assert (=> b!556225 (=> (not res!348531) (not e!320521))))

(assert (=> b!556225 (= res!348531 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17305 0))(
  ( (Unit!17306) )
))
(declare-fun lt!252870 () Unit!17305)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35034 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17305)

(assert (=> b!556225 (= lt!252870 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!556226 () Bool)

(assert (=> b!556226 (= e!320519 e!320523)))

(declare-fun res!348533 () Bool)

(assert (=> b!556226 (=> (not res!348533) (not e!320523))))

(declare-fun lt!252867 () SeekEntryResult!5230)

(assert (=> b!556226 (= res!348533 (or (= lt!252867 (MissingZero!5230 i!1132)) (= lt!252867 (MissingVacant!5230 i!1132))))))

(assert (=> b!556226 (= lt!252867 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!556227 () Bool)

(assert (=> b!556227 (= e!320523 e!320522)))

(declare-fun res!348528 () Bool)

(assert (=> b!556227 (=> (not res!348528) (not e!320522))))

(declare-fun lt!252869 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35034 (_ BitVec 32)) SeekEntryResult!5230)

(assert (=> b!556227 (= res!348528 (= lt!252871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252869 (select (store (arr!16825 a!3118) i!1132 k0!1914) j!142) (array!35035 (store (arr!16825 a!3118) i!1132 k0!1914) (size!17189 a!3118)) mask!3119)))))

(declare-fun lt!252868 () (_ BitVec 32))

(assert (=> b!556227 (= lt!252871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252868 (select (arr!16825 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!556227 (= lt!252869 (toIndex!0 (select (store (arr!16825 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!556227 (= lt!252868 (toIndex!0 (select (arr!16825 a!3118) j!142) mask!3119))))

(declare-fun b!556228 () Bool)

(declare-fun res!348535 () Bool)

(assert (=> b!556228 (=> (not res!348535) (not e!320523))))

(declare-datatypes ((List!10812 0))(
  ( (Nil!10809) (Cons!10808 (h!11796 (_ BitVec 64)) (t!17032 List!10812)) )
))
(declare-fun arrayNoDuplicates!0 (array!35034 (_ BitVec 32) List!10812) Bool)

(assert (=> b!556228 (= res!348535 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10809))))

(assert (= (and start!50862 res!348526) b!556222))

(assert (= (and b!556222 res!348527) b!556224))

(assert (= (and b!556224 res!348534) b!556220))

(assert (= (and b!556220 res!348530) b!556223))

(assert (= (and b!556223 res!348532) b!556226))

(assert (= (and b!556226 res!348533) b!556221))

(assert (= (and b!556221 res!348529) b!556228))

(assert (= (and b!556228 res!348535) b!556227))

(assert (= (and b!556227 res!348528) b!556225))

(assert (= (and b!556225 res!348531) b!556219))

(declare-fun m!534257 () Bool)

(assert (=> b!556226 m!534257))

(declare-fun m!534259 () Bool)

(assert (=> start!50862 m!534259))

(declare-fun m!534261 () Bool)

(assert (=> start!50862 m!534261))

(declare-fun m!534263 () Bool)

(assert (=> b!556228 m!534263))

(declare-fun m!534265 () Bool)

(assert (=> b!556219 m!534265))

(assert (=> b!556219 m!534265))

(declare-fun m!534267 () Bool)

(assert (=> b!556219 m!534267))

(assert (=> b!556227 m!534265))

(declare-fun m!534269 () Bool)

(assert (=> b!556227 m!534269))

(assert (=> b!556227 m!534265))

(declare-fun m!534271 () Bool)

(assert (=> b!556227 m!534271))

(assert (=> b!556227 m!534265))

(declare-fun m!534273 () Bool)

(assert (=> b!556227 m!534273))

(declare-fun m!534275 () Bool)

(assert (=> b!556227 m!534275))

(assert (=> b!556227 m!534273))

(declare-fun m!534277 () Bool)

(assert (=> b!556227 m!534277))

(assert (=> b!556227 m!534273))

(declare-fun m!534279 () Bool)

(assert (=> b!556227 m!534279))

(assert (=> b!556224 m!534265))

(assert (=> b!556224 m!534265))

(declare-fun m!534281 () Bool)

(assert (=> b!556224 m!534281))

(declare-fun m!534283 () Bool)

(assert (=> b!556223 m!534283))

(declare-fun m!534285 () Bool)

(assert (=> b!556220 m!534285))

(declare-fun m!534287 () Bool)

(assert (=> b!556225 m!534287))

(assert (=> b!556225 m!534265))

(declare-fun m!534289 () Bool)

(assert (=> b!556225 m!534289))

(declare-fun m!534291 () Bool)

(assert (=> b!556225 m!534291))

(declare-fun m!534293 () Bool)

(assert (=> b!556221 m!534293))

(check-sat (not b!556223) (not b!556220) (not b!556224) (not b!556227) (not b!556219) (not b!556226) (not b!556228) (not b!556221) (not start!50862) (not b!556225))
(check-sat)
