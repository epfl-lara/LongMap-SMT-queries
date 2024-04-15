; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67706 () Bool)

(assert start!67706)

(declare-fun b!785578 () Bool)

(declare-fun e!436714 () Bool)

(declare-datatypes ((SeekEntryResult!8068 0))(
  ( (MissingZero!8068 (index!34640 (_ BitVec 32))) (Found!8068 (index!34641 (_ BitVec 32))) (Intermediate!8068 (undefined!8880 Bool) (index!34642 (_ BitVec 32)) (x!65595 (_ BitVec 32))) (Undefined!8068) (MissingVacant!8068 (index!34643 (_ BitVec 32))) )
))
(declare-fun lt!350170 () SeekEntryResult!8068)

(declare-fun lt!350177 () SeekEntryResult!8068)

(assert (=> b!785578 (= e!436714 (= lt!350170 lt!350177))))

(declare-fun b!785579 () Bool)

(declare-datatypes ((Unit!27140 0))(
  ( (Unit!27141) )
))
(declare-fun e!436705 () Unit!27140)

(declare-fun Unit!27142 () Unit!27140)

(assert (=> b!785579 (= e!436705 Unit!27142)))

(declare-fun b!785580 () Bool)

(declare-fun res!531888 () Bool)

(declare-fun e!436708 () Bool)

(assert (=> b!785580 (=> (not res!531888) (not e!436708))))

