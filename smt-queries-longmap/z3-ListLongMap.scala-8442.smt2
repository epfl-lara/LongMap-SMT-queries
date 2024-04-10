; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!102788 () Bool)

(assert start!102788)

(declare-fun b!1235283 () Bool)

(declare-fun res!823456 () Bool)

(declare-fun e!700391 () Bool)

(assert (=> b!1235283 (=> (not res!823456) (not e!700391))))

(declare-datatypes ((List!27197 0))(
  ( (Nil!27194) (Cons!27193 (h!28402 (_ BitVec 64)) (t!40660 List!27197)) )
))
(declare-fun acc!846 () List!27197)

(declare-fun contains!7259 (List!27197 (_ BitVec 64)) Bool)

(assert (=> b!1235283 (= res!823456 (not (contains!7259 acc!846 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235284 () Bool)

(declare-fun res!823450 () Bool)

(declare-fun e!700392 () Bool)

(assert (=> b!1235284 (=> res!823450 e!700392)))

(declare-fun lt!560207 () List!27197)

(assert (=> b!1235284 (= res!823450 (contains!7259 lt!560207 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1235285 () Bool)

(declare-fun res!823449 () Bool)

(assert (=> b!1235285 (=> (not res!823449) (not e!700391))))

(declare-fun from!3213 () (_ BitVec 32))

(declare-datatypes ((array!79633 0))(
  ( (array!79634 (arr!38424 (Array (_ BitVec 32) (_ BitVec 64))) (size!38960 (_ BitVec 32))) )
))
(declare-fun a!3835 () array!79633)

(assert (=> b!1235285 (= res!823449 (not (= from!3213 (bvsub (size!38960 a!3835) #b00000000000000000000000000000001))))))

(declare-fun res!823454 () Bool)

(assert (=> start!102788 (=> (not res!823454) (not e!700391))))

(assert (=> start!102788 (= res!823454 (and (bvslt (size!38960 a!3835) #b01111111111111111111111111111111) (bvsge from!3213 #b00000000000000000000000000000000) (bvslt from!3213 (size!38960 a!3835))))))

(assert (=> start!102788 e!700391))

(declare-fun array_inv!29272 (array!79633) Bool)

(assert (=> start!102788 (array_inv!29272 a!3835)))

(assert (=> start!102788 true))

(declare-fun b!1235286 () Bool)

(declare-fun res!823452 () Bool)

(assert (=> b!1235286 (=> (not res!823452) (not e!700391))))

(declare-fun k0!2925 () (_ BitVec 64))

(assert (=> b!1235286 (= res!823452 (contains!7259 acc!846 k0!2925))))

(declare-fun b!1235287 () Bool)

(assert (=> b!1235287 (= e!700392 true)))

(declare-fun lt!560206 () Bool)

(declare-fun arrayNoDuplicates!0 (array!79633 (_ BitVec 32) List!27197) Bool)

(assert (=> b!1235287 (= lt!560206 (arrayNoDuplicates!0 a!3835 (bvadd #b00000000000000000000000000000001 from!3213) lt!560207))))

(declare-datatypes ((Unit!40918 0))(
  ( (Unit!40919) )
))
(declare-fun lt!560208 () Unit!40918)

(declare-fun noDuplicateSubseq!78 (List!27197 List!27197) Unit!40918)

(assert (=> b!1235287 (= lt!560208 (noDuplicateSubseq!78 acc!846 lt!560207))))

(declare-fun b!1235288 () Bool)

(declare-fun res!823451 () Bool)

(assert (=> b!1235288 (=> (not res!823451) (not e!700391))))

(assert (=> b!1235288 (= res!823451 (not (contains!7259 acc!846 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1235289 () Bool)

(declare-fun res!823447 () Bool)

(assert (=> b!1235289 (=> (not res!823447) (not e!700391))))

(declare-fun noDuplicate!1856 (List!27197) Bool)

(assert (=> b!1235289 (= res!823447 (noDuplicate!1856 acc!846))))

(declare-fun b!1235290 () Bool)

(assert (=> b!1235290 (= e!700391 (not e!700392))))

(declare-fun res!823445 () Bool)

(assert (=> b!1235290 (=> res!823445 e!700392)))

(assert (=> b!1235290 (= res!823445 (bvslt (bvadd #b00000000000000000000000000000001 from!3213) #b00000000000000000000000000000000))))

(declare-fun subseq!531 (List!27197 List!27197) Bool)

(assert (=> b!1235290 (subseq!531 acc!846 lt!560207)))

(declare-fun lt!560209 () Unit!40918)

(declare-fun subseqTail!24 (List!27197 List!27197) Unit!40918)

(assert (=> b!1235290 (= lt!560209 (subseqTail!24 lt!560207 lt!560207))))

(assert (=> b!1235290 (subseq!531 lt!560207 lt!560207)))

(declare-fun lt!560210 () Unit!40918)

(declare-fun lemmaListSubSeqRefl!0 (List!27197) Unit!40918)

(assert (=> b!1235290 (= lt!560210 (lemmaListSubSeqRefl!0 lt!560207))))

(assert (=> b!1235290 (= lt!560207 (Cons!27193 (select (arr!38424 a!3835) from!3213) acc!846))))

(declare-fun b!1235291 () Bool)

(declare-fun res!823448 () Bool)

(assert (=> b!1235291 (=> (not res!823448) (not e!700391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1235291 (= res!823448 (validKeyInArray!0 (select (arr!38424 a!3835) from!3213)))))

(declare-fun b!1235292 () Bool)

(declare-fun res!823455 () Bool)

(assert (=> b!1235292 (=> res!823455 e!700392)))

(assert (=> b!1235292 (= res!823455 (not (noDuplicate!1856 lt!560207)))))

(declare-fun b!1235293 () Bool)

(declare-fun res!823446 () Bool)

(assert (=> b!1235293 (=> (not res!823446) (not e!700391))))

(assert (=> b!1235293 (= res!823446 (arrayNoDuplicates!0 a!3835 from!3213 acc!846))))

(declare-fun b!1235294 () Bool)

(declare-fun res!823453 () Bool)

(assert (=> b!1235294 (=> res!823453 e!700392)))

(assert (=> b!1235294 (= res!823453 (contains!7259 lt!560207 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!102788 res!823454) b!1235289))

(assert (= (and b!1235289 res!823447) b!1235288))

(assert (= (and b!1235288 res!823451) b!1235283))

(assert (= (and b!1235283 res!823456) b!1235293))

(assert (= (and b!1235293 res!823446) b!1235286))

(assert (= (and b!1235286 res!823452) b!1235285))

(assert (= (and b!1235285 res!823449) b!1235291))

(assert (= (and b!1235291 res!823448) b!1235290))

(assert (= (and b!1235290 (not res!823445)) b!1235292))

(assert (= (and b!1235292 (not res!823455)) b!1235284))

(assert (= (and b!1235284 (not res!823450)) b!1235294))

(assert (= (and b!1235294 (not res!823453)) b!1235287))

(declare-fun m!1139171 () Bool)

(assert (=> b!1235290 m!1139171))

(declare-fun m!1139173 () Bool)

(assert (=> b!1235290 m!1139173))

(declare-fun m!1139175 () Bool)

(assert (=> b!1235290 m!1139175))

(declare-fun m!1139177 () Bool)

(assert (=> b!1235290 m!1139177))

(declare-fun m!1139179 () Bool)

(assert (=> b!1235290 m!1139179))

(declare-fun m!1139181 () Bool)

(assert (=> b!1235289 m!1139181))

(declare-fun m!1139183 () Bool)

(assert (=> b!1235292 m!1139183))

(declare-fun m!1139185 () Bool)

(assert (=> b!1235294 m!1139185))

(assert (=> b!1235291 m!1139177))

(assert (=> b!1235291 m!1139177))

(declare-fun m!1139187 () Bool)

(assert (=> b!1235291 m!1139187))

(declare-fun m!1139189 () Bool)

(assert (=> b!1235283 m!1139189))

(declare-fun m!1139191 () Bool)

(assert (=> start!102788 m!1139191))

(declare-fun m!1139193 () Bool)

(assert (=> b!1235284 m!1139193))

(declare-fun m!1139195 () Bool)

(assert (=> b!1235286 m!1139195))

(declare-fun m!1139197 () Bool)

(assert (=> b!1235293 m!1139197))

(declare-fun m!1139199 () Bool)

(assert (=> b!1235288 m!1139199))

(declare-fun m!1139201 () Bool)

(assert (=> b!1235287 m!1139201))

(declare-fun m!1139203 () Bool)

(assert (=> b!1235287 m!1139203))

(check-sat (not b!1235289) (not b!1235286) (not b!1235288) (not b!1235291) (not b!1235293) (not b!1235294) (not b!1235290) (not b!1235284) (not b!1235292) (not b!1235283) (not b!1235287) (not start!102788))
