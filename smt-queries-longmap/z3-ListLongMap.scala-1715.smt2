; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31582 () Bool)

(assert start!31582)

(declare-fun b!315940 () Bool)

(declare-fun res!171146 () Bool)

(declare-fun e!196579 () Bool)

(assert (=> b!315940 (=> (not res!171146) (not e!196579))))

(declare-datatypes ((array!16106 0))(
  ( (array!16107 (arr!7623 (Array (_ BitVec 32) (_ BitVec 64))) (size!7975 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16106)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2763 0))(
  ( (MissingZero!2763 (index!13228 (_ BitVec 32))) (Found!2763 (index!13229 (_ BitVec 32))) (Intermediate!2763 (undefined!3575 Bool) (index!13230 (_ BitVec 32)) (x!31473 (_ BitVec 32))) (Undefined!2763) (MissingVacant!2763 (index!13231 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16106 (_ BitVec 32)) SeekEntryResult!2763)

(assert (=> b!315940 (= res!171146 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2763 i!1240)))))

(declare-fun b!315941 () Bool)

(declare-fun res!171139 () Bool)

(assert (=> b!315941 (=> (not res!171139) (not e!196579))))

(declare-fun arrayContainsKey!0 (array!16106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315941 (= res!171139 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315942 () Bool)

(declare-fun res!171142 () Bool)

(declare-fun e!196581 () Bool)

(assert (=> b!315942 (=> (not res!171142) (not e!196581))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!154413 () SeekEntryResult!2763)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16106 (_ BitVec 32)) SeekEntryResult!2763)

(assert (=> b!315942 (= res!171142 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154413))))

(declare-fun b!315943 () Bool)

(declare-fun res!171143 () Bool)

(assert (=> b!315943 (=> (not res!171143) (not e!196581))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315943 (= res!171143 (and (= (select (arr!7623 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7975 a!3293))))))

(declare-fun b!315945 () Bool)

(declare-datatypes ((Unit!9742 0))(
  ( (Unit!9743) )
))
(declare-fun e!196578 () Unit!9742)

(declare-fun Unit!9744 () Unit!9742)

(assert (=> b!315945 (= e!196578 Unit!9744)))

(declare-fun b!315946 () Bool)

(declare-fun res!171141 () Bool)

(assert (=> b!315946 (=> (not res!171141) (not e!196581))))

(assert (=> b!315946 (= res!171141 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7623 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!315947 () Bool)

(declare-fun res!171145 () Bool)

(assert (=> b!315947 (=> (not res!171145) (not e!196579))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16106 (_ BitVec 32)) Bool)

(assert (=> b!315947 (= res!171145 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315948 () Bool)

(declare-fun res!171140 () Bool)

(assert (=> b!315948 (=> (not res!171140) (not e!196579))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315948 (= res!171140 (validKeyInArray!0 k0!2441))))

(declare-fun b!315949 () Bool)

(assert (=> b!315949 false))

(declare-fun e!196582 () Unit!9742)

(declare-fun Unit!9745 () Unit!9742)

(assert (=> b!315949 (= e!196582 Unit!9745)))

(declare-fun b!315950 () Bool)

(assert (=> b!315950 false))

(declare-fun lt!154411 () SeekEntryResult!2763)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315950 (= lt!154411 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun Unit!9746 () Unit!9742)

(assert (=> b!315950 (= e!196582 Unit!9746)))

(declare-fun b!315951 () Bool)

(assert (=> b!315951 (= e!196579 e!196581)))

(declare-fun res!171144 () Bool)

(assert (=> b!315951 (=> (not res!171144) (not e!196581))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315951 (= res!171144 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154413))))

(assert (=> b!315951 (= lt!154413 (Intermediate!2763 false resIndex!52 resX!52))))

(declare-fun b!315944 () Bool)

(assert (=> b!315944 (= e!196581 (not (= (select (arr!7623 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!315944 (= index!1781 resIndex!52)))

(declare-fun lt!154412 () Unit!9742)

(assert (=> b!315944 (= lt!154412 e!196578)))

(declare-fun c!50019 () Bool)

(assert (=> b!315944 (= c!50019 (not (= resIndex!52 index!1781)))))

(declare-fun res!171147 () Bool)

(assert (=> start!31582 (=> (not res!171147) (not e!196579))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31582 (= res!171147 (validMask!0 mask!3709))))

(assert (=> start!31582 e!196579))

(declare-fun array_inv!5586 (array!16106) Bool)

(assert (=> start!31582 (array_inv!5586 a!3293)))

(assert (=> start!31582 true))

(declare-fun b!315952 () Bool)

(assert (=> b!315952 (= e!196578 e!196582)))

(declare-fun c!50018 () Bool)

(assert (=> b!315952 (= c!50018 (or (= (select (arr!7623 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7623 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315953 () Bool)

(declare-fun res!171138 () Bool)

(assert (=> b!315953 (=> (not res!171138) (not e!196579))))

(assert (=> b!315953 (= res!171138 (and (= (size!7975 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7975 a!3293))))))

(assert (= (and start!31582 res!171147) b!315953))

(assert (= (and b!315953 res!171138) b!315948))

(assert (= (and b!315948 res!171140) b!315941))

(assert (= (and b!315941 res!171139) b!315940))

(assert (= (and b!315940 res!171146) b!315947))

(assert (= (and b!315947 res!171145) b!315951))

(assert (= (and b!315951 res!171144) b!315943))

(assert (= (and b!315943 res!171143) b!315942))

(assert (= (and b!315942 res!171142) b!315946))

(assert (= (and b!315946 res!171141) b!315944))

(assert (= (and b!315944 c!50019) b!315952))

(assert (= (and b!315944 (not c!50019)) b!315945))

(assert (= (and b!315952 c!50018) b!315949))

(assert (= (and b!315952 (not c!50018)) b!315950))

(declare-fun m!325015 () Bool)

(assert (=> start!31582 m!325015))

(declare-fun m!325017 () Bool)

(assert (=> start!31582 m!325017))

(declare-fun m!325019 () Bool)

(assert (=> b!315948 m!325019))

(declare-fun m!325021 () Bool)

(assert (=> b!315950 m!325021))

(assert (=> b!315950 m!325021))

(declare-fun m!325023 () Bool)

(assert (=> b!315950 m!325023))

(declare-fun m!325025 () Bool)

(assert (=> b!315941 m!325025))

(declare-fun m!325027 () Bool)

(assert (=> b!315942 m!325027))

(declare-fun m!325029 () Bool)

(assert (=> b!315944 m!325029))

(assert (=> b!315952 m!325029))

(declare-fun m!325031 () Bool)

(assert (=> b!315943 m!325031))

(declare-fun m!325033 () Bool)

(assert (=> b!315940 m!325033))

(declare-fun m!325035 () Bool)

(assert (=> b!315947 m!325035))

(declare-fun m!325037 () Bool)

(assert (=> b!315951 m!325037))

(assert (=> b!315951 m!325037))

(declare-fun m!325039 () Bool)

(assert (=> b!315951 m!325039))

(assert (=> b!315946 m!325029))

(check-sat (not b!315940) (not b!315951) (not start!31582) (not b!315942) (not b!315948) (not b!315947) (not b!315950) (not b!315941))
(check-sat)
