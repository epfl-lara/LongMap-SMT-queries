; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67154 () Bool)

(assert start!67154)

(declare-fun b!776165 () Bool)

(declare-fun res!525002 () Bool)

(declare-fun e!431931 () Bool)

(assert (=> b!776165 (=> (not res!525002) (not e!431931))))

(declare-datatypes ((array!42509 0))(
  ( (array!42510 (arr!20350 (Array (_ BitVec 32) (_ BitVec 64))) (size!20771 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42509)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!776165 (= res!525002 (and (= (size!20771 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20771 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20771 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!776166 () Bool)

(declare-fun e!431928 () Bool)

(declare-fun e!431936 () Bool)

(assert (=> b!776166 (= e!431928 (not e!431936))))

(declare-fun res!525006 () Bool)

(assert (=> b!776166 (=> res!525006 e!431936)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7950 0))(
  ( (MissingZero!7950 (index!34168 (_ BitVec 32))) (Found!7950 (index!34169 (_ BitVec 32))) (Intermediate!7950 (undefined!8762 Bool) (index!34170 (_ BitVec 32)) (x!65109 (_ BitVec 32))) (Undefined!7950) (MissingVacant!7950 (index!34171 (_ BitVec 32))) )
))
(declare-fun lt!345784 () SeekEntryResult!7950)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!776166 (= res!525006 (or (not ((_ is Intermediate!7950) lt!345784)) (bvslt x!1131 (x!65109 lt!345784)) (not (= x!1131 (x!65109 lt!345784))) (not (= index!1321 (index!34170 lt!345784)))))))

(declare-fun e!431935 () Bool)

(assert (=> b!776166 e!431935))

(declare-fun res!524996 () Bool)

(assert (=> b!776166 (=> (not res!524996) (not e!431935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42509 (_ BitVec 32)) Bool)

(assert (=> b!776166 (= res!524996 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26794 0))(
  ( (Unit!26795) )
))
(declare-fun lt!345787 () Unit!26794)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42509 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26794)

(assert (=> b!776166 (= lt!345787 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!345789 () SeekEntryResult!7950)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun b!776167 () Bool)

(declare-fun e!431929 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42509 (_ BitVec 32)) SeekEntryResult!7950)

(assert (=> b!776167 (= e!431929 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20350 a!3186) j!159) a!3186 mask!3328) lt!345789))))

(declare-fun b!776168 () Bool)

(assert (=> b!776168 (= e!431935 e!431929)))

(declare-fun res!525001 () Bool)

(assert (=> b!776168 (=> (not res!525001) (not e!431929))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42509 (_ BitVec 32)) SeekEntryResult!7950)

(assert (=> b!776168 (= res!525001 (= (seekEntryOrOpen!0 (select (arr!20350 a!3186) j!159) a!3186 mask!3328) lt!345789))))

(assert (=> b!776168 (= lt!345789 (Found!7950 j!159))))

(declare-fun b!776169 () Bool)

(declare-fun res!525009 () Bool)

(assert (=> b!776169 (=> (not res!525009) (not e!431931))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42509 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776169 (= res!525009 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776170 () Bool)

(declare-fun res!525003 () Bool)

(declare-fun e!431934 () Bool)

(assert (=> b!776170 (=> (not res!525003) (not e!431934))))

(assert (=> b!776170 (= res!525003 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20771 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20771 a!3186))))))

(declare-fun lt!345786 () SeekEntryResult!7950)

(declare-fun b!776171 () Bool)

(declare-fun e!431930 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42509 (_ BitVec 32)) SeekEntryResult!7950)

(assert (=> b!776171 (= e!431930 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20350 a!3186) j!159) a!3186 mask!3328) lt!345786))))

(declare-fun b!776172 () Bool)

(assert (=> b!776172 (= e!431931 e!431934)))

(declare-fun res!525004 () Bool)

(assert (=> b!776172 (=> (not res!525004) (not e!431934))))

(declare-fun lt!345785 () SeekEntryResult!7950)

