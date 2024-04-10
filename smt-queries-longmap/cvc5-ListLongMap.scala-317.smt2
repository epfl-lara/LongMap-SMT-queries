; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5692 () Bool)

(assert start!5692)

(declare-fun b_free!1363 () Bool)

(declare-fun b_next!1363 () Bool)

(assert (=> start!5692 (= b_free!1363 (not b_next!1363))))

(declare-fun tp!5732 () Bool)

(declare-fun b_and!2357 () Bool)

(assert (=> start!5692 (= tp!5732 b_and!2357)))

(declare-fun res!24031 () Bool)

(declare-fun e!25527 () Bool)

(assert (=> start!5692 (=> (not res!24031) (not e!25527))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5692 (= res!24031 (validMask!0 mask!853))))

(assert (=> start!5692 e!25527))

(assert (=> start!5692 true))

(assert (=> start!5692 tp!5732))

(declare-fun b!40241 () Bool)

(declare-fun e!25528 () Bool)

(assert (=> b!40241 (= e!25527 (not e!25528))))

(declare-fun res!24033 () Bool)

(assert (=> b!40241 (=> res!24033 e!25528)))

(declare-datatypes ((V!2097 0))(
  ( (V!2098 (val!915 Int)) )
))
(declare-datatypes ((tuple2!1484 0))(
  ( (tuple2!1485 (_1!753 (_ BitVec 64)) (_2!753 V!2097)) )
))
(declare-datatypes ((List!1052 0))(
  ( (Nil!1049) (Cons!1048 (h!1622 tuple2!1484) (t!3905 List!1052)) )
))
(declare-datatypes ((ListLongMap!1061 0))(
  ( (ListLongMap!1062 (toList!546 List!1052)) )
))
(declare-fun lt!15442 () ListLongMap!1061)

(assert (=> b!40241 (= res!24033 (= lt!15442 (ListLongMap!1062 Nil!1049)))))

