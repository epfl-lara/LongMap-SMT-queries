; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36202 () Bool)

(assert start!36202)

(declare-fun b!362702 () Bool)

(declare-fun res!202133 () Bool)

(declare-fun e!222114 () Bool)

(assert (=> b!362702 (=> (not res!202133) (not e!222114))))

(declare-fun k0!2980 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362702 (= res!202133 (validKeyInArray!0 k0!2980))))

(declare-fun res!202132 () Bool)

(assert (=> start!36202 (=> (not res!202132) (not e!222114))))

(declare-fun i!1478 () (_ BitVec 32))

(declare-datatypes ((array!20514 0))(
  ( (array!20515 (arr!9739 (Array (_ BitVec 32) (_ BitVec 64))) (size!10092 (_ BitVec 32))) )
))
(declare-fun a!4337 () array!20514)

(assert (=> start!36202 (= res!202132 (and (bvsge i!1478 #b00000000000000000000000000000000) (bvslt i!1478 (size!10092 a!4337))))))

(assert (=> start!36202 e!222114))

(assert (=> start!36202 true))

(declare-fun array_inv!7188 (array!20514) Bool)

(assert (=> start!36202 (array_inv!7188 a!4337)))

(declare-fun b!362704 () Bool)

(declare-fun arrayCountValidKeys!0 (array!20514 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!362704 (= e!222114 (not (= (arrayCountValidKeys!0 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvadd #b00000000000000000000000000000001 (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478))))))))

(declare-fun b!362703 () Bool)

(declare-fun res!202134 () Bool)

(assert (=> b!362703 (=> (not res!202134) (not e!222114))))

(assert (=> b!362703 (= res!202134 (and (bvslt (size!10092 a!4337) #b01111111111111111111111111111111) (bvsle i!1478 (size!10092 a!4337))))))

(declare-fun b!362701 () Bool)

(declare-fun res!202135 () Bool)

(assert (=> b!362701 (=> (not res!202135) (not e!222114))))

(assert (=> b!362701 (= res!202135 (not (validKeyInArray!0 (select (arr!9739 a!4337) i!1478))))))

(assert (= (and start!36202 res!202132) b!362701))

(assert (= (and b!362701 res!202135) b!362702))

(assert (= (and b!362702 res!202133) b!362703))

(assert (= (and b!362703 res!202134) b!362704))

(declare-fun m!359113 () Bool)

(assert (=> b!362702 m!359113))

(declare-fun m!359115 () Bool)

(assert (=> start!36202 m!359115))

(declare-fun m!359117 () Bool)

(assert (=> b!362704 m!359117))

(declare-fun m!359119 () Bool)

(assert (=> b!362704 m!359119))

(declare-fun m!359121 () Bool)

(assert (=> b!362704 m!359121))

(declare-fun m!359123 () Bool)

(assert (=> b!362701 m!359123))

(assert (=> b!362701 m!359123))

(declare-fun m!359125 () Bool)

(assert (=> b!362701 m!359125))

(check-sat (not b!362702) (not b!362704) (not b!362701) (not start!36202))
(check-sat)
(get-model)

(declare-fun d!71859 () Bool)

(assert (=> d!71859 (= (validKeyInArray!0 k0!2980) (and (not (= k0!2980 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2980 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362702 d!71859))

(declare-fun b!362737 () Bool)

(declare-fun e!222131 () (_ BitVec 32))

(declare-fun call!27191 () (_ BitVec 32))

(assert (=> b!362737 (= e!222131 (bvadd #b00000000000000000000000000000001 call!27191))))

(declare-fun b!362738 () Bool)

(declare-fun e!222132 () (_ BitVec 32))

(assert (=> b!362738 (= e!222132 e!222131)))

(declare-fun c!53708 () Bool)

(assert (=> b!362738 (= c!53708 (validKeyInArray!0 (select (arr!9739 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337))) i!1478)))))

(declare-fun lt!167102 () (_ BitVec 32))

(declare-fun d!71861 () Bool)

(assert (=> d!71861 (and (bvsge lt!167102 #b00000000000000000000000000000000) (bvsle lt!167102 (bvsub (size!10092 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337))) i!1478)))))

(assert (=> d!71861 (= lt!167102 e!222132)))

(declare-fun c!53707 () Bool)

(assert (=> d!71861 (= c!53707 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!71861 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10092 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337)))))))

(assert (=> d!71861 (= (arrayCountValidKeys!0 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337)) i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167102)))

(declare-fun bm!27188 () Bool)

(assert (=> bm!27188 (= call!27191 (arrayCountValidKeys!0 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362739 () Bool)

(assert (=> b!362739 (= e!222131 call!27191)))

(declare-fun b!362740 () Bool)

(assert (=> b!362740 (= e!222132 #b00000000000000000000000000000000)))

(assert (= (and d!71861 c!53707) b!362740))

(assert (= (and d!71861 (not c!53707)) b!362738))

(assert (= (and b!362738 c!53708) b!362737))

(assert (= (and b!362738 (not c!53708)) b!362739))

(assert (= (or b!362737 b!362739) bm!27188))

(declare-fun m!359155 () Bool)

(assert (=> b!362738 m!359155))

(assert (=> b!362738 m!359155))

(declare-fun m!359157 () Bool)

(assert (=> b!362738 m!359157))

(declare-fun m!359159 () Bool)

(assert (=> bm!27188 m!359159))

(assert (=> b!362704 d!71861))

(declare-fun b!362741 () Bool)

(declare-fun e!222133 () (_ BitVec 32))

(declare-fun call!27192 () (_ BitVec 32))

(assert (=> b!362741 (= e!222133 (bvadd #b00000000000000000000000000000001 call!27192))))

(declare-fun b!362742 () Bool)

(declare-fun e!222134 () (_ BitVec 32))

(assert (=> b!362742 (= e!222134 e!222133)))

(declare-fun c!53710 () Bool)

(assert (=> b!362742 (= c!53710 (validKeyInArray!0 (select (arr!9739 a!4337) i!1478)))))

(declare-fun d!71863 () Bool)

(declare-fun lt!167103 () (_ BitVec 32))

(assert (=> d!71863 (and (bvsge lt!167103 #b00000000000000000000000000000000) (bvsle lt!167103 (bvsub (size!10092 a!4337) i!1478)))))

(assert (=> d!71863 (= lt!167103 e!222134)))

(declare-fun c!53709 () Bool)

(assert (=> d!71863 (= c!53709 (bvsge i!1478 (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!71863 (and (bvsle i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge i!1478 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10092 a!4337)))))

(assert (=> d!71863 (= (arrayCountValidKeys!0 a!4337 i!1478 (bvadd #b00000000000000000000000000000001 i!1478)) lt!167103)))

(declare-fun bm!27189 () Bool)

(assert (=> bm!27189 (= call!27192 (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362743 () Bool)

(assert (=> b!362743 (= e!222133 call!27192)))

(declare-fun b!362744 () Bool)

(assert (=> b!362744 (= e!222134 #b00000000000000000000000000000000)))

(assert (= (and d!71863 c!53709) b!362744))

(assert (= (and d!71863 (not c!53709)) b!362742))

(assert (= (and b!362742 c!53710) b!362741))

(assert (= (and b!362742 (not c!53710)) b!362743))

(assert (= (or b!362741 b!362743) bm!27189))

(assert (=> b!362742 m!359123))

(assert (=> b!362742 m!359123))

(assert (=> b!362742 m!359125))

(declare-fun m!359161 () Bool)

(assert (=> bm!27189 m!359161))

(assert (=> b!362704 d!71863))

(declare-fun d!71865 () Bool)

(assert (=> d!71865 (= (validKeyInArray!0 (select (arr!9739 a!4337) i!1478)) (and (not (= (select (arr!9739 a!4337) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9739 a!4337) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362701 d!71865))

(declare-fun d!71867 () Bool)

(assert (=> d!71867 (= (array_inv!7188 a!4337) (bvsge (size!10092 a!4337) #b00000000000000000000000000000000))))

(assert (=> start!36202 d!71867))

(check-sat (not b!362738) (not bm!27188) (not b!362742) (not bm!27189))
(check-sat)
(get-model)

(declare-fun d!71889 () Bool)

(assert (=> d!71889 (= (validKeyInArray!0 (select (arr!9739 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337))) i!1478)) (and (not (= (select (arr!9739 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337))) i!1478) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!9739 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337))) i!1478) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!362738 d!71889))

(declare-fun b!362777 () Bool)

(declare-fun e!222151 () (_ BitVec 32))

(declare-fun call!27201 () (_ BitVec 32))

(assert (=> b!362777 (= e!222151 (bvadd #b00000000000000000000000000000001 call!27201))))

(declare-fun b!362778 () Bool)

(declare-fun e!222152 () (_ BitVec 32))

(assert (=> b!362778 (= e!222152 e!222151)))

(declare-fun c!53728 () Bool)

(assert (=> b!362778 (= c!53728 (validKeyInArray!0 (select (arr!9739 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337))) (bvadd i!1478 #b00000000000000000000000000000001))))))

(declare-fun d!71891 () Bool)

(declare-fun lt!167112 () (_ BitVec 32))

(assert (=> d!71891 (and (bvsge lt!167112 #b00000000000000000000000000000000) (bvsle lt!167112 (bvsub (size!10092 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337))) (bvadd i!1478 #b00000000000000000000000000000001))))))

(assert (=> d!71891 (= lt!167112 e!222152)))

(declare-fun c!53727 () Bool)

(assert (=> d!71891 (= c!53727 (bvsge (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!71891 (and (bvsle (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd i!1478 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10092 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337)))))))

(assert (=> d!71891 (= (arrayCountValidKeys!0 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167112)))

(declare-fun bm!27198 () Bool)

(assert (=> bm!27198 (= call!27201 (arrayCountValidKeys!0 (array!20515 (store (arr!9739 a!4337) i!1478 k0!2980) (size!10092 a!4337)) (bvadd i!1478 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362779 () Bool)

(assert (=> b!362779 (= e!222151 call!27201)))

(declare-fun b!362780 () Bool)

(assert (=> b!362780 (= e!222152 #b00000000000000000000000000000000)))

(assert (= (and d!71891 c!53727) b!362780))

(assert (= (and d!71891 (not c!53727)) b!362778))

(assert (= (and b!362778 c!53728) b!362777))

(assert (= (and b!362778 (not c!53728)) b!362779))

(assert (= (or b!362777 b!362779) bm!27198))

(declare-fun m!359179 () Bool)

(assert (=> b!362778 m!359179))

(assert (=> b!362778 m!359179))

(declare-fun m!359181 () Bool)

(assert (=> b!362778 m!359181))

(declare-fun m!359183 () Bool)

(assert (=> bm!27198 m!359183))

(assert (=> bm!27188 d!71891))

(assert (=> b!362742 d!71865))

(declare-fun b!362781 () Bool)

(declare-fun e!222153 () (_ BitVec 32))

(declare-fun call!27202 () (_ BitVec 32))

(assert (=> b!362781 (= e!222153 (bvadd #b00000000000000000000000000000001 call!27202))))

(declare-fun b!362782 () Bool)

(declare-fun e!222154 () (_ BitVec 32))

(assert (=> b!362782 (= e!222154 e!222153)))

(declare-fun c!53730 () Bool)

(assert (=> b!362782 (= c!53730 (validKeyInArray!0 (select (arr!9739 a!4337) (bvadd i!1478 #b00000000000000000000000000000001))))))

(declare-fun d!71893 () Bool)

(declare-fun lt!167113 () (_ BitVec 32))

(assert (=> d!71893 (and (bvsge lt!167113 #b00000000000000000000000000000000) (bvsle lt!167113 (bvsub (size!10092 a!4337) (bvadd i!1478 #b00000000000000000000000000000001))))))

(assert (=> d!71893 (= lt!167113 e!222154)))

(declare-fun c!53729 () Bool)

(assert (=> d!71893 (= c!53729 (bvsge (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(assert (=> d!71893 (and (bvsle (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) (bvsge (bvadd i!1478 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 i!1478) (size!10092 a!4337)))))

(assert (=> d!71893 (= (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)) lt!167113)))

(declare-fun bm!27199 () Bool)

(assert (=> bm!27199 (= call!27202 (arrayCountValidKeys!0 a!4337 (bvadd i!1478 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!1478)))))

(declare-fun b!362783 () Bool)

(assert (=> b!362783 (= e!222153 call!27202)))

(declare-fun b!362784 () Bool)

(assert (=> b!362784 (= e!222154 #b00000000000000000000000000000000)))

(assert (= (and d!71893 c!53729) b!362784))

(assert (= (and d!71893 (not c!53729)) b!362782))

(assert (= (and b!362782 c!53730) b!362781))

(assert (= (and b!362782 (not c!53730)) b!362783))

(assert (= (or b!362781 b!362783) bm!27199))

(declare-fun m!359185 () Bool)

(assert (=> b!362782 m!359185))

(assert (=> b!362782 m!359185))

(declare-fun m!359187 () Bool)

(assert (=> b!362782 m!359187))

(declare-fun m!359189 () Bool)

(assert (=> bm!27199 m!359189))

(assert (=> bm!27189 d!71893))

(check-sat (not b!362782) (not bm!27199) (not bm!27198) (not b!362778))
(check-sat)
