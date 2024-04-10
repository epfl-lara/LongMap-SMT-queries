; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65642 () Bool)

(assert start!65642)

(declare-fun b!751563 () Bool)

(declare-fun res!507424 () Bool)

(declare-fun e!419256 () Bool)

(assert (=> b!751563 (=> res!507424 e!419256)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-datatypes ((array!41815 0))(
  ( (array!41816 (arr!20021 (Array (_ BitVec 32) (_ BitVec 64))) (size!20442 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41815)

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7621 0))(
  ( (MissingZero!7621 (index!32852 (_ BitVec 32))) (Found!7621 (index!32853 (_ BitVec 32))) (Intermediate!7621 (undefined!8433 Bool) (index!32854 (_ BitVec 32)) (x!63771 (_ BitVec 32))) (Undefined!7621) (MissingVacant!7621 (index!32855 (_ BitVec 32))) )
))
(declare-fun lt!334245 () SeekEntryResult!7621)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41815 (_ BitVec 32)) SeekEntryResult!7621)

(assert (=> b!751563 (= res!507424 (not (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20021 a!3186) j!159) a!3186 mask!3328) lt!334245)))))

(declare-fun b!751564 () Bool)

(declare-fun e!419258 () Bool)

(assert (=> b!751564 (= e!419258 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20021 a!3186) j!159) a!3186 mask!3328) (Found!7621 j!159)))))

(declare-fun b!751565 () Bool)

(declare-fun res!507422 () Bool)

(declare-fun e!419254 () Bool)

(assert (=> b!751565 (=> (not res!507422) (not e!419254))))

(declare-datatypes ((List!14023 0))(
  ( (Nil!14020) (Cons!14019 (h!15091 (_ BitVec 64)) (t!20338 List!14023)) )
))
(declare-fun arrayNoDuplicates!0 (array!41815 (_ BitVec 32) List!14023) Bool)

(assert (=> b!751565 (= res!507422 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14020))))

(declare-fun b!751566 () Bool)

(declare-fun res!507420 () Bool)

(declare-fun e!419261 () Bool)

(assert (=> b!751566 (=> (not res!507420) (not e!419261))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!751566 (= res!507420 (and (= (size!20442 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20442 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20442 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!751567 () Bool)

(declare-datatypes ((Unit!25864 0))(
  ( (Unit!25865) )
))
(declare-fun e!419259 () Unit!25864)

(declare-fun Unit!25866 () Unit!25864)

(assert (=> b!751567 (= e!419259 Unit!25866)))

(declare-fun b!751568 () Bool)

(declare-fun res!507421 () Bool)

(assert (=> b!751568 (=> (not res!507421) (not e!419254))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!751568 (= res!507421 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20442 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20442 a!3186))))))

(declare-fun b!751569 () Bool)

(assert (=> b!751569 (= e!419261 e!419254)))

(declare-fun res!507427 () Bool)

(assert (=> b!751569 (=> (not res!507427) (not e!419254))))

(declare-fun lt!334243 () SeekEntryResult!7621)

(assert (=> b!751569 (= res!507427 (or (= lt!334243 (MissingZero!7621 i!1173)) (= lt!334243 (MissingVacant!7621 i!1173))))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41815 (_ BitVec 32)) SeekEntryResult!7621)

(assert (=> b!751569 (= lt!334243 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun lt!334250 () SeekEntryResult!7621)

(declare-fun b!751570 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41815 (_ BitVec 32)) SeekEntryResult!7621)

(assert (=> b!751570 (= e!419258 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20021 a!3186) j!159) a!3186 mask!3328) lt!334250))))

(declare-fun b!751571 () Bool)

(declare-fun res!507416 () Bool)

(assert (=> b!751571 (=> (not res!507416) (not e!419261))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!751571 (= res!507416 (validKeyInArray!0 k!2102))))

(declare-fun b!751572 () Bool)

(declare-fun res!507415 () Bool)

(declare-fun e!419252 () Bool)

(assert (=> b!751572 (=> (not res!507415) (not e!419252))))

