; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!31574 () Bool)

(assert start!31574)

(declare-fun b!315772 () Bool)

(declare-fun res!171021 () Bool)

(declare-fun e!196518 () Bool)

(assert (=> b!315772 (=> (not res!171021) (not e!196518))))

(declare-datatypes ((array!16098 0))(
  ( (array!16099 (arr!7619 (Array (_ BitVec 32) (_ BitVec 64))) (size!7971 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!16098)

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16098 (_ BitVec 32)) Bool)

(assert (=> b!315772 (= res!171021 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(declare-fun b!315773 () Bool)

(declare-fun res!171027 () Bool)

(declare-fun e!196520 () Bool)

(assert (=> b!315773 (=> (not res!171027) (not e!196520))))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(assert (=> b!315773 (= res!171027 (and (= (select (arr!7619 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7971 a!3293))))))

(declare-fun b!315774 () Bool)

(assert (=> b!315774 (= e!196518 e!196520)))

(declare-fun res!171024 () Bool)

(assert (=> b!315774 (=> (not res!171024) (not e!196520))))

(declare-fun k!2441 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2759 0))(
  ( (MissingZero!2759 (index!13212 (_ BitVec 32))) (Found!2759 (index!13213 (_ BitVec 32))) (Intermediate!2759 (undefined!3571 Bool) (index!13214 (_ BitVec 32)) (x!31461 (_ BitVec 32))) (Undefined!2759) (MissingVacant!2759 (index!13215 (_ BitVec 32))) )
))
(declare-fun lt!154375 () SeekEntryResult!2759)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!16098 (_ BitVec 32)) SeekEntryResult!2759)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315774 (= res!171024 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2441 mask!3709) k!2441 a!3293 mask!3709) lt!154375))))

(assert (=> b!315774 (= lt!154375 (Intermediate!2759 false resIndex!52 resX!52))))

(declare-fun b!315775 () Bool)

(assert (=> b!315775 false))

(declare-datatypes ((Unit!9722 0))(
  ( (Unit!9723) )
))
(declare-fun e!196519 () Unit!9722)

(declare-fun Unit!9724 () Unit!9722)

(assert (=> b!315775 (= e!196519 Unit!9724)))

(declare-fun b!315776 () Bool)

(assert (=> b!315776 false))

(declare-fun lt!154377 () SeekEntryResult!2759)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!315776 (= lt!154377 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) (nextIndex!0 index!1781 x!1427 mask!3709) k!2441 a!3293 mask!3709))))

(declare-fun Unit!9725 () Unit!9722)

(assert (=> b!315776 (= e!196519 Unit!9725)))

(declare-fun b!315777 () Bool)

(declare-fun res!171018 () Bool)

(assert (=> b!315777 (=> (not res!171018) (not e!196518))))