(declare-datatypes ((array!42765 0))(
  ( (array!42766 (arr!20471 (Array (_ BitVec 32) (_ BitVec 64))) (size!20892 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42765)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!785580 (= res!531888 (and (= (size!20892 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20892 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20892 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785581 () Bool)

(declare-fun res!531890 () Bool)

(declare-fun e!436709 () Bool)

(assert (=> b!785581 (=> (not res!531890) (not e!436709))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!785581 (= res!531890 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20471 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785582 () Bool)

(declare-fun res!531883 () Bool)

(assert (=> b!785582 (=> (not res!531883) (not e!436708))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785582 (= res!531883 (validKeyInArray!0 (select (arr!20471 a!3186) j!159)))))

(declare-fun e!436713 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!785583 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42765 (_ BitVec 32)) SeekEntryResult!8068)

(assert (=> b!785583 (= e!436713 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20471 a!3186) j!159) a!3186 mask!3328) (Found!8068 j!159)))))

(declare-fun b!785584 () Bool)

(declare-fun res!531878 () Bool)

(assert (=> b!785584 (=> (not res!531878) (not e!436709))))

(assert (=> b!785584 (= res!531878 e!436713)))

(declare-fun c!87261 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785584 (= c!87261 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785586 () Bool)

(declare-fun e!436712 () Bool)

(declare-fun e!436711 () Bool)

(assert (=> b!785586 (= e!436712 (not e!436711))))

(declare-fun res!531882 () Bool)

(assert (=> b!785586 (=> res!531882 e!436711)))

(declare-fun lt!350169 () SeekEntryResult!8068)

(get-info :version)

(assert (=> b!785586 (= res!531882 (or (not ((_ is Intermediate!8068) lt!350169)) (bvslt x!1131 (x!65595 lt!350169)) (not (= x!1131 (x!65595 lt!350169))) (not (= index!1321 (index!34642 lt!350169)))))))

(declare-fun e!436710 () Bool)

(assert (=> b!785586 e!436710))

(declare-fun res!531879 () Bool)

(assert (=> b!785586 (=> (not res!531879) (not e!436710))))

(declare-fun lt!350175 () SeekEntryResult!8068)

(assert (=> b!785586 (= res!531879 (= lt!350170 lt!350175))))

(assert (=> b!785586 (= lt!350175 (Found!8068 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42765 (_ BitVec 32)) SeekEntryResult!8068)

(assert (=> b!785586 (= lt!350170 (seekEntryOrOpen!0 (select (arr!20471 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42765 (_ BitVec 32)) Bool)

(assert (=> b!785586 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350171 () Unit!27140)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42765 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27140)

(assert (=> b!785586 (= lt!350171 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785587 () Bool)

(declare-fun e!436704 () Bool)

(assert (=> b!785587 (= e!436704 e!436709)))

(declare-fun res!531877 () Bool)

(assert (=> b!785587 (=> (not res!531877) (not e!436709))))

(declare-fun lt!350172 () SeekEntryResult!8068)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42765 (_ BitVec 32)) SeekEntryResult!8068)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785587 (= res!531877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20471 a!3186) j!159) mask!3328) (select (arr!20471 a!3186) j!159) a!3186 mask!3328) lt!350172))))

(assert (=> b!785587 (= lt!350172 (Intermediate!8068 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785588 () Bool)

(declare-fun res!531881 () Bool)

(assert (=> b!785588 (=> (not res!531881) (not e!436708))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!785588 (= res!531881 (validKeyInArray!0 k0!2102))))

(declare-fun b!785589 () Bool)

(assert (=> b!785589 (= e!436713 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20471 a!3186) j!159) a!3186 mask!3328) lt!350172))))

(declare-fun b!785590 () Bool)

(declare-fun e!436703 () Bool)

(assert (=> b!785590 (= e!436703 true)))

(assert (=> b!785590 e!436714))

(declare-fun res!531873 () Bool)

(assert (=> b!785590 (=> (not res!531873) (not e!436714))))

(declare-fun lt!350173 () (_ BitVec 64))

(assert (=> b!785590 (= res!531873 (= lt!350173 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350176 () Unit!27140)

(assert (=> b!785590 (= lt!350176 e!436705)))

(declare-fun c!87260 () Bool)

(assert (=> b!785590 (= c!87260 (= lt!350173 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785591 () Bool)

(declare-fun e!436706 () Bool)

(assert (=> b!785591 (= e!436706 e!436703)))

(declare-fun res!531891 () Bool)

(assert (=> b!785591 (=> res!531891 e!436703)))

(declare-fun lt!350178 () (_ BitVec 64))

(assert (=> b!785591 (= res!531891 (= lt!350173 lt!350178))))

(assert (=> b!785591 (= lt!350173 (select (store (arr!20471 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!785592 () Bool)

(declare-fun res!531876 () Bool)

(assert (=> b!785592 (=> (not res!531876) (not e!436708))))

(declare-fun arrayContainsKey!0 (array!42765 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785592 (= res!531876 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785593 () Bool)

(assert (=> b!785593 (= e!436709 e!436712)))

(declare-fun res!531884 () Bool)

(assert (=> b!785593 (=> (not res!531884) (not e!436712))))

(declare-fun lt!350179 () SeekEntryResult!8068)

(assert (=> b!785593 (= res!531884 (= lt!350179 lt!350169))))

(declare-fun lt!350174 () array!42765)

(assert (=> b!785593 (= lt!350169 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350178 lt!350174 mask!3328))))

(assert (=> b!785593 (= lt!350179 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350178 mask!3328) lt!350178 lt!350174 mask!3328))))

(assert (=> b!785593 (= lt!350178 (select (store (arr!20471 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!785593 (= lt!350174 (array!42766 (store (arr!20471 a!3186) i!1173 k0!2102) (size!20892 a!3186)))))

(declare-fun b!785594 () Bool)

(declare-fun res!531889 () Bool)

(assert (=> b!785594 (=> (not res!531889) (not e!436704))))

(assert (=> b!785594 (= res!531889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785595 () Bool)

(declare-fun res!531887 () Bool)

(assert (=> b!785595 (=> (not res!531887) (not e!436704))))

(declare-datatypes ((List!14512 0))(
  ( (Nil!14509) (Cons!14508 (h!15631 (_ BitVec 64)) (t!20818 List!14512)) )
))
(declare-fun arrayNoDuplicates!0 (array!42765 (_ BitVec 32) List!14512) Bool)

(assert (=> b!785595 (= res!531887 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14509))))

(declare-fun b!785596 () Bool)

(declare-fun res!531874 () Bool)

(assert (=> b!785596 (=> (not res!531874) (not e!436714))))

(assert (=> b!785596 (= res!531874 (= (seekEntryOrOpen!0 lt!350178 lt!350174 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350178 lt!350174 mask!3328)))))

(declare-fun b!785597 () Bool)

(declare-fun Unit!27143 () Unit!27140)

(assert (=> b!785597 (= e!436705 Unit!27143)))

(assert (=> b!785597 false))

(declare-fun b!785598 () Bool)

(assert (=> b!785598 (= e!436711 e!436706)))

(declare-fun res!531885 () Bool)

(assert (=> b!785598 (=> res!531885 e!436706)))

(assert (=> b!785598 (= res!531885 (not (= lt!350177 lt!350175)))))

(assert (=> b!785598 (= lt!350177 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20471 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785599 () Bool)

(assert (=> b!785599 (= e!436710 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20471 a!3186) j!159) a!3186 mask!3328) lt!350175))))

(declare-fun b!785600 () Bool)

(declare-fun res!531886 () Bool)

(assert (=> b!785600 (=> (not res!531886) (not e!436704))))

(assert (=> b!785600 (= res!531886 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20892 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20892 a!3186))))))

(declare-fun b!785585 () Bool)

(assert (=> b!785585 (= e!436708 e!436704)))

(declare-fun res!531880 () Bool)

(assert (=> b!785585 (=> (not res!531880) (not e!436704))))

(declare-fun lt!350180 () SeekEntryResult!8068)

(assert (=> b!785585 (= res!531880 (or (= lt!350180 (MissingZero!8068 i!1173)) (= lt!350180 (MissingVacant!8068 i!1173))))))

(assert (=> b!785585 (= lt!350180 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!531875 () Bool)

(assert (=> start!67706 (=> (not res!531875) (not e!436708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67706 (= res!531875 (validMask!0 mask!3328))))

(assert (=> start!67706 e!436708))

(assert (=> start!67706 true))

(declare-fun array_inv!16354 (array!42765) Bool)

(assert (=> start!67706 (array_inv!16354 a!3186)))

(assert (= (and start!67706 res!531875) b!785580))

(assert (= (and b!785580 res!531888) b!785582))

(assert (= (and b!785582 res!531883) b!785588))

(assert (= (and b!785588 res!531881) b!785592))

(assert (= (and b!785592 res!531876) b!785585))

(assert (= (and b!785585 res!531880) b!785594))

(assert (= (and b!785594 res!531889) b!785595))

(assert (= (and b!785595 res!531887) b!785600))

(assert (= (and b!785600 res!531886) b!785587))

(assert (= (and b!785587 res!531877) b!785581))

(assert (= (and b!785581 res!531890) b!785584))

(assert (= (and b!785584 c!87261) b!785589))

(assert (= (and b!785584 (not c!87261)) b!785583))

(assert (= (and b!785584 res!531878) b!785593))

(assert (= (and b!785593 res!531884) b!785586))

(assert (= (and b!785586 res!531879) b!785599))

(assert (= (and b!785586 (not res!531882)) b!785598))

(assert (= (and b!785598 (not res!531885)) b!785591))

(assert (= (and b!785591 (not res!531891)) b!785590))

(assert (= (and b!785590 c!87260) b!785597))

(assert (= (and b!785590 (not c!87260)) b!785579))

(assert (= (and b!785590 res!531873) b!785596))

(assert (= (and b!785596 res!531874) b!785578))

(declare-fun m!727047 () Bool)

(assert (=> b!785587 m!727047))

(assert (=> b!785587 m!727047))

(declare-fun m!727049 () Bool)

(assert (=> b!785587 m!727049))

(assert (=> b!785587 m!727049))

(assert (=> b!785587 m!727047))

(declare-fun m!727051 () Bool)

(assert (=> b!785587 m!727051))

(declare-fun m!727053 () Bool)

(assert (=> b!785588 m!727053))

(declare-fun m!727055 () Bool)

(assert (=> b!785585 m!727055))

(declare-fun m!727057 () Bool)

(assert (=> b!785595 m!727057))

(assert (=> b!785583 m!727047))

(assert (=> b!785583 m!727047))

(declare-fun m!727059 () Bool)

(assert (=> b!785583 m!727059))

(declare-fun m!727061 () Bool)

(assert (=> b!785596 m!727061))

(declare-fun m!727063 () Bool)

(assert (=> b!785596 m!727063))

(declare-fun m!727065 () Bool)

(assert (=> b!785594 m!727065))

(declare-fun m!727067 () Bool)

(assert (=> b!785591 m!727067))

(declare-fun m!727069 () Bool)

(assert (=> b!785591 m!727069))

(declare-fun m!727071 () Bool)

(assert (=> b!785592 m!727071))

(assert (=> b!785582 m!727047))

(assert (=> b!785582 m!727047))

(declare-fun m!727073 () Bool)

(assert (=> b!785582 m!727073))

(declare-fun m!727075 () Bool)

(assert (=> start!67706 m!727075))

(declare-fun m!727077 () Bool)

(assert (=> start!67706 m!727077))

(declare-fun m!727079 () Bool)

(assert (=> b!785593 m!727079))

(declare-fun m!727081 () Bool)

(assert (=> b!785593 m!727081))

(assert (=> b!785593 m!727079))

(assert (=> b!785593 m!727067))

(declare-fun m!727083 () Bool)

(assert (=> b!785593 m!727083))

(declare-fun m!727085 () Bool)

(assert (=> b!785593 m!727085))

(declare-fun m!727087 () Bool)

(assert (=> b!785581 m!727087))

(assert (=> b!785598 m!727047))

(assert (=> b!785598 m!727047))

(assert (=> b!785598 m!727059))

(assert (=> b!785589 m!727047))

(assert (=> b!785589 m!727047))

(declare-fun m!727089 () Bool)

(assert (=> b!785589 m!727089))

(assert (=> b!785586 m!727047))

(assert (=> b!785586 m!727047))

(declare-fun m!727091 () Bool)

(assert (=> b!785586 m!727091))

(declare-fun m!727093 () Bool)

(assert (=> b!785586 m!727093))

(declare-fun m!727095 () Bool)

(assert (=> b!785586 m!727095))

(assert (=> b!785599 m!727047))

(assert (=> b!785599 m!727047))

(declare-fun m!727097 () Bool)

(assert (=> b!785599 m!727097))

(check-sat (not b!785586) (not b!785594) (not b!785593) (not b!785588) (not b!785595) (not b!785596) (not b!785585) (not b!785587) (not start!67706) (not b!785583) (not b!785589) (not b!785582) (not b!785592) (not b!785598) (not b!785599))
(check-sat)
