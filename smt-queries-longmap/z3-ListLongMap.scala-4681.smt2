; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65274 () Bool)

(assert start!65274)

(declare-datatypes ((array!41317 0))(
  ( (array!41318 (arr!19768 (Array (_ BitVec 32) (_ BitVec 64))) (size!20188 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41317)

(declare-fun b!736781 () Bool)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun e!412258 () Bool)

(declare-datatypes ((SeekEntryResult!7324 0))(
  ( (MissingZero!7324 (index!31664 (_ BitVec 32))) (Found!7324 (index!31665 (_ BitVec 32))) (Intermediate!7324 (undefined!8136 Bool) (index!31666 (_ BitVec 32)) (x!62830 (_ BitVec 32))) (Undefined!7324) (MissingVacant!7324 (index!31667 (_ BitVec 32))) )
))
(declare-fun lt!326675 () SeekEntryResult!7324)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41317 (_ BitVec 32)) SeekEntryResult!7324)

(assert (=> b!736781 (= e!412258 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326675))))

(declare-fun b!736782 () Bool)

(declare-fun lt!326676 () (_ BitVec 32))

(declare-fun e!412256 () Bool)

(assert (=> b!736782 (= e!412256 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326676 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326675)))))

(declare-fun b!736784 () Bool)

(declare-datatypes ((Unit!25069 0))(
  ( (Unit!25070) )
))
(declare-fun e!412254 () Unit!25069)

(declare-fun Unit!25071 () Unit!25069)

(assert (=> b!736784 (= e!412254 Unit!25071)))

(assert (=> b!736784 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326676 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326675)))

(declare-fun b!736785 () Bool)

(declare-fun e!412250 () Bool)

(declare-fun e!412253 () Bool)

(assert (=> b!736785 (= e!412250 e!412253)))

(declare-fun res!494945 () Bool)

(assert (=> b!736785 (=> (not res!494945) (not e!412253))))

(declare-fun lt!326680 () SeekEntryResult!7324)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!736785 (= res!494945 (or (= lt!326680 (MissingZero!7324 i!1173)) (= lt!326680 (MissingVacant!7324 i!1173))))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41317 (_ BitVec 32)) SeekEntryResult!7324)

