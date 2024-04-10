; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64678 () Bool)

(assert start!64678)

(declare-fun b!729064 () Bool)

(declare-fun res!489524 () Bool)

(declare-fun e!408077 () Bool)

(assert (=> b!729064 (=> (not res!489524) (not e!408077))))

(declare-datatypes ((array!41127 0))(
  ( (array!41128 (arr!19683 (Array (_ BitVec 32) (_ BitVec 64))) (size!20104 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41127)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41127 (_ BitVec 32)) Bool)

(assert (=> b!729064 (= res!489524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!729065 () Bool)

(declare-fun e!408082 () Bool)

(declare-fun e!408075 () Bool)

(assert (=> b!729065 (= e!408082 e!408075)))

(declare-fun res!489514 () Bool)

(assert (=> b!729065 (=> (not res!489514) (not e!408075))))

(declare-datatypes ((SeekEntryResult!7283 0))(
  ( (MissingZero!7283 (index!31500 (_ BitVec 32))) (Found!7283 (index!31501 (_ BitVec 32))) (Intermediate!7283 (undefined!8095 Bool) (index!31502 (_ BitVec 32)) (x!62489 (_ BitVec 32))) (Undefined!7283) (MissingVacant!7283 (index!31503 (_ BitVec 32))) )
))
(declare-fun lt!322982 () SeekEntryResult!7283)

(declare-fun lt!322975 () SeekEntryResult!7283)

(assert (=> b!729065 (= res!489514 (= lt!322982 lt!322975))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!322978 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!322979 () array!41127)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41127 (_ BitVec 32)) SeekEntryResult!7283)

(assert (=> b!729065 (= lt!322975 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!322978 lt!322979 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729065 (= lt!322982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!322978 mask!3328) lt!322978 lt!322979 mask!3328))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!729065 (= lt!322978 (select (store (arr!19683 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!729065 (= lt!322979 (array!41128 (store (arr!19683 a!3186) i!1173 k!2102) (size!20104 a!3186)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!729066 () Bool)

(declare-fun e!408079 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41127 (_ BitVec 32)) SeekEntryResult!7283)

(assert (=> b!729066 (= e!408079 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19683 a!3186) j!159) a!3186 mask!3328) (Found!7283 j!159)))))

(declare-fun b!729067 () Bool)

(declare-fun res!489512 () Bool)

(assert (=> b!729067 (=> (not res!489512) (not e!408082))))

(assert (=> b!729067 (= res!489512 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19683 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!729068 () Bool)

(declare-fun res!489511 () Bool)

(assert (=> b!729068 (=> (not res!489511) (not e!408082))))

(assert (=> b!729068 (= res!489511 e!408079)))

(declare-fun c!80152 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!729068 (= c!80152 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!729069 () Bool)

(declare-fun res!489509 () Bool)

(declare-fun e!408081 () Bool)

(assert (=> b!729069 (=> (not res!489509) (not e!408081))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!729069 (= res!489509 (validKeyInArray!0 k!2102))))

(declare-fun b!729070 () Bool)

(declare-fun res!489521 () Bool)

(assert (=> b!729070 (=> (not res!489521) (not e!408081))))

(assert (=> b!729070 (= res!489521 (and (= (size!20104 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20104 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20104 a!3186)) (not (= i!1173 j!159))))))

(declare-fun res!489515 () Bool)

(assert (=> start!64678 (=> (not res!489515) (not e!408081))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64678 (= res!489515 (validMask!0 mask!3328))))

(assert (=> start!64678 e!408081))

(assert (=> start!64678 true))

(declare-fun array_inv!15479 (array!41127) Bool)

(assert (=> start!64678 (array_inv!15479 a!3186)))

(declare-fun b!729071 () Bool)

(declare-fun res!489523 () Bool)

(assert (=> b!729071 (=> (not res!489523) (not e!408081))))

(assert (=> b!729071 (= res!489523 (validKeyInArray!0 (select (arr!19683 a!3186) j!159)))))

(declare-fun b!729072 () Bool)

(declare-fun res!489516 () Bool)

(assert (=> b!729072 (=> (not res!489516) (not e!408077))))

(assert (=> b!729072 (= res!489516 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20104 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20104 a!3186))))))

(declare-fun b!729073 () Bool)

(declare-fun e!408076 () Bool)

(declare-fun e!408078 () Bool)

(assert (=> b!729073 (= e!408076 e!408078)))

(declare-fun res!489513 () Bool)

(assert (=> b!729073 (=> (not res!489513) (not e!408078))))

(declare-fun lt!322980 () SeekEntryResult!7283)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41127 (_ BitVec 32)) SeekEntryResult!7283)

(assert (=> b!729073 (= res!489513 (= (seekEntryOrOpen!0 (select (arr!19683 a!3186) j!159) a!3186 mask!3328) lt!322980))))

(assert (=> b!729073 (= lt!322980 (Found!7283 j!159))))

(declare-fun b!729074 () Bool)

(declare-fun res!489518 () Bool)

(assert (=> b!729074 (=> (not res!489518) (not e!408081))))

(declare-fun arrayContainsKey!0 (array!41127 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!729074 (= res!489518 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!729075 () Bool)

(assert (=> b!729075 (= e!408078 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19683 a!3186) j!159) a!3186 mask!3328) lt!322980))))