(declare-datatypes ((array!2591 0))(
  ( (array!2592 (arr!1239 (Array (_ BitVec 32) (_ BitVec 64))) (size!1376 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!629 0))(
  ( (ValueCellFull!629 (v!1993 V!2097)) (EmptyCell!629) )
))
(declare-datatypes ((array!2593 0))(
  ( (array!2594 (arr!1240 (Array (_ BitVec 32) ValueCell!629)) (size!1377 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!238 0))(
  ( (LongMapFixedSize!239 (defaultEntry!1803 Int) (mask!5176 (_ BitVec 32)) (extraKeys!1694 (_ BitVec 32)) (zeroValue!1721 V!2097) (minValue!1721 V!2097) (_size!168 (_ BitVec 32)) (_keys!3292 array!2591) (_values!1786 array!2593) (_vacant!168 (_ BitVec 32))) )
))
(declare-fun lt!15445 () LongMapFixedSize!238)

(declare-fun map!689 (LongMapFixedSize!238) ListLongMap!1061)

(assert (=> b!40241 (= lt!15442 (map!689 lt!15445))))

(declare-fun lt!15443 () array!2591)

(declare-datatypes ((List!1053 0))(
  ( (Nil!1050) (Cons!1049 (h!1623 (_ BitVec 64)) (t!3906 List!1053)) )
))
(declare-fun arrayNoDuplicates!0 (array!2591 (_ BitVec 32) List!1053) Bool)

(assert (=> b!40241 (arrayNoDuplicates!0 lt!15443 #b00000000000000000000000000000000 Nil!1050)))

(declare-datatypes ((Unit!981 0))(
  ( (Unit!982) )
))
(declare-fun lt!15446 () Unit!981)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2591 (_ BitVec 32) (_ BitVec 32) List!1053) Unit!981)

(assert (=> b!40241 (= lt!15446 (lemmaArrayNoDuplicatesInAll0Array!0 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2591 (_ BitVec 32)) Bool)

(assert (=> b!40241 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15443 mask!853)))

(declare-fun lt!15440 () Unit!981)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2591 (_ BitVec 32) (_ BitVec 32)) Unit!981)

(assert (=> b!40241 (= lt!15440 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15443 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2591 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!40241 (= (arrayCountValidKeys!0 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15444 () Unit!981)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2591 (_ BitVec 32) (_ BitVec 32)) Unit!981)

(assert (=> b!40241 (= lt!15444 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun lt!15441 () V!2097)

(declare-fun defaultEntry!470 () Int)

(assert (=> b!40241 (= lt!15445 (LongMapFixedSize!239 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!15441 lt!15441 #b00000000000000000000000000000000 lt!15443 (array!2594 ((as const (Array (_ BitVec 32) ValueCell!629)) EmptyCell!629) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000))))

(assert (=> b!40241 (= lt!15443 (array!2592 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!190 (Int (_ BitVec 64)) V!2097)

(assert (=> b!40241 (= lt!15441 (dynLambda!190 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40242 () Bool)

(declare-fun res!24032 () Bool)

(assert (=> b!40242 (=> res!24032 e!25528)))

(declare-fun isEmpty!229 (List!1052) Bool)

(assert (=> b!40242 (= res!24032 (isEmpty!229 (toList!546 lt!15442)))))

(declare-fun b!40243 () Bool)

(declare-fun valid!118 (LongMapFixedSize!238) Bool)

(assert (=> b!40243 (= e!25528 (valid!118 lt!15445))))

(assert (= (and start!5692 res!24031) b!40241))

(assert (= (and b!40241 (not res!24033)) b!40242))

(assert (= (and b!40242 (not res!24032)) b!40243))

(declare-fun b_lambda!2057 () Bool)

(assert (=> (not b_lambda!2057) (not b!40241)))

(declare-fun t!3904 () Bool)

(declare-fun tb!839 () Bool)

(assert (=> (and start!5692 (= defaultEntry!470 defaultEntry!470) t!3904) tb!839))

(declare-fun result!1435 () Bool)

(declare-fun tp_is_empty!1753 () Bool)

(assert (=> tb!839 (= result!1435 tp_is_empty!1753)))

(assert (=> b!40241 t!3904))

(declare-fun b_and!2359 () Bool)

(assert (= b_and!2357 (and (=> t!3904 result!1435) b_and!2359)))

(declare-fun m!33181 () Bool)

(assert (=> start!5692 m!33181))

(declare-fun m!33183 () Bool)

(assert (=> b!40241 m!33183))

(declare-fun m!33185 () Bool)

(assert (=> b!40241 m!33185))

(declare-fun m!33187 () Bool)

(assert (=> b!40241 m!33187))

(declare-fun m!33189 () Bool)

(assert (=> b!40241 m!33189))

(declare-fun m!33191 () Bool)

(assert (=> b!40241 m!33191))

(declare-fun m!33193 () Bool)

(assert (=> b!40241 m!33193))

(declare-fun m!33195 () Bool)

(assert (=> b!40241 m!33195))

(declare-fun m!33197 () Bool)

(assert (=> b!40241 m!33197))

(declare-fun m!33199 () Bool)

(assert (=> b!40242 m!33199))

(declare-fun m!33201 () Bool)

(assert (=> b!40243 m!33201))

(push 1)

(assert (not b_lambda!2057))

(assert (not b_next!1363))

(assert tp_is_empty!1753)

(assert (not start!5692))

(assert (not b!40243))

(assert b_and!2359)

(assert (not b!40241))

(assert (not b!40242))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2359)

(assert (not b_next!1363))

(check-sat)

(get-model)

(pop 1)

(declare-fun b_lambda!2063 () Bool)

(assert (= b_lambda!2057 (or (and start!5692 b_free!1363) b_lambda!2063)))

(push 1)

(assert (not b_next!1363))

(assert tp_is_empty!1753)

(assert (not start!5692))

(assert (not b!40243))

(assert b_and!2359)

(assert (not b!40241))

(assert (not b_lambda!2063))

(assert (not b!40242))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2359)

(assert (not b_next!1363))

(check-sat)

(get-model)

(pop 1)

(declare-fun d!6973 () Bool)

(assert (=> d!6973 (= (isEmpty!229 (toList!546 lt!15442)) (is-Nil!1049 (toList!546 lt!15442)))))

(assert (=> b!40242 d!6973))

(declare-fun d!6975 () Bool)

(assert (=> d!6975 (= (validMask!0 mask!853) (and (or (= mask!853 #b00000000000000000000000000000111) (= mask!853 #b00000000000000000000000000001111) (= mask!853 #b00000000000000000000000000011111) (= mask!853 #b00000000000000000000000000111111) (= mask!853 #b00000000000000000000000001111111) (= mask!853 #b00000000000000000000000011111111) (= mask!853 #b00000000000000000000000111111111) (= mask!853 #b00000000000000000000001111111111) (= mask!853 #b00000000000000000000011111111111) (= mask!853 #b00000000000000000000111111111111) (= mask!853 #b00000000000000000001111111111111) (= mask!853 #b00000000000000000011111111111111) (= mask!853 #b00000000000000000111111111111111) (= mask!853 #b00000000000000001111111111111111) (= mask!853 #b00000000000000011111111111111111) (= mask!853 #b00000000000000111111111111111111) (= mask!853 #b00000000000001111111111111111111) (= mask!853 #b00000000000011111111111111111111) (= mask!853 #b00000000000111111111111111111111) (= mask!853 #b00000000001111111111111111111111) (= mask!853 #b00000000011111111111111111111111) (= mask!853 #b00000000111111111111111111111111) (= mask!853 #b00000001111111111111111111111111) (= mask!853 #b00000011111111111111111111111111) (= mask!853 #b00000111111111111111111111111111) (= mask!853 #b00001111111111111111111111111111) (= mask!853 #b00011111111111111111111111111111) (= mask!853 #b00111111111111111111111111111111)) (bvsle mask!853 #b00111111111111111111111111111111)))))

(assert (=> start!5692 d!6975))

(declare-fun d!6979 () Bool)

(declare-fun res!24067 () Bool)

(declare-fun e!25546 () Bool)

(assert (=> d!6979 (=> (not res!24067) (not e!25546))))

(declare-fun simpleValid!27 (LongMapFixedSize!238) Bool)

(assert (=> d!6979 (= res!24067 (simpleValid!27 lt!15445))))

(assert (=> d!6979 (= (valid!118 lt!15445) e!25546)))

(declare-fun b!40283 () Bool)

(declare-fun res!24068 () Bool)

(assert (=> b!40283 (=> (not res!24068) (not e!25546))))

(assert (=> b!40283 (= res!24068 (= (arrayCountValidKeys!0 (_keys!3292 lt!15445) #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))) (_size!168 lt!15445)))))

(declare-fun b!40284 () Bool)

(declare-fun res!24069 () Bool)

(assert (=> b!40284 (=> (not res!24069) (not e!25546))))

(assert (=> b!40284 (= res!24069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3292 lt!15445) (mask!5176 lt!15445)))))

(declare-fun b!40285 () Bool)

(assert (=> b!40285 (= e!25546 (arrayNoDuplicates!0 (_keys!3292 lt!15445) #b00000000000000000000000000000000 Nil!1050))))

(assert (= (and d!6979 res!24067) b!40283))

(assert (= (and b!40283 res!24068) b!40284))

(assert (= (and b!40284 res!24069) b!40285))

(declare-fun m!33255 () Bool)

(assert (=> d!6979 m!33255))

(declare-fun m!33257 () Bool)

(assert (=> b!40283 m!33257))

(declare-fun m!33259 () Bool)

(assert (=> b!40284 m!33259))

(declare-fun m!33261 () Bool)

(assert (=> b!40285 m!33261))

(assert (=> b!40243 d!6979))

(declare-fun d!6985 () Bool)

(assert (=> d!6985 (= (arrayCountValidKeys!0 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!15497 () Unit!981)

(declare-fun choose!59 (array!2591 (_ BitVec 32) (_ BitVec 32)) Unit!981)

(assert (=> d!6985 (= lt!15497 (choose!59 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6985 (bvslt (size!1376 lt!15443) #b01111111111111111111111111111111)))

(assert (=> d!6985 (= (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15497)))

(declare-fun bs!1693 () Bool)

(assert (= bs!1693 d!6985))

(assert (=> bs!1693 m!33197))

(declare-fun m!33263 () Bool)

(assert (=> bs!1693 m!33263))

(assert (=> b!40241 d!6985))

(declare-fun b!40320 () Bool)

(declare-fun e!25571 () Bool)

(declare-fun call!3107 () Bool)

(assert (=> b!40320 (= e!25571 call!3107)))

(declare-fun bm!3104 () Bool)

(declare-fun c!4907 () Bool)

(assert (=> bm!3104 (= call!3107 (arrayNoDuplicates!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)))))

(declare-fun b!40321 () Bool)

(declare-fun e!25573 () Bool)

(declare-fun e!25570 () Bool)

(assert (=> b!40321 (= e!25573 e!25570)))

(declare-fun res!24083 () Bool)

(assert (=> b!40321 (=> (not res!24083) (not e!25570))))

(declare-fun e!25572 () Bool)

(assert (=> b!40321 (= res!24083 (not e!25572))))

(declare-fun res!24082 () Bool)

(assert (=> b!40321 (=> (not res!24082) (not e!25572))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!40321 (= res!24082 (validKeyInArray!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(declare-fun b!40322 () Bool)

(assert (=> b!40322 (= e!25571 call!3107)))

(declare-fun d!6987 () Bool)

(declare-fun res!24084 () Bool)

(assert (=> d!6987 (=> res!24084 e!25573)))

(assert (=> d!6987 (= res!24084 (bvsge #b00000000000000000000000000000000 (size!1376 lt!15443)))))

(assert (=> d!6987 (= (arrayNoDuplicates!0 lt!15443 #b00000000000000000000000000000000 Nil!1050) e!25573)))

(declare-fun b!40323 () Bool)

(assert (=> b!40323 (= e!25570 e!25571)))

(assert (=> b!40323 (= c!4907 (validKeyInArray!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(declare-fun b!40324 () Bool)

(declare-fun contains!511 (List!1053 (_ BitVec 64)) Bool)

(assert (=> b!40324 (= e!25572 (contains!511 Nil!1050 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(assert (= (and d!6987 (not res!24084)) b!40321))

(assert (= (and b!40321 res!24082) b!40324))

(assert (= (and b!40321 res!24083) b!40323))

(assert (= (and b!40323 c!4907) b!40320))

(assert (= (and b!40323 (not c!4907)) b!40322))

(assert (= (or b!40320 b!40322) bm!3104))

(declare-fun m!33285 () Bool)

(assert (=> bm!3104 m!33285))

(declare-fun m!33287 () Bool)

(assert (=> bm!3104 m!33287))

(assert (=> b!40321 m!33285))

(assert (=> b!40321 m!33285))

(declare-fun m!33289 () Bool)

(assert (=> b!40321 m!33289))

(assert (=> b!40323 m!33285))

(assert (=> b!40323 m!33285))

(assert (=> b!40323 m!33289))

(assert (=> b!40324 m!33285))

(assert (=> b!40324 m!33285))

(declare-fun m!33291 () Bool)

(assert (=> b!40324 m!33291))

(assert (=> b!40241 d!6987))

(declare-fun b!40348 () Bool)

(declare-fun e!25591 () (_ BitVec 32))

(declare-fun call!3113 () (_ BitVec 32))

(assert (=> b!40348 (= e!25591 call!3113)))

(declare-fun b!40349 () Bool)

(declare-fun e!25590 () (_ BitVec 32))

(assert (=> b!40349 (= e!25590 e!25591)))

(declare-fun c!4916 () Bool)

(assert (=> b!40349 (= c!4916 (validKeyInArray!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(declare-fun bm!3110 () Bool)

(assert (=> bm!3110 (= call!3113 (arrayCountValidKeys!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!6995 () Bool)

(declare-fun lt!15512 () (_ BitVec 32))

(assert (=> d!6995 (and (bvsge lt!15512 #b00000000000000000000000000000000) (bvsle lt!15512 (bvsub (size!1376 lt!15443) #b00000000000000000000000000000000)))))

(assert (=> d!6995 (= lt!15512 e!25590)))

(declare-fun c!4915 () Bool)

(assert (=> d!6995 (= c!4915 (bvsge #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!6995 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1376 lt!15443)))))

(assert (=> d!6995 (= (arrayCountValidKeys!0 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) lt!15512)))

(declare-fun b!40350 () Bool)

(assert (=> b!40350 (= e!25590 #b00000000000000000000000000000000)))

(declare-fun b!40351 () Bool)

(assert (=> b!40351 (= e!25591 (bvadd #b00000000000000000000000000000001 call!3113))))

(assert (= (and d!6995 c!4915) b!40350))

(assert (= (and d!6995 (not c!4915)) b!40349))

(assert (= (and b!40349 c!4916) b!40351))

(assert (= (and b!40349 (not c!4916)) b!40348))

(assert (= (or b!40351 b!40348) bm!3110))

(assert (=> b!40349 m!33285))

(assert (=> b!40349 m!33285))

(assert (=> b!40349 m!33289))

(declare-fun m!33301 () Bool)

(assert (=> bm!3110 m!33301))

(assert (=> b!40241 d!6995))

(declare-fun d!7003 () Bool)

(declare-fun getCurrentListMap!310 (array!2591 array!2593 (_ BitVec 32) (_ BitVec 32) V!2097 V!2097 (_ BitVec 32) Int) ListLongMap!1061)

(assert (=> d!7003 (= (map!689 lt!15445) (getCurrentListMap!310 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15445)))))

(declare-fun bs!1699 () Bool)

(assert (= bs!1699 d!7003))

(declare-fun m!33307 () Bool)

(assert (=> bs!1699 m!33307))

(assert (=> b!40241 d!7003))

(declare-fun b!40382 () Bool)

(declare-fun e!25613 () Bool)

(declare-fun call!3119 () Bool)

(assert (=> b!40382 (= e!25613 call!3119)))

(declare-fun b!40383 () Bool)

(declare-fun e!25614 () Bool)

(assert (=> b!40383 (= e!25614 e!25613)))

(declare-fun c!4927 () Bool)

(assert (=> b!40383 (= c!4927 (validKeyInArray!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(declare-fun b!40384 () Bool)

(declare-fun e!25612 () Bool)

(assert (=> b!40384 (= e!25612 call!3119)))

(declare-fun b!40385 () Bool)

(assert (=> b!40385 (= e!25613 e!25612)))

(declare-fun lt!15534 () (_ BitVec 64))

(assert (=> b!40385 (= lt!15534 (select (arr!1239 lt!15443) #b00000000000000000000000000000000))))

(declare-fun lt!15536 () Unit!981)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!2591 (_ BitVec 64) (_ BitVec 32)) Unit!981)

(assert (=> b!40385 (= lt!15536 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15443 lt!15534 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!2591 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!40385 (arrayContainsKey!0 lt!15443 lt!15534 #b00000000000000000000000000000000)))

(declare-fun lt!15535 () Unit!981)

(assert (=> b!40385 (= lt!15535 lt!15536)))

(declare-fun res!24105 () Bool)

(declare-datatypes ((SeekEntryResult!173 0))(
  ( (MissingZero!173 (index!2814 (_ BitVec 32))) (Found!173 (index!2815 (_ BitVec 32))) (Intermediate!173 (undefined!985 Bool) (index!2816 (_ BitVec 32)) (x!7720 (_ BitVec 32))) (Undefined!173) (MissingVacant!173 (index!2817 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2591 (_ BitVec 32)) SeekEntryResult!173)

(assert (=> b!40385 (= res!24105 (= (seekEntryOrOpen!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15443 mask!853) (Found!173 #b00000000000000000000000000000000)))))

(assert (=> b!40385 (=> (not res!24105) (not e!25612))))

(declare-fun d!7009 () Bool)

(declare-fun res!24104 () Bool)

(assert (=> d!7009 (=> res!24104 e!25614)))

(assert (=> d!7009 (= res!24104 (bvsge #b00000000000000000000000000000000 (size!1376 lt!15443)))))

(assert (=> d!7009 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15443 mask!853) e!25614)))

(declare-fun bm!3116 () Bool)

(assert (=> bm!3116 (= call!3119 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15443 mask!853))))

(assert (= (and d!7009 (not res!24104)) b!40383))

(assert (= (and b!40383 c!4927) b!40385))

(assert (= (and b!40383 (not c!4927)) b!40382))

(assert (= (and b!40385 res!24105) b!40384))

(assert (= (or b!40384 b!40382) bm!3116))

(assert (=> b!40383 m!33285))

(assert (=> b!40383 m!33285))

(assert (=> b!40383 m!33289))

(assert (=> b!40385 m!33285))

(declare-fun m!33317 () Bool)

(assert (=> b!40385 m!33317))

(declare-fun m!33319 () Bool)

(assert (=> b!40385 m!33319))

(assert (=> b!40385 m!33285))

(declare-fun m!33321 () Bool)

(assert (=> b!40385 m!33321))

(declare-fun m!33323 () Bool)

(assert (=> bm!3116 m!33323))

(assert (=> b!40241 d!7009))

(declare-fun d!7019 () Bool)

(assert (=> d!7019 (arrayNoDuplicates!0 lt!15443 #b00000000000000000000000000000000 Nil!1050)))

(declare-fun lt!15545 () Unit!981)

(declare-fun choose!111 (array!2591 (_ BitVec 32) (_ BitVec 32) List!1053) Unit!981)

(assert (=> d!7019 (= lt!15545 (choose!111 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1050))))

(assert (=> d!7019 (= (size!1376 lt!15443) (bvadd #b00000000000000000000000000000001 mask!853))))

(assert (=> d!7019 (= (lemmaArrayNoDuplicatesInAll0Array!0 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1050) lt!15545)))

(declare-fun bs!1703 () Bool)

(assert (= bs!1703 d!7019))

(assert (=> bs!1703 m!33189))

(declare-fun m!33329 () Bool)

(assert (=> bs!1703 m!33329))

(assert (=> b!40241 d!7019))

(declare-fun d!7023 () Bool)

(assert (=> d!7023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15443 mask!853)))

(declare-fun lt!15551 () Unit!981)

(declare-fun choose!34 (array!2591 (_ BitVec 32) (_ BitVec 32)) Unit!981)

(assert (=> d!7023 (= lt!15551 (choose!34 lt!15443 mask!853 #b00000000000000000000000000000000))))

(assert (=> d!7023 (validMask!0 mask!853)))

(assert (=> d!7023 (= (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!15443 mask!853 #b00000000000000000000000000000000) lt!15551)))

(declare-fun bs!1704 () Bool)

(assert (= bs!1704 d!7023))

(assert (=> bs!1704 m!33193))

(declare-fun m!33339 () Bool)

(assert (=> bs!1704 m!33339))

(assert (=> bs!1704 m!33181))

(assert (=> b!40241 d!7023))

(push 1)

(assert (not b!40323))

(assert (not bm!3116))

(assert (not b_next!1363))

(assert (not d!6985))

(assert tp_is_empty!1753)

(assert (not bm!3110))

(assert (not b!40385))

(assert (not b!40383))

(assert b_and!2359)

(assert (not b!40321))

(assert (not b!40285))

(assert (not b!40324))

(assert (not d!6979))

(assert (not d!7023))

(assert (not b!40349))

(assert (not b_lambda!2063))

(assert (not d!7003))

(assert (not b!40283))

(assert (not d!7019))

(assert (not b!40284))

(assert (not bm!3104))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2359)

(assert (not b_next!1363))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!40412 () Bool)

(declare-fun e!25632 () (_ BitVec 32))

(declare-fun call!3126 () (_ BitVec 32))

(assert (=> b!40412 (= e!25632 call!3126)))

(declare-fun b!40413 () Bool)

(declare-fun e!25631 () (_ BitVec 32))

(assert (=> b!40413 (= e!25631 e!25632)))

(declare-fun c!4933 () Bool)

(assert (=> b!40413 (= c!4933 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun bm!3123 () Bool)

(assert (=> bm!3123 (= call!3126 (arrayCountValidKeys!0 (_keys!3292 lt!15445) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 (_keys!3292 lt!15445))))))

(declare-fun d!7033 () Bool)

(declare-fun lt!15552 () (_ BitVec 32))

(assert (=> d!7033 (and (bvsge lt!15552 #b00000000000000000000000000000000) (bvsle lt!15552 (bvsub (size!1376 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(assert (=> d!7033 (= lt!15552 e!25631)))

(declare-fun c!4932 () Bool)

(assert (=> d!7033 (= c!4932 (bvsge #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(assert (=> d!7033 (and (bvsle #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!1376 (_keys!3292 lt!15445)) (size!1376 (_keys!3292 lt!15445))))))

(assert (=> d!7033 (= (arrayCountValidKeys!0 (_keys!3292 lt!15445) #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))) lt!15552)))

(declare-fun b!40414 () Bool)

(assert (=> b!40414 (= e!25631 #b00000000000000000000000000000000)))

(declare-fun b!40415 () Bool)

(assert (=> b!40415 (= e!25632 (bvadd #b00000000000000000000000000000001 call!3126))))

(assert (= (and d!7033 c!4932) b!40414))

(assert (= (and d!7033 (not c!4932)) b!40413))

(assert (= (and b!40413 c!4933) b!40415))

(assert (= (and b!40413 (not c!4933)) b!40412))

(assert (= (or b!40415 b!40412) bm!3123))

(declare-fun m!33349 () Bool)

(assert (=> b!40413 m!33349))

(assert (=> b!40413 m!33349))

(declare-fun m!33351 () Bool)

(assert (=> b!40413 m!33351))

(declare-fun m!33353 () Bool)

(assert (=> bm!3123 m!33353))

(assert (=> b!40283 d!7033))

(assert (=> d!6985 d!6995))

(declare-fun d!7037 () Bool)

(assert (=> d!7037 (= (arrayCountValidKeys!0 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(assert (=> d!7037 true))

(declare-fun _$88!37 () Unit!981)

(assert (=> d!7037 (= (choose!59 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) _$88!37)))

(declare-fun bs!1705 () Bool)

(assert (= bs!1705 d!7037))

(assert (=> bs!1705 m!33197))

(assert (=> d!6985 d!7037))

(assert (=> d!7019 d!6987))

(declare-fun d!7041 () Bool)

(assert (=> d!7041 (arrayNoDuplicates!0 lt!15443 #b00000000000000000000000000000000 Nil!1050)))

(assert (=> d!7041 true))

(declare-fun res!24129 () Unit!981)

(assert (=> d!7041 (= (choose!111 lt!15443 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1050) res!24129)))

(declare-fun bs!1706 () Bool)

(assert (= bs!1706 d!7041))

(assert (=> bs!1706 m!33189))

(assert (=> d!7019 d!7041))

(declare-fun b!40421 () Bool)

(declare-fun e!25638 () Bool)

(declare-fun call!3128 () Bool)

(assert (=> b!40421 (= e!25638 call!3128)))

(declare-fun b!40422 () Bool)

(declare-fun e!25639 () Bool)

(assert (=> b!40422 (= e!25639 e!25638)))

(declare-fun c!4935 () Bool)

(assert (=> b!40422 (= c!4935 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun b!40423 () Bool)

(declare-fun e!25637 () Bool)

(assert (=> b!40423 (= e!25637 call!3128)))

(declare-fun b!40424 () Bool)

(assert (=> b!40424 (= e!25638 e!25637)))

(declare-fun lt!15553 () (_ BitVec 64))

(assert (=> b!40424 (= lt!15553 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000))))

(declare-fun lt!15555 () Unit!981)

(assert (=> b!40424 (= lt!15555 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3292 lt!15445) lt!15553 #b00000000000000000000000000000000))))

(assert (=> b!40424 (arrayContainsKey!0 (_keys!3292 lt!15445) lt!15553 #b00000000000000000000000000000000)))

(declare-fun lt!15554 () Unit!981)

(assert (=> b!40424 (= lt!15554 lt!15555)))

(declare-fun res!24131 () Bool)

(assert (=> b!40424 (= res!24131 (= (seekEntryOrOpen!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) (_keys!3292 lt!15445) (mask!5176 lt!15445)) (Found!173 #b00000000000000000000000000000000)))))

(assert (=> b!40424 (=> (not res!24131) (not e!25637))))

(declare-fun d!7043 () Bool)

(declare-fun res!24130 () Bool)

(assert (=> d!7043 (=> res!24130 e!25639)))

(assert (=> d!7043 (= res!24130 (bvsge #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(assert (=> d!7043 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!3292 lt!15445) (mask!5176 lt!15445)) e!25639)))

(declare-fun bm!3125 () Bool)

(assert (=> bm!3125 (= call!3128 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3292 lt!15445) (mask!5176 lt!15445)))))

(assert (= (and d!7043 (not res!24130)) b!40422))

(assert (= (and b!40422 c!4935) b!40424))

(assert (= (and b!40422 (not c!4935)) b!40421))

(assert (= (and b!40424 res!24131) b!40423))

(assert (= (or b!40423 b!40421) bm!3125))

(assert (=> b!40422 m!33349))

(assert (=> b!40422 m!33349))

(assert (=> b!40422 m!33351))

(assert (=> b!40424 m!33349))

(declare-fun m!33363 () Bool)

(assert (=> b!40424 m!33363))

(declare-fun m!33365 () Bool)

(assert (=> b!40424 m!33365))

(assert (=> b!40424 m!33349))

(declare-fun m!33367 () Bool)

(assert (=> b!40424 m!33367))

(declare-fun m!33369 () Bool)

(assert (=> bm!3125 m!33369))

(assert (=> b!40284 d!7043))

(declare-fun b!40425 () Bool)

(declare-fun e!25641 () Bool)

(declare-fun call!3129 () Bool)

(assert (=> b!40425 (= e!25641 call!3129)))

(declare-fun b!40426 () Bool)

(declare-fun e!25642 () Bool)

(assert (=> b!40426 (= e!25642 e!25641)))

(declare-fun c!4936 () Bool)

(assert (=> b!40426 (= c!4936 (validKeyInArray!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40427 () Bool)

(declare-fun e!25640 () Bool)

(assert (=> b!40427 (= e!25640 call!3129)))

(declare-fun b!40428 () Bool)

(assert (=> b!40428 (= e!25641 e!25640)))

(declare-fun lt!15556 () (_ BitVec 64))

(assert (=> b!40428 (= lt!15556 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15558 () Unit!981)

(assert (=> b!40428 (= lt!15558 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15443 lt!15556 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40428 (arrayContainsKey!0 lt!15443 lt!15556 #b00000000000000000000000000000000)))

(declare-fun lt!15557 () Unit!981)

(assert (=> b!40428 (= lt!15557 lt!15558)))

(declare-fun res!24133 () Bool)

(assert (=> b!40428 (= res!24133 (= (seekEntryOrOpen!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15443 mask!853) (Found!173 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40428 (=> (not res!24133) (not e!25640))))

(declare-fun d!7045 () Bool)

(declare-fun res!24132 () Bool)

(assert (=> d!7045 (=> res!24132 e!25642)))

(assert (=> d!7045 (= res!24132 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 lt!15443)))))

(assert (=> d!7045 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!15443 mask!853) e!25642)))

(declare-fun bm!3126 () Bool)

(assert (=> bm!3126 (= call!3129 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15443 mask!853))))

(assert (= (and d!7045 (not res!24132)) b!40426))

(assert (= (and b!40426 c!4936) b!40428))

(assert (= (and b!40426 (not c!4936)) b!40425))

(assert (= (and b!40428 res!24133) b!40427))

(assert (= (or b!40427 b!40425) bm!3126))

(declare-fun m!33371 () Bool)

(assert (=> b!40426 m!33371))

(assert (=> b!40426 m!33371))

(declare-fun m!33373 () Bool)

(assert (=> b!40426 m!33373))

(assert (=> b!40428 m!33371))

(declare-fun m!33375 () Bool)

(assert (=> b!40428 m!33375))

(declare-fun m!33377 () Bool)

(assert (=> b!40428 m!33377))

(assert (=> b!40428 m!33371))

(declare-fun m!33379 () Bool)

(assert (=> b!40428 m!33379))

(declare-fun m!33381 () Bool)

(assert (=> bm!3126 m!33381))

(assert (=> bm!3116 d!7045))

(declare-fun bm!3164 () Bool)

(declare-fun call!3170 () Bool)

(declare-fun lt!15680 () ListLongMap!1061)

(declare-fun contains!515 (ListLongMap!1061 (_ BitVec 64)) Bool)

(assert (=> bm!3164 (= call!3170 (contains!515 lt!15680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40543 () Bool)

(declare-fun e!25719 () Bool)

(declare-fun apply!56 (ListLongMap!1061 (_ BitVec 64)) V!2097)

(declare-fun get!701 (ValueCell!629 V!2097) V!2097)

(assert (=> b!40543 (= e!25719 (= (apply!56 lt!15680 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)) (get!701 (select (arr!1240 (_values!1786 lt!15445)) #b00000000000000000000000000000000) (dynLambda!190 (defaultEntry!1803 lt!15445) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1377 (_values!1786 lt!15445))))))

(assert (=> b!40543 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(declare-fun b!40544 () Bool)

(declare-fun e!25718 () Unit!981)

(declare-fun Unit!988 () Unit!981)

(assert (=> b!40544 (= e!25718 Unit!988)))

(declare-fun b!40545 () Bool)

(declare-fun lt!15687 () Unit!981)

(assert (=> b!40545 (= e!25718 lt!15687)))

(declare-fun lt!15693 () ListLongMap!1061)

(declare-fun getCurrentListMapNoExtraKeys!34 (array!2591 array!2593 (_ BitVec 32) (_ BitVec 32) V!2097 V!2097 (_ BitVec 32) Int) ListLongMap!1061)

(assert (=> b!40545 (= lt!15693 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15445)))))

(declare-fun lt!15672 () (_ BitVec 64))

(assert (=> b!40545 (= lt!15672 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15691 () (_ BitVec 64))

(assert (=> b!40545 (= lt!15691 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000))))

(declare-fun lt!15681 () Unit!981)

(declare-fun addStillContains!31 (ListLongMap!1061 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!981)

(assert (=> b!40545 (= lt!15681 (addStillContains!31 lt!15693 lt!15672 (zeroValue!1721 lt!15445) lt!15691))))

(declare-fun +!65 (ListLongMap!1061 tuple2!1484) ListLongMap!1061)

(assert (=> b!40545 (contains!515 (+!65 lt!15693 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445))) lt!15691)))

(declare-fun lt!15673 () Unit!981)

(assert (=> b!40545 (= lt!15673 lt!15681)))

(declare-fun lt!15692 () ListLongMap!1061)

(assert (=> b!40545 (= lt!15692 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15445)))))

(declare-fun lt!15690 () (_ BitVec 64))

(assert (=> b!40545 (= lt!15690 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15684 () (_ BitVec 64))

(assert (=> b!40545 (= lt!15684 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000))))

(declare-fun lt!15674 () Unit!981)

(declare-fun addApplyDifferent!31 (ListLongMap!1061 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!981)

(assert (=> b!40545 (= lt!15674 (addApplyDifferent!31 lt!15692 lt!15690 (minValue!1721 lt!15445) lt!15684))))

(assert (=> b!40545 (= (apply!56 (+!65 lt!15692 (tuple2!1485 lt!15690 (minValue!1721 lt!15445))) lt!15684) (apply!56 lt!15692 lt!15684))))

(declare-fun lt!15689 () Unit!981)

(assert (=> b!40545 (= lt!15689 lt!15674)))

(declare-fun lt!15677 () ListLongMap!1061)

(assert (=> b!40545 (= lt!15677 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15445)))))

(declare-fun lt!15682 () (_ BitVec 64))

(assert (=> b!40545 (= lt!15682 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15683 () (_ BitVec 64))

(assert (=> b!40545 (= lt!15683 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000))))

(declare-fun lt!15679 () Unit!981)

(assert (=> b!40545 (= lt!15679 (addApplyDifferent!31 lt!15677 lt!15682 (zeroValue!1721 lt!15445) lt!15683))))

(assert (=> b!40545 (= (apply!56 (+!65 lt!15677 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445))) lt!15683) (apply!56 lt!15677 lt!15683))))

(declare-fun lt!15675 () Unit!981)

(assert (=> b!40545 (= lt!15675 lt!15679)))

(declare-fun lt!15686 () ListLongMap!1061)

(assert (=> b!40545 (= lt!15686 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15445)))))

(declare-fun lt!15685 () (_ BitVec 64))

(assert (=> b!40545 (= lt!15685 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15678 () (_ BitVec 64))

(assert (=> b!40545 (= lt!15678 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000))))

(assert (=> b!40545 (= lt!15687 (addApplyDifferent!31 lt!15686 lt!15685 (minValue!1721 lt!15445) lt!15678))))

(assert (=> b!40545 (= (apply!56 (+!65 lt!15686 (tuple2!1485 lt!15685 (minValue!1721 lt!15445))) lt!15678) (apply!56 lt!15686 lt!15678))))

(declare-fun bm!3165 () Bool)

(declare-fun call!3169 () Bool)

(assert (=> bm!3165 (= call!3169 (contains!515 lt!15680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!40546 () Bool)

(declare-fun e!25725 () Bool)

(assert (=> b!40546 (= e!25725 (= (apply!56 lt!15680 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!1721 lt!15445)))))

(declare-fun d!7047 () Bool)

(declare-fun e!25717 () Bool)

(assert (=> d!7047 e!25717))

(declare-fun res!24184 () Bool)

(assert (=> d!7047 (=> (not res!24184) (not e!25717))))

(assert (=> d!7047 (= res!24184 (or (bvsge #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))))

(declare-fun lt!15688 () ListLongMap!1061)

(assert (=> d!7047 (= lt!15680 lt!15688)))

(declare-fun lt!15676 () Unit!981)

(assert (=> d!7047 (= lt!15676 e!25718)))

(declare-fun c!4969 () Bool)

(declare-fun e!25720 () Bool)

(assert (=> d!7047 (= c!4969 e!25720)))

(declare-fun res!24189 () Bool)

(assert (=> d!7047 (=> (not res!24189) (not e!25720))))

(assert (=> d!7047 (= res!24189 (bvslt #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(declare-fun e!25715 () ListLongMap!1061)

(assert (=> d!7047 (= lt!15688 e!25715)))

(declare-fun c!4971 () Bool)

(assert (=> d!7047 (= c!4971 (and (not (= (bvand (extraKeys!1694 lt!15445) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1694 lt!15445) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!7047 (validMask!0 (mask!5176 lt!15445))))

(assert (=> d!7047 (= (getCurrentListMap!310 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15445)) lt!15680)))

(declare-fun b!40547 () Bool)

(declare-fun e!25721 () Bool)

(assert (=> b!40547 (= e!25721 (= (apply!56 lt!15680 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!1721 lt!15445)))))

(declare-fun b!40548 () Bool)

(declare-fun e!25716 () ListLongMap!1061)

(declare-fun call!3173 () ListLongMap!1061)

(assert (=> b!40548 (= e!25716 call!3173)))

(declare-fun b!40549 () Bool)

(declare-fun c!4972 () Bool)

(assert (=> b!40549 (= c!4972 (and (not (= (bvand (extraKeys!1694 lt!15445) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1694 lt!15445) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!25727 () ListLongMap!1061)

(assert (=> b!40549 (= e!25727 e!25716)))

(declare-fun b!40550 () Bool)

(assert (=> b!40550 (= e!25720 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun call!3172 () ListLongMap!1061)

(declare-fun call!3171 () ListLongMap!1061)

(declare-fun c!4974 () Bool)

(declare-fun call!3167 () ListLongMap!1061)

(declare-fun bm!3166 () Bool)

(assert (=> bm!3166 (= call!3171 (+!65 (ite c!4971 call!3172 (ite c!4974 call!3167 call!3173)) (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))))))

(declare-fun b!40551 () Bool)

(assert (=> b!40551 (= e!25715 (+!65 call!3171 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))))))

(declare-fun b!40552 () Bool)

(assert (=> b!40552 (= e!25715 e!25727)))

(assert (=> b!40552 (= c!4974 (and (not (= (bvand (extraKeys!1694 lt!15445) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!1694 lt!15445) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!3167 () Bool)

(declare-fun call!3168 () ListLongMap!1061)

(assert (=> bm!3167 (= call!3168 call!3171)))

(declare-fun b!40553 () Bool)

(declare-fun e!25722 () Bool)

(assert (=> b!40553 (= e!25722 e!25721)))

(declare-fun res!24191 () Bool)

(assert (=> b!40553 (= res!24191 call!3169)))

(assert (=> b!40553 (=> (not res!24191) (not e!25721))))

(declare-fun bm!3168 () Bool)

(assert (=> bm!3168 (= call!3173 call!3167)))

(declare-fun b!40554 () Bool)

(declare-fun res!24188 () Bool)

(assert (=> b!40554 (=> (not res!24188) (not e!25717))))

(declare-fun e!25726 () Bool)

(assert (=> b!40554 (= res!24188 e!25726)))

(declare-fun res!24187 () Bool)

(assert (=> b!40554 (=> res!24187 e!25726)))

(declare-fun e!25724 () Bool)

(assert (=> b!40554 (= res!24187 (not e!25724))))

(declare-fun res!24185 () Bool)

(assert (=> b!40554 (=> (not res!24185) (not e!25724))))

(assert (=> b!40554 (= res!24185 (bvslt #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(declare-fun b!40555 () Bool)

(assert (=> b!40555 (= e!25724 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun b!40556 () Bool)

(declare-fun e!25723 () Bool)

(assert (=> b!40556 (= e!25723 e!25725)))

(declare-fun res!24192 () Bool)

(assert (=> b!40556 (= res!24192 call!3170)))

(assert (=> b!40556 (=> (not res!24192) (not e!25725))))

(declare-fun b!40557 () Bool)

(assert (=> b!40557 (= e!25717 e!25722)))

(declare-fun c!4973 () Bool)

(assert (=> b!40557 (= c!4973 (not (= (bvand (extraKeys!1694 lt!15445) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!40558 () Bool)

(assert (=> b!40558 (= e!25722 (not call!3169))))

(declare-fun b!40559 () Bool)

(declare-fun res!24190 () Bool)

(assert (=> b!40559 (=> (not res!24190) (not e!25717))))

(assert (=> b!40559 (= res!24190 e!25723)))

(declare-fun c!4970 () Bool)

(assert (=> b!40559 (= c!4970 (not (= (bvand (extraKeys!1694 lt!15445) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!3169 () Bool)

(assert (=> bm!3169 (= call!3167 call!3172)))

(declare-fun b!40560 () Bool)

(assert (=> b!40560 (= e!25727 call!3168)))

(declare-fun b!40561 () Bool)

(assert (=> b!40561 (= e!25716 call!3168)))

(declare-fun b!40562 () Bool)

(assert (=> b!40562 (= e!25723 (not call!3170))))

(declare-fun bm!3170 () Bool)

(assert (=> bm!3170 (= call!3172 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15445)))))

(declare-fun b!40563 () Bool)

(assert (=> b!40563 (= e!25726 e!25719)))

(declare-fun res!24186 () Bool)

(assert (=> b!40563 (=> (not res!24186) (not e!25719))))

(assert (=> b!40563 (= res!24186 (contains!515 lt!15680 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(assert (=> b!40563 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(assert (= (and d!7047 c!4971) b!40551))

(assert (= (and d!7047 (not c!4971)) b!40552))

(assert (= (and b!40552 c!4974) b!40560))

(assert (= (and b!40552 (not c!4974)) b!40549))

(assert (= (and b!40549 c!4972) b!40561))

(assert (= (and b!40549 (not c!4972)) b!40548))

(assert (= (or b!40561 b!40548) bm!3168))

(assert (= (or b!40560 bm!3168) bm!3169))

(assert (= (or b!40560 b!40561) bm!3167))

(assert (= (or b!40551 bm!3169) bm!3170))

(assert (= (or b!40551 bm!3167) bm!3166))

(assert (= (and d!7047 res!24189) b!40550))

(assert (= (and d!7047 c!4969) b!40545))

(assert (= (and d!7047 (not c!4969)) b!40544))

(assert (= (and d!7047 res!24184) b!40554))

(assert (= (and b!40554 res!24185) b!40555))

(assert (= (and b!40554 (not res!24187)) b!40563))

(assert (= (and b!40563 res!24186) b!40543))

(assert (= (and b!40554 res!24188) b!40559))

(assert (= (and b!40559 c!4970) b!40556))

(assert (= (and b!40559 (not c!4970)) b!40562))

(assert (= (and b!40556 res!24192) b!40546))

(assert (= (or b!40556 b!40562) bm!3164))

(assert (= (and b!40559 res!24190) b!40557))

(assert (= (and b!40557 c!4973) b!40553))

(assert (= (and b!40557 (not c!4973)) b!40558))

(assert (= (and b!40553 res!24191) b!40547))

(assert (= (or b!40553 b!40558) bm!3165))

(declare-fun b_lambda!2071 () Bool)

(assert (=> (not b_lambda!2071) (not b!40543)))

(declare-fun t!3918 () Bool)

(declare-fun tb!847 () Bool)

(assert (=> (and start!5692 (= defaultEntry!470 (defaultEntry!1803 lt!15445)) t!3918) tb!847))

(declare-fun result!1449 () Bool)

(assert (=> tb!847 (= result!1449 tp_is_empty!1753)))

(assert (=> b!40543 t!3918))

(declare-fun b_and!2371 () Bool)

(assert (= b_and!2359 (and (=> t!3918 result!1449) b_and!2371)))

(declare-fun m!33467 () Bool)

(assert (=> bm!3164 m!33467))

(assert (=> b!40543 m!33349))

(declare-fun m!33469 () Bool)

(assert (=> b!40543 m!33469))

(declare-fun m!33471 () Bool)

(assert (=> b!40543 m!33471))

(assert (=> b!40543 m!33469))

(declare-fun m!33473 () Bool)

(assert (=> b!40543 m!33473))

(assert (=> b!40543 m!33349))

(declare-fun m!33475 () Bool)

(assert (=> b!40543 m!33475))

(assert (=> b!40543 m!33471))

(declare-fun m!33477 () Bool)

(assert (=> bm!3170 m!33477))

(declare-fun m!33479 () Bool)

(assert (=> b!40551 m!33479))

(assert (=> b!40555 m!33349))

(assert (=> b!40555 m!33349))

(assert (=> b!40555 m!33351))

(assert (=> b!40563 m!33349))

(assert (=> b!40563 m!33349))

(declare-fun m!33481 () Bool)

(assert (=> b!40563 m!33481))

(declare-fun m!33483 () Bool)

(assert (=> b!40547 m!33483))

(declare-fun m!33485 () Bool)

(assert (=> b!40545 m!33485))

(declare-fun m!33487 () Bool)

(assert (=> b!40545 m!33487))

(declare-fun m!33489 () Bool)

(assert (=> b!40545 m!33489))

(declare-fun m!33491 () Bool)

(assert (=> b!40545 m!33491))

(declare-fun m!33495 () Bool)

(assert (=> b!40545 m!33495))

(declare-fun m!33497 () Bool)

(assert (=> b!40545 m!33497))

(declare-fun m!33499 () Bool)

(assert (=> b!40545 m!33499))

(assert (=> b!40545 m!33477))

(assert (=> b!40545 m!33499))

(declare-fun m!33501 () Bool)

(assert (=> b!40545 m!33501))

(declare-fun m!33503 () Bool)

(assert (=> b!40545 m!33503))

(assert (=> b!40545 m!33495))

(declare-fun m!33507 () Bool)

(assert (=> b!40545 m!33507))

(declare-fun m!33509 () Bool)

(assert (=> b!40545 m!33509))

(assert (=> b!40545 m!33349))

(declare-fun m!33511 () Bool)

(assert (=> b!40545 m!33511))

(assert (=> b!40545 m!33511))

(declare-fun m!33513 () Bool)

(assert (=> b!40545 m!33513))

(assert (=> b!40545 m!33487))

(declare-fun m!33515 () Bool)

(assert (=> b!40545 m!33515))

(declare-fun m!33517 () Bool)

(assert (=> b!40545 m!33517))

(declare-fun m!33519 () Bool)

(assert (=> d!7047 m!33519))

(declare-fun m!33521 () Bool)

(assert (=> bm!3166 m!33521))

(assert (=> b!40550 m!33349))

(assert (=> b!40550 m!33349))

(assert (=> b!40550 m!33351))

(declare-fun m!33523 () Bool)

(assert (=> b!40546 m!33523))

(declare-fun m!33525 () Bool)

(assert (=> bm!3165 m!33525))

(assert (=> d!7003 d!7047))

(declare-fun d!7065 () Bool)

(assert (=> d!7065 (= (validKeyInArray!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)) (and (not (= (select (arr!1239 lt!15443) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1239 lt!15443) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40383 d!7065))

(declare-fun d!7069 () Bool)

(declare-fun lt!15743 () Bool)

(declare-fun content!30 (List!1053) (Set (_ BitVec 64)))

(assert (=> d!7069 (= lt!15743 (set.member (select (arr!1239 lt!15443) #b00000000000000000000000000000000) (content!30 Nil!1050)))))

(declare-fun e!25750 () Bool)

(assert (=> d!7069 (= lt!15743 e!25750)))

(declare-fun res!24204 () Bool)

(assert (=> d!7069 (=> (not res!24204) (not e!25750))))

(assert (=> d!7069 (= res!24204 (is-Cons!1049 Nil!1050))))

(assert (=> d!7069 (= (contains!511 Nil!1050 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)) lt!15743)))

(declare-fun b!40595 () Bool)

(declare-fun e!25749 () Bool)

(assert (=> b!40595 (= e!25750 e!25749)))

(declare-fun res!24205 () Bool)

(assert (=> b!40595 (=> res!24205 e!25749)))

(assert (=> b!40595 (= res!24205 (= (h!1623 Nil!1050) (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(declare-fun b!40596 () Bool)

(assert (=> b!40596 (= e!25749 (contains!511 (t!3906 Nil!1050) (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(assert (= (and d!7069 res!24204) b!40595))

(assert (= (and b!40595 (not res!24205)) b!40596))

(declare-fun m!33527 () Bool)

(assert (=> d!7069 m!33527))

(assert (=> d!7069 m!33285))

(declare-fun m!33529 () Bool)

(assert (=> d!7069 m!33529))

(assert (=> b!40596 m!33285))

(declare-fun m!33531 () Bool)

(assert (=> b!40596 m!33531))

(assert (=> b!40324 d!7069))

(assert (=> b!40323 d!7065))

(declare-fun d!7071 () Bool)

(assert (=> d!7071 (arrayContainsKey!0 lt!15443 lt!15534 #b00000000000000000000000000000000)))

(declare-fun lt!15746 () Unit!981)

(declare-fun choose!13 (array!2591 (_ BitVec 64) (_ BitVec 32)) Unit!981)

(assert (=> d!7071 (= lt!15746 (choose!13 lt!15443 lt!15534 #b00000000000000000000000000000000))))

(assert (=> d!7071 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7071 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15443 lt!15534 #b00000000000000000000000000000000) lt!15746)))

(declare-fun bs!1709 () Bool)

(assert (= bs!1709 d!7071))

(assert (=> bs!1709 m!33319))

(declare-fun m!33533 () Bool)

(assert (=> bs!1709 m!33533))

(assert (=> b!40385 d!7071))

(declare-fun d!7073 () Bool)

(declare-fun res!24240 () Bool)

(declare-fun e!25779 () Bool)

(assert (=> d!7073 (=> res!24240 e!25779)))

(assert (=> d!7073 (= res!24240 (= (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15534))))

(assert (=> d!7073 (= (arrayContainsKey!0 lt!15443 lt!15534 #b00000000000000000000000000000000) e!25779)))

(declare-fun b!40645 () Bool)

(declare-fun e!25780 () Bool)

(assert (=> b!40645 (= e!25779 e!25780)))

(declare-fun res!24241 () Bool)

(assert (=> b!40645 (=> (not res!24241) (not e!25780))))

(assert (=> b!40645 (= res!24241 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 lt!15443)))))

(declare-fun b!40646 () Bool)

(assert (=> b!40646 (= e!25780 (arrayContainsKey!0 lt!15443 lt!15534 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7073 (not res!24240)) b!40645))

(assert (= (and b!40645 res!24241) b!40646))

(assert (=> d!7073 m!33285))

(declare-fun m!33547 () Bool)

(assert (=> b!40646 m!33547))

(assert (=> b!40385 d!7073))

(declare-fun b!40707 () Bool)

(declare-fun e!25815 () SeekEntryResult!173)

(declare-fun e!25816 () SeekEntryResult!173)

(assert (=> b!40707 (= e!25815 e!25816)))

(declare-fun lt!15783 () (_ BitVec 64))

(declare-fun lt!15785 () SeekEntryResult!173)

(assert (=> b!40707 (= lt!15783 (select (arr!1239 lt!15443) (index!2816 lt!15785)))))

(declare-fun c!5008 () Bool)

(assert (=> b!40707 (= c!5008 (= lt!15783 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(declare-fun b!40708 () Bool)

(assert (=> b!40708 (= e!25815 Undefined!173)))

(declare-fun b!40709 () Bool)

(assert (=> b!40709 (= e!25816 (Found!173 (index!2816 lt!15785)))))

(declare-fun b!40710 () Bool)

(declare-fun c!5009 () Bool)

(assert (=> b!40710 (= c!5009 (= lt!15783 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25817 () SeekEntryResult!173)

(assert (=> b!40710 (= e!25816 e!25817)))

(declare-fun b!40711 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2591 (_ BitVec 32)) SeekEntryResult!173)

(assert (=> b!40711 (= e!25817 (seekKeyOrZeroReturnVacant!0 (x!7720 lt!15785) (index!2816 lt!15785) (index!2816 lt!15785) (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15443 mask!853))))

(declare-fun d!7083 () Bool)

(declare-fun lt!15784 () SeekEntryResult!173)

(assert (=> d!7083 (and (or (is-Undefined!173 lt!15784) (not (is-Found!173 lt!15784)) (and (bvsge (index!2815 lt!15784) #b00000000000000000000000000000000) (bvslt (index!2815 lt!15784) (size!1376 lt!15443)))) (or (is-Undefined!173 lt!15784) (is-Found!173 lt!15784) (not (is-MissingZero!173 lt!15784)) (and (bvsge (index!2814 lt!15784) #b00000000000000000000000000000000) (bvslt (index!2814 lt!15784) (size!1376 lt!15443)))) (or (is-Undefined!173 lt!15784) (is-Found!173 lt!15784) (is-MissingZero!173 lt!15784) (not (is-MissingVacant!173 lt!15784)) (and (bvsge (index!2817 lt!15784) #b00000000000000000000000000000000) (bvslt (index!2817 lt!15784) (size!1376 lt!15443)))) (or (is-Undefined!173 lt!15784) (ite (is-Found!173 lt!15784) (= (select (arr!1239 lt!15443) (index!2815 lt!15784)) (select (arr!1239 lt!15443) #b00000000000000000000000000000000)) (ite (is-MissingZero!173 lt!15784) (= (select (arr!1239 lt!15443) (index!2814 lt!15784)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!173 lt!15784) (= (select (arr!1239 lt!15443) (index!2817 lt!15784)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7083 (= lt!15784 e!25815)))

(declare-fun c!5007 () Bool)

(assert (=> d!7083 (= c!5007 (and (is-Intermediate!173 lt!15785) (undefined!985 lt!15785)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!2591 (_ BitVec 32)) SeekEntryResult!173)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!7083 (= lt!15785 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) mask!853) (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15443 mask!853))))

(assert (=> d!7083 (validMask!0 mask!853)))

(assert (=> d!7083 (= (seekEntryOrOpen!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15443 mask!853) lt!15784)))

(declare-fun b!40712 () Bool)

(assert (=> b!40712 (= e!25817 (MissingZero!173 (index!2816 lt!15785)))))

(assert (= (and d!7083 c!5007) b!40708))

(assert (= (and d!7083 (not c!5007)) b!40707))

(assert (= (and b!40707 c!5008) b!40709))

(assert (= (and b!40707 (not c!5008)) b!40710))

(assert (= (and b!40710 c!5009) b!40712))

(assert (= (and b!40710 (not c!5009)) b!40711))

(declare-fun m!33619 () Bool)

(assert (=> b!40707 m!33619))

(assert (=> b!40711 m!33285))

(declare-fun m!33621 () Bool)

(assert (=> b!40711 m!33621))

(declare-fun m!33623 () Bool)

(assert (=> d!7083 m!33623))

(declare-fun m!33627 () Bool)

(assert (=> d!7083 m!33627))

(declare-fun m!33629 () Bool)

(assert (=> d!7083 m!33629))

(assert (=> d!7083 m!33285))

(declare-fun m!33631 () Bool)

(assert (=> d!7083 m!33631))

(declare-fun m!33633 () Bool)

(assert (=> d!7083 m!33633))

(assert (=> d!7083 m!33181))

(assert (=> d!7083 m!33285))

(assert (=> d!7083 m!33629))

(assert (=> b!40385 d!7083))

(assert (=> d!7023 d!7009))

(declare-fun d!7097 () Bool)

(assert (=> d!7097 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!15443 mask!853)))

(assert (=> d!7097 true))

(declare-fun _$30!51 () Unit!981)

(assert (=> d!7097 (= (choose!34 lt!15443 mask!853 #b00000000000000000000000000000000) _$30!51)))

(declare-fun bs!1711 () Bool)

(assert (= bs!1711 d!7097))

(assert (=> bs!1711 m!33193))

(assert (=> d!7023 d!7097))

(assert (=> d!7023 d!6975))

(declare-fun b!40731 () Bool)

(declare-fun e!25831 () Bool)

(declare-fun call!3201 () Bool)

(assert (=> b!40731 (= e!25831 call!3201)))

(declare-fun bm!3198 () Bool)

(declare-fun c!5016 () Bool)

(assert (=> bm!3198 (= call!3201 (arrayNoDuplicates!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5016 (Cons!1049 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050))))))

(declare-fun b!40732 () Bool)

(declare-fun e!25833 () Bool)

(declare-fun e!25830 () Bool)

(assert (=> b!40732 (= e!25833 e!25830)))

(declare-fun res!24279 () Bool)

(assert (=> b!40732 (=> (not res!24279) (not e!25830))))

(declare-fun e!25832 () Bool)

(assert (=> b!40732 (= res!24279 (not e!25832))))

(declare-fun res!24278 () Bool)

(assert (=> b!40732 (=> (not res!24278) (not e!25832))))

(assert (=> b!40732 (= res!24278 (validKeyInArray!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40733 () Bool)

(assert (=> b!40733 (= e!25831 call!3201)))

(declare-fun d!7099 () Bool)

(declare-fun res!24280 () Bool)

(assert (=> d!7099 (=> res!24280 e!25833)))

(assert (=> d!7099 (= res!24280 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 lt!15443)))))

(assert (=> d!7099 (= (arrayNoDuplicates!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) e!25833)))

(declare-fun b!40734 () Bool)

(assert (=> b!40734 (= e!25830 e!25831)))

(assert (=> b!40734 (= c!5016 (validKeyInArray!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40735 () Bool)

(assert (=> b!40735 (= e!25832 (contains!511 (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050) (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7099 (not res!24280)) b!40732))

(assert (= (and b!40732 res!24278) b!40735))

(assert (= (and b!40732 res!24279) b!40734))

(assert (= (and b!40734 c!5016) b!40731))

(assert (= (and b!40734 (not c!5016)) b!40733))

(assert (= (or b!40731 b!40733) bm!3198))

(assert (=> bm!3198 m!33371))

(declare-fun m!33641 () Bool)

(assert (=> bm!3198 m!33641))

(assert (=> b!40732 m!33371))

(assert (=> b!40732 m!33371))

(assert (=> b!40732 m!33373))

(assert (=> b!40734 m!33371))

(assert (=> b!40734 m!33371))

(assert (=> b!40734 m!33373))

(assert (=> b!40735 m!33371))

(assert (=> b!40735 m!33371))

(declare-fun m!33643 () Bool)

(assert (=> b!40735 m!33643))

(assert (=> bm!3104 d!7099))

(assert (=> b!40349 d!7065))

(declare-fun b!40742 () Bool)

(declare-fun e!25838 () Bool)

(declare-fun call!3202 () Bool)

(assert (=> b!40742 (= e!25838 call!3202)))

(declare-fun bm!3199 () Bool)

(declare-fun c!5020 () Bool)

(assert (=> bm!3199 (= call!3202 (arrayNoDuplicates!0 (_keys!3292 lt!15445) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5020 (Cons!1049 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) Nil!1050) Nil!1050)))))

(declare-fun b!40743 () Bool)

(declare-fun e!25840 () Bool)

(declare-fun e!25837 () Bool)

(assert (=> b!40743 (= e!25840 e!25837)))

(declare-fun res!24282 () Bool)

(assert (=> b!40743 (=> (not res!24282) (not e!25837))))

(declare-fun e!25839 () Bool)

(assert (=> b!40743 (= res!24282 (not e!25839))))

(declare-fun res!24281 () Bool)

(assert (=> b!40743 (=> (not res!24281) (not e!25839))))

(assert (=> b!40743 (= res!24281 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun b!40744 () Bool)

(assert (=> b!40744 (= e!25838 call!3202)))

(declare-fun d!7103 () Bool)

(declare-fun res!24283 () Bool)

(assert (=> d!7103 (=> res!24283 e!25840)))

(assert (=> d!7103 (= res!24283 (bvsge #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(assert (=> d!7103 (= (arrayNoDuplicates!0 (_keys!3292 lt!15445) #b00000000000000000000000000000000 Nil!1050) e!25840)))

(declare-fun b!40745 () Bool)

(assert (=> b!40745 (= e!25837 e!25838)))

(assert (=> b!40745 (= c!5020 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun b!40746 () Bool)

(assert (=> b!40746 (= e!25839 (contains!511 Nil!1050 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(assert (= (and d!7103 (not res!24283)) b!40743))

(assert (= (and b!40743 res!24281) b!40746))

(assert (= (and b!40743 res!24282) b!40745))

(assert (= (and b!40745 c!5020) b!40742))

(assert (= (and b!40745 (not c!5020)) b!40744))

(assert (= (or b!40742 b!40744) bm!3199))

(assert (=> bm!3199 m!33349))

(declare-fun m!33659 () Bool)

(assert (=> bm!3199 m!33659))

(assert (=> b!40743 m!33349))

(assert (=> b!40743 m!33349))

(assert (=> b!40743 m!33351))

(assert (=> b!40745 m!33349))

(assert (=> b!40745 m!33349))

(assert (=> b!40745 m!33351))

(assert (=> b!40746 m!33349))

(assert (=> b!40746 m!33349))

(declare-fun m!33661 () Bool)

(assert (=> b!40746 m!33661))

(assert (=> b!40285 d!7103))

(declare-fun b!40747 () Bool)

(declare-fun e!25842 () (_ BitVec 32))

(declare-fun call!3203 () (_ BitVec 32))

(assert (=> b!40747 (= e!25842 call!3203)))

(declare-fun b!40748 () Bool)

(declare-fun e!25841 () (_ BitVec 32))

(assert (=> b!40748 (= e!25841 e!25842)))

(declare-fun c!5022 () Bool)

(assert (=> b!40748 (= c!5022 (validKeyInArray!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3200 () Bool)

(assert (=> bm!3200 (= call!3203 (arrayCountValidKeys!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!7107 () Bool)

(declare-fun lt!15798 () (_ BitVec 32))

(assert (=> d!7107 (and (bvsge lt!15798 #b00000000000000000000000000000000) (bvsle lt!15798 (bvsub (size!1376 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7107 (= lt!15798 e!25841)))

(declare-fun c!5021 () Bool)

(assert (=> d!7107 (= c!5021 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7107 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1376 lt!15443)))))

(assert (=> d!7107 (= (arrayCountValidKeys!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15798)))

(declare-fun b!40749 () Bool)

(assert (=> b!40749 (= e!25841 #b00000000000000000000000000000000)))

(declare-fun b!40750 () Bool)

(assert (=> b!40750 (= e!25842 (bvadd #b00000000000000000000000000000001 call!3203))))

(assert (= (and d!7107 c!5021) b!40749))

(assert (= (and d!7107 (not c!5021)) b!40748))

(assert (= (and b!40748 c!5022) b!40750))

(assert (= (and b!40748 (not c!5022)) b!40747))

(assert (= (or b!40750 b!40747) bm!3200))

(assert (=> b!40748 m!33371))

(assert (=> b!40748 m!33371))

(assert (=> b!40748 m!33373))

(declare-fun m!33663 () Bool)

(assert (=> bm!3200 m!33663))

(assert (=> bm!3110 d!7107))

(assert (=> b!40321 d!7065))

(declare-fun b!40772 () Bool)

(declare-fun res!24308 () Bool)

(declare-fun e!25857 () Bool)

(assert (=> b!40772 (=> (not res!24308) (not e!25857))))

(declare-fun size!1395 (LongMapFixedSize!238) (_ BitVec 32))

(assert (=> b!40772 (= res!24308 (bvsge (size!1395 lt!15445) (_size!168 lt!15445)))))

(declare-fun d!7109 () Bool)

(declare-fun res!24307 () Bool)

(assert (=> d!7109 (=> (not res!24307) (not e!25857))))

(assert (=> d!7109 (= res!24307 (validMask!0 (mask!5176 lt!15445)))))

(assert (=> d!7109 (= (simpleValid!27 lt!15445) e!25857)))

(declare-fun b!40774 () Bool)

(assert (=> b!40774 (= e!25857 (and (bvsge (extraKeys!1694 lt!15445) #b00000000000000000000000000000000) (bvsle (extraKeys!1694 lt!15445) #b00000000000000000000000000000011) (bvsge (_vacant!168 lt!15445) #b00000000000000000000000000000000)))))

(declare-fun b!40773 () Bool)

(declare-fun res!24309 () Bool)

(assert (=> b!40773 (=> (not res!24309) (not e!25857))))

(assert (=> b!40773 (= res!24309 (= (size!1395 lt!15445) (bvadd (_size!168 lt!15445) (bvsdiv (bvadd (extraKeys!1694 lt!15445) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!40771 () Bool)

(declare-fun res!24310 () Bool)

(assert (=> b!40771 (=> (not res!24310) (not e!25857))))

(assert (=> b!40771 (= res!24310 (and (= (size!1377 (_values!1786 lt!15445)) (bvadd (mask!5176 lt!15445) #b00000000000000000000000000000001)) (= (size!1376 (_keys!3292 lt!15445)) (size!1377 (_values!1786 lt!15445))) (bvsge (_size!168 lt!15445) #b00000000000000000000000000000000) (bvsle (_size!168 lt!15445) (bvadd (mask!5176 lt!15445) #b00000000000000000000000000000001))))))

(assert (= (and d!7109 res!24307) b!40771))

(assert (= (and b!40771 res!24310) b!40772))

(assert (= (and b!40772 res!24308) b!40773))

(assert (= (and b!40773 res!24309) b!40774))

(declare-fun m!33675 () Bool)

(assert (=> b!40772 m!33675))

(assert (=> d!7109 m!33519))

(assert (=> b!40773 m!33675))

(assert (=> d!6979 d!7109))

(push 1)

(assert (not b!40555))

(assert (not b!40547))

(assert (not bm!3125))

(assert (not bm!3126))

(assert (not b!40545))

(assert (not b!40748))

(assert (not bm!3170))

(assert (not b!40743))

(assert (not b!40426))

(assert (not d!7071))

(assert (not b!40773))

(assert (not b_next!1363))

(assert (not d!7047))

(assert (not b!40428))

(assert tp_is_empty!1753)

(assert (not d!7041))

(assert (not b_lambda!2071))

(assert (not d!7109))

(assert (not bm!3198))

(assert b_and!2371)

(assert (not b!40746))

(assert (not d!7069))

(assert (not b!40424))

(assert (not b!40772))

(assert (not b!40546))

(assert (not b!40596))

(assert (not b!40543))

(assert (not b!40646))

(assert (not d!7083))

(assert (not b!40550))

(assert (not bm!3123))

(assert (not bm!3165))

(assert (not b!40413))

(assert (not b!40551))

(assert (not b_lambda!2063))

(assert (not d!7037))

(assert (not b!40422))

(assert (not b!40563))

(assert (not b!40711))

(assert (not b!40732))

(assert (not b!40735))

(assert (not bm!3200))

(assert (not bm!3164))

(assert (not d!7097))

(assert (not bm!3166))

(assert (not b!40734))

(assert (not bm!3199))

(assert (not b!40745))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2371)

(assert (not b_next!1363))

(check-sat)

(get-model)

(pop 1)

(declare-fun b!40805 () Bool)

(declare-fun e!25875 () Bool)

(declare-fun call!3207 () Bool)

(assert (=> b!40805 (= e!25875 call!3207)))

(declare-fun b!40806 () Bool)

(declare-fun e!25876 () Bool)

(assert (=> b!40806 (= e!25876 e!25875)))

(declare-fun c!5037 () Bool)

(assert (=> b!40806 (= c!5037 (validKeyInArray!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40807 () Bool)

(declare-fun e!25874 () Bool)

(assert (=> b!40807 (= e!25874 call!3207)))

(declare-fun b!40808 () Bool)

(assert (=> b!40808 (= e!25875 e!25874)))

(declare-fun lt!15819 () (_ BitVec 64))

(assert (=> b!40808 (= lt!15819 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(declare-fun lt!15821 () Unit!981)

(assert (=> b!40808 (= lt!15821 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15443 lt!15819 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (=> b!40808 (arrayContainsKey!0 lt!15443 lt!15819 #b00000000000000000000000000000000)))

(declare-fun lt!15820 () Unit!981)

(assert (=> b!40808 (= lt!15820 lt!15821)))

(declare-fun res!24317 () Bool)

(assert (=> b!40808 (= res!24317 (= (seekEntryOrOpen!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) lt!15443 mask!853) (Found!173 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> b!40808 (=> (not res!24317) (not e!25874))))

(declare-fun d!7129 () Bool)

(declare-fun res!24316 () Bool)

(assert (=> d!7129 (=> res!24316 e!25876)))

(assert (=> d!7129 (= res!24316 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1376 lt!15443)))))

(assert (=> d!7129 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15443 mask!853) e!25876)))

(declare-fun bm!3204 () Bool)

(assert (=> bm!3204 (= call!3207 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!15443 mask!853))))

(assert (= (and d!7129 (not res!24316)) b!40806))

(assert (= (and b!40806 c!5037) b!40808))

(assert (= (and b!40806 (not c!5037)) b!40805))

(assert (= (and b!40808 res!24317) b!40807))

(assert (= (or b!40807 b!40805) bm!3204))

(declare-fun m!33703 () Bool)

(assert (=> b!40806 m!33703))

(assert (=> b!40806 m!33703))

(declare-fun m!33705 () Bool)

(assert (=> b!40806 m!33705))

(assert (=> b!40808 m!33703))

(declare-fun m!33707 () Bool)

(assert (=> b!40808 m!33707))

(declare-fun m!33709 () Bool)

(assert (=> b!40808 m!33709))

(assert (=> b!40808 m!33703))

(declare-fun m!33711 () Bool)

(assert (=> b!40808 m!33711))

(declare-fun m!33713 () Bool)

(assert (=> bm!3204 m!33713))

(assert (=> bm!3126 d!7129))

(declare-fun d!7131 () Bool)

(assert (=> d!7131 (= (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)) (and (not (= (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40555 d!7131))

(declare-fun d!7133 () Bool)

(declare-fun lt!15822 () Bool)

(assert (=> d!7133 (= lt!15822 (set.member (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (content!30 (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050))))))

(declare-fun e!25878 () Bool)

(assert (=> d!7133 (= lt!15822 e!25878)))

(declare-fun res!24318 () Bool)

(assert (=> d!7133 (=> (not res!24318) (not e!25878))))

(assert (=> d!7133 (= res!24318 (is-Cons!1049 (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)))))

(assert (=> d!7133 (= (contains!511 (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050) (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) lt!15822)))

(declare-fun b!40809 () Bool)

(declare-fun e!25877 () Bool)

(assert (=> b!40809 (= e!25878 e!25877)))

(declare-fun res!24319 () Bool)

(assert (=> b!40809 (=> res!24319 e!25877)))

(assert (=> b!40809 (= res!24319 (= (h!1623 (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40810 () Bool)

(assert (=> b!40810 (= e!25877 (contains!511 (t!3906 (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7133 res!24318) b!40809))

(assert (= (and b!40809 (not res!24319)) b!40810))

(declare-fun m!33715 () Bool)

(assert (=> d!7133 m!33715))

(assert (=> d!7133 m!33371))

(declare-fun m!33717 () Bool)

(assert (=> d!7133 m!33717))

(assert (=> b!40810 m!33371))

(declare-fun m!33719 () Bool)

(assert (=> b!40810 m!33719))

(assert (=> b!40735 d!7133))

(declare-fun d!7135 () Bool)

(assert (=> d!7135 (= (validKeyInArray!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (and (not (= (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!40426 d!7135))

(assert (=> b!40743 d!7131))

(assert (=> d!7071 d!7073))

(declare-fun d!7137 () Bool)

(assert (=> d!7137 (arrayContainsKey!0 lt!15443 lt!15534 #b00000000000000000000000000000000)))

(assert (=> d!7137 true))

(declare-fun _$60!341 () Unit!981)

(assert (=> d!7137 (= (choose!13 lt!15443 lt!15534 #b00000000000000000000000000000000) _$60!341)))

(declare-fun bs!1717 () Bool)

(assert (= bs!1717 d!7137))

(assert (=> bs!1717 m!33319))

(assert (=> d!7071 d!7137))

(declare-fun b!40811 () Bool)

(declare-fun e!25880 () Bool)

(declare-fun call!3208 () Bool)

(assert (=> b!40811 (= e!25880 call!3208)))

(declare-fun c!5038 () Bool)

(declare-fun bm!3205 () Bool)

(assert (=> bm!3205 (= call!3208 (arrayNoDuplicates!0 (_keys!3292 lt!15445) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5038 (Cons!1049 (select (arr!1239 (_keys!3292 lt!15445)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!5020 (Cons!1049 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) (ite c!5020 (Cons!1049 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) Nil!1050) Nil!1050))))))

(declare-fun b!40812 () Bool)

(declare-fun e!25882 () Bool)

(declare-fun e!25879 () Bool)

(assert (=> b!40812 (= e!25882 e!25879)))

(declare-fun res!24321 () Bool)

(assert (=> b!40812 (=> (not res!24321) (not e!25879))))

(declare-fun e!25881 () Bool)

(assert (=> b!40812 (= res!24321 (not e!25881))))

(declare-fun res!24320 () Bool)

(assert (=> b!40812 (=> (not res!24320) (not e!25881))))

(assert (=> b!40812 (= res!24320 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40813 () Bool)

(assert (=> b!40813 (= e!25880 call!3208)))

(declare-fun d!7139 () Bool)

(declare-fun res!24322 () Bool)

(assert (=> d!7139 (=> res!24322 e!25882)))

(assert (=> d!7139 (= res!24322 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 (_keys!3292 lt!15445))))))

(assert (=> d!7139 (= (arrayNoDuplicates!0 (_keys!3292 lt!15445) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!5020 (Cons!1049 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) e!25882)))

(declare-fun b!40814 () Bool)

(assert (=> b!40814 (= e!25879 e!25880)))

(assert (=> b!40814 (= c!5038 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40815 () Bool)

(assert (=> b!40815 (= e!25881 (contains!511 (ite c!5020 (Cons!1049 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) Nil!1050) Nil!1050) (select (arr!1239 (_keys!3292 lt!15445)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (= (and d!7139 (not res!24322)) b!40812))

(assert (= (and b!40812 res!24320) b!40815))

(assert (= (and b!40812 res!24321) b!40814))

(assert (= (and b!40814 c!5038) b!40811))

(assert (= (and b!40814 (not c!5038)) b!40813))

(assert (= (or b!40811 b!40813) bm!3205))

(declare-fun m!33721 () Bool)

(assert (=> bm!3205 m!33721))

(declare-fun m!33723 () Bool)

(assert (=> bm!3205 m!33723))

(assert (=> b!40812 m!33721))

(assert (=> b!40812 m!33721))

(declare-fun m!33725 () Bool)

(assert (=> b!40812 m!33725))

(assert (=> b!40814 m!33721))

(assert (=> b!40814 m!33721))

(assert (=> b!40814 m!33725))

(assert (=> b!40815 m!33721))

(assert (=> b!40815 m!33721))

(declare-fun m!33727 () Bool)

(assert (=> b!40815 m!33727))

(assert (=> bm!3199 d!7139))

(declare-fun d!7141 () Bool)

(assert (=> d!7141 (= (content!30 Nil!1050) (as set.empty (Set (_ BitVec 64))))))

(assert (=> d!7069 d!7141))

(declare-fun d!7143 () Bool)

(assert (=> d!7143 (arrayContainsKey!0 lt!15443 lt!15556 #b00000000000000000000000000000000)))

(declare-fun lt!15823 () Unit!981)

(assert (=> d!7143 (= lt!15823 (choose!13 lt!15443 lt!15556 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> d!7143 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(assert (=> d!7143 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!15443 lt!15556 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15823)))

(declare-fun bs!1718 () Bool)

(assert (= bs!1718 d!7143))

(assert (=> bs!1718 m!33377))

(declare-fun m!33729 () Bool)

(assert (=> bs!1718 m!33729))

(assert (=> b!40428 d!7143))

(declare-fun d!7145 () Bool)

(declare-fun res!24323 () Bool)

(declare-fun e!25883 () Bool)

(assert (=> d!7145 (=> res!24323 e!25883)))

(assert (=> d!7145 (= res!24323 (= (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15556))))

(assert (=> d!7145 (= (arrayContainsKey!0 lt!15443 lt!15556 #b00000000000000000000000000000000) e!25883)))

(declare-fun b!40816 () Bool)

(declare-fun e!25884 () Bool)

(assert (=> b!40816 (= e!25883 e!25884)))

(declare-fun res!24324 () Bool)

(assert (=> b!40816 (=> (not res!24324) (not e!25884))))

(assert (=> b!40816 (= res!24324 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 lt!15443)))))

(declare-fun b!40817 () Bool)

(assert (=> b!40817 (= e!25884 (arrayContainsKey!0 lt!15443 lt!15556 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7145 (not res!24323)) b!40816))

(assert (= (and b!40816 res!24324) b!40817))

(assert (=> d!7145 m!33285))

(declare-fun m!33731 () Bool)

(assert (=> b!40817 m!33731))

(assert (=> b!40428 d!7145))

(declare-fun b!40818 () Bool)

(declare-fun e!25885 () SeekEntryResult!173)

(declare-fun e!25886 () SeekEntryResult!173)

(assert (=> b!40818 (= e!25885 e!25886)))

(declare-fun lt!15824 () (_ BitVec 64))

(declare-fun lt!15826 () SeekEntryResult!173)

(assert (=> b!40818 (= lt!15824 (select (arr!1239 lt!15443) (index!2816 lt!15826)))))

(declare-fun c!5040 () Bool)

(assert (=> b!40818 (= c!5040 (= lt!15824 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40819 () Bool)

(assert (=> b!40819 (= e!25885 Undefined!173)))

(declare-fun b!40820 () Bool)

(assert (=> b!40820 (= e!25886 (Found!173 (index!2816 lt!15826)))))

(declare-fun b!40821 () Bool)

(declare-fun c!5041 () Bool)

(assert (=> b!40821 (= c!5041 (= lt!15824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25887 () SeekEntryResult!173)

(assert (=> b!40821 (= e!25886 e!25887)))

(declare-fun b!40822 () Bool)

(assert (=> b!40822 (= e!25887 (seekKeyOrZeroReturnVacant!0 (x!7720 lt!15826) (index!2816 lt!15826) (index!2816 lt!15826) (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15443 mask!853))))

(declare-fun d!7147 () Bool)

(declare-fun lt!15825 () SeekEntryResult!173)

(assert (=> d!7147 (and (or (is-Undefined!173 lt!15825) (not (is-Found!173 lt!15825)) (and (bvsge (index!2815 lt!15825) #b00000000000000000000000000000000) (bvslt (index!2815 lt!15825) (size!1376 lt!15443)))) (or (is-Undefined!173 lt!15825) (is-Found!173 lt!15825) (not (is-MissingZero!173 lt!15825)) (and (bvsge (index!2814 lt!15825) #b00000000000000000000000000000000) (bvslt (index!2814 lt!15825) (size!1376 lt!15443)))) (or (is-Undefined!173 lt!15825) (is-Found!173 lt!15825) (is-MissingZero!173 lt!15825) (not (is-MissingVacant!173 lt!15825)) (and (bvsge (index!2817 lt!15825) #b00000000000000000000000000000000) (bvslt (index!2817 lt!15825) (size!1376 lt!15443)))) (or (is-Undefined!173 lt!15825) (ite (is-Found!173 lt!15825) (= (select (arr!1239 lt!15443) (index!2815 lt!15825)) (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))) (ite (is-MissingZero!173 lt!15825) (= (select (arr!1239 lt!15443) (index!2814 lt!15825)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!173 lt!15825) (= (select (arr!1239 lt!15443) (index!2817 lt!15825)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7147 (= lt!15825 e!25885)))

(declare-fun c!5039 () Bool)

(assert (=> d!7147 (= c!5039 (and (is-Intermediate!173 lt!15826) (undefined!985 lt!15826)))))

(assert (=> d!7147 (= lt!15826 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) mask!853) (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15443 mask!853))))

(assert (=> d!7147 (validMask!0 mask!853)))

(assert (=> d!7147 (= (seekEntryOrOpen!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15443 mask!853) lt!15825)))

(declare-fun b!40823 () Bool)

(assert (=> b!40823 (= e!25887 (MissingZero!173 (index!2816 lt!15826)))))

(assert (= (and d!7147 c!5039) b!40819))

(assert (= (and d!7147 (not c!5039)) b!40818))

(assert (= (and b!40818 c!5040) b!40820))

(assert (= (and b!40818 (not c!5040)) b!40821))

(assert (= (and b!40821 c!5041) b!40823))

(assert (= (and b!40821 (not c!5041)) b!40822))

(declare-fun m!33733 () Bool)

(assert (=> b!40818 m!33733))

(assert (=> b!40822 m!33371))

(declare-fun m!33735 () Bool)

(assert (=> b!40822 m!33735))

(declare-fun m!33737 () Bool)

(assert (=> d!7147 m!33737))

(declare-fun m!33739 () Bool)

(assert (=> d!7147 m!33739))

(declare-fun m!33741 () Bool)

(assert (=> d!7147 m!33741))

(assert (=> d!7147 m!33371))

(declare-fun m!33743 () Bool)

(assert (=> d!7147 m!33743))

(declare-fun m!33745 () Bool)

(assert (=> d!7147 m!33745))

(assert (=> d!7147 m!33181))

(assert (=> d!7147 m!33371))

(assert (=> d!7147 m!33741))

(assert (=> b!40428 d!7147))

(declare-fun b!40842 () Bool)

(declare-fun e!25898 () Bool)

(declare-fun e!25901 () Bool)

(assert (=> b!40842 (= e!25898 e!25901)))

(declare-fun res!24331 () Bool)

(declare-fun lt!15831 () SeekEntryResult!173)

(assert (=> b!40842 (= res!24331 (and (is-Intermediate!173 lt!15831) (not (undefined!985 lt!15831)) (bvslt (x!7720 lt!15831) #b01111111111111111111111111111110) (bvsge (x!7720 lt!15831) #b00000000000000000000000000000000) (bvsge (x!7720 lt!15831) #b00000000000000000000000000000000)))))

(assert (=> b!40842 (=> (not res!24331) (not e!25901))))

(declare-fun b!40844 () Bool)

(assert (=> b!40844 (and (bvsge (index!2816 lt!15831) #b00000000000000000000000000000000) (bvslt (index!2816 lt!15831) (size!1376 lt!15443)))))

(declare-fun res!24333 () Bool)

(assert (=> b!40844 (= res!24333 (= (select (arr!1239 lt!15443) (index!2816 lt!15831)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25900 () Bool)

(assert (=> b!40844 (=> res!24333 e!25900)))

(declare-fun b!40845 () Bool)

(declare-fun e!25902 () SeekEntryResult!173)

(declare-fun e!25899 () SeekEntryResult!173)

(assert (=> b!40845 (= e!25902 e!25899)))

(declare-fun c!5050 () Bool)

(declare-fun lt!15832 () (_ BitVec 64))

(assert (=> b!40845 (= c!5050 (or (= lt!15832 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)) (= (bvadd lt!15832 lt!15832) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!40846 () Bool)

(assert (=> b!40846 (= e!25899 (Intermediate!173 false (toIndex!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!40847 () Bool)

(assert (=> b!40847 (= e!25902 (Intermediate!173 true (toIndex!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000))))

(declare-fun b!40848 () Bool)

(assert (=> b!40848 (and (bvsge (index!2816 lt!15831) #b00000000000000000000000000000000) (bvslt (index!2816 lt!15831) (size!1376 lt!15443)))))

(declare-fun res!24332 () Bool)

(assert (=> b!40848 (= res!24332 (= (select (arr!1239 lt!15443) (index!2816 lt!15831)) (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(assert (=> b!40848 (=> res!24332 e!25900)))

(assert (=> b!40848 (= e!25901 e!25900)))

(declare-fun b!40849 () Bool)

(assert (=> b!40849 (= e!25898 (bvsge (x!7720 lt!15831) #b01111111111111111111111111111110))))

(declare-fun b!40850 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!40850 (= e!25899 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) mask!853) #b00000000000000000000000000000000 mask!853) (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15443 mask!853))))

(declare-fun d!7149 () Bool)

(assert (=> d!7149 e!25898))

(declare-fun c!5049 () Bool)

(assert (=> d!7149 (= c!5049 (and (is-Intermediate!173 lt!15831) (undefined!985 lt!15831)))))

(assert (=> d!7149 (= lt!15831 e!25902)))

(declare-fun c!5048 () Bool)

(assert (=> d!7149 (= c!5048 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!7149 (= lt!15832 (select (arr!1239 lt!15443) (toIndex!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) mask!853)))))

(assert (=> d!7149 (validMask!0 mask!853)))

(assert (=> d!7149 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) mask!853) (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15443 mask!853) lt!15831)))

(declare-fun b!40843 () Bool)

(assert (=> b!40843 (and (bvsge (index!2816 lt!15831) #b00000000000000000000000000000000) (bvslt (index!2816 lt!15831) (size!1376 lt!15443)))))

(assert (=> b!40843 (= e!25900 (= (select (arr!1239 lt!15443) (index!2816 lt!15831)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!7149 c!5048) b!40847))

(assert (= (and d!7149 (not c!5048)) b!40845))

(assert (= (and b!40845 c!5050) b!40846))

(assert (= (and b!40845 (not c!5050)) b!40850))

(assert (= (and d!7149 c!5049) b!40849))

(assert (= (and d!7149 (not c!5049)) b!40842))

(assert (= (and b!40842 res!24331) b!40848))

(assert (= (and b!40848 (not res!24332)) b!40844))

(assert (= (and b!40844 (not res!24333)) b!40843))

(assert (=> b!40850 m!33629))

(declare-fun m!33747 () Bool)

(assert (=> b!40850 m!33747))

(assert (=> b!40850 m!33747))

(assert (=> b!40850 m!33285))

(declare-fun m!33749 () Bool)

(assert (=> b!40850 m!33749))

(declare-fun m!33751 () Bool)

(assert (=> b!40848 m!33751))

(assert (=> b!40844 m!33751))

(assert (=> b!40843 m!33751))

(assert (=> d!7149 m!33629))

(declare-fun m!33753 () Bool)

(assert (=> d!7149 m!33753))

(assert (=> d!7149 m!33181))

(assert (=> d!7083 d!7149))

(declare-fun d!7151 () Bool)

(declare-fun lt!15838 () (_ BitVec 32))

(declare-fun lt!15837 () (_ BitVec 32))

(assert (=> d!7151 (= lt!15838 (bvmul (bvxor lt!15837 (bvlshr lt!15837 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!7151 (= lt!15837 ((_ extract 31 0) (bvand (bvxor (select (arr!1239 lt!15443) #b00000000000000000000000000000000) (bvlshr (select (arr!1239 lt!15443) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!7151 (and (bvsge mask!853 #b00000000000000000000000000000000) (let ((res!24334 (let ((h!1628 ((_ extract 31 0) (bvand (bvxor (select (arr!1239 lt!15443) #b00000000000000000000000000000000) (bvlshr (select (arr!1239 lt!15443) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!7731 (bvmul (bvxor h!1628 (bvlshr h!1628 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!7731 (bvlshr x!7731 #b00000000000000000000000000001101)) mask!853))))) (and (bvslt res!24334 (bvadd mask!853 #b00000000000000000000000000000001)) (bvsge res!24334 #b00000000000000000000000000000000))))))

(assert (=> d!7151 (= (toIndex!0 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) mask!853) (bvand (bvxor lt!15838 (bvlshr lt!15838 #b00000000000000000000000000001101)) mask!853))))

(assert (=> d!7083 d!7151))

(assert (=> d!7083 d!6975))

(declare-fun d!7153 () Bool)

(declare-fun e!25905 () Bool)

(assert (=> d!7153 e!25905))

(declare-fun res!24339 () Bool)

(assert (=> d!7153 (=> (not res!24339) (not e!25905))))

(declare-fun lt!15850 () ListLongMap!1061)

(assert (=> d!7153 (= res!24339 (contains!515 lt!15850 (_1!753 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))))))

(declare-fun lt!15849 () List!1052)

(assert (=> d!7153 (= lt!15850 (ListLongMap!1062 lt!15849))))

(declare-fun lt!15848 () Unit!981)

(declare-fun lt!15847 () Unit!981)

(assert (=> d!7153 (= lt!15848 lt!15847)))

(declare-datatypes ((Option!107 0))(
  ( (Some!106 (v!1999 V!2097)) (None!105) )
))
(declare-fun getValueByKey!101 (List!1052 (_ BitVec 64)) Option!107)

(assert (=> d!7153 (= (getValueByKey!101 lt!15849 (_1!753 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))))))

(declare-fun lemmaContainsTupThenGetReturnValue!25 (List!1052 (_ BitVec 64) V!2097) Unit!981)

(assert (=> d!7153 (= lt!15847 (lemmaContainsTupThenGetReturnValue!25 lt!15849 (_1!753 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))) (_2!753 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))))))

(declare-fun insertStrictlySorted!22 (List!1052 (_ BitVec 64) V!2097) List!1052)

(assert (=> d!7153 (= lt!15849 (insertStrictlySorted!22 (toList!546 call!3171) (_1!753 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))) (_2!753 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))))))

(assert (=> d!7153 (= (+!65 call!3171 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))) lt!15850)))

(declare-fun b!40855 () Bool)

(declare-fun res!24340 () Bool)

(assert (=> b!40855 (=> (not res!24340) (not e!25905))))

(assert (=> b!40855 (= res!24340 (= (getValueByKey!101 (toList!546 lt!15850) (_1!753 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))))))))

(declare-fun b!40856 () Bool)

(declare-fun contains!517 (List!1052 tuple2!1484) Bool)

(assert (=> b!40856 (= e!25905 (contains!517 (toList!546 lt!15850) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))))))

(assert (= (and d!7153 res!24339) b!40855))

(assert (= (and b!40855 res!24340) b!40856))

(declare-fun m!33755 () Bool)

(assert (=> d!7153 m!33755))

(declare-fun m!33757 () Bool)

(assert (=> d!7153 m!33757))

(declare-fun m!33759 () Bool)

(assert (=> d!7153 m!33759))

(declare-fun m!33761 () Bool)

(assert (=> d!7153 m!33761))

(declare-fun m!33763 () Bool)

(assert (=> b!40855 m!33763))

(declare-fun m!33765 () Bool)

(assert (=> b!40856 m!33765))

(assert (=> b!40551 d!7153))

(declare-fun b!40857 () Bool)

(declare-fun e!25907 () Bool)

(declare-fun call!3209 () Bool)

(assert (=> b!40857 (= e!25907 call!3209)))

(declare-fun c!5051 () Bool)

(declare-fun bm!3206 () Bool)

(assert (=> bm!3206 (= call!3209 (arrayNoDuplicates!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5051 (Cons!1049 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)) (ite c!5016 (Cons!1049 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050))) (ite c!5016 (Cons!1049 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)))))))

(declare-fun b!40858 () Bool)

(declare-fun e!25909 () Bool)

(declare-fun e!25906 () Bool)

(assert (=> b!40858 (= e!25909 e!25906)))

(declare-fun res!24342 () Bool)

(assert (=> b!40858 (=> (not res!24342) (not e!25906))))

(declare-fun e!25908 () Bool)

(assert (=> b!40858 (= res!24342 (not e!25908))))

(declare-fun res!24341 () Bool)

(assert (=> b!40858 (=> (not res!24341) (not e!25908))))

(assert (=> b!40858 (= res!24341 (validKeyInArray!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40859 () Bool)

(assert (=> b!40859 (= e!25907 call!3209)))

(declare-fun d!7155 () Bool)

(declare-fun res!24343 () Bool)

(assert (=> d!7155 (=> res!24343 e!25909)))

(assert (=> d!7155 (= res!24343 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1376 lt!15443)))))

(assert (=> d!7155 (= (arrayNoDuplicates!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!5016 (Cons!1049 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050))) e!25909)))

(declare-fun b!40860 () Bool)

(assert (=> b!40860 (= e!25906 e!25907)))

(assert (=> b!40860 (= c!5051 (validKeyInArray!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun b!40861 () Bool)

(assert (=> b!40861 (= e!25908 (contains!511 (ite c!5016 (Cons!1049 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) (ite c!4907 (Cons!1049 (select (arr!1239 lt!15443) #b00000000000000000000000000000000) Nil!1050) Nil!1050)) (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (= (and d!7155 (not res!24343)) b!40858))

(assert (= (and b!40858 res!24341) b!40861))

(assert (= (and b!40858 res!24342) b!40860))

(assert (= (and b!40860 c!5051) b!40857))

(assert (= (and b!40860 (not c!5051)) b!40859))

(assert (= (or b!40857 b!40859) bm!3206))

(assert (=> bm!3206 m!33703))

(declare-fun m!33767 () Bool)

(assert (=> bm!3206 m!33767))

(assert (=> b!40858 m!33703))

(assert (=> b!40858 m!33703))

(assert (=> b!40858 m!33705))

(assert (=> b!40860 m!33703))

(assert (=> b!40860 m!33703))

(assert (=> b!40860 m!33705))

(assert (=> b!40861 m!33703))

(assert (=> b!40861 m!33703))

(declare-fun m!33769 () Bool)

(assert (=> b!40861 m!33769))

(assert (=> bm!3198 d!7155))

(declare-fun d!7157 () Bool)

(assert (=> d!7157 (arrayContainsKey!0 (_keys!3292 lt!15445) lt!15553 #b00000000000000000000000000000000)))

(declare-fun lt!15851 () Unit!981)

(assert (=> d!7157 (= lt!15851 (choose!13 (_keys!3292 lt!15445) lt!15553 #b00000000000000000000000000000000))))

(assert (=> d!7157 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!7157 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3292 lt!15445) lt!15553 #b00000000000000000000000000000000) lt!15851)))

(declare-fun bs!1719 () Bool)

(assert (= bs!1719 d!7157))

(assert (=> bs!1719 m!33365))

(declare-fun m!33771 () Bool)

(assert (=> bs!1719 m!33771))

(assert (=> b!40424 d!7157))

(declare-fun d!7159 () Bool)

(declare-fun res!24344 () Bool)

(declare-fun e!25910 () Bool)

(assert (=> d!7159 (=> res!24344 e!25910)))

(assert (=> d!7159 (= res!24344 (= (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) lt!15553))))

(assert (=> d!7159 (= (arrayContainsKey!0 (_keys!3292 lt!15445) lt!15553 #b00000000000000000000000000000000) e!25910)))

(declare-fun b!40862 () Bool)

(declare-fun e!25911 () Bool)

(assert (=> b!40862 (= e!25910 e!25911)))

(declare-fun res!24345 () Bool)

(assert (=> b!40862 (=> (not res!24345) (not e!25911))))

(assert (=> b!40862 (= res!24345 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 (_keys!3292 lt!15445))))))

(declare-fun b!40863 () Bool)

(assert (=> b!40863 (= e!25911 (arrayContainsKey!0 (_keys!3292 lt!15445) lt!15553 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!7159 (not res!24344)) b!40862))

(assert (= (and b!40862 res!24345) b!40863))

(assert (=> d!7159 m!33349))

(declare-fun m!33773 () Bool)

(assert (=> b!40863 m!33773))

(assert (=> b!40424 d!7159))

(declare-fun b!40864 () Bool)

(declare-fun e!25912 () SeekEntryResult!173)

(declare-fun e!25913 () SeekEntryResult!173)

(assert (=> b!40864 (= e!25912 e!25913)))

(declare-fun lt!15852 () (_ BitVec 64))

(declare-fun lt!15854 () SeekEntryResult!173)

(assert (=> b!40864 (= lt!15852 (select (arr!1239 (_keys!3292 lt!15445)) (index!2816 lt!15854)))))

(declare-fun c!5053 () Bool)

(assert (=> b!40864 (= c!5053 (= lt!15852 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun b!40865 () Bool)

(assert (=> b!40865 (= e!25912 Undefined!173)))

(declare-fun b!40866 () Bool)

(assert (=> b!40866 (= e!25913 (Found!173 (index!2816 lt!15854)))))

(declare-fun b!40867 () Bool)

(declare-fun c!5054 () Bool)

(assert (=> b!40867 (= c!5054 (= lt!15852 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!25914 () SeekEntryResult!173)

(assert (=> b!40867 (= e!25913 e!25914)))

(declare-fun b!40868 () Bool)

(assert (=> b!40868 (= e!25914 (seekKeyOrZeroReturnVacant!0 (x!7720 lt!15854) (index!2816 lt!15854) (index!2816 lt!15854) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) (_keys!3292 lt!15445) (mask!5176 lt!15445)))))

(declare-fun d!7161 () Bool)

(declare-fun lt!15853 () SeekEntryResult!173)

(assert (=> d!7161 (and (or (is-Undefined!173 lt!15853) (not (is-Found!173 lt!15853)) (and (bvsge (index!2815 lt!15853) #b00000000000000000000000000000000) (bvslt (index!2815 lt!15853) (size!1376 (_keys!3292 lt!15445))))) (or (is-Undefined!173 lt!15853) (is-Found!173 lt!15853) (not (is-MissingZero!173 lt!15853)) (and (bvsge (index!2814 lt!15853) #b00000000000000000000000000000000) (bvslt (index!2814 lt!15853) (size!1376 (_keys!3292 lt!15445))))) (or (is-Undefined!173 lt!15853) (is-Found!173 lt!15853) (is-MissingZero!173 lt!15853) (not (is-MissingVacant!173 lt!15853)) (and (bvsge (index!2817 lt!15853) #b00000000000000000000000000000000) (bvslt (index!2817 lt!15853) (size!1376 (_keys!3292 lt!15445))))) (or (is-Undefined!173 lt!15853) (ite (is-Found!173 lt!15853) (= (select (arr!1239 (_keys!3292 lt!15445)) (index!2815 lt!15853)) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)) (ite (is-MissingZero!173 lt!15853) (= (select (arr!1239 (_keys!3292 lt!15445)) (index!2814 lt!15853)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!173 lt!15853) (= (select (arr!1239 (_keys!3292 lt!15445)) (index!2817 lt!15853)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!7161 (= lt!15853 e!25912)))

(declare-fun c!5052 () Bool)

(assert (=> d!7161 (= c!5052 (and (is-Intermediate!173 lt!15854) (undefined!985 lt!15854)))))

(assert (=> d!7161 (= lt!15854 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) (mask!5176 lt!15445)) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) (_keys!3292 lt!15445) (mask!5176 lt!15445)))))

(assert (=> d!7161 (validMask!0 (mask!5176 lt!15445))))

(assert (=> d!7161 (= (seekEntryOrOpen!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) (_keys!3292 lt!15445) (mask!5176 lt!15445)) lt!15853)))

(declare-fun b!40869 () Bool)

(assert (=> b!40869 (= e!25914 (MissingZero!173 (index!2816 lt!15854)))))

(assert (= (and d!7161 c!5052) b!40865))

(assert (= (and d!7161 (not c!5052)) b!40864))

(assert (= (and b!40864 c!5053) b!40866))

(assert (= (and b!40864 (not c!5053)) b!40867))

(assert (= (and b!40867 c!5054) b!40869))

(assert (= (and b!40867 (not c!5054)) b!40868))

(declare-fun m!33775 () Bool)

(assert (=> b!40864 m!33775))

(assert (=> b!40868 m!33349))

(declare-fun m!33777 () Bool)

(assert (=> b!40868 m!33777))

(declare-fun m!33779 () Bool)

(assert (=> d!7161 m!33779))

(declare-fun m!33781 () Bool)

(assert (=> d!7161 m!33781))

(declare-fun m!33783 () Bool)

(assert (=> d!7161 m!33783))

(assert (=> d!7161 m!33349))

(declare-fun m!33785 () Bool)

(assert (=> d!7161 m!33785))

(declare-fun m!33787 () Bool)

(assert (=> d!7161 m!33787))

(assert (=> d!7161 m!33519))

(assert (=> d!7161 m!33349))

(assert (=> d!7161 m!33783))

(assert (=> b!40424 d!7161))

(declare-fun b!40870 () Bool)

(declare-fun e!25916 () Bool)

(declare-fun call!3210 () Bool)

(assert (=> b!40870 (= e!25916 call!3210)))

(declare-fun b!40871 () Bool)

(declare-fun e!25917 () Bool)

(assert (=> b!40871 (= e!25917 e!25916)))

(declare-fun c!5055 () Bool)

(assert (=> b!40871 (= c!5055 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!40872 () Bool)

(declare-fun e!25915 () Bool)

(assert (=> b!40872 (= e!25915 call!3210)))

(declare-fun b!40873 () Bool)

(assert (=> b!40873 (= e!25916 e!25915)))

(declare-fun lt!15855 () (_ BitVec 64))

(assert (=> b!40873 (= lt!15855 (select (arr!1239 (_keys!3292 lt!15445)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!15857 () Unit!981)

(assert (=> b!40873 (= lt!15857 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!3292 lt!15445) lt!15855 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!40873 (arrayContainsKey!0 (_keys!3292 lt!15445) lt!15855 #b00000000000000000000000000000000)))

(declare-fun lt!15856 () Unit!981)

(assert (=> b!40873 (= lt!15856 lt!15857)))

(declare-fun res!24347 () Bool)

(assert (=> b!40873 (= res!24347 (= (seekEntryOrOpen!0 (select (arr!1239 (_keys!3292 lt!15445)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (_keys!3292 lt!15445) (mask!5176 lt!15445)) (Found!173 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!40873 (=> (not res!24347) (not e!25915))))

(declare-fun d!7163 () Bool)

(declare-fun res!24346 () Bool)

(assert (=> d!7163 (=> res!24346 e!25917)))

(assert (=> d!7163 (= res!24346 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 (_keys!3292 lt!15445))))))

(assert (=> d!7163 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!3292 lt!15445) (mask!5176 lt!15445)) e!25917)))

(declare-fun bm!3207 () Bool)

(assert (=> bm!3207 (= call!3210 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_keys!3292 lt!15445) (mask!5176 lt!15445)))))

(assert (= (and d!7163 (not res!24346)) b!40871))

(assert (= (and b!40871 c!5055) b!40873))

(assert (= (and b!40871 (not c!5055)) b!40870))

(assert (= (and b!40873 res!24347) b!40872))

(assert (= (or b!40872 b!40870) bm!3207))

(assert (=> b!40871 m!33721))

(assert (=> b!40871 m!33721))

(assert (=> b!40871 m!33725))

(assert (=> b!40873 m!33721))

(declare-fun m!33789 () Bool)

(assert (=> b!40873 m!33789))

(declare-fun m!33791 () Bool)

(assert (=> b!40873 m!33791))

(assert (=> b!40873 m!33721))

(declare-fun m!33793 () Bool)

(assert (=> b!40873 m!33793))

(declare-fun m!33795 () Bool)

(assert (=> bm!3207 m!33795))

(assert (=> bm!3125 d!7163))

(declare-fun d!7165 () Bool)

(assert (not d!7165))

(assert (=> b!40596 d!7165))

(assert (=> b!40734 d!7135))

(assert (=> b!40550 d!7131))

(declare-fun b!40874 () Bool)

(declare-fun e!25919 () (_ BitVec 32))

(declare-fun call!3211 () (_ BitVec 32))

(assert (=> b!40874 (= e!25919 call!3211)))

(declare-fun b!40875 () Bool)

(declare-fun e!25918 () (_ BitVec 32))

(assert (=> b!40875 (= e!25918 e!25919)))

(declare-fun c!5057 () Bool)

(assert (=> b!40875 (= c!5057 (validKeyInArray!0 (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(declare-fun bm!3208 () Bool)

(assert (=> bm!3208 (= call!3211 (arrayCountValidKeys!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun d!7167 () Bool)

(declare-fun lt!15858 () (_ BitVec 32))

(assert (=> d!7167 (and (bvsge lt!15858 #b00000000000000000000000000000000) (bvsle lt!15858 (bvsub (size!1376 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001))))))

(assert (=> d!7167 (= lt!15858 e!25918)))

(declare-fun c!5056 () Bool)

(assert (=> d!7167 (= c!5056 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> d!7167 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 mask!853) (size!1376 lt!15443)))))

(assert (=> d!7167 (= (arrayCountValidKeys!0 lt!15443 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 mask!853)) lt!15858)))

(declare-fun b!40876 () Bool)

(assert (=> b!40876 (= e!25918 #b00000000000000000000000000000000)))

(declare-fun b!40877 () Bool)

(assert (=> b!40877 (= e!25919 (bvadd #b00000000000000000000000000000001 call!3211))))

(assert (= (and d!7167 c!5056) b!40876))

(assert (= (and d!7167 (not c!5056)) b!40875))

(assert (= (and b!40875 c!5057) b!40877))

(assert (= (and b!40875 (not c!5057)) b!40874))

(assert (= (or b!40877 b!40874) bm!3208))

(assert (=> b!40875 m!33703))

(assert (=> b!40875 m!33703))

(assert (=> b!40875 m!33705))

(declare-fun m!33797 () Bool)

(assert (=> bm!3208 m!33797))

(assert (=> bm!3200 d!7167))

(declare-fun d!7169 () Bool)

(assert (=> d!7169 (= (validMask!0 (mask!5176 lt!15445)) (and (or (= (mask!5176 lt!15445) #b00000000000000000000000000000111) (= (mask!5176 lt!15445) #b00000000000000000000000000001111) (= (mask!5176 lt!15445) #b00000000000000000000000000011111) (= (mask!5176 lt!15445) #b00000000000000000000000000111111) (= (mask!5176 lt!15445) #b00000000000000000000000001111111) (= (mask!5176 lt!15445) #b00000000000000000000000011111111) (= (mask!5176 lt!15445) #b00000000000000000000000111111111) (= (mask!5176 lt!15445) #b00000000000000000000001111111111) (= (mask!5176 lt!15445) #b00000000000000000000011111111111) (= (mask!5176 lt!15445) #b00000000000000000000111111111111) (= (mask!5176 lt!15445) #b00000000000000000001111111111111) (= (mask!5176 lt!15445) #b00000000000000000011111111111111) (= (mask!5176 lt!15445) #b00000000000000000111111111111111) (= (mask!5176 lt!15445) #b00000000000000001111111111111111) (= (mask!5176 lt!15445) #b00000000000000011111111111111111) (= (mask!5176 lt!15445) #b00000000000000111111111111111111) (= (mask!5176 lt!15445) #b00000000000001111111111111111111) (= (mask!5176 lt!15445) #b00000000000011111111111111111111) (= (mask!5176 lt!15445) #b00000000000111111111111111111111) (= (mask!5176 lt!15445) #b00000000001111111111111111111111) (= (mask!5176 lt!15445) #b00000000011111111111111111111111) (= (mask!5176 lt!15445) #b00000000111111111111111111111111) (= (mask!5176 lt!15445) #b00000001111111111111111111111111) (= (mask!5176 lt!15445) #b00000011111111111111111111111111) (= (mask!5176 lt!15445) #b00000111111111111111111111111111) (= (mask!5176 lt!15445) #b00001111111111111111111111111111) (= (mask!5176 lt!15445) #b00011111111111111111111111111111) (= (mask!5176 lt!15445) #b00111111111111111111111111111111)) (bvsle (mask!5176 lt!15445) #b00111111111111111111111111111111)))))

(assert (=> d!7047 d!7169))

(declare-fun d!7171 () Bool)

(declare-fun e!25920 () Bool)

(assert (=> d!7171 e!25920))

(declare-fun res!24348 () Bool)

(assert (=> d!7171 (=> (not res!24348) (not e!25920))))

(declare-fun lt!15862 () ListLongMap!1061)

(assert (=> d!7171 (= res!24348 (contains!515 lt!15862 (_1!753 (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))))))))

(declare-fun lt!15861 () List!1052)

(assert (=> d!7171 (= lt!15862 (ListLongMap!1062 lt!15861))))

(declare-fun lt!15860 () Unit!981)

(declare-fun lt!15859 () Unit!981)

(assert (=> d!7171 (= lt!15860 lt!15859)))

(assert (=> d!7171 (= (getValueByKey!101 lt!15861 (_1!753 (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))))) (Some!106 (_2!753 (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))))))))

(assert (=> d!7171 (= lt!15859 (lemmaContainsTupThenGetReturnValue!25 lt!15861 (_1!753 (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))) (_2!753 (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))))))))

(assert (=> d!7171 (= lt!15861 (insertStrictlySorted!22 (toList!546 (ite c!4971 call!3172 (ite c!4974 call!3167 call!3173))) (_1!753 (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))) (_2!753 (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))))))))

(assert (=> d!7171 (= (+!65 (ite c!4971 call!3172 (ite c!4974 call!3167 call!3173)) (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))) lt!15862)))

(declare-fun b!40878 () Bool)

(declare-fun res!24349 () Bool)

(assert (=> b!40878 (=> (not res!24349) (not e!25920))))

(assert (=> b!40878 (= res!24349 (= (getValueByKey!101 (toList!546 lt!15862) (_1!753 (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445))))) (Some!106 (_2!753 (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))))))))

(declare-fun b!40879 () Bool)

(assert (=> b!40879 (= e!25920 (contains!517 (toList!546 lt!15862) (ite (or c!4971 c!4974) (tuple2!1485 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!1721 lt!15445)) (tuple2!1485 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!1721 lt!15445)))))))

(assert (= (and d!7171 res!24348) b!40878))

(assert (= (and b!40878 res!24349) b!40879))

(declare-fun m!33799 () Bool)

(assert (=> d!7171 m!33799))

(declare-fun m!33801 () Bool)

(assert (=> d!7171 m!33801))

(declare-fun m!33803 () Bool)

(assert (=> d!7171 m!33803))

(declare-fun m!33805 () Bool)

(assert (=> d!7171 m!33805))

(declare-fun m!33807 () Bool)

(assert (=> b!40878 m!33807))

(declare-fun m!33809 () Bool)

(assert (=> b!40879 m!33809))

(assert (=> bm!3166 d!7171))

(assert (=> b!40732 d!7135))

(assert (=> b!40422 d!7131))

(assert (=> b!40748 d!7135))

(assert (=> d!7097 d!7009))

(declare-fun d!7173 () Bool)

(declare-fun e!25925 () Bool)

(assert (=> d!7173 e!25925))

(declare-fun res!24352 () Bool)

(assert (=> d!7173 (=> res!24352 e!25925)))

(declare-fun lt!15873 () Bool)

(assert (=> d!7173 (= res!24352 (not lt!15873))))

(declare-fun lt!15874 () Bool)

(assert (=> d!7173 (= lt!15873 lt!15874)))

(declare-fun lt!15871 () Unit!981)

(declare-fun e!25926 () Unit!981)

(assert (=> d!7173 (= lt!15871 e!25926)))

(declare-fun c!5060 () Bool)

(assert (=> d!7173 (= c!5060 lt!15874)))

(declare-fun containsKey!70 (List!1052 (_ BitVec 64)) Bool)

(assert (=> d!7173 (= lt!15874 (containsKey!70 (toList!546 lt!15680) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(assert (=> d!7173 (= (contains!515 lt!15680 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)) lt!15873)))

(declare-fun b!40886 () Bool)

(declare-fun lt!15872 () Unit!981)

(assert (=> b!40886 (= e!25926 lt!15872)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!58 (List!1052 (_ BitVec 64)) Unit!981)

(assert (=> b!40886 (= lt!15872 (lemmaContainsKeyImpliesGetValueByKeyDefined!58 (toList!546 lt!15680) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun isDefined!59 (Option!107) Bool)

(assert (=> b!40886 (isDefined!59 (getValueByKey!101 (toList!546 lt!15680) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun b!40887 () Bool)

(declare-fun Unit!992 () Unit!981)

(assert (=> b!40887 (= e!25926 Unit!992)))

(declare-fun b!40888 () Bool)

(assert (=> b!40888 (= e!25925 (isDefined!59 (getValueByKey!101 (toList!546 lt!15680) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000))))))

(assert (= (and d!7173 c!5060) b!40886))

(assert (= (and d!7173 (not c!5060)) b!40887))

(assert (= (and d!7173 (not res!24352)) b!40888))

(assert (=> d!7173 m!33349))

(declare-fun m!33811 () Bool)

(assert (=> d!7173 m!33811))

(assert (=> b!40886 m!33349))

(declare-fun m!33813 () Bool)

(assert (=> b!40886 m!33813))

(assert (=> b!40886 m!33349))

(declare-fun m!33815 () Bool)

(assert (=> b!40886 m!33815))

(assert (=> b!40886 m!33815))

(declare-fun m!33817 () Bool)

(assert (=> b!40886 m!33817))

(assert (=> b!40888 m!33349))

(assert (=> b!40888 m!33815))

(assert (=> b!40888 m!33815))

(assert (=> b!40888 m!33817))

(assert (=> b!40563 d!7173))

(declare-fun d!7177 () Bool)

(declare-fun get!704 (Option!107) V!2097)

(assert (=> d!7177 (= (apply!56 lt!15680 #b1000000000000000000000000000000000000000000000000000000000000000) (get!704 (getValueByKey!101 (toList!546 lt!15680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1720 () Bool)

(assert (= bs!1720 d!7177))

(declare-fun m!33819 () Bool)

(assert (=> bs!1720 m!33819))

(assert (=> bs!1720 m!33819))

(declare-fun m!33821 () Bool)

(assert (=> bs!1720 m!33821))

(assert (=> b!40547 d!7177))

(assert (=> d!7109 d!7169))

(assert (=> d!7037 d!6995))

(assert (=> d!7041 d!6987))

(declare-fun b!40913 () Bool)

(declare-fun e!25939 () SeekEntryResult!173)

(assert (=> b!40913 (= e!25939 Undefined!173)))

(declare-fun b!40914 () Bool)

(declare-fun e!25941 () SeekEntryResult!173)

(assert (=> b!40914 (= e!25939 e!25941)))

(declare-fun c!5075 () Bool)

(declare-fun lt!15884 () (_ BitVec 64))

(assert (=> b!40914 (= c!5075 (= lt!15884 (select (arr!1239 lt!15443) #b00000000000000000000000000000000)))))

(declare-fun e!25943 () SeekEntryResult!173)

(declare-fun b!40915 () Bool)

(assert (=> b!40915 (= e!25943 (seekKeyOrZeroReturnVacant!0 (bvadd (x!7720 lt!15785) #b00000000000000000000000000000001) (nextIndex!0 (index!2816 lt!15785) (x!7720 lt!15785) mask!853) (index!2816 lt!15785) (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15443 mask!853))))

(declare-fun b!40916 () Bool)

(assert (=> b!40916 (= e!25943 (MissingVacant!173 (index!2816 lt!15785)))))

(declare-fun b!40917 () Bool)

(assert (=> b!40917 (= e!25941 (Found!173 (index!2816 lt!15785)))))

(declare-fun d!7179 () Bool)

(declare-fun lt!15883 () SeekEntryResult!173)

(assert (=> d!7179 (and (or (is-Undefined!173 lt!15883) (not (is-Found!173 lt!15883)) (and (bvsge (index!2815 lt!15883) #b00000000000000000000000000000000) (bvslt (index!2815 lt!15883) (size!1376 lt!15443)))) (or (is-Undefined!173 lt!15883) (is-Found!173 lt!15883) (not (is-MissingVacant!173 lt!15883)) (not (= (index!2817 lt!15883) (index!2816 lt!15785))) (and (bvsge (index!2817 lt!15883) #b00000000000000000000000000000000) (bvslt (index!2817 lt!15883) (size!1376 lt!15443)))) (or (is-Undefined!173 lt!15883) (ite (is-Found!173 lt!15883) (= (select (arr!1239 lt!15443) (index!2815 lt!15883)) (select (arr!1239 lt!15443) #b00000000000000000000000000000000)) (and (is-MissingVacant!173 lt!15883) (= (index!2817 lt!15883) (index!2816 lt!15785)) (= (select (arr!1239 lt!15443) (index!2817 lt!15883)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> d!7179 (= lt!15883 e!25939)))

(declare-fun c!5074 () Bool)

(assert (=> d!7179 (= c!5074 (bvsge (x!7720 lt!15785) #b01111111111111111111111111111110))))

(assert (=> d!7179 (= lt!15884 (select (arr!1239 lt!15443) (index!2816 lt!15785)))))

(assert (=> d!7179 (validMask!0 mask!853)))

(assert (=> d!7179 (= (seekKeyOrZeroReturnVacant!0 (x!7720 lt!15785) (index!2816 lt!15785) (index!2816 lt!15785) (select (arr!1239 lt!15443) #b00000000000000000000000000000000) lt!15443 mask!853) lt!15883)))

(declare-fun b!40918 () Bool)

(declare-fun c!5073 () Bool)

(assert (=> b!40918 (= c!5073 (= lt!15884 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!40918 (= e!25941 e!25943)))

(assert (= (and d!7179 c!5074) b!40913))

(assert (= (and d!7179 (not c!5074)) b!40914))

(assert (= (and b!40914 c!5075) b!40917))

(assert (= (and b!40914 (not c!5075)) b!40918))

(assert (= (and b!40918 c!5073) b!40916))

(assert (= (and b!40918 (not c!5073)) b!40915))

(declare-fun m!33823 () Bool)

(assert (=> b!40915 m!33823))

(assert (=> b!40915 m!33823))

(assert (=> b!40915 m!33285))

(declare-fun m!33825 () Bool)

(assert (=> b!40915 m!33825))

(declare-fun m!33827 () Bool)

(assert (=> d!7179 m!33827))

(declare-fun m!33829 () Bool)

(assert (=> d!7179 m!33829))

(assert (=> d!7179 m!33619))

(assert (=> d!7179 m!33181))

(assert (=> b!40711 d!7179))

(declare-fun d!7181 () Bool)

(declare-fun res!24359 () Bool)

(declare-fun e!25946 () Bool)

(assert (=> d!7181 (=> res!24359 e!25946)))

(assert (=> d!7181 (= res!24359 (= (select (arr!1239 lt!15443) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!15534))))

(assert (=> d!7181 (= (arrayContainsKey!0 lt!15443 lt!15534 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!25946)))

(declare-fun b!40925 () Bool)

(declare-fun e!25947 () Bool)

(assert (=> b!40925 (= e!25946 e!25947)))

(declare-fun res!24360 () Bool)

(assert (=> b!40925 (=> (not res!24360) (not e!25947))))

(assert (=> b!40925 (= res!24360 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1376 lt!15443)))))

(declare-fun b!40926 () Bool)

(assert (=> b!40926 (= e!25947 (arrayContainsKey!0 lt!15443 lt!15534 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!7181 (not res!24359)) b!40925))

(assert (= (and b!40925 res!24360) b!40926))

(assert (=> d!7181 m!33371))

(declare-fun m!33831 () Bool)

(assert (=> b!40926 m!33831))

(assert (=> b!40646 d!7181))

(declare-fun d!7183 () Bool)

(declare-fun e!25948 () Bool)

(assert (=> d!7183 e!25948))

(declare-fun res!24361 () Bool)

(assert (=> d!7183 (=> res!24361 e!25948)))

(declare-fun lt!15887 () Bool)

(assert (=> d!7183 (= res!24361 (not lt!15887))))

(declare-fun lt!15888 () Bool)

(assert (=> d!7183 (= lt!15887 lt!15888)))

(declare-fun lt!15885 () Unit!981)

(declare-fun e!25949 () Unit!981)

(assert (=> d!7183 (= lt!15885 e!25949)))

(declare-fun c!5076 () Bool)

(assert (=> d!7183 (= c!5076 lt!15888)))

(assert (=> d!7183 (= lt!15888 (containsKey!70 (toList!546 (+!65 lt!15693 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))) lt!15691))))

(assert (=> d!7183 (= (contains!515 (+!65 lt!15693 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445))) lt!15691) lt!15887)))

(declare-fun b!40927 () Bool)

(declare-fun lt!15886 () Unit!981)

(assert (=> b!40927 (= e!25949 lt!15886)))

(assert (=> b!40927 (= lt!15886 (lemmaContainsKeyImpliesGetValueByKeyDefined!58 (toList!546 (+!65 lt!15693 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))) lt!15691))))

(assert (=> b!40927 (isDefined!59 (getValueByKey!101 (toList!546 (+!65 lt!15693 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))) lt!15691))))

(declare-fun b!40928 () Bool)

(declare-fun Unit!993 () Unit!981)

(assert (=> b!40928 (= e!25949 Unit!993)))

(declare-fun b!40929 () Bool)

(assert (=> b!40929 (= e!25948 (isDefined!59 (getValueByKey!101 (toList!546 (+!65 lt!15693 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))) lt!15691)))))

(assert (= (and d!7183 c!5076) b!40927))

(assert (= (and d!7183 (not c!5076)) b!40928))

(assert (= (and d!7183 (not res!24361)) b!40929))

(declare-fun m!33833 () Bool)

(assert (=> d!7183 m!33833))

(declare-fun m!33835 () Bool)

(assert (=> b!40927 m!33835))

(declare-fun m!33837 () Bool)

(assert (=> b!40927 m!33837))

(assert (=> b!40927 m!33837))

(declare-fun m!33839 () Bool)

(assert (=> b!40927 m!33839))

(assert (=> b!40929 m!33837))

(assert (=> b!40929 m!33837))

(assert (=> b!40929 m!33839))

(assert (=> b!40545 d!7183))

(declare-fun d!7185 () Bool)

(declare-fun e!25950 () Bool)

(assert (=> d!7185 e!25950))

(declare-fun res!24362 () Bool)

(assert (=> d!7185 (=> (not res!24362) (not e!25950))))

(declare-fun lt!15892 () ListLongMap!1061)

(assert (=> d!7185 (= res!24362 (contains!515 lt!15892 (_1!753 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))))))

(declare-fun lt!15891 () List!1052)

(assert (=> d!7185 (= lt!15892 (ListLongMap!1062 lt!15891))))

(declare-fun lt!15890 () Unit!981)

(declare-fun lt!15889 () Unit!981)

(assert (=> d!7185 (= lt!15890 lt!15889)))

(assert (=> d!7185 (= (getValueByKey!101 lt!15891 (_1!753 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))))))

(assert (=> d!7185 (= lt!15889 (lemmaContainsTupThenGetReturnValue!25 lt!15891 (_1!753 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445))) (_2!753 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))))))

(assert (=> d!7185 (= lt!15891 (insertStrictlySorted!22 (toList!546 lt!15693) (_1!753 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445))) (_2!753 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))))))

(assert (=> d!7185 (= (+!65 lt!15693 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445))) lt!15892)))

(declare-fun b!40930 () Bool)

(declare-fun res!24363 () Bool)

(assert (=> b!40930 (=> (not res!24363) (not e!25950))))

(assert (=> b!40930 (= res!24363 (= (getValueByKey!101 (toList!546 lt!15892) (_1!753 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445))))))))

(declare-fun b!40931 () Bool)

(assert (=> b!40931 (= e!25950 (contains!517 (toList!546 lt!15892) (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445))))))

(assert (= (and d!7185 res!24362) b!40930))

(assert (= (and b!40930 res!24363) b!40931))

(declare-fun m!33841 () Bool)

(assert (=> d!7185 m!33841))

(declare-fun m!33843 () Bool)

(assert (=> d!7185 m!33843))

(declare-fun m!33845 () Bool)

(assert (=> d!7185 m!33845))

(declare-fun m!33847 () Bool)

(assert (=> d!7185 m!33847))

(declare-fun m!33849 () Bool)

(assert (=> b!40930 m!33849))

(declare-fun m!33851 () Bool)

(assert (=> b!40931 m!33851))

(assert (=> b!40545 d!7185))

(declare-fun d!7187 () Bool)

(assert (=> d!7187 (= (apply!56 (+!65 lt!15692 (tuple2!1485 lt!15690 (minValue!1721 lt!15445))) lt!15684) (get!704 (getValueByKey!101 (toList!546 (+!65 lt!15692 (tuple2!1485 lt!15690 (minValue!1721 lt!15445)))) lt!15684)))))

(declare-fun bs!1721 () Bool)

(assert (= bs!1721 d!7187))

(declare-fun m!33853 () Bool)

(assert (=> bs!1721 m!33853))

(assert (=> bs!1721 m!33853))

(declare-fun m!33855 () Bool)

(assert (=> bs!1721 m!33855))

(assert (=> b!40545 d!7187))

(declare-fun b!41004 () Bool)

(declare-fun e!25997 () Bool)

(declare-fun lt!15939 () ListLongMap!1061)

(assert (=> b!41004 (= e!25997 (= lt!15939 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1803 lt!15445))))))

(declare-fun b!41005 () Bool)

(declare-fun e!26002 () Bool)

(declare-fun e!25999 () Bool)

(assert (=> b!41005 (= e!26002 e!25999)))

(declare-fun c!5101 () Bool)

(declare-fun e!26001 () Bool)

(assert (=> b!41005 (= c!5101 e!26001)))

(declare-fun res!24391 () Bool)

(assert (=> b!41005 (=> (not res!24391) (not e!26001))))

(assert (=> b!41005 (= res!24391 (bvslt #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(declare-fun b!41006 () Bool)

(declare-fun lt!15942 () Unit!981)

(declare-fun lt!15941 () Unit!981)

(assert (=> b!41006 (= lt!15942 lt!15941)))

(declare-fun lt!15938 () (_ BitVec 64))

(declare-fun lt!15940 () (_ BitVec 64))

(declare-fun lt!15937 () V!2097)

(declare-fun lt!15943 () ListLongMap!1061)

(assert (=> b!41006 (not (contains!515 (+!65 lt!15943 (tuple2!1485 lt!15940 lt!15937)) lt!15938))))

(declare-fun addStillNotContains!6 (ListLongMap!1061 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!981)

(assert (=> b!41006 (= lt!15941 (addStillNotContains!6 lt!15943 lt!15940 lt!15937 lt!15938))))

(assert (=> b!41006 (= lt!15938 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!41006 (= lt!15937 (get!701 (select (arr!1240 (_values!1786 lt!15445)) #b00000000000000000000000000000000) (dynLambda!190 (defaultEntry!1803 lt!15445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!41006 (= lt!15940 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000))))

(declare-fun call!3216 () ListLongMap!1061)

(assert (=> b!41006 (= lt!15943 call!3216)))

(declare-fun e!26000 () ListLongMap!1061)

(assert (=> b!41006 (= e!26000 (+!65 call!3216 (tuple2!1485 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) (get!701 (select (arr!1240 (_values!1786 lt!15445)) #b00000000000000000000000000000000) (dynLambda!190 (defaultEntry!1803 lt!15445) #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!41007 () Bool)

(declare-fun res!24389 () Bool)

(assert (=> b!41007 (=> (not res!24389) (not e!26002))))

(assert (=> b!41007 (= res!24389 (not (contains!515 lt!15939 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!41008 () Bool)

(declare-fun e!25998 () ListLongMap!1061)

(assert (=> b!41008 (= e!25998 e!26000)))

(declare-fun c!5102 () Bool)

(assert (=> b!41008 (= c!5102 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun d!7189 () Bool)

(assert (=> d!7189 e!26002))

(declare-fun res!24390 () Bool)

(assert (=> d!7189 (=> (not res!24390) (not e!26002))))

(assert (=> d!7189 (= res!24390 (not (contains!515 lt!15939 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!7189 (= lt!15939 e!25998)))

(declare-fun c!5103 () Bool)

(assert (=> d!7189 (= c!5103 (bvsge #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(assert (=> d!7189 (validMask!0 (mask!5176 lt!15445))))

(assert (=> d!7189 (= (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) #b00000000000000000000000000000000 (defaultEntry!1803 lt!15445)) lt!15939)))

(declare-fun b!41009 () Bool)

(assert (=> b!41009 (= e!26001 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(assert (=> b!41009 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!41010 () Bool)

(assert (=> b!41010 (= e!25998 (ListLongMap!1062 Nil!1049))))

(declare-fun b!41011 () Bool)

(assert (=> b!41011 (= e!25999 e!25997)))

(declare-fun c!5104 () Bool)

(assert (=> b!41011 (= c!5104 (bvslt #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(declare-fun b!41012 () Bool)

(assert (=> b!41012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(assert (=> b!41012 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1377 (_values!1786 lt!15445))))))

(declare-fun e!25996 () Bool)

(assert (=> b!41012 (= e!25996 (= (apply!56 lt!15939 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)) (get!701 (select (arr!1240 (_values!1786 lt!15445)) #b00000000000000000000000000000000) (dynLambda!190 (defaultEntry!1803 lt!15445) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!41013 () Bool)

(declare-fun isEmpty!233 (ListLongMap!1061) Bool)

(assert (=> b!41013 (= e!25997 (isEmpty!233 lt!15939))))

(declare-fun bm!3213 () Bool)

(assert (=> bm!3213 (= call!3216 (getCurrentListMapNoExtraKeys!34 (_keys!3292 lt!15445) (_values!1786 lt!15445) (mask!5176 lt!15445) (extraKeys!1694 lt!15445) (zeroValue!1721 lt!15445) (minValue!1721 lt!15445) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (defaultEntry!1803 lt!15445)))))

(declare-fun b!41014 () Bool)

(assert (=> b!41014 (= e!25999 e!25996)))

(assert (=> b!41014 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!1376 (_keys!3292 lt!15445))))))

(declare-fun res!24392 () Bool)

(assert (=> b!41014 (= res!24392 (contains!515 lt!15939 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(assert (=> b!41014 (=> (not res!24392) (not e!25996))))

(declare-fun b!41015 () Bool)

(assert (=> b!41015 (= e!26000 call!3216)))

(assert (= (and d!7189 c!5103) b!41010))

(assert (= (and d!7189 (not c!5103)) b!41008))

(assert (= (and b!41008 c!5102) b!41006))

(assert (= (and b!41008 (not c!5102)) b!41015))

(assert (= (or b!41006 b!41015) bm!3213))

(assert (= (and d!7189 res!24390) b!41007))

(assert (= (and b!41007 res!24389) b!41005))

(assert (= (and b!41005 res!24391) b!41009))

(assert (= (and b!41005 c!5101) b!41014))

(assert (= (and b!41005 (not c!5101)) b!41011))

(assert (= (and b!41014 res!24392) b!41012))

(assert (= (and b!41011 c!5104) b!41004))

(assert (= (and b!41011 (not c!5104)) b!41013))

(declare-fun b_lambda!2075 () Bool)

(assert (=> (not b_lambda!2075) (not b!41006)))

(assert (=> b!41006 t!3918))

(declare-fun b_and!2375 () Bool)

(assert (= b_and!2371 (and (=> t!3918 result!1449) b_and!2375)))

(declare-fun b_lambda!2077 () Bool)

(assert (=> (not b_lambda!2077) (not b!41012)))

(assert (=> b!41012 t!3918))

(declare-fun b_and!2377 () Bool)

(assert (= b_and!2375 (and (=> t!3918 result!1449) b_and!2377)))

(assert (=> b!41009 m!33349))

(assert (=> b!41009 m!33349))

(assert (=> b!41009 m!33351))

(assert (=> b!41012 m!33349))

(declare-fun m!33933 () Bool)

(assert (=> b!41012 m!33933))

(assert (=> b!41012 m!33469))

(assert (=> b!41012 m!33349))

(assert (=> b!41012 m!33471))

(assert (=> b!41012 m!33469))

(assert (=> b!41012 m!33473))

(assert (=> b!41012 m!33471))

(declare-fun m!33935 () Bool)

(assert (=> b!41004 m!33935))

(declare-fun m!33937 () Bool)

(assert (=> b!41013 m!33937))

(declare-fun m!33939 () Bool)

(assert (=> b!41006 m!33939))

(declare-fun m!33941 () Bool)

(assert (=> b!41006 m!33941))

(declare-fun m!33943 () Bool)

(assert (=> b!41006 m!33943))

(declare-fun m!33945 () Bool)

(assert (=> b!41006 m!33945))

(assert (=> b!41006 m!33469))

(assert (=> b!41006 m!33939))

(assert (=> b!41006 m!33349))

(assert (=> b!41006 m!33471))

(assert (=> b!41006 m!33469))

(assert (=> b!41006 m!33473))

(assert (=> b!41006 m!33471))

(declare-fun m!33947 () Bool)

(assert (=> b!41007 m!33947))

(declare-fun m!33949 () Bool)

(assert (=> d!7189 m!33949))

(assert (=> d!7189 m!33519))

(assert (=> b!41008 m!33349))

(assert (=> b!41008 m!33349))

(assert (=> b!41008 m!33351))

(assert (=> b!41014 m!33349))

(assert (=> b!41014 m!33349))

(declare-fun m!33951 () Bool)

(assert (=> b!41014 m!33951))

(assert (=> bm!3213 m!33935))

(assert (=> b!40545 d!7189))

(declare-fun d!7231 () Bool)

(declare-fun e!26003 () Bool)

(assert (=> d!7231 e!26003))

(declare-fun res!24393 () Bool)

(assert (=> d!7231 (=> (not res!24393) (not e!26003))))

(declare-fun lt!15947 () ListLongMap!1061)

(assert (=> d!7231 (= res!24393 (contains!515 lt!15947 (_1!753 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445)))))))

(declare-fun lt!15946 () List!1052)

(assert (=> d!7231 (= lt!15947 (ListLongMap!1062 lt!15946))))

(declare-fun lt!15945 () Unit!981)

(declare-fun lt!15944 () Unit!981)

(assert (=> d!7231 (= lt!15945 lt!15944)))

(assert (=> d!7231 (= (getValueByKey!101 lt!15946 (_1!753 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445)))))))

(assert (=> d!7231 (= lt!15944 (lemmaContainsTupThenGetReturnValue!25 lt!15946 (_1!753 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445))) (_2!753 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445)))))))

(assert (=> d!7231 (= lt!15946 (insertStrictlySorted!22 (toList!546 lt!15677) (_1!753 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445))) (_2!753 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445)))))))

(assert (=> d!7231 (= (+!65 lt!15677 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445))) lt!15947)))

(declare-fun b!41016 () Bool)

(declare-fun res!24394 () Bool)

(assert (=> b!41016 (=> (not res!24394) (not e!26003))))

(assert (=> b!41016 (= res!24394 (= (getValueByKey!101 (toList!546 lt!15947) (_1!753 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445))))))))

(declare-fun b!41017 () Bool)

(assert (=> b!41017 (= e!26003 (contains!517 (toList!546 lt!15947) (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445))))))

(assert (= (and d!7231 res!24393) b!41016))

(assert (= (and b!41016 res!24394) b!41017))

(declare-fun m!33953 () Bool)

(assert (=> d!7231 m!33953))

(declare-fun m!33955 () Bool)

(assert (=> d!7231 m!33955))

(declare-fun m!33957 () Bool)

(assert (=> d!7231 m!33957))

(declare-fun m!33959 () Bool)

(assert (=> d!7231 m!33959))

(declare-fun m!33961 () Bool)

(assert (=> b!41016 m!33961))

(declare-fun m!33963 () Bool)

(assert (=> b!41017 m!33963))

(assert (=> b!40545 d!7231))

(declare-fun d!7233 () Bool)

(assert (=> d!7233 (= (apply!56 lt!15692 lt!15684) (get!704 (getValueByKey!101 (toList!546 lt!15692) lt!15684)))))

(declare-fun bs!1727 () Bool)

(assert (= bs!1727 d!7233))

(declare-fun m!33965 () Bool)

(assert (=> bs!1727 m!33965))

(assert (=> bs!1727 m!33965))

(declare-fun m!33967 () Bool)

(assert (=> bs!1727 m!33967))

(assert (=> b!40545 d!7233))

(declare-fun d!7235 () Bool)

(assert (=> d!7235 (= (apply!56 (+!65 lt!15677 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445))) lt!15683) (get!704 (getValueByKey!101 (toList!546 (+!65 lt!15677 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445)))) lt!15683)))))

(declare-fun bs!1728 () Bool)

(assert (= bs!1728 d!7235))

(declare-fun m!33969 () Bool)

(assert (=> bs!1728 m!33969))

(assert (=> bs!1728 m!33969))

(declare-fun m!33971 () Bool)

(assert (=> bs!1728 m!33971))

(assert (=> b!40545 d!7235))

(declare-fun d!7237 () Bool)

(assert (=> d!7237 (= (apply!56 (+!65 lt!15677 (tuple2!1485 lt!15682 (zeroValue!1721 lt!15445))) lt!15683) (apply!56 lt!15677 lt!15683))))

(declare-fun lt!15950 () Unit!981)

(declare-fun choose!247 (ListLongMap!1061 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!981)

(assert (=> d!7237 (= lt!15950 (choose!247 lt!15677 lt!15682 (zeroValue!1721 lt!15445) lt!15683))))

(declare-fun e!26006 () Bool)

(assert (=> d!7237 e!26006))

(declare-fun res!24397 () Bool)

(assert (=> d!7237 (=> (not res!24397) (not e!26006))))

(assert (=> d!7237 (= res!24397 (contains!515 lt!15677 lt!15683))))

(assert (=> d!7237 (= (addApplyDifferent!31 lt!15677 lt!15682 (zeroValue!1721 lt!15445) lt!15683) lt!15950)))

(declare-fun b!41021 () Bool)

(assert (=> b!41021 (= e!26006 (not (= lt!15683 lt!15682)))))

(assert (= (and d!7237 res!24397) b!41021))

(assert (=> d!7237 m!33517))

(declare-fun m!33973 () Bool)

(assert (=> d!7237 m!33973))

(assert (=> d!7237 m!33487))

(assert (=> d!7237 m!33487))

(assert (=> d!7237 m!33489))

(declare-fun m!33975 () Bool)

(assert (=> d!7237 m!33975))

(assert (=> b!40545 d!7237))

(declare-fun d!7239 () Bool)

(assert (=> d!7239 (= (apply!56 (+!65 lt!15686 (tuple2!1485 lt!15685 (minValue!1721 lt!15445))) lt!15678) (get!704 (getValueByKey!101 (toList!546 (+!65 lt!15686 (tuple2!1485 lt!15685 (minValue!1721 lt!15445)))) lt!15678)))))

(declare-fun bs!1729 () Bool)

(assert (= bs!1729 d!7239))

(declare-fun m!33977 () Bool)

(assert (=> bs!1729 m!33977))

(assert (=> bs!1729 m!33977))

(declare-fun m!33979 () Bool)

(assert (=> bs!1729 m!33979))

(assert (=> b!40545 d!7239))

(declare-fun d!7241 () Bool)

(assert (=> d!7241 (= (apply!56 lt!15677 lt!15683) (get!704 (getValueByKey!101 (toList!546 lt!15677) lt!15683)))))

(declare-fun bs!1730 () Bool)

(assert (= bs!1730 d!7241))

(declare-fun m!33981 () Bool)

(assert (=> bs!1730 m!33981))

(assert (=> bs!1730 m!33981))

(declare-fun m!33983 () Bool)

(assert (=> bs!1730 m!33983))

(assert (=> b!40545 d!7241))

(declare-fun d!7243 () Bool)

(declare-fun e!26007 () Bool)

(assert (=> d!7243 e!26007))

(declare-fun res!24398 () Bool)

(assert (=> d!7243 (=> (not res!24398) (not e!26007))))

(declare-fun lt!15954 () ListLongMap!1061)

(assert (=> d!7243 (= res!24398 (contains!515 lt!15954 (_1!753 (tuple2!1485 lt!15685 (minValue!1721 lt!15445)))))))

(declare-fun lt!15953 () List!1052)

(assert (=> d!7243 (= lt!15954 (ListLongMap!1062 lt!15953))))

(declare-fun lt!15952 () Unit!981)

(declare-fun lt!15951 () Unit!981)

(assert (=> d!7243 (= lt!15952 lt!15951)))

(assert (=> d!7243 (= (getValueByKey!101 lt!15953 (_1!753 (tuple2!1485 lt!15685 (minValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 lt!15685 (minValue!1721 lt!15445)))))))

(assert (=> d!7243 (= lt!15951 (lemmaContainsTupThenGetReturnValue!25 lt!15953 (_1!753 (tuple2!1485 lt!15685 (minValue!1721 lt!15445))) (_2!753 (tuple2!1485 lt!15685 (minValue!1721 lt!15445)))))))

(assert (=> d!7243 (= lt!15953 (insertStrictlySorted!22 (toList!546 lt!15686) (_1!753 (tuple2!1485 lt!15685 (minValue!1721 lt!15445))) (_2!753 (tuple2!1485 lt!15685 (minValue!1721 lt!15445)))))))

(assert (=> d!7243 (= (+!65 lt!15686 (tuple2!1485 lt!15685 (minValue!1721 lt!15445))) lt!15954)))

(declare-fun b!41022 () Bool)

(declare-fun res!24399 () Bool)

(assert (=> b!41022 (=> (not res!24399) (not e!26007))))

(assert (=> b!41022 (= res!24399 (= (getValueByKey!101 (toList!546 lt!15954) (_1!753 (tuple2!1485 lt!15685 (minValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 lt!15685 (minValue!1721 lt!15445))))))))

(declare-fun b!41023 () Bool)

(assert (=> b!41023 (= e!26007 (contains!517 (toList!546 lt!15954) (tuple2!1485 lt!15685 (minValue!1721 lt!15445))))))

(assert (= (and d!7243 res!24398) b!41022))

(assert (= (and b!41022 res!24399) b!41023))

(declare-fun m!33985 () Bool)

(assert (=> d!7243 m!33985))

(declare-fun m!33987 () Bool)

(assert (=> d!7243 m!33987))

(declare-fun m!33989 () Bool)

(assert (=> d!7243 m!33989))

(declare-fun m!33991 () Bool)

(assert (=> d!7243 m!33991))

(declare-fun m!33993 () Bool)

(assert (=> b!41022 m!33993))

(declare-fun m!33995 () Bool)

(assert (=> b!41023 m!33995))

(assert (=> b!40545 d!7243))

(declare-fun d!7245 () Bool)

(assert (=> d!7245 (= (apply!56 lt!15686 lt!15678) (get!704 (getValueByKey!101 (toList!546 lt!15686) lt!15678)))))

(declare-fun bs!1731 () Bool)

(assert (= bs!1731 d!7245))

(declare-fun m!33997 () Bool)

(assert (=> bs!1731 m!33997))

(assert (=> bs!1731 m!33997))

(declare-fun m!33999 () Bool)

(assert (=> bs!1731 m!33999))

(assert (=> b!40545 d!7245))

(declare-fun d!7247 () Bool)

(assert (=> d!7247 (= (apply!56 (+!65 lt!15692 (tuple2!1485 lt!15690 (minValue!1721 lt!15445))) lt!15684) (apply!56 lt!15692 lt!15684))))

(declare-fun lt!15955 () Unit!981)

(assert (=> d!7247 (= lt!15955 (choose!247 lt!15692 lt!15690 (minValue!1721 lt!15445) lt!15684))))

(declare-fun e!26008 () Bool)

(assert (=> d!7247 e!26008))

(declare-fun res!24400 () Bool)

(assert (=> d!7247 (=> (not res!24400) (not e!26008))))

(assert (=> d!7247 (= res!24400 (contains!515 lt!15692 lt!15684))))

(assert (=> d!7247 (= (addApplyDifferent!31 lt!15692 lt!15690 (minValue!1721 lt!15445) lt!15684) lt!15955)))

(declare-fun b!41024 () Bool)

(assert (=> b!41024 (= e!26008 (not (= lt!15684 lt!15690)))))

(assert (= (and d!7247 res!24400) b!41024))

(assert (=> d!7247 m!33503))

(declare-fun m!34001 () Bool)

(assert (=> d!7247 m!34001))

(assert (=> d!7247 m!33499))

(assert (=> d!7247 m!33499))

(assert (=> d!7247 m!33501))

(declare-fun m!34003 () Bool)

(assert (=> d!7247 m!34003))

(assert (=> b!40545 d!7247))

(declare-fun d!7249 () Bool)

(declare-fun e!26009 () Bool)

(assert (=> d!7249 e!26009))

(declare-fun res!24401 () Bool)

(assert (=> d!7249 (=> (not res!24401) (not e!26009))))

(declare-fun lt!15959 () ListLongMap!1061)

(assert (=> d!7249 (= res!24401 (contains!515 lt!15959 (_1!753 (tuple2!1485 lt!15690 (minValue!1721 lt!15445)))))))

(declare-fun lt!15958 () List!1052)

(assert (=> d!7249 (= lt!15959 (ListLongMap!1062 lt!15958))))

(declare-fun lt!15957 () Unit!981)

(declare-fun lt!15956 () Unit!981)

(assert (=> d!7249 (= lt!15957 lt!15956)))

(assert (=> d!7249 (= (getValueByKey!101 lt!15958 (_1!753 (tuple2!1485 lt!15690 (minValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 lt!15690 (minValue!1721 lt!15445)))))))

(assert (=> d!7249 (= lt!15956 (lemmaContainsTupThenGetReturnValue!25 lt!15958 (_1!753 (tuple2!1485 lt!15690 (minValue!1721 lt!15445))) (_2!753 (tuple2!1485 lt!15690 (minValue!1721 lt!15445)))))))

(assert (=> d!7249 (= lt!15958 (insertStrictlySorted!22 (toList!546 lt!15692) (_1!753 (tuple2!1485 lt!15690 (minValue!1721 lt!15445))) (_2!753 (tuple2!1485 lt!15690 (minValue!1721 lt!15445)))))))

(assert (=> d!7249 (= (+!65 lt!15692 (tuple2!1485 lt!15690 (minValue!1721 lt!15445))) lt!15959)))

(declare-fun b!41025 () Bool)

(declare-fun res!24402 () Bool)

(assert (=> b!41025 (=> (not res!24402) (not e!26009))))

(assert (=> b!41025 (= res!24402 (= (getValueByKey!101 (toList!546 lt!15959) (_1!753 (tuple2!1485 lt!15690 (minValue!1721 lt!15445)))) (Some!106 (_2!753 (tuple2!1485 lt!15690 (minValue!1721 lt!15445))))))))

(declare-fun b!41026 () Bool)

(assert (=> b!41026 (= e!26009 (contains!517 (toList!546 lt!15959) (tuple2!1485 lt!15690 (minValue!1721 lt!15445))))))

(assert (= (and d!7249 res!24401) b!41025))

(assert (= (and b!41025 res!24402) b!41026))

(declare-fun m!34005 () Bool)

(assert (=> d!7249 m!34005))

(declare-fun m!34007 () Bool)

(assert (=> d!7249 m!34007))

(declare-fun m!34009 () Bool)

(assert (=> d!7249 m!34009))

(declare-fun m!34011 () Bool)

(assert (=> d!7249 m!34011))

(declare-fun m!34013 () Bool)

(assert (=> b!41025 m!34013))

(declare-fun m!34015 () Bool)

(assert (=> b!41026 m!34015))

(assert (=> b!40545 d!7249))

(declare-fun d!7251 () Bool)

(assert (=> d!7251 (= (apply!56 (+!65 lt!15686 (tuple2!1485 lt!15685 (minValue!1721 lt!15445))) lt!15678) (apply!56 lt!15686 lt!15678))))

(declare-fun lt!15960 () Unit!981)

(assert (=> d!7251 (= lt!15960 (choose!247 lt!15686 lt!15685 (minValue!1721 lt!15445) lt!15678))))

(declare-fun e!26010 () Bool)

(assert (=> d!7251 e!26010))

(declare-fun res!24403 () Bool)

(assert (=> d!7251 (=> (not res!24403) (not e!26010))))

(assert (=> d!7251 (= res!24403 (contains!515 lt!15686 lt!15678))))

(assert (=> d!7251 (= (addApplyDifferent!31 lt!15686 lt!15685 (minValue!1721 lt!15445) lt!15678) lt!15960)))

(declare-fun b!41027 () Bool)

(assert (=> b!41027 (= e!26010 (not (= lt!15678 lt!15685)))))

(assert (= (and d!7251 res!24403) b!41027))

(assert (=> d!7251 m!33509))

(declare-fun m!34017 () Bool)

(assert (=> d!7251 m!34017))

(assert (=> d!7251 m!33495))

(assert (=> d!7251 m!33495))

(assert (=> d!7251 m!33507))

(declare-fun m!34019 () Bool)

(assert (=> d!7251 m!34019))

(assert (=> b!40545 d!7251))

(declare-fun d!7253 () Bool)

(assert (=> d!7253 (contains!515 (+!65 lt!15693 (tuple2!1485 lt!15672 (zeroValue!1721 lt!15445))) lt!15691)))

(declare-fun lt!15963 () Unit!981)

(declare-fun choose!249 (ListLongMap!1061 (_ BitVec 64) V!2097 (_ BitVec 64)) Unit!981)

(assert (=> d!7253 (= lt!15963 (choose!249 lt!15693 lt!15672 (zeroValue!1721 lt!15445) lt!15691))))

(assert (=> d!7253 (contains!515 lt!15693 lt!15691)))

(assert (=> d!7253 (= (addStillContains!31 lt!15693 lt!15672 (zeroValue!1721 lt!15445) lt!15691) lt!15963)))

(declare-fun bs!1732 () Bool)

(assert (= bs!1732 d!7253))

(assert (=> bs!1732 m!33511))

(assert (=> bs!1732 m!33511))

(assert (=> bs!1732 m!33513))

(declare-fun m!34021 () Bool)

(assert (=> bs!1732 m!34021))

(declare-fun m!34023 () Bool)

(assert (=> bs!1732 m!34023))

(assert (=> b!40545 d!7253))

(declare-fun d!7255 () Bool)

(assert (=> d!7255 (= (size!1395 lt!15445) (bvadd (_size!168 lt!15445) (bvsdiv (bvadd (extraKeys!1694 lt!15445) #b00000000000000000000000000000001) #b00000000000000000000000000000010)))))

(assert (=> b!40773 d!7255))

(declare-fun d!7257 () Bool)

(declare-fun e!26015 () Bool)

(assert (=> d!7257 e!26015))

(declare-fun res!24404 () Bool)

(assert (=> d!7257 (=> res!24404 e!26015)))

(declare-fun lt!15980 () Bool)

(assert (=> d!7257 (= res!24404 (not lt!15980))))

(declare-fun lt!15981 () Bool)

(assert (=> d!7257 (= lt!15980 lt!15981)))

(declare-fun lt!15978 () Unit!981)

(declare-fun e!26016 () Unit!981)

(assert (=> d!7257 (= lt!15978 e!26016)))

(declare-fun c!5109 () Bool)

(assert (=> d!7257 (= c!5109 lt!15981)))

(assert (=> d!7257 (= lt!15981 (containsKey!70 (toList!546 lt!15680) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7257 (= (contains!515 lt!15680 #b1000000000000000000000000000000000000000000000000000000000000000) lt!15980)))

(declare-fun b!41037 () Bool)

(declare-fun lt!15979 () Unit!981)

(assert (=> b!41037 (= e!26016 lt!15979)))

(assert (=> b!41037 (= lt!15979 (lemmaContainsKeyImpliesGetValueByKeyDefined!58 (toList!546 lt!15680) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!41037 (isDefined!59 (getValueByKey!101 (toList!546 lt!15680) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41038 () Bool)

(declare-fun Unit!995 () Unit!981)

(assert (=> b!41038 (= e!26016 Unit!995)))

(declare-fun b!41039 () Bool)

(assert (=> b!41039 (= e!26015 (isDefined!59 (getValueByKey!101 (toList!546 lt!15680) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7257 c!5109) b!41037))

(assert (= (and d!7257 (not c!5109)) b!41038))

(assert (= (and d!7257 (not res!24404)) b!41039))

(declare-fun m!34025 () Bool)

(assert (=> d!7257 m!34025))

(declare-fun m!34027 () Bool)

(assert (=> b!41037 m!34027))

(assert (=> b!41037 m!33819))

(assert (=> b!41037 m!33819))

(declare-fun m!34029 () Bool)

(assert (=> b!41037 m!34029))

(assert (=> b!41039 m!33819))

(assert (=> b!41039 m!33819))

(assert (=> b!41039 m!34029))

(assert (=> bm!3165 d!7257))

(assert (=> bm!3170 d!7189))

(assert (=> b!40772 d!7255))

(declare-fun d!7259 () Bool)

(assert (=> d!7259 (= (apply!56 lt!15680 #b0000000000000000000000000000000000000000000000000000000000000000) (get!704 (getValueByKey!101 (toList!546 lt!15680) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bs!1733 () Bool)

(assert (= bs!1733 d!7259))

(declare-fun m!34031 () Bool)

(assert (=> bs!1733 m!34031))

(assert (=> bs!1733 m!34031))

(declare-fun m!34033 () Bool)

(assert (=> bs!1733 m!34033))

(assert (=> b!40546 d!7259))

(declare-fun d!7261 () Bool)

(declare-fun e!26017 () Bool)

(assert (=> d!7261 e!26017))

(declare-fun res!24405 () Bool)

(assert (=> d!7261 (=> res!24405 e!26017)))

(declare-fun lt!15984 () Bool)

(assert (=> d!7261 (= res!24405 (not lt!15984))))

(declare-fun lt!15985 () Bool)

(assert (=> d!7261 (= lt!15984 lt!15985)))

(declare-fun lt!15982 () Unit!981)

(declare-fun e!26018 () Unit!981)

(assert (=> d!7261 (= lt!15982 e!26018)))

(declare-fun c!5110 () Bool)

(assert (=> d!7261 (= c!5110 lt!15985)))

(assert (=> d!7261 (= lt!15985 (containsKey!70 (toList!546 lt!15680) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!7261 (= (contains!515 lt!15680 #b0000000000000000000000000000000000000000000000000000000000000000) lt!15984)))

(declare-fun b!41040 () Bool)

(declare-fun lt!15983 () Unit!981)

(assert (=> b!41040 (= e!26018 lt!15983)))

(assert (=> b!41040 (= lt!15983 (lemmaContainsKeyImpliesGetValueByKeyDefined!58 (toList!546 lt!15680) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!41040 (isDefined!59 (getValueByKey!101 (toList!546 lt!15680) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!41041 () Bool)

(declare-fun Unit!996 () Unit!981)

(assert (=> b!41041 (= e!26018 Unit!996)))

(declare-fun b!41042 () Bool)

(assert (=> b!41042 (= e!26017 (isDefined!59 (getValueByKey!101 (toList!546 lt!15680) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7261 c!5110) b!41040))

(assert (= (and d!7261 (not c!5110)) b!41041))

(assert (= (and d!7261 (not res!24405)) b!41042))

(declare-fun m!34035 () Bool)

(assert (=> d!7261 m!34035))

(declare-fun m!34037 () Bool)

(assert (=> b!41040 m!34037))

(assert (=> b!41040 m!34031))

(assert (=> b!41040 m!34031))

(declare-fun m!34039 () Bool)

(assert (=> b!41040 m!34039))

(assert (=> b!41042 m!34031))

(assert (=> b!41042 m!34031))

(assert (=> b!41042 m!34039))

(assert (=> bm!3164 d!7261))

(assert (=> b!40413 d!7131))

(assert (=> b!40745 d!7131))

(declare-fun d!7263 () Bool)

(assert (=> d!7263 (= (apply!56 lt!15680 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)) (get!704 (getValueByKey!101 (toList!546 lt!15680) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000))))))

(declare-fun bs!1734 () Bool)

(assert (= bs!1734 d!7263))

(assert (=> bs!1734 m!33349))

(assert (=> bs!1734 m!33815))

(assert (=> bs!1734 m!33815))

(declare-fun m!34041 () Bool)

(assert (=> bs!1734 m!34041))

(assert (=> b!40543 d!7263))

(declare-fun d!7265 () Bool)

(declare-fun c!5117 () Bool)

(assert (=> d!7265 (= c!5117 (is-ValueCellFull!629 (select (arr!1240 (_values!1786 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun e!26031 () V!2097)

(assert (=> d!7265 (= (get!701 (select (arr!1240 (_values!1786 lt!15445)) #b00000000000000000000000000000000) (dynLambda!190 (defaultEntry!1803 lt!15445) #b0000000000000000000000000000000000000000000000000000000000000000)) e!26031)))

(declare-fun b!41063 () Bool)

(declare-fun get!708 (ValueCell!629 V!2097) V!2097)

(assert (=> b!41063 (= e!26031 (get!708 (select (arr!1240 (_values!1786 lt!15445)) #b00000000000000000000000000000000) (dynLambda!190 (defaultEntry!1803 lt!15445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!41064 () Bool)

(declare-fun get!709 (ValueCell!629 V!2097) V!2097)

(assert (=> b!41064 (= e!26031 (get!709 (select (arr!1240 (_values!1786 lt!15445)) #b00000000000000000000000000000000) (dynLambda!190 (defaultEntry!1803 lt!15445) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!7265 c!5117) b!41063))

(assert (= (and d!7265 (not c!5117)) b!41064))

(assert (=> b!41063 m!33471))

(assert (=> b!41063 m!33469))

(declare-fun m!34043 () Bool)

(assert (=> b!41063 m!34043))

(assert (=> b!41064 m!33471))

(assert (=> b!41064 m!33469))

(declare-fun m!34045 () Bool)

(assert (=> b!41064 m!34045))

(assert (=> b!40543 d!7265))

(declare-fun b!41065 () Bool)

(declare-fun e!26033 () (_ BitVec 32))

(declare-fun call!3219 () (_ BitVec 32))

(assert (=> b!41065 (= e!26033 call!3219)))

(declare-fun b!41066 () Bool)

(declare-fun e!26032 () (_ BitVec 32))

(assert (=> b!41066 (= e!26032 e!26033)))

(declare-fun c!5119 () Bool)

(assert (=> b!41066 (= c!5119 (validKeyInArray!0 (select (arr!1239 (_keys!3292 lt!15445)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!3216 () Bool)

(assert (=> bm!3216 (= call!3219 (arrayCountValidKeys!0 (_keys!3292 lt!15445) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!1376 (_keys!3292 lt!15445))))))

(declare-fun d!7267 () Bool)

(declare-fun lt!15986 () (_ BitVec 32))

(assert (=> d!7267 (and (bvsge lt!15986 #b00000000000000000000000000000000) (bvsle lt!15986 (bvsub (size!1376 (_keys!3292 lt!15445)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> d!7267 (= lt!15986 e!26032)))

(declare-fun c!5118 () Bool)

(assert (=> d!7267 (= c!5118 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 (_keys!3292 lt!15445))))))

(assert (=> d!7267 (and (bvsle (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 (_keys!3292 lt!15445))) (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (size!1376 (_keys!3292 lt!15445)) (size!1376 (_keys!3292 lt!15445))))))

(assert (=> d!7267 (= (arrayCountValidKeys!0 (_keys!3292 lt!15445) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!1376 (_keys!3292 lt!15445))) lt!15986)))

(declare-fun b!41067 () Bool)

(assert (=> b!41067 (= e!26032 #b00000000000000000000000000000000)))

(declare-fun b!41068 () Bool)

(assert (=> b!41068 (= e!26033 (bvadd #b00000000000000000000000000000001 call!3219))))

(assert (= (and d!7267 c!5118) b!41067))

(assert (= (and d!7267 (not c!5118)) b!41066))

(assert (= (and b!41066 c!5119) b!41068))

(assert (= (and b!41066 (not c!5119)) b!41065))

(assert (= (or b!41068 b!41065) bm!3216))

(assert (=> b!41066 m!33721))

(assert (=> b!41066 m!33721))

(assert (=> b!41066 m!33725))

(declare-fun m!34047 () Bool)

(assert (=> bm!3216 m!34047))

(assert (=> bm!3123 d!7267))

(declare-fun d!7269 () Bool)

(declare-fun lt!15987 () Bool)

(assert (=> d!7269 (= lt!15987 (set.member (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000) (content!30 Nil!1050)))))

(declare-fun e!26035 () Bool)

(assert (=> d!7269 (= lt!15987 e!26035)))

(declare-fun res!24414 () Bool)

(assert (=> d!7269 (=> (not res!24414) (not e!26035))))

(assert (=> d!7269 (= res!24414 (is-Cons!1049 Nil!1050))))

(assert (=> d!7269 (= (contains!511 Nil!1050 (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)) lt!15987)))

(declare-fun b!41069 () Bool)

(declare-fun e!26034 () Bool)

(assert (=> b!41069 (= e!26035 e!26034)))

(declare-fun res!24415 () Bool)

(assert (=> b!41069 (=> res!24415 e!26034)))

(assert (=> b!41069 (= res!24415 (= (h!1623 Nil!1050) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(declare-fun b!41070 () Bool)

(assert (=> b!41070 (= e!26034 (contains!511 (t!3906 Nil!1050) (select (arr!1239 (_keys!3292 lt!15445)) #b00000000000000000000000000000000)))))

(assert (= (and d!7269 res!24414) b!41069))

(assert (= (and b!41069 (not res!24415)) b!41070))

(assert (=> d!7269 m!33527))

(assert (=> d!7269 m!33349))

(declare-fun m!34049 () Bool)

(assert (=> d!7269 m!34049))

(assert (=> b!41070 m!33349))

(declare-fun m!34051 () Bool)

(assert (=> b!41070 m!34051))

(assert (=> b!40746 d!7269))

(declare-fun b_lambda!2079 () Bool)

(assert (= b_lambda!2071 (or (and start!5692 b_free!1363 (= defaultEntry!470 (defaultEntry!1803 lt!15445))) b_lambda!2079)))

(push 1)

(assert (not b!40930))

(assert (not d!7269))

(assert (not bm!3216))

(assert (not b!40850))

(assert (not d!7173))

(assert (not b!40808))

(assert (not b!41009))

(assert (not d!7171))

(assert (not d!7259))

(assert (not b!41017))

(assert (not b_next!1363))

(assert (not d!7261))

(assert (not b!40814))

(assert tp_is_empty!1753)

(assert (not b!41025))

(assert (not d!7239))

(assert (not d!7235))

(assert b_and!2377)

(assert (not d!7189))

(assert (not b!41066))

(assert (not b!41014))

(assert (not b!40860))

(assert (not bm!3205))

(assert (not d!7249))

(assert (not d!7147))

(assert (not d!7187))

(assert (not b!41023))

(assert (not b!40886))

(assert (not bm!3206))

(assert (not b!40806))

(assert (not b!40878))

(assert (not b!41040))

(assert (not b!40863))

(assert (not b!40875))

(assert (not b!40888))

(assert (not b!40855))

(assert (not b_lambda!2075))

(assert (not b!41006))

(assert (not b!41012))

(assert (not b!40929))

(assert (not d!7251))

(assert (not b!40931))

(assert (not b!40858))

(assert (not b!41037))

(assert (not d!7231))

(assert (not d!7153))

(assert (not b!40815))

(assert (not b!41016))

(assert (not d!7243))

(assert (not d!7157))

(assert (not b!40817))

(assert (not b!40927))

(assert (not d!7233))

(assert (not b!41064))

(assert (not b!40856))

(assert (not bm!3213))

(assert (not b!41004))

(assert (not b!41022))

(assert (not d!7253))

(assert (not d!7241))

(assert (not b_lambda!2079))

(assert (not b!40861))

(assert (not d!7179))

(assert (not d!7149))

(assert (not b!40871))

(assert (not b!41008))

(assert (not b_lambda!2077))

(assert (not b!40868))

(assert (not b!41007))

(assert (not d!7245))

(assert (not d!7247))

(assert (not bm!3207))

(assert (not d!7237))

(assert (not b!41026))

(assert (not b!40926))

(assert (not d!7177))

(assert (not b_lambda!2063))

(assert (not d!7257))

(assert (not b!41013))

(assert (not d!7137))

(assert (not b!41039))

(assert (not b!40873))

(assert (not d!7143))

(assert (not b!40812))

(assert (not b!41063))

(assert (not bm!3204))

(assert (not d!7263))

(assert (not d!7133))

(assert (not d!7183))

(assert (not bm!3208))

(assert (not b!40915))

(assert (not b!41070))

(assert (not b!40810))

(assert (not d!7161))

(assert (not b!40822))

(assert (not b!40879))

(assert (not d!7185))

(assert (not b!41042))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2377)

(assert (not b_next!1363))

(check-sat)

(pop 1)

