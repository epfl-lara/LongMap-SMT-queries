; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67146 () Bool)

(assert start!67146)

(declare-fun b!775948 () Bool)

(declare-fun e!431823 () Bool)

(declare-fun e!431822 () Bool)

(assert (=> b!775948 (= e!431823 e!431822)))

(declare-fun res!524816 () Bool)

(assert (=> b!775948 (=> (not res!524816) (not e!431822))))

(declare-datatypes ((SeekEntryResult!7946 0))(
  ( (MissingZero!7946 (index!34152 (_ BitVec 32))) (Found!7946 (index!34153 (_ BitVec 32))) (Intermediate!7946 (undefined!8758 Bool) (index!34154 (_ BitVec 32)) (x!65097 (_ BitVec 32))) (Undefined!7946) (MissingVacant!7946 (index!34155 (_ BitVec 32))) )
))
(declare-fun lt!345683 () SeekEntryResult!7946)

(declare-fun lt!345675 () SeekEntryResult!7946)

(assert (=> b!775948 (= res!524816 (= lt!345683 lt!345675))))

(declare-fun x!1131 () (_ BitVec 32))

(declare-datatypes ((array!42501 0))(
  ( (array!42502 (arr!20346 (Array (_ BitVec 32) (_ BitVec 64))) (size!20767 (_ BitVec 32))) )
))
(declare-fun lt!345679 () array!42501)

(declare-fun index!1321 () (_ BitVec 32))

(declare-fun mask!3328 () (_ BitVec 32))

(declare-fun lt!345677 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42501 (_ BitVec 32)) SeekEntryResult!7946)

(assert (=> b!775948 (= lt!345675 (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 lt!345677 lt!345679 mask!3328))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!775948 (= lt!345683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!345677 mask!3328) lt!345677 lt!345679 mask!3328))))

(declare-fun a!3186 () array!42501)

(declare-fun j!159 () (_ BitVec 32))

(declare-fun i!1173 () (_ BitVec 32))

(declare-fun k!2102 () (_ BitVec 64))

(assert (=> b!775948 (= lt!345677 (select (store (arr!20346 a!3186) i!1173 k!2102) j!159))))

(assert (=> b!775948 (= lt!345679 (array!42502 (store (arr!20346 a!3186) i!1173 k!2102) (size!20767 a!3186)))))

(declare-fun b!775949 () Bool)

(declare-fun res!524818 () Bool)

(declare-fun e!431826 () Bool)

(assert (=> b!775949 (=> (not res!524818) (not e!431826))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!42501 (_ BitVec 32)) Bool)

(assert (=> b!775949 (= res!524818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3186 mask!3328))))

(declare-fun res!524804 () Bool)

(declare-fun e!431821 () Bool)

(assert (=> start!67146 (=> (not res!524804) (not e!431821))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!67146 (= res!524804 (validMask!0 mask!3328))))

(assert (=> start!67146 e!431821))

(assert (=> start!67146 true))

(declare-fun array_inv!16142 (array!42501) Bool)

(assert (=> start!67146 (array_inv!16142 a!3186)))

(declare-fun b!775950 () Bool)

(declare-fun res!524814 () Bool)

(assert (=> b!775950 (=> (not res!524814) (not e!431826))))

(declare-fun resIntermediateIndex!5 () (_ BitVec 32))

(declare-fun resIntermediateX!5 () (_ BitVec 32))

(assert (=> b!775950 (= res!524814 (and (bvsle x!1131 #b01111111111111111111111111111110) (bvsge x!1131 #b00000000000000000000000000000000) (bvsle resIntermediateX!5 #b01111111111111111111111111111110) (bvsge index!1321 #b00000000000000000000000000000000) (bvslt index!1321 (size!20767 a!3186)) (bvsge resIntermediateIndex!5 #b00000000000000000000000000000000) (bvslt resIntermediateIndex!5 (size!20767 a!3186))))))

(declare-fun b!775951 () Bool)

(declare-fun e!431824 () Bool)

(assert (=> b!775951 (= e!431824 true)))

(declare-fun lt!345682 () SeekEntryResult!7946)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!42501 (_ BitVec 32)) SeekEntryResult!7946)

(assert (=> b!775951 (= lt!345682 (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20346 a!3186) j!159) a!3186 mask!3328))))

(declare-fun b!775952 () Bool)

(assert (=> b!775952 (= e!431826 e!431823)))

(declare-fun res!524807 () Bool)

(assert (=> b!775952 (=> (not res!524807) (not e!431823))))

(declare-fun lt!345681 () SeekEntryResult!7946)

(assert (=> b!775952 (= res!524807 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!20346 a!3186) j!159) mask!3328) (select (arr!20346 a!3186) j!159) a!3186 mask!3328) lt!345681))))

(assert (=> b!775952 (= lt!345681 (Intermediate!7946 false resIntermediateIndex!5 resIntermediateX!5))))

