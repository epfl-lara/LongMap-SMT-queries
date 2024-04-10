; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52878 () Bool)

(assert start!52878)

(declare-fun b!576422 () Bool)

(declare-fun e!331632 () Bool)

(declare-fun e!331634 () Bool)

(assert (=> b!576422 (= e!331632 e!331634)))

(declare-fun res!364655 () Bool)

(assert (=> b!576422 (=> (not res!364655) (not e!331634))))

(declare-datatypes ((SeekEntryResult!5713 0))(
  ( (MissingZero!5713 (index!25079 (_ BitVec 32))) (Found!5713 (index!25080 (_ BitVec 32))) (Intermediate!5713 (undefined!6525 Bool) (index!25081 (_ BitVec 32)) (x!53968 (_ BitVec 32))) (Undefined!5713) (MissingVacant!5713 (index!25082 (_ BitVec 32))) )
))
(declare-fun lt!263659 () SeekEntryResult!5713)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!576422 (= res!364655 (or (= lt!263659 (MissingZero!5713 i!1132)) (= lt!263659 (MissingVacant!5713 i!1132))))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-datatypes ((array!35966 0))(
  ( (array!35967 (arr!17264 (Array (_ BitVec 32) (_ BitVec 64))) (size!17628 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35966)

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35966 (_ BitVec 32)) SeekEntryResult!5713)

(assert (=> b!576422 (= lt!263659 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!576423 () Bool)

(declare-fun res!364660 () Bool)

(assert (=> b!576423 (=> (not res!364660) (not e!331634))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35966 (_ BitVec 32)) Bool)

(assert (=> b!576423 (= res!364660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!576424 () Bool)

(declare-fun res!364664 () Bool)

(assert (=> b!576424 (=> (not res!364664) (not e!331632))))

(declare-fun arrayContainsKey!0 (array!35966 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!576424 (= res!364664 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!576425 () Bool)

(declare-fun res!364663 () Bool)

(assert (=> b!576425 (=> (not res!364663) (not e!331634))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35966 (_ BitVec 32)) SeekEntryResult!5713)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!576425 (= res!364663 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17264 a!3118) j!142) mask!3119) (select (arr!17264 a!3118) j!142) a!3118 mask!3119) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!17264 a!3118) i!1132 k!1914) j!142) mask!3119) (select (store (arr!17264 a!3118) i!1132 k!1914) j!142) (array!35967 (store (arr!17264 a!3118) i!1132 k!1914) (size!17628 a!3118)) mask!3119)))))

(declare-fun res!364656 () Bool)

(assert (=> start!52878 (=> (not res!364656) (not e!331632))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!52878 (= res!364656 (validMask!0 mask!3119))))

(assert (=> start!52878 e!331632))

(assert (=> start!52878 true))

(declare-fun array_inv!13060 (array!35966) Bool)

(assert (=> start!52878 (array_inv!13060 a!3118)))

(declare-fun b!576426 () Bool)

(declare-fun e!331633 () Bool)

(assert (=> b!576426 (= e!331633 (= (seekEntryOrOpen!0 (select (arr!17264 a!3118) j!142) a!3118 mask!3119) (Found!5713 j!142)))))

(declare-fun b!576427 () Bool)

(declare-fun res!364661 () Bool)

(assert (=> b!576427 (=> (not res!364661) (not e!331632))))

(assert (=> b!576427 (= res!364661 (and (= (size!17628 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17628 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17628 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!576428 () Bool)

(declare-fun res!364659 () Bool)

(assert (=> b!576428 (=> (not res!364659) (not e!331632))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!576428 (= res!364659 (validKeyInArray!0 k!1914))))

(declare-fun b!576429 () Bool)

(declare-fun res!364657 () Bool)

(assert (=> b!576429 (=> (not res!364657) (not e!331634))))

(declare-datatypes ((List!11344 0))(
  ( (Nil!11341) (Cons!11340 (h!12382 (_ BitVec 64)) (t!17572 List!11344)) )
))
(declare-fun arrayNoDuplicates!0 (array!35966 (_ BitVec 32) List!11344) Bool)

(assert (=> b!576429 (= res!364657 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11341))))

(declare-fun b!576430 () Bool)

(declare-fun res!364658 () Bool)

(assert (=> b!576430 (=> (not res!364658) (not e!331632))))

(assert (=> b!576430 (= res!364658 (validKeyInArray!0 (select (arr!17264 a!3118) j!142)))))

(declare-fun b!576431 () Bool)

(assert (=> b!576431 (= e!331634 (not true))))

(assert (=> b!576431 e!331633))

(declare-fun res!364662 () Bool)

(assert (=> b!576431 (=> (not res!364662) (not e!331633))))

(assert (=> b!576431 (= res!364662 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!18128 0))(
  ( (Unit!18129) )
))
(declare-fun lt!263658 () Unit!18128)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35966 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!18128)

(assert (=> b!576431 (= lt!263658 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (= (and start!52878 res!364656) b!576427))

(assert (= (and b!576427 res!364661) b!576430))

(assert (= (and b!576430 res!364658) b!576428))

(assert (= (and b!576428 res!364659) b!576424))

(assert (= (and b!576424 res!364664) b!576422))

(assert (= (and b!576422 res!364655) b!576423))

(assert (= (and b!576423 res!364660) b!576429))

(assert (= (and b!576429 res!364657) b!576425))

(assert (= (and b!576425 res!364663) b!576431))

(assert (= (and b!576431 res!364662) b!576426))

(declare-fun m!555381 () Bool)

(assert (=> b!576431 m!555381))

(declare-fun m!555383 () Bool)

(assert (=> b!576431 m!555383))

(declare-fun m!555385 () Bool)

(assert (=> b!576424 m!555385))

(declare-fun m!555387 () Bool)

(assert (=> b!576428 m!555387))

(declare-fun m!555389 () Bool)

(assert (=> b!576426 m!555389))

(assert (=> b!576426 m!555389))

(declare-fun m!555391 () Bool)

(assert (=> b!576426 m!555391))

(declare-fun m!555393 () Bool)

(assert (=> b!576423 m!555393))

(declare-fun m!555395 () Bool)

(assert (=> b!576422 m!555395))

(assert (=> b!576425 m!555389))

(declare-fun m!555397 () Bool)

(assert (=> b!576425 m!555397))

(assert (=> b!576425 m!555389))

(declare-fun m!555399 () Bool)

(assert (=> b!576425 m!555399))

(declare-fun m!555401 () Bool)

(assert (=> b!576425 m!555401))

(assert (=> b!576425 m!555399))

(declare-fun m!555403 () Bool)

(assert (=> b!576425 m!555403))

(assert (=> b!576425 m!555397))

(assert (=> b!576425 m!555389))

(declare-fun m!555405 () Bool)

(assert (=> b!576425 m!555405))

(declare-fun m!555407 () Bool)

(assert (=> b!576425 m!555407))

(assert (=> b!576425 m!555399))

(assert (=> b!576425 m!555401))

(assert (=> b!576430 m!555389))

(assert (=> b!576430 m!555389))

(declare-fun m!555409 () Bool)

(assert (=> b!576430 m!555409))

(declare-fun m!555411 () Bool)

(assert (=> b!576429 m!555411))

(declare-fun m!555413 () Bool)

(assert (=> start!52878 m!555413))

(declare-fun m!555415 () Bool)

(assert (=> start!52878 m!555415))

(push 1)

