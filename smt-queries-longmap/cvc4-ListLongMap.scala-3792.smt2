; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51990 () Bool)

(assert start!51990)

(declare-fun res!358441 () Bool)

(declare-fun e!326853 () Bool)

(assert (=> start!51990 (=> (not res!358441) (not e!326853))))

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51990 (= res!358441 (validMask!0 mask!3119))))

(assert (=> start!51990 e!326853))

(assert (=> start!51990 true))

(declare-datatypes ((array!35627 0))(
  ( (array!35628 (arr!17108 (Array (_ BitVec 32) (_ BitVec 64))) (size!17472 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35627)

(declare-fun array_inv!12904 (array!35627) Bool)

(assert (=> start!51990 (array_inv!12904 a!3118)))

(declare-fun b!568052 () Bool)

(declare-fun res!358438 () Bool)

(assert (=> b!568052 (=> (not res!358438) (not e!326853))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!568052 (= res!358438 (validKeyInArray!0 (select (arr!17108 a!3118) j!142)))))

(declare-fun b!568053 () Bool)

(declare-fun e!326856 () Bool)

(declare-fun e!326854 () Bool)

(assert (=> b!568053 (= e!326856 e!326854)))

(declare-fun res!358436 () Bool)

(assert (=> b!568053 (=> (not res!358436) (not e!326854))))

(declare-fun k!1914 () (_ BitVec 64))

(declare-fun lt!258796 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!5557 0))(
  ( (MissingZero!5557 (index!24455 (_ BitVec 32))) (Found!5557 (index!24456 (_ BitVec 32))) (Intermediate!5557 (undefined!6369 Bool) (index!24457 (_ BitVec 32)) (x!53324 (_ BitVec 32))) (Undefined!5557) (MissingVacant!5557 (index!24458 (_ BitVec 32))) )
))
(declare-fun lt!258792 () SeekEntryResult!5557)

(declare-fun i!1132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35627 (_ BitVec 32)) SeekEntryResult!5557)

(assert (=> b!568053 (= res!358436 (= lt!258792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258796 (select (store (arr!17108 a!3118) i!1132 k!1914) j!142) (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118)) mask!3119)))))

(declare-fun lt!258794 () (_ BitVec 32))

