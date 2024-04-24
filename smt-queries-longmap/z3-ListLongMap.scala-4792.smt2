; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65940 () Bool)

(assert start!65940)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41983 0))(
  ( (array!41984 (arr!20101 (Array (_ BitVec 32) (_ BitVec 64))) (size!20521 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41983)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7657 0))(
  ( (MissingZero!7657 (index!32996 (_ BitVec 32))) (Found!7657 (index!32997 (_ BitVec 32))) (Intermediate!7657 (undefined!8469 Bool) (index!32998 (_ BitVec 32)) (x!64051 (_ BitVec 32))) (Undefined!7657) (MissingVacant!7657 (index!32999 (_ BitVec 32))) )
))
(declare-fun lt!337620 () SeekEntryResult!7657)

(declare-fun b!758172 () Bool)

(declare-fun e!422794 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41983 (_ BitVec 32)) SeekEntryResult!7657)

(assert (=> b!758172 (= e!422794 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20101 a!3186) j!159) a!3186 mask!3328) lt!337620))))

(declare-fun b!758173 () Bool)

(declare-fun res!512567 () Bool)

(declare-fun e!422795 () Bool)

(assert (=> b!758173 (=> (not res!512567) (not e!422795))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41983 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!758173 (= res!512567 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!758174 () Bool)

(declare-fun e!422789 () Bool)

(declare-fun e!422793 () Bool)

(assert (=> b!758174 (= e!422789 e!422793)))

(declare-fun res!512577 () Bool)

(assert (=> b!758174 (=> (not res!512577) (not e!422793))))

(declare-fun lt!337622 () SeekEntryResult!7657)

(declare-fun lt!337621 () SeekEntryResult!7657)

(assert (=> b!758174 (= res!512577 (= lt!337622 lt!337621))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!337625 () array!41983)

(declare-fun lt!337616 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41983 (_ BitVec 32)) SeekEntryResult!7657)

(assert (=> b!758174 (= lt!337621 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!337616 lt!337625 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!758174 (= lt!337622 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!337616 mask!3328) lt!337616 lt!337625 mask!3328))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!758174 (= lt!337616 (select (store (arr!20101 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!758174 (= lt!337625 (array!41984 (store (arr!20101 a!3186) i!1173 k0!2102) (size!20521 a!3186)))))

(declare-fun b!758175 () Bool)

(declare-fun res!512566 () Bool)

(declare-fun e!422790 () Bool)

(assert (=> b!758175 (=> (not res!512566) (not e!422790))))

(declare-datatypes ((List!14010 0))(
  ( (Nil!14007) (Cons!14006 (h!15084 (_ BitVec 64)) (t!20317 List!14010)) )
))
(declare-fun arrayNoDuplicates!0 (array!41983 (_ BitVec 32) List!14010) Bool)

(assert (=> b!758175 (= res!512566 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14007))))

(declare-fun res!512564 () Bool)

(assert (=> start!65940 (=> (not res!512564) (not e!422795))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65940 (= res!512564 (validMask!0 mask!3328))))

(assert (=> start!65940 e!422795))

(assert (=> start!65940 true))

(declare-fun array_inv!15960 (array!41983) Bool)

(assert (=> start!65940 (array_inv!15960 a!3186)))

(declare-fun b!758176 () Bool)

(declare-datatypes ((Unit!26185 0))(
  ( (Unit!26186) )
))
(declare-fun e!422799 () Unit!26185)

(declare-fun Unit!26187 () Unit!26185)

(assert (=> b!758176 (= e!422799 Unit!26187)))

(assert (=> b!758176 false))

(declare-fun b!758177 () Bool)

(declare-fun res!512574 () Bool)

(assert (=> b!758177 (=> (not res!512574) (not e!422795))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!758177 (= res!512574 (validKeyInArray!0 k0!2102))))

(declare-fun b!758178 () Bool)

(declare-fun res!512565 () Bool)

(assert (=> b!758178 (=> (not res!512565) (not e!422795))))

(assert (=> b!758178 (= res!512565 (validKeyInArray!0 (select (arr!20101 a!3186) j!159)))))

(declare-fun b!758179 () Bool)

(assert (=> b!758179 (= e!422790 e!422789)))

(declare-fun res!512575 () Bool)

(assert (=> b!758179 (=> (not res!512575) (not e!422789))))

(declare-fun lt!337626 () SeekEntryResult!7657)

(assert (=> b!758179 (= res!512575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20101 a!3186) j!159) mask!3328) (select (arr!20101 a!3186) j!159) a!3186 mask!3328) lt!337626))))

