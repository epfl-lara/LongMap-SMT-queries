; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46746 () Bool)

(assert start!46746)

(declare-fun b!516172 () Bool)

(declare-fun res!315746 () Bool)

(declare-fun e!301283 () Bool)

(assert (=> b!516172 (=> (not res!315746) (not e!301283))))

(declare-datatypes ((array!33058 0))(
  ( (array!33059 (arr!15897 (Array (_ BitVec 32) (_ BitVec 64))) (size!16261 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33058)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516172 (= res!315746 (validKeyInArray!0 (select (arr!15897 a!3235) j!176)))))

(declare-fun b!516173 () Bool)

(declare-fun res!315738 () Bool)

(assert (=> b!516173 (=> (not res!315738) (not e!301283))))

(declare-fun k!2280 () (_ BitVec 64))

(assert (=> b!516173 (= res!315738 (validKeyInArray!0 k!2280))))

(declare-fun b!516174 () Bool)

(declare-fun res!315741 () Bool)

(declare-fun e!301281 () Bool)

(assert (=> b!516174 (=> (not res!315741) (not e!301281))))

(declare-datatypes ((List!10055 0))(
  ( (Nil!10052) (Cons!10051 (h!10949 (_ BitVec 64)) (t!16283 List!10055)) )
))
(declare-fun arrayNoDuplicates!0 (array!33058 (_ BitVec 32) List!10055) Bool)

(assert (=> b!516174 (= res!315741 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10052))))

(declare-fun b!516175 () Bool)

(declare-fun e!301280 () Bool)

(assert (=> b!516175 (= e!301281 (not e!301280))))

(declare-fun res!315740 () Bool)

(assert (=> b!516175 (=> res!315740 e!301280)))

(declare-fun lt!236296 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4364 0))(
  ( (MissingZero!4364 (index!19644 (_ BitVec 32))) (Found!4364 (index!19645 (_ BitVec 32))) (Intermediate!4364 (undefined!5176 Bool) (index!19646 (_ BitVec 32)) (x!48607 (_ BitVec 32))) (Undefined!4364) (MissingVacant!4364 (index!19647 (_ BitVec 32))) )
))
(declare-fun lt!236299 () SeekEntryResult!4364)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33058 (_ BitVec 32)) SeekEntryResult!4364)

(assert (=> b!516175 (= res!315740 (= lt!236299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236296 (select (store (arr!15897 a!3235) i!1204 k!2280) j!176) (array!33059 (store (arr!15897 a!3235) i!1204 k!2280) (size!16261 a!3235)) mask!3524)))))

(declare-fun lt!236298 () (_ BitVec 32))

