; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67726 () Bool)

(assert start!67726)

(declare-fun b!785759 () Bool)

(declare-datatypes ((Unit!27172 0))(
  ( (Unit!27173) )
))
(declare-fun e!436821 () Unit!27172)

(declare-fun Unit!27174 () Unit!27172)

(assert (=> b!785759 (= e!436821 Unit!27174)))

(declare-fun b!785760 () Bool)

(declare-fun e!436829 () Bool)

(assert (=> b!785760 (= e!436829 true)))

(declare-fun e!436822 () Bool)

(assert (=> b!785760 e!436822))

(declare-fun res!531927 () Bool)

(assert (=> b!785760 (=> (not res!531927) (not e!436822))))

(declare-fun lt!350376 () (_ BitVec 64))

(assert (=> b!785760 (= res!531927 (= lt!350376 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!350377 () Unit!27172)

(assert (=> b!785760 (= lt!350377 e!436821)))

(declare-fun c!87325 () Bool)

(assert (=> b!785760 (= c!87325 (= lt!350376 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!785761 () Bool)

(declare-fun res!531933 () Bool)

(assert (=> b!785761 (=> (not res!531933) (not e!436822))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun index!1321 () (_ BitVec 32))

(declare-datatypes ((array!42766 0))(
  ( (array!42767 (arr!20471 (Array (_ BitVec 32) (_ BitVec 64))) (size!20892 (_ BitVec 32))) )
))
(declare-fun lt!350381 () array!42766)

(declare-fun lt!350379 () (_ BitVec 64))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!8071 0))(
  ( (MissingZero!8071 (index!34652 (_ BitVec 32))) (Found!8071 (index!34653 (_ BitVec 32))) (Intermediate!8071 (undefined!8883 Bool) (index!34654 (_ BitVec 32)) (x!65595 (_ BitVec 32))) (Undefined!8071) (MissingVacant!8071 (index!34655 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42766 (_ BitVec 32)) SeekEntryResult!8071)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42766 (_ BitVec 32)) SeekEntryResult!8071)

(assert (=> b!785761 (= res!531933 (= (seekEntryOrOpen!0 lt!350379 lt!350381 mask!3328) (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 index!1321 lt!350379 lt!350381 mask!3328)))))

(declare-fun b!785762 () Bool)

(declare-fun e!436823 () Bool)

(declare-fun e!436831 () Bool)

(assert (=> b!785762 (= e!436823 e!436831)))

(declare-fun res!531939 () Bool)

(assert (=> b!785762 (=> res!531939 e!436831)))

(declare-fun lt!350384 () SeekEntryResult!8071)

(declare-fun lt!350374 () SeekEntryResult!8071)

(assert (=> b!785762 (= res!531939 (not (= lt!350384 lt!350374)))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun a!3186 () array!42766)

(declare-fun j!159 () (_ BitVec 32))

(assert (=> b!785762 (= lt!350384 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20471 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!785763 () Bool)

(declare-fun res!531932 () Bool)

(declare-fun e!436830 () Bool)

(assert (=> b!785763 (=> (not res!531932) (not e!436830))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42766 (_ BitVec 32)) Bool)

(assert (=> b!785763 (= res!531932 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!785764 () Bool)

(declare-fun res!531943 () Bool)

(declare-fun e!436828 () Bool)

(assert (=> b!785764 (=> (not res!531943) (not e!436828))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!42766 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!785764 (= res!531943 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!785765 () Bool)

(declare-fun Unit!27175 () Unit!27172)

(assert (=> b!785765 (= e!436821 Unit!27175)))

(assert (=> b!785765 false))

(declare-fun b!785766 () Bool)

(declare-fun e!436832 () Bool)

(assert (=> b!785766 (= e!436830 e!436832)))

(declare-fun res!531929 () Bool)

(assert (=> b!785766 (=> (not res!531929) (not e!436832))))

(declare-fun lt!350382 () SeekEntryResult!8071)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42766 (_ BitVec 32)) SeekEntryResult!8071)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!785766 (= res!531929 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20471 a!3186) j!159) mask!3328) (select (arr!20471 a!3186) j!159) a!3186 mask!3328) lt!350382))))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!785766 (= lt!350382 (Intermediate!8071 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!785767 () Bool)

(declare-fun res!531930 () Bool)

(assert (=> b!785767 (=> (not res!531930) (not e!436832))))

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!785767 (= res!531930 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20471 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!785768 () Bool)

(declare-fun res!531928 () Bool)

(assert (=> b!785768 (=> (not res!531928) (not e!436828))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!785768 (= res!531928 (validKeyInArray!0 k!2102))))

(declare-fun e!436827 () Bool)

(declare-fun b!785769 () Bool)

(assert (=> b!785769 (= e!436827 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20471 a!3186) j!159) a!3186 mask!3328) lt!350382))))

(declare-fun res!531941 () Bool)

