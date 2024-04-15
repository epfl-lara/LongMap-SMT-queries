; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66728 () Bool)

(assert start!66728)

(declare-fun b!768646 () Bool)

(declare-datatypes ((Unit!26402 0))(
  ( (Unit!26403) )
))
(declare-fun e!428035 () Unit!26402)

(declare-fun Unit!26404 () Unit!26402)

(assert (=> b!768646 (= e!428035 Unit!26404)))

(declare-datatypes ((array!42309 0))(
  ( (array!42310 (arr!20255 (Array (_ BitVec 32) (_ BitVec 64))) (size!20676 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42309)

(declare-datatypes ((SeekEntryResult!7852 0))(
  ( (MissingZero!7852 (index!33776 (_ BitVec 32))) (Found!7852 (index!33777 (_ BitVec 32))) (Intermediate!7852 (undefined!8664 Bool) (index!33778 (_ BitVec 32)) (x!64722 (_ BitVec 32))) (Undefined!7852) (MissingVacant!7852 (index!33779 (_ BitVec 32))) )
))
(declare-fun lt!341808 () SeekEntryResult!7852)

(declare-fun lt!341813 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun j!159 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42309 (_ BitVec 32)) SeekEntryResult!7852)

(assert (=> b!768646 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341813 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341808)))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun b!768647 () Bool)

(declare-fun e!428029 () Bool)

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42309 (_ BitVec 32)) SeekEntryResult!7852)

(assert (=> b!768647 (= e!428029 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) (Found!7852 j!159)))))

(declare-fun b!768648 () Bool)

(declare-fun res!519808 () Bool)

(declare-fun e!428027 () Bool)

(assert (=> b!768648 (=> (not res!519808) (not e!428027))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!768648 (= res!519808 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20676 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20676 a!3186))))))

(declare-fun b!768649 () Bool)

(declare-fun Unit!26405 () Unit!26402)

(assert (=> b!768649 (= e!428035 Unit!26405)))

(declare-fun lt!341816 () SeekEntryResult!7852)

(assert (=> b!768649 (= lt!341816 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!768649 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1131) lt!341813 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) (Found!7852 j!159))))

(declare-fun b!768650 () Bool)

(declare-fun e!428028 () Bool)

(declare-fun e!428032 () Bool)

(assert (=> b!768650 (= e!428028 e!428032)))

(declare-fun res!519818 () Bool)

(assert (=> b!768650 (=> (not res!519818) (not e!428032))))

(declare-fun lt!341815 () SeekEntryResult!7852)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42309 (_ BitVec 32)) SeekEntryResult!7852)

(assert (=> b!768650 (= res!519818 (= (seekEntryOrOpen!0 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341815))))

(assert (=> b!768650 (= lt!341815 (Found!7852 j!159))))

(declare-fun b!768651 () Bool)

(declare-fun res!519822 () Bool)

(declare-fun e!428034 () Bool)

(assert (=> b!768651 (=> (not res!519822) (not e!428034))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!768651 (= res!519822 (validKeyInArray!0 k0!2102))))

(declare-fun b!768652 () Bool)

(declare-fun res!519810 () Bool)

(declare-fun e!428026 () Bool)

(assert (=> b!768652 (=> (not res!519810) (not e!428026))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!768652 (= res!519810 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20255 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!768653 () Bool)

(assert (=> b!768653 (= e!428027 e!428026)))

(declare-fun res!519814 () Bool)

(assert (=> b!768653 (=> (not res!519814) (not e!428026))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768653 (= res!519814 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20255 a!3186) j!159) mask!3328) (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341808))))

(assert (=> b!768653 (= lt!341808 (Intermediate!7852 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!768654 () Bool)

(declare-fun e!428030 () Bool)

(assert (=> b!768654 (= e!428026 e!428030)))

(declare-fun res!519807 () Bool)

(assert (=> b!768654 (=> (not res!519807) (not e!428030))))

(declare-fun lt!341811 () SeekEntryResult!7852)

(declare-fun lt!341812 () SeekEntryResult!7852)

(assert (=> b!768654 (= res!519807 (= lt!341811 lt!341812))))

(declare-fun lt!341814 () (_ BitVec 64))

(declare-fun lt!341809 () array!42309)

(assert (=> b!768654 (= lt!341812 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!341814 lt!341809 mask!3328))))

(assert (=> b!768654 (= lt!341811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!341814 mask!3328) lt!341814 lt!341809 mask!3328))))

