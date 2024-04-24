; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83250 () Bool)

(assert start!83250)

(declare-fun b!970085 () Bool)

(declare-fun res!649057 () Bool)

(declare-fun e!546942 () Bool)

(assert (=> b!970085 (=> (not res!649057) (not e!546942))))

(declare-datatypes ((array!60028 0))(
  ( (array!60029 (arr!28873 (Array (_ BitVec 32) (_ BitVec 64))) (size!29353 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60028)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60028 (_ BitVec 32)) Bool)

(assert (=> b!970085 (= res!649057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!34969 () Bool)

(declare-fun mapRes!34969 () Bool)

(assert (=> mapIsEmpty!34969 mapRes!34969))

(declare-fun b!970086 () Bool)

(assert (=> b!970086 (= e!546942 false)))

(declare-fun lt!431970 () Bool)

(declare-datatypes ((List!20009 0))(
  ( (Nil!20006) (Cons!20005 (h!21173 (_ BitVec 64)) (t!28364 List!20009)) )
))
(declare-fun arrayNoDuplicates!0 (array!60028 (_ BitVec 32) List!20009) Bool)

(assert (=> b!970086 (= lt!431970 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20006))))

(declare-fun res!649058 () Bool)

(assert (=> start!83250 (=> (not res!649058) (not e!546942))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83250 (= res!649058 (validMask!0 mask!2147))))

(assert (=> start!83250 e!546942))

(assert (=> start!83250 true))

(declare-datatypes ((V!34281 0))(
  ( (V!34282 (val!11037 Int)) )
))
(declare-datatypes ((ValueCell!10505 0))(
  ( (ValueCellFull!10505 (v!13593 V!34281)) (EmptyCell!10505) )
))
(declare-datatypes ((array!60030 0))(
  ( (array!60031 (arr!28874 (Array (_ BitVec 32) ValueCell!10505)) (size!29354 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60030)

(declare-fun e!546946 () Bool)

(declare-fun array_inv!22405 (array!60030) Bool)

(assert (=> start!83250 (and (array_inv!22405 _values!1425) e!546946)))

(declare-fun array_inv!22406 (array!60028) Bool)

(assert (=> start!83250 (array_inv!22406 _keys!1717)))

(declare-fun mapNonEmpty!34969 () Bool)

(declare-fun tp!66538 () Bool)

(declare-fun e!546945 () Bool)

(assert (=> mapNonEmpty!34969 (= mapRes!34969 (and tp!66538 e!546945))))

(declare-fun mapKey!34969 () (_ BitVec 32))

(declare-fun mapValue!34969 () ValueCell!10505)

(declare-fun mapRest!34969 () (Array (_ BitVec 32) ValueCell!10505))

(assert (=> mapNonEmpty!34969 (= (arr!28874 _values!1425) (store mapRest!34969 mapKey!34969 mapValue!34969))))

(declare-fun b!970087 () Bool)

(declare-fun e!546944 () Bool)

(declare-fun tp_is_empty!21973 () Bool)

(assert (=> b!970087 (= e!546944 tp_is_empty!21973)))

(declare-fun b!970088 () Bool)

(declare-fun res!649056 () Bool)

(assert (=> b!970088 (=> (not res!649056) (not e!546942))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970088 (= res!649056 (and (= (size!29354 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29353 _keys!1717) (size!29354 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970089 () Bool)

(assert (=> b!970089 (= e!546945 tp_is_empty!21973)))

(declare-fun b!970090 () Bool)

(assert (=> b!970090 (= e!546946 (and e!546944 mapRes!34969))))

(declare-fun condMapEmpty!34969 () Bool)

(declare-fun mapDefault!34969 () ValueCell!10505)

(assert (=> b!970090 (= condMapEmpty!34969 (= (arr!28874 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10505)) mapDefault!34969)))))

(assert (= (and start!83250 res!649058) b!970088))

(assert (= (and b!970088 res!649056) b!970085))

(assert (= (and b!970085 res!649057) b!970086))

(assert (= (and b!970090 condMapEmpty!34969) mapIsEmpty!34969))

(assert (= (and b!970090 (not condMapEmpty!34969)) mapNonEmpty!34969))

(get-info :version)

(assert (= (and mapNonEmpty!34969 ((_ is ValueCellFull!10505) mapValue!34969)) b!970089))

(assert (= (and b!970090 ((_ is ValueCellFull!10505) mapDefault!34969)) b!970087))

(assert (= start!83250 b!970090))

(declare-fun m!898565 () Bool)

(assert (=> b!970085 m!898565))

(declare-fun m!898567 () Bool)

(assert (=> b!970086 m!898567))

(declare-fun m!898569 () Bool)

(assert (=> start!83250 m!898569))

(declare-fun m!898571 () Bool)

(assert (=> start!83250 m!898571))

(declare-fun m!898573 () Bool)

(assert (=> start!83250 m!898573))

(declare-fun m!898575 () Bool)

(assert (=> mapNonEmpty!34969 m!898575))

(check-sat (not b!970086) (not b!970085) (not mapNonEmpty!34969) (not start!83250) tp_is_empty!21973)
(check-sat)
