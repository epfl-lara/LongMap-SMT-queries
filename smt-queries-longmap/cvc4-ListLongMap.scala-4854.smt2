; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66826 () Bool)

(assert start!66826)

(declare-fun b!771176 () Bool)

(declare-fun e!429324 () Bool)

(declare-fun e!429323 () Bool)

(assert (=> b!771176 (= e!429324 e!429323)))

(declare-fun res!521750 () Bool)

(assert (=> b!771176 (=> (not res!521750) (not e!429323))))

(declare-datatypes ((SeekEntryResult!7894 0))(
  ( (MissingZero!7894 (index!33944 (_ BitVec 32))) (Found!7894 (index!33945 (_ BitVec 32))) (Intermediate!7894 (undefined!8706 Bool) (index!33946 (_ BitVec 32)) (x!64865 (_ BitVec 32))) (Undefined!7894) (MissingVacant!7894 (index!33947 (_ BitVec 32))) )
))
(declare-fun lt!343301 () SeekEntryResult!7894)

(declare-fun lt!343310 () SeekEntryResult!7894)

(assert (=> b!771176 (= res!521750 (= lt!343301 lt!343310))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!343309 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!42388 0))(
  ( (array!42389 (arr!20294 (Array (_ BitVec 32) (_ BitVec 64))) (size!20715 (_ BitVec 32))) )
))
(declare-fun lt!343307 () array!42388)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42388 (_ BitVec 32)) SeekEntryResult!7894)

(assert (=> b!771176 (= lt!343310 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!343309 lt!343307 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771176 (= lt!343301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!343309 mask!3328) lt!343309 lt!343307 mask!3328))))

(declare-fun a!3186 () array!42388)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!771176 (= lt!343309 (select (store (arr!20294 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!771176 (= lt!343307 (array!42389 (store (arr!20294 a!3186) i!1173 k!2102) (size!20715 a!3186)))))

(declare-fun b!771177 () Bool)

(declare-datatypes ((Unit!26590 0))(
  ( (Unit!26591) )
))
(declare-fun e!429329 () Unit!26590)

(declare-fun Unit!26592 () Unit!26590)

(assert (=> b!771177 (= e!429329 Unit!26592)))

(declare-fun lt!343303 () (_ BitVec 32))

(declare-fun lt!343305 () SeekEntryResult!7894)

(assert (=> b!771177 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343303 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343305)))

(declare-fun b!771178 () Bool)

(declare-fun Unit!26593 () Unit!26590)

(assert (=> b!771178 (= e!429329 Unit!26593)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!343300 () SeekEntryResult!7894)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42388 (_ BitVec 32)) SeekEntryResult!7894)

(assert (=> b!771178 (= lt!343300 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!771178 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!343303 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) (Found!7894 j!159))))

(declare-fun b!771179 () Bool)

(declare-fun res!521753 () Bool)

(declare-fun e!429328 () Bool)

(assert (=> b!771179 (=> (not res!521753) (not e!429328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!771179 (= res!521753 (validKeyInArray!0 (select (arr!20294 a!3186) j!159)))))

(declare-fun b!771180 () Bool)

(declare-fun res!521752 () Bool)

(declare-fun e!429327 () Bool)

(assert (=> b!771180 (=> (not res!521752) (not e!429327))))

(declare-datatypes ((List!14296 0))(
  ( (Nil!14293) (Cons!14292 (h!15391 (_ BitVec 64)) (t!20611 List!14296)) )
))
(declare-fun arrayNoDuplicates!0 (array!42388 (_ BitVec 32) List!14296) Bool)

(assert (=> b!771180 (= res!521752 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14293))))

(declare-fun b!771181 () Bool)

(declare-fun e!429321 () Bool)

(declare-fun e!429326 () Bool)

(assert (=> b!771181 (= e!429321 e!429326)))

(declare-fun res!521756 () Bool)

(assert (=> b!771181 (=> (not res!521756) (not e!429326))))

(declare-fun lt!343302 () SeekEntryResult!7894)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42388 (_ BitVec 32)) SeekEntryResult!7894)

