; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83064 () Bool)

(assert start!83064)

(declare-fun b!968943 () Bool)

(declare-fun e!546215 () Bool)

(declare-fun e!546216 () Bool)

(declare-fun mapRes!34969 () Bool)

(assert (=> b!968943 (= e!546215 (and e!546216 mapRes!34969))))

(declare-fun condMapEmpty!34969 () Bool)

(declare-datatypes ((V!34281 0))(
  ( (V!34282 (val!11037 Int)) )
))
(declare-datatypes ((ValueCell!10505 0))(
  ( (ValueCellFull!10505 (v!13595 V!34281)) (EmptyCell!10505) )
))
(declare-datatypes ((array!59948 0))(
  ( (array!59949 (arr!28838 (Array (_ BitVec 32) ValueCell!10505)) (size!29319 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59948)

(declare-fun mapDefault!34969 () ValueCell!10505)

(assert (=> b!968943 (= condMapEmpty!34969 (= (arr!28838 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10505)) mapDefault!34969)))))

(declare-fun mapNonEmpty!34969 () Bool)

(declare-fun tp!66538 () Bool)

(declare-fun e!546214 () Bool)

(assert (=> mapNonEmpty!34969 (= mapRes!34969 (and tp!66538 e!546214))))

(declare-fun mapRest!34969 () (Array (_ BitVec 32) ValueCell!10505))

(declare-fun mapKey!34969 () (_ BitVec 32))

(declare-fun mapValue!34969 () ValueCell!10505)

(assert (=> mapNonEmpty!34969 (= (arr!28838 _values!1425) (store mapRest!34969 mapKey!34969 mapValue!34969))))

(declare-fun b!968944 () Bool)

(declare-fun tp_is_empty!21973 () Bool)

(assert (=> b!968944 (= e!546216 tp_is_empty!21973)))

(declare-fun res!648603 () Bool)

(declare-fun e!546213 () Bool)

(assert (=> start!83064 (=> (not res!648603) (not e!546213))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83064 (= res!648603 (validMask!0 mask!2147))))

(assert (=> start!83064 e!546213))

(assert (=> start!83064 true))

(declare-fun array_inv!22391 (array!59948) Bool)

(assert (=> start!83064 (and (array_inv!22391 _values!1425) e!546215)))

(declare-datatypes ((array!59950 0))(
  ( (array!59951 (arr!28839 (Array (_ BitVec 32) (_ BitVec 64))) (size!29320 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59950)

(declare-fun array_inv!22392 (array!59950) Bool)

(assert (=> start!83064 (array_inv!22392 _keys!1717)))

(declare-fun b!968945 () Bool)

(declare-fun res!648604 () Bool)

(assert (=> b!968945 (=> (not res!648604) (not e!546213))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59950 (_ BitVec 32)) Bool)

(assert (=> b!968945 (= res!648604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968946 () Bool)

(assert (=> b!968946 (= e!546213 false)))

(declare-fun lt!431373 () Bool)

(declare-datatypes ((List!20050 0))(
  ( (Nil!20047) (Cons!20046 (h!21208 (_ BitVec 64)) (t!28404 List!20050)) )
))
(declare-fun arrayNoDuplicates!0 (array!59950 (_ BitVec 32) List!20050) Bool)

(assert (=> b!968946 (= lt!431373 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20047))))

(declare-fun b!968947 () Bool)

(assert (=> b!968947 (= e!546214 tp_is_empty!21973)))

(declare-fun mapIsEmpty!34969 () Bool)

(assert (=> mapIsEmpty!34969 mapRes!34969))

(declare-fun b!968948 () Bool)

(declare-fun res!648602 () Bool)

(assert (=> b!968948 (=> (not res!648602) (not e!546213))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968948 (= res!648602 (and (= (size!29319 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29320 _keys!1717) (size!29319 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83064 res!648603) b!968948))

(assert (= (and b!968948 res!648602) b!968945))

(assert (= (and b!968945 res!648604) b!968946))

(assert (= (and b!968943 condMapEmpty!34969) mapIsEmpty!34969))

(assert (= (and b!968943 (not condMapEmpty!34969)) mapNonEmpty!34969))

(get-info :version)

(assert (= (and mapNonEmpty!34969 ((_ is ValueCellFull!10505) mapValue!34969)) b!968947))

(assert (= (and b!968943 ((_ is ValueCellFull!10505) mapDefault!34969)) b!968944))

(assert (= start!83064 b!968943))

(declare-fun m!896513 () Bool)

(assert (=> mapNonEmpty!34969 m!896513))

(declare-fun m!896515 () Bool)

(assert (=> start!83064 m!896515))

(declare-fun m!896517 () Bool)

(assert (=> start!83064 m!896517))

(declare-fun m!896519 () Bool)

(assert (=> start!83064 m!896519))

(declare-fun m!896521 () Bool)

(assert (=> b!968945 m!896521))

(declare-fun m!896523 () Bool)

(assert (=> b!968946 m!896523))

(check-sat (not mapNonEmpty!34969) (not b!968946) (not start!83064) (not b!968945) tp_is_empty!21973)
(check-sat)
