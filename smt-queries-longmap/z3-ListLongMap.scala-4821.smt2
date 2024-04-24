; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66386 () Bool)

(assert start!66386)

(declare-fun b!764143 () Bool)

(declare-fun res!516733 () Bool)

(declare-fun e!425810 () Bool)

(assert (=> b!764143 (=> (not res!516733) (not e!425810))))

(declare-datatypes ((array!42169 0))(
  ( (array!42170 (arr!20188 (Array (_ BitVec 32) (_ BitVec 64))) (size!20608 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42169)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42169 (_ BitVec 32)) Bool)

(assert (=> b!764143 (= res!516733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!764144 () Bool)

(declare-fun res!516742 () Bool)

(declare-fun e!425808 () Bool)

(assert (=> b!764144 (=> (not res!516742) (not e!425808))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!764144 (= res!516742 (and (= (size!20608 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20608 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20608 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun e!425806 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!764145 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7744 0))(
  ( (MissingZero!7744 (index!33344 (_ BitVec 32))) (Found!7744 (index!33345 (_ BitVec 32))) (Intermediate!7744 (undefined!8556 Bool) (index!33346 (_ BitVec 32)) (x!64407 (_ BitVec 32))) (Undefined!7744) (MissingVacant!7744 (index!33347 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42169 (_ BitVec 32)) SeekEntryResult!7744)

(assert (=> b!764145 (= e!425806 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20188 a!3186) j!159) a!3186 mask!3328) (Found!7744 j!159)))))

(declare-fun b!764146 () Bool)

(declare-fun lt!340088 () SeekEntryResult!7744)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42169 (_ BitVec 32)) SeekEntryResult!7744)

(assert (=> b!764146 (= e!425806 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20188 a!3186) j!159) a!3186 mask!3328) lt!340088))))

(declare-fun b!764147 () Bool)

(declare-fun res!516741 () Bool)

(assert (=> b!764147 (=> (not res!516741) (not e!425810))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!764147 (= res!516741 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20608 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20608 a!3186))))))

(declare-fun b!764148 () Bool)

(declare-fun res!516737 () Bool)

(declare-fun e!425807 () Bool)

(assert (=> b!764148 (=> (not res!516737) (not e!425807))))

(assert (=> b!764148 (= res!516737 e!425806)))

(declare-fun c!84095 () Bool)

(assert (=> b!764148 (= c!84095 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!764149 () Bool)

(assert (=> b!764149 (= e!425807 false)))

(declare-fun lt!340091 () (_ BitVec 64))

(declare-fun lt!340090 () array!42169)

(declare-fun lt!340089 () SeekEntryResult!7744)

(assert (=> b!764149 (= lt!340089 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!340091 lt!340090 mask!3328))))

(declare-fun lt!340087 () SeekEntryResult!7744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!764149 (= lt!340087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!340091 mask!3328) lt!340091 lt!340090 mask!3328))))

(declare-fun k0!2102 () (_ BitVec 64))

