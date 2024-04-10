; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45666 () Bool)

(assert start!45666)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4058 0))(
  ( (MissingZero!4058 (index!18420 (_ BitVec 32))) (Found!4058 (index!18421 (_ BitVec 32))) (Intermediate!4058 (undefined!4870 Bool) (index!18422 (_ BitVec 32)) (x!47443 (_ BitVec 32))) (Undefined!4058) (MissingVacant!4058 (index!18423 (_ BitVec 32))) )
))
(declare-fun lt!229334 () SeekEntryResult!4058)

(declare-datatypes ((array!32422 0))(
  ( (array!32423 (arr!15591 (Array (_ BitVec 32) (_ BitVec 64))) (size!15955 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32422)

(declare-fun lt!229335 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun e!295076 () Bool)

(declare-fun b!503911 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32422 (_ BitVec 32)) SeekEntryResult!4058)

(assert (=> b!503911 (= e!295076 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229335 (index!18422 lt!229334) (select (arr!15591 a!3235) j!176) a!3235 mask!3524) (Found!4058 j!176))))))

(declare-fun b!503912 () Bool)

(declare-fun e!295072 () Bool)

(assert (=> b!503912 (= e!295072 true)))

(declare-fun lt!229339 () (_ BitVec 64))

(declare-fun lt!229332 () SeekEntryResult!4058)

(declare-fun lt!229330 () array!32422)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32422 (_ BitVec 32)) SeekEntryResult!4058)

(assert (=> b!503912 (= lt!229332 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229335 lt!229339 lt!229330 mask!3524))))

(declare-fun b!503913 () Bool)

(declare-datatypes ((Unit!15308 0))(
  ( (Unit!15309) )
))
(declare-fun e!295078 () Unit!15308)

(declare-fun Unit!15310 () Unit!15308)

(assert (=> b!503913 (= e!295078 Unit!15310)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!229331 () Unit!15308)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32422 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15308)

(assert (=> b!503913 (= lt!229331 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k!2280 j!176 lt!229335 #b00000000000000000000000000000000 (index!18422 lt!229334) (x!47443 lt!229334) mask!3524))))

(declare-fun res!305165 () Bool)

(assert (=> b!503913 (= res!305165 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229335 lt!229339 lt!229330 mask!3524) (Intermediate!4058 false (index!18422 lt!229334) (x!47443 lt!229334))))))

(declare-fun e!295073 () Bool)

(assert (=> b!503913 (=> (not res!305165) (not e!295073))))

(assert (=> b!503913 e!295073))

(declare-fun b!503914 () Bool)

(declare-fun e!295077 () Bool)

(declare-fun e!295074 () Bool)

(assert (=> b!503914 (= e!295077 (not e!295074))))

(declare-fun res!305168 () Bool)

(assert (=> b!503914 (=> res!305168 e!295074)))

(declare-fun lt!229337 () (_ BitVec 32))

(assert (=> b!503914 (= res!305168 (= lt!229334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229337 lt!229339 lt!229330 mask!3524)))))

