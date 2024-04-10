; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44662 () Bool)

(assert start!44662)

(declare-fun e!288125 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31721 0))(
  ( (array!31722 (arr!15248 (Array (_ BitVec 32) (_ BitVec 64))) (size!15612 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31721)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun b!490029 () Bool)

(declare-datatypes ((SeekEntryResult!3715 0))(
  ( (MissingZero!3715 (index!17039 (_ BitVec 32))) (Found!3715 (index!17040 (_ BitVec 32))) (Intermediate!3715 (undefined!4527 Bool) (index!17041 (_ BitVec 32)) (x!46141 (_ BitVec 32))) (Undefined!3715) (MissingVacant!3715 (index!17042 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31721 (_ BitVec 32)) SeekEntryResult!3715)

(assert (=> b!490029 (= e!288125 (= (seekEntryOrOpen!0 (select (arr!15248 a!3235) j!176) a!3235 mask!3524) (Found!3715 j!176)))))

(declare-fun b!490030 () Bool)

(declare-fun e!288126 () Bool)

(declare-fun e!288123 () Bool)

(assert (=> b!490030 (= e!288126 e!288123)))

(declare-fun res!292965 () Bool)

(assert (=> b!490030 (=> (not res!292965) (not e!288123))))

(declare-fun lt!221219 () SeekEntryResult!3715)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490030 (= res!292965 (or (= lt!221219 (MissingZero!3715 i!1204)) (= lt!221219 (MissingVacant!3715 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!490030 (= lt!221219 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!292970 () Bool)

(assert (=> start!44662 (=> (not res!292970) (not e!288126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44662 (= res!292970 (validMask!0 mask!3524))))

(assert (=> start!44662 e!288126))

(assert (=> start!44662 true))

(declare-fun array_inv!11044 (array!31721) Bool)

(assert (=> start!44662 (array_inv!11044 a!3235)))

(declare-fun b!490031 () Bool)

(declare-fun res!292967 () Bool)

(assert (=> b!490031 (=> (not res!292967) (not e!288123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31721 (_ BitVec 32)) Bool)

(assert (=> b!490031 (= res!292967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490032 () Bool)

(declare-fun res!292968 () Bool)

(assert (=> b!490032 (=> (not res!292968) (not e!288126))))

(assert (=> b!490032 (= res!292968 (and (= (size!15612 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15612 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15612 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490033 () Bool)

(declare-fun res!292969 () Bool)

(assert (=> b!490033 (=> (not res!292969) (not e!288126))))

(declare-fun arrayContainsKey!0 (array!31721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490033 (= res!292969 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490034 () Bool)

(declare-fun res!292966 () Bool)

(assert (=> b!490034 (=> (not res!292966) (not e!288126))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490034 (= res!292966 (validKeyInArray!0 (select (arr!15248 a!3235) j!176)))))

(declare-fun b!490035 () Bool)

(declare-fun res!292973 () Bool)

(assert (=> b!490035 (=> (not res!292973) (not e!288123))))

(declare-datatypes ((List!9406 0))(
  ( (Nil!9403) (Cons!9402 (h!10264 (_ BitVec 64)) (t!15634 List!9406)) )
))
(declare-fun arrayNoDuplicates!0 (array!31721 (_ BitVec 32) List!9406) Bool)

(assert (=> b!490035 (= res!292973 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9403))))

(declare-fun b!490036 () Bool)

(declare-fun res!292972 () Bool)

(assert (=> b!490036 (=> (not res!292972) (not e!288126))))

(assert (=> b!490036 (= res!292972 (validKeyInArray!0 k!2280))))

(declare-fun b!490037 () Bool)

(assert (=> b!490037 (= e!288123 (not true))))

(declare-fun lt!221221 () (_ BitVec 32))

(declare-fun lt!221222 () SeekEntryResult!3715)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31721 (_ BitVec 32)) SeekEntryResult!3715)

(assert (=> b!490037 (= lt!221222 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221221 (select (store (arr!15248 a!3235) i!1204 k!2280) j!176) (array!31722 (store (arr!15248 a!3235) i!1204 k!2280) (size!15612 a!3235)) mask!3524))))

(declare-fun lt!221220 () (_ BitVec 32))

(declare-fun lt!221223 () SeekEntryResult!3715)

(assert (=> b!490037 (= lt!221223 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!221220 (select (arr!15248 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490037 (= lt!221221 (toIndex!0 (select (store (arr!15248 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!490037 (= lt!221220 (toIndex!0 (select (arr!15248 a!3235) j!176) mask!3524))))

(assert (=> b!490037 e!288125))

(declare-fun res!292971 () Bool)

(assert (=> b!490037 (=> (not res!292971) (not e!288125))))

(assert (=> b!490037 (= res!292971 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14376 0))(
  ( (Unit!14377) )
))
(declare-fun lt!221224 () Unit!14376)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31721 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14376)

(assert (=> b!490037 (= lt!221224 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44662 res!292970) b!490032))

(assert (= (and b!490032 res!292968) b!490034))

(assert (= (and b!490034 res!292966) b!490036))

(assert (= (and b!490036 res!292972) b!490033))

(assert (= (and b!490033 res!292969) b!490030))

(assert (= (and b!490030 res!292965) b!490031))

(assert (= (and b!490031 res!292967) b!490035))

(assert (= (and b!490035 res!292973) b!490037))

(assert (= (and b!490037 res!292971) b!490029))

(declare-fun m!470001 () Bool)

(assert (=> b!490034 m!470001))

(assert (=> b!490034 m!470001))

(declare-fun m!470003 () Bool)

(assert (=> b!490034 m!470003))

(declare-fun m!470005 () Bool)

(assert (=> b!490030 m!470005))

(declare-fun m!470007 () Bool)

(assert (=> b!490031 m!470007))

(declare-fun m!470009 () Bool)

(assert (=> start!44662 m!470009))

(declare-fun m!470011 () Bool)

(assert (=> start!44662 m!470011))

(declare-fun m!470013 () Bool)

(assert (=> b!490037 m!470013))

(declare-fun m!470015 () Bool)

(assert (=> b!490037 m!470015))

(declare-fun m!470017 () Bool)

(assert (=> b!490037 m!470017))

(assert (=> b!490037 m!470017))

(declare-fun m!470019 () Bool)

(assert (=> b!490037 m!470019))

(assert (=> b!490037 m!470001))

(declare-fun m!470021 () Bool)

(assert (=> b!490037 m!470021))

(assert (=> b!490037 m!470001))

(declare-fun m!470023 () Bool)

(assert (=> b!490037 m!470023))

(assert (=> b!490037 m!470017))

(declare-fun m!470025 () Bool)

(assert (=> b!490037 m!470025))

(assert (=> b!490037 m!470001))

(declare-fun m!470027 () Bool)

(assert (=> b!490037 m!470027))

(declare-fun m!470029 () Bool)

(assert (=> b!490033 m!470029))

(declare-fun m!470031 () Bool)

(assert (=> b!490036 m!470031))

(declare-fun m!470033 () Bool)

(assert (=> b!490035 m!470033))

(assert (=> b!490029 m!470001))

(assert (=> b!490029 m!470001))

(declare-fun m!470035 () Bool)

(assert (=> b!490029 m!470035))

(push 1)

(assert (not start!44662))

(assert (not b!490035))

(assert (not b!490036))

