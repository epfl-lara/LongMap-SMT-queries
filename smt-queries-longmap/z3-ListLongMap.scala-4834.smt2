; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66596 () Bool)

(assert start!66596)

(declare-fun b!766758 () Bool)

(declare-fun res!518550 () Bool)

(declare-fun e!427051 () Bool)

(assert (=> b!766758 (=> (not res!518550) (not e!427051))))

(declare-datatypes ((array!42253 0))(
  ( (array!42254 (arr!20227 (Array (_ BitVec 32) (_ BitVec 64))) (size!20647 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42253)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!766758 (= res!518550 (validKeyInArray!0 (select (arr!20227 a!3186) j!159)))))

(declare-fun res!518560 () Bool)

(assert (=> start!66596 (=> (not res!518560) (not e!427051))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66596 (= res!518560 (validMask!0 mask!3328))))

(assert (=> start!66596 e!427051))

(assert (=> start!66596 true))

(declare-fun array_inv!16086 (array!42253) Bool)

(assert (=> start!66596 (array_inv!16086 a!3186)))

(declare-fun b!766759 () Bool)

(declare-fun res!518552 () Bool)

(declare-fun e!427053 () Bool)

(assert (=> b!766759 (=> (not res!518552) (not e!427053))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42253 (_ BitVec 32)) Bool)

(assert (=> b!766759 (= res!518552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!766760 () Bool)

(declare-fun res!518557 () Bool)

(assert (=> b!766760 (=> (not res!518557) (not e!427051))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42253 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!766760 (= res!518557 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!766761 () Bool)

(assert (=> b!766761 (= e!427051 e!427053)))

(declare-fun res!518549 () Bool)

(assert (=> b!766761 (=> (not res!518549) (not e!427053))))

(declare-datatypes ((SeekEntryResult!7783 0))(
  ( (MissingZero!7783 (index!33500 (_ BitVec 32))) (Found!7783 (index!33501 (_ BitVec 32))) (Intermediate!7783 (undefined!8595 Bool) (index!33502 (_ BitVec 32)) (x!64568 (_ BitVec 32))) (Undefined!7783) (MissingVacant!7783 (index!33503 (_ BitVec 32))) )
))
(declare-fun lt!341048 () SeekEntryResult!7783)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!766761 (= res!518549 (or (= lt!341048 (MissingZero!7783 i!1173)) (= lt!341048 (MissingVacant!7783 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42253 (_ BitVec 32)) SeekEntryResult!7783)

(assert (=> b!766761 (= lt!341048 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun b!766762 () Bool)

(declare-fun e!427047 () Bool)

(declare-fun lt!341053 () SeekEntryResult!7783)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42253 (_ BitVec 32)) SeekEntryResult!7783)

(assert (=> b!766762 (= e!427047 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20227 a!3186) j!159) a!3186 mask!3328) lt!341053))))

(declare-fun b!766763 () Bool)

(declare-fun res!518551 () Bool)

(declare-fun e!427055 () Bool)

(assert (=> b!766763 (=> (not res!518551) (not e!427055))))

(assert (=> b!766763 (= res!518551 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20227 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!766764 () Bool)

(declare-fun e!427052 () Bool)

(declare-fun e!427054 () Bool)

(assert (=> b!766764 (= e!427052 (not e!427054))))

(declare-fun res!518555 () Bool)

(assert (=> b!766764 (=> res!518555 e!427054)))

(declare-fun lt!341050 () SeekEntryResult!7783)

(declare-fun x!1131 () (_ BitVec 32))

(get-info :version)

(assert (=> b!766764 (= res!518555 (or (not ((_ is Intermediate!7783) lt!341050)) (bvsge x!1131 (x!64568 lt!341050))))))

(declare-fun e!427050 () Bool)

(assert (=> b!766764 e!427050))

(declare-fun res!518561 () Bool)

(assert (=> b!766764 (=> (not res!518561) (not e!427050))))

(assert (=> b!766764 (= res!518561 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26371 0))(
  ( (Unit!26372) )
))
(declare-fun lt!341051 () Unit!26371)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42253 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26371)

(assert (=> b!766764 (= lt!341051 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!766765 () Bool)

(declare-fun res!518564 () Bool)

(assert (=> b!766765 (=> (not res!518564) (not e!427055))))

(declare-fun e!427049 () Bool)

(assert (=> b!766765 (= res!518564 e!427049)))

(declare-fun c!84497 () Bool)

(assert (=> b!766765 (= c!84497 (bvsle x!1131 resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!766766 () Bool)

(assert (=> b!766766 (= e!427049 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20227 a!3186) j!159) a!3186 mask!3328) (Found!7783 j!159)))))

(declare-fun b!766767 () Bool)

(declare-fun res!518554 () Bool)

(assert (=> b!766767 (=> (not res!518554) (not e!427051))))

(assert (=> b!766767 (= res!518554 (validKeyInArray!0 k0!2102))))

(declare-fun b!766768 () Bool)

(assert (=> b!766768 (= e!427055 e!427052)))

(declare-fun res!518553 () Bool)

(assert (=> b!766768 (=> (not res!518553) (not e!427052))))

(declare-fun lt!341052 () SeekEntryResult!7783)

(assert (=> b!766768 (= res!518553 (= lt!341052 lt!341050))))

(declare-fun lt!341047 () array!42253)

(declare-fun lt!341055 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42253 (_ BitVec 32)) SeekEntryResult!7783)

(assert (=> b!766768 (= lt!341050 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341055 lt!341047 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766768 (= lt!341052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341055 mask!3328) lt!341055 lt!341047 mask!3328))))

(assert (=> b!766768 (= lt!341055 (select (store (arr!20227 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!766768 (= lt!341047 (array!42254 (store (arr!20227 a!3186) i!1173 k0!2102) (size!20647 a!3186)))))

(declare-fun b!766769 () Bool)

(assert (=> b!766769 (= e!427054 true)))

(declare-fun lt!341049 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!766769 (= lt!341049 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!766770 () Bool)

(declare-fun res!518559 () Bool)

(assert (=> b!766770 (=> (not res!518559) (not e!427053))))

(assert (=> b!766770 (= res!518559 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20647 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20647 a!3186))))))

(declare-fun b!766771 () Bool)

(declare-fun res!518558 () Bool)

(assert (=> b!766771 (=> (not res!518558) (not e!427053))))

(declare-datatypes ((List!14136 0))(
  ( (Nil!14133) (Cons!14132 (h!15228 (_ BitVec 64)) (t!20443 List!14136)) )
))
(declare-fun arrayNoDuplicates!0 (array!42253 (_ BitVec 32) List!14136) Bool)

(assert (=> b!766771 (= res!518558 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14133))))

(declare-fun b!766772 () Bool)

(assert (=> b!766772 (= e!427050 e!427047)))

(declare-fun res!518563 () Bool)

(assert (=> b!766772 (=> (not res!518563) (not e!427047))))

(assert (=> b!766772 (= res!518563 (= (seekEntryOrOpen!0 (select (arr!20227 a!3186) j!159) a!3186 mask!3328) lt!341053))))

(assert (=> b!766772 (= lt!341053 (Found!7783 j!159))))

(declare-fun b!766773 () Bool)

(declare-fun lt!341054 () SeekEntryResult!7783)

(assert (=> b!766773 (= e!427049 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20227 a!3186) j!159) a!3186 mask!3328) lt!341054))))

(declare-fun b!766774 () Bool)

(assert (=> b!766774 (= e!427053 e!427055)))

(declare-fun res!518556 () Bool)

(assert (=> b!766774 (=> (not res!518556) (not e!427055))))

(assert (=> b!766774 (= res!518556 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20227 a!3186) j!159) mask!3328) (select (arr!20227 a!3186) j!159) a!3186 mask!3328) lt!341054))))

