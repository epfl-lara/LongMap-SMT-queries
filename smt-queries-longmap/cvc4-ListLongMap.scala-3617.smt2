; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49776 () Bool)

(assert start!49776)

(declare-fun b!547028 () Bool)

(declare-fun res!340747 () Bool)

(declare-fun e!316092 () Bool)

(assert (=> b!547028 (=> (not res!340747) (not e!316092))))

(declare-datatypes ((array!34514 0))(
  ( (array!34515 (arr!16583 (Array (_ BitVec 32) (_ BitVec 64))) (size!16947 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34514)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!34514 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!547028 (= res!340747 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun res!340746 () Bool)

(assert (=> start!49776 (=> (not res!340746) (not e!316092))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49776 (= res!340746 (validMask!0 mask!3119))))

(assert (=> start!49776 e!316092))

(assert (=> start!49776 true))

(declare-fun array_inv!12379 (array!34514) Bool)

(assert (=> start!49776 (array_inv!12379 a!3118)))

(declare-fun b!547029 () Bool)

(declare-fun res!340748 () Bool)

(assert (=> b!547029 (=> (not res!340748) (not e!316092))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!547029 (= res!340748 (and (= (size!16947 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!16947 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!16947 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!547030 () Bool)

(declare-fun res!340744 () Bool)

(assert (=> b!547030 (=> (not res!340744) (not e!316092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!547030 (= res!340744 (validKeyInArray!0 k!1914))))

(declare-fun b!547031 () Bool)

(declare-fun res!340743 () Bool)

(assert (=> b!547031 (=> (not res!340743) (not e!316092))))

(assert (=> b!547031 (= res!340743 (validKeyInArray!0 (select (arr!16583 a!3118) j!142)))))

(declare-fun b!547032 () Bool)

(declare-fun e!316091 () Bool)

(assert (=> b!547032 (= e!316091 (bvsgt #b00000000000000000000000000000000 (size!16947 a!3118)))))

(declare-fun b!547033 () Bool)

(assert (=> b!547033 (= e!316092 e!316091)))

(declare-fun res!340742 () Bool)

(assert (=> b!547033 (=> (not res!340742) (not e!316091))))

(declare-datatypes ((SeekEntryResult!5032 0))(
  ( (MissingZero!5032 (index!22355 (_ BitVec 32))) (Found!5032 (index!22356 (_ BitVec 32))) (Intermediate!5032 (undefined!5844 Bool) (index!22357 (_ BitVec 32)) (x!51300 (_ BitVec 32))) (Undefined!5032) (MissingVacant!5032 (index!22358 (_ BitVec 32))) )
))
(declare-fun lt!249409 () SeekEntryResult!5032)

(assert (=> b!547033 (= res!340742 (or (= lt!249409 (MissingZero!5032 i!1132)) (= lt!249409 (MissingVacant!5032 i!1132))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34514 (_ BitVec 32)) SeekEntryResult!5032)

(assert (=> b!547033 (= lt!249409 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!547034 () Bool)

(declare-fun res!340745 () Bool)

(assert (=> b!547034 (=> (not res!340745) (not e!316091))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34514 (_ BitVec 32)) Bool)

(assert (=> b!547034 (= res!340745 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(assert (= (and start!49776 res!340746) b!547029))

(assert (= (and b!547029 res!340748) b!547031))

(assert (= (and b!547031 res!340743) b!547030))

(assert (= (and b!547030 res!340744) b!547028))

(assert (= (and b!547028 res!340747) b!547033))

(assert (= (and b!547033 res!340742) b!547034))

(assert (= (and b!547034 res!340745) b!547032))

(declare-fun m!524393 () Bool)

(assert (=> start!49776 m!524393))

(declare-fun m!524395 () Bool)

(assert (=> start!49776 m!524395))

(declare-fun m!524397 () Bool)

(assert (=> b!547030 m!524397))

(declare-fun m!524399 () Bool)

(assert (=> b!547034 m!524399))

(declare-fun m!524401 () Bool)

(assert (=> b!547033 m!524401))

(declare-fun m!524403 () Bool)

(assert (=> b!547031 m!524403))

(assert (=> b!547031 m!524403))

(declare-fun m!524405 () Bool)

(assert (=> b!547031 m!524405))

(declare-fun m!524407 () Bool)

(assert (=> b!547028 m!524407))

(push 1)

(assert (not b!547034))

(assert (not start!49776))

(assert (not b!547033))

(assert (not b!547030))

(assert (not b!547031))

(assert (not b!547028))

(check-sat)

