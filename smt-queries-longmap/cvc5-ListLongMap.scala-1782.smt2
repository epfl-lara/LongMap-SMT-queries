; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!32392 () Bool)

(assert start!32392)

(declare-fun b!323012 () Bool)

(assert (=> b!323012 false))

(declare-datatypes ((Unit!9941 0))(
  ( (Unit!9942) )
))
(declare-fun lt!156557 () Unit!9941)

(declare-fun e!199776 () Unit!9941)

(assert (=> b!323012 (= lt!156557 e!199776)))

(declare-datatypes ((array!16531 0))(
  ( (array!16532 (arr!7823 (Array (_ BitVec 32) (_ BitVec 64))) (size!8175 (_ BitVec 32))) )
))
(declare-fun a!3305 () array!16531)

(declare-fun index!1840 () (_ BitVec 32))

(declare-fun k!2497 () (_ BitVec 64))

(declare-fun mask!3777 () (_ BitVec 32))

(declare-fun x!1490 () (_ BitVec 32))

(declare-fun c!50779 () Bool)

(declare-datatypes ((SeekEntryResult!2954 0))(
  ( (MissingZero!2954 (index!13992 (_ BitVec 32))) (Found!2954 (index!13993 (_ BitVec 32))) (Intermediate!2954 (undefined!3766 Bool) (index!13994 (_ BitVec 32)) (x!32254 (_ BitVec 32))) (Undefined!2954) (MissingVacant!2954 (index!13995 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16531 (_ BitVec 32)) SeekEntryResult!2954)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323012 (= c!50779 (is-Intermediate!2954 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1490) (nextIndex!0 index!1840 x!1490 mask!3777) k!2497 a!3305 mask!3777)))))

(declare-fun e!199773 () Unit!9941)

(declare-fun Unit!9943 () Unit!9941)

(assert (=> b!323012 (= e!199773 Unit!9943)))

(declare-fun res!176711 () Bool)

(declare-fun e!199777 () Bool)

