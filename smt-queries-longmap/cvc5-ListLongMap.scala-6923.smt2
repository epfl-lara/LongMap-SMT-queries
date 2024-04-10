; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!86954 () Bool)

(assert start!86954)

(declare-fun b!1008809 () Bool)

(declare-fun res!677715 () Bool)

(declare-fun e!567576 () Bool)

(assert (=> b!1008809 (=> (not res!677715) (not e!567576))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!1008809 (= res!677715 (and (not (= index!1507 resIndex!38)) (not (= index!1507 i!1194))))))

(declare-fun b!1008810 () Bool)

(declare-fun res!677704 () Bool)

(declare-fun e!567572 () Bool)

(assert (=> b!1008810 (=> (not res!677704) (not e!567572))))

(declare-datatypes ((array!63602 0))(
  ( (array!63603 (arr!30622 (Array (_ BitVec 32) (_ BitVec 64))) (size!31124 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!63602)

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun j!170 () (_ BitVec 32))

(assert (=> b!1008810 (= res!677704 (and (= (size!31124 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!31124 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!31124 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!1008811 () Bool)

(declare-fun x!1245 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(assert (=> b!1008811 (= e!567576 (bvsgt (bvadd #b00000000000000000000000000000001 x!1245) resX!38))))

(declare-fun lt!445887 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008811 (= lt!445887 (nextIndex!0 index!1507 x!1245 mask!3464))))

(declare-fun b!1008812 () Bool)

(declare-fun res!677711 () Bool)

(assert (=> b!1008812 (=> (not res!677711) (not e!567572))))

(declare-fun k!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!63602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1008812 (= res!677711 (not (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000)))))

(declare-fun b!1008813 () Bool)

(declare-fun res!677714 () Bool)

(assert (=> b!1008813 (=> (not res!677714) (not e!567572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1008813 (= res!677714 (validKeyInArray!0 k!2224))))

(declare-fun b!1008814 () Bool)

(declare-fun res!677707 () Bool)

(assert (=> b!1008814 (=> (not res!677707) (not e!567572))))

(assert (=> b!1008814 (= res!677707 (validKeyInArray!0 (select (arr!30622 a!3219) j!170)))))

(declare-fun b!1008815 () Bool)

(declare-fun res!677702 () Bool)

(declare-fun e!567575 () Bool)

(assert (=> b!1008815 (=> (not res!677702) (not e!567575))))

(declare-datatypes ((List!21298 0))(
  ( (Nil!21295) (Cons!21294 (h!22480 (_ BitVec 64)) (t!30299 List!21298)) )
))
(declare-fun arrayNoDuplicates!0 (array!63602 (_ BitVec 32) List!21298) Bool)

(assert (=> b!1008815 (= res!677702 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21295))))

(declare-fun res!677712 () Bool)

(assert (=> start!86954 (=> (not res!677712) (not e!567572))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!86954 (= res!677712 (validMask!0 mask!3464))))

(assert (=> start!86954 e!567572))

(declare-fun array_inv!23746 (array!63602) Bool)

(assert (=> start!86954 (array_inv!23746 a!3219)))

(assert (=> start!86954 true))

(declare-fun b!1008816 () Bool)

(declare-fun e!567574 () Bool)

(assert (=> b!1008816 (= e!567574 e!567576)))

(declare-fun res!677705 () Bool)

(assert (=> b!1008816 (=> (not res!677705) (not e!567576))))

(declare-datatypes ((SeekEntryResult!9554 0))(
  ( (MissingZero!9554 (index!40587 (_ BitVec 32))) (Found!9554 (index!40588 (_ BitVec 32))) (Intermediate!9554 (undefined!10366 Bool) (index!40589 (_ BitVec 32)) (x!87976 (_ BitVec 32))) (Undefined!9554) (MissingVacant!9554 (index!40590 (_ BitVec 32))) )
))
(declare-fun lt!445888 () SeekEntryResult!9554)

(declare-fun lt!445884 () array!63602)

(declare-fun lt!445885 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63602 (_ BitVec 32)) SeekEntryResult!9554)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1008816 (= res!677705 (not (= lt!445888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445885 mask!3464) lt!445885 lt!445884 mask!3464))))))

(assert (=> b!1008816 (= lt!445885 (select (store (arr!30622 a!3219) i!1194 k!2224) j!170))))

(assert (=> b!1008816 (= lt!445884 (array!63603 (store (arr!30622 a!3219) i!1194 k!2224) (size!31124 a!3219)))))

(declare-fun b!1008817 () Bool)

(declare-fun res!677703 () Bool)

(assert (=> b!1008817 (=> (not res!677703) (not e!567575))))

(assert (=> b!1008817 (= res!677703 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!31124 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!31124 a!3219))))))

(declare-fun b!1008818 () Bool)

(declare-fun e!567577 () Bool)

(assert (=> b!1008818 (= e!567575 e!567577)))

(declare-fun res!677709 () Bool)

(assert (=> b!1008818 (=> (not res!677709) (not e!567577))))

(declare-fun lt!445886 () SeekEntryResult!9554)

(assert (=> b!1008818 (= res!677709 (= lt!445888 lt!445886))))

(assert (=> b!1008818 (= lt!445886 (Intermediate!9554 false resIndex!38 resX!38))))

(assert (=> b!1008818 (= lt!445888 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30622 a!3219) j!170) mask!3464) (select (arr!30622 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008819 () Bool)

(assert (=> b!1008819 (= e!567572 e!567575)))

(declare-fun res!677706 () Bool)

(assert (=> b!1008819 (=> (not res!677706) (not e!567575))))

(declare-fun lt!445889 () SeekEntryResult!9554)

(assert (=> b!1008819 (= res!677706 (or (= lt!445889 (MissingVacant!9554 i!1194)) (= lt!445889 (MissingZero!9554 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!63602 (_ BitVec 32)) SeekEntryResult!9554)

(assert (=> b!1008819 (= lt!445889 (seekEntryOrOpen!0 k!2224 a!3219 mask!3464))))

(declare-fun b!1008820 () Bool)

(assert (=> b!1008820 (= e!567577 e!567574)))

(declare-fun res!677710 () Bool)

(assert (=> b!1008820 (=> (not res!677710) (not e!567574))))

(declare-fun lt!445883 () SeekEntryResult!9554)

(assert (=> b!1008820 (= res!677710 (= lt!445883 lt!445886))))

(assert (=> b!1008820 (= lt!445883 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30622 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1008821 () Bool)

(declare-fun res!677708 () Bool)

(assert (=> b!1008821 (=> (not res!677708) (not e!567575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63602 (_ BitVec 32)) Bool)

(assert (=> b!1008821 (= res!677708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!1008822 () Bool)

(declare-fun res!677713 () Bool)

(assert (=> b!1008822 (=> (not res!677713) (not e!567576))))

(assert (=> b!1008822 (= res!677713 (not (= lt!445883 (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445885 lt!445884 mask!3464))))))

(assert (= (and start!86954 res!677712) b!1008810))

(assert (= (and b!1008810 res!677704) b!1008814))

(assert (= (and b!1008814 res!677707) b!1008813))

(assert (= (and b!1008813 res!677714) b!1008812))

(assert (= (and b!1008812 res!677711) b!1008819))

(assert (= (and b!1008819 res!677706) b!1008821))

(assert (= (and b!1008821 res!677708) b!1008815))

(assert (= (and b!1008815 res!677702) b!1008817))

(assert (= (and b!1008817 res!677703) b!1008818))

(assert (= (and b!1008818 res!677709) b!1008820))

(assert (= (and b!1008820 res!677710) b!1008816))

(assert (= (and b!1008816 res!677705) b!1008822))

(assert (= (and b!1008822 res!677713) b!1008809))

(assert (= (and b!1008809 res!677715) b!1008811))

(declare-fun m!933503 () Bool)

(assert (=> b!1008818 m!933503))

(assert (=> b!1008818 m!933503))

(declare-fun m!933505 () Bool)

(assert (=> b!1008818 m!933505))

(assert (=> b!1008818 m!933505))

(assert (=> b!1008818 m!933503))

(declare-fun m!933507 () Bool)

(assert (=> b!1008818 m!933507))

(declare-fun m!933509 () Bool)

(assert (=> b!1008811 m!933509))

(declare-fun m!933511 () Bool)

(assert (=> b!1008813 m!933511))

(declare-fun m!933513 () Bool)

(assert (=> b!1008822 m!933513))

(declare-fun m!933515 () Bool)

(assert (=> start!86954 m!933515))

(declare-fun m!933517 () Bool)

(assert (=> start!86954 m!933517))

(declare-fun m!933519 () Bool)

(assert (=> b!1008815 m!933519))

(declare-fun m!933521 () Bool)

(assert (=> b!1008816 m!933521))

(assert (=> b!1008816 m!933521))

(declare-fun m!933523 () Bool)

(assert (=> b!1008816 m!933523))

(declare-fun m!933525 () Bool)

(assert (=> b!1008816 m!933525))

(declare-fun m!933527 () Bool)

(assert (=> b!1008816 m!933527))

(declare-fun m!933529 () Bool)

(assert (=> b!1008819 m!933529))

(assert (=> b!1008814 m!933503))

(assert (=> b!1008814 m!933503))

(declare-fun m!933531 () Bool)

(assert (=> b!1008814 m!933531))

(declare-fun m!933533 () Bool)

(assert (=> b!1008812 m!933533))

(declare-fun m!933535 () Bool)

(assert (=> b!1008821 m!933535))

(assert (=> b!1008820 m!933503))

(assert (=> b!1008820 m!933503))

(declare-fun m!933537 () Bool)

(assert (=> b!1008820 m!933537))

(push 1)

(assert (not b!1008818))

(assert (not b!1008816))

(assert (not b!1008813))

(assert (not b!1008819))

(assert (not b!1008811))

(assert (not b!1008821))

(assert (not b!1008822))

(assert (not b!1008815))

(assert (not start!86954))

(assert (not b!1008812))

(assert (not b!1008820))

(assert (not b!1008814))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!119725 () Bool)

(assert (=> d!119725 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!86954 d!119725))

(declare-fun d!119733 () Bool)

(assert (=> d!119733 (= (array_inv!23746 a!3219) (bvsge (size!31124 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!86954 d!119733))

(declare-fun d!119737 () Bool)

(declare-fun res!677838 () Bool)

(declare-fun e!567666 () Bool)

(assert (=> d!119737 (=> res!677838 e!567666)))

(assert (=> d!119737 (= res!677838 (bvsge #b00000000000000000000000000000000 (size!31124 a!3219)))))

(assert (=> d!119737 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21295) e!567666)))

(declare-fun b!1008987 () Bool)

(declare-fun e!567667 () Bool)

(declare-fun contains!5889 (List!21298 (_ BitVec 64)) Bool)

(assert (=> b!1008987 (= e!567667 (contains!5889 Nil!21295 (select (arr!30622 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1008988 () Bool)

(declare-fun e!567669 () Bool)

(declare-fun call!42370 () Bool)

(assert (=> b!1008988 (= e!567669 call!42370)))

(declare-fun b!1008989 () Bool)

(declare-fun e!567668 () Bool)

(assert (=> b!1008989 (= e!567666 e!567668)))

(declare-fun res!677837 () Bool)

(assert (=> b!1008989 (=> (not res!677837) (not e!567668))))

(assert (=> b!1008989 (= res!677837 (not e!567667))))

(declare-fun res!677839 () Bool)

(assert (=> b!1008989 (=> (not res!677839) (not e!567667))))

(assert (=> b!1008989 (= res!677839 (validKeyInArray!0 (select (arr!30622 a!3219) #b00000000000000000000000000000000)))))

(declare-fun bm!42367 () Bool)

(declare-fun c!101728 () Bool)

(assert (=> bm!42367 (= call!42370 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101728 (Cons!21294 (select (arr!30622 a!3219) #b00000000000000000000000000000000) Nil!21295) Nil!21295)))))

(declare-fun b!1008990 () Bool)

(assert (=> b!1008990 (= e!567668 e!567669)))

(assert (=> b!1008990 (= c!101728 (validKeyInArray!0 (select (arr!30622 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1008991 () Bool)

(assert (=> b!1008991 (= e!567669 call!42370)))

(assert (= (and d!119737 (not res!677838)) b!1008989))

(assert (= (and b!1008989 res!677839) b!1008987))

(assert (= (and b!1008989 res!677837) b!1008990))

(assert (= (and b!1008990 c!101728) b!1008991))

(assert (= (and b!1008990 (not c!101728)) b!1008988))

(assert (= (or b!1008991 b!1008988) bm!42367))

(declare-fun m!933629 () Bool)

(assert (=> b!1008987 m!933629))

(assert (=> b!1008987 m!933629))

(declare-fun m!933631 () Bool)

(assert (=> b!1008987 m!933631))

(assert (=> b!1008989 m!933629))

(assert (=> b!1008989 m!933629))

(declare-fun m!933633 () Bool)

(assert (=> b!1008989 m!933633))

(assert (=> bm!42367 m!933629))

(declare-fun m!933635 () Bool)

(assert (=> bm!42367 m!933635))

(assert (=> b!1008990 m!933629))

(assert (=> b!1008990 m!933629))

(assert (=> b!1008990 m!933633))

(assert (=> b!1008815 d!119737))

(declare-fun b!1009066 () Bool)

(declare-fun e!567724 () SeekEntryResult!9554)

(declare-fun e!567721 () SeekEntryResult!9554)

(assert (=> b!1009066 (= e!567724 e!567721)))

(declare-fun c!101750 () Bool)

(declare-fun lt!445973 () (_ BitVec 64))

(assert (=> b!1009066 (= c!101750 (or (= lt!445973 lt!445885) (= (bvadd lt!445973 lt!445973) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009067 () Bool)

(declare-fun lt!445974 () SeekEntryResult!9554)

(assert (=> b!1009067 (and (bvsge (index!40589 lt!445974) #b00000000000000000000000000000000) (bvslt (index!40589 lt!445974) (size!31124 lt!445884)))))

(declare-fun res!677877 () Bool)

(assert (=> b!1009067 (= res!677877 (= (select (arr!30622 lt!445884) (index!40589 lt!445974)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567723 () Bool)

(assert (=> b!1009067 (=> res!677877 e!567723)))

(declare-fun b!1009068 () Bool)

(declare-fun e!567725 () Bool)

(declare-fun e!567722 () Bool)

(assert (=> b!1009068 (= e!567725 e!567722)))

(declare-fun res!677878 () Bool)

(assert (=> b!1009068 (= res!677878 (and (is-Intermediate!9554 lt!445974) (not (undefined!10366 lt!445974)) (bvslt (x!87976 lt!445974) #b01111111111111111111111111111110) (bvsge (x!87976 lt!445974) #b00000000000000000000000000000000) (bvsge (x!87976 lt!445974) #b00000000000000000000000000000000)))))

(assert (=> b!1009068 (=> (not res!677878) (not e!567722))))

(declare-fun b!1009069 () Bool)

(assert (=> b!1009069 (and (bvsge (index!40589 lt!445974) #b00000000000000000000000000000000) (bvslt (index!40589 lt!445974) (size!31124 lt!445884)))))

(declare-fun res!677879 () Bool)

(assert (=> b!1009069 (= res!677879 (= (select (arr!30622 lt!445884) (index!40589 lt!445974)) lt!445885))))

(assert (=> b!1009069 (=> res!677879 e!567723)))

(assert (=> b!1009069 (= e!567722 e!567723)))

(declare-fun b!1009070 () Bool)

(assert (=> b!1009070 (= e!567721 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 lt!445885 mask!3464) #b00000000000000000000000000000000 mask!3464) lt!445885 lt!445884 mask!3464))))

(declare-fun b!1009071 () Bool)

(assert (=> b!1009071 (and (bvsge (index!40589 lt!445974) #b00000000000000000000000000000000) (bvslt (index!40589 lt!445974) (size!31124 lt!445884)))))

(assert (=> b!1009071 (= e!567723 (= (select (arr!30622 lt!445884) (index!40589 lt!445974)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119743 () Bool)

(assert (=> d!119743 e!567725))

(declare-fun c!101748 () Bool)

(assert (=> d!119743 (= c!101748 (and (is-Intermediate!9554 lt!445974) (undefined!10366 lt!445974)))))

(assert (=> d!119743 (= lt!445974 e!567724)))

(declare-fun c!101749 () Bool)

(assert (=> d!119743 (= c!101749 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119743 (= lt!445973 (select (arr!30622 lt!445884) (toIndex!0 lt!445885 mask!3464)))))

(assert (=> d!119743 (validMask!0 mask!3464)))

(assert (=> d!119743 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!445885 mask!3464) lt!445885 lt!445884 mask!3464) lt!445974)))

(declare-fun b!1009072 () Bool)

(assert (=> b!1009072 (= e!567724 (Intermediate!9554 true (toIndex!0 lt!445885 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009073 () Bool)

(assert (=> b!1009073 (= e!567721 (Intermediate!9554 false (toIndex!0 lt!445885 mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009074 () Bool)

(assert (=> b!1009074 (= e!567725 (bvsge (x!87976 lt!445974) #b01111111111111111111111111111110))))

(assert (= (and d!119743 c!101749) b!1009072))

(assert (= (and d!119743 (not c!101749)) b!1009066))

(assert (= (and b!1009066 c!101750) b!1009073))

(assert (= (and b!1009066 (not c!101750)) b!1009070))

(assert (= (and d!119743 c!101748) b!1009074))

(assert (= (and d!119743 (not c!101748)) b!1009068))

(assert (= (and b!1009068 res!677878) b!1009069))

(assert (= (and b!1009069 (not res!677879)) b!1009067))

(assert (= (and b!1009067 (not res!677877)) b!1009071))

(declare-fun m!933675 () Bool)

(assert (=> b!1009067 m!933675))

(assert (=> b!1009071 m!933675))

(assert (=> d!119743 m!933521))

(declare-fun m!933677 () Bool)

(assert (=> d!119743 m!933677))

(assert (=> d!119743 m!933515))

(assert (=> b!1009069 m!933675))

(assert (=> b!1009070 m!933521))

(declare-fun m!933679 () Bool)

(assert (=> b!1009070 m!933679))

(assert (=> b!1009070 m!933679))

(declare-fun m!933681 () Bool)

(assert (=> b!1009070 m!933681))

(assert (=> b!1008816 d!119743))

(declare-fun d!119761 () Bool)

(declare-fun lt!445984 () (_ BitVec 32))

(declare-fun lt!445983 () (_ BitVec 32))

(assert (=> d!119761 (= lt!445984 (bvmul (bvxor lt!445983 (bvlshr lt!445983 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119761 (= lt!445983 ((_ extract 31 0) (bvand (bvxor lt!445885 (bvlshr lt!445885 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119761 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677880 (let ((h!22485 ((_ extract 31 0) (bvand (bvxor lt!445885 (bvlshr lt!445885 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87984 (bvmul (bvxor h!22485 (bvlshr h!22485 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87984 (bvlshr x!87984 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677880 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677880 #b00000000000000000000000000000000))))))

(assert (=> d!119761 (= (toIndex!0 lt!445885 mask!3464) (bvand (bvxor lt!445984 (bvlshr lt!445984 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1008816 d!119761))

(declare-fun d!119763 () Bool)

(assert (=> d!119763 (= (validKeyInArray!0 (select (arr!30622 a!3219) j!170)) (and (not (= (select (arr!30622 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30622 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008814 d!119763))

(declare-fun d!119765 () Bool)

(assert (=> d!119765 (= (validKeyInArray!0 k!2224) (and (not (= k!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1008813 d!119765))

(declare-fun d!119767 () Bool)

(declare-fun lt!445989 () (_ BitVec 32))

(assert (=> d!119767 (and (bvsge lt!445989 #b00000000000000000000000000000000) (bvslt lt!445989 (bvadd mask!3464 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!119767 (= lt!445989 (choose!52 index!1507 x!1245 mask!3464))))

(assert (=> d!119767 (validMask!0 mask!3464)))

(assert (=> d!119767 (= (nextIndex!0 index!1507 x!1245 mask!3464) lt!445989)))

(declare-fun bs!28695 () Bool)

(assert (= bs!28695 d!119767))

(declare-fun m!933683 () Bool)

(assert (=> bs!28695 m!933683))

(assert (=> bs!28695 m!933515))

(assert (=> b!1008811 d!119767))

(declare-fun b!1009087 () Bool)

(declare-fun e!567735 () SeekEntryResult!9554)

(declare-fun e!567732 () SeekEntryResult!9554)

(assert (=> b!1009087 (= e!567735 e!567732)))

(declare-fun c!101759 () Bool)

(declare-fun lt!445990 () (_ BitVec 64))

(assert (=> b!1009087 (= c!101759 (or (= lt!445990 lt!445885) (= (bvadd lt!445990 lt!445990) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009088 () Bool)

(declare-fun lt!445991 () SeekEntryResult!9554)

(assert (=> b!1009088 (and (bvsge (index!40589 lt!445991) #b00000000000000000000000000000000) (bvslt (index!40589 lt!445991) (size!31124 lt!445884)))))

(declare-fun res!677881 () Bool)

(assert (=> b!1009088 (= res!677881 (= (select (arr!30622 lt!445884) (index!40589 lt!445991)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567734 () Bool)

(assert (=> b!1009088 (=> res!677881 e!567734)))

(declare-fun b!1009089 () Bool)

(declare-fun e!567736 () Bool)

(declare-fun e!567733 () Bool)

(assert (=> b!1009089 (= e!567736 e!567733)))

(declare-fun res!677882 () Bool)

(assert (=> b!1009089 (= res!677882 (and (is-Intermediate!9554 lt!445991) (not (undefined!10366 lt!445991)) (bvslt (x!87976 lt!445991) #b01111111111111111111111111111110) (bvsge (x!87976 lt!445991) #b00000000000000000000000000000000) (bvsge (x!87976 lt!445991) x!1245)))))

(assert (=> b!1009089 (=> (not res!677882) (not e!567733))))

(declare-fun b!1009090 () Bool)

(assert (=> b!1009090 (and (bvsge (index!40589 lt!445991) #b00000000000000000000000000000000) (bvslt (index!40589 lt!445991) (size!31124 lt!445884)))))

(declare-fun res!677883 () Bool)

(assert (=> b!1009090 (= res!677883 (= (select (arr!30622 lt!445884) (index!40589 lt!445991)) lt!445885))))

(assert (=> b!1009090 (=> res!677883 e!567734)))

(assert (=> b!1009090 (= e!567733 e!567734)))

(declare-fun b!1009091 () Bool)

(assert (=> b!1009091 (= e!567732 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!445885 lt!445884 mask!3464))))

(declare-fun b!1009092 () Bool)

(assert (=> b!1009092 (and (bvsge (index!40589 lt!445991) #b00000000000000000000000000000000) (bvslt (index!40589 lt!445991) (size!31124 lt!445884)))))

(assert (=> b!1009092 (= e!567734 (= (select (arr!30622 lt!445884) (index!40589 lt!445991)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119769 () Bool)

(assert (=> d!119769 e!567736))

(declare-fun c!101757 () Bool)

(assert (=> d!119769 (= c!101757 (and (is-Intermediate!9554 lt!445991) (undefined!10366 lt!445991)))))

(assert (=> d!119769 (= lt!445991 e!567735)))

(declare-fun c!101758 () Bool)

(assert (=> d!119769 (= c!101758 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119769 (= lt!445990 (select (arr!30622 lt!445884) index!1507))))

(assert (=> d!119769 (validMask!0 mask!3464)))

(assert (=> d!119769 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 lt!445885 lt!445884 mask!3464) lt!445991)))

(declare-fun b!1009093 () Bool)

(assert (=> b!1009093 (= e!567735 (Intermediate!9554 true index!1507 x!1245))))

(declare-fun b!1009094 () Bool)

(assert (=> b!1009094 (= e!567732 (Intermediate!9554 false index!1507 x!1245))))

(declare-fun b!1009095 () Bool)

(assert (=> b!1009095 (= e!567736 (bvsge (x!87976 lt!445991) #b01111111111111111111111111111110))))

(assert (= (and d!119769 c!101758) b!1009093))

(assert (= (and d!119769 (not c!101758)) b!1009087))

(assert (= (and b!1009087 c!101759) b!1009094))

(assert (= (and b!1009087 (not c!101759)) b!1009091))

(assert (= (and d!119769 c!101757) b!1009095))

(assert (= (and d!119769 (not c!101757)) b!1009089))

(assert (= (and b!1009089 res!677882) b!1009090))

(assert (= (and b!1009090 (not res!677883)) b!1009088))

(assert (= (and b!1009088 (not res!677881)) b!1009092))

(declare-fun m!933685 () Bool)

(assert (=> b!1009088 m!933685))

(assert (=> b!1009092 m!933685))

(declare-fun m!933687 () Bool)

(assert (=> d!119769 m!933687))

(assert (=> d!119769 m!933515))

(assert (=> b!1009090 m!933685))

(assert (=> b!1009091 m!933509))

(assert (=> b!1009091 m!933509))

(declare-fun m!933689 () Bool)

(assert (=> b!1009091 m!933689))

(assert (=> b!1008822 d!119769))

(declare-fun d!119771 () Bool)

(declare-fun res!677894 () Bool)

(declare-fun e!567754 () Bool)

(assert (=> d!119771 (=> res!677894 e!567754)))

(assert (=> d!119771 (= res!677894 (= (select (arr!30622 a!3219) #b00000000000000000000000000000000) k!2224))))

(assert (=> d!119771 (= (arrayContainsKey!0 a!3219 k!2224 #b00000000000000000000000000000000) e!567754)))

(declare-fun b!1009124 () Bool)

(declare-fun e!567755 () Bool)

(assert (=> b!1009124 (= e!567754 e!567755)))

(declare-fun res!677895 () Bool)

(assert (=> b!1009124 (=> (not res!677895) (not e!567755))))

(assert (=> b!1009124 (= res!677895 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31124 a!3219)))))

(declare-fun b!1009125 () Bool)

(assert (=> b!1009125 (= e!567755 (arrayContainsKey!0 a!3219 k!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119771 (not res!677894)) b!1009124))

(assert (= (and b!1009124 res!677895) b!1009125))

(assert (=> d!119771 m!933629))

(declare-fun m!933711 () Bool)

(assert (=> b!1009125 m!933711))

(assert (=> b!1008812 d!119771))

(declare-fun b!1009161 () Bool)

(declare-fun e!567777 () Bool)

(declare-fun e!567776 () Bool)

(assert (=> b!1009161 (= e!567777 e!567776)))

(declare-fun c!101783 () Bool)

(assert (=> b!1009161 (= c!101783 (validKeyInArray!0 (select (arr!30622 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!1009162 () Bool)

(declare-fun e!567778 () Bool)

(assert (=> b!1009162 (= e!567776 e!567778)))

(declare-fun lt!446027 () (_ BitVec 64))

(assert (=> b!1009162 (= lt!446027 (select (arr!30622 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!33018 0))(
  ( (Unit!33019) )
))
(declare-fun lt!446028 () Unit!33018)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!63602 (_ BitVec 64) (_ BitVec 32)) Unit!33018)

(assert (=> b!1009162 (= lt!446028 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446027 #b00000000000000000000000000000000))))

(assert (=> b!1009162 (arrayContainsKey!0 a!3219 lt!446027 #b00000000000000000000000000000000)))

(declare-fun lt!446026 () Unit!33018)

(assert (=> b!1009162 (= lt!446026 lt!446028)))

(declare-fun res!677904 () Bool)

(assert (=> b!1009162 (= res!677904 (= (seekEntryOrOpen!0 (select (arr!30622 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9554 #b00000000000000000000000000000000)))))

(assert (=> b!1009162 (=> (not res!677904) (not e!567778))))

(declare-fun bm!42377 () Bool)

(declare-fun call!42380 () Bool)

(assert (=> bm!42377 (= call!42380 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun d!119777 () Bool)

(declare-fun res!677903 () Bool)

(assert (=> d!119777 (=> res!677903 e!567777)))

(assert (=> d!119777 (= res!677903 (bvsge #b00000000000000000000000000000000 (size!31124 a!3219)))))

(assert (=> d!119777 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!567777)))

(declare-fun b!1009163 () Bool)

(assert (=> b!1009163 (= e!567776 call!42380)))

(declare-fun b!1009164 () Bool)

(assert (=> b!1009164 (= e!567778 call!42380)))

(assert (= (and d!119777 (not res!677903)) b!1009161))

(assert (= (and b!1009161 c!101783) b!1009162))

(assert (= (and b!1009161 (not c!101783)) b!1009163))

(assert (= (and b!1009162 res!677904) b!1009164))

(assert (= (or b!1009164 b!1009163) bm!42377))

(assert (=> b!1009161 m!933629))

(assert (=> b!1009161 m!933629))

(assert (=> b!1009161 m!933633))

(assert (=> b!1009162 m!933629))

(declare-fun m!933747 () Bool)

(assert (=> b!1009162 m!933747))

(declare-fun m!933749 () Bool)

(assert (=> b!1009162 m!933749))

(assert (=> b!1009162 m!933629))

(declare-fun m!933751 () Bool)

(assert (=> b!1009162 m!933751))

(declare-fun m!933753 () Bool)

(assert (=> bm!42377 m!933753))

(assert (=> b!1008821 d!119777))

(declare-fun d!119795 () Bool)

(declare-fun lt!446047 () SeekEntryResult!9554)

(assert (=> d!119795 (and (or (is-Undefined!9554 lt!446047) (not (is-Found!9554 lt!446047)) (and (bvsge (index!40588 lt!446047) #b00000000000000000000000000000000) (bvslt (index!40588 lt!446047) (size!31124 a!3219)))) (or (is-Undefined!9554 lt!446047) (is-Found!9554 lt!446047) (not (is-MissingZero!9554 lt!446047)) (and (bvsge (index!40587 lt!446047) #b00000000000000000000000000000000) (bvslt (index!40587 lt!446047) (size!31124 a!3219)))) (or (is-Undefined!9554 lt!446047) (is-Found!9554 lt!446047) (is-MissingZero!9554 lt!446047) (not (is-MissingVacant!9554 lt!446047)) (and (bvsge (index!40590 lt!446047) #b00000000000000000000000000000000) (bvslt (index!40590 lt!446047) (size!31124 a!3219)))) (or (is-Undefined!9554 lt!446047) (ite (is-Found!9554 lt!446047) (= (select (arr!30622 a!3219) (index!40588 lt!446047)) k!2224) (ite (is-MissingZero!9554 lt!446047) (= (select (arr!30622 a!3219) (index!40587 lt!446047)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9554 lt!446047) (= (select (arr!30622 a!3219) (index!40590 lt!446047)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!567800 () SeekEntryResult!9554)

(assert (=> d!119795 (= lt!446047 e!567800)))

(declare-fun c!101797 () Bool)

(declare-fun lt!446048 () SeekEntryResult!9554)

(assert (=> d!119795 (= c!101797 (and (is-Intermediate!9554 lt!446048) (undefined!10366 lt!446048)))))

(assert (=> d!119795 (= lt!446048 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2224 mask!3464) k!2224 a!3219 mask!3464))))

(assert (=> d!119795 (validMask!0 mask!3464)))

(assert (=> d!119795 (= (seekEntryOrOpen!0 k!2224 a!3219 mask!3464) lt!446047)))

(declare-fun b!1009198 () Bool)

(declare-fun e!567799 () SeekEntryResult!9554)

(assert (=> b!1009198 (= e!567799 (Found!9554 (index!40589 lt!446048)))))

(declare-fun b!1009199 () Bool)

(declare-fun c!101796 () Bool)

(declare-fun lt!446046 () (_ BitVec 64))

(assert (=> b!1009199 (= c!101796 (= lt!446046 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567801 () SeekEntryResult!9554)

(assert (=> b!1009199 (= e!567799 e!567801)))

(declare-fun b!1009200 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!63602 (_ BitVec 32)) SeekEntryResult!9554)

(assert (=> b!1009200 (= e!567801 (seekKeyOrZeroReturnVacant!0 (x!87976 lt!446048) (index!40589 lt!446048) (index!40589 lt!446048) k!2224 a!3219 mask!3464))))

(declare-fun b!1009201 () Bool)

(assert (=> b!1009201 (= e!567801 (MissingZero!9554 (index!40589 lt!446048)))))

(declare-fun b!1009202 () Bool)

(assert (=> b!1009202 (= e!567800 Undefined!9554)))

(declare-fun b!1009203 () Bool)

(assert (=> b!1009203 (= e!567800 e!567799)))

(assert (=> b!1009203 (= lt!446046 (select (arr!30622 a!3219) (index!40589 lt!446048)))))

(declare-fun c!101798 () Bool)

(assert (=> b!1009203 (= c!101798 (= lt!446046 k!2224))))

(assert (= (and d!119795 c!101797) b!1009202))

(assert (= (and d!119795 (not c!101797)) b!1009203))

(assert (= (and b!1009203 c!101798) b!1009198))

(assert (= (and b!1009203 (not c!101798)) b!1009199))

(assert (= (and b!1009199 c!101796) b!1009201))

(assert (= (and b!1009199 (not c!101796)) b!1009200))

(declare-fun m!933769 () Bool)

(assert (=> d!119795 m!933769))

(declare-fun m!933771 () Bool)

(assert (=> d!119795 m!933771))

(declare-fun m!933773 () Bool)

(assert (=> d!119795 m!933773))

(assert (=> d!119795 m!933769))

(declare-fun m!933775 () Bool)

(assert (=> d!119795 m!933775))

(assert (=> d!119795 m!933515))

(declare-fun m!933777 () Bool)

(assert (=> d!119795 m!933777))

(declare-fun m!933779 () Bool)

(assert (=> b!1009200 m!933779))

(declare-fun m!933781 () Bool)

(assert (=> b!1009203 m!933781))

(assert (=> b!1008819 d!119795))

(declare-fun b!1009204 () Bool)

(declare-fun e!567805 () SeekEntryResult!9554)

(declare-fun e!567802 () SeekEntryResult!9554)

(assert (=> b!1009204 (= e!567805 e!567802)))

(declare-fun lt!446049 () (_ BitVec 64))

(declare-fun c!101801 () Bool)

(assert (=> b!1009204 (= c!101801 (or (= lt!446049 (select (arr!30622 a!3219) j!170)) (= (bvadd lt!446049 lt!446049) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009205 () Bool)

(declare-fun lt!446050 () SeekEntryResult!9554)

(assert (=> b!1009205 (and (bvsge (index!40589 lt!446050) #b00000000000000000000000000000000) (bvslt (index!40589 lt!446050) (size!31124 a!3219)))))

(declare-fun res!677914 () Bool)

(assert (=> b!1009205 (= res!677914 (= (select (arr!30622 a!3219) (index!40589 lt!446050)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567804 () Bool)

(assert (=> b!1009205 (=> res!677914 e!567804)))

(declare-fun b!1009206 () Bool)

(declare-fun e!567806 () Bool)

(declare-fun e!567803 () Bool)

(assert (=> b!1009206 (= e!567806 e!567803)))

(declare-fun res!677915 () Bool)

(assert (=> b!1009206 (= res!677915 (and (is-Intermediate!9554 lt!446050) (not (undefined!10366 lt!446050)) (bvslt (x!87976 lt!446050) #b01111111111111111111111111111110) (bvsge (x!87976 lt!446050) #b00000000000000000000000000000000) (bvsge (x!87976 lt!446050) x!1245)))))

(assert (=> b!1009206 (=> (not res!677915) (not e!567803))))

(declare-fun b!1009207 () Bool)

(assert (=> b!1009207 (and (bvsge (index!40589 lt!446050) #b00000000000000000000000000000000) (bvslt (index!40589 lt!446050) (size!31124 a!3219)))))

(declare-fun res!677916 () Bool)

(assert (=> b!1009207 (= res!677916 (= (select (arr!30622 a!3219) (index!40589 lt!446050)) (select (arr!30622 a!3219) j!170)))))

(assert (=> b!1009207 (=> res!677916 e!567804)))

(assert (=> b!1009207 (= e!567803 e!567804)))

(declare-fun b!1009208 () Bool)

(assert (=> b!1009208 (= e!567802 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) (select (arr!30622 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009209 () Bool)

(assert (=> b!1009209 (and (bvsge (index!40589 lt!446050) #b00000000000000000000000000000000) (bvslt (index!40589 lt!446050) (size!31124 a!3219)))))

(assert (=> b!1009209 (= e!567804 (= (select (arr!30622 a!3219) (index!40589 lt!446050)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119805 () Bool)

(assert (=> d!119805 e!567806))

(declare-fun c!101799 () Bool)

(assert (=> d!119805 (= c!101799 (and (is-Intermediate!9554 lt!446050) (undefined!10366 lt!446050)))))

(assert (=> d!119805 (= lt!446050 e!567805)))

(declare-fun c!101800 () Bool)

(assert (=> d!119805 (= c!101800 (bvsge x!1245 #b01111111111111111111111111111110))))

(assert (=> d!119805 (= lt!446049 (select (arr!30622 a!3219) index!1507))))

(assert (=> d!119805 (validMask!0 mask!3464)))

(assert (=> d!119805 (= (seekKeyOrZeroOrLongMinValue!0 x!1245 index!1507 (select (arr!30622 a!3219) j!170) a!3219 mask!3464) lt!446050)))

(declare-fun b!1009210 () Bool)

(assert (=> b!1009210 (= e!567805 (Intermediate!9554 true index!1507 x!1245))))

(declare-fun b!1009211 () Bool)

(assert (=> b!1009211 (= e!567802 (Intermediate!9554 false index!1507 x!1245))))

(declare-fun b!1009212 () Bool)

(assert (=> b!1009212 (= e!567806 (bvsge (x!87976 lt!446050) #b01111111111111111111111111111110))))

(assert (= (and d!119805 c!101800) b!1009210))

(assert (= (and d!119805 (not c!101800)) b!1009204))

(assert (= (and b!1009204 c!101801) b!1009211))

(assert (= (and b!1009204 (not c!101801)) b!1009208))

(assert (= (and d!119805 c!101799) b!1009212))

(assert (= (and d!119805 (not c!101799)) b!1009206))

(assert (= (and b!1009206 res!677915) b!1009207))

(assert (= (and b!1009207 (not res!677916)) b!1009205))

(assert (= (and b!1009205 (not res!677914)) b!1009209))

(declare-fun m!933783 () Bool)

(assert (=> b!1009205 m!933783))

(assert (=> b!1009209 m!933783))

(declare-fun m!933785 () Bool)

(assert (=> d!119805 m!933785))

(assert (=> d!119805 m!933515))

(assert (=> b!1009207 m!933783))

(assert (=> b!1009208 m!933509))

(assert (=> b!1009208 m!933509))

(assert (=> b!1009208 m!933503))

(declare-fun m!933787 () Bool)

(assert (=> b!1009208 m!933787))

(assert (=> b!1008820 d!119805))

(declare-fun b!1009213 () Bool)

(declare-fun e!567810 () SeekEntryResult!9554)

(declare-fun e!567807 () SeekEntryResult!9554)

(assert (=> b!1009213 (= e!567810 e!567807)))

(declare-fun lt!446051 () (_ BitVec 64))

(declare-fun c!101804 () Bool)

(assert (=> b!1009213 (= c!101804 (or (= lt!446051 (select (arr!30622 a!3219) j!170)) (= (bvadd lt!446051 lt!446051) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009214 () Bool)

(declare-fun lt!446052 () SeekEntryResult!9554)

(assert (=> b!1009214 (and (bvsge (index!40589 lt!446052) #b00000000000000000000000000000000) (bvslt (index!40589 lt!446052) (size!31124 a!3219)))))

(declare-fun res!677917 () Bool)

(assert (=> b!1009214 (= res!677917 (= (select (arr!30622 a!3219) (index!40589 lt!446052)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567809 () Bool)

(assert (=> b!1009214 (=> res!677917 e!567809)))

(declare-fun b!1009215 () Bool)

(declare-fun e!567811 () Bool)

(declare-fun e!567808 () Bool)

(assert (=> b!1009215 (= e!567811 e!567808)))

(declare-fun res!677918 () Bool)

(assert (=> b!1009215 (= res!677918 (and (is-Intermediate!9554 lt!446052) (not (undefined!10366 lt!446052)) (bvslt (x!87976 lt!446052) #b01111111111111111111111111111110) (bvsge (x!87976 lt!446052) #b00000000000000000000000000000000) (bvsge (x!87976 lt!446052) #b00000000000000000000000000000000)))))

(assert (=> b!1009215 (=> (not res!677918) (not e!567808))))

(declare-fun b!1009216 () Bool)

(assert (=> b!1009216 (and (bvsge (index!40589 lt!446052) #b00000000000000000000000000000000) (bvslt (index!40589 lt!446052) (size!31124 a!3219)))))

(declare-fun res!677919 () Bool)

(assert (=> b!1009216 (= res!677919 (= (select (arr!30622 a!3219) (index!40589 lt!446052)) (select (arr!30622 a!3219) j!170)))))

(assert (=> b!1009216 (=> res!677919 e!567809)))

(assert (=> b!1009216 (= e!567808 e!567809)))

(declare-fun b!1009217 () Bool)

(assert (=> b!1009217 (= e!567807 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!30622 a!3219) j!170) mask!3464) #b00000000000000000000000000000000 mask!3464) (select (arr!30622 a!3219) j!170) a!3219 mask!3464))))

(declare-fun b!1009218 () Bool)

(assert (=> b!1009218 (and (bvsge (index!40589 lt!446052) #b00000000000000000000000000000000) (bvslt (index!40589 lt!446052) (size!31124 a!3219)))))

(assert (=> b!1009218 (= e!567809 (= (select (arr!30622 a!3219) (index!40589 lt!446052)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119807 () Bool)

(assert (=> d!119807 e!567811))

(declare-fun c!101802 () Bool)

(assert (=> d!119807 (= c!101802 (and (is-Intermediate!9554 lt!446052) (undefined!10366 lt!446052)))))

(assert (=> d!119807 (= lt!446052 e!567810)))

(declare-fun c!101803 () Bool)

(assert (=> d!119807 (= c!101803 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!119807 (= lt!446051 (select (arr!30622 a!3219) (toIndex!0 (select (arr!30622 a!3219) j!170) mask!3464)))))

(assert (=> d!119807 (validMask!0 mask!3464)))

(assert (=> d!119807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30622 a!3219) j!170) mask!3464) (select (arr!30622 a!3219) j!170) a!3219 mask!3464) lt!446052)))

(declare-fun b!1009219 () Bool)

(assert (=> b!1009219 (= e!567810 (Intermediate!9554 true (toIndex!0 (select (arr!30622 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009220 () Bool)

(assert (=> b!1009220 (= e!567807 (Intermediate!9554 false (toIndex!0 (select (arr!30622 a!3219) j!170) mask!3464) #b00000000000000000000000000000000))))

(declare-fun b!1009221 () Bool)

(assert (=> b!1009221 (= e!567811 (bvsge (x!87976 lt!446052) #b01111111111111111111111111111110))))

(assert (= (and d!119807 c!101803) b!1009219))

(assert (= (and d!119807 (not c!101803)) b!1009213))

(assert (= (and b!1009213 c!101804) b!1009220))

(assert (= (and b!1009213 (not c!101804)) b!1009217))

(assert (= (and d!119807 c!101802) b!1009221))

(assert (= (and d!119807 (not c!101802)) b!1009215))

(assert (= (and b!1009215 res!677918) b!1009216))

(assert (= (and b!1009216 (not res!677919)) b!1009214))

(assert (= (and b!1009214 (not res!677917)) b!1009218))

(declare-fun m!933789 () Bool)

(assert (=> b!1009214 m!933789))

(assert (=> b!1009218 m!933789))

(assert (=> d!119807 m!933505))

(declare-fun m!933791 () Bool)

(assert (=> d!119807 m!933791))

(assert (=> d!119807 m!933515))

(assert (=> b!1009216 m!933789))

(assert (=> b!1009217 m!933505))

(declare-fun m!933793 () Bool)

(assert (=> b!1009217 m!933793))

(assert (=> b!1009217 m!933793))

(assert (=> b!1009217 m!933503))

(declare-fun m!933795 () Bool)

(assert (=> b!1009217 m!933795))

(assert (=> b!1008818 d!119807))

(declare-fun d!119809 () Bool)

(declare-fun lt!446054 () (_ BitVec 32))

(declare-fun lt!446053 () (_ BitVec 32))

(assert (=> d!119809 (= lt!446054 (bvmul (bvxor lt!446053 (bvlshr lt!446053 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!119809 (= lt!446053 ((_ extract 31 0) (bvand (bvxor (select (arr!30622 a!3219) j!170) (bvlshr (select (arr!30622 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!119809 (and (bvsge mask!3464 #b00000000000000000000000000000000) (let ((res!677880 (let ((h!22485 ((_ extract 31 0) (bvand (bvxor (select (arr!30622 a!3219) j!170) (bvlshr (select (arr!30622 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!87984 (bvmul (bvxor h!22485 (bvlshr h!22485 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!87984 (bvlshr x!87984 #b00000000000000000000000000001101)) mask!3464))))) (and (bvslt res!677880 (bvadd mask!3464 #b00000000000000000000000000000001)) (bvsge res!677880 #b00000000000000000000000000000000))))))

(assert (=> d!119809 (= (toIndex!0 (select (arr!30622 a!3219) j!170) mask!3464) (bvand (bvxor lt!446054 (bvlshr lt!446054 #b00000000000000000000000000001101)) mask!3464))))

(assert (=> b!1008818 d!119809))

(push 1)

(assert (not b!1009070))

(assert (not bm!42367))

(assert (not d!119795))

(assert (not b!1009208))

(assert (not b!1009200))

(assert (not b!1009125))

(assert (not d!119807))

(assert (not b!1009161))

(assert (not d!119769))

(assert (not d!119743))

(assert (not b!1009162))

(assert (not b!1009091))

(assert (not d!119767))

(assert (not b!1008989))

(assert (not b!1009217))

(assert (not b!1008990))

(assert (not b!1008987))

(assert (not d!119805))

(assert (not bm!42377))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1009322 () Bool)

(declare-fun e!567872 () SeekEntryResult!9554)

(declare-fun e!567874 () SeekEntryResult!9554)

(assert (=> b!1009322 (= e!567872 e!567874)))

(declare-fun c!101840 () Bool)

(declare-fun lt!446091 () (_ BitVec 64))

(assert (=> b!1009322 (= c!101840 (= lt!446091 k!2224))))

(declare-fun b!1009323 () Bool)

(declare-fun e!567873 () SeekEntryResult!9554)

(assert (=> b!1009323 (= e!567873 (seekKeyOrZeroReturnVacant!0 (bvadd (x!87976 lt!446048) #b00000000000000000000000000000001) (nextIndex!0 (index!40589 lt!446048) (x!87976 lt!446048) mask!3464) (index!40589 lt!446048) k!2224 a!3219 mask!3464))))

(declare-fun b!1009325 () Bool)

(declare-fun c!101841 () Bool)

(assert (=> b!1009325 (= c!101841 (= lt!446091 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1009325 (= e!567874 e!567873)))

(declare-fun b!1009326 () Bool)

(assert (=> b!1009326 (= e!567873 (MissingVacant!9554 (index!40589 lt!446048)))))

(declare-fun b!1009327 () Bool)

(assert (=> b!1009327 (= e!567874 (Found!9554 (index!40589 lt!446048)))))

(declare-fun b!1009324 () Bool)

(assert (=> b!1009324 (= e!567872 Undefined!9554)))

(declare-fun lt!446092 () SeekEntryResult!9554)

(declare-fun d!119847 () Bool)

(assert (=> d!119847 (and (or (is-Undefined!9554 lt!446092) (not (is-Found!9554 lt!446092)) (and (bvsge (index!40588 lt!446092) #b00000000000000000000000000000000) (bvslt (index!40588 lt!446092) (size!31124 a!3219)))) (or (is-Undefined!9554 lt!446092) (is-Found!9554 lt!446092) (not (is-MissingVacant!9554 lt!446092)) (not (= (index!40590 lt!446092) (index!40589 lt!446048))) (and (bvsge (index!40590 lt!446092) #b00000000000000000000000000000000) (bvslt (index!40590 lt!446092) (size!31124 a!3219)))) (or (is-Undefined!9554 lt!446092) (ite (is-Found!9554 lt!446092) (= (select (arr!30622 a!3219) (index!40588 lt!446092)) k!2224) (and (is-MissingVacant!9554 lt!446092) (= (index!40590 lt!446092) (index!40589 lt!446048)) (= (select (arr!30622 a!3219) (index!40590 lt!446092)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!119847 (= lt!446092 e!567872)))

(declare-fun c!101842 () Bool)

(assert (=> d!119847 (= c!101842 (bvsge (x!87976 lt!446048) #b01111111111111111111111111111110))))

(assert (=> d!119847 (= lt!446091 (select (arr!30622 a!3219) (index!40589 lt!446048)))))

(assert (=> d!119847 (validMask!0 mask!3464)))

(assert (=> d!119847 (= (seekKeyOrZeroReturnVacant!0 (x!87976 lt!446048) (index!40589 lt!446048) (index!40589 lt!446048) k!2224 a!3219 mask!3464) lt!446092)))

(assert (= (and d!119847 c!101842) b!1009324))

(assert (= (and d!119847 (not c!101842)) b!1009322))

(assert (= (and b!1009322 c!101840) b!1009327))

(assert (= (and b!1009322 (not c!101840)) b!1009325))

(assert (= (and b!1009325 c!101841) b!1009326))

(assert (= (and b!1009325 (not c!101841)) b!1009323))

(declare-fun m!933889 () Bool)

(assert (=> b!1009323 m!933889))

(assert (=> b!1009323 m!933889))

(declare-fun m!933891 () Bool)

(assert (=> b!1009323 m!933891))

(declare-fun m!933893 () Bool)

(assert (=> d!119847 m!933893))

(declare-fun m!933895 () Bool)

(assert (=> d!119847 m!933895))

(assert (=> d!119847 m!933781))

(assert (=> d!119847 m!933515))

(assert (=> b!1009200 d!119847))

(declare-fun d!119849 () Bool)

(assert (=> d!119849 (arrayContainsKey!0 a!3219 lt!446027 #b00000000000000000000000000000000)))

(declare-fun lt!446095 () Unit!33018)

(declare-fun choose!13 (array!63602 (_ BitVec 64) (_ BitVec 32)) Unit!33018)

(assert (=> d!119849 (= lt!446095 (choose!13 a!3219 lt!446027 #b00000000000000000000000000000000))))

(assert (=> d!119849 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!119849 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!446027 #b00000000000000000000000000000000) lt!446095)))

(declare-fun bs!28701 () Bool)

(assert (= bs!28701 d!119849))

(assert (=> bs!28701 m!933749))

(declare-fun m!933897 () Bool)

(assert (=> bs!28701 m!933897))

(assert (=> b!1009162 d!119849))

(declare-fun d!119851 () Bool)

(declare-fun res!677953 () Bool)

(declare-fun e!567875 () Bool)

(assert (=> d!119851 (=> res!677953 e!567875)))

(assert (=> d!119851 (= res!677953 (= (select (arr!30622 a!3219) #b00000000000000000000000000000000) lt!446027))))

(assert (=> d!119851 (= (arrayContainsKey!0 a!3219 lt!446027 #b00000000000000000000000000000000) e!567875)))

(declare-fun b!1009328 () Bool)

(declare-fun e!567876 () Bool)

(assert (=> b!1009328 (= e!567875 e!567876)))

(declare-fun res!677954 () Bool)

(assert (=> b!1009328 (=> (not res!677954) (not e!567876))))

(assert (=> b!1009328 (= res!677954 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!31124 a!3219)))))

(declare-fun b!1009329 () Bool)

(assert (=> b!1009329 (= e!567876 (arrayContainsKey!0 a!3219 lt!446027 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!119851 (not res!677953)) b!1009328))

(assert (= (and b!1009328 res!677954) b!1009329))

(assert (=> d!119851 m!933629))

(declare-fun m!933899 () Bool)

(assert (=> b!1009329 m!933899))

(assert (=> b!1009162 d!119851))

(declare-fun d!119853 () Bool)

(declare-fun lt!446097 () SeekEntryResult!9554)

(assert (=> d!119853 (and (or (is-Undefined!9554 lt!446097) (not (is-Found!9554 lt!446097)) (and (bvsge (index!40588 lt!446097) #b00000000000000000000000000000000) (bvslt (index!40588 lt!446097) (size!31124 a!3219)))) (or (is-Undefined!9554 lt!446097) (is-Found!9554 lt!446097) (not (is-MissingZero!9554 lt!446097)) (and (bvsge (index!40587 lt!446097) #b00000000000000000000000000000000) (bvslt (index!40587 lt!446097) (size!31124 a!3219)))) (or (is-Undefined!9554 lt!446097) (is-Found!9554 lt!446097) (is-MissingZero!9554 lt!446097) (not (is-MissingVacant!9554 lt!446097)) (and (bvsge (index!40590 lt!446097) #b00000000000000000000000000000000) (bvslt (index!40590 lt!446097) (size!31124 a!3219)))) (or (is-Undefined!9554 lt!446097) (ite (is-Found!9554 lt!446097) (= (select (arr!30622 a!3219) (index!40588 lt!446097)) (select (arr!30622 a!3219) #b00000000000000000000000000000000)) (ite (is-MissingZero!9554 lt!446097) (= (select (arr!30622 a!3219) (index!40587 lt!446097)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!9554 lt!446097) (= (select (arr!30622 a!3219) (index!40590 lt!446097)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!567878 () SeekEntryResult!9554)

(assert (=> d!119853 (= lt!446097 e!567878)))

(declare-fun c!101844 () Bool)

(declare-fun lt!446098 () SeekEntryResult!9554)

(assert (=> d!119853 (= c!101844 (and (is-Intermediate!9554 lt!446098) (undefined!10366 lt!446098)))))

(assert (=> d!119853 (= lt!446098 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!30622 a!3219) #b00000000000000000000000000000000) mask!3464) (select (arr!30622 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464))))

(assert (=> d!119853 (validMask!0 mask!3464)))

(assert (=> d!119853 (= (seekEntryOrOpen!0 (select (arr!30622 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) lt!446097)))

(declare-fun b!1009330 () Bool)

(declare-fun e!567877 () SeekEntryResult!9554)

(assert (=> b!1009330 (= e!567877 (Found!9554 (index!40589 lt!446098)))))

(declare-fun b!1009331 () Bool)

(declare-fun c!101843 () Bool)

(declare-fun lt!446096 () (_ BitVec 64))

(assert (=> b!1009331 (= c!101843 (= lt!446096 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567879 () SeekEntryResult!9554)

(assert (=> b!1009331 (= e!567877 e!567879)))

(declare-fun b!1009332 () Bool)

(assert (=> b!1009332 (= e!567879 (seekKeyOrZeroReturnVacant!0 (x!87976 lt!446098) (index!40589 lt!446098) (index!40589 lt!446098) (select (arr!30622 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464))))

(declare-fun b!1009333 () Bool)

(assert (=> b!1009333 (= e!567879 (MissingZero!9554 (index!40589 lt!446098)))))

(declare-fun b!1009334 () Bool)

(assert (=> b!1009334 (= e!567878 Undefined!9554)))

(declare-fun b!1009335 () Bool)

(assert (=> b!1009335 (= e!567878 e!567877)))

(assert (=> b!1009335 (= lt!446096 (select (arr!30622 a!3219) (index!40589 lt!446098)))))

(declare-fun c!101845 () Bool)

(assert (=> b!1009335 (= c!101845 (= lt!446096 (select (arr!30622 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!119853 c!101844) b!1009334))

(assert (= (and d!119853 (not c!101844)) b!1009335))

(assert (= (and b!1009335 c!101845) b!1009330))

(assert (= (and b!1009335 (not c!101845)) b!1009331))

(assert (= (and b!1009331 c!101843) b!1009333))

(assert (= (and b!1009331 (not c!101843)) b!1009332))

(declare-fun m!933901 () Bool)

(assert (=> d!119853 m!933901))

(assert (=> d!119853 m!933629))

(declare-fun m!933903 () Bool)

(assert (=> d!119853 m!933903))

(declare-fun m!933905 () Bool)

(assert (=> d!119853 m!933905))

(assert (=> d!119853 m!933629))

(assert (=> d!119853 m!933901))

(declare-fun m!933907 () Bool)

(assert (=> d!119853 m!933907))

(assert (=> d!119853 m!933515))

(declare-fun m!933909 () Bool)

(assert (=> d!119853 m!933909))

(assert (=> b!1009332 m!933629))

(declare-fun m!933911 () Bool)

(assert (=> b!1009332 m!933911))

(declare-fun m!933913 () Bool)

(assert (=> b!1009335 m!933913))

(assert (=> b!1009162 d!119853))

(declare-fun b!1009336 () Bool)

(declare-fun e!567883 () SeekEntryResult!9554)

(declare-fun e!567880 () SeekEntryResult!9554)

(assert (=> b!1009336 (= e!567883 e!567880)))

(declare-fun c!101848 () Bool)

(declare-fun lt!446099 () (_ BitVec 64))

(assert (=> b!1009336 (= c!101848 (or (= lt!446099 lt!445885) (= (bvadd lt!446099 lt!446099) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1009337 () Bool)

(declare-fun lt!446100 () SeekEntryResult!9554)

(assert (=> b!1009337 (and (bvsge (index!40589 lt!446100) #b00000000000000000000000000000000) (bvslt (index!40589 lt!446100) (size!31124 lt!445884)))))

(declare-fun res!677955 () Bool)

(assert (=> b!1009337 (= res!677955 (= (select (arr!30622 lt!445884) (index!40589 lt!446100)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!567882 () Bool)

(assert (=> b!1009337 (=> res!677955 e!567882)))

(declare-fun b!1009338 () Bool)

(declare-fun e!567884 () Bool)

(declare-fun e!567881 () Bool)

(assert (=> b!1009338 (= e!567884 e!567881)))

(declare-fun res!677956 () Bool)

(assert (=> b!1009338 (= res!677956 (and (is-Intermediate!9554 lt!446100) (not (undefined!10366 lt!446100)) (bvslt (x!87976 lt!446100) #b01111111111111111111111111111110) (bvsge (x!87976 lt!446100) #b00000000000000000000000000000000) (bvsge (x!87976 lt!446100) (bvadd x!1245 #b00000000000000000000000000000001))))))

(assert (=> b!1009338 (=> (not res!677956) (not e!567881))))

(declare-fun b!1009339 () Bool)

(assert (=> b!1009339 (and (bvsge (index!40589 lt!446100) #b00000000000000000000000000000000) (bvslt (index!40589 lt!446100) (size!31124 lt!445884)))))

(declare-fun res!677957 () Bool)

(assert (=> b!1009339 (= res!677957 (= (select (arr!30622 lt!445884) (index!40589 lt!446100)) lt!445885))))

(assert (=> b!1009339 (=> res!677957 e!567882)))

(assert (=> b!1009339 (= e!567881 e!567882)))

(declare-fun b!1009340 () Bool)

(assert (=> b!1009340 (= e!567880 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (nextIndex!0 (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001) mask!3464) lt!445885 lt!445884 mask!3464))))

(declare-fun b!1009341 () Bool)

(assert (=> b!1009341 (and (bvsge (index!40589 lt!446100) #b00000000000000000000000000000000) (bvslt (index!40589 lt!446100) (size!31124 lt!445884)))))

(assert (=> b!1009341 (= e!567882 (= (select (arr!30622 lt!445884) (index!40589 lt!446100)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun d!119855 () Bool)

(assert (=> d!119855 e!567884))

(declare-fun c!101846 () Bool)

(assert (=> d!119855 (= c!101846 (and (is-Intermediate!9554 lt!446100) (undefined!10366 lt!446100)))))

(assert (=> d!119855 (= lt!446100 e!567883)))

(declare-fun c!101847 () Bool)

(assert (=> d!119855 (= c!101847 (bvsge (bvadd x!1245 #b00000000000000000000000000000001) #b01111111111111111111111111111110))))

(assert (=> d!119855 (= lt!446099 (select (arr!30622 lt!445884) (nextIndex!0 index!1507 x!1245 mask!3464)))))

(assert (=> d!119855 (validMask!0 mask!3464)))

(assert (=> d!119855 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1245 #b00000000000000000000000000000001) (nextIndex!0 index!1507 x!1245 mask!3464) lt!445885 lt!445884 mask!3464) lt!446100)))

(declare-fun b!1009342 () Bool)

(assert (=> b!1009342 (= e!567883 (Intermediate!9554 true (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1009343 () Bool)

(assert (=> b!1009343 (= e!567880 (Intermediate!9554 false (nextIndex!0 index!1507 x!1245 mask!3464) (bvadd x!1245 #b00000000000000000000000000000001)))))

(declare-fun b!1009344 () Bool)

(assert (=> b!1009344 (= e!567884 (bvsge (x!87976 lt!446100) #b01111111111111111111111111111110))))

(assert (= (and d!119855 c!101847) b!1009342))

(assert (= (and d!119855 (not c!101847)) b!1009336))

(assert (= (and b!1009336 c!101848) b!1009343))

(assert (= (and b!1009336 (not c!101848)) b!1009340))

(assert (= (and d!119855 c!101846) b!1009344))

(assert (= (and d!119855 (not c!101846)) b!1009338))

(assert (= (and b!1009338 res!677956) b!1009339))

(assert (= (and b!1009339 (not res!677957)) b!1009337))

(assert (= (and b!1009337 (not res!677955)) b!1009341))

(declare-fun m!933915 () Bool)

(assert (=> b!1009337 m!933915))

(assert (=> b!1009341 m!933915))

(assert (=> d!119855 m!933509))

(declare-fun m!933917 () Bool)

(assert (=> d!119855 m!933917))

(assert (=> d!119855 m!933515))

(assert (=> b!1009339 m!933915))

