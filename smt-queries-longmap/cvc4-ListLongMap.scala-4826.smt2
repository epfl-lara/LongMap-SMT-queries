; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66300 () Bool)

(assert start!66300)

(declare-fun b!764230 () Bool)

(declare-fun e!425665 () Bool)

(declare-fun e!425666 () Bool)

(assert (=> b!764230 (= e!425665 e!425666)))

(declare-fun res!517097 () Bool)

(assert (=> b!764230 (=> (not res!517097) (not e!425666))))

(declare-datatypes ((SeekEntryResult!7810 0))(
  ( (MissingZero!7810 (index!33608 (_ BitVec 32))) (Found!7810 (index!33609 (_ BitVec 32))) (Intermediate!7810 (undefined!8622 Bool) (index!33610 (_ BitVec 32)) (x!64502 (_ BitVec 32))) (Undefined!7810) (MissingVacant!7810 (index!33611 (_ BitVec 32))) )
))
(declare-fun lt!340089 () SeekEntryResult!7810)

(declare-datatypes ((array!42205 0))(
  ( (array!42206 (arr!20210 (Array (_ BitVec 32) (_ BitVec 64))) (size!20631 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42205)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42205 (_ BitVec 32)) SeekEntryResult!7810)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764230 (= res!517097 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20210 a!3186) j!159) mask!3328) (select (arr!20210 a!3186) j!159) a!3186 mask!3328) lt!340089))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764230 (= lt!340089 (Intermediate!7810 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764231 () Bool)

(declare-fun res!517094 () Bool)

(assert (=> b!764231 (=> (not res!517094) (not e!425665))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42205 (_ BitVec 32)) Bool)

(assert (=> b!764231 (= res!517094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!425664 () Bool)

(declare-fun b!764233 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42205 (_ BitVec 32)) SeekEntryResult!7810)

(assert (=> b!764233 (= e!425664 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20210 a!3186) j!159) a!3186 mask!3328) (Found!7810 j!159)))))

(declare-fun b!764234 () Bool)

(declare-fun e!425667 () Bool)

(assert (=> b!764234 (= e!425667 e!425665)))

(declare-fun res!517099 () Bool)

(assert (=> b!764234 (=> (not res!517099) (not e!425665))))

(declare-fun lt!340090 () SeekEntryResult!7810)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764234 (= res!517099 (or (= lt!340090 (MissingZero!7810 i!1173)) (= lt!340090 (MissingVacant!7810 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42205 (_ BitVec 32)) SeekEntryResult!7810)

(assert (=> b!764234 (= lt!340090 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!764235 () Bool)

(assert (=> b!764235 (= e!425664 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20210 a!3186) j!159) a!3186 mask!3328) lt!340089))))

(declare-fun b!764236 () Bool)

(declare-fun res!517102 () Bool)

(assert (=> b!764236 (=> (not res!517102) (not e!425667))))

