; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93108 () Bool)

(assert start!93108)

(declare-fun res!704900 () Bool)

(declare-fun e!600355 () Bool)

(assert (=> start!93108 (=> (not res!704900) (not e!600355))))

(declare-fun i!1381 () (_ BitVec 32))

(declare-datatypes ((array!66606 0))(
  ( (array!66607 (arr!32029 (Array (_ BitVec 32) (_ BitVec 64))) (size!32565 (_ BitVec 32))) )
))
(declare-fun a!3488 () array!66606)

(assert (=> start!93108 (= res!704900 (and (bvsge i!1381 #b00000000000000000000000000000000) (bvslt i!1381 (size!32565 a!3488)) (bvslt (size!32565 a!3488) #b01111111111111111111111111111111)))))

(assert (=> start!93108 e!600355))

(assert (=> start!93108 true))

(declare-fun array_inv!24809 (array!66606) Bool)

(assert (=> start!93108 (array_inv!24809 a!3488)))

(declare-fun b!1056121 () Bool)

(declare-fun res!704902 () Bool)

(assert (=> b!1056121 (=> (not res!704902) (not e!600355))))

(declare-fun k!2747 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1056121 (= res!704902 (validKeyInArray!0 k!2747))))

(declare-fun b!1056122 () Bool)

(declare-fun e!600357 () Bool)

(declare-fun e!600356 () Bool)

(assert (=> b!1056122 (= e!600357 e!600356)))

(declare-fun res!704904 () Bool)

(assert (=> b!1056122 (=> (not res!704904) (not e!600356))))

(declare-fun lt!466034 () (_ BitVec 32))

(assert (=> b!1056122 (= res!704904 (not (= lt!466034 i!1381)))))

(declare-fun lt!466035 () array!66606)

(declare-fun arrayScanForKey!0 (array!66606 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1056122 (= lt!466034 (arrayScanForKey!0 lt!466035 k!2747 #b00000000000000000000000000000000))))

(declare-fun b!1056123 () Bool)

(declare-fun res!704901 () Bool)

(assert (=> b!1056123 (=> (not res!704901) (not e!600355))))

(assert (=> b!1056123 (= res!704901 (= (select (arr!32029 a!3488) i!1381) k!2747))))

(declare-fun b!1056124 () Bool)

(declare-fun e!600358 () Bool)

(declare-fun e!600353 () Bool)

(assert (=> b!1056124 (= e!600358 e!600353)))

(declare-fun res!704905 () Bool)

(assert (=> b!1056124 (=> res!704905 e!600353)))

(assert (=> b!1056124 (= res!704905 (or (bvsgt lt!466034 i!1381) (bvsle i!1381 lt!466034)))))

(declare-fun b!1056125 () Bool)

(declare-fun res!704903 () Bool)

(assert (=> b!1056125 (=> (not res!704903) (not e!600355))))

(declare-datatypes ((List!22341 0))(
  ( (Nil!22338) (Cons!22337 (h!23546 (_ BitVec 64)) (t!31648 List!22341)) )
))
(declare-fun arrayNoDuplicates!0 (array!66606 (_ BitVec 32) List!22341) Bool)

(assert (=> b!1056125 (= res!704903 (arrayNoDuplicates!0 a!3488 #b00000000000000000000000000000000 Nil!22338))))

(declare-fun b!1056126 () Bool)

(assert (=> b!1056126 (= e!600356 (not true))))

(assert (=> b!1056126 e!600358))

(declare-fun res!704899 () Bool)

(assert (=> b!1056126 (=> (not res!704899) (not e!600358))))

(assert (=> b!1056126 (= res!704899 (= (select (store (arr!32029 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) lt!466034) k!2747))))

(declare-fun b!1056127 () Bool)

(assert (=> b!1056127 (= e!600355 e!600357)))

(declare-fun res!704906 () Bool)

(assert (=> b!1056127 (=> (not res!704906) (not e!600357))))

(declare-fun arrayContainsKey!0 (array!66606 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1056127 (= res!704906 (arrayContainsKey!0 lt!466035 k!2747 #b00000000000000000000000000000000))))

(assert (=> b!1056127 (= lt!466035 (array!66607 (store (arr!32029 a!3488) i!1381 #b1000000000000000000000000000000000000000000000000000000000000000) (size!32565 a!3488)))))

(declare-fun b!1056128 () Bool)

(assert (=> b!1056128 (= e!600353 (arrayContainsKey!0 a!3488 k!2747 i!1381))))

(assert (= (and start!93108 res!704900) b!1056125))

(assert (= (and b!1056125 res!704903) b!1056121))

(assert (= (and b!1056121 res!704902) b!1056123))

(assert (= (and b!1056123 res!704901) b!1056127))

(assert (= (and b!1056127 res!704906) b!1056122))

(assert (= (and b!1056122 res!704904) b!1056126))

(assert (= (and b!1056126 res!704899) b!1056124))

(assert (= (and b!1056124 (not res!704905)) b!1056128))

(declare-fun m!976061 () Bool)

(assert (=> start!93108 m!976061))

(declare-fun m!976063 () Bool)

(assert (=> b!1056126 m!976063))

(declare-fun m!976065 () Bool)

(assert (=> b!1056126 m!976065))

(declare-fun m!976067 () Bool)

(assert (=> b!1056121 m!976067))

(declare-fun m!976069 () Bool)

(assert (=> b!1056127 m!976069))

(assert (=> b!1056127 m!976063))

(declare-fun m!976071 () Bool)

(assert (=> b!1056123 m!976071))

(declare-fun m!976073 () Bool)

(assert (=> b!1056128 m!976073))

(declare-fun m!976075 () Bool)

(assert (=> b!1056125 m!976075))

(declare-fun m!976077 () Bool)

(assert (=> b!1056122 m!976077))

(push 1)

