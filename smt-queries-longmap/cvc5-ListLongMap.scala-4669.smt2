; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64930 () Bool)

(assert start!64930)

(declare-fun b!732924 () Bool)

(declare-fun res!492465 () Bool)

(declare-fun e!410111 () Bool)

(assert (=> b!732924 (=> (not res!492465) (not e!410111))))

(declare-fun e!410118 () Bool)

(assert (=> b!732924 (= res!492465 e!410118)))

(declare-fun c!80608 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!732924 (= c!80608 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!732925 () Bool)

(declare-fun e!410112 () Bool)

(declare-fun e!410115 () Bool)

(assert (=> b!732925 (= e!410112 (not e!410115))))

(declare-fun res!492463 () Bool)

(assert (=> b!732925 (=> res!492463 e!410115)))

(declare-datatypes ((SeekEntryResult!7337 0))(
  ( (MissingZero!7337 (index!31716 (_ BitVec 32))) (Found!7337 (index!31717 (_ BitVec 32))) (Intermediate!7337 (undefined!8149 Bool) (index!31718 (_ BitVec 32)) (x!62711 (_ BitVec 32))) (Undefined!7337) (MissingVacant!7337 (index!31719 (_ BitVec 32))) )
))
(declare-fun lt!324821 () SeekEntryResult!7337)

(assert (=> b!732925 (= res!492463 (or (not (is-Intermediate!7337 lt!324821)) (bvsge x!1131 (x!62711 lt!324821))))))

(declare-fun e!410120 () Bool)

(assert (=> b!732925 e!410120))

(declare-fun res!492479 () Bool)

(assert (=> b!732925 (=> (not res!492479) (not e!410120))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((array!41241 0))(
  ( (array!41242 (arr!19737 (Array (_ BitVec 32) (_ BitVec 64))) (size!20158 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41241)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41241 (_ BitVec 32)) Bool)

(assert (=> b!732925 (= res!492479 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24992 0))(
  ( (Unit!24993) )
))
(declare-fun lt!324822 () Unit!24992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41241 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24992)

(assert (=> b!732925 (= lt!324822 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!410116 () Bool)

(declare-fun lt!324818 () SeekEntryResult!7337)

(declare-fun b!732926 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41241 (_ BitVec 32)) SeekEntryResult!7337)

(assert (=> b!732926 (= e!410116 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19737 a!3186) j!159) a!3186 mask!3328) lt!324818))))

(declare-fun b!732927 () Bool)

(declare-fun e!410114 () Bool)

(assert (=> b!732927 (= e!410114 true)))

(declare-fun lt!324823 () SeekEntryResult!7337)

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!732927 (= lt!324823 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19737 a!3186) j!159) a!3186 mask!3328))))

(declare-fun res!492473 () Bool)

(declare-fun e!410113 () Bool)

(assert (=> start!64930 (=> (not res!492473) (not e!410113))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64930 (= res!492473 (validMask!0 mask!3328))))

(assert (=> start!64930 e!410113))

(assert (=> start!64930 true))

(declare-fun array_inv!15533 (array!41241) Bool)

(assert (=> start!64930 (array_inv!15533 a!3186)))

(declare-fun b!732928 () Bool)

(declare-fun e!410117 () Bool)

(assert (=> b!732928 (= e!410113 e!410117)))

(declare-fun res!492475 () Bool)

(assert (=> b!732928 (=> (not res!492475) (not e!410117))))