(assert (=> b!768654 (= lt!341814 (select (store (arr!20255 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!768654 (= lt!341809 (array!42310 (store (arr!20255 a!3186) i!1173 k0!2102) (size!20676 a!3186)))))

(declare-fun b!768655 () Bool)

(declare-fun e!428033 () Bool)

(assert (=> b!768655 (= e!428033 true)))

(declare-fun lt!341810 () Unit!26402)

(assert (=> b!768655 (= lt!341810 e!428035)))

(declare-fun c!84816 () Bool)

(assert (=> b!768655 (= c!84816 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!768655 (= lt!341813 (nextIndex!0 index!1321 x!1131 mask!3328))))

(declare-fun b!768656 () Bool)

(assert (=> b!768656 (= e!428032 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341815))))

(declare-fun b!768657 () Bool)

(assert (=> b!768657 (= e!428029 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20255 a!3186) j!159) a!3186 mask!3328) lt!341808))))

(declare-fun res!519811 () Bool)

(assert (=> start!66728 (=> (not res!519811) (not e!428034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66728 (= res!519811 (validMask!0 mask!3328))))

(assert (=> start!66728 e!428034))

(assert (=> start!66728 true))

(declare-fun array_inv!16138 (array!42309) Bool)

(assert (=> start!66728 (array_inv!16138 a!3186)))

(declare-fun b!768658 () Bool)

(assert (=> b!768658 (= e!428030 (not e!428033))))

(declare-fun res!519812 () Bool)

(assert (=> b!768658 (=> res!519812 e!428033)))

(get-info :version)

(assert (=> b!768658 (= res!519812 (or (not ((_ is Intermediate!7852) lt!341812)) (bvsge x!1131 (x!64722 lt!341812))))))

(assert (=> b!768658 e!428028))

(declare-fun res!519809 () Bool)

(assert (=> b!768658 (=> (not res!519809) (not e!428028))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42309 (_ BitVec 32)) Bool)

(assert (=> b!768658 (= res!519809 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-fun lt!341807 () Unit!26402)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42309 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26402)

(assert (=> b!768658 (= lt!341807 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!768659 () Bool)

(declare-fun res!519821 () Bool)

(assert (=> b!768659 (=> (not res!519821) (not e!428034))))

(declare-fun arrayContainsKey!0 (array!42309 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!768659 (= res!519821 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!768660 () Bool)

(declare-fun res!519819 () Bool)

(assert (=> b!768660 (=> (not res!519819) (not e!428027))))

(assert (=> b!768660 (= res!519819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!768661 () Bool)

(declare-fun res!519815 () Bool)

(assert (=> b!768661 (=> (not res!519815) (not e!428034))))

(assert (=> b!768661 (= res!519815 (and (= (size!20676 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20676 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20676 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!768662 () Bool)

(assert (=> b!768662 (= e!428034 e!428027)))

(declare-fun res!519817 () Bool)

(assert (=> b!768662 (=> (not res!519817) (not e!428027))))

(declare-fun lt!341806 () SeekEntryResult!7852)

(assert (=> b!768662 (= res!519817 (or (= lt!341806 (MissingZero!7852 i!1173)) (= lt!341806 (MissingVacant!7852 i!1173))))))

(assert (=> b!768662 (= lt!341806 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!768663 () Bool)

(declare-fun res!519813 () Bool)

(assert (=> b!768663 (=> (not res!519813) (not e!428026))))

(assert (=> b!768663 (= res!519813 e!428029)))

(declare-fun c!84815 () Bool)

(assert (=> b!768663 (= c!84815 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!768664 () Bool)

(declare-fun res!519816 () Bool)

(assert (=> b!768664 (=> (not res!519816) (not e!428034))))

(assert (=> b!768664 (= res!519816 (validKeyInArray!0 (select (arr!20255 a!3186) j!159)))))

(declare-fun b!768665 () Bool)

(declare-fun res!519820 () Bool)

(assert (=> b!768665 (=> (not res!519820) (not e!428027))))

(declare-datatypes ((List!14296 0))(
  ( (Nil!14293) (Cons!14292 (h!15391 (_ BitVec 64)) (t!20602 List!14296)) )
))
(declare-fun arrayNoDuplicates!0 (array!42309 (_ BitVec 32) List!14296) Bool)

(assert (=> b!768665 (= res!519820 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14293))))

(assert (= (and start!66728 res!519811) b!768661))

(assert (= (and b!768661 res!519815) b!768664))

(assert (= (and b!768664 res!519816) b!768651))

(assert (= (and b!768651 res!519822) b!768659))

(assert (= (and b!768659 res!519821) b!768662))

(assert (= (and b!768662 res!519817) b!768660))

(assert (= (and b!768660 res!519819) b!768665))

(assert (= (and b!768665 res!519820) b!768648))

(assert (= (and b!768648 res!519808) b!768653))

(assert (= (and b!768653 res!519814) b!768652))

(assert (= (and b!768652 res!519810) b!768663))

(assert (= (and b!768663 c!84815) b!768657))

(assert (= (and b!768663 (not c!84815)) b!768647))

(assert (= (and b!768663 res!519813) b!768654))

(assert (= (and b!768654 res!519807) b!768658))

(assert (= (and b!768658 res!519809) b!768650))

(assert (= (and b!768650 res!519818) b!768656))

(assert (= (and b!768658 (not res!519812)) b!768655))

(assert (= (and b!768655 c!84816) b!768646))

(assert (= (and b!768655 (not c!84816)) b!768649))

(declare-fun m!713625 () Bool)

(assert (=> b!768665 m!713625))

(declare-fun m!713627 () Bool)

(assert (=> b!768657 m!713627))

(assert (=> b!768657 m!713627))

(declare-fun m!713629 () Bool)

(assert (=> b!768657 m!713629))

(assert (=> b!768653 m!713627))

(assert (=> b!768653 m!713627))

(declare-fun m!713631 () Bool)

(assert (=> b!768653 m!713631))

(assert (=> b!768653 m!713631))

(assert (=> b!768653 m!713627))

(declare-fun m!713633 () Bool)

(assert (=> b!768653 m!713633))

(declare-fun m!713635 () Bool)

(assert (=> b!768652 m!713635))

(assert (=> b!768656 m!713627))

(assert (=> b!768656 m!713627))

(declare-fun m!713637 () Bool)

(assert (=> b!768656 m!713637))

(declare-fun m!713639 () Bool)

(assert (=> b!768662 m!713639))

(assert (=> b!768647 m!713627))

(assert (=> b!768647 m!713627))

(declare-fun m!713641 () Bool)

(assert (=> b!768647 m!713641))

(assert (=> b!768646 m!713627))

(assert (=> b!768646 m!713627))

(declare-fun m!713643 () Bool)

(assert (=> b!768646 m!713643))

(assert (=> b!768649 m!713627))

(assert (=> b!768649 m!713627))

(assert (=> b!768649 m!713641))

(assert (=> b!768649 m!713627))

(declare-fun m!713645 () Bool)

(assert (=> b!768649 m!713645))

(declare-fun m!713647 () Bool)

(assert (=> b!768651 m!713647))

(declare-fun m!713649 () Bool)

(assert (=> start!66728 m!713649))

(declare-fun m!713651 () Bool)

(assert (=> start!66728 m!713651))

(declare-fun m!713653 () Bool)

(assert (=> b!768655 m!713653))

(assert (=> b!768664 m!713627))

(assert (=> b!768664 m!713627))

(declare-fun m!713655 () Bool)

(assert (=> b!768664 m!713655))

(declare-fun m!713657 () Bool)

(assert (=> b!768659 m!713657))

(assert (=> b!768650 m!713627))

(assert (=> b!768650 m!713627))

(declare-fun m!713659 () Bool)

(assert (=> b!768650 m!713659))

(declare-fun m!713661 () Bool)

(assert (=> b!768658 m!713661))

(declare-fun m!713663 () Bool)

(assert (=> b!768658 m!713663))

(declare-fun m!713665 () Bool)

(assert (=> b!768660 m!713665))

(declare-fun m!713667 () Bool)

(assert (=> b!768654 m!713667))

(declare-fun m!713669 () Bool)

(assert (=> b!768654 m!713669))

(declare-fun m!713671 () Bool)

(assert (=> b!768654 m!713671))

(declare-fun m!713673 () Bool)

(assert (=> b!768654 m!713673))

(assert (=> b!768654 m!713669))

(declare-fun m!713675 () Bool)

(assert (=> b!768654 m!713675))

(check-sat (not b!768660) (not b!768664) (not b!768657) (not b!768665) (not b!768653) (not b!768655) (not b!768647) (not start!66728) (not b!768662) (not b!768656) (not b!768651) (not b!768654) (not b!768646) (not b!768659) (not b!768650) (not b!768658) (not b!768649))
(check-sat)
