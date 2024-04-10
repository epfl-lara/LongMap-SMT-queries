; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31580 () Bool)

(assert start!31580)

(declare-fun b!315898 () Bool)

(declare-fun res!171113 () Bool)

(declare-fun e!196565 () Bool)

(assert (=> b!315898 (=> (not res!171113) (not e!196565))))

(declare-datatypes ((array!16104 0))(
  ( (array!16105 (arr!7622 (Array (_ BitVec 32) (_ BitVec 64))) (size!7974 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16104)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315898 (= res!171113 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7622 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!315899 () Bool)

(declare-datatypes ((Unit!9737 0))(
  ( (Unit!9738) )
))
(declare-fun e!196563 () Unit!9737)

(declare-fun Unit!9739 () Unit!9737)

(assert (=> b!315899 (= e!196563 Unit!9739)))

(declare-fun b!315900 () Bool)

(assert (=> b!315900 false))

(declare-fun e!196567 () Unit!9737)

(declare-fun Unit!9740 () Unit!9737)

(assert (=> b!315900 (= e!196567 Unit!9740)))

(declare-fun b!315901 () Bool)

(assert (=> b!315901 (= e!196563 e!196567)))

(declare-fun c!50012 () Bool)

(assert (=> b!315901 (= c!50012 (or (= (select (arr!7622 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7622 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315902 () Bool)

(assert (=> b!315902 false))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2762 0))(
  ( (MissingZero!2762 (index!13224 (_ BitVec 32))) (Found!2762 (index!13225 (_ BitVec 32))) (Intermediate!2762 (undefined!3574 Bool) (index!13226 (_ BitVec 32)) (x!31472 (_ BitVec 32))) (Undefined!2762) (MissingVacant!2762 (index!13227 (_ BitVec 32))) )
))
(declare-fun lt!154403 () SeekEntryResult!2762)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16104 (_ BitVec 32)) SeekEntryResult!2762)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315902 (= lt!154403 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9741 () Unit!9737)

(assert (=> b!315902 (= e!196567 Unit!9741)))

(declare-fun b!315903 () Bool)

(declare-fun res!171116 () Bool)

(declare-fun e!196566 () Bool)

(assert (=> b!315903 (=> (not res!171116) (not e!196566))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16104 (_ BitVec 32)) SeekEntryResult!2762)

(assert (=> b!315903 (= res!171116 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2762 i!1240)))))

(declare-fun b!315904 () Bool)

(assert (=> b!315904 (= e!196566 e!196565)))

(declare-fun res!171112 () Bool)

(assert (=> b!315904 (=> (not res!171112) (not e!196565))))

(declare-fun lt!154404 () SeekEntryResult!2762)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315904 (= res!171112 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154404))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!315904 (= lt!154404 (Intermediate!2762 false resIndex!52 resX!52))))

(declare-fun b!315905 () Bool)

(declare-fun res!171111 () Bool)

(assert (=> b!315905 (=> (not res!171111) (not e!196566))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16104 (_ BitVec 32)) Bool)

(assert (=> b!315905 (= res!171111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315906 () Bool)

(declare-fun res!171114 () Bool)

(assert (=> b!315906 (=> (not res!171114) (not e!196566))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315906 (= res!171114 (validKeyInArray!0 k!2441))))

(declare-fun b!315907 () Bool)

(assert (=> b!315907 (= e!196565 (not (= (select (arr!7622 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!315907 (= index!1781 resIndex!52)))

(declare-fun lt!154402 () Unit!9737)

(assert (=> b!315907 (= lt!154402 e!196563)))

(declare-fun c!50013 () Bool)

(assert (=> b!315907 (= c!50013 (not (= resIndex!52 index!1781)))))

(declare-fun res!171110 () Bool)

(assert (=> start!31580 (=> (not res!171110) (not e!196566))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31580 (= res!171110 (validMask!0 mask!3709))))

(assert (=> start!31580 e!196566))

(declare-fun array_inv!5585 (array!16104) Bool)

(assert (=> start!31580 (array_inv!5585 a!3293)))

(assert (=> start!31580 true))

(declare-fun b!315908 () Bool)

(declare-fun res!171115 () Bool)

(assert (=> b!315908 (=> (not res!171115) (not e!196565))))

(assert (=> b!315908 (= res!171115 (and (= (select (arr!7622 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7974 a!3293))))))

(declare-fun b!315909 () Bool)

(declare-fun res!171117 () Bool)

(assert (=> b!315909 (=> (not res!171117) (not e!196566))))

(declare-fun arrayContainsKey!0 (array!16104 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315909 (= res!171117 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315910 () Bool)

(declare-fun res!171109 () Bool)

(assert (=> b!315910 (=> (not res!171109) (not e!196565))))

(assert (=> b!315910 (= res!171109 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154404))))

(declare-fun b!315911 () Bool)

(declare-fun res!171108 () Bool)

(assert (=> b!315911 (=> (not res!171108) (not e!196566))))

(assert (=> b!315911 (= res!171108 (and (= (size!7974 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7974 a!3293))))))

(assert (= (and start!31580 res!171110) b!315911))

(assert (= (and b!315911 res!171108) b!315906))

(assert (= (and b!315906 res!171114) b!315909))

(assert (= (and b!315909 res!171117) b!315903))

(assert (= (and b!315903 res!171116) b!315905))

(assert (= (and b!315905 res!171111) b!315904))

(assert (= (and b!315904 res!171112) b!315908))

(assert (= (and b!315908 res!171115) b!315910))

(assert (= (and b!315910 res!171109) b!315898))

(assert (= (and b!315898 res!171113) b!315907))

(assert (= (and b!315907 c!50013) b!315901))

(assert (= (and b!315907 (not c!50013)) b!315899))

(assert (= (and b!315901 c!50012) b!315900))

(assert (= (and b!315901 (not c!50012)) b!315902))

(declare-fun m!324989 () Bool)

(assert (=> b!315903 m!324989))

(declare-fun m!324991 () Bool)

(assert (=> b!315906 m!324991))

(declare-fun m!324993 () Bool)

(assert (=> b!315898 m!324993))

(assert (=> b!315907 m!324993))

(declare-fun m!324995 () Bool)

(assert (=> b!315909 m!324995))

(assert (=> b!315901 m!324993))

(declare-fun m!324997 () Bool)

(assert (=> b!315910 m!324997))

(declare-fun m!324999 () Bool)

(assert (=> b!315904 m!324999))

(assert (=> b!315904 m!324999))

(declare-fun m!325001 () Bool)

(assert (=> b!315904 m!325001))

(declare-fun m!325003 () Bool)

(assert (=> start!31580 m!325003))

(declare-fun m!325005 () Bool)

(assert (=> start!31580 m!325005))

(declare-fun m!325007 () Bool)

(assert (=> b!315908 m!325007))

(declare-fun m!325009 () Bool)

(assert (=> b!315905 m!325009))

(declare-fun m!325011 () Bool)

(assert (=> b!315902 m!325011))

(assert (=> b!315902 m!325011))

(declare-fun m!325013 () Bool)

(assert (=> b!315902 m!325013))

(push 1)

