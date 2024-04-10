; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!86818 () Bool)

(assert start!86818)

(declare-fun b!1006776 () Bool)

(declare-fun res!675876 () Bool)

(declare-fun e!566639 () Bool)

(assert (=> b!1006776 (=> (not res!675876) (not e!566639))))

(declare-datatypes ((array!63517 0))(
  ( (array!63518 (arr!30581 (Array (_ BitVec 32) (_ BitVec 64))) (size!31083 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63517)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63517 (_ BitVec 32)) Bool)

(assert (=> b!1006776 (= res!675876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1006777 () Bool)

(declare-fun res!675866 () Bool)

(assert (=> b!1006777 (=> (not res!675866) (not e!566639))))

(declare-datatypes ((List!21257 0))(
  ( (Nil!21254) (Cons!21253 (h!22436 (_ BitVec 64)) (t!30258 List!21257)) )
))
(declare-fun arrayNoDuplicates!0 (array!63517 (_ BitVec 32) List!21257) Bool)

(assert (=> b!1006777 (= res!675866 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21254))))

(declare-fun b!1006778 () Bool)

(declare-fun e!566641 () Bool)

(declare-fun e!566640 () Bool)

(assert (=> b!1006778 (= e!566641 e!566640)))

(declare-fun res!675864 () Bool)

(assert (=> b!1006778 (=> (not res!675864) (not e!566640))))

(declare-datatypes ((SeekEntryResult!9513 0))(
  ( (MissingZero!9513 (index!40423 (_ BitVec 32))) (Found!9513 (index!40424 (_ BitVec 32))) (Intermediate!9513 (undefined!10325 Bool) (index!40425 (_ BitVec 32)) (x!87817 (_ BitVec 32))) (Undefined!9513) (MissingVacant!9513 (index!40426 (_ BitVec 32))) )
))
(declare-fun lt!444916 () SeekEntryResult!9513)

(declare-fun lt!444917 () SeekEntryResult!9513)

(assert (=> b!1006778 (= res!675864 (= lt!444916 lt!444917))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63517 (_ BitVec 32)) SeekEntryResult!9513)

(assert (=> b!1006778 (= lt!444916 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30581 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006779 () Bool)

(assert (=> b!1006779 (= e!566639 e!566641)))

(declare-fun res!675873 () Bool)

(assert (=> b!1006779 (=> (not res!675873) (not e!566641))))

(declare-fun lt!444912 () SeekEntryResult!9513)

(assert (=> b!1006779 (= res!675873 (= lt!444912 lt!444917))))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1006779 (= lt!444917 (Intermediate!9513 false resIndex!38 resX!38))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006779 (= lt!444912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30581 a!3219) j!170) mask!3464) (select (arr!30581 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006780 () Bool)

(declare-fun res!675869 () Bool)

(declare-fun e!566636 () Bool)

(assert (=> b!1006780 (=> (not res!675869) (not e!566636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1006780 (= res!675869 (validKeyInArray!0 (select (arr!30581 a!3219) j!170)))))

(declare-fun b!1006781 () Bool)

(declare-fun res!675865 () Bool)

(assert (=> b!1006781 (=> (not res!675865) (not e!566639))))

(assert (=> b!1006781 (= res!675865 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31083 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31083 a!3219))))))

(declare-fun e!566638 () Bool)

(declare-fun i!1194 () (_ BitVec 32))

(declare-fun b!1006782 () Bool)

(assert (=> b!1006782 (= e!566638 (and (= index!1507 resIndex!38) (= x!1245 resX!38) (not (= resIndex!38 i!1194))))))

(declare-fun b!1006783 () Bool)

(assert (=> b!1006783 (= e!566636 e!566639)))

(declare-fun res!675875 () Bool)

(assert (=> b!1006783 (=> (not res!675875) (not e!566639))))

(declare-fun lt!444914 () SeekEntryResult!9513)

(assert (=> b!1006783 (= res!675875 (or (= lt!444914 (MissingVacant!9513 i!1194)) (= lt!444914 (MissingZero!9513 i!1194))))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63517 (_ BitVec 32)) SeekEntryResult!9513)

(assert (=> b!1006783 (= lt!444914 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!1006784 () Bool)

(declare-fun res!675867 () Bool)

(assert (=> b!1006784 (=> (not res!675867) (not e!566636))))

(assert (=> b!1006784 (= res!675867 (validKeyInArray!0 k0!2224))))

(declare-fun res!675874 () Bool)

(assert (=> start!86818 (=> (not res!675874) (not e!566636))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86818 (= res!675874 (validMask!0 mask!3464))))

(assert (=> start!86818 e!566636))

(declare-fun array_inv!23705 (array!63517) Bool)

(assert (=> start!86818 (array_inv!23705 a!3219)))

(assert (=> start!86818 true))

(declare-fun b!1006785 () Bool)

(assert (=> b!1006785 (= e!566640 e!566638)))

(declare-fun res!675872 () Bool)

(assert (=> b!1006785 (=> (not res!675872) (not e!566638))))

(declare-fun lt!444915 () (_ BitVec 64))

(declare-fun lt!444913 () array!63517)

(assert (=> b!1006785 (= res!675872 (not (= lt!444912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444915 mask!3464) lt!444915 lt!444913 mask!3464))))))

(assert (=> b!1006785 (= lt!444915 (select (store (arr!30581 a!3219) i!1194 k0!2224) j!170))))

(assert (=> b!1006785 (= lt!444913 (array!63518 (store (arr!30581 a!3219) i!1194 k0!2224) (size!31083 a!3219)))))

(declare-fun b!1006786 () Bool)

(declare-fun res!675870 () Bool)

(assert (=> b!1006786 (=> (not res!675870) (not e!566636))))

(assert (=> b!1006786 (= res!675870 (and (= (size!31083 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31083 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31083 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1006787 () Bool)

(declare-fun res!675871 () Bool)

(assert (=> b!1006787 (=> (not res!675871) (not e!566638))))

(assert (=> b!1006787 (= res!675871 (not (= lt!444916 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444915 lt!444913 mask!3464))))))

(declare-fun b!1006788 () Bool)

(declare-fun res!675868 () Bool)

(assert (=> b!1006788 (=> (not res!675868) (not e!566636))))

(declare-fun arrayContainsKey!0 (array!63517 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1006788 (= res!675868 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(assert (= (and start!86818 res!675874) b!1006786))

(assert (= (and b!1006786 res!675870) b!1006780))

(assert (= (and b!1006780 res!675869) b!1006784))

(assert (= (and b!1006784 res!675867) b!1006788))

(assert (= (and b!1006788 res!675868) b!1006783))

(assert (= (and b!1006783 res!675875) b!1006776))

(assert (= (and b!1006776 res!675876) b!1006777))

(assert (= (and b!1006777 res!675866) b!1006781))

(assert (= (and b!1006781 res!675865) b!1006779))

(assert (= (and b!1006779 res!675873) b!1006778))

(assert (= (and b!1006778 res!675864) b!1006785))

(assert (= (and b!1006785 res!675872) b!1006787))

(assert (= (and b!1006787 res!675871) b!1006782))

(declare-fun m!931845 () Bool)

(assert (=> b!1006785 m!931845))

(assert (=> b!1006785 m!931845))

(declare-fun m!931847 () Bool)

(assert (=> b!1006785 m!931847))

(declare-fun m!931849 () Bool)

(assert (=> b!1006785 m!931849))

(declare-fun m!931851 () Bool)

(assert (=> b!1006785 m!931851))

(declare-fun m!931853 () Bool)

(assert (=> b!1006788 m!931853))

(declare-fun m!931855 () Bool)

(assert (=> b!1006777 m!931855))

(declare-fun m!931857 () Bool)

(assert (=> b!1006779 m!931857))

(assert (=> b!1006779 m!931857))

(declare-fun m!931859 () Bool)

(assert (=> b!1006779 m!931859))

(assert (=> b!1006779 m!931859))

(assert (=> b!1006779 m!931857))

(declare-fun m!931861 () Bool)

(assert (=> b!1006779 m!931861))

(declare-fun m!931863 () Bool)

(assert (=> b!1006787 m!931863))

(declare-fun m!931865 () Bool)

(assert (=> b!1006783 m!931865))

(declare-fun m!931867 () Bool)

(assert (=> b!1006784 m!931867))

(assert (=> b!1006778 m!931857))

(assert (=> b!1006778 m!931857))

(declare-fun m!931869 () Bool)

(assert (=> b!1006778 m!931869))

(declare-fun m!931871 () Bool)

(assert (=> start!86818 m!931871))

(declare-fun m!931873 () Bool)

(assert (=> start!86818 m!931873))

(assert (=> b!1006780 m!931857))

(assert (=> b!1006780 m!931857))

(declare-fun m!931875 () Bool)

(assert (=> b!1006780 m!931875))

(declare-fun m!931877 () Bool)

(assert (=> b!1006776 m!931877))

(check-sat (not b!1006776) (not b!1006784) (not b!1006777) (not start!86818) (not b!1006780) (not b!1006778) (not b!1006787) (not b!1006788) (not b!1006779) (not b!1006785) (not b!1006783))
(check-sat)
(get-model)

(declare-fun d!119609 () Bool)

(assert (=> d!119609 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86818 d!119609))

(declare-fun d!119611 () Bool)

(assert (=> d!119611 (= (array_inv!23705 a!3219) (bvsge (size!31083 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86818 d!119611))

(declare-fun d!119613 () Bool)

(declare-fun e!566670 () Bool)

(assert (=> d!119613 e!566670))

(declare-fun c!101614 () Bool)

(declare-fun lt!444941 () SeekEntryResult!9513)

(get-info :version)

(assert (=> d!119613 (= c!101614 (and ((_ is Intermediate!9513) lt!444941) (undefined!10325 lt!444941)))))

(declare-fun e!566672 () SeekEntryResult!9513)

(assert (=> d!119613 (= lt!444941 e!566672)))

(declare-fun c!101615 () Bool)

(assert (=> d!119613 (= c!101615 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444940 () (_ BitVec 64))

(assert (=> d!119613 (= lt!444940 (select (arr!30581 lt!444913) (toIndex!0 lt!444915 mask!3464)))))

(assert (=> d!119613 (validMask!0 mask!3464)))

(assert (=> d!119613 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!444915 mask!3464) lt!444915 lt!444913 mask!3464) lt!444941)))

(declare-fun b!1006846 () Bool)

(assert (=> b!1006846 (and (bvsge (index!40425 lt!444941) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444941) (size!31083 lt!444913)))))

(declare-fun res!675923 () Bool)

(assert (=> b!1006846 (= res!675923 (= (select (arr!30581 lt!444913) (index!40425 lt!444941)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566671 () Bool)

(assert (=> b!1006846 (=> res!675923 e!566671)))

(declare-fun b!1006847 () Bool)

(assert (=> b!1006847 (and (bvsge (index!40425 lt!444941) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444941) (size!31083 lt!444913)))))

(declare-fun res!675922 () Bool)

(assert (=> b!1006847 (= res!675922 (= (select (arr!30581 lt!444913) (index!40425 lt!444941)) lt!444915))))

(assert (=> b!1006847 (=> res!675922 e!566671)))

(declare-fun e!566674 () Bool)

(assert (=> b!1006847 (= e!566674 e!566671)))

(declare-fun b!1006848 () Bool)

(declare-fun e!566673 () SeekEntryResult!9513)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1006848 (= e!566673 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!444915 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!444915 lt!444913 mask!3464))))

(declare-fun b!1006849 () Bool)

(assert (=> b!1006849 (= e!566672 (Intermediate!9513 true (toIndex!0 lt!444915 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006850 () Bool)

(assert (=> b!1006850 (and (bvsge (index!40425 lt!444941) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444941) (size!31083 lt!444913)))))

(assert (=> b!1006850 (= e!566671 (= (select (arr!30581 lt!444913) (index!40425 lt!444941)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006851 () Bool)

(assert (=> b!1006851 (= e!566673 (Intermediate!9513 false (toIndex!0 lt!444915 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006852 () Bool)

(assert (=> b!1006852 (= e!566672 e!566673)))

(declare-fun c!101613 () Bool)

(assert (=> b!1006852 (= c!101613 (or (= lt!444940 lt!444915) (= (bvadd lt!444940 lt!444940) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006853 () Bool)

(assert (=> b!1006853 (= e!566670 (bvsge (x!87817 lt!444941) #b01111111111111111111111111111110))))

(declare-fun b!1006854 () Bool)

(assert (=> b!1006854 (= e!566670 e!566674)))

(declare-fun res!675924 () Bool)

(assert (=> b!1006854 (= res!675924 (and ((_ is Intermediate!9513) lt!444941) (not (undefined!10325 lt!444941)) (bvslt (x!87817 lt!444941) #b01111111111111111111111111111110) (bvsge (x!87817 lt!444941) #b00000000000000000000000000000000) (bvsge (x!87817 lt!444941) #b00000000000000000000000000000000)))))

(assert (=> b!1006854 (=> (not res!675924) (not e!566674))))

(assert (= (and d!119613 c!101615) b!1006849))

(assert (= (and d!119613 (not c!101615)) b!1006852))

(assert (= (and b!1006852 c!101613) b!1006851))

(assert (= (and b!1006852 (not c!101613)) b!1006848))

(assert (= (and d!119613 c!101614) b!1006853))

(assert (= (and d!119613 (not c!101614)) b!1006854))

(assert (= (and b!1006854 res!675924) b!1006847))

(assert (= (and b!1006847 (not res!675922)) b!1006846))

(assert (= (and b!1006846 (not res!675923)) b!1006850))

(assert (=> d!119613 m!931845))

(declare-fun m!931913 () Bool)

(assert (=> d!119613 m!931913))

(assert (=> d!119613 m!931871))

(declare-fun m!931915 () Bool)

(assert (=> b!1006846 m!931915))

(assert (=> b!1006848 m!931845))

(declare-fun m!931917 () Bool)

(assert (=> b!1006848 m!931917))

(assert (=> b!1006848 m!931917))

(declare-fun m!931919 () Bool)

(assert (=> b!1006848 m!931919))

(assert (=> b!1006847 m!931915))

(assert (=> b!1006850 m!931915))

(assert (=> b!1006785 d!119613))

(declare-fun d!119617 () Bool)

(declare-fun lt!444947 () (_ BitVec 32))

(declare-fun lt!444946 () (_ BitVec 32))

(assert (=> d!119617 (= lt!444947 (bvmul (bvxor lt!444946 (bvlshr lt!444946 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119617 (= lt!444946 ((_ extract 31 0) (bvand (bvxor lt!444915 (bvlshr lt!444915 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119617 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!675925 (let ((h!22438 ((_ extract 31 0) (bvand (bvxor lt!444915 (bvlshr lt!444915 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87820 (bvmul (bvxor h!22438 (bvlshr h!22438 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87820 (bvlshr x!87820 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!675925 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!675925 #b00000000000000000000000000000000))))))

(assert (=> d!119617 (= (toIndex!0 lt!444915 mask!3464) (bvand (bvxor lt!444947 (bvlshr lt!444947 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006785 d!119617))

(declare-fun d!119621 () Bool)

(assert (=> d!119621 (= (validKeyInArray!0 (select (arr!30581 a!3219) j!170)) (and (not (= (select (arr!30581 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30581 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006780 d!119621))

(declare-fun d!119623 () Bool)

(declare-fun e!566675 () Bool)

(assert (=> d!119623 e!566675))

(declare-fun c!101617 () Bool)

(declare-fun lt!444949 () SeekEntryResult!9513)

(assert (=> d!119623 (= c!101617 (and ((_ is Intermediate!9513) lt!444949) (undefined!10325 lt!444949)))))

(declare-fun e!566677 () SeekEntryResult!9513)

(assert (=> d!119623 (= lt!444949 e!566677)))

(declare-fun c!101618 () Bool)

(assert (=> d!119623 (= c!101618 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!444948 () (_ BitVec 64))

(assert (=> d!119623 (= lt!444948 (select (arr!30581 a!3219) (toIndex!0 (select (arr!30581 a!3219) j!170) mask!3464)))))

(assert (=> d!119623 (validMask!0 mask!3464)))

(assert (=> d!119623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30581 a!3219) j!170) mask!3464) (select (arr!30581 a!3219) j!170) a!3219 mask!3464) lt!444949)))

(declare-fun b!1006855 () Bool)

(assert (=> b!1006855 (and (bvsge (index!40425 lt!444949) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444949) (size!31083 a!3219)))))

(declare-fun res!675927 () Bool)

(assert (=> b!1006855 (= res!675927 (= (select (arr!30581 a!3219) (index!40425 lt!444949)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566676 () Bool)

(assert (=> b!1006855 (=> res!675927 e!566676)))

(declare-fun b!1006856 () Bool)

(assert (=> b!1006856 (and (bvsge (index!40425 lt!444949) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444949) (size!31083 a!3219)))))

(declare-fun res!675926 () Bool)

(assert (=> b!1006856 (= res!675926 (= (select (arr!30581 a!3219) (index!40425 lt!444949)) (select (arr!30581 a!3219) j!170)))))

(assert (=> b!1006856 (=> res!675926 e!566676)))

(declare-fun e!566679 () Bool)

(assert (=> b!1006856 (= e!566679 e!566676)))

(declare-fun e!566678 () SeekEntryResult!9513)

(declare-fun b!1006857 () Bool)

(assert (=> b!1006857 (= e!566678 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30581 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30581 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006858 () Bool)

(assert (=> b!1006858 (= e!566677 (Intermediate!9513 true (toIndex!0 (select (arr!30581 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006859 () Bool)

(assert (=> b!1006859 (and (bvsge (index!40425 lt!444949) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444949) (size!31083 a!3219)))))

(assert (=> b!1006859 (= e!566676 (= (select (arr!30581 a!3219) (index!40425 lt!444949)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006860 () Bool)

(assert (=> b!1006860 (= e!566678 (Intermediate!9513 false (toIndex!0 (select (arr!30581 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1006861 () Bool)

(assert (=> b!1006861 (= e!566677 e!566678)))

(declare-fun c!101616 () Bool)

(assert (=> b!1006861 (= c!101616 (or (= lt!444948 (select (arr!30581 a!3219) j!170)) (= (bvadd lt!444948 lt!444948) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006862 () Bool)

(assert (=> b!1006862 (= e!566675 (bvsge (x!87817 lt!444949) #b01111111111111111111111111111110))))

(declare-fun b!1006863 () Bool)

(assert (=> b!1006863 (= e!566675 e!566679)))

(declare-fun res!675928 () Bool)

(assert (=> b!1006863 (= res!675928 (and ((_ is Intermediate!9513) lt!444949) (not (undefined!10325 lt!444949)) (bvslt (x!87817 lt!444949) #b01111111111111111111111111111110) (bvsge (x!87817 lt!444949) #b00000000000000000000000000000000) (bvsge (x!87817 lt!444949) #b00000000000000000000000000000000)))))

(assert (=> b!1006863 (=> (not res!675928) (not e!566679))))

(assert (= (and d!119623 c!101618) b!1006858))

(assert (= (and d!119623 (not c!101618)) b!1006861))

(assert (= (and b!1006861 c!101616) b!1006860))

(assert (= (and b!1006861 (not c!101616)) b!1006857))

(assert (= (and d!119623 c!101617) b!1006862))

(assert (= (and d!119623 (not c!101617)) b!1006863))

(assert (= (and b!1006863 res!675928) b!1006856))

(assert (= (and b!1006856 (not res!675926)) b!1006855))

(assert (= (and b!1006855 (not res!675927)) b!1006859))

(assert (=> d!119623 m!931859))

(declare-fun m!931921 () Bool)

(assert (=> d!119623 m!931921))

(assert (=> d!119623 m!931871))

(declare-fun m!931923 () Bool)

(assert (=> b!1006855 m!931923))

(assert (=> b!1006857 m!931859))

(declare-fun m!931925 () Bool)

(assert (=> b!1006857 m!931925))

(assert (=> b!1006857 m!931925))

(assert (=> b!1006857 m!931857))

(declare-fun m!931927 () Bool)

(assert (=> b!1006857 m!931927))

(assert (=> b!1006856 m!931923))

(assert (=> b!1006859 m!931923))

(assert (=> b!1006779 d!119623))

(declare-fun d!119625 () Bool)

(declare-fun lt!444951 () (_ BitVec 32))

(declare-fun lt!444950 () (_ BitVec 32))

(assert (=> d!119625 (= lt!444951 (bvmul (bvxor lt!444950 (bvlshr lt!444950 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119625 (= lt!444950 ((_ extract 31 0) (bvand (bvxor (select (arr!30581 a!3219) j!170) (bvlshr (select (arr!30581 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119625 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!675925 (let ((h!22438 ((_ extract 31 0) (bvand (bvxor (select (arr!30581 a!3219) j!170) (bvlshr (select (arr!30581 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87820 (bvmul (bvxor h!22438 (bvlshr h!22438 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87820 (bvlshr x!87820 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!675925 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!675925 #b00000000000000000000000000000000))))))

(assert (=> d!119625 (= (toIndex!0 (select (arr!30581 a!3219) j!170) mask!3464) (bvand (bvxor lt!444951 (bvlshr lt!444951 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1006779 d!119625))

(declare-fun d!119627 () Bool)

(assert (=> d!119627 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1006784 d!119627))

(declare-fun b!1006921 () Bool)

(declare-fun e!566712 () SeekEntryResult!9513)

(declare-fun lt!444973 () SeekEntryResult!9513)

(assert (=> b!1006921 (= e!566712 (MissingZero!9513 (index!40425 lt!444973)))))

(declare-fun b!1006922 () Bool)

(declare-fun e!566710 () SeekEntryResult!9513)

(declare-fun e!566711 () SeekEntryResult!9513)

(assert (=> b!1006922 (= e!566710 e!566711)))

(declare-fun lt!444975 () (_ BitVec 64))

(assert (=> b!1006922 (= lt!444975 (select (arr!30581 a!3219) (index!40425 lt!444973)))))

(declare-fun c!101643 () Bool)

(assert (=> b!1006922 (= c!101643 (= lt!444975 k0!2224))))

(declare-fun b!1006923 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63517 (_ BitVec 32)) SeekEntryResult!9513)

(assert (=> b!1006923 (= e!566712 (seekKeyOrZeroReturnVacant!0 (x!87817 lt!444973) (index!40425 lt!444973) (index!40425 lt!444973) k0!2224 a!3219 mask!3464))))

(declare-fun b!1006924 () Bool)

(declare-fun c!101644 () Bool)

(assert (=> b!1006924 (= c!101644 (= lt!444975 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1006924 (= e!566711 e!566712)))

(declare-fun d!119629 () Bool)

(declare-fun lt!444974 () SeekEntryResult!9513)

(assert (=> d!119629 (and (or ((_ is Undefined!9513) lt!444974) (not ((_ is Found!9513) lt!444974)) (and (bvsge (index!40424 lt!444974) #b00000000000000000000000000000000) (bvslt (index!40424 lt!444974) (size!31083 a!3219)))) (or ((_ is Undefined!9513) lt!444974) ((_ is Found!9513) lt!444974) (not ((_ is MissingZero!9513) lt!444974)) (and (bvsge (index!40423 lt!444974) #b00000000000000000000000000000000) (bvslt (index!40423 lt!444974) (size!31083 a!3219)))) (or ((_ is Undefined!9513) lt!444974) ((_ is Found!9513) lt!444974) ((_ is MissingZero!9513) lt!444974) (not ((_ is MissingVacant!9513) lt!444974)) (and (bvsge (index!40426 lt!444974) #b00000000000000000000000000000000) (bvslt (index!40426 lt!444974) (size!31083 a!3219)))) (or ((_ is Undefined!9513) lt!444974) (ite ((_ is Found!9513) lt!444974) (= (select (arr!30581 a!3219) (index!40424 lt!444974)) k0!2224) (ite ((_ is MissingZero!9513) lt!444974) (= (select (arr!30581 a!3219) (index!40423 lt!444974)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9513) lt!444974) (= (select (arr!30581 a!3219) (index!40426 lt!444974)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!119629 (= lt!444974 e!566710)))

(declare-fun c!101645 () Bool)

(assert (=> d!119629 (= c!101645 (and ((_ is Intermediate!9513) lt!444973) (undefined!10325 lt!444973)))))

(assert (=> d!119629 (= lt!444973 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!119629 (validMask!0 mask!3464)))

(assert (=> d!119629 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!444974)))

(declare-fun b!1006925 () Bool)

(assert (=> b!1006925 (= e!566710 Undefined!9513)))

(declare-fun b!1006926 () Bool)

(assert (=> b!1006926 (= e!566711 (Found!9513 (index!40425 lt!444973)))))

(assert (= (and d!119629 c!101645) b!1006925))

(assert (= (and d!119629 (not c!101645)) b!1006922))

(assert (= (and b!1006922 c!101643) b!1006926))

(assert (= (and b!1006922 (not c!101643)) b!1006924))

(assert (= (and b!1006924 c!101644) b!1006921))

(assert (= (and b!1006924 (not c!101644)) b!1006923))

(declare-fun m!931951 () Bool)

(assert (=> b!1006922 m!931951))

(declare-fun m!931953 () Bool)

(assert (=> b!1006923 m!931953))

(declare-fun m!931955 () Bool)

(assert (=> d!119629 m!931955))

(declare-fun m!931957 () Bool)

(assert (=> d!119629 m!931957))

(assert (=> d!119629 m!931871))

(declare-fun m!931959 () Bool)

(assert (=> d!119629 m!931959))

(assert (=> d!119629 m!931957))

(declare-fun m!931961 () Bool)

(assert (=> d!119629 m!931961))

(declare-fun m!931963 () Bool)

(assert (=> d!119629 m!931963))

(assert (=> b!1006783 d!119629))

(declare-fun d!119635 () Bool)

(declare-fun e!566713 () Bool)

(assert (=> d!119635 e!566713))

(declare-fun c!101647 () Bool)

(declare-fun lt!444981 () SeekEntryResult!9513)

(assert (=> d!119635 (= c!101647 (and ((_ is Intermediate!9513) lt!444981) (undefined!10325 lt!444981)))))

(declare-fun e!566715 () SeekEntryResult!9513)

(assert (=> d!119635 (= lt!444981 e!566715)))

(declare-fun c!101648 () Bool)

(assert (=> d!119635 (= c!101648 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444980 () (_ BitVec 64))

(assert (=> d!119635 (= lt!444980 (select (arr!30581 a!3219) index!1507))))

(assert (=> d!119635 (validMask!0 mask!3464)))

(assert (=> d!119635 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30581 a!3219) j!170) a!3219 mask!3464) lt!444981)))

(declare-fun b!1006927 () Bool)

(assert (=> b!1006927 (and (bvsge (index!40425 lt!444981) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444981) (size!31083 a!3219)))))

(declare-fun res!675940 () Bool)

(assert (=> b!1006927 (= res!675940 (= (select (arr!30581 a!3219) (index!40425 lt!444981)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566714 () Bool)

(assert (=> b!1006927 (=> res!675940 e!566714)))

(declare-fun b!1006928 () Bool)

(assert (=> b!1006928 (and (bvsge (index!40425 lt!444981) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444981) (size!31083 a!3219)))))

(declare-fun res!675939 () Bool)

(assert (=> b!1006928 (= res!675939 (= (select (arr!30581 a!3219) (index!40425 lt!444981)) (select (arr!30581 a!3219) j!170)))))

(assert (=> b!1006928 (=> res!675939 e!566714)))

(declare-fun e!566717 () Bool)

(assert (=> b!1006928 (= e!566717 e!566714)))

(declare-fun e!566716 () SeekEntryResult!9513)

(declare-fun b!1006929 () Bool)

(assert (=> b!1006929 (= e!566716 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30581 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1006930 () Bool)

(assert (=> b!1006930 (= e!566715 (Intermediate!9513 true index!1507 x!1245))))

(declare-fun b!1006931 () Bool)

(assert (=> b!1006931 (and (bvsge (index!40425 lt!444981) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444981) (size!31083 a!3219)))))

(assert (=> b!1006931 (= e!566714 (= (select (arr!30581 a!3219) (index!40425 lt!444981)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006932 () Bool)

(assert (=> b!1006932 (= e!566716 (Intermediate!9513 false index!1507 x!1245))))

(declare-fun b!1006933 () Bool)

(assert (=> b!1006933 (= e!566715 e!566716)))

(declare-fun c!101646 () Bool)

(assert (=> b!1006933 (= c!101646 (or (= lt!444980 (select (arr!30581 a!3219) j!170)) (= (bvadd lt!444980 lt!444980) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006934 () Bool)

(assert (=> b!1006934 (= e!566713 (bvsge (x!87817 lt!444981) #b01111111111111111111111111111110))))

(declare-fun b!1006935 () Bool)

(assert (=> b!1006935 (= e!566713 e!566717)))

(declare-fun res!675941 () Bool)

(assert (=> b!1006935 (= res!675941 (and ((_ is Intermediate!9513) lt!444981) (not (undefined!10325 lt!444981)) (bvslt (x!87817 lt!444981) #b01111111111111111111111111111110) (bvsge (x!87817 lt!444981) #b00000000000000000000000000000000) (bvsge (x!87817 lt!444981) x!1245)))))

(assert (=> b!1006935 (=> (not res!675941) (not e!566717))))

(assert (= (and d!119635 c!101648) b!1006930))

(assert (= (and d!119635 (not c!101648)) b!1006933))

(assert (= (and b!1006933 c!101646) b!1006932))

(assert (= (and b!1006933 (not c!101646)) b!1006929))

(assert (= (and d!119635 c!101647) b!1006934))

(assert (= (and d!119635 (not c!101647)) b!1006935))

(assert (= (and b!1006935 res!675941) b!1006928))

(assert (= (and b!1006928 (not res!675939)) b!1006927))

(assert (= (and b!1006927 (not res!675940)) b!1006931))

(declare-fun m!931965 () Bool)

(assert (=> d!119635 m!931965))

(assert (=> d!119635 m!931871))

(declare-fun m!931967 () Bool)

(assert (=> b!1006927 m!931967))

(declare-fun m!931969 () Bool)

(assert (=> b!1006929 m!931969))

(assert (=> b!1006929 m!931969))

(assert (=> b!1006929 m!931857))

(declare-fun m!931971 () Bool)

(assert (=> b!1006929 m!931971))

(assert (=> b!1006928 m!931967))

(assert (=> b!1006931 m!931967))

(assert (=> b!1006778 d!119635))

(declare-fun b!1006950 () Bool)

(declare-fun e!566729 () Bool)

(declare-fun call!42350 () Bool)

(assert (=> b!1006950 (= e!566729 call!42350)))

(declare-fun b!1006951 () Bool)

(assert (=> b!1006951 (= e!566729 call!42350)))

(declare-fun d!119639 () Bool)

(declare-fun res!675948 () Bool)

(declare-fun e!566731 () Bool)

(assert (=> d!119639 (=> res!675948 e!566731)))

(assert (=> d!119639 (= res!675948 (bvsge #b00000000000000000000000000000000 (size!31083 a!3219)))))

(assert (=> d!119639 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21254) e!566731)))

(declare-fun b!1006952 () Bool)

(declare-fun e!566728 () Bool)

(assert (=> b!1006952 (= e!566728 e!566729)))

(declare-fun c!101653 () Bool)

(assert (=> b!1006952 (= c!101653 (validKeyInArray!0 (select (arr!30581 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42347 () Bool)

(assert (=> bm!42347 (= call!42350 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101653 (Cons!21253 (select (arr!30581 a!3219) #b00000000000000000000000000000000) Nil!21254) Nil!21254)))))

(declare-fun b!1006953 () Bool)

(declare-fun e!566730 () Bool)

(declare-fun contains!5886 (List!21257 (_ BitVec 64)) Bool)

(assert (=> b!1006953 (= e!566730 (contains!5886 Nil!21254 (select (arr!30581 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1006956 () Bool)

(assert (=> b!1006956 (= e!566731 e!566728)))

(declare-fun res!675950 () Bool)

(assert (=> b!1006956 (=> (not res!675950) (not e!566728))))

(assert (=> b!1006956 (= res!675950 (not e!566730))))

(declare-fun res!675949 () Bool)

(assert (=> b!1006956 (=> (not res!675949) (not e!566730))))

(assert (=> b!1006956 (= res!675949 (validKeyInArray!0 (select (arr!30581 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119639 (not res!675948)) b!1006956))

(assert (= (and b!1006956 res!675949) b!1006953))

(assert (= (and b!1006956 res!675950) b!1006952))

(assert (= (and b!1006952 c!101653) b!1006951))

(assert (= (and b!1006952 (not c!101653)) b!1006950))

(assert (= (or b!1006951 b!1006950) bm!42347))

(declare-fun m!931973 () Bool)

(assert (=> b!1006952 m!931973))

(assert (=> b!1006952 m!931973))

(declare-fun m!931975 () Bool)

(assert (=> b!1006952 m!931975))

(assert (=> bm!42347 m!931973))

(declare-fun m!931977 () Bool)

(assert (=> bm!42347 m!931977))

(assert (=> b!1006953 m!931973))

(assert (=> b!1006953 m!931973))

(declare-fun m!931979 () Bool)

(assert (=> b!1006953 m!931979))

(assert (=> b!1006956 m!931973))

(assert (=> b!1006956 m!931973))

(assert (=> b!1006956 m!931975))

(assert (=> b!1006777 d!119639))

(declare-fun d!119641 () Bool)

(declare-fun res!675961 () Bool)

(declare-fun e!566744 () Bool)

(assert (=> d!119641 (=> res!675961 e!566744)))

(assert (=> d!119641 (= res!675961 (= (select (arr!30581 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!119641 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!566744)))

(declare-fun b!1006973 () Bool)

(declare-fun e!566745 () Bool)

(assert (=> b!1006973 (= e!566744 e!566745)))

(declare-fun res!675962 () Bool)

(assert (=> b!1006973 (=> (not res!675962) (not e!566745))))

(assert (=> b!1006973 (= res!675962 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31083 a!3219)))))

(declare-fun b!1006974 () Bool)

(assert (=> b!1006974 (= e!566745 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119641 (not res!675961)) b!1006973))

(assert (= (and b!1006973 res!675962) b!1006974))

(assert (=> d!119641 m!931973))

(declare-fun m!931981 () Bool)

(assert (=> b!1006974 m!931981))

(assert (=> b!1006788 d!119641))

(declare-fun d!119645 () Bool)

(declare-fun e!566746 () Bool)

(assert (=> d!119645 e!566746))

(declare-fun c!101659 () Bool)

(declare-fun lt!444989 () SeekEntryResult!9513)

(assert (=> d!119645 (= c!101659 (and ((_ is Intermediate!9513) lt!444989) (undefined!10325 lt!444989)))))

(declare-fun e!566748 () SeekEntryResult!9513)

(assert (=> d!119645 (= lt!444989 e!566748)))

(declare-fun c!101660 () Bool)

(assert (=> d!119645 (= c!101660 (bvsge x!1245 #b01111111111111111111111111111110))))

(declare-fun lt!444988 () (_ BitVec 64))

(assert (=> d!119645 (= lt!444988 (select (arr!30581 lt!444913) index!1507))))

(assert (=> d!119645 (validMask!0 mask!3464)))

(assert (=> d!119645 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!444915 lt!444913 mask!3464) lt!444989)))

(declare-fun b!1006975 () Bool)

(assert (=> b!1006975 (and (bvsge (index!40425 lt!444989) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444989) (size!31083 lt!444913)))))

(declare-fun res!675964 () Bool)

(assert (=> b!1006975 (= res!675964 (= (select (arr!30581 lt!444913) (index!40425 lt!444989)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!566747 () Bool)

(assert (=> b!1006975 (=> res!675964 e!566747)))

(declare-fun b!1006976 () Bool)

(assert (=> b!1006976 (and (bvsge (index!40425 lt!444989) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444989) (size!31083 lt!444913)))))

(declare-fun res!675963 () Bool)

(assert (=> b!1006976 (= res!675963 (= (select (arr!30581 lt!444913) (index!40425 lt!444989)) lt!444915))))

(assert (=> b!1006976 (=> res!675963 e!566747)))

(declare-fun e!566750 () Bool)

(assert (=> b!1006976 (= e!566750 e!566747)))

(declare-fun e!566749 () SeekEntryResult!9513)

(declare-fun b!1006977 () Bool)

(assert (=> b!1006977 (= e!566749 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!444915 lt!444913 mask!3464))))

(declare-fun b!1006978 () Bool)

(assert (=> b!1006978 (= e!566748 (Intermediate!9513 true index!1507 x!1245))))

(declare-fun b!1006979 () Bool)

(assert (=> b!1006979 (and (bvsge (index!40425 lt!444989) #b00000000000000000000000000000000) (bvslt (index!40425 lt!444989) (size!31083 lt!444913)))))

(assert (=> b!1006979 (= e!566747 (= (select (arr!30581 lt!444913) (index!40425 lt!444989)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1006980 () Bool)

(assert (=> b!1006980 (= e!566749 (Intermediate!9513 false index!1507 x!1245))))

(declare-fun b!1006981 () Bool)

(assert (=> b!1006981 (= e!566748 e!566749)))

(declare-fun c!101658 () Bool)

(assert (=> b!1006981 (= c!101658 (or (= lt!444988 lt!444915) (= (bvadd lt!444988 lt!444988) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1006982 () Bool)

(assert (=> b!1006982 (= e!566746 (bvsge (x!87817 lt!444989) #b01111111111111111111111111111110))))

(declare-fun b!1006983 () Bool)

(assert (=> b!1006983 (= e!566746 e!566750)))

(declare-fun res!675965 () Bool)

(assert (=> b!1006983 (= res!675965 (and ((_ is Intermediate!9513) lt!444989) (not (undefined!10325 lt!444989)) (bvslt (x!87817 lt!444989) #b01111111111111111111111111111110) (bvsge (x!87817 lt!444989) #b00000000000000000000000000000000) (bvsge (x!87817 lt!444989) x!1245)))))

(assert (=> b!1006983 (=> (not res!675965) (not e!566750))))

(assert (= (and d!119645 c!101660) b!1006978))

(assert (= (and d!119645 (not c!101660)) b!1006981))

(assert (= (and b!1006981 c!101658) b!1006980))

(assert (= (and b!1006981 (not c!101658)) b!1006977))

(assert (= (and d!119645 c!101659) b!1006982))

(assert (= (and d!119645 (not c!101659)) b!1006983))

(assert (= (and b!1006983 res!675965) b!1006976))

(assert (= (and b!1006976 (not res!675963)) b!1006975))

(assert (= (and b!1006975 (not res!675964)) b!1006979))

(declare-fun m!931983 () Bool)

(assert (=> d!119645 m!931983))

(assert (=> d!119645 m!931871))

(declare-fun m!931985 () Bool)

(assert (=> b!1006975 m!931985))

(assert (=> b!1006977 m!931969))

(assert (=> b!1006977 m!931969))

(declare-fun m!931987 () Bool)

(assert (=> b!1006977 m!931987))

(assert (=> b!1006976 m!931985))

(assert (=> b!1006979 m!931985))

(assert (=> b!1006787 d!119645))

(declare-fun b!1007019 () Bool)

(declare-fun e!566773 () Bool)

(declare-fun call!42353 () Bool)

(assert (=> b!1007019 (= e!566773 call!42353)))

(declare-fun d!119649 () Bool)

(declare-fun res!675980 () Bool)

(declare-fun e!566774 () Bool)

(assert (=> d!119649 (=> res!675980 e!566774)))

(assert (=> d!119649 (= res!675980 (bvsge #b00000000000000000000000000000000 (size!31083 a!3219)))))

(assert (=> d!119649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!566774)))

(declare-fun bm!42350 () Bool)

(assert (=> bm!42350 (= call!42353 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!1007020 () Bool)

(declare-fun e!566772 () Bool)

(assert (=> b!1007020 (= e!566774 e!566772)))

(declare-fun c!101672 () Bool)

(assert (=> b!1007020 (= c!101672 (validKeyInArray!0 (select (arr!30581 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1007021 () Bool)

(assert (=> b!1007021 (= e!566772 call!42353)))

(declare-fun b!1007022 () Bool)

(assert (=> b!1007022 (= e!566772 e!566773)))

(declare-fun lt!445012 () (_ BitVec 64))

(assert (=> b!1007022 (= lt!445012 (select (arr!30581 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33010 0))(
  ( (Unit!33011) )
))
(declare-fun lt!445011 () Unit!33010)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63517 (_ BitVec 64) (_ BitVec 32)) Unit!33010)

(assert (=> b!1007022 (= lt!445011 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!445012 #b00000000000000000000000000000000))))

(assert (=> b!1007022 (arrayContainsKey!0 a!3219 lt!445012 #b00000000000000000000000000000000)))

(declare-fun lt!445010 () Unit!33010)

(assert (=> b!1007022 (= lt!445010 lt!445011)))

(declare-fun res!675981 () Bool)

(assert (=> b!1007022 (= res!675981 (= (seekEntryOrOpen!0 (select (arr!30581 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9513 #b00000000000000000000000000000000)))))

(assert (=> b!1007022 (=> (not res!675981) (not e!566773))))

(assert (= (and d!119649 (not res!675980)) b!1007020))

(assert (= (and b!1007020 c!101672) b!1007022))

(assert (= (and b!1007020 (not c!101672)) b!1007021))

(assert (= (and b!1007022 res!675981) b!1007019))

(assert (= (or b!1007019 b!1007021) bm!42350))

(declare-fun m!932013 () Bool)

(assert (=> bm!42350 m!932013))

(assert (=> b!1007020 m!931973))

(assert (=> b!1007020 m!931973))

(assert (=> b!1007020 m!931975))

(assert (=> b!1007022 m!931973))

(declare-fun m!932015 () Bool)

(assert (=> b!1007022 m!932015))

(declare-fun m!932017 () Bool)

(assert (=> b!1007022 m!932017))

(assert (=> b!1007022 m!931973))

(declare-fun m!932019 () Bool)

(assert (=> b!1007022 m!932019))

(assert (=> b!1006776 d!119649))

(check-sat (not b!1007022) (not b!1006952) (not d!119623) (not d!119645) (not d!119629) (not b!1006929) (not b!1007020) (not d!119635) (not b!1006977) (not b!1006857) (not bm!42350) (not bm!42347) (not d!119613) (not b!1006956) (not b!1006974) (not b!1006848) (not b!1006923) (not b!1006953))
(check-sat)
