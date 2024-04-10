; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64106 () Bool)

(assert start!64106)

(declare-fun b!720134 () Bool)

(declare-fun e!403927 () Bool)

(declare-fun e!403931 () Bool)

(assert (=> b!720134 (= e!403927 e!403931)))

(declare-fun res!482512 () Bool)

(assert (=> b!720134 (=> (not res!482512) (not e!403931))))

(declare-datatypes ((array!40801 0))(
  ( (array!40802 (arr!19526 (Array (_ BitVec 32) (_ BitVec 64))) (size!19947 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40801)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7126 0))(
  ( (MissingZero!7126 (index!30872 (_ BitVec 32))) (Found!7126 (index!30873 (_ BitVec 32))) (Intermediate!7126 (undefined!7938 Bool) (index!30874 (_ BitVec 32)) (x!61869 (_ BitVec 32))) (Undefined!7126) (MissingVacant!7126 (index!30875 (_ BitVec 32))) )
))
(declare-fun lt!319715 () SeekEntryResult!7126)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40801 (_ BitVec 32)) SeekEntryResult!7126)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!720134 (= res!482512 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19526 a!3186) j!159) mask!3328) (select (arr!19526 a!3186) j!159) a!3186 mask!3328) lt!319715))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!720134 (= lt!319715 (Intermediate!7126 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!720135 () Bool)

(declare-fun res!482519 () Bool)

(declare-fun e!403930 () Bool)

(assert (=> b!720135 (=> (not res!482519) (not e!403930))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!720135 (= res!482519 (and (= (size!19947 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19947 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19947 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!720136 () Bool)

(declare-fun res!482513 () Bool)

(assert (=> b!720136 (=> (not res!482513) (not e!403930))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!720136 (= res!482513 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!720137 () Bool)

(declare-fun res!482522 () Bool)

(assert (=> b!720137 (=> (not res!482522) (not e!403927))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!40801 (_ BitVec 32)) Bool)

(assert (=> b!720137 (= res!482522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!720138 () Bool)

(declare-fun res!482521 () Bool)

(assert (=> b!720138 (=> (not res!482521) (not e!403931))))

(declare-fun e!403928 () Bool)

(assert (=> b!720138 (= res!482521 e!403928)))

(declare-fun c!79180 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!720138 (= c!79180 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!482516 () Bool)

(assert (=> start!64106 (=> (not res!482516) (not e!403930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!64106 (= res!482516 (validMask!0 mask!3328))))

(assert (=> start!64106 e!403930))

(assert (=> start!64106 true))

(declare-fun array_inv!15322 (array!40801) Bool)

(assert (=> start!64106 (array_inv!15322 a!3186)))

(declare-fun b!720139 () Bool)

(assert (=> b!720139 (= e!403930 e!403927)))

(declare-fun res!482520 () Bool)

(assert (=> b!720139 (=> (not res!482520) (not e!403927))))

(declare-fun lt!319714 () SeekEntryResult!7126)

(assert (=> b!720139 (= res!482520 (or (= lt!319714 (MissingZero!7126 i!1173)) (= lt!319714 (MissingVacant!7126 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40801 (_ BitVec 32)) SeekEntryResult!7126)

(assert (=> b!720139 (= lt!319714 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!720140 () Bool)

(declare-fun res!482511 () Bool)

(assert (=> b!720140 (=> (not res!482511) (not e!403930))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!720140 (= res!482511 (validKeyInArray!0 (select (arr!19526 a!3186) j!159)))))

(declare-fun b!720141 () Bool)

(assert (=> b!720141 (= e!403931 (bvslt mask!3328 #b00000000000000000000000000000000))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!720142 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!40801 (_ BitVec 32)) SeekEntryResult!7126)

(assert (=> b!720142 (= e!403928 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19526 a!3186) j!159) a!3186 mask!3328) (Found!7126 j!159)))))

(declare-fun b!720143 () Bool)

(declare-fun res!482518 () Bool)

(assert (=> b!720143 (=> (not res!482518) (not e!403927))))

(declare-datatypes ((List!13528 0))(
  ( (Nil!13525) (Cons!13524 (h!14572 (_ BitVec 64)) (t!19843 List!13528)) )
))
(declare-fun arrayNoDuplicates!0 (array!40801 (_ BitVec 32) List!13528) Bool)

(assert (=> b!720143 (= res!482518 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13525))))

(declare-fun b!720144 () Bool)

(declare-fun res!482515 () Bool)

(assert (=> b!720144 (=> (not res!482515) (not e!403931))))

(assert (=> b!720144 (= res!482515 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19526 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!720145 () Bool)

(assert (=> b!720145 (= e!403928 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19526 a!3186) j!159) a!3186 mask!3328) lt!319715))))

(declare-fun b!720146 () Bool)

(declare-fun res!482517 () Bool)

(assert (=> b!720146 (=> (not res!482517) (not e!403930))))

(assert (=> b!720146 (= res!482517 (validKeyInArray!0 k!2102))))

(declare-fun b!720147 () Bool)

(declare-fun res!482514 () Bool)

(assert (=> b!720147 (=> (not res!482514) (not e!403927))))

(assert (=> b!720147 (= res!482514 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!19947 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!19947 a!3186))))))

(assert (= (and start!64106 res!482516) b!720135))

(assert (= (and b!720135 res!482519) b!720140))

(assert (= (and b!720140 res!482511) b!720146))

(assert (= (and b!720146 res!482517) b!720136))

(assert (= (and b!720136 res!482513) b!720139))

(assert (= (and b!720139 res!482520) b!720137))

(assert (= (and b!720137 res!482522) b!720143))

(assert (= (and b!720143 res!482518) b!720147))

(assert (= (and b!720147 res!482514) b!720134))

(assert (= (and b!720134 res!482512) b!720144))

(assert (= (and b!720144 res!482515) b!720138))

(assert (= (and b!720138 c!79180) b!720145))

(assert (= (and b!720138 (not c!79180)) b!720142))

(assert (= (and b!720138 res!482521) b!720141))

(declare-fun m!675387 () Bool)

(assert (=> start!64106 m!675387))

(declare-fun m!675389 () Bool)

(assert (=> start!64106 m!675389))

(declare-fun m!675391 () Bool)

(assert (=> b!720142 m!675391))

(assert (=> b!720142 m!675391))

(declare-fun m!675393 () Bool)

(assert (=> b!720142 m!675393))

(assert (=> b!720140 m!675391))

(assert (=> b!720140 m!675391))

(declare-fun m!675395 () Bool)

(assert (=> b!720140 m!675395))

(declare-fun m!675397 () Bool)

(assert (=> b!720146 m!675397))

(declare-fun m!675399 () Bool)

(assert (=> b!720143 m!675399))

(declare-fun m!675401 () Bool)

(assert (=> b!720139 m!675401))

(assert (=> b!720145 m!675391))

(assert (=> b!720145 m!675391))

(declare-fun m!675403 () Bool)

(assert (=> b!720145 m!675403))

(declare-fun m!675405 () Bool)

(assert (=> b!720137 m!675405))

(declare-fun m!675407 () Bool)

(assert (=> b!720144 m!675407))

(assert (=> b!720134 m!675391))

(assert (=> b!720134 m!675391))

(declare-fun m!675409 () Bool)

(assert (=> b!720134 m!675409))

(assert (=> b!720134 m!675409))

(assert (=> b!720134 m!675391))

(declare-fun m!675411 () Bool)

(assert (=> b!720134 m!675411))

(declare-fun m!675413 () Bool)

(assert (=> b!720136 m!675413))

(push 1)

(assert (not b!720139))

(assert (not b!720145))

(assert (not b!720143))

(assert (not b!720136))

(assert (not b!720142))

(assert (not start!64106))

(assert (not b!720134))

(assert (not b!720140))

(assert (not b!720137))

(assert (not b!720146))

(check-sat)

(pop 1)