(assert (=> b!764149 (= lt!340091 (select (store (arr!20188 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!764149 (= lt!340090 (array!42170 (store (arr!20188 a!3186) i!1173 k0!2102) (size!20608 a!3186)))))

(declare-fun b!764151 () Bool)

(declare-fun res!516738 () Bool)

(assert (=> b!764151 (=> (not res!516738) (not e!425810))))

(declare-datatypes ((List!14097 0))(
  ( (Nil!14094) (Cons!14093 (h!15183 (_ BitVec 64)) (t!20404 List!14097)) )
))
(declare-fun arrayNoDuplicates!0 (array!42169 (_ BitVec 32) List!14097) Bool)

(assert (=> b!764151 (= res!516738 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14094))))

(declare-fun b!764152 () Bool)

(declare-fun res!516735 () Bool)

(assert (=> b!764152 (=> (not res!516735) (not e!425808))))

(declare-fun arrayContainsKey!0 (array!42169 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!764152 (= res!516735 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!764153 () Bool)

(declare-fun res!516740 () Bool)

(assert (=> b!764153 (=> (not res!516740) (not e!425808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!764153 (= res!516740 (validKeyInArray!0 k0!2102))))

(declare-fun b!764154 () Bool)

(assert (=> b!764154 (= e!425810 e!425807)))

(declare-fun res!516743 () Bool)

(assert (=> b!764154 (=> (not res!516743) (not e!425807))))

(assert (=> b!764154 (= res!516743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20188 a!3186) j!159) mask!3328) (select (arr!20188 a!3186) j!159) a!3186 mask!3328) lt!340088))))

(assert (=> b!764154 (= lt!340088 (Intermediate!7744 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!764150 () Bool)

(assert (=> b!764150 (= e!425808 e!425810)))

(declare-fun res!516736 () Bool)

(assert (=> b!764150 (=> (not res!516736) (not e!425810))))

(declare-fun lt!340092 () SeekEntryResult!7744)

(assert (=> b!764150 (= res!516736 (or (= lt!340092 (MissingZero!7744 i!1173)) (= lt!340092 (MissingVacant!7744 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42169 (_ BitVec 32)) SeekEntryResult!7744)

(assert (=> b!764150 (= lt!340092 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun res!516739 () Bool)

(assert (=> start!66386 (=> (not res!516739) (not e!425808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66386 (= res!516739 (validMask!0 mask!3328))))

(assert (=> start!66386 e!425808))

(assert (=> start!66386 true))

(declare-fun array_inv!16047 (array!42169) Bool)

(assert (=> start!66386 (array_inv!16047 a!3186)))

(declare-fun b!764155 () Bool)

(declare-fun res!516732 () Bool)

(assert (=> b!764155 (=> (not res!516732) (not e!425807))))

(assert (=> b!764155 (= res!516732 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20188 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!764156 () Bool)

(declare-fun res!516734 () Bool)

(assert (=> b!764156 (=> (not res!516734) (not e!425808))))

(assert (=> b!764156 (= res!516734 (validKeyInArray!0 (select (arr!20188 a!3186) j!159)))))

(assert (= (and start!66386 res!516739) b!764144))

(assert (= (and b!764144 res!516742) b!764156))

(assert (= (and b!764156 res!516734) b!764153))

(assert (= (and b!764153 res!516740) b!764152))

(assert (= (and b!764152 res!516735) b!764150))

(assert (= (and b!764150 res!516736) b!764143))

(assert (= (and b!764143 res!516733) b!764151))

(assert (= (and b!764151 res!516738) b!764147))

(assert (= (and b!764147 res!516741) b!764154))

(assert (= (and b!764154 res!516743) b!764155))

(assert (= (and b!764155 res!516732) b!764148))

(assert (= (and b!764148 c!84095) b!764146))

(assert (= (and b!764148 (not c!84095)) b!764145))

(assert (= (and b!764148 res!516737) b!764149))

(declare-fun m!710995 () Bool)

(assert (=> b!764154 m!710995))

(assert (=> b!764154 m!710995))

(declare-fun m!710997 () Bool)

(assert (=> b!764154 m!710997))

(assert (=> b!764154 m!710997))

(assert (=> b!764154 m!710995))

(declare-fun m!710999 () Bool)

(assert (=> b!764154 m!710999))

(declare-fun m!711001 () Bool)

(assert (=> b!764153 m!711001))

(assert (=> b!764156 m!710995))

(assert (=> b!764156 m!710995))

(declare-fun m!711003 () Bool)

(assert (=> b!764156 m!711003))

(declare-fun m!711005 () Bool)

(assert (=> b!764151 m!711005))

(declare-fun m!711007 () Bool)

(assert (=> b!764149 m!711007))

(assert (=> b!764149 m!711007))

(declare-fun m!711009 () Bool)

(assert (=> b!764149 m!711009))

(declare-fun m!711011 () Bool)

(assert (=> b!764149 m!711011))

(declare-fun m!711013 () Bool)

(assert (=> b!764149 m!711013))

(declare-fun m!711015 () Bool)

(assert (=> b!764149 m!711015))

(declare-fun m!711017 () Bool)

(assert (=> b!764150 m!711017))

(assert (=> b!764145 m!710995))

(assert (=> b!764145 m!710995))

(declare-fun m!711019 () Bool)

(assert (=> b!764145 m!711019))

(declare-fun m!711021 () Bool)

(assert (=> b!764143 m!711021))

(assert (=> b!764146 m!710995))

(assert (=> b!764146 m!710995))

(declare-fun m!711023 () Bool)

(assert (=> b!764146 m!711023))

(declare-fun m!711025 () Bool)

(assert (=> b!764152 m!711025))

(declare-fun m!711027 () Bool)

(assert (=> start!66386 m!711027))

(declare-fun m!711029 () Bool)

(assert (=> start!66386 m!711029))

(declare-fun m!711031 () Bool)

(assert (=> b!764155 m!711031))

(check-sat (not b!764154) (not b!764145) (not b!764153) (not b!764146) (not b!764143) (not b!764152) (not b!764150) (not b!764149) (not b!764156) (not b!764151) (not start!66386))
(check-sat)
