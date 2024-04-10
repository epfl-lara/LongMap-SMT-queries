; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130890 () Bool)

(assert start!130890)

(declare-fun b!1535183 () Bool)

(declare-fun e!854722 () Bool)

(assert (=> b!1535183 (= e!854722 false)))

(declare-datatypes ((SeekEntryResult!13342 0))(
  ( (MissingZero!13342 (index!55763 (_ BitVec 32))) (Found!13342 (index!55764 (_ BitVec 32))) (Intermediate!13342 (undefined!14154 Bool) (index!55765 (_ BitVec 32)) (x!137512 (_ BitVec 32))) (Undefined!13342) (MissingVacant!13342 (index!55766 (_ BitVec 32))) )
))
(declare-fun lt!664008 () SeekEntryResult!13342)

(declare-fun x!510 () (_ BitVec 32))

(declare-datatypes ((array!101988 0))(
  ( (array!101989 (arr!49210 (Array (_ BitVec 32) (_ BitVec 64))) (size!49760 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101988)

(declare-fun j!64 () (_ BitVec 32))

(declare-fun vacantIndex!5 () (_ BitVec 32))

(declare-fun lt!664009 () (_ BitVec 32))

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101988 (_ BitVec 32)) SeekEntryResult!13342)

(assert (=> b!1535183 (= lt!664008 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!510) lt!664009 vacantIndex!5 (select (arr!49210 a!2792) j!64) a!2792 mask!2480))))

(declare-fun b!1535184 () Bool)

(declare-fun res!1052274 () Bool)

(declare-fun e!854721 () Bool)

(assert (=> b!1535184 (=> (not res!1052274) (not e!854721))))

(declare-fun index!463 () (_ BitVec 32))

(assert (=> b!1535184 (= res!1052274 (= (seekKeyOrZeroReturnVacant!0 x!510 index!463 vacantIndex!5 (select (arr!49210 a!2792) j!64) a!2792 mask!2480) (Found!13342 j!64)))))

(declare-fun b!1535185 () Bool)

(declare-fun res!1052272 () Bool)

(assert (=> b!1535185 (=> (not res!1052272) (not e!854721))))

