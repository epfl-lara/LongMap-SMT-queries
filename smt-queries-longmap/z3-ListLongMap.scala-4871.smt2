; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67258 () Bool)

(assert start!67258)

(declare-fun res!524942 () Bool)

(declare-fun e!432161 () Bool)

(assert (=> start!67258 (=> (not res!524942) (not e!432161))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67258 (= res!524942 (validMask!0 mask!3328))))

(assert (=> start!67258 e!432161))

(assert (=> start!67258 true))

(declare-datatypes ((array!42493 0))(
  ( (array!42494 (arr!20338 (Array (_ BitVec 32) (_ BitVec 64))) (size!20758 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42493)

(declare-fun array_inv!16197 (array!42493) Bool)

(assert (=> start!67258 (array_inv!16197 a!3186)))

(declare-fun b!776431 () Bool)

(declare-fun e!432155 () Bool)

(assert (=> b!776431 (= e!432161 e!432155)))

(declare-fun res!524941 () Bool)

(assert (=> b!776431 (=> (not res!524941) (not e!432155))))

(declare-datatypes ((SeekEntryResult!7894 0))(
  ( (MissingZero!7894 (index!33944 (_ BitVec 32))) (Found!7894 (index!33945 (_ BitVec 32))) (Intermediate!7894 (undefined!8706 Bool) (index!33946 (_ BitVec 32)) (x!65048 (_ BitVec 32))) (Undefined!7894) (MissingVacant!7894 (index!33947 (_ BitVec 32))) )
))
(declare-fun lt!345868 () SeekEntryResult!7894)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!776431 (= res!524941 (or (= lt!345868 (MissingZero!7894 i!1173)) (= lt!345868 (MissingVacant!7894 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42493 (_ BitVec 32)) SeekEntryResult!7894)

(assert (=> b!776431 (= lt!345868 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!776432 () Bool)

(declare-fun res!524939 () Bool)

(assert (=> b!776432 (=> (not res!524939) (not e!432155))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!776432 (= res!524939 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20758 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20758 a!3186))))))

(declare-fun b!776433 () Bool)

(declare-fun res!524936 () Bool)

(assert (=> b!776433 (=> (not res!524936) (not e!432161))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!776433 (= res!524936 (validKeyInArray!0 k0!2102))))

(declare-fun e!432162 () Bool)

(declare-fun b!776434 () Bool)

(declare-fun lt!345867 () SeekEntryResult!7894)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42493 (_ BitVec 32)) SeekEntryResult!7894)

(assert (=> b!776434 (= e!432162 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345867))))

(declare-fun b!776435 () Bool)

(declare-fun res!524946 () Bool)

(assert (=> b!776435 (=> (not res!524946) (not e!432155))))

(declare-datatypes ((List!14247 0))(
  ( (Nil!14244) (Cons!14243 (h!15357 (_ BitVec 64)) (t!20554 List!14247)) )
))
(declare-fun arrayNoDuplicates!0 (array!42493 (_ BitVec 32) List!14247) Bool)

(assert (=> b!776435 (= res!524946 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14244))))

(declare-fun b!776436 () Bool)

(declare-fun e!432160 () Bool)

(assert (=> b!776436 (= e!432155 e!432160)))

(declare-fun res!524940 () Bool)

(assert (=> b!776436 (=> (not res!524940) (not e!432160))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!776436 (= res!524940 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20338 a!3186) j!159) mask!3328) (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345867))))