(assert (=> b!776172 (= res!525004 (or (= lt!345785 (MissingZero!7950 i!1173)) (= lt!345785 (MissingVacant!7950 i!1173))))))

(assert (=> b!776172 (= lt!345785 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776173 () Bool)

(assert (=> b!776173 (= e!431930 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20350 a!3186) j!159) a!3186 mask!3328) (Found!7950 j!159)))))

(declare-fun res!525010 () Bool)

(assert (=> start!67154 (=> (not res!525010) (not e!431931))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67154 (= res!525010 (validMask!0 mask!3328))))

(assert (=> start!67154 e!431931))

(assert (=> start!67154 true))

(declare-fun array_inv!16146 (array!42509) Bool)

(assert (=> start!67154 (array_inv!16146 a!3186)))

(declare-fun b!776164 () Bool)

(declare-fun res!525007 () Bool)

(declare-fun e!431933 () Bool)

(assert (=> b!776164 (=> (not res!525007) (not e!431933))))

(assert (=> b!776164 (= res!525007 e!431930)))

(declare-fun c!85984 () Bool)

(assert (=> b!776164 (= c!85984 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776174 () Bool)

(assert (=> b!776174 (= e!431936 true)))

(declare-fun lt!345783 () SeekEntryResult!7950)

(assert (=> b!776174 (= lt!345783 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20350 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776175 () Bool)

(declare-fun res!525011 () Bool)

(assert (=> b!776175 (=> (not res!525011) (not e!431934))))

(declare-datatypes ((List!14352 0))(
  ( (Nil!14349) (Cons!14348 (h!15456 (_ BitVec 64)) (t!20667 List!14352)) )
))
(declare-fun arrayNoDuplicates!0 (array!42509 (_ BitVec 32) List!14352) Bool)

(assert (=> b!776175 (= res!525011 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14349))))

(declare-fun b!776176 () Bool)

(assert (=> b!776176 (= e!431933 e!431928)))

(declare-fun res!524999 () Bool)

(assert (=> b!776176 (=> (not res!524999) (not e!431928))))

(declare-fun lt!345791 () SeekEntryResult!7950)

(assert (=> b!776176 (= res!524999 (= lt!345791 lt!345784))))

(declare-fun lt!345790 () (_ BitVec 64))

(declare-fun lt!345788 () array!42509)

(assert (=> b!776176 (= lt!345784 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345790 lt!345788 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776176 (= lt!345791 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345790 mask!3328) lt!345790 lt!345788 mask!3328))))

(assert (=> b!776176 (= lt!345790 (select (store (arr!20350 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776176 (= lt!345788 (array!42510 (store (arr!20350 a!3186) i!1173 k0!2102) (size!20771 a!3186)))))

(declare-fun b!776177 () Bool)

(declare-fun res!524997 () Bool)

(assert (=> b!776177 (=> (not res!524997) (not e!431934))))

(assert (=> b!776177 (= res!524997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776178 () Bool)

(declare-fun res!525005 () Bool)

(assert (=> b!776178 (=> (not res!525005) (not e!431931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776178 (= res!525005 (validKeyInArray!0 k0!2102))))

(declare-fun b!776179 () Bool)

(assert (=> b!776179 (= e!431934 e!431933)))

(declare-fun res!525000 () Bool)

(assert (=> b!776179 (=> (not res!525000) (not e!431933))))

(assert (=> b!776179 (= res!525000 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20350 a!3186) j!159) mask!3328) (select (arr!20350 a!3186) j!159) a!3186 mask!3328) lt!345786))))

(assert (=> b!776179 (= lt!345786 (Intermediate!7950 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776180 () Bool)

(declare-fun res!524998 () Bool)

(assert (=> b!776180 (=> (not res!524998) (not e!431931))))

(assert (=> b!776180 (= res!524998 (validKeyInArray!0 (select (arr!20350 a!3186) j!159)))))

(declare-fun b!776181 () Bool)

(declare-fun res!525008 () Bool)

(assert (=> b!776181 (=> (not res!525008) (not e!431933))))

(assert (=> b!776181 (= res!525008 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20350 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!67154 res!525010) b!776165))

(assert (= (and b!776165 res!525002) b!776180))

(assert (= (and b!776180 res!524998) b!776178))

(assert (= (and b!776178 res!525005) b!776169))

(assert (= (and b!776169 res!525009) b!776172))

(assert (= (and b!776172 res!525004) b!776177))

(assert (= (and b!776177 res!524997) b!776175))

(assert (= (and b!776175 res!525011) b!776170))

(assert (= (and b!776170 res!525003) b!776179))

(assert (= (and b!776179 res!525000) b!776181))

(assert (= (and b!776181 res!525008) b!776164))

(assert (= (and b!776164 c!85984) b!776171))

(assert (= (and b!776164 (not c!85984)) b!776173))

(assert (= (and b!776164 res!525007) b!776176))

(assert (= (and b!776176 res!524999) b!776166))

(assert (= (and b!776166 res!524996) b!776168))

(assert (= (and b!776168 res!525001) b!776167))

(assert (= (and b!776166 (not res!525006)) b!776174))

(declare-fun m!720285 () Bool)

(assert (=> b!776175 m!720285))

(declare-fun m!720287 () Bool)

(assert (=> b!776173 m!720287))

(assert (=> b!776173 m!720287))

(declare-fun m!720289 () Bool)

(assert (=> b!776173 m!720289))

(declare-fun m!720291 () Bool)

(assert (=> b!776169 m!720291))

(assert (=> b!776168 m!720287))

(assert (=> b!776168 m!720287))

(declare-fun m!720293 () Bool)

(assert (=> b!776168 m!720293))

(declare-fun m!720295 () Bool)

(assert (=> b!776176 m!720295))

(declare-fun m!720297 () Bool)

(assert (=> b!776176 m!720297))

(declare-fun m!720299 () Bool)

(assert (=> b!776176 m!720299))

(declare-fun m!720301 () Bool)

(assert (=> b!776176 m!720301))

(declare-fun m!720303 () Bool)

(assert (=> b!776176 m!720303))

(assert (=> b!776176 m!720297))

(assert (=> b!776167 m!720287))

(assert (=> b!776167 m!720287))

(declare-fun m!720305 () Bool)

(assert (=> b!776167 m!720305))

(assert (=> b!776179 m!720287))

(assert (=> b!776179 m!720287))

(declare-fun m!720307 () Bool)

(assert (=> b!776179 m!720307))

(assert (=> b!776179 m!720307))

(assert (=> b!776179 m!720287))

(declare-fun m!720309 () Bool)

(assert (=> b!776179 m!720309))

(declare-fun m!720311 () Bool)

(assert (=> b!776177 m!720311))

(declare-fun m!720313 () Bool)

(assert (=> start!67154 m!720313))

(declare-fun m!720315 () Bool)

(assert (=> start!67154 m!720315))

(assert (=> b!776180 m!720287))

(assert (=> b!776180 m!720287))

(declare-fun m!720317 () Bool)

(assert (=> b!776180 m!720317))

(declare-fun m!720319 () Bool)

(assert (=> b!776181 m!720319))

(declare-fun m!720321 () Bool)

(assert (=> b!776166 m!720321))

(declare-fun m!720323 () Bool)

(assert (=> b!776166 m!720323))

(assert (=> b!776174 m!720287))

(assert (=> b!776174 m!720287))

(assert (=> b!776174 m!720289))

(assert (=> b!776171 m!720287))

(assert (=> b!776171 m!720287))

(declare-fun m!720325 () Bool)

(assert (=> b!776171 m!720325))

(declare-fun m!720327 () Bool)

(assert (=> b!776172 m!720327))

(declare-fun m!720329 () Bool)

(assert (=> b!776178 m!720329))

(check-sat (not b!776171) (not b!776173) (not b!776178) (not b!776169) (not start!67154) (not b!776175) (not b!776174) (not b!776179) (not b!776167) (not b!776166) (not b!776177) (not b!776176) (not b!776172) (not b!776180) (not b!776168))
(check-sat)
