; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66296 () Bool)

(assert start!66296)

(declare-fun b!764146 () Bool)

(declare-fun res!517023 () Bool)

(declare-fun e!425635 () Bool)

(assert (=> b!764146 (=> (not res!517023) (not e!425635))))

(declare-datatypes ((array!42201 0))(
  ( (array!42202 (arr!20208 (Array (_ BitVec 32) (_ BitVec 64))) (size!20629 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42201)

(declare-datatypes ((List!14210 0))(
  ( (Nil!14207) (Cons!14206 (h!15290 (_ BitVec 64)) (t!20525 List!14210)) )
))
(declare-fun arrayNoDuplicates!0 (array!42201 (_ BitVec 32) List!14210) Bool)

(assert (=> b!764146 (= res!517023 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14207))))

(declare-fun b!764147 () Bool)

(declare-fun res!517026 () Bool)

(declare-fun e!425636 () Bool)

(assert (=> b!764147 (=> (not res!517026) (not e!425636))))

(declare-fun e!425637 () Bool)

(assert (=> b!764147 (= res!517026 e!425637)))

(declare-fun c!83950 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764147 (= c!83950 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764148 () Bool)

(declare-fun res!517020 () Bool)

(assert (=> b!764148 (=> (not res!517020) (not e!425635))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!764148 (= res!517020 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20629 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20629 a!3186))))))

(declare-fun res!517024 () Bool)

(declare-fun e!425633 () Bool)

(assert (=> start!66296 (=> (not res!517024) (not e!425633))))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66296 (= res!517024 (validMask!0 mask!3328))))

(assert (=> start!66296 e!425633))

(assert (=> start!66296 true))

(declare-fun array_inv!16004 (array!42201) Bool)

(assert (=> start!66296 (array_inv!16004 a!3186)))

(declare-fun b!764149 () Bool)

(declare-fun res!517027 () Bool)

(assert (=> b!764149 (=> (not res!517027) (not e!425635))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42201 (_ BitVec 32)) Bool)

(assert (=> b!764149 (= res!517027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764150 () Bool)

(declare-fun res!517028 () Bool)

(assert (=> b!764150 (=> (not res!517028) (not e!425633))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42201 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764150 (= res!517028 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764151 () Bool)

(declare-fun res!517019 () Bool)

(assert (=> b!764151 (=> (not res!517019) (not e!425633))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764151 (= res!517019 (validKeyInArray!0 k!2102))))

(declare-fun b!764152 () Bool)

(declare-fun res!517021 () Bool)

(assert (=> b!764152 (=> (not res!517021) (not e!425633))))

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!764152 (= res!517021 (validKeyInArray!0 (select (arr!20208 a!3186) j!159)))))

(declare-fun b!764153 () Bool)

(assert (=> b!764153 (= e!425633 e!425635)))

(declare-fun res!517022 () Bool)

(assert (=> b!764153 (=> (not res!517022) (not e!425635))))

(declare-datatypes ((SeekEntryResult!7808 0))(
  ( (MissingZero!7808 (index!33600 (_ BitVec 32))) (Found!7808 (index!33601 (_ BitVec 32))) (Intermediate!7808 (undefined!8620 Bool) (index!33602 (_ BitVec 32)) (x!64500 (_ BitVec 32))) (Undefined!7808) (MissingVacant!7808 (index!33603 (_ BitVec 32))) )
))
(declare-fun lt!340051 () SeekEntryResult!7808)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764153 (= res!517022 (or (= lt!340051 (MissingZero!7808 i!1173)) (= lt!340051 (MissingVacant!7808 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42201 (_ BitVec 32)) SeekEntryResult!7808)

(assert (=> b!764153 (= lt!340051 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!764154 () Bool)

(declare-fun lt!340052 () SeekEntryResult!7808)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42201 (_ BitVec 32)) SeekEntryResult!7808)

(assert (=> b!764154 (= e!425637 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20208 a!3186) j!159) a!3186 mask!3328) lt!340052))))

(declare-fun b!764155 () Bool)

(assert (=> b!764155 (= e!425635 e!425636)))

(declare-fun res!517029 () Bool)

(assert (=> b!764155 (=> (not res!517029) (not e!425636))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764155 (= res!517029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20208 a!3186) j!159) mask!3328) (select (arr!20208 a!3186) j!159) a!3186 mask!3328) lt!340052))))