(assert (=> b!764236 (= res!517102 (and (= (size!20631 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20631 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20631 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764237 () Bool)

(declare-fun res!517098 () Bool)

(assert (=> b!764237 (=> (not res!517098) (not e!425667))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764237 (= res!517098 (validKeyInArray!0 k!2102))))

(declare-fun b!764238 () Bool)

(declare-fun res!517101 () Bool)

(assert (=> b!764238 (=> (not res!517101) (not e!425667))))

(declare-fun arrayContainsKey!0 (array!42205 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764238 (= res!517101 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764239 () Bool)

(assert (=> b!764239 (= e!425666 false)))

(declare-fun lt!340088 () (_ BitVec 64))

(declare-fun lt!340087 () SeekEntryResult!7810)

(declare-fun lt!340091 () array!42205)

(assert (=> b!764239 (= lt!340087 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340088 lt!340091 mask!3328))))

(declare-fun lt!340086 () SeekEntryResult!7810)

(assert (=> b!764239 (= lt!340086 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340088 mask!3328) lt!340088 lt!340091 mask!3328))))

(assert (=> b!764239 (= lt!340088 (select (store (arr!20210 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764239 (= lt!340091 (array!42206 (store (arr!20210 a!3186) i!1173 k!2102) (size!20631 a!3186)))))

(declare-fun b!764240 () Bool)

(declare-fun res!517091 () Bool)

(assert (=> b!764240 (=> (not res!517091) (not e!425667))))

(assert (=> b!764240 (= res!517091 (validKeyInArray!0 (select (arr!20210 a!3186) j!159)))))

(declare-fun b!764241 () Bool)

(declare-fun res!517095 () Bool)

(assert (=> b!764241 (=> (not res!517095) (not e!425665))))

(declare-datatypes ((List!14212 0))(
  ( (Nil!14209) (Cons!14208 (h!15292 (_ BitVec 64)) (t!20527 List!14212)) )
))
(declare-fun arrayNoDuplicates!0 (array!42205 (_ BitVec 32) List!14212) Bool)

(assert (=> b!764241 (= res!517095 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14209))))

(declare-fun b!764242 () Bool)

(declare-fun res!517092 () Bool)

(assert (=> b!764242 (=> (not res!517092) (not e!425666))))

(assert (=> b!764242 (= res!517092 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20210 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764243 () Bool)

(declare-fun res!517100 () Bool)

(assert (=> b!764243 (=> (not res!517100) (not e!425665))))

(assert (=> b!764243 (= res!517100 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20631 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20631 a!3186))))))

(declare-fun res!517093 () Bool)

(assert (=> start!66300 (=> (not res!517093) (not e!425667))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66300 (= res!517093 (validMask!0 mask!3328))))

(assert (=> start!66300 e!425667))

(assert (=> start!66300 true))

(declare-fun array_inv!16006 (array!42205) Bool)

(assert (=> start!66300 (array_inv!16006 a!3186)))

(declare-fun b!764232 () Bool)

(declare-fun res!517096 () Bool)

(assert (=> b!764232 (=> (not res!517096) (not e!425666))))

(assert (=> b!764232 (= res!517096 e!425664)))

(declare-fun c!83956 () Bool)

(assert (=> b!764232 (= c!83956 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!66300 res!517093) b!764236))

(assert (= (and b!764236 res!517102) b!764240))

(assert (= (and b!764240 res!517091) b!764237))

(assert (= (and b!764237 res!517098) b!764238))

(assert (= (and b!764238 res!517101) b!764234))

(assert (= (and b!764234 res!517099) b!764231))

(assert (= (and b!764231 res!517094) b!764241))

(assert (= (and b!764241 res!517095) b!764243))

(assert (= (and b!764243 res!517100) b!764230))

(assert (= (and b!764230 res!517097) b!764242))

(assert (= (and b!764242 res!517092) b!764232))

(assert (= (and b!764232 c!83956) b!764235))

(assert (= (and b!764232 (not c!83956)) b!764233))

(assert (= (and b!764232 res!517096) b!764239))

(declare-fun m!710617 () Bool)

(assert (=> b!764239 m!710617))

(declare-fun m!710619 () Bool)

(assert (=> b!764239 m!710619))

(declare-fun m!710621 () Bool)

(assert (=> b!764239 m!710621))

(assert (=> b!764239 m!710617))

(declare-fun m!710623 () Bool)

(assert (=> b!764239 m!710623))

(declare-fun m!710625 () Bool)

(assert (=> b!764239 m!710625))

(declare-fun m!710627 () Bool)

(assert (=> b!764238 m!710627))

(declare-fun m!710629 () Bool)

(assert (=> b!764231 m!710629))

(declare-fun m!710631 () Bool)

(assert (=> b!764234 m!710631))

(declare-fun m!710633 () Bool)

(assert (=> start!66300 m!710633))

(declare-fun m!710635 () Bool)

(assert (=> start!66300 m!710635))

(declare-fun m!710637 () Bool)

(assert (=> b!764237 m!710637))

(declare-fun m!710639 () Bool)

(assert (=> b!764242 m!710639))

(declare-fun m!710641 () Bool)

(assert (=> b!764233 m!710641))

(assert (=> b!764233 m!710641))

(declare-fun m!710643 () Bool)

(assert (=> b!764233 m!710643))

(assert (=> b!764240 m!710641))

(assert (=> b!764240 m!710641))

(declare-fun m!710645 () Bool)

(assert (=> b!764240 m!710645))

(declare-fun m!710647 () Bool)

(assert (=> b!764241 m!710647))

(assert (=> b!764230 m!710641))

(assert (=> b!764230 m!710641))

(declare-fun m!710649 () Bool)

(assert (=> b!764230 m!710649))

(assert (=> b!764230 m!710649))

(assert (=> b!764230 m!710641))

(declare-fun m!710651 () Bool)

(assert (=> b!764230 m!710651))

(assert (=> b!764235 m!710641))

(assert (=> b!764235 m!710641))

(declare-fun m!710653 () Bool)

(assert (=> b!764235 m!710653))

(push 1)