(assert (=> start!67726 (=> (not res!531941) (not e!436828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67726 (= res!531941 (validMask!0 mask!3328))))

(assert (=> start!67726 e!436828))

(assert (=> start!67726 true))

(declare-fun array_inv!16267 (array!42766) Bool)

(assert (=> start!67726 (array_inv!16267 a!3186)))

(declare-fun b!785770 () Bool)

(declare-fun res!531926 () Bool)

(assert (=> b!785770 (=> (not res!531926) (not e!436832))))

(assert (=> b!785770 (= res!531926 e!436827)))

(declare-fun c!87324 () Bool)

(assert (=> b!785770 (= c!87324 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!785771 () Bool)

(assert (=> b!785771 (= e!436828 e!436830)))

(declare-fun res!531937 () Bool)

(assert (=> b!785771 (=> (not res!531937) (not e!436830))))

(declare-fun lt!350383 () SeekEntryResult!8071)

(assert (=> b!785771 (= res!531937 (or (= lt!350383 (MissingZero!8071 i!1173)) (= lt!350383 (MissingVacant!8071 i!1173))))))

(assert (=> b!785771 (= lt!350383 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!785772 () Bool)

(declare-fun e!436825 () Bool)

(assert (=> b!785772 (= e!436825 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20471 a!3186) j!159) a!3186 mask!3328) lt!350374))))

(declare-fun b!785773 () Bool)

(declare-fun e!436826 () Bool)

(assert (=> b!785773 (= e!436826 (not e!436823))))

(declare-fun res!531935 () Bool)

(assert (=> b!785773 (=> res!531935 e!436823)))

(declare-fun lt!350373 () SeekEntryResult!8071)

(assert (=> b!785773 (= res!531935 (or (not (is-Intermediate!8071 lt!350373)) (bvslt x!1131 (x!65595 lt!350373)) (not (= x!1131 (x!65595 lt!350373))) (not (= index!1321 (index!34654 lt!350373)))))))

(assert (=> b!785773 e!436825))

(declare-fun res!531936 () Bool)

(assert (=> b!785773 (=> (not res!531936) (not e!436825))))

(declare-fun lt!350380 () SeekEntryResult!8071)

(assert (=> b!785773 (= res!531936 (= lt!350380 lt!350374))))

(assert (=> b!785773 (= lt!350374 (Found!8071 j!159))))

(assert (=> b!785773 (= lt!350380 (seekEntryOrOpen!0 (select (arr!20471 a!3186) j!159) a!3186 mask!3328))))

(assert (=> b!785773 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328)))

(declare-fun lt!350375 () Unit!27172)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27172)

(assert (=> b!785773 (= lt!350375 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!785774 () Bool)

(assert (=> b!785774 (= e!436832 e!436826)))

(declare-fun res!531931 () Bool)

(assert (=> b!785774 (=> (not res!531931) (not e!436826))))

(declare-fun lt!350378 () SeekEntryResult!8071)

(assert (=> b!785774 (= res!531931 (= lt!350378 lt!350373))))

(assert (=> b!785774 (= lt!350373 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!350379 lt!350381 mask!3328))))

(assert (=> b!785774 (= lt!350378 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!350379 mask!3328) lt!350379 lt!350381 mask!3328))))