(assert (=> start!32392 (=> (not res!176711) (not e!199777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!32392 (= res!176711 (validMask!0 mask!3777))))

(assert (=> start!32392 e!199777))

(declare-fun array_inv!5786 (array!16531) Bool)

(assert (=> start!32392 (array_inv!5786 a!3305)))

(assert (=> start!32392 true))

(declare-fun b!323013 () Bool)

(declare-fun e!199774 () Bool)

(assert (=> b!323013 (= e!199774 (not true))))

(declare-fun resIndex!58 () (_ BitVec 32))

(assert (=> b!323013 (= index!1840 resIndex!58)))

(declare-fun lt!156558 () Unit!9941)

(declare-fun e!199775 () Unit!9941)

(assert (=> b!323013 (= lt!156558 e!199775)))

(declare-fun c!50781 () Bool)

(assert (=> b!323013 (= c!50781 (not (= resIndex!58 index!1840)))))

(declare-fun b!323014 () Bool)

(assert (=> b!323014 false))

(declare-fun Unit!9944 () Unit!9941)

(assert (=> b!323014 (= e!199773 Unit!9944)))

(declare-fun b!323015 () Bool)

(declare-fun res!176712 () Bool)

(assert (=> b!323015 (=> (not res!176712) (not e!199774))))

(declare-fun resX!58 () (_ BitVec 32))

(assert (=> b!323015 (= res!176712 (and (bvslt resX!58 #b01111111111111111111111111111110) (not (= (select (arr!7823 a!3305) index!1840) k!2497)) (= x!1490 resX!58)))))

(declare-fun b!323016 () Bool)

(assert (=> b!323016 (= e!199777 e!199774)))

(declare-fun res!176716 () Bool)

(assert (=> b!323016 (=> (not res!176716) (not e!199774))))

(declare-fun lt!156556 () SeekEntryResult!2954)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!323016 (= res!176716 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2497 mask!3777) k!2497 a!3305 mask!3777) lt!156556))))

(assert (=> b!323016 (= lt!156556 (Intermediate!2954 false resIndex!58 resX!58))))

(declare-fun b!323017 () Bool)

(declare-fun res!176718 () Bool)

(assert (=> b!323017 (=> (not res!176718) (not e!199774))))

(declare-fun i!1250 () (_ BitVec 32))

(assert (=> b!323017 (= res!176718 (and (= (select (arr!7823 a!3305) resIndex!58) #b1000000000000000000000000000000000000000000000000000000000000000) (= resIndex!58 i!1250) (bvsle x!1490 resX!58) (bvsge x!1490 #b00000000000000000000000000000000) (bvsge index!1840 #b00000000000000000000000000000000) (bvslt index!1840 (size!8175 a!3305))))))

(declare-fun b!323018 () Bool)

(assert (=> b!323018 (= e!199775 e!199773)))

(declare-fun c!50780 () Bool)

(assert (=> b!323018 (= c!50780 (or (= (select (arr!7823 a!3305) index!1840) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7823 a!3305) index!1840) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!323019 () Bool)

(declare-fun res!176709 () Bool)

(assert (=> b!323019 (=> (not res!176709) (not e!199777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16531 (_ BitVec 32)) Bool)

(assert (=> b!323019 (= res!176709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3305 mask!3777))))

(declare-fun b!323020 () Bool)

(declare-fun Unit!9945 () Unit!9941)

(assert (=> b!323020 (= e!199775 Unit!9945)))

(declare-fun b!323021 () Bool)

(declare-fun res!176714 () Bool)

(assert (=> b!323021 (=> (not res!176714) (not e!199777))))

(declare-fun arrayContainsKey!0 (array!16531 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!323021 (= res!176714 (not (arrayContainsKey!0 a!3305 k!2497 #b00000000000000000000000000000000)))))

(declare-fun b!323022 () Bool)

(declare-fun res!176715 () Bool)

(assert (=> b!323022 (=> (not res!176715) (not e!199777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!323022 (= res!176715 (validKeyInArray!0 k!2497))))

(declare-fun b!323023 () Bool)

(declare-fun Unit!9946 () Unit!9941)

(assert (=> b!323023 (= e!199776 Unit!9946)))

(declare-fun b!323024 () Bool)

(declare-fun res!176710 () Bool)

(assert (=> b!323024 (=> (not res!176710) (not e!199777))))

(assert (=> b!323024 (= res!176710 (and (= (size!8175 a!3305) (bvadd #b00000000000000000000000000000001 mask!3777)) (bvsge i!1250 #b00000000000000000000000000000000) (bvslt i!1250 (size!8175 a!3305))))))

(declare-fun b!323025 () Bool)

(declare-fun Unit!9947 () Unit!9941)

(assert (=> b!323025 (= e!199776 Unit!9947)))

(assert (=> b!323025 false))

(declare-fun b!323026 () Bool)

(declare-fun res!176717 () Bool)

(assert (=> b!323026 (=> (not res!176717) (not e!199777))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16531 (_ BitVec 32)) SeekEntryResult!2954)

(assert (=> b!323026 (= res!176717 (= (seekEntryOrOpen!0 k!2497 a!3305 mask!3777) (MissingVacant!2954 i!1250)))))

(declare-fun b!323027 () Bool)

(declare-fun res!176713 () Bool)

(assert (=> b!323027 (=> (not res!176713) (not e!199774))))

(assert (=> b!323027 (= res!176713 (= (seekKeyOrZeroOrLongMinValue!0 x!1490 index!1840 k!2497 a!3305 mask!3777) lt!156556))))

(assert (= (and start!32392 res!176711) b!323024))

(assert (= (and b!323024 res!176710) b!323022))

(assert (= (and b!323022 res!176715) b!323021))

(assert (= (and b!323021 res!176714) b!323026))

(assert (= (and b!323026 res!176717) b!323019))

(assert (= (and b!323019 res!176709) b!323016))

(assert (= (and b!323016 res!176716) b!323017))

(assert (= (and b!323017 res!176718) b!323027))

(assert (= (and b!323027 res!176713) b!323015))

(assert (= (and b!323015 res!176712) b!323013))

(assert (= (and b!323013 c!50781) b!323018))

(assert (= (and b!323013 (not c!50781)) b!323020))

(assert (= (and b!323018 c!50780) b!323014))

(assert (= (and b!323018 (not c!50780)) b!323012))

(assert (= (and b!323012 c!50779) b!323023))

(assert (= (and b!323012 (not c!50779)) b!323025))

(declare-fun m!330587 () Bool)

(assert (=> b!323017 m!330587))

(declare-fun m!330589 () Bool)

(assert (=> b!323015 m!330589))

(declare-fun m!330591 () Bool)

(assert (=> start!32392 m!330591))

(declare-fun m!330593 () Bool)

(assert (=> start!32392 m!330593))

(assert (=> b!323018 m!330589))

(declare-fun m!330595 () Bool)

(assert (=> b!323026 m!330595))

(declare-fun m!330597 () Bool)

(assert (=> b!323016 m!330597))

(assert (=> b!323016 m!330597))

(declare-fun m!330599 () Bool)

(assert (=> b!323016 m!330599))

(declare-fun m!330601 () Bool)

(assert (=> b!323019 m!330601))

(declare-fun m!330603 () Bool)

(assert (=> b!323021 m!330603))

(declare-fun m!330605 () Bool)

(assert (=> b!323027 m!330605))

(declare-fun m!330607 () Bool)

(assert (=> b!323012 m!330607))

(assert (=> b!323012 m!330607))

(declare-fun m!330609 () Bool)

(assert (=> b!323012 m!330609))

(declare-fun m!330611 () Bool)

(assert (=> b!323022 m!330611))

(push 1)