(assert (=> b!776436 (= lt!345867 (Intermediate!7894 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!776437 () Bool)

(declare-fun e!432163 () Bool)

(assert (=> b!776437 (= e!432163 true)))

(declare-fun lt!345871 () SeekEntryResult!7894)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42493 (_ BitVec 32)) SeekEntryResult!7894)

(assert (=> b!776437 (= lt!345871 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20338 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!776438 () Bool)

(declare-fun res!524931 () Bool)

(assert (=> b!776438 (=> (not res!524931) (not e!432161))))

(assert (=> b!776438 (= res!524931 (validKeyInArray!0 (select (arr!20338 a!3186) j!159)))))

(declare-fun b!776439 () Bool)

(assert (=> b!776439 (= e!432162 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) (Found!7894 j!159)))))

(declare-fun b!776440 () Bool)

(declare-fun e!432158 () Bool)

(assert (=> b!776440 (= e!432160 e!432158)))

(declare-fun res!524935 () Bool)

(assert (=> b!776440 (=> (not res!524935) (not e!432158))))

(declare-fun lt!345874 () SeekEntryResult!7894)

(declare-fun lt!345872 () SeekEntryResult!7894)

(assert (=> b!776440 (= res!524935 (= lt!345874 lt!345872))))

(declare-fun lt!345866 () (_ BitVec 64))

(declare-fun lt!345870 () array!42493)

(assert (=> b!776440 (= lt!345872 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345866 lt!345870 mask!3328))))

(assert (=> b!776440 (= lt!345874 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345866 mask!3328) lt!345866 lt!345870 mask!3328))))

