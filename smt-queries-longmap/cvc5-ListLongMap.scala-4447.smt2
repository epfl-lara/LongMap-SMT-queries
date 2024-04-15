; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61776 () Bool)

(assert start!61776)

(declare-fun b!691436 () Bool)

(declare-fun res!455926 () Bool)

(declare-fun e!393428 () Bool)

(assert (=> b!691436 (=> (not res!455926) (not e!393428))))

(declare-datatypes ((array!39808 0))(
  ( (array!39809 (arr!19072 (Array (_ BitVec 32) (_ BitVec 64))) (size!19454 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39808)

(declare-datatypes ((List!13152 0))(
  ( (Nil!13149) (Cons!13148 (h!14193 (_ BitVec 64)) (t!19410 List!13152)) )
))
(declare-fun arrayNoDuplicates!0 (array!39808 (_ BitVec 32) List!13152) Bool)

(assert (=> b!691436 (= res!455926 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!13149))))

(declare-fun b!691437 () Bool)

(assert (=> b!691437 (= e!393428 false)))

(declare-datatypes ((Unit!24388 0))(
  ( (Unit!24389) )
))
(declare-fun lt!316245 () Unit!24388)

(declare-fun e!393426 () Unit!24388)

(assert (=> b!691437 (= lt!316245 e!393426)))

(declare-fun c!78123 () Bool)

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!691437 (= c!78123 (= (select (arr!19072 a!3626) from!3004) k!2843))))

(declare-fun b!691438 () Bool)

(declare-fun e!393427 () Bool)

(declare-fun e!393425 () Bool)

(assert (=> b!691438 (= e!393427 e!393425)))

(declare-fun res!455931 () Bool)

(assert (=> b!691438 (=> (not res!455931) (not e!393425))))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!691438 (= res!455931 (bvsle from!3004 i!1382))))

(declare-fun res!455938 () Bool)

(assert (=> start!61776 (=> (not res!455938) (not e!393428))))

(assert (=> start!61776 (= res!455938 (and (bvslt (size!19454 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19454 a!3626))))))

(assert (=> start!61776 e!393428))

(assert (=> start!61776 true))

(declare-fun array_inv!14955 (array!39808) Bool)

(assert (=> start!61776 (array_inv!14955 a!3626)))

(declare-fun b!691439 () Bool)

(declare-fun res!455930 () Bool)

(assert (=> b!691439 (=> (not res!455930) (not e!393428))))

