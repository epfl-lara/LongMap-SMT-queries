; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31914 () Bool)

(assert start!31914)

(declare-fun b!318996 () Bool)

(declare-fun e!198164 () Bool)

(declare-fun e!198166 () Bool)

(assert (=> b!318996 (= e!198164 e!198166)))

(declare-fun res!173435 () Bool)

(assert (=> b!318996 (=> (not res!173435) (not e!198166))))

(declare-datatypes ((array!16247 0))(
  ( (array!16248 (arr!7687 (Array (_ BitVec 32) (_ BitVec 64))) (size!8039 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16247)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2792 0))(
  ( (MissingZero!2792 (index!13344 (_ BitVec 32))) (Found!2792 (index!13345 (_ BitVec 32))) (Intermediate!2792 (undefined!3604 Bool) (index!13346 (_ BitVec 32)) (x!31711 (_ BitVec 32))) (Undefined!2792) (MissingVacant!2792 (index!13347 (_ BitVec 32))) )
))
(declare-fun lt!155630 () SeekEntryResult!2792)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16247 (_ BitVec 32)) SeekEntryResult!2792)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318996 (= res!173435 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!155630))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!318996 (= lt!155630 (Intermediate!2792 false resIndex!52 resX!52))))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun b!318997 () Bool)

(declare-fun lt!155631 () SeekEntryResult!2792)

(declare-fun lt!155628 () (_ BitVec 32))

(declare-fun e!198168 () Bool)

(assert (=> b!318997 (= e!198168 (not (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!155628 #b00000000000000000000000000000000) (bvsge lt!155628 (size!8039 a!3293)) (not (= lt!155631 lt!155630)) (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!1427)) (bvsub #b01111111111111111111111111111110 x!1427)))))))

(declare-fun e!198167 () Bool)

(assert (=> b!318997 e!198167))

(declare-fun res!173430 () Bool)

(assert (=> b!318997 (=> (not res!173430) (not e!198167))))

(declare-fun lt!155627 () SeekEntryResult!2792)

(assert (=> b!318997 (= res!173430 (= lt!155627 lt!155631))))

(assert (=> b!318997 (= lt!155631 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155628 k0!2441 a!3293 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!318997 (= lt!155628 (nextIndex!0 index!1781 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709))))

(declare-fun res!173437 () Bool)

(assert (=> start!31914 (=> (not res!173437) (not e!198164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31914 (= res!173437 (validMask!0 mask!3709))))

(assert (=> start!31914 e!198164))

(declare-fun array_inv!5637 (array!16247) Bool)

(assert (=> start!31914 (array_inv!5637 a!3293)))

(assert (=> start!31914 true))

(declare-fun b!318998 () Bool)

(declare-fun res!173439 () Bool)

(assert (=> b!318998 (=> (not res!173439) (not e!198164))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!318998 (= res!173439 (and (= (size!8039 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!8039 a!3293))))))

(declare-fun b!318999 () Bool)

(assert (=> b!318999 (= e!198166 e!198168)))

(declare-fun res!173436 () Bool)

(assert (=> b!318999 (=> (not res!173436) (not e!198168))))

(assert (=> b!318999 (= res!173436 (and (= lt!155627 lt!155630) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7687 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!318999 (= lt!155627 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!319000 () Bool)

(declare-fun res!173431 () Bool)

(assert (=> b!319000 (=> (not res!173431) (not e!198164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16247 (_ BitVec 32)) Bool)

(assert (=> b!319000 (= res!173431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!319001 () Bool)

(declare-fun res!173432 () Bool)

(assert (=> b!319001 (=> (not res!173432) (not e!198166))))

(assert (=> b!319001 (= res!173432 (and (= (select (arr!7687 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!8039 a!3293))))))

(declare-fun b!319002 () Bool)

(declare-fun res!173433 () Bool)

(assert (=> b!319002 (=> (not res!173433) (not e!198164))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!319002 (= res!173433 (validKeyInArray!0 k0!2441))))

(declare-fun b!319003 () Bool)

(declare-fun res!173434 () Bool)

(assert (=> b!319003 (=> (not res!173434) (not e!198164))))

(declare-fun arrayContainsKey!0 (array!16247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!319003 (= res!173434 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!319004 () Bool)

(declare-fun res!173438 () Bool)

(assert (=> b!319004 (=> (not res!173438) (not e!198164))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16247 (_ BitVec 32)) SeekEntryResult!2792)

(assert (=> b!319004 (= res!173438 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2792 i!1240)))))

(declare-fun b!319005 () Bool)

(declare-fun lt!155629 () array!16247)

(assert (=> b!319005 (= e!198167 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!155629 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!155628 k0!2441 lt!155629 mask!3709)))))

(assert (=> b!319005 (= lt!155629 (array!16248 (store (arr!7687 a!3293) i!1240 k0!2441) (size!8039 a!3293)))))

(assert (= (and start!31914 res!173437) b!318998))

(assert (= (and b!318998 res!173439) b!319002))

(assert (= (and b!319002 res!173433) b!319003))

(assert (= (and b!319003 res!173434) b!319004))

(assert (= (and b!319004 res!173438) b!319000))

(assert (= (and b!319000 res!173431) b!318996))

(assert (= (and b!318996 res!173435) b!319001))

(assert (= (and b!319001 res!173432) b!318999))

(assert (= (and b!318999 res!173436) b!318997))

(assert (= (and b!318997 res!173430) b!319005))

(declare-fun m!327823 () Bool)

(assert (=> b!319001 m!327823))

(declare-fun m!327825 () Bool)

(assert (=> start!31914 m!327825))

(declare-fun m!327827 () Bool)

(assert (=> start!31914 m!327827))

(declare-fun m!327829 () Bool)

(assert (=> b!319004 m!327829))

(declare-fun m!327831 () Bool)

(assert (=> b!319003 m!327831))

(declare-fun m!327833 () Bool)

(assert (=> b!319005 m!327833))

(declare-fun m!327835 () Bool)

(assert (=> b!319005 m!327835))

(declare-fun m!327837 () Bool)

(assert (=> b!319005 m!327837))

(declare-fun m!327839 () Bool)

(assert (=> b!319002 m!327839))

(declare-fun m!327841 () Bool)

(assert (=> b!319000 m!327841))

(declare-fun m!327843 () Bool)

(assert (=> b!318999 m!327843))

(declare-fun m!327845 () Bool)

(assert (=> b!318999 m!327845))

(declare-fun m!327847 () Bool)

(assert (=> b!318997 m!327847))

(declare-fun m!327849 () Bool)

(assert (=> b!318997 m!327849))

(declare-fun m!327851 () Bool)

(assert (=> b!318996 m!327851))

(assert (=> b!318996 m!327851))

(declare-fun m!327853 () Bool)

(assert (=> b!318996 m!327853))

(check-sat (not start!31914) (not b!319003) (not b!319004) (not b!319000) (not b!319002) (not b!318996) (not b!318997) (not b!318999) (not b!319005))
(check-sat)
