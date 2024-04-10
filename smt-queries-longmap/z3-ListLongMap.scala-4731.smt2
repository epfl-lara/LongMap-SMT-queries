; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65448 () Bool)

(assert start!65448)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41621 0))(
  ( (array!41622 (arr!19924 (Array (_ BitVec 32) (_ BitVec 64))) (size!20345 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41621)

(declare-fun b!745555 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!416405 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7524 0))(
  ( (MissingZero!7524 (index!32464 (_ BitVec 32))) (Found!7524 (index!32465 (_ BitVec 32))) (Intermediate!7524 (undefined!8336 Bool) (index!32466 (_ BitVec 32)) (x!63418 (_ BitVec 32))) (Undefined!7524) (MissingVacant!7524 (index!32467 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41621 (_ BitVec 32)) SeekEntryResult!7524)

(assert (=> b!745555 (= e!416405 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19924 a!3186) j!159) a!3186 mask!3328) (Found!7524 j!159)))))

(declare-fun b!745556 () Bool)

(declare-fun res!502418 () Bool)

(declare-fun e!416404 () Bool)

(assert (=> b!745556 (=> (not res!502418) (not e!416404))))

(declare-datatypes ((List!13926 0))(
  ( (Nil!13923) (Cons!13922 (h!14994 (_ BitVec 64)) (t!20241 List!13926)) )
))
(declare-fun arrayNoDuplicates!0 (array!41621 (_ BitVec 32) List!13926) Bool)

(assert (=> b!745556 (= res!502418 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13923))))

(declare-fun b!745557 () Bool)

(declare-fun res!502424 () Bool)

(declare-fun e!416400 () Bool)

