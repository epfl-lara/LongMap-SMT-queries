; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61804 () Bool)

(assert start!61804)

(declare-fun b!690922 () Bool)

(declare-fun res!455203 () Bool)

(declare-fun e!393415 () Bool)

(assert (=> b!690922 (=> (not res!455203) (not e!393415))))

(declare-datatypes ((List!12995 0))(
  ( (Nil!12992) (Cons!12991 (h!14039 (_ BitVec 64)) (t!19254 List!12995)) )
))
(declare-fun acc!681 () List!12995)

(declare-fun noDuplicate!921 (List!12995) Bool)

(assert (=> b!690922 (= res!455203 (noDuplicate!921 acc!681))))

(declare-fun b!690923 () Bool)

(declare-fun res!455196 () Bool)

(assert (=> b!690923 (=> (not res!455196) (not e!393415))))

(declare-fun contains!3647 (List!12995 (_ BitVec 64)) Bool)

(assert (=> b!690923 (= res!455196 (not (contains!3647 acc!681 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690924 () Bool)

(declare-fun e!393417 () Bool)

(declare-fun e!393413 () Bool)

(assert (=> b!690924 (= e!393417 e!393413)))

(declare-fun res!455192 () Bool)

(assert (=> b!690924 (=> (not res!455192) (not e!393413))))

(declare-fun from!3004 () (_ BitVec 32))

(declare-fun i!1382 () (_ BitVec 32))

(assert (=> b!690924 (= res!455192 (bvsle from!3004 i!1382))))

(declare-fun b!690925 () Bool)

(declare-fun res!455202 () Bool)

(assert (=> b!690925 (=> (not res!455202) (not e!393415))))

(declare-datatypes ((array!39763 0))(
  ( (array!39764 (arr!19047 (Array (_ BitVec 32) (_ BitVec 64))) (size!19430 (_ BitVec 32))) )
))
(declare-fun a!3626 () array!39763)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!690925 (= res!455202 (validKeyInArray!0 (select (arr!19047 a!3626) from!3004)))))

(declare-fun b!690926 () Bool)

(declare-fun e!393416 () Bool)

(declare-fun k!2843 () (_ BitVec 64))

(assert (=> b!690926 (= e!393416 (contains!3647 acc!681 k!2843))))

(declare-fun res!455204 () Bool)

(assert (=> start!61804 (=> (not res!455204) (not e!393415))))

(assert (=> start!61804 (= res!455204 (and (bvslt (size!19430 a!3626) #b01111111111111111111111111111111) (bvsge from!3004 #b00000000000000000000000000000000) (bvslt from!3004 (size!19430 a!3626))))))

(assert (=> start!61804 e!393415))

(assert (=> start!61804 true))

(declare-fun array_inv!14906 (array!39763) Bool)

(assert (=> start!61804 (array_inv!14906 a!3626)))

(declare-fun b!690927 () Bool)

(declare-fun res!455197 () Bool)

(assert (=> b!690927 (=> (not res!455197) (not e!393415))))

(declare-fun arrayContainsKey!0 (array!39763 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!690927 (= res!455197 (not (arrayContainsKey!0 a!3626 k!2843 #b00000000000000000000000000000000)))))

(declare-fun b!690928 () Bool)

(declare-fun res!455198 () Bool)

(assert (=> b!690928 (=> (not res!455198) (not e!393415))))

(assert (=> b!690928 (= res!455198 (and (bvsge i!1382 #b00000000000000000000000000000000) (bvslt i!1382 (size!19430 a!3626))))))

(declare-fun b!690929 () Bool)

(declare-fun res!455193 () Bool)

(assert (=> b!690929 (=> (not res!455193) (not e!393415))))

(assert (=> b!690929 (= res!455193 (not (contains!3647 acc!681 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!690930 () Bool)

(assert (=> b!690930 (= e!393413 (not (contains!3647 acc!681 k!2843)))))

(declare-fun b!690931 () Bool)

(declare-fun res!455194 () Bool)

(assert (=> b!690931 (=> (not res!455194) (not e!393415))))

(assert (=> b!690931 (= res!455194 (= (select (arr!19047 a!3626) from!3004) k!2843))))

(declare-fun b!690932 () Bool)

(declare-fun res!455191 () Bool)

(assert (=> b!690932 (=> (not res!455191) (not e!393415))))

(declare-fun arrayNoDuplicates!0 (array!39763 (_ BitVec 32) List!12995) Bool)

(assert (=> b!690932 (= res!455191 (arrayNoDuplicates!0 a!3626 from!3004 acc!681))))

(declare-fun b!690933 () Bool)

(declare-fun res!455206 () Bool)

(assert (=> b!690933 (=> (not res!455206) (not e!393415))))

(assert (=> b!690933 (= res!455206 (and (bvslt (bvadd #b00000000000000000000000000000001 from!3004) (size!19430 a!3626)) (not (= from!3004 i!1382))))))

(declare-fun b!690934 () Bool)

(declare-fun res!455199 () Bool)

(assert (=> b!690934 (=> (not res!455199) (not e!393415))))

(assert (=> b!690934 (= res!455199 (validKeyInArray!0 k!2843))))

(declare-fun b!690935 () Bool)

(declare-fun res!455201 () Bool)

(assert (=> b!690935 (=> (not res!455201) (not e!393415))))

(assert (=> b!690935 (= res!455201 e!393417)))

(declare-fun res!455195 () Bool)

(assert (=> b!690935 (=> res!455195 e!393417)))

(assert (=> b!690935 (= res!455195 e!393416)))

(declare-fun res!455200 () Bool)

(assert (=> b!690935 (=> (not res!455200) (not e!393416))))

(assert (=> b!690935 (= res!455200 (bvsgt from!3004 i!1382))))

(declare-fun b!690936 () Bool)

(declare-fun res!455205 () Bool)

(assert (=> b!690936 (=> (not res!455205) (not e!393415))))

(assert (=> b!690936 (= res!455205 (arrayNoDuplicates!0 a!3626 #b00000000000000000000000000000000 Nil!12992))))

(declare-fun b!690937 () Bool)

(assert (=> b!690937 (= e!393415 (not true))))

(assert (=> b!690937 (arrayContainsKey!0 a!3626 k!2843 from!3004)))

(assert (= (and start!61804 res!455204) b!690922))

(assert (= (and b!690922 res!455203) b!690923))

(assert (= (and b!690923 res!455196) b!690929))

(assert (= (and b!690929 res!455193) b!690935))

(assert (= (and b!690935 res!455200) b!690926))

(assert (= (and b!690935 (not res!455195)) b!690924))

(assert (= (and b!690924 res!455192) b!690930))

(assert (= (and b!690935 res!455201) b!690936))

(assert (= (and b!690936 res!455205) b!690932))

(assert (= (and b!690932 res!455191) b!690928))

(assert (= (and b!690928 res!455198) b!690934))

(assert (= (and b!690934 res!455199) b!690927))

(assert (= (and b!690927 res!455197) b!690933))

(assert (= (and b!690933 res!455206) b!690925))

(assert (= (and b!690925 res!455202) b!690931))

(assert (= (and b!690931 res!455194) b!690937))

(declare-fun m!654787 () Bool)

(assert (=> b!690934 m!654787))

(declare-fun m!654789 () Bool)

(assert (=> b!690932 m!654789))

(declare-fun m!654791 () Bool)

(assert (=> b!690923 m!654791))

(declare-fun m!654793 () Bool)

(assert (=> start!61804 m!654793))

(declare-fun m!654795 () Bool)

(assert (=> b!690922 m!654795))

(declare-fun m!654797 () Bool)

(assert (=> b!690929 m!654797))

(declare-fun m!654799 () Bool)

(assert (=> b!690936 m!654799))

(declare-fun m!654801 () Bool)

(assert (=> b!690937 m!654801))

(declare-fun m!654803 () Bool)

(assert (=> b!690931 m!654803))

(declare-fun m!654805 () Bool)

(assert (=> b!690930 m!654805))

(assert (=> b!690926 m!654805))

(declare-fun m!654807 () Bool)

(assert (=> b!690927 m!654807))

(assert (=> b!690925 m!654803))

(assert (=> b!690925 m!654803))

(declare-fun m!654809 () Bool)

(assert (=> b!690925 m!654809))

(push 1)

(assert (not b!690923))

(assert (not b!690925))

(assert (not b!690922))

(assert (not b!690930))

(assert (not b!690937))

(assert (not b!690927))

(assert (not b!690936))

(assert (not b!690926))

(assert (not b!690934))

(assert (not start!61804))

(assert (not b!690929))

(assert (not b!690932))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