(declare-fun lt!324825 () SeekEntryResult!7337)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!732928 (= res!492475 (or (= lt!324825 (MissingZero!7337 i!1173)) (= lt!324825 (MissingVacant!7337 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41241 (_ BitVec 32)) SeekEntryResult!7337)

(assert (=> b!732928 (= lt!324825 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!732929 () Bool)

(declare-fun res!492477 () Bool)

(assert (=> b!732929 (=> (not res!492477) (not e!410113))))

(declare-fun arrayContainsKey!0 (array!41241 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!732929 (= res!492477 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!732930 () Bool)

(declare-fun res!492468 () Bool)

(assert (=> b!732930 (=> (not res!492468) (not e!410111))))

(assert (=> b!732930 (= res!492468 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19737 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!732931 () Bool)

(declare-fun res!492472 () Bool)

(assert (=> b!732931 (=> (not res!492472) (not e!410113))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!732931 (= res!492472 (validKeyInArray!0 k!2102))))

(declare-fun b!732932 () Bool)

(assert (=> b!732932 (= e!410115 e!410114)))

(declare-fun res!492464 () Bool)

(assert (=> b!732932 (=> res!492464 e!410114)))

(assert (=> b!732932 (= res!492464 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun lt!324820 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732932 (= lt!324820 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!732933 () Bool)

(declare-fun res!492470 () Bool)

(assert (=> b!732933 (=> (not res!492470) (not e!410113))))

(assert (=> b!732933 (= res!492470 (validKeyInArray!0 (select (arr!19737 a!3186) j!159)))))

(declare-fun b!732934 () Bool)

(assert (=> b!732934 (= e!410117 e!410111)))

(declare-fun res!492466 () Bool)

(assert (=> b!732934 (=> (not res!492466) (not e!410111))))

(declare-fun lt!324824 () SeekEntryResult!7337)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41241 (_ BitVec 32)) SeekEntryResult!7337)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!732934 (= res!492466 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19737 a!3186) j!159) mask!3328) (select (arr!19737 a!3186) j!159) a!3186 mask!3328) lt!324824))))

(assert (=> b!732934 (= lt!324824 (Intermediate!7337 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!732935 () Bool)

(declare-fun res!492478 () Bool)

(assert (=> b!732935 (=> (not res!492478) (not e!410117))))

(assert (=> b!732935 (= res!492478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!732936 () Bool)

(assert (=> b!732936 (= e!410111 e!410112)))

(declare-fun res!492474 () Bool)

(assert (=> b!732936 (=> (not res!492474) (not e!410112))))

(declare-fun lt!324827 () SeekEntryResult!7337)

(assert (=> b!732936 (= res!492474 (= lt!324827 lt!324821))))

(declare-fun lt!324819 () (_ BitVec 64))

(declare-fun lt!324826 () array!41241)

(assert (=> b!732936 (= lt!324821 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!324819 lt!324826 mask!3328))))

(assert (=> b!732936 (= lt!324827 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!324819 mask!3328) lt!324819 lt!324826 mask!3328))))

(assert (=> b!732936 (= lt!324819 (select (store (arr!19737 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!732936 (= lt!324826 (array!41242 (store (arr!19737 a!3186) i!1173 k!2102) (size!20158 a!3186)))))

(declare-fun b!732937 () Bool)

(assert (=> b!732937 (= e!410120 e!410116)))

(declare-fun res!492469 () Bool)

(assert (=> b!732937 (=> (not res!492469) (not e!410116))))

(assert (=> b!732937 (= res!492469 (= (seekEntryOrOpen!0 (select (arr!19737 a!3186) j!159) a!3186 mask!3328) lt!324818))))

(assert (=> b!732937 (= lt!324818 (Found!7337 j!159))))

(declare-fun b!732938 () Bool)

(assert (=> b!732938 (= e!410118 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19737 a!3186) j!159) a!3186 mask!3328) (Found!7337 j!159)))))

(declare-fun b!732939 () Bool)

(declare-fun res!492476 () Bool)

(assert (=> b!732939 (=> (not res!492476) (not e!410117))))

(declare-datatypes ((List!13739 0))(
  ( (Nil!13736) (Cons!13735 (h!14801 (_ BitVec 64)) (t!20054 List!13739)) )
))
(declare-fun arrayNoDuplicates!0 (array!41241 (_ BitVec 32) List!13739) Bool)

(assert (=> b!732939 (= res!492476 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13736))))

(declare-fun b!732940 () Bool)

(declare-fun res!492467 () Bool)

(assert (=> b!732940 (=> (not res!492467) (not e!410113))))

(assert (=> b!732940 (= res!492467 (and (= (size!20158 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20158 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20158 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!732941 () Bool)

(assert (=> b!732941 (= e!410118 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19737 a!3186) j!159) a!3186 mask!3328) lt!324824))))

(declare-fun b!732942 () Bool)

(declare-fun res!492471 () Bool)

(assert (=> b!732942 (=> (not res!492471) (not e!410117))))

(assert (=> b!732942 (= res!492471 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20158 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20158 a!3186))))))

(assert (= (and start!64930 res!492473) b!732940))

(assert (= (and b!732940 res!492467) b!732933))

(assert (= (and b!732933 res!492470) b!732931))

(assert (= (and b!732931 res!492472) b!732929))

(assert (= (and b!732929 res!492477) b!732928))

(assert (= (and b!732928 res!492475) b!732935))

(assert (= (and b!732935 res!492478) b!732939))

(assert (= (and b!732939 res!492476) b!732942))

(assert (= (and b!732942 res!492471) b!732934))

(assert (= (and b!732934 res!492466) b!732930))

(assert (= (and b!732930 res!492468) b!732924))

(assert (= (and b!732924 c!80608) b!732941))

(assert (= (and b!732924 (not c!80608)) b!732938))

(assert (= (and b!732924 res!492465) b!732936))

(assert (= (and b!732936 res!492474) b!732925))

(assert (= (and b!732925 res!492479) b!732937))

(assert (= (and b!732937 res!492469) b!732926))

(assert (= (and b!732925 (not res!492463)) b!732932))

(assert (= (and b!732932 (not res!492464)) b!732927))

(declare-fun m!685903 () Bool)

(assert (=> b!732927 m!685903))

(assert (=> b!732927 m!685903))

(declare-fun m!685905 () Bool)

(assert (=> b!732927 m!685905))

(declare-fun m!685907 () Bool)

(assert (=> b!732939 m!685907))

(assert (=> b!732934 m!685903))

(assert (=> b!732934 m!685903))

(declare-fun m!685909 () Bool)

(assert (=> b!732934 m!685909))

(assert (=> b!732934 m!685909))

(assert (=> b!732934 m!685903))

(declare-fun m!685911 () Bool)

(assert (=> b!732934 m!685911))

(declare-fun m!685913 () Bool)

(assert (=> b!732929 m!685913))

(assert (=> b!732937 m!685903))

(assert (=> b!732937 m!685903))

(declare-fun m!685915 () Bool)

(assert (=> b!732937 m!685915))

(assert (=> b!732926 m!685903))

(assert (=> b!732926 m!685903))

(declare-fun m!685917 () Bool)

(assert (=> b!732926 m!685917))

(assert (=> b!732938 m!685903))

(assert (=> b!732938 m!685903))

(assert (=> b!732938 m!685905))

(declare-fun m!685919 () Bool)

(assert (=> b!732936 m!685919))

(declare-fun m!685921 () Bool)

(assert (=> b!732936 m!685921))

(declare-fun m!685923 () Bool)

(assert (=> b!732936 m!685923))

(assert (=> b!732936 m!685919))

(declare-fun m!685925 () Bool)

(assert (=> b!732936 m!685925))

(declare-fun m!685927 () Bool)

(assert (=> b!732936 m!685927))

(declare-fun m!685929 () Bool)

(assert (=> b!732928 m!685929))

(declare-fun m!685931 () Bool)

(assert (=> b!732931 m!685931))

(assert (=> b!732941 m!685903))

(assert (=> b!732941 m!685903))

(declare-fun m!685933 () Bool)

(assert (=> b!732941 m!685933))

(assert (=> b!732933 m!685903))

(assert (=> b!732933 m!685903))

(declare-fun m!685935 () Bool)

(assert (=> b!732933 m!685935))

(declare-fun m!685937 () Bool)

(assert (=> b!732925 m!685937))

(declare-fun m!685939 () Bool)

(assert (=> b!732925 m!685939))

(declare-fun m!685941 () Bool)

(assert (=> b!732932 m!685941))

(declare-fun m!685943 () Bool)

(assert (=> start!64930 m!685943))

(declare-fun m!685945 () Bool)

(assert (=> start!64930 m!685945))

(declare-fun m!685947 () Bool)

(assert (=> b!732935 m!685947))

(declare-fun m!685949 () Bool)

(assert (=> b!732930 m!685949))

(push 1)

