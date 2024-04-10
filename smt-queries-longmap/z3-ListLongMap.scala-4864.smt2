; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67028 () Bool)

(assert start!67028)

(declare-fun b!773887 () Bool)

(declare-fun res!523438 () Bool)

(declare-fun e!430777 () Bool)

(assert (=> b!773887 (=> (not res!523438) (not e!430777))))

(declare-datatypes ((array!42452 0))(
  ( (array!42453 (arr!20323 (Array (_ BitVec 32) (_ BitVec 64))) (size!20744 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42452)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42452 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!773887 (= res!523438 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!7923 0))(
  ( (MissingZero!7923 (index!34060 (_ BitVec 32))) (Found!7923 (index!34061 (_ BitVec 32))) (Intermediate!7923 (undefined!8735 Bool) (index!34062 (_ BitVec 32)) (x!64998 (_ BitVec 32))) (Undefined!7923) (MissingVacant!7923 (index!34063 (_ BitVec 32))) )
))
(declare-fun lt!344661 () SeekEntryResult!7923)

(declare-fun e!430778 () Bool)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun b!773888 () Bool)

(declare-fun lt!344668 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42452 (_ BitVec 32)) SeekEntryResult!7923)

(assert (=> b!773888 (= e!430778 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344668 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344661)))))

(declare-fun b!773889 () Bool)

(declare-fun res!523429 () Bool)

(declare-fun e!430779 () Bool)

(assert (=> b!773889 (=> (not res!523429) (not e!430779))))

(declare-datatypes ((List!14325 0))(
  ( (Nil!14322) (Cons!14321 (h!15426 (_ BitVec 64)) (t!20640 List!14325)) )
))
(declare-fun arrayNoDuplicates!0 (array!42452 (_ BitVec 32) List!14325) Bool)

(assert (=> b!773889 (= res!523429 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14322))))

(declare-fun b!773890 () Bool)

(declare-fun res!523425 () Bool)

(declare-fun e!430780 () Bool)

(assert (=> b!773890 (=> (not res!523425) (not e!430780))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!773890 (= res!523425 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20323 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!773891 () Bool)

(declare-fun res!523423 () Bool)

(assert (=> b!773891 (=> (not res!523423) (not e!430777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!773891 (= res!523423 (validKeyInArray!0 k0!2102))))

(declare-fun b!773892 () Bool)

(declare-fun lt!344659 () SeekEntryResult!7923)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42452 (_ BitVec 32)) SeekEntryResult!7923)

(assert (=> b!773892 (= e!430778 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344668 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344659)))))

(declare-fun b!773893 () Bool)

(declare-datatypes ((Unit!26706 0))(
  ( (Unit!26707) )
))
(declare-fun e!430770 () Unit!26706)

(declare-fun Unit!26708 () Unit!26706)

(assert (=> b!773893 (= e!430770 Unit!26708)))

(assert (=> b!773893 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344668 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344661)))

(declare-fun b!773894 () Bool)

(declare-fun e!430776 () Bool)

(declare-fun e!430775 () Bool)

(assert (=> b!773894 (= e!430776 (not e!430775))))

(declare-fun res!523439 () Bool)

(assert (=> b!773894 (=> res!523439 e!430775)))

(declare-fun lt!344665 () SeekEntryResult!7923)

(get-info :version)

(assert (=> b!773894 (= res!523439 (or (not ((_ is Intermediate!7923) lt!344665)) (bvsge x!1131 (x!64998 lt!344665))))))

(assert (=> b!773894 (= lt!344659 (Found!7923 j!159))))

(declare-fun e!430771 () Bool)

(assert (=> b!773894 e!430771))

(declare-fun res!523434 () Bool)