(assert (=> b!785774 (= lt!350379 (select (store (arr!20471 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!785774 (= lt!350381 (array!42767 (store (arr!20471 a!3186) i!1173 k!2102) (size!20892 a!3186)))))

(declare-fun b!785775 () Bool)

(declare-fun res!531940 () Bool)

(assert (=> b!785775 (=> (not res!531940) (not e!436828))))

(assert (=> b!785775 (= res!531940 (and (= (size!20892 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20892 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20892 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!785776 () Bool)

(assert (=> b!785776 (= e!436822 (= lt!350380 lt!350384))))

(declare-fun b!785777 () Bool)

(declare-fun res!531944 () Bool)

(assert (=> b!785777 (=> (not res!531944) (not e!436830))))

(declare-datatypes ((List!14473 0))(
  ( (Nil!14470) (Cons!14469 (h!15592 (_ BitVec 64)) (t!20788 List!14473)) )
))
(declare-fun arrayNoDuplicates!0 (array!42766 (_ BitVec 32) List!14473) Bool)

(assert (=> b!785777 (= res!531944 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14470))))

(declare-fun b!785778 () Bool)

(declare-fun res!531942 () Bool)

(assert (=> b!785778 (=> (not res!531942) (not e!436828))))

(assert (=> b!785778 (= res!531942 (validKeyInArray!0 (select (arr!20471 a!3186) j!159)))))

(declare-fun b!785779 () Bool)

(assert (=> b!785779 (= e!436831 e!436829)))

(declare-fun res!531938 () Bool)

(assert (=> b!785779 (=> res!531938 e!436829)))

(assert (=> b!785779 (= res!531938 (= lt!350376 lt!350379))))

(assert (=> b!785779 (= lt!350376 (select (store (arr!20471 a!3186) i!1173 k!2102) index!1321))))

(declare-fun b!785780 () Bool)

(assert (=> b!785780 (= e!436827 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20471 a!3186) j!159) a!3186 mask!3328) (Found!8071 j!159)))))

(declare-fun b!785781 () Bool)

(declare-fun res!531934 () Bool)

(assert (=> b!785781 (=> (not res!531934) (not e!436830))))

(assert (=> b!785781 (= res!531934 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20892 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20892 a!3186))))))

(assert (= (and start!67726 res!531941) b!785775))

(assert (= (and b!785775 res!531940) b!785778))

(assert (= (and b!785778 res!531942) b!785768))

(assert (= (and b!785768 res!531928) b!785764))

(assert (= (and b!785764 res!531943) b!785771))

(assert (= (and b!785771 res!531937) b!785763))

(assert (= (and b!785763 res!531932) b!785777))

(assert (= (and b!785777 res!531944) b!785781))

(assert (= (and b!785781 res!531934) b!785766))

(assert (= (and b!785766 res!531929) b!785767))

(assert (= (and b!785767 res!531930) b!785770))

(assert (= (and b!785770 c!87324) b!785769))

(assert (= (and b!785770 (not c!87324)) b!785780))

(assert (= (and b!785770 res!531926) b!785774))

(assert (= (and b!785774 res!531931) b!785773))

(assert (= (and b!785773 res!531936) b!785772))

(assert (= (and b!785773 (not res!531935)) b!785762))

(assert (= (and b!785762 (not res!531939)) b!785779))

(assert (= (and b!785779 (not res!531938)) b!785760))

(assert (= (and b!785760 c!87325) b!785765))

(assert (= (and b!785760 (not c!87325)) b!785759))

(assert (= (and b!785760 res!531927) b!785761))

(assert (= (and b!785761 res!531933) b!785776))

(declare-fun m!727753 () Bool)

(assert (=> b!785773 m!727753))

(assert (=> b!785773 m!727753))

(declare-fun m!727755 () Bool)

(assert (=> b!785773 m!727755))

(declare-fun m!727757 () Bool)

(assert (=> b!785773 m!727757))

(declare-fun m!727759 () Bool)

(assert (=> b!785773 m!727759))

(assert (=> b!785766 m!727753))

(assert (=> b!785766 m!727753))

(declare-fun m!727761 () Bool)

(assert (=> b!785766 m!727761))

(assert (=> b!785766 m!727761))

(assert (=> b!785766 m!727753))

(declare-fun m!727763 () Bool)

(assert (=> b!785766 m!727763))

(declare-fun m!727765 () Bool)

(assert (=> b!785764 m!727765))

(assert (=> b!785778 m!727753))

(assert (=> b!785778 m!727753))

(declare-fun m!727767 () Bool)

(assert (=> b!785778 m!727767))

(assert (=> b!785780 m!727753))

(assert (=> b!785780 m!727753))

(declare-fun m!727769 () Bool)

(assert (=> b!785780 m!727769))

(declare-fun m!727771 () Bool)

(assert (=> b!785768 m!727771))

(declare-fun m!727773 () Bool)

(assert (=> start!67726 m!727773))

(declare-fun m!727775 () Bool)

(assert (=> start!67726 m!727775))

(declare-fun m!727777 () Bool)

(assert (=> b!785767 m!727777))

(declare-fun m!727779 () Bool)

(assert (=> b!785761 m!727779))

(declare-fun m!727781 () Bool)

(assert (=> b!785761 m!727781))

(assert (=> b!785762 m!727753))

(assert (=> b!785762 m!727753))

(assert (=> b!785762 m!727769))

(declare-fun m!727783 () Bool)

(assert (=> b!785763 m!727783))

(declare-fun m!727785 () Bool)

(assert (=> b!785779 m!727785))

(declare-fun m!727787 () Bool)

(assert (=> b!785779 m!727787))

(assert (=> b!785769 m!727753))

(assert (=> b!785769 m!727753))

(declare-fun m!727789 () Bool)

(assert (=> b!785769 m!727789))

(assert (=> b!785772 m!727753))

(assert (=> b!785772 m!727753))

(declare-fun m!727791 () Bool)

(assert (=> b!785772 m!727791))

(declare-fun m!727793 () Bool)

(assert (=> b!785771 m!727793))

(declare-fun m!727795 () Bool)

(assert (=> b!785777 m!727795))

(declare-fun m!727797 () Bool)

(assert (=> b!785774 m!727797))

(declare-fun m!727799 () Bool)

(assert (=> b!785774 m!727799))

(declare-fun m!727801 () Bool)

(assert (=> b!785774 m!727801))

(assert (=> b!785774 m!727785))

(declare-fun m!727803 () Bool)

(assert (=> b!785774 m!727803))

(assert (=> b!785774 m!727797))

(push 1)

