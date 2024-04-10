; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83216 () Bool)

(assert start!83216)

(declare-fun b_free!19209 () Bool)

(declare-fun b_next!19209 () Bool)

(assert (=> start!83216 (= b_free!19209 (not b_next!19209))))

(declare-fun tp!66905 () Bool)

(declare-fun b_and!30697 () Bool)

(assert (=> start!83216 (= tp!66905 b_and!30697)))

(declare-fun b!970939 () Bool)

(declare-fun res!649872 () Bool)

(declare-fun e!547366 () Bool)

(assert (=> b!970939 (=> (not res!649872) (not e!547366))))

(declare-datatypes ((array!60267 0))(
  ( (array!60268 (arr!28997 (Array (_ BitVec 32) (_ BitVec 64))) (size!29476 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60267)

(declare-datatypes ((List!20099 0))(
  ( (Nil!20096) (Cons!20095 (h!21257 (_ BitVec 64)) (t!28462 List!20099)) )
))
(declare-fun arrayNoDuplicates!0 (array!60267 (_ BitVec 32) List!20099) Bool)

(assert (=> b!970939 (= res!649872 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20096))))

(declare-fun b!970940 () Bool)

(declare-fun res!649868 () Bool)

(assert (=> b!970940 (=> (not res!649868) (not e!547366))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970940 (= res!649868 (validKeyInArray!0 (select (arr!28997 _keys!1717) i!822)))))

(declare-fun b!970941 () Bool)

(declare-fun res!649871 () Bool)

(assert (=> b!970941 (=> (not res!649871) (not e!547366))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34459 0))(
  ( (V!34460 (val!11104 Int)) )
))
(declare-datatypes ((ValueCell!10572 0))(
  ( (ValueCellFull!10572 (v!13663 V!34459)) (EmptyCell!10572) )
))
(declare-datatypes ((array!60269 0))(
  ( (array!60270 (arr!28998 (Array (_ BitVec 32) ValueCell!10572)) (size!29477 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60269)

(declare-fun zeroValue!1367 () V!34459)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun minValue!1367 () V!34459)

(declare-datatypes ((tuple2!14230 0))(
  ( (tuple2!14231 (_1!7126 (_ BitVec 64)) (_2!7126 V!34459)) )
))
(declare-datatypes ((List!20100 0))(
  ( (Nil!20097) (Cons!20096 (h!21258 tuple2!14230) (t!28463 List!20100)) )
))
(declare-datatypes ((ListLongMap!12927 0))(
  ( (ListLongMap!12928 (toList!6479 List!20100)) )
))
(declare-fun contains!5582 (ListLongMap!12927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3712 (array!60267 array!60269 (_ BitVec 32) (_ BitVec 32) V!34459 V!34459 (_ BitVec 32) Int) ListLongMap!12927)

(assert (=> b!970941 (= res!649871 (contains!5582 (getCurrentListMap!3712 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28997 _keys!1717) i!822)))))

(declare-fun b!970942 () Bool)

(declare-fun e!547365 () Bool)

(declare-fun tp_is_empty!22107 () Bool)

(assert (=> b!970942 (= e!547365 tp_is_empty!22107)))

(declare-fun mapIsEmpty!35170 () Bool)

(declare-fun mapRes!35170 () Bool)

(assert (=> mapIsEmpty!35170 mapRes!35170))

(declare-fun b!970943 () Bool)

(declare-fun res!649869 () Bool)

(assert (=> b!970943 (=> (not res!649869) (not e!547366))))

(assert (=> b!970943 (= res!649869 (and (= (size!29477 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29476 _keys!1717) (size!29477 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35170 () Bool)

(declare-fun tp!66906 () Bool)

(assert (=> mapNonEmpty!35170 (= mapRes!35170 (and tp!66906 e!547365))))

(declare-fun mapValue!35170 () ValueCell!10572)

(declare-fun mapKey!35170 () (_ BitVec 32))

(declare-fun mapRest!35170 () (Array (_ BitVec 32) ValueCell!10572))

(assert (=> mapNonEmpty!35170 (= (arr!28998 _values!1425) (store mapRest!35170 mapKey!35170 mapValue!35170))))

(declare-fun b!970944 () Bool)

(assert (=> b!970944 (= e!547366 false)))

(declare-fun lt!431783 () ListLongMap!12927)

(assert (=> b!970944 (= lt!431783 (getCurrentListMap!3712 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!649870 () Bool)

(assert (=> start!83216 (=> (not res!649870) (not e!547366))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83216 (= res!649870 (validMask!0 mask!2147))))

(assert (=> start!83216 e!547366))

(assert (=> start!83216 true))

(declare-fun e!547367 () Bool)

(declare-fun array_inv!22439 (array!60269) Bool)

(assert (=> start!83216 (and (array_inv!22439 _values!1425) e!547367)))

(assert (=> start!83216 tp_is_empty!22107))

(assert (=> start!83216 tp!66905))

(declare-fun array_inv!22440 (array!60267) Bool)

(assert (=> start!83216 (array_inv!22440 _keys!1717)))

(declare-fun b!970945 () Bool)

(declare-fun e!547368 () Bool)

(assert (=> b!970945 (= e!547367 (and e!547368 mapRes!35170))))

(declare-fun condMapEmpty!35170 () Bool)

(declare-fun mapDefault!35170 () ValueCell!10572)

(assert (=> b!970945 (= condMapEmpty!35170 (= (arr!28998 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10572)) mapDefault!35170)))))

(declare-fun b!970946 () Bool)

(declare-fun res!649866 () Bool)

(assert (=> b!970946 (=> (not res!649866) (not e!547366))))

(assert (=> b!970946 (= res!649866 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29476 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29476 _keys!1717))))))

(declare-fun b!970947 () Bool)

(assert (=> b!970947 (= e!547368 tp_is_empty!22107)))

(declare-fun b!970948 () Bool)

(declare-fun res!649867 () Bool)

(assert (=> b!970948 (=> (not res!649867) (not e!547366))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60267 (_ BitVec 32)) Bool)

(assert (=> b!970948 (= res!649867 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(assert (= (and start!83216 res!649870) b!970943))

(assert (= (and b!970943 res!649869) b!970948))

(assert (= (and b!970948 res!649867) b!970939))

(assert (= (and b!970939 res!649872) b!970946))

(assert (= (and b!970946 res!649866) b!970940))

(assert (= (and b!970940 res!649868) b!970941))

(assert (= (and b!970941 res!649871) b!970944))

(assert (= (and b!970945 condMapEmpty!35170) mapIsEmpty!35170))

(assert (= (and b!970945 (not condMapEmpty!35170)) mapNonEmpty!35170))

(get-info :version)

(assert (= (and mapNonEmpty!35170 ((_ is ValueCellFull!10572) mapValue!35170)) b!970942))

(assert (= (and b!970945 ((_ is ValueCellFull!10572) mapDefault!35170)) b!970947))

(assert (= start!83216 b!970945))

(declare-fun m!898529 () Bool)

(assert (=> b!970941 m!898529))

(declare-fun m!898531 () Bool)

(assert (=> b!970941 m!898531))

(assert (=> b!970941 m!898529))

(assert (=> b!970941 m!898531))

(declare-fun m!898533 () Bool)

(assert (=> b!970941 m!898533))

(declare-fun m!898535 () Bool)

(assert (=> b!970944 m!898535))

(declare-fun m!898537 () Bool)

(assert (=> mapNonEmpty!35170 m!898537))

(declare-fun m!898539 () Bool)

(assert (=> start!83216 m!898539))

(declare-fun m!898541 () Bool)

(assert (=> start!83216 m!898541))

(declare-fun m!898543 () Bool)

(assert (=> start!83216 m!898543))

(declare-fun m!898545 () Bool)

(assert (=> b!970939 m!898545))

(declare-fun m!898547 () Bool)

(assert (=> b!970948 m!898547))

(assert (=> b!970940 m!898531))

(assert (=> b!970940 m!898531))

(declare-fun m!898549 () Bool)

(assert (=> b!970940 m!898549))

(check-sat (not start!83216) (not b!970939) (not b!970944) (not b!970941) tp_is_empty!22107 (not mapNonEmpty!35170) (not b!970948) (not b_next!19209) (not b!970940) b_and!30697)
(check-sat b_and!30697 (not b_next!19209))
