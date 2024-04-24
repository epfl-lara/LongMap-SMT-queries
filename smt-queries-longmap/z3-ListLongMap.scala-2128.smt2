; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35982 () Bool)

(assert start!35982)

(declare-fun b!361506 () Bool)

(declare-fun res!201126 () Bool)

(declare-fun e!221398 () Bool)

(assert (=> b!361506 (=> (not res!201126) (not e!221398))))

(declare-datatypes ((array!20316 0))(
  ( (array!20317 (arr!9645 (Array (_ BitVec 32) (_ BitVec 64))) (size!9997 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20316)

(declare-datatypes ((List!5422 0))(
  ( (Nil!5419) (Cons!5418 (h!6274 (_ BitVec 64)) (t!10564 List!5422)) )
))
(declare-fun arrayNoDuplicates!0 (array!20316 (_ BitVec 32) List!5422) Bool)

(assert (=> b!361506 (= res!201126 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5419))))

(declare-fun b!361507 () Bool)

(declare-fun res!201125 () Bool)

(assert (=> b!361507 (=> (not res!201125) (not e!221398))))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20316 (_ BitVec 32)) Bool)

(assert (=> b!361507 (= res!201125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361508 () Bool)

(declare-fun from!1924 () (_ BitVec 32))

(assert (=> b!361508 (= e!221398 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!9997 _keys!1541)) (bvsge (size!9997 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361509 () Bool)

(declare-fun e!221401 () Bool)

(declare-fun tp_is_empty!8389 () Bool)

(assert (=> b!361509 (= e!221401 tp_is_empty!8389)))

(declare-fun b!361510 () Bool)

(declare-fun e!221399 () Bool)

(assert (=> b!361510 (= e!221399 tp_is_empty!8389)))

(declare-fun b!361511 () Bool)

(declare-fun res!201128 () Bool)

(assert (=> b!361511 (=> (not res!201128) (not e!221398))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-datatypes ((V!12163 0))(
  ( (V!12164 (val!4239 Int)) )
))
(declare-datatypes ((ValueCell!3851 0))(
  ( (ValueCellFull!3851 (v!6435 V!12163)) (EmptyCell!3851) )
))
(declare-datatypes ((array!20318 0))(
  ( (array!20319 (arr!9646 (Array (_ BitVec 32) ValueCell!3851)) (size!9998 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20318)

(assert (=> b!361511 (= res!201128 (and (= (size!9998 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9997 _keys!1541) (size!9998 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14109 () Bool)

(declare-fun mapRes!14109 () Bool)

(assert (=> mapIsEmpty!14109 mapRes!14109))

(declare-fun b!361512 () Bool)

(declare-fun e!221402 () Bool)

(assert (=> b!361512 (= e!221402 (and e!221401 mapRes!14109))))

(declare-fun condMapEmpty!14109 () Bool)

(declare-fun mapDefault!14109 () ValueCell!3851)

(assert (=> b!361512 (= condMapEmpty!14109 (= (arr!9646 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3851)) mapDefault!14109)))))

(declare-fun mapNonEmpty!14109 () Bool)

(declare-fun tp!28185 () Bool)

(assert (=> mapNonEmpty!14109 (= mapRes!14109 (and tp!28185 e!221399))))

(declare-fun mapValue!14109 () ValueCell!3851)

(declare-fun mapKey!14109 () (_ BitVec 32))

(declare-fun mapRest!14109 () (Array (_ BitVec 32) ValueCell!3851))

(assert (=> mapNonEmpty!14109 (= (arr!9646 _values!1277) (store mapRest!14109 mapKey!14109 mapValue!14109))))

(declare-fun res!201127 () Bool)

(assert (=> start!35982 (=> (not res!201127) (not e!221398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35982 (= res!201127 (validMask!0 mask!1943))))

(assert (=> start!35982 e!221398))

(assert (=> start!35982 true))

(declare-fun array_inv!7124 (array!20316) Bool)

(assert (=> start!35982 (array_inv!7124 _keys!1541)))

(declare-fun array_inv!7125 (array!20318) Bool)

(assert (=> start!35982 (and (array_inv!7125 _values!1277) e!221402)))

(assert (= (and start!35982 res!201127) b!361511))

(assert (= (and b!361511 res!201128) b!361507))

(assert (= (and b!361507 res!201125) b!361506))

(assert (= (and b!361506 res!201126) b!361508))

(assert (= (and b!361512 condMapEmpty!14109) mapIsEmpty!14109))

(assert (= (and b!361512 (not condMapEmpty!14109)) mapNonEmpty!14109))

(get-info :version)

(assert (= (and mapNonEmpty!14109 ((_ is ValueCellFull!3851) mapValue!14109)) b!361510))

(assert (= (and b!361512 ((_ is ValueCellFull!3851) mapDefault!14109)) b!361509))

(assert (= start!35982 b!361512))

(declare-fun m!358569 () Bool)

(assert (=> b!361506 m!358569))

(declare-fun m!358571 () Bool)

(assert (=> b!361507 m!358571))

(declare-fun m!358573 () Bool)

(assert (=> mapNonEmpty!14109 m!358573))

(declare-fun m!358575 () Bool)

(assert (=> start!35982 m!358575))

(declare-fun m!358577 () Bool)

(assert (=> start!35982 m!358577))

(declare-fun m!358579 () Bool)

(assert (=> start!35982 m!358579))

(check-sat (not b!361506) (not start!35982) (not mapNonEmpty!14109) tp_is_empty!8389 (not b!361507))
(check-sat)
(get-model)

(declare-fun b!361563 () Bool)

(declare-fun e!221439 () Bool)

(declare-fun call!27167 () Bool)

(assert (=> b!361563 (= e!221439 call!27167)))

(declare-fun b!361564 () Bool)

(declare-fun e!221441 () Bool)

(assert (=> b!361564 (= e!221441 e!221439)))

(declare-fun c!53705 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!361564 (= c!53705 (validKeyInArray!0 (select (arr!9645 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27164 () Bool)

(assert (=> bm!27164 (= call!27167 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!361565 () Bool)

(declare-fun e!221440 () Bool)

(assert (=> b!361565 (= e!221440 call!27167)))

(declare-fun b!361566 () Bool)

(assert (=> b!361566 (= e!221439 e!221440)))

(declare-fun lt!166600 () (_ BitVec 64))

(assert (=> b!361566 (= lt!166600 (select (arr!9645 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11105 0))(
  ( (Unit!11106) )
))
(declare-fun lt!166601 () Unit!11105)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20316 (_ BitVec 64) (_ BitVec 32)) Unit!11105)

(assert (=> b!361566 (= lt!166601 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166600 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!20316 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361566 (arrayContainsKey!0 _keys!1541 lt!166600 #b00000000000000000000000000000000)))

(declare-fun lt!166602 () Unit!11105)

(assert (=> b!361566 (= lt!166602 lt!166601)))

(declare-fun res!201157 () Bool)

(declare-datatypes ((SeekEntryResult!3445 0))(
  ( (MissingZero!3445 (index!15959 (_ BitVec 32))) (Found!3445 (index!15960 (_ BitVec 32))) (Intermediate!3445 (undefined!4257 Bool) (index!15961 (_ BitVec 32)) (x!35984 (_ BitVec 32))) (Undefined!3445) (MissingVacant!3445 (index!15962 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20316 (_ BitVec 32)) SeekEntryResult!3445)

(assert (=> b!361566 (= res!201157 (= (seekEntryOrOpen!0 (select (arr!9645 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3445 #b00000000000000000000000000000000)))))

(assert (=> b!361566 (=> (not res!201157) (not e!221440))))

(declare-fun d!71969 () Bool)

(declare-fun res!201158 () Bool)

(assert (=> d!71969 (=> res!201158 e!221441)))

(assert (=> d!71969 (= res!201158 (bvsge #b00000000000000000000000000000000 (size!9997 _keys!1541)))))

(assert (=> d!71969 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221441)))

(assert (= (and d!71969 (not res!201158)) b!361564))

(assert (= (and b!361564 c!53705) b!361566))

(assert (= (and b!361564 (not c!53705)) b!361563))

(assert (= (and b!361566 res!201157) b!361565))

(assert (= (or b!361565 b!361563) bm!27164))

(declare-fun m!358605 () Bool)

(assert (=> b!361564 m!358605))

(assert (=> b!361564 m!358605))

(declare-fun m!358607 () Bool)

(assert (=> b!361564 m!358607))

(declare-fun m!358609 () Bool)

(assert (=> bm!27164 m!358609))

(assert (=> b!361566 m!358605))

(declare-fun m!358611 () Bool)

(assert (=> b!361566 m!358611))

(declare-fun m!358613 () Bool)

(assert (=> b!361566 m!358613))

(assert (=> b!361566 m!358605))

(declare-fun m!358615 () Bool)

(assert (=> b!361566 m!358615))

(assert (=> b!361507 d!71969))

(declare-fun d!71971 () Bool)

(assert (=> d!71971 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!35982 d!71971))

(declare-fun d!71973 () Bool)

(assert (=> d!71973 (= (array_inv!7124 _keys!1541) (bvsge (size!9997 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!35982 d!71973))

(declare-fun d!71975 () Bool)

(assert (=> d!71975 (= (array_inv!7125 _values!1277) (bvsge (size!9998 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!35982 d!71975))

(declare-fun b!361577 () Bool)

(declare-fun e!221453 () Bool)

(declare-fun e!221452 () Bool)

(assert (=> b!361577 (= e!221453 e!221452)))

(declare-fun c!53708 () Bool)

(assert (=> b!361577 (= c!53708 (validKeyInArray!0 (select (arr!9645 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361578 () Bool)

(declare-fun call!27170 () Bool)

(assert (=> b!361578 (= e!221452 call!27170)))

(declare-fun b!361579 () Bool)

(declare-fun e!221451 () Bool)

(declare-fun contains!2408 (List!5422 (_ BitVec 64)) Bool)

(assert (=> b!361579 (= e!221451 (contains!2408 Nil!5419 (select (arr!9645 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!361580 () Bool)

(declare-fun e!221450 () Bool)

(assert (=> b!361580 (= e!221450 e!221453)))

(declare-fun res!201165 () Bool)

(assert (=> b!361580 (=> (not res!201165) (not e!221453))))

(assert (=> b!361580 (= res!201165 (not e!221451))))

(declare-fun res!201166 () Bool)

(assert (=> b!361580 (=> (not res!201166) (not e!221451))))

(assert (=> b!361580 (= res!201166 (validKeyInArray!0 (select (arr!9645 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun d!71977 () Bool)

(declare-fun res!201167 () Bool)

(assert (=> d!71977 (=> res!201167 e!221450)))

(assert (=> d!71977 (= res!201167 (bvsge #b00000000000000000000000000000000 (size!9997 _keys!1541)))))

(assert (=> d!71977 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5419) e!221450)))

(declare-fun b!361581 () Bool)

(assert (=> b!361581 (= e!221452 call!27170)))

(declare-fun bm!27167 () Bool)

(assert (=> bm!27167 (= call!27170 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53708 (Cons!5418 (select (arr!9645 _keys!1541) #b00000000000000000000000000000000) Nil!5419) Nil!5419)))))

(assert (= (and d!71977 (not res!201167)) b!361580))

(assert (= (and b!361580 res!201166) b!361579))

(assert (= (and b!361580 res!201165) b!361577))

(assert (= (and b!361577 c!53708) b!361578))

(assert (= (and b!361577 (not c!53708)) b!361581))

(assert (= (or b!361578 b!361581) bm!27167))

(assert (=> b!361577 m!358605))

(assert (=> b!361577 m!358605))

(assert (=> b!361577 m!358607))

(assert (=> b!361579 m!358605))

(assert (=> b!361579 m!358605))

(declare-fun m!358617 () Bool)

(assert (=> b!361579 m!358617))

(assert (=> b!361580 m!358605))

(assert (=> b!361580 m!358605))

(assert (=> b!361580 m!358607))

(assert (=> bm!27167 m!358605))

(declare-fun m!358619 () Bool)

(assert (=> bm!27167 m!358619))

(assert (=> b!361506 d!71977))

(declare-fun b!361589 () Bool)

(declare-fun e!221459 () Bool)

(assert (=> b!361589 (= e!221459 tp_is_empty!8389)))

(declare-fun condMapEmpty!14118 () Bool)

(declare-fun mapDefault!14118 () ValueCell!3851)

(assert (=> mapNonEmpty!14109 (= condMapEmpty!14118 (= mapRest!14109 ((as const (Array (_ BitVec 32) ValueCell!3851)) mapDefault!14118)))))

(declare-fun mapRes!14118 () Bool)

(assert (=> mapNonEmpty!14109 (= tp!28185 (and e!221459 mapRes!14118))))

(declare-fun b!361588 () Bool)

(declare-fun e!221458 () Bool)

(assert (=> b!361588 (= e!221458 tp_is_empty!8389)))

(declare-fun mapNonEmpty!14118 () Bool)

(declare-fun tp!28194 () Bool)

(assert (=> mapNonEmpty!14118 (= mapRes!14118 (and tp!28194 e!221458))))

(declare-fun mapValue!14118 () ValueCell!3851)

(declare-fun mapKey!14118 () (_ BitVec 32))

(declare-fun mapRest!14118 () (Array (_ BitVec 32) ValueCell!3851))

(assert (=> mapNonEmpty!14118 (= mapRest!14109 (store mapRest!14118 mapKey!14118 mapValue!14118))))

(declare-fun mapIsEmpty!14118 () Bool)

(assert (=> mapIsEmpty!14118 mapRes!14118))

(assert (= (and mapNonEmpty!14109 condMapEmpty!14118) mapIsEmpty!14118))

(assert (= (and mapNonEmpty!14109 (not condMapEmpty!14118)) mapNonEmpty!14118))

(assert (= (and mapNonEmpty!14118 ((_ is ValueCellFull!3851) mapValue!14118)) b!361588))

(assert (= (and mapNonEmpty!14109 ((_ is ValueCellFull!3851) mapDefault!14118)) b!361589))

(declare-fun m!358621 () Bool)

(assert (=> mapNonEmpty!14118 m!358621))

(check-sat (not b!361564) (not bm!27167) (not b!361580) (not mapNonEmpty!14118) (not b!361579) (not bm!27164) (not b!361577) tp_is_empty!8389 (not b!361566))
(check-sat)
