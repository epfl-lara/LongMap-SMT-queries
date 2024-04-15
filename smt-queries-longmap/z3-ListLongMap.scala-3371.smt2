; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46266 () Bool)

(assert start!46266)

(declare-fun b!512380 () Bool)

(declare-fun res!313193 () Bool)

(declare-fun e!299184 () Bool)

(assert (=> b!512380 (=> (not res!313193) (not e!299184))))

(declare-datatypes ((array!32930 0))(
  ( (array!32931 (arr!15842 (Array (_ BitVec 32) (_ BitVec 64))) (size!16207 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32930)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32930 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!512380 (= res!313193 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!512381 () Bool)

(declare-fun res!313192 () Bool)

(assert (=> b!512381 (=> (not res!313192) (not e!299184))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!512381 (= res!313192 (and (= (size!16207 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16207 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16207 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!512382 () Bool)

(declare-fun res!313184 () Bool)

(declare-fun e!299180 () Bool)

(assert (=> b!512382 (=> (not res!313184) (not e!299180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32930 (_ BitVec 32)) Bool)

(assert (=> b!512382 (= res!313184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!299183 () Bool)

(declare-fun b!512383 () Bool)

(declare-datatypes ((SeekEntryResult!4306 0))(
  ( (MissingZero!4306 (index!19412 (_ BitVec 32))) (Found!4306 (index!19413 (_ BitVec 32))) (Intermediate!4306 (undefined!5118 Bool) (index!19414 (_ BitVec 32)) (x!48364 (_ BitVec 32))) (Undefined!4306) (MissingVacant!4306 (index!19415 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32930 (_ BitVec 32)) SeekEntryResult!4306)

(assert (=> b!512383 (= e!299183 (= (seekEntryOrOpen!0 (select (arr!15842 a!3235) j!176) a!3235 mask!3524) (Found!4306 j!176)))))

(declare-fun b!512384 () Bool)

(declare-fun e!299182 () Bool)

(declare-fun lt!234478 () SeekEntryResult!4306)

(get-info :version)

(assert (=> b!512384 (= e!299182 (or (not ((_ is Intermediate!4306) lt!234478)) (undefined!5118 lt!234478) (bvslt (x!48364 lt!234478) #b01111111111111111111111111111110)))))

(declare-fun b!512385 () Bool)

(declare-fun res!313186 () Bool)

(assert (=> b!512385 (=> (not res!313186) (not e!299184))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!512385 (= res!313186 (validKeyInArray!0 k0!2280))))

(declare-fun b!512386 () Bool)

(declare-fun res!313190 () Bool)

(assert (=> b!512386 (=> (not res!313190) (not e!299180))))

(declare-datatypes ((List!10039 0))(
  ( (Nil!10036) (Cons!10035 (h!10915 (_ BitVec 64)) (t!16258 List!10039)) )
))
(declare-fun arrayNoDuplicates!0 (array!32930 (_ BitVec 32) List!10039) Bool)

(assert (=> b!512386 (= res!313190 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10036))))

(declare-fun b!512387 () Bool)

(assert (=> b!512387 (= e!299180 (not e!299182))))

(declare-fun res!313187 () Bool)

(assert (=> b!512387 (=> res!313187 e!299182)))

(declare-fun lt!234480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32930 (_ BitVec 32)) SeekEntryResult!4306)

(assert (=> b!512387 (= res!313187 (= lt!234478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234480 (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176) (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235)) mask!3524)))))

(declare-fun lt!234481 () (_ BitVec 32))

(assert (=> b!512387 (= lt!234478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234481 (select (arr!15842 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512387 (= lt!234480 (toIndex!0 (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!512387 (= lt!234481 (toIndex!0 (select (arr!15842 a!3235) j!176) mask!3524))))

(assert (=> b!512387 e!299183))

(declare-fun res!313191 () Bool)

(assert (=> b!512387 (=> (not res!313191) (not e!299183))))

(assert (=> b!512387 (= res!313191 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15856 0))(
  ( (Unit!15857) )
))
(declare-fun lt!234479 () Unit!15856)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15856)

(assert (=> b!512387 (= lt!234479 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!512388 () Bool)

(assert (=> b!512388 (= e!299184 e!299180)))

(declare-fun res!313189 () Bool)

(assert (=> b!512388 (=> (not res!313189) (not e!299180))))

(declare-fun lt!234477 () SeekEntryResult!4306)

(assert (=> b!512388 (= res!313189 (or (= lt!234477 (MissingZero!4306 i!1204)) (= lt!234477 (MissingVacant!4306 i!1204))))))

(assert (=> b!512388 (= lt!234477 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!512389 () Bool)

(declare-fun res!313185 () Bool)

(assert (=> b!512389 (=> (not res!313185) (not e!299184))))

(assert (=> b!512389 (= res!313185 (validKeyInArray!0 (select (arr!15842 a!3235) j!176)))))

(declare-fun res!313188 () Bool)

(assert (=> start!46266 (=> (not res!313188) (not e!299184))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46266 (= res!313188 (validMask!0 mask!3524))))

(assert (=> start!46266 e!299184))

(assert (=> start!46266 true))

(declare-fun array_inv!11725 (array!32930) Bool)

(assert (=> start!46266 (array_inv!11725 a!3235)))

(assert (= (and start!46266 res!313188) b!512381))

(assert (= (and b!512381 res!313192) b!512389))

(assert (= (and b!512389 res!313185) b!512385))

(assert (= (and b!512385 res!313186) b!512380))

(assert (= (and b!512380 res!313193) b!512388))

(assert (= (and b!512388 res!313189) b!512382))

(assert (= (and b!512382 res!313184) b!512386))

(assert (= (and b!512386 res!313190) b!512387))

(assert (= (and b!512387 res!313191) b!512383))

(assert (= (and b!512387 (not res!313187)) b!512384))

(declare-fun m!493609 () Bool)

(assert (=> b!512389 m!493609))

(assert (=> b!512389 m!493609))

(declare-fun m!493611 () Bool)

(assert (=> b!512389 m!493611))

(declare-fun m!493613 () Bool)

(assert (=> b!512386 m!493613))

(declare-fun m!493615 () Bool)

(assert (=> b!512380 m!493615))

(declare-fun m!493617 () Bool)

(assert (=> b!512382 m!493617))

(declare-fun m!493619 () Bool)

(assert (=> b!512385 m!493619))

(declare-fun m!493621 () Bool)

(assert (=> start!46266 m!493621))

(declare-fun m!493623 () Bool)

(assert (=> start!46266 m!493623))

(declare-fun m!493625 () Bool)

(assert (=> b!512387 m!493625))

(declare-fun m!493627 () Bool)

(assert (=> b!512387 m!493627))

(declare-fun m!493629 () Bool)

(assert (=> b!512387 m!493629))

(assert (=> b!512387 m!493629))

(declare-fun m!493631 () Bool)

(assert (=> b!512387 m!493631))

(assert (=> b!512387 m!493609))

(declare-fun m!493633 () Bool)

(assert (=> b!512387 m!493633))

(assert (=> b!512387 m!493609))

(declare-fun m!493635 () Bool)

(assert (=> b!512387 m!493635))

(assert (=> b!512387 m!493609))

(declare-fun m!493637 () Bool)

(assert (=> b!512387 m!493637))

(assert (=> b!512387 m!493629))

(declare-fun m!493639 () Bool)

(assert (=> b!512387 m!493639))

(declare-fun m!493641 () Bool)

(assert (=> b!512388 m!493641))

(assert (=> b!512383 m!493609))

(assert (=> b!512383 m!493609))

(declare-fun m!493643 () Bool)

(assert (=> b!512383 m!493643))

(check-sat (not start!46266) (not b!512382) (not b!512385) (not b!512387) (not b!512388) (not b!512389) (not b!512380) (not b!512386) (not b!512383))
(check-sat)
(get-model)

(declare-fun b!512462 () Bool)

(declare-fun c!59884 () Bool)

(declare-fun lt!234518 () (_ BitVec 64))

(assert (=> b!512462 (= c!59884 (= lt!234518 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299222 () SeekEntryResult!4306)

(declare-fun e!299221 () SeekEntryResult!4306)

(assert (=> b!512462 (= e!299222 e!299221)))

(declare-fun b!512463 () Bool)

(declare-fun lt!234519 () SeekEntryResult!4306)

(assert (=> b!512463 (= e!299221 (MissingZero!4306 (index!19414 lt!234519)))))

(declare-fun b!512464 () Bool)

(assert (=> b!512464 (= e!299222 (Found!4306 (index!19414 lt!234519)))))

(declare-fun b!512465 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32930 (_ BitVec 32)) SeekEntryResult!4306)

(assert (=> b!512465 (= e!299221 (seekKeyOrZeroReturnVacant!0 (x!48364 lt!234519) (index!19414 lt!234519) (index!19414 lt!234519) (select (arr!15842 a!3235) j!176) a!3235 mask!3524))))

(declare-fun d!78785 () Bool)

(declare-fun lt!234520 () SeekEntryResult!4306)

(assert (=> d!78785 (and (or ((_ is Undefined!4306) lt!234520) (not ((_ is Found!4306) lt!234520)) (and (bvsge (index!19413 lt!234520) #b00000000000000000000000000000000) (bvslt (index!19413 lt!234520) (size!16207 a!3235)))) (or ((_ is Undefined!4306) lt!234520) ((_ is Found!4306) lt!234520) (not ((_ is MissingZero!4306) lt!234520)) (and (bvsge (index!19412 lt!234520) #b00000000000000000000000000000000) (bvslt (index!19412 lt!234520) (size!16207 a!3235)))) (or ((_ is Undefined!4306) lt!234520) ((_ is Found!4306) lt!234520) ((_ is MissingZero!4306) lt!234520) (not ((_ is MissingVacant!4306) lt!234520)) (and (bvsge (index!19415 lt!234520) #b00000000000000000000000000000000) (bvslt (index!19415 lt!234520) (size!16207 a!3235)))) (or ((_ is Undefined!4306) lt!234520) (ite ((_ is Found!4306) lt!234520) (= (select (arr!15842 a!3235) (index!19413 lt!234520)) (select (arr!15842 a!3235) j!176)) (ite ((_ is MissingZero!4306) lt!234520) (= (select (arr!15842 a!3235) (index!19412 lt!234520)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4306) lt!234520) (= (select (arr!15842 a!3235) (index!19415 lt!234520)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299223 () SeekEntryResult!4306)

(assert (=> d!78785 (= lt!234520 e!299223)))

(declare-fun c!59886 () Bool)

(assert (=> d!78785 (= c!59886 (and ((_ is Intermediate!4306) lt!234519) (undefined!5118 lt!234519)))))

(assert (=> d!78785 (= lt!234519 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15842 a!3235) j!176) mask!3524) (select (arr!15842 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78785 (validMask!0 mask!3524)))

(assert (=> d!78785 (= (seekEntryOrOpen!0 (select (arr!15842 a!3235) j!176) a!3235 mask!3524) lt!234520)))

(declare-fun b!512466 () Bool)

(assert (=> b!512466 (= e!299223 Undefined!4306)))

(declare-fun b!512467 () Bool)

(assert (=> b!512467 (= e!299223 e!299222)))

(assert (=> b!512467 (= lt!234518 (select (arr!15842 a!3235) (index!19414 lt!234519)))))

(declare-fun c!59885 () Bool)

(assert (=> b!512467 (= c!59885 (= lt!234518 (select (arr!15842 a!3235) j!176)))))

(assert (= (and d!78785 c!59886) b!512466))

(assert (= (and d!78785 (not c!59886)) b!512467))

(assert (= (and b!512467 c!59885) b!512464))

(assert (= (and b!512467 (not c!59885)) b!512462))

(assert (= (and b!512462 c!59884) b!512463))

(assert (= (and b!512462 (not c!59884)) b!512465))

(assert (=> b!512465 m!493609))

(declare-fun m!493717 () Bool)

(assert (=> b!512465 m!493717))

(declare-fun m!493719 () Bool)

(assert (=> d!78785 m!493719))

(assert (=> d!78785 m!493635))

(assert (=> d!78785 m!493609))

(declare-fun m!493721 () Bool)

(assert (=> d!78785 m!493721))

(declare-fun m!493723 () Bool)

(assert (=> d!78785 m!493723))

(assert (=> d!78785 m!493609))

(assert (=> d!78785 m!493635))

(assert (=> d!78785 m!493621))

(declare-fun m!493725 () Bool)

(assert (=> d!78785 m!493725))

(declare-fun m!493727 () Bool)

(assert (=> b!512467 m!493727))

(assert (=> b!512383 d!78785))

(declare-fun b!512468 () Bool)

(declare-fun c!59887 () Bool)

(declare-fun lt!234521 () (_ BitVec 64))

(assert (=> b!512468 (= c!59887 (= lt!234521 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!299225 () SeekEntryResult!4306)

(declare-fun e!299224 () SeekEntryResult!4306)

(assert (=> b!512468 (= e!299225 e!299224)))

(declare-fun b!512469 () Bool)

(declare-fun lt!234522 () SeekEntryResult!4306)

(assert (=> b!512469 (= e!299224 (MissingZero!4306 (index!19414 lt!234522)))))

(declare-fun b!512470 () Bool)

(assert (=> b!512470 (= e!299225 (Found!4306 (index!19414 lt!234522)))))

(declare-fun b!512471 () Bool)

(assert (=> b!512471 (= e!299224 (seekKeyOrZeroReturnVacant!0 (x!48364 lt!234522) (index!19414 lt!234522) (index!19414 lt!234522) k0!2280 a!3235 mask!3524))))

(declare-fun d!78787 () Bool)

(declare-fun lt!234523 () SeekEntryResult!4306)

(assert (=> d!78787 (and (or ((_ is Undefined!4306) lt!234523) (not ((_ is Found!4306) lt!234523)) (and (bvsge (index!19413 lt!234523) #b00000000000000000000000000000000) (bvslt (index!19413 lt!234523) (size!16207 a!3235)))) (or ((_ is Undefined!4306) lt!234523) ((_ is Found!4306) lt!234523) (not ((_ is MissingZero!4306) lt!234523)) (and (bvsge (index!19412 lt!234523) #b00000000000000000000000000000000) (bvslt (index!19412 lt!234523) (size!16207 a!3235)))) (or ((_ is Undefined!4306) lt!234523) ((_ is Found!4306) lt!234523) ((_ is MissingZero!4306) lt!234523) (not ((_ is MissingVacant!4306) lt!234523)) (and (bvsge (index!19415 lt!234523) #b00000000000000000000000000000000) (bvslt (index!19415 lt!234523) (size!16207 a!3235)))) (or ((_ is Undefined!4306) lt!234523) (ite ((_ is Found!4306) lt!234523) (= (select (arr!15842 a!3235) (index!19413 lt!234523)) k0!2280) (ite ((_ is MissingZero!4306) lt!234523) (= (select (arr!15842 a!3235) (index!19412 lt!234523)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4306) lt!234523) (= (select (arr!15842 a!3235) (index!19415 lt!234523)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!299226 () SeekEntryResult!4306)

(assert (=> d!78787 (= lt!234523 e!299226)))

(declare-fun c!59889 () Bool)

(assert (=> d!78787 (= c!59889 (and ((_ is Intermediate!4306) lt!234522) (undefined!5118 lt!234522)))))

(assert (=> d!78787 (= lt!234522 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78787 (validMask!0 mask!3524)))

(assert (=> d!78787 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!234523)))

(declare-fun b!512472 () Bool)

(assert (=> b!512472 (= e!299226 Undefined!4306)))

(declare-fun b!512473 () Bool)

(assert (=> b!512473 (= e!299226 e!299225)))

(assert (=> b!512473 (= lt!234521 (select (arr!15842 a!3235) (index!19414 lt!234522)))))

(declare-fun c!59888 () Bool)

(assert (=> b!512473 (= c!59888 (= lt!234521 k0!2280))))

(assert (= (and d!78787 c!59889) b!512472))

(assert (= (and d!78787 (not c!59889)) b!512473))

(assert (= (and b!512473 c!59888) b!512470))

(assert (= (and b!512473 (not c!59888)) b!512468))

(assert (= (and b!512468 c!59887) b!512469))

(assert (= (and b!512468 (not c!59887)) b!512471))

(declare-fun m!493729 () Bool)

(assert (=> b!512471 m!493729))

(declare-fun m!493731 () Bool)

(assert (=> d!78787 m!493731))

(declare-fun m!493733 () Bool)

(assert (=> d!78787 m!493733))

(declare-fun m!493735 () Bool)

(assert (=> d!78787 m!493735))

(declare-fun m!493737 () Bool)

(assert (=> d!78787 m!493737))

(assert (=> d!78787 m!493733))

(assert (=> d!78787 m!493621))

(declare-fun m!493739 () Bool)

(assert (=> d!78787 m!493739))

(declare-fun m!493741 () Bool)

(assert (=> b!512473 m!493741))

(assert (=> b!512388 d!78787))

(declare-fun d!78789 () Bool)

(assert (=> d!78789 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!46266 d!78789))

(declare-fun d!78795 () Bool)

(assert (=> d!78795 (= (array_inv!11725 a!3235) (bvsge (size!16207 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!46266 d!78795))

(declare-fun d!78797 () Bool)

(assert (=> d!78797 (= (validKeyInArray!0 (select (arr!15842 a!3235) j!176)) (and (not (= (select (arr!15842 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15842 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512389 d!78797))

(declare-fun b!512496 () Bool)

(declare-fun e!299244 () Bool)

(declare-fun call!31495 () Bool)

(assert (=> b!512496 (= e!299244 call!31495)))

(declare-fun d!78801 () Bool)

(declare-fun res!313266 () Bool)

(declare-fun e!299245 () Bool)

(assert (=> d!78801 (=> res!313266 e!299245)))

(assert (=> d!78801 (= res!313266 (bvsge #b00000000000000000000000000000000 (size!16207 a!3235)))))

(assert (=> d!78801 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10036) e!299245)))

(declare-fun bm!31492 () Bool)

(declare-fun c!59895 () Bool)

(assert (=> bm!31492 (= call!31495 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59895 (Cons!10035 (select (arr!15842 a!3235) #b00000000000000000000000000000000) Nil!10036) Nil!10036)))))

(declare-fun b!512497 () Bool)

(declare-fun e!299246 () Bool)

(assert (=> b!512497 (= e!299245 e!299246)))

(declare-fun res!313267 () Bool)

(assert (=> b!512497 (=> (not res!313267) (not e!299246))))

(declare-fun e!299247 () Bool)

(assert (=> b!512497 (= res!313267 (not e!299247))))

(declare-fun res!313268 () Bool)

(assert (=> b!512497 (=> (not res!313268) (not e!299247))))

(assert (=> b!512497 (= res!313268 (validKeyInArray!0 (select (arr!15842 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512498 () Bool)

(assert (=> b!512498 (= e!299244 call!31495)))

(declare-fun b!512499 () Bool)

(declare-fun contains!2710 (List!10039 (_ BitVec 64)) Bool)

(assert (=> b!512499 (= e!299247 (contains!2710 Nil!10036 (select (arr!15842 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!512500 () Bool)

(assert (=> b!512500 (= e!299246 e!299244)))

(assert (=> b!512500 (= c!59895 (validKeyInArray!0 (select (arr!15842 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78801 (not res!313266)) b!512497))

(assert (= (and b!512497 res!313268) b!512499))

(assert (= (and b!512497 res!313267) b!512500))

(assert (= (and b!512500 c!59895) b!512498))

(assert (= (and b!512500 (not c!59895)) b!512496))

(assert (= (or b!512498 b!512496) bm!31492))

(declare-fun m!493755 () Bool)

(assert (=> bm!31492 m!493755))

(declare-fun m!493757 () Bool)

(assert (=> bm!31492 m!493757))

(assert (=> b!512497 m!493755))

(assert (=> b!512497 m!493755))

(declare-fun m!493759 () Bool)

(assert (=> b!512497 m!493759))

(assert (=> b!512499 m!493755))

(assert (=> b!512499 m!493755))

(declare-fun m!493761 () Bool)

(assert (=> b!512499 m!493761))

(assert (=> b!512500 m!493755))

(assert (=> b!512500 m!493755))

(assert (=> b!512500 m!493759))

(assert (=> b!512386 d!78801))

(declare-fun d!78803 () Bool)

(assert (=> d!78803 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!512385 d!78803))

(declare-fun d!78805 () Bool)

(declare-fun res!313273 () Bool)

(declare-fun e!299258 () Bool)

(assert (=> d!78805 (=> res!313273 e!299258)))

(assert (=> d!78805 (= res!313273 (= (select (arr!15842 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78805 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!299258)))

(declare-fun b!512517 () Bool)

(declare-fun e!299259 () Bool)

(assert (=> b!512517 (= e!299258 e!299259)))

(declare-fun res!313274 () Bool)

(assert (=> b!512517 (=> (not res!313274) (not e!299259))))

(assert (=> b!512517 (= res!313274 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16207 a!3235)))))

(declare-fun b!512518 () Bool)

(assert (=> b!512518 (= e!299259 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78805 (not res!313273)) b!512517))

(assert (= (and b!512517 res!313274) b!512518))

(assert (=> d!78805 m!493755))

(declare-fun m!493763 () Bool)

(assert (=> b!512518 m!493763))

(assert (=> b!512380 d!78805))

(declare-fun d!78807 () Bool)

(declare-fun lt!234547 () (_ BitVec 32))

(declare-fun lt!234546 () (_ BitVec 32))

(assert (=> d!78807 (= lt!234547 (bvmul (bvxor lt!234546 (bvlshr lt!234546 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78807 (= lt!234546 ((_ extract 31 0) (bvand (bvxor (select (arr!15842 a!3235) j!176) (bvlshr (select (arr!15842 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78807 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313275 (let ((h!10918 ((_ extract 31 0) (bvand (bvxor (select (arr!15842 a!3235) j!176) (bvlshr (select (arr!15842 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48367 (bvmul (bvxor h!10918 (bvlshr h!10918 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48367 (bvlshr x!48367 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313275 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313275 #b00000000000000000000000000000000))))))

(assert (=> d!78807 (= (toIndex!0 (select (arr!15842 a!3235) j!176) mask!3524) (bvand (bvxor lt!234547 (bvlshr lt!234547 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512387 d!78807))

(declare-fun b!512557 () Bool)

(declare-fun e!299286 () Bool)

(declare-fun e!299285 () Bool)

(assert (=> b!512557 (= e!299286 e!299285)))

(declare-fun lt!234570 () (_ BitVec 64))

(assert (=> b!512557 (= lt!234570 (select (arr!15842 a!3235) j!176))))

(declare-fun lt!234569 () Unit!15856)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32930 (_ BitVec 64) (_ BitVec 32)) Unit!15856)

(assert (=> b!512557 (= lt!234569 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234570 j!176))))

(assert (=> b!512557 (arrayContainsKey!0 a!3235 lt!234570 #b00000000000000000000000000000000)))

(declare-fun lt!234571 () Unit!15856)

(assert (=> b!512557 (= lt!234571 lt!234569)))

(declare-fun res!313286 () Bool)

(assert (=> b!512557 (= res!313286 (= (seekEntryOrOpen!0 (select (arr!15842 a!3235) j!176) a!3235 mask!3524) (Found!4306 j!176)))))

(assert (=> b!512557 (=> (not res!313286) (not e!299285))))

(declare-fun b!512558 () Bool)

(declare-fun call!31501 () Bool)

(assert (=> b!512558 (= e!299286 call!31501)))

(declare-fun b!512559 () Bool)

(declare-fun e!299284 () Bool)

(assert (=> b!512559 (= e!299284 e!299286)))

(declare-fun c!59916 () Bool)

(assert (=> b!512559 (= c!59916 (validKeyInArray!0 (select (arr!15842 a!3235) j!176)))))

(declare-fun bm!31498 () Bool)

(assert (=> bm!31498 (= call!31501 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78811 () Bool)

(declare-fun res!313287 () Bool)

(assert (=> d!78811 (=> res!313287 e!299284)))

(assert (=> d!78811 (= res!313287 (bvsge j!176 (size!16207 a!3235)))))

(assert (=> d!78811 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!299284)))

(declare-fun b!512560 () Bool)

(assert (=> b!512560 (= e!299285 call!31501)))

(assert (= (and d!78811 (not res!313287)) b!512559))

(assert (= (and b!512559 c!59916) b!512557))

(assert (= (and b!512559 (not c!59916)) b!512558))

(assert (= (and b!512557 res!313286) b!512560))

(assert (= (or b!512560 b!512558) bm!31498))

(assert (=> b!512557 m!493609))

(declare-fun m!493783 () Bool)

(assert (=> b!512557 m!493783))

(declare-fun m!493785 () Bool)

(assert (=> b!512557 m!493785))

(assert (=> b!512557 m!493609))

(assert (=> b!512557 m!493643))

(assert (=> b!512559 m!493609))

(assert (=> b!512559 m!493609))

(assert (=> b!512559 m!493611))

(declare-fun m!493793 () Bool)

(assert (=> bm!31498 m!493793))

(assert (=> b!512387 d!78811))

(declare-fun lt!234583 () SeekEntryResult!4306)

(declare-fun b!512627 () Bool)

(assert (=> b!512627 (and (bvsge (index!19414 lt!234583) #b00000000000000000000000000000000) (bvslt (index!19414 lt!234583) (size!16207 (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235)))))))

(declare-fun res!313319 () Bool)

(assert (=> b!512627 (= res!313319 (= (select (arr!15842 (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235))) (index!19414 lt!234583)) (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176)))))

(declare-fun e!299337 () Bool)

(assert (=> b!512627 (=> res!313319 e!299337)))

(declare-fun e!299335 () Bool)

(assert (=> b!512627 (= e!299335 e!299337)))

(declare-fun b!512628 () Bool)

(declare-fun e!299333 () SeekEntryResult!4306)

(assert (=> b!512628 (= e!299333 (Intermediate!4306 false lt!234480 #b00000000000000000000000000000000))))

(declare-fun b!512629 () Bool)

(assert (=> b!512629 (and (bvsge (index!19414 lt!234583) #b00000000000000000000000000000000) (bvslt (index!19414 lt!234583) (size!16207 (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235)))))))

(assert (=> b!512629 (= e!299337 (= (select (arr!15842 (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235))) (index!19414 lt!234583)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512631 () Bool)

(declare-fun e!299336 () Bool)

(assert (=> b!512631 (= e!299336 e!299335)))

(declare-fun res!313321 () Bool)

(assert (=> b!512631 (= res!313321 (and ((_ is Intermediate!4306) lt!234583) (not (undefined!5118 lt!234583)) (bvslt (x!48364 lt!234583) #b01111111111111111111111111111110) (bvsge (x!48364 lt!234583) #b00000000000000000000000000000000) (bvsge (x!48364 lt!234583) #b00000000000000000000000000000000)))))

(assert (=> b!512631 (=> (not res!313321) (not e!299335))))

(declare-fun b!512632 () Bool)

(assert (=> b!512632 (and (bvsge (index!19414 lt!234583) #b00000000000000000000000000000000) (bvslt (index!19414 lt!234583) (size!16207 (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235)))))))

(declare-fun res!313320 () Bool)

(assert (=> b!512632 (= res!313320 (= (select (arr!15842 (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235))) (index!19414 lt!234583)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512632 (=> res!313320 e!299337)))

(declare-fun b!512633 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!512633 (= e!299333 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234480 #b00000000000000000000000000000000 mask!3524) (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176) (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235)) mask!3524))))

(declare-fun b!512634 () Bool)

(declare-fun e!299334 () SeekEntryResult!4306)

(assert (=> b!512634 (= e!299334 (Intermediate!4306 true lt!234480 #b00000000000000000000000000000000))))

(declare-fun b!512635 () Bool)

(assert (=> b!512635 (= e!299336 (bvsge (x!48364 lt!234583) #b01111111111111111111111111111110))))

(declare-fun b!512630 () Bool)

(assert (=> b!512630 (= e!299334 e!299333)))

(declare-fun lt!234582 () (_ BitVec 64))

(declare-fun c!59935 () Bool)

(assert (=> b!512630 (= c!59935 (or (= lt!234582 (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176)) (= (bvadd lt!234582 lt!234582) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!78815 () Bool)

(assert (=> d!78815 e!299336))

(declare-fun c!59936 () Bool)

(assert (=> d!78815 (= c!59936 (and ((_ is Intermediate!4306) lt!234583) (undefined!5118 lt!234583)))))

(assert (=> d!78815 (= lt!234583 e!299334)))

(declare-fun c!59937 () Bool)

(assert (=> d!78815 (= c!59937 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78815 (= lt!234582 (select (arr!15842 (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235))) lt!234480))))

(assert (=> d!78815 (validMask!0 mask!3524)))

(assert (=> d!78815 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234480 (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176) (array!32931 (store (arr!15842 a!3235) i!1204 k0!2280) (size!16207 a!3235)) mask!3524) lt!234583)))

(assert (= (and d!78815 c!59937) b!512634))

(assert (= (and d!78815 (not c!59937)) b!512630))

(assert (= (and b!512630 c!59935) b!512628))

(assert (= (and b!512630 (not c!59935)) b!512633))

(assert (= (and d!78815 c!59936) b!512635))

(assert (= (and d!78815 (not c!59936)) b!512631))

(assert (= (and b!512631 res!313321) b!512627))

(assert (= (and b!512627 (not res!313319)) b!512632))

(assert (= (and b!512632 (not res!313320)) b!512629))

(declare-fun m!493833 () Bool)

(assert (=> b!512633 m!493833))

(assert (=> b!512633 m!493833))

(assert (=> b!512633 m!493629))

(declare-fun m!493835 () Bool)

(assert (=> b!512633 m!493835))

(declare-fun m!493837 () Bool)

(assert (=> b!512629 m!493837))

(declare-fun m!493839 () Bool)

(assert (=> d!78815 m!493839))

(assert (=> d!78815 m!493621))

(assert (=> b!512632 m!493837))

(assert (=> b!512627 m!493837))

(assert (=> b!512387 d!78815))

(declare-fun d!78835 () Bool)

(assert (=> d!78835 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!234598 () Unit!15856)

(declare-fun choose!38 (array!32930 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15856)

(assert (=> d!78835 (= lt!234598 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78835 (validMask!0 mask!3524)))

(assert (=> d!78835 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!234598)))

(declare-fun bs!16210 () Bool)

(assert (= bs!16210 d!78835))

(assert (=> bs!16210 m!493637))

(declare-fun m!493859 () Bool)

(assert (=> bs!16210 m!493859))

(assert (=> bs!16210 m!493621))

(assert (=> b!512387 d!78835))

(declare-fun d!78843 () Bool)

(declare-fun lt!234600 () (_ BitVec 32))

(declare-fun lt!234599 () (_ BitVec 32))

(assert (=> d!78843 (= lt!234600 (bvmul (bvxor lt!234599 (bvlshr lt!234599 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78843 (= lt!234599 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78843 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!313275 (let ((h!10918 ((_ extract 31 0) (bvand (bvxor (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176) (bvlshr (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!48367 (bvmul (bvxor h!10918 (bvlshr h!10918 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!48367 (bvlshr x!48367 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!313275 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!313275 #b00000000000000000000000000000000))))))

(assert (=> d!78843 (= (toIndex!0 (select (store (arr!15842 a!3235) i!1204 k0!2280) j!176) mask!3524) (bvand (bvxor lt!234600 (bvlshr lt!234600 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!512387 d!78843))

(declare-fun b!512646 () Bool)

(declare-fun lt!234602 () SeekEntryResult!4306)

(assert (=> b!512646 (and (bvsge (index!19414 lt!234602) #b00000000000000000000000000000000) (bvslt (index!19414 lt!234602) (size!16207 a!3235)))))

(declare-fun res!313324 () Bool)

(assert (=> b!512646 (= res!313324 (= (select (arr!15842 a!3235) (index!19414 lt!234602)) (select (arr!15842 a!3235) j!176)))))

(declare-fun e!299348 () Bool)

(assert (=> b!512646 (=> res!313324 e!299348)))

(declare-fun e!299346 () Bool)

(assert (=> b!512646 (= e!299346 e!299348)))

(declare-fun b!512647 () Bool)

(declare-fun e!299344 () SeekEntryResult!4306)

(assert (=> b!512647 (= e!299344 (Intermediate!4306 false lt!234481 #b00000000000000000000000000000000))))

(declare-fun b!512648 () Bool)

(assert (=> b!512648 (and (bvsge (index!19414 lt!234602) #b00000000000000000000000000000000) (bvslt (index!19414 lt!234602) (size!16207 a!3235)))))

(assert (=> b!512648 (= e!299348 (= (select (arr!15842 a!3235) (index!19414 lt!234602)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!512650 () Bool)

(declare-fun e!299347 () Bool)

(assert (=> b!512650 (= e!299347 e!299346)))

(declare-fun res!313326 () Bool)

(assert (=> b!512650 (= res!313326 (and ((_ is Intermediate!4306) lt!234602) (not (undefined!5118 lt!234602)) (bvslt (x!48364 lt!234602) #b01111111111111111111111111111110) (bvsge (x!48364 lt!234602) #b00000000000000000000000000000000) (bvsge (x!48364 lt!234602) #b00000000000000000000000000000000)))))

(assert (=> b!512650 (=> (not res!313326) (not e!299346))))

(declare-fun b!512651 () Bool)

(assert (=> b!512651 (and (bvsge (index!19414 lt!234602) #b00000000000000000000000000000000) (bvslt (index!19414 lt!234602) (size!16207 a!3235)))))

(declare-fun res!313325 () Bool)

(assert (=> b!512651 (= res!313325 (= (select (arr!15842 a!3235) (index!19414 lt!234602)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!512651 (=> res!313325 e!299348)))

(declare-fun b!512652 () Bool)

(assert (=> b!512652 (= e!299344 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!234481 #b00000000000000000000000000000000 mask!3524) (select (arr!15842 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!512653 () Bool)

(declare-fun e!299345 () SeekEntryResult!4306)

(assert (=> b!512653 (= e!299345 (Intermediate!4306 true lt!234481 #b00000000000000000000000000000000))))

(declare-fun b!512654 () Bool)

(assert (=> b!512654 (= e!299347 (bvsge (x!48364 lt!234602) #b01111111111111111111111111111110))))

(declare-fun b!512649 () Bool)

(assert (=> b!512649 (= e!299345 e!299344)))

(declare-fun lt!234601 () (_ BitVec 64))

(declare-fun c!59942 () Bool)

(assert (=> b!512649 (= c!59942 (or (= lt!234601 (select (arr!15842 a!3235) j!176)) (= (bvadd lt!234601 lt!234601) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!78845 () Bool)

(assert (=> d!78845 e!299347))

(declare-fun c!59943 () Bool)

(assert (=> d!78845 (= c!59943 (and ((_ is Intermediate!4306) lt!234602) (undefined!5118 lt!234602)))))

(assert (=> d!78845 (= lt!234602 e!299345)))

(declare-fun c!59944 () Bool)

(assert (=> d!78845 (= c!59944 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!78845 (= lt!234601 (select (arr!15842 a!3235) lt!234481))))

(assert (=> d!78845 (validMask!0 mask!3524)))

(assert (=> d!78845 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!234481 (select (arr!15842 a!3235) j!176) a!3235 mask!3524) lt!234602)))

(assert (= (and d!78845 c!59944) b!512653))

(assert (= (and d!78845 (not c!59944)) b!512649))

(assert (= (and b!512649 c!59942) b!512647))

(assert (= (and b!512649 (not c!59942)) b!512652))

(assert (= (and d!78845 c!59943) b!512654))

(assert (= (and d!78845 (not c!59943)) b!512650))

(assert (= (and b!512650 res!313326) b!512646))

(assert (= (and b!512646 (not res!313324)) b!512651))

(assert (= (and b!512651 (not res!313325)) b!512648))

(declare-fun m!493861 () Bool)

(assert (=> b!512652 m!493861))

(assert (=> b!512652 m!493861))

(assert (=> b!512652 m!493609))

(declare-fun m!493863 () Bool)

(assert (=> b!512652 m!493863))

(declare-fun m!493865 () Bool)

(assert (=> b!512648 m!493865))

(declare-fun m!493867 () Bool)

(assert (=> d!78845 m!493867))

(assert (=> d!78845 m!493621))

(assert (=> b!512651 m!493865))

(assert (=> b!512646 m!493865))

(assert (=> b!512387 d!78845))

(declare-fun b!512655 () Bool)

(declare-fun e!299351 () Bool)

(declare-fun e!299350 () Bool)

(assert (=> b!512655 (= e!299351 e!299350)))

(declare-fun lt!234604 () (_ BitVec 64))

(assert (=> b!512655 (= lt!234604 (select (arr!15842 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!234603 () Unit!15856)

(assert (=> b!512655 (= lt!234603 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!234604 #b00000000000000000000000000000000))))

(assert (=> b!512655 (arrayContainsKey!0 a!3235 lt!234604 #b00000000000000000000000000000000)))

(declare-fun lt!234605 () Unit!15856)

(assert (=> b!512655 (= lt!234605 lt!234603)))

(declare-fun res!313327 () Bool)

(assert (=> b!512655 (= res!313327 (= (seekEntryOrOpen!0 (select (arr!15842 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!4306 #b00000000000000000000000000000000)))))

(assert (=> b!512655 (=> (not res!313327) (not e!299350))))

(declare-fun b!512656 () Bool)

(declare-fun call!31509 () Bool)

(assert (=> b!512656 (= e!299351 call!31509)))

(declare-fun b!512657 () Bool)

(declare-fun e!299349 () Bool)

(assert (=> b!512657 (= e!299349 e!299351)))

(declare-fun c!59945 () Bool)

(assert (=> b!512657 (= c!59945 (validKeyInArray!0 (select (arr!15842 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31506 () Bool)

(assert (=> bm!31506 (= call!31509 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun d!78847 () Bool)

(declare-fun res!313328 () Bool)

(assert (=> d!78847 (=> res!313328 e!299349)))

(assert (=> d!78847 (= res!313328 (bvsge #b00000000000000000000000000000000 (size!16207 a!3235)))))

(assert (=> d!78847 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!299349)))

(declare-fun b!512658 () Bool)

(assert (=> b!512658 (= e!299350 call!31509)))

(assert (= (and d!78847 (not res!313328)) b!512657))

(assert (= (and b!512657 c!59945) b!512655))

(assert (= (and b!512657 (not c!59945)) b!512656))

(assert (= (and b!512655 res!313327) b!512658))

(assert (= (or b!512658 b!512656) bm!31506))

(assert (=> b!512655 m!493755))

(declare-fun m!493869 () Bool)

(assert (=> b!512655 m!493869))

(declare-fun m!493871 () Bool)

(assert (=> b!512655 m!493871))

(assert (=> b!512655 m!493755))

(declare-fun m!493873 () Bool)

(assert (=> b!512655 m!493873))

(assert (=> b!512657 m!493755))

(assert (=> b!512657 m!493755))

(assert (=> b!512657 m!493759))

(declare-fun m!493875 () Bool)

(assert (=> bm!31506 m!493875))

(assert (=> b!512382 d!78847))

(check-sat (not bm!31492) (not b!512657) (not d!78785) (not b!512518) (not b!512559) (not b!512655) (not d!78787) (not b!512465) (not b!512471) (not b!512557) (not b!512497) (not bm!31498) (not b!512500) (not bm!31506) (not d!78835) (not b!512652) (not b!512499) (not d!78815) (not d!78845) (not b!512633))
(check-sat)
