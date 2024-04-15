; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31560 () Bool)

(assert start!31560)

(declare-fun b!315497 () Bool)

(declare-fun res!170893 () Bool)

(declare-fun e!196346 () Bool)

(assert (=> b!315497 (=> (not res!170893) (not e!196346))))

(declare-datatypes ((array!16088 0))(
  ( (array!16089 (arr!7614 (Array (_ BitVec 32) (_ BitVec 64))) (size!7967 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16088)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!16088 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315497 (= res!170893 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun res!170898 () Bool)

(assert (=> start!31560 (=> (not res!170898) (not e!196346))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31560 (= res!170898 (validMask!0 mask!3709))))

(assert (=> start!31560 e!196346))

(declare-fun array_inv!5586 (array!16088) Bool)

(assert (=> start!31560 (array_inv!5586 a!3293)))

(assert (=> start!31560 true))

(declare-fun b!315498 () Bool)

(declare-fun res!170894 () Bool)

(declare-fun e!196343 () Bool)

(assert (=> b!315498 (=> (not res!170894) (not e!196343))))

(declare-datatypes ((SeekEntryResult!2753 0))(
  ( (MissingZero!2753 (index!13188 (_ BitVec 32))) (Found!2753 (index!13189 (_ BitVec 32))) (Intermediate!2753 (undefined!3565 Bool) (index!13190 (_ BitVec 32)) (x!31450 (_ BitVec 32))) (Undefined!2753) (MissingVacant!2753 (index!13191 (_ BitVec 32))) )
))
(declare-fun lt!154141 () SeekEntryResult!2753)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16088 (_ BitVec 32)) SeekEntryResult!2753)

(assert (=> b!315498 (= res!170894 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154141))))

(declare-fun b!315499 () Bool)

(assert (=> b!315499 (= e!196346 e!196343)))

(declare-fun res!170896 () Bool)

(assert (=> b!315499 (=> (not res!170896) (not e!196343))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315499 (= res!170896 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154141))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!315499 (= lt!154141 (Intermediate!2753 false resIndex!52 resX!52))))

(declare-fun b!315500 () Bool)

(assert (=> b!315500 false))

(declare-fun lt!154140 () SeekEntryResult!2753)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315500 (= lt!154140 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-datatypes ((Unit!9686 0))(
  ( (Unit!9687) )
))
(declare-fun e!196344 () Unit!9686)

(declare-fun Unit!9688 () Unit!9686)

(assert (=> b!315500 (= e!196344 Unit!9688)))

(declare-fun b!315501 () Bool)

(declare-fun res!170889 () Bool)

(assert (=> b!315501 (=> (not res!170889) (not e!196346))))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16088 (_ BitVec 32)) SeekEntryResult!2753)

(assert (=> b!315501 (= res!170889 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2753 i!1240)))))

(declare-fun b!315502 () Bool)

(declare-fun res!170892 () Bool)

(assert (=> b!315502 (=> (not res!170892) (not e!196343))))

(assert (=> b!315502 (= res!170892 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7614 a!3293) index!1781) k0!2441)) (= x!1427 resX!52)))))

(declare-fun b!315503 () Bool)

(assert (=> b!315503 (= e!196343 (not true))))

(assert (=> b!315503 (= index!1781 resIndex!52)))

(declare-fun lt!154142 () Unit!9686)

(declare-fun e!196342 () Unit!9686)

(assert (=> b!315503 (= lt!154142 e!196342)))

(declare-fun c!49921 () Bool)

(assert (=> b!315503 (= c!49921 (not (= resIndex!52 index!1781)))))

(declare-fun b!315504 () Bool)

(assert (=> b!315504 false))

(declare-fun Unit!9689 () Unit!9686)

(assert (=> b!315504 (= e!196344 Unit!9689)))

(declare-fun b!315505 () Bool)

(declare-fun res!170891 () Bool)

(assert (=> b!315505 (=> (not res!170891) (not e!196346))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315505 (= res!170891 (validKeyInArray!0 k0!2441))))

(declare-fun b!315506 () Bool)

(declare-fun res!170895 () Bool)

(assert (=> b!315506 (=> (not res!170895) (not e!196343))))

(assert (=> b!315506 (= res!170895 (and (= (select (arr!7614 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7967 a!3293))))))

(declare-fun b!315507 () Bool)

(declare-fun res!170890 () Bool)

(assert (=> b!315507 (=> (not res!170890) (not e!196346))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16088 (_ BitVec 32)) Bool)

(assert (=> b!315507 (= res!170890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315508 () Bool)

(assert (=> b!315508 (= e!196342 e!196344)))

(declare-fun c!49922 () Bool)

(assert (=> b!315508 (= c!49922 (or (= (select (arr!7614 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7614 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315509 () Bool)

(declare-fun res!170897 () Bool)

(assert (=> b!315509 (=> (not res!170897) (not e!196346))))

(assert (=> b!315509 (= res!170897 (and (= (size!7967 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7967 a!3293))))))

(declare-fun b!315510 () Bool)

(declare-fun Unit!9690 () Unit!9686)

(assert (=> b!315510 (= e!196342 Unit!9690)))

(assert (= (and start!31560 res!170898) b!315509))

(assert (= (and b!315509 res!170897) b!315505))

(assert (= (and b!315505 res!170891) b!315497))

(assert (= (and b!315497 res!170893) b!315501))

(assert (= (and b!315501 res!170889) b!315507))

(assert (= (and b!315507 res!170890) b!315499))

(assert (= (and b!315499 res!170896) b!315506))

(assert (= (and b!315506 res!170895) b!315498))

(assert (= (and b!315498 res!170894) b!315502))

(assert (= (and b!315502 res!170892) b!315503))

(assert (= (and b!315503 c!49921) b!315508))

(assert (= (and b!315503 (not c!49921)) b!315510))

(assert (= (and b!315508 c!49922) b!315504))

(assert (= (and b!315508 (not c!49922)) b!315500))

(declare-fun m!324181 () Bool)

(assert (=> start!31560 m!324181))

(declare-fun m!324183 () Bool)

(assert (=> start!31560 m!324183))

(declare-fun m!324185 () Bool)

(assert (=> b!315507 m!324185))

(declare-fun m!324187 () Bool)

(assert (=> b!315508 m!324187))

(declare-fun m!324189 () Bool)

(assert (=> b!315506 m!324189))

(declare-fun m!324191 () Bool)

(assert (=> b!315498 m!324191))

(declare-fun m!324193 () Bool)

(assert (=> b!315497 m!324193))

(declare-fun m!324195 () Bool)

(assert (=> b!315501 m!324195))

(assert (=> b!315502 m!324187))

(declare-fun m!324197 () Bool)

(assert (=> b!315499 m!324197))

(assert (=> b!315499 m!324197))

(declare-fun m!324199 () Bool)

(assert (=> b!315499 m!324199))

(declare-fun m!324201 () Bool)

(assert (=> b!315500 m!324201))

(assert (=> b!315500 m!324201))

(declare-fun m!324203 () Bool)

(assert (=> b!315500 m!324203))

(declare-fun m!324205 () Bool)

(assert (=> b!315505 m!324205))

(check-sat (not b!315507) (not b!315500) (not b!315505) (not b!315499) (not b!315501) (not start!31560) (not b!315497) (not b!315498))
(check-sat)