(declare-fun b!729076 () Bool)

(declare-fun e!408083 () Bool)

(assert (=> b!729076 (= e!408075 (not e!408083))))

(declare-fun res!489519 () Bool)

(assert (=> b!729076 (=> res!489519 e!408083)))

(assert (=> b!729076 (= res!489519 (or (not (is-Intermediate!7283 lt!322975)) (bvsge x!1131 (x!62489 lt!322975))))))

(assert (=> b!729076 e!408076))

(declare-fun res!489510 () Bool)

(assert (=> b!729076 (=> (not res!489510) (not e!408076))))

(assert (=> b!729076 (= res!489510 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24884 0))(
  ( (Unit!24885) )
))
(declare-fun lt!322976 () Unit!24884)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41127 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24884)

(assert (=> b!729076 (= lt!322976 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!729077 () Bool)

(declare-fun res!489522 () Bool)

(assert (=> b!729077 (=> (not res!489522) (not e!408077))))

(declare-datatypes ((List!13685 0))(
  ( (Nil!13682) (Cons!13681 (h!14741 (_ BitVec 64)) (t!20000 List!13685)) )
))
(declare-fun arrayNoDuplicates!0 (array!41127 (_ BitVec 32) List!13685) Bool)

(assert (=> b!729077 (= res!489522 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13682))))

(declare-fun lt!322974 () SeekEntryResult!7283)

(declare-fun b!729078 () Bool)

(assert (=> b!729078 (= e!408079 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19683 a!3186) j!159) a!3186 mask!3328) lt!322974))))

(declare-fun b!729079 () Bool)

(assert (=> b!729079 (= e!408083 true)))

(declare-fun lt!322977 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!729079 (= lt!322977 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!729080 () Bool)

(assert (=> b!729080 (= e!408081 e!408077)))

(declare-fun res!489520 () Bool)

(assert (=> b!729080 (=> (not res!489520) (not e!408077))))

(declare-fun lt!322981 () SeekEntryResult!7283)

(assert (=> b!729080 (= res!489520 (or (= lt!322981 (MissingZero!7283 i!1173)) (= lt!322981 (MissingVacant!7283 i!1173))))))

(assert (=> b!729080 (= lt!322981 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!729081 () Bool)

(assert (=> b!729081 (= e!408077 e!408082)))

(declare-fun res!489517 () Bool)

(assert (=> b!729081 (=> (not res!489517) (not e!408082))))

(assert (=> b!729081 (= res!489517 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19683 a!3186) j!159) mask!3328) (select (arr!19683 a!3186) j!159) a!3186 mask!3328) lt!322974))))

