; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65300 () Bool)

(assert start!65300)

(declare-fun b!741703 () Bool)

(declare-fun res!499103 () Bool)

(declare-fun e!414538 () Bool)

(assert (=> b!741703 (=> (not res!499103) (not e!414538))))

(declare-datatypes ((array!41490 0))(
  ( (array!41491 (arr!19859 (Array (_ BitVec 32) (_ BitVec 64))) (size!20280 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41490)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!741703 (= res!499103 (validKeyInArray!0 (select (arr!19859 a!3186) j!159)))))

(declare-fun b!741704 () Bool)

(declare-fun res!499094 () Bool)

(assert (=> b!741704 (=> (not res!499094) (not e!414538))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!741704 (= res!499094 (and (= (size!20280 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20280 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20280 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!741705 () Bool)

(declare-fun res!499097 () Bool)

(declare-fun e!414536 () Bool)

(assert (=> b!741705 (=> (not res!499097) (not e!414536))))

(declare-datatypes ((List!13900 0))(
  ( (Nil!13897) (Cons!13896 (h!14968 (_ BitVec 64)) (t!20206 List!13900)) )
))
(declare-fun arrayNoDuplicates!0 (array!41490 (_ BitVec 32) List!13900) Bool)

(assert (=> b!741705 (= res!499097 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13897))))

(declare-fun b!741706 () Bool)

(declare-fun e!414540 () Bool)

(assert (=> b!741706 (= e!414536 e!414540)))

(declare-fun res!499092 () Bool)

(assert (=> b!741706 (=> (not res!499092) (not e!414540))))

(declare-datatypes ((SeekEntryResult!7456 0))(
  ( (MissingZero!7456 (index!32192 (_ BitVec 32))) (Found!7456 (index!32193 (_ BitVec 32))) (Intermediate!7456 (undefined!8268 Bool) (index!32194 (_ BitVec 32)) (x!63177 (_ BitVec 32))) (Undefined!7456) (MissingVacant!7456 (index!32195 (_ BitVec 32))) )
))
(declare-fun lt!329386 () SeekEntryResult!7456)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41490 (_ BitVec 32)) SeekEntryResult!7456)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!741706 (= res!499092 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19859 a!3186) j!159) mask!3328) (select (arr!19859 a!3186) j!159) a!3186 mask!3328) lt!329386))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!741706 (= lt!329386 (Intermediate!7456 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!741707 () Bool)

(declare-fun res!499099 () Bool)

(assert (=> b!741707 (=> (not res!499099) (not e!414538))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41490 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!741707 (= res!499099 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!741708 () Bool)

(declare-fun res!499090 () Bool)

(assert (=> b!741708 (=> (not res!499090) (not e!414540))))

(assert (=> b!741708 (= res!499090 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19859 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!741709 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!414534 () Bool)

(assert (=> b!741709 (= e!414534 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19859 a!3186) j!159) a!3186 mask!3328) lt!329386))))

(declare-fun b!741710 () Bool)

(declare-fun res!499104 () Bool)

(assert (=> b!741710 (=> (not res!499104) (not e!414538))))

(assert (=> b!741710 (= res!499104 (validKeyInArray!0 k0!2102))))

(declare-fun b!741711 () Bool)

(declare-fun res!499098 () Bool)

(assert (=> b!741711 (=> (not res!499098) (not e!414536))))

(assert (=> b!741711 (= res!499098 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20280 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20280 a!3186))))))

(declare-fun b!741712 () Bool)

(assert (=> b!741712 (= e!414538 e!414536)))

(declare-fun res!499096 () Bool)

(assert (=> b!741712 (=> (not res!499096) (not e!414536))))

(declare-fun lt!329383 () SeekEntryResult!7456)

(assert (=> b!741712 (= res!499096 (or (= lt!329383 (MissingZero!7456 i!1173)) (= lt!329383 (MissingVacant!7456 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41490 (_ BitVec 32)) SeekEntryResult!7456)

(assert (=> b!741712 (= lt!329383 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!741713 () Bool)

(declare-fun res!499091 () Bool)

(assert (=> b!741713 (=> (not res!499091) (not e!414536))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41490 (_ BitVec 32)) Bool)

(assert (=> b!741713 (= res!499091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!741715 () Bool)

(declare-fun e!414541 () Bool)

(declare-fun e!414539 () Bool)

(assert (=> b!741715 (= e!414541 e!414539)))

(declare-fun res!499101 () Bool)

(assert (=> b!741715 (=> (not res!499101) (not e!414539))))

(declare-fun lt!329382 () SeekEntryResult!7456)

(assert (=> b!741715 (= res!499101 (= (seekEntryOrOpen!0 (select (arr!19859 a!3186) j!159) a!3186 mask!3328) lt!329382))))

(assert (=> b!741715 (= lt!329382 (Found!7456 j!159))))

(declare-fun b!741716 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41490 (_ BitVec 32)) SeekEntryResult!7456)

(assert (=> b!741716 (= e!414534 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19859 a!3186) j!159) a!3186 mask!3328) (Found!7456 j!159)))))

(declare-fun b!741717 () Bool)

(declare-fun e!414537 () Bool)

(assert (=> b!741717 (= e!414540 e!414537)))

(declare-fun res!499100 () Bool)

(assert (=> b!741717 (=> (not res!499100) (not e!414537))))

(declare-fun lt!329387 () array!41490)

(declare-fun lt!329384 () (_ BitVec 64))

(assert (=> b!741717 (= res!499100 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!329384 mask!3328) lt!329384 lt!329387 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!329384 lt!329387 mask!3328)))))

