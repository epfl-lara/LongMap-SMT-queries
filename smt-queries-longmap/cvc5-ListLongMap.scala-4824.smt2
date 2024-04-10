; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66284 () Bool)

(assert start!66284)

(declare-fun b!763878 () Bool)

(declare-fun res!516796 () Bool)

(declare-fun e!425530 () Bool)

(assert (=> b!763878 (=> (not res!516796) (not e!425530))))

(declare-fun k!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!763878 (= res!516796 (validKeyInArray!0 k!2102))))

(declare-fun b!763879 () Bool)

(declare-fun e!425527 () Bool)

(declare-fun e!425529 () Bool)

(assert (=> b!763879 (= e!425527 e!425529)))

(declare-fun res!516794 () Bool)

(assert (=> b!763879 (=> (not res!516794) (not e!425529))))

(declare-datatypes ((array!42189 0))(
  ( (array!42190 (arr!20202 (Array (_ BitVec 32) (_ BitVec 64))) (size!20623 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!42189)

(declare-fun j!159 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!7802 0))(
  ( (MissingZero!7802 (index!33576 (_ BitVec 32))) (Found!7802 (index!33577 (_ BitVec 32))) (Intermediate!7802 (undefined!8614 Bool) (index!33578 (_ BitVec 32)) (x!64478 (_ BitVec 32))) (Undefined!7802) (MissingVacant!7802 (index!33579 (_ BitVec 32))) )
))
(declare-fun lt!339974 () SeekEntryResult!7802)

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42189 (_ BitVec 32)) SeekEntryResult!7802)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!763879 (= res!516794 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20202 a!3186) j!159) mask!3328) (select (arr!20202 a!3186) j!159) a!3186 mask!3328) lt!339974))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!763879 (= lt!339974 (Intermediate!7802 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!763880 () Bool)

(assert (=> b!763880 (= e!425530 e!425527)))

(declare-fun res!516799 () Bool)

(assert (=> b!763880 (=> (not res!516799) (not e!425527))))

(declare-fun lt!339976 () SeekEntryResult!7802)

(declare-fun i!1173 () (_ BitVec 32))

(assert (=> b!763880 (= res!516799 (or (= lt!339976 (MissingZero!7802 i!1173)) (= lt!339976 (MissingVacant!7802 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42189 (_ BitVec 32)) SeekEntryResult!7802)

(assert (=> b!763880 (= lt!339976 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!763881 () Bool)

(declare-fun res!516788 () Bool)

(assert (=> b!763881 (=> (not res!516788) (not e!425529))))

(assert (=> b!763881 (= res!516788 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20202 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!763882 () Bool)

(declare-fun res!516798 () Bool)

(assert (=> b!763882 (=> (not res!516798) (not e!425530))))

(declare-fun arrayContainsKey!0 (array!42189 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!763882 (= res!516798 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!763883 () Bool)

(declare-fun res!516792 () Bool)

(assert (=> b!763883 (=> (not res!516792) (not e!425527))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42189 (_ BitVec 32)) Bool)

(assert (=> b!763883 (= res!516792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!763884 () Bool)

(declare-fun e!425532 () Bool)

(assert (=> b!763884 (= e!425529 e!425532)))

(declare-fun res!516795 () Bool)

(assert (=> b!763884 (=> (not res!516795) (not e!425532))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun lt!339975 () array!42189)

(declare-fun lt!339977 () (_ BitVec 64))

(declare-fun index!1321 () (_ BitVec 32))

(assert (=> b!763884 (= res!516795 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!339977 mask!3328) lt!339977 lt!339975 mask!3328) (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!339977 lt!339975 mask!3328)))))

(assert (=> b!763884 (= lt!339977 (select (store (arr!20202 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!763884 (= lt!339975 (array!42190 (store (arr!20202 a!3186) i!1173 k!2102) (size!20623 a!3186)))))

(declare-fun b!763885 () Bool)

(declare-fun res!516787 () Bool)

(assert (=> b!763885 (=> (not res!516787) (not e!425527))))

(declare-datatypes ((List!14204 0))(
  ( (Nil!14201) (Cons!14200 (h!15284 (_ BitVec 64)) (t!20519 List!14204)) )
))
(declare-fun arrayNoDuplicates!0 (array!42189 (_ BitVec 32) List!14204) Bool)

(assert (=> b!763885 (= res!516787 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14201))))

(declare-fun b!763886 () Bool)

(declare-fun res!516789 () Bool)

(assert (=> b!763886 (=> (not res!516789) (not e!425529))))

(declare-fun e!425528 () Bool)

(assert (=> b!763886 (= res!516789 e!425528)))

(declare-fun c!83932 () Bool)

(assert (=> b!763886 (= c!83932 (bvsle x!1131 resIntermediateX!5))))

(declare-fun res!516791 () Bool)

(assert (=> start!66284 (=> (not res!516791) (not e!425530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!66284 (= res!516791 (validMask!0 mask!3328))))

(assert (=> start!66284 e!425530))

(assert (=> start!66284 true))

(declare-fun array_inv!15998 (array!42189) Bool)

(assert (=> start!66284 (array_inv!15998 a!3186)))

(declare-fun b!763887 () Bool)

(assert (=> b!763887 (= e!425528 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20202 a!3186) j!159) a!3186 mask!3328) lt!339974))))

(declare-fun b!763888 () Bool)

(declare-fun res!516793 () Bool)

(assert (=> b!763888 (=> (not res!516793) (not e!425530))))

(assert (=> b!763888 (= res!516793 (validKeyInArray!0 (select (arr!20202 a!3186) j!159)))))

(declare-fun b!763889 () Bool)

(assert (=> b!763889 (= e!425532 (bvsgt #b00000000000000000000000000000000 (size!20623 a!3186)))))

(declare-fun b!763890 () Bool)

(declare-fun res!516790 () Bool)

(assert (=> b!763890 (=> (not res!516790) (not e!425527))))

(assert (=> b!763890 (= res!516790 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20623 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20623 a!3186))))))

(declare-fun b!763891 () Bool)

(declare-fun res!516797 () Bool)

(assert (=> b!763891 (=> (not res!516797) (not e!425530))))

(assert (=> b!763891 (= res!516797 (and (= (size!20623 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20623 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20623 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!763892 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42189 (_ BitVec 32)) SeekEntryResult!7802)

(assert (=> b!763892 (= e!425528 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20202 a!3186) j!159) a!3186 mask!3328) (Found!7802 j!159)))))

(assert (= (and start!66284 res!516791) b!763891))

(assert (= (and b!763891 res!516797) b!763888))

(assert (= (and b!763888 res!516793) b!763878))

(assert (= (and b!763878 res!516796) b!763882))

(assert (= (and b!763882 res!516798) b!763880))

(assert (= (and b!763880 res!516799) b!763883))

(assert (= (and b!763883 res!516792) b!763885))

(assert (= (and b!763885 res!516787) b!763890))

(assert (= (and b!763890 res!516790) b!763879))

(assert (= (and b!763879 res!516794) b!763881))

(assert (= (and b!763881 res!516788) b!763886))

(assert (= (and b!763886 c!83932) b!763887))

(assert (= (and b!763886 (not c!83932)) b!763892))

(assert (= (and b!763886 res!516789) b!763884))

(assert (= (and b!763884 res!516795) b!763889))

(declare-fun m!710313 () Bool)

(assert (=> b!763887 m!710313))

(assert (=> b!763887 m!710313))

(declare-fun m!710315 () Bool)

(assert (=> b!763887 m!710315))

(assert (=> b!763892 m!710313))

(assert (=> b!763892 m!710313))

(declare-fun m!710317 () Bool)

(assert (=> b!763892 m!710317))

(declare-fun m!710319 () Bool)

(assert (=> b!763883 m!710319))

(assert (=> b!763888 m!710313))

(assert (=> b!763888 m!710313))

(declare-fun m!710321 () Bool)

(assert (=> b!763888 m!710321))

(declare-fun m!710323 () Bool)

(assert (=> b!763881 m!710323))

(declare-fun m!710325 () Bool)

(assert (=> b!763884 m!710325))

(declare-fun m!710327 () Bool)

(assert (=> b!763884 m!710327))

(declare-fun m!710329 () Bool)

(assert (=> b!763884 m!710329))

(declare-fun m!710331 () Bool)

(assert (=> b!763884 m!710331))

(declare-fun m!710333 () Bool)

(assert (=> b!763884 m!710333))

(assert (=> b!763884 m!710327))

(assert (=> b!763879 m!710313))

(assert (=> b!763879 m!710313))

(declare-fun m!710335 () Bool)

(assert (=> b!763879 m!710335))

(assert (=> b!763879 m!710335))

(assert (=> b!763879 m!710313))

(declare-fun m!710337 () Bool)

(assert (=> b!763879 m!710337))

(declare-fun m!710339 () Bool)

(assert (=> b!763885 m!710339))

(declare-fun m!710341 () Bool)

(assert (=> b!763878 m!710341))

(declare-fun m!710343 () Bool)

(assert (=> b!763882 m!710343))

(declare-fun m!710345 () Bool)

(assert (=> start!66284 m!710345))

(declare-fun m!710347 () Bool)

(assert (=> start!66284 m!710347))

(declare-fun m!710349 () Bool)

(assert (=> b!763880 m!710349))

(push 1)