(assert (=> b!729081 (= lt!322974 (Intermediate!7283 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!64678 res!489515) b!729070))

(assert (= (and b!729070 res!489521) b!729071))

(assert (= (and b!729071 res!489523) b!729069))

(assert (= (and b!729069 res!489509) b!729074))

(assert (= (and b!729074 res!489518) b!729080))

(assert (= (and b!729080 res!489520) b!729064))

(assert (= (and b!729064 res!489524) b!729077))

(assert (= (and b!729077 res!489522) b!729072))

(assert (= (and b!729072 res!489516) b!729081))

(assert (= (and b!729081 res!489517) b!729067))

(assert (= (and b!729067 res!489512) b!729068))

(assert (= (and b!729068 c!80152) b!729078))

(assert (= (and b!729068 (not c!80152)) b!729066))

(assert (= (and b!729068 res!489511) b!729065))

(assert (= (and b!729065 res!489514) b!729076))

(assert (= (and b!729076 res!489510) b!729073))

(assert (= (and b!729073 res!489513) b!729075))

(assert (= (and b!729076 (not res!489519)) b!729079))

(declare-fun m!682747 () Bool)

(assert (=> b!729067 m!682747))

(declare-fun m!682749 () Bool)

(assert (=> b!729065 m!682749))

(declare-fun m!682751 () Bool)

(assert (=> b!729065 m!682751))

(declare-fun m!682753 () Bool)

(assert (=> b!729065 m!682753))

(assert (=> b!729065 m!682753))

(declare-fun m!682755 () Bool)

(assert (=> b!729065 m!682755))

(declare-fun m!682757 () Bool)

(assert (=> b!729065 m!682757))

(declare-fun m!682759 () Bool)

(assert (=> b!729069 m!682759))

(declare-fun m!682761 () Bool)

(assert (=> start!64678 m!682761))

(declare-fun m!682763 () Bool)

(assert (=> start!64678 m!682763))

(declare-fun m!682765 () Bool)

(assert (=> b!729071 m!682765))

(assert (=> b!729071 m!682765))

(declare-fun m!682767 () Bool)

(assert (=> b!729071 m!682767))

(assert (=> b!729078 m!682765))

(assert (=> b!729078 m!682765))

(declare-fun m!682769 () Bool)

(assert (=> b!729078 m!682769))

(declare-fun m!682771 () Bool)

(assert (=> b!729080 m!682771))

(declare-fun m!682773 () Bool)

(assert (=> b!729074 m!682773))

(declare-fun m!682775 () Bool)

(assert (=> b!729064 m!682775))

(assert (=> b!729075 m!682765))

(assert (=> b!729075 m!682765))

(declare-fun m!682777 () Bool)

(assert (=> b!729075 m!682777))

(assert (=> b!729081 m!682765))

(assert (=> b!729081 m!682765))

(declare-fun m!682779 () Bool)

(assert (=> b!729081 m!682779))

(assert (=> b!729081 m!682779))

(assert (=> b!729081 m!682765))

(declare-fun m!682781 () Bool)

(assert (=> b!729081 m!682781))

(assert (=> b!729066 m!682765))

(assert (=> b!729066 m!682765))

(declare-fun m!682783 () Bool)

(assert (=> b!729066 m!682783))

(declare-fun m!682785 () Bool)

(assert (=> b!729079 m!682785))

(declare-fun m!682787 () Bool)

(assert (=> b!729077 m!682787))

(assert (=> b!729073 m!682765))

(assert (=> b!729073 m!682765))

(declare-fun m!682789 () Bool)

(assert (=> b!729073 m!682789))

(declare-fun m!682791 () Bool)

(assert (=> b!729076 m!682791))

(declare-fun m!682793 () Bool)

(assert (=> b!729076 m!682793))

(push 1)