(assert (=> b!568053 (= lt!258792 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258794 (select (arr!17108 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568053 (= lt!258796 (toIndex!0 (select (store (arr!17108 a!3118) i!1132 k!1914) j!142) mask!3119))))

(assert (=> b!568053 (= lt!258794 (toIndex!0 (select (arr!17108 a!3118) j!142) mask!3119))))

(declare-fun b!568054 () Bool)

(declare-fun res!358439 () Bool)

(assert (=> b!568054 (=> (not res!358439) (not e!326853))))

(declare-fun arrayContainsKey!0 (array!35627 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!568054 (= res!358439 (not (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000)))))

(declare-fun b!568055 () Bool)

(assert (=> b!568055 (= e!326854 (not (or (not (is-Intermediate!5557 lt!258792)) (undefined!6369 lt!258792) (= (select (arr!17108 a!3118) (index!24457 lt!258792)) (select (arr!17108 a!3118) j!142)) (and (bvsge (index!24457 lt!258792) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258792) (size!17472 a!3118))))))))

(declare-fun e!326852 () Bool)

(assert (=> b!568055 e!326852))

(declare-fun res!358445 () Bool)

(assert (=> b!568055 (=> (not res!358445) (not e!326852))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35627 (_ BitVec 32)) Bool)

(assert (=> b!568055 (= res!358445 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17816 0))(
  ( (Unit!17817) )
))
(declare-fun lt!258795 () Unit!17816)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17816)

(assert (=> b!568055 (= lt!258795 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!568056 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35627 (_ BitVec 32)) SeekEntryResult!5557)

(assert (=> b!568056 (= e!326852 (= (seekEntryOrOpen!0 (select (arr!17108 a!3118) j!142) a!3118 mask!3119) (Found!5557 j!142)))))

(declare-fun b!568057 () Bool)

(declare-fun res!358443 () Bool)

(assert (=> b!568057 (=> (not res!358443) (not e!326856))))

(declare-datatypes ((List!11188 0))(
  ( (Nil!11185) (Cons!11184 (h!12199 (_ BitVec 64)) (t!17416 List!11188)) )
))
(declare-fun arrayNoDuplicates!0 (array!35627 (_ BitVec 32) List!11188) Bool)

(assert (=> b!568057 (= res!358443 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11185))))

(declare-fun b!568058 () Bool)

(declare-fun res!358444 () Bool)

(assert (=> b!568058 (=> (not res!358444) (not e!326853))))

(assert (=> b!568058 (= res!358444 (validKeyInArray!0 k!1914))))

(declare-fun b!568059 () Bool)

(assert (=> b!568059 (= e!326853 e!326856)))

(declare-fun res!358440 () Bool)

(assert (=> b!568059 (=> (not res!358440) (not e!326856))))

(declare-fun lt!258793 () SeekEntryResult!5557)

(assert (=> b!568059 (= res!358440 (or (= lt!258793 (MissingZero!5557 i!1132)) (= lt!258793 (MissingVacant!5557 i!1132))))))

(assert (=> b!568059 (= lt!258793 (seekEntryOrOpen!0 k!1914 a!3118 mask!3119))))

(declare-fun b!568060 () Bool)

(declare-fun res!358442 () Bool)

(assert (=> b!568060 (=> (not res!358442) (not e!326856))))

(assert (=> b!568060 (= res!358442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun b!568061 () Bool)

(declare-fun res!358437 () Bool)

(assert (=> b!568061 (=> (not res!358437) (not e!326853))))

(assert (=> b!568061 (= res!358437 (and (= (size!17472 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17472 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17472 a!3118)) (not (= i!1132 j!142))))))

(assert (= (and start!51990 res!358441) b!568061))

(assert (= (and b!568061 res!358437) b!568052))

(assert (= (and b!568052 res!358438) b!568058))

(assert (= (and b!568058 res!358444) b!568054))

(assert (= (and b!568054 res!358439) b!568059))

(assert (= (and b!568059 res!358440) b!568060))

(assert (= (and b!568060 res!358442) b!568057))

(assert (= (and b!568057 res!358443) b!568053))

(assert (= (and b!568053 res!358436) b!568055))

(assert (= (and b!568055 res!358445) b!568056))

(declare-fun m!546649 () Bool)

(assert (=> b!568060 m!546649))

(declare-fun m!546651 () Bool)

(assert (=> b!568057 m!546651))

(declare-fun m!546653 () Bool)

(assert (=> b!568053 m!546653))

(declare-fun m!546655 () Bool)

(assert (=> b!568053 m!546655))

(assert (=> b!568053 m!546653))

(declare-fun m!546657 () Bool)

(assert (=> b!568053 m!546657))

(assert (=> b!568053 m!546657))

(declare-fun m!546659 () Bool)

(assert (=> b!568053 m!546659))

(assert (=> b!568053 m!546653))

(declare-fun m!546661 () Bool)

(assert (=> b!568053 m!546661))

(declare-fun m!546663 () Bool)

(assert (=> b!568053 m!546663))

(assert (=> b!568053 m!546657))

(declare-fun m!546665 () Bool)

(assert (=> b!568053 m!546665))

(declare-fun m!546667 () Bool)

(assert (=> b!568054 m!546667))

(declare-fun m!546669 () Bool)

(assert (=> start!51990 m!546669))

(declare-fun m!546671 () Bool)

(assert (=> start!51990 m!546671))

(assert (=> b!568052 m!546653))

(assert (=> b!568052 m!546653))

(declare-fun m!546673 () Bool)

(assert (=> b!568052 m!546673))

(assert (=> b!568056 m!546653))

(assert (=> b!568056 m!546653))

(declare-fun m!546675 () Bool)

(assert (=> b!568056 m!546675))

(declare-fun m!546677 () Bool)

(assert (=> b!568059 m!546677))

(declare-fun m!546679 () Bool)

(assert (=> b!568058 m!546679))

(declare-fun m!546681 () Bool)

(assert (=> b!568055 m!546681))

(assert (=> b!568055 m!546653))

(declare-fun m!546683 () Bool)

(assert (=> b!568055 m!546683))

(declare-fun m!546685 () Bool)

(assert (=> b!568055 m!546685))

(push 1)

(assert (not b!568052))

(assert (not b!568053))

(assert (not b!568055))

(assert (not b!568056))

(assert (not b!568060))

(assert (not b!568059))

(assert (not b!568057))

(assert (not b!568058))

(assert (not start!51990))

(assert (not b!568054))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!568167 () Bool)

(declare-fun e!326926 () SeekEntryResult!5557)

(declare-fun e!326927 () SeekEntryResult!5557)

(assert (=> b!568167 (= e!326926 e!326927)))

(declare-fun lt!258840 () (_ BitVec 64))

(declare-fun c!65198 () Bool)

(assert (=> b!568167 (= c!65198 (or (= lt!258840 (select (store (arr!17108 a!3118) i!1132 k!1914) j!142)) (= (bvadd lt!258840 lt!258840) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84399 () Bool)

(declare-fun e!326925 () Bool)

(assert (=> d!84399 e!326925))

(declare-fun c!65197 () Bool)

(declare-fun lt!258841 () SeekEntryResult!5557)

(assert (=> d!84399 (= c!65197 (and (is-Intermediate!5557 lt!258841) (undefined!6369 lt!258841)))))

(assert (=> d!84399 (= lt!258841 e!326926)))

(declare-fun c!65196 () Bool)

(assert (=> d!84399 (= c!65196 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84399 (= lt!258840 (select (arr!17108 (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118))) lt!258796))))

(assert (=> d!84399 (validMask!0 mask!3119)))

(assert (=> d!84399 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258796 (select (store (arr!17108 a!3118) i!1132 k!1914) j!142) (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118)) mask!3119) lt!258841)))

(declare-fun b!568168 () Bool)

(assert (=> b!568168 (= e!326925 (bvsge (x!53324 lt!258841) #b01111111111111111111111111111110))))

(declare-fun b!568169 () Bool)

(assert (=> b!568169 (= e!326926 (Intermediate!5557 true lt!258796 #b00000000000000000000000000000000))))

(declare-fun b!568170 () Bool)

(assert (=> b!568170 (and (bvsge (index!24457 lt!258841) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258841) (size!17472 (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118)))))))

(declare-fun res!358479 () Bool)

(assert (=> b!568170 (= res!358479 (= (select (arr!17108 (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118))) (index!24457 lt!258841)) (select (store (arr!17108 a!3118) i!1132 k!1914) j!142)))))

(declare-fun e!326924 () Bool)

(assert (=> b!568170 (=> res!358479 e!326924)))

(declare-fun e!326928 () Bool)

(assert (=> b!568170 (= e!326928 e!326924)))

(declare-fun b!568171 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!568171 (= e!326927 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258796 #b00000000000000000000000000000000 mask!3119) (select (store (arr!17108 a!3118) i!1132 k!1914) j!142) (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118)) mask!3119))))

(declare-fun b!568172 () Bool)

(assert (=> b!568172 (= e!326925 e!326928)))

(declare-fun res!358480 () Bool)

(assert (=> b!568172 (= res!358480 (and (is-Intermediate!5557 lt!258841) (not (undefined!6369 lt!258841)) (bvslt (x!53324 lt!258841) #b01111111111111111111111111111110) (bvsge (x!53324 lt!258841) #b00000000000000000000000000000000) (bvsge (x!53324 lt!258841) #b00000000000000000000000000000000)))))

(assert (=> b!568172 (=> (not res!358480) (not e!326928))))

(declare-fun b!568173 () Bool)

(assert (=> b!568173 (and (bvsge (index!24457 lt!258841) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258841) (size!17472 (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118)))))))

(declare-fun res!358481 () Bool)

(assert (=> b!568173 (= res!358481 (= (select (arr!17108 (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118))) (index!24457 lt!258841)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568173 (=> res!358481 e!326924)))

(declare-fun b!568174 () Bool)

(assert (=> b!568174 (and (bvsge (index!24457 lt!258841) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258841) (size!17472 (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118)))))))

(assert (=> b!568174 (= e!326924 (= (select (arr!17108 (array!35628 (store (arr!17108 a!3118) i!1132 k!1914) (size!17472 a!3118))) (index!24457 lt!258841)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568175 () Bool)

(assert (=> b!568175 (= e!326927 (Intermediate!5557 false lt!258796 #b00000000000000000000000000000000))))

(assert (= (and d!84399 c!65196) b!568169))

(assert (= (and d!84399 (not c!65196)) b!568167))

(assert (= (and b!568167 c!65198) b!568175))

(assert (= (and b!568167 (not c!65198)) b!568171))

(assert (= (and d!84399 c!65197) b!568168))

(assert (= (and d!84399 (not c!65197)) b!568172))

(assert (= (and b!568172 res!358480) b!568170))

(assert (= (and b!568170 (not res!358479)) b!568173))

(assert (= (and b!568173 (not res!358481)) b!568174))

(declare-fun m!546751 () Bool)

(assert (=> b!568170 m!546751))

(declare-fun m!546753 () Bool)

(assert (=> b!568171 m!546753))

(assert (=> b!568171 m!546753))

(assert (=> b!568171 m!546657))

(declare-fun m!546755 () Bool)

(assert (=> b!568171 m!546755))

(assert (=> b!568173 m!546751))

(assert (=> b!568174 m!546751))

(declare-fun m!546757 () Bool)

(assert (=> d!84399 m!546757))

(assert (=> d!84399 m!546669))

(assert (=> b!568053 d!84399))

(declare-fun b!568180 () Bool)

(declare-fun e!326934 () SeekEntryResult!5557)

(declare-fun e!326935 () SeekEntryResult!5557)

(assert (=> b!568180 (= e!326934 e!326935)))

(declare-fun lt!258845 () (_ BitVec 64))

(declare-fun c!65202 () Bool)

(assert (=> b!568180 (= c!65202 (or (= lt!258845 (select (arr!17108 a!3118) j!142)) (= (bvadd lt!258845 lt!258845) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!84413 () Bool)

(declare-fun e!326933 () Bool)

(assert (=> d!84413 e!326933))

(declare-fun c!65201 () Bool)

(declare-fun lt!258846 () SeekEntryResult!5557)

(assert (=> d!84413 (= c!65201 (and (is-Intermediate!5557 lt!258846) (undefined!6369 lt!258846)))))

(assert (=> d!84413 (= lt!258846 e!326934)))

(declare-fun c!65200 () Bool)

(assert (=> d!84413 (= c!65200 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!84413 (= lt!258845 (select (arr!17108 a!3118) lt!258794))))

(assert (=> d!84413 (validMask!0 mask!3119)))

(assert (=> d!84413 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!258794 (select (arr!17108 a!3118) j!142) a!3118 mask!3119) lt!258846)))

(declare-fun b!568181 () Bool)

(assert (=> b!568181 (= e!326933 (bvsge (x!53324 lt!258846) #b01111111111111111111111111111110))))

(declare-fun b!568182 () Bool)

(assert (=> b!568182 (= e!326934 (Intermediate!5557 true lt!258794 #b00000000000000000000000000000000))))

(declare-fun b!568183 () Bool)

(assert (=> b!568183 (and (bvsge (index!24457 lt!258846) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258846) (size!17472 a!3118)))))

(declare-fun res!358484 () Bool)

(assert (=> b!568183 (= res!358484 (= (select (arr!17108 a!3118) (index!24457 lt!258846)) (select (arr!17108 a!3118) j!142)))))

(declare-fun e!326932 () Bool)

(assert (=> b!568183 (=> res!358484 e!326932)))

(declare-fun e!326936 () Bool)

(assert (=> b!568183 (= e!326936 e!326932)))

(declare-fun b!568184 () Bool)

(assert (=> b!568184 (= e!326935 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!258794 #b00000000000000000000000000000000 mask!3119) (select (arr!17108 a!3118) j!142) a!3118 mask!3119))))

(declare-fun b!568185 () Bool)

(assert (=> b!568185 (= e!326933 e!326936)))

(declare-fun res!358485 () Bool)

(assert (=> b!568185 (= res!358485 (and (is-Intermediate!5557 lt!258846) (not (undefined!6369 lt!258846)) (bvslt (x!53324 lt!258846) #b01111111111111111111111111111110) (bvsge (x!53324 lt!258846) #b00000000000000000000000000000000) (bvsge (x!53324 lt!258846) #b00000000000000000000000000000000)))))

(assert (=> b!568185 (=> (not res!358485) (not e!326936))))

(declare-fun b!568186 () Bool)

(assert (=> b!568186 (and (bvsge (index!24457 lt!258846) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258846) (size!17472 a!3118)))))

(declare-fun res!358486 () Bool)

(assert (=> b!568186 (= res!358486 (= (select (arr!17108 a!3118) (index!24457 lt!258846)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!568186 (=> res!358486 e!326932)))

(declare-fun b!568187 () Bool)

(assert (=> b!568187 (and (bvsge (index!24457 lt!258846) #b00000000000000000000000000000000) (bvslt (index!24457 lt!258846) (size!17472 a!3118)))))

(assert (=> b!568187 (= e!326932 (= (select (arr!17108 a!3118) (index!24457 lt!258846)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!568188 () Bool)

(assert (=> b!568188 (= e!326935 (Intermediate!5557 false lt!258794 #b00000000000000000000000000000000))))

(assert (= (and d!84413 c!65200) b!568182))

(assert (= (and d!84413 (not c!65200)) b!568180))

(assert (= (and b!568180 c!65202) b!568188))

(assert (= (and b!568180 (not c!65202)) b!568184))

(assert (= (and d!84413 c!65201) b!568181))

(assert (= (and d!84413 (not c!65201)) b!568185))

(assert (= (and b!568185 res!358485) b!568183))

(assert (= (and b!568183 (not res!358484)) b!568186))

(assert (= (and b!568186 (not res!358486)) b!568187))

(declare-fun m!546765 () Bool)

(assert (=> b!568183 m!546765))

(declare-fun m!546767 () Bool)

(assert (=> b!568184 m!546767))

(assert (=> b!568184 m!546767))

(assert (=> b!568184 m!546653))

(declare-fun m!546771 () Bool)

(assert (=> b!568184 m!546771))

(assert (=> b!568186 m!546765))

(assert (=> b!568187 m!546765))

(declare-fun m!546773 () Bool)

(assert (=> d!84413 m!546773))

(assert (=> d!84413 m!546669))

(assert (=> b!568053 d!84413))

(declare-fun d!84419 () Bool)

(declare-fun lt!258858 () (_ BitVec 32))

(declare-fun lt!258857 () (_ BitVec 32))

(assert (=> d!84419 (= lt!258858 (bvmul (bvxor lt!258857 (bvlshr lt!258857 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84419 (= lt!258857 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17108 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17108 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84419 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358487 (let ((h!12200 ((_ extract 31 0) (bvand (bvxor (select (store (arr!17108 a!3118) i!1132 k!1914) j!142) (bvlshr (select (store (arr!17108 a!3118) i!1132 k!1914) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53326 (bvmul (bvxor h!12200 (bvlshr h!12200 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53326 (bvlshr x!53326 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358487 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358487 #b00000000000000000000000000000000))))))

(assert (=> d!84419 (= (toIndex!0 (select (store (arr!17108 a!3118) i!1132 k!1914) j!142) mask!3119) (bvand (bvxor lt!258858 (bvlshr lt!258858 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568053 d!84419))

(declare-fun d!84423 () Bool)

(declare-fun lt!258860 () (_ BitVec 32))

(declare-fun lt!258859 () (_ BitVec 32))

(assert (=> d!84423 (= lt!258860 (bvmul (bvxor lt!258859 (bvlshr lt!258859 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!84423 (= lt!258859 ((_ extract 31 0) (bvand (bvxor (select (arr!17108 a!3118) j!142) (bvlshr (select (arr!17108 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!84423 (and (bvsge mask!3119 #b00000000000000000000000000000000) (let ((res!358487 (let ((h!12200 ((_ extract 31 0) (bvand (bvxor (select (arr!17108 a!3118) j!142) (bvlshr (select (arr!17108 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!53326 (bvmul (bvxor h!12200 (bvlshr h!12200 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!53326 (bvlshr x!53326 #b00000000000000000000000000001101)) mask!3119))))) (and (bvslt res!358487 (bvadd mask!3119 #b00000000000000000000000000000001)) (bvsge res!358487 #b00000000000000000000000000000000))))))

(assert (=> d!84423 (= (toIndex!0 (select (arr!17108 a!3118) j!142) mask!3119) (bvand (bvxor lt!258860 (bvlshr lt!258860 #b00000000000000000000000000001101)) mask!3119))))

(assert (=> b!568053 d!84423))

(declare-fun d!84425 () Bool)

(declare-fun res!358498 () Bool)

(declare-fun e!326949 () Bool)

(assert (=> d!84425 (=> res!358498 e!326949)))

(assert (=> d!84425 (= res!358498 (= (select (arr!17108 a!3118) #b00000000000000000000000000000000) k!1914))))

(assert (=> d!84425 (= (arrayContainsKey!0 a!3118 k!1914 #b00000000000000000000000000000000) e!326949)))

(declare-fun b!568203 () Bool)

(declare-fun e!326950 () Bool)

(assert (=> b!568203 (= e!326949 e!326950)))

(declare-fun res!358499 () Bool)

(assert (=> b!568203 (=> (not res!358499) (not e!326950))))

(assert (=> b!568203 (= res!358499 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17472 a!3118)))))

(declare-fun b!568204 () Bool)

(assert (=> b!568204 (= e!326950 (arrayContainsKey!0 a!3118 k!1914 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!84425 (not res!358498)) b!568203))

(assert (= (and b!568203 res!358499) b!568204))

(declare-fun m!546777 () Bool)

(assert (=> d!84425 m!546777))

(declare-fun m!546779 () Bool)

(assert (=> b!568204 m!546779))

(assert (=> b!568054 d!84425))

(declare-fun b!568274 () Bool)

(declare-fun c!65228 () Bool)

(declare-fun lt!258891 () (_ BitVec 64))

(assert (=> b!568274 (= c!65228 (= lt!258891 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!326993 () SeekEntryResult!5557)

(declare-fun e!326995 () SeekEntryResult!5557)

(assert (=> b!568274 (= e!326993 e!326995)))

(declare-fun b!568275 () Bool)

(declare-fun e!326994 () SeekEntryResult!5557)

(assert (=> b!568275 (= e!326994 e!326993)))

(declare-fun lt!258890 () SeekEntryResult!5557)

(assert (=> b!568275 (= lt!258891 (select (arr!17108 a!3118) (index!24457 lt!258890)))))

(declare-fun c!65230 () Bool)

(assert (=> b!568275 (= c!65230 (= lt!258891 k!1914))))

(declare-fun b!568276 () Bool)

(assert (=> b!568276 (= e!326993 (Found!5557 (index!24457 lt!258890)))))

(declare-fun d!84427 () Bool)

(declare-fun lt!258889 () SeekEntryResult!5557)

(assert (=> d!84427 (and (or (is-Undefined!5557 lt!258889) (not (is-Found!5557 lt!258889)) (and (bvsge (index!24456 lt!258889) #b00000000000000000000000000000000) (bvslt (index!24456 lt!258889) (size!17472 a!3118)))) (or (is-Undefined!5557 lt!258889) (is-Found!5557 lt!258889) (not (is-MissingZero!5557 lt!258889)) (and (bvsge (index!24455 lt!258889) #b00000000000000000000000000000000) (bvslt (index!24455 lt!258889) (size!17472 a!3118)))) (or (is-Undefined!5557 lt!258889) (is-Found!5557 lt!258889) (is-MissingZero!5557 lt!258889) (not (is-MissingVacant!5557 lt!258889)) (and (bvsge (index!24458 lt!258889) #b00000000000000000000000000000000) (bvslt (index!24458 lt!258889) (size!17472 a!3118)))) (or (is-Undefined!5557 lt!258889) (ite (is-Found!5557 lt!258889) (= (select (arr!17108 a!3118) (index!24456 lt!258889)) k!1914) (ite (is-MissingZero!5557 lt!258889) (= (select (arr!17108 a!3118) (index!24455 lt!258889)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5557 lt!258889) (= (select (arr!17108 a!3118) (index!24458 lt!258889)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84427 (= lt!258889 e!326994)))

(declare-fun c!65229 () Bool)

(assert (=> d!84427 (= c!65229 (and (is-Intermediate!5557 lt!258890) (undefined!6369 lt!258890)))))

(assert (=> d!84427 (= lt!258890 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1914 mask!3119) k!1914 a!3118 mask!3119))))

(assert (=> d!84427 (validMask!0 mask!3119)))

(assert (=> d!84427 (= (seekEntryOrOpen!0 k!1914 a!3118 mask!3119) lt!258889)))

(declare-fun b!568277 () Bool)

(assert (=> b!568277 (= e!326995 (MissingZero!5557 (index!24457 lt!258890)))))

(declare-fun b!568278 () Bool)

(assert (=> b!568278 (= e!326994 Undefined!5557)))

(declare-fun b!568279 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35627 (_ BitVec 32)) SeekEntryResult!5557)

(assert (=> b!568279 (= e!326995 (seekKeyOrZeroReturnVacant!0 (x!53324 lt!258890) (index!24457 lt!258890) (index!24457 lt!258890) k!1914 a!3118 mask!3119))))

(assert (= (and d!84427 c!65229) b!568278))

(assert (= (and d!84427 (not c!65229)) b!568275))

(assert (= (and b!568275 c!65230) b!568276))

(assert (= (and b!568275 (not c!65230)) b!568274))

(assert (= (and b!568274 c!65228) b!568277))

(assert (= (and b!568274 (not c!65228)) b!568279))

(declare-fun m!546827 () Bool)

(assert (=> b!568275 m!546827))

(declare-fun m!546829 () Bool)

(assert (=> d!84427 m!546829))

(declare-fun m!546831 () Bool)

(assert (=> d!84427 m!546831))

(assert (=> d!84427 m!546669))

(declare-fun m!546833 () Bool)

(assert (=> d!84427 m!546833))

(declare-fun m!546835 () Bool)

(assert (=> d!84427 m!546835))

(assert (=> d!84427 m!546833))

(declare-fun m!546837 () Bool)

(assert (=> d!84427 m!546837))

(declare-fun m!546839 () Bool)

(assert (=> b!568279 m!546839))

(assert (=> b!568059 d!84427))

(declare-fun b!568288 () Bool)

(declare-fun e!327004 () Bool)

(declare-fun e!327003 () Bool)

(assert (=> b!568288 (= e!327004 e!327003)))

(declare-fun lt!258899 () (_ BitVec 64))

(assert (=> b!568288 (= lt!258899 (select (arr!17108 a!3118) #b00000000000000000000000000000000))))

(declare-fun lt!258900 () Unit!17816)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!35627 (_ BitVec 64) (_ BitVec 32)) Unit!17816)

(assert (=> b!568288 (= lt!258900 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258899 #b00000000000000000000000000000000))))

(assert (=> b!568288 (arrayContainsKey!0 a!3118 lt!258899 #b00000000000000000000000000000000)))

(declare-fun lt!258898 () Unit!17816)

(assert (=> b!568288 (= lt!258898 lt!258900)))

(declare-fun res!358529 () Bool)

(assert (=> b!568288 (= res!358529 (= (seekEntryOrOpen!0 (select (arr!17108 a!3118) #b00000000000000000000000000000000) a!3118 mask!3119) (Found!5557 #b00000000000000000000000000000000)))))

(assert (=> b!568288 (=> (not res!358529) (not e!327003))))

(declare-fun b!568289 () Bool)

(declare-fun call!32557 () Bool)

(assert (=> b!568289 (= e!327003 call!32557)))

(declare-fun b!568290 () Bool)

(declare-fun e!327002 () Bool)

(assert (=> b!568290 (= e!327002 e!327004)))

(declare-fun c!65233 () Bool)

(assert (=> b!568290 (= c!65233 (validKeyInArray!0 (select (arr!17108 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568291 () Bool)

(assert (=> b!568291 (= e!327004 call!32557)))

(declare-fun d!84453 () Bool)

(declare-fun res!358528 () Bool)

(assert (=> d!84453 (=> res!358528 e!327002)))

(assert (=> d!84453 (= res!358528 (bvsge #b00000000000000000000000000000000 (size!17472 a!3118)))))

(assert (=> d!84453 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119) e!327002)))

(declare-fun bm!32554 () Bool)

(assert (=> bm!32554 (= call!32557 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84453 (not res!358528)) b!568290))

(assert (= (and b!568290 c!65233) b!568288))

(assert (= (and b!568290 (not c!65233)) b!568291))

(assert (= (and b!568288 res!358529) b!568289))

(assert (= (or b!568289 b!568291) bm!32554))

(assert (=> b!568288 m!546777))

(declare-fun m!546841 () Bool)

(assert (=> b!568288 m!546841))

(declare-fun m!546843 () Bool)

(assert (=> b!568288 m!546843))

(assert (=> b!568288 m!546777))

(declare-fun m!546845 () Bool)

(assert (=> b!568288 m!546845))

(assert (=> b!568290 m!546777))

(assert (=> b!568290 m!546777))

(declare-fun m!546847 () Bool)

(assert (=> b!568290 m!546847))

(declare-fun m!546849 () Bool)

(assert (=> bm!32554 m!546849))

(assert (=> b!568060 d!84453))

(declare-fun b!568292 () Bool)

(declare-fun e!327007 () Bool)

(declare-fun e!327006 () Bool)

(assert (=> b!568292 (= e!327007 e!327006)))

(declare-fun lt!258902 () (_ BitVec 64))

(assert (=> b!568292 (= lt!258902 (select (arr!17108 a!3118) j!142))))

(declare-fun lt!258903 () Unit!17816)

(assert (=> b!568292 (= lt!258903 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3118 lt!258902 j!142))))

(assert (=> b!568292 (arrayContainsKey!0 a!3118 lt!258902 #b00000000000000000000000000000000)))

(declare-fun lt!258901 () Unit!17816)

(assert (=> b!568292 (= lt!258901 lt!258903)))

(declare-fun res!358531 () Bool)

(assert (=> b!568292 (= res!358531 (= (seekEntryOrOpen!0 (select (arr!17108 a!3118) j!142) a!3118 mask!3119) (Found!5557 j!142)))))

(assert (=> b!568292 (=> (not res!358531) (not e!327006))))

(declare-fun b!568293 () Bool)

(declare-fun call!32558 () Bool)

(assert (=> b!568293 (= e!327006 call!32558)))

(declare-fun b!568294 () Bool)

(declare-fun e!327005 () Bool)

(assert (=> b!568294 (= e!327005 e!327007)))

(declare-fun c!65234 () Bool)

(assert (=> b!568294 (= c!65234 (validKeyInArray!0 (select (arr!17108 a!3118) j!142)))))

(declare-fun b!568295 () Bool)

(assert (=> b!568295 (= e!327007 call!32558)))

(declare-fun d!84457 () Bool)

(declare-fun res!358530 () Bool)

(assert (=> d!84457 (=> res!358530 e!327005)))

(assert (=> d!84457 (= res!358530 (bvsge j!142 (size!17472 a!3118)))))

(assert (=> d!84457 (= (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119) e!327005)))

(declare-fun bm!32555 () Bool)

(assert (=> bm!32555 (= call!32558 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!142 #b00000000000000000000000000000001) a!3118 mask!3119))))

(assert (= (and d!84457 (not res!358530)) b!568294))

(assert (= (and b!568294 c!65234) b!568292))

(assert (= (and b!568294 (not c!65234)) b!568295))

(assert (= (and b!568292 res!358531) b!568293))

(assert (= (or b!568293 b!568295) bm!32555))

(assert (=> b!568292 m!546653))

(declare-fun m!546851 () Bool)

(assert (=> b!568292 m!546851))

(declare-fun m!546853 () Bool)

(assert (=> b!568292 m!546853))

(assert (=> b!568292 m!546653))

(assert (=> b!568292 m!546675))

(assert (=> b!568294 m!546653))

(assert (=> b!568294 m!546653))

(assert (=> b!568294 m!546673))

(declare-fun m!546855 () Bool)

(assert (=> bm!32555 m!546855))

(assert (=> b!568055 d!84457))

(declare-fun d!84459 () Bool)

(assert (=> d!84459 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119)))

(declare-fun lt!258910 () Unit!17816)

(declare-fun choose!38 (array!35627 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17816)

(assert (=> d!84459 (= lt!258910 (choose!38 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(assert (=> d!84459 (validMask!0 mask!3119)))

(assert (=> d!84459 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142) lt!258910)))

(declare-fun bs!17631 () Bool)

(assert (= bs!17631 d!84459))

(assert (=> bs!17631 m!546683))

(declare-fun m!546857 () Bool)

(assert (=> bs!17631 m!546857))

(assert (=> bs!17631 m!546669))

(assert (=> b!568055 d!84459))

(declare-fun d!84461 () Bool)

(assert (=> d!84461 (= (validMask!0 mask!3119) (and (or (= mask!3119 #b00000000000000000000000000000111) (= mask!3119 #b00000000000000000000000000001111) (= mask!3119 #b00000000000000000000000000011111) (= mask!3119 #b00000000000000000000000000111111) (= mask!3119 #b00000000000000000000000001111111) (= mask!3119 #b00000000000000000000000011111111) (= mask!3119 #b00000000000000000000000111111111) (= mask!3119 #b00000000000000000000001111111111) (= mask!3119 #b00000000000000000000011111111111) (= mask!3119 #b00000000000000000000111111111111) (= mask!3119 #b00000000000000000001111111111111) (= mask!3119 #b00000000000000000011111111111111) (= mask!3119 #b00000000000000000111111111111111) (= mask!3119 #b00000000000000001111111111111111) (= mask!3119 #b00000000000000011111111111111111) (= mask!3119 #b00000000000000111111111111111111) (= mask!3119 #b00000000000001111111111111111111) (= mask!3119 #b00000000000011111111111111111111) (= mask!3119 #b00000000000111111111111111111111) (= mask!3119 #b00000000001111111111111111111111) (= mask!3119 #b00000000011111111111111111111111) (= mask!3119 #b00000000111111111111111111111111) (= mask!3119 #b00000001111111111111111111111111) (= mask!3119 #b00000011111111111111111111111111) (= mask!3119 #b00000111111111111111111111111111) (= mask!3119 #b00001111111111111111111111111111) (= mask!3119 #b00011111111111111111111111111111) (= mask!3119 #b00111111111111111111111111111111)) (bvsle mask!3119 #b00111111111111111111111111111111)))))

(assert (=> start!51990 d!84461))

(declare-fun d!84467 () Bool)

(assert (=> d!84467 (= (array_inv!12904 a!3118) (bvsge (size!17472 a!3118) #b00000000000000000000000000000000))))

(assert (=> start!51990 d!84467))

(declare-fun b!568332 () Bool)

(declare-fun c!65247 () Bool)

(declare-fun lt!258917 () (_ BitVec 64))

(assert (=> b!568332 (= c!65247 (= lt!258917 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!327028 () SeekEntryResult!5557)

(declare-fun e!327030 () SeekEntryResult!5557)

(assert (=> b!568332 (= e!327028 e!327030)))

(declare-fun b!568333 () Bool)

(declare-fun e!327029 () SeekEntryResult!5557)

(assert (=> b!568333 (= e!327029 e!327028)))

(declare-fun lt!258916 () SeekEntryResult!5557)

(assert (=> b!568333 (= lt!258917 (select (arr!17108 a!3118) (index!24457 lt!258916)))))

(declare-fun c!65249 () Bool)

(assert (=> b!568333 (= c!65249 (= lt!258917 (select (arr!17108 a!3118) j!142)))))

(declare-fun b!568334 () Bool)

(assert (=> b!568334 (= e!327028 (Found!5557 (index!24457 lt!258916)))))

(declare-fun d!84469 () Bool)

(declare-fun lt!258915 () SeekEntryResult!5557)

(assert (=> d!84469 (and (or (is-Undefined!5557 lt!258915) (not (is-Found!5557 lt!258915)) (and (bvsge (index!24456 lt!258915) #b00000000000000000000000000000000) (bvslt (index!24456 lt!258915) (size!17472 a!3118)))) (or (is-Undefined!5557 lt!258915) (is-Found!5557 lt!258915) (not (is-MissingZero!5557 lt!258915)) (and (bvsge (index!24455 lt!258915) #b00000000000000000000000000000000) (bvslt (index!24455 lt!258915) (size!17472 a!3118)))) (or (is-Undefined!5557 lt!258915) (is-Found!5557 lt!258915) (is-MissingZero!5557 lt!258915) (not (is-MissingVacant!5557 lt!258915)) (and (bvsge (index!24458 lt!258915) #b00000000000000000000000000000000) (bvslt (index!24458 lt!258915) (size!17472 a!3118)))) (or (is-Undefined!5557 lt!258915) (ite (is-Found!5557 lt!258915) (= (select (arr!17108 a!3118) (index!24456 lt!258915)) (select (arr!17108 a!3118) j!142)) (ite (is-MissingZero!5557 lt!258915) (= (select (arr!17108 a!3118) (index!24455 lt!258915)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5557 lt!258915) (= (select (arr!17108 a!3118) (index!24458 lt!258915)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!84469 (= lt!258915 e!327029)))

(declare-fun c!65248 () Bool)

(assert (=> d!84469 (= c!65248 (and (is-Intermediate!5557 lt!258916) (undefined!6369 lt!258916)))))

(assert (=> d!84469 (= lt!258916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!17108 a!3118) j!142) mask!3119) (select (arr!17108 a!3118) j!142) a!3118 mask!3119))))

(assert (=> d!84469 (validMask!0 mask!3119)))

(assert (=> d!84469 (= (seekEntryOrOpen!0 (select (arr!17108 a!3118) j!142) a!3118 mask!3119) lt!258915)))

(declare-fun b!568335 () Bool)

(assert (=> b!568335 (= e!327030 (MissingZero!5557 (index!24457 lt!258916)))))

(declare-fun b!568336 () Bool)

(assert (=> b!568336 (= e!327029 Undefined!5557)))

(declare-fun b!568337 () Bool)

(assert (=> b!568337 (= e!327030 (seekKeyOrZeroReturnVacant!0 (x!53324 lt!258916) (index!24457 lt!258916) (index!24457 lt!258916) (select (arr!17108 a!3118) j!142) a!3118 mask!3119))))

(assert (= (and d!84469 c!65248) b!568336))

(assert (= (and d!84469 (not c!65248)) b!568333))

(assert (= (and b!568333 c!65249) b!568334))

(assert (= (and b!568333 (not c!65249)) b!568332))

(assert (= (and b!568332 c!65247) b!568335))

(assert (= (and b!568332 (not c!65247)) b!568337))

(declare-fun m!546875 () Bool)

(assert (=> b!568333 m!546875))

(declare-fun m!546877 () Bool)

(assert (=> d!84469 m!546877))

(declare-fun m!546879 () Bool)

(assert (=> d!84469 m!546879))

(assert (=> d!84469 m!546669))

(assert (=> d!84469 m!546653))

(assert (=> d!84469 m!546655))

(declare-fun m!546881 () Bool)

(assert (=> d!84469 m!546881))

(assert (=> d!84469 m!546655))

(assert (=> d!84469 m!546653))

(declare-fun m!546883 () Bool)

(assert (=> d!84469 m!546883))

(assert (=> b!568337 m!546653))

(declare-fun m!546885 () Bool)

(assert (=> b!568337 m!546885))

(assert (=> b!568056 d!84469))

(declare-fun d!84471 () Bool)

(assert (=> d!84471 (= (validKeyInArray!0 (select (arr!17108 a!3118) j!142)) (and (not (= (select (arr!17108 a!3118) j!142) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!17108 a!3118) j!142) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568052 d!84471))

(declare-fun b!568348 () Bool)

(declare-fun e!327041 () Bool)

(declare-fun e!327042 () Bool)

(assert (=> b!568348 (= e!327041 e!327042)))

(declare-fun c!65252 () Bool)

(assert (=> b!568348 (= c!65252 (validKeyInArray!0 (select (arr!17108 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568349 () Bool)

(declare-fun call!32561 () Bool)

(assert (=> b!568349 (= e!327042 call!32561)))

(declare-fun b!568350 () Bool)

(declare-fun e!327040 () Bool)

(declare-fun contains!2875 (List!11188 (_ BitVec 64)) Bool)

(assert (=> b!568350 (= e!327040 (contains!2875 Nil!11185 (select (arr!17108 a!3118) #b00000000000000000000000000000000)))))

(declare-fun d!84473 () Bool)

(declare-fun res!358552 () Bool)

(declare-fun e!327039 () Bool)

(assert (=> d!84473 (=> res!358552 e!327039)))

(assert (=> d!84473 (= res!358552 (bvsge #b00000000000000000000000000000000 (size!17472 a!3118)))))

(assert (=> d!84473 (= (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11185) e!327039)))

(declare-fun b!568351 () Bool)

(assert (=> b!568351 (= e!327039 e!327041)))

(declare-fun res!358553 () Bool)

(assert (=> b!568351 (=> (not res!358553) (not e!327041))))

(assert (=> b!568351 (= res!358553 (not e!327040))))

(declare-fun res!358551 () Bool)

(assert (=> b!568351 (=> (not res!358551) (not e!327040))))

(assert (=> b!568351 (= res!358551 (validKeyInArray!0 (select (arr!17108 a!3118) #b00000000000000000000000000000000)))))

(declare-fun b!568352 () Bool)

(assert (=> b!568352 (= e!327042 call!32561)))

(declare-fun bm!32558 () Bool)

(assert (=> bm!32558 (= call!32561 (arrayNoDuplicates!0 a!3118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!65252 (Cons!11184 (select (arr!17108 a!3118) #b00000000000000000000000000000000) Nil!11185) Nil!11185)))))

(assert (= (and d!84473 (not res!358552)) b!568351))

(assert (= (and b!568351 res!358551) b!568350))

(assert (= (and b!568351 res!358553) b!568348))

(assert (= (and b!568348 c!65252) b!568349))

(assert (= (and b!568348 (not c!65252)) b!568352))

(assert (= (or b!568349 b!568352) bm!32558))

(assert (=> b!568348 m!546777))

(assert (=> b!568348 m!546777))

(assert (=> b!568348 m!546847))

(assert (=> b!568350 m!546777))

(assert (=> b!568350 m!546777))

(declare-fun m!546887 () Bool)

(assert (=> b!568350 m!546887))

(assert (=> b!568351 m!546777))

(assert (=> b!568351 m!546777))

(assert (=> b!568351 m!546847))

(assert (=> bm!32558 m!546777))

(declare-fun m!546889 () Bool)

(assert (=> bm!32558 m!546889))

(assert (=> b!568057 d!84473))

(declare-fun d!84477 () Bool)

(assert (=> d!84477 (= (validKeyInArray!0 k!1914) (and (not (= k!1914 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1914 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!568058 d!84477))

(push 1)