(assert (=> b!741717 (= lt!329384 (select (store (arr!19859 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!741717 (= lt!329387 (array!41491 (store (arr!19859 a!3186) i!1173 k0!2102) (size!20280 a!3186)))))

(declare-fun b!741718 () Bool)

(assert (=> b!741718 (= e!414539 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19859 a!3186) j!159) a!3186 mask!3328) lt!329382))))

(declare-fun b!741719 () Bool)

(assert (=> b!741719 (= e!414537 (not true))))

(assert (=> b!741719 e!414541))

(declare-fun res!499102 () Bool)

(assert (=> b!741719 (=> (not res!499102) (not e!414541))))

(assert (=> b!741719 (= res!499102 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25364 0))(
  ( (Unit!25365) )
))
(declare-fun lt!329385 () Unit!25364)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25364)

(assert (=> b!741719 (= lt!329385 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!741714 () Bool)

(declare-fun res!499095 () Bool)

(assert (=> b!741714 (=> (not res!499095) (not e!414540))))

(assert (=> b!741714 (= res!499095 e!414534)))

(declare-fun c!81687 () Bool)

(assert (=> b!741714 (= c!81687 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!499093 () Bool)

(assert (=> start!65300 (=> (not res!499093) (not e!414538))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65300 (= res!499093 (validMask!0 mask!3328))))

(assert (=> start!65300 e!414538))

(assert (=> start!65300 true))

(declare-fun array_inv!15742 (array!41490) Bool)

(assert (=> start!65300 (array_inv!15742 a!3186)))

(assert (= (and start!65300 res!499093) b!741704))

(assert (= (and b!741704 res!499094) b!741703))

(assert (= (and b!741703 res!499103) b!741710))

(assert (= (and b!741710 res!499104) b!741707))

(assert (= (and b!741707 res!499099) b!741712))

(assert (= (and b!741712 res!499096) b!741713))

(assert (= (and b!741713 res!499091) b!741705))

(assert (= (and b!741705 res!499097) b!741711))

(assert (= (and b!741711 res!499098) b!741706))

(assert (= (and b!741706 res!499092) b!741708))

(assert (= (and b!741708 res!499090) b!741714))

(assert (= (and b!741714 c!81687) b!741709))

(assert (= (and b!741714 (not c!81687)) b!741716))

(assert (= (and b!741714 res!499095) b!741717))

(assert (= (and b!741717 res!499100) b!741719))

(assert (= (and b!741719 res!499102) b!741715))

(assert (= (and b!741715 res!499101) b!741718))

(declare-fun m!692117 () Bool)

(assert (=> b!741712 m!692117))

(declare-fun m!692119 () Bool)

(assert (=> b!741705 m!692119))

(declare-fun m!692121 () Bool)

(assert (=> b!741707 m!692121))

(declare-fun m!692123 () Bool)

(assert (=> b!741703 m!692123))

(assert (=> b!741703 m!692123))

(declare-fun m!692125 () Bool)

(assert (=> b!741703 m!692125))

(assert (=> b!741706 m!692123))

(assert (=> b!741706 m!692123))

(declare-fun m!692127 () Bool)

(assert (=> b!741706 m!692127))

(assert (=> b!741706 m!692127))

(assert (=> b!741706 m!692123))

(declare-fun m!692129 () Bool)

(assert (=> b!741706 m!692129))

(declare-fun m!692131 () Bool)

(assert (=> start!65300 m!692131))

(declare-fun m!692133 () Bool)

(assert (=> start!65300 m!692133))

(declare-fun m!692135 () Bool)

(assert (=> b!741710 m!692135))

(declare-fun m!692137 () Bool)

(assert (=> b!741713 m!692137))

(assert (=> b!741709 m!692123))

(assert (=> b!741709 m!692123))

(declare-fun m!692139 () Bool)

(assert (=> b!741709 m!692139))

(declare-fun m!692141 () Bool)

(assert (=> b!741719 m!692141))

(declare-fun m!692143 () Bool)

(assert (=> b!741719 m!692143))

(declare-fun m!692145 () Bool)

(assert (=> b!741708 m!692145))

(declare-fun m!692147 () Bool)

(assert (=> b!741717 m!692147))

(declare-fun m!692149 () Bool)

(assert (=> b!741717 m!692149))

(declare-fun m!692151 () Bool)

(assert (=> b!741717 m!692151))

(declare-fun m!692153 () Bool)

(assert (=> b!741717 m!692153))

(assert (=> b!741717 m!692147))

(declare-fun m!692155 () Bool)

(assert (=> b!741717 m!692155))

(assert (=> b!741715 m!692123))

(assert (=> b!741715 m!692123))

(declare-fun m!692157 () Bool)

(assert (=> b!741715 m!692157))

(assert (=> b!741716 m!692123))

(assert (=> b!741716 m!692123))

(declare-fun m!692159 () Bool)

(assert (=> b!741716 m!692159))

(assert (=> b!741718 m!692123))

(assert (=> b!741718 m!692123))

(declare-fun m!692161 () Bool)

(assert (=> b!741718 m!692161))

(check-sat (not b!741716) (not b!741717) (not b!741705) (not start!65300) (not b!741706) (not b!741709) (not b!741718) (not b!741707) (not b!741713) (not b!741710) (not b!741712) (not b!741719) (not b!741703) (not b!741715))
(check-sat)
