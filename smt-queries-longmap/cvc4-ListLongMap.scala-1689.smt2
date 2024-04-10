; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31026 () Bool)

(assert start!31026)

(declare-fun res!168388 () Bool)

(declare-fun e!194566 () Bool)

(assert (=> start!31026 (=> (not res!168388) (not e!194566))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31026 (= res!168388 (validMask!0 mask!3709))))

(assert (=> start!31026 e!194566))

(declare-datatypes ((array!15928 0))(
  ( (array!15929 (arr!7546 (Array (_ BitVec 32) (_ BitVec 64))) (size!7898 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15928)

(declare-fun array_inv!5509 (array!15928) Bool)

(assert (=> start!31026 (array_inv!5509 a!3293)))

(assert (=> start!31026 true))

(declare-fun b!311927 () Bool)

(declare-fun res!168390 () Bool)

(assert (=> b!311927 (=> (not res!168390) (not e!194566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15928 (_ BitVec 32)) Bool)

(assert (=> b!311927 (= res!168390 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311928 () Bool)

(declare-fun res!168382 () Bool)

(assert (=> b!311928 (=> (not res!168382) (not e!194566))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!15928 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311928 (= res!168382 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!311929 () Bool)

(declare-fun res!168387 () Bool)

(assert (=> b!311929 (=> (not res!168387) (not e!194566))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311929 (= res!168387 (and (= (size!7898 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7898 a!3293))))))

(declare-fun b!311930 () Bool)

(declare-fun res!168381 () Bool)

(assert (=> b!311930 (=> (not res!168381) (not e!194566))))

(declare-datatypes ((SeekEntryResult!2686 0))(
  ( (MissingZero!2686 (index!12920 (_ BitVec 32))) (Found!2686 (index!12921 (_ BitVec 32))) (Intermediate!2686 (undefined!3498 Bool) (index!12922 (_ BitVec 32)) (x!31131 (_ BitVec 32))) (Undefined!2686) (MissingVacant!2686 (index!12923 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15928 (_ BitVec 32)) SeekEntryResult!2686)

(assert (=> b!311930 (= res!168381 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2686 i!1240)))))

(declare-fun b!311931 () Bool)

(declare-fun e!194563 () Bool)

(assert (=> b!311931 (= e!194563 (bvsge mask!3709 #b00000000000000000000000000000000))))

(declare-fun lt!152625 () SeekEntryResult!2686)

(declare-fun lt!152621 () SeekEntryResult!2686)

(assert (=> b!311931 (= lt!152625 lt!152621)))

(declare-fun lt!152624 () (_ BitVec 32))

(declare-datatypes ((Unit!9603 0))(
  ( (Unit!9604) )
))
(declare-fun lt!152622 () Unit!9603)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15928 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9603)

(assert (=> b!311931 (= lt!152622 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152624 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311932 () Bool)

(declare-fun e!194565 () Bool)

(assert (=> b!311932 (= e!194566 e!194565)))

(declare-fun res!168386 () Bool)

(assert (=> b!311932 (=> (not res!168386) (not e!194565))))

(declare-fun lt!152619 () SeekEntryResult!2686)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15928 (_ BitVec 32)) SeekEntryResult!2686)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311932 (= res!168386 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!152619))))

(assert (=> b!311932 (= lt!152619 (Intermediate!2686 false resIndex!52 resX!52))))

(declare-fun b!311933 () Bool)

(declare-fun e!194564 () Bool)

(assert (=> b!311933 (= e!194565 e!194564)))

(declare-fun res!168385 () Bool)

(assert (=> b!311933 (=> (not res!168385) (not e!194564))))

(declare-fun lt!152618 () SeekEntryResult!2686)

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311933 (= res!168385 (and (= lt!152618 lt!152619) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7546 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311933 (= lt!152618 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!311934 () Bool)

(declare-fun res!168389 () Bool)

(assert (=> b!311934 (=> (not res!168389) (not e!194565))))

(assert (=> b!311934 (= res!168389 (and (= (select (arr!7546 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7898 a!3293))))))

(declare-fun b!311935 () Bool)

(assert (=> b!311935 (= e!194564 (not e!194563))))

(declare-fun res!168383 () Bool)

(assert (=> b!311935 (=> res!168383 e!194563)))

(assert (=> b!311935 (= res!168383 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152624 #b00000000000000000000000000000000) (bvsge lt!152624 (size!7898 a!3293)) (not (= lt!152621 lt!152619))))))

(declare-fun lt!152623 () SeekEntryResult!2686)

(assert (=> b!311935 (= lt!152623 lt!152625)))

(declare-fun lt!152620 () array!15928)

(assert (=> b!311935 (= lt!152625 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152624 k!2441 lt!152620 mask!3709))))

(assert (=> b!311935 (= lt!152623 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!152620 mask!3709))))

(assert (=> b!311935 (= lt!152620 (array!15929 (store (arr!7546 a!3293) i!1240 k!2441) (size!7898 a!3293)))))

(assert (=> b!311935 (= lt!152618 lt!152621)))

(assert (=> b!311935 (= lt!152621 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152624 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311935 (= lt!152624 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311936 () Bool)

(declare-fun res!168384 () Bool)

(assert (=> b!311936 (=> (not res!168384) (not e!194566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311936 (= res!168384 (validKeyInArray!0 k!2441))))

(assert (= (and start!31026 res!168388) b!311929))

(assert (= (and b!311929 res!168387) b!311936))

(assert (= (and b!311936 res!168384) b!311928))

(assert (= (and b!311928 res!168382) b!311930))

(assert (= (and b!311930 res!168381) b!311927))

(assert (= (and b!311927 res!168390) b!311932))

(assert (= (and b!311932 res!168386) b!311934))

(assert (= (and b!311934 res!168389) b!311933))

(assert (= (and b!311933 res!168385) b!311935))

(assert (= (and b!311935 (not res!168383)) b!311931))

(declare-fun m!321943 () Bool)

(assert (=> b!311927 m!321943))

(declare-fun m!321945 () Bool)

(assert (=> b!311936 m!321945))

(declare-fun m!321947 () Bool)

(assert (=> b!311931 m!321947))

(declare-fun m!321949 () Bool)

(assert (=> b!311934 m!321949))

(declare-fun m!321951 () Bool)

(assert (=> b!311928 m!321951))

(declare-fun m!321953 () Bool)

(assert (=> start!31026 m!321953))

(declare-fun m!321955 () Bool)

(assert (=> start!31026 m!321955))

(declare-fun m!321957 () Bool)

(assert (=> b!311932 m!321957))

(assert (=> b!311932 m!321957))

(declare-fun m!321959 () Bool)

(assert (=> b!311932 m!321959))

(declare-fun m!321961 () Bool)

(assert (=> b!311933 m!321961))

(declare-fun m!321963 () Bool)

(assert (=> b!311933 m!321963))

(declare-fun m!321965 () Bool)

(assert (=> b!311935 m!321965))

(declare-fun m!321967 () Bool)

(assert (=> b!311935 m!321967))

(declare-fun m!321969 () Bool)

(assert (=> b!311935 m!321969))

(declare-fun m!321971 () Bool)

(assert (=> b!311935 m!321971))

(declare-fun m!321973 () Bool)

(assert (=> b!311935 m!321973))

(declare-fun m!321975 () Bool)

(assert (=> b!311930 m!321975))

(push 1)

(assert (not b!311927))

(assert (not b!311935))

(assert (not b!311931))

(assert (not b!311936))

(assert (not b!311930))

(assert (not b!311928))

(assert (not b!311933))

(assert (not b!311932))

(assert (not start!31026))

(check-sat)

