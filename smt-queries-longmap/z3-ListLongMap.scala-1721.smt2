; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31726 () Bool)

(assert start!31726)

(declare-fun b!317049 () Bool)

(declare-datatypes ((array!16148 0))(
  ( (array!16149 (arr!7641 (Array (_ BitVec 32) (_ BitVec 64))) (size!7993 (_ BitVec 32))) )
))
(declare-fun lt!154788 () array!16148)

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun e!197146 () Bool)

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun lt!154789 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2781 0))(
  ( (MissingZero!2781 (index!13300 (_ BitVec 32))) (Found!2781 (index!13301 (_ BitVec 32))) (Intermediate!2781 (undefined!3593 Bool) (index!13302 (_ BitVec 32)) (x!31557 (_ BitVec 32))) (Undefined!2781) (MissingVacant!2781 (index!13303 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16148 (_ BitVec 32)) SeekEntryResult!2781)

(assert (=> b!317049 (= e!197146 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154788 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154789 k0!2441 lt!154788 mask!3709))))))

(declare-fun a!3293 () array!16148)

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317049 (= lt!154788 (array!16149 (store (arr!7641 a!3293) i!1240 k0!2441) (size!7993 a!3293)))))

(declare-fun lt!154791 () SeekEntryResult!2781)

(assert (=> b!317049 (= lt!154791 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154789 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317049 (= lt!154789 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317051 () Bool)

(declare-fun res!171828 () Bool)

(declare-fun e!197143 () Bool)

(assert (=> b!317051 (=> (not res!171828) (not e!197143))))

(declare-fun arrayContainsKey!0 (array!16148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317051 (= res!171828 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!317052 () Bool)

(declare-fun e!197144 () Bool)

(assert (=> b!317052 (= e!197144 e!197146)))

(declare-fun res!171831 () Bool)

(assert (=> b!317052 (=> (not res!171831) (not e!197146))))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun lt!154790 () SeekEntryResult!2781)

(assert (=> b!317052 (= res!171831 (and (= lt!154791 lt!154790) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7641 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(assert (=> b!317052 (= lt!154791 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!317053 () Bool)

(declare-fun res!171826 () Bool)

(assert (=> b!317053 (=> (not res!171826) (not e!197143))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16148 (_ BitVec 32)) SeekEntryResult!2781)

(assert (=> b!317053 (= res!171826 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2781 i!1240)))))

(declare-fun b!317054 () Bool)

(assert (=> b!317054 (= e!197143 e!197144)))

(declare-fun res!171829 () Bool)

(assert (=> b!317054 (=> (not res!171829) (not e!197144))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317054 (= res!171829 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154790))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317054 (= lt!154790 (Intermediate!2781 false resIndex!52 resX!52))))

(declare-fun b!317055 () Bool)

(declare-fun res!171823 () Bool)

(assert (=> b!317055 (=> (not res!171823) (not e!197143))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317055 (= res!171823 (validKeyInArray!0 k0!2441))))

(declare-fun res!171827 () Bool)

(assert (=> start!31726 (=> (not res!171827) (not e!197143))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31726 (= res!171827 (validMask!0 mask!3709))))

(assert (=> start!31726 e!197143))

(declare-fun array_inv!5604 (array!16148) Bool)

(assert (=> start!31726 (array_inv!5604 a!3293)))

(assert (=> start!31726 true))

(declare-fun b!317050 () Bool)

(declare-fun res!171824 () Bool)

(assert (=> b!317050 (=> (not res!171824) (not e!197143))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16148 (_ BitVec 32)) Bool)

(assert (=> b!317050 (= res!171824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!317056 () Bool)

(declare-fun res!171830 () Bool)

(assert (=> b!317056 (=> (not res!171830) (not e!197143))))

(assert (=> b!317056 (= res!171830 (and (= (size!7993 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7993 a!3293))))))

(declare-fun b!317057 () Bool)

(declare-fun res!171825 () Bool)

(assert (=> b!317057 (=> (not res!171825) (not e!197144))))

(assert (=> b!317057 (= res!171825 (and (= (select (arr!7641 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7993 a!3293))))))

(assert (= (and start!31726 res!171827) b!317056))

(assert (= (and b!317056 res!171830) b!317055))

(assert (= (and b!317055 res!171823) b!317051))

(assert (= (and b!317051 res!171828) b!317053))

(assert (= (and b!317053 res!171826) b!317050))

(assert (= (and b!317050 res!171824) b!317054))

(assert (= (and b!317054 res!171829) b!317057))

(assert (= (and b!317057 res!171825) b!317052))

(assert (= (and b!317052 res!171831) b!317049))

(declare-fun m!325795 () Bool)

(assert (=> b!317053 m!325795))

(declare-fun m!325797 () Bool)

(assert (=> b!317052 m!325797))

(declare-fun m!325799 () Bool)

(assert (=> b!317052 m!325799))

(declare-fun m!325801 () Bool)

(assert (=> b!317055 m!325801))

(declare-fun m!325803 () Bool)

(assert (=> b!317049 m!325803))

(declare-fun m!325805 () Bool)

(assert (=> b!317049 m!325805))

(declare-fun m!325807 () Bool)

(assert (=> b!317049 m!325807))

(declare-fun m!325809 () Bool)

(assert (=> b!317049 m!325809))

(declare-fun m!325811 () Bool)

(assert (=> b!317049 m!325811))

(declare-fun m!325813 () Bool)

(assert (=> b!317051 m!325813))

(declare-fun m!325815 () Bool)

(assert (=> b!317054 m!325815))

(assert (=> b!317054 m!325815))

(declare-fun m!325817 () Bool)

(assert (=> b!317054 m!325817))

(declare-fun m!325819 () Bool)

(assert (=> b!317050 m!325819))

(declare-fun m!325821 () Bool)

(assert (=> b!317057 m!325821))

(declare-fun m!325823 () Bool)

(assert (=> start!31726 m!325823))

(declare-fun m!325825 () Bool)

(assert (=> start!31726 m!325825))

(check-sat (not b!317054) (not b!317055) (not b!317051) (not b!317053) (not start!31726) (not b!317050) (not b!317052) (not b!317049))
(check-sat)
(get-model)

(declare-fun d!69121 () Bool)

(assert (=> d!69121 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!317055 d!69121))

(declare-fun b!317093 () Bool)

(declare-fun e!197167 () Bool)

(declare-fun e!197165 () Bool)

(assert (=> b!317093 (= e!197167 e!197165)))

(declare-fun lt!154810 () (_ BitVec 64))

(assert (=> b!317093 (= lt!154810 (select (arr!7641 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9788 0))(
  ( (Unit!9789) )
))
(declare-fun lt!154812 () Unit!9788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16148 (_ BitVec 64) (_ BitVec 32)) Unit!9788)

(assert (=> b!317093 (= lt!154812 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154810 #b00000000000000000000000000000000))))

(assert (=> b!317093 (arrayContainsKey!0 a!3293 lt!154810 #b00000000000000000000000000000000)))

(declare-fun lt!154811 () Unit!9788)

(assert (=> b!317093 (= lt!154811 lt!154812)))

(declare-fun res!171864 () Bool)

(assert (=> b!317093 (= res!171864 (= (seekEntryOrOpen!0 (select (arr!7641 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2781 #b00000000000000000000000000000000)))))

(assert (=> b!317093 (=> (not res!171864) (not e!197165))))

(declare-fun bm!26017 () Bool)

(declare-fun call!26020 () Bool)

(assert (=> bm!26017 (= call!26020 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!317094 () Bool)

(assert (=> b!317094 (= e!197165 call!26020)))

(declare-fun b!317095 () Bool)

(assert (=> b!317095 (= e!197167 call!26020)))

(declare-fun d!69123 () Bool)

(declare-fun res!171863 () Bool)

(declare-fun e!197166 () Bool)

(assert (=> d!69123 (=> res!171863 e!197166)))

(assert (=> d!69123 (= res!171863 (bvsge #b00000000000000000000000000000000 (size!7993 a!3293)))))

(assert (=> d!69123 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!197166)))

(declare-fun b!317096 () Bool)

(assert (=> b!317096 (= e!197166 e!197167)))

(declare-fun c!50235 () Bool)

(assert (=> b!317096 (= c!50235 (validKeyInArray!0 (select (arr!7641 a!3293) #b00000000000000000000000000000000)))))

(assert (= (and d!69123 (not res!171863)) b!317096))

(assert (= (and b!317096 c!50235) b!317093))

(assert (= (and b!317096 (not c!50235)) b!317095))

(assert (= (and b!317093 res!171864) b!317094))

(assert (= (or b!317094 b!317095) bm!26017))

(declare-fun m!325859 () Bool)

(assert (=> b!317093 m!325859))

(declare-fun m!325861 () Bool)

(assert (=> b!317093 m!325861))

(declare-fun m!325863 () Bool)

(assert (=> b!317093 m!325863))

(assert (=> b!317093 m!325859))

(declare-fun m!325865 () Bool)

(assert (=> b!317093 m!325865))

(declare-fun m!325867 () Bool)

(assert (=> bm!26017 m!325867))

(assert (=> b!317096 m!325859))

(assert (=> b!317096 m!325859))

(declare-fun m!325869 () Bool)

(assert (=> b!317096 m!325869))

(assert (=> b!317050 d!69123))

(declare-fun d!69129 () Bool)

(declare-fun res!171869 () Bool)

(declare-fun e!197172 () Bool)

(assert (=> d!69129 (=> res!171869 e!197172)))

(assert (=> d!69129 (= res!171869 (= (select (arr!7641 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!69129 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!197172)))

(declare-fun b!317101 () Bool)

(declare-fun e!197173 () Bool)

(assert (=> b!317101 (= e!197172 e!197173)))

(declare-fun res!171870 () Bool)

(assert (=> b!317101 (=> (not res!171870) (not e!197173))))

(assert (=> b!317101 (= res!171870 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7993 a!3293)))))

(declare-fun b!317102 () Bool)

(assert (=> b!317102 (= e!197173 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69129 (not res!171869)) b!317101))

(assert (= (and b!317101 res!171870) b!317102))

(assert (=> d!69129 m!325859))

(declare-fun m!325871 () Bool)

(assert (=> b!317102 m!325871))

(assert (=> b!317051 d!69129))

(declare-fun b!317184 () Bool)

(declare-fun e!197220 () SeekEntryResult!2781)

(assert (=> b!317184 (= e!197220 (Intermediate!2781 true index!1781 x!1427))))

(declare-fun d!69131 () Bool)

(declare-fun e!197221 () Bool)

(assert (=> d!69131 e!197221))

(declare-fun c!50267 () Bool)

(declare-fun lt!154837 () SeekEntryResult!2781)

(get-info :version)

(assert (=> d!69131 (= c!50267 (and ((_ is Intermediate!2781) lt!154837) (undefined!3593 lt!154837)))))

(assert (=> d!69131 (= lt!154837 e!197220)))

(declare-fun c!50268 () Bool)

(assert (=> d!69131 (= c!50268 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154836 () (_ BitVec 64))

(assert (=> d!69131 (= lt!154836 (select (arr!7641 a!3293) index!1781))))

(assert (=> d!69131 (validMask!0 mask!3709)))

(assert (=> d!69131 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709) lt!154837)))

(declare-fun b!317185 () Bool)

(assert (=> b!317185 (and (bvsge (index!13302 lt!154837) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154837) (size!7993 a!3293)))))

(declare-fun e!197219 () Bool)

(assert (=> b!317185 (= e!197219 (= (select (arr!7641 a!3293) (index!13302 lt!154837)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317186 () Bool)

(assert (=> b!317186 (and (bvsge (index!13302 lt!154837) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154837) (size!7993 a!3293)))))

(declare-fun res!171894 () Bool)

(assert (=> b!317186 (= res!171894 (= (select (arr!7641 a!3293) (index!13302 lt!154837)) k0!2441))))

(assert (=> b!317186 (=> res!171894 e!197219)))

(declare-fun e!197218 () Bool)

(assert (=> b!317186 (= e!197218 e!197219)))

(declare-fun b!317187 () Bool)

(declare-fun e!197222 () SeekEntryResult!2781)

(assert (=> b!317187 (= e!197220 e!197222)))

(declare-fun c!50266 () Bool)

(assert (=> b!317187 (= c!50266 (or (= lt!154836 k0!2441) (= (bvadd lt!154836 lt!154836) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317188 () Bool)

(assert (=> b!317188 (= e!197221 e!197218)))

(declare-fun res!171892 () Bool)

(assert (=> b!317188 (= res!171892 (and ((_ is Intermediate!2781) lt!154837) (not (undefined!3593 lt!154837)) (bvslt (x!31557 lt!154837) #b01111111111111111111111111111110) (bvsge (x!31557 lt!154837) #b00000000000000000000000000000000) (bvsge (x!31557 lt!154837) x!1427)))))

(assert (=> b!317188 (=> (not res!171892) (not e!197218))))

(declare-fun b!317189 () Bool)

(assert (=> b!317189 (= e!197222 (Intermediate!2781 false index!1781 x!1427))))

(declare-fun b!317190 () Bool)

(assert (=> b!317190 (and (bvsge (index!13302 lt!154837) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154837) (size!7993 a!3293)))))

(declare-fun res!171893 () Bool)

(assert (=> b!317190 (= res!171893 (= (select (arr!7641 a!3293) (index!13302 lt!154837)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317190 (=> res!171893 e!197219)))

(declare-fun b!317191 () Bool)

(assert (=> b!317191 (= e!197221 (bvsge (x!31557 lt!154837) #b01111111111111111111111111111110))))

(declare-fun b!317192 () Bool)

(assert (=> b!317192 (= e!197222 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69131 c!50268) b!317184))

(assert (= (and d!69131 (not c!50268)) b!317187))

(assert (= (and b!317187 c!50266) b!317189))

(assert (= (and b!317187 (not c!50266)) b!317192))

(assert (= (and d!69131 c!50267) b!317191))

(assert (= (and d!69131 (not c!50267)) b!317188))

(assert (= (and b!317188 res!171892) b!317186))

(assert (= (and b!317186 (not res!171894)) b!317190))

(assert (= (and b!317190 (not res!171893)) b!317185))

(assert (=> d!69131 m!325797))

(assert (=> d!69131 m!325823))

(declare-fun m!325903 () Bool)

(assert (=> b!317185 m!325903))

(assert (=> b!317186 m!325903))

(assert (=> b!317190 m!325903))

(assert (=> b!317192 m!325811))

(assert (=> b!317192 m!325811))

(declare-fun m!325905 () Bool)

(assert (=> b!317192 m!325905))

(assert (=> b!317052 d!69131))

(declare-fun b!317241 () Bool)

(declare-fun e!197250 () SeekEntryResult!2781)

(declare-fun e!197251 () SeekEntryResult!2781)

(assert (=> b!317241 (= e!197250 e!197251)))

(declare-fun lt!154857 () (_ BitVec 64))

(declare-fun lt!154855 () SeekEntryResult!2781)

(assert (=> b!317241 (= lt!154857 (select (arr!7641 a!3293) (index!13302 lt!154855)))))

(declare-fun c!50289 () Bool)

(assert (=> b!317241 (= c!50289 (= lt!154857 k0!2441))))

(declare-fun b!317242 () Bool)

(assert (=> b!317242 (= e!197251 (Found!2781 (index!13302 lt!154855)))))

(declare-fun d!69141 () Bool)

(declare-fun lt!154856 () SeekEntryResult!2781)

(assert (=> d!69141 (and (or ((_ is Undefined!2781) lt!154856) (not ((_ is Found!2781) lt!154856)) (and (bvsge (index!13301 lt!154856) #b00000000000000000000000000000000) (bvslt (index!13301 lt!154856) (size!7993 a!3293)))) (or ((_ is Undefined!2781) lt!154856) ((_ is Found!2781) lt!154856) (not ((_ is MissingZero!2781) lt!154856)) (and (bvsge (index!13300 lt!154856) #b00000000000000000000000000000000) (bvslt (index!13300 lt!154856) (size!7993 a!3293)))) (or ((_ is Undefined!2781) lt!154856) ((_ is Found!2781) lt!154856) ((_ is MissingZero!2781) lt!154856) (not ((_ is MissingVacant!2781) lt!154856)) (and (bvsge (index!13303 lt!154856) #b00000000000000000000000000000000) (bvslt (index!13303 lt!154856) (size!7993 a!3293)))) (or ((_ is Undefined!2781) lt!154856) (ite ((_ is Found!2781) lt!154856) (= (select (arr!7641 a!3293) (index!13301 lt!154856)) k0!2441) (ite ((_ is MissingZero!2781) lt!154856) (= (select (arr!7641 a!3293) (index!13300 lt!154856)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2781) lt!154856) (= (select (arr!7641 a!3293) (index!13303 lt!154856)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!69141 (= lt!154856 e!197250)))

(declare-fun c!50287 () Bool)

(assert (=> d!69141 (= c!50287 (and ((_ is Intermediate!2781) lt!154855) (undefined!3593 lt!154855)))))

(assert (=> d!69141 (= lt!154855 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!69141 (validMask!0 mask!3709)))

(assert (=> d!69141 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!154856)))

(declare-fun b!317243 () Bool)

(declare-fun e!197249 () SeekEntryResult!2781)

(assert (=> b!317243 (= e!197249 (MissingZero!2781 (index!13302 lt!154855)))))

(declare-fun b!317244 () Bool)

(declare-fun c!50288 () Bool)

(assert (=> b!317244 (= c!50288 (= lt!154857 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317244 (= e!197251 e!197249)))

(declare-fun b!317245 () Bool)

(assert (=> b!317245 (= e!197250 Undefined!2781)))

(declare-fun b!317246 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16148 (_ BitVec 32)) SeekEntryResult!2781)

(assert (=> b!317246 (= e!197249 (seekKeyOrZeroReturnVacant!0 (x!31557 lt!154855) (index!13302 lt!154855) (index!13302 lt!154855) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69141 c!50287) b!317245))

(assert (= (and d!69141 (not c!50287)) b!317241))

(assert (= (and b!317241 c!50289) b!317242))

(assert (= (and b!317241 (not c!50289)) b!317244))

(assert (= (and b!317244 c!50288) b!317243))

(assert (= (and b!317244 (not c!50288)) b!317246))

(declare-fun m!325921 () Bool)

(assert (=> b!317241 m!325921))

(declare-fun m!325923 () Bool)

(assert (=> d!69141 m!325923))

(assert (=> d!69141 m!325815))

(assert (=> d!69141 m!325817))

(assert (=> d!69141 m!325815))

(declare-fun m!325925 () Bool)

(assert (=> d!69141 m!325925))

(declare-fun m!325927 () Bool)

(assert (=> d!69141 m!325927))

(assert (=> d!69141 m!325823))

(declare-fun m!325929 () Bool)

(assert (=> b!317246 m!325929))

(assert (=> b!317053 d!69141))

(declare-fun d!69153 () Bool)

(assert (=> d!69153 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31726 d!69153))

(declare-fun d!69165 () Bool)

(assert (=> d!69165 (= (array_inv!5604 a!3293) (bvsge (size!7993 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31726 d!69165))

(declare-fun b!317292 () Bool)

(declare-fun e!197281 () SeekEntryResult!2781)

(assert (=> b!317292 (= e!197281 (Intermediate!2781 true index!1781 x!1427))))

(declare-fun d!69167 () Bool)

(declare-fun e!197282 () Bool)

(assert (=> d!69167 e!197282))

(declare-fun c!50306 () Bool)

(declare-fun lt!154877 () SeekEntryResult!2781)

(assert (=> d!69167 (= c!50306 (and ((_ is Intermediate!2781) lt!154877) (undefined!3593 lt!154877)))))

(assert (=> d!69167 (= lt!154877 e!197281)))

(declare-fun c!50307 () Bool)

(assert (=> d!69167 (= c!50307 (bvsge x!1427 #b01111111111111111111111111111110))))

(declare-fun lt!154876 () (_ BitVec 64))

(assert (=> d!69167 (= lt!154876 (select (arr!7641 lt!154788) index!1781))))

(assert (=> d!69167 (validMask!0 mask!3709)))

(assert (=> d!69167 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!154788 mask!3709) lt!154877)))

(declare-fun b!317293 () Bool)

(assert (=> b!317293 (and (bvsge (index!13302 lt!154877) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154877) (size!7993 lt!154788)))))

(declare-fun e!197280 () Bool)

(assert (=> b!317293 (= e!197280 (= (select (arr!7641 lt!154788) (index!13302 lt!154877)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317294 () Bool)

(assert (=> b!317294 (and (bvsge (index!13302 lt!154877) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154877) (size!7993 lt!154788)))))

(declare-fun res!171925 () Bool)

(assert (=> b!317294 (= res!171925 (= (select (arr!7641 lt!154788) (index!13302 lt!154877)) k0!2441))))

(assert (=> b!317294 (=> res!171925 e!197280)))

(declare-fun e!197279 () Bool)

(assert (=> b!317294 (= e!197279 e!197280)))

(declare-fun b!317295 () Bool)

(declare-fun e!197283 () SeekEntryResult!2781)

(assert (=> b!317295 (= e!197281 e!197283)))

(declare-fun c!50305 () Bool)

(assert (=> b!317295 (= c!50305 (or (= lt!154876 k0!2441) (= (bvadd lt!154876 lt!154876) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317296 () Bool)

(assert (=> b!317296 (= e!197282 e!197279)))

(declare-fun res!171923 () Bool)

(assert (=> b!317296 (= res!171923 (and ((_ is Intermediate!2781) lt!154877) (not (undefined!3593 lt!154877)) (bvslt (x!31557 lt!154877) #b01111111111111111111111111111110) (bvsge (x!31557 lt!154877) #b00000000000000000000000000000000) (bvsge (x!31557 lt!154877) x!1427)))))

(assert (=> b!317296 (=> (not res!171923) (not e!197279))))

(declare-fun b!317297 () Bool)

(assert (=> b!317297 (= e!197283 (Intermediate!2781 false index!1781 x!1427))))

(declare-fun b!317298 () Bool)

(assert (=> b!317298 (and (bvsge (index!13302 lt!154877) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154877) (size!7993 lt!154788)))))

(declare-fun res!171924 () Bool)

(assert (=> b!317298 (= res!171924 (= (select (arr!7641 lt!154788) (index!13302 lt!154877)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317298 (=> res!171924 e!197280)))

(declare-fun b!317299 () Bool)

(assert (=> b!317299 (= e!197282 (bvsge (x!31557 lt!154877) #b01111111111111111111111111111110))))

(declare-fun b!317300 () Bool)

(assert (=> b!317300 (= e!197283 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k0!2441 lt!154788 mask!3709))))

(assert (= (and d!69167 c!50307) b!317292))

(assert (= (and d!69167 (not c!50307)) b!317295))

(assert (= (and b!317295 c!50305) b!317297))

(assert (= (and b!317295 (not c!50305)) b!317300))

(assert (= (and d!69167 c!50306) b!317299))

(assert (= (and d!69167 (not c!50306)) b!317296))

(assert (= (and b!317296 res!171923) b!317294))

(assert (= (and b!317294 (not res!171925)) b!317298))

(assert (= (and b!317298 (not res!171924)) b!317293))

(declare-fun m!325955 () Bool)

(assert (=> d!69167 m!325955))

(assert (=> d!69167 m!325823))

(declare-fun m!325957 () Bool)

(assert (=> b!317293 m!325957))

(assert (=> b!317294 m!325957))

(assert (=> b!317298 m!325957))

(assert (=> b!317300 m!325811))

(assert (=> b!317300 m!325811))

(declare-fun m!325959 () Bool)

(assert (=> b!317300 m!325959))

(assert (=> b!317049 d!69167))

(declare-fun b!317307 () Bool)

(declare-fun e!197289 () SeekEntryResult!2781)

(assert (=> b!317307 (= e!197289 (Intermediate!2781 true lt!154789 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun d!69169 () Bool)

(declare-fun e!197290 () Bool)

(assert (=> d!69169 e!197290))

(declare-fun c!50312 () Bool)

(declare-fun lt!154884 () SeekEntryResult!2781)

(assert (=> d!69169 (= c!50312 (and ((_ is Intermediate!2781) lt!154884) (undefined!3593 lt!154884)))))

(assert (=> d!69169 (= lt!154884 e!197289)))

(declare-fun c!50313 () Bool)

(assert (=> d!69169 (= c!50313 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154883 () (_ BitVec 64))

(assert (=> d!69169 (= lt!154883 (select (arr!7641 lt!154788) lt!154789))))

(assert (=> d!69169 (validMask!0 mask!3709)))

(assert (=> d!69169 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154789 k0!2441 lt!154788 mask!3709) lt!154884)))

(declare-fun b!317308 () Bool)

(assert (=> b!317308 (and (bvsge (index!13302 lt!154884) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154884) (size!7993 lt!154788)))))

(declare-fun e!197288 () Bool)

(assert (=> b!317308 (= e!197288 (= (select (arr!7641 lt!154788) (index!13302 lt!154884)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317309 () Bool)

(assert (=> b!317309 (and (bvsge (index!13302 lt!154884) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154884) (size!7993 lt!154788)))))

(declare-fun res!171928 () Bool)

(assert (=> b!317309 (= res!171928 (= (select (arr!7641 lt!154788) (index!13302 lt!154884)) k0!2441))))

(assert (=> b!317309 (=> res!171928 e!197288)))

(declare-fun e!197287 () Bool)

(assert (=> b!317309 (= e!197287 e!197288)))

(declare-fun b!317310 () Bool)

(declare-fun e!197291 () SeekEntryResult!2781)

(assert (=> b!317310 (= e!197289 e!197291)))

(declare-fun c!50311 () Bool)

(assert (=> b!317310 (= c!50311 (or (= lt!154883 k0!2441) (= (bvadd lt!154883 lt!154883) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317311 () Bool)

(assert (=> b!317311 (= e!197290 e!197287)))

(declare-fun res!171926 () Bool)

(assert (=> b!317311 (= res!171926 (and ((_ is Intermediate!2781) lt!154884) (not (undefined!3593 lt!154884)) (bvslt (x!31557 lt!154884) #b01111111111111111111111111111110) (bvsge (x!31557 lt!154884) #b00000000000000000000000000000000) (bvsge (x!31557 lt!154884) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!317311 (=> (not res!171926) (not e!197287))))

(declare-fun b!317312 () Bool)

(assert (=> b!317312 (= e!197291 (Intermediate!2781 false lt!154789 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317313 () Bool)

(assert (=> b!317313 (and (bvsge (index!13302 lt!154884) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154884) (size!7993 lt!154788)))))

(declare-fun res!171927 () Bool)

(assert (=> b!317313 (= res!171927 (= (select (arr!7641 lt!154788) (index!13302 lt!154884)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317313 (=> res!171927 e!197288)))

(declare-fun b!317314 () Bool)

(assert (=> b!317314 (= e!197290 (bvsge (x!31557 lt!154884) #b01111111111111111111111111111110))))

(declare-fun b!317315 () Bool)

(assert (=> b!317315 (= e!197291 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!154789 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 lt!154788 mask!3709))))

(assert (= (and d!69169 c!50313) b!317307))

(assert (= (and d!69169 (not c!50313)) b!317310))

(assert (= (and b!317310 c!50311) b!317312))

(assert (= (and b!317310 (not c!50311)) b!317315))

(assert (= (and d!69169 c!50312) b!317314))

(assert (= (and d!69169 (not c!50312)) b!317311))

(assert (= (and b!317311 res!171926) b!317309))

(assert (= (and b!317309 (not res!171928)) b!317313))

(assert (= (and b!317313 (not res!171927)) b!317308))

(declare-fun m!325973 () Bool)

(assert (=> d!69169 m!325973))

(assert (=> d!69169 m!325823))

(declare-fun m!325975 () Bool)

(assert (=> b!317308 m!325975))

(assert (=> b!317309 m!325975))

(assert (=> b!317313 m!325975))

(declare-fun m!325977 () Bool)

(assert (=> b!317315 m!325977))

(assert (=> b!317315 m!325977))

(declare-fun m!325979 () Bool)

(assert (=> b!317315 m!325979))

(assert (=> b!317049 d!69169))

(declare-fun b!317325 () Bool)

(declare-fun e!197299 () SeekEntryResult!2781)

(assert (=> b!317325 (= e!197299 (Intermediate!2781 true lt!154789 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun d!69175 () Bool)

(declare-fun e!197300 () Bool)

(assert (=> d!69175 e!197300))

(declare-fun c!50318 () Bool)

(declare-fun lt!154889 () SeekEntryResult!2781)

(assert (=> d!69175 (= c!50318 (and ((_ is Intermediate!2781) lt!154889) (undefined!3593 lt!154889)))))

(assert (=> d!69175 (= lt!154889 e!197299)))

(declare-fun c!50319 () Bool)

(assert (=> d!69175 (= c!50319 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(declare-fun lt!154888 () (_ BitVec 64))

(assert (=> d!69175 (= lt!154888 (select (arr!7641 a!3293) lt!154789))))

(assert (=> d!69175 (validMask!0 mask!3709)))

(assert (=> d!69175 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154789 k0!2441 a!3293 mask!3709) lt!154889)))

(declare-fun b!317326 () Bool)

(assert (=> b!317326 (and (bvsge (index!13302 lt!154889) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154889) (size!7993 a!3293)))))

(declare-fun e!197298 () Bool)

(assert (=> b!317326 (= e!197298 (= (select (arr!7641 a!3293) (index!13302 lt!154889)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317327 () Bool)

(assert (=> b!317327 (and (bvsge (index!13302 lt!154889) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154889) (size!7993 a!3293)))))

(declare-fun res!171934 () Bool)

(assert (=> b!317327 (= res!171934 (= (select (arr!7641 a!3293) (index!13302 lt!154889)) k0!2441))))

(assert (=> b!317327 (=> res!171934 e!197298)))

(declare-fun e!197297 () Bool)

(assert (=> b!317327 (= e!197297 e!197298)))

(declare-fun b!317328 () Bool)

(declare-fun e!197301 () SeekEntryResult!2781)

(assert (=> b!317328 (= e!197299 e!197301)))

(declare-fun c!50317 () Bool)

(assert (=> b!317328 (= c!50317 (or (= lt!154888 k0!2441) (= (bvadd lt!154888 lt!154888) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317329 () Bool)

(assert (=> b!317329 (= e!197300 e!197297)))

(declare-fun res!171932 () Bool)

(assert (=> b!317329 (= res!171932 (and ((_ is Intermediate!2781) lt!154889) (not (undefined!3593 lt!154889)) (bvslt (x!31557 lt!154889) #b01111111111111111111111111111110) (bvsge (x!31557 lt!154889) #b00000000000000000000000000000000) (bvsge (x!31557 lt!154889) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!317329 (=> (not res!171932) (not e!197297))))

(declare-fun b!317330 () Bool)

(assert (=> b!317330 (= e!197301 (Intermediate!2781 false lt!154789 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317331 () Bool)

(assert (=> b!317331 (and (bvsge (index!13302 lt!154889) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154889) (size!7993 a!3293)))))

(declare-fun res!171933 () Bool)

(assert (=> b!317331 (= res!171933 (= (select (arr!7641 a!3293) (index!13302 lt!154889)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317331 (=> res!171933 e!197298)))

(declare-fun b!317332 () Bool)

(assert (=> b!317332 (= e!197300 (bvsge (x!31557 lt!154889) #b01111111111111111111111111111110))))

(declare-fun b!317333 () Bool)

(assert (=> b!317333 (= e!197301 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!154789 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69175 c!50319) b!317325))

(assert (= (and d!69175 (not c!50319)) b!317328))

(assert (= (and b!317328 c!50317) b!317330))

(assert (= (and b!317328 (not c!50317)) b!317333))

(assert (= (and d!69175 c!50318) b!317332))

(assert (= (and d!69175 (not c!50318)) b!317329))

(assert (= (and b!317329 res!171932) b!317327))

(assert (= (and b!317327 (not res!171934)) b!317331))

(assert (= (and b!317331 (not res!171933)) b!317326))

(declare-fun m!325989 () Bool)

(assert (=> d!69175 m!325989))

(assert (=> d!69175 m!325823))

(declare-fun m!325991 () Bool)

(assert (=> b!317326 m!325991))

(assert (=> b!317327 m!325991))

(assert (=> b!317331 m!325991))

(assert (=> b!317333 m!325977))

(assert (=> b!317333 m!325977))

(declare-fun m!325993 () Bool)

(assert (=> b!317333 m!325993))

(assert (=> b!317049 d!69175))

(declare-fun d!69179 () Bool)

(declare-fun lt!154892 () (_ BitVec 32))

(assert (=> d!69179 (and (bvsge lt!154892 #b00000000000000000000000000000000) (bvslt lt!154892 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69179 (= lt!154892 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69179 (validMask!0 mask!3709)))

(assert (=> d!69179 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154892)))

(declare-fun bs!11065 () Bool)

(assert (= bs!11065 d!69179))

(declare-fun m!325995 () Bool)

(assert (=> bs!11065 m!325995))

(assert (=> bs!11065 m!325823))

(assert (=> b!317049 d!69179))

(declare-fun b!317334 () Bool)

(declare-fun e!197304 () SeekEntryResult!2781)

(assert (=> b!317334 (= e!197304 (Intermediate!2781 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun d!69181 () Bool)

(declare-fun e!197305 () Bool)

(assert (=> d!69181 e!197305))

(declare-fun c!50321 () Bool)

(declare-fun lt!154894 () SeekEntryResult!2781)

(assert (=> d!69181 (= c!50321 (and ((_ is Intermediate!2781) lt!154894) (undefined!3593 lt!154894)))))

(assert (=> d!69181 (= lt!154894 e!197304)))

(declare-fun c!50322 () Bool)

(assert (=> d!69181 (= c!50322 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!154893 () (_ BitVec 64))

(assert (=> d!69181 (= lt!154893 (select (arr!7641 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!69181 (validMask!0 mask!3709)))

(assert (=> d!69181 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!154894)))

(declare-fun b!317335 () Bool)

(assert (=> b!317335 (and (bvsge (index!13302 lt!154894) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154894) (size!7993 a!3293)))))

(declare-fun e!197303 () Bool)

(assert (=> b!317335 (= e!197303 (= (select (arr!7641 a!3293) (index!13302 lt!154894)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317336 () Bool)

(assert (=> b!317336 (and (bvsge (index!13302 lt!154894) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154894) (size!7993 a!3293)))))

(declare-fun res!171938 () Bool)

(assert (=> b!317336 (= res!171938 (= (select (arr!7641 a!3293) (index!13302 lt!154894)) k0!2441))))

(assert (=> b!317336 (=> res!171938 e!197303)))

(declare-fun e!197302 () Bool)

(assert (=> b!317336 (= e!197302 e!197303)))

(declare-fun b!317337 () Bool)

(declare-fun e!197306 () SeekEntryResult!2781)

(assert (=> b!317337 (= e!197304 e!197306)))

(declare-fun c!50320 () Bool)

(assert (=> b!317337 (= c!50320 (or (= lt!154893 k0!2441) (= (bvadd lt!154893 lt!154893) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!317338 () Bool)

(assert (=> b!317338 (= e!197305 e!197302)))

(declare-fun res!171936 () Bool)

(assert (=> b!317338 (= res!171936 (and ((_ is Intermediate!2781) lt!154894) (not (undefined!3593 lt!154894)) (bvslt (x!31557 lt!154894) #b01111111111111111111111111111110) (bvsge (x!31557 lt!154894) #b00000000000000000000000000000000) (bvsge (x!31557 lt!154894) #b00000000000000000000000000000000)))))

(assert (=> b!317338 (=> (not res!171936) (not e!197302))))

(declare-fun b!317339 () Bool)

(assert (=> b!317339 (= e!197306 (Intermediate!2781 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!317340 () Bool)

(assert (=> b!317340 (and (bvsge (index!13302 lt!154894) #b00000000000000000000000000000000) (bvslt (index!13302 lt!154894) (size!7993 a!3293)))))

(declare-fun res!171937 () Bool)

(assert (=> b!317340 (= res!171937 (= (select (arr!7641 a!3293) (index!13302 lt!154894)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317340 (=> res!171937 e!197303)))

(declare-fun b!317341 () Bool)

(assert (=> b!317341 (= e!197305 (bvsge (x!31557 lt!154894) #b01111111111111111111111111111110))))

(declare-fun b!317342 () Bool)

(assert (=> b!317342 (= e!197306 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (= (and d!69181 c!50322) b!317334))

(assert (= (and d!69181 (not c!50322)) b!317337))

(assert (= (and b!317337 c!50320) b!317339))

(assert (= (and b!317337 (not c!50320)) b!317342))

(assert (= (and d!69181 c!50321) b!317341))

(assert (= (and d!69181 (not c!50321)) b!317338))

(assert (= (and b!317338 res!171936) b!317336))

(assert (= (and b!317336 (not res!171938)) b!317340))

(assert (= (and b!317340 (not res!171937)) b!317335))

(assert (=> d!69181 m!325815))

(declare-fun m!325997 () Bool)

(assert (=> d!69181 m!325997))

(assert (=> d!69181 m!325823))

(declare-fun m!325999 () Bool)

(assert (=> b!317335 m!325999))

(assert (=> b!317336 m!325999))

(assert (=> b!317340 m!325999))

(assert (=> b!317342 m!325815))

(declare-fun m!326001 () Bool)

(assert (=> b!317342 m!326001))

(assert (=> b!317342 m!326001))

(declare-fun m!326003 () Bool)

(assert (=> b!317342 m!326003))

(assert (=> b!317054 d!69181))

(declare-fun d!69183 () Bool)

(declare-fun lt!154908 () (_ BitVec 32))

(declare-fun lt!154907 () (_ BitVec 32))

(assert (=> d!69183 (= lt!154908 (bvmul (bvxor lt!154907 (bvlshr lt!154907 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69183 (= lt!154907 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69183 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171939 (let ((h!5378 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31567 (bvmul (bvxor h!5378 (bvlshr h!5378 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31567 (bvlshr x!31567 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171939 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171939 #b00000000000000000000000000000000))))))

(assert (=> d!69183 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!154908 (bvlshr lt!154908 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!317054 d!69183))

(check-sat (not b!317246) (not d!69169) (not b!317096) (not b!317333) (not d!69181) (not b!317102) (not bm!26017) (not d!69175) (not d!69179) (not b!317300) (not d!69131) (not b!317342) (not b!317315) (not d!69167) (not b!317093) (not d!69141) (not b!317192))
(check-sat)