(assert (=> b!773894 (=> (not res!523434) (not e!430771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42452 (_ BitVec 32)) Bool)

(assert (=> b!773894 (= res!523434 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!344667 () Unit!26706)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26706)

(assert (=> b!773894 (= lt!344667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!773895 () Bool)

(assert (=> b!773895 (= e!430779 e!430780)))

(declare-fun res!523427 () Bool)

(assert (=> b!773895 (=> (not res!523427) (not e!430780))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773895 (= res!523427 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20323 a!3186) j!159) mask!3328) (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344661))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!773895 (= lt!344661 (Intermediate!7923 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!773896 () Bool)

(declare-fun e!430773 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!773896 (= e!430773 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344661))))

(declare-fun b!773897 () Bool)

(assert (=> b!773897 (= e!430777 e!430779)))

(declare-fun res!523435 () Bool)

(assert (=> b!773897 (=> (not res!523435) (not e!430779))))

(declare-fun lt!344660 () SeekEntryResult!7923)

(assert (=> b!773897 (= res!523435 (or (= lt!344660 (MissingZero!7923 i!1173)) (= lt!344660 (MissingVacant!7923 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42452 (_ BitVec 32)) SeekEntryResult!7923)

(assert (=> b!773897 (= lt!344660 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!773898 () Bool)

(declare-fun res!523431 () Bool)

(assert (=> b!773898 (=> (not res!523431) (not e!430780))))

(assert (=> b!773898 (= res!523431 e!430773)))

(declare-fun c!85631 () Bool)

(assert (=> b!773898 (= c!85631 (bvsle x!1131 resIntermediateX!5))))

(declare-fun e!430772 () Bool)

(declare-fun b!773899 () Bool)

(declare-fun lt!344657 () SeekEntryResult!7923)

(assert (=> b!773899 (= e!430772 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344657))))

(declare-fun b!773900 () Bool)

(declare-fun res!523426 () Bool)

(declare-fun e!430781 () Bool)

(assert (=> b!773900 (=> res!523426 e!430781)))

(assert (=> b!773900 (= res!523426 e!430778)))

(declare-fun c!85632 () Bool)

(declare-fun lt!344662 () Bool)

(assert (=> b!773900 (= c!85632 lt!344662)))

(declare-fun lt!344666 () SeekEntryResult!7923)

(declare-fun lt!344669 () array!42452)

(declare-fun b!773901 () Bool)

(declare-fun lt!344664 () (_ BitVec 64))

(assert (=> b!773901 (= e!430781 (= lt!344666 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344668 lt!344664 lt!344669 mask!3328)))))

(declare-fun res!523437 () Bool)

(assert (=> start!67028 (=> (not res!523437) (not e!430777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67028 (= res!523437 (validMask!0 mask!3328))))

(assert (=> start!67028 e!430777))

(assert (=> start!67028 true))

(declare-fun array_inv!16119 (array!42452) Bool)

(assert (=> start!67028 (array_inv!16119 a!3186)))

(declare-fun b!773902 () Bool)

(assert (=> b!773902 (= e!430773 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) (Found!7923 j!159)))))

(declare-fun b!773903 () Bool)

(declare-fun res!523422 () Bool)

(assert (=> b!773903 (=> (not res!523422) (not e!430779))))

(assert (=> b!773903 (= res!523422 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20744 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20744 a!3186))))))

(declare-fun b!773904 () Bool)

(declare-fun res!523430 () Bool)

(assert (=> b!773904 (=> (not res!523430) (not e!430777))))

(assert (=> b!773904 (= res!523430 (and (= (size!20744 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20744 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20744 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!773905 () Bool)

(declare-fun res!523432 () Bool)

(assert (=> b!773905 (=> (not res!523432) (not e!430779))))

(assert (=> b!773905 (= res!523432 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!773906 () Bool)

(assert (=> b!773906 (= e!430771 e!430772)))

(declare-fun res!523424 () Bool)

(assert (=> b!773906 (=> (not res!523424) (not e!430772))))

(assert (=> b!773906 (= res!523424 (= (seekEntryOrOpen!0 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344657))))

(assert (=> b!773906 (= lt!344657 (Found!7923 j!159))))

(declare-fun b!773907 () Bool)

(assert (=> b!773907 (= e!430775 e!430781)))

(declare-fun res!523428 () Bool)

(assert (=> b!773907 (=> res!523428 e!430781)))

(assert (=> b!773907 (= res!523428 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!344668 #b00000000000000000000000000000000) (bvsge lt!344668 (size!20744 a!3186))))))

(declare-fun lt!344663 () Unit!26706)

(assert (=> b!773907 (= lt!344663 e!430770)))

(declare-fun c!85633 () Bool)

(assert (=> b!773907 (= c!85633 lt!344662)))

(assert (=> b!773907 (= lt!344662 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!773907 (= lt!344668 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!773908 () Bool)

(declare-fun res!523436 () Bool)

(assert (=> b!773908 (=> (not res!523436) (not e!430777))))

(assert (=> b!773908 (= res!523436 (validKeyInArray!0 (select (arr!20323 a!3186) j!159)))))

(declare-fun b!773909 () Bool)

(declare-fun Unit!26709 () Unit!26706)

(assert (=> b!773909 (= e!430770 Unit!26709)))

(declare-fun lt!344658 () SeekEntryResult!7923)

(assert (=> b!773909 (= lt!344658 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!773909 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344668 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344659)))

(declare-fun b!773910 () Bool)

(assert (=> b!773910 (= e!430780 e!430776)))

(declare-fun res!523433 () Bool)

(assert (=> b!773910 (=> (not res!523433) (not e!430776))))

(assert (=> b!773910 (= res!523433 (= lt!344666 lt!344665))))

(assert (=> b!773910 (= lt!344665 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344664 lt!344669 mask!3328))))

(assert (=> b!773910 (= lt!344666 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344664 mask!3328) lt!344664 lt!344669 mask!3328))))

(assert (=> b!773910 (= lt!344664 (select (store (arr!20323 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!773910 (= lt!344669 (array!42453 (store (arr!20323 a!3186) i!1173 k0!2102) (size!20744 a!3186)))))

(assert (= (and start!67028 res!523437) b!773904))

(assert (= (and b!773904 res!523430) b!773908))

(assert (= (and b!773908 res!523436) b!773891))

(assert (= (and b!773891 res!523423) b!773887))

(assert (= (and b!773887 res!523438) b!773897))

(assert (= (and b!773897 res!523435) b!773905))

(assert (= (and b!773905 res!523432) b!773889))

(assert (= (and b!773889 res!523429) b!773903))

(assert (= (and b!773903 res!523422) b!773895))

(assert (= (and b!773895 res!523427) b!773890))

(assert (= (and b!773890 res!523425) b!773898))

(assert (= (and b!773898 c!85631) b!773896))

(assert (= (and b!773898 (not c!85631)) b!773902))

(assert (= (and b!773898 res!523431) b!773910))

(assert (= (and b!773910 res!523433) b!773894))

(assert (= (and b!773894 res!523434) b!773906))

(assert (= (and b!773906 res!523424) b!773899))

(assert (= (and b!773894 (not res!523439)) b!773907))

(assert (= (and b!773907 c!85633) b!773893))

(assert (= (and b!773907 (not c!85633)) b!773909))

(assert (= (and b!773907 (not res!523428)) b!773900))

(assert (= (and b!773900 c!85632) b!773888))

(assert (= (and b!773900 (not c!85632)) b!773892))

(assert (= (and b!773900 (not res!523426)) b!773901))

(declare-fun m!718517 () Bool)

(assert (=> b!773908 m!718517))

(assert (=> b!773908 m!718517))

(declare-fun m!718519 () Bool)

(assert (=> b!773908 m!718519))

(declare-fun m!718521 () Bool)

(assert (=> b!773887 m!718521))

(declare-fun m!718523 () Bool)

(assert (=> start!67028 m!718523))

(declare-fun m!718525 () Bool)

(assert (=> start!67028 m!718525))

(assert (=> b!773896 m!718517))

(assert (=> b!773896 m!718517))

(declare-fun m!718527 () Bool)

(assert (=> b!773896 m!718527))

(assert (=> b!773902 m!718517))

(assert (=> b!773902 m!718517))

(declare-fun m!718529 () Bool)

(assert (=> b!773902 m!718529))

(assert (=> b!773906 m!718517))

(assert (=> b!773906 m!718517))

(declare-fun m!718531 () Bool)

(assert (=> b!773906 m!718531))

(declare-fun m!718533 () Bool)

(assert (=> b!773901 m!718533))

(declare-fun m!718535 () Bool)

(assert (=> b!773897 m!718535))

(assert (=> b!773895 m!718517))

(assert (=> b!773895 m!718517))

(declare-fun m!718537 () Bool)

(assert (=> b!773895 m!718537))

(assert (=> b!773895 m!718537))

(assert (=> b!773895 m!718517))

(declare-fun m!718539 () Bool)

(assert (=> b!773895 m!718539))

(declare-fun m!718541 () Bool)

(assert (=> b!773905 m!718541))

(assert (=> b!773909 m!718517))

(assert (=> b!773909 m!718517))

(assert (=> b!773909 m!718529))

(assert (=> b!773909 m!718517))

(declare-fun m!718543 () Bool)

(assert (=> b!773909 m!718543))

(declare-fun m!718545 () Bool)

(assert (=> b!773889 m!718545))

(declare-fun m!718547 () Bool)

(assert (=> b!773894 m!718547))

(declare-fun m!718549 () Bool)

(assert (=> b!773894 m!718549))

(assert (=> b!773892 m!718517))

(assert (=> b!773892 m!718517))

(assert (=> b!773892 m!718543))

(declare-fun m!718551 () Bool)

(assert (=> b!773891 m!718551))

(assert (=> b!773888 m!718517))

(assert (=> b!773888 m!718517))

(declare-fun m!718553 () Bool)

(assert (=> b!773888 m!718553))

(declare-fun m!718555 () Bool)

(assert (=> b!773910 m!718555))

(declare-fun m!718557 () Bool)

(assert (=> b!773910 m!718557))

(assert (=> b!773910 m!718555))

(declare-fun m!718559 () Bool)

(assert (=> b!773910 m!718559))

(declare-fun m!718561 () Bool)

(assert (=> b!773910 m!718561))

(declare-fun m!718563 () Bool)

(assert (=> b!773910 m!718563))

(assert (=> b!773899 m!718517))

(assert (=> b!773899 m!718517))

(declare-fun m!718565 () Bool)

(assert (=> b!773899 m!718565))

(assert (=> b!773893 m!718517))

(assert (=> b!773893 m!718517))

(assert (=> b!773893 m!718553))

(declare-fun m!718567 () Bool)

(assert (=> b!773907 m!718567))

(declare-fun m!718569 () Bool)

(assert (=> b!773890 m!718569))

(check-sat (not b!773901) (not b!773910) (not start!67028) (not b!773908) (not b!773895) (not b!773905) (not b!773889) (not b!773892) (not b!773899) (not b!773891) (not b!773897) (not b!773887) (not b!773909) (not b!773893) (not b!773902) (not b!773888) (not b!773896) (not b!773906) (not b!773894) (not b!773907))
(check-sat)
(get-model)

(declare-fun d!101973 () Bool)

(declare-fun lt!344711 () (_ BitVec 32))

(assert (=> d!101973 (and (bvsge lt!344711 #b00000000000000000000000000000000) (bvslt lt!344711 (bvadd mask!3328 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!101973 (= lt!344711 (choose!52 index!1321 x!1131 mask!3328))))

(assert (=> d!101973 (validMask!0 mask!3328)))

(assert (=> d!101973 (= (nextIndex!0 index!1321 x!1131 mask!3328) lt!344711)))

(declare-fun bs!21628 () Bool)

(assert (= bs!21628 d!101973))

(declare-fun m!718625 () Bool)

(assert (=> bs!21628 m!718625))

(assert (=> bs!21628 m!718523))

(assert (=> b!773907 d!101973))

(declare-fun b!773995 () Bool)

(declare-fun c!85651 () Bool)

(declare-fun lt!344720 () (_ BitVec 64))

(assert (=> b!773995 (= c!85651 (= lt!344720 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430826 () SeekEntryResult!7923)

(declare-fun e!430824 () SeekEntryResult!7923)

(assert (=> b!773995 (= e!430826 e!430824)))

(declare-fun d!101975 () Bool)

(declare-fun lt!344718 () SeekEntryResult!7923)

(assert (=> d!101975 (and (or ((_ is Undefined!7923) lt!344718) (not ((_ is Found!7923) lt!344718)) (and (bvsge (index!34061 lt!344718) #b00000000000000000000000000000000) (bvslt (index!34061 lt!344718) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344718) ((_ is Found!7923) lt!344718) (not ((_ is MissingZero!7923) lt!344718)) (and (bvsge (index!34060 lt!344718) #b00000000000000000000000000000000) (bvslt (index!34060 lt!344718) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344718) ((_ is Found!7923) lt!344718) ((_ is MissingZero!7923) lt!344718) (not ((_ is MissingVacant!7923) lt!344718)) (and (bvsge (index!34063 lt!344718) #b00000000000000000000000000000000) (bvslt (index!34063 lt!344718) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344718) (ite ((_ is Found!7923) lt!344718) (= (select (arr!20323 a!3186) (index!34061 lt!344718)) k0!2102) (ite ((_ is MissingZero!7923) lt!344718) (= (select (arr!20323 a!3186) (index!34060 lt!344718)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7923) lt!344718) (= (select (arr!20323 a!3186) (index!34063 lt!344718)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!430825 () SeekEntryResult!7923)

(assert (=> d!101975 (= lt!344718 e!430825)))

(declare-fun c!85649 () Bool)

(declare-fun lt!344719 () SeekEntryResult!7923)

(assert (=> d!101975 (= c!85649 (and ((_ is Intermediate!7923) lt!344719) (undefined!8735 lt!344719)))))

(assert (=> d!101975 (= lt!344719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2102 mask!3328) k0!2102 a!3186 mask!3328))))

(assert (=> d!101975 (validMask!0 mask!3328)))

(assert (=> d!101975 (= (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328) lt!344718)))

(declare-fun b!773996 () Bool)

(assert (=> b!773996 (= e!430824 (seekKeyOrZeroReturnVacant!0 (x!64998 lt!344719) (index!34062 lt!344719) (index!34062 lt!344719) k0!2102 a!3186 mask!3328))))

(declare-fun b!773997 () Bool)

(assert (=> b!773997 (= e!430825 e!430826)))

(assert (=> b!773997 (= lt!344720 (select (arr!20323 a!3186) (index!34062 lt!344719)))))

(declare-fun c!85650 () Bool)

(assert (=> b!773997 (= c!85650 (= lt!344720 k0!2102))))

(declare-fun b!773998 () Bool)

(assert (=> b!773998 (= e!430824 (MissingZero!7923 (index!34062 lt!344719)))))

(declare-fun b!773999 () Bool)

(assert (=> b!773999 (= e!430826 (Found!7923 (index!34062 lt!344719)))))

(declare-fun b!774000 () Bool)

(assert (=> b!774000 (= e!430825 Undefined!7923)))

(assert (= (and d!101975 c!85649) b!774000))

(assert (= (and d!101975 (not c!85649)) b!773997))

(assert (= (and b!773997 c!85650) b!773999))

(assert (= (and b!773997 (not c!85650)) b!773995))

(assert (= (and b!773995 c!85651) b!773998))

(assert (= (and b!773995 (not c!85651)) b!773996))

(declare-fun m!718627 () Bool)

(assert (=> d!101975 m!718627))

(assert (=> d!101975 m!718523))

(assert (=> d!101975 m!718627))

(declare-fun m!718629 () Bool)

(assert (=> d!101975 m!718629))

(declare-fun m!718631 () Bool)

(assert (=> d!101975 m!718631))

(declare-fun m!718633 () Bool)

(assert (=> d!101975 m!718633))

(declare-fun m!718635 () Bool)

(assert (=> d!101975 m!718635))

(declare-fun m!718637 () Bool)

(assert (=> b!773996 m!718637))

(declare-fun m!718639 () Bool)

(assert (=> b!773997 m!718639))

(assert (=> b!773897 d!101975))

(declare-fun d!101977 () Bool)

(assert (=> d!101977 (= (validKeyInArray!0 (select (arr!20323 a!3186) j!159)) (and (not (= (select (arr!20323 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!20323 a!3186) j!159) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!773908 d!101977))

(declare-fun d!101979 () Bool)

(declare-fun res!523498 () Bool)

(declare-fun e!430831 () Bool)

(assert (=> d!101979 (=> res!523498 e!430831)))

(assert (=> d!101979 (= res!523498 (= (select (arr!20323 a!3186) #b00000000000000000000000000000000) k0!2102))))

(assert (=> d!101979 (= (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000) e!430831)))

(declare-fun b!774005 () Bool)

(declare-fun e!430832 () Bool)

(assert (=> b!774005 (= e!430831 e!430832)))

(declare-fun res!523499 () Bool)

(assert (=> b!774005 (=> (not res!523499) (not e!430832))))

(assert (=> b!774005 (= res!523499 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!20744 a!3186)))))

(declare-fun b!774006 () Bool)

(assert (=> b!774006 (= e!430832 (arrayContainsKey!0 a!3186 k0!2102 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!101979 (not res!523498)) b!774005))

(assert (= (and b!774005 res!523499) b!774006))

(declare-fun m!718641 () Bool)

(assert (=> d!101979 m!718641))

(declare-fun m!718643 () Bool)

(assert (=> b!774006 m!718643))

(assert (=> b!773887 d!101979))

(declare-fun b!774019 () Bool)

(declare-fun c!85659 () Bool)

(declare-fun lt!344728 () (_ BitVec 64))

(assert (=> b!774019 (= c!85659 (= lt!344728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430839 () SeekEntryResult!7923)

(declare-fun e!430840 () SeekEntryResult!7923)

(assert (=> b!774019 (= e!430839 e!430840)))

(declare-fun lt!344729 () SeekEntryResult!7923)

(declare-fun d!101981 () Bool)

(assert (=> d!101981 (and (or ((_ is Undefined!7923) lt!344729) (not ((_ is Found!7923) lt!344729)) (and (bvsge (index!34061 lt!344729) #b00000000000000000000000000000000) (bvslt (index!34061 lt!344729) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344729) ((_ is Found!7923) lt!344729) (not ((_ is MissingVacant!7923) lt!344729)) (not (= (index!34063 lt!344729) resIntermediateIndex!5)) (and (bvsge (index!34063 lt!344729) #b00000000000000000000000000000000) (bvslt (index!34063 lt!344729) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344729) (ite ((_ is Found!7923) lt!344729) (= (select (arr!20323 a!3186) (index!34061 lt!344729)) (select (arr!20323 a!3186) j!159)) (and ((_ is MissingVacant!7923) lt!344729) (= (index!34063 lt!344729) resIntermediateIndex!5) (= (select (arr!20323 a!3186) (index!34063 lt!344729)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430841 () SeekEntryResult!7923)

(assert (=> d!101981 (= lt!344729 e!430841)))

(declare-fun c!85660 () Bool)

(assert (=> d!101981 (= c!85660 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!101981 (= lt!344728 (select (arr!20323 a!3186) index!1321))))

(assert (=> d!101981 (validMask!0 mask!3328)))

(assert (=> d!101981 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344729)))

(declare-fun b!774020 () Bool)

(assert (=> b!774020 (= e!430840 (MissingVacant!7923 resIntermediateIndex!5))))

(declare-fun b!774021 () Bool)

(assert (=> b!774021 (= e!430840 (seekKeyOrZeroReturnVacant!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774022 () Bool)

(assert (=> b!774022 (= e!430839 (Found!7923 index!1321))))

(declare-fun b!774023 () Bool)

(assert (=> b!774023 (= e!430841 Undefined!7923)))

(declare-fun b!774024 () Bool)

(assert (=> b!774024 (= e!430841 e!430839)))

(declare-fun c!85658 () Bool)

(assert (=> b!774024 (= c!85658 (= lt!344728 (select (arr!20323 a!3186) j!159)))))

(assert (= (and d!101981 c!85660) b!774023))

(assert (= (and d!101981 (not c!85660)) b!774024))

(assert (= (and b!774024 c!85658) b!774022))

(assert (= (and b!774024 (not c!85658)) b!774019))

(assert (= (and b!774019 c!85659) b!774020))

(assert (= (and b!774019 (not c!85659)) b!774021))

(declare-fun m!718647 () Bool)

(assert (=> d!101981 m!718647))

(declare-fun m!718649 () Bool)

(assert (=> d!101981 m!718649))

(declare-fun m!718651 () Bool)

(assert (=> d!101981 m!718651))

(assert (=> d!101981 m!718523))

(assert (=> b!774021 m!718567))

(assert (=> b!774021 m!718567))

(assert (=> b!774021 m!718517))

(declare-fun m!718653 () Bool)

(assert (=> b!774021 m!718653))

(assert (=> b!773909 d!101981))

(declare-fun b!774025 () Bool)

(declare-fun c!85662 () Bool)

(declare-fun lt!344730 () (_ BitVec 64))

(assert (=> b!774025 (= c!85662 (= lt!344730 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430842 () SeekEntryResult!7923)

(declare-fun e!430843 () SeekEntryResult!7923)

(assert (=> b!774025 (= e!430842 e!430843)))

(declare-fun lt!344731 () SeekEntryResult!7923)

(declare-fun d!101993 () Bool)

(assert (=> d!101993 (and (or ((_ is Undefined!7923) lt!344731) (not ((_ is Found!7923) lt!344731)) (and (bvsge (index!34061 lt!344731) #b00000000000000000000000000000000) (bvslt (index!34061 lt!344731) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344731) ((_ is Found!7923) lt!344731) (not ((_ is MissingVacant!7923) lt!344731)) (not (= (index!34063 lt!344731) resIntermediateIndex!5)) (and (bvsge (index!34063 lt!344731) #b00000000000000000000000000000000) (bvslt (index!34063 lt!344731) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344731) (ite ((_ is Found!7923) lt!344731) (= (select (arr!20323 a!3186) (index!34061 lt!344731)) (select (arr!20323 a!3186) j!159)) (and ((_ is MissingVacant!7923) lt!344731) (= (index!34063 lt!344731) resIntermediateIndex!5) (= (select (arr!20323 a!3186) (index!34063 lt!344731)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430844 () SeekEntryResult!7923)

(assert (=> d!101993 (= lt!344731 e!430844)))

(declare-fun c!85663 () Bool)

(assert (=> d!101993 (= c!85663 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101993 (= lt!344730 (select (arr!20323 a!3186) lt!344668))))

(assert (=> d!101993 (validMask!0 mask!3328)))

(assert (=> d!101993 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344668 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344731)))

(declare-fun b!774026 () Bool)

(assert (=> b!774026 (= e!430843 (MissingVacant!7923 resIntermediateIndex!5))))

(declare-fun b!774027 () Bool)

(assert (=> b!774027 (= e!430843 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344668 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774028 () Bool)

(assert (=> b!774028 (= e!430842 (Found!7923 lt!344668))))

(declare-fun b!774029 () Bool)

(assert (=> b!774029 (= e!430844 Undefined!7923)))

(declare-fun b!774030 () Bool)

(assert (=> b!774030 (= e!430844 e!430842)))

(declare-fun c!85661 () Bool)

(assert (=> b!774030 (= c!85661 (= lt!344730 (select (arr!20323 a!3186) j!159)))))

(assert (= (and d!101993 c!85663) b!774029))

(assert (= (and d!101993 (not c!85663)) b!774030))

(assert (= (and b!774030 c!85661) b!774028))

(assert (= (and b!774030 (not c!85661)) b!774025))

(assert (= (and b!774025 c!85662) b!774026))

(assert (= (and b!774025 (not c!85662)) b!774027))

(declare-fun m!718655 () Bool)

(assert (=> d!101993 m!718655))

(declare-fun m!718657 () Bool)

(assert (=> d!101993 m!718657))

(declare-fun m!718659 () Bool)

(assert (=> d!101993 m!718659))

(assert (=> d!101993 m!718523))

(declare-fun m!718661 () Bool)

(assert (=> b!774027 m!718661))

(assert (=> b!774027 m!718661))

(assert (=> b!774027 m!718517))

(declare-fun m!718663 () Bool)

(assert (=> b!774027 m!718663))

(assert (=> b!773909 d!101993))

(declare-fun b!774094 () Bool)

(declare-fun e!430895 () SeekEntryResult!7923)

(assert (=> b!774094 (= e!430895 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344668 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774095 () Bool)

(declare-fun e!430891 () SeekEntryResult!7923)

(assert (=> b!774095 (= e!430891 (Intermediate!7923 true lt!344668 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774096 () Bool)

(declare-fun lt!344754 () SeekEntryResult!7923)

(assert (=> b!774096 (and (bvsge (index!34062 lt!344754) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344754) (size!20744 a!3186)))))

(declare-fun res!523533 () Bool)

(assert (=> b!774096 (= res!523533 (= (select (arr!20323 a!3186) (index!34062 lt!344754)) (select (arr!20323 a!3186) j!159)))))

(declare-fun e!430893 () Bool)

(assert (=> b!774096 (=> res!523533 e!430893)))

(declare-fun e!430892 () Bool)

(assert (=> b!774096 (= e!430892 e!430893)))

(declare-fun b!774097 () Bool)

(declare-fun e!430894 () Bool)

(assert (=> b!774097 (= e!430894 (bvsge (x!64998 lt!344754) #b01111111111111111111111111111110))))

(declare-fun b!774098 () Bool)

(assert (=> b!774098 (= e!430891 e!430895)))

(declare-fun c!85679 () Bool)

(declare-fun lt!344755 () (_ BitVec 64))

(assert (=> b!774098 (= c!85679 (or (= lt!344755 (select (arr!20323 a!3186) j!159)) (= (bvadd lt!344755 lt!344755) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!101997 () Bool)

(assert (=> d!101997 e!430894))

(declare-fun c!85680 () Bool)

(assert (=> d!101997 (= c!85680 (and ((_ is Intermediate!7923) lt!344754) (undefined!8735 lt!344754)))))

(assert (=> d!101997 (= lt!344754 e!430891)))

(declare-fun c!85681 () Bool)

(assert (=> d!101997 (= c!85681 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!101997 (= lt!344755 (select (arr!20323 a!3186) lt!344668))))

(assert (=> d!101997 (validMask!0 mask!3328)))

(assert (=> d!101997 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344668 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344754)))

(declare-fun b!774099 () Bool)

(assert (=> b!774099 (= e!430894 e!430892)))

(declare-fun res!523534 () Bool)

(assert (=> b!774099 (= res!523534 (and ((_ is Intermediate!7923) lt!344754) (not (undefined!8735 lt!344754)) (bvslt (x!64998 lt!344754) #b01111111111111111111111111111110) (bvsge (x!64998 lt!344754) #b00000000000000000000000000000000) (bvsge (x!64998 lt!344754) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!774099 (=> (not res!523534) (not e!430892))))

(declare-fun b!774100 () Bool)

(assert (=> b!774100 (and (bvsge (index!34062 lt!344754) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344754) (size!20744 a!3186)))))

(declare-fun res!523535 () Bool)

(assert (=> b!774100 (= res!523535 (= (select (arr!20323 a!3186) (index!34062 lt!344754)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774100 (=> res!523535 e!430893)))

(declare-fun b!774101 () Bool)

(assert (=> b!774101 (= e!430895 (Intermediate!7923 false lt!344668 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774102 () Bool)

(assert (=> b!774102 (and (bvsge (index!34062 lt!344754) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344754) (size!20744 a!3186)))))

(assert (=> b!774102 (= e!430893 (= (select (arr!20323 a!3186) (index!34062 lt!344754)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!101997 c!85681) b!774095))

(assert (= (and d!101997 (not c!85681)) b!774098))

(assert (= (and b!774098 c!85679) b!774101))

(assert (= (and b!774098 (not c!85679)) b!774094))

(assert (= (and d!101997 c!85680) b!774097))

(assert (= (and d!101997 (not c!85680)) b!774099))

(assert (= (and b!774099 res!523534) b!774096))

(assert (= (and b!774096 (not res!523533)) b!774100))

(assert (= (and b!774100 (not res!523535)) b!774102))

(assert (=> b!774094 m!718661))

(assert (=> b!774094 m!718661))

(assert (=> b!774094 m!718517))

(declare-fun m!718693 () Bool)

(assert (=> b!774094 m!718693))

(declare-fun m!718695 () Bool)

(assert (=> b!774102 m!718695))

(assert (=> b!774096 m!718695))

(assert (=> b!774100 m!718695))

(assert (=> d!101997 m!718659))

(assert (=> d!101997 m!718523))

(assert (=> b!773888 d!101997))

(declare-fun b!774129 () Bool)

(declare-fun e!430911 () Bool)

(declare-fun e!430912 () Bool)

(assert (=> b!774129 (= e!430911 e!430912)))

(declare-fun lt!344772 () (_ BitVec 64))

(assert (=> b!774129 (= lt!344772 (select (arr!20323 a!3186) j!159))))

(declare-fun lt!344771 () Unit!26706)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!42452 (_ BitVec 64) (_ BitVec 32)) Unit!26706)

(assert (=> b!774129 (= lt!344771 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344772 j!159))))

(assert (=> b!774129 (arrayContainsKey!0 a!3186 lt!344772 #b00000000000000000000000000000000)))

(declare-fun lt!344773 () Unit!26706)

(assert (=> b!774129 (= lt!344773 lt!344771)))

(declare-fun res!523540 () Bool)

(assert (=> b!774129 (= res!523540 (= (seekEntryOrOpen!0 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) (Found!7923 j!159)))))

(assert (=> b!774129 (=> (not res!523540) (not e!430912))))

(declare-fun call!35163 () Bool)

(declare-fun bm!35160 () Bool)

(assert (=> bm!35160 (= call!35163 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!159 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!774130 () Bool)

(declare-fun e!430913 () Bool)

(assert (=> b!774130 (= e!430913 e!430911)))

(declare-fun c!85693 () Bool)

(assert (=> b!774130 (= c!85693 (validKeyInArray!0 (select (arr!20323 a!3186) j!159)))))

(declare-fun b!774131 () Bool)

(assert (=> b!774131 (= e!430912 call!35163)))

(declare-fun b!774132 () Bool)

(assert (=> b!774132 (= e!430911 call!35163)))

(declare-fun d!102007 () Bool)

(declare-fun res!523541 () Bool)

(assert (=> d!102007 (=> res!523541 e!430913)))

(assert (=> d!102007 (= res!523541 (bvsge j!159 (size!20744 a!3186)))))

(assert (=> d!102007 (= (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328) e!430913)))

(assert (= (and d!102007 (not res!523541)) b!774130))

(assert (= (and b!774130 c!85693) b!774129))

(assert (= (and b!774130 (not c!85693)) b!774132))

(assert (= (and b!774129 res!523540) b!774131))

(assert (= (or b!774131 b!774132) bm!35160))

(assert (=> b!774129 m!718517))

(declare-fun m!718707 () Bool)

(assert (=> b!774129 m!718707))

(declare-fun m!718709 () Bool)

(assert (=> b!774129 m!718709))

(assert (=> b!774129 m!718517))

(assert (=> b!774129 m!718531))

(declare-fun m!718711 () Bool)

(assert (=> bm!35160 m!718711))

(assert (=> b!774130 m!718517))

(assert (=> b!774130 m!718517))

(assert (=> b!774130 m!718519))

(assert (=> b!773894 d!102007))

(declare-fun d!102015 () Bool)

(assert (=> d!102015 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!344776 () Unit!26706)

(declare-fun choose!38 (array!42452 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26706)

(assert (=> d!102015 (= lt!344776 (choose!38 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(assert (=> d!102015 (validMask!0 mask!3328)))

(assert (=> d!102015 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159) lt!344776)))

(declare-fun bs!21631 () Bool)

(assert (= bs!21631 d!102015))

(assert (=> bs!21631 m!718547))

(declare-fun m!718713 () Bool)

(assert (=> bs!21631 m!718713))

(assert (=> bs!21631 m!718523))

(assert (=> b!773894 d!102015))

(declare-fun b!774133 () Bool)

(declare-fun e!430914 () Bool)

(declare-fun e!430915 () Bool)

(assert (=> b!774133 (= e!430914 e!430915)))

(declare-fun lt!344778 () (_ BitVec 64))

(assert (=> b!774133 (= lt!344778 (select (arr!20323 a!3186) #b00000000000000000000000000000000))))

(declare-fun lt!344777 () Unit!26706)

(assert (=> b!774133 (= lt!344777 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3186 lt!344778 #b00000000000000000000000000000000))))

(assert (=> b!774133 (arrayContainsKey!0 a!3186 lt!344778 #b00000000000000000000000000000000)))

(declare-fun lt!344779 () Unit!26706)

(assert (=> b!774133 (= lt!344779 lt!344777)))

(declare-fun res!523542 () Bool)

(assert (=> b!774133 (= res!523542 (= (seekEntryOrOpen!0 (select (arr!20323 a!3186) #b00000000000000000000000000000000) a!3186 mask!3328) (Found!7923 #b00000000000000000000000000000000)))))

(assert (=> b!774133 (=> (not res!523542) (not e!430915))))

(declare-fun bm!35161 () Bool)

(declare-fun call!35164 () Bool)

(assert (=> bm!35161 (= call!35164 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3186 mask!3328))))

(declare-fun b!774134 () Bool)

(declare-fun e!430916 () Bool)

(assert (=> b!774134 (= e!430916 e!430914)))

(declare-fun c!85694 () Bool)

(assert (=> b!774134 (= c!85694 (validKeyInArray!0 (select (arr!20323 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774135 () Bool)

(assert (=> b!774135 (= e!430915 call!35164)))

(declare-fun b!774136 () Bool)

(assert (=> b!774136 (= e!430914 call!35164)))

(declare-fun d!102017 () Bool)

(declare-fun res!523543 () Bool)

(assert (=> d!102017 (=> res!523543 e!430916)))

(assert (=> d!102017 (= res!523543 (bvsge #b00000000000000000000000000000000 (size!20744 a!3186)))))

(assert (=> d!102017 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328) e!430916)))

(assert (= (and d!102017 (not res!523543)) b!774134))

(assert (= (and b!774134 c!85694) b!774133))

(assert (= (and b!774134 (not c!85694)) b!774136))

(assert (= (and b!774133 res!523542) b!774135))

(assert (= (or b!774135 b!774136) bm!35161))

(assert (=> b!774133 m!718641))

(declare-fun m!718715 () Bool)

(assert (=> b!774133 m!718715))

(declare-fun m!718717 () Bool)

(assert (=> b!774133 m!718717))

(assert (=> b!774133 m!718641))

(declare-fun m!718719 () Bool)

(assert (=> b!774133 m!718719))

(declare-fun m!718721 () Bool)

(assert (=> bm!35161 m!718721))

(assert (=> b!774134 m!718641))

(assert (=> b!774134 m!718641))

(declare-fun m!718723 () Bool)

(assert (=> b!774134 m!718723))

(assert (=> b!773905 d!102017))

(declare-fun b!774137 () Bool)

(declare-fun e!430921 () SeekEntryResult!7923)

(assert (=> b!774137 (= e!430921 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!20323 a!3186) j!159) mask!3328) #b00000000000000000000000000000000 mask!3328) (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774138 () Bool)

(declare-fun e!430917 () SeekEntryResult!7923)

(assert (=> b!774138 (= e!430917 (Intermediate!7923 true (toIndex!0 (select (arr!20323 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774139 () Bool)

(declare-fun lt!344780 () SeekEntryResult!7923)

(assert (=> b!774139 (and (bvsge (index!34062 lt!344780) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344780) (size!20744 a!3186)))))

(declare-fun res!523544 () Bool)

(assert (=> b!774139 (= res!523544 (= (select (arr!20323 a!3186) (index!34062 lt!344780)) (select (arr!20323 a!3186) j!159)))))

(declare-fun e!430919 () Bool)

(assert (=> b!774139 (=> res!523544 e!430919)))

(declare-fun e!430918 () Bool)

(assert (=> b!774139 (= e!430918 e!430919)))

(declare-fun b!774140 () Bool)

(declare-fun e!430920 () Bool)

(assert (=> b!774140 (= e!430920 (bvsge (x!64998 lt!344780) #b01111111111111111111111111111110))))

(declare-fun b!774141 () Bool)

(assert (=> b!774141 (= e!430917 e!430921)))

(declare-fun c!85695 () Bool)

(declare-fun lt!344781 () (_ BitVec 64))

(assert (=> b!774141 (= c!85695 (or (= lt!344781 (select (arr!20323 a!3186) j!159)) (= (bvadd lt!344781 lt!344781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102019 () Bool)

(assert (=> d!102019 e!430920))

(declare-fun c!85696 () Bool)

(assert (=> d!102019 (= c!85696 (and ((_ is Intermediate!7923) lt!344780) (undefined!8735 lt!344780)))))

(assert (=> d!102019 (= lt!344780 e!430917)))

(declare-fun c!85697 () Bool)

(assert (=> d!102019 (= c!85697 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102019 (= lt!344781 (select (arr!20323 a!3186) (toIndex!0 (select (arr!20323 a!3186) j!159) mask!3328)))))

(assert (=> d!102019 (validMask!0 mask!3328)))

(assert (=> d!102019 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20323 a!3186) j!159) mask!3328) (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344780)))

(declare-fun b!774142 () Bool)

(assert (=> b!774142 (= e!430920 e!430918)))

(declare-fun res!523545 () Bool)

(assert (=> b!774142 (= res!523545 (and ((_ is Intermediate!7923) lt!344780) (not (undefined!8735 lt!344780)) (bvslt (x!64998 lt!344780) #b01111111111111111111111111111110) (bvsge (x!64998 lt!344780) #b00000000000000000000000000000000) (bvsge (x!64998 lt!344780) #b00000000000000000000000000000000)))))

(assert (=> b!774142 (=> (not res!523545) (not e!430918))))

(declare-fun b!774143 () Bool)

(assert (=> b!774143 (and (bvsge (index!34062 lt!344780) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344780) (size!20744 a!3186)))))

(declare-fun res!523546 () Bool)

(assert (=> b!774143 (= res!523546 (= (select (arr!20323 a!3186) (index!34062 lt!344780)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774143 (=> res!523546 e!430919)))

(declare-fun b!774144 () Bool)

(assert (=> b!774144 (= e!430921 (Intermediate!7923 false (toIndex!0 (select (arr!20323 a!3186) j!159) mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774145 () Bool)

(assert (=> b!774145 (and (bvsge (index!34062 lt!344780) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344780) (size!20744 a!3186)))))

(assert (=> b!774145 (= e!430919 (= (select (arr!20323 a!3186) (index!34062 lt!344780)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102019 c!85697) b!774138))

(assert (= (and d!102019 (not c!85697)) b!774141))

(assert (= (and b!774141 c!85695) b!774144))

(assert (= (and b!774141 (not c!85695)) b!774137))

(assert (= (and d!102019 c!85696) b!774140))

(assert (= (and d!102019 (not c!85696)) b!774142))

(assert (= (and b!774142 res!523545) b!774139))

(assert (= (and b!774139 (not res!523544)) b!774143))

(assert (= (and b!774143 (not res!523546)) b!774145))

(assert (=> b!774137 m!718537))

(declare-fun m!718725 () Bool)

(assert (=> b!774137 m!718725))

(assert (=> b!774137 m!718725))

(assert (=> b!774137 m!718517))

(declare-fun m!718727 () Bool)

(assert (=> b!774137 m!718727))

(declare-fun m!718729 () Bool)

(assert (=> b!774145 m!718729))

(assert (=> b!774139 m!718729))

(assert (=> b!774143 m!718729))

(assert (=> d!102019 m!718537))

(declare-fun m!718731 () Bool)

(assert (=> d!102019 m!718731))

(assert (=> d!102019 m!718523))

(assert (=> b!773895 d!102019))

(declare-fun d!102021 () Bool)

(declare-fun lt!344795 () (_ BitVec 32))

(declare-fun lt!344794 () (_ BitVec 32))

(assert (=> d!102021 (= lt!344795 (bvmul (bvxor lt!344794 (bvlshr lt!344794 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102021 (= lt!344794 ((_ extract 31 0) (bvand (bvxor (select (arr!20323 a!3186) j!159) (bvlshr (select (arr!20323 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102021 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523547 (let ((h!15428 ((_ extract 31 0) (bvand (bvxor (select (arr!20323 a!3186) j!159) (bvlshr (select (arr!20323 a!3186) j!159) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65006 (bvmul (bvxor h!15428 (bvlshr h!15428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65006 (bvlshr x!65006 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523547 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523547 #b00000000000000000000000000000000))))))

(assert (=> d!102021 (= (toIndex!0 (select (arr!20323 a!3186) j!159) mask!3328) (bvand (bvxor lt!344795 (bvlshr lt!344795 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!773895 d!102021))

(declare-fun b!774183 () Bool)

(declare-fun c!85713 () Bool)

(declare-fun lt!344800 () (_ BitVec 64))

(assert (=> b!774183 (= c!85713 (= lt!344800 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430943 () SeekEntryResult!7923)

(declare-fun e!430941 () SeekEntryResult!7923)

(assert (=> b!774183 (= e!430943 e!430941)))

(declare-fun d!102023 () Bool)

(declare-fun lt!344798 () SeekEntryResult!7923)

(assert (=> d!102023 (and (or ((_ is Undefined!7923) lt!344798) (not ((_ is Found!7923) lt!344798)) (and (bvsge (index!34061 lt!344798) #b00000000000000000000000000000000) (bvslt (index!34061 lt!344798) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344798) ((_ is Found!7923) lt!344798) (not ((_ is MissingZero!7923) lt!344798)) (and (bvsge (index!34060 lt!344798) #b00000000000000000000000000000000) (bvslt (index!34060 lt!344798) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344798) ((_ is Found!7923) lt!344798) ((_ is MissingZero!7923) lt!344798) (not ((_ is MissingVacant!7923) lt!344798)) (and (bvsge (index!34063 lt!344798) #b00000000000000000000000000000000) (bvslt (index!34063 lt!344798) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344798) (ite ((_ is Found!7923) lt!344798) (= (select (arr!20323 a!3186) (index!34061 lt!344798)) (select (arr!20323 a!3186) j!159)) (ite ((_ is MissingZero!7923) lt!344798) (= (select (arr!20323 a!3186) (index!34060 lt!344798)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!7923) lt!344798) (= (select (arr!20323 a!3186) (index!34063 lt!344798)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!430942 () SeekEntryResult!7923)

(assert (=> d!102023 (= lt!344798 e!430942)))

(declare-fun c!85711 () Bool)

(declare-fun lt!344799 () SeekEntryResult!7923)

(assert (=> d!102023 (= c!85711 (and ((_ is Intermediate!7923) lt!344799) (undefined!8735 lt!344799)))))

(assert (=> d!102023 (= lt!344799 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20323 a!3186) j!159) mask!3328) (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(assert (=> d!102023 (validMask!0 mask!3328)))

(assert (=> d!102023 (= (seekEntryOrOpen!0 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344798)))

(declare-fun b!774184 () Bool)

(assert (=> b!774184 (= e!430941 (seekKeyOrZeroReturnVacant!0 (x!64998 lt!344799) (index!34062 lt!344799) (index!34062 lt!344799) (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774185 () Bool)

(assert (=> b!774185 (= e!430942 e!430943)))

(assert (=> b!774185 (= lt!344800 (select (arr!20323 a!3186) (index!34062 lt!344799)))))

(declare-fun c!85712 () Bool)

(assert (=> b!774185 (= c!85712 (= lt!344800 (select (arr!20323 a!3186) j!159)))))

(declare-fun b!774186 () Bool)

(assert (=> b!774186 (= e!430941 (MissingZero!7923 (index!34062 lt!344799)))))

(declare-fun b!774187 () Bool)

(assert (=> b!774187 (= e!430943 (Found!7923 (index!34062 lt!344799)))))

(declare-fun b!774188 () Bool)

(assert (=> b!774188 (= e!430942 Undefined!7923)))

(assert (= (and d!102023 c!85711) b!774188))

(assert (= (and d!102023 (not c!85711)) b!774185))

(assert (= (and b!774185 c!85712) b!774187))

(assert (= (and b!774185 (not c!85712)) b!774183))

(assert (= (and b!774183 c!85713) b!774186))

(assert (= (and b!774183 (not c!85713)) b!774184))

(assert (=> d!102023 m!718517))

(assert (=> d!102023 m!718537))

(assert (=> d!102023 m!718523))

(assert (=> d!102023 m!718537))

(assert (=> d!102023 m!718517))

(assert (=> d!102023 m!718539))

(declare-fun m!718741 () Bool)

(assert (=> d!102023 m!718741))

(declare-fun m!718743 () Bool)

(assert (=> d!102023 m!718743))

(declare-fun m!718745 () Bool)

(assert (=> d!102023 m!718745))

(assert (=> b!774184 m!718517))

(declare-fun m!718747 () Bool)

(assert (=> b!774184 m!718747))

(declare-fun m!718749 () Bool)

(assert (=> b!774185 m!718749))

(assert (=> b!773906 d!102023))

(declare-fun b!774206 () Bool)

(declare-fun e!430959 () SeekEntryResult!7923)

(assert (=> b!774206 (= e!430959 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774207 () Bool)

(declare-fun e!430955 () SeekEntryResult!7923)

(assert (=> b!774207 (= e!430955 (Intermediate!7923 true index!1321 x!1131))))

(declare-fun b!774208 () Bool)

(declare-fun lt!344803 () SeekEntryResult!7923)

(assert (=> b!774208 (and (bvsge (index!34062 lt!344803) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344803) (size!20744 a!3186)))))

(declare-fun res!523566 () Bool)

(assert (=> b!774208 (= res!523566 (= (select (arr!20323 a!3186) (index!34062 lt!344803)) (select (arr!20323 a!3186) j!159)))))

(declare-fun e!430957 () Bool)

(assert (=> b!774208 (=> res!523566 e!430957)))

(declare-fun e!430956 () Bool)

(assert (=> b!774208 (= e!430956 e!430957)))

(declare-fun b!774209 () Bool)

(declare-fun e!430958 () Bool)

(assert (=> b!774209 (= e!430958 (bvsge (x!64998 lt!344803) #b01111111111111111111111111111110))))

(declare-fun b!774210 () Bool)

(assert (=> b!774210 (= e!430955 e!430959)))

(declare-fun c!85719 () Bool)

(declare-fun lt!344804 () (_ BitVec 64))

(assert (=> b!774210 (= c!85719 (or (= lt!344804 (select (arr!20323 a!3186) j!159)) (= (bvadd lt!344804 lt!344804) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102027 () Bool)

(assert (=> d!102027 e!430958))

(declare-fun c!85720 () Bool)

(assert (=> d!102027 (= c!85720 (and ((_ is Intermediate!7923) lt!344803) (undefined!8735 lt!344803)))))

(assert (=> d!102027 (= lt!344803 e!430955)))

(declare-fun c!85721 () Bool)

(assert (=> d!102027 (= c!85721 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102027 (= lt!344804 (select (arr!20323 a!3186) index!1321))))

(assert (=> d!102027 (validMask!0 mask!3328)))

(assert (=> d!102027 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344803)))

(declare-fun b!774211 () Bool)

(assert (=> b!774211 (= e!430958 e!430956)))

(declare-fun res!523567 () Bool)

(assert (=> b!774211 (= res!523567 (and ((_ is Intermediate!7923) lt!344803) (not (undefined!8735 lt!344803)) (bvslt (x!64998 lt!344803) #b01111111111111111111111111111110) (bvsge (x!64998 lt!344803) #b00000000000000000000000000000000) (bvsge (x!64998 lt!344803) x!1131)))))

(assert (=> b!774211 (=> (not res!523567) (not e!430956))))

(declare-fun b!774212 () Bool)

(assert (=> b!774212 (and (bvsge (index!34062 lt!344803) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344803) (size!20744 a!3186)))))

(declare-fun res!523568 () Bool)

(assert (=> b!774212 (= res!523568 (= (select (arr!20323 a!3186) (index!34062 lt!344803)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774212 (=> res!523568 e!430957)))

(declare-fun b!774213 () Bool)

(assert (=> b!774213 (= e!430959 (Intermediate!7923 false index!1321 x!1131))))

(declare-fun b!774214 () Bool)

(assert (=> b!774214 (and (bvsge (index!34062 lt!344803) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344803) (size!20744 a!3186)))))

(assert (=> b!774214 (= e!430957 (= (select (arr!20323 a!3186) (index!34062 lt!344803)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102027 c!85721) b!774207))

(assert (= (and d!102027 (not c!85721)) b!774210))

(assert (= (and b!774210 c!85719) b!774213))

(assert (= (and b!774210 (not c!85719)) b!774206))

(assert (= (and d!102027 c!85720) b!774209))

(assert (= (and d!102027 (not c!85720)) b!774211))

(assert (= (and b!774211 res!523567) b!774208))

(assert (= (and b!774208 (not res!523566)) b!774212))

(assert (= (and b!774212 (not res!523568)) b!774214))

(assert (=> b!774206 m!718567))

(assert (=> b!774206 m!718567))

(assert (=> b!774206 m!718517))

(declare-fun m!718759 () Bool)

(assert (=> b!774206 m!718759))

(declare-fun m!718761 () Bool)

(assert (=> b!774214 m!718761))

(assert (=> b!774208 m!718761))

(assert (=> b!774212 m!718761))

(assert (=> d!102027 m!718651))

(assert (=> d!102027 m!718523))

(assert (=> b!773896 d!102027))

(declare-fun d!102031 () Bool)

(assert (=> d!102031 (= (validKeyInArray!0 k0!2102) (and (not (= k0!2102 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2102 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!773891 d!102031))

(declare-fun d!102033 () Bool)

(assert (=> d!102033 (= (validMask!0 mask!3328) (and (or (= mask!3328 #b00000000000000000000000000000111) (= mask!3328 #b00000000000000000000000000001111) (= mask!3328 #b00000000000000000000000000011111) (= mask!3328 #b00000000000000000000000000111111) (= mask!3328 #b00000000000000000000000001111111) (= mask!3328 #b00000000000000000000000011111111) (= mask!3328 #b00000000000000000000000111111111) (= mask!3328 #b00000000000000000000001111111111) (= mask!3328 #b00000000000000000000011111111111) (= mask!3328 #b00000000000000000000111111111111) (= mask!3328 #b00000000000000000001111111111111) (= mask!3328 #b00000000000000000011111111111111) (= mask!3328 #b00000000000000000111111111111111) (= mask!3328 #b00000000000000001111111111111111) (= mask!3328 #b00000000000000011111111111111111) (= mask!3328 #b00000000000000111111111111111111) (= mask!3328 #b00000000000001111111111111111111) (= mask!3328 #b00000000000011111111111111111111) (= mask!3328 #b00000000000111111111111111111111) (= mask!3328 #b00000000001111111111111111111111) (= mask!3328 #b00000000011111111111111111111111) (= mask!3328 #b00000000111111111111111111111111) (= mask!3328 #b00000001111111111111111111111111) (= mask!3328 #b00000011111111111111111111111111) (= mask!3328 #b00000111111111111111111111111111) (= mask!3328 #b00001111111111111111111111111111) (= mask!3328 #b00011111111111111111111111111111) (= mask!3328 #b00111111111111111111111111111111)) (bvsle mask!3328 #b00111111111111111111111111111111)))))

(assert (=> start!67028 d!102033))

(declare-fun d!102043 () Bool)

(assert (=> d!102043 (= (array_inv!16119 a!3186) (bvsge (size!20744 a!3186) #b00000000000000000000000000000000))))

(assert (=> start!67028 d!102043))

(assert (=> b!773902 d!101981))

(assert (=> b!773892 d!101993))

(assert (=> b!773893 d!101997))

(declare-fun b!774233 () Bool)

(declare-fun c!85729 () Bool)

(declare-fun lt!344821 () (_ BitVec 64))

(assert (=> b!774233 (= c!85729 (= lt!344821 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!430970 () SeekEntryResult!7923)

(declare-fun e!430971 () SeekEntryResult!7923)

(assert (=> b!774233 (= e!430970 e!430971)))

(declare-fun lt!344822 () SeekEntryResult!7923)

(declare-fun d!102045 () Bool)

(assert (=> d!102045 (and (or ((_ is Undefined!7923) lt!344822) (not ((_ is Found!7923) lt!344822)) (and (bvsge (index!34061 lt!344822) #b00000000000000000000000000000000) (bvslt (index!34061 lt!344822) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344822) ((_ is Found!7923) lt!344822) (not ((_ is MissingVacant!7923) lt!344822)) (not (= (index!34063 lt!344822) resIntermediateIndex!5)) (and (bvsge (index!34063 lt!344822) #b00000000000000000000000000000000) (bvslt (index!34063 lt!344822) (size!20744 a!3186)))) (or ((_ is Undefined!7923) lt!344822) (ite ((_ is Found!7923) lt!344822) (= (select (arr!20323 a!3186) (index!34061 lt!344822)) (select (arr!20323 a!3186) j!159)) (and ((_ is MissingVacant!7923) lt!344822) (= (index!34063 lt!344822) resIntermediateIndex!5) (= (select (arr!20323 a!3186) (index!34063 lt!344822)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!430972 () SeekEntryResult!7923)

(assert (=> d!102045 (= lt!344822 e!430972)))

(declare-fun c!85730 () Bool)

(assert (=> d!102045 (= c!85730 (bvsge resIntermediateX!5 #b01111111111111111111111111111110))))

(assert (=> d!102045 (= lt!344821 (select (arr!20323 a!3186) resIntermediateIndex!5))))

(assert (=> d!102045 (validMask!0 mask!3328)))

(assert (=> d!102045 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328) lt!344822)))

(declare-fun b!774234 () Bool)

(assert (=> b!774234 (= e!430971 (MissingVacant!7923 resIntermediateIndex!5))))

(declare-fun b!774235 () Bool)

(assert (=> b!774235 (= e!430971 (seekKeyOrZeroReturnVacant!0 (bvadd resIntermediateX!5 #b00000000000000000000000000000001) (nextIndex!0 resIntermediateIndex!5 resIntermediateX!5 mask!3328) resIntermediateIndex!5 (select (arr!20323 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!774236 () Bool)

(assert (=> b!774236 (= e!430970 (Found!7923 resIntermediateIndex!5))))

(declare-fun b!774237 () Bool)

(assert (=> b!774237 (= e!430972 Undefined!7923)))

(declare-fun b!774238 () Bool)

(assert (=> b!774238 (= e!430972 e!430970)))

(declare-fun c!85728 () Bool)

(assert (=> b!774238 (= c!85728 (= lt!344821 (select (arr!20323 a!3186) j!159)))))

(assert (= (and d!102045 c!85730) b!774237))

(assert (= (and d!102045 (not c!85730)) b!774238))

(assert (= (and b!774238 c!85728) b!774236))

(assert (= (and b!774238 (not c!85728)) b!774233))

(assert (= (and b!774233 c!85729) b!774234))

(assert (= (and b!774233 (not c!85729)) b!774235))

(declare-fun m!718779 () Bool)

(assert (=> d!102045 m!718779))

(declare-fun m!718781 () Bool)

(assert (=> d!102045 m!718781))

(assert (=> d!102045 m!718569))

(assert (=> d!102045 m!718523))

(declare-fun m!718783 () Bool)

(assert (=> b!774235 m!718783))

(assert (=> b!774235 m!718783))

(assert (=> b!774235 m!718517))

(declare-fun m!718785 () Bool)

(assert (=> b!774235 m!718785))

(assert (=> b!773899 d!102045))

(declare-fun b!774239 () Bool)

(declare-fun e!430977 () SeekEntryResult!7923)

(assert (=> b!774239 (= e!430977 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1131 #b00000000000000000000000000000001) (nextIndex!0 index!1321 x!1131 mask!3328) lt!344664 lt!344669 mask!3328))))

(declare-fun b!774240 () Bool)

(declare-fun e!430973 () SeekEntryResult!7923)

(assert (=> b!774240 (= e!430973 (Intermediate!7923 true index!1321 x!1131))))

(declare-fun b!774241 () Bool)

(declare-fun lt!344823 () SeekEntryResult!7923)

(assert (=> b!774241 (and (bvsge (index!34062 lt!344823) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344823) (size!20744 lt!344669)))))

(declare-fun res!523577 () Bool)

(assert (=> b!774241 (= res!523577 (= (select (arr!20323 lt!344669) (index!34062 lt!344823)) lt!344664))))

(declare-fun e!430975 () Bool)

(assert (=> b!774241 (=> res!523577 e!430975)))

(declare-fun e!430974 () Bool)

(assert (=> b!774241 (= e!430974 e!430975)))

(declare-fun b!774242 () Bool)

(declare-fun e!430976 () Bool)

(assert (=> b!774242 (= e!430976 (bvsge (x!64998 lt!344823) #b01111111111111111111111111111110))))

(declare-fun b!774243 () Bool)

(assert (=> b!774243 (= e!430973 e!430977)))

(declare-fun c!85731 () Bool)

(declare-fun lt!344824 () (_ BitVec 64))

(assert (=> b!774243 (= c!85731 (or (= lt!344824 lt!344664) (= (bvadd lt!344824 lt!344824) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102047 () Bool)

(assert (=> d!102047 e!430976))

(declare-fun c!85732 () Bool)

(assert (=> d!102047 (= c!85732 (and ((_ is Intermediate!7923) lt!344823) (undefined!8735 lt!344823)))))

(assert (=> d!102047 (= lt!344823 e!430973)))

(declare-fun c!85733 () Bool)

(assert (=> d!102047 (= c!85733 (bvsge x!1131 #b01111111111111111111111111111110))))

(assert (=> d!102047 (= lt!344824 (select (arr!20323 lt!344669) index!1321))))

(assert (=> d!102047 (validMask!0 mask!3328)))

(assert (=> d!102047 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!344664 lt!344669 mask!3328) lt!344823)))

(declare-fun b!774244 () Bool)

(assert (=> b!774244 (= e!430976 e!430974)))

(declare-fun res!523578 () Bool)

(assert (=> b!774244 (= res!523578 (and ((_ is Intermediate!7923) lt!344823) (not (undefined!8735 lt!344823)) (bvslt (x!64998 lt!344823) #b01111111111111111111111111111110) (bvsge (x!64998 lt!344823) #b00000000000000000000000000000000) (bvsge (x!64998 lt!344823) x!1131)))))

(assert (=> b!774244 (=> (not res!523578) (not e!430974))))

(declare-fun b!774245 () Bool)

(assert (=> b!774245 (and (bvsge (index!34062 lt!344823) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344823) (size!20744 lt!344669)))))

(declare-fun res!523579 () Bool)

(assert (=> b!774245 (= res!523579 (= (select (arr!20323 lt!344669) (index!34062 lt!344823)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774245 (=> res!523579 e!430975)))

(declare-fun b!774246 () Bool)

(assert (=> b!774246 (= e!430977 (Intermediate!7923 false index!1321 x!1131))))

(declare-fun b!774247 () Bool)

(assert (=> b!774247 (and (bvsge (index!34062 lt!344823) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344823) (size!20744 lt!344669)))))

(assert (=> b!774247 (= e!430975 (= (select (arr!20323 lt!344669) (index!34062 lt!344823)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102047 c!85733) b!774240))

(assert (= (and d!102047 (not c!85733)) b!774243))

(assert (= (and b!774243 c!85731) b!774246))

(assert (= (and b!774243 (not c!85731)) b!774239))

(assert (= (and d!102047 c!85732) b!774242))

(assert (= (and d!102047 (not c!85732)) b!774244))

(assert (= (and b!774244 res!523578) b!774241))

(assert (= (and b!774241 (not res!523577)) b!774245))

(assert (= (and b!774245 (not res!523579)) b!774247))

(assert (=> b!774239 m!718567))

(assert (=> b!774239 m!718567))

(declare-fun m!718787 () Bool)

(assert (=> b!774239 m!718787))

(declare-fun m!718789 () Bool)

(assert (=> b!774247 m!718789))

(assert (=> b!774241 m!718789))

(assert (=> b!774245 m!718789))

(declare-fun m!718791 () Bool)

(assert (=> d!102047 m!718791))

(assert (=> d!102047 m!718523))

(assert (=> b!773910 d!102047))

(declare-fun b!774248 () Bool)

(declare-fun e!430982 () SeekEntryResult!7923)

(assert (=> b!774248 (= e!430982 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!344664 mask!3328) #b00000000000000000000000000000000 mask!3328) lt!344664 lt!344669 mask!3328))))

(declare-fun b!774249 () Bool)

(declare-fun e!430978 () SeekEntryResult!7923)

(assert (=> b!774249 (= e!430978 (Intermediate!7923 true (toIndex!0 lt!344664 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774250 () Bool)

(declare-fun lt!344825 () SeekEntryResult!7923)

(assert (=> b!774250 (and (bvsge (index!34062 lt!344825) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344825) (size!20744 lt!344669)))))

(declare-fun res!523580 () Bool)

(assert (=> b!774250 (= res!523580 (= (select (arr!20323 lt!344669) (index!34062 lt!344825)) lt!344664))))

(declare-fun e!430980 () Bool)

(assert (=> b!774250 (=> res!523580 e!430980)))

(declare-fun e!430979 () Bool)

(assert (=> b!774250 (= e!430979 e!430980)))

(declare-fun b!774251 () Bool)

(declare-fun e!430981 () Bool)

(assert (=> b!774251 (= e!430981 (bvsge (x!64998 lt!344825) #b01111111111111111111111111111110))))

(declare-fun b!774252 () Bool)

(assert (=> b!774252 (= e!430978 e!430982)))

(declare-fun c!85734 () Bool)

(declare-fun lt!344826 () (_ BitVec 64))

(assert (=> b!774252 (= c!85734 (or (= lt!344826 lt!344664) (= (bvadd lt!344826 lt!344826) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102049 () Bool)

(assert (=> d!102049 e!430981))

(declare-fun c!85735 () Bool)

(assert (=> d!102049 (= c!85735 (and ((_ is Intermediate!7923) lt!344825) (undefined!8735 lt!344825)))))

(assert (=> d!102049 (= lt!344825 e!430978)))

(declare-fun c!85736 () Bool)

(assert (=> d!102049 (= c!85736 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!102049 (= lt!344826 (select (arr!20323 lt!344669) (toIndex!0 lt!344664 mask!3328)))))

(assert (=> d!102049 (validMask!0 mask!3328)))

(assert (=> d!102049 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!344664 mask!3328) lt!344664 lt!344669 mask!3328) lt!344825)))

(declare-fun b!774253 () Bool)

(assert (=> b!774253 (= e!430981 e!430979)))

(declare-fun res!523581 () Bool)

(assert (=> b!774253 (= res!523581 (and ((_ is Intermediate!7923) lt!344825) (not (undefined!8735 lt!344825)) (bvslt (x!64998 lt!344825) #b01111111111111111111111111111110) (bvsge (x!64998 lt!344825) #b00000000000000000000000000000000) (bvsge (x!64998 lt!344825) #b00000000000000000000000000000000)))))

(assert (=> b!774253 (=> (not res!523581) (not e!430979))))

(declare-fun b!774254 () Bool)

(assert (=> b!774254 (and (bvsge (index!34062 lt!344825) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344825) (size!20744 lt!344669)))))

(declare-fun res!523582 () Bool)

(assert (=> b!774254 (= res!523582 (= (select (arr!20323 lt!344669) (index!34062 lt!344825)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774254 (=> res!523582 e!430980)))

(declare-fun b!774255 () Bool)

(assert (=> b!774255 (= e!430982 (Intermediate!7923 false (toIndex!0 lt!344664 mask!3328) #b00000000000000000000000000000000))))

(declare-fun b!774256 () Bool)

(assert (=> b!774256 (and (bvsge (index!34062 lt!344825) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344825) (size!20744 lt!344669)))))

(assert (=> b!774256 (= e!430980 (= (select (arr!20323 lt!344669) (index!34062 lt!344825)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102049 c!85736) b!774249))

(assert (= (and d!102049 (not c!85736)) b!774252))

(assert (= (and b!774252 c!85734) b!774255))

(assert (= (and b!774252 (not c!85734)) b!774248))

(assert (= (and d!102049 c!85735) b!774251))

(assert (= (and d!102049 (not c!85735)) b!774253))

(assert (= (and b!774253 res!523581) b!774250))

(assert (= (and b!774250 (not res!523580)) b!774254))

(assert (= (and b!774254 (not res!523582)) b!774256))

(assert (=> b!774248 m!718555))

(declare-fun m!718793 () Bool)

(assert (=> b!774248 m!718793))

(assert (=> b!774248 m!718793))

(declare-fun m!718795 () Bool)

(assert (=> b!774248 m!718795))

(declare-fun m!718797 () Bool)

(assert (=> b!774256 m!718797))

(assert (=> b!774250 m!718797))

(assert (=> b!774254 m!718797))

(assert (=> d!102049 m!718555))

(declare-fun m!718799 () Bool)

(assert (=> d!102049 m!718799))

(assert (=> d!102049 m!718523))

(assert (=> b!773910 d!102049))

(declare-fun d!102051 () Bool)

(declare-fun lt!344828 () (_ BitVec 32))

(declare-fun lt!344827 () (_ BitVec 32))

(assert (=> d!102051 (= lt!344828 (bvmul (bvxor lt!344827 (bvlshr lt!344827 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!102051 (= lt!344827 ((_ extract 31 0) (bvand (bvxor lt!344664 (bvlshr lt!344664 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!102051 (and (bvsge mask!3328 #b00000000000000000000000000000000) (let ((res!523547 (let ((h!15428 ((_ extract 31 0) (bvand (bvxor lt!344664 (bvlshr lt!344664 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!65006 (bvmul (bvxor h!15428 (bvlshr h!15428 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!65006 (bvlshr x!65006 #b00000000000000000000000000001101)) mask!3328))))) (and (bvslt res!523547 (bvadd mask!3328 #b00000000000000000000000000000001)) (bvsge res!523547 #b00000000000000000000000000000000))))))

(assert (=> d!102051 (= (toIndex!0 lt!344664 mask!3328) (bvand (bvxor lt!344828 (bvlshr lt!344828 #b00000000000000000000000000001101)) mask!3328))))

(assert (=> b!773910 d!102051))

(declare-fun b!774277 () Bool)

(declare-fun e!430996 () Bool)

(declare-fun contains!4095 (List!14325 (_ BitVec 64)) Bool)

(assert (=> b!774277 (= e!430996 (contains!4095 Nil!14322 (select (arr!20323 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774278 () Bool)

(declare-fun e!430997 () Bool)

(declare-fun e!430995 () Bool)

(assert (=> b!774278 (= e!430997 e!430995)))

(declare-fun res!523589 () Bool)

(assert (=> b!774278 (=> (not res!523589) (not e!430995))))

(assert (=> b!774278 (= res!523589 (not e!430996))))

(declare-fun res!523591 () Bool)

(assert (=> b!774278 (=> (not res!523591) (not e!430996))))

(assert (=> b!774278 (= res!523591 (validKeyInArray!0 (select (arr!20323 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774280 () Bool)

(declare-fun e!430998 () Bool)

(declare-fun call!35167 () Bool)

(assert (=> b!774280 (= e!430998 call!35167)))

(declare-fun d!102053 () Bool)

(declare-fun res!523590 () Bool)

(assert (=> d!102053 (=> res!523590 e!430997)))

(assert (=> d!102053 (= res!523590 (bvsge #b00000000000000000000000000000000 (size!20744 a!3186)))))

(assert (=> d!102053 (= (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14322) e!430997)))

(declare-fun bm!35164 () Bool)

(declare-fun c!85743 () Bool)

(assert (=> bm!35164 (= call!35167 (arrayNoDuplicates!0 a!3186 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!85743 (Cons!14321 (select (arr!20323 a!3186) #b00000000000000000000000000000000) Nil!14322) Nil!14322)))))

(declare-fun b!774282 () Bool)

(assert (=> b!774282 (= e!430995 e!430998)))

(assert (=> b!774282 (= c!85743 (validKeyInArray!0 (select (arr!20323 a!3186) #b00000000000000000000000000000000)))))

(declare-fun b!774283 () Bool)

(assert (=> b!774283 (= e!430998 call!35167)))

(assert (= (and d!102053 (not res!523590)) b!774278))

(assert (= (and b!774278 res!523591) b!774277))

(assert (= (and b!774278 res!523589) b!774282))

(assert (= (and b!774282 c!85743) b!774280))

(assert (= (and b!774282 (not c!85743)) b!774283))

(assert (= (or b!774280 b!774283) bm!35164))

(assert (=> b!774277 m!718641))

(assert (=> b!774277 m!718641))

(declare-fun m!718801 () Bool)

(assert (=> b!774277 m!718801))

(assert (=> b!774278 m!718641))

(assert (=> b!774278 m!718641))

(assert (=> b!774278 m!718723))

(assert (=> bm!35164 m!718641))

(declare-fun m!718803 () Bool)

(assert (=> bm!35164 m!718803))

(assert (=> b!774282 m!718641))

(assert (=> b!774282 m!718641))

(assert (=> b!774282 m!718723))

(assert (=> b!773889 d!102053))

(declare-fun e!431005 () SeekEntryResult!7923)

(declare-fun b!774284 () Bool)

(assert (=> b!774284 (= e!431005 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131 #b00000000000000000000000000000001) (nextIndex!0 lt!344668 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328) lt!344664 lt!344669 mask!3328))))

(declare-fun b!774285 () Bool)

(declare-fun e!431001 () SeekEntryResult!7923)

(assert (=> b!774285 (= e!431001 (Intermediate!7923 true lt!344668 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774286 () Bool)

(declare-fun lt!344835 () SeekEntryResult!7923)

(assert (=> b!774286 (and (bvsge (index!34062 lt!344835) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344835) (size!20744 lt!344669)))))

(declare-fun res!523592 () Bool)

(assert (=> b!774286 (= res!523592 (= (select (arr!20323 lt!344669) (index!34062 lt!344835)) lt!344664))))

(declare-fun e!431003 () Bool)

(assert (=> b!774286 (=> res!523592 e!431003)))

(declare-fun e!431002 () Bool)

(assert (=> b!774286 (= e!431002 e!431003)))

(declare-fun b!774287 () Bool)

(declare-fun e!431004 () Bool)

(assert (=> b!774287 (= e!431004 (bvsge (x!64998 lt!344835) #b01111111111111111111111111111110))))

(declare-fun b!774288 () Bool)

(assert (=> b!774288 (= e!431001 e!431005)))

(declare-fun c!85746 () Bool)

(declare-fun lt!344836 () (_ BitVec 64))

(assert (=> b!774288 (= c!85746 (or (= lt!344836 lt!344664) (= (bvadd lt!344836 lt!344836) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!102055 () Bool)

(assert (=> d!102055 e!431004))

(declare-fun c!85747 () Bool)

(assert (=> d!102055 (= c!85747 (and ((_ is Intermediate!7923) lt!344835) (undefined!8735 lt!344835)))))

(assert (=> d!102055 (= lt!344835 e!431001)))

(declare-fun c!85748 () Bool)

(assert (=> d!102055 (= c!85748 (bvsge (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110))))

(assert (=> d!102055 (= lt!344836 (select (arr!20323 lt!344669) lt!344668))))

(assert (=> d!102055 (validMask!0 mask!3328)))

(assert (=> d!102055 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!344668 lt!344664 lt!344669 mask!3328) lt!344835)))

(declare-fun b!774289 () Bool)

(assert (=> b!774289 (= e!431004 e!431002)))

(declare-fun res!523593 () Bool)

(assert (=> b!774289 (= res!523593 (and ((_ is Intermediate!7923) lt!344835) (not (undefined!8735 lt!344835)) (bvslt (x!64998 lt!344835) #b01111111111111111111111111111110) (bvsge (x!64998 lt!344835) #b00000000000000000000000000000000) (bvsge (x!64998 lt!344835) (bvadd #b00000000000000000000000000000001 x!1131))))))

(assert (=> b!774289 (=> (not res!523593) (not e!431002))))

(declare-fun b!774290 () Bool)

(assert (=> b!774290 (and (bvsge (index!34062 lt!344835) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344835) (size!20744 lt!344669)))))

(declare-fun res!523594 () Bool)

(assert (=> b!774290 (= res!523594 (= (select (arr!20323 lt!344669) (index!34062 lt!344835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!774290 (=> res!523594 e!431003)))

(declare-fun b!774291 () Bool)

(assert (=> b!774291 (= e!431005 (Intermediate!7923 false lt!344668 (bvadd #b00000000000000000000000000000001 x!1131)))))

(declare-fun b!774292 () Bool)

(assert (=> b!774292 (and (bvsge (index!34062 lt!344835) #b00000000000000000000000000000000) (bvslt (index!34062 lt!344835) (size!20744 lt!344669)))))

(assert (=> b!774292 (= e!431003 (= (select (arr!20323 lt!344669) (index!34062 lt!344835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!102055 c!85748) b!774285))

(assert (= (and d!102055 (not c!85748)) b!774288))

(assert (= (and b!774288 c!85746) b!774291))

(assert (= (and b!774288 (not c!85746)) b!774284))

(assert (= (and d!102055 c!85747) b!774287))

(assert (= (and d!102055 (not c!85747)) b!774289))

(assert (= (and b!774289 res!523593) b!774286))

(assert (= (and b!774286 (not res!523592)) b!774290))

(assert (= (and b!774290 (not res!523594)) b!774292))

(assert (=> b!774284 m!718661))

(assert (=> b!774284 m!718661))

(declare-fun m!718805 () Bool)

(assert (=> b!774284 m!718805))

(declare-fun m!718807 () Bool)

(assert (=> b!774292 m!718807))

(assert (=> b!774286 m!718807))

(assert (=> b!774290 m!718807))

(declare-fun m!718809 () Bool)

(assert (=> d!102055 m!718809))

(assert (=> d!102055 m!718523))

(assert (=> b!773901 d!102055))

(check-sat (not b!774133) (not b!774284) (not d!102015) (not b!774134) (not b!774130) (not b!774094) (not d!102019) (not d!101975) (not b!774239) (not b!774235) (not b!774021) (not d!102047) (not d!102055) (not b!774184) (not b!774006) (not b!774206) (not bm!35161) (not b!774027) (not b!774129) (not d!101981) (not b!774137) (not d!102027) (not b!774248) (not b!774278) (not d!101993) (not b!774277) (not bm!35160) (not d!102049) (not bm!35164) (not b!774282) (not b!773996) (not d!102023) (not d!102045) (not d!101997) (not d!101973))
(check-sat)