(assert (=> b!736785 (= lt!326680 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!736786 () Bool)

(declare-fun e!412259 () Bool)

(declare-fun e!412251 () Bool)

(assert (=> b!736786 (= e!412259 e!412251)))

(declare-fun res!494939 () Bool)

(assert (=> b!736786 (=> res!494939 e!412251)))

(assert (=> b!736786 (= res!494939 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1131) #b01111111111111111111111111111110) (bvslt (bvadd #b00000000000000000000000000000001 x!1131) #b00000000000000000000000000000000) (bvslt lt!326676 #b00000000000000000000000000000000) (bvsge lt!326676 (size!20188 a!3186))))))

(declare-fun lt!326684 () Unit!25069)

(assert (=> b!736786 (= lt!326684 e!412254)))

(declare-fun c!81309 () Bool)

(declare-fun lt!326687 () Bool)

(assert (=> b!736786 (= c!81309 lt!326687)))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!736786 (= lt!326687 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736786 (= lt!326676 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!736787 () Bool)

(declare-fun res!494936 () Bool)

(assert (=> b!736787 (=> (not res!494936) (not e!412250))))

(assert (=> b!736787 (= res!494936 (and (= (size!20188 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20188 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20188 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!736788 () Bool)

(declare-fun e!412255 () Bool)

(assert (=> b!736788 (= e!412255 (not e!412259))))

(declare-fun res!494943 () Bool)

(assert (=> b!736788 (=> res!494943 e!412259)))

(declare-fun lt!326677 () SeekEntryResult!7324)

(get-info :version)

(assert (=> b!736788 (= res!494943 (or (not ((_ is Intermediate!7324) lt!326677)) (bvsge x!1131 (x!62830 lt!326677))))))

(declare-fun lt!326679 () SeekEntryResult!7324)

(assert (=> b!736788 (= lt!326679 (Found!7324 j!159))))

(declare-fun e!412257 () Bool)

(assert (=> b!736788 e!412257))

(declare-fun res!494932 () Bool)

(assert (=> b!736788 (=> (not res!494932) (not e!412257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41317 (_ BitVec 32)) Bool)

(assert (=> b!736788 (= res!494932 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!326688 () Unit!25069)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41317 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!25069)

(assert (=> b!736788 (= lt!326688 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!736789 () Bool)

(declare-fun Unit!25072 () Unit!25069)

(assert (=> b!736789 (= e!412254 Unit!25072)))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun lt!326683 () SeekEntryResult!7324)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41317 (_ BitVec 32)) SeekEntryResult!7324)

(assert (=> b!736789 (= lt!326683 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!736789 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326676 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326679)))

(declare-fun b!736790 () Bool)

(declare-fun res!494930 () Bool)

(assert (=> b!736790 (=> (not res!494930) (not e!412253))))

(assert (=> b!736790 (= res!494930 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20188 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20188 a!3186))))))

(declare-fun b!736791 () Bool)

(assert (=> b!736791 (= e!412256 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326676 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326679)))))

(declare-fun b!736783 () Bool)

(assert (=> b!736783 (= e!412258 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) (Found!7324 j!159)))))

(declare-fun res!494941 () Bool)

(assert (=> start!65274 (=> (not res!494941) (not e!412250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65274 (= res!494941 (validMask!0 mask!3328))))

(assert (=> start!65274 e!412250))

(assert (=> start!65274 true))

(declare-fun array_inv!15627 (array!41317) Bool)

(assert (=> start!65274 (array_inv!15627 a!3186)))

(declare-fun b!736792 () Bool)

(declare-fun res!494933 () Bool)

(assert (=> b!736792 (=> res!494933 e!412251)))

(assert (=> b!736792 (= res!494933 e!412256)))

(declare-fun c!81310 () Bool)

(assert (=> b!736792 (= c!81310 lt!326687)))

(declare-fun b!736793 () Bool)

(declare-fun res!494940 () Bool)

(assert (=> b!736793 (=> (not res!494940) (not e!412250))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!736793 (= res!494940 (validKeyInArray!0 (select (arr!19768 a!3186) j!159)))))

(declare-fun b!736794 () Bool)

(declare-fun res!494946 () Bool)

(declare-fun e!412249 () Bool)

(assert (=> b!736794 (=> (not res!494946) (not e!412249))))

(assert (=> b!736794 (= res!494946 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19768 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!736795 () Bool)

(assert (=> b!736795 (= e!412251 true)))

(declare-fun lt!326681 () (_ BitVec 64))

(declare-fun lt!326685 () SeekEntryResult!7324)

(declare-fun lt!326678 () array!41317)

(assert (=> b!736795 (= lt!326685 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!326676 lt!326681 lt!326678 mask!3328))))

(declare-fun b!736796 () Bool)

(declare-fun res!494944 () Bool)

(assert (=> b!736796 (=> (not res!494944) (not e!412250))))

(assert (=> b!736796 (= res!494944 (validKeyInArray!0 k0!2102))))

(declare-fun b!736797 () Bool)

(declare-fun res!494934 () Bool)

(assert (=> b!736797 (=> (not res!494934) (not e!412249))))

(assert (=> b!736797 (= res!494934 e!412258)))

(declare-fun c!81311 () Bool)

(assert (=> b!736797 (= c!81311 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!736798 () Bool)

(declare-fun e!412260 () Bool)

(assert (=> b!736798 (= e!412257 e!412260)))

(declare-fun res!494935 () Bool)

(assert (=> b!736798 (=> (not res!494935) (not e!412260))))

(declare-fun lt!326682 () SeekEntryResult!7324)

(assert (=> b!736798 (= res!494935 (= (seekEntryOrOpen!0 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326682))))

(assert (=> b!736798 (= lt!326682 (Found!7324 j!159))))

(declare-fun b!736799 () Bool)

(declare-fun res!494931 () Bool)

(assert (=> b!736799 (=> (not res!494931) (not e!412250))))

(declare-fun arrayContainsKey!0 (array!41317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!736799 (= res!494931 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!736800 () Bool)

(declare-fun res!494937 () Bool)

(assert (=> b!736800 (=> (not res!494937) (not e!412253))))

(declare-datatypes ((List!13677 0))(
  ( (Nil!13674) (Cons!13673 (h!14751 (_ BitVec 64)) (t!19984 List!13677)) )
))
(declare-fun arrayNoDuplicates!0 (array!41317 (_ BitVec 32) List!13677) Bool)

(assert (=> b!736800 (= res!494937 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13674))))

(declare-fun b!736801 () Bool)

(assert (=> b!736801 (= e!412253 e!412249)))

(declare-fun res!494947 () Bool)

(assert (=> b!736801 (=> (not res!494947) (not e!412249))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!736801 (= res!494947 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19768 a!3186) j!159) mask!3328) (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326675))))

(assert (=> b!736801 (= lt!326675 (Intermediate!7324 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!736802 () Bool)

(declare-fun res!494942 () Bool)

(assert (=> b!736802 (=> (not res!494942) (not e!412253))))

(assert (=> b!736802 (= res!494942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!736803 () Bool)

(assert (=> b!736803 (= e!412249 e!412255)))

(declare-fun res!494938 () Bool)

(assert (=> b!736803 (=> (not res!494938) (not e!412255))))

(declare-fun lt!326686 () SeekEntryResult!7324)

(assert (=> b!736803 (= res!494938 (= lt!326686 lt!326677))))

(assert (=> b!736803 (= lt!326677 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!326681 lt!326678 mask!3328))))

(assert (=> b!736803 (= lt!326686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!326681 mask!3328) lt!326681 lt!326678 mask!3328))))

(assert (=> b!736803 (= lt!326681 (select (store (arr!19768 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!736803 (= lt!326678 (array!41318 (store (arr!19768 a!3186) i!1173 k0!2102) (size!20188 a!3186)))))

(declare-fun b!736804 () Bool)

(assert (=> b!736804 (= e!412260 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19768 a!3186) j!159) a!3186 mask!3328) lt!326682))))

(assert (= (and start!65274 res!494941) b!736787))

(assert (= (and b!736787 res!494936) b!736793))

(assert (= (and b!736793 res!494940) b!736796))

(assert (= (and b!736796 res!494944) b!736799))

(assert (= (and b!736799 res!494931) b!736785))

(assert (= (and b!736785 res!494945) b!736802))

(assert (= (and b!736802 res!494942) b!736800))

(assert (= (and b!736800 res!494937) b!736790))

(assert (= (and b!736790 res!494930) b!736801))

(assert (= (and b!736801 res!494947) b!736794))

(assert (= (and b!736794 res!494946) b!736797))

(assert (= (and b!736797 c!81311) b!736781))

(assert (= (and b!736797 (not c!81311)) b!736783))

(assert (= (and b!736797 res!494934) b!736803))

(assert (= (and b!736803 res!494938) b!736788))

(assert (= (and b!736788 res!494932) b!736798))

(assert (= (and b!736798 res!494935) b!736804))

(assert (= (and b!736788 (not res!494943)) b!736786))

(assert (= (and b!736786 c!81309) b!736784))

(assert (= (and b!736786 (not c!81309)) b!736789))

(assert (= (and b!736786 (not res!494939)) b!736792))

(assert (= (and b!736792 c!81310) b!736782))

(assert (= (and b!736792 (not c!81310)) b!736791))

(assert (= (and b!736792 (not res!494933)) b!736795))

(declare-fun m!689427 () Bool)

(assert (=> b!736789 m!689427))

(assert (=> b!736789 m!689427))

(declare-fun m!689429 () Bool)

(assert (=> b!736789 m!689429))

(assert (=> b!736789 m!689427))

(declare-fun m!689431 () Bool)

(assert (=> b!736789 m!689431))

(assert (=> b!736784 m!689427))

(assert (=> b!736784 m!689427))

(declare-fun m!689433 () Bool)

(assert (=> b!736784 m!689433))

(declare-fun m!689435 () Bool)

(assert (=> b!736794 m!689435))

(assert (=> b!736804 m!689427))

(assert (=> b!736804 m!689427))

(declare-fun m!689437 () Bool)

(assert (=> b!736804 m!689437))

(declare-fun m!689439 () Bool)

(assert (=> b!736800 m!689439))

(assert (=> b!736783 m!689427))

(assert (=> b!736783 m!689427))

(assert (=> b!736783 m!689429))

(assert (=> b!736798 m!689427))

(assert (=> b!736798 m!689427))

(declare-fun m!689441 () Bool)

(assert (=> b!736798 m!689441))

(declare-fun m!689443 () Bool)

(assert (=> b!736795 m!689443))

(declare-fun m!689445 () Bool)

(assert (=> b!736786 m!689445))

(declare-fun m!689447 () Bool)

(assert (=> b!736796 m!689447))

(declare-fun m!689449 () Bool)

(assert (=> b!736785 m!689449))

(assert (=> b!736781 m!689427))

(assert (=> b!736781 m!689427))

(declare-fun m!689451 () Bool)

(assert (=> b!736781 m!689451))

(declare-fun m!689453 () Bool)

(assert (=> b!736803 m!689453))

(declare-fun m!689455 () Bool)

(assert (=> b!736803 m!689455))

(declare-fun m!689457 () Bool)

(assert (=> b!736803 m!689457))

(declare-fun m!689459 () Bool)

(assert (=> b!736803 m!689459))

(assert (=> b!736803 m!689453))

(declare-fun m!689461 () Bool)

(assert (=> b!736803 m!689461))

(declare-fun m!689463 () Bool)

(assert (=> b!736802 m!689463))

(declare-fun m!689465 () Bool)

(assert (=> b!736788 m!689465))

(declare-fun m!689467 () Bool)

(assert (=> b!736788 m!689467))

(declare-fun m!689469 () Bool)

(assert (=> start!65274 m!689469))

(declare-fun m!689471 () Bool)

(assert (=> start!65274 m!689471))

(assert (=> b!736793 m!689427))

(assert (=> b!736793 m!689427))

(declare-fun m!689473 () Bool)

(assert (=> b!736793 m!689473))

(assert (=> b!736782 m!689427))

(assert (=> b!736782 m!689427))

(assert (=> b!736782 m!689433))

(assert (=> b!736791 m!689427))

(assert (=> b!736791 m!689427))

(assert (=> b!736791 m!689431))

(assert (=> b!736801 m!689427))

(assert (=> b!736801 m!689427))

(declare-fun m!689475 () Bool)

(assert (=> b!736801 m!689475))

(assert (=> b!736801 m!689475))

(assert (=> b!736801 m!689427))

(declare-fun m!689477 () Bool)

(assert (=> b!736801 m!689477))

(declare-fun m!689479 () Bool)

(assert (=> b!736799 m!689479))

(check-sat (not b!736788) (not b!736785) (not b!736796) (not b!736803) (not b!736793) (not b!736795) (not b!736804) (not b!736789) (not b!736802) (not b!736799) (not start!65274) (not b!736784) (not b!736798) (not b!736781) (not b!736800) (not b!736783) (not b!736801) (not b!736791) (not b!736786) (not b!736782))
(check-sat)
