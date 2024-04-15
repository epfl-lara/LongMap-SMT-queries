; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31698 () Bool)

(assert start!31698)

(declare-fun b!316585 () Bool)

(declare-fun res!171511 () Bool)

(declare-fun e!196883 () Bool)

(assert (=> b!316585 (=> (not res!171511) (not e!196883))))

(declare-datatypes ((array!16124 0))(
  ( (array!16125 (arr!7629 (Array (_ BitVec 32) (_ BitVec 64))) (size!7982 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16124)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!316585 (= res!171511 (and (= (size!7982 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7982 a!3293))))))

(declare-fun b!316586 () Bool)

(declare-fun res!171509 () Bool)

(declare-fun e!196884 () Bool)

(assert (=> b!316586 (=> (not res!171509) (not e!196884))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!316586 (= res!171509 (and (= (select (arr!7629 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7982 a!3293))))))

(declare-fun b!316587 () Bool)

(declare-fun res!171506 () Bool)

(assert (=> b!316587 (=> (not res!171506) (not e!196883))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16124 (_ BitVec 32)) Bool)

(assert (=> b!316587 (= res!171506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!316588 () Bool)

(declare-fun res!171507 () Bool)

(assert (=> b!316588 (=> (not res!171507) (not e!196883))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!316588 (= res!171507 (validKeyInArray!0 k0!2441))))

(declare-fun b!316590 () Bool)

(declare-fun res!171505 () Bool)

(assert (=> b!316590 (=> (not res!171505) (not e!196883))))

(declare-fun arrayContainsKey!0 (array!16124 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!316590 (= res!171505 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!316591 () Bool)

(declare-fun e!196886 () Bool)

(assert (=> b!316591 (= e!196884 e!196886)))

(declare-fun res!171512 () Bool)

(assert (=> b!316591 (=> (not res!171512) (not e!196886))))

(declare-datatypes ((SeekEntryResult!2768 0))(
  ( (MissingZero!2768 (index!13248 (_ BitVec 32))) (Found!2768 (index!13249 (_ BitVec 32))) (Intermediate!2768 (undefined!3580 Bool) (index!13250 (_ BitVec 32)) (x!31523 (_ BitVec 32))) (Undefined!2768) (MissingVacant!2768 (index!13251 (_ BitVec 32))) )
))
(declare-fun lt!154501 () SeekEntryResult!2768)

(declare-fun lt!154502 () SeekEntryResult!2768)

(assert (=> b!316591 (= res!171512 (and (= lt!154501 lt!154502) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7629 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16124 (_ BitVec 32)) SeekEntryResult!2768)

(assert (=> b!316591 (= lt!154501 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!316592 () Bool)

(declare-fun res!171510 () Bool)

(assert (=> b!316592 (=> (not res!171510) (not e!196883))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16124 (_ BitVec 32)) SeekEntryResult!2768)

(assert (=> b!316592 (= res!171510 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2768 i!1240)))))

(declare-fun b!316593 () Bool)

(assert (=> b!316593 (= e!196886 (not true))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316593 (= lt!154501 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun res!171513 () Bool)

(assert (=> start!31698 (=> (not res!171513) (not e!196883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31698 (= res!171513 (validMask!0 mask!3709))))

(assert (=> start!31698 e!196883))

(declare-fun array_inv!5601 (array!16124) Bool)

(assert (=> start!31698 (array_inv!5601 a!3293)))

(assert (=> start!31698 true))

(declare-fun b!316589 () Bool)

(assert (=> b!316589 (= e!196883 e!196884)))

(declare-fun res!171508 () Bool)

(assert (=> b!316589 (=> (not res!171508) (not e!196884))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!316589 (= res!171508 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154502))))

(assert (=> b!316589 (= lt!154502 (Intermediate!2768 false resIndex!52 resX!52))))

(assert (= (and start!31698 res!171513) b!316585))

(assert (= (and b!316585 res!171511) b!316588))

(assert (= (and b!316588 res!171507) b!316590))

(assert (= (and b!316590 res!171505) b!316592))

(assert (= (and b!316592 res!171510) b!316587))

(assert (= (and b!316587 res!171506) b!316589))

(assert (= (and b!316589 res!171508) b!316586))

(assert (= (and b!316586 res!171509) b!316591))

(assert (= (and b!316591 res!171512) b!316593))

(declare-fun m!324877 () Bool)

(assert (=> b!316593 m!324877))

(assert (=> b!316593 m!324877))

(declare-fun m!324879 () Bool)

(assert (=> b!316593 m!324879))

(declare-fun m!324881 () Bool)

(assert (=> b!316589 m!324881))

(assert (=> b!316589 m!324881))

(declare-fun m!324883 () Bool)

(assert (=> b!316589 m!324883))

(declare-fun m!324885 () Bool)

(assert (=> b!316590 m!324885))

(declare-fun m!324887 () Bool)

(assert (=> start!31698 m!324887))

(declare-fun m!324889 () Bool)

(assert (=> start!31698 m!324889))

(declare-fun m!324891 () Bool)

(assert (=> b!316591 m!324891))

(declare-fun m!324893 () Bool)

(assert (=> b!316591 m!324893))

(declare-fun m!324895 () Bool)

(assert (=> b!316592 m!324895))

(declare-fun m!324897 () Bool)

(assert (=> b!316587 m!324897))

(declare-fun m!324899 () Bool)

(assert (=> b!316586 m!324899))

(declare-fun m!324901 () Bool)

(assert (=> b!316588 m!324901))

(check-sat (not b!316593) (not b!316591) (not b!316590) (not b!316592) (not b!316587) (not start!31698) (not b!316588) (not b!316589))
(check-sat)