(assert (=> b!751572 (= res!507415 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20021 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!507414 () Bool)

(assert (=> start!65642 (=> (not res!507414) (not e!419261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65642 (= res!507414 (validMask!0 mask!3328))))

(assert (=> start!65642 e!419261))

(assert (=> start!65642 true))

(declare-fun array_inv!15817 (array!41815) Bool)

(assert (=> start!65642 (array_inv!15817 a!3186)))

(declare-fun b!751573 () Bool)

(declare-fun res!507426 () Bool)

(assert (=> b!751573 (=> (not res!507426) (not e!419261))))

(declare-fun arrayContainsKey!0 (array!41815 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!751573 (= res!507426 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!751574 () Bool)

(declare-fun Unit!25867 () Unit!25864)

(assert (=> b!751574 (= e!419259 Unit!25867)))

(assert (=> b!751574 false))

(declare-fun b!751575 () Bool)

(declare-fun e!419257 () Bool)

(assert (=> b!751575 (= e!419257 (not e!419256))))

(declare-fun res!507425 () Bool)

(assert (=> b!751575 (=> res!507425 e!419256)))

(declare-fun lt!334247 () SeekEntryResult!7621)

(assert (=> b!751575 (= res!507425 (or (not (is-Intermediate!7621 lt!334247)) (bvslt x!1131 (x!63771 lt!334247)) (not (= x!1131 (x!63771 lt!334247))) (not (= index!1321 (index!32854 lt!334247)))))))

(declare-fun e!419255 () Bool)

(assert (=> b!751575 e!419255))

(declare-fun res!507419 () Bool)

(assert (=> b!751575 (=> (not res!507419) (not e!419255))))

(declare-fun lt!334246 () SeekEntryResult!7621)

(assert (=> b!751575 (= res!507419 (= lt!334246 lt!334245))))

(assert (=> b!751575 (= lt!334245 (Found!7621 j!159))))

(assert (=> b!751575 (= lt!334246 (seekEntryOrOpen!0 (select (arr!20021 a!3186) j!159) a!3186 mask!3328))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41815 (_ BitVec 32)) Bool)

(assert (=> b!751575 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!334252 () Unit!25864)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41815 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25864)

(assert (=> b!751575 (= lt!334252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!751576 () Bool)

(declare-fun res!507418 () Bool)

(assert (=> b!751576 (=> (not res!507418) (not e!419261))))

(assert (=> b!751576 (= res!507418 (validKeyInArray!0 (select (arr!20021 a!3186) j!159)))))

(declare-fun b!751577 () Bool)

(assert (=> b!751577 (= e!419252 e!419257)))

(declare-fun res!507429 () Bool)

(assert (=> b!751577 (=> (not res!507429) (not e!419257))))

(declare-fun lt!334249 () SeekEntryResult!7621)

(assert (=> b!751577 (= res!507429 (= lt!334249 lt!334247))))

(declare-fun lt!334251 () (_ BitVec 64))

(declare-fun lt!334248 () array!41815)

(assert (=> b!751577 (= lt!334247 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!334251 lt!334248 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!751577 (= lt!334249 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!334251 mask!3328) lt!334251 lt!334248 mask!3328))))

(assert (=> b!751577 (= lt!334251 (select (store (arr!20021 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!751577 (= lt!334248 (array!41816 (store (arr!20021 a!3186) i!1173 k!2102) (size!20442 a!3186)))))

(declare-fun b!751578 () Bool)

(declare-fun res!507431 () Bool)

(assert (=> b!751578 (=> (not res!507431) (not e!419252))))

(assert (=> b!751578 (= res!507431 e!419258)))

(declare-fun c!82456 () Bool)

(assert (=> b!751578 (= c!82456 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!751579 () Bool)

(assert (=> b!751579 (= e!419255 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20021 a!3186) j!159) a!3186 mask!3328) lt!334245))))

(declare-fun b!751580 () Bool)

(declare-fun e!419251 () Bool)

(assert (=> b!751580 (= e!419256 e!419251)))

(declare-fun res!507428 () Bool)

(assert (=> b!751580 (=> res!507428 e!419251)))

(declare-fun lt!334244 () (_ BitVec 64))

(assert (=> b!751580 (= res!507428 (= lt!334244 lt!334251))))

(assert (=> b!751580 (= lt!334244 (select (store (arr!20021 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!751581 () Bool)

(assert (=> b!751581 (= e!419251 true)))

(declare-fun e!419260 () Bool)

(assert (=> b!751581 e!419260))

(declare-fun res!507430 () Bool)

(assert (=> b!751581 (=> (not res!507430) (not e!419260))))

(assert (=> b!751581 (= res!507430 (= lt!334244 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!334253 () Unit!25864)

(assert (=> b!751581 (= lt!334253 e!419259)))

(declare-fun c!82455 () Bool)

(assert (=> b!751581 (= c!82455 (= lt!334244 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!751582 () Bool)

(declare-fun res!507417 () Bool)

(assert (=> b!751582 (=> (not res!507417) (not e!419254))))

(assert (=> b!751582 (= res!507417 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!751583 () Bool)

(assert (=> b!751583 (= e!419260 (= (seekEntryOrOpen!0 lt!334251 lt!334248 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!334251 lt!334248 mask!3328)))))

(declare-fun b!751584 () Bool)

(assert (=> b!751584 (= e!419254 e!419252)))

(declare-fun res!507423 () Bool)

(assert (=> b!751584 (=> (not res!507423) (not e!419252))))

(assert (=> b!751584 (= res!507423 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20021 a!3186) j!159) mask!3328) (select (arr!20021 a!3186) j!159) a!3186 mask!3328) lt!334250))))

(assert (=> b!751584 (= lt!334250 (Intermediate!7621 false resIntermediateIndex!5 resIntermediateX!5))))

(assert (= (and start!65642 res!507414) b!751566))

(assert (= (and b!751566 res!507420) b!751576))

(assert (= (and b!751576 res!507418) b!751571))

(assert (= (and b!751571 res!507416) b!751573))

(assert (= (and b!751573 res!507426) b!751569))

(assert (= (and b!751569 res!507427) b!751582))

(assert (= (and b!751582 res!507417) b!751565))

(assert (= (and b!751565 res!507422) b!751568))

(assert (= (and b!751568 res!507421) b!751584))

(assert (= (and b!751584 res!507423) b!751572))

(assert (= (and b!751572 res!507415) b!751578))

(assert (= (and b!751578 c!82456) b!751570))

(assert (= (and b!751578 (not c!82456)) b!751564))

(assert (= (and b!751578 res!507431) b!751577))

(assert (= (and b!751577 res!507429) b!751575))

(assert (= (and b!751575 res!507419) b!751579))

(assert (= (and b!751575 (not res!507425)) b!751563))

(assert (= (and b!751563 (not res!507424)) b!751580))

(assert (= (and b!751580 (not res!507428)) b!751581))

(assert (= (and b!751581 c!82455) b!751574))

(assert (= (and b!751581 (not c!82455)) b!751567))

(assert (= (and b!751581 res!507430) b!751583))

(declare-fun m!700719 () Bool)

(assert (=> b!751576 m!700719))

(assert (=> b!751576 m!700719))

(declare-fun m!700721 () Bool)

(assert (=> b!751576 m!700721))

(declare-fun m!700723 () Bool)

(assert (=> start!65642 m!700723))

(declare-fun m!700725 () Bool)

(assert (=> start!65642 m!700725))

(declare-fun m!700727 () Bool)

(assert (=> b!751582 m!700727))

(declare-fun m!700729 () Bool)

(assert (=> b!751565 m!700729))

(assert (=> b!751563 m!700719))

(assert (=> b!751563 m!700719))

(declare-fun m!700731 () Bool)

(assert (=> b!751563 m!700731))

(assert (=> b!751579 m!700719))

(assert (=> b!751579 m!700719))

(declare-fun m!700733 () Bool)

(assert (=> b!751579 m!700733))

(declare-fun m!700735 () Bool)

(assert (=> b!751569 m!700735))

(declare-fun m!700737 () Bool)

(assert (=> b!751573 m!700737))

(declare-fun m!700739 () Bool)

(assert (=> b!751583 m!700739))

(declare-fun m!700741 () Bool)

(assert (=> b!751583 m!700741))

(declare-fun m!700743 () Bool)

(assert (=> b!751571 m!700743))

(assert (=> b!751584 m!700719))

(assert (=> b!751584 m!700719))

(declare-fun m!700745 () Bool)

(assert (=> b!751584 m!700745))

(assert (=> b!751584 m!700745))

(assert (=> b!751584 m!700719))

(declare-fun m!700747 () Bool)

(assert (=> b!751584 m!700747))

(assert (=> b!751564 m!700719))

(assert (=> b!751564 m!700719))

(assert (=> b!751564 m!700731))

(declare-fun m!700749 () Bool)

(assert (=> b!751572 m!700749))

(assert (=> b!751570 m!700719))

(assert (=> b!751570 m!700719))

(declare-fun m!700751 () Bool)

(assert (=> b!751570 m!700751))

(declare-fun m!700753 () Bool)

(assert (=> b!751580 m!700753))

(declare-fun m!700755 () Bool)

(assert (=> b!751580 m!700755))

(declare-fun m!700757 () Bool)

(assert (=> b!751577 m!700757))

(declare-fun m!700759 () Bool)

(assert (=> b!751577 m!700759))

(assert (=> b!751577 m!700753))

(assert (=> b!751577 m!700757))

(declare-fun m!700761 () Bool)

(assert (=> b!751577 m!700761))

(declare-fun m!700763 () Bool)

(assert (=> b!751577 m!700763))

(assert (=> b!751575 m!700719))

(assert (=> b!751575 m!700719))

(declare-fun m!700765 () Bool)

(assert (=> b!751575 m!700765))

(declare-fun m!700767 () Bool)

(assert (=> b!751575 m!700767))

(declare-fun m!700769 () Bool)

(assert (=> b!751575 m!700769))

(push 1)

