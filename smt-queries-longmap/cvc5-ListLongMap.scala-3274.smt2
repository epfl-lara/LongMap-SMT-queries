; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45588 () Bool)

(assert start!45588)

(declare-fun b!501922 () Bool)

(declare-fun e!294021 () Bool)

(declare-fun e!294022 () Bool)

(assert (=> b!501922 (= e!294021 (not e!294022))))

(declare-fun res!303412 () Bool)

(assert (=> b!501922 (=> res!303412 e!294022)))

(declare-fun lt!228050 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!4019 0))(
  ( (MissingZero!4019 (index!18264 (_ BitVec 32))) (Found!4019 (index!18265 (_ BitVec 32))) (Intermediate!4019 (undefined!4831 Bool) (index!18266 (_ BitVec 32)) (x!47300 (_ BitVec 32))) (Undefined!4019) (MissingVacant!4019 (index!18267 (_ BitVec 32))) )
))
(declare-fun lt!228046 () SeekEntryResult!4019)

(declare-fun lt!228042 () (_ BitVec 32))

(declare-datatypes ((array!32344 0))(
  ( (array!32345 (arr!15552 (Array (_ BitVec 32) (_ BitVec 64))) (size!15916 (_ BitVec 32))) )
))
(declare-fun lt!228049 () array!32344)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32344 (_ BitVec 32)) SeekEntryResult!4019)

(assert (=> b!501922 (= res!303412 (= lt!228046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228042 lt!228050 lt!228049 mask!3524)))))

(declare-fun a!3235 () array!32344)

