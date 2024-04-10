; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120434 () Bool)

(assert start!120434)

(declare-fun b!1402169 () Bool)

(declare-fun e!793999 () Bool)

(assert (=> b!1402169 (= e!793999 true)))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10589 0))(
  ( (MissingZero!10589 (index!44733 (_ BitVec 32))) (Found!10589 (index!44734 (_ BitVec 32))) (Intermediate!10589 (undefined!11401 Bool) (index!44735 (_ BitVec 32)) (x!126360 (_ BitVec 32))) (Undefined!10589) (MissingVacant!10589 (index!44736 (_ BitVec 32))) )
))
(declare-fun lt!617467 () SeekEntryResult!10589)

(declare-datatypes ((array!95843 0))(
  ( (array!95844 (arr!46272 (Array (_ BitVec 32) (_ BitVec 64))) (size!46822 (_ BitVec 32))) )
))
(declare-fun lt!617465 () array!95843)

(declare-fun lt!617462 () (_ BitVec 64))

(declare-fun lt!617468 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95843 (_ BitVec 32)) SeekEntryResult!10589)

(assert (=> b!1402169 (= lt!617467 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617468 lt!617462 lt!617465 mask!2840))))

(declare-fun b!1402170 () Bool)

(declare-fun e!793997 () Bool)

(declare-fun e!794001 () Bool)

(assert (=> b!1402170 (= e!793997 (not e!794001))))

(declare-fun res!940685 () Bool)

(assert (=> b!1402170 (=> res!940685 e!794001)))

(declare-fun lt!617466 () SeekEntryResult!10589)

(get-info :version)

(assert (=> b!1402170 (= res!940685 (or (not ((_ is Intermediate!10589) lt!617466)) (undefined!11401 lt!617466)))))

(declare-fun e!794002 () Bool)

(assert (=> b!1402170 e!794002))

(declare-fun res!940683 () Bool)

(assert (=> b!1402170 (=> (not res!940683) (not e!794002))))

(declare-fun a!2901 () array!95843)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95843 (_ BitVec 32)) Bool)

(assert (=> b!1402170 (= res!940683 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47182 0))(
  ( (Unit!47183) )
))
(declare-fun lt!617464 () Unit!47182)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47182)

