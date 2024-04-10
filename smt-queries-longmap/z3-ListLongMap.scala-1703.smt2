; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31258 () Bool)

(assert start!31258)

(declare-fun b!313790 () Bool)

(declare-fun res!169808 () Bool)

(declare-fun e!195529 () Bool)

(assert (=> b!313790 (=> (not res!169808) (not e!195529))))

(declare-datatypes ((array!16019 0))(
  ( (array!16020 (arr!7587 (Array (_ BitVec 32) (_ BitVec 64))) (size!7939 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16019)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun i!1240 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2727 0))(
  ( (MissingZero!2727 (index!13084 (_ BitVec 32))) (Found!2727 (index!13085 (_ BitVec 32))) (Intermediate!2727 (undefined!3539 Bool) (index!13086 (_ BitVec 32)) (x!31305 (_ BitVec 32))) (Undefined!2727) (MissingVacant!2727 (index!13087 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16019 (_ BitVec 32)) SeekEntryResult!2727)

(assert (=> b!313790 (= res!169808 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2727 i!1240)))))

(declare-fun b!313791 () Bool)

(declare-fun res!169807 () Bool)

(assert (=> b!313791 (=> (not res!169807) (not e!195529))))

(assert (=> b!313791 (= res!169807 (and (= (size!7939 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7939 a!3293))))))

(declare-fun b!313792 () Bool)

(declare-fun res!169805 () Bool)

(assert (=> b!313792 (=> (not res!169805) (not e!195529))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16019 (_ BitVec 32)) SeekEntryResult!2727)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313792 (= res!169805 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) (Intermediate!2727 false resIndex!52 resX!52)))))

(declare-fun b!313793 () Bool)

