; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64742 () Bool)

(assert start!64742)

(declare-fun b!730800 () Bool)

(declare-fun e!408952 () Bool)

(declare-fun e!408948 () Bool)

(assert (=> b!730800 (= e!408952 e!408948)))

(declare-fun res!491069 () Bool)

(assert (=> b!730800 (=> (not res!491069) (not e!408948))))

(declare-datatypes ((SeekEntryResult!7315 0))(
  ( (MissingZero!7315 (index!31628 (_ BitVec 32))) (Found!7315 (index!31629 (_ BitVec 32))) (Intermediate!7315 (undefined!8127 Bool) (index!31630 (_ BitVec 32)) (x!62601 (_ BitVec 32))) (Undefined!7315) (MissingVacant!7315 (index!31631 (_ BitVec 32))) )
))
(declare-fun lt!323847 () SeekEntryResult!7315)

(declare-fun lt!323854 () SeekEntryResult!7315)

(assert (=> b!730800 (= res!491069 (= lt!323847 lt!323854))))

(declare-datatypes ((array!41191 0))(
  ( (array!41192 (arr!19715 (Array (_ BitVec 32) (_ BitVec 64))) (size!20136 (_ BitVec 32))) )
))
(declare-fun lt!323849 () array!41191)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!323852 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41191 (_ BitVec 32)) SeekEntryResult!7315)

(assert (=> b!730800 (= lt!323854 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!323852 lt!323849 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730800 (= lt!323847 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!323852 mask!3328) lt!323852 lt!323849 mask!3328))))

(declare-fun a!3186 () array!41191)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!730800 (= lt!323852 (select (store (arr!19715 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!730800 (= lt!323849 (array!41192 (store (arr!19715 a!3186) i!1173 k!2102) (size!20136 a!3186)))))

(declare-fun b!730801 () Bool)

(declare-fun res!491055 () Bool)

(assert (=> b!730801 (=> (not res!491055) (not e!408952))))

(declare-fun e!408947 () Bool)

(assert (=> b!730801 (= res!491055 e!408947)))

(declare-fun c!80248 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!730801 (= c!80248 (bvsle x!1131 resIntermediateX!5))))

(declare-fun lt!323853 () SeekEntryResult!7315)

(declare-fun b!730802 () Bool)

(assert (=> b!730802 (= e!408947 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19715 a!3186) j!159) a!3186 mask!3328) lt!323853))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!730803 () Bool)

(declare-fun lt!323855 () SeekEntryResult!7315)

(declare-fun e!408956 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41191 (_ BitVec 32)) SeekEntryResult!7315)

(assert (=> b!730803 (= e!408956 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19715 a!3186) j!159) a!3186 mask!3328) lt!323855))))

(declare-fun b!730804 () Bool)

(declare-fun e!408953 () Bool)

(declare-fun e!408949 () Bool)

(assert (=> b!730804 (= e!408953 e!408949)))

(declare-fun res!491062 () Bool)

(assert (=> b!730804 (=> res!491062 e!408949)))

