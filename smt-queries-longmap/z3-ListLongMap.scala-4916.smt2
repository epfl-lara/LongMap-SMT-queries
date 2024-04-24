; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!67858 () Bool)

(assert start!67858)

(declare-fun b!786887 () Bool)

(declare-fun res!532609 () Bool)

(declare-fun e!437496 () Bool)

(assert (=> b!786887 (=> (not res!532609) (not e!437496))))

(declare-fun e!437498 () Bool)

(assert (=> b!786887 (= res!532609 e!437498)))

(declare-fun c!87556 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786887 (= c!87556 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786888 () Bool)

(declare-fun e!437499 () Bool)

(declare-fun e!437491 () Bool)

(assert (=> b!786888 (= e!437499 e!437491)))

(declare-fun res!532604 () Bool)

(assert (=> b!786888 (=> (not res!532604) (not e!437491))))

(declare-datatypes ((SeekEntryResult!8029 0))(
  ( (MissingZero!8029 (index!34484 (_ BitVec 32))) (Found!8029 (index!34485 (_ BitVec 32))) (Intermediate!8029 (undefined!8841 Bool) (index!34486 (_ BitVec 32)) (x!65588 (_ BitVec 32))) (Undefined!8029) (MissingVacant!8029 (index!34487 (_ BitVec 32))) )
))
(declare-fun lt!350900 () SeekEntryResult!8029)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786888 (= res!532604 (or (= lt!350900 (MissingZero!8029 i!1173)) (= lt!350900 (MissingVacant!8029 i!1173))))))

(declare-datatypes ((array!42778 0))(
  ( (array!42779 (arr!20473 (Array (_ BitVec 32) (_ BitVec 64))) (size!20893 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42778)

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42778 (_ BitVec 32)) SeekEntryResult!8029)

(assert (=> b!786888 (= lt!350900 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun lt!350899 () SeekEntryResult!8029)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!786889 () Bool)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42778 (_ BitVec 32)) SeekEntryResult!8029)

(assert (=> b!786889 (= e!437498 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20473 a!3186) j!159) a!3186 mask!3328) lt!350899))))

(declare-fun b!786890 () Bool)

(declare-fun res!532605 () Bool)

(assert (=> b!786890 (=> (not res!532605) (not e!437499))))

(declare-fun arrayContainsKey!0 (array!42778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786890 (= res!532605 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!786891 () Bool)

(declare-datatypes ((Unit!27181 0))(
  ( (Unit!27182) )
))
(declare-fun e!437497 () Unit!27181)

(declare-fun Unit!27183 () Unit!27181)

(assert (=> b!786891 (= e!437497 Unit!27183)))

(assert (=> b!786891 false))

(declare-fun b!786892 () Bool)

(declare-fun res!532614 () Bool)

(assert (=> b!786892 (=> (not res!532614) (not e!437499))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786892 (= res!532614 (validKeyInArray!0 k0!2102))))

(declare-fun res!532602 () Bool)

(assert (=> start!67858 (=> (not res!532602) (not e!437499))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67858 (= res!532602 (validMask!0 mask!3328))))

(assert (=> start!67858 e!437499))

(assert (=> start!67858 true))

(declare-fun array_inv!16332 (array!42778) Bool)

(assert (=> start!67858 (array_inv!16332 a!3186)))

(declare-fun b!786893 () Bool)

(declare-fun res!532599 () Bool)

(declare-fun e!437495 () Bool)

(assert (=> b!786893 (=> (not res!532599) (not e!437495))))

(declare-fun lt!350907 () array!42778)

(declare-fun lt!350908 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42778 (_ BitVec 32)) SeekEntryResult!8029)

(assert (=> b!786893 (= res!532599 (= (seekEntryOrOpen!0 lt!350908 lt!350907 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350908 lt!350907 mask!3328)))))

(declare-fun b!786894 () Bool)

(declare-fun res!532597 () Bool)

(assert (=> b!786894 (=> (not res!532597) (not e!437499))))

(assert (=> b!786894 (= res!532597 (and (= (size!20893 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20893 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20893 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786895 () Bool)

(declare-fun res!532610 () Bool)

(assert (=> b!786895 (=> (not res!532610) (not e!437491))))

(declare-datatypes ((List!14382 0))(
  ( (Nil!14379) (Cons!14378 (h!15507 (_ BitVec 64)) (t!20689 List!14382)) )
))
(declare-fun arrayNoDuplicates!0 (array!42778 (_ BitVec 32) List!14382) Bool)

(assert (=> b!786895 (= res!532610 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14379))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!786896 () Bool)

(assert (=> b!786896 (= e!437498 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20473 a!3186) j!159) a!3186 mask!3328) (Found!8029 j!159)))))

(declare-fun b!786897 () Bool)

(assert (=> b!786897 (= e!437491 e!437496)))

(declare-fun res!532601 () Bool)

(assert (=> b!786897 (=> (not res!532601) (not e!437496))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786897 (= res!532601 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20473 a!3186) j!159) mask!3328) (select (arr!20473 a!3186) j!159) a!3186 mask!3328) lt!350899))))

