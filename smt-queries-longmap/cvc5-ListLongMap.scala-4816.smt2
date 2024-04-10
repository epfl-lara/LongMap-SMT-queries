; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66236 () Bool)

(assert start!66236)

(declare-fun b!762893 () Bool)

(declare-fun res!515948 () Bool)

(declare-fun e!425168 () Bool)

(assert (=> b!762893 (=> (not res!515948) (not e!425168))))

(declare-datatypes ((array!42141 0))(
  ( (array!42142 (arr!20178 (Array (_ BitVec 32) (_ BitVec 64))) (size!20599 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42141)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!762893 (= res!515948 (validKeyInArray!0 (select (arr!20178 a!3186) j!159)))))

(declare-fun b!762894 () Bool)

(declare-fun res!515949 () Bool)

(declare-fun e!425167 () Bool)

(assert (=> b!762894 (=> (not res!515949) (not e!425167))))

(declare-datatypes ((List!14180 0))(
  ( (Nil!14177) (Cons!14176 (h!15260 (_ BitVec 64)) (t!20495 List!14180)) )
))
(declare-fun arrayNoDuplicates!0 (array!42141 (_ BitVec 32) List!14180) Bool)

(assert (=> b!762894 (= res!515949 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14177))))

(declare-fun b!762895 () Bool)

(declare-fun res!515950 () Bool)

(assert (=> b!762895 (=> (not res!515950) (not e!425167))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!762895 (= res!515950 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20599 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20599 a!3186))))))

(declare-fun b!762896 () Bool)

(declare-fun res!515947 () Bool)

(assert (=> b!762896 (=> (not res!515947) (not e!425168))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!762896 (= res!515947 (and (= (size!20599 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20599 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20599 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!762897 () Bool)

(declare-fun res!515946 () Bool)

(assert (=> b!762897 (=> (not res!515946) (not e!425168))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!762897 (= res!515946 (validKeyInArray!0 k!2102))))

(declare-fun b!762899 () Bool)

(assert (=> b!762899 (= e!425168 e!425167)))

(declare-fun res!515955 () Bool)

(assert (=> b!762899 (=> (not res!515955) (not e!425167))))

(declare-datatypes ((SeekEntryResult!7778 0))(
  ( (MissingZero!7778 (index!33480 (_ BitVec 32))) (Found!7778 (index!33481 (_ BitVec 32))) (Intermediate!7778 (undefined!8590 Bool) (index!33482 (_ BitVec 32)) (x!64390 (_ BitVec 32))) (Undefined!7778) (MissingVacant!7778 (index!33483 (_ BitVec 32))) )
))
(declare-fun lt!339676 () SeekEntryResult!7778)

(assert (=> b!762899 (= res!515955 (or (= lt!339676 (MissingZero!7778 i!1173)) (= lt!339676 (MissingVacant!7778 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42141 (_ BitVec 32)) SeekEntryResult!7778)

(assert (=> b!762899 (= lt!339676 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!762900 () Bool)

(declare-fun e!425165 () Bool)

(assert (=> b!762900 (= e!425165 false)))

(declare-fun lt!339677 () Bool)

(declare-fun e!425166 () Bool)

(assert (=> b!762900 (= lt!339677 e!425166)))

(declare-fun c!83860 () Bool)

(assert (=> b!762900 (= c!83860 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!762901 () Bool)

(assert (=> b!762901 (= e!425167 e!425165)))

(declare-fun res!515956 () Bool)

(assert (=> b!762901 (=> (not res!515956) (not e!425165))))

(declare-fun lt!339675 () SeekEntryResult!7778)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42141 (_ BitVec 32)) SeekEntryResult!7778)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!762901 (= res!515956 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20178 a!3186) j!159) mask!3328) (select (arr!20178 a!3186) j!159) a!3186 mask!3328) lt!339675))))

(assert (=> b!762901 (= lt!339675 (Intermediate!7778 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!762902 () Bool)

(declare-fun res!515952 () Bool)

(assert (=> b!762902 (=> (not res!515952) (not e!425165))))

(assert (=> b!762902 (= res!515952 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20178 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!762903 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42141 (_ BitVec 32)) SeekEntryResult!7778)

(assert (=> b!762903 (= e!425166 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20178 a!3186) j!159) a!3186 mask!3328) (Found!7778 j!159))))))

(declare-fun b!762904 () Bool)

(declare-fun res!515954 () Bool)

(assert (=> b!762904 (=> (not res!515954) (not e!425168))))

(declare-fun arrayContainsKey!0 (array!42141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!762904 (= res!515954 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!762905 () Bool)

(declare-fun res!515951 () Bool)

(assert (=> b!762905 (=> (not res!515951) (not e!425167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42141 (_ BitVec 32)) Bool)

(assert (=> b!762905 (= res!515951 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!762898 () Bool)

(assert (=> b!762898 (= e!425166 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20178 a!3186) j!159) a!3186 mask!3328) lt!339675)))))

(declare-fun res!515953 () Bool)

(assert (=> start!66236 (=> (not res!515953) (not e!425168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66236 (= res!515953 (validMask!0 mask!3328))))

(assert (=> start!66236 e!425168))

(assert (=> start!66236 true))

(declare-fun array_inv!15974 (array!42141) Bool)

(assert (=> start!66236 (array_inv!15974 a!3186)))

(assert (= (and start!66236 res!515953) b!762896))

(assert (= (and b!762896 res!515947) b!762893))

(assert (= (and b!762893 res!515948) b!762897))

(assert (= (and b!762897 res!515946) b!762904))

(assert (= (and b!762904 res!515954) b!762899))

(assert (= (and b!762899 res!515955) b!762905))

(assert (= (and b!762905 res!515951) b!762894))

(assert (= (and b!762894 res!515949) b!762895))

(assert (= (and b!762895 res!515950) b!762901))

(assert (= (and b!762901 res!515956) b!762902))

(assert (= (and b!762902 res!515952) b!762900))

(assert (= (and b!762900 c!83860) b!762898))

(assert (= (and b!762900 (not c!83860)) b!762903))

(declare-fun m!709515 () Bool)

(assert (=> b!762893 m!709515))

(assert (=> b!762893 m!709515))

(declare-fun m!709517 () Bool)

(assert (=> b!762893 m!709517))

(declare-fun m!709519 () Bool)

(assert (=> b!762897 m!709519))

(declare-fun m!709521 () Bool)

(assert (=> b!762904 m!709521))

(assert (=> b!762898 m!709515))

(assert (=> b!762898 m!709515))

(declare-fun m!709523 () Bool)

(assert (=> b!762898 m!709523))

(declare-fun m!709525 () Bool)

(assert (=> b!762905 m!709525))

(declare-fun m!709527 () Bool)

(assert (=> b!762902 m!709527))

(declare-fun m!709529 () Bool)

(assert (=> b!762894 m!709529))

(declare-fun m!709531 () Bool)

(assert (=> b!762899 m!709531))

(assert (=> b!762903 m!709515))

(assert (=> b!762903 m!709515))

(declare-fun m!709533 () Bool)

(assert (=> b!762903 m!709533))

(declare-fun m!709535 () Bool)

(assert (=> start!66236 m!709535))

(declare-fun m!709537 () Bool)

(assert (=> start!66236 m!709537))

(assert (=> b!762901 m!709515))

(assert (=> b!762901 m!709515))

(declare-fun m!709539 () Bool)

(assert (=> b!762901 m!709539))

(assert (=> b!762901 m!709539))

(assert (=> b!762901 m!709515))

(declare-fun m!709541 () Bool)

(assert (=> b!762901 m!709541))

(push 1)

