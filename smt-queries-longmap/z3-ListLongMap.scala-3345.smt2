; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46050 () Bool)

(assert start!46050)

(declare-fun b!509864 () Bool)

(declare-fun res!310855 () Bool)

(declare-fun e!298058 () Bool)

(assert (=> b!509864 (=> (not res!310855) (not e!298058))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32771 0))(
  ( (array!32772 (arr!15764 (Array (_ BitVec 32) (_ BitVec 64))) (size!16129 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32771)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!509864 (= res!310855 (and (= (size!16129 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16129 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16129 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!509865 () Bool)

(declare-fun res!310857 () Bool)

(assert (=> b!509865 (=> (not res!310857) (not e!298058))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!509865 (= res!310857 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun res!310854 () Bool)

(assert (=> start!46050 (=> (not res!310854) (not e!298058))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46050 (= res!310854 (validMask!0 mask!3524))))

(assert (=> start!46050 e!298058))

(assert (=> start!46050 true))

(declare-fun array_inv!11647 (array!32771) Bool)

(assert (=> start!46050 (array_inv!11647 a!3235)))

(declare-fun b!509866 () Bool)

(declare-fun res!310856 () Bool)

(assert (=> b!509866 (=> (not res!310856) (not e!298058))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!509866 (= res!310856 (validKeyInArray!0 k0!2280))))

(declare-fun b!509867 () Bool)

(declare-fun res!310859 () Bool)

(declare-fun e!298059 () Bool)

(assert (=> b!509867 (=> (not res!310859) (not e!298059))))

(declare-datatypes ((List!9961 0))(
  ( (Nil!9958) (Cons!9957 (h!10834 (_ BitVec 64)) (t!16180 List!9961)) )
))
(declare-fun arrayNoDuplicates!0 (array!32771 (_ BitVec 32) List!9961) Bool)

(assert (=> b!509867 (= res!310859 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9958))))

(declare-fun b!509868 () Bool)

(declare-fun e!298057 () Bool)

(assert (=> b!509868 (= e!298057 true)))

(declare-datatypes ((SeekEntryResult!4228 0))(
  ( (MissingZero!4228 (index!19100 (_ BitVec 32))) (Found!4228 (index!19101 (_ BitVec 32))) (Intermediate!4228 (undefined!5040 Bool) (index!19102 (_ BitVec 32)) (x!48072 (_ BitVec 32))) (Undefined!4228) (MissingVacant!4228 (index!19103 (_ BitVec 32))) )
))
(declare-fun lt!232948 () SeekEntryResult!4228)

(declare-fun lt!232947 () (_ BitVec 64))

(declare-fun lt!232950 () array!32771)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32771 (_ BitVec 32)) SeekEntryResult!4228)

(assert (=> b!509868 (= lt!232948 (seekEntryOrOpen!0 lt!232947 lt!232950 mask!3524))))

(declare-datatypes ((Unit!15700 0))(
  ( (Unit!15701) )
))
(declare-fun lt!232949 () Unit!15700)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!32771 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!15700)

(assert (=> b!509868 (= lt!232949 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!509869 () Bool)

(declare-fun res!310858 () Bool)

(assert (=> b!509869 (=> (not res!310858) (not e!298058))))

(assert (=> b!509869 (= res!310858 (validKeyInArray!0 (select (arr!15764 a!3235) j!176)))))

(declare-fun b!509870 () Bool)

(declare-fun res!310851 () Bool)

(assert (=> b!509870 (=> (not res!310851) (not e!298059))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32771 (_ BitVec 32)) Bool)

(assert (=> b!509870 (= res!310851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!509871 () Bool)

(assert (=> b!509871 (= e!298058 e!298059)))

(declare-fun res!310853 () Bool)

(assert (=> b!509871 (=> (not res!310853) (not e!298059))))

(declare-fun lt!232946 () SeekEntryResult!4228)

(assert (=> b!509871 (= res!310853 (or (= lt!232946 (MissingZero!4228 i!1204)) (= lt!232946 (MissingVacant!4228 i!1204))))))

(assert (=> b!509871 (= lt!232946 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!509872 () Bool)

(assert (=> b!509872 (= e!298059 (not e!298057))))

(declare-fun res!310852 () Bool)

(assert (=> b!509872 (=> res!310852 e!298057)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32771 (_ BitVec 32)) SeekEntryResult!4228)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!509872 (= res!310852 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15764 a!3235) j!176) mask!3524) (select (arr!15764 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!232947 mask!3524) lt!232947 lt!232950 mask!3524))))))

(assert (=> b!509872 (= lt!232947 (select (store (arr!15764 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!509872 (= lt!232950 (array!32772 (store (arr!15764 a!3235) i!1204 k0!2280) (size!16129 a!3235)))))

(assert (=> b!509872 (= lt!232948 (Found!4228 j!176))))

(assert (=> b!509872 (= lt!232948 (seekEntryOrOpen!0 (select (arr!15764 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!509872 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!232951 () Unit!15700)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32771 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15700)

(assert (=> b!509872 (= lt!232951 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!46050 res!310854) b!509864))

(assert (= (and b!509864 res!310855) b!509869))

(assert (= (and b!509869 res!310858) b!509866))

(assert (= (and b!509866 res!310856) b!509865))

(assert (= (and b!509865 res!310857) b!509871))

(assert (= (and b!509871 res!310853) b!509870))

(assert (= (and b!509870 res!310851) b!509867))

(assert (= (and b!509867 res!310859) b!509872))

(assert (= (and b!509872 (not res!310852)) b!509868))

(declare-fun m!490501 () Bool)

(assert (=> b!509867 m!490501))

(declare-fun m!490503 () Bool)

(assert (=> b!509866 m!490503))

(declare-fun m!490505 () Bool)

(assert (=> b!509871 m!490505))

(declare-fun m!490507 () Bool)

(assert (=> b!509870 m!490507))

(declare-fun m!490509 () Bool)

(assert (=> start!46050 m!490509))

(declare-fun m!490511 () Bool)

(assert (=> start!46050 m!490511))

(declare-fun m!490513 () Bool)

(assert (=> b!509869 m!490513))

(assert (=> b!509869 m!490513))

(declare-fun m!490515 () Bool)

(assert (=> b!509869 m!490515))

(declare-fun m!490517 () Bool)

(assert (=> b!509865 m!490517))

(declare-fun m!490519 () Bool)

(assert (=> b!509872 m!490519))

(declare-fun m!490521 () Bool)

(assert (=> b!509872 m!490521))

(assert (=> b!509872 m!490519))

(declare-fun m!490523 () Bool)

(assert (=> b!509872 m!490523))

(declare-fun m!490525 () Bool)

(assert (=> b!509872 m!490525))

(declare-fun m!490527 () Bool)

(assert (=> b!509872 m!490527))

(declare-fun m!490529 () Bool)

(assert (=> b!509872 m!490529))

(assert (=> b!509872 m!490513))

(declare-fun m!490531 () Bool)

(assert (=> b!509872 m!490531))

(assert (=> b!509872 m!490513))

(assert (=> b!509872 m!490529))

(assert (=> b!509872 m!490513))

(declare-fun m!490533 () Bool)

(assert (=> b!509872 m!490533))

(assert (=> b!509872 m!490513))

(declare-fun m!490535 () Bool)

(assert (=> b!509872 m!490535))

(declare-fun m!490537 () Bool)

(assert (=> b!509868 m!490537))

(declare-fun m!490539 () Bool)

(assert (=> b!509868 m!490539))

(check-sat (not b!509870) (not start!46050) (not b!509872) (not b!509865) (not b!509869) (not b!509868) (not b!509871) (not b!509867) (not b!509866))
(check-sat)
