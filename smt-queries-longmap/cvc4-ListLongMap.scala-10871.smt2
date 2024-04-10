; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127426 () Bool)

(assert start!127426)

(declare-fun b!1497825 () Bool)

(declare-fun res!1018937 () Bool)

(declare-fun e!838732 () Bool)

(assert (=> b!1497825 (=> (not res!1018937) (not e!838732))))

(declare-datatypes ((array!99867 0))(
  ( (array!99868 (arr!48196 (Array (_ BitVec 32) (_ BitVec 64))) (size!48746 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!99867)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99867 (_ BitVec 32)) Bool)

(assert (=> b!1497825 (= res!1018937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1497826 () Bool)

(declare-fun res!1018940 () Bool)

(assert (=> b!1497826 (=> (not res!1018940) (not e!838732))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1497826 (= res!1018940 (and (= (size!48746 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48746 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48746 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1497827 () Bool)

(declare-datatypes ((List!34688 0))(
  ( (Nil!34685) (Cons!34684 (h!36081 (_ BitVec 64)) (t!49382 List!34688)) )
))
(declare-fun noDuplicate!2620 (List!34688) Bool)

(assert (=> b!1497827 (= e!838732 (not (noDuplicate!2620 Nil!34685)))))

(declare-fun b!1497828 () Bool)

(declare-fun res!1018942 () Bool)

(assert (=> b!1497828 (=> (not res!1018942) (not e!838732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497828 (= res!1018942 (validKeyInArray!0 (select (arr!48196 a!2850) i!996)))))

(declare-fun b!1497829 () Bool)

(declare-fun res!1018939 () Bool)

(assert (=> b!1497829 (=> (not res!1018939) (not e!838732))))

(assert (=> b!1497829 (= res!1018939 (validKeyInArray!0 (select (arr!48196 a!2850) j!87)))))

(declare-fun b!1497830 () Bool)

(declare-fun res!1018941 () Bool)

(assert (=> b!1497830 (=> (not res!1018941) (not e!838732))))

(assert (=> b!1497830 (= res!1018941 (and (bvsle #b00000000000000000000000000000000 (size!48746 a!2850)) (bvslt (size!48746 a!2850) #b01111111111111111111111111111111)))))

(declare-fun res!1018938 () Bool)

(assert (=> start!127426 (=> (not res!1018938) (not e!838732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127426 (= res!1018938 (validMask!0 mask!2661))))

(assert (=> start!127426 e!838732))

(assert (=> start!127426 true))

(declare-fun array_inv!37224 (array!99867) Bool)

(assert (=> start!127426 (array_inv!37224 a!2850)))

(assert (= (and start!127426 res!1018938) b!1497826))

(assert (= (and b!1497826 res!1018940) b!1497828))

(assert (= (and b!1497828 res!1018942) b!1497829))

(assert (= (and b!1497829 res!1018939) b!1497825))

(assert (= (and b!1497825 res!1018937) b!1497830))

(assert (= (and b!1497830 res!1018941) b!1497827))

(declare-fun m!1380903 () Bool)

(assert (=> b!1497829 m!1380903))

(assert (=> b!1497829 m!1380903))

(declare-fun m!1380905 () Bool)

(assert (=> b!1497829 m!1380905))

(declare-fun m!1380907 () Bool)

(assert (=> b!1497827 m!1380907))

(declare-fun m!1380909 () Bool)

(assert (=> b!1497825 m!1380909))

(declare-fun m!1380911 () Bool)

(assert (=> start!127426 m!1380911))

(declare-fun m!1380913 () Bool)

(assert (=> start!127426 m!1380913))

(declare-fun m!1380915 () Bool)

(assert (=> b!1497828 m!1380915))

(assert (=> b!1497828 m!1380915))

(declare-fun m!1380917 () Bool)

(assert (=> b!1497828 m!1380917))

(push 1)

(assert (not b!1497829))

(assert (not b!1497827))

(assert (not b!1497825))

(assert (not b!1497828))

(assert (not start!127426))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!157467 () Bool)

(assert (=> d!157467 (= (validMask!0 mask!2661) (and (or (= mask!2661 #b00000000000000000000000000000111) (= mask!2661 #b00000000000000000000000000001111) (= mask!2661 #b00000000000000000000000000011111) (= mask!2661 #b00000000000000000000000000111111) (= mask!2661 #b00000000000000000000000001111111) (= mask!2661 #b00000000000000000000000011111111) (= mask!2661 #b00000000000000000000000111111111) (= mask!2661 #b00000000000000000000001111111111) (= mask!2661 #b00000000000000000000011111111111) (= mask!2661 #b00000000000000000000111111111111) (= mask!2661 #b00000000000000000001111111111111) (= mask!2661 #b00000000000000000011111111111111) (= mask!2661 #b00000000000000000111111111111111) (= mask!2661 #b00000000000000001111111111111111) (= mask!2661 #b00000000000000011111111111111111) (= mask!2661 #b00000000000000111111111111111111) (= mask!2661 #b00000000000001111111111111111111) (= mask!2661 #b00000000000011111111111111111111) (= mask!2661 #b00000000000111111111111111111111) (= mask!2661 #b00000000001111111111111111111111) (= mask!2661 #b00000000011111111111111111111111) (= mask!2661 #b00000000111111111111111111111111) (= mask!2661 #b00000001111111111111111111111111) (= mask!2661 #b00000011111111111111111111111111) (= mask!2661 #b00000111111111111111111111111111) (= mask!2661 #b00001111111111111111111111111111) (= mask!2661 #b00011111111111111111111111111111) (= mask!2661 #b00111111111111111111111111111111)) (bvsle mask!2661 #b00111111111111111111111111111111)))))

(assert (=> start!127426 d!157467))

(declare-fun d!157477 () Bool)

(assert (=> d!157477 (= (array_inv!37224 a!2850) (bvsge (size!48746 a!2850) #b00000000000000000000000000000000))))

(assert (=> start!127426 d!157477))

(declare-fun b!1497869 () Bool)

(declare-fun e!838765 () Bool)

(declare-fun call!68058 () Bool)

(assert (=> b!1497869 (= e!838765 call!68058)))

(declare-fun b!1497870 () Bool)

(declare-fun e!838764 () Bool)

(assert (=> b!1497870 (= e!838764 call!68058)))

(declare-fun bm!68055 () Bool)

(assert (=> bm!68055 (= call!68058 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2850 mask!2661))))

(declare-fun b!1497872 () Bool)

(assert (=> b!1497872 (= e!838764 e!838765)))

(declare-fun lt!652557 () (_ BitVec 64))

(assert (=> b!1497872 (= lt!652557 (select (arr!48196 a!2850) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50200 0))(
  ( (Unit!50201) )
))
(declare-fun lt!652556 () Unit!50200)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!99867 (_ BitVec 64) (_ BitVec 32)) Unit!50200)

(assert (=> b!1497872 (= lt!652556 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2850 lt!652557 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!99867 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1497872 (arrayContainsKey!0 a!2850 lt!652557 #b00000000000000000000000000000000)))

(declare-fun lt!652558 () Unit!50200)

(assert (=> b!1497872 (= lt!652558 lt!652556)))

(declare-fun res!1018966 () Bool)

(declare-datatypes ((SeekEntryResult!12430 0))(
  ( (MissingZero!12430 (index!52112 (_ BitVec 32))) (Found!12430 (index!52113 (_ BitVec 32))) (Intermediate!12430 (undefined!13242 Bool) (index!52114 (_ BitVec 32)) (x!133744 (_ BitVec 32))) (Undefined!12430) (MissingVacant!12430 (index!52115 (_ BitVec 32))) )
))