(assert (=> b!776440 (= lt!345866 (select (store (arr!20338 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!776440 (= lt!345870 (array!42494 (store (arr!20338 a!3186) i!1173 k0!2102) (size!20758 a!3186)))))

(declare-fun b!776441 () Bool)

(declare-fun res!524932 () Bool)

(assert (=> b!776441 (=> (not res!524932) (not e!432161))))

(assert (=> b!776441 (= res!524932 (and (= (size!20758 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20758 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20758 a!3186)) (not (= i!1173 j!159))))))

(declare-fun e!432157 () Bool)

(declare-fun lt!345869 () SeekEntryResult!7894)

(declare-fun b!776442 () Bool)

(assert (=> b!776442 (= e!432157 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345869))))

(declare-fun b!776443 () Bool)

(declare-fun res!524944 () Bool)

(assert (=> b!776443 (=> (not res!524944) (not e!432161))))

(declare-fun arrayContainsKey!0 (array!42493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!776443 (= res!524944 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!776444 () Bool)

(declare-fun res!524938 () Bool)

(assert (=> b!776444 (=> (not res!524938) (not e!432160))))

(assert (=> b!776444 (= res!524938 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20338 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!776445 () Bool)

(assert (=> b!776445 (= e!432158 (not e!432163))))

(declare-fun res!524937 () Bool)

(assert (=> b!776445 (=> res!524937 e!432163)))

(get-info :version)

(assert (=> b!776445 (= res!524937 (or (not ((_ is Intermediate!7894) lt!345872)) (bvslt x!1131 (x!65048 lt!345872)) (not (= x!1131 (x!65048 lt!345872))) (not (= index!1321 (index!33946 lt!345872)))))))

(declare-fun e!432159 () Bool)

(assert (=> b!776445 e!432159))

(declare-fun res!524943 () Bool)

(assert (=> b!776445 (=> (not res!524943) (not e!432159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42493 (_ BitVec 32)) Bool)

(assert (=> b!776445 (= res!524943 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26761 0))(
  ( (Unit!26762) )
))
(declare-fun lt!345873 () Unit!26761)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42493 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26761)

(assert (=> b!776445 (= lt!345873 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!776446 () Bool)

(declare-fun res!524945 () Bool)

(assert (=> b!776446 (=> (not res!524945) (not e!432160))))

(assert (=> b!776446 (= res!524945 e!432162)))

(declare-fun c!86153 () Bool)

(assert (=> b!776446 (= c!86153 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!776447 () Bool)

(declare-fun res!524934 () Bool)

(assert (=> b!776447 (=> (not res!524934) (not e!432155))))

(assert (=> b!776447 (= res!524934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!776448 () Bool)

(assert (=> b!776448 (= e!432159 e!432157)))

(declare-fun res!524933 () Bool)

(assert (=> b!776448 (=> (not res!524933) (not e!432157))))

(assert (=> b!776448 (= res!524933 (= (seekEntryOrOpen!0 (select (arr!20338 a!3186) j!159) a!3186 mask!3328) lt!345869))))

(assert (=> b!776448 (= lt!345869 (Found!7894 j!159))))

(assert (= (and start!67258 res!524942) b!776441))

(assert (= (and b!776441 res!524932) b!776438))

(assert (= (and b!776438 res!524931) b!776433))

(assert (= (and b!776433 res!524936) b!776443))

(assert (= (and b!776443 res!524944) b!776431))

(assert (= (and b!776431 res!524941) b!776447))

(assert (= (and b!776447 res!524934) b!776435))

(assert (= (and b!776435 res!524946) b!776432))

(assert (= (and b!776432 res!524939) b!776436))

(assert (= (and b!776436 res!524940) b!776444))

(assert (= (and b!776444 res!524938) b!776446))

(assert (= (and b!776446 c!86153) b!776434))

(assert (= (and b!776446 (not c!86153)) b!776439))

(assert (= (and b!776446 res!524945) b!776440))

(assert (= (and b!776440 res!524935) b!776445))

(assert (= (and b!776445 res!524943) b!776448))

(assert (= (and b!776448 res!524933) b!776442))

(assert (= (and b!776445 (not res!524937)) b!776437))

(declare-fun m!721025 () Bool)

(assert (=> b!776431 m!721025))

(declare-fun m!721027 () Bool)

(assert (=> b!776440 m!721027))

(declare-fun m!721029 () Bool)

(assert (=> b!776440 m!721029))

(declare-fun m!721031 () Bool)

(assert (=> b!776440 m!721031))

(declare-fun m!721033 () Bool)

(assert (=> b!776440 m!721033))

(assert (=> b!776440 m!721027))

(declare-fun m!721035 () Bool)

(assert (=> b!776440 m!721035))

(declare-fun m!721037 () Bool)

(assert (=> b!776437 m!721037))

(assert (=> b!776437 m!721037))

(declare-fun m!721039 () Bool)

(assert (=> b!776437 m!721039))

(declare-fun m!721041 () Bool)

(assert (=> b!776435 m!721041))

(declare-fun m!721043 () Bool)

(assert (=> b!776443 m!721043))

(assert (=> b!776436 m!721037))

(assert (=> b!776436 m!721037))

(declare-fun m!721045 () Bool)

(assert (=> b!776436 m!721045))

(assert (=> b!776436 m!721045))

(assert (=> b!776436 m!721037))

(declare-fun m!721047 () Bool)

(assert (=> b!776436 m!721047))

(declare-fun m!721049 () Bool)

(assert (=> start!67258 m!721049))

(declare-fun m!721051 () Bool)

(assert (=> start!67258 m!721051))

(declare-fun m!721053 () Bool)

(assert (=> b!776445 m!721053))

(declare-fun m!721055 () Bool)

(assert (=> b!776445 m!721055))

(assert (=> b!776434 m!721037))

(assert (=> b!776434 m!721037))

(declare-fun m!721057 () Bool)

(assert (=> b!776434 m!721057))

(assert (=> b!776438 m!721037))

(assert (=> b!776438 m!721037))

(declare-fun m!721059 () Bool)

(assert (=> b!776438 m!721059))

(assert (=> b!776448 m!721037))

(assert (=> b!776448 m!721037))

(declare-fun m!721061 () Bool)

(assert (=> b!776448 m!721061))

(assert (=> b!776442 m!721037))

(assert (=> b!776442 m!721037))

(declare-fun m!721063 () Bool)

(assert (=> b!776442 m!721063))

(declare-fun m!721065 () Bool)

(assert (=> b!776444 m!721065))

(declare-fun m!721067 () Bool)

(assert (=> b!776447 m!721067))

(assert (=> b!776439 m!721037))

(assert (=> b!776439 m!721037))

(assert (=> b!776439 m!721039))

(declare-fun m!721069 () Bool)

(assert (=> b!776433 m!721069))

(check-sat (not b!776436) (not b!776447) (not b!776435) (not b!776431) (not b!776439) (not b!776433) (not b!776434) (not b!776437) (not b!776442) (not b!776438) (not start!67258) (not b!776440) (not b!776448) (not b!776445) (not b!776443))
(check-sat)
