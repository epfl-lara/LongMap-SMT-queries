; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65720 () Bool)

(assert start!65720)

(declare-fun b!754253 () Bool)

(declare-fun res!509654 () Bool)

(declare-fun e!420654 () Bool)

(assert (=> b!754253 (=> (not res!509654) (not e!420654))))

(declare-datatypes ((array!41893 0))(
  ( (array!41894 (arr!20060 (Array (_ BitVec 32) (_ BitVec 64))) (size!20481 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41893)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41893 (_ BitVec 32)) Bool)

(assert (=> b!754253 (= res!509654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!754254 () Bool)

(declare-fun res!509638 () Bool)

(declare-fun e!420658 () Bool)

(assert (=> b!754254 (=> (not res!509638) (not e!420658))))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!754254 (= res!509638 (and (= (size!20481 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20481 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20481 a!3186)) (not (= i!1173 j!159))))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!754255 () Bool)

(declare-fun e!420661 () Bool)

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7660 0))(
  ( (MissingZero!7660 (index!33008 (_ BitVec 32))) (Found!7660 (index!33009 (_ BitVec 32))) (Intermediate!7660 (undefined!8472 Bool) (index!33010 (_ BitVec 32)) (x!63914 (_ BitVec 32))) (Undefined!7660) (MissingVacant!7660 (index!33011 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41893 (_ BitVec 32)) SeekEntryResult!7660)

(assert (=> b!754255 (= e!420661 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20060 a!3186) j!159) a!3186 mask!3328) (Found!7660 j!159)))))

(declare-fun b!754256 () Bool)

(declare-fun e!420665 () Bool)

(declare-fun e!420655 () Bool)

(assert (=> b!754256 (= e!420665 e!420655)))

(declare-fun res!509644 () Bool)

(assert (=> b!754256 (=> res!509644 e!420655)))

(declare-fun lt!335646 () SeekEntryResult!7660)

(declare-fun lt!335656 () SeekEntryResult!7660)

(assert (=> b!754256 (= res!509644 (not (= lt!335646 lt!335656)))))

(assert (=> b!754256 (= lt!335646 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20060 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!754257 () Bool)

(declare-fun res!509648 () Bool)

(assert (=> b!754257 (=> (not res!509648) (not e!420658))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!754257 (= res!509648 (validKeyInArray!0 (select (arr!20060 a!3186) j!159)))))

(declare-fun b!754258 () Bool)

(declare-fun e!420660 () Bool)

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!754258 (= e!420660 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20060 a!3186) j!159) a!3186 mask!3328) lt!335656))))

(declare-fun b!754259 () Bool)

(declare-fun res!509641 () Bool)

(declare-fun e!420659 () Bool)

(assert (=> b!754259 (=> (not res!509641) (not e!420659))))

(assert (=> b!754259 (= res!509641 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20060 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!754260 () Bool)

(declare-fun e!420657 () Bool)

(assert (=> b!754260 (= e!420657 (not e!420665))))

(declare-fun res!509652 () Bool)

(assert (=> b!754260 (=> res!509652 e!420665)))

(declare-fun lt!335649 () SeekEntryResult!7660)

(assert (=> b!754260 (= res!509652 (or (not (is-Intermediate!7660 lt!335649)) (bvslt x!1131 (x!63914 lt!335649)) (not (= x!1131 (x!63914 lt!335649))) (not (= index!1321 (index!33010 lt!335649)))))))

(assert (=> b!754260 e!420660))

(declare-fun res!509647 () Bool)

(assert (=> b!754260 (=> (not res!509647) (not e!420660))))

(declare-fun lt!335650 () SeekEntryResult!7660)

(assert (=> b!754260 (= res!509647 (= lt!335650 lt!335656))))

(assert (=> b!754260 (= lt!335656 (Found!7660 j!159))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41893 (_ BitVec 32)) SeekEntryResult!7660)

(assert (=> b!754260 (= lt!335650 (seekEntryOrOpen!0 (select (arr!20060 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!754260 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-datatypes ((Unit!26020 0))(
  ( (Unit!26021) )
))
(declare-fun lt!335657 () Unit!26020)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41893 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26020)

(assert (=> b!754260 (= lt!335657 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun res!509643 () Bool)

(assert (=> start!65720 (=> (not res!509643) (not e!420658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65720 (= res!509643 (validMask!0 mask!3328))))

(assert (=> start!65720 e!420658))

(assert (=> start!65720 true))

(declare-fun array_inv!15856 (array!41893) Bool)

(assert (=> start!65720 (array_inv!15856 a!3186)))

(declare-fun b!754261 () Bool)

(declare-fun res!509646 () Bool)

(assert (=> b!754261 (=> (not res!509646) (not e!420659))))

(assert (=> b!754261 (= res!509646 e!420661)))

(declare-fun c!82690 () Bool)

(assert (=> b!754261 (= c!82690 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!754262 () Bool)

(assert (=> b!754262 (= e!420654 e!420659)))

(declare-fun res!509639 () Bool)

(assert (=> b!754262 (=> (not res!509639) (not e!420659))))

(declare-fun lt!335654 () SeekEntryResult!7660)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41893 (_ BitVec 32)) SeekEntryResult!7660)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!754262 (= res!509639 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20060 a!3186) j!159) mask!3328) (select (arr!20060 a!3186) j!159) a!3186 mask!3328) lt!335654))))

(assert (=> b!754262 (= lt!335654 (Intermediate!7660 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!754263 () Bool)

(declare-fun res!509637 () Bool)

(assert (=> b!754263 (=> (not res!509637) (not e!420658))))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!754263 (= res!509637 (validKeyInArray!0 k!2102))))

(declare-fun b!754264 () Bool)

(assert (=> b!754264 (= e!420661 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20060 a!3186) j!159) a!3186 mask!3328) lt!335654))))

