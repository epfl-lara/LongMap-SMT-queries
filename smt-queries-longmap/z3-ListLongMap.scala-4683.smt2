; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65286 () Bool)

(assert start!65286)

(declare-datatypes ((array!41329 0))(
  ( (array!41330 (arr!19774 (Array (_ BitVec 32) (_ BitVec 64))) (size!20194 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41329)

(declare-fun b!737213 () Bool)

(declare-fun e!412475 () Bool)

(declare-datatypes ((SeekEntryResult!7330 0))(
  ( (MissingZero!7330 (index!31688 (_ BitVec 32))) (Found!7330 (index!31689 (_ BitVec 32))) (Intermediate!7330 (undefined!8142 Bool) (index!31690 (_ BitVec 32)) (x!62852 (_ BitVec 32))) (Undefined!7330) (MissingVacant!7330 (index!31691 (_ BitVec 32))) )
))
(declare-fun lt!326935 () SeekEntryResult!7330)

(declare-fun lt!326936 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41329 (_ BitVec 32)) SeekEntryResult!7330)

(assert (=> b!737213 (= e!412475 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326936 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326935)))))

(declare-fun b!737214 () Bool)

(declare-fun res!495260 () Bool)

(declare-fun e!412469 () Bool)

(assert (=> b!737214 (=> (not res!495260) (not e!412469))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41329 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!737214 (= res!495260 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!737215 () Bool)

(declare-fun e!412474 () Bool)

(declare-fun e!412472 () Bool)

(assert (=> b!737215 (= e!412474 e!412472)))

(declare-fun res!495271 () Bool)

(assert (=> b!737215 (=> (not res!495271) (not e!412472))))

(declare-fun lt!326939 () SeekEntryResult!7330)

(declare-fun lt!326927 () SeekEntryResult!7330)

(assert (=> b!737215 (= res!495271 (= lt!326939 lt!326927))))

(declare-fun lt!326932 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!326934 () array!41329)

(assert (=> b!737215 (= lt!326927 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326932 lt!326934 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737215 (= lt!326939 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326932 mask!3328) lt!326932 lt!326934 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!737215 (= lt!326932 (select (store (arr!19774 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!737215 (= lt!326934 (array!41330 (store (arr!19774 a!3186) i!1173 k0!2102) (size!20194 a!3186)))))

(declare-fun b!737217 () Bool)

(declare-fun e!412476 () Bool)

(assert (=> b!737217 (= e!412469 e!412476)))

(declare-fun res!495258 () Bool)

(assert (=> b!737217 (=> (not res!495258) (not e!412476))))

(declare-fun lt!326938 () SeekEntryResult!7330)

(assert (=> b!737217 (= res!495258 (or (= lt!326938 (MissingZero!7330 i!1173)) (= lt!326938 (MissingVacant!7330 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41329 (_ BitVec 32)) SeekEntryResult!7330)

(assert (=> b!737217 (= lt!326938 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!737218 () Bool)

(declare-fun res!495269 () Bool)

(assert (=> b!737218 (=> (not res!495269) (not e!412476))))

(declare-datatypes ((List!13683 0))(
  ( (Nil!13680) (Cons!13679 (h!14757 (_ BitVec 64)) (t!19990 List!13683)) )
))
(declare-fun arrayNoDuplicates!0 (array!41329 (_ BitVec 32) List!13683) Bool)

(assert (=> b!737218 (= res!495269 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13680))))

(declare-fun b!737219 () Bool)

(declare-fun res!495263 () Bool)

(assert (=> b!737219 (=> (not res!495263) (not e!412469))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!737219 (= res!495263 (validKeyInArray!0 (select (arr!19774 a!3186) j!159)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!326933 () SeekEntryResult!7330)

(declare-fun b!737220 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41329 (_ BitVec 32)) SeekEntryResult!7330)

(assert (=> b!737220 (= e!412475 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326936 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326933)))))

(declare-fun b!737221 () Bool)

(declare-fun res!495256 () Bool)

(assert (=> b!737221 (=> (not res!495256) (not e!412469))))

(assert (=> b!737221 (= res!495256 (validKeyInArray!0 k0!2102))))

(declare-fun b!737222 () Bool)

(declare-fun e!412467 () Bool)

(assert (=> b!737222 (= e!412467 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) (Found!7330 j!159)))))

(declare-fun b!737223 () Bool)

(declare-fun e!412470 () Bool)

(declare-fun e!412468 () Bool)

(assert (=> b!737223 (= e!412470 e!412468)))

(declare-fun res!495257 () Bool)

(assert (=> b!737223 (=> res!495257 e!412468)))

(assert (=> b!737223 (= res!495257 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326936 #b00000000000000000000000000000000) (bvsge lt!326936 (size!20194 a!3186))))))

(declare-datatypes ((Unit!25093 0))(
  ( (Unit!25094) )
))
(declare-fun lt!326940 () Unit!25093)

(declare-fun e!412471 () Unit!25093)

(assert (=> b!737223 (= lt!326940 e!412471)))

(declare-fun c!81363 () Bool)

(declare-fun lt!326930 () Bool)

(assert (=> b!737223 (= c!81363 lt!326930)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!737223 (= lt!326930 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!737223 (= lt!326936 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!737224 () Bool)

(assert (=> b!737224 (= e!412476 e!412474)))

(declare-fun res!495264 () Bool)

(assert (=> b!737224 (=> (not res!495264) (not e!412474))))

(assert (=> b!737224 (= res!495264 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19774 a!3186) j!159) mask!3328) (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326935))))

(assert (=> b!737224 (= lt!326935 (Intermediate!7330 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!737225 () Bool)

(declare-fun res!495270 () Bool)

(assert (=> b!737225 (=> (not res!495270) (not e!412476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41329 (_ BitVec 32)) Bool)

(assert (=> b!737225 (= res!495270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!737226 () Bool)

(declare-fun e!412465 () Bool)

(declare-fun e!412466 () Bool)

(assert (=> b!737226 (= e!412465 e!412466)))

(declare-fun res!495255 () Bool)

(assert (=> b!737226 (=> (not res!495255) (not e!412466))))

(declare-fun lt!326929 () SeekEntryResult!7330)

(assert (=> b!737226 (= res!495255 (= (seekEntryOrOpen!0 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326929))))

(assert (=> b!737226 (= lt!326929 (Found!7330 j!159))))

(declare-fun b!737216 () Bool)

(declare-fun res!495262 () Bool)

(assert (=> b!737216 (=> (not res!495262) (not e!412474))))

(assert (=> b!737216 (= res!495262 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19774 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!495268 () Bool)

(assert (=> start!65286 (=> (not res!495268) (not e!412469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65286 (= res!495268 (validMask!0 mask!3328))))

(assert (=> start!65286 e!412469))

(assert (=> start!65286 true))

(declare-fun array_inv!15633 (array!41329) Bool)

(assert (=> start!65286 (array_inv!15633 a!3186)))

(declare-fun b!737227 () Bool)

(assert (=> b!737227 (= e!412468 true)))

(declare-fun lt!326931 () SeekEntryResult!7330)

(assert (=> b!737227 (= lt!326931 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326936 lt!326932 lt!326934 mask!3328))))

(declare-fun b!737228 () Bool)

(declare-fun res!495267 () Bool)

(assert (=> b!737228 (=> (not res!495267) (not e!412476))))

(assert (=> b!737228 (= res!495267 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20194 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20194 a!3186))))))

(declare-fun b!737229 () Bool)

(declare-fun res!495266 () Bool)

(assert (=> b!737229 (=> (not res!495266) (not e!412469))))

(assert (=> b!737229 (= res!495266 (and (= (size!20194 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20194 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20194 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!737230 () Bool)

(declare-fun Unit!25095 () Unit!25093)

(assert (=> b!737230 (= e!412471 Unit!25095)))

(assert (=> b!737230 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326936 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326935)))

(declare-fun b!737231 () Bool)

(declare-fun res!495254 () Bool)

(assert (=> b!737231 (=> res!495254 e!412468)))

(assert (=> b!737231 (= res!495254 e!412475)))

(declare-fun c!81364 () Bool)

(assert (=> b!737231 (= c!81364 lt!326930)))

(declare-fun b!737232 () Bool)

(assert (=> b!737232 (= e!412466 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326929))))

(declare-fun b!737233 () Bool)

(assert (=> b!737233 (= e!412467 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326935))))

(declare-fun b!737234 () Bool)

(assert (=> b!737234 (= e!412472 (not e!412470))))

(declare-fun res!495265 () Bool)

(assert (=> b!737234 (=> res!495265 e!412470)))

(get-info :version)

(assert (=> b!737234 (= res!495265 (or (not ((_ is Intermediate!7330) lt!326927)) (bvsge x!1131 (x!62852 lt!326927))))))

(assert (=> b!737234 (= lt!326933 (Found!7330 j!159))))

(assert (=> b!737234 e!412465))

(declare-fun res!495259 () Bool)

(assert (=> b!737234 (=> (not res!495259) (not e!412465))))

(assert (=> b!737234 (= res!495259 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326928 () Unit!25093)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41329 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25093)

(assert (=> b!737234 (= lt!326928 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!737235 () Bool)

(declare-fun Unit!25096 () Unit!25093)

(assert (=> b!737235 (= e!412471 Unit!25096)))

(declare-fun lt!326937 () SeekEntryResult!7330)

(assert (=> b!737235 (= lt!326937 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!737235 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326936 resIntermediateIndex!5 (select (arr!19774 a!3186) j!159) a!3186 mask!3328) lt!326933)))

(declare-fun b!737236 () Bool)

(declare-fun res!495261 () Bool)

(assert (=> b!737236 (=> (not res!495261) (not e!412474))))

(assert (=> b!737236 (= res!495261 e!412467)))

(declare-fun c!81365 () Bool)

(assert (=> b!737236 (= c!81365 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65286 res!495268) b!737229))

(assert (= (and b!737229 res!495266) b!737219))

(assert (= (and b!737219 res!495263) b!737221))

(assert (= (and b!737221 res!495256) b!737214))

(assert (= (and b!737214 res!495260) b!737217))

(assert (= (and b!737217 res!495258) b!737225))

(assert (= (and b!737225 res!495270) b!737218))

(assert (= (and b!737218 res!495269) b!737228))

(assert (= (and b!737228 res!495267) b!737224))

(assert (= (and b!737224 res!495264) b!737216))

(assert (= (and b!737216 res!495262) b!737236))

(assert (= (and b!737236 c!81365) b!737233))

(assert (= (and b!737236 (not c!81365)) b!737222))

(assert (= (and b!737236 res!495261) b!737215))

(assert (= (and b!737215 res!495271) b!737234))

(assert (= (and b!737234 res!495259) b!737226))

(assert (= (and b!737226 res!495255) b!737232))

(assert (= (and b!737234 (not res!495265)) b!737223))

(assert (= (and b!737223 c!81363) b!737230))

(assert (= (and b!737223 (not c!81363)) b!737235))

(assert (= (and b!737223 (not res!495257)) b!737231))

(assert (= (and b!737231 c!81364) b!737213))

(assert (= (and b!737231 (not c!81364)) b!737220))

(assert (= (and b!737231 (not res!495254)) b!737227))

(declare-fun m!689751 () Bool)

(assert (=> b!737227 m!689751))

(declare-fun m!689753 () Bool)

(assert (=> b!737214 m!689753))

(declare-fun m!689755 () Bool)

(assert (=> b!737221 m!689755))

(declare-fun m!689757 () Bool)

(assert (=> b!737219 m!689757))

(assert (=> b!737219 m!689757))

(declare-fun m!689759 () Bool)

(assert (=> b!737219 m!689759))

(assert (=> b!737213 m!689757))

(assert (=> b!737213 m!689757))

(declare-fun m!689761 () Bool)

(assert (=> b!737213 m!689761))

(declare-fun m!689763 () Bool)

(assert (=> b!737225 m!689763))

(assert (=> b!737220 m!689757))

(assert (=> b!737220 m!689757))

(declare-fun m!689765 () Bool)

(assert (=> b!737220 m!689765))

(assert (=> b!737235 m!689757))

(assert (=> b!737235 m!689757))

(declare-fun m!689767 () Bool)

(assert (=> b!737235 m!689767))

(assert (=> b!737235 m!689757))

(assert (=> b!737235 m!689765))

(declare-fun m!689769 () Bool)

(assert (=> b!737217 m!689769))

(declare-fun m!689771 () Bool)

(assert (=> b!737215 m!689771))

(declare-fun m!689773 () Bool)

(assert (=> b!737215 m!689773))

(assert (=> b!737215 m!689771))

(declare-fun m!689775 () Bool)

(assert (=> b!737215 m!689775))

(declare-fun m!689777 () Bool)

(assert (=> b!737215 m!689777))

(declare-fun m!689779 () Bool)

(assert (=> b!737215 m!689779))

(assert (=> b!737230 m!689757))

(assert (=> b!737230 m!689757))

(assert (=> b!737230 m!689761))

(declare-fun m!689781 () Bool)

(assert (=> b!737216 m!689781))

(assert (=> b!737226 m!689757))

(assert (=> b!737226 m!689757))

(declare-fun m!689783 () Bool)

(assert (=> b!737226 m!689783))

(declare-fun m!689785 () Bool)

(assert (=> b!737234 m!689785))

(declare-fun m!689787 () Bool)

(assert (=> b!737234 m!689787))

(assert (=> b!737224 m!689757))

(assert (=> b!737224 m!689757))

(declare-fun m!689789 () Bool)

(assert (=> b!737224 m!689789))

(assert (=> b!737224 m!689789))

(assert (=> b!737224 m!689757))

(declare-fun m!689791 () Bool)

(assert (=> b!737224 m!689791))

(declare-fun m!689793 () Bool)

(assert (=> start!65286 m!689793))

(declare-fun m!689795 () Bool)

(assert (=> start!65286 m!689795))

(declare-fun m!689797 () Bool)

(assert (=> b!737223 m!689797))

(declare-fun m!689799 () Bool)

(assert (=> b!737218 m!689799))

(assert (=> b!737232 m!689757))

(assert (=> b!737232 m!689757))

(declare-fun m!689801 () Bool)

(assert (=> b!737232 m!689801))

(assert (=> b!737233 m!689757))

(assert (=> b!737233 m!689757))

(declare-fun m!689803 () Bool)

(assert (=> b!737233 m!689803))

(assert (=> b!737222 m!689757))

(assert (=> b!737222 m!689757))

(assert (=> b!737222 m!689767))

(check-sat (not b!737214) (not b!737224) (not b!737225) (not b!737233) (not b!737221) (not b!737223) (not b!737217) (not b!737234) (not b!737235) (not b!737220) (not b!737226) (not b!737215) (not b!737213) (not b!737222) (not b!737218) (not start!65286) (not b!737230) (not b!737227) (not b!737219) (not b!737232))
(check-sat)
