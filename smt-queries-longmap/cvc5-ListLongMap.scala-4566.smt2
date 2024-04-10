; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63694 () Bool)

(assert start!63694)

(declare-fun b!716975 () Bool)

(declare-fun res!479765 () Bool)

(declare-fun e!402580 () Bool)

(assert (=> b!716975 (=> (not res!479765) (not e!402580))))

(declare-datatypes ((array!40590 0))(
  ( (array!40591 (arr!19428 (Array (_ BitVec 32) (_ BitVec 64))) (size!19849 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!40590)

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!40590 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!716975 (= res!479765 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!716976 () Bool)

(declare-fun res!479763 () Bool)

(assert (=> b!716976 (=> (not res!479763) (not e!402580))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!716976 (= res!479763 (validKeyInArray!0 (select (arr!19428 a!3186) j!159)))))

(declare-fun b!716978 () Bool)

(declare-fun res!479764 () Bool)

(assert (=> b!716978 (=> (not res!479764) (not e!402580))))

(assert (=> b!716978 (= res!479764 (validKeyInArray!0 k!2102))))

(declare-fun b!716979 () Bool)

(declare-fun res!479761 () Bool)

(assert (=> b!716979 (=> (not res!479761) (not e!402580))))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!716979 (= res!479761 (and (= (size!19849 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!19849 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!19849 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!716977 () Bool)

(assert (=> b!716977 (= e!402580 false)))

(declare-datatypes ((SeekEntryResult!7028 0))(
  ( (MissingZero!7028 (index!30480 (_ BitVec 32))) (Found!7028 (index!30481 (_ BitVec 32))) (Intermediate!7028 (undefined!7840 Bool) (index!30482 (_ BitVec 32)) (x!61512 (_ BitVec 32))) (Undefined!7028) (MissingVacant!7028 (index!30483 (_ BitVec 32))) )
))
(declare-fun lt!318977 () SeekEntryResult!7028)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!40590 (_ BitVec 32)) SeekEntryResult!7028)

(assert (=> b!716977 (= lt!318977 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun res!479762 () Bool)

(assert (=> start!63694 (=> (not res!479762) (not e!402580))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!63694 (= res!479762 (validMask!0 mask!3328))))

(assert (=> start!63694 e!402580))

(declare-fun array_inv!15224 (array!40590) Bool)

(assert (=> start!63694 (array_inv!15224 a!3186)))

(assert (=> start!63694 true))

(assert (= (and start!63694 res!479762) b!716979))

(assert (= (and b!716979 res!479761) b!716976))

(assert (= (and b!716976 res!479763) b!716978))

(assert (= (and b!716978 res!479764) b!716975))

(assert (= (and b!716975 res!479765) b!716977))

(declare-fun m!672943 () Bool)

(assert (=> b!716976 m!672943))

(assert (=> b!716976 m!672943))

(declare-fun m!672945 () Bool)

(assert (=> b!716976 m!672945))

(declare-fun m!672947 () Bool)

(assert (=> b!716978 m!672947))

(declare-fun m!672949 () Bool)

(assert (=> b!716975 m!672949))

(declare-fun m!672951 () Bool)

(assert (=> start!63694 m!672951))

(declare-fun m!672953 () Bool)

(assert (=> start!63694 m!672953))

(declare-fun m!672955 () Bool)

(assert (=> b!716977 m!672955))

(push 1)

(assert (not start!63694))

(assert (not b!716976))

(assert (not b!716975))

(assert (not b!716977))

(assert (not b!716978))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