(assert (=> b!786897 (= lt!350899 (Intermediate!8029 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786898 () Bool)

(declare-fun e!437493 () Bool)

(declare-fun e!437490 () Bool)

(assert (=> b!786898 (= e!437493 e!437490)))

(declare-fun res!532596 () Bool)

(assert (=> b!786898 (=> res!532596 e!437490)))

(declare-fun lt!350904 () SeekEntryResult!8029)

(declare-fun lt!350902 () SeekEntryResult!8029)

(assert (=> b!786898 (= res!532596 (not (= lt!350904 lt!350902)))))

(assert (=> b!786898 (= lt!350904 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20473 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786899 () Bool)

(declare-fun res!532606 () Bool)

(assert (=> b!786899 (=> (not res!532606) (not e!437496))))

(assert (=> b!786899 (= res!532606 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20473 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786900 () Bool)

(declare-fun e!437500 () Bool)

(assert (=> b!786900 (= e!437500 (not e!437493))))

(declare-fun res!532607 () Bool)

(assert (=> b!786900 (=> res!532607 e!437493)))

(declare-fun lt!350903 () SeekEntryResult!8029)

(get-info :version)

(assert (=> b!786900 (= res!532607 (or (not ((_ is Intermediate!8029) lt!350903)) (bvslt x!1131 (x!65588 lt!350903)) (not (= x!1131 (x!65588 lt!350903))) (not (= index!1321 (index!34486 lt!350903)))))))

(declare-fun e!437492 () Bool)

(assert (=> b!786900 e!437492))

(declare-fun res!532598 () Bool)

(assert (=> b!786900 (=> (not res!532598) (not e!437492))))

(declare-fun lt!350901 () SeekEntryResult!8029)

(assert (=> b!786900 (= res!532598 (= lt!350901 lt!350902))))

(assert (=> b!786900 (= lt!350902 (Found!8029 j!159))))

(assert (=> b!786900 (= lt!350901 (seekEntryOrOpen!0 (select (arr!20473 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42778 (_ BitVec 32)) Bool)

(assert (=> b!786900 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350898 () Unit!27181)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27181)

(assert (=> b!786900 (= lt!350898 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786901 () Bool)

(declare-fun Unit!27184 () Unit!27181)

(assert (=> b!786901 (= e!437497 Unit!27184)))

(declare-fun b!786902 () Bool)

(assert (=> b!786902 (= e!437496 e!437500)))

(declare-fun res!532613 () Bool)

(assert (=> b!786902 (=> (not res!532613) (not e!437500))))

(declare-fun lt!350897 () SeekEntryResult!8029)

(assert (=> b!786902 (= res!532613 (= lt!350897 lt!350903))))

(assert (=> b!786902 (= lt!350903 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350908 lt!350907 mask!3328))))

(assert (=> b!786902 (= lt!350897 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350908 mask!3328) lt!350908 lt!350907 mask!3328))))

(assert (=> b!786902 (= lt!350908 (select (store (arr!20473 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!786902 (= lt!350907 (array!42779 (store (arr!20473 a!3186) i!1173 k0!2102) (size!20893 a!3186)))))

(declare-fun b!786903 () Bool)

(declare-fun res!532600 () Bool)

(assert (=> b!786903 (=> (not res!532600) (not e!437491))))

(assert (=> b!786903 (= res!532600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!786904 () Bool)

(assert (=> b!786904 (= e!437495 (= lt!350901 lt!350904))))

(declare-fun b!786905 () Bool)

(assert (=> b!786905 (= e!437492 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20473 a!3186) j!159) a!3186 mask!3328) lt!350902))))

(declare-fun b!786906 () Bool)

(declare-fun res!532612 () Bool)

(assert (=> b!786906 (=> (not res!532612) (not e!437499))))

(assert (=> b!786906 (= res!532612 (validKeyInArray!0 (select (arr!20473 a!3186) j!159)))))

(declare-fun b!786907 () Bool)

(declare-fun res!532603 () Bool)

(assert (=> b!786907 (=> (not res!532603) (not e!437491))))

(assert (=> b!786907 (= res!532603 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20893 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20893 a!3186))))))

(declare-fun b!786908 () Bool)

(declare-fun e!437494 () Bool)

(assert (=> b!786908 (= e!437494 true)))

(assert (=> b!786908 e!437495))

(declare-fun res!532608 () Bool)

(assert (=> b!786908 (=> (not res!532608) (not e!437495))))

(declare-fun lt!350905 () (_ BitVec 64))

(assert (=> b!786908 (= res!532608 (= lt!350905 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350906 () Unit!27181)

(assert (=> b!786908 (= lt!350906 e!437497)))

(declare-fun c!87557 () Bool)

(assert (=> b!786908 (= c!87557 (= lt!350905 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786909 () Bool)

(assert (=> b!786909 (= e!437490 e!437494)))

(declare-fun res!532611 () Bool)

(assert (=> b!786909 (=> res!532611 e!437494)))

(assert (=> b!786909 (= res!532611 (= lt!350905 lt!350908))))

(assert (=> b!786909 (= lt!350905 (select (store (arr!20473 a!3186) i!1173 k0!2102) index!1321))))

(assert (= (and start!67858 res!532602) b!786894))

(assert (= (and b!786894 res!532597) b!786906))

(assert (= (and b!786906 res!532612) b!786892))

(assert (= (and b!786892 res!532614) b!786890))

(assert (= (and b!786890 res!532605) b!786888))

(assert (= (and b!786888 res!532604) b!786903))

(assert (= (and b!786903 res!532600) b!786895))

(assert (= (and b!786895 res!532610) b!786907))

(assert (= (and b!786907 res!532603) b!786897))

(assert (= (and b!786897 res!532601) b!786899))

(assert (= (and b!786899 res!532606) b!786887))

(assert (= (and b!786887 c!87556) b!786889))

(assert (= (and b!786887 (not c!87556)) b!786896))

(assert (= (and b!786887 res!532609) b!786902))

(assert (= (and b!786902 res!532613) b!786900))

(assert (= (and b!786900 res!532598) b!786905))

(assert (= (and b!786900 (not res!532607)) b!786898))

(assert (= (and b!786898 (not res!532596)) b!786909))

(assert (= (and b!786909 (not res!532611)) b!786908))

(assert (= (and b!786908 c!87557) b!786891))

(assert (= (and b!786908 (not c!87557)) b!786901))

(assert (= (and b!786908 res!532608) b!786893))

(assert (= (and b!786893 res!532599) b!786904))

(declare-fun m!729179 () Bool)

(assert (=> b!786905 m!729179))

(assert (=> b!786905 m!729179))

(declare-fun m!729181 () Bool)

(assert (=> b!786905 m!729181))

(declare-fun m!729183 () Bool)

(assert (=> b!786909 m!729183))

(declare-fun m!729185 () Bool)

(assert (=> b!786909 m!729185))

(assert (=> b!786900 m!729179))

(assert (=> b!786900 m!729179))

(declare-fun m!729187 () Bool)

(assert (=> b!786900 m!729187))

(declare-fun m!729189 () Bool)

(assert (=> b!786900 m!729189))

(declare-fun m!729191 () Bool)

(assert (=> b!786900 m!729191))

(assert (=> b!786896 m!729179))

(assert (=> b!786896 m!729179))

(declare-fun m!729193 () Bool)

(assert (=> b!786896 m!729193))

(declare-fun m!729195 () Bool)

(assert (=> b!786902 m!729195))

(declare-fun m!729197 () Bool)

(assert (=> b!786902 m!729197))

(declare-fun m!729199 () Bool)

(assert (=> b!786902 m!729199))

(assert (=> b!786902 m!729195))

(declare-fun m!729201 () Bool)

(assert (=> b!786902 m!729201))

(assert (=> b!786902 m!729183))

(assert (=> b!786889 m!729179))

(assert (=> b!786889 m!729179))

(declare-fun m!729203 () Bool)

(assert (=> b!786889 m!729203))

(assert (=> b!786897 m!729179))

(assert (=> b!786897 m!729179))

(declare-fun m!729205 () Bool)

(assert (=> b!786897 m!729205))

(assert (=> b!786897 m!729205))

(assert (=> b!786897 m!729179))

(declare-fun m!729207 () Bool)

(assert (=> b!786897 m!729207))

(declare-fun m!729209 () Bool)

(assert (=> b!786895 m!729209))

(assert (=> b!786906 m!729179))

(assert (=> b!786906 m!729179))

(declare-fun m!729211 () Bool)

(assert (=> b!786906 m!729211))

(declare-fun m!729213 () Bool)

(assert (=> b!786893 m!729213))

(declare-fun m!729215 () Bool)

(assert (=> b!786893 m!729215))

(assert (=> b!786898 m!729179))

(assert (=> b!786898 m!729179))

(assert (=> b!786898 m!729193))

(declare-fun m!729217 () Bool)

(assert (=> b!786888 m!729217))

(declare-fun m!729219 () Bool)

(assert (=> start!67858 m!729219))

(declare-fun m!729221 () Bool)

(assert (=> start!67858 m!729221))

(declare-fun m!729223 () Bool)

(assert (=> b!786892 m!729223))

(declare-fun m!729225 () Bool)

(assert (=> b!786903 m!729225))

(declare-fun m!729227 () Bool)

(assert (=> b!786899 m!729227))

(declare-fun m!729229 () Bool)

(assert (=> b!786890 m!729229))

(check-sat (not b!786890) (not b!786895) (not b!786897) (not b!786896) (not b!786903) (not b!786892) (not b!786905) (not b!786906) (not start!67858) (not b!786889) (not b!786893) (not b!786900) (not b!786902) (not b!786898) (not b!786888))
(check-sat)
