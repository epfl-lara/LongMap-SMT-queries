; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65546 () Bool)

(assert start!65546)

(declare-fun b!748805 () Bool)

(declare-fun res!505268 () Bool)

(declare-fun e!417856 () Bool)

(assert (=> b!748805 (=> (not res!505268) (not e!417856))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41736 0))(
  ( (array!41737 (arr!19982 (Array (_ BitVec 32) (_ BitVec 64))) (size!20403 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41736)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!748805 (= res!505268 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19982 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!748806 () Bool)

(declare-fun res!505257 () Bool)

(declare-fun e!417859 () Bool)

(assert (=> b!748806 (=> (not res!505257) (not e!417859))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!748806 (= res!505257 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20403 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20403 a!3186))))))

(declare-fun b!748807 () Bool)

(declare-fun res!505258 () Bool)

(declare-fun e!417851 () Bool)

(assert (=> b!748807 (=> (not res!505258) (not e!417851))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!748807 (= res!505258 (validKeyInArray!0 (select (arr!19982 a!3186) j!159)))))

(declare-fun b!748808 () Bool)

(declare-fun res!505263 () Bool)

(assert (=> b!748808 (=> (not res!505263) (not e!417859))))

(declare-datatypes ((List!14023 0))(
  ( (Nil!14020) (Cons!14019 (h!15091 (_ BitVec 64)) (t!20329 List!14023)) )
))
(declare-fun arrayNoDuplicates!0 (array!41736 (_ BitVec 32) List!14023) Bool)

(assert (=> b!748808 (= res!505263 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14020))))

(declare-fun e!417854 () Bool)

(declare-fun b!748809 () Bool)

(declare-datatypes ((SeekEntryResult!7579 0))(
  ( (MissingZero!7579 (index!32684 (_ BitVec 32))) (Found!7579 (index!32685 (_ BitVec 32))) (Intermediate!7579 (undefined!8391 Bool) (index!32686 (_ BitVec 32)) (x!63628 (_ BitVec 32))) (Undefined!7579) (MissingVacant!7579 (index!32687 (_ BitVec 32))) )
))
(declare-fun lt!332761 () SeekEntryResult!7579)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41736 (_ BitVec 32)) SeekEntryResult!7579)

(assert (=> b!748809 (= e!417854 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19982 a!3186) j!159) a!3186 mask!3328) lt!332761))))

(declare-fun b!748810 () Bool)

(declare-datatypes ((Unit!25676 0))(
  ( (Unit!25677) )
))
(declare-fun e!417858 () Unit!25676)

(declare-fun Unit!25678 () Unit!25676)

(assert (=> b!748810 (= e!417858 Unit!25678)))

(declare-fun b!748811 () Bool)

(assert (=> b!748811 (= e!417859 e!417856)))

(declare-fun res!505264 () Bool)

(assert (=> b!748811 (=> (not res!505264) (not e!417856))))

(declare-fun lt!332759 () SeekEntryResult!7579)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41736 (_ BitVec 32)) SeekEntryResult!7579)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!748811 (= res!505264 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19982 a!3186) j!159) mask!3328) (select (arr!19982 a!3186) j!159) a!3186 mask!3328) lt!332759))))

