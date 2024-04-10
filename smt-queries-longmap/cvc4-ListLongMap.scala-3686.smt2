; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!50736 () Bool)

(assert start!50736)

(declare-fun b!554928 () Bool)

(declare-fun res!347346 () Bool)

(declare-fun e!319910 () Bool)

(assert (=> b!554928 (=> (not res!347346) (not e!319910))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun i!1132 () (_ BitVec 32))

(declare-datatypes ((array!34961 0))(
  ( (array!34962 (arr!16790 (Array (_ BitVec 32) (_ BitVec 64))) (size!17154 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!34961)

(assert (=> b!554928 (= res!347346 (and (= (size!17154 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17154 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17154 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!554929 () Bool)

(declare-fun res!347345 () Bool)

(declare-fun e!319908 () Bool)

(assert (=> b!554929 (=> (not res!347345) (not e!319908))))

(declare-datatypes ((List!10870 0))(
  ( (Nil!10867) (Cons!10866 (h!11851 (_ BitVec 64)) (t!17098 List!10870)) )
))
(declare-fun arrayNoDuplicates!0 (array!34961 (_ BitVec 32) List!10870) Bool)

(assert (=> b!554929 (= res!347345 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!10867))))

(declare-fun b!554930 () Bool)

(declare-fun e!319909 () Bool)

(assert (=> b!554930 (= e!319909 (not true))))

(declare-datatypes ((SeekEntryResult!5239 0))(
  ( (MissingZero!5239 (index!23183 (_ BitVec 32))) (Found!5239 (index!23184 (_ BitVec 32))) (Intermediate!5239 (undefined!6051 Bool) (index!23185 (_ BitVec 32)) (x!52089 (_ BitVec 32))) (Undefined!5239) (MissingVacant!5239 (index!23186 (_ BitVec 32))) )
))
(declare-fun lt!252078 () SeekEntryResult!5239)

(declare-fun lt!252077 () SeekEntryResult!5239)

(assert (=> b!554930 (and (= lt!252078 (Found!5239 j!142)) (or (undefined!6051 lt!252077) (not (is-Intermediate!5239 lt!252077)) (= (select (arr!16790 a!3118) (index!23185 lt!252077)) (select (arr!16790 a!3118) j!142)) (not (= (select (arr!16790 a!3118) (index!23185 lt!252077)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!252078 (MissingZero!5239 (index!23185 lt!252077)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34961 (_ BitVec 32)) SeekEntryResult!5239)

(assert (=> b!554930 (= lt!252078 (seekEntryOrOpen!0 (select (arr!16790 a!3118) j!142) a!3118 mask!3119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34961 (_ BitVec 32)) Bool)

(assert (=> b!554930 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-datatypes ((Unit!17252 0))(
  ( (Unit!17253) )
))
(declare-fun lt!252076 () Unit!17252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!34961 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17252)

(assert (=> b!554930 (= lt!252076 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!554932 () Bool)

(assert (=> b!554932 (= e!319910 e!319908)))

(declare-fun res!347344 () Bool)

(assert (=> b!554932 (=> (not res!347344) (not e!319908))))

(declare-fun lt!252075 () SeekEntryResult!5239)

(assert (=> b!554932 (= res!347344 (or (= lt!252075 (MissingZero!5239 i!1132)) (= lt!252075 (MissingVacant!5239 i!1132))))))

(declare-fun k!1914 () (_ BitVec 64))

(assert (=> b!554932 (= lt!252075 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!554933 () Bool)

(assert (=> b!554933 (= e!319908 e!319909)))

(declare-fun res!347347 () Bool)

(assert (=> b!554933 (=> (not res!347347) (not e!319909))))

(declare-fun lt!252079 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34961 (_ BitVec 32)) SeekEntryResult!5239)

(assert (=> b!554933 (= res!347347 (= lt!252077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252079 (select (store (arr!16790 a!3118) i!1132 k!1914) j!142) (array!34962 (store (arr!16790 a!3118) i!1132 k!1914) (size!17154 a!3118)) mask!3119)))))

(declare-fun lt!252074 () (_ BitVec 32))

(assert (=> b!554933 (= lt!252077 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!252074 (select (arr!16790 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!554933 (= lt!252079 (toIndex!0 (select (store (arr!16790 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!554933 (= lt!252074 (toIndex!0 (select (arr!16790 a!3118) j!142) mask!3119))))

(declare-fun b!554934 () Bool)

(declare-fun res!347343 () Bool)

(assert (=> b!554934 (=> (not res!347343) (not e!319908))))

(assert (=> b!554934 (= res!347343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!554931 () Bool)

(declare-fun res!347342 () Bool)

(assert (=> b!554931 (=> (not res!347342) (not e!319910))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!554931 (= res!347342 (validKeyInArray!0 k!1914))))

(declare-fun res!347341 () Bool)

(assert (=> start!50736 (=> (not res!347341) (not e!319910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!50736 (= res!347341 (validMask!0 mask!3119))))

(assert (=> start!50736 e!319910))

(assert (=> start!50736 true))

(declare-fun array_inv!12586 (array!34961) Bool)

(assert (=> start!50736 (array_inv!12586 a!3118)))

(declare-fun b!554935 () Bool)

(declare-fun res!347340 () Bool)

(assert (=> b!554935 (=> (not res!347340) (not e!319910))))

(assert (=> b!554935 (= res!347340 (validKeyInArray!0 (select (arr!16790 a!3118) j!142)))))

(declare-fun b!554936 () Bool)

(declare-fun res!347348 () Bool)

(assert (=> b!554936 (=> (not res!347348) (not e!319910))))

(declare-fun arrayContainsKey!0 (array!34961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!554936 (= res!347348 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(assert (= (and start!50736 res!347341) b!554928))

(assert (= (and b!554928 res!347346) b!554935))

(assert (= (and b!554935 res!347340) b!554931))

(assert (= (and b!554931 res!347342) b!554936))

(assert (= (and b!554936 res!347348) b!554932))

(assert (= (and b!554932 res!347344) b!554934))

(assert (= (and b!554934 res!347343) b!554929))

(assert (= (and b!554929 res!347345) b!554933))

(assert (= (and b!554933 res!347347) b!554930))

(declare-fun m!532405 () Bool)

(assert (=> b!554930 m!532405))

(declare-fun m!532407 () Bool)

(assert (=> b!554930 m!532407))

(declare-fun m!532409 () Bool)

(assert (=> b!554930 m!532409))

(declare-fun m!532411 () Bool)

(assert (=> b!554930 m!532411))

(assert (=> b!554930 m!532407))

(declare-fun m!532413 () Bool)

(assert (=> b!554930 m!532413))

(declare-fun m!532415 () Bool)

(assert (=> start!50736 m!532415))

(declare-fun m!532417 () Bool)

(assert (=> start!50736 m!532417))

(assert (=> b!554933 m!532407))

(declare-fun m!532419 () Bool)

(assert (=> b!554933 m!532419))

(assert (=> b!554933 m!532407))

(declare-fun m!532421 () Bool)

(assert (=> b!554933 m!532421))

(assert (=> b!554933 m!532421))

(declare-fun m!532423 () Bool)

(assert (=> b!554933 m!532423))

(declare-fun m!532425 () Bool)

(assert (=> b!554933 m!532425))

(assert (=> b!554933 m!532407))

(declare-fun m!532427 () Bool)

(assert (=> b!554933 m!532427))

(assert (=> b!554933 m!532421))

(declare-fun m!532429 () Bool)

(assert (=> b!554933 m!532429))

(declare-fun m!532431 () Bool)

(assert (=> b!554929 m!532431))

(declare-fun m!532433 () Bool)

(assert (=> b!554931 m!532433))

(declare-fun m!532435 () Bool)

(assert (=> b!554936 m!532435))

(declare-fun m!532437 () Bool)

(assert (=> b!554934 m!532437))

(declare-fun m!532439 () Bool)

(assert (=> b!554932 m!532439))

(assert (=> b!554935 m!532407))

(assert (=> b!554935 m!532407))

(declare-fun m!532441 () Bool)

(assert (=> b!554935 m!532441))

(push 1)