(declare-fun arrayContainsKey!0 (array!39808 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!691439 (= res!455930 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!691440 () Bool)

(declare-fun e!393424 () Bool)

(declare-fun acc!681 () List!13152)

(declare-fun contains!3674 (List!13152 (_ BitVec 64)) Bool)

(assert (=> b!691440 (= e!393424 (contains!3674 acc!681 k!2843))))

(declare-fun b!691441 () Bool)

(declare-fun res!455927 () Bool)

(assert (=> b!691441 (=> (not res!455927) (not e!393428))))

(assert (=> b!691441 (= res!455927 e!393427)))

(declare-fun res!455924 () Bool)

(assert (=> b!691441 (=> res!455924 e!393427)))

(assert (=> b!691441 (= res!455924 e!393424)))

(declare-fun res!455933 () Bool)

(assert (=> b!691441 (=> (not res!455933) (not e!393424))))

(assert (=> b!691441 (= res!455933 (bvsgt from!3004 i!1382))))

(declare-fun b!691442 () Bool)

(declare-fun res!455936 () Bool)

(assert (=> b!691442 (=> (not res!455936) (not e!393428))))

(assert (=> b!691442 (= res!455936 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!691443 () Bool)

(declare-fun res!455932 () Bool)

(assert (=> b!691443 (=> (not res!455932) (not e!393428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!691443 (= res!455932 (validKeyInArray!0 k!2843))))

(declare-fun b!691444 () Bool)

(declare-fun res!455929 () Bool)

(assert (=> b!691444 (=> (not res!455929) (not e!393428))))

(assert (=> b!691444 (= res!455929 (not (contains!3674 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691445 () Bool)

(declare-fun res!455928 () Bool)

(assert (=> b!691445 (=> (not res!455928) (not e!393428))))

(assert (=> b!691445 (= res!455928 (validKeyInArray!0 (select (arr!19072 a!3626) from!3004)))))

(declare-fun b!691446 () Bool)

(declare-fun res!455925 () Bool)

(assert (=> b!691446 (=> (not res!455925) (not e!393428))))

(declare-fun noDuplicate!943 (List!13152) Bool)

(assert (=> b!691446 (= res!455925 (noDuplicate!943 acc!681))))

(declare-fun b!691447 () Bool)

(declare-fun Unit!24390 () Unit!24388)

(assert (=> b!691447 (= e!393426 Unit!24390)))

(declare-fun b!691448 () Bool)

(declare-fun Unit!24391 () Unit!24388)

(assert (=> b!691448 (= e!393426 Unit!24391)))

(assert (=> b!691448 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(declare-fun lt!316244 () Unit!24388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!39808 (_ BitVec 64) (_ BitVec 32)) Unit!24388)

(assert (=> b!691448 (= lt!316244 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3626 k!2843 from!3004))))

(assert (=> b!691448 false))

(declare-fun b!691449 () Bool)

(declare-fun res!455935 () Bool)

(assert (=> b!691449 (=> (not res!455935) (not e!393428))))

(assert (=> b!691449 (= res!455935 (not (contains!3674 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!691450 () Bool)

(declare-fun res!455937 () Bool)

(assert (=> b!691450 (=> (not res!455937) (not e!393428))))

(assert (=> b!691450 (= res!455937 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19454 a!3626))))))

(declare-fun b!691451 () Bool)

(assert (=> b!691451 (= e!393425 (not (contains!3674 acc!681 k!2843)))))

(declare-fun b!691452 () Bool)

(declare-fun res!455934 () Bool)

(assert (=> b!691452 (=> (not res!455934) (not e!393428))))

(assert (=> b!691452 (= res!455934 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19454 a!3626)) (not (= from!3004 i!1382))))))

(assert (= (and start!61776 res!455938) b!691446))

(assert (= (and b!691446 res!455925) b!691444))

(assert (= (and b!691444 res!455929) b!691449))

(assert (= (and b!691449 res!455935) b!691441))

(assert (= (and b!691441 res!455933) b!691440))

(assert (= (and b!691441 (not res!455924)) b!691438))

(assert (= (and b!691438 res!455931) b!691451))

(assert (= (and b!691441 res!455927) b!691436))

(assert (= (and b!691436 res!455926) b!691442))

(assert (= (and b!691442 res!455936) b!691450))

(assert (= (and b!691450 res!455937) b!691443))

(assert (= (and b!691443 res!455932) b!691439))

(assert (= (and b!691439 res!455930) b!691452))

(assert (= (and b!691452 res!455934) b!691445))

(assert (= (and b!691445 res!455928) b!691437))

(assert (= (and b!691437 c!78123) b!691448))

(assert (= (and b!691437 (not c!78123)) b!691447))

(declare-fun m!653833 () Bool)

(assert (=> b!691449 m!653833))

(declare-fun m!653835 () Bool)

(assert (=> b!691451 m!653835))

(declare-fun m!653837 () Bool)

(assert (=> b!691446 m!653837))

(declare-fun m!653839 () Bool)

(assert (=> start!61776 m!653839))

(declare-fun m!653841 () Bool)

(assert (=> b!691444 m!653841))

(declare-fun m!653843 () Bool)

(assert (=> b!691436 m!653843))

(assert (=> b!691440 m!653835))

(declare-fun m!653845 () Bool)

(assert (=> b!691439 m!653845))

(declare-fun m!653847 () Bool)

(assert (=> b!691437 m!653847))

(assert (=> b!691445 m!653847))

(assert (=> b!691445 m!653847))

(declare-fun m!653849 () Bool)

(assert (=> b!691445 m!653849))

(declare-fun m!653851 () Bool)

(assert (=> b!691443 m!653851))

(declare-fun m!653853 () Bool)

(assert (=> b!691442 m!653853))

(declare-fun m!653855 () Bool)

(assert (=> b!691448 m!653855))

(declare-fun m!653857 () Bool)

(assert (=> b!691448 m!653857))

(push 1)

(assert (not b!691442))

(assert (not b!691445))

(assert (not b!691439))

(assert (not b!691444))

(assert (not b!691436))

(assert (not b!691448))

(assert (not b!691451))

(assert (not b!691443))

(assert (not b!691446))

(assert (not start!61776))

(assert (not b!691449))

(assert (not b!691440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