(declare-fun b!754265 () Bool)

(declare-fun res!509650 () Bool)

(assert (=> b!754265 (=> (not res!509650) (not e!420654))))

(declare-datatypes ((List!14062 0))(
  ( (Nil!14059) (Cons!14058 (h!15130 (_ BitVec 64)) (t!20377 List!14062)) )
))
(declare-fun arrayNoDuplicates!0 (array!41893 (_ BitVec 32) List!14062) Bool)

(assert (=> b!754265 (= res!509650 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14059))))

(declare-fun b!754266 () Bool)

(declare-fun e!420656 () Bool)

(assert (=> b!754266 (= e!420656 true)))

(declare-fun e!420663 () Bool)

(assert (=> b!754266 e!420663))

(declare-fun res!509636 () Bool)

(assert (=> b!754266 (=> (not res!509636) (not e!420663))))

(declare-fun lt!335655 () (_ BitVec 64))

(assert (=> b!754266 (= res!509636 (= lt!335655 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!335652 () Unit!26020)

(declare-fun e!420664 () Unit!26020)

(assert (=> b!754266 (= lt!335652 e!420664)))

(declare-fun c!82689 () Bool)

(assert (=> b!754266 (= c!82689 (= lt!335655 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!754267 () Bool)

(assert (=> b!754267 (= e!420658 e!420654)))

(declare-fun res!509649 () Bool)

(assert (=> b!754267 (=> (not res!509649) (not e!420654))))

(declare-fun lt!335653 () SeekEntryResult!7660)

(assert (=> b!754267 (= res!509649 (or (= lt!335653 (MissingZero!7660 i!1173)) (= lt!335653 (MissingVacant!7660 i!1173))))))

(assert (=> b!754267 (= lt!335653 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!754268 () Bool)

(assert (=> b!754268 (= e!420655 e!420656)))

(declare-fun res!509640 () Bool)

(assert (=> b!754268 (=> res!509640 e!420656)))

(declare-fun lt!335647 () (_ BitVec 64))

(assert (=> b!754268 (= res!509640 (= lt!335655 lt!335647))))

(assert (=> b!754268 (= lt!335655 (select (store (arr!20060 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!754269 () Bool)

(declare-fun res!509653 () Bool)

(assert (=> b!754269 (=> (not res!509653) (not e!420654))))

(assert (=> b!754269 (= res!509653 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20481 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20481 a!3186))))))

(declare-fun b!754270 () Bool)

(assert (=> b!754270 (= e!420659 e!420657)))

(declare-fun res!509645 () Bool)

(assert (=> b!754270 (=> (not res!509645) (not e!420657))))

(declare-fun lt!335648 () SeekEntryResult!7660)

(assert (=> b!754270 (= res!509645 (= lt!335648 lt!335649))))

(declare-fun lt!335651 () array!41893)

(assert (=> b!754270 (= lt!335649 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!335647 lt!335651 mask!3328))))

(assert (=> b!754270 (= lt!335648 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!335647 mask!3328) lt!335647 lt!335651 mask!3328))))

(assert (=> b!754270 (= lt!335647 (select (store (arr!20060 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!754270 (= lt!335651 (array!41894 (store (arr!20060 a!3186) i!1173 k!2102) (size!20481 a!3186)))))

(declare-fun b!754271 () Bool)

(declare-fun res!509642 () Bool)

(assert (=> b!754271 (=> (not res!509642) (not e!420663))))

(assert (=> b!754271 (= res!509642 (= (seekEntryOrOpen!0 lt!335647 lt!335651 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!335647 lt!335651 mask!3328)))))

(declare-fun b!754272 () Bool)

(declare-fun res!509651 () Bool)

(assert (=> b!754272 (=> (not res!509651) (not e!420658))))

(declare-fun arrayContainsKey!0 (array!41893 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!754272 (= res!509651 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!754273 () Bool)

(declare-fun Unit!26022 () Unit!26020)

(assert (=> b!754273 (= e!420664 Unit!26022)))

(declare-fun b!754274 () Bool)

(declare-fun Unit!26023 () Unit!26020)

(assert (=> b!754274 (= e!420664 Unit!26023)))

(assert (=> b!754274 false))

(declare-fun b!754275 () Bool)

(assert (=> b!754275 (= e!420663 (= lt!335650 lt!335646))))

(assert (= (and start!65720 res!509643) b!754254))

(assert (= (and b!754254 res!509638) b!754257))

(assert (= (and b!754257 res!509648) b!754263))

(assert (= (and b!754263 res!509637) b!754272))

(assert (= (and b!754272 res!509651) b!754267))

(assert (= (and b!754267 res!509649) b!754253))

(assert (= (and b!754253 res!509654) b!754265))

(assert (= (and b!754265 res!509650) b!754269))

(assert (= (and b!754269 res!509653) b!754262))

(assert (= (and b!754262 res!509639) b!754259))

(assert (= (and b!754259 res!509641) b!754261))

(assert (= (and b!754261 c!82690) b!754264))

(assert (= (and b!754261 (not c!82690)) b!754255))

(assert (= (and b!754261 res!509646) b!754270))

(assert (= (and b!754270 res!509645) b!754260))

(assert (= (and b!754260 res!509647) b!754258))

(assert (= (and b!754260 (not res!509652)) b!754256))

(assert (= (and b!754256 (not res!509644)) b!754268))

(assert (= (and b!754268 (not res!509640)) b!754266))

(assert (= (and b!754266 c!82689) b!754274))

(assert (= (and b!754266 (not c!82689)) b!754273))

(assert (= (and b!754266 res!509636) b!754271))

(assert (= (and b!754271 res!509642) b!754275))

(declare-fun m!702747 () Bool)

(assert (=> b!754265 m!702747))

(declare-fun m!702749 () Bool)

(assert (=> b!754256 m!702749))

(assert (=> b!754256 m!702749))

(declare-fun m!702751 () Bool)

(assert (=> b!754256 m!702751))

(declare-fun m!702753 () Bool)

(assert (=> start!65720 m!702753))

(declare-fun m!702755 () Bool)

(assert (=> start!65720 m!702755))

(declare-fun m!702757 () Bool)

(assert (=> b!754268 m!702757))

(declare-fun m!702759 () Bool)

(assert (=> b!754268 m!702759))

(assert (=> b!754260 m!702749))

(assert (=> b!754260 m!702749))

(declare-fun m!702761 () Bool)

(assert (=> b!754260 m!702761))

(declare-fun m!702763 () Bool)

(assert (=> b!754260 m!702763))

(declare-fun m!702765 () Bool)

(assert (=> b!754260 m!702765))

(declare-fun m!702767 () Bool)

(assert (=> b!754271 m!702767))

(declare-fun m!702769 () Bool)

(assert (=> b!754271 m!702769))

(assert (=> b!754258 m!702749))

(assert (=> b!754258 m!702749))

(declare-fun m!702771 () Bool)

(assert (=> b!754258 m!702771))

(assert (=> b!754255 m!702749))

(assert (=> b!754255 m!702749))

(assert (=> b!754255 m!702751))

(assert (=> b!754262 m!702749))

(assert (=> b!754262 m!702749))

(declare-fun m!702773 () Bool)

(assert (=> b!754262 m!702773))

(assert (=> b!754262 m!702773))

(assert (=> b!754262 m!702749))

(declare-fun m!702775 () Bool)

(assert (=> b!754262 m!702775))

(declare-fun m!702777 () Bool)

(assert (=> b!754253 m!702777))

(declare-fun m!702779 () Bool)

(assert (=> b!754259 m!702779))

(declare-fun m!702781 () Bool)

(assert (=> b!754272 m!702781))

(assert (=> b!754264 m!702749))

(assert (=> b!754264 m!702749))

(declare-fun m!702783 () Bool)

(assert (=> b!754264 m!702783))

(declare-fun m!702785 () Bool)

(assert (=> b!754270 m!702785))

(declare-fun m!702787 () Bool)

(assert (=> b!754270 m!702787))

(assert (=> b!754270 m!702785))

(assert (=> b!754270 m!702757))

(declare-fun m!702789 () Bool)

(assert (=> b!754270 m!702789))

(declare-fun m!702791 () Bool)

(assert (=> b!754270 m!702791))

(declare-fun m!702793 () Bool)

(assert (=> b!754267 m!702793))

(declare-fun m!702795 () Bool)

(assert (=> b!754263 m!702795))

(assert (=> b!754257 m!702749))

(assert (=> b!754257 m!702749))

(declare-fun m!702797 () Bool)

(assert (=> b!754257 m!702797))

(push 1)