(assert (=> b!745557 (=> (not res!502424) (not e!416400))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!41621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!745557 (= res!502424 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!745558 () Bool)

(assert (=> b!745558 (= e!416400 e!416404)))

(declare-fun res!502431 () Bool)

(assert (=> b!745558 (=> (not res!502431) (not e!416404))))

(declare-fun lt!331233 () SeekEntryResult!7524)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!745558 (= res!502431 (or (= lt!331233 (MissingZero!7524 i!1173)) (= lt!331233 (MissingVacant!7524 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41621 (_ BitVec 32)) SeekEntryResult!7524)

(assert (=> b!745558 (= lt!331233 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!745559 () Bool)

(declare-fun res!502426 () Bool)

(assert (=> b!745559 (=> (not res!502426) (not e!416404))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!745559 (= res!502426 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20345 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20345 a!3186))))))

(declare-fun b!745560 () Bool)

(declare-fun e!416401 () Bool)

(assert (=> b!745560 (= e!416401 true)))

(declare-fun lt!331232 () SeekEntryResult!7524)

(assert (=> b!745560 (= lt!331232 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19924 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!745561 () Bool)

(declare-fun e!416407 () Bool)

(declare-fun e!416403 () Bool)

(assert (=> b!745561 (= e!416407 e!416403)))

(declare-fun res!502422 () Bool)

(assert (=> b!745561 (=> (not res!502422) (not e!416403))))

(declare-fun lt!331230 () SeekEntryResult!7524)

(declare-fun lt!331238 () SeekEntryResult!7524)

(assert (=> b!745561 (= res!502422 (= lt!331230 lt!331238))))

(declare-fun lt!331237 () array!41621)

(declare-fun lt!331231 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41621 (_ BitVec 32)) SeekEntryResult!7524)

(assert (=> b!745561 (= lt!331238 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!331231 lt!331237 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!745561 (= lt!331230 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!331231 mask!3328) lt!331231 lt!331237 mask!3328))))

(assert (=> b!745561 (= lt!331231 (select (store (arr!19924 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!745561 (= lt!331237 (array!41622 (store (arr!19924 a!3186) i!1173 k0!2102) (size!20345 a!3186)))))

(declare-fun b!745562 () Bool)

(declare-fun e!416406 () Bool)

(declare-fun e!416408 () Bool)

(assert (=> b!745562 (= e!416406 e!416408)))

(declare-fun res!502420 () Bool)

(assert (=> b!745562 (=> (not res!502420) (not e!416408))))

(declare-fun lt!331236 () SeekEntryResult!7524)

(assert (=> b!745562 (= res!502420 (= (seekEntryOrOpen!0 (select (arr!19924 a!3186) j!159) a!3186 mask!3328) lt!331236))))

(assert (=> b!745562 (= lt!331236 (Found!7524 j!159))))

(declare-fun lt!331235 () SeekEntryResult!7524)

(declare-fun b!745563 () Bool)

(assert (=> b!745563 (= e!416405 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19924 a!3186) j!159) a!3186 mask!3328) lt!331235))))

(declare-fun b!745565 () Bool)

(declare-fun res!502423 () Bool)

(assert (=> b!745565 (=> (not res!502423) (not e!416400))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!745565 (= res!502423 (validKeyInArray!0 k0!2102))))

(declare-fun b!745566 () Bool)

(declare-fun res!502432 () Bool)

(assert (=> b!745566 (=> (not res!502432) (not e!416407))))

(assert (=> b!745566 (= res!502432 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19924 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!745567 () Bool)

(declare-fun res!502430 () Bool)

(assert (=> b!745567 (=> (not res!502430) (not e!416400))))

(assert (=> b!745567 (= res!502430 (validKeyInArray!0 (select (arr!19924 a!3186) j!159)))))

(declare-fun b!745568 () Bool)

(assert (=> b!745568 (= e!416408 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19924 a!3186) j!159) a!3186 mask!3328) lt!331236))))

(declare-fun b!745569 () Bool)

(declare-fun res!502419 () Bool)

(assert (=> b!745569 (=> (not res!502419) (not e!416400))))

(assert (=> b!745569 (= res!502419 (and (= (size!20345 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20345 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20345 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!745570 () Bool)

(declare-fun res!502425 () Bool)

(assert (=> b!745570 (=> (not res!502425) (not e!416407))))

(assert (=> b!745570 (= res!502425 e!416405)))

(declare-fun c!81949 () Bool)

(assert (=> b!745570 (= c!81949 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!745571 () Bool)

(assert (=> b!745571 (= e!416404 e!416407)))

(declare-fun res!502421 () Bool)

(assert (=> b!745571 (=> (not res!502421) (not e!416407))))

(assert (=> b!745571 (= res!502421 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19924 a!3186) j!159) mask!3328) (select (arr!19924 a!3186) j!159) a!3186 mask!3328) lt!331235))))

(assert (=> b!745571 (= lt!331235 (Intermediate!7524 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!745572 () Bool)

(declare-fun res!502428 () Bool)

(assert (=> b!745572 (=> (not res!502428) (not e!416404))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41621 (_ BitVec 32)) Bool)

(assert (=> b!745572 (= res!502428 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!745564 () Bool)

(assert (=> b!745564 (= e!416403 (not e!416401))))

(declare-fun res!502427 () Bool)

(assert (=> b!745564 (=> res!502427 e!416401)))

(get-info :version)

(assert (=> b!745564 (= res!502427 (or (not ((_ is Intermediate!7524) lt!331238)) (bvslt x!1131 (x!63418 lt!331238)) (not (= x!1131 (x!63418 lt!331238))) (not (= index!1321 (index!32466 lt!331238)))))))

(assert (=> b!745564 e!416406))

(declare-fun res!502429 () Bool)

(assert (=> b!745564 (=> (not res!502429) (not e!416406))))

(assert (=> b!745564 (= res!502429 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!25528 0))(
  ( (Unit!25529) )
))
(declare-fun lt!331234 () Unit!25528)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41621 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25528)

(assert (=> b!745564 (= lt!331234 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!502433 () Bool)

(assert (=> start!65448 (=> (not res!502433) (not e!416400))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65448 (= res!502433 (validMask!0 mask!3328))))

(assert (=> start!65448 e!416400))

(assert (=> start!65448 true))

(declare-fun array_inv!15720 (array!41621) Bool)

(assert (=> start!65448 (array_inv!15720 a!3186)))

(assert (= (and start!65448 res!502433) b!745569))

(assert (= (and b!745569 res!502419) b!745567))

(assert (= (and b!745567 res!502430) b!745565))

(assert (= (and b!745565 res!502423) b!745557))

(assert (= (and b!745557 res!502424) b!745558))

(assert (= (and b!745558 res!502431) b!745572))

(assert (= (and b!745572 res!502428) b!745556))

(assert (= (and b!745556 res!502418) b!745559))

(assert (= (and b!745559 res!502426) b!745571))

(assert (= (and b!745571 res!502421) b!745566))

(assert (= (and b!745566 res!502432) b!745570))

(assert (= (and b!745570 c!81949) b!745563))

(assert (= (and b!745570 (not c!81949)) b!745555))

(assert (= (and b!745570 res!502425) b!745561))

(assert (= (and b!745561 res!502422) b!745564))

(assert (= (and b!745564 res!502429) b!745562))

(assert (= (and b!745562 res!502420) b!745568))

(assert (= (and b!745564 (not res!502427)) b!745560))

(declare-fun m!695915 () Bool)

(assert (=> b!745557 m!695915))

(declare-fun m!695917 () Bool)

(assert (=> b!745566 m!695917))

(declare-fun m!695919 () Bool)

(assert (=> b!745568 m!695919))

(assert (=> b!745568 m!695919))

(declare-fun m!695921 () Bool)

(assert (=> b!745568 m!695921))

(declare-fun m!695923 () Bool)

(assert (=> b!745572 m!695923))

(assert (=> b!745563 m!695919))

(assert (=> b!745563 m!695919))

(declare-fun m!695925 () Bool)

(assert (=> b!745563 m!695925))

(assert (=> b!745567 m!695919))

(assert (=> b!745567 m!695919))

(declare-fun m!695927 () Bool)

(assert (=> b!745567 m!695927))

(declare-fun m!695929 () Bool)

(assert (=> b!745556 m!695929))

(declare-fun m!695931 () Bool)

(assert (=> start!65448 m!695931))

(declare-fun m!695933 () Bool)

(assert (=> start!65448 m!695933))

(declare-fun m!695935 () Bool)

(assert (=> b!745565 m!695935))

(assert (=> b!745555 m!695919))

(assert (=> b!745555 m!695919))

(declare-fun m!695937 () Bool)

(assert (=> b!745555 m!695937))

(declare-fun m!695939 () Bool)

(assert (=> b!745564 m!695939))

(declare-fun m!695941 () Bool)

(assert (=> b!745564 m!695941))

(declare-fun m!695943 () Bool)

(assert (=> b!745558 m!695943))

(assert (=> b!745562 m!695919))

(assert (=> b!745562 m!695919))

(declare-fun m!695945 () Bool)

(assert (=> b!745562 m!695945))

(assert (=> b!745571 m!695919))

(assert (=> b!745571 m!695919))

(declare-fun m!695947 () Bool)

(assert (=> b!745571 m!695947))

(assert (=> b!745571 m!695947))

(assert (=> b!745571 m!695919))

(declare-fun m!695949 () Bool)

(assert (=> b!745571 m!695949))

(declare-fun m!695951 () Bool)

(assert (=> b!745561 m!695951))

(declare-fun m!695953 () Bool)

(assert (=> b!745561 m!695953))

(declare-fun m!695955 () Bool)

(assert (=> b!745561 m!695955))

(declare-fun m!695957 () Bool)

(assert (=> b!745561 m!695957))

(assert (=> b!745561 m!695951))

(declare-fun m!695959 () Bool)

(assert (=> b!745561 m!695959))

(assert (=> b!745560 m!695919))

(assert (=> b!745560 m!695919))

(assert (=> b!745560 m!695937))

(check-sat (not b!745562) (not b!745565) (not start!65448) (not b!745572) (not b!745557) (not b!745560) (not b!745556) (not b!745558) (not b!745567) (not b!745564) (not b!745563) (not b!745555) (not b!745568) (not b!745571) (not b!745561))
(check-sat)
