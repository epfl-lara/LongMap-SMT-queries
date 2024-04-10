; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31572 () Bool)

(assert start!31572)

(declare-fun b!315730 () Bool)

(declare-fun e!196506 () Bool)

(declare-fun e!196507 () Bool)

(assert (=> b!315730 (= e!196506 e!196507)))

(declare-fun res!170997 () Bool)

(assert (=> b!315730 (=> (not res!170997) (not e!196507))))

(declare-datatypes ((array!16096 0))(
  ( (array!16097 (arr!7618 (Array (_ BitVec 32) (_ BitVec 64))) (size!7970 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16096)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2758 0))(
  ( (MissingZero!2758 (index!13208 (_ BitVec 32))) (Found!2758 (index!13209 (_ BitVec 32))) (Intermediate!2758 (undefined!3570 Bool) (index!13210 (_ BitVec 32)) (x!31452 (_ BitVec 32))) (Undefined!2758) (MissingVacant!2758 (index!13211 (_ BitVec 32))) )
))
(declare-fun lt!154366 () SeekEntryResult!2758)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16096 (_ BitVec 32)) SeekEntryResult!2758)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315730 (= res!170997 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154366))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315730 (= lt!154366 (Intermediate!2758 false resIndex!52 resX!52))))

(declare-fun b!315731 () Bool)

(declare-fun res!170991 () Bool)

(assert (=> b!315731 (=> (not res!170991) (not e!196507))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315731 (= res!170991 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7618 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!315732 () Bool)

(assert (=> b!315732 false))

(declare-datatypes ((Unit!9717 0))(
  ( (Unit!9718) )
))
(declare-fun e!196505 () Unit!9717)

(declare-fun Unit!9719 () Unit!9717)

(assert (=> b!315732 (= e!196505 Unit!9719)))

(declare-fun b!315733 () Bool)

(assert (=> b!315733 false))

(declare-fun lt!154368 () SeekEntryResult!2758)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315733 (= lt!154368 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9720 () Unit!9717)

(assert (=> b!315733 (= e!196505 Unit!9720)))

(declare-fun b!315734 () Bool)

(declare-fun e!196504 () Unit!9717)

(declare-fun Unit!9721 () Unit!9717)

(assert (=> b!315734 (= e!196504 Unit!9721)))

(declare-fun res!170990 () Bool)

(assert (=> start!31572 (=> (not res!170990) (not e!196506))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31572 (= res!170990 (validMask!0 mask!3709))))

(assert (=> start!31572 e!196506))

(declare-fun array_inv!5581 (array!16096) Bool)

(assert (=> start!31572 (array_inv!5581 a!3293)))

(assert (=> start!31572 true))

(declare-fun b!315735 () Bool)

(declare-fun res!170992 () Bool)

(assert (=> b!315735 (=> (not res!170992) (not e!196507))))

(assert (=> b!315735 (= res!170992 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154366))))

(declare-fun b!315736 () Bool)

(assert (=> b!315736 (= e!196507 (not (= index!1781 resIndex!52)))))

(declare-fun lt!154367 () Unit!9717)

(assert (=> b!315736 (= lt!154367 e!196504)))

(declare-fun c!49988 () Bool)

(assert (=> b!315736 (= c!49988 (not (= resIndex!52 index!1781)))))

(declare-fun b!315737 () Bool)

(declare-fun res!170995 () Bool)

(assert (=> b!315737 (=> (not res!170995) (not e!196506))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16096 (_ BitVec 32)) SeekEntryResult!2758)

(assert (=> b!315737 (= res!170995 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2758 i!1240)))))

(declare-fun b!315738 () Bool)

(declare-fun res!170994 () Bool)

(assert (=> b!315738 (=> (not res!170994) (not e!196506))))

(declare-fun arrayContainsKey!0 (array!16096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315738 (= res!170994 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun b!315739 () Bool)

(declare-fun res!170989 () Bool)

(assert (=> b!315739 (=> (not res!170989) (not e!196506))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315739 (= res!170989 (validKeyInArray!0 k!2441))))

(declare-fun b!315740 () Bool)

(declare-fun res!170988 () Bool)

(assert (=> b!315740 (=> (not res!170988) (not e!196506))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16096 (_ BitVec 32)) Bool)

(assert (=> b!315740 (= res!170988 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315741 () Bool)

(declare-fun res!170996 () Bool)

(assert (=> b!315741 (=> (not res!170996) (not e!196507))))

(assert (=> b!315741 (= res!170996 (and (= (select (arr!7618 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7970 a!3293))))))

(declare-fun b!315742 () Bool)

(declare-fun res!170993 () Bool)

(assert (=> b!315742 (=> (not res!170993) (not e!196506))))

(assert (=> b!315742 (= res!170993 (and (= (size!7970 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7970 a!3293))))))

(declare-fun b!315743 () Bool)

(assert (=> b!315743 (= e!196504 e!196505)))

(declare-fun c!49989 () Bool)

(assert (=> b!315743 (= c!49989 (or (= (select (arr!7618 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7618 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!31572 res!170990) b!315742))

(assert (= (and b!315742 res!170993) b!315739))

(assert (= (and b!315739 res!170989) b!315738))

(assert (= (and b!315738 res!170994) b!315737))

(assert (= (and b!315737 res!170995) b!315740))

(assert (= (and b!315740 res!170988) b!315730))

(assert (= (and b!315730 res!170997) b!315741))

(assert (= (and b!315741 res!170996) b!315735))

(assert (= (and b!315735 res!170992) b!315731))

(assert (= (and b!315731 res!170991) b!315736))

(assert (= (and b!315736 c!49988) b!315743))

(assert (= (and b!315736 (not c!49988)) b!315734))

(assert (= (and b!315743 c!49989) b!315732))

(assert (= (and b!315743 (not c!49989)) b!315733))

(declare-fun m!324885 () Bool)

(assert (=> b!315737 m!324885))

(declare-fun m!324887 () Bool)

(assert (=> b!315730 m!324887))

(assert (=> b!315730 m!324887))

(declare-fun m!324889 () Bool)

(assert (=> b!315730 m!324889))

(declare-fun m!324891 () Bool)

(assert (=> b!315738 m!324891))

(declare-fun m!324893 () Bool)

(assert (=> b!315739 m!324893))

(declare-fun m!324895 () Bool)

(assert (=> b!315741 m!324895))

(declare-fun m!324897 () Bool)

(assert (=> b!315735 m!324897))

(declare-fun m!324899 () Bool)

(assert (=> b!315731 m!324899))

(declare-fun m!324901 () Bool)

(assert (=> start!31572 m!324901))

(declare-fun m!324903 () Bool)

(assert (=> start!31572 m!324903))

(declare-fun m!324905 () Bool)

(assert (=> b!315733 m!324905))

(assert (=> b!315733 m!324905))

(declare-fun m!324907 () Bool)

(assert (=> b!315733 m!324907))

(assert (=> b!315743 m!324899))

(declare-fun m!324909 () Bool)

(assert (=> b!315740 m!324909))

(push 1)

(assert (not b!315740))