(assert (=> b!764155 (= lt!340052 (Intermediate!7808 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764156 () Bool)

(declare-fun res!517025 () Bool)

(assert (=> b!764156 (=> (not res!517025) (not e!425633))))

(assert (=> b!764156 (= res!517025 (and (= (size!20629 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20629 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20629 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!764157 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42201 (_ BitVec 32)) SeekEntryResult!7808)

(assert (=> b!764157 (= e!425637 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20208 a!3186) j!159) a!3186 mask!3328) (Found!7808 j!159)))))

(declare-fun b!764158 () Bool)

(declare-fun res!517030 () Bool)

(assert (=> b!764158 (=> (not res!517030) (not e!425636))))

(assert (=> b!764158 (= res!517030 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20208 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764159 () Bool)

(assert (=> b!764159 (= e!425636 false)))

(declare-fun lt!340055 () (_ BitVec 64))

(declare-fun lt!340054 () SeekEntryResult!7808)

(declare-fun lt!340053 () array!42201)

(assert (=> b!764159 (= lt!340054 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340055 lt!340053 mask!3328))))

(declare-fun lt!340050 () SeekEntryResult!7808)

(assert (=> b!764159 (= lt!340050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340055 mask!3328) lt!340055 lt!340053 mask!3328))))

(assert (=> b!764159 (= lt!340055 (select (store (arr!20208 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!764159 (= lt!340053 (array!42202 (store (arr!20208 a!3186) i!1173 k!2102) (size!20629 a!3186)))))

(assert (= (and start!66296 res!517024) b!764156))

(assert (= (and b!764156 res!517025) b!764152))

(assert (= (and b!764152 res!517021) b!764151))

(assert (= (and b!764151 res!517019) b!764150))

(assert (= (and b!764150 res!517028) b!764153))

(assert (= (and b!764153 res!517022) b!764149))

(assert (= (and b!764149 res!517027) b!764146))

(assert (= (and b!764146 res!517023) b!764148))

(assert (= (and b!764148 res!517020) b!764155))

(assert (= (and b!764155 res!517029) b!764158))

(assert (= (and b!764158 res!517030) b!764147))

(assert (= (and b!764147 c!83950) b!764154))

(assert (= (and b!764147 (not c!83950)) b!764157))

(assert (= (and b!764147 res!517026) b!764159))

(declare-fun m!710541 () Bool)

(assert (=> b!764155 m!710541))

(assert (=> b!764155 m!710541))

(declare-fun m!710543 () Bool)

(assert (=> b!764155 m!710543))

(assert (=> b!764155 m!710543))

(assert (=> b!764155 m!710541))

(declare-fun m!710545 () Bool)

(assert (=> b!764155 m!710545))

(assert (=> b!764157 m!710541))

(assert (=> b!764157 m!710541))

(declare-fun m!710547 () Bool)

(assert (=> b!764157 m!710547))

(declare-fun m!710549 () Bool)

(assert (=> b!764153 m!710549))

(declare-fun m!710551 () Bool)

(assert (=> b!764159 m!710551))

(declare-fun m!710553 () Bool)

(assert (=> b!764159 m!710553))

(declare-fun m!710555 () Bool)

(assert (=> b!764159 m!710555))

(declare-fun m!710557 () Bool)

(assert (=> b!764159 m!710557))

(assert (=> b!764159 m!710553))

(declare-fun m!710559 () Bool)

(assert (=> b!764159 m!710559))

(declare-fun m!710561 () Bool)

(assert (=> b!764158 m!710561))

(declare-fun m!710563 () Bool)

(assert (=> b!764150 m!710563))

(declare-fun m!710565 () Bool)

(assert (=> b!764146 m!710565))

(declare-fun m!710567 () Bool)

(assert (=> b!764151 m!710567))

(declare-fun m!710569 () Bool)

(assert (=> start!66296 m!710569))

(declare-fun m!710571 () Bool)

(assert (=> start!66296 m!710571))

(assert (=> b!764152 m!710541))

(assert (=> b!764152 m!710541))

(declare-fun m!710573 () Bool)

(assert (=> b!764152 m!710573))

(assert (=> b!764154 m!710541))

(assert (=> b!764154 m!710541))

(declare-fun m!710575 () Bool)

(assert (=> b!764154 m!710575))

(declare-fun m!710577 () Bool)

(assert (=> b!764149 m!710577))

(push 1)

