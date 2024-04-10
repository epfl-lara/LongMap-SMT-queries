; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31024 () Bool)

(assert start!31024)

(declare-fun b!311897 () Bool)

(declare-fun e!194548 () Bool)

(declare-fun e!194551 () Bool)

(assert (=> b!311897 (= e!194548 (not e!194551))))

(declare-fun res!168356 () Bool)

(assert (=> b!311897 (=> res!168356 e!194551)))

(declare-datatypes ((array!15926 0))(
  ( (array!15927 (arr!7545 (Array (_ BitVec 32) (_ BitVec 64))) (size!7897 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15926)

(declare-fun lt!152596 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2685 0))(
  ( (MissingZero!2685 (index!12916 (_ BitVec 32))) (Found!2685 (index!12917 (_ BitVec 32))) (Intermediate!2685 (undefined!3497 Bool) (index!12918 (_ BitVec 32)) (x!31130 (_ BitVec 32))) (Undefined!2685) (MissingVacant!2685 (index!12919 (_ BitVec 32))) )
))
(declare-fun lt!152597 () SeekEntryResult!2685)

(declare-fun lt!152601 () SeekEntryResult!2685)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!311897 (= res!168356 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152596 #b00000000000000000000000000000000) (bvsge lt!152596 (size!7897 a!3293)) (not (= lt!152601 lt!152597))))))

(declare-fun lt!152598 () SeekEntryResult!2685)

(declare-fun lt!152600 () SeekEntryResult!2685)

(assert (=> b!311897 (= lt!152598 lt!152600)))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun lt!152599 () array!15926)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15926 (_ BitVec 32)) SeekEntryResult!2685)

(assert (=> b!311897 (= lt!152600 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152596 k0!2441 lt!152599 mask!3709))))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!311897 (= lt!152598 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152599 mask!3709))))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!311897 (= lt!152599 (array!15927 (store (arr!7545 a!3293) i!1240 k0!2441) (size!7897 a!3293)))))

(declare-fun lt!152594 () SeekEntryResult!2685)

(assert (=> b!311897 (= lt!152594 lt!152601)))

(assert (=> b!311897 (= lt!152601 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152596 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311897 (= lt!152596 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!311898 () Bool)

(declare-fun res!168358 () Bool)

(declare-fun e!194550 () Bool)

(assert (=> b!311898 (=> (not res!168358) (not e!194550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15926 (_ BitVec 32)) Bool)

(assert (=> b!311898 (= res!168358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!311899 () Bool)

(assert (=> b!311899 (= e!194551 (bvsge mask!3709 #b00000000000000000000000000000000))))

(assert (=> b!311899 (= lt!152600 lt!152601)))

(declare-datatypes ((Unit!9601 0))(
  ( (Unit!9602) )
))
(declare-fun lt!152595 () Unit!9601)

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15926 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9601)

(assert (=> b!311899 (= lt!152595 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152596 resIndex!52 resX!52 mask!3709))))

(declare-fun b!311900 () Bool)

(declare-fun res!168357 () Bool)

(declare-fun e!194547 () Bool)

(assert (=> b!311900 (=> (not res!168357) (not e!194547))))

(assert (=> b!311900 (= res!168357 (and (= (select (arr!7545 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7897 a!3293))))))

(declare-fun res!168354 () Bool)

(assert (=> start!31024 (=> (not res!168354) (not e!194550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31024 (= res!168354 (validMask!0 mask!3709))))

(assert (=> start!31024 e!194550))

(declare-fun array_inv!5508 (array!15926) Bool)

(assert (=> start!31024 (array_inv!5508 a!3293)))

(assert (=> start!31024 true))

(declare-fun b!311901 () Bool)

(assert (=> b!311901 (= e!194547 e!194548)))

(declare-fun res!168353 () Bool)

(assert (=> b!311901 (=> (not res!168353) (not e!194548))))

(assert (=> b!311901 (= res!168353 (and (= lt!152594 lt!152597) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7545 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!311901 (= lt!152594 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!311902 () Bool)

(declare-fun res!168360 () Bool)

(assert (=> b!311902 (=> (not res!168360) (not e!194550))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15926 (_ BitVec 32)) SeekEntryResult!2685)

(assert (=> b!311902 (= res!168360 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2685 i!1240)))))

(declare-fun b!311903 () Bool)

(declare-fun res!168359 () Bool)

(assert (=> b!311903 (=> (not res!168359) (not e!194550))))

(assert (=> b!311903 (= res!168359 (and (= (size!7897 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7897 a!3293))))))

(declare-fun b!311904 () Bool)

(assert (=> b!311904 (= e!194550 e!194547)))

(declare-fun res!168352 () Bool)

(assert (=> b!311904 (=> (not res!168352) (not e!194547))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!311904 (= res!168352 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152597))))

(assert (=> b!311904 (= lt!152597 (Intermediate!2685 false resIndex!52 resX!52))))

(declare-fun b!311905 () Bool)

(declare-fun res!168351 () Bool)

(assert (=> b!311905 (=> (not res!168351) (not e!194550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!311905 (= res!168351 (validKeyInArray!0 k0!2441))))

(declare-fun b!311906 () Bool)

(declare-fun res!168355 () Bool)

(assert (=> b!311906 (=> (not res!168355) (not e!194550))))

(declare-fun arrayContainsKey!0 (array!15926 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!311906 (= res!168355 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31024 res!168354) b!311903))

(assert (= (and b!311903 res!168359) b!311905))

(assert (= (and b!311905 res!168351) b!311906))

(assert (= (and b!311906 res!168355) b!311902))

(assert (= (and b!311902 res!168360) b!311898))

(assert (= (and b!311898 res!168358) b!311904))

(assert (= (and b!311904 res!168352) b!311900))

(assert (= (and b!311900 res!168357) b!311901))

(assert (= (and b!311901 res!168353) b!311897))

(assert (= (and b!311897 (not res!168356)) b!311899))

(declare-fun m!321909 () Bool)

(assert (=> b!311905 m!321909))

(declare-fun m!321911 () Bool)

(assert (=> b!311900 m!321911))

(declare-fun m!321913 () Bool)

(assert (=> b!311904 m!321913))

(assert (=> b!311904 m!321913))

(declare-fun m!321915 () Bool)

(assert (=> b!311904 m!321915))

(declare-fun m!321917 () Bool)

(assert (=> b!311898 m!321917))

(declare-fun m!321919 () Bool)

(assert (=> b!311897 m!321919))

(declare-fun m!321921 () Bool)

(assert (=> b!311897 m!321921))

(declare-fun m!321923 () Bool)

(assert (=> b!311897 m!321923))

(declare-fun m!321925 () Bool)

(assert (=> b!311897 m!321925))

(declare-fun m!321927 () Bool)

(assert (=> b!311897 m!321927))

(declare-fun m!321929 () Bool)

(assert (=> b!311901 m!321929))

(declare-fun m!321931 () Bool)

(assert (=> b!311901 m!321931))

(declare-fun m!321933 () Bool)

(assert (=> b!311906 m!321933))

(declare-fun m!321935 () Bool)

(assert (=> start!31024 m!321935))

(declare-fun m!321937 () Bool)

(assert (=> start!31024 m!321937))

(declare-fun m!321939 () Bool)

(assert (=> b!311899 m!321939))

(declare-fun m!321941 () Bool)

(assert (=> b!311902 m!321941))

(check-sat (not b!311902) (not b!311897) (not b!311906) (not b!311899) (not b!311904) (not b!311898) (not start!31024) (not b!311905) (not b!311901))
(check-sat)