(assert (=> b!758179 (= lt!337626 (Intermediate!7657 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!758180 () Bool)

(declare-fun res!512563 () Bool)

(assert (=> b!758180 (=> (not res!512563) (not e!422789))))

(declare-fun e!422796 () Bool)

(assert (=> b!758180 (= res!512563 e!422796)))

(declare-fun c!83189 () Bool)

(assert (=> b!758180 (= c!83189 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!758181 () Bool)

(declare-fun res!512581 () Bool)

(assert (=> b!758181 (=> (not res!512581) (not e!422790))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41983 (_ BitVec 32)) Bool)

(assert (=> b!758181 (= res!512581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!758182 () Bool)

(assert (=> b!758182 (= e!422796 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20101 a!3186) j!159) a!3186 mask!3328) lt!337626))))

(declare-fun b!758183 () Bool)

(declare-fun res!512576 () Bool)

(assert (=> b!758183 (=> (not res!512576) (not e!422789))))

(assert (=> b!758183 (= res!512576 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20101 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!758184 () Bool)

(declare-fun e!422788 () Bool)

(assert (=> b!758184 (= e!422788 true)))

(declare-fun e!422792 () Bool)

(assert (=> b!758184 e!422792))

(declare-fun res!512568 () Bool)

(assert (=> b!758184 (=> (not res!512568) (not e!422792))))

(declare-fun lt!337618 () (_ BitVec 64))

(assert (=> b!758184 (= res!512568 (= lt!337618 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!337619 () Unit!26185)

(assert (=> b!758184 (= lt!337619 e!422799)))

(declare-fun c!83188 () Bool)

(assert (=> b!758184 (= c!83188 (= lt!337618 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!758185 () Bool)

(declare-fun e!422797 () Bool)

(assert (=> b!758185 (= e!422793 (not e!422797))))

(declare-fun res!512569 () Bool)

(assert (=> b!758185 (=> res!512569 e!422797)))

(get-info :version)

(assert (=> b!758185 (= res!512569 (or (not ((_ is Intermediate!7657) lt!337621)) (bvslt x!1131 (x!64051 lt!337621)) (not (= x!1131 (x!64051 lt!337621))) (not (= index!1321 (index!32998 lt!337621)))))))

(assert (=> b!758185 e!422794))

(declare-fun res!512579 () Bool)

(assert (=> b!758185 (=> (not res!512579) (not e!422794))))

(declare-fun lt!337615 () SeekEntryResult!7657)

(assert (=> b!758185 (= res!512579 (= lt!337615 lt!337620))))

(assert (=> b!758185 (= lt!337620 (Found!7657 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41983 (_ BitVec 32)) SeekEntryResult!7657)

(assert (=> b!758185 (= lt!337615 (seekEntryOrOpen!0 (select (arr!20101 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!758185 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!337623 () Unit!26185)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41983 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26185)

(assert (=> b!758185 (= lt!337623 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!758186 () Bool)

(declare-fun res!512580 () Bool)

(assert (=> b!758186 (=> (not res!512580) (not e!422795))))

(assert (=> b!758186 (= res!512580 (and (= (size!20521 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20521 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20521 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!758187 () Bool)

(declare-fun res!512570 () Bool)

(assert (=> b!758187 (=> (not res!512570) (not e!422790))))

(assert (=> b!758187 (= res!512570 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20521 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20521 a!3186))))))

(declare-fun b!758188 () Bool)

(declare-fun e!422798 () Bool)

(assert (=> b!758188 (= e!422797 e!422798)))

(declare-fun res!512573 () Bool)

(assert (=> b!758188 (=> res!512573 e!422798)))

(declare-fun lt!337617 () SeekEntryResult!7657)

(assert (=> b!758188 (= res!512573 (not (= lt!337617 lt!337620)))))

(assert (=> b!758188 (= lt!337617 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20101 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!758189 () Bool)

(declare-fun res!512572 () Bool)

(assert (=> b!758189 (=> (not res!512572) (not e!422792))))

(assert (=> b!758189 (= res!512572 (= (seekEntryOrOpen!0 lt!337616 lt!337625 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!337616 lt!337625 mask!3328)))))

(declare-fun b!758190 () Bool)

(assert (=> b!758190 (= e!422795 e!422790)))

(declare-fun res!512571 () Bool)

(assert (=> b!758190 (=> (not res!512571) (not e!422790))))

(declare-fun lt!337624 () SeekEntryResult!7657)

(assert (=> b!758190 (= res!512571 (or (= lt!337624 (MissingZero!7657 i!1173)) (= lt!337624 (MissingVacant!7657 i!1173))))))

(assert (=> b!758190 (= lt!337624 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!758191 () Bool)

(declare-fun Unit!26188 () Unit!26185)

(assert (=> b!758191 (= e!422799 Unit!26188)))

(declare-fun b!758192 () Bool)

(assert (=> b!758192 (= e!422798 e!422788)))

(declare-fun res!512578 () Bool)

(assert (=> b!758192 (=> res!512578 e!422788)))

(assert (=> b!758192 (= res!512578 (= lt!337618 lt!337616))))

(assert (=> b!758192 (= lt!337618 (select (store (arr!20101 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!758193 () Bool)

(assert (=> b!758193 (= e!422792 (= lt!337615 lt!337617))))

(declare-fun b!758194 () Bool)

(assert (=> b!758194 (= e!422796 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20101 a!3186) j!159) a!3186 mask!3328) (Found!7657 j!159)))))

(assert (= (and start!65940 res!512564) b!758186))

(assert (= (and b!758186 res!512580) b!758178))

(assert (= (and b!758178 res!512565) b!758177))

(assert (= (and b!758177 res!512574) b!758173))

(assert (= (and b!758173 res!512567) b!758190))

(assert (= (and b!758190 res!512571) b!758181))

(assert (= (and b!758181 res!512581) b!758175))

(assert (= (and b!758175 res!512566) b!758187))

(assert (= (and b!758187 res!512570) b!758179))

(assert (= (and b!758179 res!512575) b!758183))

(assert (= (and b!758183 res!512576) b!758180))

(assert (= (and b!758180 c!83189) b!758182))

(assert (= (and b!758180 (not c!83189)) b!758194))

(assert (= (and b!758180 res!512563) b!758174))

(assert (= (and b!758174 res!512577) b!758185))

(assert (= (and b!758185 res!512579) b!758172))

(assert (= (and b!758185 (not res!512569)) b!758188))

(assert (= (and b!758188 (not res!512573)) b!758192))

(assert (= (and b!758192 (not res!512578)) b!758184))

(assert (= (and b!758184 c!83188) b!758176))

(assert (= (and b!758184 (not c!83188)) b!758191))

(assert (= (and b!758184 res!512568) b!758189))

(assert (= (and b!758189 res!512572) b!758193))

(declare-fun m!706299 () Bool)

(assert (=> b!758172 m!706299))

(assert (=> b!758172 m!706299))

(declare-fun m!706301 () Bool)

(assert (=> b!758172 m!706301))

(assert (=> b!758179 m!706299))

(assert (=> b!758179 m!706299))

(declare-fun m!706303 () Bool)

(assert (=> b!758179 m!706303))

(assert (=> b!758179 m!706303))

(assert (=> b!758179 m!706299))

(declare-fun m!706305 () Bool)

(assert (=> b!758179 m!706305))

(declare-fun m!706307 () Bool)

(assert (=> b!758192 m!706307))

(declare-fun m!706309 () Bool)

(assert (=> b!758192 m!706309))

(declare-fun m!706311 () Bool)

(assert (=> b!758181 m!706311))

(assert (=> b!758178 m!706299))

(assert (=> b!758178 m!706299))

(declare-fun m!706313 () Bool)

(assert (=> b!758178 m!706313))

(declare-fun m!706315 () Bool)

(assert (=> b!758183 m!706315))

(assert (=> b!758182 m!706299))

(assert (=> b!758182 m!706299))

(declare-fun m!706317 () Bool)

(assert (=> b!758182 m!706317))

(declare-fun m!706319 () Bool)

(assert (=> b!758174 m!706319))

(declare-fun m!706321 () Bool)

(assert (=> b!758174 m!706321))

(declare-fun m!706323 () Bool)

(assert (=> b!758174 m!706323))

(assert (=> b!758174 m!706321))

(assert (=> b!758174 m!706307))

(declare-fun m!706325 () Bool)

(assert (=> b!758174 m!706325))

(declare-fun m!706327 () Bool)

(assert (=> b!758177 m!706327))

(declare-fun m!706329 () Bool)

(assert (=> b!758189 m!706329))

(declare-fun m!706331 () Bool)

(assert (=> b!758189 m!706331))

(assert (=> b!758185 m!706299))

(assert (=> b!758185 m!706299))

(declare-fun m!706333 () Bool)

(assert (=> b!758185 m!706333))

(declare-fun m!706335 () Bool)

(assert (=> b!758185 m!706335))

(declare-fun m!706337 () Bool)

(assert (=> b!758185 m!706337))

(assert (=> b!758194 m!706299))

(assert (=> b!758194 m!706299))

(declare-fun m!706339 () Bool)

(assert (=> b!758194 m!706339))

(declare-fun m!706341 () Bool)

(assert (=> b!758173 m!706341))

(declare-fun m!706343 () Bool)

(assert (=> start!65940 m!706343))

(declare-fun m!706345 () Bool)

(assert (=> start!65940 m!706345))

(declare-fun m!706347 () Bool)

(assert (=> b!758175 m!706347))

(assert (=> b!758188 m!706299))

(assert (=> b!758188 m!706299))

(assert (=> b!758188 m!706339))

(declare-fun m!706349 () Bool)

(assert (=> b!758190 m!706349))

(check-sat (not b!758175) (not b!758174) (not b!758182) (not b!758178) (not b!758189) (not start!65940) (not b!758177) (not b!758172) (not b!758173) (not b!758188) (not b!758185) (not b!758190) (not b!758179) (not b!758181) (not b!758194))
(check-sat)
