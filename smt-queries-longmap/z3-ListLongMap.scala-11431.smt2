; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133296 () Bool)

(assert start!133296)

(declare-fun b!1558903 () Bool)

(declare-fun e!868546 () Bool)

(declare-fun tp_is_empty!38467 () Bool)

(assert (=> b!1558903 (= e!868546 tp_is_empty!38467)))

(declare-fun mapNonEmpty!59064 () Bool)

(declare-fun mapRes!59064 () Bool)

(declare-fun tp!112720 () Bool)

(declare-fun e!868547 () Bool)

(assert (=> mapNonEmpty!59064 (= mapRes!59064 (and tp!112720 e!868547))))

(declare-fun mapKey!59064 () (_ BitVec 32))

(declare-datatypes ((V!59497 0))(
  ( (V!59498 (val!19317 Int)) )
))
(declare-datatypes ((ValueCell!18203 0))(
  ( (ValueCellFull!18203 (v!22064 V!59497)) (EmptyCell!18203) )
))
(declare-fun mapValue!59064 () ValueCell!18203)

(declare-fun mapRest!59064 () (Array (_ BitVec 32) ValueCell!18203))

(declare-datatypes ((array!103578 0))(
  ( (array!103579 (arr!49986 (Array (_ BitVec 32) ValueCell!18203)) (size!50538 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103578)

(assert (=> mapNonEmpty!59064 (= (arr!49986 _values!487) (store mapRest!59064 mapKey!59064 mapValue!59064))))

(declare-fun b!1558904 () Bool)

(declare-fun e!868543 () Bool)

(assert (=> b!1558904 (= e!868543 (and e!868546 mapRes!59064))))

(declare-fun condMapEmpty!59064 () Bool)

(declare-fun mapDefault!59064 () ValueCell!18203)

(assert (=> b!1558904 (= condMapEmpty!59064 (= (arr!49986 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18203)) mapDefault!59064)))))

(declare-fun res!1066153 () Bool)

(declare-fun e!868545 () Bool)

(assert (=> start!133296 (=> (not res!1066153) (not e!868545))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133296 (= res!1066153 (validMask!0 mask!947))))

(assert (=> start!133296 e!868545))

(assert (=> start!133296 true))

(declare-fun array_inv!39059 (array!103578) Bool)

(assert (=> start!133296 (and (array_inv!39059 _values!487) e!868543)))

(declare-datatypes ((array!103580 0))(
  ( (array!103581 (arr!49987 (Array (_ BitVec 32) (_ BitVec 64))) (size!50539 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103580)

(declare-fun array_inv!39060 (array!103580) Bool)

(assert (=> start!133296 (array_inv!39060 _keys!637)))

(declare-fun b!1558905 () Bool)

(declare-fun res!1066152 () Bool)

(assert (=> b!1558905 (=> (not res!1066152) (not e!868545))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1558905 (= res!1066152 (and (= (size!50538 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50539 _keys!637) (size!50538 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1558906 () Bool)

(assert (=> b!1558906 (= e!868545 (bvsgt #b00000000000000000000000000000000 (size!50539 _keys!637)))))

(declare-fun mapIsEmpty!59064 () Bool)

(assert (=> mapIsEmpty!59064 mapRes!59064))

(declare-fun b!1558907 () Bool)

(declare-fun res!1066151 () Bool)

(assert (=> b!1558907 (=> (not res!1066151) (not e!868545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103580 (_ BitVec 32)) Bool)

(assert (=> b!1558907 (= res!1066151 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1558908 () Bool)

(assert (=> b!1558908 (= e!868547 tp_is_empty!38467)))

(assert (= (and start!133296 res!1066153) b!1558905))

(assert (= (and b!1558905 res!1066152) b!1558907))

(assert (= (and b!1558907 res!1066151) b!1558906))

(assert (= (and b!1558904 condMapEmpty!59064) mapIsEmpty!59064))

(assert (= (and b!1558904 (not condMapEmpty!59064)) mapNonEmpty!59064))

(get-info :version)

(assert (= (and mapNonEmpty!59064 ((_ is ValueCellFull!18203) mapValue!59064)) b!1558908))

(assert (= (and b!1558904 ((_ is ValueCellFull!18203) mapDefault!59064)) b!1558903))

(assert (= start!133296 b!1558904))

(declare-fun m!1434655 () Bool)

(assert (=> mapNonEmpty!59064 m!1434655))

(declare-fun m!1434657 () Bool)

(assert (=> start!133296 m!1434657))

(declare-fun m!1434659 () Bool)

(assert (=> start!133296 m!1434659))

(declare-fun m!1434661 () Bool)

(assert (=> start!133296 m!1434661))

(declare-fun m!1434663 () Bool)

(assert (=> b!1558907 m!1434663))

(check-sat (not b!1558907) (not start!133296) (not mapNonEmpty!59064) tp_is_empty!38467)
(check-sat)
(get-model)

(declare-fun b!1558953 () Bool)

(declare-fun e!868584 () Bool)

(declare-fun e!868586 () Bool)

(assert (=> b!1558953 (= e!868584 e!868586)))

(declare-fun c!144126 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1558953 (= c!144126 (validKeyInArray!0 (select (arr!49987 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1558954 () Bool)

(declare-fun e!868585 () Bool)

(declare-fun call!71800 () Bool)

(assert (=> b!1558954 (= e!868585 call!71800)))

(declare-fun b!1558955 () Bool)

(assert (=> b!1558955 (= e!868586 e!868585)))

(declare-fun lt!670573 () (_ BitVec 64))

(assert (=> b!1558955 (= lt!670573 (select (arr!49987 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51710 0))(
  ( (Unit!51711) )
))
(declare-fun lt!670571 () Unit!51710)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!103580 (_ BitVec 64) (_ BitVec 32)) Unit!51710)

(assert (=> b!1558955 (= lt!670571 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!670573 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!103580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1558955 (arrayContainsKey!0 _keys!637 lt!670573 #b00000000000000000000000000000000)))

(declare-fun lt!670572 () Unit!51710)

(assert (=> b!1558955 (= lt!670572 lt!670571)))

(declare-fun res!1066177 () Bool)

(declare-datatypes ((SeekEntryResult!13517 0))(
  ( (MissingZero!13517 (index!56466 (_ BitVec 32))) (Found!13517 (index!56467 (_ BitVec 32))) (Intermediate!13517 (undefined!14329 Bool) (index!56468 (_ BitVec 32)) (x!139748 (_ BitVec 32))) (Undefined!13517) (MissingVacant!13517 (index!56469 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!103580 (_ BitVec 32)) SeekEntryResult!13517)

(assert (=> b!1558955 (= res!1066177 (= (seekEntryOrOpen!0 (select (arr!49987 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13517 #b00000000000000000000000000000000)))))

(assert (=> b!1558955 (=> (not res!1066177) (not e!868585))))

(declare-fun bm!71797 () Bool)

(assert (=> bm!71797 (= call!71800 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun d!162649 () Bool)

(declare-fun res!1066176 () Bool)

(assert (=> d!162649 (=> res!1066176 e!868584)))

(assert (=> d!162649 (= res!1066176 (bvsge #b00000000000000000000000000000000 (size!50539 _keys!637)))))

(assert (=> d!162649 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!868584)))

(declare-fun b!1558956 () Bool)

(assert (=> b!1558956 (= e!868586 call!71800)))

(assert (= (and d!162649 (not res!1066176)) b!1558953))

(assert (= (and b!1558953 c!144126) b!1558955))

(assert (= (and b!1558953 (not c!144126)) b!1558956))

(assert (= (and b!1558955 res!1066177) b!1558954))

(assert (= (or b!1558954 b!1558956) bm!71797))

(declare-fun m!1434685 () Bool)

(assert (=> b!1558953 m!1434685))

(assert (=> b!1558953 m!1434685))

(declare-fun m!1434687 () Bool)

(assert (=> b!1558953 m!1434687))

(assert (=> b!1558955 m!1434685))

(declare-fun m!1434689 () Bool)

(assert (=> b!1558955 m!1434689))

(declare-fun m!1434691 () Bool)

(assert (=> b!1558955 m!1434691))

(assert (=> b!1558955 m!1434685))

(declare-fun m!1434693 () Bool)

(assert (=> b!1558955 m!1434693))

(declare-fun m!1434695 () Bool)

(assert (=> bm!71797 m!1434695))

(assert (=> b!1558907 d!162649))

(declare-fun d!162651 () Bool)

(assert (=> d!162651 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!133296 d!162651))

(declare-fun d!162653 () Bool)

(assert (=> d!162653 (= (array_inv!39059 _values!487) (bvsge (size!50538 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!133296 d!162653))

(declare-fun d!162655 () Bool)

(assert (=> d!162655 (= (array_inv!39060 _keys!637) (bvsge (size!50539 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!133296 d!162655))

(declare-fun b!1558963 () Bool)

(declare-fun e!868592 () Bool)

(assert (=> b!1558963 (= e!868592 tp_is_empty!38467)))

(declare-fun mapNonEmpty!59073 () Bool)

(declare-fun mapRes!59073 () Bool)

(declare-fun tp!112729 () Bool)

(assert (=> mapNonEmpty!59073 (= mapRes!59073 (and tp!112729 e!868592))))

(declare-fun mapValue!59073 () ValueCell!18203)

(declare-fun mapRest!59073 () (Array (_ BitVec 32) ValueCell!18203))

(declare-fun mapKey!59073 () (_ BitVec 32))

(assert (=> mapNonEmpty!59073 (= mapRest!59064 (store mapRest!59073 mapKey!59073 mapValue!59073))))

(declare-fun b!1558964 () Bool)

(declare-fun e!868591 () Bool)

(assert (=> b!1558964 (= e!868591 tp_is_empty!38467)))

(declare-fun condMapEmpty!59073 () Bool)

(declare-fun mapDefault!59073 () ValueCell!18203)

(assert (=> mapNonEmpty!59064 (= condMapEmpty!59073 (= mapRest!59064 ((as const (Array (_ BitVec 32) ValueCell!18203)) mapDefault!59073)))))

(assert (=> mapNonEmpty!59064 (= tp!112720 (and e!868591 mapRes!59073))))

(declare-fun mapIsEmpty!59073 () Bool)

(assert (=> mapIsEmpty!59073 mapRes!59073))

(assert (= (and mapNonEmpty!59064 condMapEmpty!59073) mapIsEmpty!59073))

(assert (= (and mapNonEmpty!59064 (not condMapEmpty!59073)) mapNonEmpty!59073))

(assert (= (and mapNonEmpty!59073 ((_ is ValueCellFull!18203) mapValue!59073)) b!1558963))

(assert (= (and mapNonEmpty!59064 ((_ is ValueCellFull!18203) mapDefault!59073)) b!1558964))

(declare-fun m!1434697 () Bool)

(assert (=> mapNonEmpty!59073 m!1434697))

(check-sat tp_is_empty!38467 (not bm!71797) (not b!1558953) (not mapNonEmpty!59073) (not b!1558955))
(check-sat)
