; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!65064 () Bool)

(assert start!65064)

(declare-fun b!733842 () Bool)

(declare-fun res!492934 () Bool)

(declare-fun e!410685 () Bool)

(assert (=> b!733842 (=> (not res!492934) (not e!410685))))

(declare-fun k0!2102 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!733842 (= res!492934 (validKeyInArray!0 k0!2102))))

(declare-fun b!733843 () Bool)

(declare-fun res!492923 () Bool)

(assert (=> b!733843 (=> (not res!492923) (not e!410685))))

(declare-datatypes ((array!41245 0))(
  ( (array!41246 (arr!19735 (Array (_ BitVec 32) (_ BitVec 64))) (size!20155 (_ BitVec 32))) )
))
(declare-fun a!3186 () array!41245)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(assert (=> b!733843 (= res!492923 (and (= (size!20155 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20155 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20155 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!733844 () Bool)

(declare-fun e!410684 () Bool)

(assert (=> b!733844 (= e!410684 (bvsge mask!3328 #b00000000000000000000000000000000))))

(declare-fun res!492931 () Bool)

(assert (=> start!65064 (=> (not res!492931) (not e!410685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!65064 (= res!492931 (validMask!0 mask!3328))))

(assert (=> start!65064 e!410685))

(assert (=> start!65064 true))

(declare-fun array_inv!15594 (array!41245) Bool)

(assert (=> start!65064 (array_inv!15594 a!3186)))

(declare-fun b!733845 () Bool)

(declare-fun e!410680 () Bool)

(assert (=> b!733845 (= e!410680 e!410684)))

(declare-fun res!492924 () Bool)

(assert (=> b!733845 (=> res!492924 e!410684)))

(declare-fun x!1131 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!733845 (= res!492924 (bvsle (bvadd #b00000000000000000000000000000001 x!1131) resIntermediateX!5))))

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun lt!325223 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733845 (= lt!325223 (nextIndex!0 index!1321 (bvadd #b00000000000000000000000000000001 x!1131) mask!3328))))

(declare-fun b!733846 () Bool)

(declare-fun res!492936 () Bool)

(declare-fun e!410688 () Bool)

(assert (=> b!733846 (=> (not res!492936) (not e!410688))))

(declare-datatypes ((List!13644 0))(
  ( (Nil!13641) (Cons!13640 (h!14712 (_ BitVec 64)) (t!19951 List!13644)) )
))
(declare-fun arrayNoDuplicates!0 (array!41245 (_ BitVec 32) List!13644) Bool)

(assert (=> b!733846 (= res!492936 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!13641))))

(declare-fun b!733847 () Bool)

(declare-fun res!492940 () Bool)

(assert (=> b!733847 (=> (not res!492940) (not e!410688))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!41245 (_ BitVec 32)) Bool)

(assert (=> b!733847 (= res!492940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun b!733848 () Bool)

(assert (=> b!733848 (= e!410685 e!410688)))

(declare-fun res!492935 () Bool)

(assert (=> b!733848 (=> (not res!492935) (not e!410688))))

(declare-datatypes ((SeekEntryResult!7291 0))(
  ( (MissingZero!7291 (index!31532 (_ BitVec 32))) (Found!7291 (index!31533 (_ BitVec 32))) (Intermediate!7291 (undefined!8103 Bool) (index!31534 (_ BitVec 32)) (x!62685 (_ BitVec 32))) (Undefined!7291) (MissingVacant!7291 (index!31535 (_ BitVec 32))) )
))
(declare-fun lt!325225 () SeekEntryResult!7291)

(assert (=> b!733848 (= res!492935 (or (= lt!325225 (MissingZero!7291 i!1173)) (= lt!325225 (MissingVacant!7291 i!1173))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!41245 (_ BitVec 32)) SeekEntryResult!7291)

(assert (=> b!733848 (= lt!325225 (seekEntryOrOpen!0 k0!2102 a!3186 mask!3328))))

(declare-fun b!733849 () Bool)

(declare-fun e!410679 () Bool)

(assert (=> b!733849 (= e!410688 e!410679)))

(declare-fun res!492926 () Bool)

(assert (=> b!733849 (=> (not res!492926) (not e!410679))))

(declare-fun lt!325227 () SeekEntryResult!7291)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41245 (_ BitVec 32)) SeekEntryResult!7291)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!733849 (= res!492926 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!19735 a!3186) j!159) mask!3328) (select (arr!19735 a!3186) j!159) a!3186 mask!3328) lt!325227))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(assert (=> b!733849 (= lt!325227 (Intermediate!7291 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!733850 () Bool)

(declare-fun lt!325226 () SeekEntryResult!7291)

(declare-fun e!410686 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!41245 (_ BitVec 32)) SeekEntryResult!7291)

(assert (=> b!733850 (= e!410686 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!19735 a!3186) j!159) a!3186 mask!3328) lt!325226))))

(declare-fun b!733851 () Bool)

(declare-fun res!492933 () Bool)

(assert (=> b!733851 (=> (not res!492933) (not e!410685))))

(declare-fun arrayContainsKey!0 (array!41245 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!733851 (= res!492933 (not (arrayContainsKey!0 a!3186 k0!2102 #b00000000000000000000000000000000)))))

(declare-fun b!733852 () Bool)

(declare-fun res!492937 () Bool)

(assert (=> b!733852 (=> (not res!492937) (not e!410679))))

(assert (=> b!733852 (= res!492937 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!19735 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!733853 () Bool)

(declare-fun e!410682 () Bool)

(assert (=> b!733853 (= e!410682 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!19735 a!3186) j!159) a!3186 mask!3328) lt!325227))))

(declare-fun b!733854 () Bool)

(declare-fun res!492925 () Bool)

(assert (=> b!733854 (=> (not res!492925) (not e!410688))))

(assert (=> b!733854 (= res!492925 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20155 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20155 a!3186))))))

(declare-fun b!733855 () Bool)

(declare-fun e!410683 () Bool)

(assert (=> b!733855 (= e!410679 e!410683)))

(declare-fun res!492938 () Bool)

(assert (=> b!733855 (=> (not res!492938) (not e!410683))))

(declare-fun lt!325221 () SeekEntryResult!7291)

(declare-fun lt!325222 () SeekEntryResult!7291)

(assert (=> b!733855 (= res!492938 (= lt!325221 lt!325222))))

(declare-fun lt!325220 () (_ BitVec 64))

(declare-fun lt!325224 () array!41245)

(assert (=> b!733855 (= lt!325222 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!325220 lt!325224 mask!3328))))

(assert (=> b!733855 (= lt!325221 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!325220 mask!3328) lt!325220 lt!325224 mask!3328))))

(assert (=> b!733855 (= lt!325220 (select (store (arr!19735 a!3186) i!1173 k0!2102) j!159))))

(assert (=> b!733855 (= lt!325224 (array!41246 (store (arr!19735 a!3186) i!1173 k0!2102) (size!20155 a!3186)))))

(declare-fun b!733856 () Bool)

(declare-fun e!410687 () Bool)

(assert (=> b!733856 (= e!410687 e!410686)))

(declare-fun res!492928 () Bool)

(assert (=> b!733856 (=> (not res!492928) (not e!410686))))

(assert (=> b!733856 (= res!492928 (= (seekEntryOrOpen!0 (select (arr!19735 a!3186) j!159) a!3186 mask!3328) lt!325226))))

(assert (=> b!733856 (= lt!325226 (Found!7291 j!159))))

(declare-fun b!733857 () Bool)

(assert (=> b!733857 (= e!410682 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19735 a!3186) j!159) a!3186 mask!3328) (Found!7291 j!159)))))

(declare-fun b!733858 () Bool)

(declare-fun res!492927 () Bool)

(assert (=> b!733858 (=> (not res!492927) (not e!410685))))

(assert (=> b!733858 (= res!492927 (validKeyInArray!0 (select (arr!19735 a!3186) j!159)))))

(declare-fun b!733859 () Bool)

(declare-fun res!492932 () Bool)

(assert (=> b!733859 (=> res!492932 e!410684)))

(assert (=> b!733859 (= res!492932 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!19735 a!3186) j!159) a!3186 mask!3328) (Found!7291 j!159)))))

(declare-fun b!733860 () Bool)

(assert (=> b!733860 (= e!410683 (not e!410680))))

(declare-fun res!492930 () Bool)

(assert (=> b!733860 (=> res!492930 e!410680)))

(get-info :version)

(assert (=> b!733860 (= res!492930 (or (not ((_ is Intermediate!7291) lt!325222)) (bvsge x!1131 (x!62685 lt!325222))))))

(assert (=> b!733860 e!410687))

(declare-fun res!492939 () Bool)

(assert (=> b!733860 (=> (not res!492939) (not e!410687))))

(assert (=> b!733860 (= res!492939 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!24979 0))(
  ( (Unit!24980) )
))
(declare-fun lt!325219 () Unit!24979)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!41245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!24979)

