; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31082 () Bool)

(assert start!31082)

(declare-fun b!312767 () Bool)

(declare-fun e!194982 () Bool)

(declare-fun e!194983 () Bool)

(assert (=> b!312767 (= e!194982 e!194983)))

(declare-fun res!169226 () Bool)

(assert (=> b!312767 (=> (not res!169226) (not e!194983))))

(declare-datatypes ((array!15984 0))(
  ( (array!15985 (arr!7574 (Array (_ BitVec 32) (_ BitVec 64))) (size!7926 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15984)

(declare-datatypes ((SeekEntryResult!2714 0))(
  ( (MissingZero!2714 (index!13032 (_ BitVec 32))) (Found!2714 (index!13033 (_ BitVec 32))) (Intermediate!2714 (undefined!3526 Bool) (index!13034 (_ BitVec 32)) (x!31239 (_ BitVec 32))) (Undefined!2714) (MissingVacant!2714 (index!13035 (_ BitVec 32))) )
))
(declare-fun lt!153294 () SeekEntryResult!2714)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun lt!153295 () SeekEntryResult!2714)

(declare-fun k!2441 () (_ BitVec 64))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!312767 (= res!169226 (and (= lt!153295 lt!153294) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7574 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15984 (_ BitVec 32)) SeekEntryResult!2714)

(assert (=> b!312767 (= lt!153295 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!312768 () Bool)

(declare-fun e!194986 () Bool)

(assert (=> b!312768 (= e!194983 (not e!194986))))

(declare-fun res!169228 () Bool)

(assert (=> b!312768 (=> res!169228 e!194986)))

(declare-fun lt!153297 () SeekEntryResult!2714)

(declare-fun lt!153291 () (_ BitVec 32))

(assert (=> b!312768 (= res!169228 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!153291 #b00000000000000000000000000000000) (bvsge lt!153291 (size!7926 a!3293)) (not (= lt!153297 lt!153294))))))

(declare-fun lt!153292 () SeekEntryResult!2714)

(declare-fun lt!153290 () SeekEntryResult!2714)

(assert (=> b!312768 (= lt!153292 lt!153290)))

(declare-fun lt!153293 () array!15984)

(assert (=> b!312768 (= lt!153290 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153291 k!2441 lt!153293 mask!3709))))

(assert (=> b!312768 (= lt!153292 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!153293 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!312768 (= lt!153293 (array!15985 (store (arr!7574 a!3293) i!1240 k!2441) (size!7926 a!3293)))))

(assert (=> b!312768 (= lt!153295 lt!153297)))

(assert (=> b!312768 (= lt!153297 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!153291 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312768 (= lt!153291 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312769 () Bool)

(declare-fun res!169222 () Bool)

(assert (=> b!312769 (=> (not res!169222) (not e!194982))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!312769 (= res!169222 (and (= (select (arr!7574 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7926 a!3293))))))

(declare-fun b!312770 () Bool)

(declare-fun res!169227 () Bool)

(declare-fun e!194984 () Bool)

(assert (=> b!312770 (=> (not res!169227) (not e!194984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312770 (= res!169227 (validKeyInArray!0 k!2441))))

(declare-fun b!312771 () Bool)

(declare-fun res!169221 () Bool)

(assert (=> b!312771 (=> (not res!169221) (not e!194984))))

(assert (=> b!312771 (= res!169221 (and (= (size!7926 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7926 a!3293))))))

(declare-fun b!312772 () Bool)

(declare-fun res!169224 () Bool)

(assert (=> b!312772 (=> (not res!169224) (not e!194984))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15984 (_ BitVec 32)) SeekEntryResult!2714)

(assert (=> b!312772 (= res!169224 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2714 i!1240)))))

(declare-fun b!312774 () Bool)

(declare-fun res!169230 () Bool)

(assert (=> b!312774 (=> (not res!169230) (not e!194984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15984 (_ BitVec 32)) Bool)

(assert (=> b!312774 (= res!169230 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!312775 () Bool)

(assert (=> b!312775 (= e!194984 e!194982)))

(declare-fun res!169229 () Bool)

(assert (=> b!312775 (=> (not res!169229) (not e!194982))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312775 (= res!169229 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!153294))))

(assert (=> b!312775 (= lt!153294 (Intermediate!2714 false resIndex!52 resX!52))))

(declare-fun b!312776 () Bool)

(assert (=> b!312776 (= e!194986 true)))

(assert (=> b!312776 (= lt!153290 lt!153297)))

(declare-datatypes ((Unit!9659 0))(
  ( (Unit!9660) )
))
(declare-fun lt!153296 () Unit!9659)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15984 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9659)

(assert (=> b!312776 (= lt!153296 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!153291 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312773 () Bool)

(declare-fun res!169223 () Bool)

(assert (=> b!312773 (=> (not res!169223) (not e!194984))))

(declare-fun arrayContainsKey!0 (array!15984 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312773 (= res!169223 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!169225 () Bool)

(assert (=> start!31082 (=> (not res!169225) (not e!194984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31082 (= res!169225 (validMask!0 mask!3709))))

(assert (=> start!31082 e!194984))

(declare-fun array_inv!5537 (array!15984) Bool)

(assert (=> start!31082 (array_inv!5537 a!3293)))

(assert (=> start!31082 true))

(assert (= (and start!31082 res!169225) b!312771))

(assert (= (and b!312771 res!169221) b!312770))

(assert (= (and b!312770 res!169227) b!312773))

(assert (= (and b!312773 res!169223) b!312772))

(assert (= (and b!312772 res!169224) b!312774))

(assert (= (and b!312774 res!169230) b!312775))

(assert (= (and b!312775 res!169229) b!312769))

(assert (= (and b!312769 res!169222) b!312767))

(assert (= (and b!312767 res!169226) b!312768))

(assert (= (and b!312768 (not res!169228)) b!312776))

(declare-fun m!322895 () Bool)

(assert (=> b!312775 m!322895))

(assert (=> b!312775 m!322895))

(declare-fun m!322897 () Bool)

(assert (=> b!312775 m!322897))

(declare-fun m!322899 () Bool)

(assert (=> b!312774 m!322899))

(declare-fun m!322901 () Bool)

(assert (=> start!31082 m!322901))

(declare-fun m!322903 () Bool)

(assert (=> start!31082 m!322903))

(declare-fun m!322905 () Bool)

(assert (=> b!312776 m!322905))

(declare-fun m!322907 () Bool)

(assert (=> b!312772 m!322907))

(declare-fun m!322909 () Bool)

(assert (=> b!312767 m!322909))

(declare-fun m!322911 () Bool)

(assert (=> b!312767 m!322911))

(declare-fun m!322913 () Bool)

(assert (=> b!312770 m!322913))

(declare-fun m!322915 () Bool)

(assert (=> b!312768 m!322915))

(declare-fun m!322917 () Bool)

(assert (=> b!312768 m!322917))

(declare-fun m!322919 () Bool)

(assert (=> b!312768 m!322919))

(declare-fun m!322921 () Bool)

(assert (=> b!312768 m!322921))

(declare-fun m!322923 () Bool)

(assert (=> b!312768 m!322923))

(declare-fun m!322925 () Bool)

(assert (=> b!312773 m!322925))

(declare-fun m!322927 () Bool)

(assert (=> b!312769 m!322927))

(push 1)