(assert (=> b!516175 (= lt!236299 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236298 (select (arr!15897 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516175 (= lt!236296 (toIndex!0 (select (store (arr!15897 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516175 (= lt!236298 (toIndex!0 (select (arr!15897 a!3235) j!176) mask!3524))))

(declare-fun e!301282 () Bool)

(assert (=> b!516175 e!301282))

(declare-fun res!315737 () Bool)

(assert (=> b!516175 (=> (not res!315737) (not e!301282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33058 (_ BitVec 32)) Bool)

(assert (=> b!516175 (= res!315737 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15986 0))(
  ( (Unit!15987) )
))
(declare-fun lt!236295 () Unit!15986)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33058 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15986)

(assert (=> b!516175 (= lt!236295 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516176 () Bool)

(declare-fun res!315743 () Bool)

(assert (=> b!516176 (=> (not res!315743) (not e!301281))))

(assert (=> b!516176 (= res!315743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516177 () Bool)

(assert (=> b!516177 (= e!301280 true)))

(assert (=> b!516177 (and (bvslt (x!48607 lt!236299) #b01111111111111111111111111111110) (or (= (select (arr!15897 a!3235) (index!19646 lt!236299)) (select (arr!15897 a!3235) j!176)) (= (select (arr!15897 a!3235) (index!19646 lt!236299)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15897 a!3235) (index!19646 lt!236299)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!516178 () Bool)

(declare-fun res!315736 () Bool)

(assert (=> b!516178 (=> (not res!315736) (not e!301283))))

(assert (=> b!516178 (= res!315736 (and (= (size!16261 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16261 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16261 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!315744 () Bool)

(assert (=> start!46746 (=> (not res!315744) (not e!301283))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46746 (= res!315744 (validMask!0 mask!3524))))

(assert (=> start!46746 e!301283))

(assert (=> start!46746 true))

(declare-fun array_inv!11693 (array!33058) Bool)

(assert (=> start!46746 (array_inv!11693 a!3235)))

(declare-fun b!516179 () Bool)

(declare-fun res!315742 () Bool)

(assert (=> b!516179 (=> res!315742 e!301280)))

(assert (=> b!516179 (= res!315742 (or (undefined!5176 lt!236299) (not (is-Intermediate!4364 lt!236299))))))

(declare-fun b!516180 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33058 (_ BitVec 32)) SeekEntryResult!4364)

(assert (=> b!516180 (= e!301282 (= (seekEntryOrOpen!0 (select (arr!15897 a!3235) j!176) a!3235 mask!3524) (Found!4364 j!176)))))

(declare-fun b!516181 () Bool)

(declare-fun res!315739 () Bool)

(assert (=> b!516181 (=> (not res!315739) (not e!301283))))

(declare-fun arrayContainsKey!0 (array!33058 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516181 (= res!315739 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516182 () Bool)

(assert (=> b!516182 (= e!301283 e!301281)))

(declare-fun res!315745 () Bool)

(assert (=> b!516182 (=> (not res!315745) (not e!301281))))

(declare-fun lt!236297 () SeekEntryResult!4364)

(assert (=> b!516182 (= res!315745 (or (= lt!236297 (MissingZero!4364 i!1204)) (= lt!236297 (MissingVacant!4364 i!1204))))))

(assert (=> b!516182 (= lt!236297 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(assert (= (and start!46746 res!315744) b!516178))

(assert (= (and b!516178 res!315736) b!516172))

(assert (= (and b!516172 res!315746) b!516173))

(assert (= (and b!516173 res!315738) b!516181))

(assert (= (and b!516181 res!315739) b!516182))

(assert (= (and b!516182 res!315745) b!516176))

(assert (= (and b!516176 res!315743) b!516174))

(assert (= (and b!516174 res!315741) b!516175))

(assert (= (and b!516175 res!315737) b!516180))

(assert (= (and b!516175 (not res!315740)) b!516179))

(assert (= (and b!516179 (not res!315742)) b!516177))

(declare-fun m!497619 () Bool)

(assert (=> b!516172 m!497619))

(assert (=> b!516172 m!497619))

(declare-fun m!497621 () Bool)

(assert (=> b!516172 m!497621))

(declare-fun m!497623 () Bool)

(assert (=> b!516173 m!497623))

(declare-fun m!497625 () Bool)

(assert (=> b!516181 m!497625))

(declare-fun m!497627 () Bool)

(assert (=> b!516176 m!497627))

(declare-fun m!497629 () Bool)

(assert (=> start!46746 m!497629))

(declare-fun m!497631 () Bool)

(assert (=> start!46746 m!497631))

(declare-fun m!497633 () Bool)

(assert (=> b!516182 m!497633))

(declare-fun m!497635 () Bool)

(assert (=> b!516177 m!497635))

(assert (=> b!516177 m!497619))

(declare-fun m!497637 () Bool)

(assert (=> b!516175 m!497637))

(declare-fun m!497639 () Bool)

(assert (=> b!516175 m!497639))

(declare-fun m!497641 () Bool)

(assert (=> b!516175 m!497641))

(assert (=> b!516175 m!497619))

(declare-fun m!497643 () Bool)

(assert (=> b!516175 m!497643))

(assert (=> b!516175 m!497619))

(assert (=> b!516175 m!497641))

(declare-fun m!497645 () Bool)

(assert (=> b!516175 m!497645))

(declare-fun m!497647 () Bool)

(assert (=> b!516175 m!497647))

(assert (=> b!516175 m!497641))

(declare-fun m!497649 () Bool)

(assert (=> b!516175 m!497649))

(assert (=> b!516175 m!497619))

(declare-fun m!497651 () Bool)

(assert (=> b!516175 m!497651))

(declare-fun m!497653 () Bool)

(assert (=> b!516174 m!497653))

(assert (=> b!516180 m!497619))

(assert (=> b!516180 m!497619))

(declare-fun m!497655 () Bool)

(assert (=> b!516180 m!497655))

(push 1)

