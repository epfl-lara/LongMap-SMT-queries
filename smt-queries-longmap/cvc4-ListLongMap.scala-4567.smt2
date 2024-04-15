; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63690 () Bool)

(assert start!63690)

(declare-fun b!716797 () Bool)

(declare-fun res!479725 () Bool)

(declare-fun e!402463 () Bool)

(assert (=> b!716797 (=> (not res!479725) (not e!402463))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716797 (= res!479725 (validKeyInArray!0 k!2102))))

(declare-fun b!716798 () Bool)

(declare-fun res!479727 () Bool)

(assert (=> b!716798 (=> (not res!479727) (not e!402463))))

(declare-datatypes ((array!40596 0))(
  ( (array!40597 (arr!19431 (Array (_ BitVec 32) (_ BitVec 64))) (size!19852 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40596)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716798 (= res!479727 (and (= (size!19852 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19852 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19852 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716799 () Bool)

(assert (=> b!716799 (= e!402463 false)))

(declare-datatypes ((SeekEntryResult!7028 0))(
  ( (MissingZero!7028 (index!30480 (_ BitVec 32))) (Found!7028 (index!30481 (_ BitVec 32))) (Intermediate!7028 (undefined!7840 Bool) (index!30482 (_ BitVec 32)) (x!61515 (_ BitVec 32))) (Undefined!7028) (MissingVacant!7028 (index!30483 (_ BitVec 32))) )
))
(declare-fun lt!318749 () SeekEntryResult!7028)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40596 (_ BitVec 32)) SeekEntryResult!7028)

(assert (=> b!716799 (= lt!318749 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!716800 () Bool)

(declare-fun res!479724 () Bool)

(assert (=> b!716800 (=> (not res!479724) (not e!402463))))

(assert (=> b!716800 (= res!479724 (validKeyInArray!0 (select (arr!19431 a!3186) j!159)))))

(declare-fun res!479726 () Bool)

(assert (=> start!63690 (=> (not res!479726) (not e!402463))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63690 (= res!479726 (validMask!0 mask!3328))))

(assert (=> start!63690 e!402463))

(declare-fun array_inv!15314 (array!40596) Bool)

(assert (=> start!63690 (array_inv!15314 a!3186)))

(assert (=> start!63690 true))

(declare-fun b!716801 () Bool)

(declare-fun res!479723 () Bool)

(assert (=> b!716801 (=> (not res!479723) (not e!402463))))

(declare-fun arrayContainsKey!0 (array!40596 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716801 (= res!479723 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(assert (= (and start!63690 res!479726) b!716798))

(assert (= (and b!716798 res!479727) b!716800))

(assert (= (and b!716800 res!479724) b!716797))

(assert (= (and b!716797 res!479725) b!716801))

(assert (= (and b!716801 res!479723) b!716799))

(declare-fun m!672299 () Bool)

(assert (=> b!716797 m!672299))

(declare-fun m!672301 () Bool)

(assert (=> start!63690 m!672301))

(declare-fun m!672303 () Bool)

(assert (=> start!63690 m!672303))

(declare-fun m!672305 () Bool)

(assert (=> b!716799 m!672305))

(declare-fun m!672307 () Bool)

(assert (=> b!716801 m!672307))

(declare-fun m!672309 () Bool)

(assert (=> b!716800 m!672309))

(assert (=> b!716800 m!672309))

(declare-fun m!672311 () Bool)

(assert (=> b!716800 m!672311))

(push 1)

(assert (not b!716799))

(assert (not b!716797))

(assert (not b!716800))

(assert (not start!63690))

(assert (not b!716801))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

