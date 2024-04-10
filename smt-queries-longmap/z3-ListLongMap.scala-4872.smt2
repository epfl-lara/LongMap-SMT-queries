; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67148 () Bool)

(assert start!67148)

(declare-fun b!776002 () Bool)

(declare-fun res!524857 () Bool)

(declare-fun e!431854 () Bool)

(assert (=> b!776002 (=> (not res!524857) (not e!431854))))

(declare-datatypes ((array!42503 0))(
  ( (array!42504 (arr!20347 (Array (_ BitVec 32) (_ BitVec 64))) (size!20768 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42503)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42503 (_ BitVec 32)) Bool)

(assert (=> b!776002 (= res!524857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!431847 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!776003 () Bool)

(declare-datatypes ((SeekEntryResult!7947 0))(
  ( (MissingZero!7947 (index!34156 (_ BitVec 32))) (Found!7947 (index!34157 (_ BitVec 32))) (Intermediate!7947 (undefined!8759 Bool) (index!34158 (_ BitVec 32)) (x!65098 (_ BitVec 32))) (Undefined!7947) (MissingVacant!7947 (index!34159 (_ BitVec 32))) )
))
(declare-fun lt!345706 () SeekEntryResult!7947)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42503 (_ BitVec 32)) SeekEntryResult!7947)

(assert (=> b!776003 (= e!431847 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20347 a!3186) j!159) a!3186 mask!3328) lt!345706))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!776004 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun e!431849 () Bool)

(declare-fun lt!345709 () SeekEntryResult!7947)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42503 (_ BitVec 32)) SeekEntryResult!7947)

(assert (=> b!776004 (= e!431849 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20347 a!3186) j!159) a!3186 mask!3328) lt!345709))))

(declare-fun b!776005 () Bool)

(declare-fun e!431855 () Bool)

(assert (=> b!776005 (= e!431855 e!431847)))

(declare-fun res!524856 () Bool)

(assert (=> b!776005 (=> (not res!524856) (not e!431847))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42503 (_ BitVec 32)) SeekEntryResult!7947)

(assert (=> b!776005 (= res!524856 (= (seekEntryOrOpen!0 (select (arr!20347 a!3186) j!159) a!3186 mask!3328) lt!345706))))

(assert (=> b!776005 (= lt!345706 (Found!7947 j!159))))

(declare-fun b!776006 () Bool)

(declare-fun res!524859 () Bool)

(declare-fun e!431850 () Bool)

(assert (=> b!776006 (=> (not res!524859) (not e!431850))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776006 (= res!524859 (validKeyInArray!0 k0!2102))))

(declare-fun b!776007 () Bool)

(declare-fun e!431852 () Bool)

(declare-fun e!431853 () Bool)

(assert (=> b!776007 (= e!431852 (not e!431853))))

(declare-fun res!524860 () Bool)

(assert (=> b!776007 (=> res!524860 e!431853)))

(declare-fun lt!345710 () SeekEntryResult!7947)

(get-info :version)

(assert (=> b!776007 (= res!524860 (or (not ((_ is Intermediate!7947) lt!345710)) (bvslt x!1131 (x!65098 lt!345710)) (not (= x!1131 (x!65098 lt!345710))) (not (= index!1321 (index!34158 lt!345710)))))))

(assert (=> b!776007 e!431855))

(declare-fun res!524862 () Bool)

(assert (=> b!776007 (=> (not res!524862) (not e!431855))))

(assert (=> b!776007 (= res!524862 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26788 0))(
  ( (Unit!26789) )
))
(declare-fun lt!345708 () Unit!26788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42503 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26788)

(assert (=> b!776007 (= lt!345708 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776008 () Bool)

(assert (=> b!776008 (= e!431849 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20347 a!3186) j!159) a!3186 mask!3328) (Found!7947 j!159)))))

(declare-fun b!776009 () Bool)

(declare-fun res!524858 () Bool)

(declare-fun e!431851 () Bool)