(assert (=> b!733860 (= lt!325219 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!733861 () Bool)

(declare-fun res!492929 () Bool)

(assert (=> b!733861 (=> (not res!492929) (not e!410679))))

(assert (=> b!733861 (= res!492929 e!410682)))

(declare-fun c!80840 () Bool)

(assert (=> b!733861 (= c!80840 (bvsle x!1131 resIntermediateX!5))))

(assert (= (and start!65064 res!492931) b!733843))

(assert (= (and b!733843 res!492923) b!733858))

(assert (= (and b!733858 res!492927) b!733842))

(assert (= (and b!733842 res!492934) b!733851))

(assert (= (and b!733851 res!492933) b!733848))

(assert (= (and b!733848 res!492935) b!733847))

(assert (= (and b!733847 res!492940) b!733846))

(assert (= (and b!733846 res!492936) b!733854))

(assert (= (and b!733854 res!492925) b!733849))

(assert (= (and b!733849 res!492926) b!733852))

(assert (= (and b!733852 res!492937) b!733861))

(assert (= (and b!733861 c!80840) b!733853))

(assert (= (and b!733861 (not c!80840)) b!733857))

(assert (= (and b!733861 res!492929) b!733855))

(assert (= (and b!733855 res!492938) b!733860))

(assert (= (and b!733860 res!492939) b!733856))

(assert (= (and b!733856 res!492928) b!733850))

(assert (= (and b!733860 (not res!492930)) b!733845))

(assert (= (and b!733845 (not res!492924)) b!733859))

(assert (= (and b!733859 (not res!492932)) b!733844))

(declare-fun m!687195 () Bool)

(assert (=> start!65064 m!687195))

(declare-fun m!687197 () Bool)

(assert (=> start!65064 m!687197))

(declare-fun m!687199 () Bool)

(assert (=> b!733850 m!687199))

(assert (=> b!733850 m!687199))

(declare-fun m!687201 () Bool)

(assert (=> b!733850 m!687201))

(declare-fun m!687203 () Bool)

(assert (=> b!733848 m!687203))

(assert (=> b!733858 m!687199))

(assert (=> b!733858 m!687199))

(declare-fun m!687205 () Bool)

(assert (=> b!733858 m!687205))

(assert (=> b!733856 m!687199))

(assert (=> b!733856 m!687199))

(declare-fun m!687207 () Bool)

(assert (=> b!733856 m!687207))

(declare-fun m!687209 () Bool)

(assert (=> b!733852 m!687209))

(assert (=> b!733857 m!687199))

(assert (=> b!733857 m!687199))

(declare-fun m!687211 () Bool)

(assert (=> b!733857 m!687211))

(assert (=> b!733859 m!687199))

(assert (=> b!733859 m!687199))

(assert (=> b!733859 m!687211))

(declare-fun m!687213 () Bool)

(assert (=> b!733860 m!687213))

(declare-fun m!687215 () Bool)

(assert (=> b!733860 m!687215))

(declare-fun m!687217 () Bool)

(assert (=> b!733855 m!687217))

(declare-fun m!687219 () Bool)

(assert (=> b!733855 m!687219))

(declare-fun m!687221 () Bool)

(assert (=> b!733855 m!687221))

(assert (=> b!733855 m!687217))

(declare-fun m!687223 () Bool)

(assert (=> b!733855 m!687223))

(declare-fun m!687225 () Bool)

(assert (=> b!733855 m!687225))

(declare-fun m!687227 () Bool)

(assert (=> b!733851 m!687227))

(declare-fun m!687229 () Bool)

(assert (=> b!733847 m!687229))

(declare-fun m!687231 () Bool)

(assert (=> b!733842 m!687231))

(declare-fun m!687233 () Bool)

(assert (=> b!733845 m!687233))

(assert (=> b!733853 m!687199))

(assert (=> b!733853 m!687199))

(declare-fun m!687235 () Bool)

(assert (=> b!733853 m!687235))

(assert (=> b!733849 m!687199))

(assert (=> b!733849 m!687199))

(declare-fun m!687237 () Bool)

(assert (=> b!733849 m!687237))

(assert (=> b!733849 m!687237))

(assert (=> b!733849 m!687199))

(declare-fun m!687239 () Bool)

(assert (=> b!733849 m!687239))

(declare-fun m!687241 () Bool)

(assert (=> b!733846 m!687241))

(check-sat (not b!733858) (not b!733849) (not b!733856) (not b!733855) (not b!733847) (not b!733860) (not b!733853) (not b!733859) (not b!733850) (not b!733851) (not start!65064) (not b!733848) (not b!733846) (not b!733857) (not b!733845) (not b!733842))
(check-sat)