(assert (=> b!748811 (= lt!332759 (Intermediate!7579 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!748812 () Bool)

(declare-fun res!505265 () Bool)

(assert (=> b!748812 (=> (not res!505265) (not e!417851))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41736 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!748812 (= res!505265 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!748813 () Bool)

(declare-fun res!505262 () Bool)

(assert (=> b!748813 (=> (not res!505262) (not e!417851))))

(assert (=> b!748813 (= res!505262 (and (= (size!20403 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20403 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20403 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!505254 () Bool)

(assert (=> start!65546 (=> (not res!505254) (not e!417851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65546 (= res!505254 (validMask!0 mask!3328))))

(assert (=> start!65546 e!417851))

(assert (=> start!65546 true))

(declare-fun array_inv!15865 (array!41736) Bool)

(assert (=> start!65546 (array_inv!15865 a!3186)))

(declare-fun b!748814 () Bool)

(declare-fun res!505253 () Bool)

(assert (=> b!748814 (=> (not res!505253) (not e!417859))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41736 (_ BitVec 32)) Bool)

(assert (=> b!748814 (= res!505253 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!748815 () Bool)

(declare-fun e!417857 () Bool)

(assert (=> b!748815 (= e!417856 e!417857)))

(declare-fun res!505269 () Bool)

(assert (=> b!748815 (=> (not res!505269) (not e!417857))))

(declare-fun lt!332760 () SeekEntryResult!7579)

(declare-fun lt!332758 () SeekEntryResult!7579)

(assert (=> b!748815 (= res!505269 (= lt!332760 lt!332758))))

(declare-fun lt!332765 () (_ BitVec 64))

(declare-fun lt!332762 () array!41736)

(assert (=> b!748815 (= lt!332758 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!332765 lt!332762 mask!3328))))

(assert (=> b!748815 (= lt!332760 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!332765 mask!3328) lt!332765 lt!332762 mask!3328))))

(assert (=> b!748815 (= lt!332765 (select (store (arr!19982 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!748815 (= lt!332762 (array!41737 (store (arr!19982 a!3186) i!1173 k0!2102) (size!20403 a!3186)))))

(declare-fun b!748816 () Bool)

(declare-fun e!417853 () Bool)

(assert (=> b!748816 (= e!417853 (validKeyInArray!0 lt!332765))))

(declare-fun b!748817 () Bool)

(declare-fun res!505266 () Bool)

(assert (=> b!748817 (=> (not res!505266) (not e!417856))))

(declare-fun e!417855 () Bool)

(assert (=> b!748817 (= res!505266 e!417855)))

(declare-fun c!82158 () Bool)

(assert (=> b!748817 (= c!82158 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!748818 () Bool)

(declare-fun Unit!25679 () Unit!25676)

(assert (=> b!748818 (= e!417858 Unit!25679)))

(assert (=> b!748818 false))

(declare-fun b!748819 () Bool)

(declare-fun res!505267 () Bool)

(declare-fun e!417850 () Bool)

(assert (=> b!748819 (=> res!505267 e!417850)))

(assert (=> b!748819 (= res!505267 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19982 a!3186) j!159) a!3186 mask!3328) lt!332761)))))

(declare-fun b!748820 () Bool)

(assert (=> b!748820 (= e!417855 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19982 a!3186) j!159) a!3186 mask!3328) lt!332759))))

(declare-fun b!748821 () Bool)

(declare-fun res!505256 () Bool)

(assert (=> b!748821 (=> (not res!505256) (not e!417851))))

(assert (=> b!748821 (= res!505256 (validKeyInArray!0 k0!2102))))

(declare-fun b!748822 () Bool)

(assert (=> b!748822 (= e!417851 e!417859)))

(declare-fun res!505252 () Bool)

(assert (=> b!748822 (=> (not res!505252) (not e!417859))))

(declare-fun lt!332763 () SeekEntryResult!7579)

(assert (=> b!748822 (= res!505252 (or (= lt!332763 (MissingZero!7579 i!1173)) (= lt!332763 (MissingVacant!7579 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41736 (_ BitVec 32)) SeekEntryResult!7579)

(assert (=> b!748822 (= lt!332763 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!748823 () Bool)

(assert (=> b!748823 (= e!417857 (not e!417850))))

(declare-fun res!505261 () Bool)

(assert (=> b!748823 (=> res!505261 e!417850)))

(get-info :version)

(assert (=> b!748823 (= res!505261 (or (not ((_ is Intermediate!7579) lt!332758)) (bvslt x!1131 (x!63628 lt!332758)) (not (= x!1131 (x!63628 lt!332758))) (not (= index!1321 (index!32686 lt!332758)))))))

(assert (=> b!748823 e!417854))

(declare-fun res!505260 () Bool)

(assert (=> b!748823 (=> (not res!505260) (not e!417854))))

(declare-fun lt!332756 () SeekEntryResult!7579)

(assert (=> b!748823 (= res!505260 (= lt!332756 lt!332761))))

(assert (=> b!748823 (= lt!332761 (Found!7579 j!159))))

(assert (=> b!748823 (= lt!332756 (seekEntryOrOpen!0 (select (arr!19982 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!748823 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!332757 () Unit!25676)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41736 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25676)

(assert (=> b!748823 (= lt!332757 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!748824 () Bool)

(declare-fun res!505259 () Bool)

(assert (=> b!748824 (=> res!505259 e!417850)))

(assert (=> b!748824 (= res!505259 (= (select (store (arr!19982 a!3186) i!1173 k0!2102) index!1321) lt!332765))))

(declare-fun b!748825 () Bool)

(assert (=> b!748825 (= e!417855 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19982 a!3186) j!159) a!3186 mask!3328) (Found!7579 j!159)))))

(declare-fun b!748826 () Bool)

(assert (=> b!748826 (= e!417850 e!417853)))

(declare-fun res!505255 () Bool)

(assert (=> b!748826 (=> res!505255 e!417853)))

(assert (=> b!748826 (= res!505255 (or (bvslt mask!3328 #b00000000000000000000000000000000) (bvsge index!1321 (bvadd #b00000000000000000000000000000001 mask!3328))))))

(assert (=> b!748826 (= (select (store (arr!19982 a!3186) i!1173 k0!2102) index!1321) #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!332764 () Unit!25676)

(assert (=> b!748826 (= lt!332764 e!417858)))

(declare-fun c!82157 () Bool)

(assert (=> b!748826 (= c!82157 (= (select (store (arr!19982 a!3186) i!1173 k0!2102) index!1321) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!65546 res!505254) b!748813))

(assert (= (and b!748813 res!505262) b!748807))

(assert (= (and b!748807 res!505258) b!748821))

(assert (= (and b!748821 res!505256) b!748812))

(assert (= (and b!748812 res!505265) b!748822))

(assert (= (and b!748822 res!505252) b!748814))

(assert (= (and b!748814 res!505253) b!748808))

(assert (= (and b!748808 res!505263) b!748806))

(assert (= (and b!748806 res!505257) b!748811))

(assert (= (and b!748811 res!505264) b!748805))

(assert (= (and b!748805 res!505268) b!748817))

(assert (= (and b!748817 c!82158) b!748820))

(assert (= (and b!748817 (not c!82158)) b!748825))

(assert (= (and b!748817 res!505266) b!748815))

(assert (= (and b!748815 res!505269) b!748823))

(assert (= (and b!748823 res!505260) b!748809))

(assert (= (and b!748823 (not res!505261)) b!748819))

(assert (= (and b!748819 (not res!505267)) b!748824))

(assert (= (and b!748824 (not res!505259)) b!748826))

(assert (= (and b!748826 c!82157) b!748818))

(assert (= (and b!748826 (not c!82157)) b!748810))

(assert (= (and b!748826 (not res!505255)) b!748816))

(declare-fun m!697991 () Bool)

(assert (=> b!748814 m!697991))

(declare-fun m!697993 () Bool)

(assert (=> b!748823 m!697993))

(assert (=> b!748823 m!697993))

(declare-fun m!697995 () Bool)

(assert (=> b!748823 m!697995))

(declare-fun m!697997 () Bool)

(assert (=> b!748823 m!697997))

(declare-fun m!697999 () Bool)

(assert (=> b!748823 m!697999))

(declare-fun m!698001 () Bool)

(assert (=> b!748805 m!698001))

(assert (=> b!748809 m!697993))

(assert (=> b!748809 m!697993))

(declare-fun m!698003 () Bool)

(assert (=> b!748809 m!698003))

(declare-fun m!698005 () Bool)

(assert (=> b!748826 m!698005))

(declare-fun m!698007 () Bool)

(assert (=> b!748826 m!698007))

(assert (=> b!748825 m!697993))

(assert (=> b!748825 m!697993))

(declare-fun m!698009 () Bool)

(assert (=> b!748825 m!698009))

(assert (=> b!748811 m!697993))

(assert (=> b!748811 m!697993))

(declare-fun m!698011 () Bool)

(assert (=> b!748811 m!698011))

(assert (=> b!748811 m!698011))

(assert (=> b!748811 m!697993))

(declare-fun m!698013 () Bool)

(assert (=> b!748811 m!698013))

(declare-fun m!698015 () Bool)

(assert (=> start!65546 m!698015))

(declare-fun m!698017 () Bool)

(assert (=> start!65546 m!698017))

(assert (=> b!748807 m!697993))

(assert (=> b!748807 m!697993))

(declare-fun m!698019 () Bool)

(assert (=> b!748807 m!698019))

(declare-fun m!698021 () Bool)

(assert (=> b!748821 m!698021))

(assert (=> b!748824 m!698005))

(assert (=> b!748824 m!698007))

(declare-fun m!698023 () Bool)

(assert (=> b!748822 m!698023))

(declare-fun m!698025 () Bool)

(assert (=> b!748812 m!698025))

(assert (=> b!748819 m!697993))

(assert (=> b!748819 m!697993))

(assert (=> b!748819 m!698009))

(declare-fun m!698027 () Bool)

(assert (=> b!748815 m!698027))

(declare-fun m!698029 () Bool)

(assert (=> b!748815 m!698029))

(assert (=> b!748815 m!698027))

(declare-fun m!698031 () Bool)

(assert (=> b!748815 m!698031))

(assert (=> b!748815 m!698005))

(declare-fun m!698033 () Bool)

(assert (=> b!748815 m!698033))

(assert (=> b!748820 m!697993))

(assert (=> b!748820 m!697993))

(declare-fun m!698035 () Bool)

(assert (=> b!748820 m!698035))

(declare-fun m!698037 () Bool)

(assert (=> b!748808 m!698037))

(declare-fun m!698039 () Bool)

(assert (=> b!748816 m!698039))

(check-sat (not b!748814) (not b!748809) (not b!748822) (not start!65546) (not b!748819) (not b!748825) (not b!748808) (not b!748812) (not b!748823) (not b!748815) (not b!748821) (not b!748820) (not b!748807) (not b!748811) (not b!748816))
(check-sat)
