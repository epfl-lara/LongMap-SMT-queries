; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44740 () Bool)

(assert start!44740)

(declare-fun b!491090 () Bool)

(declare-fun e!288599 () Bool)

(declare-fun e!288603 () Bool)

(assert (=> b!491090 (= e!288599 e!288603)))

(declare-fun res!294026 () Bool)

(assert (=> b!491090 (=> res!294026 e!288603)))

(declare-fun mask!3524 () (_ BitVec 32))

(assert (=> b!491090 (= res!294026 (bvslt mask!3524 #b00000000000000000000000000000000))))

(declare-datatypes ((SeekEntryResult!3754 0))(
  ( (MissingZero!3754 (index!17195 (_ BitVec 32))) (Found!3754 (index!17196 (_ BitVec 32))) (Intermediate!3754 (undefined!4566 Bool) (index!17197 (_ BitVec 32)) (x!46284 (_ BitVec 32))) (Undefined!3754) (MissingVacant!3754 (index!17198 (_ BitVec 32))) )
))
(declare-fun lt!221925 () SeekEntryResult!3754)

(declare-fun lt!221922 () (_ BitVec 64))

(declare-datatypes ((array!31799 0))(
  ( (array!31800 (arr!15287 (Array (_ BitVec 32) (_ BitVec 64))) (size!15651 (_ BitVec 32))) )
))
(declare-fun lt!221924 () array!31799)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31799 (_ BitVec 32)) SeekEntryResult!3754)

(assert (=> b!491090 (= lt!221925 (seekEntryOrOpen!0 lt!221922 lt!221924 mask!3524))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun a!3235 () array!31799)

(declare-datatypes ((Unit!14454 0))(
  ( (Unit!14455) )
))
(declare-fun lt!221926 () Unit!14454)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31799 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14454)

(assert (=> b!491090 (= lt!221926 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491091 () Bool)

(declare-fun res!294032 () Bool)

(declare-fun e!288601 () Bool)

(assert (=> b!491091 (=> (not res!294032) (not e!288601))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491091 (= res!294032 (validKeyInArray!0 k!2280))))

(declare-fun b!491092 () Bool)

(declare-fun e!288602 () Bool)

(assert (=> b!491092 (= e!288601 e!288602)))

(declare-fun res!294035 () Bool)

(assert (=> b!491092 (=> (not res!294035) (not e!288602))))

(declare-fun lt!221923 () SeekEntryResult!3754)

(assert (=> b!491092 (= res!294035 (or (= lt!221923 (MissingZero!3754 i!1204)) (= lt!221923 (MissingVacant!3754 i!1204))))))

(assert (=> b!491092 (= lt!221923 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun res!294033 () Bool)

(assert (=> start!44740 (=> (not res!294033) (not e!288601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44740 (= res!294033 (validMask!0 mask!3524))))

(assert (=> start!44740 e!288601))

(assert (=> start!44740 true))

(declare-fun array_inv!11083 (array!31799) Bool)

(assert (=> start!44740 (array_inv!11083 a!3235)))

(declare-fun b!491093 () Bool)

(declare-fun res!294034 () Bool)

(assert (=> b!491093 (=> (not res!294034) (not e!288601))))

(assert (=> b!491093 (= res!294034 (validKeyInArray!0 (select (arr!15287 a!3235) j!176)))))

(declare-fun b!491094 () Bool)

(declare-fun res!294027 () Bool)

(assert (=> b!491094 (=> (not res!294027) (not e!288601))))

(declare-fun arrayContainsKey!0 (array!31799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491094 (= res!294027 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491095 () Bool)

(assert (=> b!491095 (= e!288603 (validKeyInArray!0 lt!221922))))

(declare-fun b!491096 () Bool)

(assert (=> b!491096 (= e!288602 (not e!288599))))

(declare-fun res!294030 () Bool)

(assert (=> b!491096 (=> res!294030 e!288599)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31799 (_ BitVec 32)) SeekEntryResult!3754)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491096 (= res!294030 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15287 a!3235) j!176) mask!3524) (select (arr!15287 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221922 mask!3524) lt!221922 lt!221924 mask!3524))))))

(assert (=> b!491096 (= lt!221922 (select (store (arr!15287 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491096 (= lt!221924 (array!31800 (store (arr!15287 a!3235) i!1204 k!2280) (size!15651 a!3235)))))

(assert (=> b!491096 (= lt!221925 (Found!3754 j!176))))

(assert (=> b!491096 (= lt!221925 (seekEntryOrOpen!0 (select (arr!15287 a!3235) j!176) a!3235 mask!3524))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31799 (_ BitVec 32)) Bool)

(assert (=> b!491096 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221921 () Unit!14454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31799 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14454)

(assert (=> b!491096 (= lt!221921 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491097 () Bool)

(declare-fun res!294029 () Bool)

(assert (=> b!491097 (=> (not res!294029) (not e!288602))))

(assert (=> b!491097 (= res!294029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491098 () Bool)

(declare-fun res!294031 () Bool)

(assert (=> b!491098 (=> (not res!294031) (not e!288601))))

(assert (=> b!491098 (= res!294031 (and (= (size!15651 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15651 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15651 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491099 () Bool)

(declare-fun res!294028 () Bool)

(assert (=> b!491099 (=> (not res!294028) (not e!288602))))

(declare-datatypes ((List!9445 0))(
  ( (Nil!9442) (Cons!9441 (h!10303 (_ BitVec 64)) (t!15673 List!9445)) )
))
(declare-fun arrayNoDuplicates!0 (array!31799 (_ BitVec 32) List!9445) Bool)

(assert (=> b!491099 (= res!294028 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9442))))

(assert (= (and start!44740 res!294033) b!491098))

(assert (= (and b!491098 res!294031) b!491093))

(assert (= (and b!491093 res!294034) b!491091))

(assert (= (and b!491091 res!294032) b!491094))

(assert (= (and b!491094 res!294027) b!491092))

(assert (= (and b!491092 res!294035) b!491097))

(assert (= (and b!491097 res!294029) b!491099))

(assert (= (and b!491099 res!294028) b!491096))

(assert (= (and b!491096 (not res!294030)) b!491090))

(assert (= (and b!491090 (not res!294026)) b!491095))

(declare-fun m!471501 () Bool)

(assert (=> b!491093 m!471501))

(assert (=> b!491093 m!471501))

(declare-fun m!471503 () Bool)

(assert (=> b!491093 m!471503))

(declare-fun m!471505 () Bool)

(assert (=> b!491095 m!471505))

(declare-fun m!471507 () Bool)

(assert (=> b!491092 m!471507))

(declare-fun m!471509 () Bool)

(assert (=> b!491090 m!471509))

(declare-fun m!471511 () Bool)

(assert (=> b!491090 m!471511))

(declare-fun m!471513 () Bool)

(assert (=> b!491094 m!471513))

(declare-fun m!471515 () Bool)

(assert (=> b!491099 m!471515))

(declare-fun m!471517 () Bool)

(assert (=> start!44740 m!471517))

(declare-fun m!471519 () Bool)

(assert (=> start!44740 m!471519))

(declare-fun m!471521 () Bool)

(assert (=> b!491097 m!471521))

(declare-fun m!471523 () Bool)

(assert (=> b!491096 m!471523))

(declare-fun m!471525 () Bool)

(assert (=> b!491096 m!471525))

(declare-fun m!471527 () Bool)

(assert (=> b!491096 m!471527))

(declare-fun m!471529 () Bool)

(assert (=> b!491096 m!471529))

(declare-fun m!471531 () Bool)

(assert (=> b!491096 m!471531))

(declare-fun m!471533 () Bool)

(assert (=> b!491096 m!471533))

(assert (=> b!491096 m!471501))

(declare-fun m!471535 () Bool)

(assert (=> b!491096 m!471535))

(assert (=> b!491096 m!471501))

(assert (=> b!491096 m!471533))

(assert (=> b!491096 m!471501))

(declare-fun m!471537 () Bool)

(assert (=> b!491096 m!471537))

(assert (=> b!491096 m!471501))

(declare-fun m!471539 () Bool)

(assert (=> b!491096 m!471539))

(assert (=> b!491096 m!471523))

(declare-fun m!471541 () Bool)

(assert (=> b!491091 m!471541))

(push 1)