(assert (=> b!766774 (= lt!341054 (Intermediate!7783 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!766775 () Bool)

(declare-fun res!518562 () Bool)

(assert (=> b!766775 (=> (not res!518562) (not e!427051))))

(assert (=> b!766775 (= res!518562 (and (= (size!20647 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20647 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20647 a!3186)) (not (= i!1173 j!159))))))

(assert (= (and start!66596 res!518560) b!766775))

(assert (= (and b!766775 res!518562) b!766758))

(assert (= (and b!766758 res!518550) b!766767))

(assert (= (and b!766767 res!518554) b!766760))

(assert (= (and b!766760 res!518557) b!766761))

(assert (= (and b!766761 res!518549) b!766759))

(assert (= (and b!766759 res!518552) b!766771))

(assert (= (and b!766771 res!518558) b!766770))

(assert (= (and b!766770 res!518559) b!766774))

(assert (= (and b!766774 res!518556) b!766763))

(assert (= (and b!766763 res!518551) b!766765))

(assert (= (and b!766765 c!84497) b!766773))

(assert (= (and b!766765 (not c!84497)) b!766766))

(assert (= (and b!766765 res!518564) b!766768))

(assert (= (and b!766768 res!518553) b!766764))

(assert (= (and b!766764 res!518561) b!766772))

(assert (= (and b!766772 res!518563) b!766762))

(assert (= (and b!766764 (not res!518555)) b!766769))

(declare-fun m!713161 () Bool)

(assert (=> b!766764 m!713161))

(declare-fun m!713163 () Bool)

(assert (=> b!766764 m!713163))

(declare-fun m!713165 () Bool)

(assert (=> b!766772 m!713165))

(assert (=> b!766772 m!713165))

(declare-fun m!713167 () Bool)

(assert (=> b!766772 m!713167))

(assert (=> b!766758 m!713165))

(assert (=> b!766758 m!713165))

(declare-fun m!713169 () Bool)

(assert (=> b!766758 m!713169))

(assert (=> b!766766 m!713165))

(assert (=> b!766766 m!713165))

(declare-fun m!713171 () Bool)

(assert (=> b!766766 m!713171))

(assert (=> b!766762 m!713165))

(assert (=> b!766762 m!713165))

(declare-fun m!713173 () Bool)

(assert (=> b!766762 m!713173))

(declare-fun m!713175 () Bool)

(assert (=> b!766768 m!713175))

(declare-fun m!713177 () Bool)

(assert (=> b!766768 m!713177))

(declare-fun m!713179 () Bool)

(assert (=> b!766768 m!713179))

(declare-fun m!713181 () Bool)

(assert (=> b!766768 m!713181))

(assert (=> b!766768 m!713175))

(declare-fun m!713183 () Bool)

(assert (=> b!766768 m!713183))

(declare-fun m!713185 () Bool)

(assert (=> b!766761 m!713185))

(declare-fun m!713187 () Bool)

(assert (=> b!766769 m!713187))

(assert (=> b!766774 m!713165))

(assert (=> b!766774 m!713165))

(declare-fun m!713189 () Bool)

(assert (=> b!766774 m!713189))

(assert (=> b!766774 m!713189))

(assert (=> b!766774 m!713165))

(declare-fun m!713191 () Bool)

(assert (=> b!766774 m!713191))

(declare-fun m!713193 () Bool)

(assert (=> start!66596 m!713193))

(declare-fun m!713195 () Bool)

(assert (=> start!66596 m!713195))

(declare-fun m!713197 () Bool)

(assert (=> b!766771 m!713197))

(declare-fun m!713199 () Bool)

(assert (=> b!766767 m!713199))

(declare-fun m!713201 () Bool)

(assert (=> b!766760 m!713201))

(assert (=> b!766773 m!713165))

(assert (=> b!766773 m!713165))

(declare-fun m!713203 () Bool)

(assert (=> b!766773 m!713203))

(declare-fun m!713205 () Bool)

(assert (=> b!766759 m!713205))

(declare-fun m!713207 () Bool)

(assert (=> b!766763 m!713207))

(check-sat (not b!766764) (not b!766773) (not b!766771) (not b!766766) (not b!766758) (not b!766760) (not b!766772) (not b!766769) (not start!66596) (not b!766767) (not b!766768) (not b!766762) (not b!766761) (not b!766759) (not b!766774))
(check-sat)
