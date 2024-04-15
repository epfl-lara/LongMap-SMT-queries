; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65582 () Bool)

(assert start!65582)

(declare-fun b!749993 () Bool)

(declare-fun e!418445 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!749993 (= e!418445 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun e!418446 () Bool)

(assert (=> b!749993 e!418446))

(declare-fun res!506239 () Bool)

(assert (=> b!749993 (=> (not res!506239) (not e!418446))))

(declare-fun lt!333351 () (_ BitVec 64))

(assert (=> b!749993 (= res!506239 (= lt!333351 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!25748 0))(
  ( (Unit!25749) )
))
(declare-fun lt!333348 () Unit!25748)

(declare-fun e!418440 () Unit!25748)

(assert (=> b!749993 (= lt!333348 e!418440)))

(declare-fun c!82265 () Bool)

(assert (=> b!749993 (= c!82265 (= lt!333351 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!749994 () Bool)

(declare-fun res!506226 () Bool)

(declare-fun e!418443 () Bool)

(assert (=> b!749994 (=> (not res!506226) (not e!418443))))

(declare-fun e!418444 () Bool)

(assert (=> b!749994 (= res!506226 e!418444)))

(declare-fun c!82266 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!749994 (= c!82266 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!749995 () Bool)

(declare-fun e!418441 () Bool)

(declare-fun e!418437 () Bool)

(assert (=> b!749995 (= e!418441 (not e!418437))))

(declare-fun res!506232 () Bool)

(assert (=> b!749995 (=> res!506232 e!418437)))

(declare-datatypes ((SeekEntryResult!7597 0))(
  ( (MissingZero!7597 (index!32756 (_ BitVec 32))) (Found!7597 (index!32757 (_ BitVec 32))) (Intermediate!7597 (undefined!8409 Bool) (index!32758 (_ BitVec 32)) (x!63694 (_ BitVec 32))) (Undefined!7597) (MissingVacant!7597 (index!32759 (_ BitVec 32))) )
))
(declare-fun lt!333343 () SeekEntryResult!7597)

(declare-fun index!1321 () (_ BitVec 32))

(get-info :version)

(assert (=> b!749995 (= res!506232 (or (not ((_ is Intermediate!7597) lt!333343)) (bvslt x!1131 (x!63694 lt!333343)) (not (= x!1131 (x!63694 lt!333343))) (not (= index!1321 (index!32758 lt!333343)))))))

(declare-fun e!418442 () Bool)

(assert (=> b!749995 e!418442))

(declare-fun res!506230 () Bool)

(assert (=> b!749995 (=> (not res!506230) (not e!418442))))

(declare-fun lt!333353 () SeekEntryResult!7597)

(declare-fun lt!333345 () SeekEntryResult!7597)

(assert (=> b!749995 (= res!506230 (= lt!333353 lt!333345))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!749995 (= lt!333345 (Found!7597 j!159))))

(declare-datatypes ((array!41772 0))(
  ( (array!41773 (arr!20000 (Array (_ BitVec 32) (_ BitVec 64))) (size!20421 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41772)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41772 (_ BitVec 32)) SeekEntryResult!7597)

(assert (=> b!749995 (= lt!333353 (seekEntryOrOpen!0 (select (arr!20000 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41772 (_ BitVec 32)) Bool)

(assert (=> b!749995 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!333347 () Unit!25748)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41772 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25748)

(assert (=> b!749995 (= lt!333347 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!749996 () Bool)

(declare-fun res!506233 () Bool)

(assert (=> b!749996 (=> (not res!506233) (not e!418443))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!749996 (= res!506233 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20000 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!506241 () Bool)

(declare-fun e!418438 () Bool)

(assert (=> start!65582 (=> (not res!506241) (not e!418438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65582 (= res!506241 (validMask!0 mask!3328))))

(assert (=> start!65582 e!418438))

(assert (=> start!65582 true))

(declare-fun array_inv!15883 (array!41772) Bool)

(assert (=> start!65582 (array_inv!15883 a!3186)))

(declare-fun b!749997 () Bool)

(declare-fun res!506237 () Bool)

(declare-fun e!418439 () Bool)

(assert (=> b!749997 (=> (not res!506237) (not e!418439))))

(assert (=> b!749997 (= res!506237 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20421 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20421 a!3186))))))

(declare-fun b!749998 () Bool)

(assert (=> b!749998 (= e!418439 e!418443)))

(declare-fun res!506236 () Bool)

(assert (=> b!749998 (=> (not res!506236) (not e!418443))))

(declare-fun lt!333352 () SeekEntryResult!7597)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41772 (_ BitVec 32)) SeekEntryResult!7597)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!749998 (= res!506236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20000 a!3186) j!159) mask!3328) (select (arr!20000 a!3186) j!159) a!3186 mask!3328) lt!333352))))

(assert (=> b!749998 (= lt!333352 (Intermediate!7597 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!749999 () Bool)

(declare-fun res!506225 () Bool)

(assert (=> b!749999 (=> res!506225 e!418437)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41772 (_ BitVec 32)) SeekEntryResult!7597)

(assert (=> b!749999 (= res!506225 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20000 a!3186) j!159) a!3186 mask!3328) lt!333345)))))

(declare-fun b!750000 () Bool)

(declare-fun res!506224 () Bool)

(assert (=> b!750000 (=> (not res!506224) (not e!418438))))

(assert (=> b!750000 (= res!506224 (and (= (size!20421 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20421 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20421 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!750001 () Bool)

(declare-fun Unit!25750 () Unit!25748)

(assert (=> b!750001 (= e!418440 Unit!25750)))

(declare-fun b!750002 () Bool)

(assert (=> b!750002 (= e!418442 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20000 a!3186) j!159) a!3186 mask!3328) lt!333345))))

(declare-fun lt!333344 () (_ BitVec 64))

(declare-fun lt!333350 () array!41772)

(declare-fun b!750003 () Bool)

(assert (=> b!750003 (= e!418446 (= (seekEntryOrOpen!0 lt!333344 lt!333350 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!333344 lt!333350 mask!3328)))))

(declare-fun b!750004 () Bool)

(declare-fun Unit!25751 () Unit!25748)

(assert (=> b!750004 (= e!418440 Unit!25751)))

(assert (=> b!750004 false))

(declare-fun b!750005 () Bool)

(assert (=> b!750005 (= e!418437 e!418445)))

(declare-fun res!506229 () Bool)

(assert (=> b!750005 (=> res!506229 e!418445)))

(assert (=> b!750005 (= res!506229 (= lt!333351 lt!333344))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!750005 (= lt!333351 (select (store (arr!20000 a!3186) i!1173 k0!2102) index!1321))))

(declare-fun b!750006 () Bool)

(assert (=> b!750006 (= e!418438 e!418439)))

(declare-fun res!506240 () Bool)

(assert (=> b!750006 (=> (not res!506240) (not e!418439))))

(declare-fun lt!333349 () SeekEntryResult!7597)

(assert (=> b!750006 (= res!506240 (or (= lt!333349 (MissingZero!7597 i!1173)) (= lt!333349 (MissingVacant!7597 i!1173))))))

(assert (=> b!750006 (= lt!333349 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!750007 () Bool)

(declare-fun res!506227 () Bool)

(assert (=> b!750007 (=> (not res!506227) (not e!418439))))

(assert (=> b!750007 (= res!506227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!750008 () Bool)

(assert (=> b!750008 (= e!418443 e!418441)))

(declare-fun res!506238 () Bool)

(assert (=> b!750008 (=> (not res!506238) (not e!418441))))

(declare-fun lt!333346 () SeekEntryResult!7597)

(assert (=> b!750008 (= res!506238 (= lt!333346 lt!333343))))

(assert (=> b!750008 (= lt!333343 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!333344 lt!333350 mask!3328))))

(assert (=> b!750008 (= lt!333346 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!333344 mask!3328) lt!333344 lt!333350 mask!3328))))

(assert (=> b!750008 (= lt!333344 (select (store (arr!20000 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!750008 (= lt!333350 (array!41773 (store (arr!20000 a!3186) i!1173 k0!2102) (size!20421 a!3186)))))

(declare-fun b!750009 () Bool)

(declare-fun res!506234 () Bool)

(assert (=> b!750009 (=> (not res!506234) (not e!418438))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!750009 (= res!506234 (validKeyInArray!0 k0!2102))))

(declare-fun b!750010 () Bool)

(assert (=> b!750010 (= e!418444 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20000 a!3186) j!159) a!3186 mask!3328) lt!333352))))

(declare-fun b!750011 () Bool)

(assert (=> b!750011 (= e!418444 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20000 a!3186) j!159) a!3186 mask!3328) (Found!7597 j!159)))))

(declare-fun b!750012 () Bool)

(declare-fun res!506235 () Bool)

(assert (=> b!750012 (=> (not res!506235) (not e!418439))))

(declare-datatypes ((List!14041 0))(
  ( (Nil!14038) (Cons!14037 (h!15109 (_ BitVec 64)) (t!20347 List!14041)) )
))
(declare-fun arrayNoDuplicates!0 (array!41772 (_ BitVec 32) List!14041) Bool)

(assert (=> b!750012 (= res!506235 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14038))))

(declare-fun b!750013 () Bool)

(declare-fun res!506231 () Bool)

(assert (=> b!750013 (=> (not res!506231) (not e!418438))))

(declare-fun arrayContainsKey!0 (array!41772 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!750013 (= res!506231 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!750014 () Bool)

(declare-fun res!506228 () Bool)

(assert (=> b!750014 (=> (not res!506228) (not e!418438))))

(assert (=> b!750014 (= res!506228 (validKeyInArray!0 (select (arr!20000 a!3186) j!159)))))

(assert (= (and start!65582 res!506241) b!750000))

(assert (= (and b!750000 res!506224) b!750014))

(assert (= (and b!750014 res!506228) b!750009))

(assert (= (and b!750009 res!506234) b!750013))

(assert (= (and b!750013 res!506231) b!750006))

(assert (= (and b!750006 res!506240) b!750007))

(assert (= (and b!750007 res!506227) b!750012))

(assert (= (and b!750012 res!506235) b!749997))

(assert (= (and b!749997 res!506237) b!749998))

(assert (= (and b!749998 res!506236) b!749996))

(assert (= (and b!749996 res!506233) b!749994))

(assert (= (and b!749994 c!82266) b!750010))

(assert (= (and b!749994 (not c!82266)) b!750011))

(assert (= (and b!749994 res!506226) b!750008))

(assert (= (and b!750008 res!506238) b!749995))

(assert (= (and b!749995 res!506230) b!750002))

(assert (= (and b!749995 (not res!506232)) b!749999))

(assert (= (and b!749999 (not res!506225)) b!750005))

(assert (= (and b!750005 (not res!506229)) b!749993))

(assert (= (and b!749993 c!82265) b!750004))

(assert (= (and b!749993 (not c!82265)) b!750001))

(assert (= (and b!749993 res!506239) b!750003))

(declare-fun m!698921 () Bool)

(assert (=> b!750009 m!698921))

(declare-fun m!698923 () Bool)

(assert (=> b!750008 m!698923))

(declare-fun m!698925 () Bool)

(assert (=> b!750008 m!698925))

(declare-fun m!698927 () Bool)

(assert (=> b!750008 m!698927))

(assert (=> b!750008 m!698925))

(declare-fun m!698929 () Bool)

(assert (=> b!750008 m!698929))

(declare-fun m!698931 () Bool)

(assert (=> b!750008 m!698931))

(declare-fun m!698933 () Bool)

(assert (=> b!750013 m!698933))

(declare-fun m!698935 () Bool)

(assert (=> b!749998 m!698935))

(assert (=> b!749998 m!698935))

(declare-fun m!698937 () Bool)

(assert (=> b!749998 m!698937))

(assert (=> b!749998 m!698937))

(assert (=> b!749998 m!698935))

(declare-fun m!698939 () Bool)

(assert (=> b!749998 m!698939))

(assert (=> b!750011 m!698935))

(assert (=> b!750011 m!698935))

(declare-fun m!698941 () Bool)

(assert (=> b!750011 m!698941))

(declare-fun m!698943 () Bool)

(assert (=> start!65582 m!698943))

(declare-fun m!698945 () Bool)

(assert (=> start!65582 m!698945))

(declare-fun m!698947 () Bool)

(assert (=> b!750012 m!698947))

(assert (=> b!750002 m!698935))

(assert (=> b!750002 m!698935))

(declare-fun m!698949 () Bool)

(assert (=> b!750002 m!698949))

(assert (=> b!749995 m!698935))

(assert (=> b!749995 m!698935))

(declare-fun m!698951 () Bool)

(assert (=> b!749995 m!698951))

(declare-fun m!698953 () Bool)

(assert (=> b!749995 m!698953))

(declare-fun m!698955 () Bool)

(assert (=> b!749995 m!698955))

(declare-fun m!698957 () Bool)

(assert (=> b!750003 m!698957))

(declare-fun m!698959 () Bool)

(assert (=> b!750003 m!698959))

(declare-fun m!698961 () Bool)

(assert (=> b!749996 m!698961))

(assert (=> b!750010 m!698935))

(assert (=> b!750010 m!698935))

(declare-fun m!698963 () Bool)

(assert (=> b!750010 m!698963))

(declare-fun m!698965 () Bool)

(assert (=> b!750006 m!698965))

(declare-fun m!698967 () Bool)

(assert (=> b!750007 m!698967))

(assert (=> b!749999 m!698935))

(assert (=> b!749999 m!698935))

(assert (=> b!749999 m!698941))

(assert (=> b!750014 m!698935))

(assert (=> b!750014 m!698935))

(declare-fun m!698969 () Bool)

(assert (=> b!750014 m!698969))

(assert (=> b!750005 m!698929))

(declare-fun m!698971 () Bool)

(assert (=> b!750005 m!698971))

(check-sat (not b!749999) (not b!750012) (not b!750006) (not b!750002) (not b!750003) (not b!749998) (not b!750014) (not b!750011) (not b!750009) (not b!750013) (not b!750008) (not b!750007) (not start!65582) (not b!749995) (not b!750010))
(check-sat)
