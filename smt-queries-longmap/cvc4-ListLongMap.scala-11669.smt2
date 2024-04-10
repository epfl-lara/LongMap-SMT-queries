; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136454 () Bool)

(assert start!136454)

(declare-fun b!1577548 () Bool)

(declare-fun res!1077757 () Bool)

(declare-fun e!879917 () Bool)

(assert (=> b!1577548 (=> (not res!1077757) (not e!879917))))

(declare-fun k!768 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1577548 (= res!1077757 (validKeyInArray!0 k!768))))

(declare-fun b!1577547 () Bool)

(declare-fun res!1077756 () Bool)

(assert (=> b!1577547 (=> (not res!1077756) (not e!879917))))

(declare-fun x!458 () (_ BitVec 32))

(declare-fun ee!12 () (_ BitVec 32))

(declare-fun mask!910 () (_ BitVec 32))

(declare-datatypes ((array!105618 0))(
  ( (array!105619 (arr!50928 (Array (_ BitVec 32) (_ BitVec 64))) (size!51478 (_ BitVec 32))) )
))
(declare-fun _keys!610 () array!105618)

(assert (=> b!1577547 (= res!1077756 (and (bvsge mask!910 #b00000000000000000000000000000000) (= (size!51478 _keys!610) (bvadd #b00000000000000000000000000000001 mask!910)) (bvsge ee!12 #b00000000000000000000000000000000) (bvslt ee!12 (bvadd #b00000000000000000000000000000001 mask!910)) (bvsle x!458 #b01111111111111111111111111111110) (bvsge x!458 #b00000000000000000000000000000000)))))

(declare-datatypes ((SeekEntryResult!13757 0))(
  ( (MissingZero!13757 (index!57426 (_ BitVec 32))) (Found!13757 (index!57427 (_ BitVec 32))) (Intermediate!13757 (undefined!14569 Bool) (index!57428 (_ BitVec 32)) (x!142552 (_ BitVec 32))) (Undefined!13757) (MissingVacant!13757 (index!57429 (_ BitVec 32))) )
))
(declare-fun lt!676027 () SeekEntryResult!13757)

(declare-fun b!1577550 () Bool)

(assert (=> b!1577550 (= e!879917 (and (is-Intermediate!13757 lt!676027) (not (undefined!14569 lt!676027)) (bvslt (x!142552 lt!676027) #b01111111111111111111111111111110) (bvsge (x!142552 lt!676027) #b00000000000000000000000000000000) (bvsge (x!142552 lt!676027) x!458) (not (= (select (arr!50928 _keys!610) (index!57428 lt!676027)) k!768)) (or (bvslt (index!57428 lt!676027) #b00000000000000000000000000000000) (bvsge (index!57428 lt!676027) (size!51478 _keys!610)))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105618 (_ BitVec 32)) SeekEntryResult!13757)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1577550 (= lt!676027 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458) (nextIndex!0 ee!12 x!458 mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577549 () Bool)

(declare-fun res!1077758 () Bool)

(assert (=> b!1577549 (=> (not res!1077758) (not e!879917))))

(assert (=> b!1577549 (= res!1077758 (and (bvslt x!458 #b01111111111111111111111111111110) (not (= (select (arr!50928 _keys!610) ee!12) k!768)) (not (= (bvadd (select (arr!50928 _keys!610) ee!12) (select (arr!50928 _keys!610) ee!12)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!1077759 () Bool)

(assert (=> start!136454 (=> (not res!1077759) (not e!879917))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!136454 (= res!1077759 (validMask!0 mask!910))))

(assert (=> start!136454 e!879917))

(assert (=> start!136454 true))

(declare-fun array_inv!39655 (array!105618) Bool)

(assert (=> start!136454 (array_inv!39655 _keys!610)))

(assert (= (and start!136454 res!1077759) b!1577547))

(assert (= (and b!1577547 res!1077756) b!1577548))

(assert (= (and b!1577548 res!1077757) b!1577549))

(assert (= (and b!1577549 res!1077758) b!1577550))

(declare-fun m!1449779 () Bool)

(assert (=> b!1577548 m!1449779))

(declare-fun m!1449781 () Bool)

(assert (=> b!1577550 m!1449781))

(declare-fun m!1449783 () Bool)

(assert (=> b!1577550 m!1449783))

(assert (=> b!1577550 m!1449783))

(declare-fun m!1449785 () Bool)

(assert (=> b!1577550 m!1449785))

(declare-fun m!1449787 () Bool)

(assert (=> b!1577549 m!1449787))

(declare-fun m!1449789 () Bool)

(assert (=> start!136454 m!1449789))

(declare-fun m!1449791 () Bool)

(assert (=> start!136454 m!1449791))

(push 1)

(assert (not b!1577548))

(assert (not b!1577550))

(assert (not start!136454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!165903 () Bool)

(assert (=> d!165903 (= (validKeyInArray!0 k!768) (and (not (= k!768 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!768 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1577548 d!165903))

(declare-fun b!1577623 () Bool)

(declare-fun e!879961 () Bool)

(declare-fun e!879958 () Bool)

(assert (=> b!1577623 (= e!879961 e!879958)))

(declare-fun res!1077784 () Bool)

(declare-fun lt!676050 () SeekEntryResult!13757)

(assert (=> b!1577623 (= res!1077784 (and (is-Intermediate!13757 lt!676050) (not (undefined!14569 lt!676050)) (bvslt (x!142552 lt!676050) #b01111111111111111111111111111110) (bvsge (x!142552 lt!676050) #b00000000000000000000000000000000) (bvsge (x!142552 lt!676050) (bvadd #b00000000000000000000000000000001 x!458))))))

(assert (=> b!1577623 (=> (not res!1077784) (not e!879958))))

(declare-fun e!879962 () SeekEntryResult!13757)

(declare-fun b!1577624 () Bool)

(assert (=> b!1577624 (= e!879962 (Intermediate!13757 true (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577625 () Bool)

(assert (=> b!1577625 (and (bvsge (index!57428 lt!676050) #b00000000000000000000000000000000) (bvslt (index!57428 lt!676050) (size!51478 _keys!610)))))

(declare-fun e!879960 () Bool)

(assert (=> b!1577625 (= e!879960 (= (select (arr!50928 _keys!610) (index!57428 lt!676050)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1577626 () Bool)

(declare-fun e!879959 () SeekEntryResult!13757)

(assert (=> b!1577626 (= e!879962 e!879959)))

(declare-fun c!146203 () Bool)

(declare-fun lt!676051 () (_ BitVec 64))

(assert (=> b!1577626 (= c!146203 (or (= lt!676051 k!768) (= (bvadd lt!676051 lt!676051) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1577627 () Bool)

(assert (=> b!1577627 (= e!879961 (bvsge (x!142552 lt!676050) #b01111111111111111111111111111110))))

(declare-fun b!1577628 () Bool)

(assert (=> b!1577628 (= e!879959 (Intermediate!13757 false (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458)))))

(declare-fun b!1577629 () Bool)

(assert (=> b!1577629 (= e!879959 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!458 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 ee!12 x!458 mask!910) (bvadd #b00000000000000000000000000000001 x!458) mask!910) k!768 _keys!610 mask!910))))

(declare-fun b!1577630 () Bool)

(assert (=> b!1577630 (and (bvsge (index!57428 lt!676050) #b00000000000000000000000000000000) (bvslt (index!57428 lt!676050) (size!51478 _keys!610)))))

(declare-fun res!1077786 () Bool)

(assert (=> b!1577630 (= res!1077786 (= (select (arr!50928 _keys!610) (index!57428 lt!676050)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1577630 (=> res!1077786 e!879960)))

(declare-fun d!165905 () Bool)

(assert (=> d!165905 e!879961))

(declare-fun c!146205 () Bool)

(assert (=> d!165905 (= c!146205 (and (is-Intermediate!13757 lt!676050) (undefined!14569 lt!676050)))))

(assert (=> d!165905 (= lt!676050 e!879962)))

(declare-fun c!146204 () Bool)

(assert (=> d!165905 (= c!146204 (bvsge (bvadd #b00000000000000000000000000000001 x!458) #b01111111111111111111111111111110))))

