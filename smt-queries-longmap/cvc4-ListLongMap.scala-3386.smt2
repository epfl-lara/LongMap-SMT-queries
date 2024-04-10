; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46732 () Bool)

(assert start!46732)

(declare-fun b!515941 () Bool)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33044 0))(
  ( (array!33045 (arr!15890 (Array (_ BitVec 32) (_ BitVec 64))) (size!16254 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33044)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!301178 () Bool)

(declare-datatypes ((SeekEntryResult!4357 0))(
  ( (MissingZero!4357 (index!19616 (_ BitVec 32))) (Found!4357 (index!19617 (_ BitVec 32))) (Intermediate!4357 (undefined!5169 Bool) (index!19618 (_ BitVec 32)) (x!48576 (_ BitVec 32))) (Undefined!4357) (MissingVacant!4357 (index!19619 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33044 (_ BitVec 32)) SeekEntryResult!4357)

(assert (=> b!515941 (= e!301178 (= (seekEntryOrOpen!0 (select (arr!15890 a!3235) j!176) a!3235 mask!3524) (Found!4357 j!176)))))

(declare-fun res!315505 () Bool)

(declare-fun e!301177 () Bool)

(assert (=> start!46732 (=> (not res!315505) (not e!301177))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46732 (= res!315505 (validMask!0 mask!3524))))

(assert (=> start!46732 e!301177))

(assert (=> start!46732 true))

(declare-fun array_inv!11686 (array!33044) Bool)

(assert (=> start!46732 (array_inv!11686 a!3235)))

(declare-fun b!515942 () Bool)

(declare-fun e!301176 () Bool)

(declare-fun e!301179 () Bool)

(assert (=> b!515942 (= e!301176 (not e!301179))))

(declare-fun res!315514 () Bool)

(assert (=> b!515942 (=> res!315514 e!301179)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!236191 () SeekEntryResult!4357)

(declare-fun lt!236192 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33044 (_ BitVec 32)) SeekEntryResult!4357)

(assert (=> b!515942 (= res!315514 (= lt!236191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236192 (select (store (arr!15890 a!3235) i!1204 k!2280) j!176) (array!33045 (store (arr!15890 a!3235) i!1204 k!2280) (size!16254 a!3235)) mask!3524)))))

(declare-fun lt!236190 () (_ BitVec 32))

(assert (=> b!515942 (= lt!236191 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236190 (select (arr!15890 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!515942 (= lt!236192 (toIndex!0 (select (store (arr!15890 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!515942 (= lt!236190 (toIndex!0 (select (arr!15890 a!3235) j!176) mask!3524))))

(assert (=> b!515942 e!301178))

(declare-fun res!315509 () Bool)

(assert (=> b!515942 (=> (not res!315509) (not e!301178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33044 (_ BitVec 32)) Bool)

(assert (=> b!515942 (= res!315509 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15972 0))(
  ( (Unit!15973) )
))
(declare-fun lt!236194 () Unit!15972)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33044 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15972)

(assert (=> b!515942 (= lt!236194 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!515943 () Bool)

(declare-fun res!315506 () Bool)

(assert (=> b!515943 (=> (not res!315506) (not e!301176))))

(assert (=> b!515943 (= res!315506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!515944 () Bool)

(declare-fun res!315512 () Bool)

(assert (=> b!515944 (=> (not res!315512) (not e!301176))))

(declare-datatypes ((List!10048 0))(
  ( (Nil!10045) (Cons!10044 (h!10942 (_ BitVec 64)) (t!16276 List!10048)) )
))
(declare-fun arrayNoDuplicates!0 (array!33044 (_ BitVec 32) List!10048) Bool)

(assert (=> b!515944 (= res!315512 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10045))))

(declare-fun b!515945 () Bool)

(declare-fun res!315510 () Bool)

(assert (=> b!515945 (=> (not res!315510) (not e!301177))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!515945 (= res!315510 (validKeyInArray!0 k!2280))))

(declare-fun b!515946 () Bool)

(declare-fun res!315513 () Bool)

(assert (=> b!515946 (=> (not res!315513) (not e!301177))))

(assert (=> b!515946 (= res!315513 (validKeyInArray!0 (select (arr!15890 a!3235) j!176)))))

(declare-fun b!515947 () Bool)

(declare-fun res!315507 () Bool)

(assert (=> b!515947 (=> res!315507 e!301179)))

(assert (=> b!515947 (= res!315507 (or (undefined!5169 lt!236191) (not (is-Intermediate!4357 lt!236191))))))

(declare-fun b!515948 () Bool)

(declare-fun res!315508 () Bool)

(assert (=> b!515948 (=> (not res!315508) (not e!301177))))

(declare-fun arrayContainsKey!0 (array!33044 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!515948 (= res!315508 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!515949 () Bool)

(declare-fun res!315511 () Bool)

(assert (=> b!515949 (=> (not res!315511) (not e!301177))))

(assert (=> b!515949 (= res!315511 (and (= (size!16254 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16254 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16254 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!515950 () Bool)

(assert (=> b!515950 (= e!301177 e!301176)))

(declare-fun res!315515 () Bool)

(assert (=> b!515950 (=> (not res!315515) (not e!301176))))

(declare-fun lt!236193 () SeekEntryResult!4357)

(assert (=> b!515950 (= res!315515 (or (= lt!236193 (MissingZero!4357 i!1204)) (= lt!236193 (MissingVacant!4357 i!1204))))))

(assert (=> b!515950 (= lt!236193 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!515951 () Bool)

(assert (=> b!515951 (= e!301179 true)))

(assert (=> b!515951 (and (bvslt (x!48576 lt!236191) #b01111111111111111111111111111110) (or (= (select (arr!15890 a!3235) (index!19618 lt!236191)) (select (arr!15890 a!3235) j!176)) (= (select (arr!15890 a!3235) (index!19618 lt!236191)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15890 a!3235) (index!19618 lt!236191)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!46732 res!315505) b!515949))

(assert (= (and b!515949 res!315511) b!515946))

(assert (= (and b!515946 res!315513) b!515945))

(assert (= (and b!515945 res!315510) b!515948))

(assert (= (and b!515948 res!315508) b!515950))

(assert (= (and b!515950 res!315515) b!515943))

(assert (= (and b!515943 res!315506) b!515944))

(assert (= (and b!515944 res!315512) b!515942))

(assert (= (and b!515942 res!315509) b!515941))

(assert (= (and b!515942 (not res!315514)) b!515947))

(assert (= (and b!515947 (not res!315507)) b!515951))

(declare-fun m!497353 () Bool)

(assert (=> b!515944 m!497353))

(declare-fun m!497355 () Bool)

(assert (=> b!515942 m!497355))

(declare-fun m!497357 () Bool)

(assert (=> b!515942 m!497357))

(declare-fun m!497359 () Bool)

(assert (=> b!515942 m!497359))

(declare-fun m!497361 () Bool)

(assert (=> b!515942 m!497361))

(assert (=> b!515942 m!497359))

(declare-fun m!497363 () Bool)

(assert (=> b!515942 m!497363))

(declare-fun m!497365 () Bool)

(assert (=> b!515942 m!497365))

(declare-fun m!497367 () Bool)

(assert (=> b!515942 m!497367))

(assert (=> b!515942 m!497363))

(declare-fun m!497369 () Bool)

(assert (=> b!515942 m!497369))

(assert (=> b!515942 m!497359))

(declare-fun m!497371 () Bool)

(assert (=> b!515942 m!497371))

(assert (=> b!515942 m!497363))

(declare-fun m!497373 () Bool)

(assert (=> b!515948 m!497373))

(declare-fun m!497375 () Bool)

(assert (=> b!515945 m!497375))

(declare-fun m!497377 () Bool)

(assert (=> b!515950 m!497377))

(assert (=> b!515946 m!497359))

(assert (=> b!515946 m!497359))

(declare-fun m!497379 () Bool)

(assert (=> b!515946 m!497379))

(declare-fun m!497381 () Bool)

(assert (=> b!515951 m!497381))

(assert (=> b!515951 m!497359))

(declare-fun m!497383 () Bool)

(assert (=> b!515943 m!497383))

(declare-fun m!497385 () Bool)

(assert (=> start!46732 m!497385))

(declare-fun m!497387 () Bool)

(assert (=> start!46732 m!497387))

(assert (=> b!515941 m!497359))

(assert (=> b!515941 m!497359))

(declare-fun m!497389 () Bool)

(assert (=> b!515941 m!497389))

(push 1)