(assert (=> b!771181 (= res!521756 (= (seekEntryOrOpen!0 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343302))))

(assert (=> b!771181 (= lt!343302 (Found!7894 j!159))))

(declare-fun b!771183 () Bool)

(declare-fun res!521745 () Bool)

(assert (=> b!771183 (=> (not res!521745) (not e!429328))))

(assert (=> b!771183 (= res!521745 (and (= (size!20715 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20715 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20715 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!771184 () Bool)

(assert (=> b!771184 (= e!429327 e!429324)))

(declare-fun res!521754 () Bool)

(assert (=> b!771184 (=> (not res!521754) (not e!429324))))

(assert (=> b!771184 (= res!521754 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20294 a!3186) j!159) mask!3328) (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343305))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!771184 (= lt!343305 (Intermediate!7894 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!771185 () Bool)

(declare-fun res!521748 () Bool)

(assert (=> b!771185 (=> (not res!521748) (not e!429327))))

(assert (=> b!771185 (= res!521748 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20715 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20715 a!3186))))))

(declare-fun b!771186 () Bool)

(declare-fun e!429325 () Bool)

(assert (=> b!771186 (= e!429325 true)))

(declare-fun lt!343304 () Unit!26590)

(assert (=> b!771186 (= lt!343304 e!429329)))

(declare-fun c!85114 () Bool)

(assert (=> b!771186 (= c!85114 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!771186 (= lt!343303 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!771187 () Bool)

(assert (=> b!771187 (= e!429328 e!429327)))

(declare-fun res!521741 () Bool)

(assert (=> b!771187 (=> (not res!521741) (not e!429327))))

(declare-fun lt!343306 () SeekEntryResult!7894)

(assert (=> b!771187 (= res!521741 (or (= lt!343306 (MissingZero!7894 i!1173)) (= lt!343306 (MissingVacant!7894 i!1173))))))

(assert (=> b!771187 (= lt!343306 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!771188 () Bool)

(declare-fun res!521743 () Bool)

(assert (=> b!771188 (=> (not res!521743) (not e!429328))))

(assert (=> b!771188 (= res!521743 (validKeyInArray!0 k!2102))))

(declare-fun b!771189 () Bool)

(assert (=> b!771189 (= e!429326 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343302))))

(declare-fun b!771190 () Bool)

(declare-fun res!521755 () Bool)

(assert (=> b!771190 (=> (not res!521755) (not e!429324))))

(declare-fun e!429322 () Bool)

(assert (=> b!771190 (= res!521755 e!429322)))

(declare-fun c!85113 () Bool)

(assert (=> b!771190 (= c!85113 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!771191 () Bool)

(assert (=> b!771191 (= e!429323 (not e!429325))))

(declare-fun res!521744 () Bool)

(assert (=> b!771191 (=> res!521744 e!429325)))

(assert (=> b!771191 (= res!521744 (or (not (is-Intermediate!7894 lt!343310)) (bvsge x!1131 (x!64865 lt!343310))))))

(assert (=> b!771191 e!429321))

(declare-fun res!521742 () Bool)

(assert (=> b!771191 (=> (not res!521742) (not e!429321))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42388 (_ BitVec 32)) Bool)

(assert (=> b!771191 (= res!521742 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!343308 () Unit!26590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42388 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26590)

(assert (=> b!771191 (= lt!343308 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!521751 () Bool)

(assert (=> start!66826 (=> (not res!521751) (not e!429328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66826 (= res!521751 (validMask!0 mask!3328))))

(assert (=> start!66826 e!429328))

(assert (=> start!66826 true))

(declare-fun array_inv!16090 (array!42388) Bool)

(assert (=> start!66826 (array_inv!16090 a!3186)))

(declare-fun b!771182 () Bool)

(declare-fun res!521749 () Bool)

(assert (=> b!771182 (=> (not res!521749) (not e!429324))))

(assert (=> b!771182 (= res!521749 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20294 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!771192 () Bool)

(declare-fun res!521746 () Bool)

(assert (=> b!771192 (=> (not res!521746) (not e!429328))))

(declare-fun arrayContainsKey!0 (array!42388 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!771192 (= res!521746 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!771193 () Bool)

(assert (=> b!771193 (= e!429322 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) lt!343305))))

(declare-fun b!771194 () Bool)

(assert (=> b!771194 (= e!429322 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20294 a!3186) j!159) a!3186 mask!3328) (Found!7894 j!159)))))

(declare-fun b!771195 () Bool)

(declare-fun res!521747 () Bool)

(assert (=> b!771195 (=> (not res!521747) (not e!429327))))

(assert (=> b!771195 (= res!521747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!66826 res!521751) b!771183))

(assert (= (and b!771183 res!521745) b!771179))

(assert (= (and b!771179 res!521753) b!771188))

(assert (= (and b!771188 res!521743) b!771192))

(assert (= (and b!771192 res!521746) b!771187))

(assert (= (and b!771187 res!521741) b!771195))

(assert (= (and b!771195 res!521747) b!771180))

(assert (= (and b!771180 res!521752) b!771185))

(assert (= (and b!771185 res!521748) b!771184))

(assert (= (and b!771184 res!521754) b!771182))

(assert (= (and b!771182 res!521749) b!771190))

(assert (= (and b!771190 c!85113) b!771193))

(assert (= (and b!771190 (not c!85113)) b!771194))

(assert (= (and b!771190 res!521755) b!771176))

(assert (= (and b!771176 res!521750) b!771191))

(assert (= (and b!771191 res!521742) b!771181))

(assert (= (and b!771181 res!521756) b!771189))

(assert (= (and b!771191 (not res!521744)) b!771186))

(assert (= (and b!771186 c!85114) b!771177))

(assert (= (and b!771186 (not c!85114)) b!771178))

(declare-fun m!716359 () Bool)

(assert (=> b!771177 m!716359))

(assert (=> b!771177 m!716359))

(declare-fun m!716361 () Bool)

(assert (=> b!771177 m!716361))

(assert (=> b!771184 m!716359))

(assert (=> b!771184 m!716359))

(declare-fun m!716363 () Bool)

(assert (=> b!771184 m!716363))

(assert (=> b!771184 m!716363))

(assert (=> b!771184 m!716359))

(declare-fun m!716365 () Bool)

(assert (=> b!771184 m!716365))

(assert (=> b!771178 m!716359))

(assert (=> b!771178 m!716359))

(declare-fun m!716367 () Bool)

(assert (=> b!771178 m!716367))

(assert (=> b!771178 m!716359))

(declare-fun m!716369 () Bool)

(assert (=> b!771178 m!716369))

(assert (=> b!771194 m!716359))

(assert (=> b!771194 m!716359))

(assert (=> b!771194 m!716367))

(declare-fun m!716371 () Bool)

(assert (=> b!771176 m!716371))

(declare-fun m!716373 () Bool)

(assert (=> b!771176 m!716373))

(declare-fun m!716375 () Bool)

(assert (=> b!771176 m!716375))

(declare-fun m!716377 () Bool)

(assert (=> b!771176 m!716377))

(assert (=> b!771176 m!716373))

(declare-fun m!716379 () Bool)

(assert (=> b!771176 m!716379))

(assert (=> b!771179 m!716359))

(assert (=> b!771179 m!716359))

(declare-fun m!716381 () Bool)

(assert (=> b!771179 m!716381))

(declare-fun m!716383 () Bool)

(assert (=> b!771186 m!716383))

(declare-fun m!716385 () Bool)

(assert (=> start!66826 m!716385))

(declare-fun m!716387 () Bool)

(assert (=> start!66826 m!716387))

(declare-fun m!716389 () Bool)

(assert (=> b!771191 m!716389))

(declare-fun m!716391 () Bool)

(assert (=> b!771191 m!716391))

(assert (=> b!771189 m!716359))

(assert (=> b!771189 m!716359))

(declare-fun m!716393 () Bool)

(assert (=> b!771189 m!716393))

(assert (=> b!771193 m!716359))

(assert (=> b!771193 m!716359))

(declare-fun m!716395 () Bool)

(assert (=> b!771193 m!716395))

(assert (=> b!771181 m!716359))

(assert (=> b!771181 m!716359))

(declare-fun m!716397 () Bool)

(assert (=> b!771181 m!716397))

(declare-fun m!716399 () Bool)

(assert (=> b!771180 m!716399))

(declare-fun m!716401 () Bool)

(assert (=> b!771192 m!716401))

(declare-fun m!716403 () Bool)

(assert (=> b!771195 m!716403))

(declare-fun m!716405 () Bool)

(assert (=> b!771187 m!716405))

(declare-fun m!716407 () Bool)

(assert (=> b!771188 m!716407))

(declare-fun m!716409 () Bool)

(assert (=> b!771182 m!716409))

(push 1)

