; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82992 () Bool)

(assert start!82992)

(declare-fun mapIsEmpty!34879 () Bool)

(declare-fun mapRes!34879 () Bool)

(assert (=> mapIsEmpty!34879 mapRes!34879))

(declare-fun b!968579 () Bool)

(declare-fun e!545883 () Bool)

(declare-datatypes ((array!59913 0))(
  ( (array!59914 (arr!28824 (Array (_ BitVec 32) (_ BitVec 64))) (size!29303 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59913)

(assert (=> b!968579 (= e!545883 (bvsgt #b00000000000000000000000000000000 (size!29303 _keys!1717)))))

(declare-fun b!968580 () Bool)

(declare-fun e!545882 () Bool)

(declare-fun e!545885 () Bool)

(assert (=> b!968580 (= e!545882 (and e!545885 mapRes!34879))))

(declare-fun condMapEmpty!34879 () Bool)

(declare-datatypes ((V!34211 0))(
  ( (V!34212 (val!11011 Int)) )
))
(declare-datatypes ((ValueCell!10479 0))(
  ( (ValueCellFull!10479 (v!13569 V!34211)) (EmptyCell!10479) )
))
(declare-datatypes ((array!59915 0))(
  ( (array!59916 (arr!28825 (Array (_ BitVec 32) ValueCell!10479)) (size!29304 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59915)

(declare-fun mapDefault!34879 () ValueCell!10479)

(assert (=> b!968580 (= condMapEmpty!34879 (= (arr!28825 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10479)) mapDefault!34879)))))

(declare-fun b!968581 () Bool)

(declare-fun res!648398 () Bool)

(assert (=> b!968581 (=> (not res!648398) (not e!545883))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59913 (_ BitVec 32)) Bool)

(assert (=> b!968581 (= res!648398 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!34879 () Bool)

(declare-fun tp!66447 () Bool)

(declare-fun e!545884 () Bool)

(assert (=> mapNonEmpty!34879 (= mapRes!34879 (and tp!66447 e!545884))))

(declare-fun mapKey!34879 () (_ BitVec 32))

(declare-fun mapRest!34879 () (Array (_ BitVec 32) ValueCell!10479))

(declare-fun mapValue!34879 () ValueCell!10479)

(assert (=> mapNonEmpty!34879 (= (arr!28825 _values!1425) (store mapRest!34879 mapKey!34879 mapValue!34879))))

(declare-fun res!648400 () Bool)

(assert (=> start!82992 (=> (not res!648400) (not e!545883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82992 (= res!648400 (validMask!0 mask!2147))))

(assert (=> start!82992 e!545883))

(assert (=> start!82992 true))

(declare-fun array_inv!22315 (array!59915) Bool)

(assert (=> start!82992 (and (array_inv!22315 _values!1425) e!545882)))

(declare-fun array_inv!22316 (array!59913) Bool)

(assert (=> start!82992 (array_inv!22316 _keys!1717)))

(declare-fun b!968578 () Bool)

(declare-fun tp_is_empty!21921 () Bool)

(assert (=> b!968578 (= e!545885 tp_is_empty!21921)))

(declare-fun b!968582 () Bool)

(declare-fun res!648399 () Bool)

(assert (=> b!968582 (=> (not res!648399) (not e!545883))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968582 (= res!648399 (and (= (size!29304 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29303 _keys!1717) (size!29304 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968583 () Bool)

(assert (=> b!968583 (= e!545884 tp_is_empty!21921)))

(assert (= (and start!82992 res!648400) b!968582))

(assert (= (and b!968582 res!648399) b!968581))

(assert (= (and b!968581 res!648398) b!968579))

(assert (= (and b!968580 condMapEmpty!34879) mapIsEmpty!34879))

(assert (= (and b!968580 (not condMapEmpty!34879)) mapNonEmpty!34879))

(get-info :version)

(assert (= (and mapNonEmpty!34879 ((_ is ValueCellFull!10479) mapValue!34879)) b!968583))

(assert (= (and b!968580 ((_ is ValueCellFull!10479) mapDefault!34879)) b!968578))

(assert (= start!82992 b!968580))

(declare-fun m!896883 () Bool)

(assert (=> b!968581 m!896883))

(declare-fun m!896885 () Bool)

(assert (=> mapNonEmpty!34879 m!896885))

(declare-fun m!896887 () Bool)

(assert (=> start!82992 m!896887))

(declare-fun m!896889 () Bool)

(assert (=> start!82992 m!896889))

(declare-fun m!896891 () Bool)

(assert (=> start!82992 m!896891))

(check-sat (not b!968581) (not start!82992) (not mapNonEmpty!34879) tp_is_empty!21921)
(check-sat)
(get-model)

(declare-fun b!968610 () Bool)

(declare-fun e!545909 () Bool)

(declare-fun e!545908 () Bool)

(assert (=> b!968610 (= e!545909 e!545908)))

(declare-fun c!99920 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968610 (= c!99920 (validKeyInArray!0 (select (arr!28824 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!968611 () Bool)

(declare-fun e!545907 () Bool)

(declare-fun call!41732 () Bool)

(assert (=> b!968611 (= e!545907 call!41732)))

(declare-fun b!968612 () Bool)

(assert (=> b!968612 (= e!545908 call!41732)))

(declare-fun d!116241 () Bool)

(declare-fun res!648415 () Bool)

(assert (=> d!116241 (=> res!648415 e!545909)))

(assert (=> d!116241 (= res!648415 (bvsge #b00000000000000000000000000000000 (size!29303 _keys!1717)))))

(assert (=> d!116241 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!545909)))

(declare-fun b!968613 () Bool)

(assert (=> b!968613 (= e!545908 e!545907)))

(declare-fun lt!431529 () (_ BitVec 64))

(assert (=> b!968613 (= lt!431529 (select (arr!28824 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32361 0))(
  ( (Unit!32362) )
))
(declare-fun lt!431530 () Unit!32361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59913 (_ BitVec 64) (_ BitVec 32)) Unit!32361)

(assert (=> b!968613 (= lt!431530 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431529 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59913 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!968613 (arrayContainsKey!0 _keys!1717 lt!431529 #b00000000000000000000000000000000)))

(declare-fun lt!431528 () Unit!32361)

(assert (=> b!968613 (= lt!431528 lt!431530)))

(declare-fun res!648414 () Bool)

(declare-datatypes ((SeekEntryResult!9197 0))(
  ( (MissingZero!9197 (index!39159 (_ BitVec 32))) (Found!9197 (index!39160 (_ BitVec 32))) (Intermediate!9197 (undefined!10009 Bool) (index!39161 (_ BitVec 32)) (x!83617 (_ BitVec 32))) (Undefined!9197) (MissingVacant!9197 (index!39162 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59913 (_ BitVec 32)) SeekEntryResult!9197)

(assert (=> b!968613 (= res!648414 (= (seekEntryOrOpen!0 (select (arr!28824 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9197 #b00000000000000000000000000000000)))))

(assert (=> b!968613 (=> (not res!648414) (not e!545907))))

(declare-fun bm!41729 () Bool)

(assert (=> bm!41729 (= call!41732 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(assert (= (and d!116241 (not res!648415)) b!968610))

(assert (= (and b!968610 c!99920) b!968613))

(assert (= (and b!968610 (not c!99920)) b!968612))

(assert (= (and b!968613 res!648414) b!968611))

(assert (= (or b!968611 b!968612) bm!41729))

(declare-fun m!896903 () Bool)

(assert (=> b!968610 m!896903))

(assert (=> b!968610 m!896903))

(declare-fun m!896905 () Bool)

(assert (=> b!968610 m!896905))

(assert (=> b!968613 m!896903))

(declare-fun m!896907 () Bool)

(assert (=> b!968613 m!896907))

(declare-fun m!896909 () Bool)

(assert (=> b!968613 m!896909))

(assert (=> b!968613 m!896903))

(declare-fun m!896911 () Bool)

(assert (=> b!968613 m!896911))

(declare-fun m!896913 () Bool)

(assert (=> bm!41729 m!896913))

(assert (=> b!968581 d!116241))

(declare-fun d!116243 () Bool)

(assert (=> d!116243 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!82992 d!116243))

(declare-fun d!116245 () Bool)

(assert (=> d!116245 (= (array_inv!22315 _values!1425) (bvsge (size!29304 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!82992 d!116245))

(declare-fun d!116247 () Bool)

(assert (=> d!116247 (= (array_inv!22316 _keys!1717) (bvsge (size!29303 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!82992 d!116247))

(declare-fun mapNonEmpty!34885 () Bool)

(declare-fun mapRes!34885 () Bool)

(declare-fun tp!66453 () Bool)

(declare-fun e!545914 () Bool)

(assert (=> mapNonEmpty!34885 (= mapRes!34885 (and tp!66453 e!545914))))

(declare-fun mapValue!34885 () ValueCell!10479)

(declare-fun mapKey!34885 () (_ BitVec 32))

(declare-fun mapRest!34885 () (Array (_ BitVec 32) ValueCell!10479))

(assert (=> mapNonEmpty!34885 (= mapRest!34879 (store mapRest!34885 mapKey!34885 mapValue!34885))))

(declare-fun b!968620 () Bool)

(assert (=> b!968620 (= e!545914 tp_is_empty!21921)))

(declare-fun condMapEmpty!34885 () Bool)

(declare-fun mapDefault!34885 () ValueCell!10479)

(assert (=> mapNonEmpty!34879 (= condMapEmpty!34885 (= mapRest!34879 ((as const (Array (_ BitVec 32) ValueCell!10479)) mapDefault!34885)))))

(declare-fun e!545915 () Bool)

(assert (=> mapNonEmpty!34879 (= tp!66447 (and e!545915 mapRes!34885))))

(declare-fun b!968621 () Bool)

(assert (=> b!968621 (= e!545915 tp_is_empty!21921)))

(declare-fun mapIsEmpty!34885 () Bool)

(assert (=> mapIsEmpty!34885 mapRes!34885))

(assert (= (and mapNonEmpty!34879 condMapEmpty!34885) mapIsEmpty!34885))

(assert (= (and mapNonEmpty!34879 (not condMapEmpty!34885)) mapNonEmpty!34885))

(assert (= (and mapNonEmpty!34885 ((_ is ValueCellFull!10479) mapValue!34885)) b!968620))

(assert (= (and mapNonEmpty!34879 ((_ is ValueCellFull!10479) mapDefault!34885)) b!968621))

(declare-fun m!896915 () Bool)

(assert (=> mapNonEmpty!34885 m!896915))

(check-sat (not b!968613) (not mapNonEmpty!34885) (not bm!41729) (not b!968610) tp_is_empty!21921)
(check-sat)
