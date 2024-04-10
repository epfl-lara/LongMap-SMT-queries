; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31728 () Bool)

(assert start!31728)

(declare-fun b!317076 () Bool)

(declare-fun res!171855 () Bool)

(declare-fun e!197157 () Bool)

(assert (=> b!317076 (=> (not res!171855) (not e!197157))))

(declare-datatypes ((array!16150 0))(
  ( (array!16151 (arr!7642 (Array (_ BitVec 32) (_ BitVec 64))) (size!7994 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16150)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(assert (=> b!317076 (= res!171855 (and (= (size!7994 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7994 a!3293))))))

(declare-fun res!171850 () Bool)

(assert (=> start!31728 (=> (not res!171850) (not e!197157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31728 (= res!171850 (validMask!0 mask!3709))))

(assert (=> start!31728 e!197157))

(declare-fun array_inv!5605 (array!16150) Bool)

(assert (=> start!31728 (array_inv!5605 a!3293)))

(assert (=> start!31728 true))

(declare-fun b!317077 () Bool)

(declare-fun res!171857 () Bool)

(assert (=> b!317077 (=> (not res!171857) (not e!197157))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2782 0))(
  ( (MissingZero!2782 (index!13304 (_ BitVec 32))) (Found!2782 (index!13305 (_ BitVec 32))) (Intermediate!2782 (undefined!3594 Bool) (index!13306 (_ BitVec 32)) (x!31558 (_ BitVec 32))) (Undefined!2782) (MissingVacant!2782 (index!13307 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16150 (_ BitVec 32)) SeekEntryResult!2782)

(assert (=> b!317077 (= res!171857 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2782 i!1240)))))

(declare-fun b!317078 () Bool)

(declare-fun e!197158 () Bool)

(declare-fun e!197155 () Bool)

(assert (=> b!317078 (= e!197158 e!197155)))

(declare-fun res!171851 () Bool)

(assert (=> b!317078 (=> (not res!171851) (not e!197155))))

(declare-fun lt!154801 () SeekEntryResult!2782)

(declare-fun lt!154800 () SeekEntryResult!2782)

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(assert (=> b!317078 (= res!171851 (and (= lt!154801 lt!154800) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7642 a!3293) index!1781) k!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16150 (_ BitVec 32)) SeekEntryResult!2782)

(assert (=> b!317078 (= lt!154801 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709))))

(declare-fun b!317079 () Bool)

(declare-fun res!171858 () Bool)

(assert (=> b!317079 (=> (not res!171858) (not e!197157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!317079 (= res!171858 (validKeyInArray!0 k!2441))))

(declare-fun b!317080 () Bool)

(declare-fun res!171853 () Bool)

(assert (=> b!317080 (=> (not res!171853) (not e!197157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16150 (_ BitVec 32)) Bool)

(assert (=> b!317080 (= res!171853 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun lt!154803 () (_ BitVec 32))

(declare-fun lt!154802 () array!16150)

(declare-fun b!317081 () Bool)

(assert (=> b!317081 (= e!197155 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!154802 mask!3709) (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154803 k!2441 lt!154802 mask!3709))))))

(assert (=> b!317081 (= lt!154802 (array!16151 (store (arr!7642 a!3293) i!1240 k!2441) (size!7994 a!3293)))))

(assert (=> b!317081 (= lt!154801 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154803 k!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317081 (= lt!154803 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!317082 () Bool)

(assert (=> b!317082 (= e!197157 e!197158)))

(declare-fun res!171854 () Bool)

(assert (=> b!317082 (=> (not res!171854) (not e!197158))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!317082 (= res!171854 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154800))))

(declare-fun resIndex!52 () (_ BitVec 32))

(assert (=> b!317082 (= lt!154800 (Intermediate!2782 false resIndex!52 resX!52))))

(declare-fun b!317083 () Bool)

(declare-fun res!171852 () Bool)

(assert (=> b!317083 (=> (not res!171852) (not e!197158))))

(assert (=> b!317083 (= res!171852 (and (= (select (arr!7642 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7994 a!3293))))))

(declare-fun b!317084 () Bool)

(declare-fun res!171856 () Bool)

(assert (=> b!317084 (=> (not res!171856) (not e!197157))))

(declare-fun arrayContainsKey!0 (array!16150 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!317084 (= res!171856 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31728 res!171850) b!317076))

(assert (= (and b!317076 res!171855) b!317079))

(assert (= (and b!317079 res!171858) b!317084))

(assert (= (and b!317084 res!171856) b!317077))

(assert (= (and b!317077 res!171857) b!317080))

(assert (= (and b!317080 res!171853) b!317082))

(assert (= (and b!317082 res!171854) b!317083))

(assert (= (and b!317083 res!171852) b!317078))

(assert (= (and b!317078 res!171851) b!317081))

(declare-fun m!325827 () Bool)

(assert (=> b!317078 m!325827))

(declare-fun m!325829 () Bool)

(assert (=> b!317078 m!325829))

(declare-fun m!325831 () Bool)

(assert (=> b!317083 m!325831))

(declare-fun m!325833 () Bool)

(assert (=> b!317079 m!325833))

(declare-fun m!325835 () Bool)

(assert (=> b!317077 m!325835))

(declare-fun m!325837 () Bool)

(assert (=> b!317080 m!325837))

(declare-fun m!325839 () Bool)

(assert (=> b!317081 m!325839))

(declare-fun m!325841 () Bool)

(assert (=> b!317081 m!325841))

(declare-fun m!325843 () Bool)

(assert (=> b!317081 m!325843))

(declare-fun m!325845 () Bool)

(assert (=> b!317081 m!325845))

(declare-fun m!325847 () Bool)

(assert (=> b!317081 m!325847))

(declare-fun m!325849 () Bool)

(assert (=> b!317082 m!325849))

(assert (=> b!317082 m!325849))

(declare-fun m!325851 () Bool)

(assert (=> b!317082 m!325851))

(declare-fun m!325853 () Bool)

(assert (=> start!31728 m!325853))

(declare-fun m!325855 () Bool)

(assert (=> start!31728 m!325855))

(declare-fun m!325857 () Bool)

(assert (=> b!317084 m!325857))

(push 1)

(assert (not b!317081))

(assert (not b!317082))

(assert (not start!31728))

(assert (not b!317077))

(assert (not b!317079))

(assert (not b!317080))

(assert (not b!317078))

(assert (not b!317084))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!317147 () Bool)

(declare-fun e!197203 () Bool)

(declare-fun e!197202 () Bool)

(assert (=> b!317147 (= e!197203 e!197202)))

(declare-fun res!171881 () Bool)

(declare-fun lt!154828 () SeekEntryResult!2782)

(assert (=> b!317147 (= res!171881 (and (is-Intermediate!2782 lt!154828) (not (undefined!3594 lt!154828)) (bvslt (x!31558 lt!154828) #b01111111111111111111111111111110) (bvsge (x!31558 lt!154828) #b00000000000000000000000000000000) (bvsge (x!31558 lt!154828) x!1427)))))

(assert (=> b!317147 (=> (not res!171881) (not e!197202))))

(declare-fun b!317148 () Bool)

(assert (=> b!317148 (= e!197203 (bvsge (x!31558 lt!154828) #b01111111111111111111111111111110))))

(declare-fun b!317149 () Bool)

(declare-fun e!197204 () SeekEntryResult!2782)

(assert (=> b!317149 (= e!197204 (Intermediate!2782 true index!1781 x!1427))))

(declare-fun b!317150 () Bool)

(assert (=> b!317150 (and (bvsge (index!13306 lt!154828) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154828) (size!7994 lt!154802)))))

(declare-fun e!197201 () Bool)

(assert (=> b!317150 (= e!197201 (= (select (arr!7642 lt!154802) (index!13306 lt!154828)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317151 () Bool)

(declare-fun e!197200 () SeekEntryResult!2782)

(assert (=> b!317151 (= e!197204 e!197200)))

(declare-fun c!50254 () Bool)

(declare-fun lt!154827 () (_ BitVec 64))

(assert (=> b!317151 (= c!50254 (or (= lt!154827 k!2441) (= (bvadd lt!154827 lt!154827) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69127 () Bool)

(assert (=> d!69127 e!197203))

(declare-fun c!50255 () Bool)

(assert (=> d!69127 (= c!50255 (and (is-Intermediate!2782 lt!154828) (undefined!3594 lt!154828)))))

(assert (=> d!69127 (= lt!154828 e!197204)))

(declare-fun c!50256 () Bool)

(assert (=> d!69127 (= c!50256 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!69127 (= lt!154827 (select (arr!7642 lt!154802) index!1781))))

(assert (=> d!69127 (validMask!0 mask!3709)))

(assert (=> d!69127 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 lt!154802 mask!3709) lt!154828)))

(declare-fun b!317152 () Bool)

(assert (=> b!317152 (= e!197200 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 lt!154802 mask!3709))))

(declare-fun b!317153 () Bool)

(assert (=> b!317153 (and (bvsge (index!13306 lt!154828) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154828) (size!7994 lt!154802)))))

(declare-fun res!171882 () Bool)

(assert (=> b!317153 (= res!171882 (= (select (arr!7642 lt!154802) (index!13306 lt!154828)) k!2441))))

(assert (=> b!317153 (=> res!171882 e!197201)))

(assert (=> b!317153 (= e!197202 e!197201)))

(declare-fun b!317154 () Bool)

(assert (=> b!317154 (= e!197200 (Intermediate!2782 false index!1781 x!1427))))

(declare-fun b!317155 () Bool)

(assert (=> b!317155 (and (bvsge (index!13306 lt!154828) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154828) (size!7994 lt!154802)))))

(declare-fun res!171883 () Bool)

(assert (=> b!317155 (= res!171883 (= (select (arr!7642 lt!154802) (index!13306 lt!154828)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317155 (=> res!171883 e!197201)))

(assert (= (and d!69127 c!50256) b!317149))

(assert (= (and d!69127 (not c!50256)) b!317151))

(assert (= (and b!317151 c!50254) b!317154))

(assert (= (and b!317151 (not c!50254)) b!317152))

(assert (= (and d!69127 c!50255) b!317148))

(assert (= (and d!69127 (not c!50255)) b!317147))

(assert (= (and b!317147 res!171881) b!317153))

(assert (= (and b!317153 (not res!171882)) b!317155))

(assert (= (and b!317155 (not res!171883)) b!317150))

(declare-fun m!325873 () Bool)

(assert (=> b!317153 m!325873))

(declare-fun m!325875 () Bool)

(assert (=> d!69127 m!325875))

(assert (=> d!69127 m!325853))

(assert (=> b!317152 m!325845))

(assert (=> b!317152 m!325845))

(declare-fun m!325877 () Bool)

(assert (=> b!317152 m!325877))

(assert (=> b!317155 m!325873))

(assert (=> b!317150 m!325873))

(assert (=> b!317081 d!69127))

(declare-fun b!317160 () Bool)

(declare-fun e!197208 () Bool)

(declare-fun e!197207 () Bool)

(assert (=> b!317160 (= e!197208 e!197207)))

(declare-fun res!171886 () Bool)

(declare-fun lt!154830 () SeekEntryResult!2782)

(assert (=> b!317160 (= res!171886 (and (is-Intermediate!2782 lt!154830) (not (undefined!3594 lt!154830)) (bvslt (x!31558 lt!154830) #b01111111111111111111111111111110) (bvsge (x!31558 lt!154830) #b00000000000000000000000000000000) (bvsge (x!31558 lt!154830) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!317160 (=> (not res!171886) (not e!197207))))

(declare-fun b!317161 () Bool)

(assert (=> b!317161 (= e!197208 (bvsge (x!31558 lt!154830) #b01111111111111111111111111111110))))

(declare-fun b!317162 () Bool)

(declare-fun e!197209 () SeekEntryResult!2782)

(assert (=> b!317162 (= e!197209 (Intermediate!2782 true lt!154803 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317163 () Bool)

(assert (=> b!317163 (and (bvsge (index!13306 lt!154830) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154830) (size!7994 lt!154802)))))

(declare-fun e!197206 () Bool)

(assert (=> b!317163 (= e!197206 (= (select (arr!7642 lt!154802) (index!13306 lt!154830)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317164 () Bool)

(declare-fun e!197205 () SeekEntryResult!2782)

(assert (=> b!317164 (= e!197209 e!197205)))

(declare-fun c!50257 () Bool)

(declare-fun lt!154829 () (_ BitVec 64))

(assert (=> b!317164 (= c!50257 (or (= lt!154829 k!2441) (= (bvadd lt!154829 lt!154829) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69133 () Bool)

(assert (=> d!69133 e!197208))

(declare-fun c!50258 () Bool)

(assert (=> d!69133 (= c!50258 (and (is-Intermediate!2782 lt!154830) (undefined!3594 lt!154830)))))

(assert (=> d!69133 (= lt!154830 e!197209)))

(declare-fun c!50259 () Bool)

(assert (=> d!69133 (= c!50259 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!69133 (= lt!154829 (select (arr!7642 lt!154802) lt!154803))))

(assert (=> d!69133 (validMask!0 mask!3709)))

(assert (=> d!69133 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154803 k!2441 lt!154802 mask!3709) lt!154830)))

(declare-fun b!317165 () Bool)

(assert (=> b!317165 (= e!197205 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!154803 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 lt!154802 mask!3709))))

(declare-fun b!317166 () Bool)

(assert (=> b!317166 (and (bvsge (index!13306 lt!154830) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154830) (size!7994 lt!154802)))))

(declare-fun res!171887 () Bool)

(assert (=> b!317166 (= res!171887 (= (select (arr!7642 lt!154802) (index!13306 lt!154830)) k!2441))))

(assert (=> b!317166 (=> res!171887 e!197206)))

(assert (=> b!317166 (= e!197207 e!197206)))

(declare-fun b!317167 () Bool)

(assert (=> b!317167 (= e!197205 (Intermediate!2782 false lt!154803 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317168 () Bool)

(assert (=> b!317168 (and (bvsge (index!13306 lt!154830) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154830) (size!7994 lt!154802)))))

(declare-fun res!171888 () Bool)

(assert (=> b!317168 (= res!171888 (= (select (arr!7642 lt!154802) (index!13306 lt!154830)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317168 (=> res!171888 e!197206)))

(assert (= (and d!69133 c!50259) b!317162))

(assert (= (and d!69133 (not c!50259)) b!317164))

(assert (= (and b!317164 c!50257) b!317167))

(assert (= (and b!317164 (not c!50257)) b!317165))

(assert (= (and d!69133 c!50258) b!317161))

(assert (= (and d!69133 (not c!50258)) b!317160))

(assert (= (and b!317160 res!171886) b!317166))

(assert (= (and b!317166 (not res!171887)) b!317168))

(assert (= (and b!317168 (not res!171888)) b!317163))

(declare-fun m!325879 () Bool)

(assert (=> b!317166 m!325879))

(declare-fun m!325881 () Bool)

(assert (=> d!69133 m!325881))

(assert (=> d!69133 m!325853))

(declare-fun m!325883 () Bool)

(assert (=> b!317165 m!325883))

(assert (=> b!317165 m!325883))

(declare-fun m!325885 () Bool)

(assert (=> b!317165 m!325885))

(assert (=> b!317168 m!325879))

(assert (=> b!317163 m!325879))

(assert (=> b!317081 d!69133))

(declare-fun b!317175 () Bool)

(declare-fun e!197216 () Bool)

(declare-fun e!197215 () Bool)

(assert (=> b!317175 (= e!197216 e!197215)))

(declare-fun res!171889 () Bool)

(declare-fun lt!154835 () SeekEntryResult!2782)

(assert (=> b!317175 (= res!171889 (and (is-Intermediate!2782 lt!154835) (not (undefined!3594 lt!154835)) (bvslt (x!31558 lt!154835) #b01111111111111111111111111111110) (bvsge (x!31558 lt!154835) #b00000000000000000000000000000000) (bvsge (x!31558 lt!154835) (bvadd #b00000000000000000000000000000001 x!1427))))))

(assert (=> b!317175 (=> (not res!171889) (not e!197215))))

(declare-fun b!317176 () Bool)

(assert (=> b!317176 (= e!197216 (bvsge (x!31558 lt!154835) #b01111111111111111111111111111110))))

(declare-fun b!317177 () Bool)

(declare-fun e!197217 () SeekEntryResult!2782)

(assert (=> b!317177 (= e!197217 (Intermediate!2782 true lt!154803 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317178 () Bool)

(assert (=> b!317178 (and (bvsge (index!13306 lt!154835) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154835) (size!7994 a!3293)))))

(declare-fun e!197214 () Bool)

(assert (=> b!317178 (= e!197214 (= (select (arr!7642 a!3293) (index!13306 lt!154835)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317179 () Bool)

(declare-fun e!197213 () SeekEntryResult!2782)

(assert (=> b!317179 (= e!197217 e!197213)))

(declare-fun c!50263 () Bool)

(declare-fun lt!154834 () (_ BitVec 64))

(assert (=> b!317179 (= c!50263 (or (= lt!154834 k!2441) (= (bvadd lt!154834 lt!154834) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69135 () Bool)

(assert (=> d!69135 e!197216))

(declare-fun c!50264 () Bool)

(assert (=> d!69135 (= c!50264 (and (is-Intermediate!2782 lt!154835) (undefined!3594 lt!154835)))))

(assert (=> d!69135 (= lt!154835 e!197217)))

(declare-fun c!50265 () Bool)

(assert (=> d!69135 (= c!50265 (bvsge (bvadd #b00000000000000000000000000000001 x!1427) #b01111111111111111111111111111110))))

(assert (=> d!69135 (= lt!154834 (select (arr!7642 a!3293) lt!154803))))

(assert (=> d!69135 (validMask!0 mask!3709)))

(assert (=> d!69135 (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!154803 k!2441 a!3293 mask!3709) lt!154835)))

(declare-fun b!317180 () Bool)

(assert (=> b!317180 (= e!197213 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427 #b00000000000000000000000000000001) (nextIndex!0 lt!154803 (bvadd #b00000000000000000000000000000001 x!1427) mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!317181 () Bool)

(assert (=> b!317181 (and (bvsge (index!13306 lt!154835) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154835) (size!7994 a!3293)))))

(declare-fun res!171890 () Bool)

(assert (=> b!317181 (= res!171890 (= (select (arr!7642 a!3293) (index!13306 lt!154835)) k!2441))))

(assert (=> b!317181 (=> res!171890 e!197214)))

(assert (=> b!317181 (= e!197215 e!197214)))

(declare-fun b!317182 () Bool)

(assert (=> b!317182 (= e!197213 (Intermediate!2782 false lt!154803 (bvadd #b00000000000000000000000000000001 x!1427)))))

(declare-fun b!317183 () Bool)

(assert (=> b!317183 (and (bvsge (index!13306 lt!154835) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154835) (size!7994 a!3293)))))

(declare-fun res!171891 () Bool)

(assert (=> b!317183 (= res!171891 (= (select (arr!7642 a!3293) (index!13306 lt!154835)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317183 (=> res!171891 e!197214)))

(assert (= (and d!69135 c!50265) b!317177))

(assert (= (and d!69135 (not c!50265)) b!317179))

(assert (= (and b!317179 c!50263) b!317182))

(assert (= (and b!317179 (not c!50263)) b!317180))

(assert (= (and d!69135 c!50264) b!317176))

(assert (= (and d!69135 (not c!50264)) b!317175))

(assert (= (and b!317175 res!171889) b!317181))

(assert (= (and b!317181 (not res!171890)) b!317183))

(assert (= (and b!317183 (not res!171891)) b!317178))

(declare-fun m!325897 () Bool)

(assert (=> b!317181 m!325897))

(declare-fun m!325899 () Bool)

(assert (=> d!69135 m!325899))

(assert (=> d!69135 m!325853))

(assert (=> b!317180 m!325883))

(assert (=> b!317180 m!325883))

(declare-fun m!325901 () Bool)

(assert (=> b!317180 m!325901))

(assert (=> b!317183 m!325897))

(assert (=> b!317178 m!325897))

(assert (=> b!317081 d!69135))

(declare-fun d!69139 () Bool)

(declare-fun lt!154840 () (_ BitVec 32))

(assert (=> d!69139 (and (bvsge lt!154840 #b00000000000000000000000000000000) (bvslt lt!154840 (bvadd mask!3709 #b00000000000000000000000000000001)))))

(declare-fun choose!52 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!69139 (= lt!154840 (choose!52 index!1781 x!1427 mask!3709))))

(assert (=> d!69139 (validMask!0 mask!3709)))

(assert (=> d!69139 (= (nextIndex!0 index!1781 x!1427 mask!3709) lt!154840)))

(declare-fun bs!11063 () Bool)

(assert (= bs!11063 d!69139))

(declare-fun m!325907 () Bool)

(assert (=> bs!11063 m!325907))

(assert (=> bs!11063 m!325853))

(assert (=> b!317081 d!69139))

(declare-fun d!69143 () Bool)

(assert (=> d!69143 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31728 d!69143))

(declare-fun d!69145 () Bool)

(assert (=> d!69145 (= (array_inv!5605 a!3293) (bvsge (size!7994 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31728 d!69145))

(declare-fun b!317301 () Bool)

(declare-fun e!197286 () SeekEntryResult!2782)

(declare-fun lt!154879 () SeekEntryResult!2782)

(assert (=> b!317301 (= e!197286 (Found!2782 (index!13306 lt!154879)))))

(declare-fun d!69147 () Bool)

(declare-fun lt!154878 () SeekEntryResult!2782)

(assert (=> d!69147 (and (or (is-Undefined!2782 lt!154878) (not (is-Found!2782 lt!154878)) (and (bvsge (index!13305 lt!154878) #b00000000000000000000000000000000) (bvslt (index!13305 lt!154878) (size!7994 a!3293)))) (or (is-Undefined!2782 lt!154878) (is-Found!2782 lt!154878) (not (is-MissingZero!2782 lt!154878)) (and (bvsge (index!13304 lt!154878) #b00000000000000000000000000000000) (bvslt (index!13304 lt!154878) (size!7994 a!3293)))) (or (is-Undefined!2782 lt!154878) (is-Found!2782 lt!154878) (is-MissingZero!2782 lt!154878) (not (is-MissingVacant!2782 lt!154878)) (and (bvsge (index!13307 lt!154878) #b00000000000000000000000000000000) (bvslt (index!13307 lt!154878) (size!7994 a!3293)))) (or (is-Undefined!2782 lt!154878) (ite (is-Found!2782 lt!154878) (= (select (arr!7642 a!3293) (index!13305 lt!154878)) k!2441) (ite (is-MissingZero!2782 lt!154878) (= (select (arr!7642 a!3293) (index!13304 lt!154878)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!2782 lt!154878) (= (select (arr!7642 a!3293) (index!13307 lt!154878)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!197284 () SeekEntryResult!2782)

(assert (=> d!69147 (= lt!154878 e!197284)))

(declare-fun c!50310 () Bool)

(assert (=> d!69147 (= c!50310 (and (is-Intermediate!2782 lt!154879) (undefined!3594 lt!154879)))))

(assert (=> d!69147 (= lt!154879 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709))))

(assert (=> d!69147 (validMask!0 mask!3709)))

(assert (=> d!69147 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) lt!154878)))

(declare-fun b!317302 () Bool)

(assert (=> b!317302 (= e!197284 Undefined!2782)))

(declare-fun b!317303 () Bool)

(declare-fun e!197285 () SeekEntryResult!2782)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16150 (_ BitVec 32)) SeekEntryResult!2782)

(assert (=> b!317303 (= e!197285 (seekKeyOrZeroReturnVacant!0 (x!31558 lt!154879) (index!13306 lt!154879) (index!13306 lt!154879) k!2441 a!3293 mask!3709))))

(declare-fun b!317304 () Bool)

(assert (=> b!317304 (= e!197285 (MissingZero!2782 (index!13306 lt!154879)))))

(declare-fun b!317305 () Bool)

(assert (=> b!317305 (= e!197284 e!197286)))

(declare-fun lt!154880 () (_ BitVec 64))

(assert (=> b!317305 (= lt!154880 (select (arr!7642 a!3293) (index!13306 lt!154879)))))

(declare-fun c!50308 () Bool)

(assert (=> b!317305 (= c!50308 (= lt!154880 k!2441))))

(declare-fun b!317306 () Bool)

(declare-fun c!50309 () Bool)

(assert (=> b!317306 (= c!50309 (= lt!154880 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317306 (= e!197286 e!197285)))

(assert (= (and d!69147 c!50310) b!317302))

(assert (= (and d!69147 (not c!50310)) b!317305))

(assert (= (and b!317305 c!50308) b!317301))

(assert (= (and b!317305 (not c!50308)) b!317306))

(assert (= (and b!317306 c!50309) b!317304))

(assert (= (and b!317306 (not c!50309)) b!317303))

(assert (=> d!69147 m!325849))

(assert (=> d!69147 m!325851))

(declare-fun m!325961 () Bool)

(assert (=> d!69147 m!325961))

(declare-fun m!325963 () Bool)

(assert (=> d!69147 m!325963))

(assert (=> d!69147 m!325849))

(assert (=> d!69147 m!325853))

(declare-fun m!325965 () Bool)

(assert (=> d!69147 m!325965))

(declare-fun m!325967 () Bool)

(assert (=> b!317303 m!325967))

(declare-fun m!325969 () Bool)

(assert (=> b!317305 m!325969))

(assert (=> b!317077 d!69147))

(declare-fun b!317316 () Bool)

(declare-fun e!197295 () Bool)

(declare-fun e!197294 () Bool)

(assert (=> b!317316 (= e!197295 e!197294)))

(declare-fun res!171929 () Bool)

(declare-fun lt!154886 () SeekEntryResult!2782)

(assert (=> b!317316 (= res!171929 (and (is-Intermediate!2782 lt!154886) (not (undefined!3594 lt!154886)) (bvslt (x!31558 lt!154886) #b01111111111111111111111111111110) (bvsge (x!31558 lt!154886) #b00000000000000000000000000000000) (bvsge (x!31558 lt!154886) #b00000000000000000000000000000000)))))

(assert (=> b!317316 (=> (not res!171929) (not e!197294))))

(declare-fun b!317317 () Bool)

(assert (=> b!317317 (= e!197295 (bvsge (x!31558 lt!154886) #b01111111111111111111111111111110))))

(declare-fun b!317318 () Bool)

(declare-fun e!197296 () SeekEntryResult!2782)

(assert (=> b!317318 (= e!197296 (Intermediate!2782 true (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!317319 () Bool)

(assert (=> b!317319 (and (bvsge (index!13306 lt!154886) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154886) (size!7994 a!3293)))))

(declare-fun e!197293 () Bool)

(assert (=> b!317319 (= e!197293 (= (select (arr!7642 a!3293) (index!13306 lt!154886)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317320 () Bool)

(declare-fun e!197292 () SeekEntryResult!2782)

(assert (=> b!317320 (= e!197296 e!197292)))

(declare-fun c!50314 () Bool)

(declare-fun lt!154885 () (_ BitVec 64))

(assert (=> b!317320 (= c!50314 (or (= lt!154885 k!2441) (= (bvadd lt!154885 lt!154885) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69171 () Bool)

(assert (=> d!69171 e!197295))

(declare-fun c!50315 () Bool)

(assert (=> d!69171 (= c!50315 (and (is-Intermediate!2782 lt!154886) (undefined!3594 lt!154886)))))

(assert (=> d!69171 (= lt!154886 e!197296)))

(declare-fun c!50316 () Bool)

(assert (=> d!69171 (= c!50316 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!69171 (= lt!154885 (select (arr!7642 a!3293) (toIndex!0 k!2441 mask!3709)))))

(assert (=> d!69171 (validMask!0 mask!3709)))

(assert (=> d!69171 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154886)))

(declare-fun b!317321 () Bool)

(assert (=> b!317321 (= e!197292 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!317322 () Bool)

(assert (=> b!317322 (and (bvsge (index!13306 lt!154886) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154886) (size!7994 a!3293)))))

(declare-fun res!171930 () Bool)

(assert (=> b!317322 (= res!171930 (= (select (arr!7642 a!3293) (index!13306 lt!154886)) k!2441))))

(assert (=> b!317322 (=> res!171930 e!197293)))

(assert (=> b!317322 (= e!197294 e!197293)))

(declare-fun b!317323 () Bool)

(assert (=> b!317323 (= e!197292 (Intermediate!2782 false (toIndex!0 k!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!317324 () Bool)

(assert (=> b!317324 (and (bvsge (index!13306 lt!154886) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154886) (size!7994 a!3293)))))

(declare-fun res!171931 () Bool)

(assert (=> b!317324 (= res!171931 (= (select (arr!7642 a!3293) (index!13306 lt!154886)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317324 (=> res!171931 e!197293)))

(assert (= (and d!69171 c!50316) b!317318))

(assert (= (and d!69171 (not c!50316)) b!317320))

(assert (= (and b!317320 c!50314) b!317323))

(assert (= (and b!317320 (not c!50314)) b!317321))

(assert (= (and d!69171 c!50315) b!317317))

(assert (= (and d!69171 (not c!50315)) b!317316))

(assert (= (and b!317316 res!171929) b!317322))

(assert (= (and b!317322 (not res!171930)) b!317324))

(assert (= (and b!317324 (not res!171931)) b!317319))

(declare-fun m!325981 () Bool)

(assert (=> b!317322 m!325981))

(assert (=> d!69171 m!325849))

(declare-fun m!325983 () Bool)

(assert (=> d!69171 m!325983))

(assert (=> d!69171 m!325853))

(assert (=> b!317321 m!325849))

(declare-fun m!325985 () Bool)

(assert (=> b!317321 m!325985))

(assert (=> b!317321 m!325985))

(declare-fun m!325987 () Bool)

(assert (=> b!317321 m!325987))

(assert (=> b!317324 m!325981))

(assert (=> b!317319 m!325981))

(assert (=> b!317082 d!69171))

(declare-fun d!69177 () Bool)

(declare-fun lt!154900 () (_ BitVec 32))

(declare-fun lt!154899 () (_ BitVec 32))

(assert (=> d!69177 (= lt!154900 (bvmul (bvxor lt!154899 (bvlshr lt!154899 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!69177 (= lt!154899 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!69177 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!171935 (let ((h!5377 ((_ extract 31 0) (bvand (bvxor k!2441 (bvlshr k!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31565 (bvmul (bvxor h!5377 (bvlshr h!5377 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31565 (bvlshr x!31565 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!171935 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!171935 #b00000000000000000000000000000000))))))

(assert (=> d!69177 (= (toIndex!0 k!2441 mask!3709) (bvand (bvxor lt!154900 (bvlshr lt!154900 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!317082 d!69177))

(declare-fun b!317343 () Bool)

(declare-fun e!197310 () Bool)

(declare-fun e!197309 () Bool)

(assert (=> b!317343 (= e!197310 e!197309)))

(declare-fun res!171940 () Bool)

(declare-fun lt!154902 () SeekEntryResult!2782)

(assert (=> b!317343 (= res!171940 (and (is-Intermediate!2782 lt!154902) (not (undefined!3594 lt!154902)) (bvslt (x!31558 lt!154902) #b01111111111111111111111111111110) (bvsge (x!31558 lt!154902) #b00000000000000000000000000000000) (bvsge (x!31558 lt!154902) x!1427)))))

(assert (=> b!317343 (=> (not res!171940) (not e!197309))))

(declare-fun b!317344 () Bool)

(assert (=> b!317344 (= e!197310 (bvsge (x!31558 lt!154902) #b01111111111111111111111111111110))))

(declare-fun b!317345 () Bool)

(declare-fun e!197311 () SeekEntryResult!2782)

(assert (=> b!317345 (= e!197311 (Intermediate!2782 true index!1781 x!1427))))

(declare-fun b!317346 () Bool)

(assert (=> b!317346 (and (bvsge (index!13306 lt!154902) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154902) (size!7994 a!3293)))))

(declare-fun e!197308 () Bool)

(assert (=> b!317346 (= e!197308 (= (select (arr!7642 a!3293) (index!13306 lt!154902)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!317347 () Bool)

(declare-fun e!197307 () SeekEntryResult!2782)

(assert (=> b!317347 (= e!197311 e!197307)))

(declare-fun c!50323 () Bool)

(declare-fun lt!154901 () (_ BitVec 64))

(assert (=> b!317347 (= c!50323 (or (= lt!154901 k!2441) (= (bvadd lt!154901 lt!154901) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!69185 () Bool)

(assert (=> d!69185 e!197310))

(declare-fun c!50324 () Bool)

(assert (=> d!69185 (= c!50324 (and (is-Intermediate!2782 lt!154902) (undefined!3594 lt!154902)))))

(assert (=> d!69185 (= lt!154902 e!197311)))

(declare-fun c!50325 () Bool)

(assert (=> d!69185 (= c!50325 (bvsge x!1427 #b01111111111111111111111111111110))))

(assert (=> d!69185 (= lt!154901 (select (arr!7642 a!3293) index!1781))))

(assert (=> d!69185 (validMask!0 mask!3709)))

(assert (=> d!69185 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154902)))

(declare-fun b!317348 () Bool)

(assert (=> b!317348 (= e!197307 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1427 #b00000000000000000000000000000001) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun b!317349 () Bool)

(assert (=> b!317349 (and (bvsge (index!13306 lt!154902) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154902) (size!7994 a!3293)))))

(declare-fun res!171941 () Bool)

(assert (=> b!317349 (= res!171941 (= (select (arr!7642 a!3293) (index!13306 lt!154902)) k!2441))))

(assert (=> b!317349 (=> res!171941 e!197308)))

(assert (=> b!317349 (= e!197309 e!197308)))

(declare-fun b!317350 () Bool)

(assert (=> b!317350 (= e!197307 (Intermediate!2782 false index!1781 x!1427))))

(declare-fun b!317351 () Bool)

(assert (=> b!317351 (and (bvsge (index!13306 lt!154902) #b00000000000000000000000000000000) (bvslt (index!13306 lt!154902) (size!7994 a!3293)))))

(declare-fun res!171942 () Bool)

(assert (=> b!317351 (= res!171942 (= (select (arr!7642 a!3293) (index!13306 lt!154902)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!317351 (=> res!171942 e!197308)))

(assert (= (and d!69185 c!50325) b!317345))

(assert (= (and d!69185 (not c!50325)) b!317347))

(assert (= (and b!317347 c!50323) b!317350))

(assert (= (and b!317347 (not c!50323)) b!317348))

(assert (= (and d!69185 c!50324) b!317344))

(assert (= (and d!69185 (not c!50324)) b!317343))

(assert (= (and b!317343 res!171940) b!317349))

(assert (= (and b!317349 (not res!171941)) b!317351))

(assert (= (and b!317351 (not res!171942)) b!317346))

(declare-fun m!326005 () Bool)

(assert (=> b!317349 m!326005))

(assert (=> d!69185 m!325827))

(assert (=> d!69185 m!325853))

(assert (=> b!317348 m!325845))

(assert (=> b!317348 m!325845))

(declare-fun m!326007 () Bool)

(assert (=> b!317348 m!326007))

(assert (=> b!317351 m!326005))

(assert (=> b!317346 m!326005))

(assert (=> b!317078 d!69185))

(declare-fun d!69187 () Bool)

(assert (=> d!69187 (= (validKeyInArray!0 k!2441) (and (not (= k!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!317079 d!69187))

(declare-fun d!69189 () Bool)

(declare-fun res!171947 () Bool)

(declare-fun e!197316 () Bool)

(assert (=> d!69189 (=> res!171947 e!197316)))

(assert (=> d!69189 (= res!171947 (= (select (arr!7642 a!3293) #b00000000000000000000000000000000) k!2441))))

(assert (=> d!69189 (= (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000) e!197316)))

(declare-fun b!317356 () Bool)

(declare-fun e!197317 () Bool)

(assert (=> b!317356 (= e!197316 e!197317)))

(declare-fun res!171948 () Bool)

(assert (=> b!317356 (=> (not res!171948) (not e!197317))))

(assert (=> b!317356 (= res!171948 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7994 a!3293)))))

(declare-fun b!317357 () Bool)

(assert (=> b!317357 (= e!197317 (arrayContainsKey!0 a!3293 k!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!69189 (not res!171947)) b!317356))

(assert (= (and b!317356 res!171948) b!317357))

(declare-fun m!326009 () Bool)

(assert (=> d!69189 m!326009))

(declare-fun m!326011 () Bool)

(assert (=> b!317357 m!326011))

(assert (=> b!317084 d!69189))

(declare-fun b!317374 () Bool)

(declare-fun e!197331 () Bool)

(declare-fun e!197330 () Bool)

(assert (=> b!317374 (= e!197331 e!197330)))

(declare-fun lt!154922 () (_ BitVec 64))

(assert (=> b!317374 (= lt!154922 (select (arr!7642 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9792 0))(
  ( (Unit!9793) )
))
(declare-fun lt!154923 () Unit!9792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16150 (_ BitVec 64) (_ BitVec 32)) Unit!9792)

(assert (=> b!317374 (= lt!154923 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!154922 #b00000000000000000000000000000000))))

(assert (=> b!317374 (arrayContainsKey!0 a!3293 lt!154922 #b00000000000000000000000000000000)))

(declare-fun lt!154921 () Unit!9792)

(assert (=> b!317374 (= lt!154921 lt!154923)))

(declare-fun res!171957 () Bool)

(assert (=> b!317374 (= res!171957 (= (seekEntryOrOpen!0 (select (arr!7642 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2782 #b00000000000000000000000000000000)))))

(assert (=> b!317374 (=> (not res!171957) (not e!197330))))

(declare-fun b!317375 () Bool)

(declare-fun e!197332 () Bool)

(assert (=> b!317375 (= e!197332 e!197331)))

(declare-fun c!50330 () Bool)

(assert (=> b!317375 (= c!50330 (validKeyInArray!0 (select (arr!7642 a!3293) #b00000000000000000000000000000000)))))

(declare-fun b!317376 () Bool)

(declare-fun call!26025 () Bool)

(assert (=> b!317376 (= e!197330 call!26025)))

(declare-fun b!317377 () Bool)

(assert (=> b!317377 (= e!197331 call!26025)))

(declare-fun bm!26022 () Bool)

(assert (=> bm!26022 (= call!26025 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun d!69193 () Bool)

(declare-fun res!171958 () Bool)

(assert (=> d!69193 (=> res!171958 e!197332)))

(assert (=> d!69193 (= res!171958 (bvsge #b00000000000000000000000000000000 (size!7994 a!3293)))))

(assert (=> d!69193 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!197332)))

(assert (= (and d!69193 (not res!171958)) b!317375))

(assert (= (and b!317375 c!50330) b!317374))

(assert (= (and b!317375 (not c!50330)) b!317377))

(assert (= (and b!317374 res!171957) b!317376))

(assert (= (or b!317376 b!317377) bm!26022))

(assert (=> b!317374 m!326009))

(declare-fun m!326013 () Bool)

(assert (=> b!317374 m!326013))

(declare-fun m!326015 () Bool)

(assert (=> b!317374 m!326015))

(assert (=> b!317374 m!326009))

(declare-fun m!326017 () Bool)

(assert (=> b!317374 m!326017))

(assert (=> b!317375 m!326009))

(assert (=> b!317375 m!326009))

(declare-fun m!326019 () Bool)

(assert (=> b!317375 m!326019))

(declare-fun m!326021 () Bool)

(assert (=> bm!26022 m!326021))

(assert (=> b!317080 d!69193))

(push 1)