(assert (=> b!1535185 (= res!1052272 (and (bvsge x!510 #b00000000000000000000000000000000) (bvsle x!510 #b01111111111111111111111111111110) (bvsge index!463 #b00000000000000000000000000000000) (bvslt index!463 (size!49760 a!2792)) (bvsge vacantIndex!5 #b00000000000000000000000000000000) (bvslt vacantIndex!5 (size!49760 a!2792)) (= (select (arr!49210 a!2792) vacantIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!1052271 () Bool)

(assert (=> start!130890 (=> (not res!1052271) (not e!854721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130890 (= res!1052271 (validMask!0 mask!2480))))

(assert (=> start!130890 e!854721))

(assert (=> start!130890 true))

(declare-fun array_inv!38238 (array!101988) Bool)

(assert (=> start!130890 (array_inv!38238 a!2792)))

(declare-fun b!1535186 () Bool)

(declare-fun res!1052276 () Bool)

(assert (=> b!1535186 (=> (not res!1052276) (not e!854721))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1535186 (= res!1052276 (validKeyInArray!0 (select (arr!49210 a!2792) j!64)))))

(declare-fun b!1535187 () Bool)

(declare-fun res!1052273 () Bool)

(assert (=> b!1535187 (=> (not res!1052273) (not e!854721))))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1535187 (= res!1052273 (validKeyInArray!0 (select (arr!49210 a!2792) i!951)))))

(declare-fun b!1535188 () Bool)

(declare-fun res!1052278 () Bool)

(assert (=> b!1535188 (=> (not res!1052278) (not e!854721))))

(assert (=> b!1535188 (= res!1052278 (not (= (select (arr!49210 a!2792) index!463) (select (arr!49210 a!2792) j!64))))))

(declare-fun b!1535189 () Bool)

(declare-fun res!1052275 () Bool)

(assert (=> b!1535189 (=> (not res!1052275) (not e!854721))))

(assert (=> b!1535189 (= res!1052275 (and (= (size!49760 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49760 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49760 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1535190 () Bool)

(declare-fun res!1052277 () Bool)

(assert (=> b!1535190 (=> (not res!1052277) (not e!854721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101988 (_ BitVec 32)) Bool)

(assert (=> b!1535190 (= res!1052277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun b!1535191 () Bool)

(declare-fun res!1052269 () Bool)

(assert (=> b!1535191 (=> (not res!1052269) (not e!854721))))

(declare-datatypes ((List!35684 0))(
  ( (Nil!35681) (Cons!35680 (h!37125 (_ BitVec 64)) (t!50378 List!35684)) )
))
(declare-fun arrayNoDuplicates!0 (array!101988 (_ BitVec 32) List!35684) Bool)

(assert (=> b!1535191 (= res!1052269 (arrayNoDuplicates!0 a!2792 #b00000000000000000000000000000000 Nil!35681))))

(declare-fun b!1535192 () Bool)

(assert (=> b!1535192 (= e!854721 e!854722)))

(declare-fun res!1052270 () Bool)

(assert (=> b!1535192 (=> (not res!1052270) (not e!854722))))

(assert (=> b!1535192 (= res!1052270 (and (bvsge (bvadd #b00000000000000000000000000000001 x!510) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!510) #b01111111111111111111111111111110) (bvsge lt!664009 #b00000000000000000000000000000000) (bvslt lt!664009 (size!49760 a!2792))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1535192 (= lt!664009 (nextIndex!0 index!463 x!510 mask!2480))))

(assert (= (and start!130890 res!1052271) b!1535189))

(assert (= (and b!1535189 res!1052275) b!1535187))

(assert (= (and b!1535187 res!1052273) b!1535186))

(assert (= (and b!1535186 res!1052276) b!1535190))

(assert (= (and b!1535190 res!1052277) b!1535191))

(assert (= (and b!1535191 res!1052269) b!1535185))

(assert (= (and b!1535185 res!1052272) b!1535184))

(assert (= (and b!1535184 res!1052274) b!1535188))

(assert (= (and b!1535188 res!1052278) b!1535192))

(assert (= (and b!1535192 res!1052270) b!1535183))

(declare-fun m!1417735 () Bool)

(assert (=> b!1535184 m!1417735))

(assert (=> b!1535184 m!1417735))

(declare-fun m!1417737 () Bool)

(assert (=> b!1535184 m!1417737))

(declare-fun m!1417739 () Bool)

(assert (=> b!1535185 m!1417739))

(declare-fun m!1417741 () Bool)

(assert (=> b!1535190 m!1417741))

(declare-fun m!1417743 () Bool)

(assert (=> b!1535192 m!1417743))

(declare-fun m!1417745 () Bool)

(assert (=> b!1535187 m!1417745))

(assert (=> b!1535187 m!1417745))

(declare-fun m!1417747 () Bool)

(assert (=> b!1535187 m!1417747))

(assert (=> b!1535186 m!1417735))

(assert (=> b!1535186 m!1417735))

(declare-fun m!1417749 () Bool)

(assert (=> b!1535186 m!1417749))

(declare-fun m!1417751 () Bool)

(assert (=> b!1535191 m!1417751))

(declare-fun m!1417753 () Bool)

(assert (=> b!1535188 m!1417753))

(assert (=> b!1535188 m!1417735))

(assert (=> b!1535183 m!1417735))

(assert (=> b!1535183 m!1417735))

(declare-fun m!1417755 () Bool)

(assert (=> b!1535183 m!1417755))

(declare-fun m!1417757 () Bool)

(assert (=> start!130890 m!1417757))

(declare-fun m!1417759 () Bool)

(assert (=> start!130890 m!1417759))

(push 1)

(assert (not b!1535191))

(assert (not b!1535190))

(assert (not b!1535184))

(assert (not start!130890))

(assert (not b!1535192))

(assert (not b!1535186))

(assert (not b!1535187))

(assert (not b!1535183))

(check-sat)

