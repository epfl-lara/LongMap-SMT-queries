; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83046 () Bool)

(assert start!83046)

(declare-fun res!648521 () Bool)

(declare-fun e!546079 () Bool)

(assert (=> start!83046 (=> (not res!648521) (not e!546079))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83046 (= res!648521 (validMask!0 mask!2147))))

(assert (=> start!83046 e!546079))

(assert (=> start!83046 true))

(declare-datatypes ((V!34257 0))(
  ( (V!34258 (val!11028 Int)) )
))
(declare-datatypes ((ValueCell!10496 0))(
  ( (ValueCellFull!10496 (v!13586 V!34257)) (EmptyCell!10496) )
))
(declare-datatypes ((array!59914 0))(
  ( (array!59915 (arr!28821 (Array (_ BitVec 32) ValueCell!10496)) (size!29302 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59914)

(declare-fun e!546078 () Bool)

(declare-fun array_inv!22377 (array!59914) Bool)

(assert (=> start!83046 (and (array_inv!22377 _values!1425) e!546078)))

(declare-datatypes ((array!59916 0))(
  ( (array!59917 (arr!28822 (Array (_ BitVec 32) (_ BitVec 64))) (size!29303 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59916)

(declare-fun array_inv!22378 (array!59916) Bool)

(assert (=> start!83046 (array_inv!22378 _keys!1717)))

(declare-fun b!968781 () Bool)

(declare-fun e!546081 () Bool)

(declare-fun tp_is_empty!21955 () Bool)

(assert (=> b!968781 (= e!546081 tp_is_empty!21955)))

(declare-fun b!968782 () Bool)

(declare-fun res!648523 () Bool)

(assert (=> b!968782 (=> (not res!648523) (not e!546079))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968782 (= res!648523 (and (= (size!29302 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29303 _keys!1717) (size!29302 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!34942 () Bool)

(declare-fun mapRes!34942 () Bool)

(assert (=> mapIsEmpty!34942 mapRes!34942))

(declare-fun b!968783 () Bool)

(declare-fun res!648522 () Bool)

(assert (=> b!968783 (=> (not res!648522) (not e!546079))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59916 (_ BitVec 32)) Bool)

(assert (=> b!968783 (= res!648522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968784 () Bool)

(declare-fun e!546080 () Bool)

(assert (=> b!968784 (= e!546078 (and e!546080 mapRes!34942))))

(declare-fun condMapEmpty!34942 () Bool)

(declare-fun mapDefault!34942 () ValueCell!10496)

(assert (=> b!968784 (= condMapEmpty!34942 (= (arr!28821 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10496)) mapDefault!34942)))))

(declare-fun mapNonEmpty!34942 () Bool)

(declare-fun tp!66511 () Bool)

(assert (=> mapNonEmpty!34942 (= mapRes!34942 (and tp!66511 e!546081))))

(declare-fun mapRest!34942 () (Array (_ BitVec 32) ValueCell!10496))

(declare-fun mapValue!34942 () ValueCell!10496)

(declare-fun mapKey!34942 () (_ BitVec 32))

(assert (=> mapNonEmpty!34942 (= (arr!28821 _values!1425) (store mapRest!34942 mapKey!34942 mapValue!34942))))

(declare-fun b!968785 () Bool)

(assert (=> b!968785 (= e!546080 tp_is_empty!21955)))

(declare-fun b!968786 () Bool)

(assert (=> b!968786 (= e!546079 false)))

(declare-fun lt!431346 () Bool)

(declare-datatypes ((List!20045 0))(
  ( (Nil!20042) (Cons!20041 (h!21203 (_ BitVec 64)) (t!28399 List!20045)) )
))
(declare-fun arrayNoDuplicates!0 (array!59916 (_ BitVec 32) List!20045) Bool)

(assert (=> b!968786 (= lt!431346 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20042))))

(assert (= (and start!83046 res!648521) b!968782))

(assert (= (and b!968782 res!648523) b!968783))

(assert (= (and b!968783 res!648522) b!968786))

(assert (= (and b!968784 condMapEmpty!34942) mapIsEmpty!34942))

(assert (= (and b!968784 (not condMapEmpty!34942)) mapNonEmpty!34942))

(get-info :version)

(assert (= (and mapNonEmpty!34942 ((_ is ValueCellFull!10496) mapValue!34942)) b!968781))

(assert (= (and b!968784 ((_ is ValueCellFull!10496) mapDefault!34942)) b!968785))

(assert (= start!83046 b!968784))

(declare-fun m!896405 () Bool)

(assert (=> start!83046 m!896405))

(declare-fun m!896407 () Bool)

(assert (=> start!83046 m!896407))

(declare-fun m!896409 () Bool)

(assert (=> start!83046 m!896409))

(declare-fun m!896411 () Bool)

(assert (=> b!968783 m!896411))

(declare-fun m!896413 () Bool)

(assert (=> mapNonEmpty!34942 m!896413))

(declare-fun m!896415 () Bool)

(assert (=> b!968786 m!896415))

(check-sat (not mapNonEmpty!34942) (not b!968786) (not start!83046) tp_is_empty!21955 (not b!968783))
(check-sat)