(assert (=> b!503914 (= lt!229334 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229335 (select (arr!15591 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503914 (= lt!229337 (toIndex!0 lt!229339 mask!3524))))

(assert (=> b!503914 (= lt!229339 (select (store (arr!15591 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!503914 (= lt!229335 (toIndex!0 (select (arr!15591 a!3235) j!176) mask!3524))))

(assert (=> b!503914 (= lt!229330 (array!32423 (store (arr!15591 a!3235) i!1204 k!2280) (size!15955 a!3235)))))

(declare-fun e!295075 () Bool)

(assert (=> b!503914 e!295075))

(declare-fun res!305158 () Bool)

(assert (=> b!503914 (=> (not res!305158) (not e!295075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32422 (_ BitVec 32)) Bool)

(assert (=> b!503914 (= res!305158 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229338 () Unit!15308)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32422 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15308)

(assert (=> b!503914 (= lt!229338 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503915 () Bool)

(declare-fun res!305157 () Bool)

(declare-fun e!295080 () Bool)

(assert (=> b!503915 (=> (not res!305157) (not e!295080))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503915 (= res!305157 (validKeyInArray!0 k!2280))))

(declare-fun b!503916 () Bool)

(declare-fun res!305163 () Bool)

(assert (=> b!503916 (=> res!305163 e!295074)))

(assert (=> b!503916 (= res!305163 (or (undefined!4870 lt!229334) (not (is-Intermediate!4058 lt!229334))))))

(declare-fun res!305155 () Bool)

(assert (=> start!45666 (=> (not res!305155) (not e!295080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45666 (= res!305155 (validMask!0 mask!3524))))

(assert (=> start!45666 e!295080))

(assert (=> start!45666 true))

(declare-fun array_inv!11387 (array!32422) Bool)

(assert (=> start!45666 (array_inv!11387 a!3235)))

(declare-fun b!503917 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32422 (_ BitVec 32)) SeekEntryResult!4058)

(assert (=> b!503917 (= e!295075 (= (seekEntryOrOpen!0 (select (arr!15591 a!3235) j!176) a!3235 mask!3524) (Found!4058 j!176)))))

(declare-fun b!503918 () Bool)

(assert (=> b!503918 (= e!295073 false)))

(declare-fun b!503919 () Bool)

(declare-fun res!305161 () Bool)

(assert (=> b!503919 (=> (not res!305161) (not e!295080))))

(assert (=> b!503919 (= res!305161 (validKeyInArray!0 (select (arr!15591 a!3235) j!176)))))

(declare-fun b!503920 () Bool)

(declare-fun Unit!15311 () Unit!15308)

(assert (=> b!503920 (= e!295078 Unit!15311)))

(declare-fun b!503921 () Bool)

(declare-fun res!305166 () Bool)

(assert (=> b!503921 (=> (not res!305166) (not e!295077))))

(assert (=> b!503921 (= res!305166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503922 () Bool)

(assert (=> b!503922 (= e!295080 e!295077)))

(declare-fun res!305162 () Bool)

(assert (=> b!503922 (=> (not res!305162) (not e!295077))))

(declare-fun lt!229336 () SeekEntryResult!4058)

(assert (=> b!503922 (= res!305162 (or (= lt!229336 (MissingZero!4058 i!1204)) (= lt!229336 (MissingVacant!4058 i!1204))))))

(assert (=> b!503922 (= lt!229336 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!503923 () Bool)

(assert (=> b!503923 (= e!295074 e!295072)))

(declare-fun res!305167 () Bool)

(assert (=> b!503923 (=> res!305167 e!295072)))

(assert (=> b!503923 (= res!305167 (or (bvsgt (x!47443 lt!229334) #b01111111111111111111111111111110) (bvslt lt!229335 #b00000000000000000000000000000000) (bvsge lt!229335 (size!15955 a!3235)) (bvslt (index!18422 lt!229334) #b00000000000000000000000000000000) (bvsge (index!18422 lt!229334) (size!15955 a!3235)) (not (= lt!229334 (Intermediate!4058 false (index!18422 lt!229334) (x!47443 lt!229334))))))))

(assert (=> b!503923 (= (index!18422 lt!229334) i!1204)))

(declare-fun lt!229329 () Unit!15308)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32422 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15308)

(assert (=> b!503923 (= lt!229329 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k!2280 j!176 lt!229335 #b00000000000000000000000000000000 (index!18422 lt!229334) (x!47443 lt!229334) mask!3524))))

(assert (=> b!503923 (and (or (= (select (arr!15591 a!3235) (index!18422 lt!229334)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15591 a!3235) (index!18422 lt!229334)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15591 a!3235) (index!18422 lt!229334)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15591 a!3235) (index!18422 lt!229334)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229333 () Unit!15308)

(assert (=> b!503923 (= lt!229333 e!295078)))

(declare-fun c!59657 () Bool)

(assert (=> b!503923 (= c!59657 (= (select (arr!15591 a!3235) (index!18422 lt!229334)) (select (arr!15591 a!3235) j!176)))))

(assert (=> b!503923 (and (bvslt (x!47443 lt!229334) #b01111111111111111111111111111110) (or (= (select (arr!15591 a!3235) (index!18422 lt!229334)) (select (arr!15591 a!3235) j!176)) (= (select (arr!15591 a!3235) (index!18422 lt!229334)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15591 a!3235) (index!18422 lt!229334)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503924 () Bool)

(declare-fun res!305164 () Bool)

(assert (=> b!503924 (=> (not res!305164) (not e!295080))))

(declare-fun arrayContainsKey!0 (array!32422 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503924 (= res!305164 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503925 () Bool)

(declare-fun res!305159 () Bool)

(assert (=> b!503925 (=> (not res!305159) (not e!295080))))

(assert (=> b!503925 (= res!305159 (and (= (size!15955 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15955 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15955 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503926 () Bool)

(declare-fun res!305160 () Bool)

(assert (=> b!503926 (=> (not res!305160) (not e!295077))))

(declare-datatypes ((List!9749 0))(
  ( (Nil!9746) (Cons!9745 (h!10622 (_ BitVec 64)) (t!15977 List!9749)) )
))
(declare-fun arrayNoDuplicates!0 (array!32422 (_ BitVec 32) List!9749) Bool)

(assert (=> b!503926 (= res!305160 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9746))))

(declare-fun b!503927 () Bool)

(declare-fun res!305154 () Bool)

(assert (=> b!503927 (=> res!305154 e!295072)))

(assert (=> b!503927 (= res!305154 e!295076)))

(declare-fun res!305156 () Bool)

(assert (=> b!503927 (=> (not res!305156) (not e!295076))))

(assert (=> b!503927 (= res!305156 (bvsgt #b00000000000000000000000000000000 (x!47443 lt!229334)))))

(assert (= (and start!45666 res!305155) b!503925))

(assert (= (and b!503925 res!305159) b!503919))

(assert (= (and b!503919 res!305161) b!503915))

(assert (= (and b!503915 res!305157) b!503924))

(assert (= (and b!503924 res!305164) b!503922))

(assert (= (and b!503922 res!305162) b!503921))

(assert (= (and b!503921 res!305166) b!503926))

(assert (= (and b!503926 res!305160) b!503914))

(assert (= (and b!503914 res!305158) b!503917))

(assert (= (and b!503914 (not res!305168)) b!503916))

(assert (= (and b!503916 (not res!305163)) b!503923))

(assert (= (and b!503923 c!59657) b!503913))

(assert (= (and b!503923 (not c!59657)) b!503920))

(assert (= (and b!503913 res!305165) b!503918))

(assert (= (and b!503923 (not res!305167)) b!503927))

(assert (= (and b!503927 res!305156) b!503911))

(assert (= (and b!503927 (not res!305154)) b!503912))

(declare-fun m!484701 () Bool)

(assert (=> b!503915 m!484701))

(declare-fun m!484703 () Bool)

(assert (=> b!503913 m!484703))

(declare-fun m!484705 () Bool)

(assert (=> b!503913 m!484705))

(declare-fun m!484707 () Bool)

(assert (=> b!503919 m!484707))

(assert (=> b!503919 m!484707))

(declare-fun m!484709 () Bool)

(assert (=> b!503919 m!484709))

(declare-fun m!484711 () Bool)

(assert (=> start!45666 m!484711))

(declare-fun m!484713 () Bool)

(assert (=> start!45666 m!484713))

(assert (=> b!503911 m!484707))

(assert (=> b!503911 m!484707))

(declare-fun m!484715 () Bool)

(assert (=> b!503911 m!484715))

(declare-fun m!484717 () Bool)

(assert (=> b!503926 m!484717))

(declare-fun m!484719 () Bool)

(assert (=> b!503924 m!484719))

(declare-fun m!484721 () Bool)

(assert (=> b!503914 m!484721))

(declare-fun m!484723 () Bool)

(assert (=> b!503914 m!484723))

(declare-fun m!484725 () Bool)

(assert (=> b!503914 m!484725))

(assert (=> b!503914 m!484707))

(declare-fun m!484727 () Bool)

(assert (=> b!503914 m!484727))

(assert (=> b!503914 m!484707))

(declare-fun m!484729 () Bool)

(assert (=> b!503914 m!484729))

(declare-fun m!484731 () Bool)

(assert (=> b!503914 m!484731))

(assert (=> b!503914 m!484707))

(declare-fun m!484733 () Bool)

(assert (=> b!503914 m!484733))

(declare-fun m!484735 () Bool)

(assert (=> b!503914 m!484735))

(declare-fun m!484737 () Bool)

(assert (=> b!503921 m!484737))

(declare-fun m!484739 () Bool)

(assert (=> b!503922 m!484739))

(assert (=> b!503917 m!484707))

(assert (=> b!503917 m!484707))

(declare-fun m!484741 () Bool)

(assert (=> b!503917 m!484741))

(declare-fun m!484743 () Bool)

(assert (=> b!503923 m!484743))

(declare-fun m!484745 () Bool)

(assert (=> b!503923 m!484745))

(assert (=> b!503923 m!484707))

(assert (=> b!503912 m!484705))

(push 1)

