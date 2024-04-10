; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!25552 () Bool)

(assert start!25552)

(declare-fun b!265383 () Bool)

(declare-fun res!129754 () Bool)

(declare-fun e!171857 () Bool)

(assert (=> b!265383 (=> (not res!129754) (not e!171857))))

(declare-datatypes ((array!12776 0))(
  ( (array!12777 (arr!6044 (Array (_ BitVec 32) (_ BitVec 64))) (size!6396 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12776)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12776 (_ BitVec 32)) Bool)

(assert (=> b!265383 (= res!129754 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265384 () Bool)

(declare-fun res!129752 () Bool)

(declare-fun e!171859 () Bool)

(assert (=> b!265384 (=> (not res!129752) (not e!171859))))

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265384 (= res!129752 (and (= (size!6396 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6396 a!3436))))))

(declare-fun b!265385 () Bool)

(assert (=> b!265385 (= e!171859 e!171857)))

(declare-fun res!129753 () Bool)

(assert (=> b!265385 (=> (not res!129753) (not e!171857))))

(declare-datatypes ((SeekEntryResult!1235 0))(
  ( (MissingZero!1235 (index!7110 (_ BitVec 32))) (Found!1235 (index!7111 (_ BitVec 32))) (Intermediate!1235 (undefined!2047 Bool) (index!7112 (_ BitVec 32)) (x!25432 (_ BitVec 32))) (Undefined!1235) (MissingVacant!1235 (index!7113 (_ BitVec 32))) )
))
(declare-fun lt!134086 () SeekEntryResult!1235)

(assert (=> b!265385 (= res!129753 (or (= lt!134086 (MissingZero!1235 i!1355)) (= lt!134086 (MissingVacant!1235 i!1355))))))

(declare-fun k!2698 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12776 (_ BitVec 32)) SeekEntryResult!1235)

(assert (=> b!265385 (= lt!134086 (seekEntryOrOpen!0 k!2698 a!3436 mask!4002))))

(declare-fun res!129757 () Bool)

(assert (=> start!25552 (=> (not res!129757) (not e!171859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25552 (= res!129757 (validMask!0 mask!4002))))

(assert (=> start!25552 e!171859))

(assert (=> start!25552 true))

(declare-fun array_inv!4007 (array!12776) Bool)

(assert (=> start!25552 (array_inv!4007 a!3436)))

(declare-fun b!265386 () Bool)

(declare-fun res!129756 () Bool)

(assert (=> b!265386 (=> (not res!129756) (not e!171859))))

(declare-fun arrayContainsKey!0 (array!12776 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265386 (= res!129756 (not (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265387 () Bool)

(declare-fun e!171858 () Bool)

(declare-datatypes ((List!3858 0))(
  ( (Nil!3855) (Cons!3854 (h!4521 (_ BitVec 64)) (t!8940 List!3858)) )
))
(declare-fun contains!1919 (List!3858 (_ BitVec 64)) Bool)

(assert (=> b!265387 (= e!171858 (contains!1919 Nil!3855 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265388 () Bool)

(declare-fun res!129755 () Bool)

(assert (=> b!265388 (=> (not res!129755) (not e!171857))))

(assert (=> b!265388 (= res!129755 (and (bvsle #b00000000000000000000000000000000 (size!6396 a!3436)) (bvslt (size!6396 a!3436) #b01111111111111111111111111111111)))))

(declare-fun b!265389 () Bool)

(declare-fun res!129759 () Bool)

(assert (=> b!265389 (=> (not res!129759) (not e!171857))))

(declare-fun noDuplicate!107 (List!3858) Bool)

(assert (=> b!265389 (= res!129759 (noDuplicate!107 Nil!3855))))

(declare-fun b!265390 () Bool)

(declare-fun res!129751 () Bool)

(assert (=> b!265390 (=> (not res!129751) (not e!171859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265390 (= res!129751 (validKeyInArray!0 k!2698))))

(declare-fun b!265391 () Bool)

(assert (=> b!265391 (= e!171857 e!171858)))

(declare-fun res!129758 () Bool)

(assert (=> b!265391 (=> res!129758 e!171858)))

(assert (=> b!265391 (= res!129758 (contains!1919 Nil!3855 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!25552 res!129757) b!265384))

(assert (= (and b!265384 res!129752) b!265390))

(assert (= (and b!265390 res!129751) b!265386))

(assert (= (and b!265386 res!129756) b!265385))

(assert (= (and b!265385 res!129753) b!265383))

(assert (= (and b!265383 res!129754) b!265388))

(assert (= (and b!265388 res!129755) b!265389))

(assert (= (and b!265389 res!129759) b!265391))

(assert (= (and b!265391 (not res!129758)) b!265387))

(declare-fun m!282195 () Bool)

(assert (=> b!265386 m!282195))

(declare-fun m!282197 () Bool)

(assert (=> b!265390 m!282197))

(declare-fun m!282199 () Bool)

(assert (=> b!265391 m!282199))

(declare-fun m!282201 () Bool)

(assert (=> b!265389 m!282201))

(declare-fun m!282203 () Bool)

(assert (=> b!265385 m!282203))

(declare-fun m!282205 () Bool)

(assert (=> start!25552 m!282205))

(declare-fun m!282207 () Bool)

(assert (=> start!25552 m!282207))

(declare-fun m!282209 () Bool)

(assert (=> b!265387 m!282209))

(declare-fun m!282211 () Bool)

(assert (=> b!265383 m!282211))

(push 1)

(assert (not b!265386))

(assert (not b!265385))

(assert (not start!25552))

(assert (not b!265390))

(assert (not b!265389))

(assert (not b!265391))

(assert (not b!265387))

(assert (not b!265383))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!64187 () Bool)

(declare-fun lt!134095 () Bool)

(declare-fun content!178 (List!3858) (Set (_ BitVec 64)))

(assert (=> d!64187 (= lt!134095 (set.member #b1000000000000000000000000000000000000000000000000000000000000000 (content!178 Nil!3855)))))

(declare-fun e!171894 () Bool)

(assert (=> d!64187 (= lt!134095 e!171894)))

(declare-fun res!129822 () Bool)

(assert (=> d!64187 (=> (not res!129822) (not e!171894))))

(assert (=> d!64187 (= res!129822 (is-Cons!3854 Nil!3855))))

(assert (=> d!64187 (= (contains!1919 Nil!3855 #b1000000000000000000000000000000000000000000000000000000000000000) lt!134095)))

(declare-fun b!265454 () Bool)

(declare-fun e!171893 () Bool)

(assert (=> b!265454 (= e!171894 e!171893)))

(declare-fun res!129823 () Bool)

(assert (=> b!265454 (=> res!129823 e!171893)))

(assert (=> b!265454 (= res!129823 (= (h!4521 Nil!3855) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265455 () Bool)

(assert (=> b!265455 (= e!171893 (contains!1919 (t!8940 Nil!3855) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64187 res!129822) b!265454))

(assert (= (and b!265454 (not res!129823)) b!265455))

(declare-fun m!282249 () Bool)

(assert (=> d!64187 m!282249))

(declare-fun m!282251 () Bool)

(assert (=> d!64187 m!282251))

(declare-fun m!282255 () Bool)

(assert (=> b!265455 m!282255))

(assert (=> b!265387 d!64187))

(declare-fun b!265466 () Bool)

(declare-fun e!171905 () Bool)

(declare-fun e!171904 () Bool)

(assert (=> b!265466 (= e!171905 e!171904)))

(declare-fun lt!134103 () (_ BitVec 64))

(assert (=> b!265466 (= lt!134103 (select (arr!6044 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8263 0))(
  ( (Unit!8264) )
))
(declare-fun lt!134102 () Unit!8263)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12776 (_ BitVec 64) (_ BitVec 32)) Unit!8263)

(assert (=> b!265466 (= lt!134102 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!134103 #b00000000000000000000000000000000))))

(assert (=> b!265466 (arrayContainsKey!0 a!3436 lt!134103 #b00000000000000000000000000000000)))

(declare-fun lt!134104 () Unit!8263)

(assert (=> b!265466 (= lt!134104 lt!134102)))

(declare-fun res!129830 () Bool)

(assert (=> b!265466 (= res!129830 (= (seekEntryOrOpen!0 (select (arr!6044 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1235 #b00000000000000000000000000000000)))))

(assert (=> b!265466 (=> (not res!129830) (not e!171904))))

(declare-fun b!265467 () Bool)

(declare-fun call!25333 () Bool)

(assert (=> b!265467 (= e!171904 call!25333)))

(declare-fun bm!25330 () Bool)

(assert (=> bm!25330 (= call!25333 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun b!265468 () Bool)

(declare-fun e!171903 () Bool)

(assert (=> b!265468 (= e!171903 e!171905)))

(declare-fun c!45369 () Bool)

(assert (=> b!265468 (= c!45369 (validKeyInArray!0 (select (arr!6044 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265469 () Bool)

(assert (=> b!265469 (= e!171905 call!25333)))

(declare-fun d!64191 () Bool)

(declare-fun res!129831 () Bool)

(assert (=> d!64191 (=> res!129831 e!171903)))

(assert (=> d!64191 (= res!129831 (bvsge #b00000000000000000000000000000000 (size!6396 a!3436)))))

(assert (=> d!64191 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171903)))

(assert (= (and d!64191 (not res!129831)) b!265468))

(assert (= (and b!265468 c!45369) b!265466))

(assert (= (and b!265468 (not c!45369)) b!265469))

(assert (= (and b!265466 res!129830) b!265467))

(assert (= (or b!265467 b!265469) bm!25330))

(declare-fun m!282259 () Bool)

(assert (=> b!265466 m!282259))

(declare-fun m!282261 () Bool)

(assert (=> b!265466 m!282261))

(declare-fun m!282263 () Bool)

(assert (=> b!265466 m!282263))

(assert (=> b!265466 m!282259))

(declare-fun m!282265 () Bool)

(assert (=> b!265466 m!282265))

(declare-fun m!282267 () Bool)

(assert (=> bm!25330 m!282267))

(assert (=> b!265468 m!282259))

(assert (=> b!265468 m!282259))

(declare-fun m!282269 () Bool)

(assert (=> b!265468 m!282269))

(assert (=> b!265383 d!64191))

(declare-fun d!64197 () Bool)

(assert (=> d!64197 (= (validKeyInArray!0 k!2698) (and (not (= k!2698 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!2698 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!265390 d!64197))

(declare-fun d!64199 () Bool)

(declare-fun res!129836 () Bool)

(declare-fun e!171910 () Bool)

(assert (=> d!64199 (=> res!129836 e!171910)))

(assert (=> d!64199 (= res!129836 (is-Nil!3855 Nil!3855))))

(assert (=> d!64199 (= (noDuplicate!107 Nil!3855) e!171910)))

(declare-fun b!265474 () Bool)

(declare-fun e!171911 () Bool)

(assert (=> b!265474 (= e!171910 e!171911)))

(declare-fun res!129837 () Bool)

(assert (=> b!265474 (=> (not res!129837) (not e!171911))))

(assert (=> b!265474 (= res!129837 (not (contains!1919 (t!8940 Nil!3855) (h!4521 Nil!3855))))))

(declare-fun b!265475 () Bool)

(assert (=> b!265475 (= e!171911 (noDuplicate!107 (t!8940 Nil!3855)))))

(assert (= (and d!64199 (not res!129836)) b!265474))

(assert (= (and b!265474 res!129837) b!265475))

(declare-fun m!282271 () Bool)

(assert (=> b!265474 m!282271))

(declare-fun m!282273 () Bool)

(assert (=> b!265475 m!282273))

(assert (=> b!265389 d!64199))

(declare-fun d!64207 () Bool)

(declare-fun res!129842 () Bool)

(declare-fun e!171916 () Bool)

(assert (=> d!64207 (=> res!129842 e!171916)))

(assert (=> d!64207 (= res!129842 (= (select (arr!6044 a!3436) #b00000000000000000000000000000000) k!2698))))

(assert (=> d!64207 (= (arrayContainsKey!0 a!3436 k!2698 #b00000000000000000000000000000000) e!171916)))

(declare-fun b!265480 () Bool)

(declare-fun e!171917 () Bool)

(assert (=> b!265480 (= e!171916 e!171917)))

(declare-fun res!129843 () Bool)

(assert (=> b!265480 (=> (not res!129843) (not e!171917))))

(assert (=> b!265480 (= res!129843 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6396 a!3436)))))

(declare-fun b!265481 () Bool)

(assert (=> b!265481 (= e!171917 (arrayContainsKey!0 a!3436 k!2698 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!64207 (not res!129842)) b!265480))

(assert (= (and b!265480 res!129843) b!265481))

(assert (=> d!64207 m!282259))

(declare-fun m!282275 () Bool)

(assert (=> b!265481 m!282275))

(assert (=> b!265386 d!64207))

(declare-fun d!64209 () Bool)

(assert (=> d!64209 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25552 d!64209))

(declare-fun d!64217 () Bool)

(assert (=> d!64217 (= (array_inv!4007 a!3436) (bvsge (size!6396 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25552 d!64217))

(declare-fun d!64219 () Bool)

(declare-fun lt!134114 () Bool)

(assert (=> d!64219 (= lt!134114 (set.member #b0000000000000000000000000000000000000000000000000000000000000000 (content!178 Nil!3855)))))

(declare-fun e!171928 () Bool)

(assert (=> d!64219 (= lt!134114 e!171928)))

(declare-fun res!129850 () Bool)

(assert (=> d!64219 (=> (not res!129850) (not e!171928))))

(assert (=> d!64219 (= res!129850 (is-Cons!3854 Nil!3855))))

(assert (=> d!64219 (= (contains!1919 Nil!3855 #b0000000000000000000000000000000000000000000000000000000000000000) lt!134114)))

(declare-fun b!265494 () Bool)

(declare-fun e!171927 () Bool)

(assert (=> b!265494 (= e!171928 e!171927)))

(declare-fun res!129851 () Bool)

(assert (=> b!265494 (=> res!129851 e!171927)))

(assert (=> b!265494 (= res!129851 (= (h!4521 Nil!3855) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265495 () Bool)

(assert (=> b!265495 (= e!171927 (contains!1919 (t!8940 Nil!3855) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64219 res!129850) b!265494))

(assert (= (and b!265494 (not res!129851)) b!265495))

(assert (=> d!64219 m!282249))

(declare-fun m!282289 () Bool)

(assert (=> d!64219 m!282289))

(declare-fun m!282291 () Bool)

(assert (=> b!265495 m!282291))

(assert (=> b!265391 d!64219))

(declare-fun b!265544 () Bool)

(declare-fun e!171956 () SeekEntryResult!1235)

(assert (=> b!265544 (= e!171956 Undefined!1235)))

(declare-fun b!265545 () Bool)

(declare-fun e!171957 () SeekEntryResult!1235)

(declare-fun lt!134137 () SeekEntryResult!1235)

(assert (=> b!265545 (= e!171957 (Found!1235 (index!7112 lt!134137)))))

(declare-fun b!265546 () Bool)

(declare-fun c!45396 () Bool)

(declare-fun lt!134138 () (_ BitVec 64))

(assert (=> b!265546 (= c!45396 (= lt!134138 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171958 () SeekEntryResult!1235)

(assert (=> b!265546 (= e!171957 e!171958)))

(declare-fun d!64221 () Bool)

(declare-fun lt!134136 () SeekEntryResult!1235)

(assert (=> d!64221 (and (or (is-Undefined!1235 lt!134136) (not (is-Found!1235 lt!134136)) (and (bvsge (index!7111 lt!134136) #b00000000000000000000000000000000) (bvslt (index!7111 lt!134136) (size!6396 a!3436)))) (or (is-Undefined!1235 lt!134136) (is-Found!1235 lt!134136) (not (is-MissingZero!1235 lt!134136)) (and (bvsge (index!7110 lt!134136) #b00000000000000000000000000000000) (bvslt (index!7110 lt!134136) (size!6396 a!3436)))) (or (is-Undefined!1235 lt!134136) (is-Found!1235 lt!134136) (is-MissingZero!1235 lt!134136) (not (is-MissingVacant!1235 lt!134136)) (and (bvsge (index!7113 lt!134136) #b00000000000000000000000000000000) (bvslt (index!7113 lt!134136) (size!6396 a!3436)))) (or (is-Undefined!1235 lt!134136) (ite (is-Found!1235 lt!134136) (= (select (arr!6044 a!3436) (index!7111 lt!134136)) k!2698) (ite (is-MissingZero!1235 lt!134136) (= (select (arr!6044 a!3436) (index!7110 lt!134136)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!1235 lt!134136) (= (select (arr!6044 a!3436) (index!7113 lt!134136)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64221 (= lt!134136 e!171956)))

(declare-fun c!45394 () Bool)

(assert (=> d!64221 (= c!45394 (and (is-Intermediate!1235 lt!134137) (undefined!2047 lt!134137)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12776 (_ BitVec 32)) SeekEntryResult!1235)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64221 (= lt!134137 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!2698 mask!4002) k!2698 a!3436 mask!4002))))

(assert (=> d!64221 (validMask!0 mask!4002)))

(assert (=> d!64221 (= (seekEntryOrOpen!0 k!2698 a!3436 mask!4002) lt!134136)))

(declare-fun b!265547 () Bool)

(assert (=> b!265547 (= e!171958 (MissingZero!1235 (index!7112 lt!134137)))))

(declare-fun b!265548 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12776 (_ BitVec 32)) SeekEntryResult!1235)

(assert (=> b!265548 (= e!171958 (seekKeyOrZeroReturnVacant!0 (x!25432 lt!134137) (index!7112 lt!134137) (index!7112 lt!134137) k!2698 a!3436 mask!4002))))

(declare-fun b!265549 () Bool)

(assert (=> b!265549 (= e!171956 e!171957)))

(assert (=> b!265549 (= lt!134138 (select (arr!6044 a!3436) (index!7112 lt!134137)))))

(declare-fun c!45395 () Bool)

(assert (=> b!265549 (= c!45395 (= lt!134138 k!2698))))

(assert (= (and d!64221 c!45394) b!265544))

(assert (= (and d!64221 (not c!45394)) b!265549))

(assert (= (and b!265549 c!45395) b!265545))

(assert (= (and b!265549 (not c!45395)) b!265546))

(assert (= (and b!265546 c!45396) b!265547))

(assert (= (and b!265546 (not c!45396)) b!265548))

(declare-fun m!282309 () Bool)

(assert (=> d!64221 m!282309))

(declare-fun m!282311 () Bool)

(assert (=> d!64221 m!282311))

(declare-fun m!282313 () Bool)

(assert (=> d!64221 m!282313))

(declare-fun m!282315 () Bool)

(assert (=> d!64221 m!282315))

(assert (=> d!64221 m!282309))

(assert (=> d!64221 m!282205))

(declare-fun m!282317 () Bool)

(assert (=> d!64221 m!282317))

(declare-fun m!282319 () Bool)

(assert (=> b!265548 m!282319))

(declare-fun m!282321 () Bool)

(assert (=> b!265549 m!282321))

(assert (=> b!265385 d!64221))

(push 1)

(assert (not d!64187))

(assert (not bm!25330))

(assert (not b!265495))

(assert (not b!265475))

(assert (not b!265455))

(assert (not d!64221))

(assert (not b!265481))

(assert (not b!265466))

(assert (not b!265468))

(assert (not d!64219))

(assert (not b!265474))

(assert (not b!265548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

