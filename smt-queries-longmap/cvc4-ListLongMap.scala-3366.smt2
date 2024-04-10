; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46252 () Bool)

(assert start!46252)

(declare-fun b!512270 () Bool)

(declare-fun res!312940 () Bool)

(declare-fun e!299196 () Bool)

(assert (=> b!512270 (=> (not res!312940) (not e!299196))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32906 0))(
  ( (array!32907 (arr!15830 (Array (_ BitVec 32) (_ BitVec 64))) (size!16194 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32906)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512270 (= res!312940 (and (= (size!16194 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16194 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16194 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512271 () Bool)

(declare-fun res!312932 () Bool)

(assert (=> b!512271 (=> (not res!312932) (not e!299196))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512271 (= res!312932 (validKeyInArray!0 (select (arr!15830 a!3235) j!176)))))

(declare-fun b!512272 () Bool)

(declare-fun res!312937 () Bool)

(assert (=> b!512272 (=> (not res!312937) (not e!299196))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32906 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512272 (= res!312937 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512273 () Bool)

(declare-fun res!312935 () Bool)

(assert (=> b!512273 (=> (not res!312935) (not e!299196))))

(assert (=> b!512273 (= res!312935 (validKeyInArray!0 k!2280))))

(declare-fun b!512275 () Bool)

(declare-fun res!312933 () Bool)

(declare-fun e!299197 () Bool)

(assert (=> b!512275 (=> res!312933 e!299197)))

(declare-datatypes ((SeekEntryResult!4297 0))(
  ( (MissingZero!4297 (index!19376 (_ BitVec 32))) (Found!4297 (index!19377 (_ BitVec 32))) (Intermediate!4297 (undefined!5109 Bool) (index!19378 (_ BitVec 32)) (x!48320 (_ BitVec 32))) (Undefined!4297) (MissingVacant!4297 (index!19379 (_ BitVec 32))) )
))
(declare-fun lt!234481 () SeekEntryResult!4297)

(assert (=> b!512275 (= res!312933 (or (not (is-Intermediate!4297 lt!234481)) (not (undefined!5109 lt!234481))))))

(declare-fun b!512276 () Bool)

(assert (=> b!512276 (= e!299197 true)))

(declare-fun lt!234480 () SeekEntryResult!4297)

(assert (=> b!512276 (= lt!234480 Undefined!4297)))

(declare-fun b!512277 () Bool)

(declare-fun e!299198 () Bool)

(assert (=> b!512277 (= e!299198 (not e!299197))))

(declare-fun res!312936 () Bool)

(assert (=> b!512277 (=> res!312936 e!299197)))

(declare-fun lt!234479 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32906 (_ BitVec 32)) SeekEntryResult!4297)

(assert (=> b!512277 (= res!312936 (= lt!234481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234479 (select (store (arr!15830 a!3235) i!1204 k!2280) j!176) (array!32907 (store (arr!15830 a!3235) i!1204 k!2280) (size!16194 a!3235)) mask!3524)))))

(declare-fun lt!234484 () (_ BitVec 32))

(assert (=> b!512277 (= lt!234481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234484 (select (arr!15830 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512277 (= lt!234479 (toIndex!0 (select (store (arr!15830 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!512277 (= lt!234484 (toIndex!0 (select (arr!15830 a!3235) j!176) mask!3524))))

(assert (=> b!512277 (= lt!234480 (Found!4297 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32906 (_ BitVec 32)) SeekEntryResult!4297)

(assert (=> b!512277 (= lt!234480 (seekEntryOrOpen!0 (select (arr!15830 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32906 (_ BitVec 32)) Bool)

(assert (=> b!512277 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!15852 0))(
  ( (Unit!15853) )
))
(declare-fun lt!234483 () Unit!15852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32906 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15852)

(assert (=> b!512277 (= lt!234483 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!312938 () Bool)

(assert (=> start!46252 (=> (not res!312938) (not e!299196))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46252 (= res!312938 (validMask!0 mask!3524))))

(assert (=> start!46252 e!299196))

(assert (=> start!46252 true))

(declare-fun array_inv!11626 (array!32906) Bool)

(assert (=> start!46252 (array_inv!11626 a!3235)))

(declare-fun b!512274 () Bool)

(declare-fun res!312934 () Bool)

(assert (=> b!512274 (=> (not res!312934) (not e!299198))))

(assert (=> b!512274 (= res!312934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!512278 () Bool)

(declare-fun res!312941 () Bool)

(assert (=> b!512278 (=> (not res!312941) (not e!299198))))

(declare-datatypes ((List!9988 0))(
  ( (Nil!9985) (Cons!9984 (h!10864 (_ BitVec 64)) (t!16216 List!9988)) )
))
(declare-fun arrayNoDuplicates!0 (array!32906 (_ BitVec 32) List!9988) Bool)

(assert (=> b!512278 (= res!312941 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9985))))

(declare-fun b!512279 () Bool)

(assert (=> b!512279 (= e!299196 e!299198)))

(declare-fun res!312939 () Bool)

(assert (=> b!512279 (=> (not res!312939) (not e!299198))))

(declare-fun lt!234482 () SeekEntryResult!4297)

(assert (=> b!512279 (= res!312939 (or (= lt!234482 (MissingZero!4297 i!1204)) (= lt!234482 (MissingVacant!4297 i!1204))))))

(assert (=> b!512279 (= lt!234482 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!46252 res!312938) b!512270))

(assert (= (and b!512270 res!312940) b!512271))

(assert (= (and b!512271 res!312932) b!512273))

(assert (= (and b!512273 res!312935) b!512272))

(assert (= (and b!512272 res!312937) b!512279))

(assert (= (and b!512279 res!312939) b!512274))

(assert (= (and b!512274 res!312934) b!512278))

(assert (= (and b!512278 res!312941) b!512277))

(assert (= (and b!512277 (not res!312936)) b!512275))

(assert (= (and b!512275 (not res!312933)) b!512276))

(declare-fun m!493893 () Bool)

(assert (=> b!512273 m!493893))

(declare-fun m!493895 () Bool)

(assert (=> b!512279 m!493895))

(declare-fun m!493897 () Bool)

(assert (=> b!512278 m!493897))

(declare-fun m!493899 () Bool)

(assert (=> b!512274 m!493899))

(declare-fun m!493901 () Bool)

(assert (=> b!512272 m!493901))

(declare-fun m!493903 () Bool)

(assert (=> b!512271 m!493903))

(assert (=> b!512271 m!493903))

(declare-fun m!493905 () Bool)

(assert (=> b!512271 m!493905))

(declare-fun m!493907 () Bool)

(assert (=> start!46252 m!493907))

(declare-fun m!493909 () Bool)

(assert (=> start!46252 m!493909))

(declare-fun m!493911 () Bool)

(assert (=> b!512277 m!493911))

(declare-fun m!493913 () Bool)

(assert (=> b!512277 m!493913))

(declare-fun m!493915 () Bool)

(assert (=> b!512277 m!493915))

(assert (=> b!512277 m!493903))

(declare-fun m!493917 () Bool)

(assert (=> b!512277 m!493917))

(assert (=> b!512277 m!493903))

(declare-fun m!493919 () Bool)

(assert (=> b!512277 m!493919))

(assert (=> b!512277 m!493903))

(declare-fun m!493921 () Bool)

(assert (=> b!512277 m!493921))

(assert (=> b!512277 m!493915))

(declare-fun m!493923 () Bool)

(assert (=> b!512277 m!493923))

(assert (=> b!512277 m!493903))

(declare-fun m!493925 () Bool)

(assert (=> b!512277 m!493925))

(assert (=> b!512277 m!493915))

(declare-fun m!493927 () Bool)

(assert (=> b!512277 m!493927))

(push 1)