(assert (=> b!1402170 (= lt!617464 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402170 (= lt!617466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617468 (select (arr!46272 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402170 (= lt!617468 (toIndex!0 (select (arr!46272 a!2901) j!112) mask!2840))))

(declare-fun b!1402171 () Bool)

(declare-fun res!940689 () Bool)

(assert (=> b!1402171 (=> (not res!940689) (not e!793997))))

(declare-datatypes ((List!32791 0))(
  ( (Nil!32788) (Cons!32787 (h!34035 (_ BitVec 64)) (t!47485 List!32791)) )
))
(declare-fun arrayNoDuplicates!0 (array!95843 (_ BitVec 32) List!32791) Bool)

(assert (=> b!1402171 (= res!940689 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32788))))

(declare-fun res!940682 () Bool)

(assert (=> start!120434 (=> (not res!940682) (not e!793997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120434 (= res!940682 (validMask!0 mask!2840))))

(assert (=> start!120434 e!793997))

(assert (=> start!120434 true))

(declare-fun array_inv!35300 (array!95843) Bool)

(assert (=> start!120434 (array_inv!35300 a!2901)))

(declare-fun b!1402172 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95843 (_ BitVec 32)) SeekEntryResult!10589)

(assert (=> b!1402172 (= e!794002 (= (seekEntryOrOpen!0 (select (arr!46272 a!2901) j!112) a!2901 mask!2840) (Found!10589 j!112)))))

(declare-fun b!1402173 () Bool)

(declare-fun res!940687 () Bool)

(assert (=> b!1402173 (=> (not res!940687) (not e!793997))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402173 (= res!940687 (validKeyInArray!0 (select (arr!46272 a!2901) i!1037)))))

(declare-fun b!1402174 () Bool)

(declare-fun res!940686 () Bool)

(assert (=> b!1402174 (=> (not res!940686) (not e!793997))))

(assert (=> b!1402174 (= res!940686 (and (= (size!46822 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46822 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46822 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402175 () Bool)

(declare-fun res!940688 () Bool)

(assert (=> b!1402175 (=> (not res!940688) (not e!793997))))

(assert (=> b!1402175 (= res!940688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402176 () Bool)

(declare-fun e!794003 () Bool)

(assert (=> b!1402176 (= e!794001 e!794003)))

(declare-fun res!940681 () Bool)

(assert (=> b!1402176 (=> res!940681 e!794003)))

(declare-fun lt!617463 () SeekEntryResult!10589)

(assert (=> b!1402176 (= res!940681 (or (= lt!617466 lt!617463) (not ((_ is Intermediate!10589) lt!617463))))))

(assert (=> b!1402176 (= lt!617463 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617462 mask!2840) lt!617462 lt!617465 mask!2840))))

(assert (=> b!1402176 (= lt!617462 (select (store (arr!46272 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402176 (= lt!617465 (array!95844 (store (arr!46272 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46822 a!2901)))))

(declare-fun b!1402177 () Bool)

(declare-fun res!940680 () Bool)

(assert (=> b!1402177 (=> (not res!940680) (not e!793997))))

(assert (=> b!1402177 (= res!940680 (validKeyInArray!0 (select (arr!46272 a!2901) j!112)))))

(declare-fun b!1402178 () Bool)

(declare-fun e!793998 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95843 (_ BitVec 32)) SeekEntryResult!10589)

(assert (=> b!1402178 (= e!793998 (= (seekEntryOrOpen!0 lt!617462 lt!617465 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126360 lt!617463) (index!44735 lt!617463) (index!44735 lt!617463) (select (arr!46272 a!2901) j!112) lt!617465 mask!2840)))))

(declare-fun b!1402179 () Bool)

(assert (=> b!1402179 (= e!794003 e!793999)))

(declare-fun res!940690 () Bool)

(assert (=> b!1402179 (=> res!940690 e!793999)))

(assert (=> b!1402179 (= res!940690 (or (bvslt (x!126360 lt!617466) #b00000000000000000000000000000000) (bvsgt (x!126360 lt!617466) #b01111111111111111111111111111110) (bvslt (x!126360 lt!617463) #b00000000000000000000000000000000) (bvsgt (x!126360 lt!617463) #b01111111111111111111111111111110) (bvslt lt!617468 #b00000000000000000000000000000000) (bvsge lt!617468 (size!46822 a!2901)) (bvslt (index!44735 lt!617466) #b00000000000000000000000000000000) (bvsge (index!44735 lt!617466) (size!46822 a!2901)) (bvslt (index!44735 lt!617463) #b00000000000000000000000000000000) (bvsge (index!44735 lt!617463) (size!46822 a!2901)) (not (= lt!617466 (Intermediate!10589 false (index!44735 lt!617466) (x!126360 lt!617466)))) (not (= lt!617463 (Intermediate!10589 false (index!44735 lt!617463) (x!126360 lt!617463))))))))

(assert (=> b!1402179 e!793998))

(declare-fun res!940684 () Bool)

(assert (=> b!1402179 (=> (not res!940684) (not e!793998))))

(assert (=> b!1402179 (= res!940684 (and (not (undefined!11401 lt!617463)) (= (index!44735 lt!617463) i!1037) (bvslt (x!126360 lt!617463) (x!126360 lt!617466)) (= (select (store (arr!46272 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44735 lt!617463)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617469 () Unit!47182)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95843 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47182)

(assert (=> b!1402179 (= lt!617469 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617468 (x!126360 lt!617466) (index!44735 lt!617466) (x!126360 lt!617463) (index!44735 lt!617463) (undefined!11401 lt!617463) mask!2840))))

(assert (= (and start!120434 res!940682) b!1402174))

(assert (= (and b!1402174 res!940686) b!1402173))

(assert (= (and b!1402173 res!940687) b!1402177))

(assert (= (and b!1402177 res!940680) b!1402175))

(assert (= (and b!1402175 res!940688) b!1402171))

(assert (= (and b!1402171 res!940689) b!1402170))

(assert (= (and b!1402170 res!940683) b!1402172))

(assert (= (and b!1402170 (not res!940685)) b!1402176))

(assert (= (and b!1402176 (not res!940681)) b!1402179))

(assert (= (and b!1402179 res!940684) b!1402178))

(assert (= (and b!1402179 (not res!940690)) b!1402169))

(declare-fun m!1290197 () Bool)

(assert (=> b!1402173 m!1290197))

(assert (=> b!1402173 m!1290197))

(declare-fun m!1290199 () Bool)

(assert (=> b!1402173 m!1290199))

(declare-fun m!1290201 () Bool)

(assert (=> b!1402177 m!1290201))

(assert (=> b!1402177 m!1290201))

(declare-fun m!1290203 () Bool)

(assert (=> b!1402177 m!1290203))

(assert (=> b!1402172 m!1290201))

(assert (=> b!1402172 m!1290201))

(declare-fun m!1290205 () Bool)

(assert (=> b!1402172 m!1290205))

(declare-fun m!1290207 () Bool)

(assert (=> b!1402178 m!1290207))

(assert (=> b!1402178 m!1290201))

(assert (=> b!1402178 m!1290201))

(declare-fun m!1290209 () Bool)

(assert (=> b!1402178 m!1290209))

(assert (=> b!1402170 m!1290201))

(declare-fun m!1290211 () Bool)

(assert (=> b!1402170 m!1290211))

(assert (=> b!1402170 m!1290201))

(declare-fun m!1290213 () Bool)

(assert (=> b!1402170 m!1290213))

(assert (=> b!1402170 m!1290201))

(declare-fun m!1290215 () Bool)

(assert (=> b!1402170 m!1290215))

(declare-fun m!1290217 () Bool)

(assert (=> b!1402170 m!1290217))

(declare-fun m!1290219 () Bool)

(assert (=> b!1402175 m!1290219))

(declare-fun m!1290221 () Bool)

(assert (=> b!1402169 m!1290221))

(declare-fun m!1290223 () Bool)

(assert (=> b!1402176 m!1290223))

(assert (=> b!1402176 m!1290223))

(declare-fun m!1290225 () Bool)

(assert (=> b!1402176 m!1290225))

(declare-fun m!1290227 () Bool)

(assert (=> b!1402176 m!1290227))

(declare-fun m!1290229 () Bool)

(assert (=> b!1402176 m!1290229))

(declare-fun m!1290231 () Bool)

(assert (=> b!1402171 m!1290231))

(assert (=> b!1402179 m!1290227))

(declare-fun m!1290233 () Bool)

(assert (=> b!1402179 m!1290233))

(declare-fun m!1290235 () Bool)

(assert (=> b!1402179 m!1290235))

(declare-fun m!1290237 () Bool)

(assert (=> start!120434 m!1290237))

(declare-fun m!1290239 () Bool)

(assert (=> start!120434 m!1290239))

(check-sat (not b!1402177) (not b!1402169) (not b!1402172) (not start!120434) (not b!1402175) (not b!1402170) (not b!1402171) (not b!1402173) (not b!1402178) (not b!1402179) (not b!1402176))
(check-sat)