(declare-fun arrayContainsKey!0 (array!16098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!315777 (= res!171018 (not (arrayContainsKey!0 a!3293 k!2441 #b00000000000000000000000000000000)))))

(declare-fun res!171025 () Bool)

(assert (=> start!31574 (=> (not res!171025) (not e!196518))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31574 (= res!171025 (validMask!0 mask!3709))))

(assert (=> start!31574 e!196518))

(declare-fun array_inv!5582 (array!16098) Bool)

(assert (=> start!31574 (array_inv!5582 a!3293)))

(assert (=> start!31574 true))

(declare-fun b!315778 () Bool)

(declare-fun e!196521 () Unit!9722)

(assert (=> b!315778 (= e!196521 e!196519)))

(declare-fun c!49994 () Bool)

(assert (=> b!315778 (= c!49994 (or (= (select (arr!7619 a!3293) index!1781) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!7619 a!3293) index!1781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!315779 () Bool)

(declare-fun res!171020 () Bool)

(assert (=> b!315779 (=> (not res!171020) (not e!196520))))

(assert (=> b!315779 (= res!171020 (= (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k!2441 a!3293 mask!3709) lt!154375))))

(declare-fun b!315780 () Bool)

(declare-fun res!171022 () Bool)

(assert (=> b!315780 (=> (not res!171022) (not e!196518))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!315780 (= res!171022 (validKeyInArray!0 k!2441))))

(declare-fun b!315781 () Bool)

(declare-fun res!171026 () Bool)

(assert (=> b!315781 (=> (not res!171026) (not e!196520))))

(assert (=> b!315781 (= res!171026 (and (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7619 a!3293) index!1781) k!2441)) (= x!1427 resX!52)))))

(declare-fun b!315782 () Bool)

(declare-fun Unit!9726 () Unit!9722)

(assert (=> b!315782 (= e!196521 Unit!9726)))

(declare-fun b!315783 () Bool)

(declare-fun res!171023 () Bool)

(assert (=> b!315783 (=> (not res!171023) (not e!196518))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!16098 (_ BitVec 32)) SeekEntryResult!2759)

(assert (=> b!315783 (= res!171023 (= (seekEntryOrOpen!0 k!2441 a!3293 mask!3709) (MissingZero!2759 i!1240)))))

(declare-fun b!315784 () Bool)

(assert (=> b!315784 (= e!196520 (not true))))

(assert (=> b!315784 (= index!1781 resIndex!52)))

(declare-fun lt!154376 () Unit!9722)

(assert (=> b!315784 (= lt!154376 e!196521)))

(declare-fun c!49995 () Bool)

(assert (=> b!315784 (= c!49995 (not (= resIndex!52 index!1781)))))

(declare-fun b!315785 () Bool)

(declare-fun res!171019 () Bool)

(assert (=> b!315785 (=> (not res!171019) (not e!196518))))

(assert (=> b!315785 (= res!171019 (and (= (size!7971 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7971 a!3293))))))

(assert (= (and start!31574 res!171025) b!315785))

(assert (= (and b!315785 res!171019) b!315780))

(assert (= (and b!315780 res!171022) b!315777))

(assert (= (and b!315777 res!171018) b!315783))

(assert (= (and b!315783 res!171023) b!315772))

(assert (= (and b!315772 res!171021) b!315774))

(assert (= (and b!315774 res!171024) b!315773))

(assert (= (and b!315773 res!171027) b!315779))

(assert (= (and b!315779 res!171020) b!315781))

(assert (= (and b!315781 res!171026) b!315784))

(assert (= (and b!315784 c!49995) b!315778))

(assert (= (and b!315784 (not c!49995)) b!315782))

(assert (= (and b!315778 c!49994) b!315775))

(assert (= (and b!315778 (not c!49994)) b!315776))

(declare-fun m!324911 () Bool)

(assert (=> start!31574 m!324911))

(declare-fun m!324913 () Bool)

(assert (=> start!31574 m!324913))

(declare-fun m!324915 () Bool)

(assert (=> b!315779 m!324915))

(declare-fun m!324917 () Bool)

(assert (=> b!315778 m!324917))

(assert (=> b!315781 m!324917))

(declare-fun m!324919 () Bool)

(assert (=> b!315772 m!324919))

(declare-fun m!324921 () Bool)

(assert (=> b!315780 m!324921))

(declare-fun m!324923 () Bool)

(assert (=> b!315776 m!324923))

(assert (=> b!315776 m!324923))

(declare-fun m!324925 () Bool)

(assert (=> b!315776 m!324925))

(declare-fun m!324927 () Bool)

(assert (=> b!315777 m!324927))

(declare-fun m!324929 () Bool)

(assert (=> b!315773 m!324929))

(declare-fun m!324931 () Bool)

(assert (=> b!315774 m!324931))

(assert (=> b!315774 m!324931))

(declare-fun m!324933 () Bool)

(assert (=> b!315774 m!324933))

(declare-fun m!324935 () Bool)

(assert (=> b!315783 m!324935))

(push 1)