(declare-fun b!775953 () Bool)

(declare-fun res!524817 () Bool)

(assert (=> b!775953 (=> (not res!524817) (not e!431823))))

(assert (=> b!775953 (= res!524817 (and (= resIntermediateIndex!5 i!1173) (= (select (arr!20346 a!3186) resIntermediateIndex!5) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!775954 () Bool)

(declare-fun e!431825 () Bool)

(declare-fun e!431827 () Bool)

(assert (=> b!775954 (= e!431825 e!431827)))

(declare-fun res!524808 () Bool)

(assert (=> b!775954 (=> (not res!524808) (not e!431827))))

(declare-fun lt!345678 () SeekEntryResult!7946)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!42501 (_ BitVec 32)) SeekEntryResult!7946)

(assert (=> b!775954 (= res!524808 (= (seekEntryOrOpen!0 (select (arr!20346 a!3186) j!159) a!3186 mask!3328) lt!345678))))

(assert (=> b!775954 (= lt!345678 (Found!7946 j!159))))

(declare-fun b!775955 () Bool)

(declare-fun res!524806 () Bool)

(assert (=> b!775955 (=> (not res!524806) (not e!431821))))

(assert (=> b!775955 (= res!524806 (and (= (size!20767 a!3186) (bvadd #b00000000000000000000000000000001 mask!3328)) (bvsge i!1173 #b00000000000000000000000000000000) (bvslt i!1173 (size!20767 a!3186)) (bvsge j!159 #b00000000000000000000000000000000) (bvslt j!159 (size!20767 a!3186)) (not (= i!1173 j!159))))))

(declare-fun b!775956 () Bool)

(declare-fun res!524809 () Bool)

(assert (=> b!775956 (=> (not res!524809) (not e!431821))))

(declare-fun arrayContainsKey!0 (array!42501 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!775956 (= res!524809 (not (arrayContainsKey!0 a!3186 k!2102 #b00000000000000000000000000000000)))))

(declare-fun b!775957 () Bool)

(assert (=> b!775957 (= e!431822 (not e!431824))))

(declare-fun res!524805 () Bool)

(assert (=> b!775957 (=> res!524805 e!431824)))

(assert (=> b!775957 (= res!524805 (or (not (is-Intermediate!7946 lt!345675)) (bvslt x!1131 (x!65097 lt!345675)) (not (= x!1131 (x!65097 lt!345675))) (not (= index!1321 (index!34154 lt!345675)))))))

(assert (=> b!775957 e!431825))

(declare-fun res!524812 () Bool)

(assert (=> b!775957 (=> (not res!524812) (not e!431825))))

(assert (=> b!775957 (= res!524812 (arrayForallSeekEntryOrOpenFound!0 j!159 a!3186 mask!3328))))

(declare-datatypes ((Unit!26786 0))(
  ( (Unit!26787) )
))
(declare-fun lt!345680 () Unit!26786)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!42501 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!26786)

(assert (=> b!775957 (= lt!345680 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3186 mask!3328 #b00000000000000000000000000000000 j!159))))

(declare-fun b!775958 () Bool)

(declare-fun res!524813 () Bool)

(assert (=> b!775958 (=> (not res!524813) (not e!431823))))

(declare-fun e!431820 () Bool)

(assert (=> b!775958 (= res!524813 e!431820)))

(declare-fun c!85972 () Bool)

(assert (=> b!775958 (= c!85972 (bvsle x!1131 resIntermediateX!5))))

(declare-fun b!775959 () Bool)

(declare-fun res!524811 () Bool)

(assert (=> b!775959 (=> (not res!524811) (not e!431821))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!775959 (= res!524811 (validKeyInArray!0 (select (arr!20346 a!3186) j!159)))))

(declare-fun b!775960 () Bool)

(assert (=> b!775960 (= e!431827 (= (seekKeyOrZeroReturnVacant!0 resIntermediateX!5 resIntermediateIndex!5 resIntermediateIndex!5 (select (arr!20346 a!3186) j!159) a!3186 mask!3328) lt!345678))))

(declare-fun b!775961 () Bool)

(assert (=> b!775961 (= e!431821 e!431826)))

(declare-fun res!524810 () Bool)

(assert (=> b!775961 (=> (not res!524810) (not e!431826))))

(declare-fun lt!345676 () SeekEntryResult!7946)

(assert (=> b!775961 (= res!524810 (or (= lt!345676 (MissingZero!7946 i!1173)) (= lt!345676 (MissingVacant!7946 i!1173))))))

(assert (=> b!775961 (= lt!345676 (seekEntryOrOpen!0 k!2102 a!3186 mask!3328))))

(declare-fun b!775962 () Bool)

(assert (=> b!775962 (= e!431820 (= (seekKeyOrZeroOrLongMinValue!0 x!1131 index!1321 (select (arr!20346 a!3186) j!159) a!3186 mask!3328) lt!345681))))

(declare-fun b!775963 () Bool)

(declare-fun res!524815 () Bool)

(assert (=> b!775963 (=> (not res!524815) (not e!431826))))

(declare-datatypes ((List!14348 0))(
  ( (Nil!14345) (Cons!14344 (h!15452 (_ BitVec 64)) (t!20663 List!14348)) )
))
(declare-fun arrayNoDuplicates!0 (array!42501 (_ BitVec 32) List!14348) Bool)

(assert (=> b!775963 (= res!524815 (arrayNoDuplicates!0 a!3186 #b00000000000000000000000000000000 Nil!14345))))

(declare-fun b!775964 () Bool)

(declare-fun res!524819 () Bool)

(assert (=> b!775964 (=> (not res!524819) (not e!431821))))

(assert (=> b!775964 (= res!524819 (validKeyInArray!0 k!2102))))

(declare-fun b!775965 () Bool)

(assert (=> b!775965 (= e!431820 (= (seekKeyOrZeroReturnVacant!0 x!1131 index!1321 resIntermediateIndex!5 (select (arr!20346 a!3186) j!159) a!3186 mask!3328) (Found!7946 j!159)))))

(assert (= (and start!67146 res!524804) b!775955))

(assert (= (and b!775955 res!524806) b!775959))

(assert (= (and b!775959 res!524811) b!775964))

(assert (= (and b!775964 res!524819) b!775956))

(assert (= (and b!775956 res!524809) b!775961))

(assert (= (and b!775961 res!524810) b!775949))

(assert (= (and b!775949 res!524818) b!775963))

(assert (= (and b!775963 res!524815) b!775950))

(assert (= (and b!775950 res!524814) b!775952))

(assert (= (and b!775952 res!524807) b!775953))

(assert (= (and b!775953 res!524817) b!775958))

(assert (= (and b!775958 c!85972) b!775962))

(assert (= (and b!775958 (not c!85972)) b!775965))

(assert (= (and b!775958 res!524813) b!775948))

(assert (= (and b!775948 res!524816) b!775957))

(assert (= (and b!775957 res!524812) b!775954))

(assert (= (and b!775954 res!524808) b!775960))

(assert (= (and b!775957 (not res!524805)) b!775951))

(declare-fun m!720101 () Bool)

(assert (=> b!775951 m!720101))

(assert (=> b!775951 m!720101))

(declare-fun m!720103 () Bool)

(assert (=> b!775951 m!720103))

(assert (=> b!775952 m!720101))

(assert (=> b!775952 m!720101))

(declare-fun m!720105 () Bool)

(assert (=> b!775952 m!720105))

(assert (=> b!775952 m!720105))

(assert (=> b!775952 m!720101))

(declare-fun m!720107 () Bool)

(assert (=> b!775952 m!720107))

(assert (=> b!775965 m!720101))

(assert (=> b!775965 m!720101))

(assert (=> b!775965 m!720103))

(assert (=> b!775962 m!720101))

(assert (=> b!775962 m!720101))

(declare-fun m!720109 () Bool)

(assert (=> b!775962 m!720109))

(declare-fun m!720111 () Bool)

(assert (=> b!775963 m!720111))

(declare-fun m!720113 () Bool)

(assert (=> start!67146 m!720113))

(declare-fun m!720115 () Bool)

(assert (=> start!67146 m!720115))

(declare-fun m!720117 () Bool)

(assert (=> b!775957 m!720117))

(declare-fun m!720119 () Bool)

(assert (=> b!775957 m!720119))

(declare-fun m!720121 () Bool)

(assert (=> b!775949 m!720121))

(declare-fun m!720123 () Bool)

(assert (=> b!775948 m!720123))

(declare-fun m!720125 () Bool)

(assert (=> b!775948 m!720125))

(declare-fun m!720127 () Bool)

(assert (=> b!775948 m!720127))

(declare-fun m!720129 () Bool)

(assert (=> b!775948 m!720129))

(assert (=> b!775948 m!720123))

(declare-fun m!720131 () Bool)

(assert (=> b!775948 m!720131))

(declare-fun m!720133 () Bool)

(assert (=> b!775953 m!720133))

(declare-fun m!720135 () Bool)

(assert (=> b!775964 m!720135))

(assert (=> b!775954 m!720101))

(assert (=> b!775954 m!720101))

(declare-fun m!720137 () Bool)

(assert (=> b!775954 m!720137))

(assert (=> b!775960 m!720101))

(assert (=> b!775960 m!720101))

(declare-fun m!720139 () Bool)

(assert (=> b!775960 m!720139))

(assert (=> b!775959 m!720101))

(assert (=> b!775959 m!720101))

(declare-fun m!720141 () Bool)

(assert (=> b!775959 m!720141))

(declare-fun m!720143 () Bool)

(assert (=> b!775961 m!720143))

(declare-fun m!720145 () Bool)

(assert (=> b!775956 m!720145))

(push 1)