(assert (=> b!313793 (= e!195529 (or (bvslt resIndex!52 #b00000000000000000000000000000000) (bvsge resIndex!52 (size!7939 a!3293))))))

(declare-fun b!313794 () Bool)

(declare-fun res!169806 () Bool)

(assert (=> b!313794 (=> (not res!169806) (not e!195529))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16019 (_ BitVec 32)) Bool)

(assert (=> b!313794 (= res!169806 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!313795 () Bool)

(declare-fun res!169809 () Bool)

(assert (=> b!313795 (=> (not res!169809) (not e!195529))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!313795 (= res!169809 (validKeyInArray!0 k0!2441))))

(declare-fun res!169803 () Bool)

(assert (=> start!31258 (=> (not res!169803) (not e!195529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31258 (= res!169803 (validMask!0 mask!3709))))

(assert (=> start!31258 e!195529))

(declare-fun array_inv!5550 (array!16019) Bool)

(assert (=> start!31258 (array_inv!5550 a!3293)))

(assert (=> start!31258 true))

(declare-fun b!313796 () Bool)

(declare-fun res!169804 () Bool)

(assert (=> b!313796 (=> (not res!169804) (not e!195529))))

(declare-fun arrayContainsKey!0 (array!16019 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!313796 (= res!169804 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(assert (= (and start!31258 res!169803) b!313791))

(assert (= (and b!313791 res!169807) b!313795))

(assert (= (and b!313795 res!169809) b!313796))

(assert (= (and b!313796 res!169804) b!313790))

(assert (= (and b!313790 res!169808) b!313794))

(assert (= (and b!313794 res!169806) b!313792))

(assert (= (and b!313792 res!169805) b!313793))

(declare-fun m!323589 () Bool)

(assert (=> b!313794 m!323589))

(declare-fun m!323591 () Bool)

(assert (=> start!31258 m!323591))

(declare-fun m!323593 () Bool)

(assert (=> start!31258 m!323593))

(declare-fun m!323595 () Bool)

(assert (=> b!313795 m!323595))

(declare-fun m!323597 () Bool)

(assert (=> b!313792 m!323597))

(assert (=> b!313792 m!323597))

(declare-fun m!323599 () Bool)

(assert (=> b!313792 m!323599))

(declare-fun m!323601 () Bool)

(assert (=> b!313796 m!323601))

(declare-fun m!323603 () Bool)

(assert (=> b!313790 m!323603))

(check-sat (not b!313796) (not start!31258) (not b!313794) (not b!313790) (not b!313795) (not b!313792))
(check-sat)
(get-model)

(declare-fun d!68659 () Bool)

(assert (=> d!68659 (= (validKeyInArray!0 k0!2441) (and (not (= k0!2441 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2441 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!313795 d!68659))

(declare-fun d!68661 () Bool)

(declare-fun lt!153707 () SeekEntryResult!2727)

(get-info :version)

(assert (=> d!68661 (and (or ((_ is Undefined!2727) lt!153707) (not ((_ is Found!2727) lt!153707)) (and (bvsge (index!13085 lt!153707) #b00000000000000000000000000000000) (bvslt (index!13085 lt!153707) (size!7939 a!3293)))) (or ((_ is Undefined!2727) lt!153707) ((_ is Found!2727) lt!153707) (not ((_ is MissingZero!2727) lt!153707)) (and (bvsge (index!13084 lt!153707) #b00000000000000000000000000000000) (bvslt (index!13084 lt!153707) (size!7939 a!3293)))) (or ((_ is Undefined!2727) lt!153707) ((_ is Found!2727) lt!153707) ((_ is MissingZero!2727) lt!153707) (not ((_ is MissingVacant!2727) lt!153707)) (and (bvsge (index!13087 lt!153707) #b00000000000000000000000000000000) (bvslt (index!13087 lt!153707) (size!7939 a!3293)))) (or ((_ is Undefined!2727) lt!153707) (ite ((_ is Found!2727) lt!153707) (= (select (arr!7587 a!3293) (index!13085 lt!153707)) k0!2441) (ite ((_ is MissingZero!2727) lt!153707) (= (select (arr!7587 a!3293) (index!13084 lt!153707)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!2727) lt!153707) (= (select (arr!7587 a!3293) (index!13087 lt!153707)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!195548 () SeekEntryResult!2727)

(assert (=> d!68661 (= lt!153707 e!195548)))

(declare-fun c!49615 () Bool)

(declare-fun lt!153706 () SeekEntryResult!2727)

(assert (=> d!68661 (= c!49615 (and ((_ is Intermediate!2727) lt!153706) (undefined!3539 lt!153706)))))

(assert (=> d!68661 (= lt!153706 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709))))

(assert (=> d!68661 (validMask!0 mask!3709)))

(assert (=> d!68661 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) lt!153707)))

(declare-fun b!313842 () Bool)

(declare-fun e!195549 () SeekEntryResult!2727)

(assert (=> b!313842 (= e!195548 e!195549)))

(declare-fun lt!153708 () (_ BitVec 64))

(assert (=> b!313842 (= lt!153708 (select (arr!7587 a!3293) (index!13086 lt!153706)))))

(declare-fun c!49617 () Bool)

(assert (=> b!313842 (= c!49617 (= lt!153708 k0!2441))))

(declare-fun b!313843 () Bool)

(assert (=> b!313843 (= e!195549 (Found!2727 (index!13086 lt!153706)))))

(declare-fun b!313844 () Bool)

(declare-fun e!195550 () SeekEntryResult!2727)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16019 (_ BitVec 32)) SeekEntryResult!2727)

(assert (=> b!313844 (= e!195550 (seekKeyOrZeroReturnVacant!0 (x!31305 lt!153706) (index!13086 lt!153706) (index!13086 lt!153706) k0!2441 a!3293 mask!3709))))

(declare-fun b!313845 () Bool)

(declare-fun c!49616 () Bool)

(assert (=> b!313845 (= c!49616 (= lt!153708 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313845 (= e!195549 e!195550)))

(declare-fun b!313846 () Bool)

(assert (=> b!313846 (= e!195548 Undefined!2727)))

(declare-fun b!313847 () Bool)

(assert (=> b!313847 (= e!195550 (MissingZero!2727 (index!13086 lt!153706)))))

(assert (= (and d!68661 c!49615) b!313846))

(assert (= (and d!68661 (not c!49615)) b!313842))

(assert (= (and b!313842 c!49617) b!313843))

(assert (= (and b!313842 (not c!49617)) b!313845))

(assert (= (and b!313845 c!49616) b!313847))

(assert (= (and b!313845 (not c!49616)) b!313844))

(declare-fun m!323621 () Bool)

(assert (=> d!68661 m!323621))

(assert (=> d!68661 m!323597))

(assert (=> d!68661 m!323597))

(assert (=> d!68661 m!323599))

(assert (=> d!68661 m!323591))

(declare-fun m!323623 () Bool)

(assert (=> d!68661 m!323623))

(declare-fun m!323625 () Bool)

(assert (=> d!68661 m!323625))

(declare-fun m!323627 () Bool)

(assert (=> b!313842 m!323627))

(declare-fun m!323629 () Bool)

(assert (=> b!313844 m!323629))

(assert (=> b!313790 d!68661))

(declare-fun d!68667 () Bool)

(declare-fun res!169835 () Bool)

(declare-fun e!195555 () Bool)

(assert (=> d!68667 (=> res!169835 e!195555)))

(assert (=> d!68667 (= res!169835 (= (select (arr!7587 a!3293) #b00000000000000000000000000000000) k0!2441))))

(assert (=> d!68667 (= (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000) e!195555)))

(declare-fun b!313852 () Bool)

(declare-fun e!195556 () Bool)

(assert (=> b!313852 (= e!195555 e!195556)))

(declare-fun res!169836 () Bool)

(assert (=> b!313852 (=> (not res!169836) (not e!195556))))

(assert (=> b!313852 (= res!169836 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7939 a!3293)))))

(declare-fun b!313853 () Bool)

(assert (=> b!313853 (= e!195556 (arrayContainsKey!0 a!3293 k0!2441 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!68667 (not res!169835)) b!313852))

(assert (= (and b!313852 res!169836) b!313853))

(declare-fun m!323631 () Bool)

(assert (=> d!68667 m!323631))

(declare-fun m!323633 () Bool)

(assert (=> b!313853 m!323633))

(assert (=> b!313796 d!68667))

(declare-fun d!68669 () Bool)

(assert (=> d!68669 (= (validMask!0 mask!3709) (and (or (= mask!3709 #b00000000000000000000000000000111) (= mask!3709 #b00000000000000000000000000001111) (= mask!3709 #b00000000000000000000000000011111) (= mask!3709 #b00000000000000000000000000111111) (= mask!3709 #b00000000000000000000000001111111) (= mask!3709 #b00000000000000000000000011111111) (= mask!3709 #b00000000000000000000000111111111) (= mask!3709 #b00000000000000000000001111111111) (= mask!3709 #b00000000000000000000011111111111) (= mask!3709 #b00000000000000000000111111111111) (= mask!3709 #b00000000000000000001111111111111) (= mask!3709 #b00000000000000000011111111111111) (= mask!3709 #b00000000000000000111111111111111) (= mask!3709 #b00000000000000001111111111111111) (= mask!3709 #b00000000000000011111111111111111) (= mask!3709 #b00000000000000111111111111111111) (= mask!3709 #b00000000000001111111111111111111) (= mask!3709 #b00000000000011111111111111111111) (= mask!3709 #b00000000000111111111111111111111) (= mask!3709 #b00000000001111111111111111111111) (= mask!3709 #b00000000011111111111111111111111) (= mask!3709 #b00000000111111111111111111111111) (= mask!3709 #b00000001111111111111111111111111) (= mask!3709 #b00000011111111111111111111111111) (= mask!3709 #b00000111111111111111111111111111) (= mask!3709 #b00001111111111111111111111111111) (= mask!3709 #b00011111111111111111111111111111) (= mask!3709 #b00111111111111111111111111111111)) (bvsle mask!3709 #b00111111111111111111111111111111)))))

(assert (=> start!31258 d!68669))

(declare-fun d!68677 () Bool)

(assert (=> d!68677 (= (array_inv!5550 a!3293) (bvsge (size!7939 a!3293) #b00000000000000000000000000000000))))

(assert (=> start!31258 d!68677))

(declare-fun b!313910 () Bool)

(declare-fun lt!153730 () SeekEntryResult!2727)

(assert (=> b!313910 (and (bvsge (index!13086 lt!153730) #b00000000000000000000000000000000) (bvslt (index!13086 lt!153730) (size!7939 a!3293)))))

(declare-fun e!195591 () Bool)

(assert (=> b!313910 (= e!195591 (= (select (arr!7587 a!3293) (index!13086 lt!153730)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!313911 () Bool)

(declare-fun e!195589 () SeekEntryResult!2727)

(declare-fun e!195590 () SeekEntryResult!2727)

(assert (=> b!313911 (= e!195589 e!195590)))

(declare-fun c!49640 () Bool)

(declare-fun lt!153729 () (_ BitVec 64))

(assert (=> b!313911 (= c!49640 (or (= lt!153729 k0!2441) (= (bvadd lt!153729 lt!153729) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!68679 () Bool)

(declare-fun e!195592 () Bool)

(assert (=> d!68679 e!195592))

(declare-fun c!49641 () Bool)

(assert (=> d!68679 (= c!49641 (and ((_ is Intermediate!2727) lt!153730) (undefined!3539 lt!153730)))))

(assert (=> d!68679 (= lt!153730 e!195589)))

(declare-fun c!49642 () Bool)

(assert (=> d!68679 (= c!49642 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!68679 (= lt!153729 (select (arr!7587 a!3293) (toIndex!0 k0!2441 mask!3709)))))

(assert (=> d!68679 (validMask!0 mask!3709)))

(assert (=> d!68679 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!153730)))

(declare-fun b!313912 () Bool)

(assert (=> b!313912 (= e!195590 (Intermediate!2727 false (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313913 () Bool)

(assert (=> b!313913 (and (bvsge (index!13086 lt!153730) #b00000000000000000000000000000000) (bvslt (index!13086 lt!153730) (size!7939 a!3293)))))

(declare-fun res!169851 () Bool)

(assert (=> b!313913 (= res!169851 (= (select (arr!7587 a!3293) (index!13086 lt!153730)) k0!2441))))

(assert (=> b!313913 (=> res!169851 e!195591)))

(declare-fun e!195593 () Bool)

(assert (=> b!313913 (= e!195593 e!195591)))

(declare-fun b!313914 () Bool)

(assert (=> b!313914 (= e!195592 (bvsge (x!31305 lt!153730) #b01111111111111111111111111111110))))

(declare-fun b!313915 () Bool)

(assert (=> b!313915 (= e!195589 (Intermediate!2727 true (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000))))

(declare-fun b!313916 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!313916 (= e!195590 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!2441 mask!3709) #b00000000000000000000000000000000 mask!3709) k0!2441 a!3293 mask!3709))))

(declare-fun b!313917 () Bool)

(assert (=> b!313917 (= e!195592 e!195593)))

(declare-fun res!169850 () Bool)

(assert (=> b!313917 (= res!169850 (and ((_ is Intermediate!2727) lt!153730) (not (undefined!3539 lt!153730)) (bvslt (x!31305 lt!153730) #b01111111111111111111111111111110) (bvsge (x!31305 lt!153730) #b00000000000000000000000000000000) (bvsge (x!31305 lt!153730) #b00000000000000000000000000000000)))))

(assert (=> b!313917 (=> (not res!169850) (not e!195593))))

(declare-fun b!313918 () Bool)

(assert (=> b!313918 (and (bvsge (index!13086 lt!153730) #b00000000000000000000000000000000) (bvslt (index!13086 lt!153730) (size!7939 a!3293)))))

(declare-fun res!169849 () Bool)

(assert (=> b!313918 (= res!169849 (= (select (arr!7587 a!3293) (index!13086 lt!153730)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!313918 (=> res!169849 e!195591)))

(assert (= (and d!68679 c!49642) b!313915))

(assert (= (and d!68679 (not c!49642)) b!313911))

(assert (= (and b!313911 c!49640) b!313912))

(assert (= (and b!313911 (not c!49640)) b!313916))

(assert (= (and d!68679 c!49641) b!313914))

(assert (= (and d!68679 (not c!49641)) b!313917))

(assert (= (and b!313917 res!169850) b!313913))

(assert (= (and b!313913 (not res!169851)) b!313918))

(assert (= (and b!313918 (not res!169849)) b!313910))

(declare-fun m!323659 () Bool)

(assert (=> b!313910 m!323659))

(assert (=> b!313916 m!323597))

(declare-fun m!323661 () Bool)

(assert (=> b!313916 m!323661))

(assert (=> b!313916 m!323661))

(declare-fun m!323663 () Bool)

(assert (=> b!313916 m!323663))

(assert (=> b!313918 m!323659))

(assert (=> d!68679 m!323597))

(declare-fun m!323665 () Bool)

(assert (=> d!68679 m!323665))

(assert (=> d!68679 m!323591))

(assert (=> b!313913 m!323659))

(assert (=> b!313792 d!68679))

(declare-fun d!68687 () Bool)

(declare-fun lt!153744 () (_ BitVec 32))

(declare-fun lt!153743 () (_ BitVec 32))

(assert (=> d!68687 (= lt!153744 (bvmul (bvxor lt!153743 (bvlshr lt!153743 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!68687 (= lt!153743 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!68687 (and (bvsge mask!3709 #b00000000000000000000000000000000) (let ((res!169858 (let ((h!5355 ((_ extract 31 0) (bvand (bvxor k0!2441 (bvlshr k0!2441 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!31309 (bvmul (bvxor h!5355 (bvlshr h!5355 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!31309 (bvlshr x!31309 #b00000000000000000000000000001101)) mask!3709))))) (and (bvslt res!169858 (bvadd mask!3709 #b00000000000000000000000000000001)) (bvsge res!169858 #b00000000000000000000000000000000))))))

(assert (=> d!68687 (= (toIndex!0 k0!2441 mask!3709) (bvand (bvxor lt!153744 (bvlshr lt!153744 #b00000000000000000000000000001101)) mask!3709))))

(assert (=> b!313792 d!68687))

(declare-fun bm!25957 () Bool)

(declare-fun call!25960 () Bool)

(assert (=> bm!25957 (= call!25960 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3293 mask!3709))))

(declare-fun b!313958 () Bool)

(declare-fun e!195620 () Bool)

(declare-fun e!195621 () Bool)

(assert (=> b!313958 (= e!195620 e!195621)))

(declare-fun c!49653 () Bool)

(assert (=> b!313958 (= c!49653 (validKeyInArray!0 (select (arr!7587 a!3293) #b00000000000000000000000000000000)))))

(declare-fun d!68691 () Bool)

(declare-fun res!169873 () Bool)

(assert (=> d!68691 (=> res!169873 e!195620)))

(assert (=> d!68691 (= res!169873 (bvsge #b00000000000000000000000000000000 (size!7939 a!3293)))))

(assert (=> d!68691 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709) e!195620)))

(declare-fun b!313959 () Bool)

(assert (=> b!313959 (= e!195621 call!25960)))

(declare-fun b!313960 () Bool)

(declare-fun e!195622 () Bool)

(assert (=> b!313960 (= e!195621 e!195622)))

(declare-fun lt!153761 () (_ BitVec 64))

(assert (=> b!313960 (= lt!153761 (select (arr!7587 a!3293) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9683 0))(
  ( (Unit!9684) )
))
(declare-fun lt!153760 () Unit!9683)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!16019 (_ BitVec 64) (_ BitVec 32)) Unit!9683)

(assert (=> b!313960 (= lt!153760 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3293 lt!153761 #b00000000000000000000000000000000))))

(assert (=> b!313960 (arrayContainsKey!0 a!3293 lt!153761 #b00000000000000000000000000000000)))

(declare-fun lt!153762 () Unit!9683)

(assert (=> b!313960 (= lt!153762 lt!153760)))

(declare-fun res!169874 () Bool)

(assert (=> b!313960 (= res!169874 (= (seekEntryOrOpen!0 (select (arr!7587 a!3293) #b00000000000000000000000000000000) a!3293 mask!3709) (Found!2727 #b00000000000000000000000000000000)))))

(assert (=> b!313960 (=> (not res!169874) (not e!195622))))

(declare-fun b!313961 () Bool)

(assert (=> b!313961 (= e!195622 call!25960)))

(assert (= (and d!68691 (not res!169873)) b!313958))

(assert (= (and b!313958 c!49653) b!313960))

(assert (= (and b!313958 (not c!49653)) b!313959))

(assert (= (and b!313960 res!169874) b!313961))

(assert (= (or b!313961 b!313959) bm!25957))

(declare-fun m!323687 () Bool)

(assert (=> bm!25957 m!323687))

(assert (=> b!313958 m!323631))

(assert (=> b!313958 m!323631))

(declare-fun m!323689 () Bool)

(assert (=> b!313958 m!323689))

(assert (=> b!313960 m!323631))

(declare-fun m!323691 () Bool)

(assert (=> b!313960 m!323691))

(declare-fun m!323693 () Bool)

(assert (=> b!313960 m!323693))

(assert (=> b!313960 m!323631))

(declare-fun m!323695 () Bool)

(assert (=> b!313960 m!323695))

(assert (=> b!313794 d!68691))

(check-sat (not b!313844) (not d!68679) (not b!313958) (not b!313916) (not d!68661) (not bm!25957) (not b!313853) (not b!313960))
(check-sat)