(declare-fun lt!228051 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!501922 (= lt!228046 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228051 (select (arr!15552 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!501922 (= lt!228042 (toIndex!0 lt!228050 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!501922 (= lt!228050 (select (store (arr!15552 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!501922 (= lt!228051 (toIndex!0 (select (arr!15552 a!3235) j!176) mask!3524))))

(assert (=> b!501922 (= lt!228049 (array!32345 (store (arr!15552 a!3235) i!1204 k!2280) (size!15916 a!3235)))))

(declare-fun e!294020 () Bool)

(assert (=> b!501922 e!294020))

(declare-fun res!303413 () Bool)

(assert (=> b!501922 (=> (not res!303413) (not e!294020))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32344 (_ BitVec 32)) Bool)

(assert (=> b!501922 (= res!303413 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15152 0))(
  ( (Unit!15153) )
))
(declare-fun lt!228048 () Unit!15152)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15152)

(assert (=> b!501922 (= lt!228048 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!501923 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32344 (_ BitVec 32)) SeekEntryResult!4019)

(assert (=> b!501923 (= e!294020 (= (seekEntryOrOpen!0 (select (arr!15552 a!3235) j!176) a!3235 mask!3524) (Found!4019 j!176)))))

(declare-fun b!501924 () Bool)

(declare-fun e!294024 () Unit!15152)

(declare-fun Unit!15154 () Unit!15152)

(assert (=> b!501924 (= e!294024 Unit!15154)))

(declare-fun b!501925 () Bool)

(declare-fun e!294019 () Bool)

(assert (=> b!501925 (= e!294019 false)))

(declare-fun b!501926 () Bool)

(declare-fun res!303408 () Bool)

(declare-fun e!294023 () Bool)

(assert (=> b!501926 (=> (not res!303408) (not e!294023))))

(declare-fun arrayContainsKey!0 (array!32344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!501926 (= res!303408 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun e!294025 () Bool)

(declare-fun b!501927 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32344 (_ BitVec 32)) SeekEntryResult!4019)

(assert (=> b!501927 (= e!294025 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!228051 (index!18266 lt!228046) (select (arr!15552 a!3235) j!176) a!3235 mask!3524) (Found!4019 j!176))))))

(declare-fun b!501928 () Bool)

(declare-fun res!303410 () Bool)

(assert (=> b!501928 (=> (not res!303410) (not e!294021))))

(declare-datatypes ((List!9710 0))(
  ( (Nil!9707) (Cons!9706 (h!10583 (_ BitVec 64)) (t!15938 List!9710)) )
))
(declare-fun arrayNoDuplicates!0 (array!32344 (_ BitVec 32) List!9710) Bool)

(assert (=> b!501928 (= res!303410 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9707))))

(declare-fun res!303411 () Bool)

(assert (=> start!45588 (=> (not res!303411) (not e!294023))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45588 (= res!303411 (validMask!0 mask!3524))))

(assert (=> start!45588 e!294023))

(assert (=> start!45588 true))

(declare-fun array_inv!11348 (array!32344) Bool)

(assert (=> start!45588 (array_inv!11348 a!3235)))

(declare-fun b!501929 () Bool)

(declare-fun res!303403 () Bool)

(declare-fun e!294026 () Bool)

(assert (=> b!501929 (=> res!303403 e!294026)))

(assert (=> b!501929 (= res!303403 e!294025)))

(declare-fun res!303405 () Bool)

(assert (=> b!501929 (=> (not res!303405) (not e!294025))))

(assert (=> b!501929 (= res!303405 (bvsgt #b00000000000000000000000000000000 (x!47300 lt!228046)))))

(declare-fun b!501930 () Bool)

(assert (=> b!501930 (= e!294023 e!294021)))

(declare-fun res!303401 () Bool)

(assert (=> b!501930 (=> (not res!303401) (not e!294021))))

(declare-fun lt!228043 () SeekEntryResult!4019)

(assert (=> b!501930 (= res!303401 (or (= lt!228043 (MissingZero!4019 i!1204)) (= lt!228043 (MissingVacant!4019 i!1204))))))

(assert (=> b!501930 (= lt!228043 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!501931 () Bool)

(declare-fun res!303409 () Bool)

(assert (=> b!501931 (=> (not res!303409) (not e!294023))))

(assert (=> b!501931 (= res!303409 (and (= (size!15916 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15916 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15916 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!501932 () Bool)

(declare-fun res!303400 () Bool)

(assert (=> b!501932 (=> res!303400 e!294022)))

(assert (=> b!501932 (= res!303400 (or (undefined!4831 lt!228046) (not (is-Intermediate!4019 lt!228046))))))

(declare-fun b!501933 () Bool)

(declare-fun res!303404 () Bool)

(assert (=> b!501933 (=> (not res!303404) (not e!294023))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!501933 (= res!303404 (validKeyInArray!0 k!2280))))

(declare-fun b!501934 () Bool)

(declare-fun res!303402 () Bool)

(assert (=> b!501934 (=> (not res!303402) (not e!294023))))

(assert (=> b!501934 (= res!303402 (validKeyInArray!0 (select (arr!15552 a!3235) j!176)))))

(declare-fun b!501935 () Bool)

(assert (=> b!501935 (= e!294022 e!294026)))

(declare-fun res!303399 () Bool)

(assert (=> b!501935 (=> res!303399 e!294026)))

(assert (=> b!501935 (= res!303399 (or (bvsgt (x!47300 lt!228046) #b01111111111111111111111111111110) (bvslt lt!228051 #b00000000000000000000000000000000) (bvsge lt!228051 (size!15916 a!3235)) (bvslt (index!18266 lt!228046) #b00000000000000000000000000000000) (bvsge (index!18266 lt!228046) (size!15916 a!3235)) (not (= lt!228046 (Intermediate!4019 false (index!18266 lt!228046) (x!47300 lt!228046))))))))

(assert (=> b!501935 (= (index!18266 lt!228046) i!1204)))

(declare-fun lt!228044 () Unit!15152)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32344 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15152)

(assert (=> b!501935 (= lt!228044 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!228051 #b00000000000000000000000000000000 (index!18266 lt!228046) (x!47300 lt!228046) mask!3524))))

(assert (=> b!501935 (and (or (= (select (arr!15552 a!3235) (index!18266 lt!228046)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15552 a!3235) (index!18266 lt!228046)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15552 a!3235) (index!18266 lt!228046)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15552 a!3235) (index!18266 lt!228046)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!228052 () Unit!15152)

(assert (=> b!501935 (= lt!228052 e!294024)))

(declare-fun c!59540 () Bool)

(assert (=> b!501935 (= c!59540 (= (select (arr!15552 a!3235) (index!18266 lt!228046)) (select (arr!15552 a!3235) j!176)))))

(assert (=> b!501935 (and (bvslt (x!47300 lt!228046) #b01111111111111111111111111111110) (or (= (select (arr!15552 a!3235) (index!18266 lt!228046)) (select (arr!15552 a!3235) j!176)) (= (select (arr!15552 a!3235) (index!18266 lt!228046)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15552 a!3235) (index!18266 lt!228046)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!501936 () Bool)

(declare-fun res!303406 () Bool)

(assert (=> b!501936 (=> (not res!303406) (not e!294021))))

(assert (=> b!501936 (= res!303406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!501937 () Bool)

(assert (=> b!501937 (= e!294026 true)))

(declare-fun lt!228045 () SeekEntryResult!4019)

(assert (=> b!501937 (= lt!228045 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228051 lt!228050 lt!228049 mask!3524))))

(declare-fun b!501938 () Bool)

(declare-fun Unit!15155 () Unit!15152)

(assert (=> b!501938 (= e!294024 Unit!15155)))

(declare-fun lt!228047 () Unit!15152)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32344 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15152)

(assert (=> b!501938 (= lt!228047 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!228051 #b00000000000000000000000000000000 (index!18266 lt!228046) (x!47300 lt!228046) mask!3524))))

(declare-fun res!303407 () Bool)

(assert (=> b!501938 (= res!303407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!228051 lt!228050 lt!228049 mask!3524) (Intermediate!4019 false (index!18266 lt!228046) (x!47300 lt!228046))))))

(assert (=> b!501938 (=> (not res!303407) (not e!294019))))

(assert (=> b!501938 e!294019))

(assert (= (and start!45588 res!303411) b!501931))

(assert (= (and b!501931 res!303409) b!501934))

(assert (= (and b!501934 res!303402) b!501933))

(assert (= (and b!501933 res!303404) b!501926))

(assert (= (and b!501926 res!303408) b!501930))

(assert (= (and b!501930 res!303401) b!501936))

(assert (= (and b!501936 res!303406) b!501928))

(assert (= (and b!501928 res!303410) b!501922))

(assert (= (and b!501922 res!303413) b!501923))

(assert (= (and b!501922 (not res!303412)) b!501932))

(assert (= (and b!501932 (not res!303400)) b!501935))

(assert (= (and b!501935 c!59540) b!501938))

(assert (= (and b!501935 (not c!59540)) b!501924))

(assert (= (and b!501938 res!303407) b!501925))

(assert (= (and b!501935 (not res!303399)) b!501929))

(assert (= (and b!501929 res!303405) b!501927))

(assert (= (and b!501929 (not res!303403)) b!501937))

(declare-fun m!482907 () Bool)

(assert (=> b!501934 m!482907))

(assert (=> b!501934 m!482907))

(declare-fun m!482909 () Bool)

(assert (=> b!501934 m!482909))

(declare-fun m!482911 () Bool)

(assert (=> b!501935 m!482911))

(declare-fun m!482913 () Bool)

(assert (=> b!501935 m!482913))

(assert (=> b!501935 m!482907))

(assert (=> b!501927 m!482907))

(assert (=> b!501927 m!482907))

(declare-fun m!482915 () Bool)

(assert (=> b!501927 m!482915))

(declare-fun m!482917 () Bool)

(assert (=> b!501937 m!482917))

(assert (=> b!501923 m!482907))

(assert (=> b!501923 m!482907))

(declare-fun m!482919 () Bool)

(assert (=> b!501923 m!482919))

(declare-fun m!482921 () Bool)

(assert (=> b!501936 m!482921))

(declare-fun m!482923 () Bool)

(assert (=> b!501930 m!482923))

(declare-fun m!482925 () Bool)

(assert (=> b!501938 m!482925))

(assert (=> b!501938 m!482917))

(declare-fun m!482927 () Bool)

(assert (=> b!501926 m!482927))

(declare-fun m!482929 () Bool)

(assert (=> start!45588 m!482929))

(declare-fun m!482931 () Bool)

(assert (=> start!45588 m!482931))

(declare-fun m!482933 () Bool)

(assert (=> b!501928 m!482933))

(declare-fun m!482935 () Bool)

(assert (=> b!501922 m!482935))

(declare-fun m!482937 () Bool)

(assert (=> b!501922 m!482937))

(declare-fun m!482939 () Bool)

(assert (=> b!501922 m!482939))

(declare-fun m!482941 () Bool)

(assert (=> b!501922 m!482941))

(assert (=> b!501922 m!482907))

(declare-fun m!482943 () Bool)

(assert (=> b!501922 m!482943))

(assert (=> b!501922 m!482907))

(declare-fun m!482945 () Bool)

(assert (=> b!501922 m!482945))

(assert (=> b!501922 m!482907))

(declare-fun m!482947 () Bool)

(assert (=> b!501922 m!482947))

(declare-fun m!482949 () Bool)

(assert (=> b!501922 m!482949))

(declare-fun m!482951 () Bool)

(assert (=> b!501933 m!482951))

(push 1)

