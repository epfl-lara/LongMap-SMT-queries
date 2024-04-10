; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31568 () Bool)

(assert start!31568)

(declare-fun b!315646 () Bool)

(declare-fun res!170928 () Bool)

(declare-fun e!196474 () Bool)

(assert (=> b!315646 (=> (not res!170928) (not e!196474))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((array!16092 0))(
  ( (array!16093 (arr!7616 (Array (_ BitVec 32) (_ BitVec 64))) (size!7968 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16092)

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2756 0))(
  ( (MissingZero!2756 (index!13200 (_ BitVec 32))) (Found!2756 (index!13201 (_ BitVec 32))) (Intermediate!2756 (undefined!3568 Bool) (index!13202 (_ BitVec 32)) (x!31450 (_ BitVec 32))) (Undefined!2756) (MissingVacant!2756 (index!13203 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16092 (_ BitVec 32)) SeekEntryResult!2756)

(assert (=> b!315646 (= res!170928 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2756 i!1240)))))

(declare-fun b!315647 () Bool)

(assert (=> b!315647 false))

(declare-datatypes ((Unit!9707 0))(
  ( (Unit!9708) )
))
(declare-fun e!196476 () Unit!9707)

(declare-fun Unit!9709 () Unit!9707)

(assert (=> b!315647 (= e!196476 Unit!9709)))

(declare-fun b!315648 () Bool)

(declare-fun res!170929 () Bool)

(assert (=> b!315648 (=> (not res!170929) (not e!196474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16092 (_ BitVec 32)) Bool)

(assert (=> b!315648 (= res!170929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315649 () Bool)

(declare-fun res!170930 () Bool)

(declare-fun e!196473 () Bool)

(assert (=> b!315649 (=> (not res!170930) (not e!196473))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315649 (= res!170930 (and (= (select (arr!7616 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7968 a!3293))))))

(declare-fun b!315650 () Bool)

(assert (=> b!315650 false))

(declare-fun lt!154350 () SeekEntryResult!2756)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16092 (_ BitVec 32)) SeekEntryResult!2756)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315650 (= lt!154350 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9710 () Unit!9707)

(assert (=> b!315650 (= e!196476 Unit!9710)))

(declare-fun res!170935 () Bool)

(assert (=> start!31568 (=> (not res!170935) (not e!196474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31568 (= res!170935 (validMask!0 mask!3709))))

(assert (=> start!31568 e!196474))

(declare-fun array_inv!5579 (array!16092) Bool)

(assert (=> start!31568 (array_inv!5579 a!3293)))

(assert (=> start!31568 true))

(declare-fun b!315651 () Bool)

(declare-fun e!196477 () Unit!9707)

(assert (=> b!315651 (= e!196477 e!196476)))

(declare-fun c!49977 () Bool)

(assert (=> b!315651 (= c!49977 (or (= (select (arr!7616 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7616 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315652 () Bool)

(assert (=> b!315652 (= e!196473 (not (= index!1781 resIndex!52)))))

(declare-fun lt!154349 () Unit!9707)

(assert (=> b!315652 (= lt!154349 e!196477)))

(declare-fun c!49976 () Bool)

(assert (=> b!315652 (= c!49976 (not (= resIndex!52 index!1781)))))

(declare-fun b!315653 () Bool)

(declare-fun res!170934 () Bool)

(assert (=> b!315653 (=> (not res!170934) (not e!196474))))

(declare-fun arrayContainsKey!0 (array!16092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315653 (= res!170934 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315654 () Bool)

(declare-fun res!170931 () Bool)

(assert (=> b!315654 (=> (not res!170931) (not e!196474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315654 (= res!170931 (validKeyInArray!0 k!2441))))

(declare-fun b!315655 () Bool)

(declare-fun res!170936 () Bool)

(assert (=> b!315655 (=> (not res!170936) (not e!196473))))

(assert (=> b!315655 (= res!170936 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7616 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!315656 () Bool)

(declare-fun res!170932 () Bool)

(assert (=> b!315656 (=> (not res!170932) (not e!196474))))

(assert (=> b!315656 (= res!170932 (and (= (size!7968 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7968 a!3293))))))

(declare-fun b!315657 () Bool)

(assert (=> b!315657 (= e!196474 e!196473)))

(declare-fun res!170933 () Bool)

(assert (=> b!315657 (=> (not res!170933) (not e!196473))))

(declare-fun lt!154348 () SeekEntryResult!2756)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315657 (= res!170933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154348))))

(assert (=> b!315657 (= lt!154348 (Intermediate!2756 false resIndex!52 resX!52))))

(declare-fun b!315658 () Bool)

(declare-fun Unit!9711 () Unit!9707)

(assert (=> b!315658 (= e!196477 Unit!9711)))

(declare-fun b!315659 () Bool)

(declare-fun res!170937 () Bool)

(assert (=> b!315659 (=> (not res!170937) (not e!196473))))

(assert (=> b!315659 (= res!170937 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154348))))

(assert (= (and start!31568 res!170935) b!315656))

(assert (= (and b!315656 res!170932) b!315654))

(assert (= (and b!315654 res!170931) b!315653))

(assert (= (and b!315653 res!170934) b!315646))

(assert (= (and b!315646 res!170928) b!315648))

(assert (= (and b!315648 res!170929) b!315657))

(assert (= (and b!315657 res!170933) b!315649))

(assert (= (and b!315649 res!170930) b!315659))

(assert (= (and b!315659 res!170937) b!315655))

(assert (= (and b!315655 res!170936) b!315652))

(assert (= (and b!315652 c!49976) b!315651))

(assert (= (and b!315652 (not c!49976)) b!315658))

(assert (= (and b!315651 c!49977) b!315647))

(assert (= (and b!315651 (not c!49977)) b!315650))

(declare-fun m!324833 () Bool)

(assert (=> b!315651 m!324833))

(declare-fun m!324835 () Bool)

(assert (=> b!315646 m!324835))

(declare-fun m!324837 () Bool)

(assert (=> b!315657 m!324837))

(assert (=> b!315657 m!324837))

(declare-fun m!324839 () Bool)

(assert (=> b!315657 m!324839))

(declare-fun m!324841 () Bool)

(assert (=> b!315650 m!324841))

(assert (=> b!315650 m!324841))

(declare-fun m!324843 () Bool)

(assert (=> b!315650 m!324843))

(declare-fun m!324845 () Bool)

(assert (=> b!315653 m!324845))

(declare-fun m!324847 () Bool)

(assert (=> b!315659 m!324847))

(declare-fun m!324849 () Bool)

(assert (=> b!315648 m!324849))

(declare-fun m!324851 () Bool)

(assert (=> start!31568 m!324851))

(declare-fun m!324853 () Bool)

(assert (=> start!31568 m!324853))

(assert (=> b!315655 m!324833))

(declare-fun m!324855 () Bool)

(assert (=> b!315649 m!324855))

(declare-fun m!324857 () Bool)

(assert (=> b!315654 m!324857))

(push 1)