(assert (=> b!776009 (=> (not res!524858) (not e!431851))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776009 (= res!524858 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20347 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776010 () Bool)

(assert (=> b!776010 (= e!431850 e!431854)))

(declare-fun res!524855 () Bool)

(assert (=> b!776010 (=> (not res!524855) (not e!431854))))

(declare-fun lt!345707 () SeekEntryResult!7947)

(assert (=> b!776010 (= res!524855 (or (= lt!345707 (MissingZero!7947 i!1173)) (= lt!345707 (MissingVacant!7947 i!1173))))))

(assert (=> b!776010 (= lt!345707 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776011 () Bool)

(declare-fun res!524852 () Bool)

(assert (=> b!776011 (=> (not res!524852) (not e!431850))))

(assert (=> b!776011 (= res!524852 (and (= (size!20768 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20768 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20768 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776012 () Bool)

(declare-fun res!524867 () Bool)

(assert (=> b!776012 (=> (not res!524867) (not e!431850))))

(assert (=> b!776012 (= res!524867 (validKeyInArray!0 (select (arr!20347 a!3186) j!159)))))

(declare-fun b!776013 () Bool)

(declare-fun res!524864 () Bool)

(assert (=> b!776013 (=> (not res!524864) (not e!431851))))

(assert (=> b!776013 (= res!524864 e!431849)))

(declare-fun c!85975 () Bool)

(assert (=> b!776013 (= c!85975 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776015 () Bool)

(declare-fun res!524865 () Bool)

(assert (=> b!776015 (=> (not res!524865) (not e!431850))))

(declare-fun arrayContainsKey!0 (array!42503 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776015 (= res!524865 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776016 () Bool)

(assert (=> b!776016 (= e!431854 e!431851)))

(declare-fun res!524861 () Bool)

(assert (=> b!776016 (=> (not res!524861) (not e!431851))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776016 (= res!524861 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20347 a!3186) j!159) mask!3328) (select (arr!20347 a!3186) j!159) a!3186 mask!3328) lt!345709))))

(assert (=> b!776016 (= lt!345709 (Intermediate!7947 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776017 () Bool)

(declare-fun res!524854 () Bool)

(assert (=> b!776017 (=> (not res!524854) (not e!431854))))

(assert (=> b!776017 (= res!524854 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20768 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20768 a!3186))))))

(declare-fun b!776018 () Bool)

(assert (=> b!776018 (= e!431851 e!431852)))

(declare-fun res!524866 () Bool)

(assert (=> b!776018 (=> (not res!524866) (not e!431852))))

(declare-fun lt!345705 () SeekEntryResult!7947)

(assert (=> b!776018 (= res!524866 (= lt!345705 lt!345710))))

(declare-fun lt!345704 () (_ BitVec 64))

(declare-fun lt!345702 () array!42503)

(assert (=> b!776018 (= lt!345710 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345704 lt!345702 mask!3328))))

(assert (=> b!776018 (= lt!345705 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345704 mask!3328) lt!345704 lt!345702 mask!3328))))

(assert (=> b!776018 (= lt!345704 (select (store (arr!20347 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776018 (= lt!345702 (array!42504 (store (arr!20347 a!3186) i!1173 k0!2102) (size!20768 a!3186)))))

(declare-fun b!776019 () Bool)

(assert (=> b!776019 (= e!431853 true)))

(declare-fun lt!345703 () SeekEntryResult!7947)

(assert (=> b!776019 (= lt!345703 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20347 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776014 () Bool)

(declare-fun res!524863 () Bool)

(assert (=> b!776014 (=> (not res!524863) (not e!431854))))

(declare-datatypes ((List!14349 0))(
  ( (Nil!14346) (Cons!14345 (h!15453 (_ BitVec 64)) (t!20664 List!14349)) )
))
(declare-fun arrayNoDuplicates!0 (array!42503 (_ BitVec 32) List!14349) Bool)

(assert (=> b!776014 (= res!524863 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14346))))

(declare-fun res!524853 () Bool)

(assert (=> start!67148 (=> (not res!524853) (not e!431850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67148 (= res!524853 (validMask!0 mask!3328))))

(assert (=> start!67148 e!431850))

(assert (=> start!67148 true))

(declare-fun array_inv!16143 (array!42503) Bool)

(assert (=> start!67148 (array_inv!16143 a!3186)))

(assert (= (and start!67148 res!524853) b!776011))

(assert (= (and b!776011 res!524852) b!776012))

(assert (= (and b!776012 res!524867) b!776006))

(assert (= (and b!776006 res!524859) b!776015))

(assert (= (and b!776015 res!524865) b!776010))

(assert (= (and b!776010 res!524855) b!776002))

(assert (= (and b!776002 res!524857) b!776014))

(assert (= (and b!776014 res!524863) b!776017))

(assert (= (and b!776017 res!524854) b!776016))

(assert (= (and b!776016 res!524861) b!776009))

(assert (= (and b!776009 res!524858) b!776013))

(assert (= (and b!776013 c!85975) b!776004))

(assert (= (and b!776013 (not c!85975)) b!776008))

(assert (= (and b!776013 res!524864) b!776018))

(assert (= (and b!776018 res!524866) b!776007))

(assert (= (and b!776007 res!524862) b!776005))

(assert (= (and b!776005 res!524856) b!776003))

(assert (= (and b!776007 (not res!524860)) b!776019))

(declare-fun m!720147 () Bool)

(assert (=> b!776006 m!720147))

(declare-fun m!720149 () Bool)

(assert (=> b!776014 m!720149))

(declare-fun m!720151 () Bool)

(assert (=> b!776008 m!720151))

(assert (=> b!776008 m!720151))

(declare-fun m!720153 () Bool)

(assert (=> b!776008 m!720153))

(declare-fun m!720155 () Bool)

(assert (=> b!776002 m!720155))

(assert (=> b!776003 m!720151))

(assert (=> b!776003 m!720151))

(declare-fun m!720157 () Bool)

(assert (=> b!776003 m!720157))

(assert (=> b!776012 m!720151))

(assert (=> b!776012 m!720151))

(declare-fun m!720159 () Bool)

(assert (=> b!776012 m!720159))

(assert (=> b!776019 m!720151))

(assert (=> b!776019 m!720151))

(assert (=> b!776019 m!720153))

(declare-fun m!720161 () Bool)

(assert (=> b!776007 m!720161))

(declare-fun m!720163 () Bool)

(assert (=> b!776007 m!720163))

(declare-fun m!720165 () Bool)

(assert (=> b!776015 m!720165))

(assert (=> b!776004 m!720151))

(assert (=> b!776004 m!720151))

(declare-fun m!720167 () Bool)

(assert (=> b!776004 m!720167))

(assert (=> b!776005 m!720151))

(assert (=> b!776005 m!720151))

(declare-fun m!720169 () Bool)

(assert (=> b!776005 m!720169))

(assert (=> b!776016 m!720151))

(assert (=> b!776016 m!720151))

(declare-fun m!720171 () Bool)

(assert (=> b!776016 m!720171))

(assert (=> b!776016 m!720171))

(assert (=> b!776016 m!720151))

(declare-fun m!720173 () Bool)

(assert (=> b!776016 m!720173))

(declare-fun m!720175 () Bool)

(assert (=> b!776018 m!720175))

(declare-fun m!720177 () Bool)

(assert (=> b!776018 m!720177))

(declare-fun m!720179 () Bool)

(assert (=> b!776018 m!720179))

(assert (=> b!776018 m!720175))

(declare-fun m!720181 () Bool)

(assert (=> b!776018 m!720181))

(declare-fun m!720183 () Bool)

(assert (=> b!776018 m!720183))

(declare-fun m!720185 () Bool)

(assert (=> start!67148 m!720185))

(declare-fun m!720187 () Bool)

(assert (=> start!67148 m!720187))

(declare-fun m!720189 () Bool)

(assert (=> b!776010 m!720189))

(declare-fun m!720191 () Bool)

(assert (=> b!776009 m!720191))

(check-sat (not b!776008) (not start!67148) (not b!776015) (not b!776007) (not b!776010) (not b!776003) (not b!776014) (not b!776019) (not b!776016) (not b!776018) (not b!776002) (not b!776004) (not b!776005) (not b!776012) (not b!776006))
(check-sat)