(assert (=> b!730804 (= res!491062 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!323848 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!730804 (= lt!323848 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!730805 () Bool)

(declare-fun res!491065 () Bool)

(declare-fun e!408951 () Bool)

(assert (=> b!730805 (=> (not res!491065) (not e!408951))))

(assert (=> b!730805 (= res!491065 (and (= (size!20136 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20136 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20136 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!730806 () Bool)

(assert (=> b!730806 (= e!408947 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19715 a!3186) j!159) a!3186 mask!3328) (Found!7315 j!159)))))

(declare-fun b!730807 () Bool)

(declare-fun res!491064 () Bool)

(declare-fun e!408955 () Bool)

(assert (=> b!730807 (=> (not res!491064) (not e!408955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41191 (_ BitVec 32)) Bool)

(assert (=> b!730807 (= res!491064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!730808 () Bool)

(declare-fun res!491061 () Bool)

(assert (=> b!730808 (=> (not res!491061) (not e!408951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!730808 (= res!491061 (validKeyInArray!0 k!2102))))

(declare-fun b!730810 () Bool)

(declare-fun res!491058 () Bool)

(assert (=> b!730810 (=> (not res!491058) (not e!408955))))

(assert (=> b!730810 (= res!491058 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20136 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20136 a!3186))))))

(declare-fun b!730811 () Bool)

(assert (=> b!730811 (= e!408949 true)))

(declare-fun lt!323851 () SeekEntryResult!7315)

(assert (=> b!730811 (= lt!323851 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19715 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!730812 () Bool)

(declare-fun res!491057 () Bool)

(assert (=> b!730812 (=> (not res!491057) (not e!408955))))

(declare-datatypes ((List!13717 0))(
  ( (Nil!13714) (Cons!13713 (h!14773 (_ BitVec 64)) (t!20032 List!13717)) )
))
(declare-fun arrayNoDuplicates!0 (array!41191 (_ BitVec 32) List!13717) Bool)

(assert (=> b!730812 (= res!491057 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13714))))

(declare-fun b!730813 () Bool)

(assert (=> b!730813 (= e!408955 e!408952)))

(declare-fun res!491054 () Bool)

(assert (=> b!730813 (=> (not res!491054) (not e!408952))))

(assert (=> b!730813 (= res!491054 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19715 a!3186) j!159) mask!3328) (select (arr!19715 a!3186) j!159) a!3186 mask!3328) lt!323853))))

(assert (=> b!730813 (= lt!323853 (Intermediate!7315 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!730814 () Bool)

(declare-fun e!408954 () Bool)

(assert (=> b!730814 (= e!408954 e!408956)))

(declare-fun res!491067 () Bool)

(assert (=> b!730814 (=> (not res!491067) (not e!408956))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41191 (_ BitVec 32)) SeekEntryResult!7315)

(assert (=> b!730814 (= res!491067 (= (seekEntryOrOpen!0 (select (arr!19715 a!3186) j!159) a!3186 mask!3328) lt!323855))))

(assert (=> b!730814 (= lt!323855 (Found!7315 j!159))))

(declare-fun b!730815 () Bool)

(assert (=> b!730815 (= e!408951 e!408955)))

(declare-fun res!491066 () Bool)

(assert (=> b!730815 (=> (not res!491066) (not e!408955))))

(declare-fun lt!323850 () SeekEntryResult!7315)

(assert (=> b!730815 (= res!491066 (or (= lt!323850 (MissingZero!7315 i!1173)) (= lt!323850 (MissingVacant!7315 i!1173))))))

(assert (=> b!730815 (= lt!323850 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!730816 () Bool)

(declare-fun res!491059 () Bool)

(assert (=> b!730816 (=> (not res!491059) (not e!408951))))

(assert (=> b!730816 (= res!491059 (validKeyInArray!0 (select (arr!19715 a!3186) j!159)))))

(declare-fun b!730817 () Bool)

(declare-fun res!491056 () Bool)

(assert (=> b!730817 (=> (not res!491056) (not e!408952))))

(assert (=> b!730817 (= res!491056 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19715 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!730818 () Bool)

(declare-fun res!491053 () Bool)

(assert (=> b!730818 (=> (not res!491053) (not e!408951))))

(declare-fun arrayContainsKey!0 (array!41191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!730818 (= res!491053 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!730809 () Bool)

(assert (=> b!730809 (= e!408948 (not e!408953))))

(declare-fun res!491060 () Bool)

(assert (=> b!730809 (=> res!491060 e!408953)))

(assert (=> b!730809 (= res!491060 (or (not (is-Intermediate!7315 lt!323854)) (bvsge x!1131 (x!62601 lt!323854))))))

(assert (=> b!730809 e!408954))

(declare-fun res!491068 () Bool)

(assert (=> b!730809 (=> (not res!491068) (not e!408954))))

(assert (=> b!730809 (= res!491068 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24948 0))(
  ( (Unit!24949) )
))
(declare-fun lt!323846 () Unit!24948)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41191 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24948)

(assert (=> b!730809 (= lt!323846 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!491063 () Bool)

(assert (=> start!64742 (=> (not res!491063) (not e!408951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64742 (= res!491063 (validMask!0 mask!3328))))

(assert (=> start!64742 e!408951))

(assert (=> start!64742 true))

(declare-fun array_inv!15511 (array!41191) Bool)

(assert (=> start!64742 (array_inv!15511 a!3186)))

(assert (= (and start!64742 res!491063) b!730805))

(assert (= (and b!730805 res!491065) b!730816))

(assert (= (and b!730816 res!491059) b!730808))

(assert (= (and b!730808 res!491061) b!730818))

(assert (= (and b!730818 res!491053) b!730815))

(assert (= (and b!730815 res!491066) b!730807))

(assert (= (and b!730807 res!491064) b!730812))

(assert (= (and b!730812 res!491057) b!730810))

(assert (= (and b!730810 res!491058) b!730813))

(assert (= (and b!730813 res!491054) b!730817))

(assert (= (and b!730817 res!491056) b!730801))

(assert (= (and b!730801 c!80248) b!730802))

(assert (= (and b!730801 (not c!80248)) b!730806))

(assert (= (and b!730801 res!491055) b!730800))

(assert (= (and b!730800 res!491069) b!730809))

(assert (= (and b!730809 res!491068) b!730814))

(assert (= (and b!730814 res!491067) b!730803))

(assert (= (and b!730809 (not res!491060)) b!730804))

(assert (= (and b!730804 (not res!491062)) b!730811))

(declare-fun m!684283 () Bool)

(assert (=> b!730808 m!684283))

(declare-fun m!684285 () Bool)

(assert (=> b!730814 m!684285))

(assert (=> b!730814 m!684285))

(declare-fun m!684287 () Bool)

(assert (=> b!730814 m!684287))

(assert (=> b!730811 m!684285))

(assert (=> b!730811 m!684285))

(declare-fun m!684289 () Bool)

(assert (=> b!730811 m!684289))

(assert (=> b!730803 m!684285))

(assert (=> b!730803 m!684285))

(declare-fun m!684291 () Bool)

(assert (=> b!730803 m!684291))

(declare-fun m!684293 () Bool)

(assert (=> b!730809 m!684293))

(declare-fun m!684295 () Bool)

(assert (=> b!730809 m!684295))

(assert (=> b!730802 m!684285))

(assert (=> b!730802 m!684285))

(declare-fun m!684297 () Bool)

(assert (=> b!730802 m!684297))

(declare-fun m!684299 () Bool)

(assert (=> b!730812 m!684299))

(declare-fun m!684301 () Bool)

(assert (=> b!730804 m!684301))

(declare-fun m!684303 () Bool)

(assert (=> b!730815 m!684303))

(declare-fun m!684305 () Bool)

(assert (=> start!64742 m!684305))

(declare-fun m!684307 () Bool)

(assert (=> start!64742 m!684307))

(assert (=> b!730813 m!684285))

(assert (=> b!730813 m!684285))

(declare-fun m!684309 () Bool)

(assert (=> b!730813 m!684309))

(assert (=> b!730813 m!684309))

(assert (=> b!730813 m!684285))

(declare-fun m!684311 () Bool)

(assert (=> b!730813 m!684311))

(declare-fun m!684313 () Bool)

(assert (=> b!730817 m!684313))

(declare-fun m!684315 () Bool)

(assert (=> b!730807 m!684315))

(assert (=> b!730816 m!684285))

(assert (=> b!730816 m!684285))

(declare-fun m!684317 () Bool)

(assert (=> b!730816 m!684317))

(declare-fun m!684319 () Bool)

(assert (=> b!730818 m!684319))

(declare-fun m!684321 () Bool)

(assert (=> b!730800 m!684321))

(declare-fun m!684323 () Bool)

(assert (=> b!730800 m!684323))

(declare-fun m!684325 () Bool)

(assert (=> b!730800 m!684325))

(assert (=> b!730800 m!684323))

(declare-fun m!684327 () Bool)

(assert (=> b!730800 m!684327))

(declare-fun m!684329 () Bool)

(assert (=> b!730800 m!684329))

(assert (=> b!730806 m!684285))

(assert (=> b!730806 m!684285))

(assert (=> b!730806 m!684289))

(push 1)

