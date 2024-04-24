; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83186 () Bool)

(assert start!83186)

(declare-fun b!969613 () Bool)

(declare-fun e!546571 () Bool)

(declare-fun tp_is_empty!21931 () Bool)

(assert (=> b!969613 (= e!546571 tp_is_empty!21931)))

(declare-fun mapNonEmpty!34900 () Bool)

(declare-fun mapRes!34900 () Bool)

(declare-fun tp!66469 () Bool)

(assert (=> mapNonEmpty!34900 (= mapRes!34900 (and tp!66469 e!546571))))

(declare-fun mapKey!34900 () (_ BitVec 32))

(declare-datatypes ((V!34225 0))(
  ( (V!34226 (val!11016 Int)) )
))
(declare-datatypes ((ValueCell!10484 0))(
  ( (ValueCellFull!10484 (v!13571 V!34225)) (EmptyCell!10484) )
))
(declare-datatypes ((array!59952 0))(
  ( (array!59953 (arr!28837 (Array (_ BitVec 32) ValueCell!10484)) (size!29317 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59952)

(declare-fun mapRest!34900 () (Array (_ BitVec 32) ValueCell!10484))

(declare-fun mapValue!34900 () ValueCell!10484)

(assert (=> mapNonEmpty!34900 (= (arr!28837 _values!1425) (store mapRest!34900 mapKey!34900 mapValue!34900))))

(declare-fun mapIsEmpty!34900 () Bool)

(assert (=> mapIsEmpty!34900 mapRes!34900))

(declare-fun b!969615 () Bool)

(declare-fun res!648804 () Bool)

(declare-fun e!546568 () Bool)

(assert (=> b!969615 (=> (not res!648804) (not e!546568))))

(declare-datatypes ((array!59954 0))(
  ( (array!59955 (arr!28838 (Array (_ BitVec 32) (_ BitVec 64))) (size!29318 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59954)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59954 (_ BitVec 32)) Bool)

(assert (=> b!969615 (= res!648804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969616 () Bool)

(declare-datatypes ((List!19996 0))(
  ( (Nil!19993) (Cons!19992 (h!21160 (_ BitVec 64)) (t!28351 List!19996)) )
))
(declare-fun noDuplicate!1381 (List!19996) Bool)

(assert (=> b!969616 (= e!546568 (not (noDuplicate!1381 Nil!19993)))))

(declare-fun b!969617 () Bool)

(declare-fun e!546572 () Bool)

(declare-fun e!546569 () Bool)

(assert (=> b!969617 (= e!546572 (and e!546569 mapRes!34900))))

(declare-fun condMapEmpty!34900 () Bool)

(declare-fun mapDefault!34900 () ValueCell!10484)

(assert (=> b!969617 (= condMapEmpty!34900 (= (arr!28837 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10484)) mapDefault!34900)))))

(declare-fun b!969618 () Bool)

(declare-fun res!648802 () Bool)

(assert (=> b!969618 (=> (not res!648802) (not e!546568))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969618 (= res!648802 (and (= (size!29317 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29318 _keys!1717) (size!29317 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!969619 () Bool)

(assert (=> b!969619 (= e!546569 tp_is_empty!21931)))

(declare-fun b!969614 () Bool)

(declare-fun res!648803 () Bool)

(assert (=> b!969614 (=> (not res!648803) (not e!546568))))

(assert (=> b!969614 (= res!648803 (and (bvsle #b00000000000000000000000000000000 (size!29318 _keys!1717)) (bvslt (size!29318 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun res!648801 () Bool)

(assert (=> start!83186 (=> (not res!648801) (not e!546568))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83186 (= res!648801 (validMask!0 mask!2147))))

(assert (=> start!83186 e!546568))

(assert (=> start!83186 true))

(declare-fun array_inv!22383 (array!59952) Bool)

(assert (=> start!83186 (and (array_inv!22383 _values!1425) e!546572)))

(declare-fun array_inv!22384 (array!59954) Bool)

(assert (=> start!83186 (array_inv!22384 _keys!1717)))

(assert (= (and start!83186 res!648801) b!969618))

(assert (= (and b!969618 res!648802) b!969615))

(assert (= (and b!969615 res!648804) b!969614))

(assert (= (and b!969614 res!648803) b!969616))

(assert (= (and b!969617 condMapEmpty!34900) mapIsEmpty!34900))

(assert (= (and b!969617 (not condMapEmpty!34900)) mapNonEmpty!34900))

(get-info :version)

(assert (= (and mapNonEmpty!34900 ((_ is ValueCellFull!10484) mapValue!34900)) b!969613))

(assert (= (and b!969617 ((_ is ValueCellFull!10484) mapDefault!34900)) b!969619))

(assert (= start!83186 b!969617))

(declare-fun m!898255 () Bool)

(assert (=> mapNonEmpty!34900 m!898255))

(declare-fun m!898257 () Bool)

(assert (=> b!969615 m!898257))

(declare-fun m!898259 () Bool)

(assert (=> b!969616 m!898259))

(declare-fun m!898261 () Bool)

(assert (=> start!83186 m!898261))

(declare-fun m!898263 () Bool)

(assert (=> start!83186 m!898263))

(declare-fun m!898265 () Bool)

(assert (=> start!83186 m!898265))

(check-sat (not start!83186) (not b!969616) (not mapNonEmpty!34900) tp_is_empty!21931 (not b!969615))
(check-sat)
(get-model)

(declare-fun d!116583 () Bool)

(assert (=> d!116583 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83186 d!116583))

(declare-fun d!116585 () Bool)

(assert (=> d!116585 (= (array_inv!22383 _values!1425) (bvsge (size!29317 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83186 d!116585))

(declare-fun d!116587 () Bool)

(assert (=> d!116587 (= (array_inv!22384 _keys!1717) (bvsge (size!29318 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83186 d!116587))

(declare-fun b!969670 () Bool)

(declare-fun e!546611 () Bool)

(declare-fun e!546609 () Bool)

(assert (=> b!969670 (= e!546611 e!546609)))

(declare-fun c!100208 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969670 (= c!100208 (validKeyInArray!0 (select (arr!28838 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!969671 () Bool)

(declare-fun call!41783 () Bool)

(assert (=> b!969671 (= e!546609 call!41783)))

(declare-fun b!969673 () Bool)

(declare-fun e!546610 () Bool)

(assert (=> b!969673 (= e!546609 e!546610)))

(declare-fun lt!431908 () (_ BitVec 64))

(assert (=> b!969673 (= lt!431908 (select (arr!28838 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32330 0))(
  ( (Unit!32331) )
))
(declare-fun lt!431909 () Unit!32330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59954 (_ BitVec 64) (_ BitVec 32)) Unit!32330)

(assert (=> b!969673 (= lt!431909 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431908 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!969673 (arrayContainsKey!0 _keys!1717 lt!431908 #b00000000000000000000000000000000)))

(declare-fun lt!431907 () Unit!32330)

(assert (=> b!969673 (= lt!431907 lt!431909)))

(declare-fun res!648834 () Bool)

(declare-datatypes ((SeekEntryResult!9154 0))(
  ( (MissingZero!9154 (index!38987 (_ BitVec 32))) (Found!9154 (index!38988 (_ BitVec 32))) (Intermediate!9154 (undefined!9966 Bool) (index!38989 (_ BitVec 32)) (x!83608 (_ BitVec 32))) (Undefined!9154) (MissingVacant!9154 (index!38990 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59954 (_ BitVec 32)) SeekEntryResult!9154)

(assert (=> b!969673 (= res!648834 (= (seekEntryOrOpen!0 (select (arr!28838 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9154 #b00000000000000000000000000000000)))))

(assert (=> b!969673 (=> (not res!648834) (not e!546610))))

(declare-fun bm!41780 () Bool)

(assert (=> bm!41780 (= call!41783 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun d!116589 () Bool)

(declare-fun res!648833 () Bool)

(assert (=> d!116589 (=> res!648833 e!546611)))

(assert (=> d!116589 (= res!648833 (bvsge #b00000000000000000000000000000000 (size!29318 _keys!1717)))))

(assert (=> d!116589 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!546611)))

(declare-fun b!969672 () Bool)

(assert (=> b!969672 (= e!546610 call!41783)))

(assert (= (and d!116589 (not res!648833)) b!969670))

(assert (= (and b!969670 c!100208) b!969673))

(assert (= (and b!969670 (not c!100208)) b!969671))

(assert (= (and b!969673 res!648834) b!969672))

(assert (= (or b!969672 b!969671) bm!41780))

(declare-fun m!898291 () Bool)

(assert (=> b!969670 m!898291))

(assert (=> b!969670 m!898291))

(declare-fun m!898293 () Bool)

(assert (=> b!969670 m!898293))

(assert (=> b!969673 m!898291))

(declare-fun m!898295 () Bool)

(assert (=> b!969673 m!898295))

(declare-fun m!898297 () Bool)

(assert (=> b!969673 m!898297))

(assert (=> b!969673 m!898291))

(declare-fun m!898299 () Bool)

(assert (=> b!969673 m!898299))

(declare-fun m!898301 () Bool)

(assert (=> bm!41780 m!898301))

(assert (=> b!969615 d!116589))

(declare-fun d!116591 () Bool)

(declare-fun res!648839 () Bool)

(declare-fun e!546616 () Bool)

(assert (=> d!116591 (=> res!648839 e!546616)))

(assert (=> d!116591 (= res!648839 ((_ is Nil!19993) Nil!19993))))

(assert (=> d!116591 (= (noDuplicate!1381 Nil!19993) e!546616)))

(declare-fun b!969678 () Bool)

(declare-fun e!546617 () Bool)

(assert (=> b!969678 (= e!546616 e!546617)))

(declare-fun res!648840 () Bool)

(assert (=> b!969678 (=> (not res!648840) (not e!546617))))

(declare-fun contains!5554 (List!19996 (_ BitVec 64)) Bool)

(assert (=> b!969678 (= res!648840 (not (contains!5554 (t!28351 Nil!19993) (h!21160 Nil!19993))))))

(declare-fun b!969679 () Bool)

(assert (=> b!969679 (= e!546617 (noDuplicate!1381 (t!28351 Nil!19993)))))

(assert (= (and d!116591 (not res!648839)) b!969678))

(assert (= (and b!969678 res!648840) b!969679))

(declare-fun m!898303 () Bool)

(assert (=> b!969678 m!898303))

(declare-fun m!898305 () Bool)

(assert (=> b!969679 m!898305))

(assert (=> b!969616 d!116591))

(declare-fun condMapEmpty!34909 () Bool)

(declare-fun mapDefault!34909 () ValueCell!10484)

(assert (=> mapNonEmpty!34900 (= condMapEmpty!34909 (= mapRest!34900 ((as const (Array (_ BitVec 32) ValueCell!10484)) mapDefault!34909)))))

(declare-fun e!546622 () Bool)

(declare-fun mapRes!34909 () Bool)

(assert (=> mapNonEmpty!34900 (= tp!66469 (and e!546622 mapRes!34909))))

(declare-fun mapNonEmpty!34909 () Bool)

(declare-fun tp!66478 () Bool)

(declare-fun e!546623 () Bool)

(assert (=> mapNonEmpty!34909 (= mapRes!34909 (and tp!66478 e!546623))))

(declare-fun mapValue!34909 () ValueCell!10484)

(declare-fun mapRest!34909 () (Array (_ BitVec 32) ValueCell!10484))

(declare-fun mapKey!34909 () (_ BitVec 32))

(assert (=> mapNonEmpty!34909 (= mapRest!34900 (store mapRest!34909 mapKey!34909 mapValue!34909))))

(declare-fun b!969687 () Bool)

(assert (=> b!969687 (= e!546622 tp_is_empty!21931)))

(declare-fun mapIsEmpty!34909 () Bool)

(assert (=> mapIsEmpty!34909 mapRes!34909))

(declare-fun b!969686 () Bool)

(assert (=> b!969686 (= e!546623 tp_is_empty!21931)))

(assert (= (and mapNonEmpty!34900 condMapEmpty!34909) mapIsEmpty!34909))

(assert (= (and mapNonEmpty!34900 (not condMapEmpty!34909)) mapNonEmpty!34909))

(assert (= (and mapNonEmpty!34909 ((_ is ValueCellFull!10484) mapValue!34909)) b!969686))

(assert (= (and mapNonEmpty!34900 ((_ is ValueCellFull!10484) mapDefault!34909)) b!969687))

(declare-fun m!898307 () Bool)

(assert (=> mapNonEmpty!34909 m!898307))

(check-sat (not b!969670) (not mapNonEmpty!34909) (not b!969673) (not bm!41780) tp_is_empty!21931 (not b!969678) (not b!969679))
(check-sat)
