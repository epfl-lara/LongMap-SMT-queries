; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67752 () Bool)

(assert start!67752)

(declare-fun b!786656 () Bool)

(declare-fun e!437294 () Bool)

(declare-fun e!437297 () Bool)

(assert (=> b!786656 (= e!437294 e!437297)))

(declare-fun res!532677 () Bool)

(assert (=> b!786656 (=> (not res!532677) (not e!437297))))

(declare-datatypes ((array!42792 0))(
  ( (array!42793 (arr!20484 (Array (_ BitVec 32) (_ BitVec 64))) (size!20905 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42792)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8084 0))(
  ( (MissingZero!8084 (index!34704 (_ BitVec 32))) (Found!8084 (index!34705 (_ BitVec 32))) (Intermediate!8084 (undefined!8896 Bool) (index!34706 (_ BitVec 32)) (x!65648 (_ BitVec 32))) (Undefined!8084) (MissingVacant!8084 (index!34707 (_ BitVec 32))) )
))
(declare-fun lt!350843 () SeekEntryResult!8084)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42792 (_ BitVec 32)) SeekEntryResult!8084)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!786656 (= res!532677 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20484 a!3186) j!159) mask!3328) (select (arr!20484 a!3186) j!159) a!3186 mask!3328) lt!350843))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!786656 (= lt!350843 (Intermediate!8084 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!786657 () Bool)

(declare-fun e!437292 () Bool)

(assert (=> b!786657 (= e!437292 true)))

(declare-fun e!437289 () Bool)

(assert (=> b!786657 e!437289))

(declare-fun res!532669 () Bool)

(assert (=> b!786657 (=> (not res!532669) (not e!437289))))

(declare-fun lt!350847 () (_ BitVec 64))

(assert (=> b!786657 (= res!532669 (= lt!350847 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!27224 0))(
  ( (Unit!27225) )
))
(declare-fun lt!350846 () Unit!27224)

(declare-fun e!437300 () Unit!27224)

(assert (=> b!786657 (= lt!350846 e!437300)))

(declare-fun c!87403 () Bool)

(assert (=> b!786657 (= c!87403 (= lt!350847 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!786658 () Bool)

(declare-fun e!437299 () Bool)

(assert (=> b!786658 (= e!437299 e!437292)))

(declare-fun res!532671 () Bool)

(assert (=> b!786658 (=> res!532671 e!437292)))

(declare-fun lt!350852 () (_ BitVec 64))

(assert (=> b!786658 (= res!532671 (= lt!350847 lt!350852))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!786658 (= lt!350847 (select (store (arr!20484 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!786659 () Bool)

(declare-fun res!532682 () Bool)

(assert (=> b!786659 (=> (not res!532682) (not e!437294))))

(declare-datatypes ((List!14486 0))(
  ( (Nil!14483) (Cons!14482 (h!15605 (_ BitVec 64)) (t!20801 List!14486)) )
))
(declare-fun arrayNoDuplicates!0 (array!42792 (_ BitVec 32) List!14486) Bool)

(assert (=> b!786659 (= res!532682 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14483))))

(declare-fun b!786660 () Bool)

(declare-fun res!532675 () Bool)

(declare-fun e!437293 () Bool)

(assert (=> b!786660 (=> (not res!532675) (not e!437293))))

(declare-fun arrayContainsKey!0 (array!42792 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!786660 (= res!532675 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun res!532672 () Bool)

(assert (=> start!67752 (=> (not res!532672) (not e!437293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67752 (= res!532672 (validMask!0 mask!3328))))

(assert (=> start!67752 e!437293))

(assert (=> start!67752 true))

(declare-fun array_inv!16280 (array!42792) Bool)

(assert (=> start!67752 (array_inv!16280 a!3186)))

(declare-fun b!786661 () Bool)

(declare-fun res!532667 () Bool)

(assert (=> b!786661 (=> (not res!532667) (not e!437293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!786661 (= res!532667 (validKeyInArray!0 k!2102))))

(declare-fun b!786662 () Bool)

(declare-fun res!532676 () Bool)

(assert (=> b!786662 (=> (not res!532676) (not e!437293))))

(assert (=> b!786662 (= res!532676 (validKeyInArray!0 (select (arr!20484 a!3186) j!159)))))

(declare-fun b!786663 () Bool)

(declare-fun Unit!27226 () Unit!27224)

(assert (=> b!786663 (= e!437300 Unit!27226)))

(assert (=> b!786663 false))

(declare-fun b!786664 () Bool)

(declare-fun lt!350848 () SeekEntryResult!8084)

(declare-fun lt!350850 () SeekEntryResult!8084)

(assert (=> b!786664 (= e!437289 (= lt!350848 lt!350850))))

(declare-fun b!786665 () Bool)

(declare-fun res!532668 () Bool)

(assert (=> b!786665 (=> (not res!532668) (not e!437297))))

(declare-fun e!437290 () Bool)

(assert (=> b!786665 (= res!532668 e!437290)))

(declare-fun c!87402 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(assert (=> b!786665 (= c!87402 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!786666 () Bool)

(declare-fun e!437291 () Bool)

(assert (=> b!786666 (= e!437291 e!437299)))

(declare-fun res!532679 () Bool)

(assert (=> b!786666 (=> res!532679 e!437299)))

(declare-fun lt!350851 () SeekEntryResult!8084)

(assert (=> b!786666 (= res!532679 (not (= lt!350850 lt!350851)))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42792 (_ BitVec 32)) SeekEntryResult!8084)

(assert (=> b!786666 (= lt!350850 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20484 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!786667 () Bool)

(declare-fun e!437296 () Bool)

(assert (=> b!786667 (= e!437296 (not e!437291))))

(declare-fun res!532680 () Bool)

(assert (=> b!786667 (=> res!532680 e!437291)))

(declare-fun lt!350842 () SeekEntryResult!8084)

(assert (=> b!786667 (= res!532680 (or (not (is-Intermediate!8084 lt!350842)) (bvslt x!1131 (x!65648 lt!350842)) (not (= x!1131 (x!65648 lt!350842))) (not (= index!1321 (index!34706 lt!350842)))))))

(declare-fun e!437295 () Bool)

(assert (=> b!786667 e!437295))

(declare-fun res!532681 () Bool)

(assert (=> b!786667 (=> (not res!532681) (not e!437295))))

(assert (=> b!786667 (= res!532681 (= lt!350848 lt!350851))))

(assert (=> b!786667 (= lt!350851 (Found!8084 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42792 (_ BitVec 32)) SeekEntryResult!8084)

(assert (=> b!786667 (= lt!350848 (seekEntryOrOpen!0 (select (arr!20484 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42792 (_ BitVec 32)) Bool)

(assert (=> b!786667 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350841 () Unit!27224)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42792 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27224)

(assert (=> b!786667 (= lt!350841 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!786668 () Bool)

(assert (=> b!786668 (= e!437293 e!437294)))

(declare-fun res!532683 () Bool)

(assert (=> b!786668 (=> (not res!532683) (not e!437294))))

(declare-fun lt!350845 () SeekEntryResult!8084)

(assert (=> b!786668 (= res!532683 (or (= lt!350845 (MissingZero!8084 i!1173)) (= lt!350845 (MissingVacant!8084 i!1173))))))

(assert (=> b!786668 (= lt!350845 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!786669 () Bool)

(declare-fun res!532684 () Bool)

(assert (=> b!786669 (=> (not res!532684) (not e!437294))))

(assert (=> b!786669 (= res!532684 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20905 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20905 a!3186))))))

(declare-fun b!786670 () Bool)

(declare-fun Unit!27227 () Unit!27224)

(assert (=> b!786670 (= e!437300 Unit!27227)))

(declare-fun b!786671 () Bool)

(assert (=> b!786671 (= e!437290 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20484 a!3186) j!159) a!3186 mask!3328) lt!350843))))

(declare-fun b!786672 () Bool)

(assert (=> b!786672 (= e!437295 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20484 a!3186) j!159) a!3186 mask!3328) lt!350851))))

(declare-fun b!786673 () Bool)

(declare-fun res!532678 () Bool)

(assert (=> b!786673 (=> (not res!532678) (not e!437289))))

(declare-fun lt!350844 () array!42792)

(assert (=> b!786673 (= res!532678 (= (seekEntryOrOpen!0 lt!350852 lt!350844 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350852 lt!350844 mask!3328)))))

(declare-fun b!786674 () Bool)

(assert (=> b!786674 (= e!437297 e!437296)))

(declare-fun res!532673 () Bool)

(assert (=> b!786674 (=> (not res!532673) (not e!437296))))

(declare-fun lt!350849 () SeekEntryResult!8084)

(assert (=> b!786674 (= res!532673 (= lt!350849 lt!350842))))

(assert (=> b!786674 (= lt!350842 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350852 lt!350844 mask!3328))))

(assert (=> b!786674 (= lt!350849 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350852 mask!3328) lt!350852 lt!350844 mask!3328))))

(assert (=> b!786674 (= lt!350852 (select (store (arr!20484 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!786674 (= lt!350844 (array!42793 (store (arr!20484 a!3186) i!1173 k!2102) (size!20905 a!3186)))))

(declare-fun b!786675 () Bool)

(declare-fun res!532685 () Bool)

(assert (=> b!786675 (=> (not res!532685) (not e!437293))))

(assert (=> b!786675 (= res!532685 (and (= (size!20905 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20905 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20905 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!786676 () Bool)

(assert (=> b!786676 (= e!437290 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20484 a!3186) j!159) a!3186 mask!3328) (Found!8084 j!159)))))

(declare-fun b!786677 () Bool)

(declare-fun res!532674 () Bool)

(assert (=> b!786677 (=> (not res!532674) (not e!437297))))

(assert (=> b!786677 (= res!532674 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20484 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!786678 () Bool)

(declare-fun res!532670 () Bool)

(assert (=> b!786678 (=> (not res!532670) (not e!437294))))

(assert (=> b!786678 (= res!532670 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(assert (= (and start!67752 res!532672) b!786675))

(assert (= (and b!786675 res!532685) b!786662))

(assert (= (and b!786662 res!532676) b!786661))

(assert (= (and b!786661 res!532667) b!786660))

(assert (= (and b!786660 res!532675) b!786668))

(assert (= (and b!786668 res!532683) b!786678))

(assert (= (and b!786678 res!532670) b!786659))

(assert (= (and b!786659 res!532682) b!786669))

(assert (= (and b!786669 res!532684) b!786656))

(assert (= (and b!786656 res!532677) b!786677))

(assert (= (and b!786677 res!532674) b!786665))

(assert (= (and b!786665 c!87402) b!786671))

(assert (= (and b!786665 (not c!87402)) b!786676))

(assert (= (and b!786665 res!532668) b!786674))

(assert (= (and b!786674 res!532673) b!786667))

(assert (= (and b!786667 res!532681) b!786672))

(assert (= (and b!786667 (not res!532680)) b!786666))

(assert (= (and b!786666 (not res!532679)) b!786658))

(assert (= (and b!786658 (not res!532671)) b!786657))

(assert (= (and b!786657 c!87403) b!786663))

(assert (= (and b!786657 (not c!87403)) b!786670))

(assert (= (and b!786657 res!532669) b!786673))

(assert (= (and b!786673 res!532678) b!786664))

(declare-fun m!728429 () Bool)

(assert (=> start!67752 m!728429))

(declare-fun m!728431 () Bool)

(assert (=> start!67752 m!728431))

(declare-fun m!728433 () Bool)

(assert (=> b!786676 m!728433))

(assert (=> b!786676 m!728433))

(declare-fun m!728435 () Bool)

(assert (=> b!786676 m!728435))

(declare-fun m!728437 () Bool)

(assert (=> b!786677 m!728437))

(declare-fun m!728439 () Bool)

(assert (=> b!786674 m!728439))

(declare-fun m!728441 () Bool)

(assert (=> b!786674 m!728441))

(declare-fun m!728443 () Bool)

(assert (=> b!786674 m!728443))

(declare-fun m!728445 () Bool)

(assert (=> b!786674 m!728445))

(declare-fun m!728447 () Bool)

(assert (=> b!786674 m!728447))

(assert (=> b!786674 m!728441))

(assert (=> b!786666 m!728433))

(assert (=> b!786666 m!728433))

(assert (=> b!786666 m!728435))

(assert (=> b!786671 m!728433))

(assert (=> b!786671 m!728433))

(declare-fun m!728449 () Bool)

(assert (=> b!786671 m!728449))

(declare-fun m!728451 () Bool)

(assert (=> b!786678 m!728451))

(assert (=> b!786672 m!728433))

(assert (=> b!786672 m!728433))

(declare-fun m!728453 () Bool)

(assert (=> b!786672 m!728453))

(declare-fun m!728455 () Bool)

(assert (=> b!786661 m!728455))

(assert (=> b!786658 m!728439))

(declare-fun m!728457 () Bool)

(assert (=> b!786658 m!728457))

(declare-fun m!728459 () Bool)

(assert (=> b!786673 m!728459))

(declare-fun m!728461 () Bool)

(assert (=> b!786673 m!728461))

(declare-fun m!728463 () Bool)

(assert (=> b!786659 m!728463))

(declare-fun m!728465 () Bool)

(assert (=> b!786668 m!728465))

(assert (=> b!786656 m!728433))

(assert (=> b!786656 m!728433))

(declare-fun m!728467 () Bool)

(assert (=> b!786656 m!728467))

(assert (=> b!786656 m!728467))

(assert (=> b!786656 m!728433))

(declare-fun m!728469 () Bool)

(assert (=> b!786656 m!728469))

(assert (=> b!786662 m!728433))

(assert (=> b!786662 m!728433))

(declare-fun m!728471 () Bool)

(assert (=> b!786662 m!728471))

(declare-fun m!728473 () Bool)

(assert (=> b!786660 m!728473))

(assert (=> b!786667 m!728433))

(assert (=> b!786667 m!728433))

(declare-fun m!728475 () Bool)

(assert (=> b!786667 m!728475))

(declare-fun m!728477 () Bool)

(assert (=> b!786667 m!728477))

(declare-fun m!728479 () Bool)

(assert (=> b!786667 m!728479))

(push 1)

