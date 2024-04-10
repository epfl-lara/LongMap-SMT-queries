; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!130568 () Bool)

(assert start!130568)

(declare-fun b!1532398 () Bool)

(declare-fun res!1049538 () Bool)

(declare-fun e!853803 () Bool)

(assert (=> b!1532398 (=> (not res!1049538) (not e!853803))))

(declare-datatypes ((array!101747 0))(
  ( (array!101748 (arr!49094 (Array (_ BitVec 32) (_ BitVec 64))) (size!49644 (_ BitVec 32))) )
))
(declare-fun a!2792 () array!101747)

(declare-fun mask!2480 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101747 (_ BitVec 32)) Bool)

(assert (=> b!1532398 (= res!1049538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2792 mask!2480))))

(declare-fun res!1049541 () Bool)

(assert (=> start!130568 (=> (not res!1049541) (not e!853803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130568 (= res!1049541 (validMask!0 mask!2480))))

(assert (=> start!130568 e!853803))

(assert (=> start!130568 true))

(declare-fun array_inv!38122 (array!101747) Bool)

(assert (=> start!130568 (array_inv!38122 a!2792)))

(declare-fun b!1532399 () Bool)

(declare-fun res!1049542 () Bool)

(assert (=> b!1532399 (=> (not res!1049542) (not e!853803))))

(declare-fun j!64 () (_ BitVec 32))

(declare-fun i!951 () (_ BitVec 32))

(assert (=> b!1532399 (= res!1049542 (and (= (size!49644 a!2792) (bvadd #b00000000000000000000000000000001 mask!2480)) (bvsge i!951 #b00000000000000000000000000000000) (bvslt i!951 (size!49644 a!2792)) (bvsge j!64 #b00000000000000000000000000000000) (bvslt j!64 (size!49644 a!2792)) (not (= i!951 j!64))))))

(declare-fun b!1532400 () Bool)

(declare-fun res!1049539 () Bool)

(assert (=> b!1532400 (=> (not res!1049539) (not e!853803))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532400 (= res!1049539 (validKeyInArray!0 (select (arr!49094 a!2792) j!64)))))

(declare-fun b!1532401 () Bool)

(assert (=> b!1532401 (= e!853803 (and (bvsle #b00000000000000000000000000000000 (size!49644 a!2792)) (bvsge (size!49644 a!2792) #b01111111111111111111111111111111)))))

(declare-fun b!1532402 () Bool)

(declare-fun res!1049540 () Bool)

(assert (=> b!1532402 (=> (not res!1049540) (not e!853803))))

(assert (=> b!1532402 (= res!1049540 (validKeyInArray!0 (select (arr!49094 a!2792) i!951)))))

(assert (= (and start!130568 res!1049541) b!1532399))

(assert (= (and b!1532399 res!1049542) b!1532402))

(assert (= (and b!1532402 res!1049540) b!1532400))

(assert (= (and b!1532400 res!1049539) b!1532398))

(assert (= (and b!1532398 res!1049538) b!1532401))

(declare-fun m!1415127 () Bool)

(assert (=> b!1532398 m!1415127))

(declare-fun m!1415129 () Bool)

(assert (=> start!130568 m!1415129))

(declare-fun m!1415131 () Bool)

(assert (=> start!130568 m!1415131))

(declare-fun m!1415133 () Bool)

(assert (=> b!1532400 m!1415133))

(assert (=> b!1532400 m!1415133))

(declare-fun m!1415135 () Bool)

(assert (=> b!1532400 m!1415135))

(declare-fun m!1415137 () Bool)

(assert (=> b!1532402 m!1415137))

(assert (=> b!1532402 m!1415137))

(declare-fun m!1415139 () Bool)

(assert (=> b!1532402 m!1415139))

(push 1)

(assert (not b!1532402))

(assert (not start!130568))

(assert (not b!1532398))

(assert (not b!1532400))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!160045 () Bool)

(assert (=> d!160045 (= (validKeyInArray!0 (select (arr!49094 a!2792) i!951)) (and (not (= (select (arr!49094 a!2792) i!951) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!49094 a!2792) i!951) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1532402 d!160045))

(declare-fun d!160049 () Bool)

(assert (=> d!160049 (= (validMask!0 mask!2480) (and (or (= mask!2480 #b00000000000000000000000000000111) (= mask!2480 #b00000000000000000000000000001111) (= mask!2480 #b00000000000000000000000000011111) (= mask!2480 #b00000000000000000000000000111111) (= mask!2480 #b00000000000000000000000001111111) (= mask!2480 #b00000000000000000000000011111111) (= mask!2480 #b00000000000000000000000111111111) (= mask!2480 #b00000000000000000000001111111111) (= mask!2480 #b00000000000000000000011111111111) (= mask!2480 #b00000000000000000000111111111111) (= mask!2480 #b00000000000000000001111111111111) (= mask!2480 #b00000000000000000011111111111111) (= mask!2480 #b00000000000000000111111111111111) (= mask!2480 #b00000000000000001111111111111111) (= mask!2480 #b00000000000000011111111111111111) (= mask!2480 #b00000000000000111111111111111111) (= mask!2480 #b00000000000001111111111111111111) (= mask!2480 #b00000000000011111111111111111111) (= mask!2480 #b00000000000111111111111111111111) (= mask!2480 #b00000000001111111111111111111111) (= mask!2480 #b00000000011111111111111111111111) (= mask!2480 #b00000000111111111111111111111111) (= mask!2480 #b00000001111111111111111111111111) (= mask!2480 #b00000011111111111111111111111111) (= mask!2480 #b00000111111111111111111111111111) (= mask!2480 #b00001111111111111111111111111111) (= mask!2480 #b00011111111111111111111111111111) (= mask!2480 #b00111111111111111111111111111111)) (bvsle mask!2480 #b00111111111111111111111111111111)))))

(assert (=> start!130568 d!160049))

(declare-fun d!160059 () Bool)

(assert (=> d!160059 (= (array_inv!38122 a!2792) (bvsge (size!49644 a!2792) #b00000000000000000000000000000000))))

(assert (=> start!130568 d!160059))

(declare-fun b!1532465 () Bool)

(declare-fun e!853841 () Bool)

(declare-fun e!853843 () Bool)

(assert (=> b!1532465 (= e!853841 e!853843)))

(declare-fun c!140996 () Bool)

(assert (=> b!1532465 (= c!140996 (validKeyInArray!0 (select (arr!49094 a!2792) #b00000000000000000000000000000000)))))

(declare-fun b!1532466 () Bool)

(declare-fun e!853842 () Bool)

(declare-fun call!68562 () Bool)

(assert (=> b!1532466 (= e!853842 call!68562)))

(declare-fun b!1532467 () Bool)

(assert (=> b!1532467 (= e!853843 e!853842)))

(declare-fun lt!663662 () (_ BitVec 64))

(assert (=> b!1532467 (= lt!663662 (select (arr!49094 a!2792) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51294 0))(
  ( (Unit!51295) )
))
