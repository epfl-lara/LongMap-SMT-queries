; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44742 () Bool)

(assert start!44742)

(declare-fun b!491119 () Bool)

(declare-fun res!294057 () Bool)

(declare-fun e!288612 () Bool)

(assert (=> b!491119 (=> (not res!294057) (not e!288612))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491119 (= res!294057 (validKeyInArray!0 k!2280))))

(declare-fun b!491120 () Bool)

(declare-fun res!294060 () Bool)

(declare-fun e!288614 () Bool)

(assert (=> b!491120 (=> (not res!294060) (not e!288614))))

(declare-datatypes ((array!31801 0))(
  ( (array!31802 (arr!15288 (Array (_ BitVec 32) (_ BitVec 64))) (size!15652 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31801)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31801 (_ BitVec 32)) Bool)

(assert (=> b!491120 (= res!294060 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491121 () Bool)

(declare-fun res!294058 () Bool)

(assert (=> b!491121 (=> (not res!294058) (not e!288612))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491121 (= res!294058 (validKeyInArray!0 (select (arr!15288 a!3235) j!176)))))

(declare-fun b!491122 () Bool)

(declare-fun res!294059 () Bool)

(assert (=> b!491122 (=> (not res!294059) (not e!288614))))

(declare-datatypes ((List!9446 0))(
  ( (Nil!9443) (Cons!9442 (h!10304 (_ BitVec 64)) (t!15674 List!9446)) )
))
(declare-fun arrayNoDuplicates!0 (array!31801 (_ BitVec 32) List!9446) Bool)

(assert (=> b!491122 (= res!294059 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9443))))

(declare-fun b!491123 () Bool)

(declare-fun res!294061 () Bool)

(assert (=> b!491123 (=> (not res!294061) (not e!288612))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491123 (= res!294061 (and (= (size!15652 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15652 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15652 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491118 () Bool)

(declare-fun res!294055 () Bool)

(assert (=> b!491118 (=> (not res!294055) (not e!288612))))

(declare-fun arrayContainsKey!0 (array!31801 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491118 (= res!294055 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!294054 () Bool)

(assert (=> start!44742 (=> (not res!294054) (not e!288612))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44742 (= res!294054 (validMask!0 mask!3524))))

(assert (=> start!44742 e!288612))

(assert (=> start!44742 true))

(declare-fun array_inv!11084 (array!31801) Bool)

(assert (=> start!44742 (array_inv!11084 a!3235)))

(declare-fun b!491124 () Bool)

(declare-fun e!288615 () Bool)

(assert (=> b!491124 (= e!288614 (not e!288615))))

(declare-fun res!294056 () Bool)

(assert (=> b!491124 (=> res!294056 e!288615)))

(declare-fun lt!221942 () array!31801)

(declare-fun lt!221939 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3755 0))(
  ( (MissingZero!3755 (index!17199 (_ BitVec 32))) (Found!3755 (index!17200 (_ BitVec 32))) (Intermediate!3755 (undefined!4567 Bool) (index!17201 (_ BitVec 32)) (x!46293 (_ BitVec 32))) (Undefined!3755) (MissingVacant!3755 (index!17202 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31801 (_ BitVec 32)) SeekEntryResult!3755)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491124 (= res!294056 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15288 a!3235) j!176) mask!3524) (select (arr!15288 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221939 mask!3524) lt!221939 lt!221942 mask!3524))))))

(assert (=> b!491124 (= lt!221939 (select (store (arr!15288 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491124 (= lt!221942 (array!31802 (store (arr!15288 a!3235) i!1204 k!2280) (size!15652 a!3235)))))

(declare-fun lt!221943 () SeekEntryResult!3755)

(assert (=> b!491124 (= lt!221943 (Found!3755 j!176))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31801 (_ BitVec 32)) SeekEntryResult!3755)

(assert (=> b!491124 (= lt!221943 (seekEntryOrOpen!0 (select (arr!15288 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491124 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-datatypes ((Unit!14456 0))(
  ( (Unit!14457) )
))
(declare-fun lt!221944 () Unit!14456)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31801 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14456)

(assert (=> b!491124 (= lt!221944 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!491125 () Bool)

(assert (=> b!491125 (= e!288615 true)))

(assert (=> b!491125 (= lt!221943 (seekEntryOrOpen!0 lt!221939 lt!221942 mask!3524))))

(declare-fun lt!221941 () Unit!14456)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31801 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14456)

(assert (=> b!491125 (= lt!221941 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491126 () Bool)

(assert (=> b!491126 (= e!288612 e!288614)))

(declare-fun res!294062 () Bool)

(assert (=> b!491126 (=> (not res!294062) (not e!288614))))

(declare-fun lt!221940 () SeekEntryResult!3755)

(assert (=> b!491126 (= res!294062 (or (= lt!221940 (MissingZero!3755 i!1204)) (= lt!221940 (MissingVacant!3755 i!1204))))))

(assert (=> b!491126 (= lt!221940 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!44742 res!294054) b!491123))

(assert (= (and b!491123 res!294061) b!491121))

(assert (= (and b!491121 res!294058) b!491119))

(assert (= (and b!491119 res!294057) b!491118))

(assert (= (and b!491118 res!294055) b!491126))

(assert (= (and b!491126 res!294062) b!491120))

(assert (= (and b!491120 res!294060) b!491122))

(assert (= (and b!491122 res!294059) b!491124))

(assert (= (and b!491124 (not res!294056)) b!491125))

(declare-fun m!471543 () Bool)

(assert (=> b!491118 m!471543))

(declare-fun m!471545 () Bool)

(assert (=> b!491125 m!471545))

(declare-fun m!471547 () Bool)

(assert (=> b!491125 m!471547))

(declare-fun m!471549 () Bool)

(assert (=> b!491119 m!471549))

(declare-fun m!471551 () Bool)

(assert (=> b!491120 m!471551))

(declare-fun m!471553 () Bool)

(assert (=> start!44742 m!471553))

(declare-fun m!471555 () Bool)

(assert (=> start!44742 m!471555))

(declare-fun m!471557 () Bool)

(assert (=> b!491124 m!471557))

(declare-fun m!471559 () Bool)

(assert (=> b!491124 m!471559))

(declare-fun m!471561 () Bool)

(assert (=> b!491124 m!471561))

(declare-fun m!471563 () Bool)

(assert (=> b!491124 m!471563))

(declare-fun m!471565 () Bool)

(assert (=> b!491124 m!471565))

(assert (=> b!491124 m!471563))

(assert (=> b!491124 m!471561))

(assert (=> b!491124 m!471563))

(declare-fun m!471567 () Bool)

(assert (=> b!491124 m!471567))

(declare-fun m!471569 () Bool)

(assert (=> b!491124 m!471569))

(assert (=> b!491124 m!471563))

(declare-fun m!471571 () Bool)

(assert (=> b!491124 m!471571))

(assert (=> b!491124 m!471567))

(declare-fun m!471573 () Bool)

(assert (=> b!491124 m!471573))

(declare-fun m!471575 () Bool)

(assert (=> b!491124 m!471575))

(declare-fun m!471577 () Bool)

(assert (=> b!491126 m!471577))

(assert (=> b!491121 m!471563))

(assert (=> b!491121 m!471563))

(declare-fun m!471579 () Bool)

(assert (=> b!491121 m!471579))

(declare-fun m!471581 () Bool)

(assert (=> b!491122 m!471581))

(push 1)

